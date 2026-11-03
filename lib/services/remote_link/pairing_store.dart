import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'protocol.dart';

/// Phone remote (fork): pairing codes, paired devices and the auth-failure
/// limiter on the host, and the remote's saved hosts. Pure Dart (web-safe);
/// clocks and randomness are injectable for tests.

typedef RemoteClock = DateTime Function();

DateTime _systemNow() => DateTime.now();

/// A fresh random secret: 32 bytes, base64url without padding.
String newRemoteToken([Random? random]) {
  final r = random ?? Random.secure();
  final bytes = List<int>.generate(32, (_) => r.nextInt(256));
  return base64Url.encode(bytes).replaceAll('=', '');
}

/// What the host keeps instead of a token.
String hashRemoteToken(String token) =>
    sha256.convert(utf8.encode(token)).toString();

/// Compares two strings in time that doesn't depend on where they differ.
bool constantTimeEquals(String a, String b) {
  if (a.length != b.length) return false;
  var diff = 0;
  for (var i = 0; i < a.length; i++) {
    diff |= a.codeUnitAt(i) ^ b.codeUnitAt(i);
  }
  return diff == 0;
}

// ── Pairing code ────────────────────────────────────────────────────

/// Result of checking a typed code.
enum PairCodeCheck { ok, wrong, expired, closed }

/// The host's 6-digit pairing code. It exists only while pairing is open
/// (the host's Phone remote sheet is showing), expires after [lifetime], is
/// replaced after [maxAttempts] wrong tries, and works once.
class PairingCodeIssuer extends ChangeNotifier {
  PairingCodeIssuer({
    Random? random,
    RemoteClock? now,
    this.lifetime = const Duration(minutes: 2),
    this.maxAttempts = 5,
  }) : _random = random ?? Random.secure(),
       _now = now ?? _systemNow;

  final Random _random;
  final RemoteClock _now;
  final Duration lifetime;
  final int maxAttempts;

  String? _code;
  DateTime? _expiresAt;
  int _attempts = 0;
  int _openCount = 0;

  bool get isOpen => _openCount > 0;

  /// The current code, or null while pairing is closed.
  String? get code => isOpen ? _code : null;

  DateTime? get expiresAt => isOpen ? _expiresAt : null;

  bool get isExpired => _expiresAt == null || !_now().isBefore(_expiresAt!);

  /// Opens pairing (nested opens are counted) and issues a code if needed.
  void open() {
    _openCount++;
    if (_code == null || isExpired) {
      _issue();
    } else {
      notifyListeners();
    }
  }

  /// Closes one [open]; the code is dropped when the last one closes.
  void close() {
    if (_openCount == 0) return;
    _openCount--;
    if (_openCount == 0) {
      _code = null;
      _expiresAt = null;
      _attempts = 0;
      notifyListeners();
    }
  }

  /// A new code (the Refresh button, an expired code, or after use).
  void refresh() {
    if (!isOpen) return;
    _issue();
  }

  /// Issues a new code when the current one has run out.
  void refreshIfExpired() {
    if (isOpen && isExpired) _issue();
  }

  PairCodeCheck check(String typed) {
    if (!isOpen || _code == null) return PairCodeCheck.closed;
    if (isExpired) return PairCodeCheck.expired;
    if (constantTimeEquals(typed.trim(), _code!)) {
      // One use only.
      _issue();
      return PairCodeCheck.ok;
    }
    _attempts++;
    if (_attempts >= maxAttempts) {
      _issue();
    } else {
      notifyListeners();
    }
    return PairCodeCheck.wrong;
  }

  void _issue() {
    _code = _random.nextInt(1000000).toString().padLeft(6, '0');
    _expiresAt = _now().add(lifetime);
    _attempts = 0;
    notifyListeners();
  }
}

// ── Auth failures ───────────────────────────────────────────────────

/// Blocks an address for [blockFor] after [maxFailures] failed pairings or
/// hellos within [window].
class AuthFailureLimiter {
  AuthFailureLimiter({
    RemoteClock? now,
    this.maxFailures = 5,
    this.window = const Duration(minutes: 1),
    this.blockFor = const Duration(minutes: 1),
    this.maxTracked = 256,
  }) : _now = now ?? _systemNow;

  final RemoteClock _now;
  final int maxFailures;
  final Duration window;
  final Duration blockFor;
  final int maxTracked;

