import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/screens/stats_screen.dart';
import 'package:absorb/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

/// The Stats page asks for the stats and the first page of sessions at the
/// same time, instead of waiting for the stats before asking for sessions.
void main() {
  late Directory docs;
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    docs = Directory.systemTemp.createTempSync('stats_parallel_test_');
    fakePathProvider(docs.path, everyFolder: true);
  });
  tearDown(() {
    clearFakePathProvider();
    try {
      docs.deleteSync(recursive: true);
    } catch (_) {}
  });

  testWidgets('sessions are requested while the stats are still loading',
      (tester) async {
    final statsGate = Completer<void>();
    var statsAnswered = false;
    var sessionsAskedBeforeStats = false;
    var sessionsAsked = false;

    final api = mockApi((req) async {
      if (req.url.path == '/api/me/listening-stats') {
        await statsGate.future;
        statsAnswered = true;
        return http.Response(jsonEncode({'totalTime': 60, 'days': {}}), 200);
      }
      if (req.url.path == '/api/me/listening-sessions') {
        sessionsAsked = true;
        if (!statsAnswered) sessionsAskedBeforeStats = true;
        return http.Response(jsonEncode({'sessions': []}), 200);
      }
      return http.Response('{}', 404);
    });

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>.value(value: FakeAuth(api)),
          ChangeNotifierProvider<LibraryProvider>(
              create: (_) => LibraryProvider()),
        ],
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: StatsScreen(),
        ),
      ),
    );

    for (var i = 0; i < 5; i++) {
      await tester.runAsync(() => Future.delayed(const Duration(milliseconds: 20)));
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(sessionsAskedBeforeStats, isTrue,
        reason: 'the sessions request must not wait for the stats answer');

    // Both answers still land; the page settles normally.
    statsGate.complete();
    for (var i = 0; i < 5; i++) {
      await tester.runAsync(() => Future.delayed(const Duration(milliseconds: 20)));
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(statsAnswered, isTrue);
    expect(sessionsAsked, isTrue);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 2));
  });

  testWidgets('a failed sessions request is not left unhandled when the page '
      'closes before the stats arrive', (tester) async {
    final statsGate = Completer<void>();
    final api = _ThrowingSessionsApi(statsGate.future);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>.value(value: FakeAuth(api)),
          ChangeNotifierProvider<LibraryProvider>(
              create: (_) => LibraryProvider()),
        ],
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: StatsScreen(),
        ),
      ),
    );
    for (var i = 0; i < 3; i++) {
      await tester.runAsync(() => Future.delayed(const Duration(milliseconds: 20)));
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(api.sessionsAsked, isTrue);
    // Close the page, then let the stats land: _loadStats returns early and
    // never awaits the failed sessions request.
    await tester.pumpWidget(const SizedBox());
    statsGate.complete();
    for (var i = 0; i < 3; i++) {
      await tester.runAsync(() => Future.delayed(const Duration(milliseconds: 20)));
      await tester.pump(const Duration(milliseconds: 50));
    }
    // An unhandled error would fail this test on its own.
  });
}

class _ThrowingSessionsApi extends ApiService {
  _ThrowingSessionsApi(this._statsGate)
      : super(baseUrl: 'http://127.0.0.1:9', token: 'fixture-token');

  final Future<void> _statsGate;
  bool sessionsAsked = false;

  @override
  Future<Map<String, dynamic>?> getListeningStats() async {
    await _statsGate;
    return null;
  }

  @override
  Future<Map<String, dynamic>?> getListeningSessions(
      {int page = 0, int itemsPerPage = 20}) async {
    sessionsAsked = true;
    throw StateError('sessions failed');
  }
}
