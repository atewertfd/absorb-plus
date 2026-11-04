import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

import 'protocol.dart';

/// Phone remote (fork): the link's cryptography. Pure Dart (web-safe).
///
/// - **Pairing** runs a Diffie-Hellman exchange (RFC 3526 2048-bit group,
///   256-bit secret exponents), so the device token is worked out on both
///   sides and never crosses the network. The code only gates who may try,
///   and the PC's user still has to allow the device.
/// - **Login** is a mutual HMAC-SHA256 challenge-response over nonces from
///   both sides: the remote proves it holds the device key, then the host
///   proves it too. Both derive a key for this connection only.
/// - **Every later frame** is sealed: HMAC-SHA256 over a direction label, a
///   sequence number and the message. Tampered, replayed, reordered or
///   bounced-back frames are refused. Frames are not encrypted (only
///   playback state and commands travel).
///
/// The device key is the SHA-256 of the token: the host stores only that
/// (stage 1 already stored it as the "token hash"), the remote keeps the
/// token.

const _label = 'absorb-remote v2';

/// A fresh random secret: 32 bytes, base64url without padding.
String newRemoteSecret([Random? random]) {
  final r = random ?? Random.secure();
  return _b64(List<int>.generate(32, (_) => r.nextInt(256)));
}

/// A nonce the other side sent: base64url, 16 to 64 bytes.
bool isValidRemoteNonce(Object? value) {
  if (value is! String || value.length < 22 || value.length > 88) return false;
  try {
    final bytes = base64Url.decode(base64Url.normalize(value));
    return bytes.length >= 16 && bytes.length <= 64;
  } catch (_) {
    return false; // Not base64: not a nonce.
  }
}

/// What the host stores for a device: hex SHA-256 of its token.
String hashRemoteToken(String token) =>
    sha256.convert(utf8.encode(token)).toString();

/// The HMAC key a device and its host share, from the remote's token.
List<int> remoteDeviceKeyFromToken(String token) =>
    sha256.convert(utf8.encode(token)).bytes;

/// The same key from the host's stored hex hash. Null when malformed.
List<int>? remoteDeviceKeyFromHash(String hexHash) {
  if (hexHash.length != 64) return null;
  final out = Uint8List(32);
  for (var i = 0; i < 32; i++) {
    final v = int.tryParse(hexHash.substring(i * 2, i * 2 + 2), radix: 16);
    if (v == null) return null;
    out[i] = v;
  }
  return out;
}

/// Compares two strings in time that doesn't depend on where they differ.
bool constantTimeEquals(String a, String b) {
  if (a.length != b.length) return false;
  var diff = 0;
  for (var i = 0; i < a.length; i++) {
    diff |= a.codeUnitAt(i) ^ b.codeUnitAt(i);
  }
  return diff == 0;
}

String _b64(List<int> bytes) => base64Url.encode(bytes).replaceAll('=', '');

List<int> _hmac(List<int> key, String message) =>
    Hmac(sha256, key).convert(utf8.encode(message)).bytes;

String _transcript(String what, String hostId, String nR, String nH) =>
    '$_label $what\n$hostId\n$nR\n$nH';

/// The remote's answer to the host's challenge.
String remoteClientProof(
  List<int> key,
  String hostId,
  String remoteNonce,
  String hostNonce,
) => _b64(_hmac(key, _transcript('client', hostId, remoteNonce, hostNonce)));

/// The host's proof, sent with `welcome`: it knows the key too.
String remoteHostProof(
  List<int> key,
  String hostId,
  String remoteNonce,
  String hostNonce,
) => _b64(_hmac(key, _transcript('host', hostId, remoteNonce, hostNonce)));

/// The key that seals this connection's frames.
List<int> remoteSessionKey(
  List<int> key,
  String hostId,
  String remoteNonce,
  String hostNonce,
) => _hmac(key, _transcript('session', hostId, remoteNonce, hostNonce));

/// What the remote sends to fetch covers over plain HTTP while this
/// connection lives (both sides derive it; it dies with the connection).
String remoteCoverTicket(List<int> sessionKey) =>
    _b64(_hmac(sessionKey, '$_label cover'));

// ── Sealed frames ───────────────────────────────────────────────────

/// Which way a frame goes; part of every MAC so a frame can't be bounced back.
enum RemoteDirection {
  hostToRemote('h'),
  remoteToHost('r');

  const RemoteDirection(this.tag);
  final String tag;
}

/// Seals outgoing frames and opens incoming ones for one connection.
class RemoteSealer {
  RemoteSealer(List<int> sessionKey, {required this.outgoing})
    : _hmac = Hmac(sha256, sessionKey);

  static const typeName = 'sealed';

  final Hmac _hmac;
  final RemoteDirection outgoing;
  int _sent = 0;
  int _received = 0;

