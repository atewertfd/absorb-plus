// AuthProvider's session lifecycle against a fake server: what a password
// sign-in writes to prefs, that tryRestoreSession reads it back on the next
// launch, and what logout removes. No real server is contacted: every
// request goes through _Forward to an in-memory MockClient.
import 'dart:convert';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/main.dart' show rootNavigatorKey;
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/services/account_epoch.dart';
import 'package:absorb/services/player_settings.dart';
import 'package:absorb/services/user_account_service.dart';
import 'package:absorb/utils/keep_alive_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _server = 'https://abs.example';
const _other = 'https://other.example';

Map<String, dynamic> _user({bool modern = true, bool legacy = false}) => {
  'id': 'u1',
  'username': 'reader',
  'type': 'user',
  if (modern) 'accessToken': 'access-1',
  if (modern) 'refreshToken': 'refresh-1',
  if (legacy) 'token': 'legacy-1',
};

Map<String, dynamic> _loginBody({bool modern = true, bool legacy = false}) => {
  'user': _user(modern: modern, legacy: legacy),
  'userDefaultLibraryId': 'lib1',
  'serverSettings': {'version': '2.30.0'},
  'ereaderDevices': <Object>[],
};

/// A second account, listener@other.example, with its own tokens.
Map<String, dynamic> _otherBody() => {
  ..._loginBody(),
  'user': {
    ..._user(),
    'id': 'u2',
    'username': 'listener',
    'accessToken': 'access-2',
    'refreshToken': 'refresh-2',
  },
};

/// A fake Audiobookshelf server that records what was asked of it.
class _FakeServer {
  _FakeServer({
    this.reachable = true,
    this.loginStatus = 200,
    Map<String, dynamic>? loginBody,
  }) : loginBody = loginBody ?? _loginBody();

  final bool reachable;
  final int loginStatus;
  final Map<String, dynamic> loginBody;

  final requests = <http.Request>[];

  late final client = MockClient((request) async {
    requests.add(request);
    if (!reachable) {
      throw http.ClientException('Connection refused', request.url);
    }
    switch (request.url.path) {
      case '/ping':
        return http.Response('{"success":true}', 200);
      case '/login':
        if (loginStatus != 200) return http.Response('no', loginStatus);
        return http.Response(jsonEncode(loginBody), 200);
      case '/api/authorize':
        return http.Response(jsonEncode(_loginBody()), 200);
      case '/api/me':
        return http.Response(jsonEncode(_user(modern: false)), 200);
      case '/status':
        return http.Response('{"serverVersion":"2.30.0"}', 200);
    }
    return http.Response('not found', 404);
  });

  Iterable<http.Request> to(String path) =>
      requests.where((r) => r.url.path == path);
}

/// The client every request goes through: the shared keep-alive client and
/// plain `http.get`/`http.post` both forward to the current test's server.
class _Forward extends http.BaseClient {
  static _FakeServer? server;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) =>
      server!.client.send(request);
}

/// Runs [body] with every request going to [server], then lets
/// fire-and-forget requests go out.
Future<T> _with<T>(_FakeServer server, Future<T> Function() body) {
  _Forward.server = server;
  return http.runWithClient(() async {
    final result = await body();
    await Future<void>.delayed(const Duration(milliseconds: 50));
    return result;
  }, _Forward.new);
}

Future<bool> _login(
  AuthProvider auth,
  _FakeServer server, {
  String url = _server,
  Map<String, String> headers = const {},
}) => _with(
  server,
  () => auth.login(
    serverUrl: url,
    username: 'reader',
    password: 'secret',
    customHeaders: headers,
  ),
);

/// Fresh prefs, and the account singleton reloaded from them so saved
/// accounts from an earlier test don't leak in.
Future<void> _resetPrefs([Map<String, Object> values = const {}]) async {
  SharedPreferences.setMockInitialValues({'saved_accounts': '[]', ...values});
  await UserAccountService().init();
}

