import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pending_writes.dart';
import 'scoped_prefs.dart';
import 'user_account_service.dart';

/// The streaming listening safety buffer, kept in memory and written with
/// the progress save (Absorb Plus).
///
/// While streaming, every 5 s tick banked the seconds in their own
/// preference (`streaming_pending_<id>`) right after the progress save
/// (`progress_<id>`). On Windows each preference write rewrites the whole
/// preferences file on the UI thread, so that doubled the writes. Now:
/// - [add] only counts in memory, and the progress save of the same tick
///   carries the count inside the progress record (field [field]) through
///   [attach];
/// - a count no progress save has picked up for [fallbackDelay] (a pause, a
///   skipped save) is written on its own, and on exit through
///   [PendingWrites]. The delay is longer than the 5 s tick, so while
///   playing the next tick's save always gets there first;
/// - [reduce] (after the server confirmed a sync) is written at once, so a
///   kill can never ship already-reported seconds a second time, and checked
///   again later in case a progress save in flight wrote the older count.
///
/// The persisted count is the record field plus the legacy key, which is
/// still read (from older builds) and used when an item has no progress
/// record yet.
class StreamingPendingLedger {
  StreamingPendingLedger({
    this.fallbackDelay = const Duration(seconds: 7),
    String Function()? scope,
    Future<SharedPreferences> Function()? prefs,
    bool flushOnExit = true,
  }) : _scope = scope ?? (() => UserAccountService().activeScopeKey),
       _prefsFactory = prefs ?? SharedPreferences.getInstance {
    if (flushOnExit) PendingWrites.register(this, flush);
  }

  static const field = 'streamingPending';
  static String legacyKey(String itemId) => 'streaming_pending_$itemId';
  static String recordKey(String itemId) => 'progress_$itemId';

  final Duration fallbackDelay;
  final String Function() _scope;
  final Future<SharedPreferences> Function() _prefsFactory;
  final Map<String, int> _seconds = {};
  // Counts whose legacy key exists in storage (seeded from it, or written to
  // it while the item had no progress record).
  final Set<String> _legacyKnown = {};
  final Map<String, (String, String)> _owners = {}; // key -> (scope, itemId)
  // Counts not written yet, with the time they first went unwritten.
  final Map<String, DateTime> _dirty = {};
  Timer? _timer;

  Future<SharedPreferences> _p() => _prefsFactory();

  static String _k(String scope, String itemId) => '$scope\u0000$itemId';

