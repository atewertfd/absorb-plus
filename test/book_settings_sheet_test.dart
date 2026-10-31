import 'dart:convert';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/book_settings_service.dart';
import 'package:absorb/services/user_account_service.dart';
import 'package:absorb/widgets/book_settings_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'saved_accounts': jsonEncode([
        {
          'serverUrl': 'https://audiobookshelf.example',
          'username': 'alice',
          'token': 'a-token',
        },
      ]),
      'active_account_scope': 'audiobookshelf.example_alice',
    });
    await UserAccountService().init();
    BookSettingsService.resetQueueForTest();
  });

  Future<void> pumpSheet(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(
          body: Align(
            alignment: Alignment.bottomCenter,
            child: BookSettingsSheet(
              itemId: 'b1',
              accent: Colors.teal,
              item: {
                'media': {
                  'metadata': {
                    'series': [
                      {'id': 'ser-1', 'name': 'The Expanse', 'sequence': '1'},
                    ],
                  },
                },
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('shows the series and saves the intro for this book', (
    tester,
  ) async {
    await pumpSheet(tester);

    expect(find.text('Book settings'), findsOneWidget);
    expect(find.text('Series: The Expanse'), findsOneWidget);
    expect(find.text('Use for the whole series'), findsOneWidget);
    expect(find.text('Off'), findsNWidgets(2));

    // The first "+" after the speed row's belongs to the intro.
    await tester.tap(find.byIcon(Icons.add_rounded).at(1));
    await tester.pumpAndSettle();
    expect(find.text('5 s'), findsOneWidget);

    await BookSettingsService.settle();
    final skip = await BookSettingsService.ownSkip('b1');
    expect(skip, const BookSkip(intro: 5));
  });

  testWidgets('the series switch moves the skip to the whole series', (
    tester,
  ) async {
    await pumpSheet(tester);

    await tester.tap(find.byIcon(Icons.add_rounded).at(2)); // outro +5
    await tester.pumpAndSettle();
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    await BookSettingsService.settle();
    final own = await BookSettingsService.ownSkip('b1');
    final series = await BookSettingsService.seriesSkip('ser-1');
    expect(own, isNull);
    expect(series, const BookSkip(outro: 5));
  });
}
