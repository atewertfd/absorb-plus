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
}
