import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/app_localizations.dart';
import '../utils/fork_errors.dart';

/// The sign-in screen layouts the owner can pick from (Absorb Plus).
enum LoginDesign {
  /// Upstream's sign-in screen, unchanged.
  classic('classic'),

  /// A · one centered card, secondary options under "More ways to sign in".
  card('card'),

  /// B · server address first, then the sign-in on a second page.
  steps('steps'),

  /// B2 · B's two steps on a see-through frosted panel over a soft
  /// background (recent covers, blurred, or the accent's gradient).
  stepsGlass('steps_glass'),

  /// B3 · B's two steps in a wide glass panel with a step list, for big
  /// windows and the keyboard; B2's layout on phones.
  stepsDesktop('steps_desktop'),

  /// B4 · C's hero panel beside B's two steps (above them on phones).
  stepsHero('steps_hero'),

  /// C · a hero panel beside the form on wide windows, above it on phones.
  split('split');

  const LoginDesign(this.id);

  /// The value saved under [LoginDesignStore.key].
  final String id;

  static LoginDesign fromId(String? id) {
    for (final d in values) {
      if (d.id == id) return d;
    }
    return LoginDesign.classic;
  }

  String label(AppLocalizations l) => switch (this) {
    LoginDesign.classic => l.loginDesignClassic,
    LoginDesign.card => l.loginDesignCard,
    LoginDesign.steps => l.loginDesignSteps,
    LoginDesign.stepsGlass => l.loginDesignStepsGlass,
    LoginDesign.stepsDesktop => l.loginDesignStepsDesktop,
    LoginDesign.stepsHero => l.loginDesignStepsHero,
    LoginDesign.split => l.loginDesignSplit,
  };
}

/// The chosen sign-in screen design. Device-wide (not per account).
abstract final class LoginDesignStore {
  static const key = 'fork_login_design';

  /// The design the sign-in screen shows; it rebuilds when this changes.
  static final ValueNotifier<LoginDesign> design = ValueNotifier(
    LoginDesign.classic,
  );

  /// Reads the saved design into [design]. Called at startup.
  static Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      design.value = LoginDesign.fromId(prefs.getString(key));
    } catch (e) {
      swallow('LoginDesign', e);
    }
  }

  static Future<void> set(LoginDesign value) async {
    design.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value.id);
  }
}
