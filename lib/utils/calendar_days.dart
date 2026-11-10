// Absorb Plus: day stepping by the calendar (IMP-005, BUG-004).
//
// `DateTime.add(Duration(days: n))` adds n x 24 hours. Across a daylight
// saving change a local midnight then lands on 23:00 the day before (or 01:00),
// and a date key built from it names the wrong day. Building the date from
// its calendar fields can't skip or repeat a day.

/// [date] moved by [days] calendar days, keeping its local time of day.
DateTime addCalendarDays(DateTime date, int days) => date.isUtc
    ? DateTime.utc(date.year, date.month, date.day + days, date.hour,
        date.minute, date.second, date.millisecond, date.microsecond)
    : DateTime(date.year, date.month, date.day + days, date.hour, date.minute,
        date.second, date.millisecond, date.microsecond);

/// Local midnight of the day [date] falls on.
DateTime startOfDay(DateTime date) => DateTime(date.year, date.month, date.day);
