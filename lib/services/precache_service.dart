import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/cover_cache.dart';
import '../utils/unmetered_network.dart';
import '../widgets/stable_cached_network_image.dart';

/// What one pre-cache run works from, taken from the signed-in session when
/// Home has loaded (see `LibraryProvider`).
class PrecacheSource {
  const PrecacheSource({
    required this.scope,
    required this.libraryId,
    required this.homeItemIds,
    required this.detailItemIds,
    required this.libraryPage,
    required this.fetchItem,
    required this.coverUrl,
    required this.headers,
    required this.stillValid,
  });

  /// Account the run belongs to; a run never outlives its account.
  final String scope;
  final String libraryId;

  /// Books on the Home shelves, in shelf order: their covers come first.
  final List<String> homeItemIds;

  /// Books likely to be opened next (Continue Listening and the first books
  /// of each shelf): their full book pages are fetched ahead.
  final List<String> detailItemIds;

  /// One page of the library's books (ids, updatedAt, cover path).
  final Future<List<Map<String, dynamic>>> Function(int page, int limit)
      libraryPage;

  /// The full item, as the book page shows it.
  final Future<Map<String, dynamic>?> Function(String itemId) fetchItem;

  /// The grid-size cover URL the screens request, or null without a cover.
  final String? Function(String itemId) coverUrl;
  final Map<String, String> headers;

  /// Still online, same account, nothing signed out.
  final bool Function() stillValid;
}

/// Fetches, in the background, what screens would otherwise wait for:
/// cover images for the Home shelves and the library (saved to the cover
/// disk cache, never decoded into memory), and the full book page for the
/// books most likely to be opened next.
///
/// Built to go unnoticed:
/// - starts a few seconds after Home has loaded, once per library per
///   session (again after [rerunAfter]);
/// - Wi-Fi or wired connections only; never on web;
/// - two downloads at a time with a short pause between, so playback and
///   the screen in front keep the bandwidth;
/// - pauses while the app is in the background, stops when the account
///   changes or the app goes offline;
/// - skips anything already cached, and at most [maxLibraryItems] books.
///
/// Turned off with the "Pre-load covers and book pages" setting.
class PrecacheService {
  PrecacheService({
    Future<bool> Function()? isUnmetered,
    Future<bool> Function(String key)? isCoverCached,
    Future<void> Function(String url, String key, Map<String, String> headers)?
        downloadCover,
    void Function(String itemId, Map<String, dynamic> item)? onItem,
    bool Function()? inForeground,
    Duration startDelay = const Duration(seconds: 4),
    Duration gap = const Duration(milliseconds: 150),
  })  : _isUnmetered = isUnmetered ?? _onUnmeteredNetwork,
        _isCoverCached = isCoverCached ?? _coverInDiskCache,
        _downloadCover = downloadCover ?? _downloadToDiskCache,
        _onItem = onItem,
        _inForeground = inForeground ?? _appInForeground,
        _startDelay = startDelay,
        _gap = gap;

  static final PrecacheService instance = PrecacheService();

  static const prefKey = 'fork_precache_enabled';
  static const maxLibraryItems = 600;
  static const maxDetailItems = 12;
  static const rerunAfter = Duration(hours: 6);
  static const _pageSize = 100;
  static const _parallel = 2;

  /// Where fetched book pages go (the book page's recent-item cache).
  /// Set once at startup by the book page.
  static void Function(String itemId, Map<String, dynamic> item)? itemSink;

  final Future<bool> Function() _isUnmetered;
  final Future<bool> Function(String key) _isCoverCached;
  final Future<void> Function(
      String url, String key, Map<String, String> headers) _downloadCover;
  final void Function(String itemId, Map<String, dynamic> item)? _onItem;
  final bool Function() _inForeground;
  final Duration _startDelay;
  final Duration _gap;

  final Map<String, DateTime> _lastRun = {};
  Timer? _pending;
  bool _running = false;

