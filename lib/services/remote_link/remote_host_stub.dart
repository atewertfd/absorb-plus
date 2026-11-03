import 'package:flutter/foundation.dart';

import 'pairing_store.dart';
import 'remote_link_types.dart';

/// Web: no sockets, so no phone-remote host. Everything is a no-op.
bool get remoteHostSupported => false;

RemoteHostController get remoteHost => _StubRemoteHost.instance;

class _StubRemoteHost implements RemoteHostController {
  _StubRemoteHost._();
  static final instance = _StubRemoteHost._();

  @override
  bool get isSupported => false;
  @override
  final ValueListenable<RemoteHostStatus> status = ValueNotifier(
    const RemoteHostStatus(),
  );
  @override
  final ValueListenable<List<RemoteConnectionInfo>> connections = ValueNotifier(
    const [],
  );
  @override
  final PairingCodeIssuer codes = PairingCodeIssuer();
  @override
  final PairedDeviceStore devices = PairedDeviceStore();

  @override
  Future<void> start() async {}
  @override
  Future<void> setEnabled(bool enabled) async {}
  @override
  Future<void> signedOut() async {}
  @override
  void shutdownForExit() {}
  @override
  Future<void> disconnect(int connectionId) async {}
  @override
  Future<void> forget(String deviceId) async {}
}
