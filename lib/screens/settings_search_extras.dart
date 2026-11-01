// Absorb Plus: Settings search rows that upstream's index does not cover.
//
// Upstream's `settings_search_index.dart` lists the tiles inside the
// collapsible sections it knows about. This file adds the rows it misses:
// fork tiles inside those sections, the fork's Windows Settings section, and
// the cards that sit on the Settings page outside any section (Tips, Server
// admin, Backup and sync, All bookmarks, Check for update). Kept separate so
// upstream's index merges cleanly.
import 'package:flutter/widgets.dart';

import '../l10n/app_localizations.dart';
import '../widgets/windows_settings_tiles.dart';
import 'settings_search_index.dart';

/// Section id for rows that sit on the Settings page itself rather than in a
/// collapsible section. Settings keys its main column with this id, so a
/// result can still be scrolled to and highlighted.
const String kSettingsTopLevelSection = '';

/// Extra search rows. Pass what the page currently shows so a result never
/// points at a row that is hidden.
List<SettingSearchEntry> settingsSearchExtras(
  BuildContext context, {
  bool bookRequests = false,
  bool serverAdmin = false,
  bool bookOrbitAdmin = false,
  bool updates = false,
}) {
  final l = AppLocalizations.of(context)!;
  const top = kSettingsTopLevelSection;
  final settings = l.settingsTitle;
  return [
    // Fork tiles inside upstream sections.
    SettingSearchEntry('Library', l.sectionLibrary, l.homeCardsOpenDetails,
        [l.homeCardsOpenDetailsOnSubtitle, l.homeCardsOpenDetailsOffSubtitle]),
    SettingSearchEntry('Issues & Support', l.sectionIssuesAndSupport,
        l.settingsSeeWhatsNew, [l.settingsSeeWhatsNewSubtitle]),
    SettingSearchEntry('Issues & Support', l.sectionIssuesAndSupport,
        l.settingsWhatsNew, [l.settingsWhatsNewSubtitle]),
    if (bookRequests)
      SettingSearchEntry('Advanced', l.sectionAdvanced, l.breqTitle,
          [l.breqSettingsSubtitle]),
    SettingSearchEntry('Advanced', l.sectionAdvanced, l.rmabImportBooks,
        [l.rmabImportBooksSubtitle, l.rmabImportBooksConnectSubtitle]),

    // Windows Settings (fork section).
    if (WindowsSettingsTiles.isAvailable) ...[
      SettingSearchEntry('Windows Settings', l.windowsSettingsTitle,
          l.desktopShortcutsTitle, [l.desktopShortcutsSubtitle, 'keyboard']),
      SettingSearchEntry('Windows Settings', l.windowsSettingsTitle,
          l.windowsCloseToTray, [l.windowsCloseToTraySubtitle]),
      SettingSearchEntry('Windows Settings', l.windowsSettingsTitle,
          l.windowsStartWithWindows, const []),
      SettingSearchEntry('Windows Settings', l.windowsSettingsTitle,
          l.windowsStartMinimized, [l.windowsStartMinimizedSubtitle]),
      SettingSearchEntry('Windows Settings', l.windowsSettingsTitle,
          l.windowsAlwaysOnTop, [l.windowsAlwaysOnTopSubtitle]),
      SettingSearchEntry('Windows Settings', l.windowsSettingsTitle,
          l.windowsKeepAwake, [l.windowsKeepAwakeSubtitle]),
    ],

    // Cards on the page itself.
    SettingSearchEntry(top, settings, l.tipsAndHiddenFeatures, [l.tipsSubtitle]),
    if (serverAdmin)
      SettingSearchEntry(top, settings, l.serverAdmin, [l.serverAdminSubtitle])
    else if (bookOrbitAdmin)
      SettingSearchEntry(top, settings, l.serverAdmin, [l.boAdminSubtitle]),
    SettingSearchEntry(top, settings, l.backupAndSync, const ['backup', 'sync']),
    SettingSearchEntry(top, settings, l.allBookmarks, [l.allBookmarksSubtitle]),
    if (updates)
      SettingSearchEntry(top, settings, l.checkForUpdate, const ['update', 'version']),
  ];
}
