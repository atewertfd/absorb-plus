import 'dart:convert';
import 'dart:math';

/// One page of `/api/libraries/{id}/items` (`results` + `total`), or null
/// when the request failed.
typedef SurpriseItemsPage =
    Future<Map<String, dynamic>?> Function({
      required int page,
      required int limit,
      String? filter,
    });

/// What [SurpriseBookPicker.pick] found.
enum SurpriseOutcome { found, noneLeft, failed }

/// Absorb Plus: "Surprise me" picks a random book from the current library
/// that the user hasn't finished.
///
/// It asks the server for the not-finished items one at a time: the first
/// request (page 0, limit 1) gives the total, the second fetches a random
/// index (with limit 1 the page number is the item index). Two small
/// requests, never the whole library. Servers that ignore the progress
/// filter are covered by checking [isFinished] locally and trying again.
class SurpriseBookPicker {
  SurpriseBookPicker({
    required this.fetchPage,
    required this.isFinished,
    Random? random,
  }) : _random = random ?? Random();

  final SurpriseItemsPage fetchPage;

  /// The app's own view of finished books (local overrides included).
  final bool Function(String itemId) isFinished;

  final Random _random;

  /// Tries this many random picks before giving up on a library whose
  /// server ignores the filter and is mostly finished.
  static const maxAttempts = 5;

  /// ABS item filter for books not marked finished.
  static final notFinishedFilter =
      'progress.${base64Encode(utf8.encode('not-finished'))}';

  Future<({SurpriseOutcome outcome, Map<String, dynamic>? item})> pick() async {
    final first = await fetchPage(page: 0, limit: 1, filter: notFinishedFilter);
    if (first == null) return (outcome: SurpriseOutcome.failed, item: null);
    final total = (first['total'] as num?)?.toInt() ?? 0;
    if (total <= 0) return (outcome: SurpriseOutcome.noneLeft, item: null);

    final tried = <int>{};
    var failures = 0;
    for (
      var attempt = 0;
      attempt < maxAttempts && tried.length < total;
      attempt++
    ) {
      var index = _random.nextInt(total);
      while (tried.contains(index)) {
        index = (index + 1) % total;
      }
      tried.add(index);
      final page = index == 0
          ? first
          : await fetchPage(page: index, limit: 1, filter: notFinishedFilter);
      if (page == null) {
        failures++;
        continue;
      }
      final item = _firstBook(page);
      if (item != null) return (outcome: SurpriseOutcome.found, item: item);
    }
    return (
      outcome: failures == tried.length
          ? SurpriseOutcome.failed
          : SurpriseOutcome.noneLeft,
      item: null,
    );
  }

  Map<String, dynamic>? _firstBook(Map<String, dynamic> page) {
    final results = page['results'];
    if (results is! List || results.isEmpty) return null;
    final item = results.first;
    if (item is! Map<String, dynamic>) return null;
    final id = item['id'];
    if (id is! String || id.isEmpty) return null;
    if (item['mediaType'] == 'podcast') return null;
    final progress = item['userMediaProgress'];
    if (progress is Map && progress['isFinished'] == true) return null;
    if (isFinished(id)) return null;
    return item;
  }
}
