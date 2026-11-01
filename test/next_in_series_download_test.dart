import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/next_in_series_download.dart';
import 'package:absorb/widgets/next_in_series_download_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> _book(String id, String seq,
        {String series = 's1', bool finished = false}) =>
    {
      'id': id,
      'libraryId': 'lib1',
      'media': {
        'metadata': {
          'title': 'Book $id',
          'series': [
            {'id': series, 'name': 'Series', 'sequence': seq}
          ],
        },
      },
      if (finished) 'userMediaProgress': {'isFinished': true},
    };

class _Fake {
  bool enabled = true;
  bool online = true;
  final items = <String, Map<String, dynamic>>{};
  List<dynamic> series = [];
  final downloaded = <String>{};
  final started = <String>[];
  int itemFetches = 0;
  String? downloadError;

  NextInSeriesDownloader build() => NextInSeriesDownloader(
        isEnabled: () async => enabled,
        mayDownloadNow: () async => online,
        fetchItem: (id) async {
          itemFetches++;
          return items[id];
        },
        fetchSeriesBooks: (libraryId, seriesId) async => series,
        isDownloadedOrActive: downloaded.contains,
        startDownload: (book) async {
          if (downloadError != null) return downloadError;
          started.add(book['id'] as String);
          return null;
        },
      );
}

void main() {
  late _Fake fake;
  late NextInSeriesDownloader dl;

  setUp(() {
    fake = _Fake();
    fake.items['b2'] = _book('b2', '2');
    fake.series = [_book('b1', '1'), _book('b3', '3'), _book('b2', '2'), _book('b4', '4')];
    dl = fake.build();
  });

  Future<NextInSeriesOutcome> at(double pos, {double total = 36000, String id = 'b2'}) =>
      dl.check(itemId: id, positionS: pos, totalS: total);

  test('due at 80% or under an hour left', () {
    expect(nextInSeriesDue(70000, 100000), isFalse);
    expect(nextInSeriesDue(80000, 100000), isTrue);
    expect(nextInSeriesDue(100, 3000), isTrue); // a short book is due at once
    expect(nextInSeriesDue(28000, 36000), isFalse);
    expect(nextInSeriesDue(32500, 36000), isTrue);
    expect(nextInSeriesDue(10, 0), isFalse);
  });

  test('early in the book nothing happens', () async {
    expect(await at(1000), NextInSeriesOutcome.notYet);
    expect(fake.itemFetches, 0);
  });

  test('downloads the next book by sequence once', () async {
    expect(await at(30000), NextInSeriesOutcome.started);
    expect(fake.started, ['b3']);
    expect(await at(31000), NextInSeriesOutcome.alreadyHandled);
    expect(fake.started, ['b3']);
  });

  test('off by default does nothing and checks again later', () async {
    fake.enabled = false;
    expect(await at(30000), NextInSeriesOutcome.disabled);
    expect(fake.itemFetches, 0);
    fake.enabled = true;
    expect(await at(30100), NextInSeriesOutcome.started);
  });

  test('off Wi-Fi with Wi-Fi only on waits instead of downloading', () async {
    fake.online = false;
    expect(await at(30000), NextInSeriesOutcome.waitingForWifi);
    expect(fake.started, isEmpty);
    fake.online = true;
    expect(await at(30100), NextInSeriesOutcome.started);
    expect(fake.started, ['b3']);
  });

  test('an already downloaded next book is left alone', () async {
    fake.downloaded.add('b3');
    expect(await at(30000), NextInSeriesOutcome.alreadyDownloaded);
    expect(fake.started, isEmpty);
  });

  test('skips a next book already finished', () async {
    fake.series = [_book('b2', '2'), _book('b3', '3', finished: true), _book('b4', '4')];
    expect(await at(30000), NextInSeriesOutcome.started);
    expect(fake.started, ['b4']);
  });

  test('last book of the series or no series', () async {
    fake.items['b4'] = _book('b4', '4');
    expect(await at(30000, id: 'b4'), NextInSeriesOutcome.noNextBook);
    fake.items['solo'] = {'id': 'solo', 'libraryId': 'lib1', 'media': {'metadata': {'series': []}}};
    expect(await at(30000, id: 'solo'), NextInSeriesOutcome.noNextBook);
    expect(fake.started, isEmpty);
  });

  test('podcast episodes are ignored', () async {
    expect(await dl.check(itemId: 'b2', episodeId: 'e1', positionS: 35000, totalS: 36000),
        NextInSeriesOutcome.notYet);
  });

  test('a failed lookup is retried on the next check', () async {
    fake.items.remove('b2');
    expect(await at(30000), NextInSeriesOutcome.lookupFailed);
    fake.items['b2'] = _book('b2', '2');
    expect(await at(30100), NextInSeriesOutcome.started);
  });

  test('a download that could not start is not retried for this book', () async {
    fake.downloadError = 'nope';
    expect(await at(30000), NextInSeriesOutcome.failed);
    expect(await at(30100), NextInSeriesOutcome.alreadyHandled);
  });

  test('series parsing matches the queue rules', () {
    expect(seriesOfItem(_book('x', '2.5')), ('s1', 2.5));
    expect(seriesOfItem(_book('x', 'Book 2')), (null, null));
    expect(
        seriesOfItem({
          'media': {
            'metadata': {'series': {'id': 's9', 'sequence': '7'}}
          }
        }),
        ('s9', 7.0));
  });

  group('settings', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    test('off by default', () async {
      expect(await getAutoDownloadNextInSeries(), isFalse);
      await setAutoDownloadNextInSeries(true);
      expect(await getAutoDownloadNextInSeries(), isTrue);
    });

    testWidgets('tile loads and saves the switch', (tester) async {
      final saved = <bool>[];
      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: NextInSeriesDownloadTile(
            load: () async => false,
            save: (v) async => saved.add(v),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Download the next book in the series automatically'), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();
      expect(saved, [true]);
    });
  });
}
