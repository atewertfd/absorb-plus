import 'package:audio_service/audio_service.dart';

/// Absorb Plus: something that borrows the phone's media session (the
/// notification, lock screen, headset buttons and Wear OS) while nothing
/// plays on the phone itself. The phone remote uses it to show and control
/// what the PC is playing (`remote_link/remote_media_mirror.dart`).
///
/// [AudioPlayerHandler.lendSession] only lends the session while the local
/// player isn't playing, and takes it back the moment local playback starts
/// or a book starts loading ([sessionReclaimed]). While it is lent, the
/// handler's transport callbacks go to the guest and local media-session
/// pushes are held, then restored when the session comes back.
abstract class MediaSessionGuest {
  Future<void> play();
  Future<void> pause();

  /// [position] as shown on the lock screen's bar.
  Future<void> seek(Duration position);
  Future<void> fastForward();
  Future<void> rewind();
  Future<void> click(MediaButton button);
  Future<void> stop();
  Future<void> customAction(String name);

  /// Local playback took the session back (the guest stops showing).
  void sessionReclaimed();
}
