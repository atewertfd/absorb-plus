import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../services/tailscale_service.dart';
import 'login_design_parts.dart';
import 'login_form.dart';

/// Design B · Two steps: "Where is your library?" (the server address), then
/// "Sign in to <server>" (username and password, or SSO). One action per
/// page, in the first-run setup's style.
class StepsLoginDesign extends StatefulWidget {
  const StepsLoginDesign({super.key, required this.form});

  final LoginForm form;

  @override
  State<StepsLoginDesign> createState() => _StepsLoginDesignState();
}

class _StepsLoginDesignState extends State<StepsLoginDesign> {
  bool _signInPage = false;
  bool _checking = false;

  LoginForm get form => widget.form;

  Future<void> _continue() async {
    if (_checking) return;
    if (!form.serverValid) {
      setState(() => _checking = true);
      await form.checkServer();
      if (!mounted) return;
      setState(() => _checking = false);
      if (!form.serverValid) return;
    }
    setState(() => _signInPage = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _signInPage) form.usernameFocus.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginDesignBackdrop(
      child: LoginScrollBody(
        maxWidth: 520,
        child: Form(
          key: form.formKey,
          child: _signInPage ? _signIn(context) : _server(context),
        ),
      ),
    );
  }

  Widget _title(BuildContext context, String title, String intro) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            intro,
            style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _server(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final canContinue =
        form.server.text.trim().isNotEmpty && !form.busy && !_checking;
    return Column(
      key: const Key('login-design-steps-server'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Align(
          alignment: AlignmentDirectional.centerStart,
          child: LoginWaveBadge(size: 56),
        ),
        const SizedBox(height: 16),
        _title(context, l.loginWhereIsLibrary, l.loginWhereIsLibraryIntro),
        ...spacedLoginWidgets(form.notices(context)),
        form.serverField(context, onSubmitted: () => unawaited(_continue())),
        LoginRecentServers(form: form),
        if (TailscaleService.platformSupported) ...[
          const SizedBox(height: 12),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: OutlinedButton.icon(
              key: const Key('login-steps-tailscale'),
              onPressed: () => unawaited(openLoginTailscale(context)),
              icon: const Icon(Icons.vpn_lock_rounded, size: 18),
              label: Text(l.tailscaleChip),
            ),
          ),
        ],
        const SizedBox(height: 24),
        SizedBox(
          height: 52,
          child: FilledButton(
            key: const Key('login-steps-continue'),
            onPressed: canContinue ? () => unawaited(_continue()) : null,
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: _checking
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2.5),
                  )
                : Text(
                    l.loginContinue,
                    style: TextStyle(
                      fontSize: Theme.of(
                        context,
                      ).textTheme.titleMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 16),
        LoginMoreWays(form: form, showTailscale: false),
        LoginVersionLabel(form: form),
      ],
    );
  }

  Widget _signIn(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Column(
      key: const Key('login-design-steps-sign-in'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: TextButton.icon(
            key: const Key('login-steps-back'),
            onPressed: form.busy
                ? null
                : () => setState(() => _signInPage = false),
            icon: const Icon(Icons.arrow_back_rounded, size: 18),
            label: Text(l.loginChangeServer),
          ),
        ),
        const SizedBox(height: 8),
        _title(
          context,
          l.loginSignInToNamed(form.serverHost),
          l.loginSignInToNamedIntro,
        ),
        form.credentialFields(context),
        const SizedBox(height: 16),
        form.savedAccounts(context),
      ],
    );
  }
}
