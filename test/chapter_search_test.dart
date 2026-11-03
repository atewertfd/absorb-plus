import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/utils/chapter_search.dart';
import 'package:absorb/widgets/chapter_search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// [count] chapters of 10 minutes each, titled "Part N" (chapter 5 untitled).
List<dynamic> _chapters(int count) => [
  for (var i = 0; i < count; i++)
    {
      'id': i,
      'start': i * 600.0,
      'end': (i + 1) * 600.0,
      if (i != 4) 'title': i == 7 ? 'The Long Night' : 'Part ${i + 1}',
    },
];

String _fallback(int i) => 'Chapter ${i + 1}';

void main() {
  group('parseChapterSearchTime', () {
    test('reads h:mm:ss and m:ss', () {
      expect(parseChapterSearchTime('1:23:00'), 4980);
      expect(parseChapterSearchTime(' 23:05 '), 1385);
      expect(parseChapterSearchTime('0:00:07.5'), 7);
    });

    test('rejects words, bare numbers and out-of-range parts', () {
      expect(parseChapterSearchTime('12'), isNull);
      expect(parseChapterSearchTime('part 1'), isNull);
      expect(parseChapterSearchTime('1:75'), isNull);
      expect(parseChapterSearchTime('1:20:61'), isNull);
    });
  });

  group('filterChapterIndices', () {
    final chapters = _chapters(20);

    test('empty query keeps every chapter', () {
      expect(
        filterChapterIndices(chapters, '  ', fallbackTitle: _fallback),
        List.generate(20, (i) => i),
      );
    });

    test('matches every word of the title, ignoring case', () {
      expect(
        filterChapterIndices(chapters, 'long NIGHT', fallbackTitle: _fallback),
        [7],
      );
      expect(
        filterChapterIndices(chapters, 'part 1', fallbackTitle: _fallback),
        [0, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18],
      );
    });

    test('untitled chapters match their fallback name', () {
      expect(
        filterChapterIndices(chapters, 'chapter 5', fallbackTitle: _fallback),
        [4],
      );
    });

    test('a typed time finds the chapter containing it', () {
      // 1:23:00 = 4980 s -> chapter index 8 (4800-5400).
      expect(
        filterChapterIndices(chapters, '1:23:00', fallbackTitle: _fallback),
        [8],
      );
      // The very end of the book belongs to the last chapter.
      expect(
        filterChapterIndices(chapters, '3:20:00', fallbackTitle: _fallback),
        [19],
      );
      // Past the end: nothing.
      expect(
        filterChapterIndices(chapters, '9:00:00', fallbackTitle: _fallback),
        isEmpty,
      );
    });
  });

  group('ChapterSearchList', () {
    Future<void> pump(WidgetTester tester, List<dynamic> chapters) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          home: Scaffold(
            body: Column(
              children: [
                const TextField(key: Key('outside')),
                Expanded(
                  child: ChapterSearchList(
                    chapters: chapters,
                    fallbackTitle: _fallback,
                    builder: (_, shown) => ListView(
                      children: [
                        for (final i in shown)
                          ListTile(
                            title: Text(
                              (chapters[i] as Map)['title'] as String? ??
                                  _fallback(i),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pump();
    }

    testWidgets('short books get no search field', (tester) async {
      await pump(tester, _chapters(kChapterSearchMinChapters - 1));
      expect(find.byKey(ChapterSearchList.fieldKey), findsNothing);
      expect(find.text('Part 1'), findsOneWidget);
    });

    testWidgets('typing filters the list and a time jumps to its chapter', (
      tester,
    ) async {
      await pump(tester, _chapters(kChapterSearchMinChapters));
      expect(find.byKey(ChapterSearchList.fieldKey), findsOneWidget);

      await tester.enterText(find.byKey(ChapterSearchList.fieldKey), 'night');
      await tester.pump();
      expect(find.text('The Long Night'), findsOneWidget);
      expect(find.text('Part 1'), findsNothing);

      await tester.enterText(find.byKey(ChapterSearchList.fieldKey), '0:21:00');
      await tester.pump();
      expect(find.text('Part 3'), findsOneWidget);
      expect(find.text('Part 1'), findsNothing);

      await tester.enterText(find.byKey(ChapterSearchList.fieldKey), 'zzz');
      await tester.pump();
      expect(find.text('No chapters match'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.clear_rounded));
      await tester.pump();
      expect(find.text('Part 1'), findsOneWidget);
    });

    testWidgets('Ctrl+F focuses the search field', (tester) async {
      await pump(tester, _chapters(kChapterSearchMinChapters));
      final field = find.descendant(
        of: find.byKey(ChapterSearchList.fieldKey),
        matching: find.byType(EditableText),
      );
      expect(tester.widget<EditableText>(field).focusNode.hasFocus, isFalse);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.keyF);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pump();
      expect(tester.widget<EditableText>(field).focusNode.hasFocus, isTrue);
    });
  });
}
