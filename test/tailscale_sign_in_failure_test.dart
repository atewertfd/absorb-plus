import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/tailscale_settings_screen.dart';
import 'package:absorb/services/tailscale_routing.dart';
import 'package:absorb/services/tailscale_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// A sign-in that throws (the browser couldn't be launched) says so and
/// leaves the screen usable, instead of keeping every control disabled.
void main() {
  testWidgets('a failed sign-in shows an error and re-enables the screen',
      (tester) async {
    final ts = _FailingService();
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: TailscaleSettingsScreen(service: ts, serverUrl: 'http://nas:1'),
    ));
    await tester.pump();
    final l = await AppLocalizations.delegate.load(const Locale('en'));

    await tester.tap(find.text(l.tailscaleSignIn));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.takeException(), isNull);
    expect(find.text(l.tailscaleToggleFailed), findsOneWidget);
    final button = tester.widget<FilledButton>(find.ancestor(
      of: find.text(l.tailscaleSignIn),
      matching: find.byWidgetPredicate((w) => w is FilledButton),
    ));
    expect(button.onPressed, isNotNull, reason: 'not stuck busy');
    final toggle =
        tester.widget<SwitchListTile>(find.byType(SwitchListTile));
    expect(toggle.onChanged, isNotNull);
    await tester.pump(const Duration(seconds: 5)); // let the toast go
  });
}

class _FailingService extends TailscaleService {
  _FailingService() : super(loadNative: () => null);

  @override
  bool get enabled => true;

  @override
  bool get libraryAvailable => true;

  @override
  TailnetStatus get status => const TailnetStatus(
        state: 'NeedsLogin',
        authUrl: 'https://login.example/a/1',
      );

  @override
  Future<bool> signIn({Duration wait = const Duration(seconds: 15)}) async =>
      throw PlatformException(code: 'no_browser');
}
