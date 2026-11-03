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
// - A write request that may change items, a sign-out or an account switch
//   clears it; a socket item or progress event, or a write to one item,
//   forgets just that item. An answer that was in flight across either is
//   not stored. Playback session syncs and token refreshes leave it alone
//   (audit S10): they used to wipe it every few seconds while playing, and
//   the server's progress event for the item forgets it anyway.

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

  /// A counter stamped on every fetch start and every [forgetItem], so a
  /// fetch can tell whether its item was forgotten while it ran without one
  /// item's event throwing away every other item's answer.
  int _tick = 0;
  final Map<String, int> _forgotAt = {};

  /// More forgotten items than this: drop the stamps and move the global
  /// generation instead (every running fetch then goes unstored, which is
  /// always safe), so the map can't grow without bound.
  static const _maxForgotten = 256;

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
    final startedAt = ++_tick;
    final future = load().then((body) {
      final forgotten = (_forgotAt[key.itemId] ?? 0) > startedAt;
      if (body != null && generation == _generation && !forgotten) {
        _store(key, body);
      }
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

  /// Forgets one item (a socket event said it changed, or a write to it).
  void forgetItem(String itemId) {
    if (_forgotAt.length >= _maxForgotten && !_forgotAt.containsKey(itemId)) {
      _forgotAt.clear();
      _generation++;
    }
    _forgotAt[itemId] = ++_tick;
    _bodies.removeWhere((k, _) => k.itemId == itemId);
    _inFlight.removeWhere((k, _) => k.itemId == itemId);
  }

  /// Forgets everything (a write request, sign-out, account switch).
  void clear() {
    _generation++;
    _forgotAt.clear();
    _bodies.clear();
    _inFlight.clear();
  }

  /// What a POST, PATCH or DELETE to [url] makes stale (audit S10).
  ///
  /// - Playback session syncs, closes and local sessions: nothing. They run
  ///   every few seconds while playing; the progress they carry reaches
  ///   cached items through the server's progress event ([forgetItem]).
  /// - Sign-in, sign-out and token refresh: nothing (a new token misses).
  /// - `/api/items/:id/...`, `/api/podcasts/:id/...`,
  ///   `/api/tools/item/:id/...` and a PATCH of `/api/me/progress/:itemId`:
  ///   that item only.
  /// - Anything else (batch edits, scans, unknown paths): everything.
  void invalidateForWrite(String method, Uri url) {
    final seg = url.pathSegments;
    final api = seg.indexOf('api');
    if (api < 0) {
      final last = seg.isEmpty ? '' : seg.last;
      if (const {'login', 'logout', 'refresh'}.contains(last)) return;
      clear();
      return;
    }
    final rest = seg.sublist(api + 1);
    String? at(int i) => i < rest.length && rest[i].isNotEmpty ? rest[i] : null;
    switch (at(0)) {
      case 'session':
        return;
      case 'items' || 'podcasts':
        final id = at(1);
        if (id != null && id != 'batch') return forgetItem(id);
      case 'tools':
        final id = at(1) == 'item' ? at(2) : null;
        if (id != null) return forgetItem(id);
      case 'me':
        // PATCH /api/me/progress/:itemId names the item; DELETE names the
        // progress record, so that one clears everything.
        final id = method == 'PATCH' && at(1) == 'progress' ? at(2) : null;
        if (id != null && id != 'batch') return forgetItem(id);
    }
    clear();
  }
}
