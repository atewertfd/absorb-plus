part of 'audio_player_service.dart';

// Fork (Absorb Plus): connects [PlaybackRecovery] to the player service. The
// policy decides when to retry; this part reads the service's state, reloads
// on a fresh session (so an expired one is replaced the same way the old
// stream retry did) by rebuilding just the audio source, falling back to a
// full playItem only when that can't work, and shows the quiet status. Kept
// out of the upstream file so merges only see the one-line hooks.

/// What the user did that ends a recovery.
enum _RecoveryUserAction {
  play,
  pause,
  seek(movesPosition: true),
  skip(movesPosition: true),
  chapterSkip(movesPosition: true),
  stop,
  stopWithoutSaving;

  const _RecoveryUserAction({this.movesPosition = false});

  /// A seek of some kind: it sets the position itself.
  final bool movesPosition;
}

typedef _RecoveryItem = ({
  ApiService api,
  String itemId,
  String title,
  String author,
  String? coverUrl,
  double totalDuration,
  List<dynamic> chapters,
  String? episodeId,
  String? episodeTitle,
  String? libraryId,
});

class _StreamRecovery {
  _StreamRecovery(this._s) {
    policy = PlaybackRecovery(
      reload: _reload,
      lastPosition: _lastPosition,
      isReachable: _serverReachable,
      checkStall: _checkStall,
      onStart: _snapshot,
      onStatus: _onStatus,
      log: (m) => debugPrint('[Recovery] $m'),
    );
  }

  final AudioPlayerService _s;
  late final PlaybackRecovery policy;

  // A stall this long counts as a dropped connection even when the server
  // still answers a ping: the player's own connection is stuck.
  static const _hardStall = Duration(seconds: 45);

  // What was playing when the stream failed. A failed full-start reload
  // clears the service's fields, so later attempts start from this.
  _RecoveryItem? _item;
  // True only while playItem is being entered from a reload, so its
  // "a new play cancels recovery" check can tell the two apart.
  bool _reloadStarting = false;
  bool _toastShown = false;

  /// Streaming from the server: not downloaded files, not casting.
  bool get _streaming =>
      !_s._localSessionMode &&
      _s._currentItemId != null &&
      _s._api != null &&
      !ChromecastService().isCasting;

  /// A stream error reached the old retry path. True when it is handled
  /// here: a recovery is running or starts now, or the stream failed while
  /// paused (the next play reloads it). False leaves it to the old retry,
  /// which still covers downloaded files.
  ///
  /// [resume] says outright whether audio should come back, for callers that
  /// stopped the player themselves before reporting.
  bool handleError(Object error, {bool? resume}) {
    // Downloads, and errors a reload can't fix (a file the server refuses
    // outright, a decoder failure), keep the old short retry.
    if (_s._localSessionMode || !PlaybackRecovery.isNetworkError(error)) {
      return false;
    }
    if (policy.isActive) {
      policy.onFailure(error);
      _silenceWrongFile();
      return true;
    }
    if (!_streaming) return false;
    final wantPlay =
        resume ?? ((_s._player?.playing ?? false) && !_s._pauseRequested);
    if (!wantPlay) {
      debugPrint(
        '[Recovery] Stream failed while paused - the next play reloads it: $error',
      );
      return true;
    }
    policy.onFailure(error);
    _silenceWrongFile();
    return true;
  }

  // On Android, just_audio answers a source error by preparing the book's
  // next file and playing it from 0:00. Until the reload, that would be the
  // wrong part of the book (and, with the network back, audible), so pause
  // the raw player. Not a user pause: the reload still starts playback, and
  // the foreground service stays up (androidStopForegroundOnPause is off).
  void _silenceWrongFile() {
    if (!policy.isWaiting || policy.isStallOnly) return;
    final p = _s._player;
    if (p == null || !p.playing) return;
    unawaited(p.pause().catchError((Object e) {
      debugPrint('[Recovery] Could not pause the player: $e');
    }));
  }

  /// A playback error that isn't a source error but still looks like the
  /// network, on a stream: route it here instead of the re-subscribe path.
  bool claimsError(Object error) =>
      _streaming && PlaybackRecovery.isNetworkError(error);

  void onProcessingState(ProcessingState state) {
    if (state == ProcessingState.ready) {
      _heldSec = null;
      policy.onReady();
      return;
    }
    policy.onBuffering(
      state == ProcessingState.buffering &&
          (_s._player?.playing ?? false) &&
          _streaming,
    );
  }

  /// A "completed" while a recovery waits or reloads is the dead source
  /// ending (libmpv reports a failed stream as the end of the file), not
  /// the book: it must not mark the book finished.
  bool get holdsCompletion => policy.isRecovering;