/// Prefs whose writes of chosen keys fail (throw, or report false) without
/// reaching the real store, the way a full disk or a failed commit would.
class _FailingPrefs implements SharedPreferences {
  _FailingPrefs(this._real, this._failing, {required this.reportFalse});

  final SharedPreferences _real;
  final Map<String, int> _failing;
  final bool reportFalse;

  Future<bool> _write(String key, Future<bool> Function() write) async {
    final left = _failing[key] ?? 0;
    if (left <= 0) return write();
    _failing[key] = left - 1;
    if (reportFalse) return false;
    throw PlatformException(code: 'write_failed');
  }

  @override
  Future<bool> setString(String key, String value) =>
      _write(key, () => _real.setString(key, value));

  @override
  Future<bool> remove(String key) => _write(key, () => _real.remove(key));

  @override
  String? getString(String key) => _real.getString(key);

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

Future<List<dynamic>> _savedAccounts() async {
  final prefs = await SharedPreferences.getInstance();
  return jsonDecode(prefs.getString('saved_accounts') ?? '[]') as List;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => debugKeepAliveClientFactory = _Forward.new);
  tearDownAll(() => debugKeepAliveClientFactory = null);

  setUp(() async {
    await _resetPrefs();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('dev.fluttercommunity.plus/connectivity'),
          (call) async => ['wifi'],
        );
  });

  group('login', () {
    test('a successful sign-in saves the session to prefs', () async {
      final server = _FakeServer();
      final auth = AuthProvider();

      expect(await _login(auth, server), isTrue);

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('server_url'), _server);
      expect(prefs.getString('server_backend'), 'abs');
      expect(prefs.getString('token'), 'access-1');
      expect(prefs.getString('refresh_token'), 'refresh-1');
      expect(prefs.getString('username'), 'reader');
      expect(prefs.getString('user_id'), 'u1');
      expect(prefs.getString('default_library_id'), 'lib1');
      expect(prefs.containsKey('custom_headers'), isFalse);

      expect(auth.isAuthenticated, isTrue);
      expect(auth.token, 'access-1');
      expect(auth.serverUrl, _server);
      expect(auth.username, 'reader');
      expect(auth.userId, 'u1');
      expect(auth.defaultLibraryId, 'lib1');
      expect(auth.serverVersion, '2.30.0');
      expect(auth.errorMessage, isNull);
      expect(auth.startOnAbsorbingAfterAccountChange, isTrue);
    });

    test('password and SSO sign-in never log the token', () async {
      final logs = <String>[];
      final original = debugPrint;
      debugPrint = (message, {wrapWidth}) => logs.add(message ?? '');
      addTearDown(() => debugPrint = original);

      await _login(AuthProvider(), _FakeServer());
      await AuthProvider().loginWithOidc(
        serverUrl: _other,
        result: _otherBody(),
      );

      expect(logs, isNotEmpty);
      for (final token in ['access-1', 'refresh-1', 'access-2', 'refresh-2']) {
        expect(logs.where((l) => l.contains(token)), isEmpty, reason: token);
      }
    });

    test(
      'the login request asks for tokens and carries the credentials',
      () async {
        final server = _FakeServer();
        await _login(AuthProvider(), server);

        final login = server.to('/login').single;
        expect(login.method, 'POST');
        expect(login.headers['x-return-tokens'], 'true');
        expect(jsonDecode(login.body), {
          'username': 'reader',
          'password': 'secret',
        });
        expect(
          server.to('/status'),
          isEmpty,
          reason: 'the login response already carried the version',
        );
      },
    );

    test(
      'the signed-in account is saved and becomes the active scope',
      () async {
        await _login(AuthProvider(), _FakeServer());

        final accounts = await _savedAccounts();
        expect(accounts, hasLength(1));
        final saved = accounts.single as Map<String, dynamic>;
        expect(saved['serverUrl'], _server);
        expect(saved['username'], 'reader');
        expect(saved['token'], 'access-1');
        expect(saved['refreshToken'], 'refresh-1');
        expect(saved['userId'], 'u1');
        expect(saved['isLegacyToken'], isFalse);
        expect(UserAccountService().activeScopeKey, 'abs.example_reader');
      },
    );

    test(
      'a bare host is saved as an http:// URL without trailing slashes',
      () async {
        final server = _FakeServer();
        final auth = AuthProvider();

        expect(await _login(auth, server, url: ' abs.example/ '), isTrue);

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString('server_url'), 'http://abs.example');
        expect(auth.serverUrl, 'http://abs.example');
        expect(
          server.to('/ping').first.url.toString(),
          'http://abs.example/ping',
        );
      },
    );

    test(
      'a legacy-token server saves the token and no refresh token',
      () async {
        final auth = AuthProvider();
        final ok = await _login(
          auth,
          _FakeServer(loginBody: _loginBody(modern: false, legacy: true)),
        );

        expect(ok, isTrue);
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString('token'), 'legacy-1');
        expect(prefs.containsKey('refresh_token'), isFalse);
        expect(auth.token, 'legacy-1');
        final saved = (await _savedAccounts()).single as Map<String, dynamic>;
        expect(saved['isLegacyToken'], isTrue);
        expect(saved.containsKey('refreshToken'), isFalse);
      },
    );

    test(
      'custom headers are saved, and cleared by a sign-in without them',
      () async {
        final auth = AuthProvider();
        await _login(auth, _FakeServer(), headers: {'X-Proxy': 'key'});

        final prefs = await SharedPreferences.getInstance();
        expect(jsonDecode(prefs.getString('custom_headers')!), {
          'X-Proxy': 'key',
        });

        await _login(auth, _FakeServer());
        expect(prefs.containsKey('custom_headers'), isFalse);
      },
    );

    test('wrong credentials: false, a message, and nothing saved', () async {
      final auth = AuthProvider();
      final ok = await _login(auth, _FakeServer(loginStatus: 401));

      expect(ok, isFalse);
      expect(auth.errorMessage, 'Invalid username or password');
      expect(auth.isAuthenticated, isFalse);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('token'), isFalse);
      expect(prefs.containsKey('server_url'), isFalse);
      expect(await _savedAccounts(), isEmpty);
    });

    test('an unreachable server fails before sending the password', () async {
      final server = _FakeServer(reachable: false);
      final auth = AuthProvider();

      expect(await _login(auth, server), isFalse);
      expect(auth.errorMessage, 'Cannot reach server at $_server');
      expect(server.to('/login'), isEmpty);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('token'), isFalse);
    });

    test('a response without a user is rejected', () async {
      final auth = AuthProvider();
      final ok = await _login(
        auth,
        _FakeServer(loginBody: {'userDefaultLibraryId': 'lib1'}),
      );

      expect(ok, isFalse);
      expect(auth.errorMessage, 'Unexpected server response');
      expect(auth.isAuthenticated, isFalse);
    });

    test('a user without any token is rejected and nothing is saved', () async {
      final auth = AuthProvider();
      final ok = await _login(
        auth,
        _FakeServer(loginBody: _loginBody(modern: false)),
      );

      expect(ok, isFalse);
      expect(auth.errorMessage, 'Unexpected server response');
      expect(auth.isAuthenticated, isFalse);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('token'), isFalse);
      expect(prefs.containsKey('server_url'), isFalse);
    });

    test('a tokenless response while signed in elsewhere leaves the previous '
        'session as it was', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());

      final ok = await _login(
        auth,
        _FakeServer(loginBody: _loginBody(modern: false)),
        url: _other,
      );

      expect(ok, isFalse);
      expect(auth.errorMessage, 'Unexpected server response');
      // The old token must not be paired with the new address.
      expect(auth.serverUrl, _server);
      expect(auth.token, 'access-1');
      expect(auth.isAuthenticated, isTrue);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('server_url'), _server);
    });

    test('a tokenless SSO answer while signed in elsewhere leaves the '
        'previous session as it was', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());

      final ok = await auth.loginWithOidc(
        serverUrl: _other,
        result: _loginBody(modern: false),
      );

      expect(ok, isFalse);
      expect(auth.errorMessage, 'SSO returned an unexpected response');
      expect(auth.serverUrl, _server);
      expect(auth.token, 'access-1');
      expect(auth.isAuthenticated, isTrue);
    });
  });

  group('session writes that fail', () {
    // key -> how many more writes of that key fail.
    late Map<String, int> failing;
    var reportFalse = false;

    setUp(() {
      failing = {};
      reportFalse = false;
      AuthProvider.debugSessionPrefs = () async => _FailingPrefs(
        await SharedPreferences.getInstance(),
        failing,
        reportFalse: reportFalse,
      );
    });
    tearDown(
      () => AuthProvider.debugSessionPrefs = SharedPreferences.getInstance,
    );

    // A failed save from signed out leaves memory and disk signed out: no
    // half-written new session (server, refresh token) left behind.
    Future<void> expectFailedSignIn(AuthProvider auth, bool ok) async {
      expect(ok, isFalse);
      expect(auth.errorMessage, 'Login failed');
      expect(auth.isAuthenticated, isFalse);
      expect(auth.token, isNull);
      expect(auth.serverUrl, isNull);
      expect(auth.username, isNull);
      final prefs = await SharedPreferences.getInstance();
      for (final key in [
        'token',
        'refresh_token',
        'server_url',
        'server_backend',
        'username',
        'user_id',
      ]) {
        expect(prefs.containsKey(key), isFalse, reason: key);
      }
    }

    // Signed in as reader@abs.example, then a sign-in as listener@other
    // whose token write fails must leave the reader session whole.
    Future<void> expectReaderSession(AuthProvider auth) async {
      expect(auth.isAuthenticated, isTrue);
      expect(auth.serverUrl, _server);
      expect(auth.token, 'access-1');
      expect(auth.username, 'reader');
      expect(auth.userId, 'u1');
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('server_url'), _server);
      expect(prefs.getString('token'), 'access-1');
      expect(prefs.getString('refresh_token'), 'refresh-1');
      expect(prefs.getString('username'), 'reader');
      expect(prefs.getString('user_id'), 'u1');
    }

    test('a failed save while signed in elsewhere keeps the previous session '
        'in memory and on disk', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());
      failing['token'] = 1;

      final ok = await _login(
        auth,
        _FakeServer(loginBody: _otherBody()),
        url: _other,
      );

      expect(ok, isFalse);
      expect(auth.errorMessage, 'Login failed');
      await expectReaderSession(auth);
      final next = AuthProvider();
      await _with(_FakeServer(), next.tryRestoreSession);
      expect(next.serverUrl, _server);
      expect(next.token, 'access-1');
    });

    test('a server address write that reports false fails the sign-in', () async {
      failing['server_url'] = 1;
      reportFalse = true;
      final auth = AuthProvider();

      await expectFailedSignIn(auth, await _login(auth, _FakeServer()));
    });

    test('a token write that throws fails the sign-in', () async {
      failing['token'] = 1;
      final auth = AuthProvider();

      await expectFailedSignIn(auth, await _login(auth, _FakeServer()));
      expect(await _savedAccounts(), isEmpty);
    });

    test('a token write that reports false fails the sign-in', () async {
      failing['token'] = 1;
      reportFalse = true;
      final auth = AuthProvider();

      await expectFailedSignIn(auth, await _login(auth, _FakeServer()));
    });

    test('a refresh-token write that fails fails the sign-in', () async {
      failing['refresh_token'] = 1;
      final auth = AuthProvider();

      expect(await _login(auth, _FakeServer()), isFalse);
      expect(auth.isAuthenticated, isFalse);
    });

    test('a failed best-effort write still signs in', () async {
      failing['default_library_id'] = 1;
      final auth = AuthProvider();

      expect(await _login(auth, _FakeServer()), isTrue);
      expect(auth.isAuthenticated, isTrue);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('token'), 'access-1');
    });

    test('API key sign-in: an unsaved token fails it', () async {
      failing['token'] = 1;
      final auth = AuthProvider();
      final ok = await _with(
        _FakeServer(),
        () => auth.loginWithApiKey(serverUrl: _server, apiKey: 'key-1'),
      );

      await expectFailedSignIn(auth, ok);
    });

    test('SSO sign-in: an unsaved token fails it', () async {
      failing['token'] = 1;
      final auth = AuthProvider();
      final ok = await auth.loginWithOidc(
        serverUrl: _server,
        result: _loginBody(),
      );

      await expectFailedSignIn(auth, ok);
    });

    test('switching accounts: an unsaved token fails the switch and keeps '
        'the current account', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer(loginBody: _otherBody()), url: _other);
      await _login(auth, _FakeServer());
      final listener = UserAccountService().accounts.firstWhere(
        (a) => a.username == 'listener',
      );
      failing['token'] = 1;
      // Which scope was active each time the account epoch moved, and each
      // time scoped settings were announced.
      final epochScopes = <String?>[];
      Future<void> onEpoch() async =>
          epochScopes.add(UserAccountService().activeScopeKey);
      AccountEpoch.addHandler(onEpoch);
      addTearDown(() => AccountEpoch.removeHandler(onEpoch));
      final settingsScopes = <String?>[];
      void onSettings() =>
          settingsScopes.add(UserAccountService().activeScopeKey);
      PlayerSettings.settingsChanged.addListener(onSettings);
      addTearDown(
        () => PlayerSettings.settingsChanged.removeListener(onSettings),
      );

      auth.beginAccountSwitch(); // as the settings screen does
      final ok = await _with(
        _FakeServer(),
        () => auth.switchToAccount(listener),
      );

      expect(ok, isFalse);
      expect(auth.errorMessage, 'Login failed');
      await expectReaderSession(auth);
      expect(UserAccountService().activeScopeKey, 'abs.example_reader');
      expect(auth.startOnAbsorbingAfterAccountChange, isFalse);
      // Moving back stopped the listener's work, and the reader's settings
      // were announced last.
      expect(epochScopes.last, 'other.example_listener');
      expect(settingsScopes.last, 'abs.example_reader');
    });

    test('switching accounts from signed out: a failed save stays signed '
        'out', () async {
      await _login(AuthProvider(), _FakeServer());
      final account = UserAccountService().accounts.single;
      final prefs = await SharedPreferences.getInstance();
      for (final key in [
        'server_url',
        'server_backend',
        'token',
        'refresh_token',
        'username',
        'user_id',
      ]) {
        await prefs.remove(key);
      }
      final auth = AuthProvider(); // signed out, nothing restored
      failing['token'] = 1;

      auth.beginAccountSwitch();
      final ok = await _with(_FakeServer(), () => auth.switchToAccount(account));

      expect(ok, isFalse);
      await expectFailedSignIn(auth, ok);
      expect(auth.startOnAbsorbingAfterAccountChange, isFalse);
      expect(auth.isLoading, isFalse);
    });

    test('API key sign-in: a failed save keeps the previous session', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());
      failing['token'] = 1;

      final ok = await _with(
        _FakeServer(),
        () => auth.loginWithApiKey(serverUrl: _other, apiKey: 'key-2'),
      );

      expect(ok, isFalse);
      expect(auth.errorMessage, 'Login failed');
      await expectReaderSession(auth);
    });

    test('SSO sign-in: a failed save keeps the previous session', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());
      failing['token'] = 1;

      final ok = await auth.loginWithOidc(
        serverUrl: _other,
        result: _otherBody(),
      );

      expect(ok, isFalse);
      expect(auth.errorMessage, 'Login failed');
      await expectReaderSession(auth);
    });

    testWidgets('switching accounts: the failure message is localized', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: rootNavigatorKey,
          locale: const Locale('de'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const SizedBox(),
        ),
      );
      await tester.pumpAndSettle();
      final auth = AuthProvider();
      await tester.runAsync(() async {
        await _login(auth, _FakeServer());
        final account = UserAccountService().accounts.single;
        failing['token'] = 1;
        await _with(_FakeServer(), () => auth.switchToAccount(account));
      });

      expect(
        auth.errorMessage,
        lookupAppLocalizations(const Locale('de')).loginFailed,
      );
    });

    test('sign-out that fails on the token still removes the other keys', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());
      failing['token'] = 1;

      await _with(_FakeServer(), auth.logout);

      final prefs = await SharedPreferences.getInstance();
      for (final key in [
        'token',
        'refresh_token',
        'user_id',
        'default_library_id',
        'username',
        'server_url',
      ]) {
        expect(prefs.containsKey(key), isFalse, reason: key);
      }
    });

    for (final mode in ['throws', 'reports false']) {
      test('sign-out retries a token removal that $mode once', () async {
        final auth = AuthProvider();
        await _login(auth, _FakeServer());
        failing['token'] = 1;
        reportFalse = mode == 'reports false';

        await _with(_FakeServer(), auth.logout);

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.containsKey('token'), isFalse);
        final next = AuthProvider();
        await _with(_FakeServer(), next.tryRestoreSession);
        expect(next.isAuthenticated, isFalse);
      });
    }

    test('sign-out that cannot remove the token still signs out', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());
      failing['token'] = 1000;
      var notified = false;
      auth.addListener(() => notified = true);

      await _with(_FakeServer(), auth.logout);

      expect(auth.isAuthenticated, isFalse);
      expect(auth.token, isNull);
      expect(notified, isTrue);
    });
  });

  group('tryRestoreSession', () {
    test('restores what a sign-in saved', () async {
      await _login(AuthProvider(), _FakeServer());

      final server = _FakeServer();
      final restored = AuthProvider();
      await _with(server, restored.tryRestoreSession);

      expect(restored.isAuthenticated, isTrue);
      expect(restored.isLoading, isFalse);
      expect(restored.serverReachable, isTrue);
      expect(restored.token, 'access-1');
      expect(restored.serverUrl, _server);
      expect(restored.username, 'reader');
      expect(restored.userId, 'u1');
      expect(restored.defaultLibraryId, 'lib1');
      final authorize = server.to('/api/authorize').single;
      expect(authorize.url.origin, _server);
      expect(authorize.headers['Authorization'], 'Bearer access-1');
      expect(server.to('/login'), isEmpty);
    });

    test('restores from prefs alone and normalizes an old URL', () async {
      await _resetPrefs({
        'server_url': 'abs.example/',
        'token': 'saved-token',
        'refresh_token': 'saved-refresh',
        'username': 'reader',
        'user_id': 'u-saved',
        'default_library_id': 'lib-saved',
      });
      final server = _FakeServer();
      final auth = AuthProvider();
      await _with(server, auth.tryRestoreSession);

      expect(auth.isAuthenticated, isTrue);
      expect(auth.token, 'saved-token');
      expect(auth.serverUrl, 'http://abs.example');
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('server_url'), 'http://abs.example');
      // The live authorize answer replaces the saved user and library.
      expect(auth.userId, 'u1');
      expect(auth.defaultLibraryId, 'lib1');
    });

    test('offline: keeps the saved session without user info', () async {
      await _resetPrefs({
        'server_url': _server,
        'token': 'saved-token',
        'username': 'reader',
        'user_id': 'u-saved',
        'default_library_id': 'lib-saved',
      });
      final auth = AuthProvider();
      await _with(_FakeServer(reachable: false), auth.tryRestoreSession);

      expect(auth.isAuthenticated, isTrue);
      expect(auth.serverReachable, isFalse);
      expect(auth.token, 'saved-token');
      expect(auth.userId, 'u-saved');
      expect(auth.defaultLibraryId, 'lib-saved');
      expect(auth.userJson, isNull);
    });

    test(
      'a saved server without a token prefills but does not sign in',
      () async {
        await _resetPrefs({'server_url': _server, 'username': 'reader'});
        final server = _FakeServer();
        final auth = AuthProvider();
        await _with(server, auth.tryRestoreSession);

        expect(auth.isAuthenticated, isFalse);
        expect(auth.serverUrl, _server);
        expect(auth.username, 'reader');
        expect(server.requests, isEmpty);
      },
    );

    test('nothing saved: signed out and no requests', () async {
      final server = _FakeServer();
      final auth = AuthProvider();
      await _with(server, auth.tryRestoreSession);

      expect(auth.isAuthenticated, isFalse);
      expect(auth.serverUrl, isNull);
      expect(auth.isLoading, isFalse);
      expect(server.requests, isEmpty);
    });
  });

  group('logout', () {
    test('removes the token and forgets the account', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());

      await _with(_FakeServer(), auth.logout);

      expect(auth.isAuthenticated, isFalse);
      expect(auth.token, isNull);
      expect(auth.serverUrl, isNull);
      expect(auth.username, isNull);
      expect(auth.userId, isNull);
      expect(auth.defaultLibraryId, isNull);
      final prefs = await SharedPreferences.getInstance();
      for (final key in [
        'token',
        'refresh_token',
        'server_url',
        'username',
        'user_id',
        'default_library_id',
      ]) {
        expect(prefs.containsKey(key), isFalse, reason: key);
      }
      expect(await _savedAccounts(), isEmpty);
    });

    test('a later launch does not restore a logged-out session', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());
      await _with(_FakeServer(), auth.logout);

      final server = _FakeServer();
      final next = AuthProvider();
      await _with(server, next.tryRestoreSession);

      expect(next.isAuthenticated, isFalse);
      expect(server.requests, isEmpty);
    });

    test('keepServer keeps only the server address', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());

      await _with(_FakeServer(), () => auth.logout(keepServer: true));

      expect(auth.isAuthenticated, isFalse);
      expect(auth.serverUrl, _server);
      expect(auth.username, isNull);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('server_url'), _server);
      expect(prefs.containsKey('token'), isFalse);
      expect(prefs.containsKey('username'), isFalse);
      expect(await _savedAccounts(), isEmpty);
    });

    test(
      'forgetAccount: false drops the tokens but keeps the account',
      () async {
        final auth = AuthProvider();
        await _login(auth, _FakeServer());

        await _with(_FakeServer(), () => auth.logout(forgetAccount: false));

        expect(auth.isAuthenticated, isFalse);
        expect(auth.serverUrl, _server);
        expect(auth.username, 'reader');
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.containsKey('token'), isFalse);
        expect(prefs.containsKey('refresh_token'), isFalse);
        expect(prefs.containsKey('user_id'), isFalse);
        expect(prefs.getString('server_url'), _server);
        expect(prefs.getString('username'), 'reader');
        final saved = (await _savedAccounts()).single as Map<String, dynamic>;
        expect(saved['token'], '');
        expect(saved.containsKey('refreshToken'), isFalse);
        expect(saved['username'], 'reader');
      },
    );

    test('a plain logout does not contact the server', () async {
      final auth = AuthProvider();
      await _login(auth, _FakeServer());

      final server = _FakeServer();
      await _with(server, auth.logout);

      expect(server.requests, isEmpty);
    });
  });
}
