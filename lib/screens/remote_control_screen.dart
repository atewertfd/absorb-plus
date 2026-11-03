import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../services/remote_link/remote_link.dart';
import '../services/screen_wake.dart';
import '../utils/fork_platform.dart';
import '../widgets/absorb_slider.dart';
import '../widgets/absorbing_shared.dart' show fmtTime;
import '../widgets/adaptive_modal.dart';
import '../widgets/card_buttons.dart' show Pressable;

/// How the remote screen was left, for the connect screen.
enum RemoteControlExit { pairAgain }

/// Phone remote, the remote side (fork): what the host is playing, its
/// controls, and a display mode. Shows "Reconnecting…" instead of stale
/// controls while the link is down.
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

class _RemoteControlScreenState extends State<RemoteControlScreen> {
  static const _wakeOwner = 'remoteDisplay';
  static const _speeds = [
    0.75, 1.0, 1.1, 1.2, 1.25, 1.3, 1.4, 1.5, 1.75, 2.0, 2.5, 3.0, //
  ];
  static const _sleepMinutes = [15, 30, 45, 60, 90];

  RemoteLinkConnector get _connector => widget.connector ?? remoteLinkConnector;

  late RemoteLinkClient _client;
  bool _display = false;
  Timer? _clock;
  double? _drag;
  double? _seekTarget;
  DateTime? _seekAt;
  String? _shownError;

  @override
  void initState() {
    super.initState();
    _client = widget.client ?? _connector.open(widget.host);
    _client.addListener(_onClient);
    unawaited(_client.connect());
  }

  @override
  void dispose() {
    _clock?.cancel();
    if (_display) _applyDisplay(false);
    _client.removeListener(_onClient);
    _client.dispose();
    super.dispose();
  }

  void _connectAgain() {
    _client.removeListener(_onClient);
    _client.dispose();
    setState(() {
      _client = _connector.open(widget.host);
      _shownError = null;
    });
    _client.addListener(_onClient);
    unawaited(_client.connect());
  }

