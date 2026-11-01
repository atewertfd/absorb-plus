import 'dart:convert';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/local_session_service.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The legacy /play fallback for servers without /api/session/local: every
/// /play session adds its time, so it must send deltas, report failures, and
/// stay tied to the server that needed it.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    LocalSessionService().debugReset();
  });
  tearDown(() => LocalSessionService().debugReset());

  /// [local] answers /api/session/local; [play] answers the /play opens.
  ApiService server(
    String baseUrl,
    List<http.Request> seen, {
    int local = 404,
    int play = 200,
  }) =>
      ApiService(
        baseUrl: baseUrl,
        token: 'fixture-token',
        httpClient: MockClient((request) async {
          seen.add(request);
          final path = request.url.path;
          if (path == '/api/session/local') return http.Response('{}', local);
          if (path.endsWith('/play')) {
            return http.Response(jsonEncode({'id': 'play-${seen.length}'}), play);
          }
          if (path.startsWith('/api/items/')) {
            return http.Response(jsonEncode({'media': {'duration': 3600}}), 200);
          }
          return http.Response('{}', 200);
        }),
      );

  List<int> legacySeconds(List<http.Request> seen) => [
        for (final r in seen.where((r) => r.url.path.endsWith('/sync')))
          (jsonDecode(r.body) as Map<String, dynamic>)['timeListened'] as int,
      ];

  Future<void> begin() => LocalSessionService().beginSession(
        progressKey: 'book-1',
        libraryItemId: 'book-1',
        mediaType: 'book',
        duration: 3600,
        startTime: 0,
      );

  test('legacy pushes send what was gained, not the running total', () async {
    final seen = <http.Request>[];
    final old = server('https://old.example', seen);
    await begin();
    for (var i = 1; i <= 3; i++) {
      await LocalSessionService().accrue(
          progressKey: 'book-1', seconds: 60, currentTime: 60.0 * i, api: old);
    }
    // 3 minutes listened is 3 minutes credited (was 1 + 2 + 3 = 6).
    expect(legacySeconds(seen), [60, 60, 60]);
  });

  test('a failed legacy push is reported, so the session is queued', () async {
    final seen = <http.Request>[];
    final old = server('https://old.example', seen, play: 503);
    await begin();
    await LocalSessionService()
        .accrue(progressKey: 'book-1', seconds: 60, currentTime: 60);

    expect(await LocalSessionService().pushActive(api: old), isFalse);
    await LocalSessionService().finalizeActive(pushed: false);
    expect(await ScopedPrefs.getStringList('local_session_pending'), hasLength(1));
  });

  test('one old server does not send other servers down the legacy path',
      () async {
    final oldSeen = <http.Request>[];
    final newSeen = <http.Request>[];
    final old = server('https://old.example', oldSeen);
    final current = server('https://new.example', newSeen, local: 200);
    await begin();
    await LocalSessionService().accrue(
        progressKey: 'book-1', seconds: 60, currentTime: 60, api: old);
    expect(legacySeconds(oldSeen), [60]);

    await LocalSessionService().accrue(
        progressKey: 'book-1', seconds: 30, currentTime: 90, api: current);

    expect(newSeen.where((r) => r.url.path.endsWith('/play')), isEmpty);
    final upsert =
        newSeen.singleWhere((r) => r.url.path == '/api/session/local');
    // The 60 s the old server's /play already took isn't sent again.
    expect((jsonDecode(upsert.body) as Map)['timeListening'], 30);
  });
}
