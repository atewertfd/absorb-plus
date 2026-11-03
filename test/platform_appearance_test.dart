import 'package:absorb/utils/app_motion.dart';
import 'package:absorb/utils/platform_appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// C16: the app root rebuilds on OS dark mode and reduce motion changes,
/// and the motion scope reaches pushed routes.
void main() {
  testWidgets('fires on a platform brightness change', (tester) async {
    var fired = 0;
    void listener() => fired++;
    PlatformAppearance.changes.addListener(listener);
    addTearDown(() => PlatformAppearance.changes.removeListener(listener));

    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    await tester.pump();

    expect(fired, greaterThan(0));
  });

  testWidgets('fires on an accessibility change (reduce motion)',
      (tester) async {
    var fired = 0;
    void listener() => fired++;
    PlatformAppearance.changes.addListener(listener);
    addTearDown(() => PlatformAppearance.changes.removeListener(listener));

    tester.platformDispatcher.accessibilityFeaturesTestValue =
        const FakeAccessibilityFeatures(disableAnimations: true);
    addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
    await tester.pump();

    expect(fired, greaterThan(0));
  });

  testWidgets('a motion scope in MaterialApp.builder reaches a dialog',
      (tester) async {
    AppMotionMode? seen;
    await tester.pumpWidget(MaterialApp(
      builder: (context, child) =>
          AppMotionScope(mode: AppMotionMode.instant, child: child!),
      home: Builder(
        builder: (context) => TextButton(
          onPressed: () => showDialog<void>(
            context: context,
            builder: (dialogContext) {
              seen = AppMotionScope.maybeOf(dialogContext);
              return const SizedBox();
            },
          ),
          child: const Text('open'),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(seen, AppMotionMode.instant);
  });
}
