import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/admin_dashboard_screen.dart';
import 'dart:convert';

import 'package:absorb/services/admin_dashboard_data.dart';
import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/server_task_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

/// In-memory server for the dashboard. Records every call.
class FakeAdminSource implements AdminDashboardSource {
  FakeAdminSource({
    this.sessions = const [],
    this.online = const [],
    this.userList = const [],
    this.libraryList = const [],
    this.stats = const {},
    this.backupList = const [],
    this.logs = const [],
    this.scanOk = true,
    this.backupOk = true,
  });

  List<Map<String, dynamic>>? sessions;
  List<dynamic> online;
  List<dynamic> userList;
  List<dynamic> libraryList;
  Map<String, int> stats;
  List<dynamic> backupList;
  List<Map<String, dynamic>>? logs;
  bool scanOk;
  bool backupOk;

  /// What GET /api/backups answers after a backup (null: same list).
  List<dynamic>? backupsAfterCreate;

  final calls = <String>[];

  @override
  Future<List<Map<String, dynamic>>?> openSessions() async {
    calls.add('sessions');
    return sessions;
  }

  @override
  Future<List<dynamic>> onlineUsers() async => online;
  @override
  Future<List<dynamic>> users() async => userList;
  @override
  Future<List<dynamic>> libraries() async => libraryList;
  @override
  Future<Map<String, dynamic>?> libraryStats(String id) async =>
      stats.containsKey(id) ? {'totalItems': stats[id]} : null;
  @override
  Future<List<dynamic>> backups() async => backupList;
  @override
  Future<List<Map<String, dynamic>>?> serverLogs() async => logs;

  @override
  Future<bool> scanLibrary(String id) async {
    calls.add('scan $id');
    return scanOk;
  }

  @override
  Future<bool> createBackup() async {
    calls.add('backup');
    if (backupOk && backupsAfterCreate != null) backupList = backupsAfterCreate!;
    return backupOk;
  }
}

FakeAdminSource sampleSource() => FakeAdminSource(
      sessions: [
        {
          'id': 's1',
          'userId': 'u2',
          'displayTitle': 'The Long Walk Home',
          'currentTime': 60,
          'duration': 600,
          'user': {'id': 'u2', 'username': 'bob'},
          'deviceInfo': {'clientName': 'Absorb', 'deviceName': 'Pixel 8'},
        },
      ],
      online: [
        {'id': 'u1', 'username': 'admin'},
      ],
      userList: [
        {
          'id': 'u1',
          'username': 'admin',
          'type': 'root',
          'lastSeen': DateTime.now().millisecondsSinceEpoch,
          'permissions': {},
        },
        {
          'id': 'u2',
          'username': 'bob',
          'type': 'user',
          'lastSeen': DateTime.now().millisecondsSinceEpoch,
          'permissions': {'download': true},
        },
        {
          'id': 'u3',
          'username': 'carol',
          'type': 'user',
          'isActive': false,
          'permissions': {},
        },
      ],
      libraryList: [
        {'id': 'lib1', 'name': 'Audiobooks', 'mediaType': 'book'},
        {'id': 'lib2', 'name': 'Podcasts', 'mediaType': 'podcast'},
      ],
      stats: {'lib1': 42, 'lib2': 1},
      backupList: [
        {'createdAt': DateTime.now().subtract(const Duration(days: 2)).millisecondsSinceEpoch},
      ],
      logs: [
        {'timestamp': '2026-10-30 09:00:00.000', 'level': 2, 'levelName': 'INFO', 'message': 'all fine'},
        {'timestamp': '2026-10-30 09:30:00.000', 'level': 3, 'levelName': 'WARN', 'message': 'Cover not found'},
        {'timestamp': '2026-10-30 10:00:00.000', 'level': 4, 'levelName': 'ERROR', 'message': 'Scan failed for folder'},
      ],
    );

