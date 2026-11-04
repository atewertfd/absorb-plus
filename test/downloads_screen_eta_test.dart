import 'dart:io';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/screens/downloads_screen.dart';
import 'package:absorb/services/download_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/fakes.dart';

// The active download card shows the time left. The screen-reader text used
// to add " remaining" to it, which read "5 min left remaining".
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tmp;

  setUp(() {
    tmp = Directory.systemTemp.createTempSync('absorb_dl_eta_');
    fakePathProvider(tmp.path);
  });

  tearDown(() async {
    await DownloadService().debugReset();
    clearFakePathProvider();
    try {
      tmp.deleteSync(recursive: true);
    } catch (_) {}
  });

  Future<void> pumpWithDownload(WidgetTester tester, int etaSeconds) async {
    SharedPreferences.setMockInitialValues({});
    final ds = DownloadService();
    await ds.debugReset();
    await tester.runAsync(
        () => ds.debugSeedPendingDownload(itemId: 'book', trackCount: 1));
    ds.debugPutDownload(DownloadInfo(
      itemId: 'book',
      status: DownloadStatus.downloading,
      progress: 0.5,
      bytesDone: 50 * 1024 * 1024,
      bytesTotal: 100 * 1024 * 1024,
      etaSeconds: etaSeconds,
      title: 'Some Book',
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(create: (_) => FakeAuth()),
          ChangeNotifierProvider<LibraryProvider>(
              create: (_) => LibraryProvider()),
        ],
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: DownloadsScreen(),
        ),
      ),
    );
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  String progressValue(WidgetTester tester) => tester
      .getSemantics(find.bySemanticsLabel(RegExp('Download progress for')))
      .value;

  for (final (seconds, eta) in [
    (30, '<1 min left'),
    (5 * 60, '5 min left'),
    (2 * 3600, '2 hr left'),
    (2 * 3600 + 15 * 60, '2 hr 15 min left'),
  ]) {
    testWidgets('time left reads "$eta"', (tester) async {
      final semantics = tester.ensureSemantics();
      await pumpWithDownload(tester, seconds);

      expect(find.textContaining('· $eta'), findsOneWidget);
      final value = progressValue(tester);
      expect(value, endsWith(', $eta'));
      expect(value, isNot(contains('remaining')));
      semantics.dispose();
    });
  }
}
