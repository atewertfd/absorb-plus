import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/audio_player_service.dart';
import 'package:absorb/services/bookmark_service.dart';
import 'package:absorb/widgets/card_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The card's bookmark button follows the item it shows. When a card
/// switches to the next episode in place, the count is the new episode's.
void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('the bookmark count follows the episode the card shows',
      (tester) async {
    await tester.runAsync(() async {
      for (var i = 0; i < 2; i++) {
        await BookmarkService().addBookmark(
          itemId: 'show-ep1',
          positionSeconds: 10.0 + i,
          title: 'Mark $i',
        );
      }
    });

    Widget card(String episodeId) => MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SizedBox(
              width: 300,
              child: CardBookmarkButtonInline(
                player: AudioPlayerService(),
                accent: Colors.blue,
                isActive: false,
                itemId: 'show',
                episodeId: episodeId,
              ),
            ),
          ),
        );
    final l = await AppLocalizations.delegate.load(const Locale('en'));

    Future<void> settle() async {
      for (var i = 0; i < 5; i++) {
        await tester.runAsync(() => Future<void>.delayed(Duration.zero));
        await tester.pump();
      }
    }

    await tester.pumpWidget(card('ep1'));
    await settle();
    expect(find.text(l.bookmarksWithCount(2)), findsOneWidget);

    // Auto-advance: same card, next episode, which has no bookmarks.
    await tester.pumpWidget(card('ep2'));
    await settle();
    expect(find.text(l.bookmarksWithCount(2)), findsNothing);
    expect(find.text(l.bookmark), findsOneWidget);
  });
}