  final Map<String, List<DateTime>> _failures = {};
  final Map<String, DateTime> _blockedUntil = {};

  bool isBlocked(String address) {
    final until = _blockedUntil[address];
    if (until == null) return false;
    if (_now().isBefore(until)) return true;
    _blockedUntil.remove(address);
    return false;
  }

  void recordFailure(String address) {
    final now = _now();
    _prune(now);
    final list = _failures.putIfAbsent(address, () => []);
    list.add(now);
    if (list.length >= maxFailures) {
      _blockedUntil[address] = now.add(blockFor);
      _failures.remove(address);
    }
  }

  void recordSuccess(String address) => _failures.remove(address);

  void _prune(DateTime now) {
    final cutoff = now.subtract(window);
    _failures.removeWhere((_, times) {
      times.removeWhere((t) => t.isBefore(cutoff));
      return times.isEmpty;
    });
    _blockedUntil.removeWhere((_, until) => !now.isBefore(until));
    // A flood of addresses can't grow the maps without bound.
    while (_failures.length > maxTracked) {
      _failures.remove(_failures.keys.first);
    }
  }
}

// ── Paired devices (host side) ──────────────────────────────────────

@immutable
class PairedDevice {
  const PairedDevice({
    required this.id,
    required this.name,
    required this.tokenHash,
    required this.pairedAt,
    required this.lastSeen,
  });

  final String id;
  final String name;

  /// SHA-256 of the token; the token itself is never stored on the host.
  final String tokenHash;
  final DateTime pairedAt;
  final DateTime lastSeen;

  PairedDevice copyWith({DateTime? lastSeen}) => PairedDevice(
    id: id,
    name: name,
    tokenHash: tokenHash,
    pairedAt: pairedAt,
    lastSeen: lastSeen ?? this.lastSeen,
  );

  Map<String, Object?> toJson() => {
    'id': id,
    'name': name,
    'tokenHash': tokenHash,
    'pairedAt': pairedAt.millisecondsSinceEpoch,
    'lastSeen': lastSeen.millisecondsSinceEpoch,
  };

  static PairedDevice? fromJson(Object? json) {
    if (json is! Map) return null;
    final id = json['id'];
    final hash = json['tokenHash'];
    if (id is! String || hash is! String || hash.length != 64) return null;
    DateTime time(Object? v) =>
        DateTime.fromMillisecondsSinceEpoch(v is int ? v : 0);
    return PairedDevice(
      id: id,
      name: cleanRemoteName(
        json['name'] is String ? json['name'] as String : '',
      ),
      tokenHash: hash,
      pairedAt: time(json['pairedAt']),
      lastSeen: time(json['lastSeen']),
    );
  }
}

/// The host's paired devices, kept in SharedPreferences (device-wide, not per
/// account). Tokens are stored only as hashes.
class PairedDeviceStore extends ChangeNotifier {
  PairedDeviceStore({Random? random, RemoteClock? now, this.maxDevices = 20})
    : _random = random ?? Random.secure(),
      _now = now ?? _systemNow;

  static const prefKey = 'remote_link_paired_devices';

  final Random _random;
  final RemoteClock _now;
  final int maxDevices;

  List<PairedDevice> _devices = const [];
  bool _loaded = false;

