import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../services/player_settings.dart';
import '../../ui_themes/ui_theme.dart';
import '../../ui_themes/ui_theme_hooks.dart';
import '../../ui_themes/ui_theme_picker.dart';
import '../../widgets/absorb_plus_logo.dart';
import '../../widgets/absorb_slider.dart';
import '../../widgets/beta_logging_notice.dart';
import '../../widgets/next_in_series_download_tile.dart';
import '../../widgets/same_speed_tile.dart';
import 'setup_settings.dart';

/// Speeds offered as chips (the slider and the full list stay in Settings).
const List<double> kSetupSpeeds = [0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.5];

/// A page's title and one line under it.
class _PageTitle extends StatelessWidget {
  const _PageTitle(this.title, [this.intro]);

  final String title;
  final String? intro;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          if (intro != null) ...[
            const SizedBox(height: 6),
            Text(
              intro!,
              style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ],
      ),
    );
  }
}

/// A panel styled like the Settings sections (look-aware surface, edge and
/// radius), without the expand arrow.
class SetupPanel extends StatelessWidget {
  const SetupPanel({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: lookPanelElevation(context, isDark ? 0 : 2),
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: lookPanelColor(context, cs.surfaceContainerHighest),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(lookRadius(context, 16)),
        side: lookPanelSide(
          context,
          isDark
              ? BorderSide(color: cs.outlineVariant.withValues(alpha: 0.3))
              : BorderSide.none,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

const _divider = Divider(height: 1, indent: 16, endIndent: 16);

// ── Welcome ──

class SetupWelcomePage extends StatelessWidget {
  const SetupWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final body = tt.bodySmall?.copyWith(
      color: cs.onSurface.withValues(alpha: 0.7),
      height: 1.45,
    );
    Widget section(IconData icon, String title, String text) => ListTile(
      leading: Icon(icon, color: cs.primary),
      title: Text(title, style: tt.titleSmall),
      subtitle: Text(text, style: body),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Center(child: AbsorbPlusMark(color: cs.primary, size: 64)),
        const SizedBox(height: 16),
        Text(
          l.welcomeToAbsorb,
          textAlign: TextAlign.center,
          style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(
          l.setupWelcomeBody,
          textAlign: TextAlign.center,
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
        const SizedBox(height: 24),
        SetupPanel(
          children: [
            section(
              Icons.menu_book_rounded,
              l.welcomeAbsorbingTitle,
              '${l.welcomeAbsorbingIntro}\n${l.welcomeAbsorbingTabBullet}',
            ),
            _divider,
            section(
              Icons.touch_app_rounded,
              l.welcomeGettingAroundTitle,
              l.welcomeGettingAroundBody,
            ),
          ],
        ),
      ],
    );
  }
}

// ── Connect (once signed in) ──

/// The Connect page after sign-in (or when the setup runs again from
/// Settings): which account is in use. Before sign-in the flow shows the
/// app's own sign-in screen instead.
class SetupConnectedPage extends StatelessWidget {
  const SetupConnectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final auth = context.watch<AuthProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PageTitle(l.setupConnectTitle),
        SetupPanel(
          children: [
            ListTile(
              leading: Icon(Icons.check_circle_rounded, color: cs.primary),
              title: Text(l.setupSignedInAs(auth.username ?? '')),
              subtitle: Text(
                auth.serverUrl ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Look ──

class SetupLookPage extends StatelessWidget {
  const SetupLookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PageTitle(l.uiThemePickerTitle, l.setupLookIntro),
        const SetupPanel(
          children: [
            Padding(padding: EdgeInsets.all(16), child: UiThemeInlinePicker()),
          ],
        ),
      ],
    );
  }
}

// ── Listening ──

class SetupListeningPage extends StatefulWidget {
  const SetupListeningPage({super.key, required this.settings});

  final SetupSettings settings;

  @override
  State<SetupListeningPage> createState() => _SetupListeningPageState();
}

class _SetupListeningPageState extends State<SetupListeningPage> {
  double? _speed;
  int _back = 10;
  int _forward = 30;
  AutoRewindSettings _rewind = const AutoRewindSettings();

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    final s = widget.settings;
    final speed = await s.defaultSpeed();
    final back = await s.backSkip();
    final forward = await s.forwardSkip();
    final rewind = await s.autoRewind();
    if (!mounted) return;
    setState(() {
      _speed = speed;
      _back = back;
      _forward = forward;
      _rewind = rewind;
    });
  }

  void _save(Future<void> future, String what) {
    unawaited(
      future.catchError((Object e) {
        debugPrint('[Setup] Saving $what failed: $e');
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final loaded = _speed != null;
    final speed = _speed ?? 1.0;
    final label = tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant);
    final value = tt.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: cs.primary,
    );
    Widget labelRow(String name, String shown) => Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Row(
        children: [
          Expanded(child: Text(name, style: label)),
          Text(shown, style: value),
        ],
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PageTitle(l.setupListeningTitle, l.setupListeningIntro),
        SetupPanel(
          children: [
            labelRow(l.defaultSpeed, l.speedValue(speed.toStringAsFixed(2))),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: Wrap(
                spacing: 6,
                runSpacing: 4,
                children: [
                  for (final s in kSetupSpeeds)
                    ActionChip(
                      key: ValueKey('setup-speed-$s'),
                      label: Text(
                        l.speedValue(s.toString()),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: (speed - s).abs() < 0.01
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: (speed - s).abs() < 0.01
                              ? cs.onPrimary
                              : cs.onSurface,
                        ),
                      ),
                      backgroundColor: (speed - s).abs() < 0.01
                          ? cs.primary
                          : cs.surfaceContainerHighest,
                      side: BorderSide.none,
                      onPressed: loaded
                          ? () {
                              setState(() => _speed = s);
                              _save(
                                widget.settings.setDefaultSpeed(s),
                                'the default speed',
                              );
                            }
                          : null,
                    ),
                ],
              ),
            ),
            _divider,
            const SameSpeedTile(),
          ],
        ),
        const SizedBox(height: 12),
        SetupPanel(
          children: [
            labelRow(l.skipBack, l.secondsValue(_back.toString())),
            AbsorbSlider(
              key: const ValueKey('setup-skip-back'),
              value: _back.toDouble(),
              min: 5,
              max: 60,
              divisions: 11,
              onChanged: loaded
                  ? (v) {
                      setState(() => _back = v.round());
                      _save(
                        widget.settings.setBackSkip(v.round()),
                        'skip back',
                      );
                    }
                  : null,
            ),
            labelRow(l.skipForward, l.secondsValue(_forward.toString())),
            AbsorbSlider(
              key: const ValueKey('setup-skip-forward'),
              value: _forward.toDouble(),
              min: 5,
              max: 60,
              divisions: 11,
              onChanged: loaded
                  ? (v) {
                      setState(() => _forward = v.round());
                      _save(
                        widget.settings.setForwardSkip(v.round()),
                        'skip forward',
                      );
                    }
                  : null,
            ),
            const SizedBox(height: 4),
            _divider,
            SwitchListTile(
              key: const ValueKey('setup-auto-rewind'),
              title: Text(l.autoRewindOnResume),
              subtitle: Text(
                _rewind.enabled
                    ? l.autoRewindOnSubtitleFormat(
                        _rewind.minRewind.round().toString(),
                        _rewind.maxRewind.round().toString(),
                      )
                    : l.autoRewindOffSubtitle,
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
              value: _rewind.enabled,
              onChanged: loaded
                  ? (v) {
                      final r = _rewind;
                      final next = AutoRewindSettings(
                        enabled: v,
                        minRewind: r.minRewind,
                        maxRewind: r.maxRewind,
                        activationDelay: r.activationDelay,
                        chapterBarrier: r.chapterBarrier,
                        sessionStartRewind: r.sessionStartRewind,
                      );
                      setState(() => _rewind = next);
                      _save(widget.settings.setAutoRewind(next), 'auto-rewind');
                    }
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}

// ── Downloads ──

class SetupDownloadsPage extends StatefulWidget {
  const SetupDownloadsPage({super.key, required this.settings});

  final SetupSettings settings;

  @override
  State<SetupDownloadsPage> createState() => _SetupDownloadsPageState();
}

class _SetupDownloadsPageState extends State<SetupDownloadsPage> {
  bool? _wifiOnly;
  String? _location;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    final wifi = await widget.settings.wifiOnlyDownloads();
    String? location;
    try {
      location = await widget.settings.downloadLocation();
    } catch (e) {
      debugPrint('[Setup] Reading the download location failed: $e');
    }
    if (!mounted) return;
    setState(() {
      _wifiOnly = wifi;
      _location = location;
    });
  }

  Future<void> _pickLocation() async {
    final label = await widget.settings.pickDownloadLocation(context);
    if (label != null && mounted) setState(() => _location = label);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PageTitle(l.setupDownloadsTitle, l.setupDownloadsIntro),
        SetupPanel(
          children: [
            ListTile(
              key: const ValueKey('setup-download-location'),
              leading: Icon(Icons.folder_outlined, color: cs.primary),
              title: Text(l.downloadLocation),
              subtitle: Text(
                _location ?? '',
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: _pickLocation,
            ),
            _divider,
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.downloadOverWifiOnly, style: tt.bodyMedium),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: SegmentedButton<bool>(
                      key: const ValueKey('setup-wifi-only'),
                      showSelectedIcon: false,
                      segments: [
                        ButtonSegment(
                          value: true,
                          label: Text(l.downloadOverWifiOnSubtitle),
                        ),
                        ButtonSegment(
                          value: false,
                          label: Text(l.downloadOverWifiOffSubtitle),
                        ),
                      ],
                      selected: {_wifiOnly ?? false},
                      onSelectionChanged: _wifiOnly == null
                          ? null
                          : (v) {
                              setState(() => _wifiOnly = v.first);
                              unawaited(
                                widget.settings
                                    .setWifiOnlyDownloads(v.first)
                                    .catchError((Object e) {
                                      debugPrint(
                                        '[Setup] Saving Wi-Fi only failed: $e',
                                      );
                                    }),
                              );
                            },
                    ),
                  ),
                ],
              ),
            ),
            _divider,
            const NextInSeriesDownloadTile(),
          ],
        ),
      ],
    );
  }
}

// ── Permissions (Android) ──

class SetupPermissionsPage extends StatefulWidget {
  const SetupPermissionsPage({super.key, required this.settings});

  final SetupSettings settings;

  @override
  State<SetupPermissionsPage> createState() => _SetupPermissionsPageState();
}

class _SetupPermissionsPageState extends State<SetupPermissionsPage> {
  final Map<SetupPermission, bool> _granted = {};

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    for (final p in SetupPermission.values) {
      bool granted = false;
      try {
        granted = await widget.settings.permissionGranted(p);
      } catch (e) {
        debugPrint('[Setup] Reading permission $p failed: $e');
      }
      if (!mounted) return;
      setState(() => _granted[p] = granted);
    }
  }

  Future<void> _request(SetupPermission p) async {
    bool granted = false;
    try {
      granted = await widget.settings.requestPermission(p);
    } catch (e) {
      debugPrint('[Setup] Asking for permission $p failed: $e');
    }
    if (mounted) setState(() => _granted[p] = granted);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    Widget row(SetupPermission p, IconData icon, String title, String why) {
      final granted = _granted[p] == true;
      return ListTile(
        leading: Icon(icon, color: cs.primary),
        title: Text(title),
        subtitle: Text(
          why,
          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
        ),
        trailing: granted
            ? Tooltip(
                message: l.setupAllowed,
                child: Icon(
                  Icons.check_circle_rounded,
                  key: ValueKey('setup-granted-${p.name}'),
                  color: cs.primary,
                ),
              )
            : FilledButton.tonal(
                key: ValueKey('setup-allow-${p.name}'),
                onPressed: _granted.containsKey(p) ? () => _request(p) : null,
                child: Text(l.setupAllow),
              ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PageTitle(l.setupPermissionsTitle, l.setupPermissionsIntro),
        SetupPanel(
          children: [
            row(
              SetupPermission.notifications,
              Icons.notifications_outlined,
              l.notifications,
              l.notificationsSubtitle,
            ),
            _divider,
            row(
              SetupPermission.battery,
              Icons.battery_saver_outlined,
              l.unrestrictedBattery,
              l.unrestrictedBatterySubtitle,
            ),
          ],
        ),
      ],
    );
  }
}

// ── Done ──

class SetupDonePage extends StatefulWidget {
  const SetupDonePage({super.key, required this.settings});

  final SetupSettings settings;

  @override
  State<SetupDonePage> createState() => _SetupDonePageState();
}

class _SetupDonePageState extends State<SetupDonePage> {
  ({double speed, int back, int forward, bool logs})? _summary;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    final s = widget.settings;
    var logs = false;
    try {
      logs = await BetaLoggingNotice.isPending();
    } catch (e) {
      debugPrint('[Setup] Reading the logs notice failed: $e');
    }
    final summary = (
      speed: await s.defaultSpeed(),
      back: await s.backSkip(),
      forward: await s.forwardSkip(),
      logs: logs,
    );
    if (mounted) setState(() => _summary = summary);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final auth = context.watch<AuthProvider>();
    final summary = _summary;
    Widget line(IconData icon, String text) => ListTile(
      dense: true,
      leading: Icon(icon, color: cs.primary, size: 20),
      title: Text(text, style: tt.bodyMedium),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Center(
          child: Icon(Icons.check_circle_rounded, color: cs.primary, size: 56),
        ),
        const SizedBox(height: 12),
        Text(
          l.setupDoneTitle,
          textAlign: TextAlign.center,
          style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 20),
        SetupPanel(
          children: [
            if (auth.isAuthenticated)
              line(Icons.dns_outlined, l.setupSignedInAs(auth.username ?? '')),
            line(
              Icons.style_outlined,
              l.setupSummaryLook(uiThemeName(l, savedUiTheme)),
            ),
            if (summary != null) ...[
              line(
                Icons.speed_rounded,
                l.setupSummarySpeed(summary.speed.toStringAsFixed(2)),
              ),
              line(
                Icons.fast_forward_rounded,
                l.setupSummarySkip(summary.back, summary.forward),
              ),
            ],
          ],
        ),
        if (summary?.logs == true) ...[
          const SizedBox(height: 12),
          SetupPanel(
            children: [
              ListTile(
                key: const ValueKey('setup-logs-note'),
                leading: Icon(Icons.article_outlined, color: cs.primary),
                title: Text(l.betaLoggingTitle),
                subtitle: Text(
                  l.betaLoggingContent,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 16),
        Text(
          l.setupDoneLater,
          textAlign: TextAlign.center,
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
      ],
    );
  }
}
