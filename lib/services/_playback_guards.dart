part of 'audio_player_service.dart';

// Fork (Absorb Plus): small guards for the player service that don't belong
// to the stream recovery. Kept out of the upstream file so merges only see
// one-line hooks.

extension _ForkPlaybackGuards on AudioPlayerService {
  /// Stop (or a reset) while a start is still loading: without this the
  /// start carried on, loaded, pressed play and set up its syncs for an item
  /// that is no longer there, so audio began a few seconds after the player
  /// had gone. Bumping the generation makes every start in flight back out
  /// at its next check (closing the session it opened); the loading flags it
  /// would have handed to a newer start are cleared here, since none follows.
  void _abandonLoadingStart() {
    _playbackGeneration++;
    _isLoadingNewItem = false;
  }

  /// What is loaded now, for a delayed action to check against later.
  ({int generation, String? itemId, String? episodeId}) _loadedStart() => (
        generation: _playbackGeneration,
        itemId: _currentItemId,
        episodeId: _currentEpisodeId,
      );

  /// The start recorded by [_loadedStart] is still the one loaded: no stop
  /// and no other start (another book, or the same one started again) came
  /// in between. The old stream retry waits up to 4 s before restarting the
  /// item, and without this it restarted whatever had been loaded meanwhile.
  bool _stillLoaded(({int generation, String? itemId, String? episodeId}) s) {
    if (s.generation == _playbackGeneration &&
        s.itemId == _currentItemId &&
        s.episodeId == _currentEpisodeId) {
      return true;
    }
    debugPrint('[Player] Stream retry for ${s.itemId} dropped - '
        'playback stopped or moved on while it waited');
    return false;
  }

  /// Every completion goes through here (the upstream body is
  /// [_completePlayback]). A throw part-way through it (a server call, a
  /// local save) used to leave [_isCompletingBook] set, and every later
  /// completion was then ignored as a re-entry until another book started.
  Future<void> _onPlaybackComplete({bool userRequested = false}) async {
    // A completion that gets this far is the book's (a reconnect holds the
    // dead source's), or a chapter skip past the end: no reconnect may
    // bring the finished book back afterwards.
    _recovery.onFinished();
    try {
      await _completePlayback(userRequested: userRequested);
    } catch (e, st) {
      _isCompletingBook = false;
      debugPrint('[Complete] Failed part-way: $e\n$st');
    }
  }

  /// The pre-buffered next book took over without going through playItem
  /// ([_onAutoQueueAdvanced]). Without this it kept the finished book's
  /// mode: a downloaded next book logged no listening (no local session),
  /// a streamed book's 20 s tick opened a /play session behind a downloaded
  /// one and the next pause swapped its files for the stream, a truncated
  /// download's clamp held seeks in the new book, and the speed and EQ were
  /// the old book's. Resets and applies here what a normal start does.
  void _startAutoAdvancedItem(Map<String, dynamic> next, double startS) {
    final itemId = _currentItemId;
    if (itemId == null) return;
    final episodeId = _currentEpisodeId;
    final localPaths = next['localPaths'] as List<dynamic>?;
    final local = localPaths != null && localPaths.isNotEmpty;
    final wasLocal = _localSessionMode;
    // As playItem and the start paths set them.
    _shortLocalDurationSec = null;
    _localSessionMode = local;
    _isOfflineMode = false;
    _recovery.onSourceLoaded(localFiles: local);
    final gen = _playbackGeneration;
    bool stillThisItem() =>
        gen == _playbackGeneration &&
        itemId == _currentItemId &&
        episodeId == _currentEpisodeId;
    unawaited(() async {
      try {
        if (local) {
          // Also finalizes the finished book's session (another item).
          await LocalSessionService().beginSession(
            progressKey: playbackDownloadKey(itemId, episodeId),
            libraryItemId: itemId,
            episodeId: episodeId,
            mediaType: episodeId != null ? 'podcast' : 'book',
            duration: _totalDuration,
            startTime: startS,
            displayTitle: _currentTitle,
            displayAuthor: _currentAuthor,
          );
        } else if (wasLocal) {
          await LocalSessionService().finalizeActive();
        }
        if (!stillThisItem()) return;
        final speed = await PlayerSettings.getBookSpeed(itemId) ??
            await PlayerSettings.getDefaultSpeed();
        if (!stillThisItem()) return;
        final player = _player;
        if (player != null && (player.speed - speed).abs() > 0.001) {
          await player.setSpeed(speed);
          // The notification's duration is speed-adjusted when pushed.
          if (AudioPlayerService._handler != null && stillThisItem()) {
            _pushMediaItem(
              itemId,
              _currentTitle ?? '',
              _currentAuthor ?? '',
              _currentCoverUrl,
              _totalDuration,
              chapter: currentChapter?['title'] as String?,
            );
          }
        }
        if (!stillThisItem()) return;
        await EqualizerService().switchItem(itemId);
      } catch (e) {
        debugPrint('[PreBuffer] Setting up the advanced item failed: $e');
      }
    }());
  }

