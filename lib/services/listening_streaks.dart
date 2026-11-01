// Absorb Plus: listening streaks, the daily goal and the "this month" summary
// on the Stats screen. Pure functions over data the screen already loads, so
// they can be tested without a server, a clock or a time zone.

/// Listening on a day has to reach this to keep a streak going.
const double kStreakMinSeconds = 5 * 60;

/// Presets offered for the daily goal, in minutes.
const List<int> kDailyGoalPresets = [15, 30, 60];

/// The `YYYY-MM-DD` key the stats day maps use, for the local calendar day
/// that [t] falls on.
String streakDayKey(DateTime t) {
  final d = t.toLocal();
  return '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';
}

final _dayKeyPattern = RegExp(r'^(\d{4})-(\d{1,2})-(\d{1,2})$');

/// The local calendar day a `YYYY-MM-DD` key names, or null for anything else.
DateTime? parseStreakDayKey(String key) {
  final m = _dayKeyPattern.firstMatch(key.trim());
  if (m == null) return null;
  final y = int.parse(m.group(1)!);
  final mo = int.parse(m.group(2)!);
  final d = int.parse(m.group(3)!);
  if (mo < 1 || mo > 12 || d < 1 || d > 31) return null;
  final date = DateTime(y, mo, d);
  // DateTime rolls 2026-02-30 over into March; that isn't a real key.
  if (date.month != mo || date.day != d) return null;
  return date;
}

/// Seconds listened in one entry of a stats day map. The server sends a plain
/// number; some sources send a map with `timeListening` or `totalTime`.
double streakEntrySeconds(Object? value) {
  if (value is num) return value.toDouble();
  if (value is Map) {
    final t = value['timeListening'];
    if (t is num && t > 0) return t.toDouble();
    final total = value['totalTime'];
    if (total is num) return total.toDouble();
  }
  return 0;
}

/// A stats day map (`{'2026-11-01': 1234, ...}`) as seconds per local day.
/// Keys that aren't dates are dropped; two keys naming the same day add up.
Map<DateTime, double> dailySecondsByDay(Map<String, dynamic> dayMap) {
  final out = <DateTime, double>{};
  for (final e in dayMap.entries) {
    final day = parseStreakDayKey(e.key);
    if (day == null) continue;
    final s = streakEntrySeconds(e.value);
    if (s <= 0) continue;
    out[day] = (out[day] ?? 0) + s;
  }
  return out;
}

DateTime _dayOf(DateTime t) {
  final l = t.toLocal();
  return DateTime(l.year, l.month, l.day);
}

/// The day after [d]. Built from the calendar fields rather than by adding a
/// Duration, so a daylight-saving change can't skip or repeat a day.
DateTime _nextDay(DateTime d) => DateTime(d.year, d.month, d.day + 1);

class StreakSummary {
  const StreakSummary({
    required this.current,
    required this.best,
    required this.todaySeconds,
    required this.todayCounts,
  });

  /// Consecutive days up to today (or yesterday, while today is still open).
  final int current;

  /// The longest run ever seen in the data, never less than [current].
  final int best;

  /// Seconds listened today.
  final double todaySeconds;

  /// Whether today already reached the streak minimum.
  final bool todayCounts;

  /// The streak is alive but today still needs listening to extend it.
  bool get atRisk => current > 0 && !todayCounts;
}

/// Current and best streak from a stats day map, in local days.
///
/// A day counts when it has at least [minSeconds]. Today counts once it gets
/// there; until then the streak ending yesterday is still the current one, and
/// it only breaks when today ends without enough listening.
StreakSummary computeStreaks(
  Map<String, dynamic> dayMap, {
  required DateTime now,
  double minSeconds = kStreakMinSeconds,
}) {
  final days = dailySecondsByDay(dayMap);
  final today = _dayOf(now);
  final todaySeconds = days[today] ?? 0;
  final todayCounts = todaySeconds >= minSeconds;
  bool counts(DateTime d) => (days[d] ?? 0) >= minSeconds;

  var current = 0;
  var cursor = todayCounts ? today : DateTime(today.year, today.month, today.day - 1);
  while (counts(cursor)) {
    current++;
    cursor = DateTime(cursor.year, cursor.month, cursor.day - 1);
  }

  final qualifying = days.keys.where(counts).toList()..sort();
  var best = 0;
  var run = 0;
  DateTime? previous;
  for (final d in qualifying) {
    run = previous != null && _nextDay(previous) == d ? run + 1 : 1;
    if (run > best) best = run;
    previous = d;
  }
  if (current > best) best = current;

  return StreakSummary(
    current: current,
    best: best,
    todaySeconds: todaySeconds,
    todayCounts: todayCounts,
  );
}

