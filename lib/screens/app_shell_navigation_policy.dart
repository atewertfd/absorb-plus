bool shouldRestoreBookLibrary({
  required int pageIndex,
  required bool podcastsShown,
  required String? selectedLibraryId,
  required String podcastLibraryId,
  bool restoreLibraryPage = false,
}) {
  return (pageIndex == 0 || (restoreLibraryPage && pageIndex == 1)) &&
      podcastsShown &&
      selectedLibraryId == podcastLibraryId;
}

/// Fork: after a settings change, re-check the Library page's library only
/// on the first load or when the Podcasts tab settings themselves changed.
/// Any other setting (skip lengths, speed presets, a settings-sync pull) used
/// to pull the user out of Podcasts back to the book library.
bool shouldRecheckLibraryAfterSettings({
  required bool firstLoad,
  required bool podcastTabChanged,
}) =>
    firstLoad || podcastTabChanged;
