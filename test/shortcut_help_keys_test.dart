import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/l10n/app_localizations_en.dart';
import 'package:absorb/services/desktop_shortcuts.dart';
import 'package:absorb/widgets/desktop_shortcut_help.dart';
import 'package:absorb/widgets/desktop_shortcut_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// ? and F1 open the keyboard shortcuts dialog.
void main() {
  final l = AppLocalizationsEn();
  final windows = TargetPlatformVariant.only(TargetPlatform.windows);
  late List<DesktopShortcutAction> ran;
  late GlobalKey<NavigatorState> navKey;

  setUp(() {
    ran = [];
    navKey = GlobalKey<NavigatorState>();
    DesktopShortcutScope.handlers = DesktopShortcutHandlers(
      canRun: (_) => true,
      run: ran.add,
      canSwitchCard: () => false,
      switchCard: (_) {},
    );
  });
  tearDown(() => DesktopShortcutScope.handlers = null);

  Future<void> pumpApp(WidgetTester tester, Widget body) async {
    await tester.pumpWidget(MaterialApp(
      navigatorKey: navKey,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) => DesktopShortcutScope(child: child!),
      home: Focus(
        focusNode: desktopShellFocusNode,
        autofocus: true,
        child: Scaffold(body: body),
      ),
    ));
    await tester.pump();
  }

  Future<void> questionMark(WidgetTester tester) async {
    await tester.sendKeyDownEvent(LogicalKeyboardKey.shiftLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.slash, character: '?');
    await tester.sendKeyUpEvent(LogicalKeyboardKey.shiftLeft);
    await tester.pump();
  }

  testWidgets('? opens the shortcuts from the shell', variant: windows,
      (tester) async {
    await pumpApp(tester, const Text('shell'));
    await questionMark(tester);
    expect(ran, [DesktopShortcutAction.shortcutHelp]);
  });

  testWidgets('F1 opens the shortcuts from the shell', variant: windows,
      (tester) async {
    await pumpApp(tester, const Text('shell'));
    await tester.sendKeyEvent(LogicalKeyboardKey.f1);
    await tester.pump();
    expect(ran, [DesktopShortcutAction.shortcutHelp]);
  });

  testWidgets('while typing, ? is just a character but F1 still works',
      variant: windows, (tester) async {
    await pumpApp(tester, const TextField());
    await tester.tap(find.byType(TextField));
    await tester.pump();
    expect(isTypingInTextField(), isTrue);
    await questionMark(tester);
    expect(ran, isEmpty);
    await tester.sendKeyEvent(LogicalKeyboardKey.f1);
    await tester.pump();
    expect(ran, [DesktopShortcutAction.shortcutHelp]);
  });

  testWidgets('neither key opens it over an open dialog', variant: windows,
      (tester) async {
    await pumpApp(tester, const Text('shell'));
    navKey.currentState!.push(DialogRoute<void>(
      context: navKey.currentContext!,
      builder: (_) => const AlertDialog(content: Text('Keyboard shortcuts')),
    ));
    await tester.pumpAndSettle();
    await questionMark(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.f1);
    await tester.pump();
    expect(ran, isEmpty);
  });

  testWidgets('? does nothing on Android (no hardware-key extras there)',
      variant: TargetPlatformVariant.only(TargetPlatform.android),
      (tester) async {
    await pumpApp(tester, const Text('shell'));
    await questionMark(tester);
    expect(ran, isEmpty);
  });

  testWidgets('the dialog lists ? / F1 and Ctrl+K', variant: windows,
      (tester) async {
    await pumpApp(
      tester,
      Builder(
        builder: (context) => TextButton(
          onPressed: () => showDesktopShortcutsDialog(context),
          child: const Text('open'),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text(l.desktopShortcutsTitle), findsOneWidget);
    expect(find.text('? / F1'), findsOneWidget);
    expect(find.text(l.desktopShortcutHelp), findsOneWidget);
    expect(find.text('Ctrl+K'), findsOneWidget);
    // One row per action even though Help has two keys.
    final rows = desktopShortcutHelpEntries(l);
    expect(
      rows.where((r) => r.description == l.desktopShortcutHelp),
      hasLength(1),
    );
  });

  test('? matches the typed character, F1 works anywhere', () {
    final help = desktopShortcutDefinitions
        .where((s) => s.action == DesktopShortcutAction.shortcutHelp)
        .toList();
    expect(help.map((s) => s.label), ['?', 'F1']);
    expect(help.first.activator, isA<CharacterActivator>());
    expect(help.first.isPlainKey, isTrue);
    expect(help.last.global, isTrue);
    expect(help.every((s) => s.notInDialog), isTrue);
  });
}
