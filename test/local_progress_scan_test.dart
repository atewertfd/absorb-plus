import 'dart:convert';

import 'package:absorb/services/progress_sync_service.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:absorb/services/user_account_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// C9: the local progress refresh only reads ids that have a local entry,
/// found from the stored keys in one step.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const server = 'https://abs.example';
  const scopeA = 'abs.example_alice';
  const scopeB = 'abs.example_bob';

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'saved_accounts': jsonEncode([
        {'serverUrl': server, 'username': 'alice', 'token': 'a'},
        {'serverUrl': server, 'username': 'bob', 'token': 'b'},
      ]),
      'active_account_scope': scopeA,
      ScopedPrefs.keyForScope(scopeA, 'progress_mine'): '{"currentTime":1}',
      ScopedPrefs.keyForScope(scopeB, 'progress_theirs'): '{"currentTime":1}',
      // Unscoped leftovers only count while no account scope is active.
      'progress_legacy': '{"currentTime":1}',
    });
    await UserAccountService().init();
    expect(UserAccountService().activeScopeKey, scopeA);
  });

  test('only ids with a local entry of the active account', () async {
    final ids = await ProgressSyncService()
        .withLocalProgress(['mine', 'theirs', 'legacy', 'none']);
    expect(ids, {'mine'});
  });

  test('it agrees with getLocal', () async {
    final sync = ProgressSyncService();
    for (final id in ['mine', 'theirs', 'legacy', 'none']) {
      final has = (await sync.withLocalProgress([id])).isNotEmpty;
      expect(has, await sync.getLocal(id) != null, reason: id);
    }
  });
}
