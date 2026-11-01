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
}

/// Read-only views of the service's start bookkeeping, for tests.
extension ForkPlaybackTestHooks on AudioPlayerService {
  @visibleForTesting
  int get debugPlaybackGeneration => _playbackGeneration;

  /// Pretends a start is loading, the way playItem marks one.
  @visibleForTesting
  void debugMarkStartLoading() {
    _playbackGeneration++;
    _isLoadingNewItem = true;
  }
}
