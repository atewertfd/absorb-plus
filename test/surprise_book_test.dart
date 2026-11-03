import 'dart:math';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/services/surprise_book.dart';
import 'package:absorb/widgets/surprise_me_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A fake `/api/libraries/{id}/items` that honours (or ignores) the
/// not-finished filter and records every request.
class _FakeServer {
  _FakeServer(this.books, {this.honoursFilter = true});

  final List<Map<String, dynamic>> books;
  final bool honoursFilter;
  final requests = <({int page, int limit, String? filter})>[];
  bool fail = false;

  Future<Map<String, dynamic>?> fetch({
    required int page,
    required int limit,
    String? filter,
  }) async {
    requests.add((page: page, limit: limit, filter: filter));
    if (fail) return null;
    final visible = honoursFilter && filter != null
        ? books
              .where(
                (b) => (b['userMediaProgress'] as Map?)?['isFinished'] != true,
              )
              .toList()
        : books;
    final start = page * limit;
    return {
      'total': visible.length,
      'results': visible.skip(start).take(limit).toList(),
    };
  }
}

Map<String, dynamic> _book(String id, {bool finished = false}) => {
  'id': id,
  'mediaType': 'book',
  'media': {
    'metadata': {'title': 'Book $id'},
  },
  if (finished) 'userMediaProgress': {'isFinished': true},
};

void main() {
  test('the not-finished filter is the base64 progress filter', () {
    expect(SurpriseBookPicker.notFinishedFilter, 'progress.bm90LWZpbmlzaGVk');
  });

  test(
    'asks for the total, then one random item: two small requests',
    () async {
      final server = _FakeServer([
        for (var i = 0; i < 40; i++) _book('b$i', finished: i.isEven),
      ]);
      final picker = SurpriseBookPicker(
        fetchPage: server.fetch,
        isFinished: (_) => false,
        random: Random(7),
      );
      final result = await picker.pick();
      expect(result.outcome, SurpriseOutcome.found);
      final id = result.item!['id'] as String;
      expect(
        int.parse(id.substring(1)).isOdd,
        isTrue,
        reason: 'only not-finished books come back',
      );
      expect(server.requests.length, lessThanOrEqualTo(2));
      expect(server.requests.every((r) => r.limit == 1), isTrue);
      expect(
        server.requests.every(
          (r) => r.filter == SurpriseBookPicker.notFinishedFilter,
        ),
        isTrue,
      );
    },
  );

  test('every pick lands on a real index and they vary', () async {
    final server = _FakeServer([for (var i = 0; i < 10; i++) _book('b$i')]);
    final seen = <String>{};
    for (var seed = 0; seed < 30; seed++) {
      final picker = SurpriseBookPicker(
        fetchPage: server.fetch,
        isFinished: (_) => false,
        random: Random(seed),
      );
      final result = await picker.pick();
      expect(result.outcome, SurpriseOutcome.found);
      seen.add(result.item!['id'] as String);
    }
    expect(seen.length, greaterThan(3));
  });

  test(
    'an empty or fully finished library has nothing to surprise with',
    () async {
      final empty = SurpriseBookPicker(
        fetchPage: _FakeServer(const []).fetch,
        isFinished: (_) => false,
      );
      expect((await empty.pick()).outcome, SurpriseOutcome.noneLeft);

      final allDone = SurpriseBookPicker(
        fetchPage: _FakeServer([
          _book('a', finished: true),
          _book('b', finished: true),
        ]).fetch,
        isFinished: (_) => false,
      );
      expect((await allDone.pick()).outcome, SurpriseOutcome.noneLeft);
    },
  );

  test(
    'a server that ignores the filter is checked locally and retried',
    () async {
      final server = _FakeServer([
        _book('done1'),
        _book('done2'),
        _book('fresh'),
        _book('done3'),
      ], honoursFilter: false);
      final finishedLocally = {'done1', 'done2', 'done3'};
      for (var seed = 0; seed < 10; seed++) {
        server.requests.clear();
        final picker = SurpriseBookPicker(
          fetchPage: server.fetch,
          isFinished: finishedLocally.contains,
          random: Random(seed),
        );
        final result = await picker.pick();
        expect(result.outcome, SurpriseOutcome.found, reason: 'seed $seed');
        expect(result.item!['id'], 'fresh');
        expect(
          server.requests.length,
          lessThanOrEqualTo(SurpriseBookPicker.maxAttempts + 1),
        );
      }
    },
  );

  test(
    'a failed request is reported as a failure, not as "none left"',
    () async {
      final server = _FakeServer([_book('a')])..fail = true;
      final picker = SurpriseBookPicker(
        fetchPage: server.fetch,
        isFinished: (_) => false,
      );
      expect((await picker.pick()).outcome, SurpriseOutcome.failed);
    },
  );

  group('openSurpriseBook', () {
    final l = lookupAppLocalizations(const Locale('en'));

    Future<BuildContext> pumpHost(WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      final auth = AuthProvider();
      final lib = LibraryProvider()..updateAuth(auth);
      addTearDown(lib.dispose);
      late BuildContext captured;
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthProvider>.value(value: auth),
            ChangeNotifierProvider<LibraryProvider>.value(value: lib),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Builder(
              builder: (context) {
                captured = context;
                return const Scaffold();
              },
            ),
          ),
        ),
      );
      return captured;
    }

    testWidgets('says so when everything is finished', (tester) async {
      final context = await pumpHost(tester);
      final picker = SurpriseBookPicker(
        fetchPage: _FakeServer([_book('a', finished: true)]).fetch,
        isFinished: (_) => false,
      );
      await openSurpriseBook(context, picker: picker);
      await tester.pump();
      expect(find.text(l.surpriseMeNoneLeft), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));
    });

    testWidgets('a server failure shows a retry message', (tester) async {
      final context = await pumpHost(tester);
      final picker = SurpriseBookPicker(
        fetchPage: (_FakeServer(const [])..fail = true).fetch,
        isFinished: (_) => false,
      );
      await openSurpriseBook(context, picker: picker);
      await tester.pump();
      expect(find.text(l.surpriseMeFailed), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));
    });

    testWidgets('signed out or offline, the header button stays hidden and '
        'the action explains why', (tester) async {
      final context = await pumpHost(tester);
      final lib = context.read<LibraryProvider>();
      expect(SurpriseMeButton.availableFor(lib), isFalse);
      await openSurpriseBook(context);
      await tester.pump();
      expect(find.text(l.surpriseMeOffline), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));
    });
  });
}
