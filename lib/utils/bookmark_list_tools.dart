// Absorb Plus: search, sort/group and Markdown export for the All bookmarks
// screen (and a single book's bookmark list). Pure functions only, so the
// rules are unit-tested without widgets, prefs or a server.
import '../services/bookmark_service.dart';
import 'fuzzy_search.dart';

/// What the All bookmarks list is grouped and ordered by.
enum BookmarkView {
  /// One group per book, newest bookmark first (the original behaviour).
  byBook,

  /// Every bookmark in the order it was made, newest first, across books.
  newest,

  /// One group per book, bookmarks in book order.
  position;

  /// The value saved in prefs.
  String get prefValue => name;

  /// Reads a saved value. With nothing saved yet, the old sort toggle
  /// ('newest' / 'position' / 'position_desc') picks the closest view, so the
  /// screen opens the way it did before the menu existed.
  static BookmarkView fromPref(String? saved, {String? legacySort}) {
    for (final v in values) {
      if (v.name == saved) return v;
    }
    if (legacySort != null && legacySort.startsWith('position')) {
      return position;
    }
    return byBook;
  }
}

/// What the list knows about a book (or podcast episode) for search and
/// export. [subtitle] is a podcast episode's show name.
typedef BookmarkBookInfo = ({String? title, String? author, String? subtitle});

/// One block of the list: a book's bookmarks, in display order.
typedef BookmarkRun = ({String itemId, List<Bookmark> bookmarks});

/// Keeps the bookmarks matching every word of [query] in the book's title,
/// show name, author or the bookmark's own title or note. Case, accents and
/// punctuation are ignored. A word matching the book keeps all of its
/// bookmarks; books with no match drop out. An empty query returns [all].
Map<String, List<Bookmark>> filterBookmarks(
  Map<String, List<Bookmark>> all,
  String query,
  BookmarkBookInfo Function(String itemId) bookInfo,
) {
  final words = tokenize(normalizeForSearch(query));
  if (words.isEmpty) return all;
  final out = <String, List<Bookmark>>{};
  for (final entry in all.entries) {
    final info = bookInfo(entry.key);
    final book = normalizeForSearch(
      '${info.title ?? ''} ${info.subtitle ?? ''} ${info.author ?? ''}',
    );
    final hits = <Bookmark>[];
    for (final b in entry.value) {
      final text = '$book ${normalizeForSearch('${b.title} ${b.note ?? ''}')}';
      if (words.every(text.contains)) hits.add(b);
    }
    if (hits.isNotEmpty) out[entry.key] = hits;
  }
  return out;
}

/// How many bookmarks [groups] holds in all.
int countBookmarks(Map<String, List<Bookmark>> groups) =>
    groups.values.fold(0, (sum, list) => sum + list.length);

DateTime _latest(List<Bookmark> list) =>
    list.map((b) => b.created).reduce((a, b) => a.isAfter(b) ? a : b);

/// Orders [groups] for [view]. Grouped views put the book with the most
/// recent bookmark first. The newest view lists every bookmark newest first
/// and starts a new block whenever the book changes, so each block still
/// shows its book's cover and title.
List<BookmarkRun> arrangeBookmarks(
  Map<String, List<Bookmark>> groups,
  BookmarkView view,
) {
  final nonEmpty = groups.entries.where((e) => e.value.isNotEmpty);
  if (view == BookmarkView.newest) {
    final flat = [
      for (final e in nonEmpty)
        for (final b in e.value) (itemId: e.key, bookmark: b),
    ]..sort((a, b) => b.bookmark.created.compareTo(a.bookmark.created));
    final runs = <BookmarkRun>[];
    for (final f in flat) {
      if (runs.isNotEmpty && runs.last.itemId == f.itemId) {
        runs.last.bookmarks.add(f.bookmark);
      } else {
        runs.add((itemId: f.itemId, bookmarks: [f.bookmark]));
      }
    }
    return runs;
  }
  final books = nonEmpty.toList()
    ..sort((a, b) => _latest(b.value).compareTo(_latest(a.value)));
  return [
    for (final e in books)
      (
        itemId: e.key,
        bookmarks: [...e.value]
          ..sort(
            view == BookmarkView.position
                ? (a, b) => a.positionSeconds.compareTo(b.positionSeconds)
                : (a, b) => b.created.compareTo(a.created),
          ),
      ),
  ];
}

