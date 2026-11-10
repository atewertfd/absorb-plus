import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils/fork_platform.dart';
import '../audio_player_service.dart';
import '../media_session_guest.dart';
import 'remote_media_mirror.dart';

/// The app's media session for [RemoteMediaMirror]: Android only (the
/// desktop media controls stay with the local player).
RemoteMediaSessionPort appRemoteMediaSession() => _AppRemoteMediaSession();

class _AppRemoteMediaSession implements RemoteMediaSessionPort {
  AudioPlayerHandler? get _handler => AudioPlayerService.handler;

  @override
  bool get isAvailable => ForkPlatform.isAndroid && _handler != null;

  @override
  bool lend(MediaSessionGuest guest) => _handler?.lendSession(guest) ?? false;

  @override
  void show(MediaSessionGuest guest, MediaItem? item, PlaybackState state) =>
      _handler?.showGuest(guest, item, state);

  @override
  void giveBack(MediaSessionGuest guest) => _handler?.returnSession(guest);

  /// The notification loads art from a file: one cover file at a time in
  /// the app's temp folder (a new name per cover, so Android's art cache
  /// doesn't show the old one).
  @override
  Future<Uri?> coverUri(Uint8List bytes, String key) async {
    final base = await getTemporaryDirectory();
    final dir = Directory('${base.path}${Platform.pathSeparator}remote_cover');
    await dir.create(recursive: true);
    final safe = key.replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '_');
    final file = File('${dir.path}${Platform.pathSeparator}$safe.img');
    await for (final old in dir.list(followLinks: false)) {
      if (old is File && old.path != file.path) {
        try {
          await old.delete();
        } catch (e) {
          debugPrint('[RemoteMirror] Old cover kept: ${e.runtimeType}');
        }
      }
    }
    await file.writeAsBytes(bytes, flush: true);
    return file.uri;
  }
}
