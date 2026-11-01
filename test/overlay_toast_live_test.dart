import 'package:absorb/widgets/overlay_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// A live toast (auto-scroll speed, say) is the current toast too, so the
/// next toast replaces it instead of stacking on top of it.
void main() {
  testWidgets('a new toast replaces a live one', (tester) async {
    late BuildContext context;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (c) {
          context = c;
          return const SizedBox();
        }),
      ),
    ));

    final live = LiveOverlayToast.show(context, 'Speed 1.0')!;
    await tester.pump();
    live.update('Speed 1.2');
    await tester.pump();
    expect(find.text('Speed 1.2'), findsOneWidget);

    showOverlayToast(context, 'Saved');
    await tester.pump();
    expect(find.text('Saved'), findsOneWidget);
    expect(find.text('Speed 1.2'), findsNothing);

    // The live toast's owner can still update and dismiss it safely.
    live.update('Speed 1.4');
    live.dismiss();
    await tester.pump();
    expect(find.text('Speed 1.4'), findsNothing);
    expect(tester.takeException(), isNull);
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  });
}
