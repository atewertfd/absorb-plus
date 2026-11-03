import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/remote_connect_screen.dart';
import 'package:absorb/screens/remote_control_screen.dart';
import 'package:absorb/services/remote_link/pairing_store.dart';
import 'package:absorb/services/remote_link/protocol.dart';
import 'package:absorb/services/remote_link/remote_link_types.dart';
import 'package:absorb/widgets/remote_host_sheet.dart';
import 'package:absorb/widgets/remote_link_settings_tiles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The phone-remote screens against fakes (no sockets).

class FakeClient extends ChangeNotifier implements RemoteLinkClient {
  FakeClient({
    this.phase = RemoteLinkPhase.connected,
    this.state,
    this.problem = RemoteLinkProblem.none,
  });

  @override
  RemoteLinkPhase phase;
  @override
  RemoteLinkProblem problem;
  @override
  RemotePlayerState? state;
  @override
  Uint8List? cover;
  @override
  String? lastError;
  @override
  SavedRemoteHost get host => _host;
  @override
  String get hostName => 'Test PC';

  final sent = <RemoteCommand>[];
  int connects = 0;
  bool disposed = false;

  void update(void Function(FakeClient c) change) {
    change(this);
    notifyListeners();
  }

  @override
  Future<void> connect() async => connects++;
  @override
  void send(RemoteCommand command) => sent.add(command);
  @override
  Future<void> close() async {}
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}

const _host = SavedRemoteHost(
  hostId: 'h1',
  name: 'Test PC',
  address: '10.0.0.2',
  port: 47390,
  token: 't',
);

const _playing = RemotePlayerState(
  itemId: 'li_1',
  title: 'The Book',
  author: 'Writer',
  chapterTitle: 'Chapter 2',
  position: 150,
  duration: 3600,
  chapterStart: 100,
  chapterEnd: 400,
  playing: true,
  speed: 1.25,
  skipBack: 15,
  skipForward: 30,
);

class FakeConnector implements RemoteLinkConnector {
  FakeConnector(this.client);
  final FakeClient client;
  final pairCodes = <String>[];

  @override
  bool get isSupported => true;

  @override
  Stream<RemoteHostAnnouncement> discover({
    Duration timeout = const Duration(seconds: 2),
  }) => Stream.fromIterable(const [
    RemoteHostAnnouncement(
      hostId: 'h1',
      name: 'Test PC',
      port: 47390,
      address: '10.0.0.2',
    ),
  ]);

  @override
  Future<RemotePairResult> pair({
    required String address,
    required int port,
    required String code,
    required String deviceName,
  }) async {
    pairCodes.add(code);
    if (code != '123456') {
      return const RemotePairResult.failed(RemoteErrorCode.badCode);
    }
    return RemotePairResult.paired(
      SavedRemoteHost(
        hostId: 'h1',
        name: 'Test PC',
        address: address,
        port: port,
        token: 'tok',
      ),
    );
  }

  @override
  RemoteLinkClient open(SavedRemoteHost host) => client;

  @override
  Future<String> deviceName() async => 'Test phone';
}

class FakeHost implements RemoteHostController {
  final _status = ValueNotifier(const RemoteHostStatus());
  final _connections = ValueNotifier(const <RemoteConnectionInfo>[]);
  final enabledCalls = <bool>[];
  final forgotten = <String>[];
  final disconnected = <int>[];

  @override
  bool get isSupported => true;
  @override
  ValueListenable<RemoteHostStatus> get status => _status;
  @override
  ValueListenable<List<RemoteConnectionInfo>> get connections => _connections;
  @override
  final PairingCodeIssuer codes = PairingCodeIssuer();
  @override
  final PairedDeviceStore devices = PairedDeviceStore();

  @override
  Future<void> start() async {}
  @override
  Future<void> setEnabled(bool enabled) async {
    enabledCalls.add(enabled);
    _status.value = enabled
        ? const RemoteHostStatus(
            enabled: true,
            running: true,
            port: 47390,
            addresses: ['192.168.1.5'],
            hostId: 'h1',
            hostName: 'Test PC',
            discovery: true,
          )
        : const RemoteHostStatus();
  }

  @override
  Future<void> signedOut() async {}
  @override
  void shutdownForExit() {}
  @override
  Future<void> disconnect(int connectionId) async =>
      disconnected.add(connectionId);
  @override
  Future<void> forget(String deviceId) async {
    forgotten.add(deviceId);
    await devices.forget(deviceId);
  }

  void connect(RemoteConnectionInfo info) => _connections.value = [info];
}