/// How far today is toward a daily goal, from 0 to 1. A goal of 0 is off.
double dailyGoalProgress(double todaySeconds, int goalMinutes) {
  if (goalMinutes <= 0) return 0;
  final p = todaySeconds / (goalMinutes * 60);
  if (p.isNaN || p < 0) return 0;
  return p > 1 ? 1 : p;
}

/// Seconds listened in the local calendar month [now] falls in, up to today.
double monthSecondsFrom(Map<String, dynamic> dayMap, {required DateTime now}) {
  final today = _dayOf(now);
  var total = 0.0;
  dailySecondsByDay(dayMap).forEach((day, s) {
    if (day.year == today.year && day.month == today.month && !day.isAfter(today)) {
      total += s;
    }
  });
  return total;
}

/// How many of [finishedAtMs] (epoch milliseconds) fall in the local
/// calendar month [now] falls in.
int countFinishedInMonth(Iterable<num> finishedAtMs, {required DateTime now}) {
  final local = now.toLocal();
  var count = 0;
  for (final ms in finishedAtMs) {
    final t = DateTime.fromMillisecondsSinceEpoch(ms.toInt());
    if (t.year == local.year && t.month == local.month) count++;
  }
  return count;
}

class TopMonthBook {
  const TopMonthBook(this.title, this.seconds);
  final String title;
  final double seconds;
}

final _idPattern = RegExp(
  r'^([a-z]{2,4}_)?[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
  caseSensitive: false,
);

DateTime? _sessionStart(Map session) {
  final started = session['startedAt'];
  if (started is num && started > 0) {
    return DateTime.fromMillisecondsSinceEpoch(started.toInt());
  }
  final date = session['date'];
  if (date is String) return parseStreakDayKey(date);
  return null;
}

String _sessionTitle(Map session) {
  final raw = session['displayTitle'];
  if (raw is String && raw.isNotEmpty && !_idPattern.hasMatch(raw)) return raw;
  final meta = session['mediaMetadata'];
  final title = meta is Map ? meta['title'] : null;
  return title is String ? title : '';
}

/// The book listened to most this month, from the listening sessions loaded
/// so far, or null when that can't be told.
///
/// Sessions arrive newest first and a page at a time, so the answer is only
/// trusted when they reach back past the start of the month or [allLoaded]
/// says there are no more.
TopMonthBook? topBookThisMonth(
  List<dynamic> sessions, {
  required DateTime now,
  required bool allLoaded,
}) {
  final local = now.toLocal();
  final monthStart = DateTime(local.year, local.month);
  var reachesMonthStart = allLoaded;
  final byKey = <String, ({String title, double seconds})>{};
  for (final s in sessions) {
    if (s is! Map) continue;
    final start = _sessionStart(s);
    if (start == null) continue;
    if (start.isBefore(monthStart)) {
      reachesMonthStart = true;
      continue;
    }
    if (start.year != local.year || start.month != local.month) continue;
    final title = _sessionTitle(s);
    if (title.isEmpty) continue;
    final seconds = streakEntrySeconds(s['timeListening']);
    if (seconds <= 0) continue;
    final id = s['libraryItemId'];
    final key = id is String && id.isNotEmpty ? id : 'title:$title';
    final prev = byKey[key];
    byKey[key] = (title: prev?.title ?? title, seconds: (prev?.seconds ?? 0) + seconds);
  }
  if (!reachesMonthStart || byKey.isEmpty) return null;
  final top = byKey.values.reduce((a, b) => b.seconds > a.seconds ? b : a);
  return TopMonthBook(top.title, top.seconds);
}
