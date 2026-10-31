import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'pending_writes.dart';

/// Where [JsonFileStore.read] found its data.
enum JsonFileSource { main, backup, none }

class JsonFileRead {
  const JsonFileRead(this.value, this.source, {this.hadCorruptCopy = false});

  /// The decoded JSON, or null when nothing readable was found.
  final Object? value;
  final JsonFileSource source;

  /// True when the main file or its backup existed but could not be parsed.
  final bool hadCorruptCopy;
}

/// One JSON document kept in its own file in app support storage (Absorb
/// Plus). Used for data too big or too busy for SharedPreferences, which on
/// Windows rewrites its whole file on the UI thread for every single set.
///
/// - Writes run off the UI thread, one at a time, and land atomically: the
///   data goes to a temp file (flushed), the current file is copied to
///   `<name>.bak`, then the temp file is renamed over the current one.
/// - [schedule] coalesces bursts: only the newest snapshot is written, a
///   moment later. [flush] (and [PendingWrites.flushAll] on exit) writes it
///   right away.
/// - A write whose content equals what is already on disk is skipped.
/// - A write that fails (disk full, file locked) is kept and retried with
///   growing pauses until one lands or newer data replaces it.
/// - [read] falls back to the backup when the main file is missing, does not
///   parse, or fails [validate]; that main file is kept aside as
///   `<name>.corrupt`.
class JsonFileStore {
  JsonFileStore(
    this.fileName, {
    Future<Directory> Function()? directory,
    this.debounce = const Duration(milliseconds: 250),
    this.validate,
    bool flushOnExit = true,
  }) : _directory = directory ?? getApplicationSupportDirectory {
    if (flushOnExit) PendingWrites.register(this, flush);
  }

  final String fileName;
  final Duration debounce;
  final Future<Directory> Function() _directory;

  /// Whether a decoded document has the expected shape. One that doesn't
  /// counts as corrupt.
  final bool Function(Object? value)? validate;

  /// Called after every successful write.
  void Function()? onWritten;

  static const _firstRetry = Duration(seconds: 2);
  static const _maxRetry = Duration(minutes: 1);
  Duration _retryDelay = _firstRetry;
  // The newest data whose write failed, retried until something lands.
  String? _failed;

  Timer? _timer;
  Object? Function()? _pendingSnapshot;
  Future<void> _chain = Future<void>.value();
  String? _lastPersisted;
  // False after read() found the main file corrupt: the next write must not
  // copy that broken file over a good backup.
  bool _mainKnownGood = true;
  bool _staleTempsSwept = false;
  int _seq = 0;

  /// Successful writes to disk (tests check that unchanged data is skipped).
  @visibleForTesting
  int writeCount = 0;

  Future<File> _mainFile() async {
    final dir = await _directory();
    return File('${dir.path}${Platform.pathSeparator}$fileName');
  }

  /// Reads the document: the main file, else the backup. Never throws.
  Future<JsonFileRead> read() async {
    File main;
    try {
      main = await _mainFile();
    } catch (e) {
      debugPrint('[JsonFileStore] $fileName: no storage folder: $e');
      return const JsonFileRead(null, JsonFileSource.none);
    }
    var corrupt = false;
    final mainResult = await _tryRead(main);
    if (mainResult.ok) {
      _lastPersisted = mainResult.raw;
      _mainKnownGood = true;
      return JsonFileRead(mainResult.value, JsonFileSource.main);
    }
    if (mainResult.existed) {
      corrupt = true;
      _mainKnownGood = false;
      _lastPersisted = null;
      try {
        await main.copy('${main.path}.corrupt');
      } catch (_) {}
      debugPrint('[JsonFileStore] $fileName is unreadable - trying the backup');
    }
    final backupResult = await _tryRead(File('${main.path}.bak'));
    if (backupResult.ok) {
      // The main file is missing or broken; the next write recreates it.
      _lastPersisted = null;
      return JsonFileRead(
        backupResult.value,
        JsonFileSource.backup,
        hadCorruptCopy: corrupt,
      );
    }
    if (backupResult.existed) corrupt = true;
    return JsonFileRead(null, JsonFileSource.none, hadCorruptCopy: corrupt);
  }

  /// The main file's raw text, or null (used to verify a migration).
  Future<String?> readRawMain() async {
    try {
      final main = await _mainFile();
      if (!await main.exists()) return null;
      return await main.readAsString();
    } catch (_) {
      return null;
    }
  }

  Future<({bool ok, bool existed, Object? value, String? raw})> _tryRead(
    File file,
  ) async {
    try {
      if (!await file.exists()) {
        return (ok: false, existed: false, value: null, raw: null);
      }
      final raw = await file.readAsString();
      final value = jsonDecode(raw);
      if (validate != null && !validate!(value)) {
        return (ok: false, existed: true, value: null, raw: null);
      }
      return (ok: true, existed: true, value: value, raw: raw);
    } catch (e) {
      return (ok: false, existed: true, value: null, raw: null);
    }
  }