/// A position as HH:MM:SS, always with hours, so exported lines line up and
/// books longer than 10 (or 100) hours still read right. Raw book time; the
/// speed-adjusted display setting does not apply to exports.
String formatBookmarkTimestamp(double seconds) {
  final total = seconds.isFinite && seconds > 0 ? seconds.floor() : 0;
  final h = total ~/ 3600;
  final m = (total % 3600) ~/ 60;
  final s = total % 60;
  String two(int v) => v.toString().padLeft(2, '0');
  return '${two(h)}:${two(m)}:${two(s)}';
}

final RegExp _mdSpecial = RegExp(r'([\\`*_\[\]<>|#])');
final RegExp _whitespace = RegExp(r'\s+');

/// User text made safe for one Markdown line: line breaks fold into spaces
/// and characters Markdown would act on are backslash-escaped.
String escapeMarkdownLine(String text) => text
    .replaceAll(_whitespace, ' ')
    .trim()
    .replaceAllMapped(_mdSpecial, (m) => '\\${m[1]}');

/// The text after a bookmark's timestamp: "title — note", or whichever of
/// the two is there.
String _bookmarkText(Bookmark b) {
  final title = escapeMarkdownLine(b.title);
  final note = escapeMarkdownLine(b.note ?? '');
  if (title.isEmpty) return note;
  if (note.isEmpty) return title;
  return '$title — $note';
}

/// Bookmarks as a Markdown document: an optional [heading] (`# heading`),
/// then per book a `## title` heading, its author in italics when known, and
/// one `- [HH:MM:SS] title — note` line per bookmark in book order. Books are
/// listed alphabetically; [unknownTitle] names a book whose title is unknown.
String bookmarksToMarkdown(
  Map<String, List<Bookmark>> groups,
  BookmarkBookInfo Function(String itemId) bookInfo, {
  String? heading,
  required String unknownTitle,
}) {
  final books = [
    for (final e in groups.entries)
      if (e.value.isNotEmpty)
        (key: e.key, info: bookInfo(e.key), list: e.value),
  ];
  String titleOf(BookmarkBookInfo info) =>
      (info.title?.trim().isNotEmpty ?? false)
      ? info.title!.trim()
      : unknownTitle;
  books.sort((a, b) {
    final byTitle = normalizeForSearch(
      titleOf(a.info),
    ).compareTo(normalizeForSearch(titleOf(b.info)));
    return byTitle != 0 ? byTitle : a.key.compareTo(b.key);
  });

  final out = StringBuffer();
  if (heading != null && heading.trim().isNotEmpty) {
    out.writeln('# ${escapeMarkdownLine(heading)}');
    out.writeln();
  }
  for (final book in books) {
    out.writeln('## ${escapeMarkdownLine(titleOf(book.info))}');
    final byLine = [book.info.subtitle, book.info.author]
        .map((s) => s?.trim() ?? '')
        .where((s) => s.isNotEmpty)
        .toSet()
        .join(' · ');
    if (byLine.isNotEmpty) out.writeln('*${escapeMarkdownLine(byLine)}*');
    out.writeln();
    final sorted = [...book.list]
      ..sort((a, b) => a.positionSeconds.compareTo(b.positionSeconds));
    for (final b in sorted) {
      final text = _bookmarkText(b);
      final stamp = '[${formatBookmarkTimestamp(b.positionSeconds)}]';
      out.writeln(text.isEmpty ? '- $stamp' : '- $stamp $text');
    }
    out.writeln();
  }
  return out.toString().trimRight().isEmpty
      ? ''
      : '${out.toString().trimRight()}\n';
}

/// A file name for an export: "<name> bookmarks.md", with characters file
/// systems reject dropped.
String bookmarksExportFileName(String? bookTitle) {
  final safe = (bookTitle ?? '')
      .replaceAll(RegExp(r'[<>:"/\\|?*\x00-\x1F]'), '')
      .replaceAll(_whitespace, ' ')
      .trim();
  final base = safe.length > 80 ? safe.substring(0, 80).trim() : safe;
  return base.isEmpty ? 'Absorb bookmarks.md' : '$base bookmarks.md';
}
