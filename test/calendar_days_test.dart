import 'package:absorb/utils/calendar_days.dart';
import 'package:absorb/widgets/stats_charts.dart';
import 'package:flutter_test/flutter_test.dart';

// BUG-004: stats stepped days with 24-hour Durations, so across a daylight
// saving change a local midnight became 23:00 the day before. The DST cases
// only bite in a zone that has DST (the owner's machine runs Pacific time).
void main() {
  test('calendar steps always land on midnight of the right day', () {
    final start = DateTime(2025, 7, 14);
    for (var k = 0; k < 400; k++) {
      final d = addCalendarDays(start, k);
      expect(d, DateTime(2025, 7, 14 + k), reason: 'step $k');
      expect(d.hour, 0, reason: 'step $k');
    }
  });

  test('stepping back keeps the time of day and the calendar date', () {
    final now = DateTime(2026, 11, 10, 23, 30);
    expect(addCalendarDays(now, -10), DateTime(2026, 10, 31, 23, 30));
    expect(addCalendarDays(DateTime.utc(2026, 3, 1), -1), DateTime.utc(2026, 2, 28));
  });

  test('the heatmap grid starts on a Monday midnight 52 weeks back', () {
    final start = StatsHeatmap.heatmapStart(DateTime(2026, 7, 15, 12));
    expect(start, DateTime(2025, 7, 14));
    expect(start.weekday, DateTime.monday);
    // Row 26 falls in winter: it must still name 2026-01-12, not the 11th.
    expect(addCalendarDays(start, 26 * 7), DateTime(2026, 1, 12));
  });
}
