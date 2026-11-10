// Absorb Plus: turns paths dropped on the desktop window into upload files.

import 'api_service.dart' show MediaUploadFile;
import 'dropped_upload_files_stub.dart'
    if (dart.library.io) 'dropped_upload_files_io.dart'
    as impl;

/// Expands dropped [paths] into files: a file stays itself, a folder
/// becomes every file inside it (recursively, sorted by path). Hidden and
/// system files (`.DS_Store`, `desktop.ini`, `Thumbs.db`) are left out.
/// Paths that can't be read are skipped. Web has no paths: always empty.
Future<List<MediaUploadFile>> expandDroppedPaths(List<String> paths) =>
    impl.expandDroppedPaths(paths);

/// Whether a dropped file named [name] should be left out of an upload.
bool isIgnoredDropFile(String name) {
  final lower = name.toLowerCase();
  return lower.startsWith('.') ||
      lower == 'desktop.ini' ||
      lower == 'thumbs.db';
}
