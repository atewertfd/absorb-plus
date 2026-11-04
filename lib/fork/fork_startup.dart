// Absorb Plus plug-in point: the fork's startup work, called from upstream's
// main() in two lines so main.dart stays close to upstream's.
//
// Add new fork startup work here, not in main.dart. Order matters only where
// a comment says so.
import 'dart:async';

import 'package:flutter/material.dart';

import '../services/next_in_series_download.dart';
import '../services/pending_writes.dart';
import '../services/precache_service.dart';
import '../services/startup_timing.dart';
import '../services/tailscale_service.dart';
import '../utils/memory_policy.dart';
import '../utils/scroll_diagnostics.dart';
import '../utils/smooth_wheel_scroll.dart';
import '../widgets/book_detail_sheet.dart';
import '../widgets/exclusive_audio_tile.dart';

abstract final class ForkStartup {
  /// The first line of main(), before the Flutter binding exists.
  static void beforeBinding() {
    StartupTiming.markMain(); // first: the startup clock starts here
    PrecacheService.itemSink = primeBookDetailItem;
  }

  /// Right after `WidgetsFlutterBinding.ensureInitialized()`.
  ///
  /// [smoothWheel] says whether wheel smoothing is on right now (off under
  /// e-ink and "Disable page fade"); [trustSelfSigned] mirrors the app's
  /// self-signed-certificate setting for the built-in Tailscale proxy.
  static void afterBinding({
    required bool Function() smoothWheel,
    required bool Function() trustSelfSigned,
    required GlobalKey<NavigatorState> navigatorKey,
  }) {
    installSmoothWheelScroll(enabled: smoothWheel);
    installScrollDiagnostics(smoothingEnabled: smoothWheel); // ABSORB_SCROLL_DIAG=1
    configureImageCache(PaintingBinding.instance.imageCache);
    PendingWrites.installLifecycleFlush(); // flush held-back writes on background
    NextInSeriesDownloader.start(); // does nothing until turned on
    TailscaleService.trustSelfSigned = trustSelfSigned;
    installExclusiveAudioFallbackNotice(navigatorKey); // Windows only
    unawaited(TailscaleService.instance.init()); // no-op unless turned on
  }
}
