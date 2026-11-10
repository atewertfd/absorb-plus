// Absorb Plus plug-in point: the phone remote's hooks into upstream files.
// app_shell.dart attaches and detaches the signed-in shell; main.dart's
// link handler offers absorb://remote-pair links here first.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart' show rootNavigatorKey;
import '../providers/auth_provider.dart';
import '../providers/library_provider.dart';
import '../screens/remote_connect_screen.dart';
import '../services/audio_player_service.dart';
import '../services/download_service.dart';
import '../services/remote_link/remote_library_access.dart';
import '../services/remote_link/remote_link.dart';
import '../widgets/remote_host_sheet.dart';

abstract final class RemoteLinkHooks {
  static bool _shellUp = false;
  static RemotePairingLink? _pending;

  /// The signed-in shell is up: the host can reach the library and ask
  /// "Allow …?", a scanned pairing link can open, and the host starts (off
  /// unless "Keep on when Absorb starts").
  static void attachShell(BuildContext context) {
    _shellUp = true;
    RemoteLibraryAccess.current = AppRemoteLibrary(
      context.read<LibraryProvider>(),
      context.read<AuthProvider>(),
    );
    remoteHost.approver = askToAllow;
    unawaited(remoteHost.start());
    _openPendingSoon();
  }

  static void detachShell() {
    _shellUp = false;
    RemoteLibraryAccess.current = null;
  }

  /// The PC's "Allow ‘<device>’ to control Absorb on this PC?".
  static Future<bool> askToAllow(RemotePairRequest request) async {
    final navigator = rootNavigatorKey.currentState;
    if (navigator == null) return false;
    return RemotePairApprovalDialog.ask(navigator, request);
  }

  /// True when [uri] is a phone-remote pairing link (handled here, opened
  /// once the shell is up). Every other link goes on as before.
  static bool offerLink(Uri uri) {
    if (!RemotePairingLink.isAppLink(uri)) return false;
    final link = RemotePairingLink.parse(uri.toString());
    if (link == null || !remoteLinkConnector.isSupported) return true;
    _pending = link;
    _openPendingSoon();
    return true;
  }

  static void _openPendingSoon() {
    if (_pending == null || !_shellUp) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final link = _pending;
      final context = rootNavigatorKey.currentContext;
      if (link == null || context == null || !_shellUp) return;
      _pending = null;
      unawaited(RemoteConnectScreen.open(context, link: link));
    });
  }

  /// Tests.
  @visibleForTesting
  static RemotePairingLink? get pendingForTest => _pending;

  @visibleForTesting
  static void resetForTest() {
    _shellUp = false;
    _pending = null;
  }
}

/// The library behind the host's "Continue listening": the server's
/// Continue Listening shelf, else the Absorbing cards.
class AppRemoteLibrary implements RemoteLibraryAccess {
  AppRemoteLibrary(this._library, this._auth);

  final LibraryProvider _library;
  final AuthProvider _auth;

  /// The entries last offered, by the id the remote sees.
  final Map<String, Map<String, dynamic>> _offered = {};

  @override
  List<RemoteRecentItem> recentItems(int max) {
    final entries = <Map<String, dynamic>>[];
    for (final section in _library.personalizedSections) {
      if (section is! Map || section['id'] != 'continue-listening') continue;
      for (final e in (section['entities'] as List<dynamic>? ?? const [])) {
        if (e is Map<String, dynamic>) entries.add(e);
      }
    }
    if (entries.isEmpty) {
      for (final key in _library.absorbingBookIds) {
        final item = _library.absorbingItemCache[key];
        if (item != null) entries.add(item);
      }
    }
    _offered.clear();
    final items = <RemoteRecentItem>[];
    for (final e in entries) {
      if (items.length >= max) break;
      final itemId = e['id'];
      if (itemId is! String || itemId.isEmpty) continue;
      final metadata =
          (e['media'] as Map<String, dynamic>?)?['metadata']
              as Map<String, dynamic>? ??
          const {};
      final episode = e['recentEpisode'] as Map<String, dynamic>?;
      final episodeId = episode?['id'] as String?;
      final id = episodeId == null ? itemId : '$itemId:$episodeId';
      if (_offered.containsKey(id)) continue;
      _offered[id] = e;
      items.add(
        RemoteRecentItem(
          id: id,
          title: episode != null
              ? (episode['title'] as String? ?? '')
              : (metadata['title'] as String? ?? ''),
          author: episode != null
              ? (metadata['title'] as String? ?? '')
              : (metadata['authorName'] as String? ?? ''),
          progress: _library
              .getProgress(playbackDownloadKey(itemId, episodeId))
              .clamp(0.0, 1.0),
        ),
      );
    }
    return items;
  }

  String _itemId(String id) => id.split(':').first;

  @override
  String? coverUrl(String itemId) => _library.getCoverUrl(_itemId(itemId));

  @override
  Map<String, String> get coverHeaders =>
      _auth.apiService?.mediaHeaders ?? const {};

  @override
  String? localCoverPath(String itemId) =>
      DownloadService().getInfo(_itemId(itemId)).localCoverPath;

  /// As the shell's "play the front card": podcast episodes carry their
  /// episode; books need the full item for chapters and duration.
  @override
  Future<bool> play(String id) async {
    final entry = _offered[id];
    final api = _auth.apiService;
    if (entry == null || api == null) return false;
    final itemId = _itemId(id);
    final player = AudioPlayerService();
    final coverUrl = _library.getCoverUrl(itemId);
    final episode = entry['recentEpisode'] as Map<String, dynamic>?;
    String? error;
    if (episode != null) {
      final metadata =
          (entry['media'] as Map<String, dynamic>?)?['metadata']
              as Map<String, dynamic>? ??
          const {};
      error = await player.playItem(
        api: api,
        itemId: itemId,
        title: episode['title'] as String? ?? '',
        author: metadata['title'] as String? ?? '',
        coverUrl: coverUrl,
        totalDuration: (episode['duration'] as num?)?.toDouble() ?? 0,
        chapters: const [],
        episodeId: episode['id'] as String?,
        episodeTitle: episode['title'] as String?,
        libraryId: entry['libraryId'] as String?,
        fromUi: true,
      );
    } else {
      final full = await api.getLibraryItem(itemId) ?? entry;
      final media = full['media'] as Map<String, dynamic>? ?? const {};
      final metadata = media['metadata'] as Map<String, dynamic>? ?? const {};
      error = await player.playItem(
        api: api,
        itemId: itemId,
        title: metadata['title'] as String? ?? '',
        author: metadata['authorName'] as String? ?? '',
        coverUrl: coverUrl,
        totalDuration: (media['duration'] as num?)?.toDouble() ?? 0,
        chapters: (media['chapters'] as List<dynamic>?) ?? const [],
        libraryId: full['libraryId'] as String?,
        fromUi: true,
      );
    }
    if (error != null) debugPrint('[RemoteHost] Couldn\'t start a book');
    return error == null;
  }
}
