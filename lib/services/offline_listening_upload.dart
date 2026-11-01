import 'package:flutter/foundation.dart';

import 'api_service.dart';
import 'local_session_service.dart';
import 'progress_sync_service.dart';
import 'scoped_prefs.dart';

/// Absorb Plus: sends listening time banked in the offline ledger
/// (`offline_listening_<item>`, streaming without a live session) as a
/// client-owned local session.
///
/// It used to open a fresh `/play` session, sync the time and close it. That
/// had two faults: a new `/play` session makes the server close this
/// device's open one, so a flush while streaming another book killed the
/// live stream; and a sync the server applied but answered too late for was
/// counted as not sent, so the next flush credited the same seconds again.
///
/// `/api/session/local` upserts by the session id, which is kept beside the
/// ledger entry until the time it carried is off the ledger. A retry after a
/// lost reply resends the same id with the (cumulative) total, so the server
/// overwrites rather than adds, and live sessions are never touched. `/play`
/// is kept only for servers without the local-session endpoint.
class OfflineListeningUpload {
  OfflineListeningUpload._();

  static String _idKey(String itemId) => 'offline_ledger_session_$itemId';

  /// Clock seam for tests.
  @visibleForTesting
  static DateTime Function() clock = DateTime.now;

  static const _weekdays = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];

  /// Send [seconds] of banked listening for [itemId] (a library item id, or
  /// `<item>-<episode>` for a podcast episode) at [currentTime]. True once
  /// the server took it.
  static Future<bool> send(
    ApiService api,
    String itemId, {
    required int seconds,
    required double currentTime,
    required double duration,
  }) async {
    final isCompound = itemId.length > 36;
    final apiItemId = isCompound ? itemId.substring(0, 36) : itemId;
    final episodeId = isCompound ? itemId.substring(37) : null;

    // Stored before the first send, so a reply lost to a timeout (or the app
    // dying mid-request) is resent under the same id.
    var id = await ScopedPrefs.getString(_idKey(itemId));
    if (id == null) {
      id = LocalSessionService().newSessionId();
      await ScopedPrefs.setString(_idKey(itemId), id);
    }

    final trusted =
        await ProgressSyncService().serverTrustedDuration(api, itemId, duration);
    final now = clock();
    final started = now.subtract(Duration(seconds: seconds));
    String two(int v) => v.toString().padLeft(2, '0');
    final result = await api.syncLocalSession({
      'id': id,
      'libraryItemId': apiItemId,
      'episodeId': episodeId,
      'mediaType': episodeId != null ? 'podcast' : 'book',
      'displayTitle': null,
      'displayAuthor': null,
      'duration': trusted,
      'startTime': currentTime,
      'currentTime': currentTime,
      'timeListening': seconds,
      'startedAt': started.millisecondsSinceEpoch,
      'updatedAt': now.millisecondsSinceEpoch,
      'date': '${now.year}-${two(now.month)}-${two(now.day)}',
      'dayOfWeek': _weekdays[now.weekday - 1],
      // Streamed, so it shows as Direct Play like the old /play session did.
      'playMethod': 0,
    });
    if (result.ok) return true;
    if (!result.serverTooOld) return false;
    debugPrint('[Sync] Server lacks /api/session/local - sending offline listening for $itemId through /play');
    return _viaPlay(api, apiItemId, episodeId,
        seconds: seconds, currentTime: currentTime, duration: duration);
  }

  /// Forget the session id once the ledger no longer holds the time it
  /// carried, so time banked later goes up as a new session instead of
  /// overwriting this one.
  static Future<void> settled(String itemId) async {
    // A remove rewrites the whole prefs file on Windows even for a missing
    // key, so only remove one that is there.
    if (await ScopedPrefs.getString(_idKey(itemId)) == null) return;
    await ScopedPrefs.remove(_idKey(itemId));
  }

  static Future<bool> _viaPlay(
    ApiService api,
    String apiItemId,
    String? episodeId, {
    required int seconds,
    required double currentTime,
    required double duration,
  }) async {
    final sessionData = episodeId != null
        ? await api.startEpisodePlaybackSession(apiItemId, episodeId)
        : await api.startPlaybackSession(apiItemId);
    final sid = sessionData?['id'] as String?;
    if (sid == null) return false;
    final synced = await api.syncPlaybackSession(
      sid,
      currentTime: currentTime,
      duration: duration,
      timeListened: seconds,
    );
    await api.closePlaybackSession(sid);
    return synced;
  }
}
