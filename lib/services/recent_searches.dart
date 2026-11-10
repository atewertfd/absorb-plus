import 'scoped_prefs.dart';

/// The library search terms a user actually ran (submitted, or opened a
/// result from), most recent first. Kept per account through [ScopedPrefs],
/// never globally, so one account's searches never show for another.
class RecentSearches {
  RecentSearches({
    Future<List<String>> Function(String key)? read,
    Future<void> Function(String key, List<String> value)? write,
  })  : _read = read ?? ScopedPrefs.getStringList,
        _write = write ?? ScopedPrefs.setStringList;

  static const prefsKey = 'recent_library_searches';
  static const maxTerms = 8;

  final Future<List<String>> Function(String key) _read;
  final Future<void> Function(String key, List<String> value) _write;

  Future<List<String>> load() async {
    final stored = await _read(prefsKey);
    // Tidy whatever is stored, in case an older or hand-edited list slipped
    // past the rules add() keeps.
    var out = <String>[];
    for (final t in stored) {
      out = withTerm(out, t, front: false);
    }
    return out;
  }

  /// Records [term] as the newest search and returns the updated list.
  Future<List<String>> add(String term) async {
    final current = await load();
    final next = withTerm(current, term);
    if (!_sameList(current, next)) await _write(prefsKey, next);
    return next;
  }

  /// Forgets one term (matched case-insensitively).
  Future<List<String>> remove(String term) async {
    final current = await load();
    final key = term.trim().toLowerCase();
    final next = [for (final t in current) if (t.toLowerCase() != key) t];
    if (next.length != current.length) await _write(prefsKey, next);
    return next;
  }

  Future<void> clear() => _write(prefsKey, const []);

  /// [terms] with [term] trimmed and added, any case-insensitive duplicate
  /// dropped, and the list capped at [maxTerms]. The new term goes first
  /// unless [front] is false (used to rebuild a list in its stored order).
  static List<String> withTerm(List<String> terms, String term,
      {bool front = true}) {
    final t = term.trim();
    if (t.isEmpty) return List.of(terms);
    final key = t.toLowerCase();
    if (!front && terms.any((e) => e.toLowerCase() == key)) {
      return List.of(terms);
    }
    final rest = [for (final e in terms) if (e.toLowerCase() != key) e];
    final out = front ? [t, ...rest] : [...rest, t];
    return out.length > maxTerms ? out.sublist(0, maxTerms) : out;
  }

  static bool _sameList(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
