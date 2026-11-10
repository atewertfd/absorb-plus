import 'dart:async';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/audio_player_service.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

/// The old stream retry (downloaded files, and errors a reconnect can't fix)
/// waits 1-4 s before restarting the item. Run on the real service with no
/// engine behind it. Its own file: the retry counter is service state.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  ApiService fakeApi() =>
      mockApi((_) async => http.Response('', 404), instantRetries: false);

  // A start entering playItem cancels any reconnect first thing, so a
  // reconnect parked here shows whether the retry restarted the item.
  void parkReconnect(AudioPlayerService player) {
    player.debugRecoveryPolicy.onFailure(Exception('Source error'));
  }

  bool retryRestarted(AudioPlayerService player) =>
      !player.debugRecoveryPolicy.isActive;

  test('a retry whose item was replaced while it waited does nothing', () {
    fakeAsync((async) {
      final player = AudioPlayerService();
      final api = fakeApi();
      player.debugSetLoadedItem('book-a', api);
      parkReconnect(player);

      unawaited(player.debugAttemptStreamRetry(Exception('Decoder init failed')));
      // The user starts another book during the wait.
      player.debugSetLoadedItem('book-b', api);
      player.debugMarkStartLoading();
      final generation = player.debugPlaybackGeneration;

      async.elapse(const Duration(milliseconds: 1500));

      expect(retryRestarted(player), isFalse,
          reason: 'book-b must not be restarted by book-a\'s retry');
      expect(player.debugPlaybackGeneration, generation);
      player.debugRecoveryPolicy.cancel('test over');
      player.debugSetLoadedItem(null, null);
    });
  });

  test('a retry whose item was started again while it waited does nothing', () {
    fakeAsync((async) {
      final player = AudioPlayerService();
      final api = fakeApi();
      player.debugSetLoadedItem('book-a', api);
      parkReconnect(player);

      unawaited(player.debugAttemptStreamRetry(Exception('Decoder init failed')));
      // Same book, but a newer start of it is now in charge.
      player.debugMarkStartLoading();

      async.elapse(const Duration(seconds: 3));

      expect(retryRestarted(player), isFalse);
      player.debugRecoveryPolicy.cancel('test over');
      player.debugSetLoadedItem(null, null);
    });
  });

  test('a retry with the same start still loaded restarts it', () {
    fakeAsync((async) {
      final player = AudioPlayerService();
      player.debugSetLoadedItem('book-a', fakeApi());
      parkReconnect(player);

      unawaited(player.debugAttemptStreamRetry(Exception('Decoder init failed')));
      async.elapse(const Duration(seconds: 5));

      expect(retryRestarted(player), isTrue,
          reason: 'nothing changed, so the retry went ahead');
      player.debugRecoveryPolicy.cancel('test over');
    });
  });
}
