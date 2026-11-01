import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/l10n/app_localizations_en.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/widgets/desktop_shortcut_help.dart';
import 'package:absorb/widgets/playlist_picker_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

/// Rows that give screen readers one summary label say it once, instead of
/// the label followed by the same texts again from the row itself.
void main() {
  final l = AppLocalizationsEn();

  Widget app(Widget body, {LibraryProvider? library}) {
    final app = MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: SingleChildScrollView(child: body)),
    );
    return library == null
        ? app
        : ChangeNotifierProvider<LibraryProvider>.value(
            value: library,
            child: app,
          );
  }

  testWidgets('each keyboard shortcut is read once', (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(app(const DesktopShortcutHelpList()));
    for (final entry in desktopShortcutHelpEntries(l).take(3)) {
      expect(
        find.bySemanticsLabel('${entry.description}, ${entry.keys}'),
        findsOneWidget,
        reason: entry.description,
      );
    }
    handle.dispose();
  });

  testWidgets('each playlist picker row is read once', (tester) async {
    final handle = tester.ensureSemantics();
    final library = _Library();
    addTearDown(library.dispose);
    await tester.pumpWidget(app(
      const PlaylistPickerSheet(libraryItemId: 'book-a'),
      library: library,
    ));
    expect(find.bySemanticsLabel(l.newPlaylist), findsOneWidget);
    expect(
      find.bySemanticsLabel(l.playlistPickerNameWithCount('Road trip', 0)),
      findsOneWidget,
    );
    handle.dispose();
  });
}

class _Library extends LibraryProvider {
  @override
  List<dynamic> get playlists => [
        {'id': 'p1', 'name': 'Road trip', 'items': <dynamic>[]},
      ];
}
