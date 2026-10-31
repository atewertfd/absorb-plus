import 'package:absorb/services/windows_media_cover.dart';
import 'package:audio_service_platform_interface/audio_service_platform_interface.dart';
import 'package:audio_service_win/audio_service_win.dart';
import 'package:audio_service_win/smtc_timeline.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

final _t0 = DateTime(2026, 10, 30, 12);

PlaybackStateMessage _state({
  required Duration position,
  required DateTime at,
  bool playing = true,
  double speed = 1.0,
  AudioProcessingStateMessage processing = AudioProcessingStateMessage.ready,
  bool seekable = true,
}) => PlaybackStateMessage(
  processingState: processing,
  playing: playing,
  controls: const [],
  systemActions: {if (seekable) MediaActionMessage.seek},
  updatePosition: position,
  speed: speed,
  updateTime: at,
);

MediaItemMessage _item(String id, Duration duration) =>
    MediaItemMessage(id: id, title: 'Book', duration: duration);

class _FakeCallbacks implements AudioHandlerCallbacks {
  final seeks = <Duration>[];

  @override
  Future<void> seek(SeekRequest request) async => seeks.add(request.position);

  @override
  dynamic noSuchMethod(Invocation invocation) => Future<void>.value();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SmtcTimeline throttling', () {
    late DateTime now;
    late SmtcTimeline timeline;

    setUp(() {
      now = _t0;
      timeline = SmtcTimeline(clock: () => now);
      timeline.onMediaItem(_item('book', const Duration(hours: 10)));
    });

    test(
      'sends the first state with the media session position and length',
      () {
        final update = timeline.onState(
          _state(position: const Duration(minutes: 42), at: now),
        );
        expect(update, isNotNull);
        expect(update!.position, const Duration(minutes: 42));
        expect(update.duration, const Duration(hours: 10));
        expect(update.rate, 1.0);
        expect(update.seekable, isTrue);
      },
    );

    test(
      'skips frequent position ticks while playing, then sends every ~5 s',
      () {
        timeline.onState(_state(position: Duration.zero, at: now));
        var sent = 0;
        // Ten minutes of playback states every 200 ms, all on schedule.
        for (var ms = 200; ms <= 600000; ms += 200) {
          now = _t0.add(Duration(milliseconds: ms));
          final update = timeline.onState(
            _state(
              position: Duration(milliseconds: ms),
              at: now,
            ),
          );
          if (update != null) sent++;
        }
        // At most one update per 4.5 s: ~133 instead of 3000.
        expect(sent, lessThanOrEqualTo(600000 ~/ 4500));
        expect(sent, greaterThan(100));
      },
    );

    test('keeps the app\'s 5 s cadence instead of halving it', () {
      timeline.onState(_state(position: Duration.zero, at: now));
      var sent = 0;
      for (var s = 5; s <= 60; s += 5) {
        now = _t0.add(Duration(seconds: s));
        if (timeline.onState(
              _state(
                position: Duration(seconds: s),
                at: now,
              ),
            ) !=
            null) {
          sent++;
        }
      }
      expect(sent, 12);
    });

    test('sends nothing while paused and nothing changes', () {
      timeline.onState(
        _state(position: const Duration(minutes: 1), at: now, playing: false),
      );
      now = now.add(const Duration(minutes: 5));
      expect(
        timeline.onState(
          _state(position: const Duration(minutes: 1), at: now, playing: false),
        ),
        isNull,
      );
    });

    test('sends at once on pause, play, a seek and a speed change', () {
      timeline.onState(_state(position: const Duration(minutes: 1), at: now));

      now = now.add(const Duration(seconds: 1));
      final paused = timeline.onState(
        _state(
          position: const Duration(minutes: 1, seconds: 1),
          at: now,
          playing: false,
        ),
      );
      expect(paused, isNotNull);

      now = now.add(const Duration(milliseconds: 300));
      final resumed = timeline.onState(
        _state(position: const Duration(minutes: 1, seconds: 1), at: now),
      );
      expect(resumed, isNotNull);

      now = now.add(const Duration(milliseconds: 300));
      final seeked = timeline.onState(
        _state(position: const Duration(minutes: 30), at: now),
      );
      expect(seeked?.position, const Duration(minutes: 30));

      now = now.add(const Duration(milliseconds: 300));
      expect(
        timeline
            .onState(
              _state(
                position: const Duration(minutes: 30, milliseconds: 300),
                at: now,
                speed: 1.5,
              ),
            )
            ?.rate,
        1.5,
      );
    });

