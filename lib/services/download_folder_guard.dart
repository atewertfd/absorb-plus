import 'dart:io';

import 'package:flutter/foundation.dart';

/// Path checks that keep download cleanup inside the app's own download
/// folders (Absorb Plus, audit item A9).
///
/// - A book folder is removed (recursively) only when it sits strictly inside
///   a known download root: the default folder, or a folder the user picked
///   now or earlier. Never a root itself, and never a folder that contains a
///   root.
/// - An emptied parent (the Author folder) is removed under the same rule,
///   so a previously picked download folder is never deleted.
/// - On Windows, paths compare without regard to case, slash direction or a
///   trailing separator.
abstract final class DownloadFolderGuard {
  /// [path] in a form two spellings of the same folder share.
  static String normalize(String path, {required bool windows}) {
    var p = path.replaceAll('\\', '/');
    final unc = p.startsWith('//');
    final parts = <String>[];
    for (final segment in p.split('/')) {
      if (segment.isEmpty || segment == '.') continue;
      if (segment == '..') {
        if (parts.isNotEmpty) parts.removeLast();
        continue;
      }
      parts.add(segment);
    }
    p = parts.join('/');
    if (unc) {
      p = '//$p';
    } else if (path.startsWith('/') || path.startsWith('\\')) {
      p = '/$p';
    }
    return windows ? p.toLowerCase() : p;
  }

  static bool samePath(String a, String b, {required bool windows}) =>
      normalize(a, windows: windows) == normalize(b, windows: windows);

  /// True when [path] is strictly inside [root] (not equal to it).
  static bool isInside(String path, String root, {required bool windows}) {
    final p = normalize(path, windows: windows);
    final r = normalize(root, windows: windows);
    if (r.isEmpty || p == r) return false;
    final prefix = r.endsWith('/') ? r : '$r/';
    return p.startsWith(prefix);
  }

  /// True when [dir] ends with the folder [nestedName] ("Author/Title").
  static bool endsWithFolder(
    String dir,
    String nestedName, {
    required bool windows,
  }) {
    final d = dir.replaceAll('\\', '/');
    final n = nestedName.replaceAll('\\', '/');
    return windows
        ? d.toLowerCase().endsWith('/${n.toLowerCase()}')
        : d.endsWith('/$n');
  }

  /// Whether [dir] may be deleted with everything in it.
  static bool mayDeleteTree(
    String dir,
    Iterable<String> roots, {
    required bool windows,
  }) {
    final known = roots.where((r) => r.trim().isNotEmpty).toList();
    if (!known.any((r) => isInside(dir, r, windows: windows))) return false;
    // Never a root, nor a folder holding one.
    return !known.any(
      (r) =>
          samePath(r, dir, windows: windows) ||
          isInside(r, dir, windows: windows),
    );
  }

  /// Removes a book's folder and then its parent if that is left empty, both
  /// only within [roots]. A folder outside them is left in place (its files
  /// were already removed one by one). Returns whether [dir] was removed.
  static bool removeBookFolder(
    String dir,
    Iterable<String> roots, {
    required bool windows,
  }) {
    final folder = Directory(dir);
    if (!folder.existsSync()) return false;
    if (!mayDeleteTree(dir, roots, windows: windows)) {
      debugPrint(
        '[Download] Leaving a folder outside the download folders in place',
      );
      return false;
    }
    folder.deleteSync(recursive: true);
    final parent = folder.parent;
    try {
      if (mayDeleteTree(parent.path, roots, windows: windows) &&
          parent.existsSync() &&
          parent.listSync().isEmpty) {
        parent.deleteSync();
      }
    } catch (_) {}
    return true;
  }
}