  List<PairedDevice> get devices => _devices;

  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(prefKey);
    if (raw == null) return;
    try {
      final list = jsonDecode(raw);
      if (list is List) {
        _devices = List.unmodifiable(
          list.map(PairedDevice.fromJson).whereType<PairedDevice>(),
        );
        notifyListeners();
      }
    } catch (_) {
      // A damaged list pairs nothing; the user pairs again.
    }
  }

  /// Pairs a new device and returns it with its token (the only time the
  /// token exists on the host).
  Future<({PairedDevice device, String token})> add(String name) async {
    await load();
    final token = newRemoteToken(_random);
    final now = _now();
    final device = PairedDevice(
      id: newRemoteToken(_random).substring(0, 16),
      name: cleanRemoteName(name).isEmpty ? 'Remote' : cleanRemoteName(name),
      tokenHash: hashRemoteToken(token),
      pairedAt: now,
      lastSeen: now,
    );
    final next = [..._devices, device];
    // Over the limit: the one unused for longest goes.
    while (next.length > maxDevices) {
      next.sort((a, b) => a.lastSeen.compareTo(b.lastSeen));
      next.removeAt(0);
    }
    await _save(next);
    return (device: device, token: token);
  }

  /// The device holding [token], or null.
  PairedDevice? match(String token) {
    final hash = hashRemoteToken(token);
    PairedDevice? found;
    for (final d in _devices) {
      if (constantTimeEquals(d.tokenHash, hash)) found = d;
    }
    return found;
  }

  Future<void> touch(String id) async {
    final now = _now();
    await _save([
      for (final d in _devices) d.id == id ? d.copyWith(lastSeen: now) : d,
    ]);
  }

  Future<bool> forget(String id) async {
    await load();
    final next = _devices.where((d) => d.id != id).toList();
    if (next.length == _devices.length) return false;
    await _save(next);
    return true;
  }

  Future<void> _save(List<PairedDevice> devices) async {
    _devices = List.unmodifiable(devices);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      prefKey,
      jsonEncode([for (final d in devices) d.toJson()]),
    );
  }
}

/// The host's own random id, made once per device.
Future<String> loadRemoteHostId([Random? random]) async {
  const key = 'remote_link_host_id';
  final prefs = await SharedPreferences.getInstance();
  final existing = prefs.getString(key);
  if (existing != null && existing.isNotEmpty) return existing;
  final id = newRemoteToken(random).substring(0, 22);
  await prefs.setString(key, id);
  return id;
}

// ── Saved hosts (remote side) ───────────────────────────────────────

@immutable
class SavedRemoteHost {
  const SavedRemoteHost({
    required this.hostId,
    required this.name,
    required this.address,
    required this.port,
    required this.token,
  });

  final String hostId;
  final String name;
  final String address;
  final int port;

  /// Secret: never log it.
  final String token;

  SavedRemoteHost copyWith({String? name, String? address, int? port}) =>
      SavedRemoteHost(
        hostId: hostId,
        name: name ?? this.name,
        address: address ?? this.address,
        port: port ?? this.port,
        token: token,
      );

  Map<String, Object?> toJson() => {
    'hostId': hostId,
    'name': name,
    'address': address,
    'port': port,
    'token': token,
  };

  static SavedRemoteHost? fromJson(Object? json) {
    if (json is! Map) return null;
    final hostId = json['hostId'];
    final token = json['token'];
    final address = json['address'];
    final port = json['port'];
    if (hostId is! String || token is! String || address is! String) {
      return null;
    }
    if (port is! int) return null;
    return SavedRemoteHost(
      hostId: hostId,
      name: json['name'] is String ? json['name'] as String : '',
      address: address,
      port: port,
      token: token,
    );
  }

  @override
  String toString() => 'SavedRemoteHost($hostId, $name, $address:$port)';
}

/// The hosts this device has paired with (as a remote), by host id.
class RemoteHostBook {
  const RemoteHostBook();

  static const prefKey = 'remote_link_hosts';

  Future<List<SavedRemoteHost>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(prefKey);
    if (raw == null) return const [];
    try {
      final list = jsonDecode(raw);
      if (list is! List) return const [];
      return list
          .map(SavedRemoteHost.fromJson)
          .whereType<SavedRemoteHost>()
          .toList();
    } catch (_) {
      return const [];
    }
  }

  Future<SavedRemoteHost?> find(String hostId) async {
    for (final h in await load()) {
      if (h.hostId == hostId) return h;
    }
    return null;
  }

  // Saves and forgets run one after another, so two can't lose each other.
  static Future<void> _queue = Future.value();
  static Future<void> _serial(Future<void> Function() task) {
    final run = _queue.then((_) => task());
    _queue = run.catchError((Object _) {});
    return run;
  }

  /// Adds or replaces the entry for [host]'s id.
  Future<void> save(SavedRemoteHost host) => _serial(() async {
    final hosts = (await load()).where((h) => h.hostId != host.hostId).toList()
      ..insert(0, host);
    await _write(hosts);
  });

  Future<void> forget(String hostId) => _serial(() async {
    await _write((await load()).where((h) => h.hostId != hostId).toList());
  });

  Future<void> _write(List<SavedRemoteHost> hosts) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      prefKey,
      jsonEncode([for (final h in hosts) h.toJson()]),
    );
  }
}
