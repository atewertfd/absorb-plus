import 'dart:convert';
import 'dart:io' show File;
import 'dart:ui' show Rect;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/fork_platform.dart';
import '../utils/text_file_download.dart';
import 'api_service.dart';

enum OpmlExportStatus { saved, shared, downloaded, cancelled, failed }

/// Absorb Plus: "Export OPML" for a podcast library (audit C7).
///
/// Desktop saves through a save dialog, web downloads through the browser,
/// Android hands the file to the share sheet (as the server log export does).
abstract final class OpmlExport {
  @visibleForTesting
  static Future<String?> Function(String dialogTitle, String fileName)
      pickSavePath = _pickSavePath;

  @visibleForTesting
  static Future<void> Function(String path, String content) writeFile =
      (path, content) => File(path).writeAsString(content);

  @visibleForTesting
  static Future<void> Function(String fileName, String content) webDownload =
      (fileName, content) =>
          downloadTextFile(fileName: fileName, content: content);

  @visibleForTesting
  static Future<void> Function(XFile file, Rect? origin) share =
      (file, origin) =>
          Share.shareXFiles([file], sharePositionOrigin: origin);

  static Future<String?> _pickSavePath(String dialogTitle, String fileName) =>
      FilePicker.platform.saveFile(
        dialogTitle: dialogTitle,
        fileName: fileName,
        type: FileType.custom,
        allowedExtensions: const ['opml'],
        lockParentWindow: true,
      );

  /// A file name made from the library's name.
  static String fileNameFor(String libraryName) {
    final safe = libraryName.replaceAll(RegExp(r'[^\w\s-]'), '').trim();
    return '${safe.isEmpty ? 'podcasts' : safe}.opml';
  }

  static Future<({OpmlExportStatus status, String? path})> export(
    ApiService api, {
    required String libraryId,
    required String libraryName,
    required String dialogTitle,
    Rect? sharePositionOrigin,
  }) async {
    final fileName = fileNameFor(libraryName);
    try {
      String? path;
      if (ForkPlatform.isDesktop) {
        // Ask first, so a cancel costs no request.
        path = await pickSavePath(dialogTitle, fileName);
        if (path == null) return (status: OpmlExportStatus.cancelled, path: null);
      }
      final opml = await api.getLibraryOpml(libraryId);
      if (opml == null) return (status: OpmlExportStatus.failed, path: null);
      if (ForkPlatform.isWeb) {
        await webDownload(fileName, opml);
        return (status: OpmlExportStatus.downloaded, path: null);
      }
      if (path != null) {
        await writeFile(path, opml);
        return (status: OpmlExportStatus.saved, path: path);
      }
      await share(
        XFile.fromData(Uint8List.fromList(utf8.encode(opml)),
            name: fileName, mimeType: 'text/x-opml'),
        sharePositionOrigin,
      );
      return (status: OpmlExportStatus.shared, path: null);
    } catch (e) {
      debugPrint('[OPML] Export failed: ${e.runtimeType}');
      return (status: OpmlExportStatus.failed, path: null);
    }
  }
}
