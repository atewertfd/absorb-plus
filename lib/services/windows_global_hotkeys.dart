import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'audio_player_service.dart';

/// What a global hotkey does.
enum GlobalHotkeyAction { playPause, back, forward, volumeUp, volumeDown, bookmark }

/// One system-wide key combination. [modifiers] and [virtualKey] are the
/// Win32 RegisterHotKey values (MOD_* flags and a VK_* code).
@immutable
class GlobalHotkeyBinding {
  const GlobalHotkeyBinding({
    required this.action,
    required this.id,
    required this.virtualKey,
    required this.label,
    this.modifiers = modControl | modAlt,
    this.repeat = false,
  });

  static const modAlt = 0x0001;
  static const modControl = 0x0002;

  final GlobalHotkeyAction action;

  /// The RegisterHotKey id; WM_HOTKEY comes back with it.
  final int id;
  final int modifiers;
  final int virtualKey;

  /// Shown when the combination is taken by another app.
  final String label;

  /// Keeps firing while held (volume); the others fire once per press.
  final bool repeat;

  Map<String, Object> toMap() =>
      {'id': id, 'modifiers': modifiers, 'key': virtualKey, 'repeat': repeat};
}

/// The default keys: Ctrl+Alt plus Space, the arrows and B.
const defaultGlobalHotkeys = <GlobalHotkeyBinding>[
  GlobalHotkeyBinding(
      action: GlobalHotkeyAction.playPause,
      id: 1,
      virtualKey: 0x20, // VK_SPACE
      label: 'Ctrl+Alt+Space'),
  GlobalHotkeyBinding(
      action: GlobalHotkeyAction.back,
      id: 2,
      virtualKey: 0x25, // VK_LEFT
      label: 'Ctrl+Alt+Left'),
  GlobalHotkeyBinding(
      action: GlobalHotkeyAction.forward,
      id: 3,
      virtualKey: 0x27, // VK_RIGHT
      label: 'Ctrl+Alt+Right'),
  GlobalHotkeyBinding(
      action: GlobalHotkeyAction.volumeUp,
      id: 4,
      virtualKey: 0x26, // VK_UP
      label: 'Ctrl+Alt+Up',
      repeat: true),
  GlobalHotkeyBinding(
      action: GlobalHotkeyAction.volumeDown,
      id: 5,
      virtualKey: 0x28, // VK_DOWN
      label: 'Ctrl+Alt+Down',
      repeat: true),
  GlobalHotkeyBinding(
      action: GlobalHotkeyAction.bookmark,
      id: 6,
      virtualKey: 0x42, // 'B'
      label: 'Ctrl+Alt+B'),
];

/// Whether the hotkeys are on, and which combinations Windows refused
/// because another app holds them.
@immutable
class GlobalHotkeysState {
  const GlobalHotkeysState({this.enabled = false, this.unavailable = const []});

  final bool enabled;
  final List<GlobalHotkeyBinding> unavailable;

  @override
  bool operator ==(Object other) =>
      other is GlobalHotkeysState &&
      other.enabled == enabled &&
      listEquals(other.unavailable, unavailable);

  @override
  int get hashCode => Object.hash(enabled, Object.hashAll(unavailable));
}

/// What the hotkeys act on; the app's player by default, a fake in tests.
abstract class GlobalHotkeyPlayback {
  Future<void> playPause();
  Future<void> rewind();
  Future<void> forward();
  double get volume;
  Future<void> setVolume(double volume);
  Future<void> addBookmark();
}

/// The app's player, through AudioPlayerService's public API: the same skip
/// amounts as the media keys and the same bookmark as the car-mode button.
class _AppPlayback implements GlobalHotkeyPlayback {
  AudioPlayerService get _player => AudioPlayerService();

  @override
  Future<void> playPause() async {
    if (!_player.hasBook) return;
    if (_player.isPlaying) {
      await _player.pause();
    } else {
      await _player.play(fromUi: true);
    }
  }

  @override
  Future<void> rewind() async {
    if (_player.hasBook) await AudioPlayerService.handler?.rewind();
  }

  @override
  Future<void> forward() async {
    if (_player.hasBook) await AudioPlayerService.handler?.fastForward();
  }

  @override
  double get volume => _player.volume;

  @override
  Future<void> setVolume(double volume) => _player.setVolume(volume);

  @override
  Future<void> addBookmark() async {
    if (!_player.hasBook) return;
    await AudioPlayerService.handler?.customAction('bookmark');
  }
}

