import 'dart:io';

import 'package:absorb/services/audio_player_service.dart';
import 'package:absorb/services/remote_link/app_remote_player.dart';
import 'package:absorb/services/remote_link/protocol.dart';
import 'package:absorb/services/remote_link/remote_library_access.dart';
import 'package:absorb/services/sleep_timer_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeLibrary implements RemoteLibraryAccess {
  int? maxAsked;
  String? localCover;
  final played = <String>[];

  @override
  List<RemoteRecentItem> recentItems(int max) {
    maxAsked = max;
    return const [RemoteRecentItem(id: 'li_2', title: 'Next')];
  }

  @override
  String? coverUrl(String itemId) => null;
  @override
  Map<String, String> get coverHeaders => const {};
  @override
  String? localCoverPath(String itemId) => localCover;
  @override
  Future<bool> play(String itemId) async {
    if (itemId != 'li_2') return false;
    played.add(itemId);
    return true;
  }
}

/// The phone-remote host's view of the app player. Runs on the real player
/// and sleep timer singletons with no audio engine behind them.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<AppRemotePlayer> remotes;

  setUp(() {
    // No accelerometer behind the sleep timer in tests.
    SharedPreferences.setMockInitialValues({'shakeMode': 'off'});
    remotes = [];
  });
  tearDown(() {
    for (final r in remotes) {
      r.dispose();
    }
    SleepTimerService().cancel();
    AudioPlayerService().debugSetLoadedItem(null, null);
  });

  AppRemotePlayer make() {
    final r = AppRemotePlayer();
    remotes.add(r);
    return r;
  }

  Future<void> settle() async {
    for (var i = 0; i < 10; i++) {
      await Future<void>.delayed(Duration.zero);
    }
  }

  group('state', () {
    test('nothing loaded: no item, default skips, sleep off', () async {
      final r = make();
      await settle();
      final s = r.state;
      expect(s.hasItem, isFalse);
      expect(s.itemId, isNull);
      expect(s.title, '');
      expect(s.skipBack, 10);
      expect(s.skipForward, 30);
      expect(s.sleep.isActive, isFalse);
      expect(s.coverVersion, 0);
    });

    test('a loaded item with no engine reads as paused at zero', () async {
      AudioPlayerService().debugSetLoadedItem('li_1', null);
      final r = make();
      final s = r.state;
      expect(s.itemId, 'li_1');
      expect(s.title, '');
      expect(s.author, '');
      expect(s.chapterTitle, '');
      expect(s.position, 0);
      expect(s.duration, 0);
      expect(s.hasChapter, isFalse);
      expect(s.playing, isFalse);
      expect(s.speed, 1);
    });

    test('coverVersion moves only when the item changes', () {
      final player = AudioPlayerService();
      final r = make();
      player.debugSetLoadedItem('li_1', null);
      final first = r.state.coverVersion;
      expect(r.state.coverVersion, first);

      player.debugSetLoadedItem('li_2', null);
      final second = r.state.coverVersion;
      expect(second, first + 1);

      // Going back is a change too: the remote fetches the cover again.
      player.debugSetLoadedItem('li_1', null);
      expect(r.state.coverVersion, second + 1);
    });

    test(
      'nothing loaded reports version 0; the same item comes back as is',
      () {
        final player = AudioPlayerService();
        final r = make();
        player.debugSetLoadedItem('li_1', null);
        final v = r.state.coverVersion;
        expect(v, greaterThan(0));

        player.debugSetLoadedItem(null, null);
        expect(r.state.hasItem, isFalse);
        expect(r.state.coverVersion, 0);

        // The counter is not bumped for the same item and cover URL.
        player.debugSetLoadedItem('li_1', null);
        expect(r.state.coverVersion, v);
      },
    );
  });

  group('skip amounts', () {
    test('are read from the settings when created', () async {
      SharedPreferences.setMockInitialValues({
        'shakeMode': 'off',
        'backSkip': 15,
        'forwardSkip': 45,
      });
      final r = make();
      var notified = 0;
      r.addListener(() => notified++);
      await settle();

      expect(r.state.skipBack, 15);
      expect(r.state.skipForward, 45);
      expect(notified, 1);
    });

    test('unchanged settings do not notify', () async {
      final r = make();
      var notified = 0;
      r.addListener(() => notified++);
      await settle();
      expect(notified, 0);
    });

    test('follow a settings change', () async {
      final r = make();
      await settle();
      var notified = 0;
      r.addListener(() => notified++);

      await PlayerSettings.setBackSkip(5);
      await settle();
      expect(r.state.skipBack, 5);
      expect(r.state.skipForward, 30);
      expect(notified, greaterThanOrEqualTo(1));
    });
  });

  group('sleep', () {
    test('sleepFor reports a time timer with seconds left', () async {
      final r = make();
      await r.sleepFor(15);
      await settle();
      expect(r.state.sleep.mode, RemoteSleepState.time);
      expect(r.state.sleep.remaining, 15 * 60);
    });

    test('cancelSleep turns it off and notifies', () async {
      final r = make();
      await r.sleepFor(5);
      await settle();
      var notified = 0;
      r.addListener(() => notified++);

      await r.cancelSleep();
      expect(r.state.sleep.isActive, isFalse);
      expect(notified, greaterThanOrEqualTo(1));
    });

    test('end of chapter with no chapters loaded stays off', () async {
      AudioPlayerService().debugSetLoadedItem('li_1', null);
      final r = make();
      await r.sleepAtEndOfChapter();
      expect(r.state.sleep.isActive, isFalse);
    });
  });

  group('commands with no engine', () {
    test('skip, chapter and speed are quiet no-ops', () async {
      AudioPlayerService().debugSetLoadedItem('li_1', null);
      final r = make();
      await r.skip(30);
      await r.skip(-10);
      await r.skip(0);
      await r.chapter(1);
      await r.chapter(-1);
      await r.chapter(0);
      await r.setSpeed(99);
      await r.setSpeed(0);
      expect(r.state.position, 0);
      expect(r.state.speed, 1);
    });

    test('pause while not playing does nothing', () async {
      final r = make();
      await r.pause();
      expect(r.state.playing, isFalse);
    });
  });

  group('cover', () {
    test('nothing loaded gives no cover', () async {
      expect(await make().loadCover(), isNull);
    });

    test('an item with no download and no cover URL gives no cover', () async {
      AudioPlayerService().debugSetLoadedItem('li_1', null);
      expect(await make().loadCover(), isNull);
    });
  });

  group('library (Continue listening)', () {
    test('recent items and play go through the library', () async {
      final library = _FakeLibrary();
      final r = AppRemotePlayer(library: library);
      remotes.add(r);
      expect((await r.recentItems()).single.id, 'li_2');
      expect(library.maxAsked, 8);
      expect(await r.playItem('li_2'), isTrue);
      expect(library.played, ['li_2']);
      expect(await r.playItem('nope'), isFalse);
    });

    test('without a signed-in library there is nothing to offer', () async {
      final r = make();
      expect(await r.recentItems(), isEmpty);
      expect(await r.playItem('li_2'), isFalse);
    });

    test('a book\'s cover comes from its downloaded file', () async {
      final dir = await Directory.systemTemp.createTemp('remote_cover');
      addTearDown(() => dir.delete(recursive: true));
      final file = File('${dir.path}${Platform.pathSeparator}cover.jpg');
      await file.writeAsBytes([0xFF, 0xD8, 1, 2]);
      final library = _FakeLibrary()..localCover = file.path;
      final r = AppRemotePlayer(library: library);
      remotes.add(r);
      expect(await r.loadCover('li_2'), [0xFF, 0xD8, 1, 2]);
      library.localCover = null;
      expect(await r.loadCover('li_2'), isNull);
    });
  });

  group('more controls with no engine', () {
    test('no chapters, no bookmark, volume calls are quiet', () async {
      final r = make();
      expect(r.chapters, isEmpty);
      expect(identical(r.chapters, r.chapters), isTrue);
      expect(await r.addBookmark('note'), isFalse);
      await r.setVolume(0.3);
      await r.setMuted(true);
      await r.setMuted(false);
      expect(r.state.volume, 1);
      expect(r.state.muted, isFalse);
    });
  });

  test('dispose stops listening to the player and sleep timer', () async {
    final r = AppRemotePlayer();
    var notified = 0;
    r.addListener(() => notified++);
    await settle();
    r.dispose();

    // A disposed ChangeNotifier asserts if it is still told to notify.
    SleepTimerService().cancel();
    PlayerSettings.notifySettingsChanged();
    await settle();
    expect(notified, 0);
  });
}
