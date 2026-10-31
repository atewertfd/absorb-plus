import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'json_file_store.dart';

/// The persisted download list: finished and failed downloads, ebooks kept
/// for the reader, and which account each download came from. Values are the
/// raw JSON maps `DownloadService` reads and writes.
class DownloadIndex {
  DownloadIndex({
    Map<String, dynamic>? downloads,
    Map<String, dynamic>? keptEbooks,
    Map<String, dynamic>? origins,
  }) : downloads = downloads ?? {},
       keptEbooks = keptEbooks ?? {},
       origins = origins ?? {};

  final Map<String, dynamic> downloads;
  final Map<String, dynamic> keptEbooks;
  final Map<String, dynamic> origins;

  static const _version = 1;

  Map<String, dynamic> toJson() => {
    'version': _version,
    'downloads': downloads,
    'keptEbooks': keptEbooks,
    'origins': origins,
  };

  /// Null when [json] is not a download index.
  static DownloadIndex? fromJson(Object? json) {
    if (json is! Map<String, dynamic>) return null;
    final downloads = json['downloads'];
    if (downloads is! Map<String, dynamic>) return null;
    final kept = json['keptEbooks'];
    final origins = json['origins'];
    return DownloadIndex(
      downloads: downloads,
      keptEbooks: kept is Map<String, dynamic> ? kept : null,
      origins: origins is Map<String, dynamic> ? origins : null,
    );
  }

  /// This index plus every entry of [other] it lacks. Entries present in
  /// both keep this index's version, so nothing either side holds is lost.
  DownloadIndex mergeMissingFrom(DownloadIndex other) {
    Map<String, dynamic> merge(
      Map<String, dynamic> a,
      Map<String, dynamic> b,
    ) => {
      ...a,
      for (final e in b.entries)
        if (!a.containsKey(e.key)) e.key: e.value,
    };
    return DownloadIndex(
      downloads: merge(downloads, other.downloads),
      keptEbooks: merge(keptEbooks, other.keptEbooks),
      origins: merge(origins, other.origins),
    );
  }

  bool get isEmpty =>
      downloads.isEmpty && keptEbooks.isEmpty && origins.isEmpty;
}

/// Where `DownloadService` keeps its [DownloadIndex] (Absorb Plus).
///
/// It used to live in three SharedPreferences keys. On Windows every
/// preference write rewrites the whole preferences file on the UI thread, and
/// the download list (about 36 KB per book, most of it the cached session)
/// made that file several hundred KB, rewritten many times a minute while
/// playing. Native builds now keep it in `downloads.json` in app support
/// storage ([FileDownloadIndexStore]); web has no file system and keeps the
/// preferences ([PrefsDownloadIndexStore]).
abstract class DownloadIndexStore {
  factory DownloadIndexStore.platformDefault() => kIsWeb
      ? PrefsDownloadIndexStore()
      : FileDownloadIndexStore(
          JsonFileStore(
            fileName,
            validate: (v) => DownloadIndex.fromJson(v) != null,
          ),
        );

  static const fileName = 'downloads.json';

  /// The SharedPreferences keys the index used to live in.
  static const legacyDownloadsKey = 'downloads';
  static const legacyKeptEbooksKey = 'kept_ebooks';
  static const legacyOriginsKey = 'download_origins';

  Future<DownloadIndex> load();

  /// Persists what [snapshot] returns. Unchanged data is not rewritten.
  Future<void> save(DownloadIndex Function() snapshot);

  /// Waits until everything saved so far is on disk.
  Future<void> flush();
}

/// Reads the three legacy preference keys. Null when none is present. A key
/// that does not parse counts as empty (it was unreadable before as well).
DownloadIndex? readLegacyDownloadIndex(SharedPreferences prefs) {
  final keys = [
    DownloadIndexStore.legacyDownloadsKey,
    DownloadIndexStore.legacyKeptEbooksKey,
    DownloadIndexStore.legacyOriginsKey,
  ];
  if (!keys.any(prefs.containsKey)) return null;
  Map<String, dynamic>? read(String key) {
    final raw = prefs.getString(key);
    if (raw == null) return null;
    try {
      final value = jsonDecode(raw);
      return value is Map<String, dynamic> ? value : null;
    } catch (e) {
      debugPrint(
        '[DownloadIndex] preference "$key" unreadable: ${e.runtimeType}',
      );
      return null;
    }
  }

  return DownloadIndex(
    downloads: read(keys[0]),
    keptEbooks: read(keys[1]),
    origins: read(keys[2]),
  );
}

