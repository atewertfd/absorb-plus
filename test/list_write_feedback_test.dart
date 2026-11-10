import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/l10n/app_localizations_en.dart';
import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/widgets/collection_picker_sheet.dart';
import 'package:absorb/widgets/list_order_save_feedback.dart';
import 'package:absorb/widgets/playlist_detail_sheet.dart';
import 'package:absorb/widgets/playlist_picker_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'support/fakes.dart';

/// Playlist and collection writes that fail on the server say so, instead of
/// showing "Added to …" or closing as if they had worked (IMP-012).
void main() {
  final l = AppLocalizationsEn();

  Future<void> open(
    WidgetTester tester,
    Widget sheet,
    LibraryProvider library,
    GlobalKey<NavigatorState> nav, {
    bool scroll = true,
  }) async {
    final auth = FakeAuth();
    addTearDown(auth.dispose);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>.value(value: auth),
          ChangeNotifierProvider<LibraryProvider>.value(value: library),
        ],
        child: MaterialApp(
          navigatorKey: nav,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: SizedBox()),
        ),
      ),
    );
    nav.currentState!.push(
      MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          body: scroll ? SingleChildScrollView(child: sheet) : sheet,
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> createNamed(WidgetTester tester, String newLabel) async {
    await tester.tap(find.text(newLabel));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Mix');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    await tester.pump();
  }

  Future<void> drainToast(WidgetTester tester) async {
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  }

  testWidgets('a new playlist whose add fails says it failed', (tester) async {
    final library = _Library(created: true, addOk: false);
    addTearDown(library.dispose);
    final nav = GlobalKey<NavigatorState>();
    await open(
      tester,
      const PlaylistPickerSheet(libraryItemId: 'book-a'),
      library,
      nav,
    );
    await createNamed(tester, l.newPlaylist);
    expect(library.addCalls, 1);
    expect(find.text(l.failedToAdd), findsOneWidget);
    expect(find.text(l.addedToName('Mix')), findsNothing);
    await drainToast(tester);
  });

  testWidgets('a new playlist that is added says so', (tester) async {
    final library = _Library(created: true, addOk: true);
    addTearDown(library.dispose);
    final nav = GlobalKey<NavigatorState>();
    await open(
      tester,
      const PlaylistPickerSheet(libraryItemId: 'book-a'),
      library,
      nav,
    );
    await createNamed(tester, l.newPlaylist);
    expect(find.text(l.addedToName('Mix')), findsOneWidget);
    await drainToast(tester);
  });

  testWidgets('a playlist the server would not create says it failed', (
    tester,
  ) async {
    final library = _Library(created: false, addOk: true);
    addTearDown(library.dispose);
    final nav = GlobalKey<NavigatorState>();
    await open(
      tester,
      const PlaylistPickerSheet(libraryItemId: 'book-a'),
      library,
      nav,
    );
    await createNamed(tester, l.newPlaylist);
    expect(library.addCalls, 0);
    expect(find.text(l.failedToAdd), findsOneWidget);
    await drainToast(tester);
  });

  testWidgets('a collection the server would not create says it failed', (
    tester,
  ) async {
    final library = _Library(created: false, addOk: true);
    addTearDown(library.dispose);
    final nav = GlobalKey<NavigatorState>();
    await open(
      tester,
      const CollectionPickerSheet(libraryItemId: 'book-a'),
      library,
      nav,
    );
    await createNamed(tester, l.newCollection);
    expect(find.text(l.failedToAdd), findsOneWidget);
    await drainToast(tester);
  });

  testWidgets('a playlist the server would not delete stays open and says so', (
    tester,
  ) async {
    final library = _Library(created: true, addOk: true, deleteOk: false);
    addTearDown(library.dispose);
    final nav = GlobalKey<NavigatorState>();
    await open(
      tester,
      const PlaylistDetailSheet(playlistId: 'p1'),
      library,
      nav,
      scroll: false,
    );
    await tester.tap(find.byIcon(Icons.edit_rounded));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l.deletePlaylist));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l.delete));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500)); // dialog closes
    expect(library.deleteCalls, 1);
    expect(find.text(l.deletePlaylistFailed), findsOneWidget);
    expect(
      find.text(l.deletePlaylist),
      findsOneWidget,
    ); // the sheet is still there
    await drainToast(tester);
  });

  testWidgets('a reorder that did not save says so on the root navigator', (
    tester,
  ) async {
    final nav = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: nav,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(body: SizedBox()),
      ),
    );

    reportListOrderSave(true, navigator: nav.currentState);
    await tester.pump();
    expect(find.text(l.libReorderFailed), findsNothing);

    reportListOrderSave(false, navigator: nav.currentState);
    await tester.pump();
    expect(find.text(l.libReorderFailed), findsOneWidget);
    await drainToast(tester);
  });
}

class _Library extends LibraryProvider {
  _Library({required this.created, required this.addOk, this.deleteOk = true});

  final bool created;
  final bool addOk;
  final bool deleteOk;
  int addCalls = 0;
  int deleteCalls = 0;

  @override
  List<dynamic> get playlists => [
    {'id': 'p1', 'name': 'Road trip', 'items': <dynamic>[]},
  ];

  @override
  Future<bool> deletePlaylist(String playlistId) async {
    deleteCalls++;
    return deleteOk;
  }

  @override
  List<dynamic> get collections => const [];

  @override
  Future<Map<String, dynamic>?> createPlaylist(String name) async =>
      created ? {'id': 'p9', 'name': name} : null;

  @override
  Future<Map<String, dynamic>?> createCollection(
    String name, {
    List<String> books = const [],
  }) async => created ? {'id': 'c9', 'name': name} : null;

  @override
  Future<bool> addToPlaylist(
    String playlistId,
    String libraryItemId, {
    String? episodeId,
  }) async {
    addCalls++;
    return addOk;
  }
}
