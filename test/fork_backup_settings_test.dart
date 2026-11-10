import 'package:absorb/services/backup_service.dart';
import 'package:absorb/services/fork_backup_settings.dart';
import 'package:absorb/services/imported_settings_reload.dart';
import 'package:absorb/services/login_design_store.dart';
import 'package:absorb/services/remote_link/remote_layout.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:absorb/ui_themes/app_backdrop.dart';
import 'package:absorb/ui_themes/ui_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

/// A settings backup carries the fork's appearance settings (app background,
/// sign-in design, phone remote layout and look, the look itself) and a
/// restore brings them back; settings sync never sees them.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  var reloads = 0;

  setUp(() {
    fakePackageInfo();
    SharedPreferences.setMockInitialValues({});
    reloads = 0;
    ForkBackupSettings.reload = () async => reloads++;
    ImportedSettingsReload.reloadAutoSleep = () async {};
    ImportedSettingsReload.reloadEqualizer = () async {};
  });

  tearDown(clearFakePackageInfo);

  Future<void> seed() async {
    final prefs = await SharedPreferences.getInstance();
    await ScopedPrefs.setString(AppBackgroundStore.prefKey, 'book_colors');
    await prefs.setString(LoginDesignStore.key, 'steps_glass');
    await prefs.setString(RemoteLayoutStore.layoutKey, '[{"block":"clock"}]');
    await prefs.setString(RemoteLayoutStore.lookKey, '{"dim":5}');
    await prefs.setString(UiThemeStore.prefKey, 'frosted');
    await prefs.setString(UiThemeStore.glassPrefKey, 'strong');
    await prefs.setBool(LookDetailsStore.compactHeaderButtonsKey, true);
  }

  test('export, wipe, import round-trips the fork settings', () async {
    await seed();
    final exported = await BackupService.exportSettings(includeAccounts: false);
    final fork = exported[ForkBackupSettings.payloadSection] as Map;
    expect(fork[LoginDesignStore.key], 'steps_glass');
    expect(fork[AppBackgroundStore.prefKey], 'book_colors');

    SharedPreferences.setMockInitialValues({});
    await BackupService.importSettings({ForkBackupSettings.payloadSection: fork});

    final prefs = await SharedPreferences.getInstance();
    expect(
      await ScopedPrefs.getString(AppBackgroundStore.prefKey),
      'book_colors',
    );
    expect(prefs.getString(LoginDesignStore.key), 'steps_glass');
    expect(prefs.getString(RemoteLayoutStore.layoutKey), '[{"block":"clock"}]');
    expect(prefs.getString(RemoteLayoutStore.lookKey), '{"dim":5}');
    expect(prefs.getString(UiThemeStore.prefKey), 'frosted');
    expect(prefs.getString(UiThemeStore.glassPrefKey), 'strong');
    expect(prefs.getBool(LookDetailsStore.compactHeaderButtonsKey), isTrue);
    expect(reloads, 1);
  });

  test('settings never set are left out of the backup', () async {
    final exported = await BackupService.exportSettings(includeAccounts: false);
    expect(exported[ForkBackupSettings.payloadSection], isEmpty);
  });

  test('an older backup without the section changes nothing', () async {
    await seed();
    await BackupService.importSettings({'settings': <String, dynamic>{}});
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(LoginDesignStore.key), 'steps_glass');
    expect(reloads, 0);
  });

  test('wrong types are ignored, not written', () async {
    await seed();
    await BackupService.importSettings({
      ForkBackupSettings.payloadSection: {
        LoginDesignStore.key: 3,
        LookDetailsStore.compactHeaderButtonsKey: 'yes',
        UiThemeStore.prefKey: 'plus',
      },
    });
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(LoginDesignStore.key), 'steps_glass');
    expect(prefs.getBool(LookDetailsStore.compactHeaderButtonsKey), isTrue);
    expect(prefs.getString(UiThemeStore.prefKey), 'plus');
  });
}
