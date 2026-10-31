import 'package:shared_preferences/shared_preferences.dart';

/// How many cached playback sessions each account keeps (Absorb Plus).
const kSessionCacheKeep = 10;

final _savedAt = RegExp(r'"savedAt"\s*:\s*(\d+)');

/// Keeps the [keep] most recently saved `session_cache_*` entries under
/// [scopePrefix] (`'<scope>:'`, or empty without an account) and removes the
/// rest. The cache holds chapters and track lists per book and used to grow
/// with every book ever played, all of it inside the preferences file that
/// Windows rewrites in full on every change. Unreadable entries go first.
/// [justSaved] always stays. Returns how many were removed.
Future<int> pruneSessionCaches(
  SharedPreferences prefs,
  String scopePrefix, {
  int keep = kSessionCacheKeep,
  String? justSaved,
}) async {
  final cachePrefix = '${scopePrefix}session_cache_';
  final entries = <(String, int)>[];
  for (final key in prefs.getKeys()) {
    if (!key.startsWith(cachePrefix)) continue;
    if (key == justSaved) {
      entries.add((key, 0x1FFFFFFFFFFFFF)); // newest of all (web-safe int)
      continue;
    }
    var savedAt = 0;
    try {
      final raw = prefs.getString(key);
      final m = raw == null ? null : _savedAt.firstMatch(raw);
      savedAt = m == null ? 0 : int.tryParse(m.group(1)!) ?? 0;
    } catch (_) {}
    entries.add((key, savedAt));
  }
  if (entries.length <= keep) return 0;
  entries.sort((a, b) => b.$2.compareTo(a.$2)); // newest first
  var removed = 0;
  for (final (key, _) in entries.skip(keep)) {
    await prefs.remove(key);
    removed++;
  }
  return removed;
}
