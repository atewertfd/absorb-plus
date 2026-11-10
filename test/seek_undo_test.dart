import 'package:absorb/services/seek_undo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakePlayer implements SeekUndoPlayer {
  @override
  String? loadedKey = 'book-1';
  final seeks = <Duration>[];
  SeekUndo? undo;

  @override
  Future<void> seekTo(Duration position) async {
    seeks.add(position);
    // The real seekTo reports back into SeekUndo; the undo seek must not
    // offer another undo.
    undo?.onSeek(key: loadedKey, from: const Duration(hours: 2), to: position);
  }
}

void main() {
  late _FakePlayer player;
  late DateTime now;
  late List<String> shown;
  late List<VoidCallback> actions;
  late SeekUndo undo;

  setUp(() {
    player = _FakePlayer();
    now = DateTime(2026, 11, 1, 12);
    shown = [];
    actions = [];
    undo = SeekUndo(
      player: player,
      clock: () => now,
      present: (time, action) {
        shown.add(time);
        actions.add(action);
      },
    );
    player.undo = undo;
  });

  test('a jump over a minute offers to go back to where it started', () async {
    undo.onSeek(
        key: 'book-1',
        from: const Duration(hours: 1, minutes: 23, seconds: 45),
        to: const Duration(hours: 3));
    expect(shown, ['1:23:45']);
    actions.single();
    await Future<void>.delayed(Duration.zero);
    expect(player.seeks, [const Duration(hours: 1, minutes: 23, seconds: 45)]);
    // The undo seek itself does not offer another undo.
    expect(shown, hasLength(1));
  });

  test('backward jumps count too', () {
    undo.onSeek(key: 'book-1', from: const Duration(minutes: 30), to: const Duration(minutes: 5));
    expect(shown, ['30:00']);
  });

  test('short seeks do not offer an undo', () {
    undo.onSeek(key: 'book-1', from: const Duration(minutes: 10), to: const Duration(minutes: 11));
    undo.onSeek(key: 'book-1', from: const Duration(minutes: 10), to: const Duration(minutes: 9, seconds: 30));
    expect(shown, isEmpty);
    expect(undo.pendingFrom, isNull);
  });

  test('nothing loaded means no offer', () {
    undo.onSeek(key: null, from: Duration.zero, to: const Duration(hours: 1));
    expect(shown, isEmpty);
  });

  test('an expired offer does not move playback', () async {
    undo.onSeek(key: 'book-1', from: Duration.zero, to: const Duration(hours: 1));
    now = now.add(const Duration(seconds: 30));
    expect(await undo.undo(), isFalse);
    expect(player.seeks, isEmpty);
  });

  test('another book loaded since the jump is left alone', () async {
    undo.onSeek(key: 'book-1', from: Duration.zero, to: const Duration(hours: 1));
    player.loadedKey = 'book-2';
    expect(await undo.undo(), isFalse);
    expect(player.seeks, isEmpty);
  });

  test('undo only works once', () async {
    undo.onSeek(key: 'book-1', from: const Duration(minutes: 2), to: const Duration(hours: 1));
    expect(await undo.undo(), isTrue);
    expect(await undo.undo(), isFalse);
    expect(player.seeks, hasLength(1));
  });

  test('a newer long jump replaces the offer', () async {
    undo.onSeek(key: 'book-1', from: const Duration(minutes: 2), to: const Duration(hours: 1));
    undo.onSeek(key: 'book-1', from: const Duration(hours: 1), to: const Duration(hours: 4));
    expect(await undo.undo(), isTrue);
    expect(player.seeks, [const Duration(hours: 1)]);
  });

  test('time format', () {
    expect(formatSeekUndoTime(const Duration(seconds: 5)), '0:05');
    expect(formatSeekUndoTime(const Duration(hours: 10, minutes: 2, seconds: 3)), '10:02:03');
    expect(formatSeekUndoTime(const Duration(seconds: -3)), '0:00');
  });
}
