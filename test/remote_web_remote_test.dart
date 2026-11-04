import 'dart:convert';
import 'dart:io';

import 'package:absorb/services/remote_link/pairing_store.dart';
import 'package:absorb/services/remote_link/protocol.dart';
import 'package:absorb/services/remote_link/remote_channel_io.dart';
import 'package:absorb/services/remote_link/remote_client.dart';
import 'package:absorb/services/remote_link/remote_crypto.dart';
import 'package:absorb/services/remote_link/remote_host.dart';
import 'package:absorb/services/remote_link/remote_link_types.dart';
import 'package:absorb/services/remote_link/web_remote_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/remote_link_fakes.dart';

/// The browser remote, server side: the host serves the page, takes the
/// page's WebSocket only from its own origin, and pairs and logs a browser
/// in exactly like the app (code, Allow, key exchange, v2 login, sealed
/// frames). Real sockets on 127.0.0.1 with ephemeral ports. The page's own
/// JavaScript crypto was checked against these Dart functions by hand
/// (docs/design/phone-remote.md, "Browser remote").
Future<void> eventually(bool Function() condition) async {
  final deadline = DateTime.now().add(const Duration(seconds: 20));
  while (!condition()) {
    if (DateTime.now().isAfter(deadline)) fail('Condition not met');
    await Future<void>.delayed(const Duration(milliseconds: 5));
  }
}