/// Opt-in system-wide hotkeys on Windows (fork-owned). The runner side is
/// windows/runner/global_hotkeys.cpp over the `absorb/windows_global_hotkeys`
/// channel: it registers the combinations on the main window and sends
/// `hotkey` with the binding's id. Off by default; a no-op off Windows.
class WindowsGlobalHotkeys {
  WindowsGlobalHotkeys._()
      : _channel = const MethodChannel(channelName),
        _enabled = !kIsWeb && defaultTargetPlatform == TargetPlatform.windows,
        _playbackOverride = null;

  /// Tests: a fake channel and player.
  @visibleForTesting
  WindowsGlobalHotkeys.withChannel(
    this._channel, {
    required GlobalHotkeyPlayback playback,
  })  : _enabled = true,
        _playbackOverride = playback;

  static final WindowsGlobalHotkeys instance = WindowsGlobalHotkeys._();

  static const channelName = 'absorb/windows_global_hotkeys';
  static const prefKey = 'windows_global_hotkeys';
  static const volumeStep = 0.05;

  final MethodChannel _channel;
  final bool _enabled;
  final GlobalHotkeyPlayback? _playbackOverride;
  late final GlobalHotkeyPlayback _playback =
      _playbackOverride ?? _AppPlayback();

  List<GlobalHotkeyBinding> get bindings => defaultGlobalHotkeys;

  final ValueNotifier<GlobalHotkeysState> state =
      ValueNotifier(const GlobalHotkeysState());

  bool get isSupported => _enabled;

  bool _started = false;

  /// Reads the saved choice and registers the keys when it is on.
  Future<void> start() async {
    if (!_enabled || _started) return;
    _started = true;
    _channel.setMethodCallHandler(_onNativeCall);
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(prefKey) ?? false) await _register();
  }

  @visibleForTesting
  void stop() {
    _channel.setMethodCallHandler(null);
    _started = false;
    state.value = const GlobalHotkeysState();
  }

  /// Turns the hotkeys on or off and remembers it.
  Future<void> setEnabled(bool enabled) async {
    if (!_enabled) return;
    if (!_started) await start();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(prefKey, enabled);
    if (enabled) {
      await _register();
    } else {
      await _unregister();
    }
  }

  Future<void> _register() async {
    var unavailable = const <GlobalHotkeyBinding>[];
    try {
      final failed = await _channel.invokeListMethod<Object?>(
          'register', [for (final b in bindings) b.toMap()]);
      final ids = failed?.whereType<int>().toSet() ?? const <int>{};
      unavailable = [
        for (final b in bindings)
          if (ids.contains(b.id)) b,
      ];
    } on MissingPluginException {
      // Older runner without the hotkey channel.
      unavailable = bindings;
    } catch (e) {
      debugPrint('[GlobalHotkeys] register failed: $e');
      unavailable = bindings;
    }
    state.value = GlobalHotkeysState(enabled: true, unavailable: unavailable);
  }

  Future<void> _unregister() async {
    state.value = const GlobalHotkeysState();
    try {
      await _channel.invokeMethod<bool>('unregisterAll');
    } on MissingPluginException {
      // Older runner: nothing was registered.
    } catch (e) {
      debugPrint('[GlobalHotkeys] unregister failed: $e');
    }
  }

  Future<dynamic> _onNativeCall(MethodCall call) async {
    if (call.method != 'hotkey') {
      throw MissingPluginException('WindowsGlobalHotkeys: ${call.method}');
    }
    final id = call.arguments;
    if (!state.value.enabled || id is! int) return null;
    for (final binding in bindings) {
      if (binding.id == id) {
        await _run(binding.action);
        break;
      }
    }
    return null;
  }

  Future<void> _run(GlobalHotkeyAction action) async {
    try {
      switch (action) {
        case GlobalHotkeyAction.playPause:
          await _playback.playPause();
        case GlobalHotkeyAction.back:
          await _playback.rewind();
        case GlobalHotkeyAction.forward:
          await _playback.forward();
        case GlobalHotkeyAction.volumeUp:
          await _stepVolume(volumeStep);
        case GlobalHotkeyAction.volumeDown:
          await _stepVolume(-volumeStep);
        case GlobalHotkeyAction.bookmark:
          await _playback.addBookmark();
      }
    } catch (e) {
      debugPrint('[GlobalHotkeys] $action failed: $e');
    }
  }

  Future<void> _stepVolume(double delta) async {
    final current = _playback.volume;
    // Round to the step so repeated presses land on even values.
    final next =
        (((current + delta) / volumeStep).round() * volumeStep).clamp(0.0, 1.0);
    if (next != current) await _playback.setVolume(next);
  }
}
