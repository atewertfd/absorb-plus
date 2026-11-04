import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../main.dart' show flatNotifier, gradientIntensityNotifier;
import '../../providers/auth_provider.dart';
import '../../ui_themes/app_backdrop.dart';
import '../../ui_themes/ui_theme_hooks.dart';
import '../login_screen.dart';
import 'setup_flow_store.dart';
import 'setup_pages.dart';
import 'setup_settings.dart';

/// Absorb Plus: the first-run setup, one full-screen flow in place of the
/// separate welcome, look, permission and notice prompts. Shown by
/// [AuthGate] on a fresh install (before sign-in) and from Settings >
/// Issues & Support > Run setup again. Every choice is saved as it is made,
/// with the same setters Settings uses.
class SetupFlowScreen extends StatefulWidget {
  const SetupFlowScreen({
    super.key,
    this.onFinished,
    this.steps,
    this.settings = const SetupSettings(),
    this.complete = SetupFlowStore.complete,
    this.connectBuilder,
  });

  /// Runs after Done saved that the setup is finished.
  final VoidCallback? onFinished;

  /// The pages; [currentSetupSteps] when null.
  final List<SetupStep>? steps;

  final SetupSettings settings;

  /// Marks the setup finished (tests inject a fake).
  final Future<void> Function() complete;

  /// The sign-in shown on the Connect page; the app's [LoginScreen] when
  /// null (tests pass a stand-in).
  final WidgetBuilder? connectBuilder;

  @override
  State<SetupFlowScreen> createState() => SetupFlowScreenState();
}

@visibleForTesting
class SetupFlowScreenState extends State<SetupFlowScreen> {
  late final List<SetupStep> _steps = widget.steps ?? currentSetupSteps();
  int _index = 0;
  bool? _wasSignedIn;
  bool _finishing = false;

  SetupStep get step => _steps[_index];

  /// Kept from the last build (provider's read isn't allowed in build).
  bool _signedInNow = false;

  bool get _canGoNext => step != SetupStep.connect || _signedInNow;

  void _next() {
    if (!mounted || _finishing) return;
    if (step == SetupStep.done) {
      unawaited(_finish());
      return;
    }
    if (!_canGoNext) return;
    setState(() => _index++);
  }

  void _back() {
    if (!mounted || _index == 0) return;
    setState(() => _index--);
  }

  Future<void> _finish() async {
    setState(() => _finishing = true);
    try {
      await widget.complete();
    } catch (e) {
      debugPrint('[Setup] Saving the finished setup failed: $e');
    }
    if (!mounted) return;
    setState(() => _finishing = false);
    widget.onFinished?.call();
  }

  /// Signing in on the Connect page moves on by itself.
  void _followSignIn(bool signedIn) {
    final was = _wasSignedIn;
    _wasSignedIn = signedIn;
    if (was == false && signedIn && step == SetupStep.connect) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _next());
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final signedIn = context.watch<AuthProvider>().isAuthenticated;
    _signedInNow = signedIn;
    _followSignIn(signedIn);
    final showLogin = step == SetupStep.connect && !signedIn;

    final Widget body = showLogin
        ? (widget.connectBuilder?.call(context) ?? const LoginScreen())
        : _scrollingPage(context);

    return PopScope(
      canPop: _index == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back();
      },
      child: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.arrowLeft, alt: true): _back,
          const SingleActivator(LogicalKeyboardKey.arrowRight, alt: true):
              _next,
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            // The sign-in page is a Scaffold of its own that makes room for
            // the keyboard; doing it here too would do it twice.
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: flatNotifier.value || AppBackdrop.isActive(context)
                  ? null
                  : BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 0.35, 1.0],
                        colors: lookBackdrop(context, [
                          cs.primary.withValues(
                            alpha: lookGlow(
                              context,
                              gradientIntensityNotifier.value,
                            ),
                          ),
                          Theme.of(context).scaffoldBackgroundColor,
                          Theme.of(context).scaffoldBackgroundColor,
                        ]),
                      ),
                    ),
              child: SafeArea(
                child: Column(
                  children: [
                    _header(context, l),
                    Expanded(
                      child: KeyedSubtree(
                        key: ValueKey('setup-page-${step.name}'),
                        child: body,
                      ),
                    ),
                    _footer(context, l),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _scrollingPage(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: _page(context),
      ),
    ),
  );

  Widget _page(BuildContext context) => switch (step) {
    SetupStep.welcome => const SetupWelcomePage(),
    SetupStep.connect => const SetupConnectedPage(),
    SetupStep.look => const SetupLookPage(),
    SetupStep.listening => SetupListeningPage(settings: widget.settings),
    SetupStep.downloads => SetupDownloadsPage(settings: widget.settings),
    SetupStep.permissions => SetupPermissionsPage(settings: widget.settings),
    SetupStep.done => SetupDonePage(settings: widget.settings),
  };

  Widget _header(BuildContext context, AppLocalizations l) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final optional = kOptionalSetupSteps.contains(step);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 8, 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l.setupStepOf(_index + 1, _steps.length),
                  key: const ValueKey('setup-step-label'),
                  style: tt.labelMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
                const SizedBox(height: 6),
                ExcludeSemantics(
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (var i = 0; i < _steps.length; i++)
                        Container(
                          width: i == _index ? 18 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: i <= _index
                                ? cs.primary
                                : cs.onSurface.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Kept in the layout when hidden, so the header doesn't jump.
          Visibility(
            visible: optional,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: TextButton(
              key: const ValueKey('setup-skip'),
              onPressed: optional ? _next : null,
              child: Text(l.setupSkip),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context, AppLocalizations l) {
    final last = step == SetupStep.done;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Row(
        children: [
          if (_index > 0)
            Flexible(
              child: TextButton.icon(
                key: const ValueKey('setup-back'),
                onPressed: _back,
                icon: const Icon(Icons.arrow_back_rounded, size: 18),
                label: Text(l.setupBack),
              ),
            ),
          const Spacer(),
          Flexible(
            flex: 2,
            child: FilledButton(
              key: const ValueKey('setup-next'),
              onPressed: _canGoNext && !_finishing ? _next : null,
              child: Text(
                last
                    ? l.setupDoneStart
                    : _index == 0
                    ? l.getStarted
                    : l.setupNext,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
