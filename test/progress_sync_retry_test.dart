import 'dart:convert';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/progress_sync_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// After ten failed flushes the queue used to wait for a connectivity
/// change that a desktop never sees, so a server back from a long outage
/// got nothing until a manual refresh. It now keeps retrying at the cap.
void main() {
  testWidgets('a long outage keeps retrying at the capped delay',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final sync = ProgressSyncService();
    var patches = 0;
    var down = true;
    final api = ApiService(
      baseUrl: 'https://audiobookshelf.example',
      token: 'fixture-token',
      httpClient: MockClient((request) async {
        if (request.method == 'GET' &&
            request.url.path == '/api/me/progress/outage-book') {
          return http.Response(jsonEncode({'currentTime': 1, 'lastUpdate': 1}), 200);
        }
        if (request.method == 'PATCH') {
          patches++;
          return http.Response('down', down ? 503 : 200);
        }
        return http.Response(jsonEncode({'media': {'duration': 100}}), 200);
      }),
    );

    await sync.saveLocal(
        itemId: 'outage-book', currentTime: 42, duration: 100, speed: 1);
    await sync.flushPendingSync(api: api);

    // Two hours of outage: well past the ten failures that used to end it.
    for (var minute = 0; minute < 120; minute++) {
      await tester.pump(const Duration(minutes: 1));
    }
    expect(patches, greaterThan(20));
    expect(await sync.hasPendingSync('outage-book'), isTrue);

    // The server comes back and the next capped retry lands it.
    down = false;
    for (var minute = 0; minute < 6; minute++) {
      await tester.pump(const Duration(minutes: 1));
    }
    expect(await sync.hasPendingSync('outage-book'), isFalse);

    sync.dispose();
  });
}
