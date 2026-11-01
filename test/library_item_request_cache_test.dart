import 'dart:async';
import 'dart:convert';

import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/library_item_request_cache.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  const server = 'https://audiobookshelf.example';

  setUp(() => LibraryItemRequestCache.instance.clear());

  /// A fake server counting item GETs.
  ({MockClient client, List<String> auths}) fakeServer() {
    final auths = <String>[];
    final client = MockClient((request) async {
      if (request.method == 'GET' && request.url.path == '/api/items/li_1') {
        auths.add(request.headers['authorization'] ?? '');
        return http.Response(
          jsonEncode({'id': 'li_1', 'by': request.headers['authorization']}),
          200,
        );
      }
      return http.Response('{}', 200);
    });
    return (client: client, auths: auths);
  }

  ApiService api(http.Client client, String token) => ApiService(
        baseUrl: server,
        token: token,
        isLegacyToken: true,
        httpClient: client,
      );

  test('concurrent and repeated calls share one request', () async {
    final s = fakeServer();
    final a = api(s.client, 'token-a');
    final results = await Future.wait([
      a.getLibraryItem('li_1'),
      a.getLibraryItem('li_1'),
      api(s.client, 'token-a').getLibraryItem('li_1'),
    ]);
    expect(s.auths, hasLength(1));
    expect(results.every((r) => r?['id'] == 'li_1'), isTrue);
    // Each caller gets its own map.
    results[0]!['id'] = 'changed';
    expect(results[1]!['id'], 'li_1');
    expect((await a.getLibraryItem('li_1'))?['id'], 'li_1');
    expect(s.auths, hasLength(1), reason: 'answered from the cache');
  });

  test('another account never gets the cached answer', () async {
    final s = fakeServer();
    await api(s.client, 'token-a').getLibraryItem('li_1');
    final other = await api(s.client, 'token-b').getLibraryItem('li_1');
    expect(s.auths, ['Bearer token-a', 'Bearer token-b']);
    expect(other?['by'], 'Bearer token-b');
  });

  test('fresh, a write request and forgetItem all bypass the cache', () async {
    final s = fakeServer();
    final a = api(s.client, 'token-a');
    await a.getLibraryItem('li_1');
    await a.getLibraryItem('li_1', fresh: true);
    expect(s.auths, hasLength(2));

    await a.updateProgressFinishedDate('li_1', 1);
    await a.getLibraryItem('li_1');
    expect(s.auths, hasLength(3), reason: 'a PATCH clears the cache');

    LibraryItemRequestCache.instance.forgetItem('li_1');
    await a.getLibraryItem('li_1');
    expect(s.auths, hasLength(4));
  });

  group('LibraryItemRequestCache', () {
    LibraryItemCacheKey key(String id) =>
        (server: server, token: 't', itemId: id, query: '');

    test('expires after the ttl', () async {
      var now = DateTime(2026, 10, 31);
      final cache = LibraryItemRequestCache(now: () => now);
      var loads = 0;
      Future<String?> load() async => '${++loads}';
      expect(await cache.fetch(key('a'), load), '1');
      now = now.add(const Duration(seconds: 29));
      expect(await cache.fetch(key('a'), load), '1');
      now = now.add(const Duration(seconds: 2));
      expect(await cache.fetch(key('a'), load), '2');
    });

    test('an error answer is not cached', () async {
      final cache = LibraryItemRequestCache();
      var loads = 0;
      Future<String?> load() async {
        loads++;
        return null;
      }

      await cache.fetch(key('a'), load);
      await cache.fetch(key('a'), load);
      expect(loads, 2);
    });

    test('an answer in flight across a clear is not stored', () async {
      final cache = LibraryItemRequestCache();
      final gate = Completer<String?>();
      final first = cache.fetch(key('a'), () => gate.future);
      cache.clear();
      gate.complete('old');
      expect(await first, 'old', reason: 'its own caller still gets it');
      expect(cache.length, 0);
      expect(await cache.fetch(key('a'), () async => 'new'), 'new');
    });

    test('keeps at most maxEntries answers', () async {
      final cache = LibraryItemRequestCache(maxEntries: 2);
      for (final id in ['a', 'b', 'c']) {
        await cache.fetch(key(id), () async => id);
      }
      expect(cache.length, 2);
    });
  });
}
