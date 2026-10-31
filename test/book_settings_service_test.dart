import 'dart:convert';

import 'package:absorb/services/book_settings_service.dart';
import 'package:absorb/services/player_settings.dart';
import 'package:absorb/services/scoped_prefs.dart';
import 'package:absorb/services/user_account_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const server = 'https://audiobookshelf.example';
  const scope = 'audiobookshelf.example_alice';
  const series = (id: 'ser-1', name: 'The Expanse');

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'saved_accounts': jsonEncode([
        {'serverUrl': server, 'username': 'alice', 'token': 'a-token'},
      ]),
      'active_account_scope': scope,
    });
    await UserAccountService().init();
    expect(UserAccountService().activeScopeKey, scope);
    BookSettingsService.resetQueueForTest();
  });

  group('series lookup', () {
    test('reads the first series from a full item and a session', () {
      final item = {
        'media': {
          'metadata': {
            'series': [
              {'id': 'ser-1', 'name': 'The Expanse', 'sequence': '2'},
            ],
          },
        },
      };
      expect(BookSettingsService.seriesOf(item), series);
      final session = {
        'mediaMetadata': {
          'series': [
            {'id': 'ser-1', 'name': 'The Expanse'},
          ],
        },
      };
      expect(BookSettingsService.seriesOf(session), series);
    });

    test('a minified item with only a series name has no series id', () {
      expect(
        BookSettingsService.seriesOf({
          'media': {
            'metadata': {'seriesName': 'The Expanse #2'},
          },
        }),
        isNull,
      );
    });

    test('settings are stored per account', () async {
      await BookSettingsService.rememberSeries('b1', series);
      await BookSettingsService.setBookSkip('b1', const BookSkip(intro: 10));
      final prefs = await SharedPreferences.getInstance();
      expect(
        prefs.getString(ScopedPrefs.keyForScope(scope, 'bookSkip_b1')),
        '10,0',
      );
      expect(
        prefs.getString(ScopedPrefs.keyForScope(scope, 'bookSeries_b1')),
        'ser-1',
      );
      expect(prefs.containsKey('bookSkip_b1'), isFalse);
    });
  });

  group('series speed memory', () {
    test(
      'a book with no speed starts at its series speed, then default',
      () async {
        await BookSettingsService.rememberSeries('b1', series);
        await BookSettingsService.rememberSeries('b2', series);
        await PlayerSettings.setBookSpeed('b1', 1.5);

        expect(await PlayerSettings.getBookSpeed('b1'), 1.5);
        // b2 has no speed of its own: it inherits the series' last speed.
        expect(await PlayerSettings.getBookSpeed('b2'), 1.5);
        // A book outside any series falls through to the default speed.
        expect(await PlayerSettings.getBookSpeed('b3'), isNull);
      },
    );

    test("a book's own speed wins and updates the series memory", () async {
      await BookSettingsService.rememberSeries('b1', series);
      await BookSettingsService.rememberSeries('b2', series);
      await BookSettingsService.rememberSeries('b3', series);
      await PlayerSettings.setBookSpeed('b1', 1.5);
      await PlayerSettings.setBookSpeed('b2', 1.25);

      expect(await PlayerSettings.getBookSpeed('b1'), 1.5);
      expect(await PlayerSettings.getBookSpeed('b2'), 1.25);
      expect(await PlayerSettings.getBookSpeed('b3'), 1.25);
    });

    test('a speed saved before the series was known is not lost', () async {
      await PlayerSettings.setBookSpeed('b1', 1.75);
      await BookSettingsService.rememberSeries('b1', series);
      expect(await PlayerSettings.getBookSpeed('b1'), 1.75);
    });
  });

  group('intro', () {
    test('only a start from 0 moves past the intro', () {
      expect(BookSettingsService.introStart(0, 30, 3600), 30);
      expect(BookSettingsService.introStart(0.4, 30, 3600), 30);
      // A resumed position is never moved.
      expect(BookSettingsService.introStart(12.5, 30, 3600), 12.5);
      expect(BookSettingsService.introStart(1800, 30, 3600), 1800);
      // No intro set.
      expect(BookSettingsService.introStart(0, 0, 3600), 0);
      // An intro covering half the book or more is ignored.
      expect(BookSettingsService.introStart(0, 60, 100), 0);
    });

    test('a forced start (chapter or bookmark jump) keeps its position', () {
      final rules = BookPlaybackRules();
      rules.commit(
        itemId: 'b1',
        skip: const BookSkip(intro: 30),
        allowIntro: false,
      );
      expect(rules.introStart(0, 3600), 0);
      expect(rules.isIntroStart(0), isFalse);
    });

    test('the intro target is known, so session-start rewind skips it', () {
      final rules = BookPlaybackRules();
      rules.commit(itemId: 'b1', skip: const BookSkip(intro: 30));
      expect(rules.introStart(0, 3600), 30);
      expect(rules.isIntroStart(30), isTrue);
      expect(rules.isIntroStart(900), isFalse);
    });

    test('the intro is decided on the final start, after the reconcile', () {
      // playItem commits with no position yet; the server's saved position
      // then arrives (here 12 s, listened elsewhere) and must be kept.
      final rules = BookPlaybackRules();
      rules.commit(itemId: 'b1', skip: const BookSkip(intro: 30));
      expect(rules.introStart(12, 3600), 12);
      expect(rules.isIntroStart(12), isFalse);
      // A finished book restarting from 0 does skip it.
      expect(rules.introStart(0, 3600), 30);
    });

    test('a new start forgets the previous intro target', () {
      final rules = BookPlaybackRules();
      rules.commit(itemId: 'b1', skip: const BookSkip(intro: 30));
      rules.introStart(0, 3600);
      rules.commit(itemId: 'b2', skip: BookSkip.none);
      expect(rules.isIntroStart(30), isFalse);
      expect(rules.introStart(0, 3600), 0);
    });

    test('podcast episodes get no skip', () async {
      await BookSettingsService.setBookSkip('show', const BookSkip(intro: 30));
      expect(
        await BookPlaybackRules.skipForStart('show', 'ep-1'),
        BookSkip.none,
      );
      expect(
        await BookPlaybackRules.skipForStart('show', null),
        const BookSkip(intro: 30),
      );
    });
  });

  group('outro', () {
    const total = 3600.0;

    bool tick(
      OutroGuard g,
      double pos, {
      String key = 'b1',
      bool playing = true,
    }) => g.shouldFinish(
      key: key,
      positionSec: pos,
      totalDuration: total,
      playing: playing,
    );

    test('finishes once when playback runs across the outro', () {
      final g = OutroGuard()..arm('b1', 30);
      expect(tick(g, 3569.0), isFalse);
      expect(tick(g, 3569.6), isFalse);
      expect(tick(g, 3570.1), isTrue);
      expect(tick(g, 3570.3), isFalse);
      expect(tick(g, 3569.0), isFalse);
      expect(tick(g, 3571.0), isFalse);
    });

    test('a seek or a start inside the outro does not end the book', () {
      final g = OutroGuard()..arm('b1', 30);
      expect(tick(g, 3000), isFalse);
      expect(tick(g, 3580), isFalse); // seek forward past the threshold
      expect(tick(g, 3580.2), isFalse);

      final resumed = OutroGuard()..arm('b1', 30);
      expect(tick(resumed, 3585), isFalse); // first tick, resumed in outro
      expect(tick(resumed, 3585.2), isFalse);
    });

    test('ignores ticks while paused, for another item, or with no outro', () {
      final paused = OutroGuard()..arm('b1', 30);
      expect(tick(paused, 3569.8, playing: false), isFalse);
      expect(tick(paused, 3570.2, playing: false), isFalse);

      final other = OutroGuard()..arm('b1', 30);
      expect(tick(other, 3569.8, key: 'b2'), isFalse);
      expect(tick(other, 3570.2, key: 'b2'), isFalse);

      final off = OutroGuard()..arm('b1', 0);
      expect(tick(off, 3599.0), isFalse);
      expect(tick(off, 3599.5), isFalse);
    });

    test('a small skip forward into the outro does not end the book', () {
      final g = OutroGuard()..arm('b1', 30);
      expect(tick(g, 3566.0), isFalse);
      expect(
        g.shouldFinish(
          key: 'b1',
          positionSec: 3571.0, // a 5 s skip forward across the threshold
          totalDuration: total,
          playing: true,
          seekedRecently: true,
        ),
        isFalse,
      );
      expect(tick(g, 3571.2), isFalse);
    });

    test('a book too short for its outro plays to the end', () {
      final g = OutroGuard()..arm('b1', 60);
      expect(
        g.shouldFinish(
          key: 'b1',
          positionSec: 50,
          totalDuration: 100,
          playing: true,
        ),
        isFalse,
      );
      expect(
        g.shouldFinish(
          key: 'b1',
          positionSec: 50.5,
          totalDuration: 100,
          playing: true,
        ),
        isFalse,
      );
    });

    test('changing the outro of the loaded book re-arms it', () {
      final rules = BookPlaybackRules();
      rules.commit(itemId: 'b1', skip: BookSkip.none);
      expect(rules.outro.armedKey, isNull);
      rules.updateLive('b2', const BookSkip(outro: 30)); // not loaded
      expect(rules.outro.armedKey, isNull);
      rules.updateLive('b1', const BookSkip(outro: 30));
      expect(rules.outro.armedKey, 'b1');
      expect(rules.outro.outroSeconds, 30);
    });
  });

  group('per-book and per-series skip', () {
    test('a book uses its series skip unless it has its own', () async {
      await BookSettingsService.rememberSeries('b1', series);
      await BookSettingsService.rememberSeries('b2', series);
      await BookSettingsService.setSeriesSkip(
        series.id,
        'b1',
        const BookSkip(intro: 20, outro: 40),
      );

      expect(
        await BookSettingsService.skipFor('b1'),
        const BookSkip(intro: 20, outro: 40),
      );
      expect(
        await BookSettingsService.skipFor('b2'),
        const BookSkip(intro: 20, outro: 40),
      );

      await BookSettingsService.setBookSkip('b2', const BookSkip(intro: 5));
      expect(await BookSettingsService.skipFor('b2'), const BookSkip(intro: 5));
      expect(
        await BookSettingsService.skipFor('b1'),
        const BookSkip(intro: 20, outro: 40),
      );
      expect(await BookSettingsService.skipFor('b3'), BookSkip.none);
    });

    test(
      '"whole series" on drops the book override; off stops the series',
      () async {
        await BookSettingsService.rememberSeries('b1', series);
        await BookSettingsService.rememberSeries('b2', series);
        await BookSettingsService.setBookSkip('b1', const BookSkip(outro: 15));
        await BookSettingsService.setSeriesSkip(
          series.id,
          'b1',
          const BookSkip(outro: 25),
        );
        expect(await BookSettingsService.ownSkip('b1'), isNull);
        expect(
          await BookSettingsService.skipFor('b2'),
          const BookSkip(outro: 25),
        );

        await BookSettingsService.setBookSkip(
          'b1',
          const BookSkip(outro: 25),
          clearSeriesId: series.id,
        );
        expect(
          await BookSettingsService.skipFor('b1'),
          const BookSkip(outro: 25),
        );
        expect(await BookSettingsService.seriesSkip(series.id), isNull);
        expect(await BookSettingsService.skipFor('b2'), BookSkip.none);
      },
    );
  });

  group('reset', () {
    test(
      'clears the book and the series speed, keeps the series skip',
      () async {
        await BookSettingsService.rememberSeries('b1', series);
        await BookSettingsService.rememberSeries('b2', series);
        await PlayerSettings.setBookSpeed('b1', 1.5);
        await BookSettingsService.setBookSkip('b1', const BookSkip(intro: 10));
        await BookSettingsService.setSeriesSkip(
          series.id,
          'b2',
          const BookSkip(outro: 30),
        );

        await BookSettingsService.reset('b1');

        expect(await PlayerSettings.getBookSpeed('b1'), isNull);
        expect(await PlayerSettings.getBookSpeed('b2'), isNull);
        // b1's own skip is gone, so it follows the series again.
        expect(await BookSettingsService.ownSkip('b1'), isNull);
        expect(
          await BookSettingsService.skipFor('b1'),
          const BookSkip(outro: 30),
        );
      },
    );

    test('with the series switch on it clears the series skip too', () async {
      await BookSettingsService.rememberSeries('b1', series);
      await BookSettingsService.setSeriesSkip(
        series.id,
        'b1',
        const BookSkip(intro: 10, outro: 30),
      );

      await BookSettingsService.reset('b1', includeSeriesSkip: true);

      expect(await BookSettingsService.skipFor('b1'), BookSkip.none);
      expect(await BookSettingsService.seriesSkip(series.id), isNull);
    });

    test('a speed save still in flight cannot undo a reset', () async {
      await BookSettingsService.rememberSeries('b1', series);
      // AudioPlayerService.setSpeed saves without awaiting.
      final save = PlayerSettings.setBookSpeed('b1', 2.0);
      await BookSettingsService.reset('b1');
      await save;
      await BookSettingsService.settle();
      expect(await PlayerSettings.getBookSpeed('b1'), isNull);
    });
  });

  test('skip values round-trip and are clamped', () {
    expect(BookSkip.decode('15,30'), const BookSkip(intro: 15, outro: 30));
    expect(BookSkip.decode('500,-4'), const BookSkip(intro: 120, outro: 0));
    expect(BookSkip.decode('nonsense'), isNull);
    expect(BookSkip.decode(null), isNull);
    expect(const BookSkip(intro: 5, outro: 0).encode(), '5,0');
  });
}