  void _onClient() {
    final error = _client.lastError;
    if (error == null) {
      _shownError = null;
      return;
    }
    if (error == _shownError || !mounted) return;
    _shownError = error;
    final l = AppLocalizations.of(context)!;
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(
        content: Text(
          error == RemoteErrorCode.nothingLoaded
              ? l.remoteNothingLoaded
              : l.remoteCommandFailed,
        ),
      ),
    );
  }

  void _send(RemoteCommand command) => _client.send(command);

  // ── Display mode ──────────────────────────────────────────────────

  void _setDisplay(bool on) {
    if (_display == on) return;
    setState(() => _display = on);
    _applyDisplay(on);
    _clock?.cancel();
    _clock = on
        ? Timer.periodic(const Duration(seconds: 1), (_) {
            if (mounted) setState(() {});
          })
        : null;
  }

  /// Keeps the screen on (Android flag / Windows runner, the app's own
  /// [ScreenWake]) and hides the phone's system bars.
  void _applyDisplay(bool on) {
    unawaited(ScreenWake.hold(_wakeOwner, on));
    if (ForkPlatform.isAndroid) {
      if (on) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: SystemUiOverlay.values,
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
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _client.hostName.isEmpty ? widget.host.address : _client.hostName,
            ),
            actions: [
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
    switch (_client.phase) {
      case RemoteLinkPhase.closed:
        return _problem(context);
      case RemoteLinkPhase.idle:
      case RemoteLinkPhase.connecting:
      case RemoteLinkPhase.reconnecting:
        return _waiting(
          context,
          _client.phase == RemoteLinkPhase.reconnecting
              ? l.remoteReconnecting
              : l.remoteConnecting,
        );
      case RemoteLinkPhase.connected:
        if (state == null) return _waiting(context, l.remoteConnecting);
        if (!state.hasItem) {
          return _message(
            context,
            Icons.headphones_rounded,
            l.remoteNothingPlaying(_client.hostName),
          );
        }
        return _controls(context, state);
    }
  }

  Widget _waiting(BuildContext context, String text) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
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

  Widget _coverPlaceholder(ColorScheme cs) => Container(
    color: cs.surfaceContainerHighest,
    alignment: Alignment.center,
    child: Icon(Icons.headphones_rounded, size: 64, color: cs.onSurfaceVariant),
  );

  Widget _controls(BuildContext context, RemotePlayerState s) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final chapter = s.hasChapter;
    final start = chapter ? s.chapterStart : 0.0;
    final end = chapter ? s.chapterEnd : (s.duration > 0 ? s.duration : 1.0);
    final position = (_drag ?? _position(s)).clamp(start, end);
    return LayoutBuilder(
      builder: (context, constraints) {
        final coverSize = (constraints.maxWidth - 64)
            .clamp(120.0, 340.0)
            .toDouble()
            .clamp(120.0, constraints.maxHeight * 0.42)
            .toDouble();
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                children: [
                  SizedBox(width: coverSize, child: _cover(context)),
                  const SizedBox(height: 20),
                  Text(
                    s.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: tt.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  if (s.author.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      s.author,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: tt.bodyMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (s.chapterTitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      s.chapterTitle,
                      key: const Key('remote-chapter-title'),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: tt.bodySmall?.copyWith(color: cs.primary),
                    ),
                  ],
                  const SizedBox(height: 16),
                  AbsorbSlider(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          fmtTime(position - start),
                          style: tt.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          '-${fmtTime(end - position)}',
                          style: tt.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buttons(context, s),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        key: const Key('remote-speed'),
                        onPressed: () => _pickSpeed(s),
                        icon: const Icon(Icons.speed_rounded),
                        label: Text('${_speedLabel(s.speed)}x'),
                      ),
                      const SizedBox(width: 16),
                      TextButton.icon(
                        key: const Key('remote-sleep'),
                        onPressed: () => _pickSleep(s),
                        icon: Icon(
                          s.sleep.isActive
                              ? Icons.bedtime_rounded
                              : Icons.bedtime_outlined,
                        ),
                        label: Text(_sleepLabel(l, s.sleep)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buttons(BuildContext context, RemotePlayerState s) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    Widget button(
      String tooltip,
      Key key,
      Widget child,
      VoidCallback onTap, {
      double size = 56,
    }) => Flexible(
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
            size: 34,
            color: cs.onSurfaceVariant,
          ),
          () => _send(const ChapterCommand(-1)),
        ),
        button(
          l.remoteSkipBack(s.skipBack),
          const Key('remote-skip-back'),
          _skipIcon(context, s.skipBack, forward: false),
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
                width: 68,
                height: 68,
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
                        size: 34,
                        color: cs.surface,
                      ),
              ),
            ),
          ),
        ),
        button(
          l.remoteSkipForward(s.skipForward),
          const Key('remote-skip-forward'),
          _skipIcon(context, s.skipForward, forward: true),
          () => _send(SkipCommand(s.skipForward)),
        ),
        button(
          l.remoteNextChapter,
          const Key('remote-next-chapter'),
          Icon(Icons.skip_next_rounded, size: 34, color: cs.onSurfaceVariant),
          () => _send(const ChapterCommand(1)),
        ),
      ],
    );
  }

  /// The player's skip glyphs: the built-in 5/10/30 icons, otherwise the
  /// rotate arrow with the number (as on the Absorbing card).
  Widget _skipIcon(BuildContext context, int seconds, {required bool forward}) {
    final cs = Theme.of(context).colorScheme;
    final color = cs.onSurface.withValues(alpha: 0.7);
    const size = 42.0;
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

  // ── Display mode ──────────────────────────────────────────────────

  Widget _displayMode(BuildContext context, RemotePlayerState? s) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final clock = MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay.now(),
      alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
    );
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
      final speed = s.speed > 0 ? s.speed : 1.0;
      final left = fmtTime(
        (end - s.position).clamp(0, double.infinity) / speed,
      );
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
          chapter ? l.remoteChapterTimeLeft(left) : l.remoteTimeLeft(left),
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
      ];
    }
    return Scaffold(
      body: GestureDetector(
        key: const Key('remote-display'),
        behavior: HitTestBehavior.opaque,
        onTap: () => _setDisplay(false),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: LayoutBuilder(
              builder: (context, c) {
                final wide = c.maxWidth > c.maxHeight;
                final info = Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: wide
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      clock,
                      key: const Key('remote-display-clock'),
                      textAlign: wide ? TextAlign.start : TextAlign.center,
                      style: tt.displayLarge?.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 16),
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
                final coverSide = (wide ? c.maxHeight : c.maxWidth).clamp(
                  0.0,
                  520.0,
                );
                final cover = SizedBox(
                  width: coverSide * (wide ? 0.9 : 0.85),
                  child: _cover(context, radius: 20),
                );
                return wide
                    ? Row(
                        children: [
                          cover,
                          const SizedBox(width: 32),
                          Expanded(child: info),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: cover),
                          const SizedBox(height: 24),
                          info,
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
