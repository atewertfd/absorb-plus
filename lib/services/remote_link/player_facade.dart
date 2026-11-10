import 'package:flutter/foundation.dart';

import 'protocol.dart';

/// What the phone-remote host drives: the app's player
/// (`app_remote_player.dart`), or a fake in tests. Notifies when [state]
/// changes (position and volume move without notifications; the host polls
/// them once a second while someone is connected).
abstract class RemotePlayerFacade implements Listenable {
  RemotePlayerState get state;

  /// The chapters of what is playing. The same list object until they
  /// change, so the host can tell when to send them again.
  List<RemoteChapter> get chapters;

  /// The cover of what is playing, or of [itemId] (one of [recentItems]),
  /// or null. Never a URL: the remote must not learn the server's address
  /// or credentials.
  Future<Uint8List?> loadCover([String? itemId]);

  Future<void> play();
  Future<void> pause();
  Future<void> toggle();

  /// Stops playback (as the player's own Stop: progress is saved).
  Future<void> stop();

  /// Jumps to [seconds] in the whole book (offers "Back to ..." like any
  /// other long seek).
  Future<void> seek(double seconds);

  /// Skips by [seconds]; negative goes back.
  Future<void> skip(int seconds);

  /// Previous (-1) or next (1) chapter.
  Future<void> chapter(int delta);

  Future<void> setSpeed(double speed);

  Future<void> sleepFor(int minutes);
  Future<void> sleepAtEndOfChapter();
  Future<void> cancelSleep();

  /// The PC player's volume, 0 to 1 (unmutes).
  Future<void> setVolume(double volume);

  Future<void> setMuted(bool muted);

  /// A bookmark at the current spot; false when nothing could be saved.
  Future<bool> addBookmark(String note);

  /// The PC's few most recent in-progress books.
  Future<List<RemoteRecentItem>> recentItems();

  /// Starts one of [recentItems] on the PC; false when it couldn't.
  Future<bool> playItem(String itemId);
}
