import 'package:absorb/services/book_copy_download.dart';
import 'package:absorb/services/opml_export.dart';
import 'package:absorb/utils/safe_file_name.dart';
import 'package:flutter_test/flutter_test.dart';

// BUG-002: titles were cleaned with the ASCII-only `\w`, so non-Latin titles
// came out empty, and Save ebook cached its download under that name.
void main() {
  test('letters of any script survive', () {
    expect(safeFileName('Война и мир'), 'Война и мир');
    expect(safeFileName('三体'), '三体');
    expect(safeFileName('Ἰλιάς'), 'Ἰλιάς');
  });

  test('ASCII titles come out as before', () {
    expect(safeFileName('Dune: Part 1!'), 'Dune Part 1');
    expect(safeFileName('  a/b\\c?  '), 'abc');
    expect(safeFileName('???', fallback: 'book'), 'book');
  });

  test('two books never share a Save ebook cache file', () {
    final a = ebookExportCachePath('/tmp', 'item-a', '101', '.epub');
    final b = ebookExportCachePath('/tmp', 'item-b', '202', '.epub');
    expect(a, isNot(b));
    expect(a, '/tmp/ebook_export_item-a_101.epub');
  });

  test('export names keep non-Latin titles', () {
    expect(BookCopyDownload.suggestedFileName('Война и мир', null), 'Война и мир.zip');
    expect(OpmlExport.fileNameFor('Подкасты'), 'Подкасты.opml');
    expect(OpmlExport.fileNameFor('!!!'), 'podcasts.opml');
  });
}
