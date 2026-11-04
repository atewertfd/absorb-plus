import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../services/github_device_auth.dart';
import '../utils/fork_errors.dart';
import 'overlay_toast.dart';

/// Developer > Test channel: the GitHub sign-in row (Absorb Plus Test app).
/// Signed out it offers "Sign in with GitHub"; signed in it shows the login
/// and Sign out.
class GitHubSignInTile extends StatefulWidget {
  const GitHubSignInTile({super.key, this.auth, this.onChanged});

  /// Tests pass an auth with fake HTTP.
  final GitHubDeviceAuth? auth;

  /// Called after signing in or out.
  final VoidCallback? onChanged;

  @override
  State<GitHubSignInTile> createState() => _GitHubSignInTileState();
}

class _GitHubSignInTileState extends State<GitHubSignInTile> {
  late final GitHubDeviceAuth _auth = widget.auth ?? GitHubDeviceAuth();
  GitHubAuthState? _state;
  String? _login;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    final state = await _auth.state();
    final login = await _auth.login();
    if (!mounted) return;
    setState(() {
      _state = state;
      _login = login;
    });
  }

  Future<void> _signIn(AppLocalizations l) async {
    if (!_auth.isConfigured) {
      showOverlayToast(
        context,
        l.githubSignInNotSetUp,
        icon: Icons.info_outline_rounded,
      );
      return;
    }
    final ok = await showGitHubSignInDialog(context, auth: _auth);
    await _load();
    if (ok) widget.onChanged?.call();
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    await _load();
    widget.onChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final subtitleStyle = tt.bodySmall?.copyWith(color: cs.onSurfaceVariant);
    final state = _state;
    if (state == null) return const SizedBox.shrink();
    if (state == GitHubAuthState.signedIn) {
      final login = _login;
      return ListTile(
        leading: Icon(Icons.verified_user_rounded, color: cs.primary),
        title: Text(
          login == null ? l.githubSignedIn : l.githubSignedInAs(login),
        ),
        trailing: TextButton(onPressed: _signOut, child: Text(l.githubSignOut)),
      );
    }
    final expired = state == GitHubAuthState.expired;
    return ListTile(
      leading: Icon(Icons.login_rounded, color: cs.primary),
      title: Text(expired ? l.githubSignInAgain : l.githubSignIn),
      subtitle: Text(
        !_auth.isConfigured
            ? l.githubSignInNotSetUp
            : expired
            ? l.githubSignInExpired
            : l.githubSignInSubtitle,
        style: subtitleStyle,
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: cs.onSurfaceVariant.withValues(alpha: 0.5),
      ),
      onTap: () => _signIn(l),
    );
  }
}

/// Runs the GitHub device flow in a dialog. True when signed in.
Future<bool> showGitHubSignInDialog(
  BuildContext context, {
  GitHubDeviceAuth? auth,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _GitHubSignInDialog(auth: auth ?? GitHubDeviceAuth()),
  );
  return result ?? false;
}

class _GitHubSignInDialog extends StatefulWidget {
  const _GitHubSignInDialog({required this.auth});

  final GitHubDeviceAuth auth;

  @override
  State<_GitHubSignInDialog> createState() => _GitHubSignInDialogState();
}

class _GitHubSignInDialogState extends State<_GitHubSignInDialog> {
  GitHubDeviceCode? _code;
  GitHubSignInOutcome? _outcome;
  bool _cancelled = false;
  int _attempt = 0;

  @override
  void initState() {
    super.initState();
    unawaited(_run());
  }

  @override
  void dispose() {
    _cancelled = true;
    super.dispose();
  }

  Future<void> _run() async {
    final attempt = ++_attempt;
    setState(() {
      _code = null;
      _outcome = null;
    });
    GitHubSignInOutcome outcome;
    try {
      final code = await widget.auth.start();
      if (!mounted || attempt != _attempt) return;
      setState(() => _code = code);
      outcome = await widget.auth.poll(
        code,
        isCancelled: () => _cancelled || attempt != _attempt,
      );
    } catch (error) {
      debugPrint('[GitHubAuth] Sign-in start failed: ${error.runtimeType}');
      outcome = GitHubSignInOutcome.failed;
    }
    if (!mounted || attempt != _attempt) return;
    if (outcome == GitHubSignInOutcome.signedIn) {
      Navigator.of(context).pop(true);
      return;
    }
    if (outcome == GitHubSignInOutcome.cancelled) return;
    setState(() => _outcome = outcome);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final code = _code;
    final outcome = _outcome;
    final String? error = switch (outcome) {
      GitHubSignInOutcome.denied => l.githubSignInDenied,
      GitHubSignInOutcome.expired => l.githubSignInCodeExpired,
      GitHubSignInOutcome.failed => l.githubSignInFailed,
      _ => null,
    };
    return AlertDialog(
      title: Text(l.githubSignIn),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (error != null)
            Text(error, style: TextStyle(color: cs.error))
          else if (code == null)
            const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else ...[
            Text(l.githubSignInEnterCode),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SelectableText(
                    code.userCode,
                    style: tt.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: l.githubSignInCopyCode,
                  icon: const Icon(Icons.copy_rounded),
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: code.userCode));
                    if (!context.mounted) return;
                    showOverlayToast(
                      context,
                      l.githubSignInCodeCopied,
                      icon: Icons.check_rounded,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              icon: const Icon(Icons.open_in_new_rounded),
              label: Text(l.githubSignInOpen),
              onPressed: () => fireAndLog(
                launchUrl(
                  Uri.parse(code.verificationUri),
                  mode: LaunchMode.externalApplication,
                ),
                'GitHubAuth',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l.githubSignInWaiting,
              style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ],
      ),
      actions: [
        if (error != null)
          TextButton(onPressed: _run, child: Text(l.githubSignInTryAgain)),
        TextButton(
          onPressed: () {
            _cancelled = true;
            Navigator.of(context).pop(false);
          },
          child: Text(l.cancel),
        ),
      ],
    );
  }
}
