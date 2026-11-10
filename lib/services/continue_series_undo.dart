import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../widgets/overlay_toast.dart';

/// Puts a series the user just hid back on Continue Series. Only reports
/// success when the server answered 200 ([readd] returns true); then the
/// local hide is lifted and Home refreshed.
Future<bool> undoHideSeriesFromContinue({
  required String seriesId,
  required Future<bool> Function(String seriesId) readd,
  required void Function(String seriesId) unhide,
  required Future<void> Function() refresh,
}) async {
  final ok = await readd(seriesId);
  if (!ok) return false;
  unhide(seriesId);
  await refresh();
  return true;
}

/// The "Removed from Continue Series" toast with a tap-to-undo offer. The
/// undo outlives the book sheet, so its result toast goes through the root
/// navigator rather than the sheet's context.
void showHiddenSeriesUndoToast(
  BuildContext context, {
  required String seriesId,
  required Future<bool> Function(String seriesId) readd,
  required void Function(String seriesId) unhide,
  required Future<void> Function() refresh,
}) {
  final l = AppLocalizations.of(context)!;
  final navigator = Navigator.maybeOf(context, rootNavigator: true);
  showOverlayToast(context, l.removedSeriesTapToUndo,
      icon: Icons.bookmark_remove_rounded, onTap: () async {
    final ok = await undoHideSeriesFromContinue(
        seriesId: seriesId, readd: readd, unhide: unhide, refresh: refresh);
    if (navigator == null || !navigator.mounted) return;
    showNavigatorOverlayToast(
        navigator, ok ? l.seriesBackOnContinueSeries : l.couldNotUpdate,
        icon: ok ? Icons.bookmark_added_rounded : Icons.error_outline_rounded);
  });
}
