// Absorb Plus: the library grid's page requests (BUG-008, IMP-003).
//
// Pages grow (20 or 40 first, then 40, then 80) and the server is asked for
// `page * limit`, so every size must divide the count already loaded. That
// only holds when the first page's width decision sticks for the whole
// listing: the caller passes the `wide` it used for page 0.

/// The next request after [loaded] items, for a listing that started [wide].
({int page, int limit}) libraryGridPageRequest(
  int loaded, {
  required bool wide,
  int maxLimit = 80,
}) {
  final limit = loaded < 40 ? (wide ? 40 : 20) : (loaded < 80 ? 40 : maxLimit);
  return (page: loaded ~/ limit, limit: limit);
}
