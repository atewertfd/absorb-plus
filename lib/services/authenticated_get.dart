// Absorb Plus: one way to GET a server file with the sign-in headers while
// following redirects by hand (IMP-001, BUG-001).
//
// Redirects are followed manually so the sign-in headers can come along on
// the server's own origin. A redirect to another host (a CDN, an auth portal,
// a misconfigured proxy) gets neither the headers nor a `token` query
// parameter, and every hop is resolved against the hop before it.
import 'package:http/http.dart' as http;

const _redirectCodes = {301, 302, 303, 307, 308};

/// Whether [b] is on the same scheme, host and port as [a].
bool sameOrigin(Uri a, Uri b) =>
    a.scheme.toLowerCase() == b.scheme.toLowerCase() &&
    a.host.toLowerCase() == b.host.toLowerCase() &&
    a.port == b.port;

/// Where a redirect from [current] to [location] goes. Off the server
/// [original] names, any `token` query parameter is dropped.
Uri redirectTarget(Uri original, Uri current, String location) {
  final next = current.resolve(location);
  if (sameOrigin(original, next) ||
      !next.queryParametersAll.containsKey('token')) {
    return next;
  }
  final query = Map.of(next.queryParametersAll)..remove('token');
  return Uri(
    scheme: next.scheme,
    userInfo: next.userInfo,
    host: next.host,
    port: next.hasPort ? next.port : null,
    path: next.path,
    queryParameters: query.isEmpty ? null : query,
    fragment: next.hasFragment ? next.fragment : null,
  );
}

/// GETs [url] with [headers] through up to [maxRedirects] redirects. The
/// headers only go to [url]'s own origin. Returns the last response, which
/// may still be a redirect when the hops ran out or one had no Location.
Future<http.StreamedResponse> authenticatedGet(
  http.Client client,
  Uri url,
  Map<String, String> headers, {
  int maxRedirects = 5,
}) async {
  Future<http.StreamedResponse> send(Uri target, Map<String, String> h) {
    final request = http.Request('GET', target)
      ..followRedirects = false
      ..headers.addAll(h);
    return client.send(request);
  }

  var response = await send(url, headers);
  var target = url;
  for (var i = 0;
      i < maxRedirects && _redirectCodes.contains(response.statusCode);
      i++) {
    final location = response.headers['location'];
    if (location == null) break;
    // The redirect's body is thrown away; only the next hop matters.
    await response.stream.drain<void>().catchError((Object _) {});
    target = redirectTarget(url, target, location);
    response = await send(target, sameOrigin(url, target) ? headers : const {});
  }
  return response;
}