  /// The stream's transcode retry ([_retryWithTranscode]) couldn't start.
  /// [_playFromServer] has already cleared the state, as for any failed
  /// start; stop the failed source too (nothing is loaded any more) and show
  /// why, the way a failed start from the app is shown.
  void _reportFailedRetry(String error) {
    debugPrint('[Player] Transcode retry did not start: $error');
    final p = _player;
    if (p != null && p.processingState != ProcessingState.idle) {
      unawaited(p.stop().catchError((Object e) {
        debugPrint('[Player] Could not stop the player: $e');
      }));
    }
    AudioPlayerService._handler?.refreshPlaybackState();
    showNavigatorOverlayToast(rootNavigatorKey.currentState, error,
        icon: Icons.error_outline_rounded);
  }

  /// Every session sync goes through here (the upstream body is
  /// [_syncToServerNow]); see [_SessionSyncGate].
  Future<void> _syncToServer(Duration pos, {int? timeListenedOverride}) =>
      _syncGate.sync(pos, timeListenedOverride);

  /// A sync nobody waits for (the 20 s tick, the catch-up on resume): its
  /// failure is logged instead of reaching the unhandled-error handler.
  void _syncToServerInBackground(Duration pos) {
    unawaited(_syncToServer(pos).catchError((Object e) {
      debugPrint('[Player] Background session sync failed: $e');
    }));
  }
}

/// One session sync at a time. The 20 s tick and the catch-up on resume
/// fired syncs without waiting, so two POSTs on the same session could be in
/// flight together and land out of order (an older position overwriting a
/// newer one). A sync asked for while one runs waits for it, then one more
/// runs with the latest request; requests in between are merged into it.
class _SessionSyncGate {
  _SessionSyncGate(this._service);

  final AudioPlayerService _service;
  bool _running = false;
  ({Duration pos, int? timeListenedOverride, String? item})? _wanted;
  Completer<void>? _wantedDone;

  Future<void> sync(Duration pos, int? timeListenedOverride) {
    if (_running) {
      // The override caps the listening credited (callers pass 0 when the
      // span since the last sync wasn't listened to; null means the wall
      // clock). A merged request keeps the least any caller asked for, so a
      // later tick can't undo a pause or stop saying "nothing listened".
      final before = _wanted?.timeListenedOverride;
      final merged = before == null
          ? timeListenedOverride
          : timeListenedOverride == null
              ? before
              : (before < timeListenedOverride ? before : timeListenedOverride);
      _wanted = (
        pos: pos,
        timeListenedOverride: merged,
        item: _itemKey,
      );
      return (_wantedDone ??= Completer<void>()).future;
    }
    return _run(pos, timeListenedOverride);
  }

  String? get _itemKey => _service._currentItemId == null
      ? null
      : '${_service._currentItemId}-${_service._currentEpisodeId}';

  Future<void> _run(Duration pos, int? timeListenedOverride) async {
    _running = true;
    try {
      await _service._syncToServerNow(pos,
          timeListenedOverride: timeListenedOverride);
    } finally {
      _running = false;
      final next = _wanted;
      final done = _wantedDone;
      _wanted = null;
      _wantedDone = null;
      if (next != null && done != null) {
        if (next.item != _itemKey) {
          // Another book or episode was loaded while it waited: its
          // position belongs to the old one.
          debugPrint('[Player] Queued session sync dropped - item changed');
          done.complete();
        } else {
          done.complete(sync(next.pos, next.timeListenedOverride));
        }
      }
    }
  }
}

