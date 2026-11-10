// Absorb Plus: one file-name cleaner for exports (IMP-009, BUG-002).
//
// The copies this replaces used `[^\w\s-]`, and Dart's `\w` is ASCII-only, so
// every Cyrillic, Greek, CJK or Hebrew title came out empty. Letters and
// digits of any script are kept now; ASCII titles come out exactly as before.

final _notAllowed = RegExp(r'[^\p{L}\p{M}\p{N}\s_-]', unicode: true);

/// [name] with everything but letters, marks, digits, whitespace, `_` and
/// `-` removed and the ends trimmed; [fallback] when nothing is left.
String safeFileName(String name, {String fallback = ''}) {
  final s = name.replaceAll(_notAllowed, '').trim();
  return s.isEmpty ? fallback : s;
}

/// Where "Save ebook" keeps its download of one item's ebook file: keyed by
/// the item and the file, never by the title, so two books can't share it.
String ebookExportCachePath(
  String directory,
  String itemId,
  String ino,
  String extension,
) =>
    '$directory/ebook_export_${safeFileName(itemId, fallback: 'item')}_'
    '${safeFileName(ino, fallback: 'file')}$extension';
