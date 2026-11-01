import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/library_screen.dart' show LibrarySort;
import 'package:absorb/widgets/alphabet_scroller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The library grid's A-Z rail: letters, jump targets, and the rail itself.
void main() {
  test('items file under their first letter, accents folded', () {
    expect(alphabetLetterOf('dune'), 'D');
    expect(alphabetLetterOf('  Émile'), 'E');
    expect(alphabetLetterOf('Ørsted'), 'O');
    expect(alphabetLetterOf('1984'), '#');
    expect(alphabetLetterOf('東京'), '#');
    expect(alphabetLetterOf(''), '#');
    expect(alphabetLetterOf(null), '#');
  });

  test('a letter jumps to its first item, else the next one in order', () {
    final letters = ['#', 'A', 'A', 'C', 'C', 'F'];
    expect(alphabetJumpIndex(letters, 'A'), 1);
    expect(alphabetJumpIndex(letters, 'C'), 3);
    expect(alphabetJumpIndex(letters, 'B'), 3);
    expect(alphabetJumpIndex(letters, '#'), 0);
    expect(alphabetJumpIndex(letters, 'G'), isNull);

    final down = ['Z', 'X', 'X', 'M', 'B'];
    expect(alphabetJumpIndex(down, 'Y', descending: true), 1);
    expect(alphabetJumpIndex(down, 'C', descending: true), 4);
    expect(alphabetJumpIndex(down, 'A', descending: true), isNull);
  });

  test('only title and author sorts get a rail', () {
    expect(librarySortHasAlphabet(LibrarySort.alphabetical), isTrue);
    expect(librarySortHasAlphabet(LibrarySort.authorName), isTrue);
    expect(librarySortHasAlphabet(LibrarySort.recentlyAdded), isFalse);
    expect(librarySortHasAlphabet(LibrarySort.duration), isFalse);
    expect(librarySortHasAlphabet(LibrarySort.random), isFalse);
  });

  Map<String, dynamic> book(String title,
          {String? ignorePrefix, String? author, String? authorLF}) =>
      {
        'id': title,
        'media': {
          'metadata': {
            'title': title,
            if (ignorePrefix != null) 'titleIgnorePrefix': ignorePrefix,
            if (author != null) 'authorName': author,
            if (authorLF != null) 'authorNameLF': authorLF,
            if (author != null) 'author': author,
          },
        },
      };

  test('titles follow whichever reading fits the server order', () {
    // Server ignores "The": The Hobbit sorts under H.
    final ignoring = [
      book('Atlas'),
      book('The Hobbit', ignorePrefix: 'Hobbit, The'),
      book('Ivanhoe'),
      book('Moby Dick'),
    ];
    expect(
      libraryAlphabetLetters(ignoring,
          sort: LibrarySort.alphabetical, podcast: false),
      ['A', 'H', 'I', 'M'],
    );
    // Server keeps "The": it sorts under T.
    final keeping = [
      book('Atlas'),
      book('Ivanhoe'),
      book('Moby Dick'),
      book('The Hobbit', ignorePrefix: 'Hobbit, The'),
    ];
    expect(
      libraryAlphabetLetters(keeping,
          sort: LibrarySort.alphabetical, podcast: false),
      ['A', 'I', 'M', 'T'],
    );
  });

  test('author sorts read last-first names, podcasts their author', () {
    final items = [
      book('X', author: 'Frank Herbert', authorLF: 'Herbert, Frank'),
      {
        'id': 's',
        'collapsedSeries': {'name': 'Zed', 'nameIgnorePrefix': 'Zed'},
      },
    ];
    expect(
      libraryAlphabetLetters(items,
          sort: LibrarySort.authorName, podcast: false),
      ['H', '#'],
    );
    expect(
      libraryAlphabetLetters([book('Show', author: 'Host')],
          sort: LibrarySort.authorName, podcast: true),
      ['H'],
    );
    expect(
      libraryAlphabetLetters(items,
          sort: LibrarySort.alphabetical, podcast: false),
      ['X', 'Z'],
    );
  });

  group('rail', () {
    // Four titles per letter, A to Y: 100 items.
    final titles = [
      for (var c = 0; c < 25; c++)
        for (var i = 0; i < 4; i++) '${String.fromCharCode(65 + c)}book $i',
    ];

    Widget harness({
      required ScrollController controller,
      required List<String> titles,
      bool enabled = true,
      bool hasMore = false,
      VoidCallback? onLoadMore,
    }) =>
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: AlphabetScroller(
              controller: controller,
              enabled: enabled,
              letters: titles.map(alphabetLetterOf).toList(),
              hasMore: hasMore,
              onLoadMore: onLoadMore,
              child: CustomScrollView(
                controller: controller,
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisExtent: 100,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, i) => Text(titles[i]),
                        childCount: titles.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

    AlphabetScrollerState state(WidgetTester tester) =>
        tester.state<AlphabetScrollerState>(find.byType(AlphabetScroller));

    testWidgets('a letter scrolls its first item to the top', (tester) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(harness(controller: controller, titles: titles));
      state(tester).selectLetter('M');
      await tester.pump();
      final top = tester.getTopLeft(find.text('Mbook 0')).dy;
      expect(top, inInclusiveRange(0, 1));
      expect(find.text('Lbook 3'), findsNothing);

      // Going back up leaves room for the header coming down.
      state(tester).selectLetter('C');
      await tester.pump();
      expect(tester.getTopLeft(find.text('Cbook 0')).dy,
          inInclusiveRange(99, 101));
    });

    testWidgets('a letter not loaded yet loads more pages, then jumps',
        (tester) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);
      var loads = 0;
      final firstPage = titles.take(40).toList(); // A to J
      await tester.pumpWidget(harness(
        controller: controller,
        titles: firstPage,
        hasMore: true,
        onLoadMore: () => loads++,
      ));
      state(tester).selectLetter('T');
      await tester.pump();
      expect(loads, 1);
      await tester.pumpWidget(harness(
        controller: controller,
        titles: titles.take(60).toList(), // up to O, still no T
        hasMore: true,
        onLoadMore: () => loads++,
      ));
      await tester.pump();
      expect(loads, 2);
      await tester.pumpWidget(harness(
        controller: controller,
        titles: titles,
        onLoadMore: () => loads++,
      ));
      await tester.pump();
      expect(loads, 2);
      expect(tester.getTopLeft(find.text('Tbook 0')).dy,
          inInclusiveRange(0, 1));
    });

    testWidgets('hidden until the list scrolls, then fades after a pause',
        (tester) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(harness(controller: controller, titles: titles));
      await tester.pump();
      expect(state(tester).railVisible, isFalse);
      await tester.drag(find.text('Abook 1'), const Offset(0, -300));
      await tester.pump();
      expect(state(tester).railVisible, isTrue);
      await tester.pump(const Duration(seconds: 2));
      expect(state(tester).railVisible, isFalse);
    });

    testWidgets('dragging along the rail jumps and shows the letter bubble',
        (tester) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(harness(controller: controller, titles: titles));
      await tester.drag(find.text('Abook 1'), const Offset(0, -50));
      await tester.pump();
      final rail = find.byKey(const ValueKey('alphabet-rail'));
      final box = tester.getRect(rail);
      final gesture = await tester.startGesture(
          Offset(box.center.dx, box.top + box.height * 0.5));
      await tester.pump(const Duration(milliseconds: 150));
      await gesture.moveBy(const Offset(0, 40));
      await tester.pump();
      expect(find.byKey(const ValueKey('alphabet-bubble')), findsOneWidget);
      final shown = tester
          .widget<Text>(find.descendant(
            of: find.byKey(const ValueKey('alphabet-bubble')),
            matching: find.byType(Text),
          ))
          .data!;
      // The first item of the bubble's letter is at the top of the grid.
      expect(tester.getTopLeft(find.text('${shown}book 0')).dy,
          inInclusiveRange(0, 101));
      await gesture.up();
      await tester.pump();
      expect(find.byKey(const ValueKey('alphabet-bubble')), findsNothing);
    });

    testWidgets('a mouse near the edge shows the rail', (tester) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(harness(controller: controller, titles: titles));
      await tester.pump();
      final box = tester.getRect(find.byKey(const ValueKey('alphabet-rail')));
      final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
      addTearDown(mouse.removePointer);
      await mouse.addPointer(location: Offset.zero);
      await mouse.moveTo(box.center);
      await tester.pump();
      expect(state(tester).railVisible, isTrue);
      await mouse.moveTo(const Offset(100, 300));
      await tester.pump(const Duration(seconds: 2));
      expect(state(tester).railVisible, isFalse);
    });

    testWidgets('a hidden rail lets clicks through to the grid',
        (tester) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(harness(controller: controller, titles: titles));
      await tester.pump();
      final box = tester.getRect(find.byKey(const ValueKey('alphabet-rail')));
      final offsetBefore = controller.offset;
      await tester.tapAt(box.center);
      await tester.pump();
      expect(controller.offset, offsetBefore);
    });

    testWidgets('no rail for other sorts or short lists', (tester) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);
      final items = [for (final t in titles) book(t)];
      Widget library(LibrarySort sort, int count) => MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(
              body: LibraryAlphabetRail(
                sort: sort,
                descending: false,
                podcast: false,
                items: items.take(count).toList(),
                hasMore: false,
                onLoadMore: () {},
                controller: controller,
                child: ListView(controller: controller),
              ),
            ),
          );
      final rail = find.byKey(const ValueKey('alphabet-rail'));
      await tester.pumpWidget(library(LibrarySort.alphabetical, 100));
      expect(rail, findsOneWidget);
      await tester.pumpWidget(library(LibrarySort.recentlyAdded, 100));
      expect(rail, findsNothing);
      await tester.pumpWidget(library(LibrarySort.alphabetical, 39));
      expect(rail, findsNothing);
    });
  });
}
