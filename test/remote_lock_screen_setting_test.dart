import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/remote_control_screen.dart';
import 'package:absorb/services/remote_link/remote_link_types.dart';
import 'package:absorb/services/remote_link/remote_media_mirror.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/remote_link_fakes.dart';

/// The remote screen's "Show controls on the lock screen" menu switch and
/// its media-session mirror.
void main() {
  Widget app(Widget home) => MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: home,
  );

  testWidgets('the remote screen mirrors the PC and the menu turns it off', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final client = FakeClient(state: fakePlaying);
    final session = FakeMediaSession();
    await tester.pumpWidget(
      app(
        RemoteControlScreen(
          host: fakeSavedHost,
          client: client,
          mediaSession: session,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(session.lent, isTrue);
    expect(session.lastItem!.title, 'The Book');

    await tester.tap(find.byKey(const Key('remote-menu')));
    await tester.pumpAndSettle();
    expect(find.text('Show controls on the lock screen'), findsOneWidget);
    await tester.tap(find.byKey(const Key('remote-lock-screen')));
    await tester.pumpAndSettle();
    expect(session.lent, isFalse);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool(RemoteMediaMirror.prefShowOnLockScreen), isFalse);

    // Turned on again, then leaving the remote gives the session back.
    await tester.tap(find.byKey(const Key('remote-menu')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('remote-lock-screen')));
    await tester.pumpAndSettle();
    expect(session.lent, isTrue);
    await tester.pumpWidget(app(const SizedBox()));
    expect(session.lent, isFalse);
  });

  testWidgets('a saved "off" keeps the lock screen alone', (tester) async {
    SharedPreferences.setMockInitialValues({
      RemoteMediaMirror.prefShowOnLockScreen: false,
    });
    final client = FakeClient(phase: RemoteLinkPhase.connecting);
    final session = FakeMediaSession();
    await tester.pumpWidget(
      app(
        RemoteControlScreen(
          host: fakeSavedHost,
          client: client,
          mediaSession: session,
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
    client.update((c) {
      c.phase = RemoteLinkPhase.connected;
      c.state = fakePlaying;
    });
    await tester.pumpAndSettle();
    expect(session.lent, isFalse);
  });

  testWidgets('no menu where there is no media session (desktop, web)', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final session = FakeMediaSession(isAvailable: false);
    await tester.pumpWidget(
      app(
        RemoteControlScreen(
          host: fakeSavedHost,
          client: FakeClient(state: fakePlaying),
          mediaSession: session,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('remote-menu')), findsNothing);
    expect(session.lends, 0);
  });
}
