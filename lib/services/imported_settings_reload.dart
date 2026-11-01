import 'package:flutter/foundation.dart';

import 'equalizer_service.dart';
import 'scoped_prefs.dart';
import 'sleep_timer_service.dart';

/// Fork: a settings import (a settings-sync pull or a backup restore) only
/// rewrites the prefs. The sleep timer keeps its auto-sleep window in memory,
/// and the equalizer keeps its whole state there and writes it back over the
/// imported values on the next change. Capture both before the import and
/// reload whichever one changed afterwards.
///
/// Only a real change reloads: reloading auto sleep restarts a timer it
/// started, and reloading the equalizer re-applies it to the player.
class ImportedSettingsReload {
  ImportedSettingsReload._(this._autoSleep, this._equalizer);

  final String _autoSleep;
  final String _equalizer;

  @visibleForTesting
  static Future<void> Function() reloadAutoSleep =
      () => SleepTimerService().loadAutoSleepSettings();

  @visibleForTesting
  static Future<void> Function() reloadEqualizer =
      () => EqualizerService().reloadForActiveAccount();

  static Future<ImportedSettingsReload> capture() async =>
      ImportedSettingsReload._(await _autoSleepPrint(), await _equalizerPrint());

  /// Reloads what the import changed. Never throws.
  Future<void> apply() async {
    try {
      if (await _autoSleepPrint() != _autoSleep) await reloadAutoSleep();
    } catch (e) {
      debugPrint('[SettingsImport] auto sleep reload failed: $e');
    }
    try {
      if (await _equalizerPrint() != _equalizer) await reloadEqualizer();
    } catch (e) {
      debugPrint('[SettingsImport] equalizer reload failed: $e');
    }
  }

  static Future<String> _autoSleepPrint() async {
    final s = await AutoSleepSettings.load();
    return [
      s.enabled,
      s.startHour,
      s.startMinute,
      s.endHour,
      s.endMinute,
      s.durationMinutes,
      s.useEndOfChapter,
    ].join('|');
  }

  static Future<String> _equalizerPrint() async => [
        await ScopedPrefs.getBool('eq_enabled'),
        await ScopedPrefs.getString('eq_preset'),
        await ScopedPrefs.getDouble('eq_bassBoost'),
        await ScopedPrefs.getDouble('eq_virtualizer'),
        await ScopedPrefs.getDouble('eq_loudnessGain'),
        await ScopedPrefs.getString('eq_bands'),
        await ScopedPrefs.getBool('eq_mono'),
        await ScopedPrefs.getBool('eq_skipSilence'),
        await ScopedPrefs.getBool('eq_perItem'),
      ].join('|');
}
