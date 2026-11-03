import 'dart:convert';

import 'package:absorb/services/account_scoped_caches.dart';
import 'package:absorb/services/player_settings.dart';
import 'package:absorb/services/user_account_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// C8: per-account settings held in memory follow the active account.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const server = 'https://abs.example';
  const scopeA = 'abs.example_alice';
  const scopeB = 'abs.example_bob';

  late int sleepReloads;
  late int syncRestarts;

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'saved_accounts': jsonEncode([
        {'serverUrl': server, 'username': 'alice', 'token': 'a'},
        {'serverUrl': server, 'username': 'bob', 'token': 'b'},
      ]),
      'active_account_scope': scopeA,
    });
    await UserAccountService().init();
    sleepReloads = 0;
    syncRestarts = 0;
    reloadAutoSleepSettings = () async => sleepReloads++;
    restartSettingsSync = () async => syncRestarts++;
  });

  test('the next account gets its own display settings and sleep window',
      () async {
    await PlayerSettings.setCoverSize('large');
    await reloadAccountScopedCaches();
    expect(PlayerSettings.coverSize, 'large');

    UserAccountService().switchTo(server, 'bob');
    expect(UserAccountService().activeScopeKey, scopeB);
    await reloadAccountScopedCaches();

    expect(PlayerSettings.coverSize, isNot('large'));
    expect(sleepReloads, 2);
    expect(syncRestarts, 2);
  });

  test('one failing part does not stop the others', () async {
    reloadAutoSleepSettings = () async => throw StateError('fixture');
    await reloadAccountScopedCaches();
    expect(syncRestarts, 1);
  });
}
