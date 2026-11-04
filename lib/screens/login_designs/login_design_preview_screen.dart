import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../services/login_design_store.dart';
import '../login_screen.dart';
import 'login_form.dart';

/// Opens [LoginDesignPreviewScreen] on the root navigator.
Future<void> openLoginDesignPreview(BuildContext context) =>
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute<void>(builder: (_) => const LoginDesignPreviewScreen()),
    );

/// The sign-in designs side by side as swipeable pages, each the real sign-in
/// screen in preview mode (sample address, nothing signs in), with a button
/// that makes it the one the app shows.
class LoginDesignPreviewScreen extends StatefulWidget {
  const LoginDesignPreviewScreen({super.key, this.screenBuilder});

  /// Builds each page's sign-in screen; the app's [LoginScreen] when null.
  final WidgetBuilder? screenBuilder;

  @override
  State<LoginDesignPreviewScreen> createState() =>
      _LoginDesignPreviewScreenState();
}

class _LoginDesignPreviewScreenState extends State<LoginDesignPreviewScreen> {
  static const _designs = LoginDesign.values;
  late final PageController _pages = PageController(
    initialPage: _designs.indexOf(LoginDesignStore.design.value),
  );
  late int _index = _designs.indexOf(LoginDesignStore.design.value);

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  void _go(int index) {
    if (index < 0 || index >= _designs.length) return;
    _pages.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final ml = MaterialLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final design = _designs[_index];
    return Scaffold(
      // Each page is a sign-in Scaffold that makes room for the keyboard.
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(l.loginDesignPreviewTitle)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
            child: Row(
              children: [
                IconButton(
                  key: const Key('login-preview-previous'),
                  tooltip: ml.previousPageTooltip,
                  onPressed: _index > 0 ? () => _go(_index - 1) : null,
                  icon: const Icon(Icons.chevron_left_rounded),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        design.label(l),
                        key: const Key('login-preview-label'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: tt.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${_index + 1} / ${_designs.length}',
                        style: tt.labelSmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<LoginDesign>(
                  valueListenable: LoginDesignStore.design,
                  builder: (context, chosen, _) => chosen == design
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle_rounded,
                                size: 18,
                                color: cs.primary,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                l.loginDesignInUse,
                                key: const Key('login-preview-in-use'),
                                style: tt.labelLarge?.copyWith(
                                  color: cs.primary,
                                ),
                              ),
                            ],
                          ),
                        )
                      : FilledButton.tonal(
                          key: const Key('login-preview-use'),
                          onPressed: () =>
                              unawaited(LoginDesignStore.set(design)),
                          child: Text(l.loginDesignUse),
                        ),
                ),
                IconButton(
                  key: const Key('login-preview-next'),
                  tooltip: ml.nextPageTooltip,
                  onPressed: _index < _designs.length - 1
                      ? () => _go(_index + 1)
                      : null,
                  icon: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: PageView(
              controller: _pages,
              onPageChanged: (i) => setState(() => _index = i),
              children: [
                for (final d in _designs)
                  LoginPreviewScope(
                    child: LoginDesignScope(
                      design: d,
                      child: Builder(
                        key: ValueKey('login-preview-${d.id}'),
                        builder:
                            widget.screenBuilder ?? (_) => const LoginScreen(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Settings > Appearance: the chosen sign-in design; opens the preview.
class LoginDesignSettingsTile extends StatelessWidget {
  const LoginDesignSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return InkWell(
      key: const Key('login-design-settings-tile'),
      onTap: () => unawaited(openLoginDesignPreview(context)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.loginDesignTitle, style: tt.titleSmall),
                  const SizedBox(height: 2),
                  ValueListenableBuilder<LoginDesign>(
                    valueListenable: LoginDesignStore.design,
                    builder: (context, design, _) => Text(
                      design == LoginDesign.classic
                          ? l.loginDesignClassicName
                          : design.label(l),
                      style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: cs.onSurfaceVariant.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
