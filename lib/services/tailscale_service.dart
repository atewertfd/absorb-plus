// Built-in Tailscale (fork prototype, off by default).
//
// When the user turns it on, Absorb starts its own Tailscale node in-process
// (native/tailscale, tsnet with userspace networking: no system VPN, no admin
// rights) and reaches servers on the tailnet through the node's loopback
// proxy:
//   - Dart HTTP (API, covers, the live socket): HttpClient.findProxy, hooked
//     in main.dart's HttpOverrides, sends tailnet hosts to the proxy.
//   - Media players and native downloaders: ApiService.buildTrackUrl passes
//     its URLs through [mediaUrl], which rewrites tailnet ones to the proxy.
// Server addresses, accounts and tokens are never changed, so turning the
// setting off puts everything back exactly as it was.
import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/fork_platform.dart';
import 'tailscale_native.dart';
import 'tailscale_routing.dart';

class TailscaleService extends ChangeNotifier {
  TailscaleService({
    TailscaleNative? Function()? loadNative,
    Future<String> Function()? stateDir,
    String Function()? hostname,
    Future<bool> Function(Uri uri)? openExternal,
    this.fastPoll = const Duration(seconds: 1),
    this.slowPoll = const Duration(seconds: 10),
    @visibleForTesting this.controlUrl = '',
    @visibleForTesting this.authKey = '',
  })  : _loadNativeFn = loadNative ?? loadTailscaleNative,
        _stateDirFn = stateDir ?? _defaultStateDir,
        _hostnameFn = hostname ?? _defaultHostname,
        _openExternal = openExternal ?? ForkPlatform.openExternal;

  /// The app-wide instance. Tests replace it.
  static TailscaleService instance = TailscaleService();

  static const prefEnabled = 'fork_tailscale_enabled';
  static const prefHosts = 'fork_tailscale_hosts';
  static const prefDnsSuffix = 'fork_tailscale_dns_suffix';
  static const prefPort = 'fork_tailscale_port';

  /// Platforms that offer the option. Web never does.
  static bool get platformSupported =>
      ForkPlatform.isWindows || ForkPlatform.isAndroid || ForkPlatform.isLinux;

  final TailscaleNative? Function() _loadNativeFn;
  final Future<String> Function() _stateDirFn;
  final String Function() _hostnameFn;
  final Future<bool> Function(Uri uri) _openExternal;
  final Duration fastPoll;
  final Duration slowPoll;

  /// Test only: a throwaway control server (headscale) and its pre-auth key,
  /// used by test/integration/tailscale_tailnet_test.dart. The app always
  /// leaves both empty, so users sign in through Tailscale's login page.
  final String controlUrl;
  final String authKey;

  TailscaleNative? _native;
  bool _nativeTried = false;
  Future<void>? _init;
  Timer? _poll;
  bool _starting = false;

  bool _enabled = false;
  Set<String> _hosts = const {};
  String _dnsSuffix = '';
  TailnetStatus _status = TailnetStatus.off;
  TailscaleRouting _routing = TailscaleRouting.disabled;

  bool get enabled => _enabled;
  Set<String> get extraHosts => _hosts;
  TailnetStatus get status => _status;
  TailscaleRouting get routing => _routing;

  /// Whether this build ships the native library (it's built only where Go
  /// was available).
  bool get libraryAvailable => _nativeOrNull() != null;

  TailscaleNative? _nativeOrNull() {
    if (!_nativeTried) {
      _nativeTried = true;
      _native = _loadNativeFn();
    }
    return _native;
  }

  /// Reads the settings and starts the node if the user turned it on. Safe to
  /// call more than once; [waitUntilReady] waits for it.
  Future<void> init() => _init ??= _doInit();

