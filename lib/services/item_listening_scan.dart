/// Fetches one page of a user's listening sessions, as
/// `GET /api/users/:id/listening-sessions` returns it
/// (`{total, numPages, page, itemsPerPage, sessions}`), or null on failure.
typedef ListeningSessionPageFetch = Future<Map<String, dynamic>?> Function(
    int page, int itemsPerPage);

/// Sums the time one user spent on one item, reading their listening
/// sessions a page at a time instead of one huge request.
///
/// The server lists sessions newest first, so the scan stops as soon as:
/// - a page comes back short, empty or failed, or the last page is reached;
/// - [maxSessions] sessions have been read (the old single-request cap);
/// - a page reaches back past [notBefore] (ms since epoch), the moment the
///   user started the item, so the pages after it can't belong to it.
Future<double> sumItemListeningSeconds({
  required ListeningSessionPageFetch fetchPage,
  required String itemId,
  String? episodeId,
  int? notBefore,
  int pageSize = 100,
  int maxSessions = 1000,
}) async {
  var total = 0.0;
  var seen = 0;
  for (var page = 0; seen < maxSessions; page++) {
    final payload = await fetchPage(page, pageSize);
    final sessions = (payload?['sessions'] as List<dynamic>?) ?? const [];
    int? oldest;
    for (final sess in sessions) {
      if (sess is! Map) continue;
      final at = _num(sess['updatedAt']) ?? _num(sess['startedAt']);
      if (at != null && (oldest == null || at < oldest)) oldest = at;
      if (sess['libraryItemId'] != itemId) continue;
      if (episodeId != null && sess['episodeId'] != episodeId) continue;
      total += (sess['timeListening'] as num?)?.toDouble() ?? 0;
    }
    seen += sessions.length;
    if (sessions.length < pageSize) break;
    final numPages = _num(payload?['numPages']);
    if (numPages != null && page + 1 >= numPages) break;
    if (notBefore != null && oldest != null && oldest < notBefore) break;
  }
  return total;
}

int? _num(Object? v) => v is num ? v.toInt() : null;
