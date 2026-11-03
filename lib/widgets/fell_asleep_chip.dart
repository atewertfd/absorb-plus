import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/audio_player_service.dart';
import '../services/fell_asleep_marker.dart';
import '../services/seek_undo.dart' show formatSeekUndoTime;
import '../utils/episode_key.dart';

/// What the chip needs from the player. The app uses [AudioPlayerService];
/// tests pass a fake.
abstract class FellAsleepPlayer implements Listenable {
  /// "itemId" or "itemId-episodeId" of what is loaded, or null.
  String? get loadedKey;
  Duration get position;
  bool get isPlaying;
  Stream<Duration> get positions;
  Future<void> seekTo(Duration position);
}

class _AppPlayer implements FellAsleepPlayer {
  _AppPlayer(this.player);

  final AudioPlayerService player;

  @override
  String? get loadedKey {
    final id = player.currentItemId;
    return id == null ? null : episodeKeyFor(id, player.currentEpisodeId);
  }

  @override
  Duration get position => player.position;

  @override
  bool get isPlaying => player.isPlaying;

  @override
  Stream<Duration> get positions => player.absolutePositionStream;

  @override
  Future<void> seekTo(Duration position) => player.seekTo(position);

  @override
  void addListener(VoidCallback listener) => player.addListener(listener);

  @override
  void removeListener(VoidCallback listener) => player.removeListener(listener);
}

/// Absorb Plus: "Fell asleep around 1:23:45 · Jump back" over the player
/// for the loaded book, styled like the app's toasts. Place it as a direct
/// child of the player's [Stack]; it positions itself [top] pixels down.
/// Shows nothing (and listens to nothing) unless this book has a marker.
class FellAsleepChip extends StatefulWidget {
  const FellAsleepChip({
    super.key,
    required this.itemId,
    this.episodeId,
    this.top = 16,
    this.player,
    this.store,
  });

  final String itemId;
  final String? episodeId;
  final double top;
  final FellAsleepPlayer? player;
  final FellAsleepStore? store;

  @override
  State<FellAsleepChip> createState() => _FellAsleepChipState();
}

class _FellAsleepChipState extends State<FellAsleepChip> {
  late FellAsleepPlayer _player;
  late FellAsleepStore _store;
  FellAsleepMarker? _marker;
  bool _visible = false;
  bool _listening = false;
  bool _clearing = false;
  StreamSubscription<Duration>? _positionSub;
  int _loadGeneration = 0;

  String get _key => episodeKeyFor(widget.itemId, widget.episodeId);

  @override
  void initState() {
    super.initState();
    _player = widget.player ?? _AppPlayer(AudioPlayerService());
    _store = widget.store ?? FellAsleepStore.instance;
    _store.addListener(_reload);
    _reload();
  }

  @override
  void didUpdateWidget(FellAsleepChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.itemId != widget.itemId ||
        oldWidget.episodeId != widget.episodeId) {
      _marker = null;
      _evaluate();
      _reload();
    }
  }

  @override
  void dispose() {
    _store.removeListener(_reload);
    _stopListening();
    super.dispose();
  }

  Future<void> _reload() async {
    final generation = ++_loadGeneration;
    final marker = await _store.markerFor(_key);
    if (!mounted || generation != _loadGeneration) return;
    _marker = marker;
    _clearing = false;
    if (marker == null) {
      _stopListening();
    } else {
      _startListening();
    }
    _evaluate();
  }

  void _startListening() {
    if (_listening) return;
    _listening = true;
    _player.addListener(_evaluate);
    _positionSub = _player.positions.listen((_) => _evaluate());
  }

  void _stopListening() {
    if (!_listening) return;
    _listening = false;
    _player.removeListener(_evaluate);
    _positionSub?.cancel();
    _positionSub = null;
  }

  void _evaluate() {
    if (!mounted) return;
    final marker = _marker;
    var visible = false;
    if (marker != null && _player.loadedKey == _key) {
      final position = _player.position;
      visible = marker.usefulAt(position);
      // Listened well past where the timer stopped: done with it. Only
      // while playing, so a position that is still settling never counts.
      if (_player.isPlaying &&
          position >= marker.stoppedAt + FellAsleepMarker.listenedPast) {
        _clear();
      }
    }
    if (visible != _visible) setState(() => _visible = visible);
  }

  void _clear() {
    if (_clearing) return;
    _clearing = true;
    unawaited(_store.clear(_key));
  }

  Future<void> _jumpBack() async {
    final marker = _marker;
    if (marker == null) return;
    setState(() => _visible = false);
    _clear();
    await _player.seekTo(marker.at);
  }

  void _dismiss() {
    setState(() => _visible = false);
    _clear();
  }

  @override
  Widget build(BuildContext context) {
    final marker = _marker;
    if (!_visible || marker == null) {
      return const Positioned(top: 0, left: 0, child: SizedBox.shrink());
    }
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    return Positioned(
      top: widget.top,
      left: 16,
      right: 16,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                color: cs.surface.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: cs.primary.withValues(alpha: 0.25)),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Semantics(
                        button: true,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: _jumpBack,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 4, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.bedtime_rounded,
                                  size: 18,
                                  color: cs.primary,
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    l.fellAsleepJumpBack(
                                      formatSeekUndoTime(marker.at),
                                    ),
                                    style: TextStyle(
                                      color: cs.onSurface,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: l.dismiss,
                      visualDensity: VisualDensity.compact,
                      iconSize: 16,
                      color: cs.onSurfaceVariant,
                      onPressed: _dismiss,
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
