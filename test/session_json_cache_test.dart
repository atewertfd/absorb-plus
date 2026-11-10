import 'dart:convert';

import 'package:absorb/utils/session_json.dart';
import 'package:flutter_test/flutter_test.dart';

/// A download's saved session JSON is decoded once per distinct string, and
/// gives the same answers the old `jsonDecode(raw) as Map` did.
void main() {
  late int decodes;
  late SessionJsonCache cache;
  setUp(() {
    decodes = 0;
    cache = SessionJsonCache(
      capacity: 3,
      decode: (s) {
        decodes++;
        return jsonDecode(s);
      },
    );
  });

  const raw = '{"duration":12.5,"chapters":[{"id":0}],"libraryItem":{"id":"li_1"}}';

  test('the same string is decoded once', () {
    final a = cache[raw];
    final b = cache[raw];
    // A different String instance with the same text hits too.
    final c = cache[String.fromCharCodes(raw.codeUnits)];
    expect(decodes, 1);
    expect(a, jsonDecode(raw));
    expect(b, jsonDecode(raw));
    expect(c, jsonDecode(raw));
  });

  test('each caller gets its own copy, nested values too', () {
    final a = cache[raw]!;
    a['duration'] = 0;
    (a['chapters'] as List).add({'id': 9});
    ((a['chapters'] as List).first as Map)['id'] = 7;
    (a['libraryItem'] as Map)['id'] = 'changed';
    final b = cache[raw]!;
    expect(b, jsonDecode(raw), reason: 'changes to one copy must not reach the next');
    expect(identical(a['chapters'], b['chapters']), isFalse);
    expect(b['chapters'], isA<List<dynamic>>());
    expect(b['libraryItem'], isA<Map<String, dynamic>>());
    expect(decodes, 1);
  });

  test('clear forgets everything', () {
    cache[raw];
    cache.clear();
    cache[raw];
    expect(decodes, 2);
  });

  test('a changed string is decoded again', () {
    cache[raw];
    final changed = cache[raw.replaceFirst('12.5', '13')];
    expect(decodes, 2);
    expect(changed!['duration'], 13);
  });

  test('null, invalid JSON and non-objects give null, and are remembered', () {
    expect(cache[null], isNull);
    expect(cache[''], isNull);
    expect(cache['{oops'], isNull);
    expect(cache['[1,2]'], isNull);
    expect(cache['{oops'], isNull);
    expect(decodes, 3, reason: 'null is not decoded; bad strings once each');
  });

  test('keeps only the most recent strings', () {
    for (var i = 0; i < 4; i++) {
      cache['{"n":$i}'];
    }
    cache['{"n":0}']; // fell out (capacity 3)
    cache['{"n":3}']; // still held
    expect(decodes, 5);
  });

  test('the app-wide cache decodes like jsonDecode', () {
    expect(sessionJsonCache[raw], jsonDecode(raw));
    expect(sessionJsonCache['{}'], <String, dynamic>{});
  });
}
