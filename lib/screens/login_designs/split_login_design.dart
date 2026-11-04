import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../main.dart' show flatNotifier;
import '../../ui_themes/ui_theme_hooks.dart';
import 'login_design_parts.dart';
import 'login_form.dart';

/// Design C · Split: on wide windows (desktop, tablets, phones held
/// sideways) a hero panel fills the left half and the form the right; on
/// phones a compact hero header sits above the form.
class SplitLoginDesign extends StatelessWidget {
  const SplitLoginDesign({super.key, required this.form});

  final LoginForm form;

  /// Whether a window this size gets the side-by-side layout.
  static bool isWide(Size size) =>
      size.width >= 840 || (size.width >= 560 && size.width > size.height);

  @override
  Widget build(BuildContext context) {
    return LoginDesignBackdrop(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = isWide(constraints.biggest);
          if (!wide) {
            return LoginScrollBody(
              key: const Key('login-design-split-narrow'),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _Hero(compact: true),
                  const SizedBox(height: 20),
                  _FormSide(form: form),
                ],
              ),
            );
          }
          return Row(
            key: const Key('login-design-split-wide'),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: _Hero(compact: false),
                ),
              ),
              Expanded(
                child: LoginScrollBody(
                  maxWidth: 440,
                  child: _FormSide(form: form),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// The logo, name and tagline on a soft gradient of the theme's accent.
class _Hero extends StatelessWidget {
  const _Hero({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final radius = BorderRadius.circular(
      lookRadius(context, compact ? 20 : 28),
    );
    final decoration = BoxDecoration(
      borderRadius: radius,
      color: flatNotifier.value
          ? cs.primaryContainer.withValues(alpha: 0.35)
          : null,
      gradient: flatNotifier.value
          ? null
          : LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: lookBackdrop(context, [
                cs.primary.withValues(alpha: 0.35),
                cs.primaryContainer.withValues(alpha: 0.45),
                cs.surfaceContainerHighest.withValues(alpha: 0.4),
              ]),
            ),
      border: Border.fromBorderSide(
        lookPanelSide(
          context,
          BorderSide(color: cs.outlineVariant.withValues(alpha: 0.15)),
        ),
      ),
    );
    if (compact) {
      return Container(
        key: const Key('login-split-hero'),
        decoration: decoration,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: const Row(
          children: [
            LoginWaveBadge(size: 56),
            SizedBox(width: 16),
            Expanded(child: LoginWordmark(compact: true)),
          ],
        ),
      );
    }
    return Container(
      key: const Key('login-split-hero'),
      decoration: decoration,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox(
            width: 360,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LoginWaveBadge(size: 120),
                const SizedBox(height: 32),
                const LoginWordmark(),
                const SizedBox(height: 16),
                Text(
                  l.loginSplitPitch,
                  textAlign: TextAlign.center,
                  style: tt.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant.withValues(alpha: 0.8),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormSide extends StatelessWidget {
  const _FormSide({required this.form});

  final LoginForm form;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Column(
      key: const Key('login-design-split'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: form.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 16),
                child: Text(
                  l.loginConnectToServer,
                  style: tt.titleLarge?.copyWith(
                    color: cs.onSurface,
                    fontWeight: FontWeight.w600,
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
        const SizedBox(height: 20),
        LoginMoreWays(form: form),
        LoginVersionLabel(form: form),
      ],
    );
  }
}
