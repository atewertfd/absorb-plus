import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../main.dart' show flatNotifier;
import '../../services/tailscale_service.dart';
import '../../services/wording.dart';
import '../../ui_themes/ui_theme_hooks.dart';
import '../../utils/fork_branding.dart';
import '../../widgets/absorb_wave_icon.dart';
import '../../widgets/tailscale_login_panel.dart';
import '../setup/setup_pages.dart' show SetupPanel;
import 'login_form.dart';

// Building blocks shared by the alternative sign-in designs. They use the
// app's theme colours, look tokens and the classic screen's own fields.

/// The sign-in screen's background: the classic screen's soft accent glow
/// (look-aware; none with Flat background), with room for the keyboard.
class LoginDesignBackdrop extends StatelessWidget {
  const LoginDesignBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: flatNotifier.value
            ? null
            : BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 0.4, 0.7, 1.0],
                  colors: lookBackdrop(context, [
                    cs.primary.withValues(alpha: 0.15),
                    cs.primary.withValues(alpha: 0.05),
                    cs.surface,
                    cs.surface,
                  ]),
                ),
              ),
        child: SafeArea(child: child),
      ),
    );
  }
}

/// Scrolls [child], centred both ways when it fits, at most [maxWidth] wide.
class LoginScrollBody extends StatelessWidget {
  const LoginScrollBody({
    super.key,
    required this.child,
    this.maxWidth = 460,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: math.max(0, constraints.maxHeight - padding.vertical),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

/// The wave icon in its glowing circle, as on the classic screen.
class LoginWaveBadge extends StatelessWidget {
  const LoginWaveBadge({super.key, this.size = 100});

  final double size;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: cs.primary.withValues(alpha: 0.3),
            blurRadius: size * 0.4,
            spreadRadius: size * 0.08,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: cs.primary.withValues(alpha: 0.1),
          border: Border.all(
            color: cs.primary.withValues(alpha: 0.15),
            width: 1.5,
          ),
        ),
        child: Center(
          child: AbsorbWaveIcon(size: size * 0.44, color: cs.primary),
        ),
      ),
    );
  }
}