  /// playItem was entered. Anything but a reload of ours is a new play.
  void onPlayItem() {
    _heldSec = null;
    if (_reloadStarting) return;
    policy.cancel('new play');
  }

  /// A seek is moving the position on purpose: stop holding the old one.
  void onSeek() => _heldSec = null;

  /// While a recovery waits, the player's own position isn't trustworthy:
  /// on Android, just_audio answers a source error by moving to the next
  /// file of the book at 0:00. The service reports where the stream failed
  /// instead, so progress saves, syncs and the UI never see that jump. A
  /// user action that ends the wait keeps the hold until a seek, a new load
  /// or a ready player replaces it.
  Duration? get heldPosition {
    final sec = policy.isWaiting ? policy.failedAtSec : _heldSec;
    if (sec == null || sec <= 0) return null;
    return Duration(milliseconds: (sec * 1000).round());
  }

  double? _heldSec;

  void userAction(_RecoveryUserAction action) {
    if (policy.isWaiting) {
      final at = policy.failedAtSec;
      if (at > 0) {
        _heldSec = at;
        // Resetting progress must not write the old spot back.
        if (action != _RecoveryUserAction.stopWithoutSaving) {
          unawaited(_s._saveProgressLocal(
            Duration(milliseconds: (at * 1000).round()),
          ));
        }
      }
      // After an error the player may have moved itself onto the next file
      // and be ready there. Leave it idle, so the next play starts over at
      // the saved spot instead of resuming in the wrong file. A stall kept
      // its own position and is left alone, and so does a seek, which puts
      // the player where the user asked.
      final p = _s._player;
      if (!action.movesPosition &&
          !policy.isStallOnly &&
          p != null &&
          p.processingState != ProcessingState.idle) {
        unawaited(p.stop().catchError((Object e) {
          debugPrint('[Recovery] Could not stop the player: $e');
        }));
      }
    }
    policy.cancel(action.name);
    // Still buffering (a stall the user paused and resumed): the state won't
    // change again to restart the watch, so start it here. The check sees
    // whether the player is actually playing when it fires.
    if (_s._player?.processingState == ProcessingState.buffering && _streaming) {
      policy.onBuffering(true);
    }
  }

  void networkBack() => policy.retryNow();

  /// The account changed, or the user signed out: a reconnect must not
  /// carry on with the old account's item and sign-in. Ends like a stop (the
  /// held spot is saved, the player is left idle) and forgets the item.
  void cancelForAccount(String reason) {
    if (policy.isActive) {
      debugPrint('[Recovery] $reason - dropping the reconnect');
      userAction(_RecoveryUserAction.stop);
    }
    _item = null;
  }

  /// The stream dropped while the user meant it to play, and a reconnect is
  /// waiting or running: the service reports "playing" (buffering) instead
  /// of the paused raw player, so the app, notification, car and headset
  /// all keep treating it as playing.
  bool get wantsToPlay => policy.isRecovering && !_s._pauseRequested;

  /// A Play (app, headset, car, notification, SMTC). While reconnecting it
  /// means "try now", not "start over": the recovery keeps its item and
  /// target, and the next attempt runs at once when one is waiting. True
  /// when the press was handled here.
  bool retryOnPlay() {
    if (!policy.isRecovering) {
      userAction(_RecoveryUserAction.play);
      return false;
    }
    debugPrint('[Recovery] Play while reconnecting - retrying now');
    policy.retryNow();
    _refresh();
    return true;
  }

  void _refresh() {
    // Same library as the service: this is its own notify, from a part file.
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    _s.notifyListeners();
    AudioPlayerService._handler?.refreshPlaybackState();
  }

  double _lastPosition() {
    if (_s._lastKnownPositionSec > 0) return _s._lastKnownPositionSec;
    final seek = _s._lastSeekTargetSec;
    if (seek != null && seek > 0) return seek;
    if (_s._currentItemId == null) return 0;
    return _s.position.inMilliseconds / 1000.0;
  }

  void _snapshot() {
    _toastShown = false;
    final api = _s._api;
    final itemId = _s._currentItemId;
    _item = api == null || itemId == null
        ? null
        : (
            api: api,
            itemId: itemId,
            title: _s._currentTitle ?? '',
            author: _s._currentAuthor ?? '',
            coverUrl: _s._currentCoverUrl,
            totalDuration: _s._totalDuration,
            chapters: List<dynamic>.from(_s._chapters),
            episodeId: _s._currentEpisodeId,
            episodeTitle: _s._currentEpisodeTitle,
            libraryId: _s._currentLibraryId,
          );
  }

  Future<bool> _serverReachable() async {
    final api = _s._api ?? _item?.api;
    if (api == null) return false;
    return ApiService.pingServer(
      api.baseUrl,
      customHeaders: api.customHeaders,
      backend: api.backend,
    );
  }

