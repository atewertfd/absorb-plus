// Absorb Plus: the streak card, the daily goal sheet and the month summary
// on the Stats screen. The numbers come from services/listening_streaks.dart.
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/listening_streaks.dart';

BoxDecoration _cardDeco(ColorScheme cs) => BoxDecoration(
      color: cs.onSurface.withValues(alpha: 0.03),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: cs.onSurface.withValues(alpha: 0.06)),
    );

Color _doneColor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
        ? Colors.greenAccent[400]!
        : Colors.green.shade700;

/// Current and best streak, with a ring for today's goal when one is set.
class ListeningStreakCard extends StatelessWidget {
  const ListeningStreakCard({
    super.key,
    required this.streak,
    required this.goalMinutes,
    required this.onEditGoal,
    required this.formatDuration,
  });

  final StreakSummary streak;

  /// The daily goal in minutes, 0 when it is off.
  final int goalMinutes;
  final VoidCallback onEditGoal;
  final String Function(double seconds) formatDuration;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final hint = streak.atRisk
        ? l.statsStreakKeepGoing
        : streak.current == 0
            ? l.statsStreakHowTo
            : null;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _cardDeco(cs),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(
            child: _StreakStat(
              icon: Icons.local_fire_department_rounded,
              accent: Colors.orange,
              value: l.statsScreenStreakDays(streak.current),
              label: l.statsCurrentStreak,
              dimmed: streak.atRisk,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StreakStat(
              icon: Icons.emoji_events_rounded,
              accent: Colors.amber.shade600,
              value: l.statsScreenStreakDays(streak.best),
              label: l.statsBestStreak,
            ),
          ),
          const SizedBox(width: 8),
          if (goalMinutes > 0)
            _GoalRing(
              progress: dailyGoalProgress(streak.todaySeconds, goalMinutes),
              tooltip:
                  '${l.statsDailyGoal}: ${l.statsGoalProgress(formatDuration(streak.todaySeconds), formatDuration(goalMinutes * 60.0))}',
              onTap: onEditGoal,
            )
          else
            IconButton(
              icon: Icon(Icons.flag_outlined, color: cs.onSurfaceVariant),
              tooltip: l.statsDailyGoalSet,
              onPressed: onEditGoal,
            ),
        ]),
        if (hint != null) ...[
          const SizedBox(height: 8),
          Text(hint,
              style: tt.labelSmall?.copyWith(
                  color: streak.atRisk
                      ? Colors.orange
                      : cs.onSurface.withValues(alpha: 0.45))),
        ],
      ]),
    );
  }
}

class _StreakStat extends StatelessWidget {
  const _StreakStat({
    required this.icon,
    required this.accent,
    required this.value,
    required this.label,
    this.dimmed = false,
  });

  final IconData icon;
  final Color accent;
  final String value;
  final String label;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Row(children: [
      Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: accent.withValues(alpha: dimmed ? 0.06 : 0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: accent.withValues(alpha: dimmed ? 0.45 : 0.8), size: 18),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: tt.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700, color: cs.onSurface, height: 1)),
          const SizedBox(height: 2),
          Text(label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: tt.labelSmall?.copyWith(
                  color: cs.onSurface.withValues(alpha: 0.35), fontSize: 11)),
        ]),
      ),
    ]);
  }
}

class _GoalRing extends StatelessWidget {
  const _GoalRing({required this.progress, required this.tooltip, required this.onTap});

  final double progress;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final done = _doneColor(context);
    final reached = progress >= 1;
    const size = 44.0;
    return Tooltip(
      message: tooltip,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(alignment: Alignment.center, children: [
              SizedBox(
                width: size,
                height: size,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 4,
                  backgroundColor: cs.onSurface.withValues(alpha: 0.08),
                  valueColor: AlwaysStoppedAnimation(reached ? done : cs.primary),
                ),
              ),
              if (reached)
                Icon(Icons.check_rounded, color: done, size: size * 0.43)
              else
                Text('${(progress * 100).round()}%',
                    style: tt.labelSmall
                        ?.copyWith(fontWeight: FontWeight.w700, color: cs.onSurface)),
            ]),
          ),
        ),
      ),
    );
  }
}

