import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../screens/developer_screen.dart';
import '../services/developer_mode.dart';
import '../services/test_channel_service.dart';
import 'overlay_toast.dart';
import 'update_dialog.dart';

/// Settings' version line calls this on every tap (Absorb Plus). The
/// seventh quick tap turns Developer mode on.
Future<void> onVersionLineTapped(BuildContext context) async {
  if (!DeveloperMode.versionTaps.tap()) return;
  final l = AppLocalizations.of(context)!;
  final wasOn = await DeveloperMode.load();
  if (!wasOn) await DeveloperMode.setEnabled(true);
  if (!context.mounted) return;
  showOverlayToast(
    context,
    wasOn ? l.developerModeAlreadyOn : l.developerModeOn,
    icon: Icons.developer_mode_rounded,
  );
}

/// The Developer entry in Settings > Advanced. Always shown (owner request,
/// 2026-11-03: no hidden taps needed; the test channel code is the gate).
/// Brings its own divider so the hook in Settings is one line.
class DeveloperSettingsTile extends StatefulWidget {
  const DeveloperSettingsTile({super.key});

  @override
  State<DeveloperSettingsTile> createState() => _DeveloperSettingsTileState();
}

class _DeveloperSettingsTileState extends State<DeveloperSettingsTile> {
  @override
  void initState() {
    super.initState();
    DeveloperMode.load();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: DeveloperMode.enabled,
      builder: (context, on, _) {
        final l = AppLocalizations.of(context)!;
        final cs = Theme.of(context).colorScheme;
        final tt = Theme.of(context).textTheme;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(height: 1, indent: 16, endIndent: 16),
            ListTile(
              leading: Icon(Icons.developer_mode_rounded, color: cs.primary),
              title: Text(l.developerTitle),
              subtitle: Text(
                l.developerSubtitle,
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: cs.onSurfaceVariant.withValues(alpha: 0.5),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const DeveloperScreen()),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// The optional "Check for test builds on launch" prompt (Absorb Plus).
abstract final class TestChannelLaunchPrompt {
  /// Tests swap the check for a fake.
  @visibleForTesting
  static Future<TestChannelCheck> Function() runCheck = () =>
      TestChannelService().check();

  /// Asks to install a newer test build, once per build, when Developer
  /// mode, the test channel and its launch check are all on. Silent on any
  /// failure.
  static Future<void> showIfNewer(BuildContext context) async {
    try {
      if (!TestChannelService.isSupported) return;
      if (!await DeveloperMode.load()) return;
      if (!await DeveloperMode.isTestChannelUnlocked()) return;
      if (!await DeveloperMode.launchCheckEnabled()) return;
      final result = await runCheck();
      final build = result.build;
      if (result.status != TestChannelStatus.newer || build == null) return;
      if (await DeveloperMode.dismissedTestBuild() == build.build) return;
      if (!context.mounted) return;
      await _show(context, build, result.installedVersion ?? '');
    } catch (error) {
      debugPrint('[TestChannel] Launch check failed: $error');
    }
  }

  static Future<void> _show(
    BuildContext context,
    TestChannelBuild build,
    String installed,
  ) async {
    final l = AppLocalizations.of(context)!;
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.testBuildAvailable),
        content: Text(l.testBuildDialogContent(build.fullVersion, installed)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.later),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l.testChannelInstall),
          ),
        ],
      ),
    );
    if (go != true) {
      // Later, Back or a tap outside: don't ask again for this build.
      await DeveloperMode.setDismissedTestBuild(build.build);
      return;
    }
    if (!context.mounted) return;
    await UpdateDialog.install(
      context,
      TestChannelService.updateInfoFor(
        build,
        installedVersion: installed,
        packageLabel: l.testBuildPackageLabel(build.build),
      ),
    );
  }
}
