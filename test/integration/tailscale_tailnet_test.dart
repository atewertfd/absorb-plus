// End to end: the built-in Tailscale node (the real native library through
// dart:ffi) joins a throwaway headscale tailnet and reaches the throwaway
// Audiobookshelf through it. Never a real tailnet or server.
//
//   .\tool\dev.ps1 server up
//   pwsh tool/test-server/tailnet/tailnet.ps1 up
//   $env:ABSORB_TS_TEST_LOOPBACK = '1'
//   flutter test --tags tailnet --run-skipped test/integration/tailscale_tailnet_test.dart
//   pwsh tool/test-server/tailnet/tailnet.ps1 down
//
// ABSORB_TS_TEST_LOOPBACK=1 is read by the library when it loads: it stops
// tailscale pinning sockets to the physical network card, which the
// loopback-only test tailnet needs. The app never sets it.
//
// The library comes from TS_TEST_LIB, else the Windows Release folder, else
// build/native-test/ (cmake -P native/tailscale/build_go.cmake).
@Tags(['tailnet'])
library;

import 'dart:convert';
import 'dart:io';

import 'package:absorb/services/tailscale_native.dart';
import 'package:absorb/services/tailscale_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, String> _readEnv() {
  final file = File('tool/test-server/tailnet/.env');
  if (!file.existsSync()) return const {};
  final out = <String, String>{};
  for (final line in file.readAsLinesSync()) {
    final i = line.indexOf('=');
    if (i > 0) out[line.substring(0, i).trim()] = line.substring(i + 1).trim();
  }
  return out;
}

String? _libraryPath() {
  final candidates = [
    Platform.environment['TS_TEST_LIB'],
    if (Platform.isWindows) ...[
      r'build\windows\x64\runner\Release\absorb_tailscale.dll',
      r'build\native-test\absorb_tailscale.dll',
    ],
    if (Platform.isLinux) 'build/native-test/libabsorb_tailscale.so',
  ];
  for (final c in candidates) {
    if (c != null && File(c).existsSync()) return File(c).absolute.path;
  }
  return null;
}

Future<(int, String)> _get(HttpClient client, String url) async {
  final req = await client.getUrl(Uri.parse(url));
  final res = await req.close().timeout(const Duration(seconds: 30));
  return (res.statusCode, await res.transform(utf8.decoder).join());
}