  /// Writes what [snapshot] returns a moment from now. A later call before
  /// then replaces it, so a burst of changes costs one write. The snapshot
  /// runs at write time, so it sees the latest state.
  void schedule(Object? Function() snapshot) {
    _pendingSnapshot = snapshot;
    _timer ??= Timer(debounce, () => unawaited(flush()));
  }

  /// Whether a scheduled write has not started yet.
  bool get hasPendingWrite => _pendingSnapshot != null;

  /// Writes any scheduled snapshot now and waits for every write in flight.
  Future<void> flush() async {
    _timer?.cancel();
    _timer = null;
    final snapshot = _pendingSnapshot;
    _pendingSnapshot = null;
    if (snapshot != null) {
      String encoded;
      try {
        encoded = jsonEncode(snapshot());
      } catch (e) {
        debugPrint('[JsonFileStore] $fileName: could not encode: $e');
        await _chain;
        return;
      }
      await _enqueue(encoded);
    } else if (_failed != null) {
      await _enqueue(_failed!);
    } else {
      await _chain;
    }
  }

  /// Writes [value] now (after anything already queued) and reports whether
  /// the file on disk now holds exactly it. A scheduled snapshot is dropped:
  /// [value] is newer.
  Future<bool> writeNow(Object? value) async {
    _timer?.cancel();
    _timer = null;
    _pendingSnapshot = null;
    final String encoded;
    try {
      encoded = jsonEncode(value);
    } catch (e) {
      debugPrint('[JsonFileStore] $fileName: could not encode: $e');
      return false;
    }
    return _enqueue(encoded);
  }

  Future<bool> _enqueue(String encoded) {
    final run = _chain.then((_) => _write(encoded));
    _chain = run.then((_) {}, onError: (Object _) {});
    return run;
  }

  Future<bool> _write(String data) async {
    if (data == _lastPersisted) return true;
    File? tmp;
    try {
      final dir = await _directory();
      if (!await dir.exists()) await dir.create(recursive: true);
      final main = File('${dir.path}${Platform.pathSeparator}$fileName');
      if (!_staleTempsSwept) {
        _staleTempsSwept = true;
        await _sweepStaleTemps(dir);
      }
      tmp = File('${main.path}.$pid-${_seq++}.tmp');
      await tmp.writeAsString(data, flush: true);
      if (_mainKnownGood && await main.exists()) {
        try {
          await _retry(() => main.copy('${main.path}.bak'));
        } catch (e) {
          // The write itself matters more than refreshing the backup.
          debugPrint('[JsonFileStore] $fileName: backup copy failed: $e');
        }
      }
      await _retry(() => tmp!.rename(main.path));
      _lastPersisted = data;
      _mainKnownGood = true;
      _failed = null;
      _retryDelay = _firstRetry;
      writeCount++;
      onWritten?.call();
      return true;
    } catch (e) {
      debugPrint(
        '[JsonFileStore] ERROR $fileName: write failed, retrying in '
        '${_retryDelay.inSeconds}s: $e',
      );
      try {
        if (tmp != null && await tmp.exists()) await tmp.delete();
      } catch (_) {}
      _failed = data;
      _timer ??= Timer(_retryDelay, () => unawaited(flush()));
      final next = _retryDelay * 2;
      _retryDelay = next > _maxRetry ? _maxRetry : next;
      return false;
    }
  }

  /// Antivirus and indexers can hold a file for a moment on Windows.
  static Future<T> _retry<T>(Future<T> Function() op) async {
    var delay = const Duration(milliseconds: 20);
    for (var attempt = 1; ; attempt++) {
      try {
        return await op();
      } on FileSystemException {
        if (attempt >= 5) rethrow;
        await Future<void>.delayed(delay);
        delay *= 2;
      }
    }
  }

  /// Temp files left by a write that never finished (the app was killed).
  /// Only old ones: another isolate may be mid-write right now.
  Future<void> _sweepStaleTemps(Directory dir) async {
    try {
      final cutoff = DateTime.now().subtract(const Duration(minutes: 10));
      await for (final entity in dir.list(followLinks: false)) {
        if (entity is! File) continue;
        final name = entity.uri.pathSegments.last;
        if (!name.startsWith('$fileName.') || !name.endsWith('.tmp')) continue;
        try {
          if ((await entity.lastModified()).isBefore(cutoff)) {
            await entity.delete();
          }
        } catch (_) {}
      }
    } catch (_) {}
  }

  /// Stops flushing this store on exit (tests).
  @visibleForTesting
  void dispose() {
    _timer?.cancel();
    _timer = null;
    PendingWrites.unregister(this);
  }
}
