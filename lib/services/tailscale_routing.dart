// Built-in Tailscale (fork prototype): which requests go through the embedded
// node, and how. Pure logic, no platform code, so it's unit tested directly.
import 'dart:convert';

/// The embedded node's state, parsed from the native status JSON.
class TailnetStatus {
  const TailnetStatus({
    required this.state,
    this.authUrl = '',
    this.ips = const [],
    this.dnsName = '',
    this.magicDnsSuffix = '',
    this.user = '',
    this.tailnet = '',
    this.proxyPort = 0,
    this.error = '',
  });

  static const off = TailnetStatus(state: 'Off');

  /// Tailscale's backend state ("Running", "NeedsLogin", "NeedsMachineAuth",
  /// "Starting", "Stopped", "NoState") plus this library's "Off" and "Error".
  final String state;
  final String authUrl;
  final List<String> ips;
  final String dnsName;
  final String magicDnsSuffix;
  final String user;
  final String tailnet;
  final int proxyPort;
  final String error;

  bool get isRunning => state == 'Running';
  bool get needsLogin => state == 'NeedsLogin';
  bool get needsApproval => state == 'NeedsMachineAuth';
  bool get isOff => state == 'Off';
  bool get hasError => state == 'Error';

  /// The node's IPv4 tailnet address when it has one, else its first.
  String get primaryIp => ips.firstWhere(
        (ip) => !ip.contains(':'),
        orElse: () => ips.isEmpty ? '' : ips.first,
      );

  static TailnetStatus parse(String json) {
    try {
      final m = jsonDecode(json);
      if (m is! Map<String, dynamic>) return off;
      return TailnetStatus(
        state: m['state'] as String? ?? 'Off',
        authUrl: m['authUrl'] as String? ?? '',
        ips: (m['ips'] as List?)?.whereType<String>().toList() ?? const [],
        dnsName: m['dnsName'] as String? ?? '',
        magicDnsSuffix: m['magicDnsSuffix'] as String? ?? '',
        user: m['user'] as String? ?? '',
        tailnet: m['tailnet'] as String? ?? '',
        proxyPort: (m['proxyPort'] as num?)?.toInt() ?? 0,
        error: m['error'] as String? ?? '',
      );
    } catch (_) {
      return const TailnetStatus(state: 'Error', error: 'Bad status from the Tailscale library');
    }
  }

  @override
  bool operator ==(Object other) =>
      other is TailnetStatus &&
      other.state == state &&
      other.authUrl == authUrl &&
      other.ips.join(',') == ips.join(',') &&
      other.dnsName == dnsName &&
      other.magicDnsSuffix == magicDnsSuffix &&
      other.user == user &&
      other.tailnet == tailnet &&
      other.proxyPort == proxyPort &&
      other.error == error;

  @override
  int get hashCode => Object.hash(state, authUrl, ips.join(','), dnsName,
      magicDnsSuffix, user, tailnet, proxyPort, error);
}

/// Decides whether a host lives on the tailnet and builds the proxy setting
/// and media URLs for it. Immutable: the service swaps in a new one when the
/// node's port, the setting or the host list changes.
class TailscaleRouting {
  const TailscaleRouting({
    required this.enabled,
    this.proxyPort = 0,
    this.secret = '',
    this.magicDnsSuffix = '',
    this.extraHosts = const {},
  });

  static const disabled = TailscaleRouting(enabled: false);

  final bool enabled;
  final int proxyPort;
  final String secret;
  final String magicDnsSuffix;

  /// Host names the user marked as tailnet hosts (lower case).
  final Set<String> extraHosts;

  /// True while requests are actually being routed.
  bool get active => enabled && proxyPort > 0 && secret.isNotEmpty;

  /// Whether [host] is reached through the tailnet: Tailscale's address
  /// ranges (100.64.0.0/10, fd7a:115c:a1e0::/48), `*.ts.net`, the tailnet's
  /// MagicDNS suffix, or a host the user listed.
  bool isTailnetHost(String host) {
    var h = host.trim().toLowerCase();
    if (h.startsWith('[') && h.endsWith(']')) h = h.substring(1, h.length - 1);
    if (h.endsWith('.')) h = h.substring(0, h.length - 1);
    if (h.isEmpty) return false;
    if (extraHosts.contains(h)) return true;
    if (h == 'ts.net' || h.endsWith('.ts.net')) return true;
    final suffix = magicDnsSuffix.toLowerCase();
    if (suffix.isNotEmpty && h.endsWith('.$suffix')) return true;
    if (_isCgnatV4(h)) return true;
    return h.startsWith('fd7a:115c:a1e0:');
  }

  static bool _isCgnatV4(String h) {
    final parts = h.split('.');
    if (parts.length != 4) return false;
    final octets = parts.map(int.tryParse).toList();
    if (octets.any((o) => o == null || o < 0 || o > 255)) return false;
    // 100.64.0.0/10 = 100.64.0.0 - 100.127.255.255
    return octets[0] == 100 && octets[1]! >= 64 && octets[1]! <= 127;
  }

  /// Whether [url] (a server address) goes through the tailnet.
  bool routesUrl(String url) {
    final uri = Uri.tryParse(url.trim());
    if (uri == null || !uri.hasScheme || uri.host.isEmpty) return false;
    return isTailnetHost(uri.host);
  }

  /// For HttpClient.findProxy: Dart's own HTTP (API calls, covers, the live
  /// socket) reaches tailnet hosts through the embedded node's proxy; every
  /// other host connects directly, as it does with the setting off.
  String findProxy(Uri uri) {
    if (!active || !isTailnetHost(uri.host)) return 'DIRECT';
    return 'PROXY absorb:$secret@127.0.0.1:$proxyPort';
  }

  /// Media players (ExoPlayer, libmpv) and native downloaders can't use a
  /// proxy, so their URLs for tailnet hosts are rewritten to the node's
  /// loopback reverse proxy. Anything else comes back unchanged.
  String mediaUrl(String url) {
    if (!active) return url;
    final uri = Uri.tryParse(url);
    if (uri == null ||
        (uri.scheme != 'http' && uri.scheme != 'https') ||
        uri.host.isEmpty ||
        !isTailnetHost(uri.host)) {
      return url;
    }
    final host = uri.host.contains(':') ? '[${uri.host}]' : uri.host;
    final hostPort = '$host:${uri.port}';
    // Uri keeps path and query percent-encoded, so they pass through as sent.
    final path = (uri.path.isEmpty ? '/' : uri.path) +
        (uri.hasQuery ? '?${uri.query}' : '');
    return 'http://127.0.0.1:$proxyPort/_ts/$secret/${uri.scheme}/$hostPort$path';
  }
}

/// A short Tailscale device name for this install, like "absorb-windows" or
/// "absorb-desktop-1a2b".
String tailscaleHostname(String platform, String localHostname) {
  final cleaned = localHostname
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9-]+'), '-')
      .replaceAll(RegExp(r'-+'), '-')
      .replaceAll(RegExp(r'^-|-$'), '');
  final base = (cleaned.isEmpty || cleaned == 'localhost') ? platform : cleaned;
  final name = 'absorb-$base';
  return name.length > 63 ? name.substring(0, 63) : name;
}

/// Parses the "other tailnet hosts" field: commas, spaces or new lines.
Set<String> parseTailnetHosts(String text) => text
    .split(RegExp(r'[\s,;]+'))
    .map((h) => h.trim().toLowerCase())
    .map((h) => h.replaceAll(RegExp(r'^https?://'), '').split('/').first)
    .map((h) => h.contains(']') ? h : h.split(':').first)
    .where((h) => h.isNotEmpty)
    .toSet();
