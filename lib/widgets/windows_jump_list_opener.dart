import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/library_provider.dart';
import '../services/audio_player_service.dart';
import '../services/windows_jump_list.dart';
import 'book_detail_sheet.dart' show showBookDetailSheet;
import 'overlay_toast.dart';

export '../services/windows_jump_list.dart' show JumpListLaunch;

/// Hooks the taskbar jump list (fork-owned) into the main screen: follows
/// the player and Continue Listening, and opens the books its entries ask
/// for. A no-op off Windows. Pair with [detachWindowsJumpList] in dispose.
void Function(JumpListLaunch)? attachWindowsJumpList(BuildContext context) {
  final jumpList = WindowsJumpList.instance;
  if (!jumpList.isSupported) return null;
  void onLaunch(JumpListLaunch launch) {
    // After the frame: a launch can arrive while the screen is building.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) unawaited(openJumpListLaunch(context, launch));
    });
  }

  _appSource ??= AppJumpListSource(
      context.read<AuthProvider>(), context.read<LibraryProvider>());
  unawaited(jumpList.start(source: _appSource!, onLaunch: onLaunch));
  return onLaunch;
}

void detachWindowsJumpList(void Function(JumpListLaunch)? onLaunch) {
  if (onLaunch != null) WindowsJumpList.instance.detachLaunchHandler(onLaunch);
}

// Lives as long as the app; the providers do too (main.dart).
AppJumpListSource? _appSource;

/// Opens the book's page; the Resume entry also starts playing it.
Future<void> openJumpListLaunch(
    BuildContext context, JumpListLaunch launch) async {
  showBookDetailSheet(context, launch.itemId);
  if (launch.resume) await _resume(context, launch.itemId);
}

Future<void> _resume(BuildContext context, String itemId) async {
  final player = AudioPlayerService();
  if (player.hasBook &&
      player.currentItemId == itemId &&
      player.currentEpisodeId == null) {
    if (!player.isPlaying) await player.play(fromUi: true);
    return;
  }
  final api = context.read<AuthProvider>().apiService;
  if (api == null) return;
  final library = context.read<LibraryProvider>();
  final item = await api.getLibraryItem(itemId);
  if (item == null || !context.mounted) return;
  if (item['mediaType'] == 'podcast') return; // Episodes need more than an id.
  final media = item['media'] as Map<String, dynamic>? ?? {};
  final metadata = media['metadata'] as Map<String, dynamic>? ?? {};
  final error = await player.playItem(
    api: api,
    itemId: itemId,
    title: metadata['title'] as String? ?? '',
    author: metadata['authorName'] as String? ?? '',
    coverUrl: library.getCoverUrl(itemId),
    totalDuration: (media['duration'] as num?)?.toDouble() ?? 0,
    chapters: (media['chapters'] as List<dynamic>?) ?? const [],
    libraryId: item['libraryId'] as String?,
    fromUi: true,
  );
  if (error != null && context.mounted) {
    showOverlayToast(context, error, icon: Icons.error_outline_rounded);
  }
}
