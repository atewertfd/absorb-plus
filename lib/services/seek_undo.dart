import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../main.dart' show rootNavigatorKey;
import '../utils/episode_key.dart';
import '../widgets/overlay_toast.dart';
import 'audio_player_service.dart';

/// What [SeekUndo] needs from the player: which item is loaded, and a way to
/// move back. The app uses [AudioPlayerService]; tests pass a fake.
abstract class SeekUndoPlayer {
  /// "itemId" or "itemId-episodeId" of what is loaded, or null.
  String? get loadedKey;
  Future<void> seekTo(Duration position);
}

class _AppPlayer implements SeekUndoPlayer {
  const _AppPlayer();

  @override
  String? get loadedKey {
    final p = AudioPlayerService();
    final id = p.currentItemId;
    return id == null ? null : episodeKeyFor(id, p.currentEpisodeId);
  }

  @override
  Future<void> seekTo(Duration position) => AudioPlayerService().seekTo(position);
}

/// Absorb Plus: offers to undo an accidental long jump.
///
/// [AudioPlayerService.seekTo] reports every plain seek here (scrubbing the
/// seek bar, picking a chapter or bookmark, desktop and media-control seeks).
/// The skip buttons don't go through `seekTo`, so they never offer an undo.
/// A jump longer than [threshold] shows "Back to 1:23:45" for ~6 s; tapping
/// it seeks back to where playback was.
class SeekUndo {
  SeekUndo({
    SeekUndoPlayer? player,
    void Function(String time, VoidCallback undo)? present,
    DateTime Function()? clock,
  })  : _player = player ?? const _AppPlayer(),
        _present = present ?? _showToast,
        _clock = clock ?? DateTime.now;

  static SeekUndo instance = SeekUndo();

  /// Jumps at or below this (either direction) don't offer an undo.
  static const threshold = Duration(seconds: 60);

  /// How long the offer stays valid; matches the toast's offer time.
  static const window = Duration(seconds: 6);

  final SeekUndoPlayer _player;
  final void Function(String time, VoidCallback undo) _present;
  final DateTime Function() _clock;

  ({String key, Duration from, DateTime at})? _pending;
  bool _undoing = false;

  @visibleForTesting
  Duration? get pendingFrom => _pending?.from;

  /// Called after a user seek from [from] to [to] on the item [key].
  void onSeek({required String? key, required Duration from, required Duration to}) {
    if (_undoing || key == null) return;
    if ((to - from).abs() <= threshold) return;
    _pending = (key: key, from: from, at: _clock());
    _present(formatSeekUndoTime(from), undo);
  }

  /// Seeks back to where the last long jump started, if the offer is still
  /// valid and the same item is loaded. Returns whether it moved.
  Future<bool> undo() async {
    final p = _pending;
    _pending = null;
    if (p == null) return false;
    if (_clock().difference(p.at) > window + const Duration(seconds: 1)) return false;
    if (_player.loadedKey != p.key) return false;
    debugPrint('[SeekUndo] Back to ${formatSeekUndoTime(p.from)}');
    _undoing = true;
    try {
      await _player.seekTo(p.from);
    } finally {
      _undoing = false;
    }
    return true;
  }

  static void _showToast(String time, VoidCallback undo) {
    final nav = rootNavigatorKey.currentState;
    final ctx = rootNavigatorKey.currentContext;
    final l = ctx != null ? AppLocalizations.of(ctx) : null;
    showNavigatorOverlayToast(nav, l?.seekUndoBackTo(time) ?? 'Back to $time',
        icon: Icons.undo_rounded, onTap: undo);
  }
}

/// "1:23:45", or "23:45" under an hour.
String formatSeekUndoTime(Duration d) {
  if (d.isNegative) d = Duration.zero;
  final h = d.inHours;
  final m = d.inMinutes.remainder(60);
  final s = d.inSeconds.remainder(60);
  String two(int v) => v.toString().padLeft(2, '0');
  return h > 0 ? '$h:${two(m)}:${two(s)}' : '$m:${two(s)}';
}
