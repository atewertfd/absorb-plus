import 'dart:async';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/audio_player_service.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

/// A streamed book moves onto its downloaded files mid-play once the
/// download finishes. From the moment those files load, a playback error
/// must go to the old file retry, never to the stream reconnect (which would
/// rebuild a stream over the files). Run on the real service with no engine.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  ApiService fakeApi() =>
      mockApi((_) async => http.Response('', 404), instantRetries: false);

  // An ExoPlayer source error, as a dropped connection reports it.
  final sourceError = Exception('Source error');

  test('a source error on the downloaded files starts no reconnect', () {
    fakeAsync((async) {
      final player = AudioPlayerService();
      player.debugSetLoadedItem('book-a', fakeApi());
      // Moved onto the files; the local session hasn't started (or failed to).
      player.debugSourceLoaded(localFiles: true);

      unawaited(player.debugAttemptStreamRetry(sourceError, resume: true));
      async.flushMicrotasks();

      expect(player.debugRecoveryPolicy.isActive, isFalse);
      expect(player.isReconnecting, isFalse);
    });
  });

  test('back on the stream, the same error reconnects again', () {
    fakeAsync((async) {
      final player = AudioPlayerService();
      player.debugSetLoadedItem('book-a', fakeApi());
      player.debugSourceLoaded(localFiles: false);

      unawaited(player.debugAttemptStreamRetry(sourceError, resume: true));
      async.flushMicrotasks();

      expect(player.debugRecoveryPolicy.isRecovering, isTrue);
      player.debugRecoveryPolicy.cancel('test over');
    });
  });
}