  Future<StallVerdict> _checkStall(Duration stalledFor) async {
    final p = _s._player;
    bool stalled() =>
        p != null &&
        p.playing &&
        !_s._pauseRequested &&
        p.processingState == ProcessingState.buffering &&
        _streaming;
    if (!stalled()) return StallVerdict.notStalled;
    // A start in progress has its own timeouts.
    if (_s._isLoadingNewItem) return StallVerdict.keepWaiting;
    if (stalledFor >= _hardStall) return StallVerdict.failed;
    final reachable = await _serverReachable();
    if (!stalled()) return StallVerdict.notStalled;
    // A slow server (a transcode starting up) still answers: keep waiting.
    return reachable ? StallVerdict.keepWaiting : StallVerdict.failed;
  }

  Future<bool> _reload(double at, Object? lastError) async {
    final item = _item;
    if (item == null) return false;
    final gen = policy.generation;
    bool stillOurs() => policy.generation == gen && policy.isReloading;
    final current = _s._currentItemId;
    if (current != null &&
        (current != item.itemId || _s._currentEpisodeId != item.episodeId)) {
      policy.cancel('another item is loaded');
      return false;
    }
    // A stream error usually means the cached-session URLs went bad (expired
    // token, dead session). Drop the cache entry so the reload opens a fresh
    // session, as the old stream retry did.
    await SessionCache.clear(itemId: item.itemId, episodeId: item.episodeId);
    // The server turned the byte range down: the file changed size since its
    // bytes were cached.
    if ('$lastError'.contains('Response code: 416')) {
      try {
        await AudioPlayer.clearStreamingCache();
      } catch (e) {
        debugPrint('[Recovery] Streaming cache clear failed: $e');
      }
    }
    final api = _s._api ?? item.api;
    if (api.isBookOrbit) {
      try {
        await api.ensureMediaReady();
      } catch (e) {
        debugPrint('[Recovery] BookOrbit media proxy not ready: $e');
      }
    }
    if (!stillOurs()) return false;
    // The item is still loaded: rebuild only its audio source on a fresh
    // session, so the player, its item and its state stay put through every
    // attempt (a failed one included).
    final swapped = await _swapSource(api, item, at, stillOurs);
    if (swapped != null) return swapped;
    if (!stillOurs()) return false;
    final Future<String?> start;
    _reloadStarting = true;
    try {
      start = _s.playItem(
        api: api,
        itemId: item.itemId,
        title: item.title,
        author: item.author,
        coverUrl: item.coverUrl,
        totalDuration: item.totalDuration,
        chapters: item.chapters,
        // No known position: let playItem pick the saved one rather than
        // starting the book over.
        startTime: at,
        forceStartTime: at > 0,
        episodeId: item.episodeId,
        episodeTitle: item.episodeTitle,
        libraryId: item.libraryId,
      );
    } finally {
      _reloadStarting = false;
    }
    final result = await start;
    if (result != null) {
      debugPrint('[Recovery] Reload failed: $result');
      return false;
    }
    // Paused while the reload was loading: playItem started it anyway, so
    // honour the pause now.
    if (_s._pauseRequested && (_s._player?.playing ?? false)) {
      await _s.pause();
    }
    return true;
  }

