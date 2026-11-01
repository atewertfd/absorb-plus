// Absorb Plus: "Check files" for a book. Reads only what the server already
// sent with the item (audio files, tracks, chapters, flags) plus, for a
// downloaded book, the local files' existence and sizes. Never changes
// anything on the server.

import 'dart:async';
import 'dart:io';

/// What kind of problem a [FileHealthFinding] describes.
enum FileHealthKind {
  /// The server can't find the book's folder on disk any more.
  itemMissing,

  /// The server marked the whole book as invalid.
  itemInvalid,

  /// Audio files the server flagged as invalid or failed to read.
  invalidFiles,

  /// Audio files with no length.
  emptyFiles,

  /// Silence-sized holes between one track's end and the next one's start.
  trackGaps,

  /// A track starting before the previous one ends.
  trackOverlaps,

  /// The tracks add up to a different length than the book reports.
  durationMismatch,

  /// Audio encoded below [FileHealthCheck.lowBitrate].
  lowBitrate,

  /// Tracks recorded at different sample rates.
  mixedSampleRates,

  /// Tracks with different channel counts (mono and stereo mixed).
  mixedChannels,

  /// Chapters that start or end after the audio ends.
  chaptersPastEnd,

  /// Downloaded files that are gone from this device.
  localMissing,

  /// Downloaded files whose size differs from the server's copy.
  localSizeMismatch,
}

/// One affected file (or chapter, or pair of tracks) inside a finding.
class FileHealthEntry {
  /// File name, chapter title, or "first → second" for a track pair.
  final String name;

  /// Seconds involved: the gap or overlap, or a chapter's start.
  final double? seconds;

  /// A number involved: kbps for low bitrate, sample rate or channels for
  /// the mixed findings, local bytes for a size mismatch.
  final int? value;

  /// Expected number when [value] is compared against one (server bytes).
  final int? expected;

  /// The server's own error text for an invalid file.
  final String? error;

  const FileHealthEntry(this.name, {this.seconds, this.value, this.expected, this.error});

  @override
  String toString() => 'FileHealthEntry($name, seconds: $seconds, value: $value, '
      'expected: $expected, error: $error)';
}

class FileHealthFinding {
  final FileHealthKind kind;
  final List<FileHealthEntry> entries;

  /// For [FileHealthKind.durationMismatch]: the book's reported length.
  final double? expectedSeconds;

  /// For [FileHealthKind.durationMismatch]: what the tracks add up to.
  final double? actualSeconds;

  const FileHealthFinding(this.kind, {this.entries = const [], this.expectedSeconds, this.actualSeconds});

  /// Serious findings can break playback or downloads; the rest are notes
  /// about quality or consistency.
  bool get serious => switch (kind) {
        FileHealthKind.lowBitrate ||
        FileHealthKind.mixedSampleRates ||
        FileHealthKind.mixedChannels =>
          false,
        _ => true,
      };

  /// Whether re-downloading the book would fix this.
  bool get fixedByRedownload =>
      kind == FileHealthKind.localMissing || kind == FileHealthKind.localSizeMismatch;

  @override
  String toString() => 'FileHealthFinding($kind, $entries)';
}

class FileHealthReport {
  /// How many files were looked at (audio files plus the ebook).
  final int fileCount;
  final List<FileHealthFinding> findings;

  /// Whether local downloaded files were part of the check.
  final bool checkedLocal;

  const FileHealthReport({required this.fileCount, required this.findings, this.checkedLocal = false});

  bool get healthy => findings.isEmpty;

  bool get canRedownload => findings.any((f) => f.fixedByRedownload);

  FileHealthFinding? find(FileHealthKind kind) {
    for (final f in findings) {
      if (f.kind == kind) return f;
    }
    return null;
  }
}

/// A downloaded file as found on this device. [exists] is null when it
/// can't be checked (a content URI, an unplugged drive).
class LocalFileStat {
  final String path;
  final bool? exists;
  final int? size;
  const LocalFileStat(this.path, {this.exists, this.size});
}

class FileHealthCheck {
  FileHealthCheck._();

