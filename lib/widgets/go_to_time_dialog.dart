import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../services/audio_player_service.dart';
import '../services/seek_undo.dart' show formatSeekUndoTime;

/// Absorb Plus: "Go to time…" in the player's More menu and Ctrl+G on
/// desktop. Type a time, and the player seeks there. The seek goes through
/// [AudioPlayerService.seekTo], so a long jump offers the usual
/// "Back to 1:23:45" undo.

/// The More-menu / button-grid id of the action.
const goToTimeButtonId = 'gototime';

/// Its icon, shared by the More menu pill and the button grid.
const goToTimeIcon = Icons.more_time_rounded;

/// What the dialog moves. The app uses the loaded book in
/// [AudioPlayerService]; tests pass a fake.
abstract class GoToTimeTarget {
  /// Length of the loaded book or episode; zero when unknown.
  Duration get length;

  Duration get position;

  Future<void> seekTo(Duration position);
}

class _PlayerTarget implements GoToTimeTarget {
  _PlayerTarget(this.player);

  final AudioPlayerService player;

  @override
  Duration get length =>
      Duration(milliseconds: (player.totalDuration * 1000).round());

  @override
  Duration get position => player.position;

  @override
  Future<void> seekTo(Duration position) => player.seekTo(position);
}

/// Longest time [parseGoToTime] accepts: 31 days, far past any book.
const _maxMinutes = 31 * 24 * 60;

/// Reads "h:mm:ss", "mm:ss" (minutes may run past 59) or plain minutes
/// ("90", "12.5"). Returns null for anything else.
Duration? parseGoToTime(String input) {
  final text = input.trim();
  if (text.isEmpty) return null;
  if (!text.contains(':')) {
    final minutes = double.tryParse(text.replaceAll(',', '.'));
    if (minutes == null ||
        minutes.isNaN ||
        minutes.isInfinite ||
        minutes < 0 ||
        minutes > _maxMinutes) {
      return null;
    }
    return Duration(milliseconds: (minutes * 60000).round());
  }
  final parts = text.split(':');
  if (parts.length > 3) return null;
  final values = <int>[];
  for (final part in parts) {
    final p = part.trim();
    // Six digits is plenty (a month in minutes) and keeps int.parse and
    // Duration far from overflow on a pasted giant number.
    if (p.isEmpty || p.length > 6 || !RegExp(r'^\d+$').hasMatch(p)) {
      return null;
    }
    values.add(int.parse(p));
  }
  final seconds = values.last;
  if (seconds > 59 || parts.last.trim().length > 2) return null;
  if (values.length == 2) {
    return Duration(minutes: values[0], seconds: seconds);
  }
  final minutes = values[1];
  if (minutes > 59 || parts[1].trim().length > 2) return null;
  return Duration(hours: values[0], minutes: minutes, seconds: seconds);
}

/// Why [input] can't be used for a book of [length], or null when it can.
String? goToTimeError(AppLocalizations l, String input, Duration length) {
  final target = parseGoToTime(input);
  if (target == null) return l.goToTimeInvalid;
  if (length > Duration.zero && target > length) {
    return l.goToTimePastEnd(formatSeekUndoTime(length));
  }
  return null;
}

/// Whether there is a loaded book to move in.
bool goToTimeAvailable([AudioPlayerService? player]) =>
    (player ?? AudioPlayerService()).hasBook;

/// Opens the dialog and seeks the loaded book to the typed time.
/// Returns where it went, or null when cancelled.
Future<Duration?> showGoToTimeDialog(
  BuildContext context, {
  GoToTimeTarget? target,
}) async {
  final t = target ?? _PlayerTarget(AudioPlayerService());
  final picked = await showDialog<Duration>(
    context: context,
    builder: (_) => _GoToTimeDialog(length: t.length, position: t.position),
  );
  if (picked == null) return null;
  await t.seekTo(picked);
  return picked;
}

class _GoToTimeDialog extends StatefulWidget {
  const _GoToTimeDialog({required this.length, required this.position});

  final Duration length;
  final Duration position;

  @override
  State<_GoToTimeDialog> createState() => _GoToTimeDialogState();
}

class _GoToTimeDialogState extends State<_GoToTimeDialog> {
  late final TextEditingController _controller;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: formatSeekUndoTime(widget.position),
    );
    _controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: _controller.text.length,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final l = AppLocalizations.of(context)!;
    final error = goToTimeError(l, _controller.text, widget.length);
    if (error != null) {
      setState(() => _error = error);
      return;
    }
    Navigator.pop(context, parseGoToTime(_controller.text));
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return AlertDialog(
      scrollable: true,
      title: Text(l.goToTime),
      content: SizedBox(
        width: double.maxFinite,
        child: TextField(
          controller: _controller,
          autofocus: true,
          keyboardType: TextInputType.datetime,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9:.,]')),
          ],
          textInputAction: TextInputAction.go,
          onChanged: (_) {
            if (_error != null) setState(() => _error = null);
          },
          onSubmitted: (_) => _submit(),
          decoration: InputDecoration(
            labelText: l.goToTimeLabel,
            hintText: l.goToTimeHint,
            helperText: widget.length > Duration.zero
                ? l.goToTimeLength(formatSeekUndoTime(widget.length))
                : null,
            errorText: _error,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l.cancel),
        ),
        FilledButton(onPressed: _submit, child: Text(l.goToTimeGo)),
      ],
    );
  }
}
