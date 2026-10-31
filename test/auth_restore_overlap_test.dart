// Launch-time session restore (AuthProvider.tryRestoreSession) against a
// fake server: authorize overlaps the ping when no local address is set,
// the version from authorize is reused, and offline behaves as before.
import 'dart:async';
import 'dart:convert';

import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/utils/keep_alive_client.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _remote = 'https://abs.example';
const _local = 'http://192.168.1.20:13378';

Map<String, dynamic> _authorizeBody({bool withVersion = true}) => {
  'user': {'id': 'u1', 'username': 'reader', 'type': 'user'},
  'userDefaultLibraryId': 'lib1',
  'serverSettings': {if (withVersion) 'version': '2.30.0'},
  'ereaderDevices': <Object>[],
};

/// A fake Audiobookshelf server that records what was asked of it.
class _FakeServer {
  _FakeServer({
    this.reachable = true,
    this.authorizeOk = true,
    this.authorizeHasVersion = true,
    this.localReachable = false,
    bool? pingOk,
    this.authorizeStatus = 200,
  }) : pingOk = pingOk ?? true;

  final bool reachable;
  final bool authorizeOk;
  final bool authorizeHasVersion;
  final bool localReachable;
  final bool pingOk;
  final int authorizeStatus;

  /// Holds every `/ping` answer until completed (null: answer at once).
  Completer<void>? holdPing;
  final requests = <String>[];

  late final client = MockClient((request) async {
    final origin = request.url.origin;
    final path = request.url.path;
    requests.add('${request.method} $origin$path');
    final up = origin == _local ? localReachable : reachable;
    if (path == '/ping' && holdPing != null) await holdPing!.future;
    if (!up) throw http.ClientException('Connection refused', request.url);
    switch (path) {
      case '/ping':
        return pingOk
            ? http.Response('{"success":true}', 200)
            : http.Response('blocked', 502);
      case '/api/authorize':
        if (authorizeStatus != 200) return http.Response('no', authorizeStatus);
        return authorizeOk
            ? http.Response(
                jsonEncode(_authorizeBody(withVersion: authorizeHasVersion)),
                200,
              )
            : http.Response('oops', 500);
      case '/api/me':
        return http.Response(
          jsonEncode({'id': 'u1', 'username': 'reader', 'type': 'user'}),
          200,
        );
      case '/auth/refresh':
        return http.Response('{"error":"expired"}', 401);
      case '/status':
        return http.Response('{"serverVersion":"2.30.0"}', 200);
    }
    return http.Response('not found', 404);
  });

  int count(String what) => requests.where((r) => r.endsWith(what)).length;
}

/// The client every request goes through: the shared keep-alive client and
/// plain `http.get` both forward to the current test's server.
class _Forward extends http.BaseClient {
  static _FakeServer? server;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) =>
      server!.client.send(request);
}

Future<AuthProvider> _restore(
  _FakeServer server, {
  bool localServer = false,
  Duration settle = const Duration(milliseconds: 50),
}) async {
  _Forward.server = server;
  final auth = AuthProvider();
  await http.runWithClient(() async {
    if (localServer) {
      await auth.setLocalServerConfig(enabled: true, url: _local);
    }
    await auth.tryRestoreSession();
    // Let fire-and-forget requests (the /status fallback) go out.
    await Future<void>.delayed(settle);
  }, _Forward.new);
  return auth;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => debugKeepAliveClientFactory = _Forward.new);
  tearDownAll(() => debugKeepAliveClientFactory = null);

  setUp(() {
    SharedPreferences.setMockInitialValues({
      'server_url': _remote,
      'token': 'access-token',
      'refresh_token': 'refresh-token',
      'username': 'reader',
    });
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('dev.fluttercommunity.plus/connectivity'),
          (call) async => ['wifi'],
        );
  });

  test(
    'reachable: signs in without waiting for the ping, no /status',
    () async {
      final server = _FakeServer()..holdPing = Completer<void>();
      final auth = await _restore(server);

      expect(auth.isAuthenticated, isTrue);
      expect(auth.serverReachable, isTrue);
      expect(auth.userJson?['id'], 'u1');
      expect(auth.defaultLibraryId, 'lib1');
      expect(auth.serverVersion, '2.30.0');
      expect(server.count('$_remote/api/authorize'), 1);
      expect(
        server.count('/status'),
        0,
        reason: 'authorize already carried the version',
      );
      expect(server.count('/api/me'), 0);
      server.holdPing!.complete();
    },
  );

  test(
    'unreachable: opens offline with the saved session, as before',
    () async {
      final server = _FakeServer(reachable: false);
      final auth = await _restore(server);

      expect(
        auth.isAuthenticated,
        isTrue,
        reason: 'offline mode keeps the token',
      );
      expect(auth.serverReachable, isFalse);
      expect(auth.userJson, isNull);
      expect(server.count('/api/me'), 0);
      expect(server.count('/status'), 0);
    },
  );

  test(
    'authorize fails on a reachable server: falls back to /api/me',
    () async {
      final server = _FakeServer(authorizeOk: false);
      final auth = await _restore(server);

      expect(auth.serverReachable, isTrue);
      expect(auth.userJson?['id'], 'u1');
      expect(server.count('/api/me'), 1);
      expect(server.count('/status'), 1, reason: 'no version from authorize');
    },
  );

  test('authorize without a version still asks /status', () async {
    final server = _FakeServer(authorizeHasVersion: false);
    final auth = await _restore(server);

    expect(auth.serverReachable, isTrue);
    expect(server.count('/status'), 1);
    expect(auth.serverVersion, '2.30.0');
  });

  test(
    'local server set: pings first, then authorizes on the local address',
    () async {
      final server = _FakeServer(localReachable: true);
      final auth = await _restore(server, localServer: true);

      expect(auth.serverReachable, isTrue);
      expect(auth.useLocalServer, isTrue);
      final firstAuthorize = server.requests.indexWhere(
        (r) => r.endsWith('/api/authorize'),
      );
      final localPing = server.requests.indexOf('GET $_local/ping');
      expect(localPing, greaterThanOrEqualTo(0));
      expect(
        firstAuthorize,
        greaterThan(localPing),
        reason: 'the address is chosen before authorize goes out',
      );
      expect(server.requests[firstAuthorize], 'POST $_local/api/authorize');
      expect(server.count('/api/authorize'), 1);
    },
  );

  test(
    'ping fails but authorize is turned away: no sign-out while offline',
    () async {
      final server = _FakeServer(pingOk: false, authorizeStatus: 401);
      final auth = await _restore(server, settle: const Duration(seconds: 2));

      expect(auth.serverReachable, isFalse);
      expect(
        server.count('/auth/refresh'),
        greaterThan(0),
        reason: 'authorize did run and its refresh was rejected',
      );
      expect(
        auth.isAuthenticated,
        isTrue,
        reason:
            'before, an unreachable launch never sent authorize, so the '
            'session stays until the server is reachable again',
      );
    },
  );

  test('reachable and the session is dead: signs out, as before', () async {
    final server = _FakeServer(authorizeStatus: 401);
    final auth = await _restore(server, settle: const Duration(seconds: 2));

    expect(auth.isAuthenticated, isFalse);
  });
}