/// The app's wordmark and tagline, centred.
class LoginWordmark extends StatelessWidget {
  const LoginWordmark({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            ForkBranding.wordmark,
            style: (compact ? tt.titleLarge : tt.headlineMedium)?.copyWith(
              fontWeight: FontWeight.w200,
              color: cs.onSurface,
              letterSpacing: compact ? 6 : 10,
            ),
          ),
        ),
        SizedBox(height: compact ? 4 : 10),
        Text(
          Wording.of(context).loginTagline,
          textAlign: TextAlign.center,
          style: (compact ? tt.bodyMedium : tt.bodyLarge)?.copyWith(
            color: cs.onSurfaceVariant.withValues(alpha: 0.6),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

/// A look-aware panel with padding (the Settings / setup panel style).
class LoginPanel extends StatelessWidget {
  const LoginPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => SetupPanel(
    children: [Padding(padding: padding, child: child)],
  );
}

/// The server field's Enter: check the address, then go to the username.
void submitLoginServer(LoginForm form, {VoidCallback? onValid}) {
  final next = onValid ?? form.usernameFocus.requestFocus;
  if (form.serverValid) {
    next();
  } else if (!form.serverChecking) {
    unawaited(
      form.checkServer().then((_) {
        if (form.serverValid) next();
      }),
    );
  }
}

/// One chip per saved server; tapping one fills in its address.
class LoginRecentServers extends StatelessWidget {
  const LoginRecentServers({super.key, required this.form});

  final LoginForm form;

  @override
  Widget build(BuildContext context) {
    final servers = form.savedServers;
    if (servers.isEmpty) return const SizedBox.shrink();
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final muted = cs.onSurfaceVariant.withValues(alpha: 0.7);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 6),
            child: Text(
              l.loginRecentServers,
              style: tt.labelMedium?.copyWith(color: muted),
            ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final account in servers)
                ActionChip(
                  avatar: Icon(Icons.dns_rounded, size: 16, color: muted),
                  label: Text(
                    account.serverUrl
                        .replaceAll(RegExp(r'^https?://'), '')
                        .replaceAll(RegExp(r'/+$'), ''),
                    overflow: TextOverflow.ellipsis,
                    style: tt.labelMedium?.copyWith(color: cs.onSurface),
                  ),
                  backgroundColor: cs.surfaceContainerHighest.withValues(
                    alpha: 0.3,
                  ),
                  side: BorderSide(
                    color: cs.outlineVariant.withValues(alpha: 0.2),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: form.busy
                      ? null
                      : () => form.useSavedServer(account),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Opens the built-in Tailscale sheet (the classic screen's chip does the
/// same).
Future<void> openLoginTailscale(BuildContext context) =>
    TailscaleLoginChip.showSheet(context, TailscaleService.instance);

/// "More ways to sign in": one expander with every secondary option as a
/// clear row.
class LoginMoreWays extends StatefulWidget {
  const LoginMoreWays({
    super.key,
    required this.form,
    this.showBackend = true,
    this.showTailscale = true,
  });

  final LoginForm form;
  final bool showBackend;
  final bool showTailscale;

  @override
  State<LoginMoreWays> createState() => _LoginMoreWaysState();
}

class _LoginMoreWaysState extends State<LoginMoreWays> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final form = widget.form;
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final muted = cs.onSurfaceVariant;
    const divider = Divider(height: 1, indent: 16, endIndent: 16);

    Widget row(
      Key key,
      IconData icon,
      String title,
      VoidCallback onTap, {
      String? subtitle,
    }) => ListTile(
      key: key,
      leading: Icon(icon, color: cs.primary),
      title: Text(title, style: tt.bodyLarge),
      subtitle: subtitle == null
          ? null
          : Text(subtitle, style: tt.bodySmall?.copyWith(color: muted)),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: muted.withValues(alpha: 0.5),
      ),
      onTap: form.busy ? null : onTap,
    );

    return SetupPanel(
      children: [
        ListTile(
          key: const Key('login-more-ways'),
          leading: Icon(Icons.more_horiz_rounded, color: muted),
          title: Text(
            l.loginMoreWays,
            style: tt.titleSmall?.copyWith(color: muted),
          ),
          trailing: Icon(
            _open ? Icons.expand_less_rounded : Icons.expand_more_rounded,
            color: muted,
          ),
          onTap: () => setState(() => _open = !_open),
        ),
        if (_open) ...[
          if (widget.showBackend) ...[
            divider,
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.loginServerType, style: tt.bodyLarge),
                  const SizedBox(height: 8),
                  form.backendPicker(context),
                ],
              ),
            ),
          ],
          if (widget.showTailscale && TailscaleService.platformSupported) ...[
            divider,
            row(
              const Key('login-more-tailscale'),
              Icons.vpn_lock_rounded,
              l.tailscaleChip,
              () => unawaited(openLoginTailscale(context)),
              subtitle: l.tailscaleCardPitch,
            ),
          ],
          divider,
          row(
            const Key('login-more-paste-link'),
            Icons.content_paste_rounded,
            l.loginPasteLink,
            () => unawaited(form.pasteLoginLink()),
          ),
          divider,
          row(
            const Key('login-more-restore'),
            Icons.restore_rounded,
            l.loginRestoreFromBackup,
            () => unawaited(form.restoreFromBackup()),
          ),
          if (form.canPlayDownloadsSignedOut) ...[
            divider,
            row(
              const Key('login-more-play-downloads'),
              Icons.download_done_rounded,
              l.loginPlayDownloads,
              form.playDownloadsSignedOut,
            ),
          ],
          divider,
          row(
            const Key('login-more-advanced'),
            Icons.tune_rounded,
            l.loginAdvanced,
            () => unawaited(form.openFullSignIn()),
            subtitle: l.loginDesignAdvancedSubtitle,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: form.savedAccounts(context),
          ),
        ],
      ],
    );
  }
}

/// The app version, small and faint, as under the classic form.
class LoginVersionLabel extends StatelessWidget {
  const LoginVersionLabel({super.key, required this.form});

  final LoginForm form;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        form.appVersion,
        textAlign: TextAlign.center,
        style: tt.labelSmall?.copyWith(
          color: cs.onSurfaceVariant.withValues(alpha: 0.3),
          letterSpacing: 1,
        ),
      ),
    );
  }
}

/// [children] with [gap] between them (for the notices).
List<Widget> spacedLoginWidgets(List<Widget> children, {double gap = 12}) => [
  for (final w in children) ...[w, SizedBox(height: gap)],
];
