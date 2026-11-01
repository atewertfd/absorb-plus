import 'dart:async';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/l10n/app_localizations_en.dart';
import 'package:absorb/services/desktop_shortcuts.dart';
import 'package:absorb/widgets/desktop_shortcut_help.dart';
import 'package:absorb/widgets/desktop_shortcut_scope.dart';
import 'package:absorb/widgets/quick_switcher.dart';
import 'package:absorb/widgets/quick_switcher_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// The Ctrl+K quick switcher: action filtering, the debounced library
/// search, keyboard navigation and the shortcut that opens it.
void main() {
  final l = AppLocalizationsEn();
  final windows = TargetPlatformVariant.only(TargetPlatform.windows);

  QuickSwitcherEntry action(String title, List<String> ran,
          [String keywords = '']) =>
      QuickSwitcherEntry(
        kind: QuickSwitcherKind.action,
        title: title,
        keywords: keywords,
        icon: Icons.bolt,
        onSelected: () => ran.add(title),
      );

  test('actions match every typed word in the title or keywords', () {
    final ran = <String>[];
    final actions = [
      action('Go to Home', ran),
      action('Sleep timer', ran, 'bedtime'),
      action('Play / pause', ran, 'resume'),
    ];
    expect(filterQuickSwitcherActions(actions, ''), actions);
    expect(
      filterQuickSwitcherActions(actions, 'go HOME').map((e) => e.title),
      ['Go to Home'],
    );
    expect(
      filterQuickSwitcherActions(actions, 'bedtime').map((e) => e.title),
      ['Sleep timer'],
    );
    expect(filterQuickSwitcherActions(actions, 'home sleep'), isEmpty);
  });

  test('search responses become book, series and author rows', () {
    final opened = <String>[];
    final entries = quickSwitcherEntriesFromSearch(
      {
        'book': [
          {
            'libraryItem': {
              'id': 'b1',
              'media': {
                'metadata': {'title': 'Dune', 'authorName': 'Frank Herbert'},
              },
            },
          },
        ],
        'series': [
          {
            'series': {'id': 's1', 'name': 'Dune Chronicles'},
            'books': [
              {'id': 'b1'},
              {'id': 'b2'},
            ],
          },
        ],
        'authors': [
          {'id': 'a1', 'name': 'Frank Herbert', 'numBooks': 3},
        ],
      },
      isPodcast: false,
      l: l,
      coverUrl: (id) => 'cover/$id',
      authorImageUrl: (author) => null,
      open: (kind, data) => opened.add('${kind.name}:${data['id'] ?? ''}'),
    );
    expect(entries.map((e) => e.kind), [
      QuickSwitcherKind.book,
      QuickSwitcherKind.series,
      QuickSwitcherKind.author,
    ]);
    expect(entries[0].title, 'Dune');
    expect(entries[0].subtitle, 'Frank Herbert');
    expect(entries[0].imageUrl, 'cover/b1');
    expect(entries[1].title, 'Dune Chronicles');
    expect(entries[1].imageUrl, 'cover/b1');
    expect(entries[2].subtitle, l.librarySearchResultsBookCount(3));
    for (final entry in entries) {
      entry.onSelected();
    }
    expect(opened, ['book:b1', 'series:', 'author:a1']);
  });

  test('podcast libraries read the podcast list', () {
    final entries = quickSwitcherEntriesFromSearch(
      {
        'podcast': [
          {
            'libraryItem': {
              'id': 'p1',
              'media': {
                'metadata': {'title': 'Show', 'author': 'Host'},
              },
            },
          },
        ],
        'book': [
          {'libraryItem': {'id': 'x'}},
        ],
      },
      isPodcast: true,
      l: l,
      coverUrl: (_) => null,
      authorImageUrl: (_) => null,
      open: (_, __) {},
    );
    expect(entries.single.kind, QuickSwitcherKind.podcast);
    expect(entries.single.subtitle, 'Host');
  });

  group('dialog', () {
    late List<String> ran;
    late List<String> searched;
    late Map<String, Completer<List<QuickSwitcherEntry>>> pending;

    QuickSwitcherEntry book(String title) => QuickSwitcherEntry(
          kind: QuickSwitcherKind.book,
          title: title,
          subtitle: 'Some Author',
          onSelected: () => ran.add(title),
        );

    Future<void> open(
      WidgetTester tester, {
      double textScale = 1,
      int extraActions = 0,
    }) async {
      ran = [];
      searched = [];
      pending = {};
      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () => showQuickSwitcher(
                context,
                actions: [
                  action('Go to Home', ran),
                  action('Go to Stats', ran),
                  action('Sleep timer', ran),
                  for (var i = 0; i < extraActions; i++)
                    action('Action $i', ran),
                ],
                search: (query) {
                  searched.add(query);
                  return (pending[query] = Completer()).future;
                },
              ),
              child: const Text('open'),
            ),
          ),
        ),
      ));
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    testWidgets('lists the actions, filters them as you type',
        (tester) async {
      await open(tester);
      expect(find.text('Go to Home'), findsOneWidget);
      expect(find.text('Sleep timer'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'sleep');
      await tester.pump();
      expect(find.text('Go to Home'), findsNothing);
      expect(find.text('Sleep timer'), findsOneWidget);
      await tester.pump(quickSwitcherDebounce);
      pending['sleep']!.complete(const []);
      await tester.pumpAndSettle();
    });

    testWidgets('searches the library once typing pauses for 250 ms',
        (tester) async {
      await open(tester);
      await tester.enterText(find.byType(TextField), 'du');
      await tester.pump(const Duration(milliseconds: 100));
      await tester.enterText(find.byType(TextField), 'dune');
      await tester.pump(const Duration(milliseconds: 249));
      expect(searched, isEmpty);
      await tester.pump(const Duration(milliseconds: 1));
      expect(searched, ['dune']);
      pending['dune']!.complete([book('Dune'), book('Dune Messiah')]);
      await tester.pumpAndSettle();
      expect(find.text('Dune'), findsOneWidget);
      expect(find.text('Dune Messiah'), findsOneWidget);
      expect(find.text('Some Author'), findsNWidgets(2));
    });

    testWidgets('a slow answer for an old query is dropped', (tester) async {
      await open(tester);
      await tester.enterText(find.byType(TextField), 'old');
      await tester.pump(quickSwitcherDebounce);
      await tester.enterText(find.byType(TextField), 'new');
      await tester.pump(quickSwitcherDebounce);
      pending['new']!.complete([book('New Book')]);
      await tester.pump();
      pending['old']!.complete([book('Old Book')]);
      await tester.pumpAndSettle();
      expect(find.text('New Book'), findsOneWidget);
      expect(find.text('Old Book'), findsNothing);
    });

    testWidgets('arrow keys move the highlight and Enter opens it',
        (tester) async {
      await open(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();
      expect(find.byType(QuickSwitcherDialog), findsNothing);
      expect(ran, ['Go to Stats']);
    });

    testWidgets('Up from the first row wraps to the last', (tester) async {
      await open(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();
      expect(ran, ['Sleep timer']);
    });

    testWidgets('rows grow with a large system text size', (tester) async {
      await open(tester, textScale: 2);
      await tester.enterText(find.byType(TextField), 'dune');
      await tester.pump(quickSwitcherDebounce);
      pending['dune']!.complete([book('Dune'), book('Dune Messiah')]);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: 'no overflow');
      final title = tester.getRect(find.text('Dune Messiah'));
      final author = tester.getRect(find.text('Some Author').last);
      expect(author.top, greaterThanOrEqualTo(title.bottom - 0.5));
    });

    testWidgets('a highlighted row past the fold is shown in full',
        (tester) async {
      await open(tester, extraActions: 20);
      final list = tester.getRect(find.byType(ListView));
      // Wrap from the first row to the last.
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();
      final last = tester.getRect(find.ancestor(
        of: find.text('Action 19'),
        matching: find.byType(InkWell),
      ));
      expect(last.bottom, lessThanOrEqualTo(list.bottom - 8 + 0.5));
      // And back to the first, with the list's top padding showing.
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      final first = tester.getRect(find.ancestor(
        of: find.text('Go to Home'),
        matching: find.byType(InkWell),
      ));
      expect(first.top, greaterThanOrEqualTo(list.top + 8 - 0.5));
      // Down past the fold: the new row's bottom is on screen.
      for (var i = 0; i < 9; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      }
      await tester.pump();
      final ninth = tester.getRect(find.ancestor(
        of: find.text('Action 6'),
        matching: find.byType(InkWell),
      ));
      expect(ninth.bottom, lessThanOrEqualTo(list.bottom + 0.5));
    });

    testWidgets('clicking a row opens it', (tester) async {
      await open(tester);
      await tester.tap(find.text('Sleep timer'));
      await tester.pumpAndSettle();
      expect(ran, ['Sleep timer']);
    });

    testWidgets('Esc closes without running anything', (tester) async {
      await open(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();
      expect(find.byType(QuickSwitcherDialog), findsNothing);
      expect(ran, isEmpty);
    });

    testWidgets('says so when nothing matches', (tester) async {
      await open(tester);
      await tester.enterText(find.byType(TextField), 'zzz');
      await tester.pump(quickSwitcherDebounce);
      pending['zzz']!.complete(const []);
      await tester.pumpAndSettle();
      expect(find.text(l.quickSwitcherNoResults), findsOneWidget);
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();
      expect(find.byType(QuickSwitcherDialog), findsOneWidget);
    });
  });

  group('Ctrl+K', () {
    late List<DesktopShortcutAction> ran;
    late GlobalKey<NavigatorState> navKey;

    setUp(() {
      ran = [];
      navKey = GlobalKey<NavigatorState>();
      DesktopShortcutScope.handlers = DesktopShortcutHandlers(
        canRun: (_) => true,
        run: ran.add,
        canSwitchCard: () => false,
        switchCard: (_) {},
      );
    });
    tearDown(() => DesktopShortcutScope.handlers = null);

    Future<void> pumpApp(WidgetTester tester, Widget body) async {
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => DesktopShortcutScope(child: child!),
        home: Focus(
          focusNode: desktopShellFocusNode,
          autofocus: true,
          child: Scaffold(body: body),
        ),
      ));
      await tester.pump();
    }

    Future<void> ctrlK(WidgetTester tester) async {
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.keyK);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
    }

    testWidgets('opens the quick switcher from the shell', variant: windows,
        (tester) async {
      await pumpApp(tester, const Text('shell'));
      await ctrlK(tester);
      expect(ran, [DesktopShortcutAction.quickSwitcher]);
    });

    testWidgets('works while typing in a text field', variant: windows,
        (tester) async {
      await pumpApp(tester, const TextField());
      await tester.tap(find.byType(TextField));
      await tester.pump();
      expect(isTypingInTextField(), isTrue);
      await ctrlK(tester);
      expect(ran, [DesktopShortcutAction.quickSwitcher]);
    });

    testWidgets('does nothing while a dialog is open', variant: windows,
        (tester) async {
      await pumpApp(tester, const Text('shell'));
      navKey.currentState!.push(DialogRoute<void>(
        context: navKey.currentContext!,
        builder: (_) => const AlertDialog(content: TextField(autofocus: true)),
      ));
      await tester.pumpAndSettle();
      await ctrlK(tester);
      expect(ran, isEmpty);
    });

    testWidgets('the header icon opens it too', variant: windows,
        (tester) async {
      await pumpApp(tester, const QuickSwitcherButton());
      expect(QuickSwitcherButton.available, isTrue);
      await tester.tap(find.byIcon(Icons.search_rounded));
      expect(ran, [DesktopShortcutAction.quickSwitcher]);
    });

    test('is listed in the keyboard shortcuts dialog', () {
      final rows = desktopShortcutHelpEntries(l);
      expect(
        rows.where((r) => r.keys == 'Ctrl+K').single.description,
        l.desktopShortcutQuickSwitcher,
      );
    });
  });

  testWidgets('the app actions cover tabs, playback, sleep and shortcuts',
      (tester) async {
    final tabs = <int>[];
    final navActions = <String>[];
    late List<QuickSwitcherEntry> actions;
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(builder: (context) {
        actions = quickSwitcherAppActions(
          context,
          l,
          QuickSwitcherAppCallbacks(
            goToTab: tabs.add,
            runNavAction: navActions.add,
          ),
        );
        return const SizedBox();
      }),
    ));
    expect(actions.map((a) => a.title), [
      l.quickSwitcherGoHome,
      l.quickSwitcherGoLibrary,
      l.quickSwitcherGoAbsorbing,
      l.quickSwitcherGoStats,
      l.quickSwitcherGoSettings,
      l.quickSwitcherGoDownloads,
      l.quickSwitcherPlayPause,
      l.quickSwitcherSleepTimer,
      l.desktopShortcutsTitle,
    ]);
    for (final a in actions.take(8)) {
      a.onSelected();
    }
    expect(tabs, [0, 1, 2, 3, 4]);
    expect(navActions, ['downloads', 'playPause', 'sleep']);
    actions.last.onSelected();
    await tester.pumpAndSettle();
    expect(find.text(l.desktopShortcutQuickSwitcher), findsOneWidget);
  });
}