Future<void> pumpDashboard(
  WidgetTester tester,
  FakeAdminSource source, {
  Duration liveInterval = const Duration(seconds: 10),
  Size size = const Size(390, 1400),
  ServerTaskTracker? taskTracker,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: AdminDashboardScreen(
      source: source,
      serverVersion: '2.37.2',
      liveInterval: liveInterval,
      taskTracker: taskTracker,
    ),
  ));
  // Fixed pumps, not pumpAndSettle: a "Scanning..." spinner never settles.
  for (var i = 0; i < 10; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

/// Lets any toast finish and tears the screen down so no timer is left.
Future<void> finish(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 3));
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('shows listeners, libraries, server, users and warnings', (tester) async {
    await pumpDashboard(tester, sampleSource());

    expect(find.text('The Long Walk Home'), findsOneWidget);
    expect(find.text('bob · Absorb · Pixel 8'), findsOneWidget);
    expect(find.text('Online: admin'), findsOneWidget);

    expect(find.text('42 items'), findsOneWidget);
    expect(find.text('1 item'), findsOneWidget);

    expect(find.text('2.37.2'), findsOneWidget);
    expect(find.textContaining('Last backup 2d ago'), findsOneWidget);

    // bob has an open session, so he counts as online; carol is disabled.
    expect(find.text('Online'), findsNWidgets(2));
    expect(find.text('Disabled'), findsOneWidget);

    expect(find.text('Scan failed for folder'), findsOneWidget);
    expect(find.text('Cover not found'), findsOneWidget);
    expect(find.text('all fine'), findsNothing);
    await finish(tester);
  });

  testWidgets('empty and failed loads say so', (tester) async {
    final source = sampleSource()
      ..sessions = []
      ..online = []
      ..logs = null
      ..backupList = [];
    await pumpDashboard(tester, source);
    expect(find.text('Nobody is listening right now'), findsOneWidget);
    expect(find.text("Couldn't load this from the server"), findsOneWidget);
    expect(find.text('No backups yet'), findsOneWidget);

    source
      ..sessions = null
      ..logs = [];
    await tester.tap(find.byTooltip('Refresh'));
    await tester.pumpAndSettle();
    expect(find.text("Couldn't load this from the server"), findsOneWidget);
    expect(find.text("No warnings or errors in today's log"), findsOneWidget);
    await finish(tester);
  });

  testWidgets('Scan starts one library and reports what the server said', (tester) async {
    final source = sampleSource();
    await pumpDashboard(tester, source);
    await tester.tap(find.text('Scan').first);
    await tester.pump();
    expect(source.calls, contains('scan lib1'));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Scan started for Audiobooks'), findsOneWidget);
    await finish(tester);

    final failing = sampleSource()..scanOk = false;
    await pumpDashboard(tester, failing);
    await tester.tap(find.text('Scan').first);
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Failed to scan Audiobooks'), findsOneWidget);
    expect(find.text('Scan started for Audiobooks'), findsNothing);
    await finish(tester);
  });

  testWidgets('Scan all asks first and does nothing on cancel', (tester) async {
    final source = sampleSource();
    await pumpDashboard(tester, source);

    await tester.tap(find.text('Scan all'));
    await tester.pumpAndSettle();
    expect(find.text('Scan all libraries?'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(source.calls.where((c) => c.startsWith('scan')), isEmpty);

    await tester.tap(find.text('Scan all'));
    await tester.pumpAndSettle();
    await tester.tap(find.descendant(of: find.byType(AlertDialog), matching: find.text('Scan all')));
    await tester.pump(const Duration(milliseconds: 300));
    expect(source.calls.where((c) => c.startsWith('scan')), ['scan lib1', 'scan lib2']);
    expect(find.text('Scan started for 2 libraries'), findsOneWidget);
    await finish(tester);
  });

  testWidgets('Back up now shows success only when the server agreed', (tester) async {
    final source = sampleSource()..backupOk = false;
    await pumpDashboard(tester, source);
    await tester.tap(find.text('Back up now'));
    await tester.pump(const Duration(milliseconds: 300));
    expect(source.calls, contains('backup'));
    expect(find.text('Backup failed'), findsOneWidget);
    expect(find.text('Backup created'), findsNothing);
    await finish(tester);
  });

  testWidgets('Listening now refreshes on its own while shown', (tester) async {
    final source = sampleSource();
    await pumpDashboard(tester, source, liveInterval: const Duration(seconds: 1));
    final before = source.calls.where((c) => c == 'sessions').length;
    source.sessions = [];
    await tester.pump(const Duration(seconds: 1));
    await tester.pump();
    expect(source.calls.where((c) => c == 'sessions').length, before + 1);
    expect(find.text('Nobody is listening right now'), findsOneWidget);
    await finish(tester);
  });

  testWidgets('wide windows use two columns', (tester) async {
    await pumpDashboard(tester, sampleSource(), size: const Size(1280, 900));
    final listening = tester.getTopLeft(find.byKey(const ValueKey('admin-dash-listening')));
    final users = tester.getTopLeft(find.byKey(const ValueKey('admin-dash-users')));
    expect(users.dx, greaterThan(listening.dx));
    expect(users.dy, listening.dy);
    await finish(tester);
  });

  testWidgets('a started scan keeps showing until the server confirms or a grace period ends', (tester) async {
    final source = sampleSource()..libraryList = [
      {'id': 'lib1', 'name': 'Audiobooks', 'mediaType': 'book'},
    ];
    await pumpDashboard(tester, source);
    await tester.tap(find.text('Scan'));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Scanning...'), findsOneWidget);
    expect(find.text('Scan'), findsNothing);
    await tester.pump(const Duration(seconds: 7));
    expect(find.text('Scan'), findsOneWidget);
    await finish(tester);
  });

  testWidgets('a shared task tracker shows scans running on the server', (tester) async {
    final tracker = ServerTaskTracker();
    addTearDown(tracker.dispose);
    final api = ApiService(
      baseUrl: 'http://abs.test',
      token: 'test-token',
      networkRetryDelay: Duration.zero,
      refreshRetryDelay: Duration.zero,
      httpClient: MockClient((r) async => r.url.path == '/api/tasks'
          ? http.Response(
              jsonEncode({
                'tasks': [
                  {
                    'id': 't1',
                    'action': 'library-scan',
                    'data': {'libraryId': 'lib1'},
                    'title': 'Scanning "Audiobooks"',
                    'isFinished': false,
                    'startedAt': 1,
                  },
                ],
              }),
              200,
            )
          : http.Response('Not Found', 404)),
    );
    await tracker.refresh(api);
    expect(tracker.isLibraryActionRunning('library-scan', 'lib1'), isTrue);

    await pumpDashboard(tester, sampleSource(), taskTracker: tracker);
    // lib1 is scanning on the server; lib2 still offers Scan.
    expect(find.text('Scanning...'), findsOneWidget);
    expect(find.text('Scan'), findsOneWidget);
    await finish(tester);
  });

  testWidgets('no live refresh while another page covers the dashboard', (tester) async {
    final source = sampleSource();
    await pumpDashboard(tester, source, liveInterval: const Duration(seconds: 1));
    int sessionCalls() => source.calls.where((c) => c == 'sessions').length;

    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    navigator.push(MaterialPageRoute<void>(builder: (_) => const Scaffold(body: Text('on top'))));
    await tester.pumpAndSettle();
    final covered = sessionCalls();
    await tester.pump(const Duration(seconds: 3));
    expect(sessionCalls(), covered, reason: 'covered: ticks are skipped');

    navigator.pop();
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));
    expect(sessionCalls(), greaterThan(covered), reason: 'visible again: refreshing resumes');
    await finish(tester);
  });

  testWidgets('no live refresh in the background, one refresh on resume', (tester) async {
    final source = sampleSource();
    await pumpDashboard(tester, source, liveInterval: const Duration(seconds: 1));
    int sessionCalls() => source.calls.where((c) => c == 'sessions').length;

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    final paused = sessionCalls();
    await tester.pump(const Duration(seconds: 3));
    expect(sessionCalls(), paused);

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    expect(sessionCalls(), paused + 1, reason: 'resume refreshes right away');
    await finish(tester);
  });

  testWidgets('a failed backup list refetch keeps the old list', (tester) async {
    final source = sampleSource()..backupsAfterCreate = [];
    await pumpDashboard(tester, source);
    await tester.tap(find.text('Back up now'));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Backup created'), findsOneWidget);
    expect(find.textContaining('Last backup 2d ago'), findsOneWidget);
    expect(find.text('No backups yet'), findsNothing);
    await finish(tester);
  });
}