    test('a length change (chapter or speed) resends the last state', () {
      timeline.onState(_state(position: const Duration(minutes: 3), at: now));
      now = now.add(const Duration(seconds: 1));
      final update = timeline.onMediaItem(
        _item('book', const Duration(minutes: 20)),
      );
      expect(update, isNotNull);
      expect(update!.duration, const Duration(minutes: 20));
      // Extrapolated by the second that passed since the state.
      expect(update.position, const Duration(minutes: 3, seconds: 1));
      // The same item and length again is a text re-push: nothing to send.
      expect(
        timeline.onMediaItem(_item('book', const Duration(minutes: 20))),
        isNull,
      );
    });

    test('positions are clamped to the item length', () {
      final update = timeline.onState(
        _state(position: const Duration(hours: 11), at: now),
      );
      expect(update!.position, const Duration(hours: 10));
    });

    test('nothing is sent before the item has a length', () {
      final fresh = SmtcTimeline(clock: () => now);
      expect(fresh.onState(_state(position: Duration.zero, at: now)), isNull);
      fresh.onMediaItem(_item('book', Duration.zero));
      expect(fresh.onState(_state(position: Duration.zero, at: now)), isNull);
    });

    test('a locked seek bar is reported as not seekable', () {
      final update = timeline.onState(
        _state(position: Duration.zero, at: now, seekable: false),
      );
      expect(update!.seekable, isFalse);
      expect(timeline.seekable, isFalse);
    });
  });

  group('AudioServiceWin channel', () {
    const channel = MethodChannel('audio_service_win');
    final calls = <MethodCall>[];
    late DateTime now;
    late AudioServiceWin plugin;

    setUp(() {
      calls.clear();
      now = _t0;
      plugin = AudioServiceWin(timeline: SmtcTimeline(clock: () => now));
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            calls.add(call);
            return null;
          });
    });
    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    List<MethodCall> timelineCalls() =>
        calls.where((c) => c.method == 'updateTimeline').toList();

    test('sends position and length in milliseconds, throttled', () async {
      await plugin.setMediaItem(
        SetMediaItemRequest(mediaItem: _item('book', const Duration(hours: 2))),
      );
      await plugin.setState(
        SetStateRequest(
          state: _state(position: const Duration(minutes: 5), at: now),
        ),
      );
      now = now.add(const Duration(seconds: 1));
      await plugin.setState(
        SetStateRequest(
          state: _state(
            position: const Duration(minutes: 5, seconds: 1),
            at: now,
          ),
        ),
      );

      // Every state still updates the play/pause status...
      expect(calls.where((c) => c.method == 'updateState'), hasLength(2));
      // ...but only the first moves the timeline.
      final sent = timelineCalls();
      expect(sent, hasLength(1));
      expect(sent.single.arguments, {
        'positionMs': const Duration(minutes: 5).inMilliseconds,
        'durationMs': const Duration(hours: 2).inMilliseconds,
        'rate': 1.0,
        'seekable': true,
      });
    });

    test('a failing timeline call never breaks the state update', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            calls.add(call);
            if (call.method == 'updateTimeline') {
              throw PlatformException(code: 'boom');
            }
            return null;
          });
      await plugin.setMediaItem(
        SetMediaItemRequest(mediaItem: _item('book', const Duration(hours: 1))),
      );
      await expectLater(
        plugin.setState(
          SetStateRequest(
            state: _state(position: Duration.zero, at: now),
          ),
        ),
        completes,
      );
      expect(calls.map((c) => c.method), contains('updateTimeline'));
    });

    test(
      'a flyout seek reaches the handler and forces a fresh timeline',
      () async {
        final callbacks = _FakeCallbacks();
        plugin.setHandlerCallbacks(callbacks);
        await plugin.setMediaItem(
          SetMediaItemRequest(
            mediaItem: _item('book', const Duration(hours: 1)),
          ),
        );
        await plugin.setState(
          SetStateRequest(
            state: _state(position: Duration.zero, at: now, playing: false),
          ),
        );
        await plugin.handleSeekRequest(90000);
        expect(callbacks.seeks, [const Duration(seconds: 90)]);

        // Even a state that looks unchanged goes out after a seek request.
        await plugin.setState(
          SetStateRequest(
            state: _state(position: Duration.zero, at: now, playing: false),
          ),
        );
        expect(timelineCalls(), hasLength(2));
      },
    );

    test('a flyout seek is ignored while the seek bar is locked', () async {
      final callbacks = _FakeCallbacks();
      plugin.setHandlerCallbacks(callbacks);
      await plugin.setMediaItem(
        SetMediaItemRequest(mediaItem: _item('book', const Duration(hours: 1))),
      );
      await plugin.setState(
        SetStateRequest(
          state: _state(position: Duration.zero, at: now, seekable: false),
        ),
      );
      await plugin.handleSeekRequest(90000);
      expect(callbacks.seeks, isEmpty);
    });

    test(
      'stopping resets the timeline so the next item starts fresh',
      () async {
        await plugin.setMediaItem(
          SetMediaItemRequest(
            mediaItem: _item('book', const Duration(hours: 1)),
          ),
        );
        await plugin.setState(
          SetStateRequest(
            state: _state(position: Duration.zero, at: now, playing: false),
          ),
        );
        await plugin.stopService(const StopServiceRequest());
        await plugin.setMediaItem(
          SetMediaItemRequest(
            mediaItem: _item('book', const Duration(hours: 1)),
          ),
        );
        await plugin.setState(
          SetStateRequest(
            state: _state(position: Duration.zero, at: now, playing: false),
          ),
        );
        expect(timelineCalls(), hasLength(2));
      },
    );
  });

  group('windowsMediaCoverUri', () {
    const url = 'https://abs.example.invalid/api/items/li_1/cover?token=t0k3n';

    test('prefers the downloaded cover file when it exists', () {
      expect(
        windowsMediaCoverUri(
          localCoverPath: r'C:\Books\A+B 100%\cover.jpg',
          coverUrl: url,
          fileExists: (_) => true,
        ),
        'file:///C:/Books/A+B%20100%25/cover.jpg',
      );
    });

    test('falls back to the server URL when the local file is missing', () {
      expect(
        windowsMediaCoverUri(
          localCoverPath: r'C:\Books\gone\cover.jpg',
          coverUrl: url,
          fileExists: (_) => false,
        ),
        url,
      );
    });

    test('uses the server URL for streamed books', () {
      expect(
        windowsMediaCoverUri(coverUrl: url, fileExists: (_) => false),
        url,
      );
    });

    test('accepts a local file cover URL (offline items)', () {
      expect(
        windowsMediaCoverUri(
          coverUrl: r'C:\Absorb\covers\li_1.jpg',
          fileExists: (_) => true,
        ),
        'file:///C:/Absorb/covers/li_1.jpg',
      );
      expect(
        windowsMediaCoverUri(
          coverUrl: 'file:///C:/Absorb/covers/li_1.jpg',
          fileExists: (_) => true,
        ),
        'file:///C:/Absorb/covers/li_1.jpg',
      );
    });

    test('never sends Android content URIs or nothing usable', () {
      expect(
        windowsMediaCoverUri(
          coverUrl: 'content://com.example.covers/cover/li_1',
          fileExists: (_) => true,
        ),
        isNull,
      );
      expect(windowsMediaCoverUri(fileExists: (_) => true), isNull);
      expect(windowsMediaCoverUri(localCoverPath: '', coverUrl: ''), isNull);
    });
  });
}
