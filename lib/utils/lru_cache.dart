// Absorb Plus: a small least-recently-used cache.
//
// Used for in-memory caches that would otherwise grow for the whole session
// (series books, sub-series, the Series tab). Reading or writing an entry
// marks it most recently used; adding past [capacity] drops the oldest.
import 'dart:collection';

class LruCache<K, V> {
  LruCache(this.capacity) : assert(capacity > 0);

  final int capacity;

  // LinkedHashMap keeps insertion order; re-inserting moves a key to the end.
  final LinkedHashMap<K, V> _entries = LinkedHashMap<K, V>();

  int get length => _entries.length;
  Iterable<K> get keys => _entries.keys;

  bool containsKey(K key) => _entries.containsKey(key);

  V? operator [](K key) {
    if (!_entries.containsKey(key)) return null;
    final value = _entries.remove(key) as V;
    _entries[key] = value;
    return value;
  }

  void operator []=(K key, V value) {
    _entries.remove(key);
    _entries[key] = value;
    while (_entries.length > capacity) {
      _entries.remove(_entries.keys.first);
    }
  }

  V? remove(K key) => _entries.remove(key);

  void clear() => _entries.clear();
}
