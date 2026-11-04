import 'dart:async';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/github_device_auth.dart';
import '../services/test_channel_service.dart';
import '../widgets/github_sign_in.dart';
import '../widgets/overlay_toast.dart';
import '../widgets/update_dialog.dart';

/// Developer mode > Test channel (Absorb Plus, Android GitHub build only):
/// the installed build, the newest test build and its notes, and Install,
/// which reuses the normal updater's download, progress and installer.
class TestChannelScreen extends StatefulWidget {
  const TestChannelScreen({super.key, this.service, this.gitHubAuth});

  /// Tests pass a service with a fake HTTP client.
  final TestChannelService? service;

  /// Tests pass a GitHub sign-in with fake HTTP.
  final GitHubDeviceAuth? gitHubAuth;

  @override
  State<TestChannelScreen> createState() => _TestChannelScreenState();
}

class _TestChannelScreenState extends State<TestChannelScreen> {
  late final TestChannelService _service =
      widget.service ?? TestChannelService();
  TestChannelCheck? _result;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _check() async {
    setState(() => _checking = true);
    await _load();
  }

  Future<void> _load() async {
    try {
      final result = await _service.check();
      if (mounted) setState(() => _result = result);
    } finally {
      if (mounted) setState(() => _checking = false);
    }
  }

  Future<void> _install(TestChannelBuild build) async {
    final l = AppLocalizations.of(context)!;
    final info = TestChannelService.updateInfoFor(
      build,
      installedVersion: _result?.installedVersion ?? '',
      packageLabel: l.testBuildPackageLabel(build.build),
      accessToken: _result?.accessToken,
    );
    await UpdateDialog.install(context, info);
  }

  Future<void> _signIn() async {
    final auth = widget.gitHubAuth ?? GitHubDeviceAuth();
    if (!auth.isConfigured) {
      final l = AppLocalizations.of(context)!;
      showOverlayToast(
        context,
        l.githubSignInNotSetUp,
        icon: Icons.info_outline_rounded,
      );
      return;
    }
    if (await showGitHubSignInDialog(context, auth: auth) && mounted) {
      await _check();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final result = _result;
    final build = result?.build;
    final status = result?.status;
    return Scaffold(
      appBar: AppBar(title: Text(l.testChannelTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            l.testChannelWarning,
            style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            color: cs.surfaceContainerHigh,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (result?.installedVersion != null)
                    Text(l.testChannelInstalled(result!.installedVersion!)),
                  const SizedBox(height: 6),
                  if (_checking && result == null)
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  else if (status == TestChannelStatus.failed)
                    Text(l.updateCheckFailed, style: TextStyle(color: cs.error))
                  else if (status == TestChannelStatus.empty)
                    Text(l.testChannelNone)
                  else if (status == TestChannelStatus.signInRequired)
                    Text(l.testChannelSignInNeeded)
                  else if (build != null) ...[
                    Text(
                      l.testChannelNewest(build.fullVersion),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    if (status == TestChannelStatus.upToDate) ...[
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            size: 18,
                            color: cs.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(l.testChannelUpToDate),
                        ],
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              if (status == TestChannelStatus.signInRequired) ...[
                FilledButton.icon(
                  onPressed: _checking ? null : _signIn,
                  icon: const Icon(Icons.login_rounded),
                  label: Text(l.githubSignIn),
                ),
                const SizedBox(width: 12),
              ],
              if (status == TestChannelStatus.newer && build != null) ...[
                FilledButton.icon(
                  onPressed: _checking ? null : () => _install(build),
                  icon: const Icon(Icons.system_update_rounded),
                  label: Text(l.testChannelInstall),
                ),
                const SizedBox(width: 12),
              ],
              TextButton.icon(
                onPressed: _checking ? null : _check,
                icon: _checking
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.refresh_rounded),
                label: Text(l.testChannelCheckNow),
              ),
            ],
          ),
          if (build != null && build.notes.trim().isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(l.testChannelNotes, style: tt.titleSmall),
            const SizedBox(height: 8),
            SelectableText(
              build.notes.trim(),
              style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ],
      ),
    );
  }
}
