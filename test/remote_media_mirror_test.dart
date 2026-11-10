import 'dart:typed_data';

import 'package:absorb/services/remote_link/protocol.dart';
import 'package:absorb/services/remote_link/remote_link_types.dart';
import 'package:absorb/services/remote_link/remote_media_mirror.dart';
import 'package:audio_service/audio_service.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/remote_link_fakes.dart';

/// Phone remote, stage 2: the phone's media notification / lock screen /
/// headset buttons mirror the PC while the remote is connected and the
/// phone itself isn't playing.
void main() {
  late FakeClient client;
  late FakeMediaSession session;
  late DateTime now;
  late bool foreground;

  RemoteMediaMirror mirror({bool enabled = true}) => RemoteMediaMirror(
    client: client,
    session: session,
    enabled: enabled,
    isForeground: () => foreground,
    now: () => now,
  );

  setUp(() {
    client = FakeClient(state: fakePlaying);
    session = FakeMediaSession();
    now = DateTime(2026, 11, 3, 12);
    foreground = true;
  });

  test('connected: shows the PC on the media session', () {
    final m = mirror();
    expect(m.showing, isTrue);
    expect(session.lent, isTrue);
    final item = session.lastItem!;
    expect(item.title, 'The Book');
    expect(item.artist, 'Chapter 2');
    expect(item.album, 'Writer');
    // Chapter progress: 100..400 s, at 150 s.
    expect(item.duration, const Duration(seconds: 300));
    final state = session.lastState!;
    expect(state.playing, isTrue);
    expect(state.updatePosition, const Duration(seconds: 50));
    expect(state.speed, 1.25);
    expect(state.processingState, AudioProcessingState.ready);
    expect(state.controls.map((c) => c.action), [
      MediaAction.rewind,
      MediaAction.pause,
      MediaAction.fastForward,
      MediaAction.custom,
      MediaAction.custom,
    ]);
    expect(state.controls.first.label, 'Back 15s');
    expect(state.systemActions, contains(MediaAction.seek));
    m.dispose();
  });

  test('nothing is mirrored while disconnected or with nothing loaded', () {
    client = FakeClient(phase: RemoteLinkPhase.connecting);
    final m = mirror();
    expect(session.lent, isFalse);
    client.update((c) {
      c.phase = RemoteLinkPhase.connected;
      c.state = RemotePlayerState.empty;
    });
    expect(session.lent, isFalse);
    client.update((c) => c.state = fakePlaying);
    expect(session.lent, isTrue);
    m.dispose();
  });

  test('a paused PC still gets a notification (playing blip first)', () {
    client = FakeClient(
      state: const RemotePlayerState(
        itemId: 'li_1',
        title: 'The Book',
        duration: 3600,
        position: 10,
      ),
    );
    final m = mirror();
    expect(session.shown, hasLength(2));
    expect(session.shown[0].$2.playing, isTrue);
    expect(session.shown[1].$2.playing, isFalse);
    // No chapters: the whole book, and no chapter buttons.
    expect(session.lastItem!.duration, const Duration(hours: 1));
    expect(session.lastState!.controls, hasLength(3));
    m.dispose();
  });

  test('only starts while the app is in front', () {
    foreground = false;
    final m = mirror();
    expect(session.lent, isFalse);
    foreground = true;
    m.resume();
    expect(session.lent, isTrue);
    m.dispose();
  });

  test('positions moving as expected are not pushed again; jumps are', () {
    final m = mirror();
    final pushes = session.shown.length;
    now = now.add(const Duration(seconds: 2));
    client.update(
      (c) => c.state = fakePlaying.copyWithForTest(position: 152.5),
    );
    expect(session.shown.length, pushes);
    now = now.add(const Duration(seconds: 1));
    client.update((c) => c.state = fakePlaying.copyWithForTest(position: 30));
    expect(session.shown.length, pushes + 1);
    client.update(
      (c) =>
          c.state = fakePlaying.copyWithForTest(position: 30, playing: false),
    );
    expect(session.shown.length, pushes + 2);
    expect(session.lastState!.playing, isFalse);
    m.dispose();
  });

  test('the cover goes to the notification as a file', () async {
    final m = mirror();
    client.update((c) => c.cover = Uint8List.fromList([1, 2, 3]));
    await Future<void>.delayed(Duration.zero);
    expect(session.coverKeys, ['li_1-1']);
    expect(session.lastItem!.artUri.toString(), contains('li_1-1'));
    m.dispose();
  });

  test('commands from the lock screen and earbuds go to the PC', () async {
    final m = mirror();
    final g = session.guest!;
    await g.play();
    await g.pause();
    await g.click(MediaButton.media);
    await g.click(MediaButton.next);
    await g.rewind();
    await g.seek(const Duration(seconds: 20));
    await g.customAction('nextChapter');
    await g.customAction('previousChapter');
    await g.stop();
    expect(client.sent.map((c) => c.encode()), [
      const PlayCommand().encode(),
      const PauseCommand().encode(),
      const ToggleCommand().encode(),
      const SkipCommand(30).encode(),
      const SkipCommand(-15).encode(),
      // The bar shows the chapter: 20 s into chapter 2 (starts at 100 s).
      const SeekCommand(120).encode(),
      const ChapterCommand(1).encode(),
      const ChapterCommand(-1).encode(),
      // The system's stop only pauses the PC.
      const PauseCommand().encode(),
    ]);
    m.dispose();
  });

  test('a short drop keeps the controls; a long one removes them', () {
    fakeAsync((async) {
      final m = mirror();
      client.update((c) {
        c.phase = RemoteLinkPhase.reconnecting;
        c.state = null;
      });
      async.elapse(const Duration(seconds: 10));
      expect(session.lent, isTrue);
      client.update((c) {
        c.phase = RemoteLinkPhase.connected;
        c.state = fakePlaying;
      });
      async.elapse(const Duration(seconds: 30));
      expect(session.lent, isTrue);
      expect(session.giveBacks, 0);

      client.update((c) {
        c.phase = RemoteLinkPhase.reconnecting;
        c.state = null;
      });
      async.elapse(const Duration(seconds: 16));
      expect(session.lent, isFalse);
      expect(session.giveBacks, 1);
      m.dispose();
    });
  });

  test('leaving the remote removes the controls at once', () {
    final m = mirror();
    expect(session.lent, isTrue);
    m.dispose();
    expect(session.lent, isFalse);
    expect(session.giveBacks, 1);
    // Nothing more after dispose.
    client.update((c) => c.state = fakePlaying.copyWithForTest(position: 9));
    expect(session.lent, isFalse);
  });

  test('playing a book on the phone takes the session back', () {
    final m = mirror();
    session.startLocalPlayback();
    expect(m.showing, isFalse);
    // Later states don't take it again, even once the phone pauses.
    session.localPlaying = false;
    client.update((c) => c.state = fakePlaying.copyWithForTest(position: 9));
    expect(session.lent, isFalse);
    expect(session.lends, 1);
    // Back on the remote screen: the PC may show again.
    m.resume();
    expect(session.lent, isTrue);
    m.dispose();
  });

  test('lending is refused while the phone plays', () {
    session.localPlaying = true;
    final m = mirror();
    expect(m.showing, isFalse);
    expect(session.shown, isEmpty);
    m.dispose();
  });

  test('the setting turns it off and on', () {
    final m = mirror(enabled: false);
    expect(session.lent, isFalse);
    m.enabled = true;
    expect(session.lent, isTrue);
    m.enabled = false;
    expect(session.lent, isFalse);
    expect(session.giveBacks, 1);
    m.dispose();
  });

  test('remoteMediaView: whole book when there are no chapters', () {
    const s = RemotePlayerState(
      itemId: 'x',
      title: 'T',
      author: 'A',
      position: 90,
      duration: 600,
      buffering: true,
    );
    final view = remoteMediaView(s);
    expect(view.item.artist, 'A');
    expect(view.item.duration, const Duration(minutes: 10));
    expect(view.state.updatePosition, const Duration(seconds: 90));
    expect(view.state.processingState, AudioProcessingState.buffering);
    expect(view.state.controls[1].action, MediaAction.play);
    expect(view.state.controls.first.label, 'Back 10s');
  });
}

extension on RemotePlayerState {
  RemotePlayerState copyWithForTest({double? position, bool? playing}) =>
      RemotePlayerState(
        itemId: itemId,
        title: title,
        author: author,
        chapterTitle: chapterTitle,
        position: position ?? this.position,
        duration: duration,
        chapterStart: chapterStart,
        chapterEnd: chapterEnd,
        playing: playing ?? this.playing,
        buffering: buffering,
        speed: speed,
        sleep: sleep,
        coverVersion: coverVersion,
        skipBack: skipBack,
        skipForward: skipForward,
        volume: volume,
        muted: muted,
      );
}
