import 'dart:convert';
import 'dart:io';

import 'package:absorb/services/file_health_check.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, dynamic> _fixture(String name) =>
    jsonDecode(File('test/fixtures/file_health/$name.json').readAsStringSync()) as Map<String, dynamic>;

List<String> _names(FileHealthFinding? f) => [for (final e in f!.entries) e.name];

void main() {
  group('healthy book', () {
    test('finds nothing and counts audio plus ebook', () {
      final report = FileHealthCheck.check(_fixture('healthy_book'));
      expect(report.findings, isEmpty);
      expect(report.healthy, isTrue);
      expect(report.fileCount, 3);
      expect(report.checkedLocal, isFalse);
      expect(report.canRedownload, isFalse);
    });

    test('matching local files are fine', () {
      final report = FileHealthCheck.check(_fixture('healthy_book'), local: const [
        LocalFileStat('/dl/Author/Book/Part 01.mp3', exists: true, size: 28802000),
        LocalFileStat('/dl/Author/Book/Part 02.mp3', exists: true, size: 28802000),
      ]);
      expect(report.findings, isEmpty);
      expect(report.checkedLocal, isTrue);
    });

    test('an empty item is healthy with no files', () {
      final report = FileHealthCheck.check(const {});
      expect(report.healthy, isTrue);
      expect(report.fileCount, 0);
    });
  });

  group('broken book', () {
    late FileHealthReport report;
    setUp(() => report = FileHealthCheck.check(_fixture('broken_book')));

    test('reports the item flags', () {
      expect(report.find(FileHealthKind.itemMissing), isNotNull);
      expect(report.find(FileHealthKind.itemInvalid), isNotNull);
      expect(report.fileCount, 5);
    });

    test('lists invalid files with the server error', () {
      final f = report.find(FileHealthKind.invalidFiles)!;
      expect(_names(f), ['04 Broken.m4b']);
      expect(f.entries.single.error, 'Invalid audio file: no audio streams');
      expect(f.serious, isTrue);
    });

    test('lists zero-length files', () {
      expect(_names(report.find(FileHealthKind.emptyFiles)), ['03 Silence.m4b']);
    });

    test('finds gaps and overlaps between consecutive tracks', () {
      final gap = report.find(FileHealthKind.trackGaps)!;
      expect(_names(gap), ['01 Opening.m4b → 02 Middle.m4b']);
      expect(gap.entries.single.seconds, closeTo(30, 0.001));
      final overlap = report.find(FileHealthKind.trackOverlaps)!;
      expect(_names(overlap), ['02 Middle.m4b → 03 Silence.m4b']);
      expect(overlap.entries.single.seconds, closeTo(530, 0.001));
    });

    test('compares the tracks sum (without excluded files) to the book length', () {
      final f = report.find(FileHealthKind.durationMismatch)!;
      expect(f.expectedSeconds, 4000);
      expect(f.actualSeconds, 2500);
    });

    test('flags low bitrate, skipping excluded and invalid files', () {
      final f = report.find(FileHealthKind.lowBitrate)!;
      expect(_names(f), ['02 Middle.m4b']);
      expect(f.entries.single.value, 24);
      expect(f.serious, isFalse);
    });

    test('groups mixed sample rates and channel counts, most common first', () {
      final rates = report.find(FileHealthKind.mixedSampleRates)!;
      expect([for (final e in rates.entries) e.value], [44100, 22050]);
      expect(rates.entries.first.name, '01 Opening.m4b, 03 Silence.m4b');
      expect(rates.entries.last.name, '02 Middle.m4b');
      final channels = report.find(FileHealthKind.mixedChannels)!;
      expect([for (final e in channels.entries) e.value], [2, 1]);
      expect(channels.serious, isFalse);
    });

    test('lists chapters past the end, naming untitled ones by number', () {
      final f = report.find(FileHealthKind.chaptersPastEnd)!;
      expect(_names(f), ['Ghost chapter', '#4']);
      expect(f.entries.first.seconds, 4100);
    });

    test('has no local findings without local stats', () {
      expect(report.find(FileHealthKind.localMissing), isNull);
      expect(report.find(FileHealthKind.localSizeMismatch), isNull);
      expect(report.canRedownload, isFalse);
    });
  });

  group('tolerances', () {
    Map<String, dynamic> book({required double duration, required List<List<double>> tracks}) => {
          'media': {
            'duration': duration,
            'audioFiles': [
              for (var i = 0; i < tracks.length; i++)
                {
                  'index': i + 1,
                  'duration': tracks[i][1],
                  'metadata': {'filename': 't$i.mp3'},
                },
            ],
            'tracks': [
              for (var i = 0; i < tracks.length; i++)
                {'index': i + 1, 'startOffset': tracks[i][0], 'duration': tracks[i][1]},
            ],
          },
        };

    test('sub-second track drift and small length rounding are ignored', () {
      final report = FileHealthCheck.check(book(duration: 1001.5, tracks: [
        [0, 500.2],
        [500.9, 500.0],
      ]));
      expect(report.findings, isEmpty);
    });

    test('tracks out of order are sorted by start before comparing', () {
      final report = FileHealthCheck.check(book(duration: 200, tracks: [
        [100, 100],
        [0, 100],
      ]));
      expect(report.findings, isEmpty);
    });

    test('a long book allows half a percent of length drift', () {
      expect(
          FileHealthCheck.check(book(duration: 36000, tracks: [
            [0, 36150],
          ])).findings,
          isEmpty);
      expect(
          FileHealthCheck.check(book(duration: 36000, tracks: [
            [0, 36200],
          ])).find(FileHealthKind.durationMismatch),
          isNotNull);
    });

    test('bitrate at exactly 32 kbps is fine; missing bitrate is not flagged', () {
      final report = FileHealthCheck.check({
        'media': {
          'audioFiles': [
            {'duration': 10, 'bitRate': 32000, 'metadata': {'filename': 'a.mp3'}},
            {'duration': 10, 'metadata': {'filename': 'b.mp3'}},
            {'duration': 10, 'bitRate': 31999, 'metadata': {'filename': 'c.mp3'}},
          ],
        },
      });
      expect(_names(report.find(FileHealthKind.lowBitrate)), ['c.mp3']);
      expect(report.find(FileHealthKind.lowBitrate)!.entries.single.value, 32);
    });

    test('files without a sample rate do not count as mixed', () {
      final report = FileHealthCheck.check({
        'media': {
          'audioFiles': [
            {'duration': 10, 'sampleRate': 44100, 'channels': 2, 'metadata': {'filename': 'a.mp3'}},
            {'duration': 10, 'metadata': {'filename': 'b.mp3'}},
          ],
        },
      });
      expect(report.findings, isEmpty);
    });

    test('chapters are checked against the tracks sum when the book has no length', () {
      final report = FileHealthCheck.check({
        'media': {
          'audioFiles': [
            {'duration': 100, 'metadata': {'filename': 'a.mp3'}},
          ],
          'chapters': [
            {'start': 0, 'end': 100, 'title': 'In'},
            {'start': 150, 'end': 200, 'title': 'Out'},
          ],
        },
      });
      expect(_names(report.find(FileHealthKind.chaptersPastEnd)), ['Out']);
    });

    test('an error string alone marks a file invalid', () {
      final report = FileHealthCheck.check({
        'media': {
          'audioFiles': [
            {'duration': 10, 'error': 'ffprobe failed', 'metadata': {'filename': 'a.mp3'}},
            {'duration': 10, 'error': '  ', 'metadata': {'filename': 'b.mp3'}},
          ],
        },
      });
      final f = report.find(FileHealthKind.invalidFiles)!;
      expect(_names(f), ['a.mp3']);
      expect(f.entries.single.error, 'ffprobe failed');
    });
  });

  group('downloaded files', () {
    final item = _fixture('downloaded_book');

    test('matches cleaned-up and duplicate-prefixed names and spots size mismatches', () {
      final report = FileHealthCheck.check(item, local: const [
        LocalFileStat(r'C:\Books\A\B\Chapter One .mp3', exists: true, size: 1600000),
        LocalFileStat('/dl/A/B/Track.mp3', exists: true, size: 1700000),
        LocalFileStat('/dl/A/B/003 - Track.mp3', exists: true, size: 1234),
      ]);
      final f = report.find(FileHealthKind.localSizeMismatch)!;
      expect(_names(f), ['003 - Track.mp3']);
      expect(f.entries.single.value, 1234);
      expect(f.entries.single.expected, 1800000);
      expect(report.find(FileHealthKind.localMissing), isNull);
      expect(report.canRedownload, isTrue);
    });

    test('lists missing local files', () {
      final report = FileHealthCheck.check(item, local: const [
        LocalFileStat('/dl/A/B/Chapter One.mp3', exists: false),
        LocalFileStat('/dl/A/B/Track.mp3', exists: true, size: 1700000),
      ]);
      expect(_names(report.find(FileHealthKind.localMissing)), ['Chapter One.mp3']);
      expect(report.find(FileHealthKind.localMissing)!.fixedByRedownload, isTrue);
      expect(report.canRedownload, isTrue);
    });

    test('unknown files (content URIs, offline drives) and unmatched names are skipped', () {
      final report = FileHealthCheck.check(item, local: const [
        LocalFileStat('content://tree/primary%3AAudiobooks%2FTrack.mp3'),
        LocalFileStat('/dl/A/B/track_000.mp3', exists: true, size: 5),
        LocalFileStat('/dl/A/B/Track.mp3', exists: true),
      ]);
      expect(report.findings, isEmpty);
      expect(report.checkedLocal, isTrue);
    });

    test('a prefix pointing at the wrong position is not guessed', () {
      final report = FileHealthCheck.check(item, local: const [
        LocalFileStat('/dl/A/B/009 - Track.mp3', exists: true, size: 1),
      ]);
      expect(report.findings, isEmpty);
    });
  });

  group('helpers', () {
    test('fileName falls back from filename to path to title to ino', () {
      expect(FileHealthCheck.fileName({'metadata': {'filename': 'a.mp3'}}), 'a.mp3');
      expect(FileHealthCheck.fileName({'metadata': {'relPath': r'x\y\b.mp3'}}), 'b.mp3');
      expect(FileHealthCheck.fileName({'title': 'Track 3'}), 'Track 3');
      expect(FileHealthCheck.fileName({'ino': '77'}), '77');
    });

    test('matchKey ignores case, punctuation, spacing and extension', () {
      expect(FileHealthCheck.matchKey('Chapter: One?.mp3'), FileHealthCheck.matchKey('chapter one .MP3'));
      expect(FileHealthCheck.matchKey('Kapitel Über.m4b'), 'kapitelüber');
    });

    test('baseName handles both separators and encoded content URIs', () {
      expect(FileHealthCheck.baseName(r'C:\a\b.mp3'), 'b.mp3');
      expect(FileHealthCheck.baseName('/a/b.mp3'), 'b.mp3');
      expect(FileHealthCheck.baseName('content://t/primary%3AA%2Fc.mp3'), 'c.mp3');
    });

    test('statLocalFiles uses the injected stat and treats errors and URIs as unknown', () async {
      final stats = await FileHealthCheck.statLocalFiles(
        ['/a.mp3', '/b.mp3', 'content://x/c.mp3', '/d.mp3', 'E:/e.mp3'],
        skip: (p) => p.startsWith('E:'),
        stat: (p) async {
          if (p == '/b.mp3') return LocalFileStat(p, exists: false);
          if (p == '/d.mp3') throw const FileSystemException('denied');
          return LocalFileStat(p, exists: true, size: 10);
        },
      );
      expect([for (final s in stats) s.exists], [true, false, null, null, null]);
      expect(stats.first.size, 10);
    });

    test('statLocalFiles reads real files by default', () async {
      final dir = await Directory.systemTemp.createTemp('file_health');
      addTearDown(() => dir.delete(recursive: true));
      final file = File('${dir.path}/x.mp3')..writeAsBytesSync(List.filled(42, 0));
      final stats = await FileHealthCheck.statLocalFiles([file.path, '${dir.path}/gone.mp3']);
      expect(stats[0].exists, isTrue);
      expect(stats[0].size, 42);
      expect(stats[1].exists, isFalse);
    });
  });
}
