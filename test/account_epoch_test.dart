import 'dart:async';
import 'dart:convert';

import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/services/account_epoch.dart';
import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/user_account_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Hands the library a fake connection without signing anything in.
class _FakeAuth extends AuthProvider {
  _FakeAuth(this.api);
  final ApiService api;

  @override
  bool get isAuthenticated => false;

  @override
  bool get isSignedOut => false;

  @override
  ApiService? get apiService => api;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const server = 'https://audiobookshelf.example';
  const scopeA = 'audiobookshelf.example_alice';

  setUp(() async {
    AccountEpoch.resetForTest();
    UserAccountService.beforeAccountChange = null;
    SharedPreferences.setMockInitialValues({
      'saved_accounts': jsonEncode([
        {'serverUrl': server, 'username': 'alice', 'token': 'a-token'},
        {'serverUrl': server, 'username': 'bob', 'token': 'b-token'},
      ]),
      'active_account_scope': scopeA,
    });
    await UserAccountService().init();
  });

  test('moving to another account advances the epoch while the old scope is '
      'still active', () async {
    final seen = <String>[];
    AccountEpoch.addHandler(() async {
      seen.add(UserAccountService().activeScopeKey);
    });
    final start = AccountEpoch.current;

    await UserAccountService().saveAccount(
        SavedAccount(serverUrl: server, username: 'bob', token: 'b-token'));

    expect(AccountEpoch.isCurrent(start), isFalse);
    expect(seen, [scopeA]);
  });

  test('signing back into the same account keeps the epoch', () async {
    var calls = 0;
    AccountEpoch.addHandler(() async => calls++);
    var hookCalls = 0;
    UserAccountService.beforeAccountChange = (_) async => hookCalls++;
    final start = AccountEpoch.current;

    await UserAccountService().saveAccount(
        SavedAccount(serverUrl: server, username: 'alice', token: 'new'));

    expect(AccountEpoch.isCurrent(start), isTrue);
    expect(calls, 0);
    expect(hookCalls, 1, reason: 'the signed-out playback hook still runs');
  });

  test('a backup restore rewriting the account list keeps the epoch',
      () async {
    final start = AccountEpoch.current;
    await UserAccountService().saveAccount(
        SavedAccount(serverUrl: server, username: 'bob', token: 'b-token'),
        restoring: true);
    expect(AccountEpoch.isCurrent(start), isTrue);
  });

  test('a failing handler does not stop the account change', () async {
    AccountEpoch.addHandler(() async => throw StateError('boom'));
    await UserAccountService().saveAccount(
        SavedAccount(serverUrl: server, username: 'bob', token: 'b-token'));
    expect(UserAccountService().activeScopeKey, 'audiobookshelf.example_bob');
  });

  test('a library list that arrives after an account change is dropped',
      () async {
    final requested = Completer<void>();
    final release = Completer<void>();
    final api = ApiService(
      baseUrl: server,
      token: 'a-token',
      httpClient: MockClient((request) async {
        if (request.url.path == '/api/libraries') {
          requested.complete();
          await release.future;
          return http.Response(
              jsonEncode({
                'libraries': [
                  {'id': 'lib-a', 'name': 'Alice books', 'mediaType': 'book'},
                ],
              }),
              200);
        }
        return http.Response('{}', 404);
      }),
    );
    final lib = LibraryProvider()..updateAuth(_FakeAuth(api));
    addTearDown(lib.dispose);

    final load = lib.loadLibraries();
    await requested.future;
    await AccountEpoch.advance();
    release.complete();
    await load;

    expect(lib.libraries, isEmpty);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getKeys().where((k) => k.contains('cached_libraries')), isEmpty,
        reason: "the old account's list must not be cached for the next one");
  });
}
