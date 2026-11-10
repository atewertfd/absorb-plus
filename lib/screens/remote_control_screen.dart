import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';

import '../l10n/app_localizations.dart';
import '../services/remote_link/remote_layout.dart';
import '../services/remote_link/remote_link.dart';
import '../services/remote_link/remote_media_mirror.dart';
import '../services/remote_link/remote_media_session_stub.dart'
    if (dart.library.io) '../services/remote_link/remote_media_session_io.dart';
import '../services/screen_wake.dart';
import '../utils/cover_accent.dart';
import '../utils/cover_palette.dart';
import '../utils/fork_errors.dart';
import '../utils/fork_platform.dart';
import '../widgets/absorb_slider.dart';
import '../widgets/absorbing_shared.dart' show fmtTime;
import '../widgets/adaptive_modal.dart';
import '../widgets/card_buttons.dart' show Pressable;
import '../widgets/remote_layout_view.dart';

/// How the remote screen was left, for the connect screen.
enum RemoteControlExit { pairAgain }

/// "Control your computer", the remote screen (fork): what the PC is
/// playing, its controls, Continue listening, and full screen. Shows
/// "Reconnecting…" instead of stale controls while the link is down.
class RemoteControlScreen extends StatefulWidget {
  const RemoteControlScreen({
    super.key,
    required this.host,
    this.connector,
    this.client,
    this.mediaSession,
  });

  final SavedRemoteHost host;

  /// Tests: a fake media session for the lock-screen controls.
  final RemoteMediaSessionPort? mediaSession;

  /// Injected in tests; the app uses [remoteLinkConnector].
  final RemoteLinkConnector? connector;

  /// Tests: a fake link instead of `connector.open(host)`.
  final RemoteLinkClient? client;

  @override
  State<RemoteControlScreen> createState() => _RemoteControlScreenState();
}

