// Absorb Plus: how server push events turn into Home reloads.
//
// A library scan sends a burst of item_added/item_updated (and series)
// events. Each used to reload the whole Home view straight away; these
// helpers gather a burst into one reload and keep the playlists and
// collections Home also fetches from being refetched on every load.

import 'dart:async';

/// What a coalesced refresh should reload.
class PendingRefresh {
  bool home = false;
  bool series = false;
  bool collections = false;

  bool get isEmpty => !home && !series && !collections;
}

/// Gathers bursts of server events into one refresh.
///
/// The refresh runs [quiet] after the last event, or [maxWait] after the
/// first one when events keep coming (a long scan still updates Home now
/// and then instead of never).
class SocketRefreshCoalescer {
  SocketRefreshCoalescer({
    required this.onFlush,
    this.quiet = const Duration(seconds: 3),
    this.maxWait = const Duration(seconds: 15),
  });

  final void Function(PendingRefresh pending) onFlush;
  final Duration quiet;
  final Duration maxWait;

  PendingRefresh _pending = PendingRefresh();
  Timer? _quietTimer;
  Timer? _maxTimer;

  bool get isPending => _quietTimer != null;

  void request({
    bool home = false,
    bool series = false,
    bool collections = false,
  }) {
    _pending.home |= home;
    _pending.series |= series;
    _pending.collections |= collections;
    if (_pending.isEmpty) return;
    _quietTimer?.cancel();
    _quietTimer = Timer(quiet, flush);
    _maxTimer ??= Timer(maxWait, flush);
  }

  /// Runs the pending refresh now (if any).
  void flush() {
    _quietTimer?.cancel();
    _maxTimer?.cancel();
    _quietTimer = null;
    _maxTimer = null;
    final pending = _pending;
    _pending = PendingRefresh();
    if (!pending.isEmpty) onFlush(pending);
  }

  /// Drops anything pending (sign-out, account switch, dispose).
  void cancel() {
    _quietTimer?.cancel();
    _maxTimer?.cancel();
    _quietTimer = null;
    _maxTimer = null;
    _pending = PendingRefresh();
  }
}

/// Whether an item event (its payload is the library item) concerns the
/// library on screen. An event without a library id is assumed to.
bool itemEventIsForLibrary(Map<String, dynamic> data, String? libraryId) {
  final eventLibrary = data['libraryId'];
  if (eventLibrary is! String || eventLibrary.isEmpty) return true;
  return eventLibrary == libraryId;
}

/// Remembers which list a per-library fetch produced and when, so a
/// non-forced load can reuse it within [cooldown].
///
/// The list itself is part of the key: once the provider replaces it (a
/// library switch clears it, a local edit copies it) the cooldown no longer
/// applies and the next load fetches again.
class ListFetchCooldown {
  ListFetchCooldown(this.cooldown, {DateTime Function()? now})
      : _now = now ?? DateTime.now;

  final Duration cooldown;
  final DateTime Function() _now;

  String? _libraryId;
  Object? _list;
  DateTime? _at;

  bool isFresh(String libraryId, Object list) {
    final at = _at;
    return at != null &&
        _libraryId == libraryId &&
        identical(_list, list) &&
        _now().difference(at) < cooldown;
  }

  void markFetched(String libraryId, Object list) {
    _libraryId = libraryId;
    _list = list;
    _at = _now();
  }

  void clear() {
    _libraryId = null;
    _list = null;
    _at = null;
  }
}
