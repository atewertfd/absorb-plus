import 'dart:convert';

import 'package:absorb/services/remote_link/protocol.dart';
import 'package:absorb/services/remote_link/remote_crypto.dart';
import 'package:flutter_test/flutter_test.dart';

/// The phone remote's key exchange, login proofs and sealed frames.
void main() {
  group('pairing key exchange', () {
    test('both sides derive the same token, and nobody else does', () {
      final remote = RemoteKeyExchange();
      final host = RemoteKeyExchange();
      final eve = RemoteKeyExchange();
      final onRemote = remote.sharedSecret(host.publicKey)!;
      final onHost = host.sharedSecret(remote.publicKey)!;
      expect(onRemote, onHost);
      expect(eve.sharedSecret(host.publicKey), isNot(onHost));

      final a = remotePairingToken(
        onRemote,
        remote.publicKey,
        host.publicKey,
        'h1',
      );
      final b = remotePairingToken(
        onHost,
        remote.publicKey,
        host.publicKey,
        'h1',
      );
      expect(a, b);
      // Tied to the host id too.
      expect(
        remotePairingToken(onHost, remote.publicKey, host.publicKey, 'h2'),
        isNot(a),
      );
    });

    test('degenerate keys are refused', () {
      String encode(List<int> bytes) =>
          base64Url.encode(bytes).replaceAll('=', '');
      expect(RemoteKeyExchange.parsePublic(encode([0])), isNull);
      expect(RemoteKeyExchange.parsePublic(encode([1])), isNull);
      expect(
        RemoteKeyExchange.parsePublic(encode(List.filled(256, 0xff))),
        isNull,
      );
      expect(RemoteKeyExchange.parsePublic('not base64!'), isNull);
      expect(RemoteKeyExchange.parsePublic('A' * 500), isNull);
      expect(RemoteKeyExchange().sharedSecret(encode([1])), isNull);
    });
  });

  group('login proofs', () {
    final key = remoteDeviceKeyFromToken('token');
    final nR = newRemoteSecret();
    final nH = newRemoteSecret();

    test('the stored hash gives the same key as the token', () {
      expect(remoteDeviceKeyFromHash(hashRemoteToken('token')), key);
      expect(remoteDeviceKeyFromHash('zz'), isNull);
    });

    test('client and host proofs differ and depend on every input', () {
      final client = remoteClientProof(key, 'h1', nR, nH);
      expect(remoteHostProof(key, 'h1', nR, nH), isNot(client));
      expect(remoteClientProof(key, 'h2', nR, nH), isNot(client));
      expect(remoteClientProof(key, 'h1', nH, nR), isNot(client));
      expect(
        remoteClientProof(remoteDeviceKeyFromToken('other'), 'h1', nR, nH),
        isNot(client),
      );
      expect(remoteClientProof(key, 'h1', nR, nH), client);
    });

    test('nonces', () {
      expect(isValidRemoteNonce(nR), isTrue);
      expect(isValidRemoteNonce('short'), isFalse);
      expect(isValidRemoteNonce(42), isFalse);
      expect(newRemoteSecret(), isNot(newRemoteSecret()));
    });

    test('constantTimeEquals', () {
      expect(constantTimeEquals('abc', 'abc'), isTrue);
      expect(constantTimeEquals('abc', 'abd'), isFalse);
      expect(constantTimeEquals('abc', 'ab'), isFalse);
    });
  });

  group('sealed frames', () {
    final session = remoteSessionKey(
      remoteDeviceKeyFromToken('t'),
      'h1',
      newRemoteSecret(),
      newRemoteSecret(),
    );
    late RemoteSealer host;
    late RemoteSealer remote;
    setUp(() {
      host = RemoteSealer(session, outgoing: RemoteDirection.hostToRemote);
      remote = RemoteSealer(session, outgoing: RemoteDirection.remoteToHost);
    });

    test('open in order', () {
      final a = remote.seal(const PlayCommand());
      final b = remote.seal(const SkipCommand(30));
      expect(host.open(a), isA<PlayCommand>());
      expect((host.open(b) as SkipCommand).seconds, 30);
    });

    test('a replayed frame is refused', () {
      final a = remote.seal(const PlayCommand());
      expect(host.open(a), isNotNull);
      expect(host.open(a), isNull);
    });

    test('a skipped or reordered frame is refused', () {
      remote.seal(const PlayCommand());
      final second = remote.seal(const PauseCommand());
      expect(host.open(second), isNull);
    });

    test('a tampered frame is refused', () {
      final frame = jsonDecode(remote.seal(const SkipCommand(30))) as Map;
      frame['m'] = const SkipCommand(-3600).encode();
      expect(host.open(jsonEncode(frame)), isNull);
    });

    test('a frame bounced back to its sender is refused', () {
      final frame = remote.seal(const PlayCommand());
      final other = RemoteSealer(
        session,
        outgoing: RemoteDirection.remoteToHost,
      );
      expect(other.open(frame), isNull);
    });

    test('another session key cannot forge', () {
      final forger = RemoteSealer(
        remoteSessionKey(
          remoteDeviceKeyFromToken('guess'),
          'h1',
          newRemoteSecret(),
          newRemoteSecret(),
        ),
        outgoing: RemoteDirection.remoteToHost,
      );
      expect(host.open(forger.seal(const PlayCommand())), isNull);
    });

    test('cover tickets follow the session', () {
      expect(remoteCoverTicket(session), remoteCoverTicket(session));
      expect(
        remoteCoverTicket(session),
        isNot(remoteCoverTicket(remoteDeviceKeyFromToken('x'))),
      );
    });
  });
}