void main() {
  late FakePlayer player;
  late RemoteHost host;
  late bool allow;
  final asked = <String>[];
  final clients = <RemoteClient>[];

  /// What the page's WebSocket looks like to the host: an Origin header.
  Future<RemoteChannel> browserDial(
    String address,
    int port,
    Duration timeout, {
    String? originHeader,
  }) async {
    final ws = await WebSocket.connect(
      remoteSocketUri(address, port).toString(),
      headers: {'origin': originHeader ?? 'http://$address:$port'},
      compression: CompressionOptions.compressionOff,
    ).timeout(timeout);
    return WebSocketRemoteChannel(ws);
  }

  Future<RemotePairResult> pairBrowser(
    String code, {
    String name = 'Safari on iPhone',
  }) async {
    final channel = await browserDial(
      '127.0.0.1',
      host.boundPort!,
      const Duration(seconds: 5),
    );
    return pairOver(
      channel,
      address: '127.0.0.1',
      port: host.boundPort!,
      code: code,
      deviceName: name,
    );
  }

  Future<RemotePairResult> pairApp(String code, String name) async {
    final channel = await connectRemoteChannel(
      '127.0.0.1',
      host.boundPort!,
      const Duration(seconds: 5),
    );
    return pairOver(
      channel,
      address: '127.0.0.1',
      port: host.boundPort!,
      code: code,
      deviceName: name,
    );
  }

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    player = FakePlayer();
    allow = true;
    asked.clear();
    host = RemoteHost(
      player: () => player,
      bindAddress: InternetAddress.loopbackIPv4,
      firstPort: 0,
      discoveryPort: 0,
      hostName: 'Test PC',
      supported: true,
      stateDebounce: Duration.zero,
      listenOnAccountChange: false,
      approver: (request) async {
        asked.add(request.deviceName);
        return allow;
      },
    );
    await host.setEnabled(true);
    expect(host.status.value.running, isTrue);
  });

  tearDown(() async {
    for (final c in clients) {
      await c.close();
    }
    clients.clear();
    await host.stopForTest();
  });

  Future<HttpClientResponse> get(String path, {String? hostHeader}) async {
    final http = HttpClient();
    addTearDown(() => http.close(force: true));
    final request = await http.get('127.0.0.1', host.boundPort!, path);
    if (hostHeader != null) request.headers.host = hostHeader;
    return request.close();
  }

  test(
    'the host serves the self-contained page with a strict policy',
    () async {
      final response = await get('/');
      final body = await response.transform(utf8.decoder).join();
      expect(response.statusCode, HttpStatus.ok);
      expect(response.headers.contentType?.mimeType, 'text/html');
      expect(body, kWebRemotePage);
      expect(body, contains('<title>Absorb remote</title>'));
      // Nothing loads from anywhere else.
      expect(body, isNot(contains('src="http')));
      expect(body, isNot(contains('href="http')));
      final csp = response.headers.value('content-security-policy')!;
      expect(csp, contains("default-src 'none'"));
      expect(csp, contains('ws://127.0.0.1:${host.boundPort}'));
      expect(csp, contains("frame-ancestors 'none'"));
      expect(response.headers.value('x-frame-options'), 'DENY');
      expect(response.headers.value('cache-control'), 'no-store');
    },
  );

  test('the page speaks the same protocol as the app', () {
    // The page's group, label and message names match the Dart side.
    expect(kWebRemotePage, contains("var LABEL = 'absorb-remote v2'"));
    expect(
      kWebRemotePage,
      contains('FFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD1'),
    );
    expect(kWebRemotePage, contains("'/remote'"));
    expect(kRemoteSocketPath, '/remote');
    expect(kWebRemotePage, contains('version: $kRemoteProtocolVersion'));
  });

  test(
    'a page reached through another name is refused (DNS rebinding)',
    () async {
      final r = await get('/', hostHeader: 'evil.example');
      await r.drain<void>();
      expect(r.statusCode, HttpStatus.forbidden);
    },
  );

  test('another site in a browser still cannot open the socket', () async {
    await expectLater(
      browserDial(
        '127.0.0.1',
        host.boundPort!,
        const Duration(seconds: 5),
        originHeader: 'http://evil.example',
      ),
      throwsA(isA<WebSocketException>()),
    );
    // Same scheme and port but another host than the one it was served from.
    await expectLater(
      browserDial(
        '127.0.0.1',
        host.boundPort!,
        const Duration(seconds: 5),
        originHeader: 'http://192.168.1.50:${host.boundPort}',
      ),
      throwsA(isA<WebSocketException>()),
    );
  });

  test(
    'a browser pairs with the code and Allow, then logs in with v2',
    () async {
      host.openPairing();
      final result = await pairBrowser(host.codes.code!);
      expect(result.error, isNull);
      final saved = result.host!;
      expect(asked, ['Safari on iPhone (browser)']);
      final device = host.devices.devices.single;
      expect(device.browser, isTrue);
      expect(device.name, 'Safari on iPhone (browser)');
      expect(device.tokenHash, hashRemoteToken(saved.token));
      // The flag survives a restart of the list.
      expect(PairedDevice.fromJson(device.toJson())!.browser, isTrue);

      player.current = fakePlaying;
      final client = RemoteClient(
        saved,
        backoff: (_) => const Duration(milliseconds: 20),
        dial: browserDial,
      );
      clients.add(client);
      await client.connect();
      await eventually(() => client.state?.title == fakePlaying.title);
      expect(host.connections.value.single.browser, isTrue);
      expect(host.connections.value.single.deviceName, device.name);

      client.send(const ToggleCommand());
      await eventually(() => player.commands.contains('toggle'));

      // Forget on the PC drops the browser at once.
      await host.forget(device.id);
      await eventually(() => client.phase != RemoteLinkPhase.connected);
      expect(host.devices.devices, isEmpty);
    },
  );

  test('Deny on the PC refuses the browser', () async {
    allow = false;
    host.openPairing();
    final result = await pairBrowser(host.codes.code!);
    expect(result.error, RemoteErrorCode.pairDenied);
    expect(host.devices.devices, isEmpty);
  });

  test('a wrong token from a browser is refused', () async {
    final bogus = SavedRemoteHost(
      hostId: host.status.value.hostId,
      name: 'Test PC',
      address: '127.0.0.1',
      port: host.boundPort!,
      token: newRemoteSecret(),
    );
    final client = RemoteClient(
      bogus,
      backoff: (_) => const Duration(milliseconds: 20),
      dial: browserDial,
    );
    clients.add(client);
    await client.connect();
    await eventually(() => client.problem == RemoteLinkProblem.unauthorized);
    expect(host.connections.value, isEmpty);
  });

  test('browsers count toward the 5-device limit', () async {
    for (var i = 0; i < 4; i++) {
      host.openPairing();
      expect((await pairApp(host.codes.code!, 'Phone $i')).error, isNull);
    }
    host.openPairing();
    expect((await pairBrowser(host.codes.code!)).error, isNull);
    expect(host.devices.devices, hasLength(5));
    expect(host.devices.devices.where((d) => d.browser), hasLength(1));
    // Full: no new window, and a browser trying anyway is told why.
    host.openPairing();
    expect(host.codes.isOpen, isFalse);
    host.codes.open();
    final more = await pairBrowser(host.codes.code!, name: 'Chrome on Android');
    expect(more.error, RemoteErrorCode.tooManyDevices);
    expect(host.devices.devices, hasLength(5));
  });

  test('browser names are marked for the PC user', () {
    expect(browserDeviceName('Safari on iPhone'), 'Safari on iPhone (browser)');
    expect(browserDeviceName(''), 'Web browser');
    expect(browserDeviceName('My browser'), 'My browser');
  });
}
