import 'package:absorb/services/backup_service.dart';
import 'package:absorb/services/imported_settings_reload.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:absorb/services/sleep_timer_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A settings import (sync pull or restore) reaches the sleep timer and the
/// equalizer, and keeps auto sleep's end-of-chapter mode.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const packageInfo = MethodChannel('dev.fluttercommunity.plus/package_info');
  var autoSleepReloads = 0;
  var equalizerReloads = 0;

  Map<String, dynamic> autoSleep({bool? endOfChapter, int minutes = 30}) => {
        'enabled': true,
        'startHour': 22,
        'startMinute': 0,
        'endHour': 6,
        'endMinute': 0,
        'durationMinutes': minutes,
        if (endOfChapter != null) 'useEndOfChapter': endOfChapter,
      };

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      packageInfo,
      (call) async => {
        'appName': 'Absorb',
        'packageName': 'com.example.absorb',
        'version': 'fixture',
        'buildNumber': '1',
        'buildSignature': '',
        'installerStore': null,
      },
    );
    SharedPreferences.setMockInitialValues({});
    autoSleepReloads = 0;
    equalizerReloads = 0;
    ImportedSettingsReload.reloadAutoSleep = () async => autoSleepReloads++;
    ImportedSettingsReload.reloadEqualizer = () async => equalizerReloads++;
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(packageInfo, null);
  });

  test('end-of-chapter auto sleep survives an export and import', () async {
    await const AutoSleepSettings(enabled: true, useEndOfChapter: true).save();
    final exported = await BackupService.exportSettings(includeAccounts: false);
    expect((exported['autoSleep'] as Map)['useEndOfChapter'], isTrue);

    await const AutoSleepSettings(enabled: true).save();
    await BackupService.importSettings({'autoSleep': exported['autoSleep']});

    expect((await AutoSleepSettings.load()).useEndOfChapter, isTrue);
  });

  test('an older payload without the flag keeps this device\'s mode',
      () async {
    await const AutoSleepSettings(enabled: true, useEndOfChapter: true).save();
    await BackupService.importSettings({'autoSleep': autoSleep()});
    expect((await AutoSleepSettings.load()).useEndOfChapter, isTrue);
  });

  test('a changed auto sleep window reloads the sleep timer only', () async {
    await BackupService.importSettings(
        {'autoSleep': autoSleep(endOfChapter: false, minutes: 45)});
    expect(autoSleepReloads, 1);
    expect(equalizerReloads, 0);
  });

  test('a changed equalizer reloads the equalizer', () async {
    await BackupService.importSettings({
      'equalizer': {'enabled': true, 'preset': 'voice', 'bands': '1.0,2.0'},
    });
    expect(equalizerReloads, 1);
    expect(await ScopedPrefs.getString('eq_preset'), 'voice');
  });

  test('importing the same values reloads nothing', () async {
    final eq = {'enabled': true, 'preset': 'voice', 'bands': '1.0,2.0'};
    final sleep = autoSleep(endOfChapter: false, minutes: 45);
    await BackupService.importSettings({'autoSleep': sleep, 'equalizer': eq});
    autoSleepReloads = 0;
    equalizerReloads = 0;

    await BackupService.importSettings({'autoSleep': sleep, 'equalizer': eq});

    expect(autoSleepReloads, 0);
    expect(equalizerReloads, 0);
  });
}
