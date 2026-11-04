import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../utils/cover_cache.dart';
import '../../widgets/stable_cached_network_image.dart';
import '../audio_player_service.dart';
import '../download_service.dart';
import '../sleep_timer_service.dart';
import 'player_facade.dart';
import 'protocol.dart';

/// The app's player behind the phone-remote host, through the same public
/// calls as the keyboard shortcuts and global hotkeys
/// (`windows_global_hotkeys.dart`, `app_shell.dart`'s shortcut handler), so
/// seek undo, sync, history and stats behave the same. dart:io only (the
/// host never runs on web).
class AppRemotePlayer extends ChangeNotifier implements RemotePlayerFacade {
  AppRemotePlayer() {
    _player.addListener(_onChanged);
    _sleep.addListener(_onChanged);
    PlayerSettings.settingsChanged.addListener(_loadSkips);
    _loadSkips();
  }

  static const _maxCoverBytes = 8 * 1024 * 1024;

  AudioPlayerService get _player => AudioPlayerService();
  SleepTimerService get _sleep => SleepTimerService();

  int _skipBack = 10;
  int _skipForward = 30;
  String? _skipLibrary;
  String? _coverKey;
  int _coverVersion = 0;

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
    unawaited(Future.wait([
          PlayerSettings.getEffectiveBackSkip(libraryId: library),
          PlayerSettings.getEffectiveForwardSkip(libraryId: library),
        ])
        .then((v) {
          if (v[0] == _skipBack && v[1] == _skipForward) return;
          _skipBack = v[0];
          _skipForward = v[1];
          notifyListeners();
        })
        .catchError((Object _) {}));
  }

  @override
  RemotePlayerState get state {
    final p = _player;
    final sleep = _sleepState();
    if (!p.hasBook) {
      return RemotePlayerState(
        sleep: sleep,
        skipBack: _skipBack,
        skipForward: _skipForward,
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
    );
  }

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
  Future<Uint8List?> loadCover() async {
    final p = _player;
    final itemId = p.currentItemId;
    if (itemId == null) return null;
    try {
      final local = DownloadService().getInfo(itemId).localCoverPath;
      if (local != null && local.isNotEmpty) {
        final bytes = await _readFile(local);
        if (bytes != null) return bytes;
      }
      final url = p.currentCoverUrl?.trim();
      if (url == null || url.isEmpty) return null;
      final lower = url.toLowerCase();
      if (lower.startsWith('http://') || lower.startsWith('https://')) {
        // The cover the app already shows, from its disk cache; fetched with
        // the app's own headers when missing. The URL never leaves this PC.
        final key = stableCoverCacheKey(url);
        final cached = await coverCacheManager.getFileFromCache(key);
        final file =
            cached?.file ??
            await coverCacheManager.getSingleFile(
              url,
              key: key,
              headers: p.currentApi?.mediaHeaders ?? const {},
            );
        return await _readFile(file.path);
      }
      return await _readFile(
        lower.startsWith('file:') ? Uri.parse(url).toFilePath() : url,
      );
    } catch (e) {
      debugPrint('[RemoteHost] Cover unavailable: ${e.runtimeType}');
      return null;
    }
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
}
