// Absorb Plus: a playlist or collection reorder is saved after its sheet has
// closed, so a failed save used to vanish and the old order quietly came back
// on the next refresh. This reports it on the app's root navigator instead.
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../main.dart' show rootNavigatorKey;
import 'overlay_toast.dart';

/// Shows "Couldn't save the new order" when [saved] is false. [navigator]
/// defaults to the app's root navigator; tests pass their own.
void reportListOrderSave(bool saved, {NavigatorState? navigator}) {
  if (saved) return;
  final nav = navigator ?? rootNavigatorKey.currentState;
  if (nav == null || !nav.mounted) return;
  final l = AppLocalizations.of(nav.context);
  showNavigatorOverlayToast(
    nav,
    l?.libReorderFailed ?? "Couldn't save the new order",
    icon: Icons.error_outline_rounded,
  );
}
