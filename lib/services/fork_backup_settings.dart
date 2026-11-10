import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui_themes/app_backdrop.dart';
import '../ui_themes/ui_theme.dart';
import 'login_design_store.dart';
import 'remote_link/remote_layout.dart';
import 'scoped_prefs.dart';

/// Absorb Plus: the fork's own appearance settings in a settings backup,
/// under one top-level key so upstream's payload stays as it is.
///
/// Settings sync copies only the top-level keys it allows, so none of this
/// travels between devices; a backup restore brings it back.
abstract final class ForkBackupSettings {
  static const payloadSection = 'absorbPlus';

  /// Per account (scoped), like the other appearance settings.
  static const _scopedStrings = [AppBackgroundStore.prefKey];

  /// Device-wide.
  static const _globalStrings = [
    LoginDesignStore.key,
    RemoteLayoutStore.layoutKey,
    RemoteLayoutStore.lookKey,
    UiThemeStore.prefKey,
    UiThemeStore.glassPrefKey,
  ];
  static const _globalBools = [
    LookDetailsStore.fullQualityCoversKey,
    LookDetailsStore.extraCoverBadgesKey,
    LookDetailsStore.continueReadingShelfKey,
    LookDetailsStore.compactHeaderButtonsKey,
  ];

  /// What the backup carries; only settings that were ever set.
  static Future<Map<String, dynamic>> export() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      for (final key in _scopedStrings)
        if (await ScopedPrefs.getString(key) case final v?) key: v,
      for (final key in _globalStrings)
        if (prefs.getString(key) case final v?) key: v,
      for (final key in _globalBools)
        if (prefs.getBool(key) case final v?) key: v,
    };
  }

  /// Writes what [data] carries (ignoring anything of the wrong type) and
  /// reloads the stores that keep the value in memory. Never throws: a bad
  /// fork section must not fail the rest of the restore.
  static Future<void> import(Object? data) async {
    if (data is! Map) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      for (final key in _scopedStrings) {
        final v = data[key];
        if (v is String) await ScopedPrefs.setString(key, v);
      }
      for (final key in _globalStrings) {
        final v = data[key];
        if (v is String) await prefs.setString(key, v);
      }
      for (final key in _globalBools) {
        final v = data[key];
        if (v is bool) await prefs.setBool(key, v);
      }
      await reload();
    } catch (e) {
      debugPrint('[Backup] Absorb Plus settings restore failed: $e');
    }
  }

  @visibleForTesting
  static Future<void> Function() reload = () async {
    await UiThemeStore.load();
    await AppBackgroundStore.load();
    await LoginDesignStore.load();
  };
}
