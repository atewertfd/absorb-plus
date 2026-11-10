import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/recent_searches.dart';
import 'package:absorb/services/user_account_service.dart';
import 'package:absorb/widgets/recent_searches_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

RecentSearches _memoryStore(Map<String, List<String>> data) => RecentSearches(
      read: (k) async => List.of(data[k] ?? const []),
      write: (k, v) async => data[k] = List.of(v),
    );

void main() {
  group('RecentSearches', () {
    test('trims, puts the newest first and de-duplicates ignoring case', () async {
      final store = _memoryStore({});
      await store.add('  Dune ');
      await store.add('Foundation');
      await store.add('dune');
      await store.add('   ');
      expect(await store.load(), ['dune', 'Foundation']);
    });

    test('keeps at most eight terms', () async {
      final store = _memoryStore({});
      for (var i = 0; i < 12; i++) {
        await store.add('term $i');
      }
      final terms = await store.load();
      expect(terms, hasLength(RecentSearches.maxTerms));
      expect(terms.first, 'term 11');
      expect(terms.last, 'term 4');
    });

    test('removes one term and clears all', () async {
      final store = _memoryStore({});
      await store.add('a');
      await store.add('b');
      expect(await store.remove('A'), ['b']);
      await store.clear();
      expect(await store.load(), isEmpty);
    });

    test('is stored per account, never shared', () async {
      SharedPreferences.setMockInitialValues({'active_account_scope': 'acctA'});
      await UserAccountService().init();
      await RecentSearches().add('Mistborn');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('active_account_scope', 'acctB');
      await UserAccountService().init();
      expect(await RecentSearches().load(), isEmpty);
      expect(prefs.getStringList('acctA:${RecentSearches.prefsKey}'), ['Mistborn']);
      expect(prefs.getStringList(RecentSearches.prefsKey), isNull);
    });
  });

  group('RecentSearchesAnchor', () {
    Future<(TextEditingController, FocusNode, List<String>)> pump(
        WidgetTester tester, Map<String, List<String>> data) async {
      final controller = TextEditingController();
      final focus = FocusNode();
      final picked = <String>[];
      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Column(children: [
            RecentSearchesAnchor(
              controller: controller,
              focusNode: focus,
              store: _memoryStore(data),
              onSelected: picked.add,
              child: TextField(controller: controller, focusNode: focus),
            ),
          ]),
        ),
      ));
      return (controller, focus, picked);
    }

    testWidgets('shows chips only while focused and empty', (tester) async {
      final data = {RecentSearches.prefsKey: ['Dune', 'Emma']};
      final (controller, focus, picked) = await pump(tester, data);
      expect(find.text('Dune'), findsNothing);

      focus.requestFocus();
      await tester.pumpAndSettle();
      expect(find.text('Dune'), findsOneWidget);
      expect(find.text('Recent searches'), findsOneWidget);

      await tester.tap(find.text('Emma'));
      expect(picked, ['Emma']);

      controller.text = 'x';
      await tester.pumpAndSettle();
      expect(find.text('Dune'), findsNothing);
    });

    testWidgets('x, long press and Clear forget terms', (tester) async {
      final data = {RecentSearches.prefsKey: ['Dune', 'Emma', 'Ivanhoe']};
      final (_, focus, _) = await pump(tester, data);
      focus.requestFocus();
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Remove').first);
      await tester.pumpAndSettle();
      expect(data[RecentSearches.prefsKey], ['Emma', 'Ivanhoe']);

      await tester.longPress(find.text('Emma'));
      await tester.pumpAndSettle();
      expect(data[RecentSearches.prefsKey], ['Ivanhoe']);

      await tester.tap(find.text('Clear'));
      await tester.pumpAndSettle();
      expect(data[RecentSearches.prefsKey], isEmpty);
      expect(find.text('Ivanhoe'), findsNothing);
    });
  });

  testWidgets('RecentSearchTapSaver fires on a tap, not on a drag', (tester) async {
    var saves = 0;
    var opens = 0;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView(children: [
          RecentSearchTapSaver(
            onTap: () => saves++,
            child: ListTile(title: const Text('Result'), onTap: () => opens++),
          ),
          const SizedBox(height: 2000),
        ]),
      ),
    ));
    await tester.tap(find.text('Result'));
    expect((saves, opens), (1, 1));
    await tester.drag(find.text('Result'), const Offset(0, -200));
    expect(saves, 1);
  });
}
