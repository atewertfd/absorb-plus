// Absorb Plus: a download's saved session JSON (`sessionData`), parsed once
// per distinct string instead of again at every place that reads it.
import 'dart:convert';

import 'lru_cache.dart';

/// Decodes saved session JSON, keeping the parsed result for each distinct
/// string. A download's `sessionData` only changes when the download is
/// saved again, and a changed string is a new key, so a stale result is never
/// returned.
///
/// Every call gets its own deep copy, exactly as a fresh `jsonDecode` would
/// give: callers may change or keep what they get. Copying the parsed maps
/// takes about half the time of parsing the string again.
class SessionJsonCache {
  // Book session JSON is trimmed at download time (a few KB to ~15 KB), so
  // 128 parsed entries stay within a few MB.
  SessionJsonCache({int capacity = 128, Object? Function(String source)? decode})
      : _entries = LruCache<String, Map<String, dynamic>?>(capacity),
        _decode = decode ?? jsonDecode;

  final LruCache<String, Map<String, dynamic>?> _entries;
  final Object? Function(String source) _decode;

  /// A fresh copy of the decoded object, or null when [raw] is null, isn't
  /// valid JSON, or isn't a JSON object - where the old
  /// `jsonDecode(raw) as Map` threw.
  Map<String, dynamic>? operator [](String? raw) {
    if (raw == null) return null;
    final Map<String, dynamic>? parsed;
    if (_entries.containsKey(raw)) {
      parsed = _entries[raw];
    } else {
      Map<String, dynamic>? decoded;
      try {
        final value = _decode(raw);
        if (value is Map<String, dynamic>) decoded = value;
      } catch (_) {
        // Malformed JSON reads as null, as the callers' own catch did before.
      }
      _entries[raw] = parsed = decoded;
    }
    return parsed == null ? null : _copyMap(parsed);
  }

  /// Drops everything; called when the account changes or signs out.
  void clear() => _entries.clear();

  static Map<String, dynamic> _copyMap(Map<String, dynamic> m) =>
      <String, dynamic>{for (final e in m.entries) e.key: _copy(e.value)};

  static Object? _copy(Object? v) {
    if (v is Map<String, dynamic>) return _copyMap(v);
    if (v is List) return <dynamic>[for (final x in v) _copy(x)];
    return v;
  }
}

/// The app-wide cache for downloads' session JSON.
final sessionJsonCache = SessionJsonCache();
