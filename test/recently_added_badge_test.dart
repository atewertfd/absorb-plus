import 'package:absorb/services/scoped_prefs.dart';
import 'package:absorb/widgets/recently_added_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> _item(String id, int addedAt) => {'id': id, 'addedAt': addedAt};

Widget _shelf(List<dynamic> entities,
    {String sectionId = 'recently-added', String libraryId = 'lib1'}) {
  return MaterialApp(
    home: Scaffold(
      body: RecentlyAddedScope(
        sectionId: sectionId,
        entities: entities,
        libraryId: libraryId,
        child: Column(children: [
          const Row(children: [Text('Recently Added'), RecentlyAddedBadge()]),
          SizedBox(
            height: 100,
            child: ListView(
              key: const Key('shelf'),
              scrollDirection: Axis.horizontal,
              children: [
                for (final e in entities)
                  SizedBox(width: 300, child: Text(e['id'] as String)),
              ],
            ),
          ),
        ]),
      ),
    ),
  );
}

void main() {
  group('RecentlyAddedSeen', () {
    test('counts only items added after the mark', () {
      final items = [_item('a', 300), _item('b', 200), _item('c', 100), {'id': 'x'}];
      expect(RecentlyAddedSeen.countNew(items, 150), 2);
      expect(RecentlyAddedSeen.countNew(items, 300), 0);
      expect(RecentlyAddedSeen.countNew(items, null), 0);
      expect(RecentlyAddedSeen.newest(items), 300);
      expect(RecentlyAddedSeen.newest(const []), isNull);
    });
  });

  group('badge', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    testWidgets('first visit shows nothing and starts the mark', (tester) async {
      await tester.pumpWidget(_shelf([_item('a', 300), _item('b', 200)]));
      await tester.pumpAndSettle();
      expect(find.textContaining('new'), findsNothing);
      expect(await ScopedPrefs.getInt(RecentlyAddedSeen.key('lib1')), 300);
    });

    testWidgets('shows how many arrived since the mark', (tester) async {
      await ScopedPrefs.setInt(RecentlyAddedSeen.key('lib1'), 150);
      await tester.pumpWidget(
          _shelf([_item('a', 300), _item('b', 200), _item('c', 100)]));
      await tester.pumpAndSettle();
      expect(find.text('2 new'), findsOneWidget);
    });

    testWidgets('an item added later (Home reload) raises the count',
        (tester) async {
      await ScopedPrefs.setInt(RecentlyAddedSeen.key('lib1'), 200);
      await tester.pumpWidget(_shelf([_item('b', 200), _item('c', 100)]));
      await tester.pumpAndSettle();
      expect(find.textContaining('new'), findsNothing);
      await tester.pumpWidget(
          _shelf([_item('a', 300), _item('b', 200), _item('c', 100)]));
      await tester.pumpAndSettle();
      expect(find.text('1 new'), findsOneWidget);
    });

    testWidgets('scrolling the shelf clears it and saves the mark',
        (tester) async {
      await ScopedPrefs.setInt(RecentlyAddedSeen.key('lib1'), 100);
      await tester.pumpWidget(
          _shelf([_item('a', 300), _item('b', 200), _item('c', 100)]));
      await tester.pumpAndSettle();
      expect(find.text('2 new'), findsOneWidget);
      await tester.drag(find.byKey(const Key('shelf')), const Offset(-200, 0));
      await tester.pumpAndSettle();
      expect(find.textContaining('new'), findsNothing);
      expect(await ScopedPrefs.getInt(RecentlyAddedSeen.key('lib1')), 300);
    });

    testWidgets('a tap on the shelf clears it', (tester) async {
      await ScopedPrefs.setInt(RecentlyAddedSeen.key('lib1'), 100);
      await tester.pumpWidget(_shelf([_item('a', 300), _item('b', 200)]));
      await tester.pumpAndSettle();
      expect(find.text('2 new'), findsOneWidget);
      await tester.tap(find.text('a'));
      await tester.pumpAndSettle();
      expect(find.textContaining('new'), findsNothing);
    });

    testWidgets('marks are kept per library', (tester) async {
      await ScopedPrefs.setInt(RecentlyAddedSeen.key('lib1'), 100);
      await ScopedPrefs.setInt(RecentlyAddedSeen.key('lib2'), 250);
      await tester.pumpWidget(
          _shelf([_item('a', 300), _item('b', 200)], libraryId: 'lib2'));
      await tester.pumpAndSettle();
      expect(find.text('1 new'), findsOneWidget);
    });

    testWidgets('other shelves never show it', (tester) async {
      await ScopedPrefs.setInt(RecentlyAddedSeen.key('lib1'), 100);
      await tester.pumpWidget(_shelf([_item('a', 300)], sectionId: 'discover'));
      await tester.pumpAndSettle();
      expect(find.textContaining('new'), findsNothing);
    });
  });
}
