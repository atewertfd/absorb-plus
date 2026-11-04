import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n/app_localizations.dart';
import 'login_design_parts.dart';
import 'login_form.dart';
import 'login_glass_parts.dart';
import 'split_login_design.dart' show LoginHero, SplitLoginDesign;
import 'steps_login_design.dart';

// Design B's two steps in three more settings: on glass (B2), in a wide
// glass panel with a step list (B3) and beside C's hero (B4). All of them go
// through B's [LoginStepsFlow] and the screen's own [LoginForm].

/// Esc and Alt+Left go back to the address while the sign-in page shows.
Widget _stepShortcuts(LoginStepsFlow flow, Widget child) => CallbackShortcuts(
  bindings: flow.signInPage
      ? {
          const SingleActivator(LogicalKeyboardKey.escape): flow.backToServer,
          const SingleActivator(LogicalKeyboardKey.arrowLeft, alt: true):
              flow.backToServer,
        }
      : const {},
  child: child,
);

/// The two steps on a centred glass panel; B2, and B3 on phones.
Widget _glassSteps(LoginStepsFlow flow, {required Key key}) => LayoutBuilder(
  builder: (context, constraints) {
    final narrow = constraints.maxWidth < 420;
    return LoginScrollBody(
      key: key,
      maxWidth: 560,
      padding: EdgeInsets.symmetric(
        horizontal: narrow ? 12 : 24,
        vertical: narrow ? 16 : 32,
      ),
      child: LoginGlassPanel(
        padding: EdgeInsets.all(narrow ? 16 : 28),
        child: Form(key: flow.form.formKey, child: flow.buildStepPage()),
      ),
    );
  },
);

/// Design B2 · Glass steps: B's two steps on a see-through frosted panel
/// over recent covers (blurred) or a soft gradient of the accent colour.
class GlassStepsLoginDesign extends StatefulWidget {
  const GlassStepsLoginDesign({super.key, required this.form});

  final LoginForm form;

  @override
  State<GlassStepsLoginDesign> createState() => _GlassStepsLoginDesignState();
}

class _GlassStepsLoginDesignState extends State<GlassStepsLoginDesign>
    with LoginStepsFlow<GlassStepsLoginDesign> {
  @override
  LoginForm get form => widget.form;

  @override
  Widget build(BuildContext context) => LoginGlassBackdrop(
    child: _stepShortcuts(
      this,
      _glassSteps(this, key: const Key('login-design-steps-glass')),
    ),
  );
}

/// Design B3 · Desktop steps: on wide windows a ~880 px glass panel with a
/// step list on the left and big fields on the right, the address focused
/// first, Enter to continue and Esc or Alt+Left to go back. B2 on phones.
class DesktopStepsLoginDesign extends StatefulWidget {
  const DesktopStepsLoginDesign({super.key, required this.form});

  final LoginForm form;

  /// Whether a window this size gets the wide panel.
  static bool isWide(Size size) => size.width >= 840 && size.height >= 480;

  @override
  State<DesktopStepsLoginDesign> createState() =>
      _DesktopStepsLoginDesignState();
}