class _RemoteControlScreenState extends State<RemoteControlScreen>
    with WidgetsBindingObserver {
  static const _wakeOwner = 'remoteDisplay';
  static const _speedStep = 0.05;

  RemoteLinkConnector get _connector => widget.connector ?? remoteLinkConnector;

  late RemoteLinkClient _client;
  StreamSubscription<RemoteLinkEvent>? _events;
  bool _fullScreen = false;
  Timer? _dimTimer;
  bool _dimmed = false;
  bool _editing = false;
  RemoteLayout _layout = RemoteLayout.defaults();
  RemoteLook _look = const RemoteLook();
  bool _layoutTouched = false;
  bool _hintShown = false;
  Color? _coverAccent;
  Uint8List? _accentFor;
  double? _volumeTarget;
  DateTime? _volumeAt;
  RemotePlayerState? _lastState;
  double? _drag;
  double? _seekTarget;
  DateTime? _seekAt;
  double? _volumeDrag;
  double? _speedTarget;
  bool _recentAsked = false;
  DateTime? _speedAt;
  late final RemoteMediaSessionPort _mediaSession =
      widget.mediaSession ?? appRemoteMediaSession();
  RemoteMediaMirror? _mirror;
  bool _lockScreen = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _attach(widget.client ?? _connector.open(widget.host));
    unawaited(_loadLayout());
    if (_mediaSession.isAvailable) unawaited(_loadLockScreen());
  }

  Future<void> _loadLockScreen() async {
    try {
      final on = await RemoteMediaMirror.loadEnabled();
      if (!mounted) return;
      setState(() => _lockScreen = on);
      _mirror?.enabled = on;
    } catch (e) {
      swallow('RemoteMirror', e);
    }
  }

  void _setLockScreen(bool on) {
    setState(() => _lockScreen = on);
    _mirror?.enabled = on;
    fireAndLog(RemoteMediaMirror.saveEnabled(on), 'RemoteMirror');
  }

  Future<void> _loadLayout() async {
    try {
      final saved = await RemoteLayoutStore.load();
      if (!mounted) return;
      _hintShown = _hintShown || saved.hintShown;
      if (_layoutTouched) return;
      setState(() {
        _layout = saved.layout;
        _look = saved.look;
      });
    } catch (e) {
      swallow('RemoteLayout', e);
    }
  }

  void _setLayout(RemoteLayout layout) {
    setState(() {
      _layout = layout;
      _layoutTouched = true;
    });
    fireAndLog(RemoteLayoutStore.saveLayout(layout), 'RemoteLayout');
  }

  void _setLook(RemoteLook look) {
    setState(() {
      _look = look;
      _layoutTouched = true;
    });
    fireAndLog(RemoteLayoutStore.saveLook(look), 'RemoteLayout');
  }

  /// A preset for the orientation being edited. Nightstand also turns the
  /// background black and dims after 10 minutes, unless the look already
  /// has its own background or dimming.
  void _applyPreset(RemotePreset preset, bool landscape) {
    _setLayout(_layout.applyPreset(preset, landscape: landscape));
    if (preset != RemotePreset.nightstand) return;
    _setLook(
      _look.copyWith(
        background: _look.background == RemoteLookBackground.theme
            ? RemoteLookBackground.black
            : null,
        dimAfterMinutes: _look.dimAfterMinutes == 0 ? 10 : null,
      ),
    );
  }

  void _attach(RemoteLinkClient client) {
    _client = client;
    _events = client.events.listen(_onEvent);
    if (_mediaSession.isAvailable) {
      _mirror = RemoteMediaMirror(
        client: client,
        session: _mediaSession,
        enabled: _lockScreen,
      );
    }
    unawaited(client.connect());
  }

  void _detach() {
    unawaited(_events?.cancel());
    _events = null;
    _mirror?.dispose();
    _mirror = null;
    _client.dispose();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _dimTimer?.cancel();
    if (_fullScreen) _applyFullScreen(false);
    _detach();
    super.dispose();
  }

  /// Back from the background (the phone slept, Wi-Fi came back): try at
  /// once instead of waiting for the next retry.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _client.reconnectNow();
      _mirror?.resume();
    }
  }

  void _connectAgain() {
    _detach();
    setState(() => _attach(_connector.open(widget.host)));
  }

  void _onEvent(RemoteLinkEvent event) {
    if (!mounted) return;
    final l = AppLocalizations.of(context)!;
    final text = switch (event.code) {
      RemoteNoticeCode.bookmarkAdded => l.remoteBookmarkAdded,
      RemoteErrorCode.nothingLoaded => l.remoteNothingLoaded,
      RemoteErrorCode.notFound => l.remoteNotOnList,
      _ => event.isError ? l.remoteCommandFailed : null,
    };
    if (text == null) return;
    ScaffoldMessenger.maybeOf(context)
      ?..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  void _send(RemoteCommand command) => _client.send(command);

  // ── Full screen ───────────────────────────────────────────────────

  /// Full screen is the same layout without the app bar and system bars,
  /// with the screen kept on. Not while editing.
  void _setFullScreen(bool on) {
    if (_fullScreen == on || (on && _editing)) return;
    setState(() {
      _fullScreen = on;
      _dimmed = false;
    });
    _applyFullScreen(on);
    _armDim();
    if (on && !_hintShown) {
      _hintShown = true;
      fireAndLog(RemoteLayoutStore.saveHintShown(), 'RemoteLayout');
      final l = AppLocalizations.of(context)!;
      ScaffoldMessenger.maybeOf(context)
        ?..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            key: const Key('remote-full-screen-hint'),
            content: Text(l.remoteFullScreenHint),
            duration: const Duration(seconds: 3),
          ),
        );
    }
  }

  /// A tap on empty space (not on a control) enters or leaves full screen.
  void _toggleFullScreen() => _setFullScreen(!_fullScreen);

  /// Dims full screen after the Look's minutes without a touch.
  void _armDim() {
    _dimTimer?.cancel();
    _dimTimer = null;
    final minutes = _look.dimAfterMinutes;
    if (!_fullScreen || minutes <= 0) return;
    _dimTimer = Timer(Duration(minutes: minutes), () {
      if (mounted) setState(() => _dimmed = true);
    });
  }

  /// Any touch in full screen restarts the dim countdown.
  void _onFullScreenTouch() {
    if (!_dimmed) _armDim();
  }

  /// The first tap on a dimmed screen only wakes it.
  void _wake() {
    setState(() => _dimmed = false);
    _armDim();
  }

  /// Keeps the screen on (Android flag / Windows runner, the app's own
  /// [ScreenWake]) and hides the phone's system bars.
  void _applyFullScreen(bool on) {
    unawaited(ScreenWake.hold(_wakeOwner, on));
    if (ForkPlatform.isAndroid) {
      if (on) {
        unawaited(
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky),
        );
      } else {
        unawaited(
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: SystemUiOverlay.values,
          ),
        );
      }
    }
  }

  // ── Build ─────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _client,
      builder: (context, _) {
        final connected = _client.phase == RemoteLinkPhase.connected;
        final state = connected ? _client.state : null;
        if (state != null && state.hasItem) _lastState = state;
        _watchCoverAccent();
        if (_fullScreen) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) {
              if (!didPop) _setFullScreen(false);
            },
            child: _withLook(context, _fullScreenScaffold(context, state)),
          );
        }
        final l = AppLocalizations.of(context)!;
        if (_editing) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) {
              if (!didPop) setState(() => _editing = false);
            },
            child: _withLook(
              context,
              Scaffold(
                appBar: AppBar(
                  title: Text(l.remoteCustomizeTitle),
                  actions: [
                    TextButton(
                      key: const Key('remote-customize-done'),
                      onPressed: () => setState(() => _editing = false),
                      child: Text(l.done),
                    ),
                  ],
                ),
                body: SafeArea(
                  child: _editor(
                    context,
                    state != null && state.hasItem
                        ? state
                        : _lastState ?? RemotePlayerState.empty,
                  ),
                ),
              ),
            ),
          );
        }
        return _withLook(
          context,
          Scaffold(
            appBar: AppBar(
              title: Text(
                _client.hostName.isEmpty
                    ? widget.host.address
                    : _client.hostName,
              ),
              actions: [
                IconButton(
                  key: const Key('remote-customize'),
                  tooltip: l.remoteCustomize,
                  onPressed: () {
                    if (!_fullScreen) setState(() => _editing = true);
                  },
                  icon: const Icon(Icons.tune_rounded),
                ),
                IconButton(
                  key: const Key('remote-continue'),
                  tooltip: l.remoteContinueListening,
                  onPressed: state != null ? _showContinue : null,
                  icon: const Icon(Icons.history_rounded),
                ),
                IconButton(
                  key: const Key('remote-full-screen-button'),
                  tooltip: l.remoteFullScreen,
                  onPressed: state != null && state.hasItem
                      ? () => _setFullScreen(true)
                      : null,
                  icon: const Icon(Icons.fullscreen_rounded),
                ),
                if (_mediaSession.isAvailable)
                  PopupMenuButton<String>(
                    key: const Key('remote-menu'),
                    tooltip: l.remoteMoreOptions,
                    onSelected: (v) {
                      if (v == 'lockScreen') _setLockScreen(!_lockScreen);
                    },
                    itemBuilder: (_) => [
                      CheckedPopupMenuItem(
                        key: const Key('remote-lock-screen'),
                        value: 'lockScreen',
                        checked: _lockScreen,
                        child: Text(l.remoteLockScreenControls),
                      ),
                    ],
                  ),
              ],
            ),
            body: SafeArea(child: _body(context, state)),
          ),
        );
      },
    );
  }

  /// Full screen: the same body, no app bar; a tap on empty space (or Back)
  /// leaves. A dim layer covers it after the Look's minutes; the first tap
  /// only wakes it.
  Widget _fullScreenScaffold(BuildContext context, RemotePlayerState? state) {
    return Scaffold(
      body: Listener(
        onPointerDown: (_) => _onFullScreenTouch(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              key: const Key('remote-full-screen'),
              behavior: HitTestBehavior.opaque,
              onTap: () => _setFullScreen(false),
              child: SafeArea(child: _body(context, state)),
            ),
            if (_dimmed)
              GestureDetector(
                key: const Key('remote-full-screen-dim'),
                behavior: HitTestBehavior.opaque,
                onTap: _wake,
                child: ColoredBox(color: Colors.black.withValues(alpha: 0.8)),
              ),
          ],
        ),
      ),
    );
  }

  // ── Look ──────────────────────────────────────────────────────────

  /// Works out the cover's colour when the Look uses it (once per cover).
  void _watchCoverAccent() {
    final bytes = _client.cover;
    if (!_look.usesCoverColor || bytes == null) return;
    if (identical(bytes, _accentFor)) return;
    _accentFor = bytes;
    unawaited(_loadCoverAccent(bytes));
  }

  Future<void> _loadCoverAccent(Uint8List bytes) async {
    try {
      final palette = await PaletteGenerator.fromImageProvider(
        paletteSource(MemoryImage(bytes)),
        maximumColorCount: 16,
      );
      if (!mounted || !identical(bytes, _accentFor)) return;
      setState(() => _coverAccent = accentFromCoverPalette(palette));
    } catch (e) {
      swallow('RemoteLook', e);
    }
  }

  /// The Look's accent, or null for the app theme's.
  Color? get _accent => switch (_look.accent) {
    RemoteLook.accentTheme => null,
    RemoteLook.accentCover => _client.cover == null ? null : _coverAccent,
    _ => _look.swatch,
  };

  /// The Look around [child]: its theme (accent, light text on a dark
  /// background, sharp buttons), background and text size. The default
  /// Look changes nothing.
  Widget _withLook(BuildContext context, Widget child) {
    final look = _look;
    final base = Theme.of(context);
    var cs = base.colorScheme;
    final accent = _accent;
    final dark = look.darkBackground;
    final hasBackground = look.background != RemoteLookBackground.theme;
    final gradientColor = look.background == RemoteLookBackground.gradient
        ? _coverAccent ?? accent
        : null;
    if (accent == null &&
        !hasBackground &&
        look.corners != RemoteCorners.sharp &&
        look.textSize == RemoteTextSize.normal) {
      return child;
    }
    if (dark) {
      cs = cs.copyWith(
        brightness: Brightness.dark,
        surface: Colors.black,
        onSurface: Colors.white,
        onSurfaceVariant: Colors.white70,
        surfaceContainerHighest: const Color(0xFF2A2A2A),
        outlineVariant: Colors.white24,
      );
    }
    if (accent != null) {
      cs = cs.copyWith(
        primary: accent,
        onPrimary:
            ThemeData.estimateBrightnessForColor(accent) == Brightness.dark
            ? Colors.white
            : Colors.black,
      );
    }
    var theme = base.copyWith(colorScheme: cs);
    if (dark) {
      theme = theme.copyWith(
        textTheme: base.textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        iconTheme: base.iconTheme.copyWith(color: Colors.white),
      );
    }
    if (hasBackground) {
      theme = theme.copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: base.appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: cs.onSurface,
          iconTheme: IconThemeData(color: cs.onSurface),
          actionsIconTheme: IconThemeData(color: cs.onSurface),
          titleTextStyle:
              (base.appBarTheme.titleTextStyle ?? base.textTheme.titleLarge)
                  ?.copyWith(color: cs.onSurface),
        ),
      );
    }
    if (look.corners == RemoteCorners.sharp) {
      const shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      );
      theme = theme.copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: shape,
          ).merge(base.textButtonTheme.style),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: shape,
          ).merge(base.outlinedButtonTheme.style),
        ),
      );
    }
    Widget out = Theme(data: theme, child: child);
    if (look.textSize != RemoteTextSize.normal) {
      final mq = MediaQuery.of(context);
      out = MediaQuery(
        data: mq.copyWith(
          textScaler: TextScaler.linear(
            mq.textScaler.scale(1) * look.textSize.scale,
          ),
        ),
        child: out,
      );
    }
    if (!hasBackground) return out;
    final bytes = _client.cover;
    final Widget background = switch (look.background) {
      RemoteLookBackground.black => const ColoredBox(color: Colors.black),
      RemoteLookBackground.cover => Stack(
        fit: StackFit.expand,
        children: [
          const ColoredBox(color: Colors.black),
          if (bytes != null)
            ImageFiltered(
              key: const Key('remote-look-blur'),
              imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Image.memory(
                bytes,
                fit: BoxFit.cover,
                gaplessPlayback: true,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ColoredBox(color: Colors.black.withValues(alpha: 0.55)),
        ],
      ),
      _ => DecoratedBox(
        key: const Key('remote-look-gradient'),
        decoration: BoxDecoration(
          color: cs.surface,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              (gradientColor ?? cs.primary).withValues(alpha: 0.45),
              cs.surface,
            ],
          ),
        ),
      ),
    };
    return Stack(fit: StackFit.expand, children: [background, out]);
  }

  Widget _body(BuildContext context, RemotePlayerState? state) {
    final l = AppLocalizations.of(context)!;
    // A new link answers again.
    if (_client.phase != RemoteLinkPhase.connected) _recentAsked = false;
    switch (_client.phase) {
      case RemoteLinkPhase.closed:
        return _problem(context);
      case RemoteLinkPhase.idle:
      case RemoteLinkPhase.connecting:
      case RemoteLinkPhase.reconnecting:
        final reconnecting = _client.phase == RemoteLinkPhase.reconnecting;
        return _waiting(
          context,
          reconnecting ? l.remoteReconnecting : l.remoteConnecting,
          hint:
              _client.problem == RemoteLinkProblem.unreachable ||
                  _client.problem == RemoteLinkProblem.hostStopped
              ? l.remoteUnreachableHint
              : null,
        );
      case RemoteLinkPhase.connected:
        if (state == null) return _waiting(context, l.remoteConnecting);
        if (!state.hasItem) return _nothingPlaying(context);
        return _controls(context, state);
    }
  }

  Widget _waiting(BuildContext context, String text, {String? hint}) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              text,
              style: tt.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
            ),
            if (hint != null) ...[
              const SizedBox(height: 8),
              Text(
                hint,
                textAlign: TextAlign.center,
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _message(
    BuildContext context,
    IconData icon,
    String text, {
    Widget? action,
  }) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: cs.onSurfaceVariant),
            const SizedBox(height: 16),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
            ),
            if (action != null) ...[const SizedBox(height: 20), action],
          ],
        ),
      ),
    );
  }

  /// Nothing loaded on the PC: say so, and offer its Continue listening.
  Widget _nothingPlaying(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    if (_client.recent == null && !_recentAsked) {
      _recentAsked = true;
      _client.requestRecent();
    }
    final recent = _client.recent ?? const <RemoteRecentItem>[];
    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
      children: [
        Icon(Icons.headphones_rounded, size: 48, color: cs.onSurfaceVariant),
        const SizedBox(height: 12),
        Text(
          l.remoteNothingPlaying(_client.hostName),
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
        ),
        if (recent.isNotEmpty) ...[
          _sectionHeader(context, l.remoteContinueListening),
          for (final item in recent) _recentTile(context, item),
        ],
      ],
    );
  }

  Widget _problem(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    switch (_client.problem) {
      case RemoteLinkProblem.unauthorized:
        return _message(
          context,
          Icons.link_off_rounded,
          l.remoteUnauthorized,
          action: FilledButton(
            onPressed: () =>
                Navigator.of(context).pop(RemoteControlExit.pairAgain),
            child: Text(l.remotePairAgain),
          ),
        );
      case RemoteLinkProblem.unsupportedVersion:
        return _message(
          context,
          Icons.system_update_rounded,
          l.remoteVersionMismatch,
        );
      default:
        return _message(
          context,
          Icons.link_off_rounded,
          l.remoteDisconnectedByHost,
          action: FilledButton(
            onPressed: _connectAgain,
            child: Text(l.remoteConnectAgain),
          ),
        );
    }
  }

  /// The host's position, or where the user just dragged to until the host
  /// catches up.
  double _position(RemotePlayerState s) {
    final target = _seekTarget;
    final at = _seekAt;
    if (target != null && at != null) {
      final recent = DateTime.now().difference(at) < const Duration(seconds: 3);
      if (recent && (s.position - target).abs() > 2) return target;
      _seekTarget = null;
      _seekAt = null;
    }
    return s.position;
  }

  /// The speed the last ±0.05 tap asked for, until the host shows it (so
  /// quick taps add up).
  double _speed(RemotePlayerState s) {
    final target = _speedTarget;
    final at = _speedAt;
    if (target != null && at != null) {
      final recent = DateTime.now().difference(at) < const Duration(seconds: 2);
      if (recent && (s.speed - target).abs() > 0.001) return target;
      _speedTarget = null;
      _speedAt = null;
    }
    return s.speed;
  }

  void _stepSpeed(RemotePlayerState s, int direction) {
    final next =
        ((_speed(s) + direction * _speedStep) / _speedStep).round() *
        _speedStep;
    final value = double.parse(
      next.clamp(SpeedCommand.min, SpeedCommand.max).toStringAsFixed(2),
    );
    _send(SpeedCommand(value));
    setState(() {
      _speedTarget = value;
      _speedAt = DateTime.now();
    });
  }

  /// The cover: its corners ([RemoteOptions.corners]; `auto` follows the
  /// Look) and an optional shadow.
  Widget _cover(BuildContext context, RemoteBlockEntry e) {
    final cs = Theme.of(context).colorScheme;
    final bytes = _client.cover;
    final corners = e.choice('corners');
    final circle = corners == 'circle';
    final radius = switch (corners) {
      'square' => 0.0,
      'rounded' => 16.0,
      _ => _look.corners.coverRadius,
    };
    final image = AspectRatio(
      aspectRatio: 1,
      child: bytes != null
          ? Image.memory(
              bytes,
              fit: BoxFit.cover,
              gaplessPlayback: true,
              errorBuilder: (_, __, ___) => _coverPlaceholder(cs),
            )
          : _coverPlaceholder(cs),
    );
    final Widget clipped = circle
        ? ClipOval(child: image)
        : ClipRRect(borderRadius: BorderRadius.circular(radius), child: image);
    if (!e.flag('shadow')) return clipped;
    return DecoratedBox(
      key: const Key('remote-cover-shadow'),
      decoration: BoxDecoration(
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circle ? null : BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: clipped,
    );
  }

  Widget _coverPlaceholder(ColorScheme cs, {double size = 64}) => Container(
    color: cs.surfaceContainerHighest,
    alignment: Alignment.center,
    child: Icon(
      Icons.headphones_rounded,
      size: size,
      color: cs.onSurfaceVariant,
    ),
  );

  bool _isLandscape(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return size.width > size.height;
  }

  // ── Layout and edit mode ──────────────────────────────────────────

  /// The blocks of the current orientation's layout ([RemoteLayoutView]).
  Widget _controls(
    BuildContext context,
    RemotePlayerState s, {
    bool editing = false,
  }) {
    final landscape = _isLandscape(context);
    if (!editing && _layout.shown(landscape: landscape).isEmpty) {
      return _message(
        context,
        Icons.tune_rounded,
        AppLocalizations.of(context)!.remoteCustomizeEmpty,
      );
    }
    final view = RemoteLayoutView(
      layout: _layout,
      landscape: landscape,
      editing: editing,
      gapScale: _look.spacing.gapScale,
      onChanged: _setLayout,
      buildBlock: (context, entry, slot) => _block(context, s, entry, slot),
    );
    if (editing) return view;
    // A tap that no control takes (empty space, text) enters or leaves
    // full screen; controls win the tap themselves.
    return GestureDetector(
      key: const Key('remote-tap-area'),
      behavior: HitTestBehavior.opaque,
      onTap: _toggleFullScreen,
      child: view,
    );
  }

  /// Edit mode: a hint saying which orientation is being edited, the
  /// toolbar, and the live layout with handles (its controls don't work).
  Widget _editor(BuildContext context, RemotePlayerState s) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final landscape = _isLandscape(context);
    final toolbar = Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            landscape
                ? l.remoteCustomizeHintLandscape
                : l.remoteCustomizeHintPortrait,
            key: const Key('remote-customize-hint'),
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
          Wrap(
            spacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              TextButton.icon(
                key: const Key('remote-customize-add'),
                onPressed: () => _addBlock(landscape),
                icon: const Icon(Icons.add_rounded),
                label: Text(l.add),
              ),
              MenuAnchor(
                builder: (context, controller, _) => TextButton.icon(
                  key: const Key('remote-customize-presets'),
                  onPressed: () => controller.isOpen
                      ? controller.close()
                      : controller.open(),
                  icon: const Icon(Icons.dashboard_customize_outlined),
                  label: Text(l.remoteCustomizePresets),
                ),
                menuChildren: [
                  for (final p in RemotePreset.values)
                    MenuItemButton(
                      key: Key('remote-preset-${p.name}'),
                      onPressed: () => _applyPreset(p, landscape),
                      child: Text(remotePresetName(l, p)),
                    ),
                ],
              ),
              TextButton.icon(
                key: const Key('remote-customize-reset'),
                onPressed: () =>
                    _setLayout(_layout.reset(landscape: landscape)),
                icon: const Icon(Icons.restart_alt_rounded),
                label: Text(l.remoteCustomizeReset),
              ),
              TextButton.icon(
                key: const Key('remote-customize-look'),
                onPressed: () => showRemoteLookSheet(context, _look, _setLook),
                icon: const Icon(Icons.palette_outlined),
                label: Text(l.remoteLook),
              ),
            ],
          ),
        ],
      ),
    );
    return LayoutBuilder(
      builder: (context, c) => Column(
        children: [
          // Big text on a short screen: the toolbar scrolls rather than
          // pushing the layout off the screen.
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: c.maxHeight * 0.45),
            child: SingleChildScrollView(child: toolbar),
          ),
          const Divider(height: 1),
          Expanded(child: _controls(context, s, editing: true)),
        ],
      ),
    );
  }

  /// Adds a block the user picked: in landscape the cover goes left,
  /// everything else right.
  Future<void> _addBlock(bool landscape) async {
    final block = await showRemoteAddBlockSheet(
      context,
      _layout,
      landscape: landscape,
    );
    if (block == null || !mounted) return;
    final column = !landscape
        ? RemoteColumn.portrait
        : block == RemoteBlock.cover
        ? RemoteColumn.left
        : RemoteColumn.right;
    _setLayout(_layout.add(column, block));
  }

  // ── Blocks ────────────────────────────────────────────────────────

  /// The part of the book the bar and times cover: the chapter, or the
  /// whole book without chapters or when [book] is asked for.
  ({double start, double end}) _span(RemotePlayerState s, {bool book = false}) {
    final chapter = s.hasChapter && !book;
    return (
      start: chapter ? s.chapterStart : 0.0,
      end: chapter ? s.chapterEnd : (s.duration > 0 ? s.duration : 1.0),
    );
  }

  static double _coverSize(RemoteBlockSize size, RemoteBlockSlot slot) {
    if (slot.landscape) {
      // Sized to the column's height (or width, if narrower).
      final side = math.max(48.0, math.min(slot.maxWidth, slot.maxHeight));
      return side *
          switch (size) {
            RemoteBlockSize.large => 1.0,
            RemoteBlockSize.medium => 0.8,
            _ => 0.55,
          };
    }
    final medium = math.min(
      (slot.maxWidth - 64).clamp(120.0, 340.0).toDouble(),
      math.max(120.0, slot.maxHeight * 0.38),
    );
    return switch (size) {
      RemoteBlockSize.small => math.max(80.0, medium * 0.6),
      RemoteBlockSize.large => math.min(
        (slot.maxWidth - 48).clamp(120.0, 480.0).toDouble(),
        math.max(120.0, slot.maxHeight * 0.55),
      ),
      _ => medium,
    };
  }

  /// One block of the layout, or null when it has nothing to show. Its
  /// options ([RemoteBlockInfo.options]) at their defaults draw it as it
  /// always looked.
  Widget? _block(
    BuildContext context,
    RemotePlayerState s,
    RemoteBlockEntry e,
    RemoteBlockSlot slot,
  ) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final compact = e.size == RemoteBlockSize.compact;
    final large = e.size == RemoteBlockSize.large;
    final textAlign = switch (e.choice('align')) {
      'left' => TextAlign.left,
      'right' => TextAlign.right,
      _ => TextAlign.center,
    };
    final crossAlign = switch (e.choice('align')) {
      'left' => CrossAxisAlignment.start,
      'right' => CrossAxisAlignment.end,
      _ => CrossAxisAlignment.center,
    };
    final lines = int.tryParse(e.choice('lines')) ?? 1;
    final outlined = _look.buttons == RemoteButtonStyle.outlined;
    Widget action(Key key, IconData icon, String label, VoidCallback? onTap) {
      if (compact) {
        return outlined
            ? IconButton.outlined(
                key: key,
                tooltip: label,
                onPressed: onTap,
                icon: Icon(icon),
              )
            : IconButton(
                key: key,
                tooltip: label,
                onPressed: onTap,
                icon: Icon(icon),
              );
      }
      return outlined
          ? OutlinedButton.icon(
              key: key,
              onPressed: onTap,
              icon: Icon(icon),
              label: Text(label),
            )
          : TextButton.icon(
              key: key,
              onPressed: onTap,
              icon: Icon(icon),
              label: Text(label),
            );
    }

    switch (e.block) {
      case RemoteBlock.cover:
        return SizedBox(
          width: _coverSize(e.size, slot),
          child: _cover(context, e),
        );
      case RemoteBlock.titleAuthor:
        if (s.title.isEmpty && s.author.isEmpty) return null;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: crossAlign,
          children: [
            Text(
              s.title,
              textAlign: textAlign,
              maxLines: lines,
              overflow: TextOverflow.ellipsis,
              style:
                  (compact
                          ? tt.titleMedium
                          : large
                          ? tt.headlineSmall
                          : tt.titleLarge)
                      ?.copyWith(fontWeight: FontWeight.w600),
            ),
            if (s.author.isNotEmpty) ...[
              SizedBox(height: compact ? 2 : 4),
              Text(
                s.author,
                textAlign: textAlign,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    (compact
                            ? tt.bodySmall
                            : large
                            ? tt.bodyLarge
                            : tt.bodyMedium)
                        ?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ],
        );
      case RemoteBlock.chapterTitle:
        if (s.chapterTitle.isEmpty) return null;
        return Text(
          s.chapterTitle,
          key: const Key('remote-chapter-title'),
          textAlign: textAlign,
          maxLines: lines,
          overflow: TextOverflow.ellipsis,
          style:
              (compact
                      ? tt.labelSmall
                      : large
                      ? tt.titleSmall
                      : tt.bodySmall)
                  ?.copyWith(color: cs.primary),
        );
      case RemoteBlock.progress:
        final (:start, :end) = _span(s, book: e.choice('span') == 'book');
        final position = (_drag ?? _position(s)).clamp(start, end);
        final slider = AbsorbSlider(
          value: position,
          min: start,
          max: end > start ? end : start + 1,
          onChanged: (v) => setState(() => _drag = v),
          onChangeEnd: (v) {
            _send(SeekCommand(v));
            setState(() {
              _drag = null;
              _seekTarget = v;
              _seekAt = DateTime.now();
            });
          },
        );
        if (compact) return slider;
        final small = tt.bodySmall?.copyWith(color: cs.onSurfaceVariant);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            slider,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(fmtTime(position - start), style: small),
                  Text(
                    e.choice('time') == 'total'
                        ? fmtTime(end - start)
                        : '-${fmtTime(end - position)}',
                    key: const Key('remote-progress-right'),
                    style: small,
                  ),
                ],
              ),
            ),
          ],
        );
      case RemoteBlock.timeLeft:
        return Text(
          _timeLeftText(l, s, book: e.choice('span') == 'book'),
          key: const Key('remote-time-left'),
          textAlign: textAlign,
          style: (compact ? tt.bodySmall : tt.bodyLarge)?.copyWith(
            color: cs.onSurfaceVariant,
          ),
        );
      case RemoteBlock.transport:
        return _buttons(context, s, e);
      case RemoteBlock.volume:
        final volume = e.choice('style') == 'buttons'
            ? _volumeButtons(context, s)
            : _volume(context, s);
        return compact
            ? SizedBox(width: math.min(240.0, slot.maxWidth), child: volume)
            : volume;
      case RemoteBlock.speed:
        final speed = _speed(s);
        final presets = [
          for (final v in e.picked('presets'))
            if (double.tryParse(v) case final d?) d,
        ];
        final picker = outlined
            ? OutlinedButton.icon(
                key: const Key('remote-speed'),
                onPressed: () => _pickSpeed(s, presets),
                icon: const Icon(Icons.speed_rounded),
                label: Text('${_speedLabel(speed)}x'),
              )
            : TextButton.icon(
                key: const Key('remote-speed'),
                onPressed: () => _pickSpeed(s, presets),
                icon: const Icon(Icons.speed_rounded),
                label: Text('${_speedLabel(speed)}x'),
              );
        if (compact) return picker;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              key: const Key('remote-speed-down'),
              tooltip: l.remoteSpeedSlower,
              onPressed: speed > SpeedCommand.min + 0.001
                  ? () => _stepSpeed(s, -1)
                  : null,
              icon: const Icon(Icons.remove_rounded),
            ),
            picker,
            IconButton(
              key: const Key('remote-speed-up'),
              tooltip: l.remoteSpeedFaster,
              onPressed: speed < SpeedCommand.max - 0.001
                  ? () => _stepSpeed(s, 1)
                  : null,
              icon: const Icon(Icons.add_rounded),
            ),
          ],
        );
      case RemoteBlock.sleep:
        return action(
          const Key('remote-sleep'),
          s.sleep.isActive ? Icons.bedtime_rounded : Icons.bedtime_outlined,
          _sleepLabel(l, s.sleep),
          () => _pickSleep(s, e.picked('presets')),
        );
      case RemoteBlock.chapters:
        return action(
          const Key('remote-chapters'),
          Icons.format_list_numbered_rounded,
          l.remoteChapters,
          _client.chapters.isEmpty ? null : () => _showChapters(s),
        );
      case RemoteBlock.bookmark:
        return action(
          const Key('remote-bookmark'),
          Icons.bookmark_add_outlined,
          l.remoteBookmark,
          _addBookmark,
        );
      case RemoteBlock.continueListening:
        return action(
          const Key('remote-continue-block'),
          Icons.history_rounded,
          l.remoteContinueListening,
          _showContinue,
        );
      case RemoteBlock.stop:
        return action(
          const Key('remote-stop'),
          Icons.stop_rounded,
          l.remoteStop,
          () => _send(const StopCommand()),
        );
      case RemoteBlock.clock:
        final clock = RemoteClockText(
          key: const Key('remote-clock'),
          hours: e.choice('hours'),
          showDate: e.flag('date'),
          textAlign: textAlign,
          style: compact
              ? tt.titleLarge
              : large
              ? tt.displayLarge?.copyWith(fontWeight: FontWeight.w300)
              : tt.displaySmall?.copyWith(fontWeight: FontWeight.w300),
          dateStyle: (large ? tt.titleMedium : tt.bodyMedium)?.copyWith(
            color: cs.onSurfaceVariant,
          ),
        );
        if (!large) return clock;
        // The big clock shrinks rather than overflow a narrow column.
        return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: switch (textAlign) {
            TextAlign.left => Alignment.centerLeft,
            TextAlign.right => Alignment.centerRight,
            _ => Alignment.center,
          },
          child: clock,
        );
      case RemoteBlock.spacer:
        return SizedBox(height: compact ? 12 : 32);
    }
  }

  /// "12:34 left in the chapter" (or in the book), at the current speed.
  String _timeLeftText(
    AppLocalizations l,
    RemotePlayerState s, {
    bool book = false,
  }) {
    final chapter = s.hasChapter && !book;
    final end = chapter ? s.chapterEnd : s.duration;
    final speed = s.speed > 0 ? s.speed : 1.0;
    final left = fmtTime((end - s.position).clamp(0, double.infinity) / speed);
    return chapter ? l.remoteChapterTimeLeft(left) : l.remoteTimeLeft(left);
  }

  Widget _muteButton(BuildContext context, RemotePlayerState s, double shown) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    return IconButton(
      key: const Key('remote-mute'),
      tooltip: s.muted ? l.remoteUnmute : l.remoteMute,
      onPressed: () => _send(MuteCommand(!s.muted)),
      icon: Icon(
        s.muted || shown == 0
            ? Icons.volume_off_rounded
            : shown < 0.5
            ? Icons.volume_down_rounded
            : Icons.volume_up_rounded,
        color: cs.onSurfaceVariant,
      ),
    );
  }

  Widget _volume(BuildContext context, RemotePlayerState s) {
    final l = AppLocalizations.of(context)!;
    final shown = s.muted ? 0.0 : (_volumeDrag ?? s.volume);
    return Row(
      children: [
        _muteButton(context, s, shown),
        Expanded(
          child: Semantics(
            label: l.remoteVolume,
            child: AbsorbSlider(
              key: const Key('remote-volume'),
              value: shown.clamp(0.0, 1.0),
              onChanged: (v) => setState(() => _volumeDrag = v),
              onChangeEnd: (v) {
                _send(VolumeCommand(v));
                setState(() => _volumeDrag = null);
              },
            ),
          ),
        ),
      ],
    );
  }

  /// The volume the last − or + tap asked for, until the host shows it (so
  /// quick taps add up).
  double _volumeNow(RemotePlayerState s) {
    final target = _volumeTarget;
    final at = _volumeAt;
    if (target != null && at != null) {
      final recent = DateTime.now().difference(at) < const Duration(seconds: 2);
      if (recent && (s.volume - target).abs() > 0.001) return target;
      _volumeTarget = null;
      _volumeAt = null;
    }
    return s.volume;
  }

  /// The volume as − and + buttons (10% steps) around the percentage.
  Widget _volumeButtons(BuildContext context, RemotePlayerState s) {
    final l = AppLocalizations.of(context)!;
    final volume = _volumeNow(s);
    final shown = s.muted ? 0.0 : volume;
    void step(int direction) {
      final next = double.parse(
        (((volume * 10).round() + direction) / 10)
            .clamp(0.0, 1.0)
            .toStringAsFixed(1),
      );
      _send(VolumeCommand(next));
      setState(() {
        _volumeTarget = next;
        _volumeAt = DateTime.now();
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _muteButton(context, s, shown),
        IconButton(
          key: const Key('remote-volume-down'),
          tooltip: l.remoteVolumeDown,
          onPressed: volume > 0.001 ? () => step(-1) : null,
          icon: const Icon(Icons.remove_rounded),
        ),
        Flexible(
          child: Text(
            '${(shown * 100).round()}%',
            key: const Key('remote-volume-value'),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        IconButton(
          key: const Key('remote-volume-up'),
          tooltip: l.remoteVolumeUp,
          onPressed: volume < 0.999 ? () => step(1) : null,
          icon: const Icon(Icons.add_rounded),
        ),
      ],
    );
  }

  /// Previous chapter, back, play/pause, forward, next chapter (those the
  /// block shows); compact draws them smaller. The play button follows the
  /// Look's button style.
  Widget _buttons(
    BuildContext context,
    RemotePlayerState s,
    RemoteBlockEntry e,
  ) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final compact = e.size == RemoteBlockSize.compact;
    final shown = e.picked('buttons');
    final seconds = e.flag('skipSeconds');
    final size = compact ? 44.0 : 56.0;
    final play = compact ? 52.0 : 68.0;
    final glyph = compact ? 28.0 : 34.0;
    Widget button(String tooltip, Key key, Widget child, VoidCallback onTap) =>
        Flexible(
          child: Semantics(
            button: true,
            label: tooltip,
            child: Pressable(
              key: key,
              tooltip: tooltip,
              onTap: onTap,
              child: SizedBox(
                width: size,
                height: size,
                child: Center(child: child),
              ),
            ),
          ),
        );
    final style = _look.buttons;
    final playIcon = s.buffering && !s.playing
        ? Center(
            child: SizedBox(
              width: 26,
              height: 26,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: cs.primary,
              ),
            ),
          )
        : Icon(
            s.playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
            size: style == RemoteButtonStyle.plain ? glyph * 1.4 : glyph,
            color: style == RemoteButtonStyle.filled
                ? cs.surface
                : cs.onSurface,
          );
    final children = <Widget>[
      if (shown.contains('prev'))
        button(
          l.remotePreviousChapter,
          const Key('remote-prev-chapter'),
          Icon(
            Icons.skip_previous_rounded,
            size: glyph,
            color: cs.onSurfaceVariant,
          ),
          () => _send(const ChapterCommand(-1)),
        ),
      if (shown.contains('back'))
        button(
          l.remoteSkipBack(s.skipBack),
          const Key('remote-skip-back'),
          _skipIcon(
            context,
            s.skipBack,
            forward: false,
            compact: compact,
            showSeconds: seconds,
          ),
          () => _send(SkipCommand(-s.skipBack)),
        ),
      if (shown.contains('play'))
        Flexible(
          child: Semantics(
            button: true,
            label: s.playing ? l.remotePause : l.remotePlay,
            child: Pressable(
              key: const Key('remote-play-pause'),
              tooltip: s.playing ? l.remotePause : l.remotePlay,
              onTap: () => _send(const ToggleCommand()),
              child: Container(
                width: play,
                height: play,
                decoration: switch (style) {
                  RemoteButtonStyle.filled => BoxDecoration(
                    shape: BoxShape.circle,
                    color: cs.onSurface,
                    boxShadow: [
                      BoxShadow(
                        color: cs.primary.withValues(alpha: 0.4),
                        blurRadius: 25,
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                  RemoteButtonStyle.outlined => BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: cs.onSurface, width: 2),
                  ),
                  RemoteButtonStyle.plain => null,
                },
                child: playIcon,
              ),
            ),
          ),
        ),
      if (shown.contains('forward'))
        button(
          l.remoteSkipForward(s.skipForward),
          const Key('remote-skip-forward'),
          _skipIcon(
            context,
            s.skipForward,
            forward: true,
            compact: compact,
            showSeconds: seconds,
          ),
          () => _send(SkipCommand(s.skipForward)),
        ),
      if (shown.contains('next'))
        button(
          l.remoteNextChapter,
          const Key('remote-next-chapter'),
          Icon(
            Icons.skip_next_rounded,
            size: glyph,
            color: cs.onSurfaceVariant,
          ),
          () => _send(const ChapterCommand(1)),
        ),
    ];
    return Row(
      // All five spread edge to edge as always; fewer sit evenly.
      mainAxisAlignment: children.length == 5
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  /// The player's skip glyphs: the built-in 5/10/30 icons, otherwise the
  /// rotate arrow with the number (as on the Absorbing card); without
  /// [showSeconds], the arrow alone.
  Widget _skipIcon(
    BuildContext context,
    int seconds, {
    required bool forward,
    bool compact = false,
    bool showSeconds = true,
  }) {
    final cs = Theme.of(context).colorScheme;
    final color = cs.onSurface.withValues(alpha: 0.7);
    final size = compact ? 34.0 : 42.0;
    if (!showSeconds) {
      return Icon(
        forward ? Icons.rotate_right_rounded : Icons.rotate_left_rounded,
        size: size,
        color: color,
      );
    }
    if (seconds == 5 || seconds == 10 || seconds == 30) {
      final icon = forward
          ? (seconds == 5
                ? Icons.forward_5_rounded
                : seconds == 10
                ? Icons.forward_10_rounded
                : Icons.forward_30_rounded)
          : (seconds == 5
                ? Icons.replay_5_rounded
                : seconds == 10
                ? Icons.replay_10_rounded
                : Icons.replay_30_rounded);
      return Icon(icon, size: size, color: color);
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          forward ? Icons.rotate_right_rounded : Icons.rotate_left_rounded,
          size: size,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            '$seconds',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: cs.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  static String _speedLabel(double v) {
    var s = v.toStringAsFixed(2);
    while (s.contains('.') && (s.endsWith('0') || s.endsWith('.'))) {
      s = s.substring(0, s.length - 1);
    }
    return s;
  }

  String _sleepLabel(AppLocalizations l, RemoteSleepState sleep) {
    switch (sleep.mode) {
      case RemoteSleepState.time:
        return fmtTime(sleep.remaining);
      case RemoteSleepState.chapters:
        return l.remoteSleepChapters(sleep.remaining.round());
      case RemoteSleepState.episodes:
        return l.remoteSleepEndOfEpisode;
      default:
        return l.remoteSleepTimer;
    }
  }

  Widget _sectionHeader(BuildContext context, String text) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 6),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: cs.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// The speed picker with the block's [presets].
  Future<void> _pickSpeed(RemotePlayerState s, List<double> presets) async {
    final l = AppLocalizations.of(context)!;
    final picked = await showAdaptiveActionMenu<double>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  l.remoteSpeed,
                  style: Theme.of(ctx).textTheme.titleMedium,
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final v in presets)
                    ChoiceChip(
                      key: Key('remote-speed-preset-${_speedLabel(v)}'),
                      label: Text('${_speedLabel(v)}x'),
                      selected: (s.speed - v).abs() < 0.001,
                      onSelected: (_) => Navigator.pop(ctx, v),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    if (picked != null) _send(SpeedCommand(picked));
  }

  /// The sleep timer picker with the block's [presets] (minutes, and
  /// `chapter` for the end of the chapter).
  Future<void> _pickSleep(RemotePlayerState s, List<String> presets) async {
    final l = AppLocalizations.of(context)!;
    final picked = await showAdaptiveActionMenu<SleepCommand>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  l.remoteSleepTimer,
                  style: Theme.of(ctx).textTheme.titleMedium,
                ),
              ),
              for (final p in presets)
                if (int.tryParse(p) case final m?)
                  ListTile(
                    key: Key('remote-sleep-preset-$p'),
                    leading: const Icon(Icons.timer_outlined),
                    title: Text(l.remoteSleepMinutes(m)),
                    onTap: () => Navigator.pop(ctx, SleepCommand.minutes(m)),
                  ),
              if (presets.contains('chapter'))
                ListTile(
                  key: const Key('remote-sleep-preset-chapter'),
                  leading: const Icon(Icons.bookmark_outline_rounded),
                  title: Text(l.remoteSleepEndOfChapter),
                  onTap: () =>
                      Navigator.pop(ctx, const SleepCommand.endOfChapter()),
                ),
              if (s.sleep.isActive)
                ListTile(
                  leading: const Icon(Icons.timer_off_outlined),
                  title: Text(l.remoteSleepCancel),
                  onTap: () => Navigator.pop(ctx, const SleepCommand.cancel()),
                ),
            ],
          ),
        ),
      ),
    );
    if (picked != null) _send(picked);
  }

  Future<void> _showChapters(RemotePlayerState s) async {
    final l = AppLocalizations.of(context)!;
    final chapters = _client.chapters;
    final current = chapters.lastIndexWhere((c) => c.start <= s.position + 0.5);
    final picked = await showAdaptiveSheetDialog<RemoteChapter>(
      context: context,
      showDragHandle: true,
      builder: (ctx, controller) {
        final cs = Theme.of(ctx).colorScheme;
        return ListView.builder(
          controller: controller,
          itemCount: chapters.length + 1,
          itemBuilder: (ctx, i) {
            if (i == 0) {
              return ListTile(
                title: Text(
                  l.remoteChapters,
                  style: Theme.of(ctx).textTheme.titleMedium,
                ),
              );
            }
            final c = chapters[i - 1];
            final isCurrent = i - 1 == current;
            return ListTile(
              key: Key('remote-chapter-$i'),
              selected: isCurrent,
              title: Text(
                c.title.isEmpty ? '$i' : c.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                fmtTime(c.end - c.start),
                style: Theme.of(
                  ctx,
                ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
              onTap: () => Navigator.pop(ctx, c),
            );
          },
        );
      },
    );
    if (picked != null) _send(SeekCommand(picked.start));
  }

  Future<void> _addBookmark() async {
    final note = await showDialog<String>(
      context: context,
      builder: (_) => const _BookmarkDialog(),
    );
    if (note != null) _send(BookmarkCommand(note));
  }

  Future<void> _showContinue() async {
    _client.requestRecent();
    final picked = await showAdaptiveSheetDialog<String>(
      context: context,
      showDragHandle: true,
      builder: (ctx, controller) => ListenableBuilder(
        listenable: _client,
        builder: (ctx, _) {
          final l = AppLocalizations.of(ctx)!;
          final cs = Theme.of(ctx).colorScheme;
          final recent = _client.recent;
          return ListView(
            controller: controller,
            children: [
              ListTile(
                title: Text(
                  l.remoteContinueListening,
                  style: Theme.of(ctx).textTheme.titleMedium,
                ),
              ),
              if (recent == null)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (recent.isEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Text(
                    l.remoteContinueEmpty,
                    style: TextStyle(color: cs.onSurfaceVariant),
                  ),
                )
              else
                for (final item in recent)
                  _recentTile(
                    ctx,
                    item,
                    onTap: () => Navigator.pop(ctx, item.id),
                  ),
            ],
          );
        },
      ),
    );
    if (picked != null) _send(PlayItemCommand(picked));
  }

  Widget _recentTile(
    BuildContext context,
    RemoteRecentItem item, {
    VoidCallback? onTap,
  }) {
    final cs = Theme.of(context).colorScheme;
    final small = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant);
    return ListTile(
      key: Key('remote-recent-${item.id}'),
      leading: SizedBox(
        width: 48,
        height: 48,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FutureBuilder<Uint8List?>(
            future: _client.recentCover(item.id),
            builder: (context, snap) {
              final bytes = snap.data;
              return bytes != null
                  ? Image.memory(
                      bytes,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                      errorBuilder: (_, __, ___) =>
                          _coverPlaceholder(cs, size: 24),
                    )
                  : _coverPlaceholder(cs, size: 24);
            },
          ),
        ),
      ),
      title: Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.author.isNotEmpty)
            Text(
              item.author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: small,
            ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: item.progress,
            minHeight: 3,
            borderRadius: BorderRadius.circular(2),
            backgroundColor: cs.primary.withValues(alpha: 0.15),
          ),
        ],
      ),
      onTap: onTap ?? () => _send(PlayItemCommand(item.id)),
    );
  }
}

/// "Add a bookmark here" with an optional note; pops the note.
class _BookmarkDialog extends StatefulWidget {
  const _BookmarkDialog();

  @override
  State<_BookmarkDialog> createState() => _BookmarkDialogState();
}

class _BookmarkDialogState extends State<_BookmarkDialog> {
  final _note = TextEditingController();

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l.remoteBookmarkTitle),
      content: TextField(
        key: const Key('remote-bookmark-note'),
        controller: _note,
        autofocus: true,
        maxLength: BookmarkCommand.maxNoteLength,
        maxLines: 3,
        minLines: 1,
        decoration: InputDecoration(
          hintText: l.remoteBookmarkNoteHint,
          counterText: '',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l.cancel),
        ),
        FilledButton(
          key: const Key('remote-bookmark-add'),
          onPressed: () => Navigator.pop(context, _note.text.trim()),
          child: Text(l.remoteBookmarkAdd),
        ),
      ],
    );
  }
}
