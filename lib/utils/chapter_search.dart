// Absorb Plus: filtering for the chapter list's search field.

/// Books with at least this many chapters get a search field in the
/// chapter list.
const int kChapterSearchMinChapters = 15;

/// Parses a typed time like `1:23:00`, `23:00` or `1:23:00.5` into seconds.
/// Returns null for anything else, including a bare number (that is more
/// likely a chapter number than a time).
double? parseChapterSearchTime(String query) {
  final q = query.trim();
  final match = RegExp(
    r'^(\d+):(\d{1,2})(?::(\d{1,2}))?(?:\.\d+)?$',
  ).firstMatch(q);
  if (match == null) return null;
  final a = int.parse(match.group(1)!);
  final b = int.parse(match.group(2)!);
  final c = match.group(3);
  if (c == null) {
    // m:ss
    if (b >= 60) return null;
    return (a * 60 + b).toDouble();
  }
  final s = int.parse(c);
  if (b >= 60 || s >= 60) return null;
  return (a * 3600 + b * 60 + s).toDouble();
}

/// The indices of [chapters] that match [query], in list order.
///
/// - An empty query keeps every chapter.
/// - A typed time puts the chapter containing it first.
/// - Otherwise a chapter matches when its title contains every word of the
///   query (case-insensitive). [fallbackTitle] names untitled chapters.
List<int> filterChapterIndices(
  List<dynamic> chapters,
  String query, {
  required String Function(int index) fallbackTitle,
}) {
  final q = query.trim().toLowerCase();
  if (q.isEmpty) return List<int>.generate(chapters.length, (i) => i);

  final result = <int>[];
  final time = parseChapterSearchTime(q);
  if (time != null) {
    final hit = _chapterAt(chapters, time);
    if (hit != null) result.add(hit);
  }

  final words = q.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
  for (var i = 0; i < chapters.length; i++) {
    if (result.contains(i)) continue;
    final ch = chapters[i];
    final raw = ch is Map ? ch['title'] : null;
    final title = (raw is String && raw.isNotEmpty ? raw : fallbackTitle(i))
        .toLowerCase();
    if (words.every(title.contains)) result.add(i);
  }
  return result;
}

int? _chapterAt(List<dynamic> chapters, double seconds) {
  for (var i = 0; i < chapters.length; i++) {
    final ch = chapters[i];
    if (ch is! Map) continue;
    final start = (ch['start'] as num?)?.toDouble() ?? 0;
    final end = (ch['end'] as num?)?.toDouble() ?? 0;
    final isLast = i == chapters.length - 1;
    if (seconds >= start && (seconds < end || (isLast && seconds <= end))) {
      return i;
    }
  }
  return null;
}
