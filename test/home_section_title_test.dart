import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/widgets/home_section.dart';
import 'package:absorb/widgets/recently_added_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A long shelf title (a collection or playlist name, a long translation)
/// is cut short on a phone instead of overflowing the header row.
void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('a long shelf title fits a 360 px phone at 1.3x text',
      (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final library = LibraryProvider();
    addTearDown(library.dispose);
    const title = 'Collection: Science fiction for long winter evenings';
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<LibraryProvider>.value(value: library),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.3)),
          child: child!,
        ),
        home: Scaffold(
          body: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: HomeSection(
                title: title,
                icon: Icons.collections_bookmark_rounded,
                entities: [
                  for (var i = 0; i < 5; i++) {'id': 'a$i', 'name': 'A $i'},
                ],
                sectionType: 'authors',
                sectionId: 'collection-c1',
                onTitleTap: () {},
              ),
            ),
          ]),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text(title), findsOneWidget);
  });

  testWidgets('a short title keeps its full width and the full divider line',
      (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final library = LibraryProvider();
    addTearDown(library.dispose);
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<LibraryProvider>.value(value: library),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: HomeSection(
                title: 'Authors',
                icon: Icons.person,
                entities: [
                  for (var i = 0; i < 5; i++) {'id': 'a$i', 'name': 'A $i'},
                ],
                sectionType: 'authors',
                sectionId: 'authors',
              ),
            ),
          ]),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    final text = tester.getSize(find.text('Authors'));
    // Ahem: every glyph is as wide as the font size.
    expect(text.width, closeTo(7 * 14 + 6 * 0.3, 2));
    final line = find.byWidgetPredicate(
        (w) => w is Container && w.constraints?.maxHeight == 0.5);
    expect(tester.getTopRight(line).dx, 340);
  });

  test('the title room leaves space for the pill and chevron when shown', () {
    expect(shelfTitleMaxWidth(320), 320 - 44);
    expect(shelfTitleMaxWidth(320, badge: true, chevron: true), 320 - 144);
    expect(shelfTitleMaxWidth(100, badge: true, chevron: true), 0);
    expect(shelfTitleMaxWidth(double.infinity), double.infinity);
  });
}
