import 'package:absorb/screens/settings_load.dart';
import 'package:absorb/services/player_settings.dart';
import 'package:absorb/services/sleep_timer_service.dart';
import 'package:absorb/services/update_check_policy.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Every setting gets a value different from its default and from its
/// same-typed neighbours, so a load that lands in the wrong field (the old
/// positional `results[N]` bug) shows up as a wrong value here.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));

  Future<SettingsLoad> loadWithFakeDevice() => SettingsLoad.load(
        downloadLocationLabel: Future.value('D:/Books'),
        totalDownloadSize: Future.value(4242),
        deviceStorage: Future.value({'totalBytes': 9, 'availableBytes': 4}),
        appVersion: Future.value('9.8.7+654'),
      );

  test('each setting lands in its own named field', () async {
    await const AutoRewindSettings(minRewind: 2.5, maxRewind: 44).save();
    await PlayerSettings.setDefaultSpeed(1.35);
    await PlayerSettings.setWifiOnlyDownloads(true);
    await PlayerSettings.setRollingDownloadCount(7);
    await PlayerSettings.setRollingDownloadDeleteFinished(true);
    await PlayerSettings.setCardScrubberMode(CardScrubberMode.locked);
    await PlayerSettings.setNotificationChapterProgress(true);
    await PlayerSettings.setSpeedAdjustedTime(false);
    await PlayerSettings.setForwardSkip(45);
    await PlayerSettings.setBackSkip(15);
    await PlayerSettings.setShakeMode('resetTimer');
    await PlayerSettings.setResetSleepOnPause(true);
    await PlayerSettings.setSleepFadeOut(false);
    await PlayerSettings.setShakeAddMinutes(11);
    await PlayerSettings.setBookQueueMode('book-mode');
    await PlayerSettings.setQueueAutoDownload(true);
    await PlayerSettings.setMergeAbsorbingLibraries(true);
    await PlayerSettings.setMaxConcurrentDownloads(4);
    await PlayerSettings.setHideEbookOnly(true);
    await PlayerSettings.setShowGoodreadsButton(true);
    await PlayerSettings.setLoggingEnabled(true);
    await PlayerSettings.setFullScreenPlayer(true);
    await PlayerSettings.setThemeMode('light');
    await PlayerSettings.setSnappyTransitions(true);
    await const AutoSleepSettings(startHour: 21, durationMinutes: 17).save();
    await PlayerSettings.setStreamingCacheSizeMb(512);
    await PlayerSettings.setLocalServerEnabled(true);
    await PlayerSettings.setLocalServerUrl('http://local.test');
    await PlayerSettings.setAutoDownloadOnStream(true);
    await PlayerSettings.setStartScreen(3);
    await PlayerSettings.setPodcastQueueMode('podcast-mode');
    await PlayerSettings.setRectangleCovers(true);
    await PlayerSettings.setTrustAllCerts(true);
    await PlayerSettings.setCoverPlayButton(true);
    await PlayerSettings.setSkipChapterBarrier(false);
    await PlayerSettings.setShowExplicitBadge(false);
    await PlayerSettings.setSleepFadeDuration(23);
    await PlayerSettings.setSleepChime(true);
    await PlayerSettings.setSleepChimeVolume(0.75);
    await PlayerSettings.setShakeSensitivity('high');
    await PlayerSettings.setLanguage('de');
    await PlayerSettings.setQueuePlaylistId('playlist-1');
    await PlayerSettings.setMediaControlsSpeedBookmark(true);
    await PlayerSettings.setLockSeekBar(true);
    await PlayerSettings.setCardBackground('blur');
    await PlayerSettings.setProgressTextScale(1.25);
    await PlayerSettings.setUpdateCheckFrequency(UpdateCheckFrequency.daily);

    final r = await loadWithFakeDevice();

    expect(r.rewindSettings.minRewind, 2.5);
    expect(r.rewindSettings.maxRewind, 44);
    expect(r.defaultSpeed, 1.35);
    expect(r.wifiOnlyDownloads, isTrue);
    expect(r.rollingDownloadCount, 7);
    expect(r.rollingDownloadDeleteFinished, isTrue);
    expect(r.cardScrubberMode, CardScrubberMode.locked);
    expect(r.notifChapterProgress, isTrue);
    expect(r.speedAdjustedTime, isFalse);
    expect(r.forwardSkip, 45);
    expect(r.backSkip, 15);
    expect(r.shakeMode, 'resetTimer');
    expect(r.resetSleepOnPause, isTrue);
    expect(r.sleepFadeOut, isFalse);
    expect(r.shakeAddMinutes, 11);
    expect(r.bookQueueMode, 'book-mode');
    expect(r.queueAutoDownload, isTrue);
    expect(r.mergeAbsorbingLibraries, isTrue);
    expect(r.maxConcurrentDownloads, 4);
    expect(r.hideEbookOnly, isTrue);
    expect(r.showGoodreadsButton, isTrue);
    expect(r.loggingEnabled, isTrue);
    expect(r.fullScreenPlayer, isTrue);
    expect(r.themeMode, 'light');
    expect(r.snappyTransitions, isTrue);
    expect(r.downloadLocationLabel, 'D:/Books');
    expect(r.totalDownloadSizeBytes, 4242);
    expect(r.deviceStorage, {'totalBytes': 9, 'availableBytes': 4});
    expect(r.autoSleepSettings.startHour, 21);
    expect(r.autoSleepSettings.durationMinutes, 17);
    expect(r.appVersion, '9.8.7+654');
    expect(r.streamingCacheSizeMb, 512);
    expect(r.localServerEnabled, isTrue);
    expect(r.localServerUrl, 'http://local.test');
    expect(r.autoDownloadOnStream, isTrue);
    expect(r.startScreen, 3);
    expect(r.podcastQueueMode, 'podcast-mode');
    expect(r.rectangleCovers, isTrue);
    expect(r.trustAllCerts, isTrue);
    expect(r.coverPlayButton, isTrue);
    expect(r.skipChapterBarrier, isFalse);
    expect(r.showExplicitBadge, isFalse);
    expect(r.sleepFadeDuration, 23);
    expect(r.sleepChime, isTrue);
    expect(r.sleepChimeVolume, 0.75);
    expect(r.shakeSensitivity, 'high');
    expect(r.language, 'de');
    expect(r.queuePlaylistId, 'playlist-1');
    expect(r.notifSpeedBookmark, isTrue);
    expect(r.lockSeekBar, isTrue);
    expect(r.cardBackground, 'blur');
    expect(r.progressTextScale, 1.25);
    expect(r.updateCheckFrequency, UpdateCheckFrequency.daily);
  });

  test('empty prefs give the same defaults as before', () async {
    final r = await loadWithFakeDevice();

    expect(r.defaultSpeed, 1.0);
    expect(r.wifiOnlyDownloads, isFalse);
    expect(r.rollingDownloadCount, 3);
    expect(r.speedAdjustedTime, isTrue);
    expect(r.forwardSkip, 30);
    expect(r.backSkip, 10);
    expect(r.shakeMode, 'addTime');
    expect(r.sleepFadeOut, isTrue);
    expect(r.shakeAddMinutes, 5);
    expect(r.maxConcurrentDownloads, 1);
    expect(r.themeMode, 'dark');
    expect(r.streamingCacheSizeMb, 256);
    expect(r.localServerUrl, '');
    expect(r.startScreen, 2);
    expect(r.skipChapterBarrier, isTrue);
    expect(r.showExplicitBadge, isTrue);
    expect(r.sleepFadeDuration, 30);
    expect(r.sleepChimeVolume, 2.0);
    expect(r.shakeSensitivity, 'medium');
    expect(r.language, '');
    expect(r.queuePlaylistId, isNull);
    expect(r.progressTextScale, 1.0);
  });
}
