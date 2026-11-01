import 'dart:convert';

import 'package:absorb/utils/json_body.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('small bodies decode inline, large ones off thread (never on web)', () {
    expect(decodesOffThread(1024, isWeb: false), isFalse);
    expect(decodesOffThread(kOffThreadJsonBytes, isWeb: false), isTrue);
    expect(decodesOffThread(kOffThreadJsonBytes * 4, isWeb: true), isFalse);
  });

  test('decodes a small body like jsonDecode', () async {
    expect(await decodeJsonBody('{"a":[1,2]}'), {
      'a': [1, 2],
    });
  });

  test('decodes a large body on an isolate with the same shape', () async {
    final big = {
      'results': [
        for (var i = 0; i < 4000; i++)
          {'id': 'li_$i', 'title': 'Book number $i with a long-ish title'},
      ],
      'total': 4000,
    };
    final body = jsonEncode(big);
    expect(body.length, greaterThanOrEqualTo(kOffThreadJsonBytes));
    final decoded = await decodeJsonBody(body);
    expect(decoded, isA<Map<String, dynamic>>());
    expect((decoded as Map<String, dynamic>)['results'], isA<List<dynamic>>());
    expect(decoded, big);
  });

  test('bad JSON throws FormatException for small and large bodies', () async {
    await expectLater(decodeJsonBody('{oops'), throwsFormatException);
    final bad = '[${'1,' * kOffThreadJsonBytes}';
    await expectLater(decodeJsonBody(bad), throwsFormatException);
  });
}
