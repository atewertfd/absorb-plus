// Built-in Tailscale (fork): tells Android's CoverContentProvider how to reach
// the server through the embedded node.
//
// The provider (android/.../CoverContentProvider.kt) fetches covers for
// Android Auto and the media notification itself, from `flutter.server_url`,
// so it would bypass the tunnel. Dart writes the routed base URL beside the
// server address it belongs to; the provider uses it only while that address
// is still `server_url`, and goes direct otherwise, exactly as with
// Tailscale off.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/fork_platform.dart';
import 'tailscale_routing.dart';
import 'tailscale_service.dart';

class TailscaleCoverRoute {
  TailscaleCoverRoute._();

  /// SharedPreferences keys (the provider reads them with "flutter." in front).
  static const prefFrom = 'fork_tailscale_cover_from';
  static const prefTo = 'fork_tailscale_cover_to';

  /// The base URL the provider should use for [serverUrl], or null when the
  /// server is reached directly.
  static String? routedBase(TailscaleRouting routing, String? serverUrl) {
    final clean = _clean(serverUrl);
    if (clean.isEmpty) return null;
    final routed = routing.mediaUrl(clean);
    if (routed == clean) return null;
    return _clean(routed);
  }

  static String _clean(String? url) =>
      (url ?? '').trim().replaceFirst(RegExp(r'/+$'), '');

  static bool _listening = false;
  static DateTime? _lastSync;
  static const _minGap = Duration(seconds: 1);

  /// Brings the stored route up to date with the current server and node.
  /// Cheap when nothing changed; does nothing off Android unless [force]d
  /// (tests, and the node's own change notifications).
  static Future<void> sync({
    TailscaleRouting? routing, // tests; defaults to the live node
    SharedPreferences? prefs,
    bool force = false,
  }) async {
    if (!force && !ForkPlatform.isAndroid) return;
    if (!_listening && routing == null) {
      _listening = true;
      TailscaleService.instance.addListener(() => unawaited(sync(force: true)));
    }
    // Browse lists build a cover URI per row: one check a second is plenty.
    final now = DateTime.now();
    final last = _lastSync;
    if (!force && last != null && now.difference(last) < _minGap) return;
    _lastSync = now;
    try {
      final p = prefs ?? await SharedPreferences.getInstance();
      final server = _clean(p.getString('server_url'));
      final to =
          routedBase(routing ?? TailscaleService.instance.routing, server);
      // The provider trusts [prefTo] only while [prefFrom] matches the
      // server, so [prefFrom] goes first on removal and last on writing.
      if (to == null) {
        if (p.containsKey(prefFrom)) await p.remove(prefFrom);
        if (p.containsKey(prefTo)) await p.remove(prefTo);
        return;
      }
      if (p.getString(prefTo) != to) {
        if (p.containsKey(prefFrom)) await p.remove(prefFrom);
        await p.setString(prefTo, to);
      }
      if (p.getString(prefFrom) != server) await p.setString(prefFrom, server);
    } catch (e) {
      debugPrint('[Tailscale] cover route sync failed: $e');
    }
  }
}
