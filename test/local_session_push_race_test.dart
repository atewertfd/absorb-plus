import 'dart:async';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/local_session_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

// BUG-007: a push still waiting on the server when the book ended re-read the
// session with `_active!` after the await and threw a null-check error.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    LocalSessionService().debugReset();
  });
  tearDown(() => LocalSessionService().debugReset());

  test('finalizing during a pending push does not throw', () async {
    final reply = Completer<http.Response>();
    final api = ApiService(
      baseUrl: 'https://audiobookshelf.example',
      token: 'fixture-token',
      httpClient: MockClient((req) {
        if (req.url.path.endsWith('/api/session/local')) return reply.future;
        return Future.value(http.Response('{}', 404));
      }),
    );
    final service = LocalSessionService();
    await service.beginSession(
      progressKey: 'book-1',
      libraryItemId: 'book-1',
      mediaType: 'book',
      duration: 3600,
      startTime: 0,
    );

    final push = service.pushActive(api: api);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    await service.finalizeActive(pushed: false);
    reply.complete(http.Response('{}', 200));

    await expectLater(push, completes);
  });
}
