import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/auth_provider.dart';
import '../providers/library_provider.dart';
import '../services/surprise_book.dart';
import 'book_detail_sheet.dart';
import 'overlay_toast.dart';

/// Absorb Plus: "Surprise me" opens a random not-finished book from the
/// current library (Library header button and the Ctrl+K quick switcher).

/// Its icon, shared by the header button and the quick switcher row.
const surpriseMeIcon = Icons.shuffle_rounded;

bool _picking = false;

/// Picks a random not-finished book and opens its detail sheet. Toasts
/// instead when offline, in a podcast library, when everything is
/// finished, or when the server can't be reached. [picker] is for tests.
Future<void> openSurpriseBook(
  BuildContext context, {
  SurpriseBookPicker? picker,
}) async {
  if (_picking) return;
  final l = AppLocalizations.of(context)!;
  final lib = context.read<LibraryProvider>();
  final libraryId = lib.selectedLibraryId;
  if (lib.isPodcastLibrary) {
    showOverlayToast(context, l.surpriseMeBooksOnly, icon: surpriseMeIcon);
    return;
  }
  SurpriseBookPicker? p = picker;
  if (p == null) {
    final api = context.read<AuthProvider>().apiService;
    if (api == null || libraryId == null || lib.isOffline) {
      showOverlayToast(context, l.surpriseMeOffline, icon: surpriseMeIcon);
      return;
    }
    p = SurpriseBookPicker(
      fetchPage: ({required int page, required int limit, String? filter}) =>
          api.getLibraryItems(
            libraryId,
            page: page,
            limit: limit,
            filter: filter,
          ),
      isFinished: (id) => lib.getProgressData(id)?['isFinished'] == true,
    );
  }
  _picking = true;
  try {
    final result = await p.pick();
    if (!context.mounted) return;
    final item = result.item;
    switch (result.outcome) {
      case SurpriseOutcome.found when item != null:
        showBookDetailSheet(context, item['id'] as String, initialItem: item);
      case SurpriseOutcome.noneLeft:
        showOverlayToast(context, l.surpriseMeNoneLeft, icon: surpriseMeIcon);
      default:
        showOverlayToast(context, l.surpriseMeFailed, icon: surpriseMeIcon);
    }
  } finally {
    _picking = false;
  }
}

/// The Library header's "Surprise me" button. Hidden (by the caller, via
/// [availableFor]) in podcast libraries and while offline.
class SurpriseMeButton extends StatelessWidget {
  const SurpriseMeButton({super.key});

  static bool availableFor(LibraryProvider lib) =>
      !lib.isOffline && !lib.isPodcastLibrary && lib.selectedLibraryId != null;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Tooltip(
      message: l.surpriseMe,
      child: IconButton(
        icon: const Icon(surpriseMeIcon),
        onPressed: () => unawaited(openSurpriseBook(context)),
      ),
    );
  }
}
