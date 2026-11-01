import 'dart:convert';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/local_session_queue.dart';
import 'package:absorb/services/local_session_service.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// One queued reading session the server can't place must not keep the
/// rest of the local-session queue (and itself) re-uploading forever.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    LocalSessionService().debugReset();
  });
  tearDown(() => LocalSessionService().debugReset());

  Map<String, dynamic> audio(String id, String itemId) => {
        'id': id,
        'progressKey': itemId,
        'libraryItemId': itemId,
        'episodeId': null,
        'mediaType': 'book',
        'duration': 3600,
        'startTime': 0,
        'currentTime': 600,
        'timeListening': 600,
        'startedAt': 1,
        'updatedAt': 2,
        'date': '2026-10-29',
        'dayOfWeek': 'Thursday',
      };

  Map<String, dynamic> reading(String id, String itemId) => ApiService.readingSession(
        itemId,
        sessionId: id,
        startedAt: DateTime(2026, 10, 29, 9),
        seconds: 300,
        audioAt: 0,
        audioDuration: 0,
      );

  Future<List<Map<String, dynamic>>> queued() async => [
        for (final raw
            in await ScopedPrefs.getStringList('local_session_pending'))
          jsonDecode(raw) as Map<String, dynamic>,
      ];

  /// The reading book's progress read answers [readStatus]; everything else
  /// is taken.
  ApiService server(int readStatus, List<http.Request> seen) => ApiService(
        baseUrl: 'https://audiobookshelf.example',
        token: 'fixture-token',
        httpClient: MockClient((request) async {
          seen.add(request);
          if (request.url.path == '/api/me/progress/read-book') {
            return http.Response('nope', readStatus);
          }
          if (request.url.path == '/api/items/audio-book') {
            return http.Response(jsonEncode({'media': {'duration': 3600}}), 200);
          }
          return http.Response(jsonEncode({'results': []}), 200);
        }),
      );

  test('an accepted audio session leaves even when a reading one waits',
      () async {
    await LocalSessionService().queue(reading('r-1', 'read-book'));
    await LocalSessionService().queue(audio('a-1', 'audio-book'));
    final seen = <http.Request>[];

    await LocalSessionService().flushPending(api: server(404, seen));

    final left = await queued();
    expect(left.map((s) => s['id']), ['r-1']);
    expect(left.single['noRowTries'], 1);
    final batch = seen.singleWhere((r) => r.url.path == '/api/session/local-all');
    final sent = (jsonDecode(batch.body)['sessions'] as List).single as Map;
    expect(sent['id'], 'a-1');
  });

  test('a reading session with no progress row is given up on after '
      '$maxNoRowTries tries', () async {
    await LocalSessionService().queue(reading('r-1', 'read-book'));
    for (var i = 1; i < maxNoRowTries; i++) {
      await LocalSessionService().flushPending(api: server(404, []));
      expect((await queued()).single['noRowTries'], i);
    }
    await LocalSessionService().flushPending(api: server(404, []));
    expect(await queued(), isEmpty);
  });

  test('a failed progress read is not counted as a missing row', () async {
    await LocalSessionService().queue(reading('r-1', 'read-book'));

    await LocalSessionService().flushPending(api: server(502, []));

    final left = await queued();
    expect(left.map((s) => s['id']), ['r-1']);
    expect(left.single.containsKey('noRowTries'), isFalse);
  });

  test('an unreachable batch keeps the audio sessions queued', () async {
    await LocalSessionService().queue(reading('r-1', 'read-book'));
    await LocalSessionService().queue(audio('a-1', 'audio-book'));

    await LocalSessionService().flushPending(
      api: ApiService(
        baseUrl: 'https://audiobookshelf.example',
        token: 'fixture-token',
        httpClient: MockClient((request) async {
          if (request.url.path == '/api/me/progress/read-book') {
            return http.Response('nope', 404);
          }
          if (request.url.path == '/api/session/local-all') {
            throw http.ClientException('offline');
          }
          return http.Response('{}', 200);
        }),
      ),
    );

    expect((await queued()).map((s) => s['id']), ['r-1', 'a-1']);
  });
}
