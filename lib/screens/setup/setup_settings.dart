import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../l10n/app_localizations.dart';
import '../../services/download_service.dart';
import '../../services/player_settings.dart';
import '../../utils/fork_platform.dart';
import '../../widgets/desktop_download_folder_sheet.dart';
import '../../widgets/overlay_toast.dart';

/// A permission the setup asks for on Android.
enum SetupPermission { notifications, battery }

/// The settings the setup pages read and change, through the same setters
/// Settings uses. Tests pass a fake.
class SetupSettings {
  const SetupSettings();

  Future<double> defaultSpeed() => PlayerSettings.getDefaultSpeed();
  Future<void> setDefaultSpeed(double speed) =>
      PlayerSettings.setDefaultSpeed(speed);

  Future<int> backSkip() => PlayerSettings.getBackSkip();
  Future<void> setBackSkip(int seconds) => PlayerSettings.setBackSkip(seconds);

  Future<int> forwardSkip() => PlayerSettings.getForwardSkip();
  Future<void> setForwardSkip(int seconds) =>
      PlayerSettings.setForwardSkip(seconds);

  Future<AutoRewindSettings> autoRewind() => AutoRewindSettings.load();
  Future<void> setAutoRewind(AutoRewindSettings settings) => settings.save();

  Future<bool> wifiOnlyDownloads() => PlayerSettings.getWifiOnlyDownloads();
  Future<void> setWifiOnlyDownloads(bool value) =>
      PlayerSettings.setWifiOnlyDownloads(value);

  Future<String> downloadLocation() => DownloadService().downloadLocationLabel;

  /// Opens the same folder choice Settings offers: the desktop folder sheet,
  /// or Android's system folder picker. Returns the new location label, or
  /// null when nothing changed.
  Future<String?> pickDownloadLocation(BuildContext context) async {
    final dl = DownloadService();
    if (ForkPlatform.supportsDesktopDownloadFolder) {
      String? label;
      await DesktopDownloadFolderSheet.show(
        context,
        onLabelChanged: (l) => label = l,
      );
      return label;
    }
    final l = AppLocalizations.of(context)!;
    // As in Settings > Downloads & Storage: Storage Access Framework, no
    // storage permission needed, and a probe that the folder takes files.
    Uri? treeUri;
    try {
      treeUri = await FileDownloader().uri.pickDirectory(
        startLocation: SharedStorage.downloads,
        persistedUriPermission: true,
      );
      if (treeUri == null) return null;
      final probe = await FileDownloader().uri.createDirectory(
        treeUri,
        '.absorb_write_test',
      );
      await FileDownloader().uri.deleteFile(probe);
    } catch (e) {
      debugPrint('[Setup] Download folder not usable: $e');
      if (context.mounted) {
        showOverlayToast(
          context,
          l.cannotWriteToFolder,
          icon: Icons.error_outline_rounded,
        );
      }
      return null;
    }
    await dl.setCustomDownloadUri(treeUri);
    return dl.downloadLocationLabel;
  }

  Future<bool> permissionGranted(SetupPermission p) async =>
      (await _permission(p).status).isGranted;

  /// Asks Android for [p]; opens the app's settings page when it was denied
  /// for good. Returns whether it is granted now.
  Future<bool> requestPermission(SetupPermission p) async {
    final result = await _permission(p).request();
    if (result.isPermanentlyDenied) await openAppSettings();
    return result.isGranted;
  }

  static Permission _permission(SetupPermission p) => switch (p) {
    SetupPermission.notifications => Permission.notification,
    SetupPermission.battery => Permission.ignoreBatteryOptimizations,
  };
}