  Future<void> _doInit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _enabled = prefs.getBool(prefEnabled) ?? false;
      _hosts = parseTailnetHosts(prefs.getString(prefHosts) ?? '');
      _dnsSuffix = prefs.getString(prefDnsSuffix) ?? '';
      if (_enabled && platformSupported) await _start();
    } catch (e) {
      debugPrint('[Tailscale] init failed: $e');
    }
  }

  /// Dart HTTP proxy decision (see main.dart's HttpOverrides). Hosts outside
  /// the tailnet keep HttpClient's default (proxies from the environment).
  String findProxy(Uri uri) {
    final routed = _routing.findProxy(uri);
    return routed == 'DIRECT' ? HttpClient.findProxyFromEnvironment(uri) : routed;
  }

  /// Media URL for players and native downloaders (see buildTrackUrl).
  String mediaUrl(String url) => _routing.mediaUrl(url);

  /// Whether [serverUrl] would go through the tailnet with the setting on.
  bool routesServer(String serverUrl) =>
      TailscaleRouting(enabled: true, magicDnsSuffix: _dnsSuffix, extraHosts: _hosts)
          .routesUrl(serverUrl);

  /// Before the app first pings a tailnet server, give the node a moment to
  /// connect so a launch doesn't flash "offline". Returns at once when the
  /// setting is off, the server isn't on the tailnet, or the node is waiting
  /// for a sign-in.
  Future<void> waitUntilReady(String serverUrl,
      {Duration timeout = const Duration(seconds: 10)}) async {
    await init();
    if (!_routing.active || !_routing.routesUrl(serverUrl)) return;
    final deadline = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(deadline)) {
      _refreshStatus();
      // NeedsLogin also shows briefly while a saved or pre-auth login is
      // applied; only a pending sign-in link means waiting is pointless.
      if (_status.isRunning ||
          (_status.needsLogin && _status.authUrl.isNotEmpty) ||
          _status.needsApproval ||
          _status.hasError) {
        return;
      }
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
  }

  /// Turns the node on or off. Calls run one after another, so a quick
  /// off-then-on waits for the old node to close before the new one starts on
  /// the same state folder.
  Future<void> setEnabled(bool value) {
    final next = _toggles.then((_) => _setEnabled(value));
    _toggles = next.catchError((Object e) {
      debugPrint('[Tailscale] toggle failed: $e');
    });
    return next;
  }

  Future<void> _toggles = Future<void>.value();

  Future<void> _setEnabled(bool value) async {
    await init();
    if (value == _enabled) return;
    _enabled = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(prefEnabled, value);
    if (value) {
      await _start();
    } else {
      await _stop();
    }
    notifyListeners();
  }

  Future<void> setExtraHosts(String text) async {
    _hosts = parseTailnetHosts(text);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefHosts, _hosts.join(', '));
    _rebuildRouting();
    notifyListeners();
  }

  /// Opens Tailscale's sign-in page in the browser. Waits up to [wait] for
  /// the node to offer a link. Returns false when there is none.
  Future<bool> signIn({Duration wait = const Duration(seconds: 15)}) async {
    if (!_enabled) return false;
    final deadline = DateTime.now().add(wait);
    while (_status.authUrl.isEmpty && DateTime.now().isBefore(deadline)) {
      _refreshStatus();
      if (_status.authUrl.isNotEmpty || _status.isRunning) break;
      await Future<void>.delayed(const Duration(milliseconds: 300));
    }
    final uri = Uri.tryParse(_status.authUrl);
    // Only web pages: the link comes from the control server.
    if (uri == null || !(uri.isScheme('https') || uri.isScheme('http'))) {
      return false;
    }
    return _openExternal(uri);
  }

  /// Signs this device out of the tailnet. The node keeps running and offers
  /// a new sign-in link.
  void signOut() {
    _native?.logout();
    _schedulePoll(fast: true);
  }

  /// Recent node log lines for troubleshooting (memory only).
  String debugLogs() => _native?.logs() ?? '';

  Future<void> _start() async {
    if (_starting) return;
    final native = _nativeOrNull();
    if (native == null) {
      _setStatus(const TailnetStatus(
          state: 'Error', error: 'Not included in this build'));
      return;
    }
    _starting = true;
    try {
      final dir = await _stateDirFn();
      final secret = await _proxySecret(dir);
      final prefs = await SharedPreferences.getInstance();
      final port = native.start(
        stateDir: dir,
        hostname: _hostnameFn(),
        proxySecret: secret,
        controlUrl: controlUrl,
        authKey: authKey,
        preferredPort: prefs.getInt(prefPort) ?? 0,
      );
      if (port <= 0) {
        _refreshStatus();
        return;
      }
      if (prefs.getInt(prefPort) != port) await prefs.setInt(prefPort, port);
      _routing = TailscaleRouting(
        enabled: true,
        proxyPort: port,
        secret: secret,
        magicDnsSuffix: _dnsSuffix,
        extraHosts: _hosts,
      );
      debugPrint('[Tailscale] node started');
      _refreshStatus();
      _schedulePoll(fast: true);
    } catch (e) {
      debugPrint('[Tailscale] start failed: $e');
      _setStatus(TailnetStatus(state: 'Error', error: '$e'));
    } finally {
      _starting = false;
    }
  }

  Future<void> _stop() async {
    _poll?.cancel();
    _poll = null;
    _routing = TailscaleRouting.disabled;
    final native = _native;
    if (native != null) await native.stop();
    _setStatus(TailnetStatus.off);
    debugPrint('[Tailscale] node stopped');
  }

  void _rebuildRouting() {
    if (!_routing.enabled) return;
    _routing = TailscaleRouting(
      enabled: true,
      proxyPort: _routing.proxyPort,
      secret: _routing.secret,
      magicDnsSuffix: _dnsSuffix,
      extraHosts: _hosts,
    );
  }

  void _schedulePoll({required bool fast}) {
    _poll?.cancel();
    if (!_enabled) return;
    _poll = Timer.periodic(fast ? fastPoll : slowPoll, (_) {
      final wasRunning = _status.isRunning;
      _refreshStatus();
      if (_status.isRunning != wasRunning || (fast && _status.isRunning)) {
        _schedulePoll(fast: !_status.isRunning);
      }
    });
  }

  void _refreshStatus() {
    final native = _native;
    if (native == null || !_enabled) return;
    _setStatus(TailnetStatus.parse(native.status()));
  }

  void _setStatus(TailnetStatus next) {
    if (next == _status) return;
    final wasRunning = _status.isRunning;
    _status = next;
    if (next.magicDnsSuffix.isNotEmpty && next.magicDnsSuffix != _dnsSuffix) {
      _dnsSuffix = next.magicDnsSuffix;
      _rebuildRouting();
      SharedPreferences.getInstance()
          .then((p) => p.setString(prefDnsSuffix, _dnsSuffix));
    }
    if (next.isRunning != wasRunning) {
      debugPrint('[Tailscale] state: ${next.state}');
    }
    notifyListeners();
  }

  /// The loopback proxy's password, kept beside the node state so it stays the
  /// same across launches (downloads queued with a media URL keep working).
  static Future<String> _proxySecret(String dir) async {
    final file = File('$dir${Platform.pathSeparator}proxy-secret');
    try {
      final existing = (await file.readAsString()).trim();
      if (existing.length >= 32) return existing;
    } catch (_) {}
    final rnd = Random.secure();
    final secret = List.generate(16, (_) => rnd.nextInt(256))
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();
    await Directory(dir).create(recursive: true);
    await file.writeAsString(secret, flush: true);
    return secret;
  }

  static Future<String> _defaultStateDir() async {
    final base = await getApplicationSupportDirectory();
    return '${base.path}${Platform.pathSeparator}tailscale';
  }

  static String _defaultHostname() {
    final platform = Platform.isAndroid
        ? 'android'
        : Platform.isWindows
            ? 'windows'
            : 'linux';
    String local = '';
    try {
      local = Platform.localHostname;
    } catch (_) {}
    return tailscaleHostname(platform, local);
  }
}
