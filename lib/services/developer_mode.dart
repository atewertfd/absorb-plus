import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Hidden Developer mode (Absorb Plus).
///
/// Tapping the version line in Settings [DeveloperMode.tapsToUnlock] times
/// turns it on; it then shows a Developer page under Advanced. The page can
/// unlock the test channel with a code. Only an "unlocked" flag is stored,
/// never the code. All keys are global (not per account).
abstract final class DeveloperMode {
  static const enabledKey = 'fork_developer_mode';
  static const testChannelUnlockedKey = 'fork_test_channel_unlocked';
  static const launchCheckKey = 'fork_test_channel_launch_check';
  static const dismissedBuildKey = 'fork_test_channel_dismissed_build';

  static const tapsToUnlock = 7;

  /// SHA-256 of the trimmed, upper-cased test channel code.
  static const _testChannelCodeSha256 =
      '610a33b50debba69d628875d3274b096b63ba2cc05b7c0f6c4a6da269ae81847';

  /// Whether Developer mode is on; Settings listens to show its entry.
  static final ValueNotifier<bool> enabled = ValueNotifier<bool>(false);
  static bool _loaded = false;

  /// Reads the saved state into [enabled] (once; later calls are cheap).
  static Future<bool> load() async {
    if (!_loaded) {
      final prefs = await SharedPreferences.getInstance();
      enabled.value = prefs.getBool(enabledKey) ?? false;
      _loaded = true;
    }
    return enabled.value;
  }

  static Future<void> setEnabled(bool on) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(enabledKey, on);
    _loaded = true;
    enabled.value = on;
  }

  static Future<bool> isTestChannelUnlocked() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(testChannelUnlockedKey) ?? false;
  }

  /// Unlocks the test channel when [code] is right. Returns whether it was.
  static Future<bool> unlockTestChannel(String code) async {
    if (!codeMatches(code)) return false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(testChannelUnlockedKey, true);
    return true;
  }

  static Future<bool> launchCheckEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(launchCheckKey) ?? false;
  }

  static Future<void> setLaunchCheckEnabled(bool on) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(launchCheckKey, on);
  }

  /// The test build the launch prompt was answered "Later" for.
  static Future<int?> dismissedTestBuild() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(dismissedBuildKey);
  }

  static Future<void> setDismissedTestBuild(int build) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(dismissedBuildKey, build);
  }

  /// Whether [code] is the test channel code. Case and surrounding spaces
  /// don't matter. [expectedSha256] is for tests.
  static bool codeMatches(
    String code, {
    @visibleForTesting String? expectedSha256,
  }) {
    final normalized = code.trim().toUpperCase();
    if (normalized.isEmpty) return false;
    final digest = sha256.convert(utf8.encode(normalized)).toString();
    return digest ==
        (expectedSha256 ?? debugCodeSha256Override ?? _testChannelCodeSha256);
  }

  /// Tests set a hash of a code they know.
  @visibleForTesting
  static String? debugCodeSha256Override;

  @visibleForTesting
  static void resetForTest() {
    _loaded = false;
    enabled.value = false;
    debugCodeSha256Override = null;
    versionTaps.reset();
  }

  /// Counts taps on the version line in Settings.
  static final VersionTapCounter versionTaps = VersionTapCounter();
}

/// Counts quick taps; [tap] returns true on the [DeveloperMode.tapsToUnlock]th
/// tap in a row. A pause longer than [maxGap] starts over.
class VersionTapCounter {
  VersionTapCounter({
    this.maxGap = const Duration(seconds: 2),
    @visibleForTesting DateTime Function()? clock,
  }) : _clock = clock ?? DateTime.now;

  final Duration maxGap;
  final DateTime Function() _clock;
  int _count = 0;
  DateTime? _last;

  bool tap() {
    final now = _clock();
    final last = _last;
    if (last == null || now.difference(last) > maxGap) _count = 0;
    _last = now;
    _count++;
    if (_count >= DeveloperMode.tapsToUnlock) {
      reset();
      return true;
    }
    return false;
  }

  void reset() {
    _count = 0;
    _last = null;
  }
}