/// Lets the user pick a daily goal. Returns the new goal in minutes (0 turns
/// it off), or null when the sheet was dismissed.
Future<int?> showDailyGoalSheet(
  BuildContext context, {
  required int currentMinutes,
  required String Function(double seconds) formatDuration,
}) {
  return showModalBottomSheet<int>(
    context: context,
    showDragHandle: true,
    builder: (ctx) => _DailyGoalSheet(
      currentMinutes: currentMinutes,
      formatDuration: formatDuration,
    ),
  );
}

class _DailyGoalSheet extends StatelessWidget {
  const _DailyGoalSheet({required this.currentMinutes, required this.formatDuration});

  final int currentMinutes;
  final String Function(double seconds) formatDuration;

  Future<void> _custom(BuildContext context) async {
    final input = await showDialog<String>(
      context: context,
      builder: (ctx) => _GoalInputDialog(initial: currentMinutes > 0 ? '$currentMinutes' : ''),
    );
    if (input == null || !context.mounted) return;
    final minutes = parseDailyGoalMinutes(input);
    if (minutes == null) return;
    Navigator.pop(context, minutes);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    final isCustom = currentMinutes > 0 && !kDailyGoalPresets.contains(currentMinutes);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.statsDailyGoalSheetTitle,
                style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(l.statsDailyGoalSheetBody,
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
            const SizedBox(height: 16),
            Wrap(spacing: 8, runSpacing: 8, children: [
              ChoiceChip(
                label: Text(l.statsGoalOff),
                selected: currentMinutes <= 0,
                onSelected: (_) => Navigator.pop(context, 0),
              ),
              for (final m in kDailyGoalPresets)
                ChoiceChip(
                  label: Text(formatDuration(m * 60.0)),
                  selected: currentMinutes == m,
                  onSelected: (_) => Navigator.pop(context, m),
                ),
              ChoiceChip(
                label: Text(isCustom
                    ? '${l.custom} · ${formatDuration(currentMinutes * 60.0)}'
                    : l.custom),
                selected: isCustom,
                onSelected: (_) => _custom(context),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class _GoalInputDialog extends StatefulWidget {
  const _GoalInputDialog({required this.initial});
  final String initial;

  @override
  State<_GoalInputDialog> createState() => _GoalInputDialogState();
}

class _GoalInputDialogState extends State<_GoalInputDialog> {
  late final TextEditingController _ctrl = TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l.statsGoalEnterTitle),
      content: TextField(
        controller: _ctrl,
        autofocus: true,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(hintText: l.statsGoalEnterTimeHint),
        onSubmitted: (v) => Navigator.pop(context, v),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l.cancel)),
        FilledButton(onPressed: () => Navigator.pop(context, _ctrl.text), child: Text(l.save)),
      ],
    );
  }
}

/// Hours, books finished and the top book for the month so far. Pieces that
/// aren't known (null) are left out.
class MonthSummaryCard extends StatelessWidget {
  const MonthSummaryCard({
    super.key,
    required this.title,
    required this.listenedSeconds,
    required this.formatDuration,
    this.listenedLabel,
    this.booksFinished,
    this.topBook,
  });

  final String title;
  final double listenedSeconds;

  /// Replaces "Listened" when the time includes reading (BookOrbit).
  final String? listenedLabel;
  final int? booksFinished;
  final TopMonthBook? topBook;
  final String Function(double seconds) formatDuration;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final valueStyle = tt.titleSmall
        ?.copyWith(fontWeight: FontWeight.w700, color: cs.onSurface, height: 1.1);
    final labelStyle = tt.labelSmall
        ?.copyWith(color: cs.onSurface.withValues(alpha: 0.35), fontSize: 10);

    Widget piece(String value, String label, {int flex = 1}) => Expanded(
          flex: flex,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: valueStyle),
            const SizedBox(height: 3),
            Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: labelStyle),
          ]),
        );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: _cardDeco(cs),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: tt.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: cs.onSurface.withValues(alpha: 0.6))),
        const SizedBox(height: 8),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          piece(formatDuration(listenedSeconds), listenedLabel ?? l.statsMonthListened),
          if (booksFinished != null) ...[
            const SizedBox(width: 10),
            piece('$booksFinished', l.statsBooksFinished),
          ],
          if (topBook != null) ...[
            const SizedBox(width: 10),
            piece(topBook!.title, l.statsMonthTopBook, flex: 2),
          ],
        ]),
      ]),
    );
  }
}
