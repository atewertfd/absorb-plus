import 'dart:convert';
import 'dart:io' show File;
import 'dart:ui' show Rect;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/fork_platform.dart';
import '../utils/text_file_download.dart';

enum TextFileExportStatus { saved, shared, downloaded, cancelled, failed }

/// Absorb Plus: hands a text file made on the device to the user, the same
/// way the OPML export does: a save dialog on desktop, a browser download on
/// web and the share sheet on Android. Used by the bookmarks export.
abstract final class TextFileExport {
  @visibleForTesting
  static Future<String?> Function(
    String dialogTitle,
    String fileName,
    String extension,
  )
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
      (file, origin) => Share.shareXFiles([file], sharePositionOrigin: origin);

  static Future<String?> _pickSavePath(
    String dialogTitle,
    String fileName,
    String extension,
  ) => FilePicker.platform.saveFile(
    dialogTitle: dialogTitle,
    fileName: fileName,
    type: FileType.custom,
    allowedExtensions: [extension],
    lockParentWindow: true,
  );

  /// Saves, downloads or shares [content] as [fileName]. [mimeType] labels
  /// the shared file on Android.
  static Future<({TextFileExportStatus status, String? path})> export({
    required String fileName,
    required String content,
    required String dialogTitle,
    required String mimeType,
    Rect? sharePositionOrigin,
  }) async {
    try {
      if (ForkPlatform.isWeb) {
        await webDownload(fileName, content);
        return (status: TextFileExportStatus.downloaded, path: null);
      }
      if (ForkPlatform.isDesktop) {
        final dot = fileName.lastIndexOf('.');
        final ext = dot < 0 ? 'txt' : fileName.substring(dot + 1);
        final path = await pickSavePath(dialogTitle, fileName, ext);
        if (path == null) {
          return (status: TextFileExportStatus.cancelled, path: null);
        }
        await writeFile(path, content);
        return (status: TextFileExportStatus.saved, path: path);
      }
      await share(
        XFile.fromData(
          Uint8List.fromList(utf8.encode(content)),
          name: fileName,
          mimeType: mimeType,
        ),
        sharePositionOrigin,
      );
      return (status: TextFileExportStatus.shared, path: null);
    } catch (e) {
      debugPrint('[Export] Failed: ${e.runtimeType}');
      return (status: TextFileExportStatus.failed, path: null);
    }
  }
}
