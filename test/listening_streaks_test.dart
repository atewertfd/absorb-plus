import 'package:absorb/services/listening_streaks.dart';
import 'package:flutter_test/flutter_test.dart';

/// Builds a day map with [seconds] on each of [days] counted back from [end]
/// (0 = end itself).
Map<String, dynamic> daysBack(DateTime end, List<int> days, {double seconds = 600}) => {
      for (final i in days) streakDayKey(DateTime(end.year, end.month, end.day - i)): seconds,
    };

void main() {
  final noon = DateTime(2026, 11, 10, 12);

  group('day keys', () {
    test('key uses the local calendar day', () {
      expect(streakDayKey(DateTime(2026, 1, 5, 23, 59)), '2026-01-05');
      expect(streakDayKey(DateTime(2026, 1, 6, 0, 0, 1)), '2026-01-06');
    });

    test('a UTC instant is keyed by the local day it falls on', () {
      final utc = DateTime.utc(2026, 6, 30, 23, 30);
      expect(streakDayKey(utc), streakDayKey(utc.toLocal()));
      final local = utc.toLocal();
      expect(streakDayKey(utc),
          '${local.year}-${local.month.toString().padLeft(2, '0')}-${local.day.toString().padLeft(2, '0')}');
    });

    test('parse accepts real dates only', () {
      expect(parseStreakDayKey('2026-11-01'), DateTime(2026, 11, 1));
      expect(parseStreakDayKey('2026-2-3'), DateTime(2026, 2, 3));
      expect(parseStreakDayKey('2026-02-30'), isNull);
      expect(parseStreakDayKey('2026-13-01'), isNull);
      expect(parseStreakDayKey('total'), isNull);
      expect(parseStreakDayKey(''), isNull);
    });

    test('entry seconds read numbers and maps', () {
      expect(streakEntrySeconds(42), 42);
      expect(streakEntrySeconds({'timeListening': 30}), 30);
      expect(streakEntrySeconds({'timeListening': 0, 'totalTime': 90}), 90);
      expect(streakEntrySeconds('x'), 0);
      expect(streakEntrySeconds(null), 0);
    });
  });

  group('current streak', () {
    test('empty data has no streak', () {
      final s = computeStreaks({}, now: noon);
      expect(s.current, 0);
      expect(s.best, 0);
      expect(s.todayCounts, isFalse);
      expect(s.atRisk, isFalse);
    });

    test('today counts once it reaches five minutes', () {
      final s = computeStreaks(daysBack(noon, [0, 1, 2]), now: noon);
      expect(s.current, 3);
      expect(s.todayCounts, isTrue);
      expect(s.atRisk, isFalse);
    });

    test('a streak survives today until the day ends', () {
      final s = computeStreaks(daysBack(noon, [1, 2, 3, 4]), now: noon);
      expect(s.current, 4);
      expect(s.todayCounts, isFalse);
      expect(s.atRisk, isTrue);
    });

    test('a little listening today does not count yet but keeps the streak', () {
      final map = {...daysBack(noon, [1, 2]), streakDayKey(noon): 120};
      final s = computeStreaks(map, now: noon);
      expect(s.current, 2);
      expect(s.todaySeconds, 120);
      expect(s.todayCounts, isFalse);
    });

    test('exactly five minutes counts, just under does not', () {
      expect(computeStreaks({streakDayKey(noon): 300}, now: noon).current, 1);
      expect(computeStreaks({streakDayKey(noon): 299}, now: noon).current, 0);
    });

    test('missing yesterday breaks the streak', () {
      final s = computeStreaks(daysBack(noon, [2, 3, 4]), now: noon);
      expect(s.current, 0);
      expect(s.best, 3);
    });

    test('a short day in the middle breaks the run', () {
      final map = {
        ...daysBack(noon, [0, 1, 3, 4, 5]),
        streakDayKey(DateTime(2026, 11, 8)): 200,
      };
      final s = computeStreaks(map, now: noon);
      expect(s.current, 2);
      expect(s.best, 3);
    });

    test('just after midnight yesterday still carries the streak', () {
      final justAfter = DateTime(2026, 11, 10, 0, 1);
      final s = computeStreaks(daysBack(justAfter, [1, 2]), now: justAfter);
      expect(s.current, 2);
      expect(s.atRisk, isTrue);
    });

    test('just before midnight today still counts as today', () {
      final late = DateTime(2026, 11, 10, 23, 59, 59);
      final s = computeStreaks(daysBack(late, [0, 1]), now: late);
      expect(s.current, 2);
      expect(s.todayCounts, isTrue);
    });

    test('runs across month and year ends', () {
      final jan2 = DateTime(2027, 1, 2, 9);
      final s = computeStreaks(daysBack(jan2, [0, 1, 2, 3, 4]), now: jan2);
      expect(s.current, 5); // Dec 29 .. Jan 2
    });

    test('runs across a leap day', () {
      final mar1 = DateTime(2028, 3, 1, 9);
      final s = computeStreaks(daysBack(mar1, [0, 1, 2]), now: mar1);
      expect(s.current, 3); // Feb 28, Feb 29, Mar 1
    });

    test('runs across daylight-saving changes', () {
      // Spring forward (US and EU) and fall back (EU and US) in 2026.
      for (final now in [
        DateTime(2026, 3, 10, 12),
        DateTime(2026, 3, 31, 12),
        DateTime(2026, 10, 27, 12),
        DateTime(2026, 11, 3, 12),
      ]) {
        final s = computeStreaks(daysBack(now, [0, 1, 2, 3, 4, 5]), now: now);
        expect(s.current, 6, reason: 'around $now');
        expect(s.best, 6, reason: 'around $now');
      }
    });

    test('a UTC clock is read as its local day', () {
      final utcNow = noon.toUtc();
      final s = computeStreaks(daysBack(noon, [0, 1]), now: utcNow);
      expect(s.current, 2);
    });

    test('map entries and odd keys are handled', () {
      final map = <String, dynamic>{
        streakDayKey(noon): {'timeListening': 400},
        streakDayKey(DateTime(2026, 11, 9)): {'totalTime': 400},
        'not-a-day': 9999,
      };
      expect(computeStreaks(map, now: noon).current, 2);
    });

    test('custom threshold is honoured', () {
      final map = daysBack(noon, [0, 1], seconds: 60);
      expect(computeStreaks(map, now: noon).current, 0);
      expect(computeStreaks(map, now: noon, minSeconds: 1).current, 2);
    });
  });

  group('best streak', () {
    test('picks the longest run in the history', () {
      final map = {
        ...daysBack(DateTime(2026, 5, 20), [0, 1, 2, 3, 4, 5, 6]), // 7 days in May
        ...daysBack(DateTime(2026, 8, 3), [0, 1]), // 2 days
        ...daysBack(noon, [0, 1, 2]), // current 3
      };
      final s = computeStreaks(map, now: noon);
      expect(s.current, 3);
      expect(s.best, 7);
    });

    test('is never below the current streak', () {
      final s = computeStreaks(daysBack(noon, [1, 2, 3, 4, 5]), now: noon);
      expect(s.best, s.current);
      expect(s.best, 5);
    });

    test('unsorted keys still give the right answer', () {
      final map = <String, dynamic>{
        '2026-04-03': 600,
        '2026-04-01': 600,
        '2026-04-02': 600,
        '2026-03-30': 600,
      };
      expect(computeStreaks(map, now: noon).best, 3);
    });
  });

  group('daily goal progress', () {
    test('off goal is zero progress', () {
      expect(dailyGoalProgress(9999, 0), 0);
    });

    test('scales and caps at one', () {
      expect(dailyGoalProgress(15 * 60, 30), 0.5);
      expect(dailyGoalProgress(90 * 60, 60), 1);
      expect(dailyGoalProgress(0, 15), 0);
    });

    test('presets are 15, 30 and 60 minutes', () {
      expect(kDailyGoalPresets, [15, 30, 60]);
    });

    test('typed goals accept minutes and h:mm', () {
      expect(parseDailyGoalMinutes('45'), 45);
      expect(parseDailyGoalMinutes(' 90 min '), 90);
      expect(parseDailyGoalMinutes('20m'), 20);
      expect(parseDailyGoalMinutes('1:30'), 90);
      expect(parseDailyGoalMinutes('2.05'), 125);
    });

    test('typed goals reject nonsense and clamp to a day', () {
      expect(parseDailyGoalMinutes(''), isNull);
      expect(parseDailyGoalMinutes('0'), isNull);
      expect(parseDailyGoalMinutes('0:00'), isNull);
      expect(parseDailyGoalMinutes('-5'), isNull);
      expect(parseDailyGoalMinutes('abc'), isNull);
      expect(parseDailyGoalMinutes('1:75'), isNull);
      expect(parseDailyGoalMinutes('5000'), kMaxDailyGoalMinutes);
      expect(parseDailyGoalMinutes('30:00'), kMaxDailyGoalMinutes);
    });
  });

  group('this month', () {
    test('sums only the calendar month up to today', () {
      final map = <String, dynamic>{
        '2026-10-31': 1000, // last month
        '2026-11-01': 600,
        '2026-11-10': 400,
        '2026-11-11': 5000, // tomorrow (clock skew), not counted
        '2025-11-05': 7000, // same month last year
      };
      expect(monthSecondsFrom(map, now: noon), 1000);
    });

    test('first minute of the month starts fresh', () {
      final map = <String, dynamic>{'2026-10-31': 1000, '2026-11-01': 60};
      expect(monthSecondsFrom(map, now: DateTime(2026, 11, 1, 0, 1)), 60);
    });

    test('counts finished books by local month', () {
      final ms = [
        DateTime(2026, 11, 1, 0, 0, 1).millisecondsSinceEpoch,
        DateTime(2026, 11, 9, 22).millisecondsSinceEpoch,
        DateTime(2026, 10, 31, 23, 59).millisecondsSinceEpoch,
        DateTime(2025, 11, 9).millisecondsSinceEpoch,
      ];
      expect(countFinishedInMonth(ms, now: noon), 2);
      expect(countFinishedInMonth(const [], now: noon), 0);
    });
  });

  group('top book this month', () {
    Map<String, dynamic> session(String id, String title, DateTime start, double seconds) => {
          'libraryItemId': id,
          'displayTitle': title,
          'startedAt': start.millisecondsSinceEpoch,
          'timeListening': seconds,
        };

    test('sums sessions per book once the month is covered', () {
      final sessions = [
        session('a', 'Alpha', DateTime(2026, 11, 9), 600),
        session('b', 'Beta', DateTime(2026, 11, 8), 900),
        session('a', 'Alpha', DateTime(2026, 11, 2), 600),
        session('c', 'Old', DateTime(2026, 10, 30), 99999),
      ];
      final top = topBookThisMonth(sessions, now: noon, allLoaded: false);
      expect(top?.title, 'Alpha');
      expect(top?.seconds, 1200);
    });

    test('unknown while older sessions might still hold this month', () {
      final sessions = [
        session('a', 'Alpha', DateTime(2026, 11, 9), 600),
        session('b', 'Beta', DateTime(2026, 11, 3), 900),
      ];
      expect(topBookThisMonth(sessions, now: noon, allLoaded: false), isNull);
      expect(topBookThisMonth(sessions, now: noon, allLoaded: true)?.title, 'Beta');
    });

    test('nothing this month gives no top book', () {
      final sessions = [session('c', 'Old', DateTime(2026, 10, 30), 600)];
      expect(topBookThisMonth(sessions, now: noon, allLoaded: true), isNull);
      expect(topBookThisMonth(const [], now: noon, allLoaded: true), isNull);
    });

    test('falls back to metadata title and the date field', () {
      final sessions = [
        {
          'libraryItemId': 'li_0f0e0d0c-1111-2222-3333-444455556666',
          'displayTitle': 'li_0f0e0d0c-1111-2222-3333-444455556666',
          'mediaMetadata': {'title': 'Gamma'},
          'date': '2026-11-04',
          'timeListening': 300,
        },
        {'date': '2026-10-01', 'timeListening': 1},
      ];
      expect(topBookThisMonth(sessions, now: noon, allLoaded: false)?.title, 'Gamma');
    });

    test('a session started just before midnight on the last day of last month is not counted', () {
      final sessions = [
        session('a', 'Alpha', DateTime(2026, 11, 1, 0, 5), 300),
        session('b', 'Beta', DateTime(2026, 10, 31, 23, 55), 5000),
      ];
      expect(topBookThisMonth(sessions, now: noon, allLoaded: false)?.title, 'Alpha');
    });
  });
}
