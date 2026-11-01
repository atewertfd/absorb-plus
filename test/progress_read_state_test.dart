import 'dart:convert';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/progress_sync_service.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A failed progress read must not count as "the server has no progress":
/// that skipped last-write-wins and pushed an older place over a newer one.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  ApiService api(Future<http.Response> Function(http.Request r) handler) =>
      ApiService(
        baseUrl: 'https://audiobookshelf.example',
        token: 'fixture-token',
        httpClient: MockClient(handler),
      );

  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('readItemProgress', () {
    test('a row is known', () async {
      final read = await api((_) async => http.Response(
              jsonEncode({'currentTime': 7, 'lastUpdate': 1}), 200))
          .readItemProgress('book-1');
      expect(read.known, isTrue);
      expect(read.row?['currentTime'], 7);
    });

    test('a 404 is a known "no row"', () async {
      final read = await api((_) async => http.Response('Not found', 404))
          .readItemProgress('book-1');
      expect(read.known, isTrue);
      expect(read.row, isNull);
    });

    for (final status in [500, 502, 503]) {
      test('a $status is unknown', () async {
        final read = await api((_) async => http.Response('bad gateway', status))
            .readItemProgress('book-1');
        expect(read.known, isFalse);
        expect(read.row, isNull);
      });
    }

    test('a broken body or a failed request is unknown', () async {
      expect(
          (await api((_) async => http.Response('<html>', 200))
                  .readItemProgress('book-1'))
              .known,
          isFalse);
      expect(
          (await api((_) async => throw http.ClientException('offline'))
                  .readItemProgress('book-1'))
              .known,
          isFalse);
    });
  });

  test('a failed read keeps the position queued and pushes nothing', () async {
    final service = ProgressSyncService();
    var patches = 0;
    final server = api((request) async {
      if (request.method == 'GET' &&
          request.url.path == '/api/me/progress/read-fails') {
        return http.Response('bad gateway', 502);
      }
      if (request.method == 'PATCH') patches++;
      return http.Response('{}', 200);
    });

    await service.saveLocal(
        itemId: 'read-fails', currentTime: 42, duration: 90, speed: 1);
    await service.flushPendingSync(api: server);

    expect(patches, 0);
    expect(await service.hasPendingSync('read-fails'), isTrue);
  });

  test('a failed read keeps offline listening and opens no session', () async {
    final service = ProgressSyncService();
    var sessionCalls = 0;
    final server = api((request) async {
      if (request.url.path.startsWith('/api/me/progress/')) {
        return http.Response('bad gateway', 502);
      }
      if (request.url.path.startsWith('/api/session') ||
          request.url.path.endsWith('/play')) {
        sessionCalls++;
      }
      return http.Response('{}', 200);
    });

    await ScopedPrefs.setString(
        'progress_ledger-book',
        jsonEncode({'currentTime': 10, 'duration': 3600, 'timestamp': 1}));
    await service.addOfflineListeningTime('ledger-book', 120);
    await service.flushOfflineListeningTime(api: server);

    expect(sessionCalls, 0);
    expect(await ScopedPrefs.getInt('offline_listening_ledger-book'), 120);
    expect(await ScopedPrefs.getStringList('pending_offline_listening'),
        contains('ledger-book'));
  });
}
