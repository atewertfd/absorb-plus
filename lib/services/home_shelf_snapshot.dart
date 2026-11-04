import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'json_file_store.dart';

/// The home shelves (Audiobookshelf's personalized view) from the last
/// successful load, kept on disk per account and library so a cold start
/// paints Home at once instead of a spinner. The server's answer replaces
/// them as soon as it arrives (`loadPersonalizedView`).
///
/// Stored in app support storage (not prefs: the view can be a few hundred
/// KB), decoded off the UI thread. Never on web. A missing or unreadable
/// snapshot is just a normal cold start.
class HomeShelfSnapshot {
  HomeShelfSnapshot({Future<Directory> Function()? baseDirectory})
      : _baseDirectory = baseDirectory ?? getApplicationSupportDirectory;

  static final HomeShelfSnapshot instance = HomeShelfSnapshot();

  final Future<Directory> Function() _baseDirectory;

  /// Snapshots older than this aren't shown: the shelves would be too far
  /// from the truth to be worth the flash of old content.
  static const maxAge = Duration(days: 14);

  static String _hash(String text) => sha1.convert(utf8.encode(text)).toString();

  Future<Directory> _root() async {
    final base = await _baseDirectory();
    return Directory('${base.path}${Platform.pathSeparator}home_shelves');
  }

  /// One folder per account, so forgetting an account can remove all of its
  /// libraries' shelves (audit C15).
  Future<Directory> _scopeDir(String scope) async {
    final root = await _root();
    return Directory('${root.path}${Platform.pathSeparator}${_hash(scope)}');
  }

  Future<File> _file(String scope, String libraryId) async {
    final dir = await _scopeDir(scope);
    return File('${dir.path}${Platform.pathSeparator}'
        '${_hash('$scope|$libraryId')}.json');
  }

  /// Where builds before the per-account folders kept a snapshot.
  Future<File> _legacyFile(String scope, String libraryId) async {
    final root = await _root();
    return File('${root.path}${Platform.pathSeparator}'
        '${_hash('$scope|$libraryId')}.json');
  }

  bool _pruned = false;

  Future<List<dynamic>?> load(String scope, String libraryId) async {
    if (kIsWeb) return null;
    if (!_pruned) {
      _pruned = true;
      unawaited(pruneExpired());
    }
    try {
      var file = await _file(scope, libraryId);
      if (!await file.exists()) file = await _legacyFile(scope, libraryId);
      if (!await file.exists()) return null;
      final age = DateTime.now().difference(await file.lastModified());
      if (age > maxAge) return null;
      final text = await file.readAsString();
      final decoded = await compute(_decodeList, text);
      return decoded;
    } catch (e) {
      debugPrint('[HomeSnapshot] load failed: ${e.runtimeType}');
      return null;
    }
  }

  Future<void> save(
      String scope, String libraryId, List<dynamic> sections) async {
    if (kIsWeb) return;
    try {
      final text = await compute(jsonEncode, sections);
      final file = await _file(scope, libraryId);
      await file.parent.create(recursive: true);
      // Write then rename, so a crash mid-write never leaves half a file.
      final tmp = File('${file.path}.tmp');
      await tmp.writeAsString(text, flush: true);
      await retryFileOp(() => tmp.rename(file.path));
      final legacy = await _legacyFile(scope, libraryId);
      if (await legacy.exists()) await legacy.delete();
    } catch (e) {
      debugPrint('[HomeSnapshot] save failed: ${e.runtimeType}');
    }
  }

  /// Removes every saved shelf of an account (it was removed from the app).
  /// Snapshots from before the per-account folders age out through
  /// [pruneExpired].
  Future<void> clearScope(String scope) async {
    if (kIsWeb || scope.isEmpty) return;
    try {
      final dir = await _scopeDir(scope);
      if (await dir.exists()) await dir.delete(recursive: true);
    } catch (e) {
      debugPrint('[HomeSnapshot] clear failed: ${e.runtimeType}');
    }
  }

  /// Deletes snapshots too old to be shown ([maxAge]); they used to stay on
  /// disk for good (audit C15).
  Future<void> pruneExpired() async {
    if (kIsWeb) return;
    try {
      final root = await _root();
      if (!await root.exists()) return;
      final now = DateTime.now();
      await for (final entity in root.list(recursive: true, followLinks: false)) {
        if (entity is! File) continue;
        try {
          if (now.difference(await entity.lastModified()) > maxAge) {
            await entity.delete();
          }
        } catch (_) {
          // Best effort: an old snapshot that can't go now is tried next start.
        }
      }
    } catch (e) {
      debugPrint('[HomeSnapshot] prune failed: ${e.runtimeType}');
    }
  }
}

List<dynamic>? _decodeList(String text) {
  final value = jsonDecode(text);
  return value is List ? value : null;
}