  RemoteDirection get _incoming => outgoing == RemoteDirection.hostToRemote
      ? RemoteDirection.remoteToHost
      : RemoteDirection.hostToRemote;

  String _mac(RemoteDirection dir, int seq, String body) =>
      _b64(_hmac.convert(utf8.encode('${dir.tag}\n$seq\n$body')).bytes);

  String seal(RemoteMessage message) {
    final body = message.encode();
    final seq = ++_sent;
    return jsonEncode({
      'type': typeName,
      's': seq,
      'm': body,
      'a': _mac(outgoing, seq, body),
    });
  }

  /// The message inside [text], or null when it is malformed, forged,
  /// replayed or out of order (the caller then drops the connection).
  RemoteMessage? open(String text, {int maxLength = kRemoteMaxFrameLength}) {
    if (text.length > maxLength + 512) return null;
    Object? json;
    try {
      json = jsonDecode(text);
    } catch (_) {
      return null; // Not JSON: refused like any malformed frame.
    }
    if (json is! Map || json['type'] != typeName) return null;
    final seq = json['s'];
    final body = json['m'];
    final mac = json['a'];
    if (seq is! int || body is! String || mac is! String) return null;
    if (seq != _received + 1) return null;
    if (!constantTimeEquals(mac, _mac(_incoming, seq, body))) return null;
    final message = RemoteMessage.decode(body, maxLength: maxLength);
    if (message == null) return null;
    _received = seq;
    return message;
  }
}

// ── Pairing key exchange ────────────────────────────────────────────

/// RFC 3526 group 14 (2048-bit MODP), generator 2.
final BigInt _p = BigInt.parse(
  'FFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD1'
  '29024E088A67CC74020BBEA63B139B22514A08798E3404DD'
  'EF9519B3CD3A431B302B0A6DF25F14374FE1356D6D51C245'
  'E485B576625E7EC6F44C42E9A637ED6B0BFF5CB6F406B7ED'
  'EE386BFB5A899FA5AE9F24117C4B1FE649286651ECE45B3D'
  'C2007CB8A163BF0598DA48361C55D39A69163FA8FD24CF5F'
  '83655D23DCA3AD961C62F356208552BB9ED529077096966D'
  '670C354E4ABC9804F1746C08CA18217C32905E462E36CE3B'
  'E39E772C180E86039B2783A2EC07A28FB5C55DF06F4C52C9'
  'DE2BCBF6955817183995497CEA956AE515D2261898FA0510'
  '15728E5A8AACAA68FFFFFFFFFFFFFFFF',
  radix: 16,
);
final BigInt _g = BigInt.two;
const _groupBytes = 256;

/// One side's half of the pairing exchange.
class RemoteKeyExchange {
  RemoteKeyExchange([Random? random]) {
    final r = random ?? Random.secure();
    var x = BigInt.zero;
    for (var i = 0; i < 32; i++) {
      x = (x << 8) | BigInt.from(r.nextInt(256));
    }
    // Never 0 or 1.
    _secret = x | BigInt.two;
    _public = _g.modPow(_secret, _p);
  }

  late final BigInt _secret;
  late final BigInt _public;

  /// What goes on the wire (base64url, 256 bytes big-endian).
  String get publicKey => _b64(_bytes(_public));

  /// The shared secret with [peerPublic], or null when it isn't a valid
  /// group element (0, 1, p-1 or out of range are refused).
  List<int>? sharedSecret(String peerPublic) {
    final peer = parsePublic(peerPublic);
    if (peer == null) return null;
    return _bytes(peer.modPow(_secret, _p));
  }

  static BigInt? parsePublic(String text) {
    if (text.length > 400) return null;
    List<int> bytes;
    try {
      bytes = base64Url.decode(base64Url.normalize(text));
    } catch (_) {
      return null; // Not base64: not a key.
    }
    if (bytes.isEmpty || bytes.length > _groupBytes) return null;
    var v = BigInt.zero;
    for (final b in bytes) {
      v = (v << 8) | BigInt.from(b);
    }
    if (v <= BigInt.one || v >= _p - BigInt.one) return null;
    return v;
  }

  static List<int> _bytes(BigInt v) {
    final out = Uint8List(_groupBytes);
    var x = v;
    for (var i = _groupBytes - 1; i >= 0; i--) {
      out[i] = (x & BigInt.from(0xff)).toInt();
      x = x >> 8;
    }
    return out;
  }
}

/// The device token both sides derive from the exchange (the remote keeps
/// it; the host keeps only its SHA-256).
String remotePairingToken(
  List<int> shared,
  String remotePublic,
  String hostPublic,
  String hostId,
) => _b64(
  _hmac(
    sha256.convert(shared).bytes,
    '$_label token\n$hostId\n$remotePublic\n$hostPublic',
  ),
);
