import '../services/download_service.dart';
import '../services/player_settings.dart';
import '../services/sleep_timer_service.dart';
import '../services/update_check_policy.dart';
import '../services/update_checker_service.dart';

/// The settings the Settings screen reads in parallel when it opens, each in
/// a named, typed field.
///
/// This replaced a positional `Future.wait` list read back as `results[N] as
/// T`, where adding or removing one entry silently shifted every later index.
/// Here each load assigns its own field, so the compiler checks the type and
/// order doesn't matter; a load that is never assigned throws on first read
/// instead of handing the screen another setting's value.
class SettingsLoad {
  SettingsLoad._();

  late final AutoRewindSettings rewindSettings;
  late final double defaultSpeed;
  late final bool wifiOnlyDownloads;
  late final int rollingDownloadCount;
  late final bool rollingDownloadDeleteFinished;
  late final CardScrubberMode cardScrubberMode;
  late final bool notifChapterProgress;
  late final bool speedAdjustedTime;
  late final int forwardSkip;
  late final int backSkip;
  late final String shakeMode;
  late final bool resetSleepOnPause;
  late final bool sleepFadeOut;
  late final int shakeAddMinutes;
  late final String bookQueueMode;
  late final bool queueAutoDownload;
  late final bool mergeAbsorbingLibraries;
  late final int maxConcurrentDownloads;
  late final bool hideEbookOnly;
  late final bool showGoodreadsButton;
  late final bool loggingEnabled;
  late final bool fullScreenPlayer;
  late final String themeMode;
  late final bool snappyTransitions;
  late final String downloadLocationLabel;
  late final int totalDownloadSizeBytes;
  late final Map<String, int>? deviceStorage;
  late final AutoSleepSettings autoSleepSettings;
  late final String appVersion;
  late final int streamingCacheSizeMb;
  late final bool localServerEnabled;
  late final String localServerUrl;
  late final bool autoDownloadOnStream;
  late final int startScreen;
  late final String podcastQueueMode;
  late final bool rectangleCovers;
  late final bool trustAllCerts;
  late final bool coverPlayButton;
  late final bool skipChapterBarrier;
  late final bool showExplicitBadge;
  late final bool includePreReleases;
  late final int sleepFadeDuration;
  late final bool sleepChime;
  late final double sleepChimeVolume;
  late final String shakeSensitivity;
  late final String language;
  late final String? queuePlaylistId;
  late final bool notifSpeedBookmark;
  late final bool lockSeekBar;
  late final String cardBackground;
  late final double progressTextScale;
  late final UpdateCheckFrequency updateCheckFrequency;

