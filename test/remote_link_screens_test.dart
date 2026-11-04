import 'dart:async';

import 'package:absorb/fork/remote_link_hooks.dart';
import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/remote_connect_screen.dart';
import 'package:absorb/screens/remote_control_screen.dart';
import 'package:absorb/services/remote_link/pairing_store.dart';
import 'package:absorb/services/remote_link/protocol.dart';
import 'package:absorb/services/remote_link/remote_link_types.dart';
import 'package:absorb/widgets/remote_host_sheet.dart';
import 'package:absorb/widgets/remote_link_settings_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/remote_link_fakes.dart';

/// The phone-remote screens against fakes (no sockets).

Widget _app(Widget home) => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: home,
);

List<Map<String, Object?>> _sent(FakeClient c) =>
    c.sent.map((m) => m.toJson()).toList();

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('RemoteControlScreen', () {
    Future<FakeClient> open(
      WidgetTester tester, {
      RemotePlayerState? state = fakePlaying,
      List<RemoteChapter> chapters = const [],
    }) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.5;
      addTearDown(tester.view.reset);
      final client = FakeClient(state: state, chapters: chapters);
      await tester.pumpWidget(
        _app(RemoteControlScreen(host: fakeSavedHost, client: client)),
      );
      return client;
    }

    testWidgets('shows what is playing and sends the button commands', (
      tester,
    ) async {
      final client = await open(tester);
      expect(client.connects, 1);
      expect(find.text('The Book'), findsOneWidget);
      expect(find.text('Writer'), findsOneWidget);
      expect(find.text('Chapter 2'), findsOneWidget);
      expect(find.text('1.25x'), findsOneWidget);

      await tester.tap(find.byKey(const Key('remote-play-pause')));
      await tester.tap(find.byKey(const Key('remote-skip-back')));
      await tester.tap(find.byKey(const Key('remote-skip-forward')));
      await tester.tap(find.byKey(const Key('remote-next-chapter')));
      await tester.tap(find.byKey(const Key('remote-prev-chapter')));
      await tester.tap(find.byKey(const Key('remote-stop')));
      await tester.tap(find.byKey(const Key('remote-mute')));
      expect(_sent(client), [
        const ToggleCommand().toJson(),
        const SkipCommand(-15).toJson(),
        const SkipCommand(30).toJson(),
        const ChapterCommand(1).toJson(),
        const ChapterCommand(-1).toJson(),
        const StopCommand().toJson(),
        const MuteCommand(true).toJson(),
      ]);
    });

    testWidgets('speed presets, fine steps that add up, and sleep presets', (
      tester,
    ) async {
      final client = await open(tester);
      await tester.tap(find.byKey(const Key('remote-speed-up')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('remote-speed-up')));
      await tester.pump();
      expect(find.text('1.35x'), findsOneWidget);
      await tester.tap(find.byKey(const Key('remote-speed-down')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('remote-speed')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('1.5x'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-sleep')));
      await tester.pumpAndSettle();
      expect(find.text('90 minutes'), findsNothing);
      expect(find.text('45 minutes'), findsOneWidget);
      await tester.tap(find.text('30 minutes'));
      await tester.pumpAndSettle();
      expect(_sent(client), [
        const SpeedCommand(1.3).toJson(),
        const SpeedCommand(1.35).toJson(),
        const SpeedCommand(1.3).toJson(),
        const SpeedCommand(1.5).toJson(),
        const SleepCommand.minutes(30).toJson(),
      ]);
      await tester.pump(const Duration(seconds: 3));
    });

    testWidgets('chapters list jumps to a chapter', (tester) async {
      final client = await open(
        tester,
        chapters: const [
          RemoteChapter(title: 'Opening', start: 0, end: 100),
          RemoteChapter(title: 'Middle', start: 100, end: 400),
        ],
      );
      await tester.tap(find.byKey(const Key('remote-chapters')));
      await tester.pumpAndSettle();
      expect(find.text('Opening'), findsOneWidget);
      await tester.tap(find.text('Opening'));
      await tester.pumpAndSettle();
      expect(_sent(client), [const SeekCommand(0).toJson()]);
    });

    testWidgets('bookmark with a note, and the PC says it worked', (
      tester,
    ) async {
      final client = await open(tester);
      await tester.tap(find.byKey(const Key('remote-bookmark')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('remote-bookmark-note')),
        'great line',
      );
      await tester.tap(find.byKey(const Key('remote-bookmark-add')));
      await tester.pumpAndSettle();
      expect(_sent(client), [const BookmarkCommand('great line').toJson()]);
      client.emit(
        const RemoteLinkEvent(RemoteNoticeCode.bookmarkAdded, isError: false),
      );
      await tester.pump();
      await tester.pump();
      expect(find.text('Bookmark added on the PC'), findsOneWidget);
    });

    testWidgets('Continue listening starts a book on the PC', (tester) async {
      final client = await open(tester);
      client.recentAnswer = const [
        RemoteRecentItem(id: 'li_7', title: 'Seven', author: 'A', progress: .5),
      ];
      await tester.tap(find.byKey(const Key('remote-continue')));
      await tester.pumpAndSettle();
      expect(client.recentRequests, 1);
      await tester.tap(find.text('Seven'));
      await tester.pumpAndSettle();
      expect(_sent(client), [const PlayItemCommand('li_7').toJson()]);
    });

    testWidgets('nothing playing offers Continue listening once', (
      tester,
    ) async {
      final client = FakeClient(state: RemotePlayerState.empty)
        ..recentAnswer = const [RemoteRecentItem(id: 'li_7', title: 'Seven')];
      await tester.pumpWidget(
        _app(RemoteControlScreen(host: fakeSavedHost, client: client)),
      );
      await tester.pumpAndSettle();
      expect(find.text('Nothing is playing on Test PC'), findsOneWidget);
      expect(find.byKey(const Key('remote-play-pause')), findsNothing);
      expect(find.text('Seven'), findsOneWidget);
      expect(client.recentRequests, 1);
      await tester.tap(find.text('Seven'));
      expect(_sent(client), [const PlayItemCommand('li_7').toJson()]);
    });

    testWidgets('shows Reconnecting instead of stale controls', (tester) async {
      final client = await open(tester);
      expect(find.byKey(const Key('remote-play-pause')), findsOneWidget);
      client.update((c) {
        c.phase = RemoteLinkPhase.reconnecting;
        c.problem = RemoteLinkProblem.unreachable;
      });
      await tester.pump();
      expect(find.text('Reconnecting…'), findsOneWidget);
      expect(find.textContaining('both are on the same Wi-Fi'), findsOneWidget);
      expect(find.byKey(const Key('remote-play-pause')), findsNothing);
      expect(find.byKey(const Key('remote-volume')), findsNothing);
      expect(find.text('The Book'), findsNothing);
    });

    testWidgets('coming back to the app reconnects at once', (tester) async {
      final client = await open(tester);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      expect(client.reconnects, 1);
    });

    testWidgets('a refused command shows a message', (tester) async {
      final client = await open(tester);
      client.emit(const RemoteLinkEvent(RemoteErrorCode.nothingLoaded));
      await tester.pump();
      await tester.pump();
      expect(find.text('Start something on the PC first.'), findsOneWidget);
    });

    testWidgets('unauthorized offers to pair again', (tester) async {
      final client = FakeClient(
        phase: RemoteLinkPhase.closed,
        problem: RemoteLinkProblem.unauthorized,
      );
      RemoteControlExit? exit;
      await tester.pumpWidget(
        _app(
          Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                exit = await Navigator.of(context).push<RemoteControlExit>(
                  MaterialPageRoute(
                    builder: (_) => RemoteControlScreen(
                      host: fakeSavedHost,
                      client: client,
                    ),
                  ),
                );
              },
              child: const Text('open'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.text('Pair again'), findsOneWidget);
      await tester.tap(find.text('Pair again'));
      await tester.pumpAndSettle();
      expect(exit, RemoteControlExit.pairAgain);
      expect(client.disposed, isTrue);
    });

    testWidgets('full screen keeps the layout, survives a reconnect and '
        'leaves on tap', (tester) async {
      final client = await open(tester);
      await tester.tap(find.byKey(const Key('remote-full-screen-button')));
      await tester.pump();
      expect(find.byType(AppBar), findsNothing);
      expect(find.text('Chapter 2'), findsOneWidget);
      expect(find.byKey(const Key('remote-play-pause')), findsOneWidget);

      client.update((c) => c.phase = RemoteLinkPhase.reconnecting);
      await tester.pump();
      expect(find.text('Reconnecting…'), findsOneWidget);

      await tester.tap(find.byKey(const Key('remote-full-screen')));
      await tester.pump();
      expect(find.byType(AppBar), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    });
  });

  group('RemoteConnectScreen', () {
    testWidgets('explains itself, finds a host, pairs and opens the remote', (
      tester,
    ) async {
      final client = FakeClient(state: fakePlaying);
      final connector = FakeConnector(client);
      await tester.pumpWidget(_app(RemoteConnectScreen(connector: connector)));
      await tester.pumpAndSettle();
      expect(find.text('Control your computer'), findsOneWidget);
      expect(find.textContaining('same Wi-Fi'), findsOneWidget);
      expect(find.byKey(const Key('remote-found-h1')), findsOneWidget);

      await tester.tap(find.byKey(const Key('remote-found-h1')));
      await tester.pumpAndSettle();
      expect(find.text('Pair with Test PC'), findsOneWidget);

      await tester.enterText(
        find.byKey(const Key('remote-code-field')),
        '000000',
      );
      await tester.pumpAndSettle();
      expect(
        find.text("That code isn't right. Check the PC and try again."),
        findsOneWidget,
      );

      await tester.enterText(
        find.byKey(const Key('remote-code-field')),
        '123456',
      );
      await tester.pumpAndSettle();
      expect(connector.pairCodes, ['000000', '123456']);
      expect(find.text('The Book'), findsOneWidget);

      final saved = await const RemoteHostBook().load();
      expect(saved.single.hostId, 'h1');
      expect(saved.single.token, 'tok');
    });

    testWidgets('says to choose Allow on the PC while it asks', (tester) async {
      final connector = FakeConnector(
        FakeClient(state: fakePlaying),
        wait: true,
      );
      await tester.pumpWidget(_app(RemoteConnectScreen(connector: connector)));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-found-h1')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('remote-code-field')),
        '123456',
      );
      await tester.pump();
      await tester.pump();
      expect(find.text('Now choose Allow on the PC…'), findsOneWidget);
      connector.allow.complete(false);
      await tester.pumpAndSettle();
      expect(
        find.text(
          "The PC didn't allow this phone. Try again and choose Allow on the PC.",
        ),
        findsOneWidget,
      );
    });

    testWidgets('a scanned code fills in the code; the user still confirms', (
      tester,
    ) async {
      final connector = FakeConnector(FakeClient(state: fakePlaying));
      await tester.pumpWidget(
        _app(
          RemoteConnectScreen(
            connector: connector,
            link: const RemotePairingLink(
              address: '192.168.1.5',
              port: 47390,
              hostId: 'h1',
              code: '123456',
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Pair with 192.168.1.5'), findsOneWidget);
      expect(find.text('123456'), findsOneWidget);
      expect(connector.pairCodes, isEmpty);
      await tester.tap(find.text('Pair'));
      await tester.pumpAndSettle();
      expect(connector.pairCodes, ['123456']);
      expect(find.text('The Book'), findsOneWidget);
      expect((await const RemoteHostBook().find('h1'))?.address, '192.168.1.5');
    });

    testWidgets('a scanned code for a paired computer just opens it there', (
      tester,
    ) async {
      await const RemoteHostBook().save(fakeSavedHost);
      final connector = FakeConnector(FakeClient(state: fakePlaying));
      await tester.pumpWidget(
        _app(
          RemoteConnectScreen(
            connector: connector,
            link: const RemotePairingLink(
              address: '10.0.0.99',
              port: 47391,
              hostId: 'h1',
              code: '654321',
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(connector.pairCodes, isEmpty);
      expect(find.text('The Book'), findsOneWidget);
      final moved = (await const RemoteHostBook().find('h1'))!;
      expect(moved.address, '10.0.0.99');
      expect(moved.port, 47391);
      expect(moved.token, fakeSavedHost.token);
    });

    testWidgets('a typed address is checked', (tester) async {
      final connector = FakeConnector(FakeClient(state: fakePlaying));
      await tester.pumpWidget(_app(RemoteConnectScreen(connector: connector)));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Enter an address'));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('remote-address-field')),
        'not an address',
      );
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      expect(
        find.text('Enter an address like 192.168.1.20 or 192.168.1.20:47390'),
        findsOneWidget,
      );
      await tester.enterText(
        find.byKey(const Key('remote-address-field')),
        '10.0.0.9:47391',
      );
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      expect(find.text('Pair with 10.0.0.9'), findsOneWidget);
    });
  });

  group('RemoteHostSheet', () {
    Future<void> show(WidgetTester tester, FakeHost host) async {
      tester.view.physicalSize = const Size(1200, 2600);
      tester.view.devicePixelRatio = 2;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        _app(Scaffold(body: RemoteHostSheet(host: host))),
      );
    }

    testWidgets('turning on shows the steps, the code and the QR; closing '
        'the sheet closes pairing', (tester) async {
      final host = FakeHost();
      await show(tester, host);
      expect(find.text('Control from your phone'), findsOneWidget);
      expect(find.text('1. Turn it on here.'), findsOneWidget);
      expect(find.byKey(const Key('remote-host-code')), findsNothing);

      await tester.tap(find.byKey(const Key('remote-host-switch')));
      await tester.pump();
      expect(host.enabledCalls, [true]);
      final code = host.codes.code!;
      expect(
        find.text('${code.substring(0, 3)} ${code.substring(3)}'),
        findsOneWidget,
      );
      expect(find.byKey(const Key('remote-host-qr')), findsOneWidget);
      // The browser remote's address: the home-network one.
      expect(
        find.text(
          'Or open http://192.168.1.5:47390 in any browser on the same '
          'Wi-Fi (iPhone, tablet, laptop) and type the code there.',
        ),
        findsOneWidget,
      );
      expect(
        find.text("This PC's address: 100.64.0.3:47390, 192.168.1.5:47390"),
        findsOneWidget,
      );

      await tester.pumpWidget(const SizedBox());
      expect(host.codes.isOpen, isFalse);
    });

    testWidgets('a closed window offers Pair another device', (tester) async {
      final host = FakeHost();
      await host.devices.add('Pixel', tokenHash: 'a' * 64);
      await host.setEnabled(true);
      host.codes.close();
      await show(tester, host);
      await tester.pump();
      expect(find.byKey(const Key('remote-host-code')), findsNothing);
      await tester.tap(find.text('Pair another device'));
      await tester.pump();
      expect(host.pairingOpened, 1);
      expect(find.byKey(const Key('remote-host-code')), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('five devices: no new pairing', (tester) async {
      final host = FakeHost();
      for (var i = 0; i < 5; i++) {
        await host.devices.add('D$i', tokenHash: '$i' * 64);
      }
      await host.setEnabled(true);
      host.codes.close();
      await show(tester, host);
      await tester.pump();
      expect(
        find.text(
          '5 devices are paired, the most allowed. Forget one to pair another.',
        ),
        findsOneWidget,
      );
      expect(find.byKey(const Key('remote-host-pair-another')), findsNothing);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('keep on when Absorb starts', (tester) async {
      final host = FakeHost();
      await show(tester, host);
      await tester.tap(find.byKey(const Key('remote-host-keep-on')));
      await tester.pump();
      expect(host.keepOnCalls, [true]);
      expect(host.status.value.keepOn, isTrue);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('connected and paired devices, last used, forget all', (
      tester,
    ) async {
      final host = FakeHost();
      final added = (await host.devices.add('Pixel', tokenHash: 'a' * 64))!;
      await host.devices.add('Tablet', tokenHash: 'b' * 64);
      await host.setEnabled(true);
      host.connect(
        RemoteConnectionInfo(
          id: 7,
          deviceId: added.id,
          deviceName: 'Pixel',
          address: '192.168.1.9',
          since: DateTime(2026, 11, 3, 9),
        ),
      );
      await show(tester, host);
      await tester.pump();
      await tester.tap(find.text('Disconnect'));
      expect(host.disconnected, [7]);
      expect(find.textContaining('Last used'), findsNWidgets(2));
      await tester.tap(find.byKey(Key('remote-host-forget-${added.id}')));
      await tester.pump();
      expect(host.forgotten, [added.id]);

      await tester.tap(find.byKey(const Key('remote-host-forget-all')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-host-forget-all-confirm')));
      await tester.pumpAndSettle();
      expect(host.forgetAllCalls, 1);
      expect(find.text('No paired devices yet'), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    });
  });

  group('Allow question on the PC', () {
    Future<NavigatorState> navigator(WidgetTester tester) async {
      final key = GlobalKey<NavigatorState>();
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: key,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const SizedBox(),
        ),
      );
      return key.currentState!;
    }

    RemotePairRequest request({Future<void>? cancelled}) => RemotePairRequest(
      deviceName: 'Pixel 9',
      timeout: const Duration(seconds: 60),
      cancelled: cancelled ?? Completer<void>().future,
    );

    testWidgets('Allow and Deny', (tester) async {
      final nav = await navigator(tester);
      final allowed = RemotePairApprovalDialog.ask(nav, request());
      await tester.pumpAndSettle();
      expect(
        find.text('Allow ‘Pixel 9’ to control Absorb on this PC?'),
        findsOneWidget,
      );
      await tester.tap(find.byKey(const Key('remote-host-allow')));
      await tester.pumpAndSettle();
      expect(await allowed, isTrue);
      expect(find.byType(RemotePairApprovalDialog), findsNothing);

      final denied = RemotePairApprovalDialog.ask(nav, request());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-host-deny')));
      await tester.pumpAndSettle();
      expect(await denied, isFalse);
    });

    testWidgets('no answer in 60 s, or the phone giving up, is a no', (
      tester,
    ) async {
      final nav = await navigator(tester);
      final late = RemotePairApprovalDialog.ask(nav, request());
      await tester.pump();
      await tester.pump(const Duration(seconds: 61));
      await tester.pumpAndSettle();
      expect(await late, isFalse);
      expect(find.byType(RemotePairApprovalDialog), findsNothing);

      final gone = Completer<void>();
      final cancelled = RemotePairApprovalDialog.ask(
        nav,
        request(cancelled: gone.future),
      );
      await tester.pumpAndSettle();
      gone.complete();
      await tester.pumpAndSettle();
      expect(await cancelled, isFalse);
      expect(find.byType(RemotePairApprovalDialog), findsNothing);
    });
  });

  test('pairing links are taken by the remote hook, others pass', () {
    RemoteLinkHooks.resetForTest();
    expect(RemoteLinkHooks.offerLink(Uri.parse('absorb://setup?x=1')), isFalse);
    final link = const RemotePairingLink(
      address: '192.168.1.5',
      port: 47390,
      hostId: 'h1',
      code: '123456',
    ).encodeAppLink();
    expect(RemoteLinkHooks.offerLink(Uri.parse(link)), isTrue);
    expect(RemoteLinkHooks.pendingForTest?.code, '123456');
    RemoteLinkHooks.resetForTest();
  });

  testWidgets('Settings rows open the host sheet and the connect screen', (
    tester,
  ) async {
    final host = FakeHost();
    final connector = FakeConnector(FakeClient(state: fakePlaying));
    await tester.pumpWidget(
      _app(
        Scaffold(
          body: RemoteLinkSettingsTiles(host: host, connector: connector),
        ),
      ),
    );
    expect(find.text('Control from your phone'), findsOneWidget);
    expect(
      find.text('Use your phone as a remote for Absorb on this PC'),
      findsOneWidget,
    );
    expect(find.text('Control your computer'), findsOneWidget);

    await tester.tap(find.text('Control your computer'));
    await tester.pumpAndSettle();
    expect(find.byType(RemoteConnectScreen), findsOneWidget);
  });
}
