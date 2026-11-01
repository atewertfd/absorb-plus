import 'dart:convert';

import 'package:absorb/services/item_listening_scan.dart';
import 'package:absorb/utils/json_off_thread.dart';
import 'package:flutter_test/flutter_test.dart';

/// A fake server holding [sessions] newest first, paged like ABS.
class _FakeSessions {
  final List<Map<String, dynamic>> sessions;
  final List<(int, int)> requests = [];
  _FakeSessions(this.sessions);

  Future<Map<String, dynamic>?> call(int page, int perPage) async {
    requests.add((page, perPage));
    final start = page * perPage;
    final slice = start >= sessions.length
        ? <Map<String, dynamic>>[]
        : sessions.sublist(start, (start + perPage).clamp(0, sessions.length));
    return {
      'total': sessions.length,
      'numPages': (sessions.length / perPage).ceil(),
      'page': page,
      'itemsPerPage': perPage,
      'sessions': slice,
    };
  }
}

List<Map<String, dynamic>> _sessions(int count,
    {String Function(int i)? item, int newest = 1000000000}) {
  return [
    for (var i = 0; i < count; i++)
      {
        'libraryItemId': item?.call(i) ?? 'book',
        'timeListening': 10,
        'updatedAt': newest - i * 1000,
      },
  ];
}

void main() {
  group('sumItemListeningSeconds', () {
    test('asks for pages of 100 and sums only the item', () async {
      final fake = _FakeSessions(
          _sessions(250, item: (i) => i.isEven ? 'book' : 'other'));
      final total = await sumItemListeningSeconds(fetchPage: fake.call, itemId: 'book');
      expect(total, 125 * 10);
      expect(fake.requests, [(0, 100), (1, 100), (2, 100)]);
    });

    test('stops at the last page without an extra empty request', () async {
      final fake = _FakeSessions(_sessions(200));
      await sumItemListeningSeconds(fetchPage: fake.call, itemId: 'book');
      expect(fake.requests.length, 2);
    });

    test('stops once a page reaches back before the item was started', () async {
      // 1000 sessions, one second apart; the item started 150 s before the newest.
      final fake = _FakeSessions(_sessions(1000));
      final total = await sumItemListeningSeconds(
        fetchPage: fake.call,
        itemId: 'book',
        notBefore: 1000000000 - 150 * 1000,
      );
      expect(fake.requests.length, 2);
      expect(total, 200 * 10);
    });

    test('keeps the old 1000-session cap', () async {
      final fake = _FakeSessions(_sessions(1500));
      final total = await sumItemListeningSeconds(fetchPage: fake.call, itemId: 'book');
      expect(fake.requests.length, 10);
      expect(total, 1000 * 10);
    });

    test('matches the episode when one is given', () async {
      final fake = _FakeSessions([
        {'libraryItemId': 'pod', 'episodeId': 'e1', 'timeListening': 5},
        {'libraryItemId': 'pod', 'episodeId': 'e2', 'timeListening': 7},
      ]);
      final total = await sumItemListeningSeconds(
          fetchPage: fake.call, itemId: 'pod', episodeId: 'e2');
      expect(total, 7);
    });

    test('a failed first page gives zero', () async {
      var calls = 0;
      final total = await sumItemListeningSeconds(
        fetchPage: (_, _) async {
          calls++;
          return null;
        },
        itemId: 'book',
      );
      expect(total, 0);
      expect(calls, 1);
    });
  });

  group('decodeJsonOffThread', () {
    test('decodes small and large bodies the same way', () async {
      final small = jsonEncode({'a': 1});
      expect(await decodeJsonOffThread(small), {'a': 1});
      final big = jsonEncode({'sessions': _sessions(50)});
      final decoded = await decodeJsonOffThread(big, threshold: 10) as Map;
      expect((decoded['sessions'] as List).length, 50);
    });
  });
}
