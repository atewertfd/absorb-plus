import 'package:absorb/utils/lru_cache.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('drops the least recently used entry past capacity', () {
    final cache = LruCache<String, int>(2);
    cache['a'] = 1;
    cache['b'] = 2;
    expect(cache['a'], 1); // a is now most recent
    cache['c'] = 3; // evicts b
    expect(cache.containsKey('b'), isFalse);
    expect(cache['a'], 1);
    expect(cache['c'], 3);
    expect(cache.length, 2);
  });

  test('overwriting refreshes recency without growing', () {
    final cache = LruCache<String, int>(2);
    cache['a'] = 1;
    cache['b'] = 2;
    cache['a'] = 10; // b is now oldest
    cache['c'] = 3;
    expect(cache.keys, ['a', 'c']);
    expect(cache['a'], 10);
  });

  test('missing keys read as null and clear empties', () {
    final cache = LruCache<String, int>(3);
    expect(cache['x'], isNull);
    cache['x'] = 1;
    cache.clear();
    expect(cache.length, 0);
  });
}
