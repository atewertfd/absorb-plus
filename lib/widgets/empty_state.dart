// Absorb Plus: one shared "nothing here yet" block for lists that can be
// empty (Downloads, search, a library, Stats). It uses the look the app's
// existing empty states already have: a faded icon, one line of text and,
// when there is something useful to do next, one outlined button.
import 'package:flutter/material.dart';

import '../screens/app_shell.dart';

/// "Browse library": switch the shell to the Library tab, popping pushed
/// pages such as Downloads. Outside the shell (tests, a cold start) it just
/// goes back.
void browseLibraryFrom(BuildContext context) {
  if (AppShell.openLibraryGlobal()) return;
  Navigator.maybePop(context);
}

class AbsorbEmptyState extends StatelessWidget {
  const AbsorbEmptyState({
    super.key,
    required this.icon,
    required this.message,
    this.actionLabel,
    this.actionIcon,
    this.onAction,
    this.padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
  });

  final IconData icon;
  final String message;

  /// The button shows only when both a label and a handler are given.
  final String? actionLabel;
  final IconData? actionIcon;
  final VoidCallback? onAction;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final label = actionLabel;
    final showAction = label != null && onAction != null;
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 56, color: cs.onSurfaceVariant.withValues(alpha: 0.3)),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: tt.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
            ),
            if (showAction) ...[
              const SizedBox(height: 20),
              actionIcon == null
                  ? OutlinedButton(onPressed: onAction, child: Text(label))
                  : OutlinedButton.icon(
                      icon: Icon(actionIcon, size: 18),
                      label: Text(label),
                      onPressed: onAction,
                    ),
            ],
          ],
        ),
      ),
    );
  }
}
