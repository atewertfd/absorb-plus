import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'protocol.dart';
import 'remote_crypto.dart';

/// Phone remote (fork): pairing codes, paired devices and the auth-failure
/// limiter on the host, and the remote's saved hosts. Pure Dart (web-safe);
/// clocks and randomness are injectable for tests.

typedef RemoteClock = DateTime Function();

DateTime _systemNow() => DateTime.now();

// ── Pairing window ──────────────────────────────────────────────────

/// Result of checking a typed code.
enum PairCodeCheck { ok, wrong, expired, closed }

/// The host's pairing window and its 6-digit code. Pairing is possible only
/// while a window is open: turning the host on or "Pair another device"
/// opens one for [lifetime]. The code works once: the window closes when a
/// device gets in, after [maxAttempts] wrong tries, when it runs out, or
/// when the host sheet closes.
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

  bool get isOpen => _code != null && _now().isBefore(_expiresAt!);

  /// The current code, or null while pairing is closed.
  String? get code => isOpen ? _code : null;

  DateTime? get expiresAt => isOpen ? _expiresAt : null;

  /// Opens a fresh window with a new code.
  void open() {
    _code = _random.nextInt(1000000).toString().padLeft(6, '0');
    _expiresAt = _now().add(lifetime);
    _attempts = 0;
    notifyListeners();
  }

  /// Closes the window; the code is gone.
  void close() {
    if (_code == null) return;
    _code = null;
    _expiresAt = null;
    _attempts = 0;
    notifyListeners();
  }

  /// Drops a window that ran out (the host sheet's tick).
  void closeIfExpired() {
    if (_code != null && !isOpen) close();
  }

  PairCodeCheck check(String typed) {
    final code = _code;
    if (code == null) return PairCodeCheck.closed;
    if (!isOpen) {
      close();
      return PairCodeCheck.expired;
    }
    if (constantTimeEquals(typed.trim(), code)) {
      // One use only: the window closes.
      close();
      return PairCodeCheck.ok;
    }
    _attempts++;
    if (_attempts >= maxAttempts) {
      close();
    } else {
      notifyListeners();
    }
    return PairCodeCheck.wrong;
  }
}

// ── Auth failures ───────────────────────────────────────────────────

/// Blocks an address for [blockFor] after [maxFailures] failed pairings or
/// logins within [window].
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

  /// SHA-256 of the token, which is also the device's login key
  /// (`remote_crypto.dart`); the token itself is never on the host.
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
/// account). Tokens are stored only as hashes. At most [maxDevices]; a
/// device unused for [maxUnused] is forgotten.
class PairedDeviceStore extends ChangeNotifier {
  PairedDeviceStore({
    Random? random,
    RemoteClock? now,
    this.maxDevices = 5,
    this.maxUnused = const Duration(days: 90),
  }) : _random = random ?? Random.secure(),
       _now = now ?? _systemNow;

  static const prefKey = 'remote_link_paired_devices';

  final Random _random;
  final RemoteClock _now;
  final int maxDevices;
  final Duration maxUnused;

  List<PairedDevice> _devices = const [];
  bool _loaded = false;

  List<PairedDevice> get devices => _devices;

  bool get isFull => _devices.length >= maxDevices;

  Future<void> load() async {
    if (_loaded) {
      await pruneUnused();
      return;
    }
    _loaded = true;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(prefKey);
    if (raw != null) {
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
    await pruneUnused();
  }

  /// Forgets devices not used for [maxUnused].
  Future<void> pruneUnused() async {
    final cutoff = _now().subtract(maxUnused);
    final kept = _devices.where((d) => d.lastSeen.isAfter(cutoff)).toList();
    if (kept.length != _devices.length) await _save(kept);
  }

  /// Pairs a new device whose token hashes to [tokenHash]. Null when
  /// [maxDevices] are already paired.
  Future<PairedDevice?> add(String name, {required String tokenHash}) async {
    await load();
    if (isFull) return null;
    final now = _now();
    final clean = cleanRemoteName(name);
    final device = PairedDevice(
      id: newRemoteSecret(_random).substring(0, 16),
      name: clean.isEmpty ? 'Remote' : clean,
      tokenHash: tokenHash,
      pairedAt: now,
      lastSeen: now,
    );
    await _save([..._devices, device]);
    return device;
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

  Future<void> forgetAll() async {
    await load();
    if (_devices.isEmpty) return;
    await _save(const []);
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
  final id = newRemoteSecret(random).substring(0, 22);
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

  /// Secret: never log it or send it.
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
      return const []; // A damaged list: the user pairs again.
    }
  }

  Future<SavedRemoteHost?> find(String hostId) async {
    for (final h in await load()) {
      if (h.hostId == hostId) return h;
    }
    return null;
  }

  // Saves and forgets run one after another, so two can't lose each other.
  // A fresh chain once idle, so a finished one is never resumed later
  // (tests run each case in its own zone).
  static Future<void> _queue = Future.value();
  static int _busy = 0;
  static Future<void> _serial(Future<void> Function() task) {
    if (_busy == 0) _queue = Future<void>.value();
    _busy++;
    final run = _queue.then((_) => task());
    _queue = run.then<void>((_) {}, onError: (Object _) {}).whenComplete(
      () => _busy--,
    );
    return run;
  }

  /// Adds or replaces the entry for [host]'s id.
  Future<void> save(SavedRemoteHost host) => _serial(() async {
    final hosts = (await load()).where((h) => h.hostId != host.hostId).toList()
      ..insert(0, host);
    await _write(hosts);
  });

  /// A paired computer answered from a new address: remember it there.
  /// Only the address and port change (the token stays with the host id).
  Future<void> moved(String hostId, String address, int port) =>
      _serial(() async {
        final hosts = (await load()).toList();
        final i = hosts.indexWhere((h) => h.hostId == hostId);
        if (i < 0) return;
        final h = hosts[i];
        if (h.address == address && h.port == port) return;
        hosts[i] = h.copyWith(address: address, port: port);
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