  /// Bitrates below this (bits per second) are called out as low quality.
  static const lowBitrate = 32000;

  /// Gaps or overlaps between tracks shorter than this are rounding noise.
  static const trackTolerance = 1.0;

  /// Runs every check on a library item JSON as the server sent it.
  /// [local] are the downloaded files' stats, when the book is downloaded.
  static FileHealthReport check(Map<String, dynamic> item, {List<LocalFileStat>? local}) {
    final media = _map(item['media']);
    final audioFiles = [for (final f in _list(media['audioFiles'])) _map(f)];
    final playable = [for (final f in audioFiles) if (f['exclude'] != true) f];
    final hasEbook = media['ebookFile'] is Map;
    final findings = <FileHealthFinding>[];

    if (item['isMissing'] == true) findings.add(const FileHealthFinding(FileHealthKind.itemMissing));
    if (item['isInvalid'] == true) findings.add(const FileHealthFinding(FileHealthKind.itemInvalid));

    final invalid = <FileHealthEntry>[];
    final empty = <FileHealthEntry>[];
    final low = <FileHealthEntry>[];
    for (final f in playable) {
      final name = fileName(f);
      final error = (f['error'] as String?)?.trim();
      if (f['invalid'] == true || (error != null && error.isNotEmpty)) {
        invalid.add(FileHealthEntry(name, error: error == null || error.isEmpty ? null : error));
        continue;
      }
      final duration = _num(f['duration']);
      if (duration != null && duration <= 0) empty.add(FileHealthEntry(name));
      final bitRate = _num(f['bitRate'])?.toInt();
      if (bitRate != null && bitRate > 0 && bitRate < lowBitrate) {
        low.add(FileHealthEntry(name, value: (bitRate / 1000).round()));
      }
    }
    if (invalid.isNotEmpty) findings.add(FileHealthFinding(FileHealthKind.invalidFiles, entries: invalid));
    if (empty.isNotEmpty) findings.add(FileHealthFinding(FileHealthKind.emptyFiles, entries: empty));

    _checkTracks(media, playable, findings);

    final mediaDuration = _num(media['duration']);
    final durations = [for (final f in playable) _num(f['duration'])];
    if (mediaDuration != null && mediaDuration > 0 && playable.isNotEmpty && durations.every((d) => d != null)) {
      final sum = durations.fold<double>(0, (a, d) => a + d!);
      final tolerance = _max(2.0, mediaDuration * 0.005);
      if ((sum - mediaDuration).abs() > tolerance) {
        findings.add(FileHealthFinding(FileHealthKind.durationMismatch,
            expectedSeconds: mediaDuration, actualSeconds: sum));
      }
    }

    if (low.isNotEmpty) findings.add(FileHealthFinding(FileHealthKind.lowBitrate, entries: low));
    final rates = _mixed(playable, 'sampleRate');
    if (rates != null) findings.add(FileHealthFinding(FileHealthKind.mixedSampleRates, entries: rates));
    final channels = _mixed(playable, 'channels');
    if (channels != null) findings.add(FileHealthFinding(FileHealthKind.mixedChannels, entries: channels));

    _checkChapters(media, playable, mediaDuration, findings);

    if (local != null) _checkLocal(audioFiles, local, findings);

    return FileHealthReport(
      fileCount: audioFiles.length + (hasEbook ? 1 : 0),
      findings: findings,
      checkedLocal: local != null,
    );
  }

  /// A file's display name: its file name, else its path's last part, else
  /// its inode.
  static String fileName(Map<String, dynamic> f) {
    final meta = _map(f['metadata']);
    final name = (meta['filename'] as String?)?.trim();
    if (name != null && name.isNotEmpty) return name;
    final path = (meta['relPath'] as String?) ?? (meta['path'] as String?) ?? '';
    final last = path.split(RegExp(r'[\\/]')).last.trim();
    if (last.isNotEmpty) return last;
    final title = (f['title'] as String?)?.trim();
    if (title != null && title.isNotEmpty) return title;
    return '${f['ino'] ?? f['index'] ?? '?'}';
  }

