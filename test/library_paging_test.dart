import 'package:absorb/screens/library_paging.dart';
import 'package:flutter_test/flutter_test.dart';

// BUG-008: the grid picked its page size from the live window width, so a
// window widened after a 20-item first page asked for page 0 again.
void main() {
  List<int> walk({required bool wide, int pages = 6}) {
    final server = List.generate(1000, (i) => i);
    final items = <int>[];
    for (var i = 0; i < pages; i++) {
      final r = libraryGridPageRequest(items.length, wide: wide);
      items.addAll(server.skip(r.page * r.limit).take(r.limit));
    }
    return items;
  }

  test('a listing that started narrow never repeats or skips an item', () {
    final items = walk(wide: false);
    expect(items, List.generate(items.length, (i) => i));
  });

  test('a listing that started wide never repeats or skips an item', () {
    final items = walk(wide: true);
    expect(items, List.generate(items.length, (i) => i));
  });

  test('every request offset equals the count already loaded', () {
    for (final wide in [false, true]) {
      var loaded = 0;
      for (var i = 0; i < 8; i++) {
        final r = libraryGridPageRequest(loaded, wide: wide);
        expect(r.page * r.limit, loaded, reason: 'wide=$wide loaded=$loaded');
        loaded += r.limit;
      }
    }
  });
}
