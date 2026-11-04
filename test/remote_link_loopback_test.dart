import 'dart:io';

import 'package:absorb/services/account_epoch.dart';
import 'package:absorb/services/remote_link/pairing_store.dart';
import 'package:absorb/services/remote_link/protocol.dart';
import 'package:absorb/services/remote_link/remote_client.dart';
import 'package:absorb/services/remote_link/remote_crypto.dart';
import 'package:absorb/services/remote_link/remote_host.dart';
import 'package:absorb/services/remote_link/remote_link_types.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/remote_link_fakes.dart';

/// The host and a remote over a real socket on 127.0.0.1 (ephemeral ports,
/// no other network), with a fake player behind the host. The fake-clock
/// cases (heartbeat, reconnect, tampering) are in remote_link_session_test.

/// Waits for [condition] without a fixed sleep: checks after every event
/// turn, giving up only after a generous safety timeout.
Future<void> eventually(
  bool Function() condition, {
  Duration timeout = const Duration(seconds: 20),
}) async {
  final deadline = DateTime.now().add(timeout);
  while (!condition()) {
    if (DateTime.now().isAfter(deadline)) {
      fail('Condition not met within $timeout');
    }
    await Future<void>.delayed(const Duration(milliseconds: 5));
  }
}

void main() {
  late FakePlayer player;
  late RemoteHost host;
  late IoRemoteLinkConnector connector;
  final clients = <RemoteClient>[];

  RemoteClient openClient(SavedRemoteHost saved) {
    final c = RemoteClient(
      saved,
      backoff: (_) => const Duration(milliseconds: 20),
    );
    clients.add(c);
    return c;
  }

  Future<RemotePairResult> pair(String code, {String name = 'Phone'}) =>
      connector.pair(
        address: '127.0.0.1',
        port: host.boundPort!,
        code: code,
        deviceName: name,
      );

  Future<SavedRemoteHost> pairOk() async {
    host.openPairing();
    final result = await pair(host.codes.code!, name: 'Test phone');
    expect(result.error, isNull);
    return result.host!;
  }

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    player = FakePlayer();
    host = RemoteHost(
      player: () => player,
      bindAddress: InternetAddress.loopbackIPv4,
      firstPort: 0,
      discoveryPort: 0,
      hostName: 'Test PC',
      supported: true,
      stateDebounce: Duration.zero,
      listenOnAccountChange: false,
      approver: (_) async => true,
    );
    await host.setEnabled(true);
    expect(host.status.value.running, isTrue);
    connector = IoRemoteLinkConnector(
      discoveryPort: host.boundDiscoveryPort!,
      discoveryTargets: [InternetAddress.loopbackIPv4],
    );
  });

  tearDown(() async {
    for (final c in clients) {
      await c.close();
    }
    clients.clear();
    await host.stopForTest();
  });

  test('discovery finds the host', () async {
    final found = await connector
        .discover(timeout: const Duration(seconds: 3))
        .first;
    expect(found.name, 'Test PC');
    expect(found.port, host.boundPort);
    expect(found.hostId, host.status.value.hostId);
    expect(found.address, '127.0.0.1');
  });

  test(
    'turning on opens a pairing window; the right code pairs once',
    () async {
      final code = host.codes.code!;
      final wrong = code == '000000' ? '000001' : '000000';
      expect((await pair(wrong)).error, RemoteErrorCode.badCode);
      expect(host.devices.devices, isEmpty);

      final good = await pair(code);
      expect(good.host, isNotNull);
      expect(good.host!.hostId, host.status.value.hostId);
      expect(good.host!.name, 'Test PC');
      expect(host.devices.devices.single.name, 'Phone');
      expect(
        host.devices.devices.single.tokenHash,
        hashRemoteToken(good.host!.token),
      );
      // Single use: the window closed.
      expect(host.codes.isOpen, isFalse);
      expect((await pair(code)).error, RemoteErrorCode.pairingClosed);
    },
  );

  test('pairing is refused while no window is open', () async {
    host.codes.close();
    expect((await pair('123456')).error, RemoteErrorCode.pairingClosed);
  });

  test('state, commands and covers flow both ways', () async {
    final saved = await pairOk();
    player.coverBytes = Uint8List.fromList([0x89, 0x50, 0x4E, 0x47, 1, 2, 3]);
    player.recentCovers['li_2'] = Uint8List.fromList([0xFF, 0xD8, 9]);
    player.recent = const [RemoteRecentItem(id: 'li_2', title: 'Next')];
    player.current = fakePlaying;
    final client = openClient(saved);
    await client.connect();
    await eventually(() => client.phase == RemoteLinkPhase.connected);
    await eventually(() => client.state?.itemId == 'li_1');
    expect(client.state!.chapterTitle, 'Chapter 2');
    expect(host.connections.value.single.deviceName, 'Test phone');

    await eventually(() => client.cover != null);
    expect(client.cover, player.coverBytes);

    client.send(const SkipCommand(30));
    client.send(const SkipCommand(-10));
    client.send(const ChapterCommand(1));
    client.send(const SeekCommand(500));
    client.send(const SpeedCommand(1.5));
    client.send(const SleepCommand.minutes(15));
    client.send(const SleepCommand.endOfChapter());
    client.send(const SleepCommand.cancel());
    client.send(const ToggleCommand());
    client.send(const VolumeCommand(0.25));
    await eventually(() => player.commands.length == 10);
    expect(player.commands, [
      'skip 30',
      'skip -10',
      'chapter 1',
      'seek 500.0',
      'speed 1.5',
      'sleep 15',
      'sleep chapter',
      'sleep cancel',
      'toggle',
      'volume 0.25',
    ]);

    // A Continue listening cover comes only for a book that was offered.
    expect(await client.recentCover('li_2'), isNull);
    client.requestRecent();
    await eventually(() => client.recent != null);
    expect(await client.recentCover('li_2'), player.recentCovers['li_2']);

    player.current = const RemotePlayerState(
      itemId: 'li_1',
      title: 'The Book',
      position: 130,
      playing: false,
    );
    await eventually(() => client.state?.playing == false);
    expect(client.state!.position, 130);
  });

  test(
    'commands that need a book are refused when nothing is loaded',
    () async {
      final saved = await pairOk();
      final client = openClient(saved);
      await client.connect();
      await eventually(() => client.state != null);
      client.send(const PlayCommand());
      await eventually(() => client.lastError == RemoteErrorCode.nothingLoaded);
      expect(player.commands, isEmpty);
      // Volume and Continue listening work without one.
      client.send(const VolumeCommand(0.5));
      await eventually(() => player.commands.length == 1);
    },
  );

  test('an unknown device is refused and not retried', () async {
    await pairOk();
    final client = openClient(
      SavedRemoteHost(
        hostId: host.status.value.hostId,
        name: 'PC',
        address: '127.0.0.1',
        port: host.boundPort!,
        token: newRemoteSecret(),
      ),
    );
    await client.connect();
    await eventually(() => client.phase == RemoteLinkPhase.closed);
    expect(client.problem, RemoteLinkProblem.unauthorized);
    expect(host.connections.value, isEmpty);
  });

  test('forget drops the connection and revokes the key', () async {
    final saved = await pairOk();
    final client = openClient(saved);
    await client.connect();
    await eventually(() => host.connections.value.isNotEmpty);
    await host.forget(host.connections.value.single.deviceId);
    await eventually(() => client.phase == RemoteLinkPhase.closed);
    expect(client.problem, RemoteLinkProblem.unauthorized);
    expect(host.devices.devices, isEmpty);

    final again = openClient(saved);
    await again.connect();
    await eventually(() => again.phase == RemoteLinkPhase.closed);
    expect(again.problem, RemoteLinkProblem.unauthorized);
  });

  test('disconnect keeps the pairing but stops reconnecting', () async {
    final saved = await pairOk();
    final client = openClient(saved);
    await client.connect();
    await eventually(() => host.connections.value.isNotEmpty);
    await host.disconnect(host.connections.value.single.id);
    await eventually(() => client.phase == RemoteLinkPhase.closed);
    expect(client.problem, RemoteLinkProblem.disconnectedByHost);
    expect(host.devices.devices, hasLength(1));
  });

  test('switching off closes every socket; the remote reconnects', () async {
    final saved = await pairOk();
    final client = openClient(saved);
    await client.connect();
    await eventually(() => client.phase == RemoteLinkPhase.connected);
    final port = host.boundPort!;

    await host.setEnabled(false);
    expect(host.boundPort, isNull);
    expect(host.boundDiscoveryPort, isNull);
    expect(host.status.value.running, isFalse);
    expect(host.connections.value, isEmpty);
    expect(host.codes.isOpen, isFalse);
    await eventually(() => client.phase == RemoteLinkPhase.reconnecting);
    expect(client.state, isNull);

    // The port is free again: nothing is left listening.
    final probe = await ServerSocket.bind(InternetAddress.loopbackIPv4, port);
    await probe.close();
    expect(
      (await SharedPreferences.getInstance()).getBool(RemoteHost.prefEnabled),
      isFalse,
    );
  });

  group('after a restart', () {
    Future<RemoteHost> restart(Map<String, Object> prefs) async {
      SharedPreferences.setMockInitialValues(prefs);
      final other = RemoteHost(
        player: () => player,
        bindAddress: InternetAddress.loopbackIPv4,
        firstPort: 0,
        discoveryPort: 0,
        supported: true,
        listenOnAccountChange: false,
      );
      await other.start();
      return other;
    }

    test('it stays off unless "Keep on when Absorb starts"', () async {
      final off = await restart({RemoteHost.prefEnabled: true});
      try {
        expect(off.status.value.enabled, isFalse);
        expect(off.boundPort, isNull);
        expect(
          (await SharedPreferences.getInstance()).getBool(
            RemoteHost.prefEnabled,
          ),
          isFalse,
        );
      } finally {
        await off.stopForTest();
      }

      final kept = await restart({
        RemoteHost.prefEnabled: true,
        RemoteHost.prefKeepOn: true,
      });
      try {
        expect(kept.status.value.running, isTrue);
        expect(kept.status.value.keepOn, isTrue);
        // Starting by itself opens no pairing window.
        expect(kept.codes.isOpen, isFalse);
      } finally {
        await kept.stopForTest();
      }
    });

    test('setKeepOn is remembered', () async {
      await host.setKeepOn(true);
      expect(host.status.value.keepOn, isTrue);
      expect(
        (await SharedPreferences.getInstance()).getBool(RemoteHost.prefKeepOn),
        isTrue,
      );
    });
  });

  test('signing out closes the host and turns the switch off', () async {
    await host.signedOut();
    expect(host.boundPort, isNull);
    expect(host.status.value.enabled, isFalse);
    expect(
      (await SharedPreferences.getInstance()).getBool(RemoteHost.prefEnabled),
      isFalse,
    );
  });

  test('shutdownForExit returns at once and closes', () async {
    final saved = await pairOk();
    final client = openClient(saved);
    await client.connect();
    await eventually(() => client.phase == RemoteLinkPhase.connected);
    host.shutdownForExit();
    expect(host.codes.isOpen, isFalse);
    await eventually(() => host.boundPort == null);
    await eventually(() => client.phase != RemoteLinkPhase.connected);
  });

  test('repeated failures from one address are blocked', () async {
    for (var i = 0; i < 5; i++) {
      host.openPairing();
      expect((await pair('nope$i')).error, RemoteErrorCode.badCode);
    }
    host.openPairing();
    final blocked = await pair(host.codes.code!);
    expect(blocked.error, RemoteErrorCode.tooManyAttempts);
    expect(host.devices.devices, isEmpty);
  });

  test(
    'browser requests, unknown paths and stale tickets are refused',
    () async {
      final http = HttpClient();
      try {
        final withOrigin = await http.get(
          '127.0.0.1',
          host.boundPort!,
          '/cover',
        );
        withOrigin.headers.set('origin', 'https://evil.example');
        final r1 = await withOrigin.close();
        await r1.drain<void>();
        expect(r1.statusCode, HttpStatus.forbidden);

        final noTicket = await http.get('127.0.0.1', host.boundPort!, '/cover');
        noTicket.headers.set(HttpHeaders.authorizationHeader, 'Bearer made-up');
        final r2 = await noTicket.close();
        await r2.drain<void>();
        expect(r2.statusCode, HttpStatus.unauthorized);

        final other = await http.get('127.0.0.1', host.boundPort!, '/other');
        final r3 = await other.close();
        await r3.drain<void>();
        expect(r3.statusCode, HttpStatus.notFound);
      } finally {
        http.close(force: true);
      }
    },
  );

  group('hardening', () {
    Future<WebSocket> raw() =>
        WebSocket.connect('ws://127.0.0.1:${host.boundPort}$kRemoteSocketPath');

    test('an oversized first frame is dropped', () async {
      final ws = await raw();
      final done = ws.drain<void>();
      ws.add('x' * (kRemoteMaxFrameLength + 1000));
      await done;
      expect(ws.closeCode, RemoteCloseCode.badRequest);
    });

    test('anything but hello or pair first is dropped', () async {
      final ws = await raw();
      final done = ws.drain<void>();
      ws.add(const PlayCommand().encode());
      await done;
      expect(ws.closeCode, RemoteCloseCode.badRequest);
      expect(player.commands, isEmpty);
    });

    test('an old remote is told to update', () async {
      final ws = await raw();
      final frames = <String>[];
      final done = ws.listen((f) => frames.add(f as String)).asFuture<void>();
      ws.add('{"type":"hello","version":1,"token":"x"}');
      await done;
      expect(ws.closeCode, RemoteCloseCode.unsupportedVersion);
    });

    test('a silent connection is dropped after the login window', () async {
      final quick = RemoteHost(
        player: () => player,
        bindAddress: InternetAddress.loopbackIPv4,
        firstPort: 0,
        discoveryPort: 0,
        supported: true,
        authTimeout: const Duration(milliseconds: 200),
        listenOnAccountChange: false,
      );
      await quick.setEnabled(true);
      try {
        final ws = await WebSocket.connect(
          'ws://127.0.0.1:${quick.boundPort}$kRemoteSocketPath',
        );
        await ws.drain<void>();
        expect(ws.closeCode, RemoteCloseCode.badRequest);
      } finally {
        await quick.stopForTest();
      }
    });

    test('one address can hold only a few connections', () async {
      final open = [for (var i = 0; i < 3; i++) await raw()];
      await expectLater(raw(), throwsA(isA<WebSocketException>()));
      for (final ws in open) {
        await ws.close();
      }
    });

    test('an account change closes the host and turns it off', () async {
      AccountEpoch.resetForTest();
      SharedPreferences.setMockInitialValues({
        RemoteHost.prefEnabled: true,
        RemoteHost.prefKeepOn: true,
      });
      final other = RemoteHost(
        player: () => player,
        bindAddress: InternetAddress.loopbackIPv4,
        firstPort: 0,
        discoveryPort: 0,
        supported: true,
      );
      try {
        await other.start();
        expect(other.status.value.running, isTrue);
        await AccountEpoch.advance();
        expect(other.boundPort, isNull);
        expect(other.status.value.enabled, isFalse);
        expect(
          (await SharedPreferences.getInstance()).getBool(
            RemoteHost.prefEnabled,
          ),
          isFalse,
        );
      } finally {
        await other.stopForTest();
        AccountEpoch.resetForTest();
      }
    });
  });

  test('reconnect backoff grows to 10 s and never overflows', () {
    expect(remoteReconnectBackoff(1), const Duration(seconds: 1));
    expect(remoteReconnectBackoff(2), const Duration(seconds: 2));
    expect(remoteReconnectBackoff(4), const Duration(seconds: 8));
    expect(remoteReconnectBackoff(5), const Duration(seconds: 10));
    expect(remoteReconnectBackoff(100), const Duration(seconds: 10));
    expect(remoteReconnectBackoff(1 << 20), const Duration(seconds: 10));
  });
}
