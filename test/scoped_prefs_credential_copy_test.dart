import 'package:absorb/services/scoped_prefs.dart';
import 'package:absorb/services/user_account_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The unscoped-to-scoped migration must not copy the refresh token into a
/// per-account key nobody reads or deletes, and must clear old copies.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const scope = 'abs.example:13378_alice';

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'active_account_scope': scope,
      'saved_accounts': '[]',
      'refresh_token': 'fixture-refresh',
      'token_saved_at': 1,
      'wear_token_pair_pending': true,
      'some_setting': 'kept',
      // A copy an earlier migration made for another account.
      'old.example_bob:refresh_token': 'fixture-old-refresh',
      'old.example_bob:other': 'kept',
    });
  });

  test('credential keys stay global and old scoped copies are removed',
      () async {
    await UserAccountService().init();
    if (UserAccountService().activeScopeKey != scope) {
      markTestSkipped('UserAccountService did not restore the fixture scope');
      return;
    }

    await ScopedPrefs.migrateToScope();

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('$scope:some_setting'), 'kept');
    expect(prefs.containsKey('$scope:refresh_token'), isFalse);
    expect(prefs.containsKey('$scope:token_saved_at'), isFalse);
    expect(prefs.containsKey('$scope:wear_token_pair_pending'), isFalse);
    expect(prefs.containsKey('old.example_bob:refresh_token'), isFalse);
    expect(prefs.getString('old.example_bob:other'), 'kept');
    // The live global token is untouched.
    expect(prefs.getString('refresh_token'), 'fixture-refresh');
  });
}
