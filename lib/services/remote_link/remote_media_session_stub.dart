import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';

import '../media_session_guest.dart';
import 'remote_media_mirror.dart';

/// Web: the phone remote doesn't run there, so nothing is mirrored.
RemoteMediaSessionPort appRemoteMediaSession() => const _NoMediaSession();

class _NoMediaSession implements RemoteMediaSessionPort {
  const _NoMediaSession();

  @override
  bool get isAvailable => false;

  @override
  bool lend(MediaSessionGuest guest) => false;

  @override
  void show(MediaSessionGuest guest, MediaItem? item, PlaybackState state) {}

  @override
  void giveBack(MediaSessionGuest guest) {}

  @override
  Future<Uri?> coverUri(Uint8List bytes, String key) async => null;
}
