import 'dart:convert';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/developer_screen.dart';
import 'package:absorb/screens/test_channel_screen.dart';
import 'package:absorb/services/developer_mode.dart';
import 'package:absorb/services/test_build_notes.dart';
import 'package:absorb/services/test_channel_service.dart';
import 'package:absorb/widgets/test_build_notes_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget _app(Widget home) => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: home,
);

String _notesJson(int build, List<String> notes) => jsonEncode({
  'version': '1.12.1',
  'build': build,
  'date': '2026-11-04',
  'notes': notes,
});

TestBuildNotes _notes(int build, [List<String> notes = const ['A change']]) =>
    TestBuildNotes(version: '1.12.1', build: build, notes: notes);

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    TestBuildNotesStore.debugTestBuildOverride = true;
    TestBuildNotesStore.loadAsset = () async => _notesJson(356, ['New thing']);
    TestBuildNotesPrompt.settleDelay = Duration.zero;
    DeveloperMode.resetForTest();
  });
  tearDown(() {
    TestBuildNotesStore.debugTestBuildOverride = null;
    DeveloperMode.resetForTest();
  });

  group('notes JSON', () {
    test('parses the build tool output', () {
      final n = TestBuildNotes.parse(_notesJson(356, ['One', ' ', 'Two ']))!;
      expect(n.version, '1.12.1');
      expect(n.build, 356);
      expect(n.date, '2026-11-04');
      expect(n.fullVersion, '1.12.1+356');
      expect(n.notes, ['One', 'Two']);
    });

    test('rejects what is not a test build notes file', () {
      expect(TestBuildNotes.parse('{}'), isNull);
      expect(TestBuildNotes.parse('not json'), isNull);
      expect(TestBuildNotes.parse('[1, 2]'), isNull);
      expect(TestBuildNotes.parse('{"build": "356"}'), isNull);
      expect(TestBuildNotes.parse('{"build": 0}'), isNull);
    });

    test('round-trips through toJson', () {
      final n = TestBuildNotes(
        version: '1.12.1',
        build: 7,
        date: 'd',
        notes: const ['x'],
      );
      final back = TestBuildNotes.fromJson(jsonDecode(jsonEncode(n.toJson())))!;
      expect(back.toJson(), n.toJson());
    });
  });

  test('release body splits into the version line and bullets', () {
    final parts = splitReleaseNotes(
      'Test build 1.12.1+356 (commit abc). Not a release.\n\n'
      '- First\n* Second\n•  Third\n',
    );
    expect(parts.intro, ['Test build 1.12.1+356 (commit abc). Not a release.']);
    expect(parts.bullets, ['First', 'Second', 'Third']);
  });

  group('history', () {
    test('newest build first, one entry per build', () {
      var h = <TestBuildNotes>[];
      h = TestBuildNotesStore.appendHistory(h, _notes(10));
      h = TestBuildNotesStore.appendHistory(h, _notes(12));
      h = TestBuildNotesStore.appendHistory(h, _notes(11));
      h = TestBuildNotesStore.appendHistory(h, _notes(12, ['Again']));
      expect(h.map((n) => n.build), [12, 11, 10]);
      expect(h.first.notes, ['Again']);
    });

    test('keeps the last 30', () {
      var h = <TestBuildNotes>[];
      for (var b = 1; b <= 35; b++) {
        h = TestBuildNotesStore.appendHistory(h, _notes(b));
      }
      expect(h.length, TestBuildNotesStore.maxHistory);
      expect(h.first.build, 35);
      expect(h.last.build, 6);
    });
  });

  group('first launch of a build', () {
    test('shows once and adds the notes to the history', () async {
      final first = await TestBuildNotesStore.recordLaunch();
      expect(first?.build, 356);
      expect(await TestBuildNotesStore.recordLaunch(), isNull);

      TestBuildNotesStore.loadAsset = () async => _notesJson(357, ['Newer']);
      expect((await TestBuildNotesStore.recordLaunch())?.notes, ['Newer']);
      final history = await TestBuildNotesStore.history();
      expect(history.map((n) => n.build), [357, 356]);
    });

    test('a build without notes shows nothing and adds nothing', () async {
      TestBuildNotesStore.loadAsset = () async => _notesJson(356, []);
      expect(await TestBuildNotesStore.recordLaunch(), isNull);
      expect(await TestBuildNotesStore.history(), isEmpty);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getInt(TestBuildNotesStore.seenBuildKey), 356);
    });

    test('a missing notes asset is ignored', () async {
      TestBuildNotesStore.loadAsset = () async =>
          throw FlutterError('Unable to load asset');
      expect(await TestBuildNotesStore.recordLaunch(), isNull);
    });

    test('a broken history is replaced', () async {
      SharedPreferences.setMockInitialValues({
        TestBuildNotesStore.historyKey: '{broken',
      });
      await TestBuildNotesStore.recordLaunch();
      expect((await TestBuildNotesStore.history()).single.build, 356);
    });
  });

  group('normal builds', () {
    setUp(() => TestBuildNotesStore.debugTestBuildOverride = false);

    test('never read, show or store notes', () async {
      var reads = 0;
      TestBuildNotesStore.loadAsset = () async {
        reads++;
        return _notesJson(356, ['x']);
      };
      expect(await TestBuildNotesStore.bundled(), isNull);
      expect(await TestBuildNotesStore.recordLaunch(), isNull);
      expect(await TestBuildNotesStore.history(), isEmpty);
      expect(reads, 0);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getKeys(), isEmpty);
    });
  });

  group('screens', () {
    Future<void> launch(WidgetTester tester) async {
      await tester.pumpWidget(
        _app(
          Builder(
            builder: (context) => TextButton(
              onPressed: () => TestBuildNotesPrompt.showIfNew(context),
              child: const Text('launch'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('launch'));
      await tester.pumpAndSettle();
    }

    testWidgets('the launch sheet shows once per build', (tester) async {
      await launch(tester);
      expect(find.text("What's new in build 356"), findsOneWidget);
      expect(find.text('New thing'), findsOneWidget);
      await tester.tap(find.text('Got it'));
      await tester.pumpAndSettle();
      expect(find.text("What's new in build 356"), findsNothing);

      await launch(tester);
      expect(find.text("What's new in build 356"), findsNothing);
    });

    testWidgets('Developer > Patch notes lists every build, newest first', (
      tester,
    ) async {
      await TestBuildNotesStore.recordLaunch();
      TestBuildNotesStore.loadAsset = () async => _notesJson(357, ['Newer']);
      await TestBuildNotesStore.recordLaunch();

      await tester.pumpWidget(_app(const DeveloperScreen()));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Patch notes'));
      await tester.pumpAndSettle();
      expect(find.text('Build 357'), findsOneWidget);
      expect(find.text('Build 356'), findsOneWidget);
      expect(
        tester.getTopLeft(find.text('Build 357')).dy,
        lessThan(tester.getTopLeft(find.text('Build 356')).dy),
      );
      expect(find.text('Newer'), findsOneWidget);
      expect(find.text('New thing'), findsOneWidget);
    });

    testWidgets('Patch notes says when there are none yet', (tester) async {
      await tester.pumpWidget(_app(const DeveloperScreen()));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Patch notes'));
      await tester.pumpAndSettle();
      expect(find.textContaining('No patch notes yet'), findsOneWidget);
    });

    testWidgets('the test channel lists the upcoming build notes', (
      tester,
    ) async {
      final release = {
        'tag_name': 'test-channel',
        'draft': false,
        'body':
            'Test build 1.12.1+346 (commit abcdef12). Not a release.\n\n'
            '- Faster covers\n- Fixed sleep timer\n',
        'assets': [
          {
            'name': 'absorb-plus-test-1.12.1+346.apk',
            'browser_download_url': 'https://example.invalid/a.apk',
          },
        ],
      };
      final service = TestChannelService(
        clientFactory: () =>
            MockClient((_) async => http.Response(jsonEncode(release), 200)),
        installedVersion: () async => '1.12.1+345',
        accessToken: () async => null,
      );
      await tester.pumpWidget(_app(TestChannelScreen(service: service)));
      await tester.pumpAndSettle();
      expect(find.text('Faster covers'), findsOneWidget);
      expect(find.text('Fixed sleep timer'), findsOneWidget);
      // The version line isn't repeated as a note.
      expect(find.textContaining('commit abcdef12'), findsNothing);
    });
  });
}
