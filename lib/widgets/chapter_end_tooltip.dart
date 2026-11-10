import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

/// Absorb Plus: when playback reaches the end of what's left, in wall-clock
/// time. [remainingSeconds] is audio time (chapter end minus position), so it
/// is divided by [speed] the same way the sleep timer's "End of chapter" tab
/// does. Null when nothing is left or the numbers are unusable.
DateTime? playbackEndsAt({
  required double remainingSeconds,
  required double speed,
  required DateTime now,
}) {
  if (!remainingSeconds.isFinite || remainingSeconds <= 0) return null;
  final s = speed.isFinite && speed > 0 ? speed : 1.0;
  return now.add(Duration(milliseconds: (remainingSeconds / s * 1000).round()));
}

/// [time] as the device writes times of day: "10:42 PM", or "22:42" when the
/// system asks for a 24-hour clock.
String formatWallClockTime(BuildContext context, DateTime time) {
  final use24h = MediaQuery.maybeAlwaysUse24HourFormatOf(context) ?? false;
  return MaterialLocalizations.of(context).formatTimeOfDay(
    TimeOfDay.fromDateTime(time),
    alwaysUse24HourFormat: use24h,
  );
}

/// Adds a "Chapter ends at 10:42 PM" tooltip (hover on desktop, long-press on
/// touch) to the chapter's remaining-time label. It changes nothing about the
/// label's look or layout and adds no timers: the time is worked out when the
/// label rebuilds (the progress bar does that at most once a second) and
/// again the moment the pointer arrives, so a paused player still shows a
/// current answer.
class ChapterEndTooltip extends StatefulWidget {
  /// Audio seconds left in the chapter (or the book, see [wholeBook]).
  final double remainingSeconds;
  final double speed;

  /// No chapters to speak of: say "Ends at" instead of "Chapter ends at".
  final bool wholeBook;

  /// Off while the item isn't the one playing, or while scrubbing.
  final bool enabled;
  final Widget child;

  /// The clock, for tests.
  final DateTime Function() now;

  const ChapterEndTooltip({
    super.key,
    required this.remainingSeconds,
    required this.speed,
    required this.child,
    this.wholeBook = false,
    this.enabled = true,
    this.now = DateTime.now,
  });

  @override
  State<ChapterEndTooltip> createState() => _ChapterEndTooltipState();
}

class _ChapterEndTooltipState extends State<ChapterEndTooltip> {
  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;
    final end = playbackEndsAt(
      remainingSeconds: widget.remainingSeconds,
      speed: widget.speed,
      now: widget.now(),
    );
    if (end == null) return widget.child;
    final l = AppLocalizations.of(context)!;
    final time = formatWallClockTime(context, end);
    return MouseRegion(
      onEnter: (_) => _refresh(),
      child: Listener(
        onPointerDown: (_) => _refresh(),
        child: Tooltip(
          message: widget.wholeBook ? l.playerEndsAt(time) : l.playerChapterEndsAt(time),
          child: widget.child,
        ),
      ),
    );
  }
}