  static void _checkTracks(Map<String, dynamic> media, List<Map<String, dynamic>> playable,
      List<FileHealthFinding> findings) {
    final tracks = [for (final t in _list(media['tracks'])) _map(t)];
    if (tracks.length < 2) return;
    tracks.sort((a, b) => (_num(a['startOffset']) ?? 0).compareTo(_num(b['startOffset']) ?? 0));
    final gaps = <FileHealthEntry>[];
    final overlaps = <FileHealthEntry>[];
    for (var i = 0; i + 1 < tracks.length; i++) {
      final a = tracks[i], b = tracks[i + 1];
      final aStart = _num(a['startOffset']), aLen = _num(a['duration']), bStart = _num(b['startOffset']);
      if (aStart == null || aLen == null || bStart == null) continue;
      final delta = bStart - (aStart + aLen);
      if (delta.abs() <= trackTolerance) continue;
      final entry = FileHealthEntry('${_trackName(a, playable)} → ${_trackName(b, playable)}', seconds: delta.abs());
      (delta > 0 ? gaps : overlaps).add(entry);
    }
    if (gaps.isNotEmpty) findings.add(FileHealthFinding(FileHealthKind.trackGaps, entries: gaps));
    if (overlaps.isNotEmpty) findings.add(FileHealthFinding(FileHealthKind.trackOverlaps, entries: overlaps));
  }

  /// A track's file name: its own metadata, else the audio file with the
  /// same index, else its title.
  static String _trackName(Map<String, dynamic> track, List<Map<String, dynamic>> files) {
    final meta = _map(track['metadata']);
    final own = (meta['filename'] as String?)?.trim();
    if (own != null && own.isNotEmpty) return own;
    final index = track['index'];
    if (index != null) {
      for (final f in files) {
        if (f['index'] == index) return fileName(f);
      }
    }
    return fileName(track);
  }

  static void _checkChapters(Map<String, dynamic> media, List<Map<String, dynamic>> playable,
      double? mediaDuration, List<FileHealthFinding> findings) {
    // The audio's real end: the reported length, or the tracks' sum when the
    // book reports none.
    var end = mediaDuration ?? 0;
    if (end <= 0) {
      end = playable.fold<double>(0, (a, f) => a + (_num(f['duration']) ?? 0));
    }
    if (end <= 0) return;
    final past = <FileHealthEntry>[];
    final chapters = [for (final c in _list(media['chapters'])) _map(c)];
    for (var i = 0; i < chapters.length; i++) {
      final c = chapters[i];
      final start = _num(c['start']);
      final stop = _num(c['end']);
      if ((start != null && start > end + trackTolerance) || (stop != null && stop > end + 2.0)) {
        final title = (c['title'] as String?)?.trim();
        past.add(FileHealthEntry(title == null || title.isEmpty ? '#${i + 1}' : title, seconds: start));
      }
    }
    if (past.isNotEmpty) findings.add(FileHealthFinding(FileHealthKind.chaptersPastEnd, entries: past));
  }

  static void _checkLocal(List<Map<String, dynamic>> audioFiles, List<LocalFileStat> local,
      List<FileHealthFinding> findings) {
    // Downloads hold the tracks the server plays: the files not excluded, in
    // index order. A file's position there is what a duplicate name's
    // "NNN - " prefix counts.
    final ordered = [for (final f in audioFiles) if (f['exclude'] != true) f]
      ..sort((a, b) => (_num(a['index']) ?? 0).compareTo(_num(b['index']) ?? 0));
    final byKey = <String, List<(int, Map<String, dynamic>)>>{};
    for (var i = 0; i < ordered.length; i++) {
      final key = matchKey(fileName(ordered[i]));
      if (key.isNotEmpty) byKey.putIfAbsent(key, () => []).add((i, ordered[i]));
    }
    final missing = <FileHealthEntry>[];
    final wrongSize = <FileHealthEntry>[];
    for (final stat in local) {
      final base = baseName(stat.path);
      if (stat.exists == false) {
        missing.add(FileHealthEntry(base));
        continue;
      }
      if (stat.exists != true || stat.size == null) continue;
      final server = _serverFileFor(base, byKey);
      final expected = server == null ? null : _num(_map(server['metadata'])['size'])?.toInt();
      if (expected == null || expected <= 0) continue;
      if (stat.size != expected) {
        wrongSize.add(FileHealthEntry(base, value: stat.size, expected: expected));
      }
    }
    if (missing.isNotEmpty) findings.add(FileHealthFinding(FileHealthKind.localMissing, entries: missing));
    if (wrongSize.isNotEmpty) findings.add(FileHealthFinding(FileHealthKind.localSizeMismatch, entries: wrongSize));
  }

