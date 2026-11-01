import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../l10n/app_localizations.dart';
import '../services/api_service.dart';
import '../services/book_copy_download.dart';
import 'overlay_toast.dart';
import 'wavy_progress_indicator.dart';

/// Absorb Plus: "Save a copy…" in the book detail sheet's overflow menu
/// (desktop, audit C8). Picks a destination, then downloads the item with a
/// progress dialog styled like the update download, which can cancel it.
abstract final class SaveBookCopy {
  @visibleForTesting
  static Future<String?> Function(String dialogTitle, String fileName)
      pickSavePath = _pickSavePath;

  @visibleForTesting
  static http.Client Function() clientFactory = http.Client.new;

  static Future<String?> _pickSavePath(String dialogTitle, String fileName) =>
      FilePicker.platform.saveFile(
        dialogTitle: dialogTitle,
        fileName: fileName,
        lockParentWindow: true,
      );

  static String _size(int bytes) =>
      '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';

  static Future<void> run(
    BuildContext context, {
    required ApiService api,
    required String itemId,
    required String title,
    Map<String, dynamic>? item,
  }) async {
    final l = AppLocalizations.of(context)!;
    final path = await pickSavePath(
        l.bookCopyDialogTitle, BookCopyDownload.suggestedFileName(title, item));
    if (path == null || !context.mounted) return;

    // Renew the token first so the URL carries a current one.
    final headers = await api.renewedMediaHeaders();
    final url = Uri.parse(api.buildItemDownloadUrl(itemId));
    if (!context.mounted) return;

    final download = BookCopyDownload(clientFactory());
    final progress = ValueNotifier<(int, int?)>((0, null));
    final navigator = Navigator.of(context, rootNavigator: true);
    var dialogOpen = true;
    unawaited(showDialog<void>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text(l.bookCopySaving),
        content: ValueListenableBuilder<(int, int?)>(
          valueListenable: progress,
          builder: (_, p, __) {
            final total = p.$2;
            final fraction =
                total != null && total > 0 ? p.$1 / total : null;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WavyProgressIndicator(value: fraction),
                const SizedBox(height: 12),
                Text(
                  fraction != null
                      ? '${(fraction * 100).toStringAsFixed(0)}%'
                      : _size(p.$1),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              download.cancel();
              Navigator.pop(ctx);
            },
            child: Text(l.cancel),
          ),
        ],
      ),
    ).whenComplete(() => dialogOpen = false));

    String? savedPath;
    var failed = false;
    try {
      final file = await download.run(
          url, headers, path, (r, t) => progress.value = (r, t));
      savedPath = file.path;
    } on BookCopyCancelled {
      // Nothing to report; the partial file is gone.
    } on BookCopyFailed catch (e) {
      debugPrint('[BookCopy] Failed: ${e.reason}');
      failed = true;
    }
    if (dialogOpen && navigator.mounted) navigator.pop();
    progress.dispose();
    if (!context.mounted) return;
    if (savedPath != null) {
      showOverlayToast(context, l.bookCopySaved(savedPath),
          icon: Icons.download_done_rounded);
    } else if (failed) {
      showOverlayToast(context, l.bookCopyFailed,
          icon: Icons.error_outline_rounded);
    }
  }
}
