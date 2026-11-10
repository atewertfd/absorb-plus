import 'dart:convert';

import 'package:absorb/services/audio_player_service.dart';
import 'package:absorb/services/equalizer_service.dart';
import 'package:absorb/services/local_session_service.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The hand-off to a pre-buffered next book skips playItem, so it must reset
/// and apply the per-item state a normal start does: the local-session mode
/// (listening time for downloads), the truncated-download clamp, and the
/// book's EQ. Run on the real service with no engine behind it.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    LocalSessionService().debugReset();
  });
  tearDown(() {
    final player = AudioPlayerService();
    player.debugPreloadedNextBook = null;
    player.debugLocalMode = (localSessionMode: false, shortLocalDurationSec: null);
    player.debugSetLoadedItem(null, null);
    LocalSessionService().debugReset();
  });

  Map<String, dynamic> nextBook({required bool downloaded}) => {
        'itemId': 'book-2',
        'title': 'Next',
        'author': 'Someone',
        'duration': 3600,
        'startS': 30.0,
        if (downloaded) 'localPaths': ['/fixture/book-2.m4b'],
        if (!downloaded)
          'audioTracks': [
            {'url': 'http://abs.test/track'},
          ],
      };

  void advance(AudioPlayerService player) {
    try {
      player.debugAutoQueueAdvance();
    } catch (_) {
      // The notification update (no media handler in tests), past the part
      // under test.
    }
  }

  Future<void> settle() async {
    for (var i = 0; i < 20; i++) {
      await Future<void>.delayed(Duration.zero);
    }
  }

  Future<Map<String, dynamic>?> activeLocalSession() async {
    final raw = await ScopedPrefs.getString('local_session_active');
    return raw == null ? null : jsonDecode(raw) as Map<String, dynamic>;
  }

  test('a downloaded next book gets local mode, its own session and EQ, '
      'and no leftover clamp', () async {
    final player = AudioPlayerService();
    player.debugSetLoadedItem('book-1', null);
    // A truncated download of the finished book, clamped at 600 s; the
    // listening was streamed (no local session).
    player.debugLocalMode = (localSessionMode: false, shortLocalDurationSec: 600);
    player.debugPreloadedNextBook = nextBook(downloaded: true);

    advance(player);
    await settle();

    expect(player.currentItemId, 'book-2');
    expect(player.debugLocalMode.localSessionMode, isTrue);
    expect(player.debugLocalMode.shortLocalDurationSec, isNull);
    final session = await activeLocalSession();
    expect(session?['progressKey'], 'book-2');
    expect(session?['startTime'], 30.0);
    expect(EqualizerService().currentItemId, 'book-2');
  });

  test('a streamed next book after a downloaded one leaves local mode and '
      'queues the finished book\'s session', () async {
    final player = AudioPlayerService();
    await LocalSessionService().beginSession(
      progressKey: 'book-1',
      libraryItemId: 'book-1',
      mediaType: 'book',
      duration: 3600,
      startTime: 0,
    );
    player.debugSetLoadedItem('book-1', null);
    player.debugLocalMode = (localSessionMode: true, shortLocalDurationSec: null);
    player.debugPreloadedNextBook = nextBook(downloaded: false);

    advance(player);
    await settle();

    expect(player.debugLocalMode.localSessionMode, isFalse);
    expect(await activeLocalSession(), isNull);
    final pending = await ScopedPrefs.getStringList('local_session_pending');
    expect(pending, hasLength(1));
    expect(
        (jsonDecode(pending.single) as Map<String, dynamic>)['progressKey'],
        'book-1');
  });
}
