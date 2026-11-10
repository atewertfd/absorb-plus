import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/progress_sync_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// syncToServer(sessionId: ...) must keep the position queued when the
/// session sync fails (it returns false; it never throws).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  ApiService api(int syncStatus) => ApiService(
        baseUrl: 'https://audiobookshelf.example',
        token: 'fixture-token',
        httpClient: MockClient((request) async => http.Response(
            '{}', request.url.path.endsWith('/sync') ? syncStatus : 200)),
      );

  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('a failed session sync keeps the position pending', () async {
    final sync = ProgressSyncService();
    await sync.saveLocal(itemId: 'book-s', currentTime: 30, duration: 90, speed: 1);

    final ok = await sync.syncToServer(
        api: api(503), itemId: 'book-s', sessionId: 'session-1');

    expect(ok, isFalse);
    expect(await sync.hasPendingSync('book-s'), isTrue);
  });

  test('a taken session sync clears it', () async {
    final sync = ProgressSyncService();
    await sync.saveLocal(itemId: 'book-t', currentTime: 30, duration: 90, speed: 1);

    final ok = await sync.syncToServer(
        api: api(200), itemId: 'book-t', sessionId: 'session-1');

    expect(ok, isTrue);
    expect(await sync.hasPendingSync('book-t'), isFalse);
  });
}
