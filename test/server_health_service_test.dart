import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/server_backend.dart';
import 'package:absorb/services/server_health_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A signed-in session whose /me and /libraries answers the test picks.
class _FakeApi extends ApiService {
  _FakeApi({this.me, this.libraries = const [], this.meError})
    : super(baseUrl: 'http://abs.test', token: 'fixture-token');

  final Map<String, dynamic>? me;
  final List<dynamic> libraries;
  final Object? meError;
  int librariesCalls = 0;

  @override
  Future<Map<String, dynamic>?> getMe() async {
    if (meError != null) throw meError!;
    return me;
  }

  @override
  Future<List<dynamic>> getLibraries() async {
    librariesCalls++;
    return libraries;
  }
}

/// The read-only probe behind the server health screen. /ping and /status go
/// through the top-level http functions, which [http.runWithClient] reroutes
/// to a [MockClient]; nothing leaves the machine.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<http.Request> requests;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    ServerBackend.active = ServerBackend.audiobookshelf;
    requests = [];
  });

  /// Runs a check with /ping answering [pingStatus] (or throwing [pingError])
  /// and /status answering [statusBody] with [statusCode].
  Future<ServerHealthSnapshot> check({
    String serverUrl = 'http://abs.test',
    ApiService? api,
    int pingStatus = 200,
    Object? pingError,
    String statusBody = '{"serverVersion":"2.17.0"}',
    int statusCode = 200,
    Map<String, String> customHeaders = const {},
  }) {
    final client = MockClient((request) async {
      requests.add(request);
      if (request.url.path.endsWith('/ping')) {
        if (pingError != null) throw pingError;
        return http.Response('{"success":true}', pingStatus);
      }
      if (request.url.path.endsWith('/status')) {
        return http.Response(statusBody, statusCode);
      }
      return http.Response('unexpected', 404);
    });
    return http.runWithClient(
      () => ServerHealthService().check(
        serverUrl: serverUrl,
        api: api,
        customHeaders: customHeaders,
      ),
      () => client,
    );
  }

  group('unreachable', () {
    test('a non-200 ping stops the check and says what came back', () async {
      final before = DateTime.now();
      final api = _FakeApi(me: const {'id': 'u1'});
      final s = await check(pingStatus: 503, api: api);

      expect(s.reachable, isFalse);
      expect(s.authenticated, isFalse);
      expect(s.healthy, isFalse);
      expect(s.serverVersion, isNull);
      expect(s.latency, isNull);
      expect(s.detail, 'Server returned HTTP 503 instead of 200.');
      expect(s.checkedAt.isBefore(before), isFalse);
      // Neither /status nor the session is asked.
      expect(requests.map((r) => r.url.path), ['/ping']);
      expect(api.librariesCalls, 0);
    });

    test('a refused connection is explained in plain words', () async {
      final s = await check(
        pingError: http.ClientException('Connection refused'),
      );
      expect(s.reachable, isFalse);
      expect(s.detail, startsWith('Connection refused - nothing is listening'));
    });

    test('a DNS failure is explained in plain words', () async {
      final s = await check(
        pingError: http.ClientException('Failed host lookup: abs.test'),
      );
      expect(s.reachable, isFalse);
      expect(s.detail, startsWith('Could not resolve the domain (DNS)'));
    });
  });

  group('reachable, no session', () {
    test('reports the version and latency but not authenticated', () async {
      final s = await check();

      expect(s.reachable, isTrue);
      expect(s.authenticated, isFalse);
      expect(s.healthy, isFalse);
      expect(s.serverVersion, '2.17.0');
      expect(s.latency, isNotNull);
      expect(s.latency!.isNegative, isFalse);
      expect(
        s.detail,
        'The server is reachable, but this session is not authenticated.',
      );
      expect(requests.map((r) => r.url.path), ['/ping', '/status']);
    });

    test('a trailing slash on the server URL does not double up', () async {
      await check(serverUrl: 'http://abs.test/');
      expect(requests.map((r) => r.url.toString()), [
        'http://abs.test/ping',
        'http://abs.test/status',
      ]);
    });

    test('custom headers go with both probes', () async {
      await check(customHeaders: const {'CF-Access-Client-Id': 'fixture-id'});
      expect(requests, hasLength(2));
      for (final r in requests) {
        expect(r.headers['CF-Access-Client-Id'], 'fixture-id');
      }
    });

    test('a failing /status leaves the version empty, nothing else', () async {
      final s = await check(statusCode: 500);
      expect(s.reachable, isTrue);
      expect(s.serverVersion, isNull);
      expect(s.latency, isNotNull);
    });

    test('a garbled /status body leaves the version empty', () async {
      final s = await check(statusBody: 'not json');
      expect(s.reachable, isTrue);
      expect(s.serverVersion, isNull);
    });
  });

  group('with a session', () {
    test('signed in with libraries is healthy and counts them', () async {
      final api = _FakeApi(
        me: const {'id': 'u1'},
        libraries: const [
          {'id': 'l1'},
          {'id': 'l2'},
        ],
      );
      final s = await check(api: api);

      expect(s.reachable, isTrue);
      expect(s.authenticated, isTrue);
      expect(s.healthy, isTrue);
      expect(s.serverVersion, '2.17.0');
      expect(s.detail, '2 libraries visible to this account.');
      expect(api.librariesCalls, 1);
    });

    test('signed in with no libraries is still healthy, with a hint', () async {
      final s = await check(api: _FakeApi(me: const {'id': 'u1'}));

      expect(s.healthy, isTrue);
      expect(s.detail, startsWith('Signed in, but no libraries came back'));
    });

    test('a session /me cannot confirm is not authenticated', () async {
      final api = _FakeApi(me: null);
      final s = await check(api: api);

      expect(s.reachable, isTrue);
      expect(s.authenticated, isFalse);
      expect(s.serverVersion, '2.17.0');
      expect(s.detail, contains('could not be confirmed'));
      expect(api.librariesCalls, 0);
    });

    test('a throwing session check is caught and reported', () async {
      final s = await check(api: _FakeApi(meError: StateError('kaput')));

      expect(s.reachable, isTrue);
      expect(s.authenticated, isFalse);
      expect(s.serverVersion, '2.17.0');
      expect(s.detail, startsWith('The session check failed: '));
      expect(s.detail, contains('kaput'));
    });
  });

  test('healthy needs both reachable and authenticated', () {
    ServerHealthSnapshot snap(bool reachable, bool authenticated) =>
        ServerHealthSnapshot(
          reachable: reachable,
          authenticated: authenticated,
          serverVersion: null,
          latency: null,
          detail: null,
          checkedAt: DateTime(2026),
        );
    expect(snap(true, true).healthy, isTrue);
    expect(snap(true, false).healthy, isFalse);
    expect(snap(false, true).healthy, isFalse);
    expect(snap(false, false).healthy, isFalse);
  });
}
