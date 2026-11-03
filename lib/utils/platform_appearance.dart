import 'package:flutter/widgets.dart';

/// Absorb Plus (audit C16): changes the operating system makes to how the
/// app should look, as a [Listenable] the app's root can rebuild on.
///
/// The root reads the platform brightness (for the system bar colors with
/// theme "System") and reduce motion straight from the platform dispatcher.
/// Nothing rebuilt it when those changed, so the bar colors and the motion
/// mode stayed stale until some other setting changed.
class PlatformAppearance with WidgetsBindingObserver {
  PlatformAppearance._();

  static final PlatformAppearance _instance = PlatformAppearance._();
  static final ValueNotifier<int> _changes = ValueNotifier<int>(0);
  static bool _watching = false;

  /// Fires when the platform brightness or accessibility features change.
  /// Starts watching on first use.
  static Listenable get changes {
    if (!_watching) {
      _watching = true;
      WidgetsBinding.instance.addObserver(_instance);
    }
    return _changes;
  }

  @override
  void didChangePlatformBrightness() => _changes.value++;

  @override
  void didChangeAccessibilityFeatures() => _changes.value++;
}