/// The old storage: three SharedPreferences keys. Used on web, and by tests.
class PrefsDownloadIndexStore implements DownloadIndexStore {
  @override
  Future<DownloadIndex> load() async {
    final prefs = await SharedPreferences.getInstance();
    return readLegacyDownloadIndex(prefs) ?? DownloadIndex();
  }

  @override
  Future<void> save(DownloadIndex Function() snapshot) async {
    final prefs = await SharedPreferences.getInstance();
    final index = snapshot();
    Future<void> put(String key, Map<String, dynamic> value) async {
      final encoded = jsonEncode(value);
      if (prefs.getString(key) == encoded) return;
      await prefs.setString(key, encoded);
    }

    await put(DownloadIndexStore.legacyDownloadsKey, index.downloads);
    await put(DownloadIndexStore.legacyKeptEbooksKey, index.keptEbooks);
    await put(DownloadIndexStore.legacyOriginsKey, index.origins);
  }

  @override
  Future<void> flush() async {}
}

/// The download index in its own JSON file, with a one-time move out of
/// SharedPreferences.
///
/// Migration ([load]):
/// - the file is read first (falling back to its backup);
/// - when the legacy keys still exist (first launch after the update, a
///   move that was interrupted, or an older build that ran in between), their
///   entries are merged in without replacing any the file has;
/// - the result is written, read back and compared, and only when it matches
///   are the legacy keys removed. Until then they stay as the fallback, and
///   go after the next write that lands (so a later launch cannot merge back
///   entries deleted in between).
class FileDownloadIndexStore implements DownloadIndexStore {
  FileDownloadIndexStore(
    this.file, {
    Future<SharedPreferences> Function()? prefs,
  }) : _prefs = prefs ?? SharedPreferences.getInstance {
    file.onWritten = _onWritten;
  }

  final JsonFileStore file;
  final Future<SharedPreferences> Function() _prefs;
  bool _legacyPending = false;

  static const _legacyKeys = [
    DownloadIndexStore.legacyDownloadsKey,
    DownloadIndexStore.legacyKeptEbooksKey,
    DownloadIndexStore.legacyOriginsKey,
  ];

  Future<void> _removeLegacy(SharedPreferences prefs) async {
    _legacyPending = false;
    for (final key in _legacyKeys) {
      await prefs.remove(key);
    }
  }

  // Everything loaded (legacy entries included) is in memory and so in what
  // was just written: the preferences copy is no longer needed.
  void _onWritten() {
    if (!_legacyPending) return;
    unawaited(() async {
      await _removeLegacy(await _prefs());
      debugPrint(
        '[DownloadIndex] preferences copy removed after a later write',
      );
    }());
  }

  @override
  Future<DownloadIndex> load() async {
    final prefs = await _prefs();
    final legacy = readLegacyDownloadIndex(prefs);
    final read = await file.read();
    final fromFile = DownloadIndex.fromJson(read.value);
    if (read.value != null && fromFile == null) {
      debugPrint(
        '[DownloadIndex] ${file.fileName} has an unexpected shape - ignored',
      );
    }

    if (fromFile != null && legacy == null) return fromFile;

    if (fromFile == null && legacy == null) {
      if (read.hadCorruptCopy) {
        debugPrint(
          '[DownloadIndex] ${file.fileName} and its backup are unreadable '
          'and no older copy exists - starting with an empty list',
        );
      }
      return DownloadIndex();
    }

    final index = fromFile == null
        ? legacy!
        : fromFile.mergeMissingFrom(legacy!);
    // This load verifies its own write; only a failed check leaves the keys
    // to the next write that lands.
    _legacyPending = false;
    if (await _persistAndVerify(index)) {
      await _removeLegacy(prefs);
      debugPrint(
        '[DownloadIndex] moved ${index.downloads.length} download(s) '
        'to ${file.fileName}',
      );
    } else {
      debugPrint(
        '[DownloadIndex] could not confirm ${file.fileName} - '
        'keeping the preferences copy as a fallback',
      );
      _legacyPending = true;
    }
    return index;
  }

  Future<bool> _persistAndVerify(DownloadIndex index) async {
    final expected = jsonEncode(index.toJson());
    if (!await file.writeNow(index.toJson())) return false;
    final onDisk = await file.readRawMain();
    if (onDisk != expected) return false;
    try {
      final back = DownloadIndex.fromJson(jsonDecode(onDisk!));
      return back != null &&
          back.downloads.length == index.downloads.length &&
          back.keptEbooks.length == index.keptEbooks.length;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> save(DownloadIndex Function() snapshot) async {
    file.schedule(() => snapshot().toJson());
  }

  @override
  Future<void> flush() => file.flush();
}
