import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/providers/library_provider.dart';
import 'package:absorb/services/download_service.dart';
import 'package:absorb/widgets/library_grid_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Library grid tiles listen to DownloadService, which notifies up to four
/// times a second per active download. A tile rebuilds only when its own
/// item's download state changes.
void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets("another book's download progress doesn't rebuild a tile",
      (tester) async {
    final library = LibraryProvider();
    addTearDown(library.dispose);
    await tester.pumpWidget(
      ChangeNotifierProvider<LibraryProvider>.value(
        value: library,
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SizedBox(
              width: 160,
              height: 300,
              child: GridBookTile(
                item: const {
                  'id': 'book-a',
                  'media': {
                    'metadata': {'title': 'Dune', 'authorName': 'Herbert'},
                  },
                },
                coverAspectRatio: 1,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Dune'), findsWidgets);
    expect(tester.binding.hasScheduledFrame, isFalse);

    // A progress tick for some other download.
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    DownloadService().notifyListeners();
    expect(tester.binding.hasScheduledFrame, isFalse,
        reason: 'the tile did not call setState');
  });
}