  static Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(prefKey) ?? true;
  }

  static Future<void> setEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(prefKey, enabled);
  }

  /// Home has loaded: start a run soon, unless one ran for this library
  /// recently or one is already going.
  void schedule(PrecacheSource source) {
    if (kIsWeb) return;
    final key = '${source.scope}|${source.libraryId}';
    final last = _lastRun[key];
    if (last != null && DateTime.now().difference(last) < rerunAfter) return;
    _pending?.cancel();
    _pending = Timer(_startDelay, () => unawaited(run(source)));
  }

  /// One run. Returns how many covers and book pages were fetched.
  @visibleForTesting
  Future<({int covers, int items})> run(PrecacheSource source) async {
    var covers = 0;
    var items = 0;
    if (_running) return (covers: covers, items: items);
    _running = true;
    try {
      if (!await isEnabled() || !await _isUnmetered()) {
        return (covers: covers, items: items);
      }
      _lastRun['${source.scope}|${source.libraryId}'] = DateTime.now();

      // 1. The book pages most likely to be opened next.
      for (final id in source.detailItemIds.take(maxDetailItems)) {
        if (!await _canGoOn(source)) return (covers: covers, items: items);
        try {
          final item = await source.fetchItem(id);
          if (item != null && source.stillValid()) {
            (_onItem ?? itemSink)?.call(id, item);
            items++;
          }
        } catch (_) {}
        await Future<void>.delayed(_gap);
      }

      // 2. Covers: Home first, then the rest of the library.
      final seen = <String>{};
      Future<bool> coversFor(Iterable<String> ids) async {
        final todo = [for (final id in ids) if (seen.add(id)) id];
        for (var i = 0; i < todo.length; i += _parallel) {
          if (!await _canGoOn(source)) return false;
          final batch = todo.skip(i).take(_parallel);
          final fetched = await Future.wait(batch.map((id) => _cover(source, id)));
          covers += fetched.where((f) => f).length;
          await Future<void>.delayed(_gap);
        }
        return true;
      }

      if (!await coversFor(source.homeItemIds)) {
        return (covers: covers, items: items);
      }
      for (var page = 0; page * _pageSize < maxLibraryItems; page++) {
        if (!await _canGoOn(source)) break;
        final List<Map<String, dynamic>> results;
        try {
          results = await source.libraryPage(page, _pageSize);
        } catch (_) {
          break;
        }
        final ids = [
          for (final r in results)
            if (r['id'] is String) r['id'] as String,
        ];
        if (!await coversFor(ids)) break;
        if (results.length < _pageSize) break;
      }
      return (covers: covers, items: items);
    } finally {
      _running = false;
      if (covers > 0 || items > 0) {
        debugPrint('[Precache] library=${source.libraryId} '
            'covers=$covers pages=$items');
      }
    }
  }

  /// Waits while the app is in the background (up to a few minutes), then
  /// says whether the run may continue.
  Future<bool> _canGoOn(PrecacheSource source) async {
    for (var waited = 0; !_inForeground(); waited++) {
      if (waited >= 60) return false;
      await Future<void>.delayed(const Duration(seconds: 5));
    }
    return source.stillValid();
  }

  /// Downloads one cover into the disk cache unless it's already there.
  Future<bool> _cover(PrecacheSource source, String itemId) async {
    final url = source.coverUrl(itemId);
    if (url == null || !url.startsWith('http')) return false;
    final key = stableCoverCacheKey(url);
    try {
      if (await _isCoverCached(key)) return false;
      await _downloadCover(url, key, source.headers);
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> _onUnmeteredNetwork() async =>
      isWifiOrEthernet(await Connectivity().checkConnectivity());

  static Future<bool> _coverInDiskCache(String key) async =>
      await coverCacheManager.getFileFromCache(key) != null;

  static Future<void> _downloadToDiskCache(
      String url, String key, Map<String, String> headers) async {
    await coverCacheManager.downloadFile(url, key: key, authHeaders: headers);
  }

  static bool _appInForeground() {
    final state = WidgetsBinding.instance.lifecycleState;
    return state == null || state == AppLifecycleState.resumed;
  }
}
