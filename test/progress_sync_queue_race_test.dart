import 'dart:convert';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/progress_sync_service.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The ebook queue and the offline listening ledger are changed by the
/// reader/player and by the flush at once; neither may write over the other.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));

  ApiService api(Future<http.Response> Function(http.Request r) handler) =>
      ApiService(
        baseUrl: 'https://audiobookshelf.example',
        token: 'fixture-token',
        httpClient: MockClient(handler),
      );

  test('a page queued while the flush sends an older one stays queued',
      () async {
    final sync = ProgressSyncService();
    final offline = api((_) async => http.Response('busy', 503));
    await sync.pushEbookProgress(offline, 'ebook-1',
        location: 'page-x', progress: 0.1);
    expect((await sync.getPendingEbookProgress())['ebook-1']?['loc'], 'page-x');

    await sync.flushPendingSync(api: api((request) async {
      if (request.method == 'PATCH' && request.body.contains('page-x')) {
        // The reader turns the page meanwhile and its PATCH fails.
        await Future<void>.delayed(const Duration(milliseconds: 5));
        await sync.pushEbookProgress(offline, 'ebook-1',
            location: 'page-y', progress: 0.2);
        return http.Response('{}', 200);
      }
      return http.Response('{}', 200);
    }));

    expect((await sync.getPendingEbookProgress())['ebook-1']?['loc'], 'page-y');
  });

  test('concurrent listening ticks all count', () async {
    final sync = ProgressSyncService();
    await Future.wait([
      for (var i = 0; i < 5; i++) sync.addOfflineListeningTime('ledger-1', 60),
    ]);
    expect(await ScopedPrefs.getInt('offline_listening_ledger-1'), 300);
    expect(await ScopedPrefs.getStringList('pending_offline_listening'),
        ['ledger-1']);
  });

  test('a tick during the flush keeps its seconds and its place on the list',
      () async {
    final sync = ProgressSyncService();
    await ScopedPrefs.setString('progress_ledger-2',
        jsonEncode({'currentTime': 10, 'duration': 3600, 'timestamp': 1}));
    await sync.addOfflineListeningTime('ledger-2', 120);

    Future<void>? tick;
    await sync.flushOfflineListeningTime(api: api((request) async {
      if (request.url.path == '/api/session/local') {
        // A tick lands while the server is answering.
        tick = sync.addOfflineListeningTime('ledger-2', 30);
      }
      return http.Response(
          jsonEncode({'currentTime': 0, 'media': {'duration': 3600}}), 200);
    }));
    await tick;

    expect(await ScopedPrefs.getInt('offline_listening_ledger-2'), 30);
    expect(await ScopedPrefs.getStringList('pending_offline_listening'),
        contains('ledger-2'));
  });
}
