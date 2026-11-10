import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/widgets/home_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Each Home shelf keeps its own horizontal scroll position. They used to
/// trade positions when a shelf above appeared or went away (playlists
/// hidden offline, a Home reload, Customize Home).
void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  List<Map<String, dynamic>> authors(String prefix) => [
        for (var i = 0; i < 20; i++) {'id': '$prefix$i', 'name': '$prefix $i'},
      ];

  Widget shelf(String id) => HomeSection(
        title: 'Shelf $id',
        icon: Icons.person,
        entities: authors(id),
        sectionType: 'authors',
        sectionId: id,
      );

  // Unkeyed slivers, as positional as the Home screen's own list can be.
  Widget home(LibraryProvider library, List<String> ids) =>
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
          ChangeNotifierProvider<LibraryProvider>.value(value: library),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                for (final id in ids) SliverToBoxAdapter(child: shelf(id)),
              ],
            ),
          ),
        ),
      );

  ScrollPosition shelfPosition(WidgetTester tester, String id) {
    final list = find.ancestor(
      of: find.text('Shelf $id'),
      matching: find.byType(HomeSection),
    );
    final scrollable = find.descendant(
      of: list,
      matching: find.byWidgetPredicate(
        (w) => w is Scrollable && w.axisDirection == AxisDirection.right,
      ),
    );
    return tester.state<ScrollableState>(scrollable).position;
  }

  testWidgets('a shelf keeps its scroll position when one above goes away',
      (tester) async {
    final library = LibraryProvider();
    addTearDown(library.dispose);
    await tester.pumpWidget(home(library, ['a', 'b']));
    await tester.pumpAndSettle();

    final b = shelfPosition(tester, 'b');
    b.jumpTo(396); // three author cards in, where the shelf snaps
    b.didEndScroll(); // saves the offset, as the end of a drag does
    await tester.pumpAndSettle();
    expect(shelfPosition(tester, 'a').pixels, 0);

    // Shelf "a" is hidden (say, a playlist while offline).
    await tester.pumpWidget(home(library, ['b']));
    await tester.pumpAndSettle();
    expect(shelfPosition(tester, 'b').pixels, 396);

    // And it comes back at the start, not with b's offset.
    await tester.pumpWidget(home(library, ['a', 'b']));
    await tester.pumpAndSettle();
    expect(shelfPosition(tester, 'a').pixels, 0);
    expect(shelfPosition(tester, 'b').pixels, 396);
  });
}
