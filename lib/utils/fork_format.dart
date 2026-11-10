// Absorb Plus: small formatting helpers shared by fork code.

/// A byte count with one decimal below a gigabyte: "820.4 KB", "1.4 MB",
/// "2.31 GB". Upstream's `formatFileSize` (utils/file_size.dart) rounds
/// kilobytes instead; fork screens that showed this finer form keep it.
String formatBytesFine(int bytes) {
  if (bytes < 1024) return '$bytes B';
  if (bytes < 1048576) return '${(bytes / 1024).toStringAsFixed(1)} KB';
  if (bytes < 1073741824) return '${(bytes / 1048576).toStringAsFixed(1)} MB';
  return '${(bytes / 1073741824).toStringAsFixed(2)} GB';
}
