import 'package:absorb/widgets/card_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _marquee(bool animate) => MaterialApp(
      home: Center(
        child: SizedBox(
          width: 120,
          child: MarqueeText(
            text: 'A very long chapter name that cannot fit in the bar',
            style: const TextStyle(fontSize: 14),
            animate: animate,
          ),
        ),
      ),
    );

double _offset(WidgetTester tester) =>
    tester.state<ScrollableState>(find.byType(Scrollable)).position.pixels;

void main() {
  testWidgets('scrolls while playing, stops and resets when paused',
      (tester) async {
    await tester.pumpWidget(_marquee(true));
    await tester.pump(); // measure
    await tester.pump(); // duplicated layout
    await tester.pump(const Duration(seconds: 2)); // start delay
    await tester.pump(const Duration(seconds: 1));
    expect(_offset(tester), greaterThan(0));

    await tester.pumpWidget(_marquee(false));
    await tester.pump();
    expect(_offset(tester), 0);
    await tester.pump(const Duration(seconds: 2));
    expect(_offset(tester), 0);
    expect(tester.binding.hasScheduledFrame, isFalse,
        reason: 'a paused marquee must not keep asking for frames');
  });

  testWidgets('scrolls one loop, rests, and loops again every 30 s',
      (tester) async {
    await tester.pumpWidget(_marquee(true));
    await tester.pump(); // measure
    await tester.pump(); // duplicated layout
    await tester.pump(const Duration(seconds: 2)); // start delay
    await tester.pump(const Duration(seconds: 1));
    expect(_offset(tester), greaterThan(0));

    // One loop takes (text + gap) / 38 px/s: well under 30 s here.
    for (var i = 0; i < 300; i++) {
      await tester.pump(const Duration(milliseconds: 100));
      if (!tester.binding.hasScheduledFrame) break;
    }
    expect(_offset(tester), 0, reason: 'back at the start after one loop');
    expect(tester.binding.hasScheduledFrame, isFalse,
        reason: 'resting: no frames');
    await tester.pump(const Duration(seconds: 20));
    expect(_offset(tester), 0);
    expect(tester.binding.hasScheduledFrame, isFalse);

    // The rest runs out: another loop.
    await tester.pump(const Duration(seconds: 10));
    await tester.pump(const Duration(seconds: 1));
    expect(_offset(tester), greaterThan(0));

    await tester.pumpWidget(const SizedBox()); // disposed: rest timer gone
  });

  testWidgets('a marquee that starts paused never scrolls', (tester) async {
    await tester.pumpWidget(_marquee(false));
    await tester.pump();
    await tester.pump();
    await tester.pump(const Duration(seconds: 4));
    expect(_offset(tester), 0);
    expect(tester.binding.hasScheduledFrame, isFalse);
  });
}
