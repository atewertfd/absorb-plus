// Absorb Plus (audit C8): in-memory copies of per-account settings, reloaded
// whenever another account becomes the active one.
//
// Sign-in used to reload none of these and an account switch only the
// synchronous PlayerSettings caches, so after signing out of one account
// and into another the new one showed the old one's cover size, button fill
// and badges, kept the old one's auto sleep window, and settings sync kept
// the listener state of whichever account the app started with.

import 'package:flutter/foundation.dart';

import 'player_settings.dart';
import 'settings_sync_service.dart';
import 'sleep_timer_service.dart';

/// Test seams: what [reloadAccountScopedCaches] runs besides the
/// synchronous PlayerSettings caches.
@visibleForTesting
Future<void> Function() reloadAutoSleepSettings =
    () => SleepTimerService().loadAutoSleepSettings();

@visibleForTesting
Future<void> Function() restartSettingsSync = () async {
  final sync = SettingsSyncService();
  sync.stop();
  await sync.startIfEnabled();
};

/// Reloads every per-account setting held in memory from the active
/// account's scope. Never throws: a failure in one part leaves the rest.
Future<void> reloadAccountScopedCaches() async {
  try {
    PlayerSettings.showExplicitBadge =
        await PlayerSettings.getShowExplicitBadge();
    PlayerSettings.showEbookBadge = await PlayerSettings.getShowEbookBadge();
    PlayerSettings.mp3IndexSeeking = await PlayerSettings.getMp3IndexSeeking();
    PlayerSettings.coverSize = await PlayerSettings.getCoverSize();
    PlayerSettings.cardButtonFill = await PlayerSettings.getCardButtonFill();
  } catch (e) {
    debugPrint('[Account] reloading display settings failed: $e');
  }
  try {
    await reloadAutoSleepSettings();
  } catch (e) {
    debugPrint('[Account] reloading auto sleep failed: $e');
  }
  try {
    await restartSettingsSync();
  } catch (e) {
    debugPrint('[Account] restarting settings sync failed: $e');
  }
}
