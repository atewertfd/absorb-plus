import 'package:absorb/services/precache_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Set<String> cached;
  late List<String> downloaded;
  late Map<String, Map<String, dynamic>> primed;
  late bool unmetered;

  PrecacheService service() => PrecacheService(
        isUnmetered: () async => unmetered,
        isCoverCached: (key) async => cached.contains(key),
        downloadCover: (url, key, headers) async {
          downloaded.add(url);
          cached.add(key);
        },
        onItem: (id, item) => primed[id] = item,
        inForeground: () => true,
        startDelay: Duration.zero,
        gap: Duration.zero,
      );

  String cover(String id) =>
      'https://abs.example/api/items/$id/cover?width=400&token=t';

  PrecacheSource source({
    List<String> home = const ['a', 'b'],
    List<String> detail = const ['a'],
    List<String> library = const ['b', 'c', 'd'],
    bool Function()? stillValid,
  }) =>
      PrecacheSource(
        scope: 'server_user',
        libraryId: 'lib',
        homeItemIds: home,
        detailItemIds: detail,
        libraryPage: (page, limit) async => page == 0
            ? [for (final id in library) {'id': id}]
            : const [],
        fetchItem: (id) async => {'id': id, 'full': true},
        coverUrl: cover,
        headers: const {},
        stillValid: stillValid ?? () => true,
      );

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    cached = {};
    downloaded = [];
    primed = {};
    unmetered = true;
  });

  test('fetches likely book pages, then Home covers, then the library',
      () async {
    final result = await service().run(source());
    expect(primed.keys, ['a']);
    expect(downloaded, [cover('a'), cover('b'), cover('c'), cover('d')]);
    expect(result, (covers: 4, items: 1));
  });

  test('covers already on disk are skipped (cache key without the token)',
      () async {
    await service().run(source());
    downloaded.clear();
    final again = await service().run(source());
    expect(downloaded, isEmpty);
    expect(again.covers, 0);
  });

  test('nothing happens when turned off or on a metered network', () async {
    await PrecacheService.setEnabled(false);
    expect(await service().run(source()), (covers: 0, items: 0));
    await PrecacheService.setEnabled(true);
    unmetered = false;
    expect(await service().run(source()), (covers: 0, items: 0));
    expect(downloaded, isEmpty);
    expect(primed, isEmpty);
  });

  test('stops as soon as the session is no longer valid', () async {
    var checks = 0;
    await service().run(source(stillValid: () => ++checks <= 2));
    expect(downloaded.length, lessThan(4));
  });

  test('at most maxDetailItems book pages are fetched', () async {
    final many = [for (var i = 0; i < 30; i++) 'id$i'];
    final result =
        await service().run(source(home: const [], detail: many, library: const []));
    expect(result.items, PrecacheService.maxDetailItems);
  });
}
