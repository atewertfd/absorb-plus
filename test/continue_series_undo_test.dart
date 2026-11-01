import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/api_service.dart';
import 'package:absorb/services/continue_series_undo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

ApiService _api(MockClientHandler handler) => ApiService(
      baseUrl: 'http://abs.test',
      token: 'test-token',
      httpClient: MockClient(handler),
      networkRetryDelay: Duration.zero,
      refreshRetryDelay: Duration.zero,
    );

void main() {
  group('readdSeriesToContinueListening', () {
    test('calls GET /api/me/series/:id/readd-to-continue-listening', () async {
      final calls = <String>[];
      final api = _api((r) async {
        calls.add('${r.method} ${r.url.path}');
        return http.Response('{}', 200);
      });
      expect(await api.readdSeriesToContinueListening('ser_1'), isTrue);
      expect(calls, ['GET /api/me/series/ser_1/readd-to-continue-listening']);
    });

    test('anything but 200 is a failure', () async {
      final api = _api((r) async => http.Response('nope', 404));
      expect(await api.readdSeriesToContinueListening('ser_1'), isFalse);
    });
  });

  group('undoHideSeriesFromContinue', () {
    test('lifts the local hide and refreshes only after the server agrees', () async {
      final log = <String>[];
      final ok = await undoHideSeriesFromContinue(
        seriesId: 's1',
        readd: (id) async => true,
        unhide: (id) => log.add('unhide $id'),
        refresh: () async => log.add('refresh'),
      );
      expect(ok, isTrue);
      expect(log, ['unhide s1', 'refresh']);
    });

    test('a refused re-add changes nothing', () async {
      final log = <String>[];
      final ok = await undoHideSeriesFromContinue(
        seriesId: 's1',
        readd: (id) async => false,
        unhide: (id) => log.add('unhide'),
        refresh: () async => log.add('refresh'),
      );
      expect(ok, isFalse);
      expect(log, isEmpty);
    });
  });

  Future<void> pumpToast(WidgetTester tester, Future<bool> Function(String) readd,
      List<String> log) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: Builder(
          builder: (context) => TextButton(
            onPressed: () => showHiddenSeriesUndoToast(context,
                seriesId: 's1',
                readd: readd,
                unhide: (id) => log.add('unhide'),
                refresh: () async => log.add('refresh')),
            child: const Text('hide'),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('hide'));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.tap(find.text('Removed from Continue Series. Tap to undo.'));
    await tester.pump(const Duration(milliseconds: 300));
  }

  testWidgets('tapping Undo puts the series back and says so', (tester) async {
    final log = <String>[];
    await pumpToast(tester, (id) async => true, log);
    expect(log, ['unhide', 'refresh']);
    expect(find.text('Back on Continue Series'), findsOneWidget);
    await tester.pump(const Duration(seconds: 7));
  });

  testWidgets('a failed Undo shows the usual failure toast', (tester) async {
    final log = <String>[];
    await pumpToast(tester, (id) async => false, log);
    expect(log, isEmpty);
    expect(find.text('Could not update, try again'), findsOneWidget);
    await tester.pump(const Duration(seconds: 7));
  });
}
