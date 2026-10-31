import 'dart:convert';

import 'package:absorb/services/admin_dashboard_data.dart';
import 'package:absorb/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

ApiService _api(MockClientHandler handler) => ApiService(
      baseUrl: 'http://abs.test',
      token: 'test-token',
      httpClient: MockClient(handler),
      networkRetryDelay: Duration.zero,
      refreshRetryDelay: Duration.zero,
    );

void main() {
  group('getOpenSessions', () {
    test('reads GET /api/sessions/open', () async {
      final paths = <String>[];
      final api = _api((r) async {
        paths.add('${r.method} ${r.url.path}');
        return http.Response(
          jsonEncode({
            'sessions': [
              {'id': 's1', 'userId': 'u1', 'displayTitle': 'Book', 'user': {'id': 'u1', 'username': 'ann'}},
              'not a map',
            ],
            'shareSessions': [],
          }),
          200,
        );
      });
      final sessions = await api.getOpenSessions();
      expect(paths, ['GET /api/sessions/open']);
      expect(sessions, hasLength(1));
      expect(sessions!.single['displayTitle'], 'Book');
    });

    test('a refused or broken answer is null, not "nobody listening"', () async {
      expect(await _api((_) async => http.Response('Not Found', 404)).getOpenSessions(), isNull);
      expect(await _api((_) async => http.Response('<html>', 200)).getOpenSessions(), isNull);
      expect(await _api((_) async => http.Response('{}', 200)).getOpenSessions(), isEmpty);
    });
  });

  group('adminDeviceLabel', () {
    test('client and device name', () {
      expect(adminDeviceLabel({'clientName': 'Absorb', 'deviceName': 'Pixel 8'}), 'Absorb · Pixel 8');
    });
    test('falls back to maker and model, without repeating the maker', () {
      expect(adminDeviceLabel({'clientName': 'Abs Android', 'manufacturer': 'Google', 'model': 'Pixel 8'}),
          'Abs Android · Google Pixel 8');
      expect(adminDeviceLabel({'manufacturer': 'Samsung', 'model': 'Samsung Galaxy'}), 'Samsung Galaxy');
    });
    test('falls back to browser on OS', () {
      expect(adminDeviceLabel({'clientName': 'Abs Web', 'browserName': 'Firefox', 'osName': 'Windows'}),
          'Abs Web · Firefox on Windows');
    });
    test('nothing useful is empty', () {
      expect(adminDeviceLabel(null), '');
      expect(adminDeviceLabel({}), '');
      expect(adminDeviceLabel({'clientName': 'X', 'deviceName': 'X'}), 'X');
    });
  });

  test('AdminListener reads a session and finds the user name', () {
    final s = AdminListener.fromSession({
      'id': 's1',
      'userId': 'u2',
      'displayTitle': 'The Book',
      'displayAuthor': 'Author',
      'currentTime': 30,
      'duration': 120,
      'deviceInfo': {'clientName': 'Absorb', 'deviceName': 'Phone'},
    }, users: [
      {'id': 'u1', 'username': 'ann'},
      {'id': 'u2', 'username': 'bob'},
    ]);
    expect(s.userName, 'bob');
    expect(s.title, 'The Book');
    expect(s.device, 'Absorb · Phone');
    expect(s.progress, 0.25);
    expect(AdminListener.fromSession({'duration': 0}).progress, 0);
  });

  group('AdminUserSummary', () {
    test('main permissions, online and last seen', () {
      final u = AdminUserSummary.fromJson({
        'id': 'u1',
        'username': 'ann',
        'type': 'user',
        'lastSeen': 1700000000000,
        'permissions': {'download': true, 'update': false, 'delete': false, 'upload': true, 'accessAllLibraries': true},
      }, onlineIds: {'u1'});
      expect(u.online, isTrue);
      expect(u.lastSeen, DateTime.fromMillisecondsSinceEpoch(1700000000000));
      expect([u.canDownload, u.canUpdate, u.canDelete, u.canUpload, u.allLibraries], [true, false, false, true, true]);
      expect(u.isAdmin, isFalse);
    });

    test('admins have every permission whatever the stored flags say', () {
      final u = AdminUserSummary.fromJson({'id': 'r', 'username': 'root', 'type': 'root', 'permissions': {}});
      expect([u.canDownload, u.canUpdate, u.canDelete, u.canUpload, u.allLibraries], everyElement(isTrue));
      expect(u.lastSeen, isNull);
    });

    test('sorts online first, then most recently seen, then by name', () {
      AdminUserSummary make(String name, {int? seen, bool online = false}) => AdminUserSummary.fromJson(
            {'id': name, 'username': name, 'lastSeen': seen},
            onlineIds: online ? {name} : {},
          );
      final list = [make('zed', seen: 1), make('amy'), make('bob', seen: 5), make('cat', online: true)]
        ..sort(AdminUserSummary.compare);
      expect(list.map((u) => u.username), ['cat', 'bob', 'zed', 'amy']);
    });
  });

  test('adminRecentProblems keeps warnings and errors, newest first', () {
    final logs = [
      for (var i = 0; i < 10; i++)
        {'timestamp': '2026-10-30 10:0$i:00.000', 'level': i.isEven ? 3 : 2, 'levelName': i.isEven ? 'WARN' : 'INFO', 'message': 'line $i'},
      {'timestamp': '2026-10-30 11:00:00.000', 'level': 4, 'levelName': 'ERROR', 'message': 'broke\n  badly'},
      {'timestamp': '2026-10-30 11:01:00.000', 'level': 6, 'levelName': 'NOTE', 'message': 'note'},
      {'timestamp': '2026-10-30 11:02:00.000', 'level': 1, 'levelName': 'DEBUG', 'message': 'debug'},
    ];
    final problems = adminRecentProblems(logs, limit: 3);
    expect(problems.map((p) => p.message), ['broke badly', 'line 8', 'line 6']);
    expect(problems.first.isError, isTrue);
    expect(problems.first.time, '11:00');
    expect(problems[1].isError, isFalse);
    expect(adminRecentProblems(const []), isEmpty);
  });

  test('adminLatestBackup picks the newest createdAt', () {
    expect(adminLatestBackup(const []), isNull);
    expect(
      adminLatestBackup([
        {'createdAt': 10},
        {'createdAt': 30},
        {'createdAt': 20},
        'junk',
      ]),
      DateTime.fromMillisecondsSinceEpoch(30),
    );
  });
}
