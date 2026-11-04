import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'setup_flow_screen.dart';

/// Settings > Issues & Support: opens the first-run setup again. The
/// Connect page shows the signed-in account, so nothing about sign-in
/// changes; Back on the first page (or system back) leaves it.
class RunSetupAgainTile extends StatelessWidget {
  const RunSetupAgainTile({super.key});

  static Future<void> open(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).push<void>(
        MaterialPageRoute(
          builder: (routeContext) => SetupFlowScreen(
            onFinished: () => Navigator.of(routeContext).pop(),
          ),
        ),
      );

  /// The small button under the version line at the bottom of Settings,
  /// where most apps keep "replay the intro" (owner, 2026-11-04).
  static Widget aboutButton(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Center(
      child: TextButton.icon(
        key: const ValueKey('run-setup-again-about'),
        onPressed: () => open(context),
        icon: const Icon(Icons.restart_alt_rounded, size: 16),
        label: Text(l.setupRunAgain),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return ListTile(
      key: const ValueKey('run-setup-again'),
      leading: Icon(Icons.restart_alt_rounded, color: cs.onSurfaceVariant),
      title: Text(l.setupRunAgain),
      subtitle: Text(
        l.setupRunAgainSubtitle,
        style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () => open(context),
    );
  }
}
