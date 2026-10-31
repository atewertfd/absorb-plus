/// Absorb Plus: whether a server progress event is this device's own sync
/// coming back, for the session that is playing right now.
///
/// While playing, the player syncs every 20 s and the server echoes each sync
/// back over the socket (`user_item_progress_updated` with `fromSession`).
/// The echo holds nothing the player doesn't already know, so the library
/// stores it without telling every screen to rebuild. Anything else (another
/// device, an older session, a paused player) is handled as before.
bool isOwnPlayingProgressEcho(
  Map<String, dynamic> progress, {
  required String? playbackSessionId,
  required bool playing,
}) {
  if (!playing || playbackSessionId == null) return false;
  final from = progress['fromSession'];
  return from is String && from == playbackSessionId;
}