  /// Moves the loaded item onto a new server session and rebuilds just its
  /// source at [at], through the same swap the player uses to adopt a fresh
  /// session at a pause or seek. Nothing is cleared, so a failure leaves the
  /// item, the UI and the controls in place for the next attempt.
  ///
  /// Null when this item can't be swapped that way (another item, a download,
  /// casting, or a source that isn't on the server's tokenless session URLs:
  /// old servers and transcodes), and the caller falls back to a full start.
  /// Otherwise whether the source loaded and is playing again.
  Future<bool?> _swapSource(
    ApiService api,
    _RecoveryItem item,
    double at,
    bool Function() stillOurs,
  ) async {
    final s = _s;
    if (s._player == null ||
        s._api == null ||
        s._localSessionMode ||
        s._currentItemId != item.itemId ||
        s._currentEpisodeId != item.episodeId ||
        s._sourceSessionId == null ||
        ChromecastService().isCasting) {
      return null;
    }
    final startGen = s._playbackGeneration;
    Map<String, dynamic>? session;
    try {
      session = item.episodeId != null
          ? await api.startEpisodePlaybackSession(item.itemId, item.episodeId!)
          : await api.startPlaybackSession(item.itemId);
    } catch (e) {
      debugPrint('[Recovery] Session start failed: $e');
      return false;
    }
    if (session == null) {
      debugPrint('[Recovery] Server gave no session - keeping the item');
      return false;
    }
    // Stopped, or another item started, while asking: close what we got.
    if (s._dropStaleSession(api, startGen, item.itemId, item.episodeId, session)) {
      return false;
    }
    final sid = session['id'] as String?;
    if (!stillOurs()) {
      if (sid != null) unawaited(api.closePlaybackSession(sid));
      return false;
    }
    final tracks = session['audioTracks'] as List<dynamic>?;
    if (sid == null || tracks == null || tracks.isEmpty) {
      debugPrint('[Recovery] Session has no tracks - keeping the item');
      if (sid != null) unawaited(api.closePlaybackSession(sid));
      return false;
    }
    s._playbackSessionId = sid;
    s._logEvent(PlaybackEventType.sessionStart, detail: 'reconnect');
    s._stashSessionUpgrade(session);
    try {
      final active = await (await AudioSession.instance).setActive(true);
      if (!active) debugPrint('[Recovery] Audio focus refused before the reload');
    } catch (_) {}
    final ok = await s._applyPendingSessionUpgrade(seekToSeconds: at);
    if (!ok) {
      // The swap replaces the source only after it has captured the new
      // URLs. If it never got that far (the server handed out tokened or
      // transcode URLs this time), the old source is untouched and a full
      // start is still possible; otherwise this attempt failed.
      if (s._sourceSessionId != sid) return null;
      debugPrint('[Recovery] New source did not load');
      return false;
    }
    // Paused, stopped or replaced while it loaded: don't start it.
    if (!stillOurs() ||
        s._pauseRequested ||
        s._playbackGeneration != startGen ||
        s._currentItemId != item.itemId) {
      debugPrint('[Recovery] Reload finished after the user moved on - not starting it');
      return false;
    }
    unawaited(s._player?.play());
    AudioPlayerService._handler?.refreshPlaybackState();
    debugPrint('[Recovery] Source rebuilt at ${at.toStringAsFixed(1)}s on '
        'session ${sid.length > 8 ? sid.substring(0, 8) : sid}');
    return true;
  }

  void _onStatus(PlaybackRecoveryStatus status, Object? error) {
    // "Playing" follows the recovery (see wantsToPlay): tell the app and the
    // media session whenever that changes.
    _refresh();
    switch (status) {
      case PlaybackRecoveryStatus.idle:
        break;
      case PlaybackRecoveryStatus.reconnecting:
        if (_toastShown) return;
        _toastShown = true;
        final l = AudioPlayerService._l10n();
        showNavigatorOverlayToast(
          rootNavigatorKey.currentState,
          l?.playerReconnecting ?? 'Connection lost, reconnecting…',
          icon: Icons.wifi_off_rounded,
        );
      case PlaybackRecoveryStatus.gaveUp:
        _toastShown = false;
        _item = null;
        debugPrint('[Recovery] Gave up: $error');
        // Same as a user action ending the wait: keep reporting where the
        // stream failed, and don't leave the player ready in another file.
        final at = policy.failedAtSec;
        if (at > 0) _heldSec = at;
        final p = _s._player;
        if (!policy.isStallOnly &&
            p != null &&
            p.processingState != ProcessingState.idle) {
          unawaited(p.stop().catchError((Object e) {
            debugPrint('[Recovery] Could not stop the player: $e');
          }));
        }
        final l = AudioPlayerService._l10n();
        showNavigatorOverlayToast(
          rootNavigatorKey.currentState,
          l?.playerReconnectFailed ??
              "Couldn't reconnect to the server, so playback stopped.",
          icon: Icons.cloud_off_rounded,
        );
        unawaited(_stopAfterGivingUp());
    }
  }

  // Stop as before recovery existed, but show it: a player left "playing"
  // on a dead source looks like it is still going. pause() also saves the
  // held position, so the next play starts there.
  Future<void> _stopAfterGivingUp() async {
    if (_s._currentItemId != null) {
      await _s.pause();
    } else {
      await _s._player?.pause();
    }
  }
}

/// What the media session (notification, lock screen, car, SMTC) and the
/// media-button resolver read as "playing": the raw player, or a reconnect
/// the user is waiting through (see [_StreamRecovery.wantsToPlay]).
extension _RecoveryAwareHandler on AudioPlayerHandler {
  bool get _reconnecting => _service?._recovery.wantsToPlay ?? false;

  bool get _playingOrReconnecting => _player.playing || _reconnecting;
}

/// For the player UI: a stream is reconnecting while the user means it to
/// play, so the play button shows the loading state rather than "paused".
extension ForkRecoveryState on AudioPlayerService {
  bool get isReconnecting => _recovery.wantsToPlay;

  /// Drops a reconnect in progress. For account switches and sign-outs,
  /// which must reach it even while no item is loaded.
  void cancelRecovery(String reason) => _recovery.cancelForAccount(reason);
}