  /// Loads every field at once. The four device lookups can be replaced in
  /// tests, where they would hit platform channels.
  static Future<SettingsLoad> load({
    Future<String>? downloadLocationLabel,
    Future<int>? totalDownloadSize,
    Future<Map<String, int>?>? deviceStorage,
    Future<String>? appVersion,
  }) async {
    final s = SettingsLoad._();
    await Future.wait(<Future<void>>[
      AutoRewindSettings.load().then((v) => s.rewindSettings = v),
      PlayerSettings.getDefaultSpeed().then((v) => s.defaultSpeed = v),
      PlayerSettings.getWifiOnlyDownloads()
          .then((v) => s.wifiOnlyDownloads = v),
      PlayerSettings.getRollingDownloadCount()
          .then((v) => s.rollingDownloadCount = v),
      PlayerSettings.getRollingDownloadDeleteFinished()
          .then((v) => s.rollingDownloadDeleteFinished = v),
      PlayerSettings.getCardScrubberMode().then((v) => s.cardScrubberMode = v),
      PlayerSettings.getNotificationChapterProgress()
          .then((v) => s.notifChapterProgress = v),
      PlayerSettings.getSpeedAdjustedTime()
          .then((v) => s.speedAdjustedTime = v),
      PlayerSettings.getForwardSkip().then((v) => s.forwardSkip = v),
      PlayerSettings.getBackSkip().then((v) => s.backSkip = v),
      PlayerSettings.getShakeMode().then((v) => s.shakeMode = v),
      PlayerSettings.getResetSleepOnPause()
          .then((v) => s.resetSleepOnPause = v),
      PlayerSettings.getSleepFadeOut().then((v) => s.sleepFadeOut = v),
      PlayerSettings.getShakeAddMinutes().then((v) => s.shakeAddMinutes = v),
      PlayerSettings.getBookQueueMode().then((v) => s.bookQueueMode = v),
      PlayerSettings.getQueueAutoDownload()
          .then((v) => s.queueAutoDownload = v),
      PlayerSettings.getMergeAbsorbingLibrariesRaw()
          .then((v) => s.mergeAbsorbingLibraries = v),
      PlayerSettings.getMaxConcurrentDownloads()
          .then((v) => s.maxConcurrentDownloads = v),
      PlayerSettings.getHideEbookOnly().then((v) => s.hideEbookOnly = v),
      PlayerSettings.getShowGoodreadsButton()
          .then((v) => s.showGoodreadsButton = v),
      PlayerSettings.getLoggingEnabled().then((v) => s.loggingEnabled = v),
      PlayerSettings.getFullScreenPlayer().then((v) => s.fullScreenPlayer = v),
      PlayerSettings.getThemeMode().then((v) => s.themeMode = v),
      PlayerSettings.getSnappyTransitions()
          .then((v) => s.snappyTransitions = v),
      (downloadLocationLabel ?? DownloadService().downloadLocationLabel)
          .then((v) => s.downloadLocationLabel = v),
      (totalDownloadSize ?? DownloadService().totalDownloadSize)
          .then((v) => s.totalDownloadSizeBytes = v),
      (deviceStorage ?? DownloadService.getDeviceStorage())
          .then((v) => s.deviceStorage = v),
      AutoSleepSettings.load().then((v) => s.autoSleepSettings = v),
      (appVersion ?? UpdateCheckerService.currentInstalledVersion())
          .then((v) => s.appVersion = v),
      PlayerSettings.getStreamingCacheSizeMb()
          .then((v) => s.streamingCacheSizeMb = v),
      PlayerSettings.getLocalServerEnabled()
          .then((v) => s.localServerEnabled = v),
      PlayerSettings.getLocalServerUrl().then((v) => s.localServerUrl = v),
      PlayerSettings.getAutoDownloadOnStream()
          .then((v) => s.autoDownloadOnStream = v),
      PlayerSettings.getStartScreen().then((v) => s.startScreen = v),
      PlayerSettings.getPodcastQueueMode().then((v) => s.podcastQueueMode = v),
      PlayerSettings.getRectangleCovers().then((v) => s.rectangleCovers = v),
      PlayerSettings.getTrustAllCerts().then((v) => s.trustAllCerts = v),
      PlayerSettings.getCoverPlayButton().then((v) => s.coverPlayButton = v),
      PlayerSettings.getSkipChapterBarrier()
          .then((v) => s.skipChapterBarrier = v),
      PlayerSettings.getShowExplicitBadge()
          .then((v) => s.showExplicitBadge = v),
      PlayerSettings.getIncludePreReleases()
          .then((v) => s.includePreReleases = v),
      PlayerSettings.getSleepFadeDuration()
          .then((v) => s.sleepFadeDuration = v),
      PlayerSettings.getSleepChime().then((v) => s.sleepChime = v),
      PlayerSettings.getSleepChimeVolume().then((v) => s.sleepChimeVolume = v),
      PlayerSettings.getShakeSensitivity().then((v) => s.shakeSensitivity = v),
      PlayerSettings.getLanguage().then((v) => s.language = v),
      PlayerSettings.getQueuePlaylistId().then((v) => s.queuePlaylistId = v),
      PlayerSettings.getMediaControlsSpeedBookmark()
          .then((v) => s.notifSpeedBookmark = v),
      PlayerSettings.getLockSeekBar().then((v) => s.lockSeekBar = v),
      PlayerSettings.getCardBackground().then((v) => s.cardBackground = v),
      PlayerSettings.getProgressTextScale()
          .then((v) => s.progressTextScale = v),
      PlayerSettings.getUpdateCheckFrequency()
          .then((v) => s.updateCheckFrequency = v),
    ]);
    return s;
  }
}
