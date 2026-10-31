import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'json_file_store.dart';
import 'scoped_prefs.dart';

/// The Stats page's offline copy of the listening stats and the first page of
/// sessions, per account (Absorb Plus).
///
/// They used to be the `cached_stats` / `cached_sessions` preferences. The
/// sessions list is large, and on Windows each preference write rewrites the
/// whole preferences file on the UI thread, so native builds keep them in
/// `stats_cache.json` in app support storage. An account's old preference
/// copy is moved into the file on first read and removed once the file is
/// confirmed. Web keeps the preferences.
class StatsCacheStore {
  StatsCacheStore._(this._file);

  static final StatsCacheStore instance = StatsCacheStore._(
    kIsWeb
        ? null
        : JsonFileStore(fileName, validate: (v) => v is Map<String, dynamic>),
  );

  @visibleForTesting
  StatsCacheStore.forTesting(JsonFileStore? file) : _file = file;

  static const fileName = 'stats_cache.json';
  static const legacyStatsKey = 'cached_stats';
  static const legacySessionsKey = 'cached_sessions';

  final JsonFileStore? _file;
  Map<String, dynamic>? _data; // scope -> {'stats': {...}, 'sessions': [...]}
  Future<void>? _loading;

  Future<void> _ensureLoaded() => _loading ??= () async {
    final read = await _file!.read();
    final value = read.value;
    _data = value is Map<String, dynamic> ? value : <String, dynamic>{};
  }();

  Map<String, dynamic>? _decodeMap(String? raw) {
    if (raw == null) return null;
    try {
      final v = jsonDecode(raw);
      return v is Map<String, dynamic> ? v : null;
    } catch (_) {
      return null;
    }
  }

  List<dynamic>? _decodeList(String? raw) {
    if (raw == null) return null;
    try {
      final v = jsonDecode(raw);
      return v is List<dynamic> ? v : null;
    } catch (_) {
      return null;
    }
  }

  /// The cached stats and sessions for [scope] (either may be null).
  Future<({Map<String, dynamic>? stats, List<dynamic>? sessions})> read(
    String scope,
  ) async {
    final statsKey = ScopedPrefs.keyForScope(scope, legacyStatsKey);
    final sessionsKey = ScopedPrefs.keyForScope(scope, legacySessionsKey);
    if (_file == null) {
      final prefs = await SharedPreferences.getInstance();
      return (
        stats: _decodeMap(prefs.getString(statsKey)),
        sessions: _decodeList(prefs.getString(sessionsKey)),
      );
    }
    await _ensureLoaded();
    var entry = _data![scope];
    if (entry is! Map<String, dynamic>)
      entry = await _migrate(scope, statsKey, sessionsKey);
    final stats = entry?['stats'];
    final sessions = entry?['sessions'];
    return (
      stats: stats is Map<String, dynamic> ? stats : null,
      sessions: sessions is List<dynamic> ? sessions : null,
    );
  }

  Future<Map<String, dynamic>?> _migrate(
    String scope,
    String statsKey,
    String sessionsKey,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(statsKey) && !prefs.containsKey(sessionsKey)) {
      return null;
    }
    final entry = <String, dynamic>{
      'stats': _decodeMap(prefs.getString(statsKey)),
      'sessions': _decodeList(prefs.getString(sessionsKey)),
    };
    _data![scope] = entry;
    final expected = jsonEncode(_data);
    if (await _file!.writeNow(_data) && await _file.readRawMain() == expected) {
      await prefs.remove(statsKey);
      await prefs.remove(sessionsKey);
    } else {
      debugPrint(
        '[StatsCache] could not confirm $fileName - keeping the preferences copy',
      );
    }
    return entry;
  }

  Future<void> _put(String scope, String field, Object value) async {
    if (_file == null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        ScopedPrefs.keyForScope(
          scope,
          field == 'stats' ? legacyStatsKey : legacySessionsKey,
        ),
        jsonEncode(value),
      );
      return;
    }
    await _ensureLoaded();
    final entry = _data![scope];
    final map = entry is Map<String, dynamic> ? entry : <String, dynamic>{};
    map[field] = value;
    _data![scope] = map;
    _file.schedule(() => _data);
  }

  Future<void> writeStats(String scope, Map<String, dynamic> stats) =>
      _put(scope, 'stats', stats);

  Future<void> writeSessions(String scope, List<dynamic> sessions) =>
      _put(scope, 'sessions', sessions);
}
