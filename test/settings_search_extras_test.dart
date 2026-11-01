import 'dart:io';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/screens/settings_screen.dart';
import 'package:absorb/screens/settings_search_extras.dart';
import 'package:absorb/screens/settings_search_index.dart';
import 'package:absorb/widgets/welcome_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('absorb/windows_shell');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  setUp(() {
    SharedPreferences.setMockInitialValues({WelcomeSheet.prefKey: true});
    messenger.setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'getState') return <String, Object?>{};
      return null;
    });
  });

  tearDown(() => messenger.setMockMethodCallHandler(channel, null));

  Future<List<SettingSearchEntry>> allEntries(WidgetTester tester) async {
    late List<SettingSearchEntry> entries;
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(builder: (context) {
        entries = [
          ...settingsSearchEntries(context),
          ...settingsSearchExtras(context,
              bookRequests: true,
              serverAdmin: true,
              bookOrbitAdmin: true,
              updates: true),
        ];
        return const SizedBox();
      }),
    ));
    return entries;
  }

  testWidgets('every search row points at a section the Settings page keys',
      variant: TargetPlatformVariant.only(TargetPlatform.windows),
      (tester) async {
    final source =
        File('lib/screens/settings_screen.dart').readAsStringSync();
    final keyed = RegExp(r"_keyFor\('([^']+)'\)")
        .allMatches(source)
        .map((m) => m.group(1)!)
        .toSet();
    expect(source, contains('_keyFor(kSettingsTopLevelSection)'));

    final entries = await allEntries(tester);
    final orphans = entries
        .where((e) =>
            e.sectionId != kSettingsTopLevelSection &&
            !keyed.contains(e.sectionId))
        .map((e) => '${e.sectionId}: ${e.title}')
        .toList();
    expect(orphans, isEmpty);
  });

  testWidgets('extras only list rows the page shows', (tester) async {
    late List<SettingSearchEntry> plain;
    late AppLocalizations l;
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(builder: (context) {
        l = AppLocalizations.of(context)!;
        plain = settingsSearchExtras(context);
        return const SizedBox();
      }),
    ));
    final titles = plain.map((e) => e.title).toSet();
    expect(titles, contains(l.backupAndSync));
    expect(titles, contains(l.allBookmarks));
    expect(titles, isNot(contains(l.breqTitle)));
    expect(titles, isNot(contains(l.serverAdmin)));
    expect(titles, isNot(contains(l.checkForUpdate)));
    // Not Windows (the test default platform is Android).
    expect(titles, isNot(contains(l.windowsCloseToTray)));
  });

  Future<void> pumpSettings(WidgetTester tester, {double height = 2400}) async {
    tester.view.physicalSize = Size(1200, height);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<LibraryProvider>(
            create: (_) => LibraryProvider()),
      ],
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: SettingsScreen(),
      ),
    ));
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  testWidgets('a card outside any section is found and scrolled to',
      (tester) async {
    await pumpSettings(tester, height: 900);
    final field = find.byType(TextField).first;
    // Far below the fold at first.
    expect(tester.getCenter(find.text('All Bookmarks')).dy, greaterThan(900));

    await tester.enterText(field, 'bookmarks');
    await tester.pump();
    final result = find.widgetWithText(ListTile, 'All Bookmarks');
    expect(result, findsOneWidget);
    expect(find.text('Tips & Hidden Features'), findsNothing);

    await tester.tap(result);
    await settle(tester);

    // Back on the normal page (results gone), the card scrolled into view.
    expect(find.widgetWithText(ListTile, 'All Bookmarks'), findsOneWidget);
    expect(find.text('Tips & Hidden Features'), findsOneWidget);
    final card = find.text('All Bookmarks');
    expect(card, findsOneWidget);
    expect(tester.getCenter(card).dy, inInclusiveRange(0, 900));
  });

  testWidgets('a Windows switch is found and its section opens',
      variant: TargetPlatformVariant.only(TargetPlatform.windows),
      (tester) async {
    await pumpSettings(tester);
    expect(find.text('Close to tray'), findsNothing);

    await tester.enterText(find.byType(TextField).first, 'tray');
    await tester.pump();
    final result = find.widgetWithText(ListTile, 'Close to tray');
    expect(result, findsOneWidget);

    await tester.tap(result);
    await settle(tester);

    final tile = find.text('Close to tray');
    expect(tile, findsOneWidget);
    expect(tester.getCenter(tile).dy, inInclusiveRange(0, 2400));
  });
}
