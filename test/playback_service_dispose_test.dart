import 'package:absorb/services/audio_player_service.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Disposes the player service singleton, so it has a file (and an isolate)
/// of its own: no other test may use the service after this.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('dispose ends a reconnect, so no retry fires afterwards', () {
    fakeAsync((async) {
      final player = AudioPlayerService();
      final policy = player.debugRecoveryPolicy;
      policy.onFailure(Exception('Source error'));
      expect(policy.isRecovering, isTrue);

      player.dispose();

      expect(policy.isActive, isFalse);
      // Past every retry and the 5 minute give-up: nothing ran, so nothing
      // reached the disposed service (a give-up would notify it and throw).
      async.elapse(const Duration(minutes: 10));
      expect(policy.attempt, 0);
      expect(policy.isActive, isFalse);
      expect(async.pendingTimers, isEmpty);
    });
  });
}