class _DesktopStepsLoginDesignState extends State<DesktopStepsLoginDesign>
    with LoginStepsFlow<DesktopStepsLoginDesign> {
  static const _railWidth = 260.0;

  final _serverFocus = FocusNode(debugLabel: 'login-server');
  bool _focusedFirst = false;

  @override
  LoginForm get form => widget.form;

  @override
  void dispose() {
    _serverFocus.dispose();
    super.dispose();
  }

  @override
  void backToServer() {
    final wasSignIn = signInPage;
    super.backToServer();
    if (wasSignIn && !signInPage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !signInPage) _serverFocus.requestFocus();
      });
    }
  }

  /// Focuses the address once, when the wide layout first shows.
  void _focusFirstField() {
    if (_focusedFirst) return;
    _focusedFirst = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !signInPage) _serverFocus.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginGlassBackdrop(
      child: _stepShortcuts(
        this,
        LayoutBuilder(
          builder: (context, constraints) {
            if (!DesktopStepsLoginDesign.isWide(constraints.biggest)) {
              return _glassSteps(
                this,
                key: const Key('login-design-steps-desktop-narrow'),
              );
            }
            _focusFirstField();
            return LoginScrollBody(
              key: const Key('login-design-steps-desktop-wide'),
              maxWidth: 880,
              padding: const EdgeInsets.all(32),
              child: LoginGlassPanel(
                padding: EdgeInsets.zero,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      width: _railWidth,
                      child: _railBackground(context),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: _railWidth, child: _rail(context)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 32, 40, 28),
                            child: _BigFields(
                              child: Form(
                                key: form.formKey,
                                child: buildStepPage(
                                  showBadge: false,
                                  serverFocus: _serverFocus,
                                  buttonHeight: 56,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _railBackground(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: cs.primary.withValues(alpha: 0.06),
        border: Border(
          right: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.25)),
        ),
      ),
    );
  }

  Widget _rail(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 28),
      child: Column(
        key: const Key('login-steps-rail'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(child: LoginWaveBadge(size: 64)),
          const SizedBox(height: 16),
          const LoginWordmark(compact: true),
          const SizedBox(height: 32),
          _StepItem(
            key: const Key('login-steps-rail-1'),
            number: 1,
            label: l.loginStepLibrary,
            active: !signInPage,
            done: signInPage,
            onTap: signInPage && !form.busy ? backToServer : null,
          ),
          const SizedBox(height: 6),
          _StepItem(
            key: const Key('login-steps-rail-2'),
            number: 2,
            label: l.loginStepSignIn,
            active: signInPage,
            done: false,
            onTap:
                !signInPage && form.server.text.trim().isNotEmpty && !checking
                ? () => unawaited(continueToSignIn())
                : null,
          ),
          const SizedBox(height: 28),
          Text(
            l.loginStepsKeyboardHint,
            textAlign: TextAlign.center,
            style: tt.labelSmall?.copyWith(
              color: cs.onSurfaceVariant.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

/// One row of B3's step list: the number (a tick once done) and its name,
/// highlighted while it is the current step.
class _StepItem extends StatelessWidget {
  const _StepItem({
    super.key,
    required this.number,
    required this.label,
    required this.active,
    required this.done,
    this.onTap,
  });

  final int number;
  final String label;
  final bool active;
  final bool done;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final radius = BorderRadius.circular(14);
    final circle = Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active
            ? cs.primary
            : done
            ? cs.primary.withValues(alpha: 0.18)
            : null,
        border: active || done
            ? null
            : Border.all(color: cs.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: done
          ? Icon(Icons.check_rounded, size: 18, color: cs.primary)
          : Text(
              '$number',
              style: tt.labelLarge?.copyWith(
                color: active ? cs.onPrimary : cs.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
    );
    return Semantics(
      selected: active,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: radius,
              color: active ? cs.primary.withValues(alpha: 0.14) : null,
            ),
            child: Row(
              children: [
                circle,
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: tt.titleSmall?.copyWith(
                      color: active ? cs.onSurface : cs.onSurfaceVariant,
                      fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                    ),
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

/// Bigger field text for B3's desktop layout.
class _BigFields extends StatelessWidget {
  const _BigFields({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tt = theme.textTheme;
    return Theme(
      data: theme.copyWith(
        textTheme: tt.copyWith(
          bodyLarge: tt.bodyLarge?.copyWith(fontSize: 18),
          titleMedium: tt.titleMedium?.copyWith(fontSize: 18),
        ),
      ),
      child: child,
    );
  }
}

/// Design B4 · Hero steps: C's hero panel on the left of wide windows with
/// B's two steps on the right; on phones a compact hero header above them.
class HeroStepsLoginDesign extends StatefulWidget {
  const HeroStepsLoginDesign({super.key, required this.form});

  final LoginForm form;

  @override
  State<HeroStepsLoginDesign> createState() => _HeroStepsLoginDesignState();
}

class _HeroStepsLoginDesignState extends State<HeroStepsLoginDesign>
    with LoginStepsFlow<HeroStepsLoginDesign> {
  @override
  LoginForm get form => widget.form;

  @override
  Widget build(BuildContext context) {
    return LoginDesignBackdrop(
      child: _stepShortcuts(
        this,
        LayoutBuilder(
          builder: (context, constraints) {
            final steps = Form(
              key: form.formKey,
              child: buildStepPage(showBadge: false),
            );
            if (!SplitLoginDesign.isWide(constraints.biggest)) {
              return LoginScrollBody(
                key: const Key('login-design-hero-narrow'),
                maxWidth: 520,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const LoginHero(compact: true),
                    const SizedBox(height: 20),
                    steps,
                  ],
                ),
              );
            }
            return Row(
              key: const Key('login-design-hero-wide'),
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: LoginHero(compact: false),
                  ),
                ),
                Expanded(child: LoginScrollBody(maxWidth: 440, child: steps)),
              ],
            );
          },
        ),
      ),
    );
  }
}
