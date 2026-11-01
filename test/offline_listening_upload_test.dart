import 'dart:convert';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/progress_sync_service.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Banked offline listening goes up as an idempotent local session: no
/// fresh /play session (that closed the live stream's), and a retry after a
/// lost reply resends the same session id instead of crediting twice.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const item = 'ledger-book';

  ApiService api(Future<http.Response> Function(http.Request r) handler) =>
      ApiService(
        baseUrl: 'https://audiobookshelf.example',
        token: 'fixture-token',
        httpClient: MockClient(handler),
      );

  /// Answers the progress read and item lookup; [session] handles the rest.
  Future<http.Response> Function(http.Request) server(
    List<http.Request> seen,
    Future<http.Response> Function(http.Request r) session,
  ) =>
      (request) async {
        seen.add(request);
        final path = request.url.path;
        if (path == '/api/me/progress/$item') {
          return http.Response(
              jsonEncode({'currentTime': 5, 'lastUpdate': 1}), 200);
        }
        if (path == '/api/items/$item') {
          return http.Response(jsonEncode({'media': {'duration': 3600}}), 200);
        }
        return session(request);
      };

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await ScopedPrefs.setString('progress_$item',
        jsonEncode({'currentTime': 600, 'duration': 3600, 'timestamp': 1}));
  });

  test('sends the ledger as a local session, never through /play', () async {
    final seen = <http.Request>[];
    final sync = ProgressSyncService();
    await sync.addOfflineListeningTime(item, 120);

    await sync.flushOfflineListeningTime(
        api: api(server(seen, (r) async => http.Response('{}', 200))));

    expect(seen.where((r) => r.url.path.endsWith('/play')), isEmpty);
    final posts =
        seen.where((r) => r.url.path == '/api/session/local').toList();
    expect(posts, hasLength(1));
    final body = jsonDecode(posts.single.body) as Map<String, dynamic>;
    expect(body['libraryItemId'], item);
    expect(body['timeListening'], 120);
    expect(body['currentTime'], 600);
    expect(body['playMethod'], 0);
    expect(body['id'], isA<String>());
    expect(await ScopedPrefs.getInt('offline_listening_$item'), isNull);
    expect(await ScopedPrefs.getStringList('pending_offline_listening'),
        isNot(contains(item)));
    expect(await ScopedPrefs.getString('offline_ledger_session_$item'), isNull);
  });

  test('a lost reply is resent under the same id with the running total',
      () async {
    final seen = <http.Request>[];
    final sync = ProgressSyncService();
    await sync.addOfflineListeningTime(item, 120);

    // The server applied it, but the reply never arrived.
    await sync.flushOfflineListeningTime(
        api: api(server(
            seen, (r) async => throw http.ClientException('timed out'))));
    expect(await ScopedPrefs.getInt('offline_listening_$item'), 120);

    await sync.addOfflineListeningTime(item, 60);
    await sync.flushOfflineListeningTime(
        api: api(server(seen, (r) async => http.Response('{}', 200))));

    final bodies = [
      for (final r in seen.where((r) => r.url.path == '/api/session/local'))
        jsonDecode(r.body) as Map<String, dynamic>,
    ];
    expect(bodies, hasLength(2));
    expect(bodies[1]['id'], bodies[0]['id']);
    // An upsert of the total, so the server ends at 180 s, not 300 s.
    expect(bodies[1]['timeListening'], 180);
    expect(await ScopedPrefs.getInt('offline_listening_$item'), isNull);
  });

  test('time banked after a sent session goes up under a new id', () async {
    final seen = <http.Request>[];
    final sync = ProgressSyncService();
    final ok = api(server(seen, (r) async => http.Response('{}', 200)));

    await sync.addOfflineListeningTime(item, 120);
    await sync.flushOfflineListeningTime(api: ok);
    await sync.addOfflineListeningTime(item, 30);
    await sync.flushOfflineListeningTime(api: ok);

    final bodies = [
      for (final r in seen.where((r) => r.url.path == '/api/session/local'))
        jsonDecode(r.body) as Map<String, dynamic>,
    ];
    expect(bodies, hasLength(2));
    expect(bodies[1]['id'], isNot(bodies[0]['id']));
    expect(bodies[1]['timeListening'], 30);
  });

  test('an old server without /api/session/local falls back to /play',
      () async {
    final seen = <http.Request>[];
    final sync = ProgressSyncService();
    await sync.addOfflineListeningTime(item, 90);

    await sync.flushOfflineListeningTime(
        api: api(server(seen, (r) async {
      final path = r.url.path;
      if (path == '/api/session/local') return http.Response('', 404);
      if (path.endsWith('/play')) {
        return http.Response(jsonEncode({'id': 'play-1'}), 200);
      }
      return http.Response('{}', 200);
    })));

    final syncs =
        seen.where((r) => r.url.path == '/api/session/play-1/sync').toList();
    expect(syncs, hasLength(1));
    expect((jsonDecode(syncs.single.body) as Map)['timeListened'], 90);
    expect(seen.where((r) => r.url.path == '/api/session/play-1/close'),
        hasLength(1));
    expect(await ScopedPrefs.getInt('offline_listening_$item'), isNull);
  });
}
