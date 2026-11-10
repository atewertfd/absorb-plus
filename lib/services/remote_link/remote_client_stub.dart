import 'package:flutter/foundation.dart';

import 'pairing_store.dart';
import 'protocol.dart';
import 'remote_link_types.dart';

/// Web: browsers can't open plain LAN sockets from an https page, so there is
/// no remote on web (see docs/design/phone-remote.md).
RemoteLinkConnector get remoteLinkConnector => const _StubConnector();

class _StubConnector implements RemoteLinkConnector {
  const _StubConnector();

  @override
  bool get isSupported => false;

  @override
  Stream<RemoteHostAnnouncement> discover({
    Duration timeout = const Duration(seconds: 2),
  }) => const Stream.empty();

  @override
  Future<RemotePairResult> pair({
    required String address,
    required int port,
    required String code,
    required String deviceName,
    VoidCallback? onWaiting,
  }) async => const RemotePairResult.failed(RemotePairResult.unreachable);

  @override
  RemoteLinkClient open(SavedRemoteHost host) =>
      throw UnsupportedError('No phone remote on web');

  @override
  Future<String> deviceName() async => 'Absorb';
}
