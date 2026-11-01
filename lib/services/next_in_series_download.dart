import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart' show rootNavigatorKey;
import '../providers/auth_provider.dart';
import '../utils/unmetered_network.dart';
import 'api_service.dart';
import 'audio_player_service.dart';
import 'download_service.dart';
import 'queue_download_policy.dart';
import 'scoped_prefs.dart';

/// Per-account switch (ScopedPrefs), off by default.
const kAutoDownloadNextInSeriesKey = 'fork_autoDownloadNextInSeries';

Future<bool> getAutoDownloadNextInSeries() async =>
    await ScopedPrefs.getBool(kAutoDownloadNextInSeriesKey) ?? false;

Future<void> setAutoDownloadNextInSeries(bool value) =>
    ScopedPrefs.setBool(kAutoDownloadNextInSeriesKey, value);

enum NextInSeriesOutcome {
  notYet,
  disabled,
  alreadyHandled,
  waitingForWifi,
  lookupFailed,
  noNextBook,
  alreadyDownloaded,
  started,
  failed,
}

/// The point where the next book is fetched: 80% through, or under an hour
/// left.
bool nextInSeriesDue(double positionS, double totalS) {
  if (totalS <= 0 || positionS < 0) return false;
  return positionS / totalS >= 0.8 || totalS - positionS < 3600;
}

/// Series id and numeric sequence of a library item, the same rules the
/// queue uses (`_StateMixin._extractSeries`): the first series entry with an
/// id and a sequence that starts with a number.
(String?, double?) seriesOfItem(Map<String, dynamic> item) {
  final media = item['media'];
  final metadata = media is Map ? media['metadata'] : null;
  final raw = metadata is Map ? metadata['series'] : null;
  final entries = raw is List ? raw : (raw is Map ? [raw] : const []);
  for (final s in entries) {
    if (s is! Map) continue;
    final id = s['id'];
    final m = RegExp(r'^[\d.]+').firstMatch((s['sequence'] ?? '').toString().trim());
    final seq = m == null ? null : double.tryParse(m.group(0)!);
    if (id is String && seq != null) return (id, seq);
  }
  return (null, null);
}

/// Absorb Plus: downloads the next book of a series while the current one is
/// near its end (Settings > Downloads & Storage, per account, off by default).
///
/// Once per book per run. Respects the Wi-Fi-only download setting: off
/// Wi-Fi/Ethernet it waits and tries again on a later check instead. Starts
/// through [DownloadService.downloadItem] as an automatic download, so a
/// book the user deleted by hand isn't brought back.
class NextInSeriesDownloader {
  NextInSeriesDownloader({
    required this.isEnabled,
    required this.mayDownloadNow,
    required this.fetchItem,
    required this.fetchSeriesBooks,
    required this.isDownloadedOrActive,
    required this.startDownload,
  });

  final Future<bool> Function() isEnabled;

  /// False while offline, or off Wi-Fi with Wi-Fi-only downloads on.
  final Future<bool> Function() mayDownloadNow;
  final Future<Map<String, dynamic>?> Function(String itemId) fetchItem;
  final Future<List<dynamic>> Function(String libraryId, String seriesId) fetchSeriesBooks;
  final bool Function(String itemId) isDownloadedOrActive;

  /// Returns an error message, or null once the download is queued/started.
  final Future<String?> Function(Map<String, dynamic> book) startDownload;

  final _handled = <String>{};
  bool _busy = false;

