// Absorb Plus (B10): shared in-flight requests and a short cache for
// `GET /api/items/:id`.
//
// Many screens and services ask for the same item at once (detail sheet,
// player, queue, podcast title hydration). Concurrent asks now share one
// request, and an answer is reused for [ttl].
//
// Safety:
// - The key holds the server and the access token, so one account never
//   gets another's answer (a refreshed token simply misses).
// - The cached value is the response body; each caller decodes its own
//   copy, so a caller changing its map can't change anyone else's.
// - Any write request, socket item event, sign-out or account switch clears
//   it, and an answer that was in flight across a clear is not stored.

typedef LibraryItemCacheKey = ({
  String server,
  String token,
  String itemId,
  String query,
});

class LibraryItemRequestCache {
  LibraryItemRequestCache({
    this.ttl = const Duration(seconds: 30),
    this.maxEntries = 64,
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now;

  static final LibraryItemRequestCache instance = LibraryItemRequestCache();

  final Duration ttl;
  final int maxEntries;
  final DateTime Function() _now;

  final Map<LibraryItemCacheKey, ({DateTime at, String body})> _bodies = {};
  final Map<LibraryItemCacheKey, Future<String?>> _inFlight = {};
  int _generation = 0;

  int get length => _bodies.length;

  /// The body for [key]: from the cache, from a request already running, or
  /// from [load]. [load] returns null for an answer that must not be cached
  /// (an error status). [fresh] skips both the cache and a running request.
  Future<String?> fetch(
    LibraryItemCacheKey key,
    Future<String?> Function() load, {
    bool fresh = false,
  }) {
    if (!fresh) {
      final hit = _bodies[key];
      if (hit != null) {
        if (_now().difference(hit.at) < ttl) return Future.value(hit.body);
        _bodies.remove(key);
      }
      final running = _inFlight[key];
      if (running != null) return running;
    }
    final generation = _generation;
    final future = load().then((body) {
      if (body != null && generation == _generation) _store(key, body);
      return body;
    });
    _inFlight[key] = future;
    void done() {
      if (identical(_inFlight[key], future)) _inFlight.remove(key);
    }

    future.then((_) => done(), onError: (Object _) => done());
    return future;
  }

  void _store(LibraryItemCacheKey key, String body) {
    _bodies.remove(key);
    _bodies[key] = (at: _now(), body: body);
    while (_bodies.length > maxEntries) {
      _bodies.remove(_bodies.keys.first);
    }
  }

  /// Forgets one item (a socket event said it changed).
  void forgetItem(String itemId) {
    _generation++;
    _bodies.removeWhere((k, _) => k.itemId == itemId);
    _inFlight.removeWhere((k, _) => k.itemId == itemId);
  }

  /// Forgets everything (a write request, sign-out, account switch).
  void clear() {
    _generation++;
    _bodies.clear();
    _inFlight.clear();
  }
}
