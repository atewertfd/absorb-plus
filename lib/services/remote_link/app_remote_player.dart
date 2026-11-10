import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../utils/cover_cache.dart';
import '../../widgets/stable_cached_network_image.dart';
import '../audio_player_service.dart';
import '../bookmark_service.dart';
import '../download_service.dart';
import '../sleep_timer_service.dart';
import 'player_facade.dart';
import 'protocol.dart';
import 'remote_library_access.dart';

/// The app's player behind the phone-remote host, through the same public
/// calls as the keyboard shortcuts and global hotkeys
/// (`windows_global_hotkeys.dart`, `app_shell.dart`'s shortcut handler), so
/// seek undo, sync, history and stats behave the same. dart:io only (the
/// host never runs on web).
class AppRemotePlayer extends ChangeNotifier implements RemotePlayerFacade {
  AppRemotePlayer({RemoteLibraryAccess? library}) : _libraryOverride = library {
    _player.addListener(_onChanged);
    _sleep.addListener(_onChanged);
    PlayerSettings.settingsChanged.addListener(_loadSkips);
    _loadSkips();
  }

  static const _maxCoverBytes = 8 * 1024 * 1024;

  AudioPlayerService get _player => AudioPlayerService();
  SleepTimerService get _sleep => SleepTimerService();

  final RemoteLibraryAccess? _libraryOverride;
  RemoteLibraryAccess? get _library =>
      _libraryOverride ?? RemoteLibraryAccess.current;

  int _skipBack = 10;
  int _skipForward = 30;
  String? _skipLibrary;
  String? _coverKey;
  int _coverVersion = 0;

  /// The volume before the remote muted, or null when not muted.
  double? _mutedFrom;

  List<dynamic>? _chaptersSource;
  List<RemoteChapter> _chapters = const [];

  @override
  void dispose() {
    _player.removeListener(_onChanged);
    _sleep.removeListener(_onChanged);
    PlayerSettings.settingsChanged.removeListener(_loadSkips);
    super.dispose();
  }

  void _onChanged() {
    if (_player.currentLibraryId != _skipLibrary) _loadSkips();
    notifyListeners();
  }

  void _loadSkips() {
    final library = _player.currentLibraryId;
    _skipLibrary = library;
    unawaited(
      Future.wait([
            PlayerSettings.getEffectiveBackSkip(libraryId: library),
            PlayerSettings.getEffectiveForwardSkip(libraryId: library),
          ])
          .then((v) {
            if (v[0] == _skipBack && v[1] == _skipForward) return;
            _skipBack = v[0];
            _skipForward = v[1];
            notifyListeners();
          })
          .catchError((Object e) {
            debugPrint('[RemoteHost] Skip amounts unavailable: $e');
          }),
    );
  }

  @override
  RemotePlayerState get state {
    final p = _player;
    final sleep = _sleepState();
    final volume = p.volume.clamp(0.0, 1.0).toDouble();
    // Turned up elsewhere (a hotkey) while muted: not muted any more.
    if (_mutedFrom != null && volume > 0) _mutedFrom = null;
    final muted = _mutedFrom != null;
    if (!p.hasBook) {
      return RemotePlayerState(
        sleep: sleep,
        skipBack: _skipBack,
        skipForward: _skipForward,
        volume: muted ? _mutedFrom! : volume,
        muted: muted,
      );
    }
    final coverKey = '${p.currentItemId}|${p.currentCoverUrl}';
    if (coverKey != _coverKey) {
      _coverKey = coverKey;
      _coverVersion++;
    }
    final position = p.activeSeekTarget ?? p.position.inMilliseconds / 1000.0;
    final chapter = p.currentChapter;
    final duration = p.displayDuration;
    final episode = p.currentEpisodeTitle;
    return RemotePlayerState(
      itemId: p.currentItemId,
      title: (episode != null && episode.isNotEmpty)
          ? episode
          : (p.currentTitle ?? ''),
      author: (episode != null && episode.isNotEmpty)
          ? (p.currentTitle ?? '')
          : (p.currentAuthor ?? ''),
      chapterTitle: chapter?['title'] as String? ?? '',
      position: position,
      duration: duration,
      chapterStart: (chapter?['start'] as num?)?.toDouble() ?? 0,
      chapterEnd: (chapter?['end'] as num?)?.toDouble() ?? 0,
      playing: p.isPlaying,
      buffering: p.isLoadingOrBuffering,
      speed: p.speed,
      sleep: sleep,
      coverVersion: _coverVersion,
      skipBack: _skipBack,
      skipForward: _skipForward,
      volume: muted ? _mutedFrom! : volume,
      muted: muted,
    );
  }

  @override
  List<RemoteChapter> get chapters {
    final source = _player.hasBook ? _player.chapters : const <dynamic>[];
    if (identical(source, _chaptersSource)) return _chapters;
    _chaptersSource = source;
    _chapters = List.unmodifiable([
      for (final c in source.take(RemoteChapter.maxCount))
        if (c is Map)
          RemoteChapter(
            title: _clip(
              c['title'] as String? ?? '',
              RemoteChapter.maxTitleLength,
            ),
            start: (c['start'] as num?)?.toDouble() ?? 0,
            end: (c['end'] as num?)?.toDouble() ?? 0,
          ),
    ]);
    return _chapters;
  }

  static String _clip(String v, int max) =>
      v.length > max ? v.substring(0, max) : v;

  RemoteSleepState _sleepState() {
    final s = _sleep;
    switch (s.mode) {
      case SleepTimerMode.off:
        return const RemoteSleepState();
      case SleepTimerMode.time:
        return RemoteSleepState(
          mode: RemoteSleepState.time,
          remaining: s.timeRemaining.inSeconds.toDouble(),
        );
      case SleepTimerMode.chapters:
        return RemoteSleepState(
          mode: RemoteSleepState.chapters,
          remaining: s.chaptersRemaining.toDouble(),
        );
      case SleepTimerMode.episodes:
        return const RemoteSleepState(mode: RemoteSleepState.episodes);
    }
  }

