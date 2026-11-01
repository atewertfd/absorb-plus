import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/windows_global_hotkeys.dart';
import 'package:absorb/services/windows_shell.dart';
import 'package:absorb/widgets/windows_settings_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakePlayback implements GlobalHotkeyPlayback {
  final calls = <String>[];
  @override
  double volume = 0.5;

  @override
  Future<void> playPause() async => calls.add('playPause');
  @override
  Future<void> rewind() async => calls.add('rewind');
  @override
  Future<void> forward() async => calls.add('forward');
  @override
  Future<void> setVolume(double v) async {
    calls.add('volume');
    volume = v;
  }

  @override
  Future<void> addBookmark() async => calls.add('bookmark');
}

class _FakeShellPlayback extends ChangeNotifier
    implements WindowsShellPlayback {
  @override
  bool get hasBook => false;
  @override
  bool get isPlaying => false;
  @override
  double get progress => 0;
  @override
  Future<void> playPause() async {}
  @override
  Future<void> rewind() async {}
  @override
  Future<void> forward() async {}
  @override
  Future<void> saveForExit() async {}
}

class _FakeDownloads extends ChangeNotifier implements WindowsShellDownloads {
  @override
  bool get busy => false;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel(WindowsGlobalHotkeys.channelName);
  const shellChannel = MethodChannel('absorb/windows_shell');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late List<MethodCall> sent;
  late List<int> refused;
  late _FakePlayback playback;
  late WindowsGlobalHotkeys hotkeys;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    sent = [];
    refused = [];
    playback = _FakePlayback();
    hotkeys = WindowsGlobalHotkeys.withChannel(channel, playback: playback);
    messenger.setMockMethodCallHandler(channel, (call) async {
      sent.add(call);
      if (call.method == 'register') return refused;
      return true;
    });
  });

  tearDown(() {
    hotkeys.stop();
    messenger.setMockMethodCallHandler(channel, null);
  });

  /// What the runner does on WM_HOTKEY.
  Future<void> press(int id) async {
    await messenger.handlePlatformMessage(
      WindowsGlobalHotkeys.channelName,
      const StandardMethodCodec().encodeMethodCall(MethodCall('hotkey', id)),
      (_) {},
    );
  }

  test('off by default: start registers nothing', () async {
    await hotkeys.start();
    expect(sent, isEmpty);
    expect(hotkeys.state.value.enabled, isFalse);
  });

  test('turning on registers the six Ctrl+Alt keys and remembers it',
      () async {
    await hotkeys.setEnabled(true);
    expect(sent.single.method, 'register');
    final list = (sent.single.arguments as List).cast<Map>();
    expect(list, hasLength(6));
    expect(list.first, {'id': 1, 'modifiers': 0x3, 'key': 0x20, 'repeat': false});
    expect(list.map((m) => m['key']), [0x20, 0x25, 0x27, 0x26, 0x28, 0x42]);
    expect(list.every((m) => m['modifiers'] == 0x3), isTrue);
    expect(hotkeys.state.value,
        const GlobalHotkeysState(enabled: true, unavailable: []));
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool(WindowsGlobalHotkeys.prefKey), isTrue);
  });

  test('a saved choice registers on start', () async {
    SharedPreferences.setMockInitialValues(
        {WindowsGlobalHotkeys.prefKey: true});
    await hotkeys.start();
    expect(sent.single.method, 'register');
    expect(hotkeys.state.value.enabled, isTrue);
  });

  test('keys taken by another app are reported by name', () async {
    refused = [1, 6];
    await hotkeys.setEnabled(true);
    expect(hotkeys.state.value.unavailable.map((b) => b.label),
        ['Ctrl+Alt+Space', 'Ctrl+Alt+B']);
  });

  test('an older runner without the channel reports every key', () async {
    messenger.setMockMethodCallHandler(channel, (call) async {
      throw MissingPluginException();
    });
    await hotkeys.setEnabled(true);
    expect(hotkeys.state.value.unavailable, hasLength(6));
  });

  test('turning off unregisters and remembers it', () async {
    await hotkeys.setEnabled(true);
    await hotkeys.setEnabled(false);
    expect(sent.last.method, 'unregisterAll');
    expect(hotkeys.state.value.enabled, isFalse);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool(WindowsGlobalHotkeys.prefKey), isFalse);
  });

  test('hotkeys run the player actions', () async {
    await hotkeys.setEnabled(true);
    for (final id in [1, 2, 3, 6]) {
      await press(id);
    }
    expect(playback.calls, ['playPause', 'rewind', 'forward', 'bookmark']);
  });

  test('volume steps by 5% and stays within 0..1', () async {
    await hotkeys.setEnabled(true);
    await press(4);
    expect(playback.volume, closeTo(0.55, 1e-9));
    await press(5);
    await press(5);
    expect(playback.volume, closeTo(0.45, 1e-9));

    playback.volume = 1.0;
    playback.calls.clear();
    await press(4);
    expect(playback.calls, isEmpty, reason: 'already at full volume');
    playback.volume = 0.02;
    await press(5);
    expect(playback.volume, 0.0);
  });

  test('hotkeys do nothing while off, and unknown ids are ignored', () async {
    await hotkeys.start();
    await press(1);
    await hotkeys.setEnabled(true);
    await press(99);
    expect(playback.calls, isEmpty);
  });

  test('the shared instance is a no-op off Windows', () async {
    // The test platform is Android.
    expect(WindowsGlobalHotkeys.instance.isSupported, isFalse);
    await WindowsGlobalHotkeys.instance.setEnabled(true);
    expect(sent, isEmpty);
    expect(WindowsGlobalHotkeys.instance.state.value.enabled, isFalse);
  });

  testWidgets('the Windows settings switch turns hotkeys on and lists taken '
      'keys', (tester) async {
    messenger.setMockMethodCallHandler(shellChannel, (call) async {
      return <String, Object?>{'closeToTray': false, 'keepAwake': true};
    });
    addTearDown(() => messenger.setMockMethodCallHandler(shellChannel, null));
    final shell = WindowsShell.withSources(
      channel: shellChannel,
      playback: _FakeShellPlayback(),
      downloads: _FakeDownloads(),
    );
    refused = [4];
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: SingleChildScrollView(
            child: WindowsSettingsTiles(shell: shell, hotkeys: hotkeys)),
      ),
    ));
    await tester.pumpAndSettle();
    final tile = find.widgetWithText(SwitchListTile, 'Global hotkeys');
    expect(tile, findsOneWidget);
    expect(tester.widget<SwitchListTile>(tile).value, isFalse);
    expect(find.textContaining('Ctrl+Alt+B add bookmark'), findsOneWidget);

    await tester.tap(tile);
    await tester.pumpAndSettle();
    expect(sent.last.method, 'register');
    expect(tester.widget<SwitchListTile>(tile).value, isTrue);
    expect(
        find.textContaining(
            'Taken by another app, not available: Ctrl+Alt+Up'),
        findsOneWidget);
  });
}