/// Read-only views of the service's start bookkeeping, for tests.
extension ForkPlaybackTestHooks on AudioPlayerService {
  @visibleForTesting
  int get debugPlaybackGeneration => _playbackGeneration;

  /// The stream recovery's policy, to put the service into a reconnect.
  @visibleForTesting
  PlaybackRecovery get debugRecoveryPolicy => _recovery.policy;

  /// The listening clocks (stats accrual, session timeListened).
  @visibleForTesting
  ({DateTime accrual, DateTime serverSync}) get debugListeningClocks =>
      (accrual: _lastAccrual, serverSync: _lastServerSync);

  @visibleForTesting
  set debugListeningClocks(({DateTime accrual, DateTime serverSync}) c) {
    _lastAccrual = c.accrual;
    _lastServerSync = c.serverSync;
  }

  /// What the audio-focus handler tells the recovery when a call or another
  /// app takes the audio.
  @visibleForTesting
  void debugAudioFocusLost() => _recovery.onFocusLost();

  /// Runs the completion path, as the end of the book or a skip past it.
  @visibleForTesting
  Future<void> debugCompletePlayback({bool userRequested = false}) =>
      _onPlaybackComplete(userRequested: userRequested);

  /// Pretends [itemId] is loaded from [api], without a player.
  @visibleForTesting
  void debugSetLoadedItem(String? itemId, ApiService? api, {String? episodeId}) {
    _currentItemId = itemId;
    _currentEpisodeId = episodeId;
    _api = api;
  }

  /// The stream's retry through server transcoding, as repeated playback
  /// errors start it.
  @visibleForTesting
  Future<void> debugRetryWithTranscode() => _retryWithTranscode();

  /// The open server playback session, if any.
  @visibleForTesting
  String? get debugPlaybackSessionId => _playbackSessionId;

  /// How the loaded item reports listening: a client-owned local session
  /// (downloads), and the truncated-download clamp (null: none).
  @visibleForTesting
  ({bool localSessionMode, double? shortLocalDurationSec}) get debugLocalMode =>
      (
        localSessionMode: _localSessionMode,
        shortLocalDurationSec: _shortLocalDurationSec,
      );

  @visibleForTesting
  set debugLocalMode(
      ({bool localSessionMode, double? shortLocalDurationSec}) m) {
    _localSessionMode = m.localSessionMode;
    _shortLocalDurationSec = m.shortLocalDurationSec;
  }

  /// Pretends a server playback session is open (null: none).
  @visibleForTesting
  set debugPlaybackSessionId(String? id) => _playbackSessionId = id;

  /// A session sync, as the 20 s tick (unawaited) or a pause/stop asks for one.
  @visibleForTesting
  Future<void> debugSyncToServer(Duration pos, {int? timeListenedOverride}) =>
      _syncToServer(pos, timeListenedOverride: timeListenedOverride);

  /// Pretends the next book of the queue is pre-buffered behind this one.
  @visibleForTesting
  set debugPreloadedNextBook(Map<String, dynamic>? next) =>
      _preloadedNextBook = next;

  /// The hand-off to the pre-buffered next book, as the player stepping
  /// into it fires it. With no media handler (tests) the hand-off throws at
  /// the notification update; the re-entry flag is cleared either way, so a
  /// test can hand off more than once.
  @visibleForTesting
  void debugAutoQueueAdvance() {
    try {
      _onAutoQueueAdvanced();
    } finally {
      _autoQueueAdvancing = false;
    }
  }

  /// The old stream retry, as a playback error starts it.
  @visibleForTesting
  Future<void> debugAttemptStreamRetry(Object error, {bool? resume}) =>
      _attemptStreamRetry(error, resume: resume);

  /// What a mid-play move onto the downloaded files (or back onto the
  /// stream) reports once its source has loaded.
  @visibleForTesting
  void debugSourceLoaded({required bool localFiles}) =>
      _recovery.onSourceLoaded(localFiles: localFiles);

  /// Pretends a start is loading, the way playItem marks one.
  @visibleForTesting
  void debugMarkStartLoading() {
    _playbackGeneration++;
    _isLoadingNewItem = true;
  }
}
