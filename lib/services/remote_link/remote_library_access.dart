import 'protocol.dart';

/// Phone remote (fork): what the host may read from and do in the app's
/// library, for the phone's "Continue listening". The signed-in shell sets
/// [current] (`lib/fork/remote_link_hooks.dart`); web-safe.
abstract class RemoteLibraryAccess {
  static RemoteLibraryAccess? current;

  /// The few most recent in-progress books, newest first.
  List<RemoteRecentItem> recentItems(int max);

  /// The cover address of [itemId] for the app's cover cache, or null.
  String? coverUrl(String itemId);

  /// Headers the app's own cover requests carry.
  Map<String, String> get coverHeaders;

  /// A downloaded cover file of [itemId], or null.
  String? localCoverPath(String itemId);

  /// Starts [itemId] (an id from [recentItems]); false when it couldn't.
  Future<bool> play(String itemId);
}
