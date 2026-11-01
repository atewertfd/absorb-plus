import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/api_service.dart';
import '../services/book_stats_service.dart';
import 'book_activity_card.dart' show activityAgo;

/// Absorb Plus (C4): where and when a book was last played, when that was on
/// another device.
class LastPlayedElsewhere {
  /// Empty when the server didn't say what the device was.
  final String device;
  final int atMs;
  const LastPlayedElsewhere(this.device, this.atMs);
}

/// A short device name from a session's `deviceInfo`: the device's own name,
/// else maker and model, else the client ("Abs Web"), else browser or OS.
String lastPlayedDeviceLabel(Map deviceInfo) {
  String s(String k) {
    final v = deviceInfo[k];
    return v is String ? v.trim() : '';
  }

  final name = s('deviceName');
  if (name.isNotEmpty) return name;
  final model = s('model');
  final maker = s('manufacturer');
  if (model.isNotEmpty) {
    return maker.isEmpty || model.toLowerCase().startsWith(maker.toLowerCase())
        ? model
        : '$maker $model';
  }
  for (final k in const ['clientName', 'browserName', 'osName']) {
    if (s(k).isNotEmpty) return s(k);
  }
  return '';
}

/// From the user's sessions for the item (newest first, as
/// [BookStatsService] keeps them): the newest listening session, when it came
/// from a device other than [localDeviceId]. Null when it was this device,
/// when the server sent no device info, or when the progress was saved well
/// after that session (someone played since, perhaps this device offline).
/// The time is the progress's [progressLastUpdateMs] when known.
LastPlayedElsewhere? lastPlayedElsewhere(
  List<Map<String, dynamic>> sessions, {
  required String localDeviceId,
  int? progressLastUpdateMs,
}) {
  Map<String, dynamic>? latest;
  for (final s in sessions) {
    if (s['mediaPlayer'] == ApiService.readingMediaPlayer) continue;
    latest = s;
    break;
  }
  if (latest == null) return null;
  final info = latest['deviceInfo'];
  if (info is! Map) return null;
  final id = info['deviceId'];
  if (id is String &&
      id.isNotEmpty &&
      localDeviceId.isNotEmpty &&
      (id == localDeviceId || id == '$localDeviceId-ebook')) {
    return null;
  }
  final sessionAt = (latest['updatedAt'] as num?)?.toInt() ??
      (latest['startedAt'] as num?)?.toInt();
  if (sessionAt == null) return null;
  final at = progressLastUpdateMs ?? sessionAt;
  if (at - sessionAt > const Duration(minutes: 5).inMilliseconds) return null;
  return LastPlayedElsewhere(lastPlayedDeviceLabel(info), at);
}

/// One quiet line on the book sheet: "Last played on Pixel 8 · 2h ago". Uses
/// the sessions the sheet already loads for its activity card, so it costs
/// no request of its own, and shows nothing until they arrive.
class LastPlayedLine extends StatelessWidget {
  final String itemId;
  final int? progressLastUpdateMs;

  /// This device's id; [ApiService.deviceId] unless a test says otherwise.
  final String? localDeviceId;

  const LastPlayedLine({
    super.key,
    required this.itemId,
    this.progressLastUpdateMs,
    this.localDeviceId,
  });

  @override
  Widget build(BuildContext context) {
    final stats = BookStatsService.instance.stats(itemId);
    return ListenableBuilder(
      listenable: stats,
      builder: (context, _) {
        final last = lastPlayedElsewhere(
          stats.sessions,
          localDeviceId: localDeviceId ?? ApiService.deviceId,
          progressLastUpdateMs: progressLastUpdateMs,
        );
        if (last == null) return const SizedBox.shrink();
        final l = AppLocalizations.of(context)!;
        final cs = Theme.of(context).colorScheme;
        final ago = activityAgo(context, l, last.atMs);
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            last.device.isEmpty
                ? l.lastPlayedElsewhere(ago)
                : l.lastPlayedOnDevice(last.device, ago),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
        );
      },
    );
  }
}
