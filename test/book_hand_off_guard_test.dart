import 'package:absorb/services/audio_player_service.dart';
import 'package:absorb/services/playback_recovery.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The hand-off to a pre-buffered next book marks the current one finished.
/// On Android a dropped stream in the last file can step the player into the
/// next book too: that must not count while a reconnect is pending. Run on
/// the real service with no engine behind it.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  late List<String> finished;
  setUp(() {
    finished = [];
    AudioPlayerService.setOnAutoQueueAdvancedCallback(finished.add);
  });
  tearDown(() => AudioPlayerService.setOnAutoQueueAdvancedCallback(null));

  // An episode, so the hand-off doesn't also ask for an app review.
  void loadWithNextBook(AudioPlayerService player) {
    player.debugSetLoadedItem('show-a', null, episodeId: 'ep-1');
    player.debugPreloadedNextBook = {
      'itemId': 'show-a',
      'episodeId': 'ep-2',
      'title': 'Next',
      'author': 'Someone',
      'duration': 3600,
      'startS': 0,
    };
  }

  test('no hand-off (and no "finished") while a reconnect waits', () {
    fakeAsync((async) {
      final player = AudioPlayerService();
      loadWithNextBook(player);
      final policy = player.debugRecoveryPolicy;
      policy.onFailure(Exception('Source error'));

      player.debugAutoQueueAdvance();

      expect(finished, isEmpty);
      expect(player.currentEpisodeId, 'ep-1', reason: 'still the same episode');
      policy.cancel('test over');
      player.debugPreloadedNextBook = null;
    });
  });

  // Last in the file: with no media handler here the rest of the hand-off
  // throws once it reaches the notification, after it has already promoted
  // the next episode, and it leaves the service mid-advance.
  test('a stall that is being watched does not block a real hand-off', () {
    fakeAsync((async) {
      final player = AudioPlayerService();
      loadWithNextBook(player);
      final policy = player.debugRecoveryPolicy;
      policy.onFailure(const PlaybackStallError(Duration(seconds: 15)));
      expect(policy.isStallOnly, isTrue);

      try {
        player.debugAutoQueueAdvance();
      } catch (_) {
        // The notification update, past the part under test.
      }

      expect(player.currentEpisodeId, 'ep-2',
          reason: 'the player kept its own source, so the hand-off is real');
      policy.cancel('test over');
    });
  });
}