Widget _app(Widget home) => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: home,
);

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('RemoteControlScreen', () {
    testWidgets('shows what is playing and sends the button commands', (
      tester,
    ) async {
      final client = FakeClient(state: _playing);
      await tester.pumpWidget(
        _app(RemoteControlScreen(host: _host, client: client)),
      );
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
      expect(client.sent.map((c) => c.toJson()).toList(), [
        const ToggleCommand().toJson(),
        const SkipCommand(-15).toJson(),
        const SkipCommand(30).toJson(),
        const ChapterCommand(1).toJson(),
        const ChapterCommand(-1).toJson(),
      ]);
    });

    testWidgets('speed and sleep pickers send commands', (tester) async {
      final client = FakeClient(state: _playing);
      await tester.pumpWidget(
        _app(RemoteControlScreen(host: _host, client: client)),
      );
      await tester.tap(find.byKey(const Key('remote-speed')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('1.5x'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('remote-sleep')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('30 minutes'));
      await tester.pumpAndSettle();
      expect(client.sent.map((c) => c.toJson()).toList(), [
        const SpeedCommand(1.5).toJson(),
        const SleepCommand.minutes(30).toJson(),
      ]);
    });

    testWidgets('shows Reconnecting instead of stale controls', (tester) async {
      final client = FakeClient(state: _playing);
      await tester.pumpWidget(
        _app(RemoteControlScreen(host: _host, client: client)),
      );
      expect(find.byKey(const Key('remote-play-pause')), findsOneWidget);
      client.update((c) => c.phase = RemoteLinkPhase.reconnecting);
      await tester.pump();
      expect(find.text('Reconnecting…'), findsOneWidget);
      expect(find.byKey(const Key('remote-play-pause')), findsNothing);
      expect(find.text('The Book'), findsNothing);
    });

    testWidgets('nothing playing', (tester) async {
      final client = FakeClient(state: RemotePlayerState.empty);
      await tester.pumpWidget(
        _app(RemoteControlScreen(host: _host, client: client)),
      );
      expect(find.text('Nothing is playing on Test PC'), findsOneWidget);
      expect(find.byKey(const Key('remote-play-pause')), findsNothing);
    });

    testWidgets('a refused command shows a message', (tester) async {
      final client = FakeClient(state: _playing);
      await tester.pumpWidget(
        _app(RemoteControlScreen(host: _host, client: client)),
      );
      client.update((c) => c.lastError = RemoteErrorCode.nothingLoaded);
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
                    builder: (_) =>
                        RemoteControlScreen(host: _host, client: client),
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

    testWidgets('display mode shows a clock and leaves on tap', (tester) async {
      final client = FakeClient(state: _playing);
      await tester.pumpWidget(
        _app(RemoteControlScreen(host: _host, client: client)),
      );
      await tester.tap(find.byKey(const Key('remote-display-mode')));
      await tester.pump();
      expect(find.byKey(const Key('remote-display-clock')), findsOneWidget);
      expect(find.text('Chapter 2'), findsOneWidget);
      // 250 s left in the chapter at 1.25x.
      expect(find.text('03:20 left in the chapter'), findsOneWidget);

      client.update((c) => c.phase = RemoteLinkPhase.reconnecting);
      await tester.pump();
      expect(find.text('Reconnecting…'), findsOneWidget);

      await tester.tap(find.byKey(const Key('remote-display')));
      await tester.pump();
      expect(find.byKey(const Key('remote-display-clock')), findsNothing);
      await tester.pumpWidget(const SizedBox());
    });
  });

  group('RemoteConnectScreen', () {
    testWidgets('finds a host, pairs with the code and opens the remote', (
      tester,
    ) async {
      final client = FakeClient(state: _playing);
      final connector = FakeConnector(client);
      await tester.pumpWidget(_app(RemoteConnectScreen(connector: connector)));
      await tester.pumpAndSettle();
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

    testWidgets('a typed address is checked', (tester) async {
      final connector = FakeConnector(FakeClient(state: _playing));
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
    testWidgets('switch on shows the code; pairing closes with the sheet', (
      tester,
    ) async {
      final host = FakeHost();
      await tester.pumpWidget(
        _app(Scaffold(body: RemoteHostSheet(host: host))),
      );
      expect(host.codes.isOpen, isTrue);
      expect(find.byKey(const Key('remote-host-code')), findsNothing);

      await tester.tap(find.byKey(const Key('remote-host-switch')));
      await tester.pump();
      expect(host.enabledCalls, [true]);
      final code = host.codes.code!;
      expect(
        find.text('${code.substring(0, 3)} ${code.substring(3)}'),
        findsOneWidget,
      );
      expect(find.text('Address: 192.168.1.5:47390'), findsOneWidget);

      await tester.pumpWidget(const SizedBox());
      expect(host.codes.isOpen, isFalse);
      expect(host.codes.code, isNull);
    });

    testWidgets('lists connected and paired devices with their actions', (
      tester,
    ) async {
      final host = FakeHost();
      final added = await host.devices.add('Pixel');
      await host.setEnabled(true);
      host.connect(
        RemoteConnectionInfo(
          id: 7,
          deviceId: added.device.id,
          deviceName: 'Pixel',
          address: '192.168.1.9',
          since: DateTime(2026, 11, 3, 9),
        ),
      );
      await tester.pumpWidget(
        _app(Scaffold(body: RemoteHostSheet(host: host))),
      );
      await tester.pump();
      final list = find.byType(Scrollable).first;
      await tester.scrollUntilVisible(
        find.text('Disconnect'),
        100,
        scrollable: list,
      );
      await tester.tap(find.text('Disconnect'));
      expect(host.disconnected, [7]);
      await tester.scrollUntilVisible(
        find.byKey(Key('remote-host-forget-${added.device.id}')),
        100,
        scrollable: list,
      );
      await tester.tap(
        find.byKey(Key('remote-host-forget-${added.device.id}')),
      );
      await tester.pump();
      expect(host.forgotten, [added.device.id]);
      expect(find.text('No paired devices yet'), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    });
  });

  testWidgets('Settings rows open the host sheet and the connect screen', (
    tester,
  ) async {
    final host = FakeHost();
    final connector = FakeConnector(FakeClient(state: _playing));
    await tester.pumpWidget(
      _app(
        Scaffold(
          body: RemoteLinkSettingsTiles(host: host, connector: connector),
        ),
      ),
    );
    expect(find.text('Phone remote'), findsOneWidget);
    expect(find.text('Control this PC from your phone'), findsOneWidget);
    expect(find.text('Control another device'), findsOneWidget);

    await tester.tap(find.text('Control another device'));
    await tester.pumpAndSettle();
    expect(find.byType(RemoteConnectScreen), findsOneWidget);
  });
}
