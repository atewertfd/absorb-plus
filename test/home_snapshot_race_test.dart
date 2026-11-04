import 'dart:convert';
import 'dart:io';

import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/home_shelf_snapshot.dart';
import 'package:absorb/services/user_account_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

/// C10: a server that answers Home with no shelves before the saved copy
/// has been read must win; the saved copy used to replace the real answer.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory dir;

  setUp(() {
    dir = Directory.systemTemp.createTempSync('home_snapshot_race_');
    fakePathProvider(dir.path, everyFolder: true);
  });

  tearDown(() {
    clearFakePathProvider();
    try {
      dir.deleteSync(recursive: true);
    } catch (_) {}
  });

  test('an empty server answer is not replaced by the saved shelves', () async {
    SharedPreferences.setMockInitialValues({
      'saved_accounts': jsonEncode([
        {'serverUrl': 'https://abs.example', 'username': 'alice', 'token': 't'},
      ]),
      'active_account_scope': 'abs.example_alice',
    });
    await UserAccountService().init();
    final scope = UserAccountService().activeScopeKey;
    expect(scope, isNotEmpty);
    await HomeShelfSnapshot.instance.save(scope, 'lib-1', [
      {
        'id': 'continue-listening',
        'entities': [
          {'id': 'old-book'},
        ],
      },
    ]);

    final api = ApiService(
      baseUrl: 'https://abs.example',
      token: 't',
      isLegacyToken: true,
      httpClient: MockClient((request) async {
        if (request.url.path == '/api/libraries/lib-1/personalized') {
          return http.Response('[]', 200);
        }
        return http.Response('{}', 404);
      }),
    );
    final lib = LibraryProvider()..updateAuth(FakeAuth(api));
    addTearDown(lib.dispose);

    await lib.selectLibrary('lib-1');
    // Give the saved copy's read and decode time to land after the answer.
    for (var i = 0; i < 20; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 20));
    }

    expect(lib.personalizedSections, isEmpty);
  });
}
