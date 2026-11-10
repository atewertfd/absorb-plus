import 'dart:convert';
import 'dart:io';

import 'package:absorb/services/home_shelf_snapshot.dart';
import 'package:absorb/services/user_account_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

void main() {
  late Directory dir;
  late HomeShelfSnapshot snapshots;

  setUp(() {
    dir = Directory.systemTemp.createTempSync('home_snapshot_test');
    snapshots = HomeShelfSnapshot(baseDirectory: () async => dir);
  });
  tearDown(() => dir.deleteSync(recursive: true));

  final shelves = [
    {
      'id': 'continue-listening',
      'entities': [
        {'id': 'li-1', 'updatedAt': 5},
      ],
    },
  ];

  test('saved shelves come back for the same account and library', () async {
    await snapshots.save('server_a', 'lib-1', shelves);
    expect(await snapshots.load('server_a', 'lib-1'), shelves);
  });

  test('another account or library sees nothing', () async {
    await snapshots.save('server_a', 'lib-1', shelves);
    expect(await snapshots.load('server_b', 'lib-1'), isNull);
    expect(await snapshots.load('server_a', 'lib-2'), isNull);
  });

  test('a stale or broken snapshot is ignored', () async {
    await snapshots.save('server_a', 'lib-1', shelves);
    final file = dir
        .listSync(recursive: true)
        .whereType<File>()
        .single;
    file.setLastModifiedSync(DateTime.now()
        .subtract(HomeShelfSnapshot.maxAge + const Duration(hours: 1)));
    expect(await snapshots.load('server_a', 'lib-1'), isNull);

    file.writeAsStringSync('{not json');
    expect(await snapshots.load('server_a', 'lib-1'), isNull);
  });

  test('C15 forgetting an account removes all of its libraries\' shelves',
      () async {
    await snapshots.save('server_a', 'lib-1', shelves);
    await snapshots.save('server_a', 'lib-2', shelves);
    await snapshots.save('server_b', 'lib-1', shelves);

    await snapshots.clearScope('server_a');

    expect(await snapshots.load('server_a', 'lib-1'), isNull);
    expect(await snapshots.load('server_a', 'lib-2'), isNull);
    expect(await snapshots.load('server_b', 'lib-1'), shelves);
  });

  test('C15 expired snapshots are deleted, fresh ones kept', () async {
    await snapshots.save('server_a', 'lib-1', shelves);
    await snapshots.save('server_b', 'lib-1', shelves);
    final files = dir.listSync(recursive: true).whereType<File>().toList();
    expect(files, hasLength(2));
    files.first.setLastModifiedSync(DateTime.now()
        .subtract(HomeShelfSnapshot.maxAge + const Duration(hours: 1)));

    await snapshots.pruneExpired();

    expect(files.first.existsSync(), isFalse);
    expect(files.last.existsSync(), isTrue);
  });

  test('C15 removing a saved account clears its shelves', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    fakePathProvider(dir.path, everyFolder: true);
    addTearDown(clearFakePathProvider);
    SharedPreferences.setMockInitialValues({
      'saved_accounts': jsonEncode([
        {'serverUrl': 'https://abs.example', 'username': 'alice', 'token': 't'},
      ]),
    });
    final accounts = UserAccountService();
    await accounts.init();
    final scope = accounts.accounts.single.scopeKey;
    await HomeShelfSnapshot.instance.save(scope, 'lib-1', shelves);
    expect(await HomeShelfSnapshot.instance.load(scope, 'lib-1'), shelves);

    await accounts.removeAccount('https://abs.example', 'alice');
    for (var i = 0;
        i < 20 && await HomeShelfSnapshot.instance.load(scope, 'lib-1') != null;
        i++) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }

    expect(await HomeShelfSnapshot.instance.load(scope, 'lib-1'), isNull);
  });

  test('a snapshot from before the per-account folders is still read, '
      'then moved on the next save', () async {
    // Where earlier builds kept it: straight under home_shelves.
    await snapshots.save('server_a', 'lib-1', shelves);
    final current = dir.listSync(recursive: true).whereType<File>().single;
    final legacy = File('${dir.path}${Platform.pathSeparator}home_shelves'
        '${Platform.pathSeparator}${current.uri.pathSegments.last}');
    current.renameSync(legacy.path);

    expect(await snapshots.load('server_a', 'lib-1'), shelves);
    await snapshots.save('server_a', 'lib-1', shelves);
    expect(legacy.existsSync(), isFalse);
    expect(await snapshots.load('server_a', 'lib-1'), shelves);
  });
}
