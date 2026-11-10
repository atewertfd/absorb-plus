import 'dart:async';

import 'package:absorb/services/audio_player_service.dart';
import 'package:fake_async/fake_async.dart';
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

    test('the wait is not counted as listening time', () async {
      final player = AudioPlayerService();
      final policy = player.debugRecoveryPolicy;
      // Last tick 10 s before the stream dropped.
      final lastTick = DateTime.now().subtract(const Duration(seconds: 10));
      player.debugListeningClocks = (accrual: lastTick, serverSync: lastTick);
      policy.onFailure(Exception('Source error'));
      addTearDown(() => policy.cancel('test over'));

      await Future<void>.delayed(const Duration(milliseconds: 300));
      player.cancelRecovery('account change'); // ends the wait

      final clocks = player.debugListeningClocks;
      final skipped = clocks.accrual.difference(lastTick);
      expect(skipped, greaterThanOrEqualTo(const Duration(milliseconds: 300)),
          reason: 'the wait moved the clock on, so it is not banked');
      expect(skipped, lessThan(const Duration(seconds: 5)),
          reason: 'the 10 s listened before the drop still count');
      expect(clocks.serverSync, clocks.accrual);
    });

    test('skipping past the last chapter ends a reconnect', () async {
      final player = AudioPlayerService();
      final policy = player.debugRecoveryPolicy;
      policy.onFailure(Exception('Source error'));
      addTearDown(() => policy.cancel('test over'));

      await player.debugCompletePlayback(userRequested: true);

      expect(policy.isActive, isFalse,
          reason: 'no attempt may reload the finished book');
      expect(player.isPlaying, isFalse);
    });

    test('a seek to the start while reconnecting is held at 0:00', () async {
      final player = AudioPlayerService();
      final policy = player.debugRecoveryPolicy;
      policy.onFailure(Exception('Source error'));
      addTearDown(() => policy.cancel('test over'));

      await player.seekTo(Duration.zero);

      expect(policy.isRecovering, isTrue);
      expect(policy.failedAtSec, 0);
      expect(policy.hasUserTarget, isTrue);
      expect(policy.resumeAtSec, 0);
    });

    test('a call during a reconnect shows paused but keeps reconnecting', () {
      fakeAsync((async) {
        final player = AudioPlayerService();
        final policy = player.debugRecoveryPolicy;
        policy.onFailure(Exception('Source error'));
        addTearDown(() => policy.cancel('test over'));

        player.debugAudioFocusLost();

        expect(policy.isRecovering, isTrue,
            reason: 'the book should be ready again when the call ends');
        expect(player.isPlaying, isFalse, reason: 'paused for the call');
        expect(player.isReconnecting, isFalse);
        expect(player.isLoadingOrBuffering, isFalse);

        // Attempts carry on through the call (no server here, so they fail)
        // and none of them takes the hold away.
        async.elapse(const Duration(seconds: 8));
        expect(policy.attempt, greaterThanOrEqualTo(1));
        expect(policy.isRecovering, isTrue);
        expect(player.isPlaying, isFalse);

        // The call ends: the focus handler's resume is a Play, which retries
        // at once and lets the reconnect start audio again.
        final attempts = policy.attempt;
        unawaited(player.play());
        async.flushMicrotasks();
        expect(policy.attempt, attempts + 1);
        expect(player.isPlaying, isTrue);
        expect(player.isReconnecting, isTrue);
        policy.cancel('test over');
      });
    });

    test('an interruption is forgotten once that reconnect ends', () {
      fakeAsync((async) {
        final player = AudioPlayerService();
        final policy = player.debugRecoveryPolicy;
        policy.onFailure(Exception('Source error'));
        player.debugAudioFocusLost();
        expect(player.isPlaying, isFalse);

        // The recovery ends without a Play (it gave up, or the stream healed).
        policy.cancel('ended');
        // A later drop, with the call long over, shows reconnecting again.
        policy.onFailure(Exception('Source error'));
        addTearDown(() => policy.cancel('test over'));
        expect(player.isPlaying, isTrue);
        expect(player.isReconnecting, isTrue);
        policy.cancel('test over');
      });
    });

    test('an interruption with no reconnect running changes nothing', () {
      fakeAsync((async) {
        final player = AudioPlayerService();
        final policy = player.debugRecoveryPolicy;
        player.debugAudioFocusLost();

        policy.onFailure(Exception('Source error'));
        addTearDown(() => policy.cancel('test over'));
        expect(player.isPlaying, isTrue,
            reason: 'only a reconnect that was running is held');
        policy.cancel('test over');
      });
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
