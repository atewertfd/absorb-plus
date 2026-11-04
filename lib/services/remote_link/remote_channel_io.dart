import 'dart:async';
import 'dart:io';

import 'protocol.dart';
import 'remote_link_types.dart';

/// Phone remote (fork, dart:io): a [RemoteChannel] over a WebSocket.
class WebSocketRemoteChannel implements RemoteChannel {
  WebSocketRemoteChannel(this._ws);

  final WebSocket _ws;
  bool _closed = false;

  @override
  Stream<Object?> get frames => _ws;

  @override
  void send(String text) {
    if (_closed) return;
    try {
      _ws.add(text);
    } catch (_) {
      // The socket is closing; its done handler takes over.
    }
  }

  @override
  Future<void> close([int? code, String? reason]) async {
    _closed = true;
    try {
      await _ws
          .close(code, reason)
          .timeout(const Duration(seconds: 2), onTimeout: () => null);
    } catch (_) {
      // Already gone: nothing left to close.
    }
  }

  @override
  int? get closeCode => _ws.closeCode;
}

Uri remoteSocketUri(String address, int port) =>
    Uri(scheme: 'ws', host: address, port: port, path: kRemoteSocketPath);

/// Opens the host's WebSocket (no compression). A socket that connects only
/// after [timeout] is closed instead of leaking.
Future<RemoteChannel> connectRemoteChannel(
  String address,
  int port,
  Duration timeout,
) async {
  final pending = WebSocket.connect(
    remoteSocketUri(address, port).toString(),
    compression: CompressionOptions.compressionOff,
  );
  try {
    return WebSocketRemoteChannel(await pending.timeout(timeout));
  } on TimeoutException {
    unawaited(pending.then((ws) => ws.close(), onError: (Object _) => null));
    rethrow;
  }
}
