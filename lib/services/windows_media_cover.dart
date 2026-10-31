import 'dart:io';

/// The cover for the Windows media flyout (SMTC), as a URI string for
/// `MediaItem.artUri`, or null for none.
///
/// Android's `content://` cover provider means nothing on Windows, so the
/// flyout gets:
/// 1. the downloaded book's cover file, when it exists;
/// 2. otherwise the server cover URL. audio_service caches it to a local file
///    (its `artCacheFile`) and the plugin also lets Windows fetch the URL
///    itself until then. The URL carries `?token=`: never log it.
/// 3. a [coverUrl] that is already a local file (offline items) when it exists.
String? windowsMediaCoverUri({
  String? localCoverPath,
  String? coverUrl,
  bool Function(String path)? fileExists,
}) {
  final exists = fileExists ?? (String path) => File(path).existsSync();
  if (localCoverPath != null && localCoverPath.isNotEmpty) {
    final path = localCoverPath.startsWith('file:')
        ? _filePath(localCoverPath)
        : localCoverPath;
    if (path != null && exists(path))
      return Uri.file(path, windows: true).toString();
  }
  final url = coverUrl?.trim();
  if (url == null || url.isEmpty) return null;
  final lower = url.toLowerCase();
  if (lower.startsWith('https://') || lower.startsWith('http://')) return url;
  final path = lower.startsWith('file:') ? _filePath(url) : url;
  if (path != null && _isAbsolutePath(path) && exists(path)) {
    return Uri.file(path, windows: true).toString();
  }
  return null;
}

String? _filePath(String uri) {
  try {
    return Uri.parse(uri).toFilePath(windows: true);
  } catch (_) {
    return null;
  }
}

bool _isAbsolutePath(String path) =>
    RegExp(r'^[A-Za-z]:[\\/]').hasMatch(path) || path.startsWith(r'\\');
