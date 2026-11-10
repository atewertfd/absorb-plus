import 'package:absorb/services/authenticated_get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

// BUG-001: the ebook downloads followed redirects to any host with the
// Bearer token attached and resolved every hop against the first URL.
void main() {
  test('a redirect to another host gets no sign-in headers', () async {
    final seen = <String, Map<String, String>>{};
    final client = MockClient((req) async {
      seen[req.url.toString()] = req.headers;
      if (req.url.host == 'abs.example') {
        return http.Response('', 302,
            headers: {'location': 'https://auth.example/login?token=t'});
      }
      return http.Response('book', 200);
    });
    final res = await authenticatedGet(
      client,
      Uri.parse('https://abs.example/api/items/1/file/2?token=t'),
      {'Authorization': 'Bearer secret', 'CF-Access-Client-Secret': 's'},
    );
    expect(res.statusCode, 200);
    final off = seen.entries.firstWhere((e) => e.key.contains('auth.example'));
    expect(off.key, isNot(contains('token=')));
    expect(off.value.containsKey('Authorization'), isFalse);
    expect(off.value.containsKey('CF-Access-Client-Secret'), isFalse);
  });

  test('same-origin hops keep the headers and resolve against the last hop',
      () async {
    final seen = <String, String?>{};
    final client = MockClient((req) async {
      seen[req.url.path] = req.headers['Authorization'];
      switch (req.url.path) {
        case '/a/start':
          return http.Response('', 302, headers: {'location': '/b/next'});
        case '/b/next':
          return http.Response('', 307, headers: {'location': 'final'});
      }
      return http.Response('ok', 200);
    });
    final res = await authenticatedGet(
        client, Uri.parse('https://abs.example/a/start'), {'Authorization': 'Bearer x'});
    expect(res.statusCode, 200);
    expect(seen.keys, ['/a/start', '/b/next', '/b/final']);
    expect(seen.values.every((v) => v == 'Bearer x'), isTrue);
  });
}
