import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/widgets/adaptive_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Icon-only buttons carry a label: a hover hint with the mouse and a name
/// for screen readers, instead of a bare "button".
void main() {
  testWidgets('the desktop sheet close button is labelled Close',
      (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => Scaffold(
          body: TextButton(
            onPressed: () => showDesktopModalDialog<void>(
              context: context,
              builder: (_) => const SizedBox(height: 100),
            ),
            child: const Text('open'),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    final close = find.byKey(const ValueKey('desktop-dialog-close-button'));
    expect(tester.widget<IconButton>(close).tooltip, 'Close');
    expect(find.byTooltip('Close'), findsOneWidget);
    // Screen readers get the name too, not just "button".
    final data = tester.getSemantics(close).getSemanticsData();
    expect('${data.label} ${data.tooltip}', contains('Close'));

    await tester.tap(close);
    await tester.pumpAndSettle();
    expect(close, findsNothing);
    handle.dispose();
  });
}
