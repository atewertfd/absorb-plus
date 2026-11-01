import 'dart:convert';
import 'dart:io';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/file_health_check.dart';
import 'package:absorb/widgets/file_health_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, dynamic> _fixture(String name) =>
    jsonDecode(File('test/fixtures/file_health/$name.json').readAsStringSync()) as Map<String, dynamic>;

Future<void> _pump(WidgetTester tester, Map<String, dynamic> item,
    {List<String>? paths, List<LocalFileStat> stats = const []}) async {
  await tester.pumpWidget(MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: FileHealthSheet(
        itemId: 'li',
        item: item,
        localPaths: (_) async => paths,
        statLocal: (_) async => stats,
      ),
    ),
  ));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('a healthy book says all its files look fine, with no actions', (tester) async {
    await _pump(tester, _fixture('healthy_book'));
    expect(find.text('All 3 files look fine'), findsOneWidget);
    expect(find.text('Re-download this book'), findsNothing);
    expect(find.byType(FilledButton), findsNothing);
  });

  testWidgets('a broken book lists grouped findings with file names', (tester) async {
    await _pump(tester, _fixture('broken_book'));
    expect(find.text('11 problems found'), findsOneWidget);
    expect(find.text('Unreadable files'), findsOneWidget);
    expect(find.text('04 Broken.m4b'), findsOneWidget);
    expect(find.text('Invalid audio file: no audio streams'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Chapters past the end'), 200);
    expect(find.text('Ghost chapter'), findsOneWidget);
    // Server-side problems never offer a fix.
    expect(find.text('Re-download this book'), findsNothing);
  });

  testWidgets('a damaged download offers a re-download behind a confirm', (tester) async {
    await _pump(tester, _fixture('healthy_book'), paths: const ['/dl/Part 01.mp3', '/dl/Part 02.mp3'], stats: const [
      LocalFileStat('/dl/Part 01.mp3', exists: false),
      LocalFileStat('/dl/Part 02.mp3', exists: true, size: 28801000),
    ]);
    expect(find.text('2 problems found'), findsOneWidget);
    expect(find.text('Downloaded files missing'), findsOneWidget);
    expect(find.text('Part 01.mp3'), findsOneWidget);
    expect(find.text('28801000 B here, 28802000 B on the server'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Re-download this book'), 200);
    await tester.tap(find.text('Re-download this book'));
    await tester.pumpAndSettle();
    // No server connection was given, so nothing is removed or fetched.
    expect(find.text('Re-download this book?'), findsNothing);
    expect(find.text('Connect to your server to re-download'), findsOneWidget);
    // Let the toast time out.
    await tester.pump(const Duration(seconds: 10));
    await tester.pumpAndSettle();
  });

  test('short durations keep their seconds', () {
    expect(fileHealthDuration(30.4), '30s');
    expect(fileHealthDuration(-245), '4m 5s');
    expect(fileHealthDuration(3 * 3600 + 720), '3h 12m');
  });
}
