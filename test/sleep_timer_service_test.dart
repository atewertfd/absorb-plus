// SleepTimerService reaches the player and the cast session through their
// singletons and has no seam to swap them, so in a test nothing is ever
// "playing". These tests cover what is observable from that state: arming,
// extending and cancelling each mode, the countdown holding while idle, and
// the auto sleep window logic. Expiry (pause, fade, chime, rewind) needs a
// playing player and is not reachable here.
import 'package:absorb/services/sleep_timer_service.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Shake detection opens an accelerometer platform stream, so every test
/// turns it off. Extra prefs are layered on top.
void _prefs([Map<String, Object> extra = const {}]) {
  SharedPreferences.setMockInitialValues({'shakeMode': 'off', ...extra});
}

/// A window of [before] minutes before now to [after] minutes after now,
/// wrapped around midnight. Offsets are an hour or more so a test running
/// across a minute boundary can't flip the answer.
AutoSleepSettings _windowAroundNow(
  int before,
  int after, {
  bool enabled = true,
  int durationMinutes = 20,
  bool useEndOfChapter = false,
}) {
  final now = DateTime.now();
  final nowMin = now.hour * 60 + now.minute;
  final start = (nowMin + before) % 1440;
  final end = (nowMin + after) % 1440;
  return AutoSleepSettings(
    enabled: enabled,
    startHour: start ~/ 60,
    startMinute: start % 60,
    endHour: end ~/ 60,
    endMinute: end % 60,
    durationMinutes: durationMinutes,
    useEndOfChapter: useEndOfChapter,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final timer = SleepTimerService();
  final toasts = <String>[];

  setUp(() {
    _prefs();
    toasts.clear();
    timer.onToast = toasts.add;
  });

  tearDown(() {
    // The service is a process-wide singleton: leave it off, with auto sleep
    // disabled and not dismissed, for the next test.
    timer.updateAutoSleepSettings(const AutoSleepSettings());
    timer.cancel();
    timer.resetDismiss();
    timer.onToast = null;
  });

  group('AutoSleepSettings', () {
    test('defaults are a disabled 22:00-06:00, 30 minute timed window', () {
      const s = AutoSleepSettings();
      expect(s.enabled, isFalse);
      expect(s.startLabel, '10:00 PM');
      expect(s.endLabel, '6:00 AM');
      expect(s.durationMinutes, 30);
      expect(s.useEndOfChapter, isFalse);
    });

    test('labels use 12-hour time with midnight and noon as 12', () {
      const s = AutoSleepSettings(
        startHour: 0,
        startMinute: 5,
        endHour: 12,
        endMinute: 30,
      );
      expect(s.startLabel, '12:05 AM');
      expect(s.endLabel, '12:30 PM');
      expect(
        const AutoSleepSettings(startHour: 13, startMinute: 0).startLabel,
        '1:00 PM',
      );
    });

    test('copyWith replaces only the given fields', () {
      const s = AutoSleepSettings(durationMinutes: 45, startHour: 21);
      final c = s.copyWith(enabled: true, useEndOfChapter: true);
      expect(c.enabled, isTrue);
      expect(c.useEndOfChapter, isTrue);
      expect(c.durationMinutes, 45);
      expect(c.startHour, 21);
      expect(c.endHour, 6);
    });

    test('isInWindow is true inside a window around now', () {
      expect(_windowAroundNow(-60, 60).isInWindow(), isTrue);
    });

    test('isInWindow is false for a window that ended before now', () {
      expect(_windowAroundNow(-180, -60).isInWindow(), isFalse);
    });

    test('isInWindow is false for a window that opens later', () {
      expect(_windowAroundNow(60, 180).isInWindow(), isFalse);
    });

    test('isInWindow handles a window that wraps past midnight', () {
      // Start after end: the window is everything except [end, start).
      // Built relative to now so one of the two always crosses midnight.
      expect(_windowAroundNow(-60, -120).isInWindow(), isTrue);
      expect(_windowAroundNow(60, -60).isInWindow(), isFalse);
    });

    test('isInWindow treats the end minute as outside the window', () {
      final now = DateTime.now();
      // Same-day window that ends exactly now (start an hour back, clamped
      // so it stays a same-day window).
      final startMin = (now.hour * 60 + now.minute - 60).clamp(0, 1439);
      final s = AutoSleepSettings(
        startHour: startMin ~/ 60,
        startMinute: startMin % 60,
        endHour: now.hour,
        endMinute: now.minute,
      );
      // Re-read the clock: if the minute rolled over the window is still
      // behind us, so the answer is the same.
      expect(s.isInWindow(), isFalse);
    });

    test('load falls back to defaults when nothing is saved', () async {
      final s = await AutoSleepSettings.load();
      expect(s.enabled, isFalse);
      expect(s.startHour, 22);
      expect(s.endHour, 6);
      expect(s.durationMinutes, 30);
      expect(s.useEndOfChapter, isFalse);
    });

    test('save then load round-trips every field', () async {
      const s = AutoSleepSettings(
        enabled: true,
        startHour: 23,
        startMinute: 15,
        endHour: 5,
        endMinute: 45,
        durationMinutes: 50,
        useEndOfChapter: true,
      );
      await s.save();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('autoSleep_enabled'), isTrue);
      expect(prefs.getInt('autoSleep_duration'), 50);

      final loaded = await AutoSleepSettings.load();
      expect(loaded.enabled, isTrue);
      expect(loaded.startHour, 23);
      expect(loaded.startMinute, 15);
      expect(loaded.endHour, 5);
      expect(loaded.endMinute, 45);
      expect(loaded.durationMinutes, 50);
      expect(loaded.useEndOfChapter, isTrue);
    });
  });

  group('time mode', () {
    test('setTimeSleep arms the timer with the full duration', () {
      fakeAsync((async) {
        var notified = 0;
        void listener() => notified++;
        timer.addListener(listener);

        timer.setTimeSleep(const Duration(minutes: 10));
        async.flushMicrotasks();

        expect(timer.mode, SleepTimerMode.time);
        expect(timer.isActive, isTrue);
        expect(timer.timeRemaining, const Duration(minutes: 10));
        expect(timer.initialDuration, const Duration(minutes: 10));
        expect(timer.timeProgress, 1.0);
        expect(timer.displayLabel, '10m');
        expect(timer.isFadingOut, isFalse);
        expect(timer.isInWarningWindow, isFalse);
        expect(notified, greaterThan(0));
        expect(async.periodicTimerCount, 1);

        timer.removeListener(listener);
      });
    });

    test('a timer under a minute reads <1m', () {
      fakeAsync((async) {
        timer.setTimeSleep(const Duration(seconds: 30));
        async.flushMicrotasks();
        expect(timer.displayLabel, '<1m');
      });
    });

    test('the countdown holds while nothing is playing', () {
      fakeAsync((async) {
        timer.setTimeSleep(const Duration(minutes: 1));
        async.flushMicrotasks();

        async.elapse(const Duration(minutes: 5));

        // Paused (or never started) playback doesn't burn timer time, and an
        // idle timer never expires on its own.
        expect(timer.isActive, isTrue);
        expect(timer.timeRemaining, const Duration(minutes: 1));
        expect(timer.isInWarningWindow, isFalse);
        expect(toasts, isEmpty);
      });
    });

    test('setting a new duration replaces the running timer', () {
      fakeAsync((async) {
        timer.setTimeSleep(const Duration(minutes: 10));
        async.flushMicrotasks();
        timer.setTimeSleep(const Duration(minutes: 45));
        async.flushMicrotasks();

        expect(timer.timeRemaining, const Duration(minutes: 45));
        expect(timer.initialDuration, const Duration(minutes: 45));
        expect(async.periodicTimerCount, 1);
      });
    });

    test('addTime extends the remaining time but not the initial one', () {
      fakeAsync((async) {
        timer.setTimeSleep(const Duration(minutes: 10));
        async.flushMicrotasks();
        var notified = 0;
        void listener() => notified++;
        timer.addListener(listener);

        timer.addTime(const Duration(minutes: 5));

        expect(timer.timeRemaining, const Duration(minutes: 15));
        expect(timer.initialDuration, const Duration(minutes: 10));
        expect(timer.displayLabel, '15m');
        // Progress is clamped, not over 100%.
        expect(timer.timeProgress, 1.0);
        expect(notified, 1);
        expect(async.periodicTimerCount, 1);

        timer.removeListener(listener);
      });
    });

    test('addTime does nothing when no time timer is running', () {
      timer.addTime(const Duration(minutes: 5));
      expect(timer.isActive, isFalse);
      expect(timer.timeRemaining, Duration.zero);
    });

    test('cancel turns the timer off and stops the countdown', () {
      fakeAsync((async) {
        timer.setTimeSleep(const Duration(minutes: 10));
        async.flushMicrotasks();
        var notified = 0;
        void listener() => notified++;
        timer.addListener(listener);

        timer.cancel();

        expect(timer.mode, SleepTimerMode.off);
        expect(timer.isActive, isFalse);
        expect(timer.timeRemaining, Duration.zero);
        expect(timer.displayLabel, '');
        expect(notified, 1);
        expect(async.periodicTimerCount, 0);

        timer.removeListener(listener);
      });
    });

    test('backgrounding and foregrounding keep the countdown armed', () {
      fakeAsync((async) {
        timer.setTimeSleep(const Duration(minutes: 10));
        async.flushMicrotasks();

        timer.onAppBackgrounded();
        expect(async.periodicTimerCount, 1);
        async.elapse(const Duration(seconds: 30));
        timer.onAppForegrounded();
        async.flushMicrotasks();
        expect(async.periodicTimerCount, 1);

        expect(timer.isActive, isTrue);
        expect(timer.timeRemaining, const Duration(minutes: 10));
      });
    });

    test('media-button snooze is not consumed outside the wind-down', () {
      fakeAsync((async) {
        _prefs({'sleepButtonMode': 'addTime'});
        timer.setTimeSleep(const Duration(minutes: 10));
        async.flushMicrotasks();

        bool? consumed;
        timer.snoozeFromMediaButton().then((v) => consumed = v);
        async.flushMicrotasks();

        expect(consumed, isFalse);
        expect(timer.timeRemaining, const Duration(minutes: 10));
      });
    });
  });

  group('chapter and episode modes', () {
    test('chapter sleep stays off when no chapters are loaded', () {
      timer.setChapterSleep(1);
      expect(timer.isActive, isFalse);
      expect(timer.mode, SleepTimerMode.off);
      expect(timer.chaptersRemaining, 0);
    });

    test('addChapter does nothing outside chapter mode', () {
      timer.addChapter();
      expect(timer.isActive, isFalse);
      expect(timer.chaptersRemaining, 0);
    });

    test('episode sleep arms and reads "ep" until cancelled', () {
      timer.setEpisodeSleep();
      expect(timer.mode, SleepTimerMode.episodes);
      expect(timer.isActive, isTrue);
      expect(timer.displayLabel, 'ep');

      timer.cancel();
      expect(timer.isActive, isFalse);
    });

    test('a time timer replaces an episode timer', () {
      fakeAsync((async) {
        timer.setEpisodeSleep();
        timer.setTimeSleep(const Duration(minutes: 5));
        async.flushMicrotasks();
        expect(timer.mode, SleepTimerMode.time);
      });
    });
  });

  group('sleep rewind undo', () {
    test('there is nothing to undo when the timer has not rewound', () {
      expect(
        timer.takeSleepRewindUndo('li_book', const Duration(minutes: 3)),
        isNull,
      );
      expect(timer.takeSleepRewindUndo(null, Duration.zero), isNull);
    });
  });

  group('auto sleep', () {
    test('disabled settings never start a timer', () {
      fakeAsync((async) {
        timer.updateAutoSleepSettings(
          _windowAroundNow(-60, 60, enabled: false),
        );
        async.flushMicrotasks();
        timer.checkAutoSleep();
        async.flushMicrotasks();

        expect(timer.isActive, isFalse);
        expect(toasts, isEmpty);
      });
    });

    test('inside the window a timed auto sleep starts with its duration', () {
      fakeAsync((async) {
        timer.updateAutoSleepSettings(_windowAroundNow(-60, 60));
        async.flushMicrotasks();

        expect(timer.mode, SleepTimerMode.time);
        expect(timer.timeRemaining, const Duration(minutes: 20));
        expect(toasts, ['Auto sleep: 20m timer started']);
      });
    });

    test('loadAutoSleepSettings reads saved settings and acts on them', () {
      fakeAsync((async) {
        _windowAroundNow(-60, 60, durationMinutes: 25).save();
        async.flushMicrotasks();
        timer.loadAutoSleepSettings();
        async.flushMicrotasks();

        expect(timer.autoSleepSettings?.enabled, isTrue);
        expect(timer.autoSleepSettings?.durationMinutes, 25);
        expect(timer.timeRemaining, const Duration(minutes: 25));
      });
    });

    test('outside the window nothing starts, even when the window opens '
        'while nothing is playing', () {
      fakeAsync((async) {
        timer.updateAutoSleepSettings(_windowAroundNow(60, 180));
        async.flushMicrotasks();
        expect(timer.isActive, isFalse);
        // A one-shot boundary timer waits for the window to open.
        expect(async.nonPeriodicTimerCount, 1);

        async.elapse(const Duration(hours: 25));

        expect(timer.isActive, isFalse);
        expect(toasts, isEmpty);
      });
    });

    test('a running auto-started timer is not started twice', () {
      fakeAsync((async) {
        timer.updateAutoSleepSettings(_windowAroundNow(-60, 60));
        async.flushMicrotasks();
        timer.addTime(const Duration(minutes: 7));

        timer.checkAutoSleep();
        async.flushMicrotasks();

        expect(timer.timeRemaining, const Duration(minutes: 27));
        expect(toasts, hasLength(1));
      });
    });

    test('changing the settings restarts an auto-started timer', () {
      fakeAsync((async) {
        timer.updateAutoSleepSettings(_windowAroundNow(-60, 60));
        async.flushMicrotasks();

        timer.updateAutoSleepSettings(
          _windowAroundNow(-60, 60, durationMinutes: 40),
        );
        async.flushMicrotasks();

        expect(timer.timeRemaining, const Duration(minutes: 40));
        expect(timer.initialDuration, const Duration(minutes: 40));
      });
    });

    test('changing the settings leaves a manual timer alone', () {
      fakeAsync((async) {
        timer.setTimeSleep(const Duration(minutes: 15));
        async.flushMicrotasks();

        timer.updateAutoSleepSettings(_windowAroundNow(-60, 60));
        async.flushMicrotasks();

        expect(timer.timeRemaining, const Duration(minutes: 15));
        expect(toasts, isEmpty);
      });
    });

    test('a user cancel suppresses auto sleep until resetDismiss', () {
      fakeAsync((async) {
        timer.updateAutoSleepSettings(_windowAroundNow(-60, 60));
        async.flushMicrotasks();
        expect(timer.isActive, isTrue);

        timer.cancelByUser();
        timer.checkAutoSleep();
        async.flushMicrotasks();
        expect(timer.isActive, isFalse);

        timer.resetDismiss();
        timer.checkAutoSleep();
        async.flushMicrotasks();
        expect(timer.isActive, isTrue);
        expect(timer.timeRemaining, const Duration(minutes: 20));
      });
    });

    test('a plain cancel does not suppress auto sleep', () {
      fakeAsync((async) {
        timer.updateAutoSleepSettings(_windowAroundNow(-60, 60));
        async.flushMicrotasks();

        timer.cancel();
        timer.checkAutoSleep();
        async.flushMicrotasks();

        expect(timer.isActive, isTrue);
      });
    });

    test('end-of-chapter auto sleep with no chapters stays off, but still '
        'announces that it started (current behavior)', () {
      fakeAsync((async) {
        timer.updateAutoSleepSettings(
          _windowAroundNow(-60, 60, useEndOfChapter: true),
        );
        async.flushMicrotasks();

        expect(timer.isActive, isFalse);
        // setChapterSleep refuses to arm without chapters, but checkAutoSleep
        // toasts unconditionally afterwards.
        expect(toasts, ['Auto sleep: end of chapter timer started']);
      });
    });
  });
}