  /// The server file a downloaded file came from. Downloads keep the
  /// original name (cleaned of characters Windows can't store), and a
  /// duplicate name gets a "001 - " style prefix.
  static Map<String, dynamic>? _serverFileFor(
      String localName, Map<String, List<(int, Map<String, dynamic>)>> byKey) {
    final direct = byKey[matchKey(localName)];
    if (direct != null) return direct.first.$2;
    final prefix = RegExp(r'^(\d{3})(?:-\d+)? - ').firstMatch(localName);
    if (prefix == null) return null;
    final candidates = byKey[matchKey(localName.substring(prefix.end))];
    if (candidates == null) return null;
    final position = int.parse(prefix.group(1)!) - 1;
    for (final (i, f) in candidates) {
      if (i == position) return f;
    }
    return null;
  }

  /// Letters and digits only, lowercased, without the extension: survives
  /// the download's filename cleanup.
  static String matchKey(String name) {
    final dot = name.lastIndexOf('.');
    final stem = dot > 0 ? name.substring(0, dot) : name;
    return stem.toLowerCase().replaceAll(RegExp(r'[^\p{L}\p{N}]', unicode: true), '');
  }

  static String baseName(String path) {
    final decoded = path.startsWith('content://') ? Uri.decodeComponent(path) : path;
    return decoded.split(RegExp(r'[\\/]')).last;
  }

  /// One entry per distinct value of [field] when tracks disagree, naming
  /// the files at each value; null when they all match (or none report it).
  static List<FileHealthEntry>? _mixed(List<Map<String, dynamic>> files, String field) {
    final groups = <int, List<String>>{};
    for (final f in files) {
      final v = _num(f[field])?.toInt();
      if (v == null || v <= 0) continue;
      groups.putIfAbsent(v, () => []).add(fileName(f));
    }
    if (groups.length < 2) return null;
    // Most common value first, so the odd ones out read last.
    final sorted = groups.entries.toList()..sort((a, b) => b.value.length.compareTo(a.value.length));
    return [
      for (final g in sorted) FileHealthEntry(g.value.join(', '), value: g.key),
    ];
  }

  /// Stats every path with [stat] (default: the real file system). Content
  /// URIs and paths [skip] says can't be reached are reported as unknown.
  static Future<List<LocalFileStat>> statLocalFiles(
    List<String> paths, {
    Future<LocalFileStat> Function(String path)? stat,
    bool Function(String path)? skip,
  }) async {
    final out = <LocalFileStat>[];
    for (final path in paths) {
      if (path.startsWith('content://') || (skip?.call(path) ?? false)) {
        out.add(LocalFileStat(path));
        continue;
      }
      try {
        out.add(await (stat ?? _ioStat)(path).timeout(const Duration(seconds: 3)));
      } catch (_) {
        out.add(LocalFileStat(path));
      }
    }
    return out;
  }

  static Future<LocalFileStat> _ioStat(String path) async {
    final file = File(path);
    if (!await file.exists()) return LocalFileStat(path, exists: false);
    return LocalFileStat(path, exists: true, size: await file.length());
  }

  static Map<String, dynamic> _map(Object? v) =>
      v is Map<String, dynamic> ? v : v is Map ? v.cast<String, dynamic>() : const {};

  static List<dynamic> _list(Object? v) => v is List ? v : const [];

  static double? _num(Object? v) => v is num ? v.toDouble() : v is String ? double.tryParse(v) : null;

  static double _max(double a, double b) => a > b ? a : b;
}
