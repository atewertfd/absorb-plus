import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/book_stats_service.dart';
import 'package:absorb/widgets/last_played_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, dynamic> session(int at, Map<String, dynamic>? device,
        {String player = 'Absorb'}) =>
    {'updatedAt': at, 'mediaPlayer': player, if (device != null) 'deviceInfo': device};

void main() {
  const me = 'absorb-me';
  final phone = {'deviceId': 'absorb-phone', 'deviceName': 'Google Pixel 8'};

  group('lastPlayedElsewhere', () {
    test('another device is reported with its name and the progress time', () {
      final r = lastPlayedElsewhere([session(1000, phone)],
          localDeviceId: me, progressLastUpdateMs: 1200);
      expect(r?.device, 'Google Pixel 8');
      expect(r?.atMs, 1200);
    });

    test('this device, its reading id, or no device info: nothing', () {
      expect(lastPlayedElsewhere([session(1, {'deviceId': me})], localDeviceId: me), isNull);
      expect(lastPlayedElsewhere([session(1, {'deviceId': '$me-ebook'})], localDeviceId: me), isNull);
      expect(lastPlayedElsewhere([session(1, null)], localDeviceId: me), isNull);
      expect(lastPlayedElsewhere(const [], localDeviceId: me), isNull);
    });

    test('reading sessions are skipped; progress saved well after hides it', () {
      final sessions = [
        session(5000, {'deviceId': me}, player: 'ebook-reader'),
        session(1000, phone),
      ];
      expect(lastPlayedElsewhere(sessions, localDeviceId: me)?.device, 'Google Pixel 8');
      expect(
          lastPlayedElsewhere(sessions,
              localDeviceId: me, progressLastUpdateMs: 1000 + 6 * 60 * 1000),
          isNull);
    });

    test('device labels fall back to model, then client', () {
      expect(lastPlayedDeviceLabel({'manufacturer': 'Google', 'model': 'Pixel 8'}), 'Google Pixel 8');
      expect(lastPlayedDeviceLabel({'manufacturer': 'Google', 'model': 'Google Pixel'}), 'Google Pixel');
      expect(lastPlayedDeviceLabel({'clientName': 'Abs Web', 'browserName': 'Chrome'}), 'Abs Web');
      expect(lastPlayedDeviceLabel({}), '');
    });
  });

  testWidgets('shows one line once the sheet\'s sessions arrive', (t) async {
    const itemId = 'li_last_played_test';
    final stats = BookStatsService.instance.stats(itemId);
    final twoHoursAgo =
        DateTime.now().subtract(const Duration(hours: 2)).millisecondsSinceEpoch;
    await t.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Scaffold(body: LastPlayedLine(itemId: itemId, localDeviceId: me)),
    ));
    expect(find.textContaining('Last played'), findsNothing);

    stats.sessions = [session(twoHoursAgo, phone)];
    stats.bump();
    await t.pump();
    expect(find.text('Last played on Google Pixel 8 · 2h ago'), findsOneWidget);
  });
}
