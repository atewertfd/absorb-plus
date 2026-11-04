import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../main.dart' show applyFlatBackground, einkModeNotifier, flatNotifier;
import '../services/player_settings.dart';
import 'app_backdrop.dart';

/// Settings > Appearance > Background: Soft glow, Book colors, Gradient or
/// Plain. Plain is the Flat background switch (picking it turns that on,
/// picking anything else turns it off), so both controls always agree.
/// Disabled in e-ink mode, which is always plain.
class AppBackgroundTile extends StatelessWidget {
  const AppBackgroundTile({
    super.key,
    required this.flat,
    required this.onFlatChanged,
    this.enabled = true,
  });

  /// The screen's Flat background value.
  final bool flat;

  /// Tells the screen its Flat background switch changed.
  final ValueChanged<bool> onFlatChanged;

  final bool enabled;

  Future<void> _pick(AppBackground picked) async {
    final wantFlat = picked == AppBackground.plain;
    if (wantFlat != flat) {
      onFlatChanged(wantFlat);
      applyFlatBackground(wantFlat);
      await PlayerSettings.setFlatBackground(wantFlat);
    }
    await AppBackgroundStore.choose(picked);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return ListenableBuilder(
      listenable: Listenable.merge([
        appBackgroundNotifier,
        flatNotifier,
        einkModeNotifier,
      ]),
      builder: (context, _) {
        final eink = einkModeNotifier.value;
        final current = currentAppBackground(context);
        Widget label(String text) =>
            FittedBox(fit: BoxFit.scaleDown, child: Text(text, maxLines: 1));
        return Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l.appBackgroundLabel, style: tt.bodyLarge),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: SegmentedButton<AppBackground>(
                  showSelectedIcon: false,
                  segments: [
                    ButtonSegment(
                      value: AppBackground.glow,
                      label: label(l.appBackgroundGlow),
                    ),
                    ButtonSegment(
                      value: AppBackground.cover,
                      label: label(l.appBackgroundCover),
                    ),
                    ButtonSegment(
                      value: AppBackground.gradient,
                      label: label(l.appBackgroundGradient),
                    ),
                    ButtonSegment(
                      value: AppBackground.plain,
                      label: label(l.appBackgroundPlain),
                    ),
                  ],
                  selected: {current},
                  onSelectionChanged: enabled && !eink
                      ? (selected) => _pick(selected.first)
                      : null,
                  style: const ButtonStyle(
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
              if (current == AppBackground.cover) ...[
                const SizedBox(height: 6),
                Text(
                  l.appBackgroundCoverHint,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
