import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../services/remote_link/remote_layout.dart';
import '../services/remote_link/remote_link.dart';
import '../services/screen_wake.dart';
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
/// playing, its controls, Continue listening, and a display mode. Shows
/// "Reconnecting…" instead of stale controls while the link is down.
class RemoteControlScreen extends StatefulWidget {
  const RemoteControlScreen({
    super.key,
    required this.host,
    this.connector,
    this.client,
  });

  final SavedRemoteHost host;

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
  static const _speeds = [
    0.75, 1.0, 1.1, 1.2, 1.25, 1.3, 1.4, 1.5, 1.75, 2.0, 2.5, 3.0, //
  ];
  static const _speedStep = 0.05;
  static const _sleepMinutes = [15, 30, 45, 60];

  RemoteLinkConnector get _connector => widget.connector ?? remoteLinkConnector;

  late RemoteLinkClient _client;
  StreamSubscription<RemoteLinkEvent>? _events;
  bool _display = false;
  Timer? _dimTimer;
  bool _dimmed = false;
  bool _editing = false;
  RemoteLayout _layout = RemoteLayout.defaults();
  RemoteDisplayOptions _displayOptions = const RemoteDisplayOptions();
  bool _layoutTouched = false;
  RemotePlayerState? _lastState;
  double? _drag;
  double? _seekTarget;
  DateTime? _seekAt;
  double? _volumeDrag;
  double? _speedTarget;
  bool _recentAsked = false;
  DateTime? _speedAt;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _attach(widget.client ?? _connector.open(widget.host));
    unawaited(_loadLayout());
  }

  Future<void> _loadLayout() async {
    try {
      final (layout, display) = await RemoteLayoutStore.load();
      if (!mounted || _layoutTouched) return;
      setState(() {
        _layout = layout;
        _displayOptions = display;
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

  void _setDisplayOptions(RemoteDisplayOptions options) {
    setState(() {
      _displayOptions = options;
      _layoutTouched = true;
    });
    fireAndLog(RemoteLayoutStore.saveDisplay(options), 'RemoteLayout');
  }

  void _attach(RemoteLinkClient client) {
    _client = client;
    _events = client.events.listen(_onEvent);
    unawaited(client.connect());
  }

  void _detach() {
    unawaited(_events?.cancel());
    _events = null;
    _client.dispose();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _dimTimer?.cancel();
    if (_display) _applyDisplay(false);
    _detach();
    super.dispose();
  }

  /// Back from the background (the phone slept, Wi-Fi came back): try at
  /// once instead of waiting for the next retry.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _client.reconnectNow();
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

  // ── Display mode ──────────────────────────────────────────────────

  void _setDisplay(bool on) {
    if (_display == on) return;
    setState(() {
      _display = on;
      _dimmed = false;
    });
    _applyDisplay(on);
    _armDim();
  }

  /// Dims the display mode after the chosen minutes without a touch.
  void _armDim() {
    _dimTimer?.cancel();
    _dimTimer = null;
    final minutes = _displayOptions.dimAfterMinutes;
    if (!_display || minutes <= 0) return;
    _dimTimer = Timer(Duration(minutes: minutes), () {
      if (mounted) setState(() => _dimmed = true);
    });
  }

  /// A tap wakes a dimmed display; otherwise it leaves display mode.
  void _onDisplayTap() {
    if (_dimmed) {
      setState(() => _dimmed = false);
      _armDim();
      return;
    }
    _setDisplay(false);
  }

  /// Keeps the screen on (Android flag / Windows runner, the app's own
  /// [ScreenWake]) and hides the phone's system bars.
  void _applyDisplay(bool on) {
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
        if (_display) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) {
              if (!didPop) _setDisplay(false);
            },
            child: _displayMode(context, state),
          );
        }
        final l = AppLocalizations.of(context)!;
        if (_editing) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) {
              if (!didPop) setState(() => _editing = false);
            },
            child: Scaffold(
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
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _client.hostName.isEmpty ? widget.host.address : _client.hostName,
            ),
            actions: [
              IconButton(
                key: const Key('remote-customize'),
                tooltip: l.remoteCustomize,
                onPressed: () => setState(() => _editing = true),
                icon: const Icon(Icons.tune_rounded),
              ),
              IconButton(
                key: const Key('remote-continue'),
                tooltip: l.remoteContinueListening,
                onPressed: state != null ? _showContinue : null,
                icon: const Icon(Icons.history_rounded),
              ),
              IconButton(
                key: const Key('remote-display-mode'),
                tooltip: l.remoteDisplayMode,
                onPressed: state != null && state.hasItem
                    ? () => _setDisplay(true)
                    : null,
                icon: const Icon(Icons.fit_screen_rounded),
              ),
            ],
          ),
          body: SafeArea(child: _body(context, state)),
        );
      },
    );
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

  Widget _cover(BuildContext context, {double radius = 16}) {
    final cs = Theme.of(context).colorScheme;
    final bytes = _client.cover;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: AspectRatio(
        aspectRatio: 1,
        child: bytes != null
            ? Image.memory(
                bytes,
                fit: BoxFit.cover,
                gaplessPlayback: true,
                errorBuilder: (_, __, ___) => _coverPlaceholder(cs),
              )
            : _coverPlaceholder(cs),
      ),
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
    return RemoteLayoutView(
      layout: _layout,
      landscape: landscape,
      editing: editing,
      onChanged: _setLayout,
      buildBlock: (context, entry, slot) => _block(context, s, entry, slot),
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
                      onPressed: () => _setLayout(
                        _layout.applyPreset(p, landscape: landscape),
                      ),
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
                key: const Key('remote-customize-display'),
                onPressed: () => showRemoteDisplayOptionsSheet(
                  context,
                  _displayOptions,
                  _setDisplayOptions,
                ),
                icon: const Icon(Icons.fit_screen_rounded),
                label: Text(l.remoteDisplayMode),
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
  /// whole book without chapters.
  ({double start, double end}) _span(RemotePlayerState s) {
    final chapter = s.hasChapter;
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

  /// One block of the layout, or null when it has nothing to show.
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
    Widget action(Key key, IconData icon, String label, VoidCallback? onTap) =>
        compact
        ? IconButton(
            key: key,
            tooltip: label,
            onPressed: onTap,
            icon: Icon(icon),
          )
        : TextButton.icon(
            key: key,
            onPressed: onTap,
            icon: Icon(icon),
            label: Text(label),
          );

    switch (e.block) {
      case RemoteBlock.cover:
        return SizedBox(
          width: _coverSize(e.size, slot),
          child: _cover(context),
        );
      case RemoteBlock.titleAuthor:
        if (s.title.isEmpty && s.author.isEmpty) return null;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              s.title,
              textAlign: TextAlign.center,
              maxLines: compact ? 1 : 2,
              overflow: TextOverflow.ellipsis,
              style: (compact ? tt.titleMedium : tt.titleLarge)?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (s.author.isNotEmpty) ...[
              SizedBox(height: compact ? 2 : 4),
              Text(
                s.author,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: (compact ? tt.bodySmall : tt.bodyMedium)?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
            ],
          ],
        );
      case RemoteBlock.chapterTitle:
        if (s.chapterTitle.isEmpty) return null;
        return Text(
          s.chapterTitle,
          key: const Key('remote-chapter-title'),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: tt.bodySmall?.copyWith(color: cs.primary),
        );
      case RemoteBlock.progress:
        final (:start, :end) = _span(s);
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
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            slider,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    fmtTime(position - start),
                    style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                  ),
                  Text(
                    '-${fmtTime(end - position)}',
                    style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                  ),
                ],
              ),
            ),
          ],
        );
      case RemoteBlock.timeLeft:
        return Text(
          _timeLeftText(l, s),
          key: const Key('remote-time-left'),
          textAlign: TextAlign.center,
          style: (compact ? tt.bodySmall : tt.bodyLarge)?.copyWith(
            color: cs.onSurfaceVariant,
          ),
        );
      case RemoteBlock.transport:
        return _buttons(context, s, compact: compact);
      case RemoteBlock.volume:
        final volume = _volume(context, s);
        return compact
            ? SizedBox(width: math.min(240.0, slot.maxWidth), child: volume)
            : volume;
      case RemoteBlock.speed:
        final speed = _speed(s);
        final picker = TextButton.icon(
          key: const Key('remote-speed'),
          onPressed: () => _pickSpeed(s),
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
          () => _pickSleep(s),
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
        return RemoteClockText(
          key: const Key('remote-clock'),
          use24Hour: _displayOptions.use24Hour,
          textAlign: TextAlign.center,
          style: compact
              ? tt.titleLarge
              : tt.displaySmall?.copyWith(fontWeight: FontWeight.w300),
        );
      case RemoteBlock.spacer:
        return SizedBox(height: compact ? 12 : 32);
    }
  }

  /// "12:34 left in the chapter" (or in the book), at the current speed.
  String _timeLeftText(AppLocalizations l, RemotePlayerState s) {
    final chapter = s.hasChapter;
    final end = chapter ? s.chapterEnd : s.duration;
    final speed = s.speed > 0 ? s.speed : 1.0;
    final left = fmtTime((end - s.position).clamp(0, double.infinity) / speed);
    return chapter ? l.remoteChapterTimeLeft(left) : l.remoteTimeLeft(left);
  }

  Widget _volume(BuildContext context, RemotePlayerState s) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final shown = s.muted ? 0.0 : (_volumeDrag ?? s.volume);
    return Row(
      children: [
        IconButton(
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
        ),
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

  /// Previous chapter, back, play/pause, forward, next chapter; [compact]
  /// draws them smaller.
  Widget _buttons(
    BuildContext context,
    RemotePlayerState s, {
    bool compact = false,
  }) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        button(
          l.remoteSkipBack(s.skipBack),
          const Key('remote-skip-back'),
          _skipIcon(context, s.skipBack, forward: false, compact: compact),
          () => _send(SkipCommand(-s.skipBack)),
        ),
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
                decoration: BoxDecoration(
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
                child: s.buffering && !s.playing
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
                        s.playing
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        size: glyph,
                        color: cs.surface,
                      ),
              ),
            ),
          ),
        ),
        button(
          l.remoteSkipForward(s.skipForward),
          const Key('remote-skip-forward'),
          _skipIcon(context, s.skipForward, forward: true, compact: compact),
          () => _send(SkipCommand(s.skipForward)),
        ),
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
      ],
    );
  }

  /// The player's skip glyphs: the built-in 5/10/30 icons, otherwise the
  /// rotate arrow with the number (as on the Absorbing card).
  Widget _skipIcon(
    BuildContext context,
    int seconds, {
    required bool forward,
    bool compact = false,
  }) {
    final cs = Theme.of(context).colorScheme;
    final color = cs.onSurface.withValues(alpha: 0.7);
    final size = compact ? 34.0 : 42.0;
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

  Future<void> _pickSpeed(RemotePlayerState s) async {
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
                  for (final v in _speeds)
                    ChoiceChip(
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

  Future<void> _pickSleep(RemotePlayerState s) async {
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
              for (final m in _sleepMinutes)
                ListTile(
                  leading: const Icon(Icons.timer_outlined),
                  title: Text(l.remoteSleepMinutes(m)),
                  onTap: () => Navigator.pop(ctx, SleepCommand.minutes(m)),
                ),
              ListTile(
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

  // ── Display mode ──────────────────────────────────────────────────

  /// The display mode: a clock, what's playing and how long is left, big
  /// and readable from across the room; two columns in landscape. Its
  /// options ([RemoteDisplayOptions]) are set in Customize.
  Widget _displayMode(BuildContext context, RemotePlayerState? s) {
    final o = _displayOptions;
    final base = Theme.of(context);
    final dark = o.background != RemoteDisplayBackground.theme;
    // Light text on the black or blurred background, whatever the theme.
    final theme = dark
        ? base.copyWith(
            colorScheme: base.colorScheme.copyWith(
              surface: Colors.black,
              onSurface: Colors.white,
              onSurfaceVariant: Colors.white70,
            ),
            textTheme: base.textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
          )
        : base;
    final mq = MediaQuery.of(context);
    final bytes = _client.cover;
    return Theme(
      data: theme,
      child: Scaffold(
        backgroundColor: dark ? Colors.black : null,
        body: GestureDetector(
          key: const Key('remote-display'),
          behavior: HitTestBehavior.opaque,
          onTap: _onDisplayTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (o.background == RemoteDisplayBackground.cover &&
                  bytes != null) ...[
                ImageFiltered(
                  key: const Key('remote-display-blur'),
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
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: MediaQuery(
                    data: mq.copyWith(
                      textScaler: TextScaler.linear(
                        mq.textScaler.scale(1) * o.textSize.scale,
                      ),
                    ),
                    child: Builder(
                      builder: (context) => _displayBody(context, s),
                    ),
                  ),
                ),
              ),
              if (_dimmed)
                IgnorePointer(
                  child: ColoredBox(
                    key: const Key('remote-display-dim'),
                    color: Colors.black.withValues(alpha: 0.8),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayBody(BuildContext context, RemotePlayerState? s) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final o = _displayOptions;
    final List<Widget> details;
    if (_client.phase != RemoteLinkPhase.connected) {
      details = [
        Text(
          l.remoteReconnecting,
          style: tt.titleLarge?.copyWith(color: cs.onSurfaceVariant),
        ),
      ];
    } else if (s == null || !s.hasItem) {
      details = [
        Text(
          l.remoteNothingPlaying(_client.hostName),
          style: tt.titleLarge?.copyWith(color: cs.onSurfaceVariant),
        ),
      ];
    } else {
      final chapter = s.hasChapter;
      final start = chapter ? s.chapterStart : 0.0;
      final end = chapter ? s.chapterEnd : s.duration;
      final span = end - start;
      final progress = span > 0
          ? ((s.position - start) / span).clamp(0.0, 1.0)
          : 0.0;
      details = [
        Text(
          chapter && s.chapterTitle.isNotEmpty ? s.chapterTitle : s.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          chapter ? s.title : s.author,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: tt.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
        ),
        const SizedBox(height: 20),
        LinearProgressIndicator(
          value: progress,
          minHeight: 6,
          borderRadius: BorderRadius.circular(3),
          backgroundColor: cs.primary.withValues(alpha: 0.15),
        ),
        const SizedBox(height: 8),
        Text(
          _timeLeftText(l, s),
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
      ];
    }
    return LayoutBuilder(
      builder: (context, c) {
        final wide = c.maxWidth > c.maxHeight;
        final info = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: wide
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.stretch,
          children: [
            if (o.showClock) ...[
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: wide ? Alignment.centerLeft : Alignment.center,
                child: RemoteClockText(
                  key: const Key('remote-display-clock'),
                  use24Hour: o.use24Hour,
                  style: tt.displayLarge?.copyWith(fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(height: 16),
            ],
            ...details,
            const SizedBox(height: 24),
            Text(
              l.remoteDisplayExit,
              textAlign: wide ? TextAlign.start : TextAlign.center,
              style: tt.bodySmall?.copyWith(
                color: cs.onSurfaceVariant.withValues(alpha: 0.6),
              ),
            ),
          ],
        );
        if (wide) {
          // Cover sized to the height on the left, the rest beside it.
          final side = math.min(c.maxHeight, c.maxWidth * 0.45);
          return Row(
            children: [
              SizedBox(width: side, child: _cover(context, radius: 20)),
              const SizedBox(width: 32),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, inner) => SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: inner.maxHeight),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: info,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: SizedBox(
                width: math.min(c.maxWidth, 520.0) * 0.85,
                child: _cover(context, radius: 20),
              ),
            ),
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: c.maxHeight * 0.6),
              child: SingleChildScrollView(child: info),
            ),
          ],
        );
      },
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
