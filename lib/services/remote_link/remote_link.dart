/// Phone remote (fork): import this file. It brings the web-safe types and
/// either the dart:io host and client or the web stubs.
library;

export 'pairing_store.dart';
export 'protocol.dart';
export 'remote_client_stub.dart' if (dart.library.io) 'remote_client.dart';
export 'remote_crypto.dart';
export 'remote_host_stub.dart' if (dart.library.io) 'remote_host.dart';
export 'remote_link_types.dart';
