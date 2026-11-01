// dart:ffi binding for native/tailscale (absorb_tailscale.dll on Windows,
// libabsorb_tailscale.so on Android and Linux).
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

import 'tailscale_native.dart';

typedef _StartC = Int32 Function(
    Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>,
    Pointer<Uint8>, Int32);
typedef _StartDart = int Function(
    Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>,
    Pointer<Uint8>, int);
typedef _StrC = Pointer<Uint8> Function();
typedef _IntC = Int32 Function();
typedef _IntDart = int Function();
typedef _AllocC = Pointer<Uint8> Function(Int32);
typedef _AllocDart = Pointer<Uint8> Function(int);
typedef _FreeC = Void Function(Pointer<Uint8>);
typedef _FreeDart = void Function(Pointer<Uint8>);

/// Where the library sits in each build: next to absorb.exe on Windows, in
/// the bundle's lib/ on Linux, and in the APK's native libraries on Android.
String? defaultTailscaleLibraryPath() {
  if (Platform.isAndroid) return 'libabsorb_tailscale.so';
  final exeDir = File(Platform.resolvedExecutable).parent.path;
  if (Platform.isWindows) return '$exeDir\\absorb_tailscale.dll';
  if (Platform.isLinux) return '$exeDir/lib/libabsorb_tailscale.so';
  return null;
}

TailscaleNative? loadTailscaleNative({String? libraryPath}) {
  // The environment override is for debugging only: a release build never
  // loads native code from a path set outside the app.
  final path = libraryPath ??
      (kDebugMode ? Platform.environment['ABSORB_TAILSCALE_LIB'] : null) ??
      defaultTailscaleLibraryPath();
  if (path == null) return null;
  if (!Platform.isAndroid && !File(path).existsSync()) return null;
  try {
    return _FfiTailscaleNative(path, DynamicLibrary.open(path));
  } catch (e) {
    debugPrint('[Tailscale] native library not loaded: $e');
    return null;
  }
}

class _FfiTailscaleNative implements TailscaleNative {
  _FfiTailscaleNative(this._path, DynamicLibrary lib)
      : _start = lib.lookupFunction<_StartC, _StartDart>('AbsorbTsStart'),
        _status = lib.lookupFunction<_StrC, _StrC>('AbsorbTsStatus'),
        _logs = lib.lookupFunction<_StrC, _StrC>('AbsorbTsLogs'),
        _logout = lib.lookupFunction<_IntC, _IntDart>('AbsorbTsLogout'),
        _alloc = lib.lookupFunction<_AllocC, _AllocDart>('AbsorbTsAlloc'),
        _free = lib.lookupFunction<_FreeC, _FreeDart>('AbsorbTsFree');

  final String _path;
  final _StartDart _start;
  final _StrC _status;
  final _StrC _logs;
  final _IntDart _logout;
  final _AllocDart _alloc;
  final _FreeDart _free;

  Pointer<Uint8> _cString(String s) {
    final bytes = utf8.encode(s);
    final p = _alloc(bytes.length + 1); // zeroed, so already terminated
    p.asTypedList(bytes.length).setAll(0, bytes);
    return p;
  }

  String _takeString(Pointer<Uint8> p) {
    if (p == nullptr) return '';
    var len = 0;
    while (p[len] != 0) {
      len++;
    }
    final s = utf8.decode(Uint8List.fromList(p.asTypedList(len)),
        allowMalformed: true);
    _free(p);
    return s;
  }

  @override
  int start({
    required String stateDir,
    required String hostname,
    required String proxySecret,
    String controlUrl = '',
    String authKey = '',
    int preferredPort = 0,
  }) {
    final args = [stateDir, hostname, controlUrl, authKey, proxySecret]
        .map(_cString)
        .toList();
    try {
      return _start(args[0], args[1], args[2], args[3], args[4], preferredPort);
    } finally {
      args.forEach(_free);
    }
  }

  @override
  String status() => _takeString(_status());

  @override
  String logs() => _takeString(_logs());

  @override
  void logout() => _logout();

  @override
  Future<void> stop() {
    // AbsorbTsStop waits for the node to close; keep that off the UI isolate.
    final path = _path;
    return Isolate.run(() {
      DynamicLibrary.open(path).lookupFunction<_IntC, _IntDart>('AbsorbTsStop')();
    });
  }
}
