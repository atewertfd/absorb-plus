// Absorb Plus: keeping and reusing the finished tracks of an interrupted
// download (audit D2). Pure helpers so download_service.dart (upstream) only hooks in.
import 'dart:io';

/// The size in bytes the server reports for each track, index-aligned with
/// [audioTracks]; null where it isn't known.
List<int?> expectedTrackSizes(List<dynamic> audioTracks) => [
      for (final t in audioTracks)
        switch (t) {
          {'metadata': {'size': final num size}} when size > 0 => size.toInt(),
          _ => null,
        },
    ];

/// Indexes of the tracks already at [paths] with the size the server
/// reports. A track of unknown size is never counted: it downloads again.
Set<int> finishedTracks(List<String> paths, List<int?> sizes) {
  final done = <int>{};
  for (var i = 0; i < paths.length && i < sizes.length; i++) {
    final size = sizes[i];
    if (size == null) continue;
    try {
      final file = File(paths[i]);
      if (file.existsSync() && file.lengthSync() == size) done.add(i);
    } catch (_) {}
  }
  return done;
}

/// Whether [dir] is a folder with at least one file in it.
bool folderHasFiles(String dir) {
  try {
    return Directory(dir).listSync().any((e) => e is File);
  } catch (_) {
    return false;
  }
}

/// True when far more time passed between two ticks of a [period] timer
/// than the period: the computer slept or hibernated in between, so the
/// silence of a download says nothing about whether it is stuck.
bool sleptBetweenTicks(DateTime? last, DateTime now,
        {Duration period = const Duration(minutes: 2)}) =>
    last != null && now.difference(last) > period + const Duration(minutes: 1);