  Future<NextInSeriesOutcome> check({
    required String itemId,
    String? episodeId,
    required double positionS,
    required double totalS,
  }) async {
    if (episodeId != null || !nextInSeriesDue(positionS, totalS)) {
      return NextInSeriesOutcome.notYet;
    }
    if (_handled.contains(itemId)) return NextInSeriesOutcome.alreadyHandled;
    if (_busy) return NextInSeriesOutcome.notYet;
    _busy = true;
    try {
      if (!await isEnabled()) return NextInSeriesOutcome.disabled;
      if (!await mayDownloadNow()) return NextInSeriesOutcome.waitingForWifi;

      final Map<String, dynamic>? current;
      final List<dynamic> books;
      final String seriesId;
      final double sequence;
      try {
        current = await fetchItem(itemId);
        if (current == null) return NextInSeriesOutcome.lookupFailed;
        final (sid, seq) = seriesOfItem(current);
        if (sid == null || seq == null) {
          _handled.add(itemId);
          return NextInSeriesOutcome.noNextBook;
        }
        seriesId = sid;
        sequence = seq;
        final libraryId = current['libraryId'];
        if (libraryId is! String || libraryId.isEmpty) {
          return NextInSeriesOutcome.lookupFailed;
        }
        books = await fetchSeriesBooks(libraryId, seriesId);
      } catch (e) {
        debugPrint('[NextInSeries] lookup failed: $e');
        return NextInSeriesOutcome.lookupFailed;
      }

      final ordered = seriesQueueTail<Map<String, dynamic>>(
        current: current,
        books: books.whereType<Map<String, dynamic>>(),
        currentKey: itemId,
        currentSeriesId: seriesId,
        currentSequence: sequence,
        keyOf: (b) => b['id'] as String? ?? '',
        seriesId: (b) => seriesOfItem(b).$1,
        sequence: (b) => seriesOfItem(b).$2,
      );
      Map<String, dynamic>? next;
      for (final b in ordered) {
        if (b['id'] == itemId) continue;
        final progress = b['userMediaProgress'];
        if (progress is Map && progress['isFinished'] == true) continue;
        next = b;
        break;
      }
      _handled.add(itemId);
      if (next == null) return NextInSeriesOutcome.noNextBook;
      final nextId = next['id'] as String;
      if (isDownloadedOrActive(nextId)) return NextInSeriesOutcome.alreadyDownloaded;
      final error = await startDownload(next);
      if (error != null) {
        debugPrint('[NextInSeries] $nextId not started: $error');
        return NextInSeriesOutcome.failed;
      }
      debugPrint('[NextInSeries] downloading $nextId after $itemId');
      return NextInSeriesOutcome.started;
    } finally {
      _busy = false;
    }
  }

  // ── App wiring ──

  static NextInSeriesDownloader? _app;
  static Timer? _ticker;
  static bool _started = false;

  /// Watches playback; checks once a minute while something plays.
  static void start() {
    if (_started || kIsWeb) return;
    _started = true;
    _app = _forApp();
    AudioPlayerService().addListener(_onPlayer);
  }

  static void _onPlayer() {
    final playing = AudioPlayerService().isPlaying;
    if (playing && _ticker == null) {
      _ticker = Timer.periodic(const Duration(minutes: 1), (_) => _tick());
      _tick();
    } else if (!playing && _ticker != null) {
      _ticker!.cancel();
      _ticker = null;
    }
  }

  static void _tick() {
    final p = AudioPlayerService();
    final id = p.currentItemId;
    final app = _app;
    if (id == null || app == null || !p.isPlaying) return;
    unawaited(app.check(
      itemId: id,
      episodeId: p.currentEpisodeId,
      positionS: p.position.inMilliseconds / 1000.0,
      totalS: p.totalDuration,
    ));
  }

  static ApiService? get _api {
    final ctx = rootNavigatorKey.currentContext;
    return ctx?.read<AuthProvider>().apiService ?? AudioPlayerService().currentApi;
  }

  static NextInSeriesDownloader _forApp() => NextInSeriesDownloader(
        isEnabled: getAutoDownloadNextInSeries,
        mayDownloadNow: () async {
          if (_api == null) return false;
          final prefs = await SharedPreferences.getInstance();
          if (prefs.getBool('manual_offline_mode') ?? false) return false;
          final connectivity = await Connectivity().checkConnectivity();
          if (connectivity.every((c) => c == ConnectivityResult.none)) return false;
          if (await PlayerSettings.getWifiOnlyDownloads()) {
            return isWifiOrEthernet(connectivity);
          }
          return true;
        },
        fetchItem: (id) async => _api?.getLibraryItem(id),
        fetchSeriesBooks: (libraryId, seriesId) async =>
            await _api?.getAllBooksBySeries(libraryId, seriesId) ?? const [],
        isDownloadedOrActive: (id) =>
            DownloadService().isDownloaded(id) || DownloadService().isDownloading(id),
        startDownload: (book) async {
          final api = _api;
          if (api == null) return 'signed out';
          final id = book['id'] as String;
          final metadata = (book['media'] as Map?)?['metadata'] as Map?;
          return DownloadService().downloadItem(
            api: api,
            itemId: id,
            title: metadata?['title'] as String? ?? '',
            author: metadata?['authorName'] as String?,
            coverUrl: api.getCoverUrl(id),
            libraryId: book['libraryId'] as String?,
            automatic: true,
          );
        },
      );
}
