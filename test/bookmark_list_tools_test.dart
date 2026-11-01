import 'package:absorb/services/bookmark_service.dart';
import 'package:absorb/utils/bookmark_list_tools.dart';
import 'package:flutter_test/flutter_test.dart';

Bookmark _bm(
  String id,
  double pos,
  int createdMin, {
  String title = 'Bookmark',
  String? note,
}) => Bookmark(
  id: id,
  positionSeconds: pos,
  created: DateTime.utc(2026, 1, 1).add(Duration(minutes: createdMin)),
  title: title,
  note: note,
);

const _books = <String, BookmarkBookInfo>{
  'a': (title: 'Les Misérables', author: 'Victor Hugo', subtitle: null),
  'b': (title: 'The Hobbit', author: 'J.R.R. Tolkien', subtitle: null),
  'ep': (title: 'Episode 12', author: null, subtitle: 'Some Podcast'),
};

BookmarkBookInfo _info(String id) =>
    _books[id] ?? (title: null, author: null, subtitle: null);

void main() {
  group('formatBookmarkTimestamp', () {
    test('always shows two-digit hours', () {
      expect(formatBookmarkTimestamp(0), '00:00:00');
      expect(formatBookmarkTimestamp(83.9), '00:01:23');
      expect(formatBookmarkTimestamp(5025), '01:23:45');
    });

    test('books over 10 and 100 hours', () {
      expect(formatBookmarkTimestamp(10 * 3600 + 61), '10:01:01');
      expect(formatBookmarkTimestamp(37 * 3600 + 59 * 60 + 59), '37:59:59');
      expect(formatBookmarkTimestamp(123 * 3600), '123:00:00');
    });

    test('negative or invalid positions read as zero', () {
      expect(formatBookmarkTimestamp(-1), '00:00:00');
      expect(formatBookmarkTimestamp(double.nan), '00:00:00');
    });
  });

  group('filterBookmarks', () {
    final all = {
      'a': [
        _bm('1', 10, 1, title: 'Fantine', note: 'Café scene'),
        _bm('2', 20, 2, title: 'Cosette'),
      ],
      'b': [_bm('3', 30, 3, title: 'Riddles', note: 'in the dark')],
      'ep': [_bm('4', 40, 4, title: 'Ad break')],
    };

    test('empty query returns everything', () {
      expect(filterBookmarks(all, '  ', _info), same(all));
    });

    test('matches the note ignoring case and accents', () {
      final r = filterBookmarks(all, 'CAFE', _info);
      expect(r.keys, ['a']);
      expect(r['a']!.map((b) => b.id), ['1']);
    });

    test('a book title match keeps all its bookmarks', () {
      final r = filterBookmarks(all, 'miserables', _info);
      expect(r['a']!.length, 2);
      expect(r.keys, ['a']);
    });

    test('matches the author', () {
      final r = filterBookmarks(all, 'tolkien', _info);
      expect(r.keys, ['b']);
    });

    test('matches a podcast show name', () {
      expect(filterBookmarks(all, 'podcast', _info).keys, ['ep']);
    });

    test('every word must match, across book and bookmark', () {
      expect(
        filterBookmarks(all, 'hugo cosette', _info)['a']!.map((b) => b.id),
        ['2'],
      );
      expect(filterBookmarks(all, 'hugo riddles', _info), isEmpty);
    });

    test('countBookmarks sums every group', () {
      expect(countBookmarks(all), 4);
      expect(countBookmarks(const {}), 0);
    });
  });

  group('arrangeBookmarks', () {
    final groups = {
      'a': [_bm('a1', 300, 1), _bm('a2', 100, 5)],
      'b': [_bm('b1', 50, 3), _bm('b2', 10, 9)],
      'empty': <Bookmark>[],
    };

    test('by book: most recent book first, newest bookmark first', () {
      final r = arrangeBookmarks(groups, BookmarkView.byBook);
      expect(r.map((g) => g.itemId), ['b', 'a']);
      expect(r.first.bookmarks.map((b) => b.id), ['b2', 'b1']);
      expect(r.last.bookmarks.map((b) => b.id), ['a2', 'a1']);
    });

    test('by position: bookmarks in book order', () {
      final r = arrangeBookmarks(groups, BookmarkView.position);
      expect(r.map((g) => g.itemId), ['b', 'a']);
      expect(r.last.bookmarks.map((b) => b.id), ['a2', 'a1']);
      expect(r.first.bookmarks.map((b) => b.id), ['b2', 'b1']);
    });

    test('newest: one timeline split into runs per book', () {
      final r = arrangeBookmarks(groups, BookmarkView.newest);
      expect(r.map((g) => g.itemId), ['b', 'a', 'b', 'a']);
      expect(r.map((g) => g.bookmarks.single.id), ['b2', 'a2', 'b1', 'a1']);
    });

    test('newest: consecutive bookmarks of one book share a run', () {
      final r = arrangeBookmarks({
        'a': [_bm('a1', 1, 1), _bm('a2', 2, 2)],
        'b': [_bm('b1', 3, 3)],
      }, BookmarkView.newest);
      expect(r.map((g) => g.itemId), ['b', 'a']);
      expect(r.last.bookmarks.map((b) => b.id), ['a2', 'a1']);
    });

    test('does not reorder the input lists', () {
      final input = [_bm('x1', 300, 1), _bm('x2', 100, 5)];
      arrangeBookmarks({'x': input}, BookmarkView.position);
      expect(input.map((b) => b.id), ['x1', 'x2']);
    });
  });

  group('BookmarkView prefs', () {
    test('reads saved values and falls back to the old sort', () {
      expect(BookmarkView.fromPref('newest'), BookmarkView.newest);
      expect(BookmarkView.fromPref('position'), BookmarkView.position);
      expect(BookmarkView.fromPref(null), BookmarkView.byBook);
      expect(BookmarkView.fromPref('junk'), BookmarkView.byBook);
      expect(
        BookmarkView.fromPref(null, legacySort: 'position_desc'),
        BookmarkView.position,
      );
      expect(
        BookmarkView.fromPref(null, legacySort: 'newest'),
        BookmarkView.byBook,
      );
      expect(
        BookmarkView.fromPref('byBook', legacySort: 'position'),
        BookmarkView.byBook,
      );
    });
  });

  group('bookmarksToMarkdown', () {
    test('book headings, author, lines sorted by position', () {
      final md = bookmarksToMarkdown(
        {
          'b': [
            _bm('2', 7200, 1, title: 'Later', note: 'second'),
            _bm('1', 65, 2, title: 'Start', note: 'first'),
          ],
          'a': [_bm('3', 37 * 3600 + 5, 3, title: 'Deep in')],
        },
        _info,
        heading: 'All Bookmarks',
        unknownTitle: 'Unknown',
      );
      expect(
        md,
        '# All Bookmarks\n'
        '\n'
        '## Les Misérables\n'
        '*Victor Hugo*\n'
        '\n'
        '- [37:00:05] Deep in\n'
        '\n'
        '## The Hobbit\n'
        '*J.R.R. Tolkien*\n'
        '\n'
        '- [00:01:05] Start — first\n'
        '- [02:00:00] Later — second\n',
      );
    });

    test('missing notes, titles and book names', () {
      final md = bookmarksToMarkdown(
        {
          'zz': [
            _bm('1', 1, 1, title: 'Only title'),
            _bm('2', 2, 2, title: '', note: 'Only note'),
            _bm('3', 3, 3, title: '  ', note: ''),
          ],
        },
        _info,
        unknownTitle: 'Unknown',
      );
      expect(
        md,
        '## Unknown\n'
        '\n'
        '- [00:00:01] Only title\n'
        '- [00:00:02] Only note\n'
        '- [00:00:03]\n',
      );
    });

    test('escapes Markdown characters and folds line breaks', () {
      final md = bookmarksToMarkdown(
        {
          'x': [
            _bm(
              '1',
              0,
              1,
              title: '*Bold* [link](http://x) #1',
              note: 'line one\nline two | <tag> `code` _u_ back\\slash',
            ),
          ],
        },
        (_) => (title: '# Book_Name', author: null, subtitle: null),
        unknownTitle: 'Unknown',
      );
      expect(
        md,
        '## \\# Book\\_Name\n'
        '\n'
        '- [00:00:00] \\*Bold\\* \\[link\\](http://x) \\#1 — '
        'line one line two \\| \\<tag\\> \\`code\\` \\_u\\_ back\\\\slash\n',
      );
    });

    test('podcast episodes show the show name', () {
      final md = bookmarksToMarkdown(
        {
          'ep': [_bm('1', 30, 1, title: 'Ad break')],
        },
        _info,
        unknownTitle: 'Unknown',
      );
      expect(md, startsWith('## Episode 12\n*Some Podcast*\n'));
    });

    test('nothing to export is an empty document', () {
      expect(
        bookmarksToMarkdown({'a': []}, _info, unknownTitle: 'Unknown'),
        '',
      );
    });
  });

  test('bookmarksExportFileName drops characters file systems reject', () {
    expect(bookmarksExportFileName(null), 'Absorb bookmarks.md');
    expect(bookmarksExportFileName('  '), 'Absorb bookmarks.md');
    expect(
      bookmarksExportFileName('Who? What: <Why>/How*'),
      'Who What WhyHow bookmarks.md',
    );
    expect(
      bookmarksExportFileName('Les Misérables'),
      'Les Misérables bookmarks.md',
    );
    expect(
      bookmarksExportFileName('x' * 200).length,
      80 + ' bookmarks.md'.length,
    );
  });
}
