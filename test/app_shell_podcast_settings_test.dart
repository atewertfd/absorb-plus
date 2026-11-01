import 'package:absorb/screens/app_shell_navigation_policy.dart';
import 'package:flutter_test/flutter_test.dart';

/// Changing an unrelated setting while in Podcasts must not switch the shared
/// Library page back to the book library.
void main() {
  test('an unrelated settings change leaves Podcasts alone', () {
    expect(
      shouldRecheckLibraryAfterSettings(
          firstLoad: false, podcastTabChanged: false),
      isFalse,
    );
  });

  test('the first load and a Podcasts tab change still re-check', () {
    expect(
      shouldRecheckLibraryAfterSettings(
          firstLoad: true, podcastTabChanged: false),
      isTrue,
    );
    expect(
      shouldRecheckLibraryAfterSettings(
          firstLoad: false, podcastTabChanged: true),
      isTrue,
    );
  });

  test('a re-check while in Podcasts would leave it (why it is gated)', () {
    // Stack page 1 with the podcast library selected is the Podcasts tab.
    expect(
      shouldRestoreBookLibrary(
        pageIndex: 1,
        podcastsShown: true,
        selectedLibraryId: 'pods',
        podcastLibraryId: 'pods',
        restoreLibraryPage: true,
      ),
      isTrue,
    );
  });
}
