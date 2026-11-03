import 'package:flutter/foundation.dart';

import 'protocol.dart';

/// What the phone-remote host drives: the app's player
/// (`app_remote_player.dart`), or a fake in tests. Notifies when [state]
/// changes (position moves without notifications; the host polls it once a
/// second while playing).
abstract class RemotePlayerFacade implements Listenable {
  RemotePlayerState get state;

  /// The cover of what is playing, or null. Never a URL: the remote must
  /// not learn the server's address or credentials.
  Future<Uint8List?> loadCover();

  Future<void> play();
  Future<void> pause();
  Future<void> toggle();

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
}
