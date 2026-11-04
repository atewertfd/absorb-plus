import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'login_design_parts.dart';
import 'login_form.dart';

/// Design A · Clean card: the logo and name, then one card with the server
/// address and the sign-in, and every other option under "More ways to sign
/// in".
class CardLoginDesign extends StatelessWidget {
  const CardLoginDesign({super.key, required this.form});

  final LoginForm form;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return LoginDesignBackdrop(
      child: LoginScrollBody(
        child: Column(
          key: const Key('login-design-card'),
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: LoginWaveBadge(size: 84)),
            const SizedBox(height: 20),
            const LoginWordmark(),
            const SizedBox(height: 28),
            LoginPanel(
              child: Form(
                key: form.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 14),
                      child: Text(
                        l.loginConnectToServer,
                        style: tt.titleSmall?.copyWith(
                          color: cs.onSurfaceVariant.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ...spacedLoginWidgets(form.notices(context)),
                    form.serverField(
                      context,
                      onSubmitted: () => submitLoginServer(form),
                    ),
                    LoginRecentServers(form: form),
                    form.credentialFields(context),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            LoginMoreWays(form: form),
            LoginVersionLabel(form: form),
          ],
        ),
      ),
    );
  }
}
