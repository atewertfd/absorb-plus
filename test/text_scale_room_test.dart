import 'package:absorb/widgets/text_scale_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

/// Fork helpers that give fixed-pixel layouts room for bigger text.
void main() {
  /// Runs [read] with a context whose text scale is [scale].
  Future<T> withScale<T>(
    WidgetTester tester,
    double scale,
    T Function(BuildContext context) read,
  ) async {
    late T result;
    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(textScaler: TextScaler.linear(scale)),
        child: Builder(
          builder: (context) {
            result = read(context);
            return const SizedBox();
          },
        ),
      ),
    );
    return result;
  }

  group('textScaleRoom', () {
    testWidgets('is zero at the normal text size', (tester) async {
      expect(await withScale(tester, 1.0, (c) => textScaleRoom(c, 20)), 0);
    });

    testWidgets('is zero, never negative, at smaller text sizes', (
      tester,
    ) async {
      expect(await withScale(tester, 0.8, (c) => textScaleRoom(c, 20)), 0);
    });

    testWidgets('is the extra height bigger text needs', (tester) async {
      expect(
        await withScale(tester, 1.5, (c) => textScaleRoom(c, 20)),
        closeTo(10, 1e-9),
      );
      expect(
        await withScale(tester, 2.0, (c) => textScaleRoom(c, 13)),
        closeTo(13, 1e-9),
      );
    });

    testWidgets('a zero height needs no room', (tester) async {
      expect(await withScale(tester, 2.0, (c) => textScaleRoom(c, 0)), 0);
    });
  });

  group('linesThatFit', () {
    int lines(BuildContext c, double maxHeight, {int max = 3}) =>
        linesThatFit(c, maxHeight, fontSize: 10, lineHeight: 1.2, max: max);

    testWidgets('counts whole lines that fit, rounding down', (tester) async {
      // One line is 12 px at scale 1: 30 px holds 2.5 lines -> 2.
      expect(await withScale(tester, 1.0, (c) => lines(c, 30)), 2);
      expect(await withScale(tester, 1.0, (c) => lines(c, 24)), 2);
      expect(await withScale(tester, 1.0, (c) => lines(c, 23.9)), 1);
    });

    testWidgets('never asks for fewer than one line', (tester) async {
      expect(await withScale(tester, 1.0, (c) => lines(c, 5)), 1);
      expect(await withScale(tester, 1.0, (c) => lines(c, 0)), 1);
    });

    testWidgets('never asks for more than max', (tester) async {
      expect(await withScale(tester, 1.0, (c) => lines(c, 1000)), 3);
      expect(await withScale(tester, 1.0, (c) => lines(c, 1000, max: 5)), 5);
    });

    testWidgets('an unbounded height gives max', (tester) async {
      expect(await withScale(tester, 3.0, (c) => lines(c, double.infinity)), 3);
    });

    testWidgets('bigger text fits fewer lines', (tester) async {
      // A line is 24 px at scale 2: 50 px holds 2 lines, not 3.
      expect(await withScale(tester, 1.0, (c) => lines(c, 50)), 3);
      expect(await withScale(tester, 2.0, (c) => lines(c, 50)), 2);
    });
  });

  group('LabelRoomGridDelegate', () {
    SliverConstraints constraints({double width = 400}) => SliverConstraints(
      axisDirection: AxisDirection.down,
      growthDirection: GrowthDirection.forward,
      userScrollDirection: ScrollDirection.idle,
      scrollOffset: 0,
      precedingScrollExtent: 0,
      overlap: 0,
      remainingPaintExtent: 800,
      crossAxisExtent: width,
      crossAxisDirection: AxisDirection.right,
      viewportMainAxisExtent: 800,
      remainingCacheExtent: 1000,
      cacheOrigin: 0,
    );

    SliverGridRegularTileLayout layoutOf(SliverGridDelegate d) =>
        d.getLayout(constraints()) as SliverGridRegularTileLayout;

    test('without label room the layout matches the plain grid', () {
      const plain = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.7,
      );
      const room = LabelRoomGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.7,
      );
      final a = layoutOf(plain);
      final b = layoutOf(room);
      expect(b.childMainAxisExtent, a.childMainAxisExtent);
      expect(b.mainAxisStride, a.mainAxisStride);
      expect(b.crossAxisStride, a.crossAxisStride);
      expect(b.childCrossAxisExtent, a.childCrossAxisExtent);
    });

    test('a negative label room is ignored', () {
      const plain = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      );
      const room = LabelRoomGridDelegate(
        crossAxisCount: 2,
        childAspectRatio: 1,
        labelRoom: -12,
      );
      expect(
        layoutOf(room).childMainAxisExtent,
        layoutOf(plain).childMainAxisExtent,
      );
    });

    test('label room adds height to every cell and row, not width', () {
      const plain = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.7,
      );
      const room = LabelRoomGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.7,
        labelRoom: 18,
      );
      final a = layoutOf(plain);
      final b = layoutOf(room);
      expect(b.crossAxisCount, 4);
      expect(b.childMainAxisExtent, closeTo(a.childMainAxisExtent + 18, 1e-9));
      expect(b.mainAxisStride, closeTo(a.mainAxisStride + 18, 1e-9));
      expect(b.childCrossAxisExtent, a.childCrossAxisExtent);
      expect(b.crossAxisStride, a.crossAxisStride);
    });

    test('label room also adds to a fixed mainAxisExtent', () {
      const room = LabelRoomGridDelegate(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        mainAxisExtent: 100,
        labelRoom: 25,
      );
      final l = layoutOf(room);
      expect(l.childMainAxisExtent, 125);
      expect(l.mainAxisStride, 129);
    });

    test('shouldRelayout follows label room and the base fields', () {
      const a = LabelRoomGridDelegate(crossAxisCount: 3, labelRoom: 10);
      expect(
        a.shouldRelayout(
          const LabelRoomGridDelegate(crossAxisCount: 3, labelRoom: 10),
        ),
        isFalse,
      );
      expect(
        a.shouldRelayout(
          const LabelRoomGridDelegate(crossAxisCount: 3, labelRoom: 20),
        ),
        isTrue,
      );
      expect(
        a.shouldRelayout(
          const LabelRoomGridDelegate(crossAxisCount: 4, labelRoom: 10),
        ),
        isTrue,
      );
      // Swapping in from a plain delegate always lays out again.
      expect(
        a.shouldRelayout(
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
        isTrue,
      );
    });

    testWidgets('cells in a real grid get the extra height', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: SizedBox(
              width: 400,
              height: 800,
              child: GridView.builder(
                gridDelegate: const LabelRoomGridDelegate(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  labelRoom: 30,
                ),
                itemCount: 8,
                itemBuilder: (_, i) =>
                    ColoredBox(key: ValueKey(i), color: Colors.red),
              ),
            ),
          ),
        ),
      );
      final first = tester.getRect(find.byKey(const ValueKey(0)));
      final below = tester.getRect(find.byKey(const ValueKey(4)));
      expect(first.width, 100);
      expect(first.height, 130);
      expect(below.top - first.top, 130);
    });
  });
}
