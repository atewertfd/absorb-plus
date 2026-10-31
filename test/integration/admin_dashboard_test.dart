// The admin dashboard's data calls against the throwaway server: the
// read-only endpoints it shows, an open playback session showing up in
// "Listening now", and a library scan. Never a real server.
// Run with .\tool\dev.ps1 itest (see abs_test_server.dart).
@Tags(['abs-server'])
library;

import 'package:absorb/services/admin_dashboard_data.dart';
import 'package:absorb/services/api_service.dart'; // getOpenSessions (abs_admin_api.dart)
import 'package:flutter_test/flutter_test.dart';

import 'abs_test_server.dart';

void main() {
  test('admin dashboard: users, online, libraries, stats, backups, logs', () async {
    final server = await AbsTestServer.orSkip();
    if (server == null) return;
    final source = ApiAdminDashboardSource(await server.api());

    final users = (await source.users()).cast<Map<String, dynamic>>();
    final root = users.firstWhere((u) => u['type'] == 'root', orElse: () => fail('no root user'));
    final summary = AdminUserSummary.fromJson(root);
    expect(summary.username, isNotEmpty);
    expect(summary.canDelete, isTrue, reason: 'root has every permission');
    final listener = users.where((u) => u['type'] == 'user');
    expect(listener, isNotEmpty, reason: 'seed creates a second, non-admin user');
    expect((listener.first['permissions'] as Map).containsKey('download'), isTrue);

    expect(await source.onlineUsers(), isA<List<dynamic>>());

    final libs = (await source.libraries()).cast<Map<String, dynamic>>();
    final lib = libs.firstWhere((l) => l['name'] == testLibraryName,
        orElse: () => fail('library "$testLibraryName" missing: run dev.ps1 server seed'));
    final stats = await source.libraryStats(lib['id'] as String);
    expect((stats?['totalItems'] as num?)?.toInt(), greaterThanOrEqualTo(3));

    expect(await source.backups(), isA<List<dynamic>>());

    final logs = await source.serverLogs();
    expect(logs, isNotNull, reason: 'GET /api/logger-data');
    expect(logs, isNotEmpty);
    expect(logs!.first.keys, containsAll(['timestamp', 'level', 'levelName', 'message']));
    // Whatever the log holds, picking problems out of it must not throw.
    adminRecentProblems(logs);
  });

  test('admin dashboard: an open playback session shows in Listening now', () async {
    final server = await AbsTestServer.orSkip();
    if (server == null) return;
    final api = await server.api();
    final book = await server.book(api, chapteredBookTitle);
    final session = await api.startPlaybackSession(book['id'] as String);
    expect(session, isNotNull, reason: 'POST /api/items/:id/play');
    final sessionId = session!['id'] as String;
    try {
      final open = await api.getOpenSessions();
      expect(open, isNotNull, reason: 'GET /api/sessions/open');
      final mine = open!.firstWhere((s) => s['id'] == sessionId,
          orElse: () => fail('the new session is not in /api/sessions/open'));
      final row = AdminListener.fromSession(mine);
      expect(row.userName, server.username);
      expect(row.title, chapteredBookTitle);
      expect(row.device, isNotEmpty, reason: 'deviceInfo gives a label');
    } finally {
      await api.closePlaybackSession(sessionId);
    }
    final after = await api.getOpenSessions();
    expect(after?.where((s) => s['id'] == sessionId), isEmpty, reason: 'closed sessions leave the list');
  });

  test('admin dashboard: Scan is accepted and the scan completes', () async {
    final server = await AbsTestServer.orSkip();
    if (server == null) return;
    final api = await server.api();
    final source = ApiAdminDashboardSource(api);
    final lib = await server.testLibrary(api);

    int scansCompleted(List<Map<String, dynamic>>? logs) =>
        (logs ?? const []).where((l) => '${l['message']}'.contains('Scan complete')).length;
    final before = scansCompleted(await source.serverLogs());

    expect(await source.scanLibrary(lib['id'] as String), isTrue,
        reason: 'POST /api/libraries/:id/scan answers 200');

    // The server logs "[LibraryController] Scan complete" when it is done.
    final done = await eventually(() async {
      final n = scansCompleted(await source.serverLogs());
      return n > before ? n : null;
    });
    expect(done, isNotNull, reason: 'the scan finished on the server');
    final stats = await source.libraryStats(lib['id'] as String);
    expect((stats?['totalItems'] as num?)?.toInt(), greaterThanOrEqualTo(3), reason: 'a rescan keeps the books');
  });
}
