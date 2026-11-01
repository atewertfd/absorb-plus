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

  /// Runs the completion path, as the end of the book or a skip past it.
  @visibleForTesting
  Future<void> debugCompletePlayback({bool userRequested = false}) =>
      _onPlaybackComplete(userRequested: userRequested);

  /// Pretends a start is loading, the way playItem marks one.
  @visibleForTesting
  void debugMarkStartLoading() {
    _playbackGeneration++;
    _isLoadingNewItem = true;
  }
}