  @override
  Future<Uint8List?> loadCover([String? itemId]) async {
    if (itemId != null) return _loadLibraryCover(itemId);
    final p = _player;
    final current = p.currentItemId;
    if (current == null) return null;
    try {
      final local = DownloadService().getInfo(current).localCoverPath;
      if (local != null && local.isNotEmpty) {
        final bytes = await _readFile(local);
        if (bytes != null) return bytes;
      }
      return await _fromUrl(
        p.currentCoverUrl,
        p.currentApi?.mediaHeaders ?? const {},
      );
    } catch (e) {
      debugPrint('[RemoteHost] Cover unavailable: ${e.runtimeType}');
      return null;
    }
  }

  Future<Uint8List?> _loadLibraryCover(String itemId) async {
    final library = _library;
    if (library == null) return null;
    try {
      final local = library.localCoverPath(itemId);
      if (local != null && local.isNotEmpty) {
        final bytes = await _readFile(local);
        if (bytes != null) return bytes;
      }
      return await _fromUrl(library.coverUrl(itemId), library.coverHeaders);
    } catch (e) {
      debugPrint('[RemoteHost] Cover unavailable: ${e.runtimeType}');
      return null;
    }
  }

  /// The cover the app already shows, from its disk cache; fetched with the
  /// app's own headers when missing. The URL never leaves this PC.
  static Future<Uint8List?> _fromUrl(
    String? raw,
    Map<String, String> headers,
  ) async {
    final url = raw?.trim();
    if (url == null || url.isEmpty) return null;
    final lower = url.toLowerCase();
    if (lower.startsWith('http://') || lower.startsWith('https://')) {
      final key = stableCoverCacheKey(url);
      final cached = await coverCacheManager.getFileFromCache(key);
      final file =
          cached?.file ??
          await coverCacheManager.getSingleFile(
            url,
            key: key,
            headers: headers,
          );
      return _readFile(file.path);
    }
    return _readFile(
      lower.startsWith('file:') ? Uri.parse(url).toFilePath() : url,
    );
  }

  static Future<Uint8List?> _readFile(String path) async {
    final file = File(path);
    if (!await file.exists()) return null;
    if (await file.length() > _maxCoverBytes) return null;
    return file.readAsBytes();
  }

  // ── Commands: the hotkeys' calls ──────────────────────────────────

  @override
  Future<void> play() async {
    if (!_player.isPlaying) await _player.play(fromUi: true);
  }

  @override
  Future<void> pause() async {
    if (_player.isPlaying) await _player.pause();
  }

  @override
  Future<void> toggle() async {
    if (_player.isPlaying) {
      await _player.pause();
    } else {
      await _player.play(fromUi: true);
    }
  }

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> seek(double seconds) async {
    final max = _player.displayDuration;
    final target = max > 0 ? seconds.clamp(0.0, max) : seconds;
    await _player.seekTo(Duration(milliseconds: (target * 1000).round()));
  }

  @override
  Future<void> skip(int seconds) async {
    if (seconds > 0) {
      await _player.skipForward(seconds);
    } else if (seconds < 0) {
      await _player.skipBackward(-seconds);
    }
  }

  @override
  Future<void> chapter(int delta) async {
    if (delta > 0) {
      await _player.skipToNextChapter();
    } else if (delta < 0) {
      await _player.skipToPreviousChapter();
    }
  }

  @override
  Future<void> setSpeed(double speed) =>
      _player.setSpeed(speed.clamp(SpeedCommand.min, SpeedCommand.max));

  @override
  Future<void> sleepFor(int minutes) async =>
      _sleep.setTimeSleep(Duration(minutes: minutes));

  @override
  Future<void> sleepAtEndOfChapter() async => _sleep.setChapterSleep(1);

  @override
  Future<void> cancelSleep() async => _sleep.cancelByUser();

  @override
  Future<void> setVolume(double volume) async {
    _mutedFrom = null;
    await _player.setVolume(volume.clamp(0.0, 1.0));
    notifyListeners();
  }

  @override
  Future<void> setMuted(bool muted) async {
    if (muted == (_mutedFrom != null)) return;
    if (muted) {
      final current = _player.volume;
      // Muting at zero would leave nothing to go back to.
      _mutedFrom = current > 0 ? current : 1.0;
      await _player.setVolume(0);
    } else {
      final back = _mutedFrom ?? 1.0;
      _mutedFrom = null;
      await _player.setVolume(back);
    }
    notifyListeners();
  }

  /// The car-mode bookmark (chapter title as the label, pushed to the
  /// server through the API), with the remote's note.
  @override
  Future<bool> addBookmark(String note) async {
    final p = _player;
    final itemId = p.currentItemId;
    if (itemId == null) return false;
    final chapterTitle = p.currentChapter?['title'] as String?;
    await BookmarkService().addBookmark(
      itemId: playbackDownloadKey(itemId, p.currentEpisodeId),
      positionSeconds: p.position.inMilliseconds / 1000.0,
      title: (chapterTitle != null && chapterTitle.isNotEmpty)
          ? chapterTitle
          : 'Bookmark',
      note: note.trim().isEmpty ? null : note.trim(),
      api: p.currentApi,
    );
    return true;
  }

  @override
  Future<List<RemoteRecentItem>> recentItems() async =>
      _library?.recentItems(8) ?? const [];

  @override
  Future<bool> playItem(String itemId) async =>
      await _library?.play(itemId) ?? false;
}
