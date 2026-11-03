import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../screens/remote_connect_screen.dart';
import '../services/remote_link/remote_link.dart';
import 'remote_host_sheet.dart';

/// Phone remote rows in Settings → Media Controls (fork): "Phone remote" on
/// a PC (the host) and "Control another device" on Android and PCs (the
/// remote). Nothing on web.
class RemoteLinkSettingsTiles extends StatelessWidget {
  const RemoteLinkSettingsTiles({super.key, this.host, this.connector});

  /// Injected in tests.
  final RemoteHostController? host;
  final RemoteLinkConnector? connector;

  static bool get isAvailable =>
      remoteHostSupported || remoteLinkConnector.isSupported;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final small = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant);
    final host = this.host ?? remoteHost;
    final connector = this.connector ?? remoteLinkConnector;
    final chevron = Icon(
      Icons.chevron_right_rounded,
      color: cs.onSurfaceVariant,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (host.isSupported) ...[
          const Divider(height: 1, indent: 16, endIndent: 16),
          ListenableBuilder(
            listenable: Listenable.merge([host.status, host.connections]),
            builder: (context, _) => ListTile(
              title: Text(l.remoteHostTitle),
              subtitle: Text(
                host.status.value.enabled
                    ? l.remoteHostSubtitleOn(host.connections.value.length)
                    : l.remoteHostSubtitleOff,
                style: small,
              ),
              trailing: chevron,
              onTap: () => RemoteHostSheet.show(context, host: this.host),
            ),
          ),
        ],
        if (connector.isSupported) ...[
          const Divider(height: 1, indent: 16, endIndent: 16),
          ListTile(
            title: Text(l.remoteControlAnother),
            subtitle: Text(l.remoteControlAnotherSubtitle, style: small),
            trailing: chevron,
            onTap: () =>
                RemoteConnectScreen.open(context, connector: this.connector),
          ),
        ],
      ],
    );
  }
}
