import 'package:absorb/services/audio_player_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Glue in the player service itself, run on the real service with no
/// engine behind it (tests never build a platform player).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('stop while a start is loading', () {
    test('stop supersedes the start, so it backs out instead of playing', () async {
      final player = AudioPlayerService();
      player.debugMarkStartLoading();
      final loadingGeneration = player.debugPlaybackGeneration;
      expect(player.isLoadingNewItem, isTrue);

      await player.stop();

      expect(player.debugPlaybackGeneration, isNot(loadingGeneration));
      expect(player.isLoadingNewItem, isFalse,
          reason: 'no newer start will clear the loading flag');
    });

    test('a reset (stop without saving) does the same', () async {
      final player = AudioPlayerService();
      player.debugMarkStartLoading();
      final loadingGeneration = player.debugPlaybackGeneration;

      await player.stopWithoutSaving();

      expect(player.debugPlaybackGeneration, isNot(loadingGeneration));
      expect(player.isLoadingNewItem, isFalse);
    });
  });

  group('reconnecting counts as playing', () {
    // The service is a singleton: start each test unpaused, with nothing
    // loaded (Play with no item and no history does nothing else).
    setUp(() => AudioPlayerService().play());

    test('the service reports playing and loading while a reconnect waits', () async {
      final player = AudioPlayerService();
      final policy = player.debugRecoveryPolicy;
      expect(player.isPlaying, isFalse);

      policy.onFailure(Exception('Source error'));
      addTearDown(() => policy.cancel('test over'));

      expect(policy.isWaiting, isTrue);
      expect(player.isPlaying, isTrue, reason: 'not shown as paused');
      expect(player.isReconnecting, isTrue);
      expect(player.isLoadingOrBuffering, isTrue);
    });

    test('Play while reconnecting retries now instead of cancelling', () async {
      final player = AudioPlayerService();
      final policy = player.debugRecoveryPolicy;
      policy.onFailure(Exception('Source error'));
      addTearDown(() => policy.cancel('test over'));
      expect(policy.attempt, 0);

      await player.play();
      // The attempt ran at once (no server here, so it failed and waits
      // again), and the recovery is still going.
      await Future<void>.delayed(Duration.zero);
      expect(policy.attempt, 1);
      expect(policy.isRecovering, isTrue);
      expect(player.isPlaying, isTrue);
    });

    test('Pause while reconnecting cancels and shows paused', () async {
      final player = AudioPlayerService();
      final policy = player.debugRecoveryPolicy;
      policy.onFailure(Exception('Source error'));
      addTearDown(() => policy.cancel('test over'));

      await player.pause();

      expect(policy.isActive, isFalse);
      expect(player.isPlaying, isFalse);
      expect(player.isReconnecting, isFalse);
    });

    test('an account change drops a reconnect, even with no item loaded', () async {
      final player = AudioPlayerService();
      final policy = player.debugRecoveryPolicy;
      policy.onFailure(Exception('Source error'));
      addTearDown(() => policy.cancel('test over'));
      expect(player.hasBook, isFalse);

      player.cancelRecovery('account change');

      expect(policy.isActive, isFalse);
      expect(player.isPlaying, isFalse);
      // Nothing is left to retry later, on the old sign-in.
      await player.play();
      expect(policy.isActive, isFalse);
    });

    test('a seek while reconnecting moves the reconnect instead of ending it', () async {
      final player = AudioPlayerService();
      final policy = player.debugRecoveryPolicy;
      policy.onFailure(Exception('Source error'));
      addTearDown(() => policy.cancel('test over'));

      await player.seekTo(const Duration(seconds: 754));

      expect(policy.isRecovering, isTrue);
      expect(policy.failedAtSec, 754);
      expect(policy.resumeAtSec, 754);
      expect(player.isPlaying, isTrue);
    });

    test('togglePlayPause while reconnecting pauses', () async {
      final player = AudioPlayerService();
      final policy = player.debugRecoveryPolicy;
      policy.onFailure(Exception('Source error'));
      addTearDown(() => policy.cancel('test over'));

      await player.togglePlayPause();

      expect(policy.isActive, isFalse);
      expect(player.isPlaying, isFalse);
    });
  });
}
