import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui_themes/ui_theme.dart';
import '../../utils/fork_platform.dart';
import '../../widgets/beta_logging_notice.dart';
import '../../widgets/welcome_sheet.dart';

/// The pages of the first-run setup, in order.
enum SetupStep {
  welcome,
  connect,
  look,
  listening,
  downloads,
  permissions,
  done,
}

/// Pages the user may pass over with Skip (their choices save as they go,
/// so skipping just leaves the defaults).
const Set<SetupStep> kOptionalSetupSteps = {
  SetupStep.look,
  SetupStep.listening,
  SetupStep.downloads,
  SetupStep.permissions,
};

/// The pages shown on this platform. Sign-in comes before the settings
/// pages because those are saved per account (and the color with them).
List<SetupStep> setupStepsFor({required bool web, required bool android}) => [
  SetupStep.welcome,
  SetupStep.connect,
  SetupStep.look,
  SetupStep.listening,
  if (!web) SetupStep.downloads,
  if (android) SetupStep.permissions,
  SetupStep.done,
];

/// [setupStepsFor] the platform this build runs on.
List<SetupStep> currentSetupSteps() =>
    setupStepsFor(web: ForkPlatform.isWeb, android: ForkPlatform.isAndroid);

/// Absorb Plus: whether the first-run setup shows, and what finishing it
/// marks as seen. Device-wide, like the welcome sheet and the look.
abstract final class SetupFlowStore {
  /// Set once the setup was finished (or this device already had the app
  /// set up before the setup existed).
  static const doneKey = 'fork_setup_done';

  /// Set when the setup first showed, so quitting half way (even after
  /// signing in) brings it back on the next launch.
  static const startedKey = 'fork_setup_started';

  /// The first-run setup is on screen instead of sign-in and the app.
  static bool active = false;

  /// The setup was finished during this launch: the launch prompts it
  /// covered (welcome, What's new on a fresh install, the look picker, the
  /// beta logs notice) stay away.
  static bool finishedThisLaunch = false;

  @visibleForTesting
  static void debugReset() {
    active = false;
    finishedThisLaunch = false;
  }

  /// Decides at startup, after the saved accounts are loaded. A device that
  /// has an account, a sign-in, the welcome sheet seen or a look chosen was
  /// set up before this setup existed: it is marked done and never sees it.
  static Future<bool> decide({required bool hasAccounts}) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(doneKey) == true) return active = false;
    final started = prefs.getBool(startedKey) == true;
    final existingUser =
        hasAccounts ||
        prefs.getBool(WelcomeSheet.prefKey) == true ||
        (prefs.getString('server_url') ?? '').isNotEmpty ||
        prefs.containsKey(UiThemeStore.prefKey);
    if (!started && existingUser) {
      await prefs.setBool(doneKey, true);
      return active = false;
    }
    await prefs.setBool(startedKey, true);
    return active = true;
  }

  /// Finishing (Done, or "Run setup again" finished): the old one-off
  /// prompts it replaces are marked as seen.
  static Future<void> complete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(doneKey, true);
    await prefs.setBool(WelcomeSheet.prefKey, true);
    await UiThemeStore.markChosen();
    await BetaLoggingNotice.dismiss();
    active = false;
    finishedThisLaunch = true;
  }
}
