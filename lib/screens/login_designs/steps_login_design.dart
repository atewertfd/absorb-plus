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

class _StepsLoginDesignState extends State<StepsLoginDesign>
    with LoginStepsFlow<StepsLoginDesign> {
  @override
  LoginForm get form => widget.form;

  @override
  Widget build(BuildContext context) {
    return LoginDesignBackdrop(
      child: LoginScrollBody(
        maxWidth: 520,
        child: Form(key: form.formKey, child: buildStepPage()),
      ),
    );
  }
}

/// The two-step flow's state, shared by the B designs: which page shows,
/// and going on to the sign-in once the address checks out.
mixin LoginStepsFlow<T extends StatefulWidget> on State<T> {
  LoginForm get form;

  /// The sign-in page shows (else the server address page).
  bool signInPage = false;

  /// The address is being checked after Continue.
  bool checking = false;

  /// Checks the address if needed, then shows the sign-in page with the
  /// username focused.
  Future<void> continueToSignIn() async {
    if (checking) return;
    if (!form.serverValid) {
      setState(() => checking = true);
      await form.checkServer();
      if (!mounted) return;
      setState(() => checking = false);
      if (!form.serverValid) return;
    }
    setState(() => signInPage = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && signInPage) form.usernameFocus.requestFocus();
    });
  }

  /// Back to the address page (not while signing in).
  void backToServer() {
    if (form.busy || !signInPage) return;
    setState(() => signInPage = false);
  }

  /// The current page, as design B lays it out.
  Widget buildStepPage({
    bool showBadge = true,
    FocusNode? serverFocus,
    double buttonHeight = 52,
  }) => signInPage
      ? LoginStepsSignInPage(form: form, onBack: backToServer)
      : LoginStepsServerPage(
          form: form,
          checking: checking,
          onContinue: () => unawaited(continueToSignIn()),
          showBadge: showBadge,
          serverFocus: serverFocus,
          buttonHeight: buttonHeight,
        );
}

/// A step's heading and one-line intro.
class LoginStepTitle extends StatelessWidget {
  const LoginStepTitle({super.key, required this.title, required this.intro});

  final String title;
  final String intro;

  @override
  Widget build(BuildContext context) {
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
}

/// Step 1: "Where is your library?", the address and Continue.
class LoginStepsServerPage extends StatelessWidget {
  const LoginStepsServerPage({
    super.key,
    required this.form,
    required this.checking,
    required this.onContinue,
    this.showBadge = true,
    this.serverFocus,
    this.buttonHeight = 52,
  });

  final LoginForm form;
  final bool checking;
  final VoidCallback onContinue;
  final bool showBadge;
  final FocusNode? serverFocus;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final canContinue =
        form.server.text.trim().isNotEmpty && !form.busy && !checking;
    return Column(
      key: const Key('login-design-steps-server'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showBadge) ...[
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: LoginWaveBadge(size: 56),
          ),
          const SizedBox(height: 16),
        ],
        LoginStepTitle(
          title: l.loginWhereIsLibrary,
          intro: l.loginWhereIsLibraryIntro,
        ),
        ...spacedLoginWidgets(form.notices(context)),
        form.serverField(
          context,
          onSubmitted: onContinue,
          focusNode: serverFocus,
        ),
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
          height: buttonHeight,
          child: FilledButton(
            key: const Key('login-steps-continue'),
            onPressed: canContinue ? onContinue : null,
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: checking
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
}

/// Step 2: "Sign in to <server>", the credentials and saved accounts.
class LoginStepsSignInPage extends StatelessWidget {
  const LoginStepsSignInPage({
    super.key,
    required this.form,
    required this.onBack,
  });

  final LoginForm form;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
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
            onPressed: form.busy ? null : onBack,
            icon: const Icon(Icons.arrow_back_rounded, size: 18),
            label: Text(l.loginChangeServer),
          ),
        ),
        const SizedBox(height: 8),
        LoginStepTitle(
          title: l.loginSignInToNamed(form.serverHost),
          intro: l.loginSignInToNamedIntro,
        ),
        form.credentialFields(context),
        const SizedBox(height: 16),
        form.savedAccounts(context),
      ],
    );
  }
}