void main() {
  final env = _readEnv();
  final lib = _libraryPath();
  final skip = env['TS_TEST_AUTHKEY'] == null
      ? 'No throwaway tailnet: run tool/test-server/tailnet/tailnet.ps1 up'
      : lib == null
          ? 'No built-in Tailscale library built yet'
          : Platform.environment['ABSORB_TS_TEST_LOOPBACK'] != '1'
              ? 'Set ABSORB_TS_TEST_LOOPBACK=1 (lets the node use the loopback-only test tailnet)'
              : null;

  late TailscaleService ts;
  late Directory stateDir;
  final absUrl = env['TS_TEST_ABS_URL'] ?? '';

  setUpAll(() async {
    if (skip != null) return;
    SharedPreferences.setMockInitialValues({TailscaleService.prefEnabled: true});
    stateDir = await Directory.systemTemp.createTemp('absorb-ts-e2e-');
    ts = TailscaleService(
      loadNative: () => loadTailscaleNative(libraryPath: lib),
      stateDir: () async => stateDir.path,
      hostname: () => 'absorb-e2e',
      openExternal: (_) async => true,
      controlUrl: env['TS_TEST_CONTROL_URL']!,
      authKey: env['TS_TEST_AUTHKEY']!,
    );
    await ts.init();
  });

  tearDownAll(() async {
    if (skip != null) return;
    if (Platform.environment['TS_TEST_VERBOSE'] == '1') {
      // The node's in-memory log, for debugging a failed run.
      File('build/ts-e2e-node.log').writeAsStringSync(ts.debugLogs());
    }
    await ts.setEnabled(false);
    try {
      stateDir.deleteSync(recursive: true);
    } catch (_) {}
  });

  test('joins the tailnet with a pre-auth key', () async {
    expect(ts.libraryAvailable, isTrue);
    await ts.waitUntilReady(absUrl, timeout: const Duration(seconds: 60));
    expect(ts.status.isRunning, isTrue, reason: ts.status.error);
    expect(ts.status.primaryIp, startsWith('100.'));
    expect(ts.status.magicDnsSuffix, 'tailnet.test');
    expect(ts.routing.active, isTrue);
  }, skip: skip, timeout: const Timeout(Duration(minutes: 2)));

  test('Dart HTTP reaches /ping and /status through findProxy', () async {
    expect(ts.routing.active, isTrue); // never fall back to a direct request
    final client = HttpClient()..findProxy = ts.findProxy;
    try {
      final (pingCode, ping) = await _get(client, '$absUrl/ping');
      expect(pingCode, 200);
      expect(jsonDecode(ping), containsPair('success', true));
      final (statusCode, status) = await _get(client, '$absUrl/status');
      expect(statusCode, 200);
      expect(jsonDecode(status), contains('isInit'));
      // MagicDNS name of the same node, resolved inside the tailnet.
      final dnsUrl = env['TS_TEST_ABS_DNS_URL']!;
      expect(ts.findProxy(Uri.parse(dnsUrl)), startsWith('PROXY '));
      final (dnsCode, _) = await _get(client, '$dnsUrl/ping');
      expect(dnsCode, 200);
    } finally {
      client.close(force: true);
    }
  }, skip: skip, timeout: const Timeout(Duration(minutes: 1)));

  test('media URLs work through the loopback reverse proxy', () async {
    final media = ts.mediaUrl('$absUrl/status?x=1');
    expect(media, startsWith('http://127.0.0.1:'));
    final client = HttpClient(); // no proxy, like ExoPlayer or libmpv
    try {
      final (code, body) = await _get(client, media);
      expect(code, 200);
      expect(jsonDecode(body), contains('isInit'));
      // Without the secret the port is useless to other apps.
      final port = ts.routing.proxyPort;
      final (badPath, _) = await _get(client, 'http://127.0.0.1:$port/_ts/wrong/http/${Uri.parse(absUrl).host}:80/ping');
      expect(badPath, 404);
      final noAuth = HttpClient()..findProxy = (_) => 'PROXY 127.0.0.1:$port';
      final (badProxy, _) = await _get(noAuth, '$absUrl/ping');
      expect(badProxy, 407);
      noAuth.close(force: true);
    } finally {
      client.close(force: true);
    }
  }, skip: skip, timeout: const Timeout(Duration(minutes: 1)));

  test('CONNECT tunnel (what Dart uses for https tailnet servers)', () async {
    final host = Uri.parse(absUrl).host;
    final port = ts.routing.proxyPort;
    final auth = base64.encode(utf8.encode('absorb:${ts.routing.secret}'));
    final socket = await Socket.connect('127.0.0.1', port);
    final received = <int>[];
    final done = socket.listen(received.addAll).asFuture<void>();
    socket.write('CONNECT $host:80 HTTP/1.1\r\nHost: $host:80\r\n'
        'Proxy-Authorization: Basic $auth\r\n\r\n');
    await Future<void>.delayed(const Duration(seconds: 2));
    expect(utf8.decode(received, allowMalformed: true),
        startsWith('HTTP/1.1 200'));
    received.clear();
    socket.write('GET /ping HTTP/1.1\r\nHost: $host\r\nConnection: close\r\n\r\n');
    await done.timeout(const Duration(seconds: 20));
    final reply = utf8.decode(received, allowMalformed: true);
    expect(reply, startsWith('HTTP/1.1 200'));
    expect(reply, contains('"success":true'));
  }, skip: skip, timeout: const Timeout(Duration(minutes: 1)));

  test('WebSocket (the live server socket) through findProxy', () async {
    final client = HttpClient()..findProxy = ts.findProxy;
    final ws = await WebSocket.connect(
      '${absUrl.replaceFirst('http', 'ws')}/socket.io/?EIO=4&transport=websocket',
      customClient: client,
    ).timeout(const Duration(seconds: 20));
    try {
      final first = await ws.first.timeout(const Duration(seconds: 20));
      expect('$first', startsWith('0{')); // engine.io "open" packet
    } finally {
      await ws.close();
      client.close(force: true);
    }
  }, skip: skip, timeout: const Timeout(Duration(minutes: 1)));

  test('sign out asks for a new sign-in', () async {
    ts.signOut();
    final deadline = DateTime.now().add(const Duration(seconds: 30));
    while (!ts.status.needsLogin && DateTime.now().isBefore(deadline)) {
      await Future<void>.delayed(const Duration(milliseconds: 300));
    }
    expect(ts.status.state, 'NeedsLogin');
  }, skip: skip, timeout: const Timeout(Duration(minutes: 1)));
}
