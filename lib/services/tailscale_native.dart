// Built-in Tailscale (fork prototype): the native library's C ABI as a Dart
// interface, so tests can swap in a fake. See native/tailscale/.
import 'tailscale_native_stub.dart'
    if (dart.library.ffi) 'tailscale_native_ffi.dart' as impl;

/// The embedded Tailscale node (absorb_tailscale.dll / libabsorb_tailscale.so).
/// Every call returns quickly; the node starts and signs out in the
/// background, and [status] reports where it is.
abstract class TailscaleNative {
  /// Starts the node and its loopback proxy. Returns the proxy port, or -1
  /// (then [status] carries the error). Calling it again while running returns
  /// the same port.
  int start({
    required String stateDir,
    required String hostname,
    required String proxySecret,
    String controlUrl = '',
    String authKey = '',
    int preferredPort = 0,
  });

  /// The node's state as JSON (see `statusJSON` in absorb_tailscale.go).
  String status();

  /// Signs the node out of its tailnet (in the background) and asks for a
  /// fresh login link.
  void logout();

  /// Closes the proxy and the node (off the UI thread; up to five seconds).
  Future<void> stop();

  /// Recent tsnet log lines, kept in memory only (login links redacted).
  String logs();
}

/// Loads the native library, or returns null when this build or platform
/// doesn't include it (web, or a build made without Go).
TailscaleNative? loadTailscaleNative({String? libraryPath}) =>
    impl.loadTailscaleNative(libraryPath: libraryPath);