  int? _legacy(SharedPreferences p, String scope, String itemId) {
    try {
      return p.getInt(ScopedPrefs.keyForScope(scope, legacyKey(itemId)));
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic>? _record(
    SharedPreferences p,
    String scope,
    String itemId,
  ) {
    final raw = p.getString(ScopedPrefs.keyForScope(scope, recordKey(itemId)));
    if (raw == null) return null;
    try {
      final v = jsonDecode(raw);
      return v is Map<String, dynamic> ? v : null;
    } catch (_) {
      return null;
    }
  }

  int _persisted(SharedPreferences p, String scope, String itemId) =>
      (_legacy(p, scope, itemId) ?? 0) +
      ((_record(p, scope, itemId)?[field] as num?)?.toInt() ?? 0);

  /// The in-memory count for [k], read from storage the first time.
  int _seed(SharedPreferences p, String k, String scope, String itemId) {
    final live = _seconds[k];
    if (live != null) return live;
    if (_legacy(p, scope, itemId) != null) _legacyKnown.add(k);
    _owners[k] = (scope, itemId);
    return _seconds[k] = _persisted(p, scope, itemId);
  }

  /// Counts [seconds] for [itemId]. Written with the next progress save.
  ///
  /// Once the item is in memory this counts synchronously, before the first
  /// await: the player starts the tick's progress save just before calling
  /// this, so that save (still waiting on its own read) then carries this
  /// tick's count.
  Future<void> add(String itemId, int seconds) async {
    if (seconds <= 0) return;
    final scope = _scope();
    final k = _k(scope, itemId);
    final live = _seconds[k];
    if (live != null) {
      _seconds[k] = live + seconds;
      _markDirty(k);
      return;
    }
    final p = await _p();
    _seconds[k] = _seed(p, k, scope, itemId) + seconds;
    _markDirty(k);
  }

  void _markDirty(String k) {
    _dirty.putIfAbsent(k, DateTime.now);
    _timer ??= Timer(fallbackDelay, () => unawaited(_writeOverdue()));
  }

  /// Writes the counts that waited [fallbackDelay] for a progress save.
  Future<void> _writeOverdue() async {
    _timer = null;
    final now = DateTime.now();
    DateTime? nextDue;
    for (final e in _dirty.entries.toList()) {
      final due = e.value.add(fallbackDelay);
      if (!due.isAfter(now)) {
        try {
          await _persist(e.key);
        } catch (err) {
          debugPrint('[Sync] streaming buffer write failed: $err');
        }
      } else if (nextDue == null || due.isBefore(nextDue)) {
        nextDue = due;
      }
    }
    if (nextDue != null && _timer == null) {
      _timer = Timer(nextDue.difference(now), () => unawaited(_writeOverdue()));
    }
  }

  /// The buffered seconds for [itemId].
  Future<int> current(String itemId) async {
    final scope = _scope();
    final live = _seconds[_k(scope, itemId)];
    if (live != null) return live;
    return _persisted(await _p(), scope, itemId);
  }

  /// Takes [seconds] off after a sync confirmed them, and writes that now.
  Future<void> reduce(String itemId, int seconds) async {
    if (seconds <= 0) return;
    final scope = _scope();
    final p = await _p();
    final k = _k(scope, itemId);
    _seconds[k] = math.max(0, _seed(p, k, scope, itemId) - seconds);
    await _persist(k);
    // A progress save that attached the older count before this ran may
    // still land after it: check again later (no write if it matches).
    _markDirty(k);
  }

  /// Called by the progress save just before it writes [data] (the new
  /// progress record of [itemId]): puts the buffered count in it. [existing]
  /// is the record being replaced, whose count carries over when nothing is
  /// buffered in memory.
  void attach(
    String itemId,
    Map<String, dynamic> data,
    Map<String, dynamic>? existing,
  ) {
    final scope = _scope();
    final k = _k(scope, itemId);
    final carried = (existing?[field] as num?)?.toInt() ?? 0;
    var secs = carried;
    final live = _seconds[k];
    // With a legacy key still present the memory count includes it; the
    // fallback write moves it into the record and drops the key together.
    if (live != null && !_legacyKnown.contains(k)) {
      secs = live;
      _dirty.remove(k);
    }
    if (secs > 0) data[field] = secs;
  }

  /// Before the progress record of [itemId] is deleted: keep the count in
  /// the legacy key so it is not lost with the record.
  Future<void> keepBeforeDelete(String itemId) async {
    final scope = _scope();
    final p = await _p();
    final k = _k(scope, itemId);
    final secs = _seed(p, k, scope, itemId);
    if (secs > 0) {
      await p.setInt(ScopedPrefs.keyForScope(scope, legacyKey(itemId)), secs);
      _legacyKnown.add(k);
    }
  }

  /// At launch: the count a killed stream left behind for [itemId], cleared
  /// from storage and memory.
  Future<int> takeOrphan(String itemId) async {
    final scope = _scope();
    final p = await _p();
    final k = _k(scope, itemId);
    final secs = _persisted(p, scope, itemId);
    _seconds.remove(k);
    _dirty.remove(k);
    _legacyKnown.remove(k);
    final legacy = ScopedPrefs.keyForScope(scope, legacyKey(itemId));
    if (p.containsKey(legacy)) await p.remove(legacy);
    final record = _record(p, scope, itemId);
    if (record != null && record.containsKey(field)) {
      record.remove(field);
      await p.setString(
        ScopedPrefs.keyForScope(scope, recordKey(itemId)),
        jsonEncode(record),
      );
    }
    return secs;
  }

  Future<void> _persist(String k) async {
    final owner = _owners[k];
    if (owner == null) return;
    final (scope, itemId) = owner;
    final p = await _p();
    final secs = _seconds[k] ?? 0;
    _dirty.remove(k);
    final legacy = ScopedPrefs.keyForScope(scope, legacyKey(itemId));
    final record = _record(p, scope, itemId);
    if (record != null) {
      final had = (record[field] as num?)?.toInt() ?? 0;
      if (had != secs) {
        if (secs > 0) {
          record[field] = secs;
        } else {
          record.remove(field);
        }
        await p.setString(
          ScopedPrefs.keyForScope(scope, recordKey(itemId)),
          jsonEncode(record),
        );
      }
      if (p.containsKey(legacy)) await p.remove(legacy);
      _legacyKnown.remove(k);
    } else {
      // No progress record yet: the separate key holds the count.
      if ((_legacy(p, scope, itemId) ?? 0) != secs) {
        if (secs > 0) {
          await p.setInt(legacy, secs);
        } else {
          await p.remove(legacy);
        }
      }
      if (secs > 0) {
        _legacyKnown.add(k);
      } else {
        _legacyKnown.remove(k);
      }
    }
  }

  /// Writes every count no progress save has picked up yet.
  Future<void> flush() async {
    _timer?.cancel();
    _timer = null;
    for (final k in _dirty.keys.toList()) {
      try {
        await _persist(k);
      } catch (e) {
        debugPrint('[Sync] streaming buffer write failed: $e');
      }
    }
  }

  @visibleForTesting
  bool get hasUnwritten => _dirty.isNotEmpty;

  @visibleForTesting
  void dispose() {
    _timer?.cancel();
    _timer = null;
    PendingWrites.unregister(this);
  }
}
