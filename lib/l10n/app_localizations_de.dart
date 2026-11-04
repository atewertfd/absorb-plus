// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'A B S O R B';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get stillOffline =>
      'Immer noch offline. Tippe, um es erneut zu versuchen.';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get listsNone => 'Keine Sammlungen oder Wiedergabelisten';

  @override
  String get listsNoneHint =>
      'Sammlungen und Wiedergabelisten werden auf deinem Audiobookshelf-Server erstellt und erscheinen hier.';

  @override
  String get listsLoadFailed => 'Deine Listen konnten nicht geladen werden';

  @override
  String get listsLoadFailedHint =>
      'Absorb konnte deinen Server nicht nach Sammlungen und Wiedergabelisten abfragen.';

  @override
  String get listsNoneBookOrbit => 'Keine Sammlungen oder Smart Scopes';

  @override
  String get listsNoneHintBookOrbit =>
      'Sammlungen und Smart Scopes werden auf deinem BookOrbit-Server erstellt und erscheinen hier.';

  @override
  String get listsLoadFailedHintBookOrbit =>
      'Absorb konnte deinen Server nicht nach Sammlungen und Smart Scopes abfragen.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get remove => 'Entfernen';

  @override
  String get save => 'Speichern';

  @override
  String get done => 'Fertig';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get search => 'Suche';

  @override
  String get apply => 'Anwenden';

  @override
  String get enable => 'Aktivieren';

  @override
  String get clear => 'Zurücksetzen';

  @override
  String get off => 'Aus';

  @override
  String get disabled => 'Deaktiviert';

  @override
  String get later => 'Später';

  @override
  String get whatsNewTitle => 'Absorb wurde aktualisiert';

  @override
  String whatsNewContent(String version) {
    return 'Du verwendest jetzt $version.';
  }

  @override
  String get whatsNewButton => 'Neuigkeiten ansehen';

  @override
  String get whatsNewKeepShowing => 'Nach jedem Update anzeigen';

  @override
  String get whatsNewKeepShowingHint =>
      'Du kannst es in den Einstellungen wieder aktivieren';

  @override
  String get settingsWhatsNew => 'Neuigkeiten nach Updates anzeigen';

  @override
  String get settingsWhatsNewSubtitle =>
      'Nach einem Update die Neuigkeiten in der App anzeigen';

  @override
  String get gotIt => 'Verstanden';

  @override
  String get betaLoggingTitle => 'Protokolle sind aktiv';

  @override
  String get betaLoggingContent =>
      'Da dies eine Beta ist, führt Absorb jetzt Protokolle, um Probleme leichter zu finden. Sie bleiben auf diesem Gerät, solange du sie nicht teilst.\n\nDu kannst sie in den Einstellungen unter „Probleme & Support“ senden oder ausschalten. Wenn du sie ausschaltest, bleiben sie auch in späteren Betas aus.';

  @override
  String get preview => 'Vorschau';

  @override
  String get or => 'oder';

  @override
  String get file => 'Datei';

  @override
  String get more => 'Mehr';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get untitled => 'Ohne Titel';

  @override
  String get noThanks => 'Nein, danke';

  @override
  String get stay => 'Bleiben';

  @override
  String get homeTitle => 'Start';

  @override
  String get continueListening => 'Weiterhören';

  @override
  String get continueReading => 'Weiterlesen';

  @override
  String get continueSeries => 'Serie fortsetzen';

  @override
  String get recentlyAdded => 'Kürzlich hinzugefügt';

  @override
  String get listenAgain => 'Nochmal hören';

  @override
  String get discover => 'Entdecken';

  @override
  String get newEpisodes => 'Neue Episoden';

  @override
  String get downloads => 'Downloads';

  @override
  String get noDownloadedBooks => 'Keine heruntergeladenen Bücher';

  @override
  String get yourLibraryIsEmpty => 'Deine Bibliothek ist leer';

  @override
  String get downloadBooksWhileOnline =>
      'Lade Bücher herunter, solange du online bist, um sie offline zu hören';

  @override
  String get customizeHome => 'Startseite anpassen';

  @override
  String get dragToReorderTapEye =>
      'Zum Umsortieren ziehen, Auge antippen zum Ein-/Ausblenden';

  @override
  String get loginTagline => 'Start Absorbing';

  @override
  String get loginConnectToServer => 'Verbinde dich mit deinem Server';

  @override
  String get loginServerAddress => 'Serveradresse';

  @override
  String get loginServerHint => 'my.server.com';

  @override
  String get loginServerHelper =>
      'IP:Port funktioniert auch (z. B. 192.168.1.5:13378)';

  @override
  String get loginCouldNotReachServer => 'Server nicht erreichbar';

  @override
  String get loginAdvanced => 'Erweitert';

  @override
  String get loginCustomHttpHeaders => 'Eigene HTTP-Header';

  @override
  String get loginCustomHeadersDescription =>
      'Für Cloudflare-Tunnel oder Reverse-Proxys, die zusätzliche Header benötigen. Header hinzufügen, bevor du die Server-URL eingibst.';

  @override
  String get loginHeaderName => 'Header-Name';

  @override
  String get loginHeaderValue => 'Wert';

  @override
  String get loginAddHeader => 'Header hinzufügen';

  @override
  String get loginSelfSignedCertificates => 'Selbstsignierte Zertifikate';

  @override
  String get loginTrustAllCertificates =>
      'Allen Zertifikaten vertrauen (für selbstsignierte / eigene CA-Setups)';

  @override
  String get loginApiKey => 'API-Schlüssel';

  @override
  String get loginApiKeyDescription =>
      'Verwende einen vom Admin generierten API-Schlüssel statt Benutzername/Passwort. Praktisch, wenn die Token-Erneuerung für dein Konto fehlschlägt.';

  @override
  String get loginWaitingForSso => 'Warte auf SSO...';

  @override
  String get loginRedirectUri => 'Redirect-URI: audiobookshelf://oauth';

  @override
  String get loginOrSignInManually => 'oder manuell anmelden';

  @override
  String get loginUsername => 'Benutzername';

  @override
  String get loginUsernameRequired => 'Bitte gib deinen Benutzernamen ein';

  @override
  String get loginPassword => 'Passwort';

  @override
  String get loginSignIn => 'Anmelden';

  @override
  String loginSignInAs(String username) {
    return 'Als $username anmelden?';
  }

  @override
  String get loginSignInToServer => 'Auf diesem Server anmelden?';

  @override
  String loginSignedInAs(String username) {
    return 'Als $username angemeldet';
  }

  @override
  String get adminCreateSetupFile => 'Anmeldung teilen';

  @override
  String adminSetupFileDescription(String username) {
    return 'Erstellt einen privaten Anmelde-Link für $username, der nur in der Absorb-App funktioniert.';
  }

  @override
  String get adminSetupFileServerUrl =>
      'Server-URL, die der neue Benutzer verwenden wird';

  @override
  String get adminSetupFileNoteWithHeaders =>
      'Ein API-Key und die benutzerdefinierten Header werden mit eingeschlossen, um die Anmeldung auf dem Server zu ermöglichen. Behandle den Link wie ein Passwort.';

  @override
  String get adminSetupFileNote =>
      'Ein spezieller API-Schlüssel wird hinzugefügt. Behandle den Link wie ein Passwort.';

  @override
  String get adminSetupFileCreate => 'Link erstellen';

  @override
  String get adminSetupFileSaveTitle => 'Setup Datei speichern';

  @override
  String get adminSetupFileKeyError =>
      'Für diesen Benutzer konnte kein API Key erstellt werden';

  @override
  String adminSetupFileSaved(String username) {
    return 'Setup-Datei für $username gespeichert';
  }

  @override
  String adminSetupFileFailed(String error) {
    return 'Fehler beim Erstellen der Anmeldung: $error';
  }

  @override
  String get setupLinkShareTitle => 'Anmeldung teilen';

  @override
  String setupLinkShareDescription(String username) {
    return 'Versende diesen privaten Link oder lasse den QR Code scannen, um eine Anmeldung als $username zu ermöglichen.';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return 'Jeder mit diesem Link kann sich als $username anmelden. Behandle ihn wie ein Passwort.';
  }

  @override
  String get setupLinkShare => 'Link teilen';

  @override
  String get setupLinkCopy => 'Link kopieren';

  @override
  String get setupLinkCopied => 'Anmelde-Link kopiert';

  @override
  String get setupLinkSaveFile => 'Setup Datei speichern';

  @override
  String get setupLinkQrError =>
      'Dieser Setup-Link ist zu groß für einen QR-Code. Teile stattdessen den Link.';

  @override
  String setupLinkShareSubject(String username) {
    return 'Absorb Anmeldung für $username';
  }

  @override
  String get setupLinkConfirmTitle => 'Mit diesem Link anmelden?';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return 'Bei $server als $username anmelden? Fahre nur fort, wenn du diesem Link vertraust.';
  }

  @override
  String get setupLinkInvalid =>
      'Dieser Anmelde-Link ist ungültig oder unvollständig';

  @override
  String get setupLinkSigningIn => 'Anmelde-Link wird überprüft...';

  @override
  String get loginPlayDownloads => 'Deine Downloads abspielen';

  @override
  String signedOutDownloadsNote(String username) {
    return 'Du bist abgemeldet. Alles, was du hier hörst, wird mit $username synchronisiert, sobald du dich wieder anmeldest.';
  }

  @override
  String get loginPasteLink => 'Anmelde-Link einfügen';

  @override
  String get loginPasteLinkHelp =>
      'Füge den vollständigen Anmelde-Link ein, den du erhalten hast. Behandle ihn wie ein Passwort.';

  @override
  String get loginFailed => 'Anmeldung fehlgeschlagen';

  @override
  String get loginSsoFailed => 'SSO-Anmeldung fehlgeschlagen oder abgebrochen';

  @override
  String get loginSsoAuthFailed =>
      'SSO-Authentifizierung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get loginRestoreFromBackup => 'Importieren';

  @override
  String get loginInvalidBackupFile => 'Ungültige Backup-Datei';

  @override
  String get loginRestoreBackupTitle => 'Backup wiederherstellen?';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return 'Damit werden alle Einstellungen und $count gespeicherte Konten wiederhergestellt. Du wirst automatisch angemeldet.';
  }

  @override
  String get loginRestoreBackupNoAccounts =>
      'Damit werden alle Einstellungen wiederhergestellt. Es waren keine Konten in diesem Backup enthalten.';

  @override
  String get loginRestore => 'Wiederherstellen';

  @override
  String loginRestoredAndSignedIn(String username) {
    return 'Einstellungen wiederhergestellt und als $username angemeldet';
  }

  @override
  String get loginSessionExpired =>
      'Einstellungen wiederhergestellt. Sitzung abgelaufen - melde dich an, um fortzufahren.';

  @override
  String get loginSettingsRestored => 'Einstellungen wiederhergestellt';

  @override
  String loginRestoreFailed(String error) {
    return 'Wiederherstellung fehlgeschlagen: $error';
  }

  @override
  String get loginSavedAccounts => 'gespeicherte Konten';

  @override
  String get libraryTitle => 'Bibliothek';

  @override
  String get librarySearchBooksHint =>
      'Bücher, Serien, Autoren, Sprecher suchen...';

  @override
  String get librarySearchShowsHint => 'Sendungen und Episoden suchen...';

  @override
  String get libraryTabLibrary => 'Bibliothek';

  @override
  String get libraryTabSeries => 'Serien';

  @override
  String get libraryTabAuthors => 'Autoren';

  @override
  String get libraryTabNarrators => 'Sprecher';

  @override
  String get libraryNoBooks => 'Keine Bücher gefunden';

  @override
  String get libraryNoUnfinishedBooks => 'Keine unerledigten Bücher';

  @override
  String get libraryNoBooksInProgress => 'Keine angefangenen Bücher';

  @override
  String get libraryNoFinishedBooks => 'Keine beendeten Bücher';

  @override
  String get libraryAllBooksStarted => 'Alle Bücher wurden begonnen';

  @override
  String get libraryNoDownloadedBooks => 'Keine heruntergeladenen Bücher';

  @override
  String get libraryNoSeriesFound => 'Keine Serien gefunden';

  @override
  String get libraryNoBooksWithEbooks => 'Keine Bücher mit eBooks';

  @override
  String get libraryNoBooksMissingMetadata =>
      'Diese Metadaten fehlen in keinem Buch';

  @override
  String get libraryNoItemsMatchingFilter =>
      'Keine Elemente entsprechen diesem Filter';

  @override
  String libraryNoBooksInGenre(String genre) {
    return 'Keine Bücher in \"$genre\"';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return 'Keine Bücher mit dem Schlagwort \"$tag\"';
  }

  @override
  String get libraryClearFilter => 'Filter zurücksetzen';

  @override
  String get libraryNoAuthorsFound => 'Keine Autoren gefunden';

  @override
  String get libraryNoNarratorsFound => 'Keine Sprecher gefunden';

  @override
  String get libraryNoResults => 'Keine Ergebnisse gefunden';

  @override
  String get librarySearchBooks => 'Bücher';

  @override
  String get librarySearchShows => 'Sendungen';

  @override
  String get librarySearchEpisodes => 'Episoden';

  @override
  String get librarySearchSeries => 'Serien';

  @override
  String get librarySearchAuthors => 'Autoren';

  @override
  String get librarySearchTags => 'Schlagwörter';

  @override
  String get librarySearchGenres => 'Genres';

  @override
  String librarySeriesCount(int count) {
    return '$count Serien';
  }

  @override
  String libraryAuthorsCount(int count) {
    return '$count Autoren';
  }

  @override
  String libraryNarratorsCount(int count) {
    return '$count Sprecher';
  }

  @override
  String libraryBooksCount(int loaded, int total) {
    return '$loaded/$total Bücher';
  }

  @override
  String get sort => 'Sortieren';

  @override
  String get filter => 'Filter';

  @override
  String get filterActive => 'Filter ●';

  @override
  String get name => 'Name';

  @override
  String get title => 'Titel';

  @override
  String get author => 'Autor';

  @override
  String get dateAdded => 'Hinzugefügt am';

  @override
  String get numberOfBooks => 'Anzahl Bücher';

  @override
  String get sortTotalDuration => 'Gesamtdauer';

  @override
  String get sortLastBookAdded => 'Zuletzt hinzugefügtes Buch';

  @override
  String get sortLastBookUpdated => 'Zuletzt aktualisiertes Buch';

  @override
  String get publishedYear => 'Erscheinungsjahr';

  @override
  String get duration => 'Dauer';

  @override
  String get random => 'Zufällig';

  @override
  String get collapseSeries => 'Serien zusammenklappen';

  @override
  String get notFinished => 'Unerledigt';

  @override
  String get inProgress => 'Angefangen';

  @override
  String get filterFinished => 'Beendet';

  @override
  String get notStarted => 'Nicht begonnen';

  @override
  String get downloaded => 'Heruntergeladen';

  @override
  String get hasEbook => 'Mit eBook';

  @override
  String get noEbook => 'Kein eBook';

  @override
  String get hasSupplementaryEbook => 'Hat ergänzendes eBook';

  @override
  String get noSupplementaryEbook => 'Kein ergänzendes eBook';

  @override
  String get noSeries => 'Keine Reihe';

  @override
  String get publishedDecade => 'Veröffentlichtes Jahrzehnt';

  @override
  String get tracks => 'Titel';

  @override
  String get noTracks => 'Keine Titel';

  @override
  String get singleTrack => 'Einzelner Titel';

  @override
  String get multipleTracks => 'Mehrere Titel';

  @override
  String get abridged => 'Gekürzt';

  @override
  String get issues => 'Probleme';

  @override
  String get rssFeedOpen => 'RSS-Feed geöffnet';

  @override
  String get explicitContent => 'Explizit';

  @override
  String get missingMetadata => 'Fehlende Metadaten';

  @override
  String get genre => 'Genre';

  @override
  String get tag => 'Schlagwort';

  @override
  String get clearFilter => 'Filter zurücksetzen';

  @override
  String get noGenresFound => 'Keine Genres gefunden';

  @override
  String get noTagsFound => 'Keine Schlagwörter gefunden';

  @override
  String get asc => 'AUF';

  @override
  String get desc => 'AB';

  @override
  String get fileSize => 'Dateigröße';

  @override
  String get lastUpdated => 'Zuletzt aktualisiert';

  @override
  String get fileCreated => 'Datei erstellt';

  @override
  String get lastModified => 'Zuletzt geändert';

  @override
  String get authorFirstLast => 'Autor (Erster Letzter)';

  @override
  String get authorLastFirst => 'Autor (Letzter, Erster)';

  @override
  String get progressSort => 'Fortschritt';

  @override
  String get dateStarted => 'Startdatum';

  @override
  String get dateFinished => 'Abschlussdatum';

  @override
  String get episodeCount => 'Anzahl Folgen';

  @override
  String get sequence => 'Reihe-Reihenfolge';

  @override
  String get absorbingTitle => 'Absorbing';

  @override
  String get absorbingStop => 'Stopp';

  @override
  String get absorbingManageQueue => 'Warteschlange verwalten';

  @override
  String get absorbingDone => 'Fertig';

  @override
  String get absorbingNoDownloadedEpisodes =>
      'Keine heruntergeladenen Episoden';

  @override
  String get absorbingNoDownloadedBooks => 'Keine heruntergeladenen Bücher';

  @override
  String get absorbingNothingPlayingYet => 'Es läuft noch nichts';

  @override
  String get absorbingNothingAbsorbingYet => 'Noch nichts am Absorbing';

  @override
  String get absorbingDownloadEpisodesToListen =>
      'Episoden herunterladen, um offline zu hören';

  @override
  String get absorbingDownloadBooksToListen =>
      'Bücher herunterladen, um offline zu hören';

  @override
  String get absorbingStartEpisodeFromShows =>
      'Starte eine Episode aus dem Sendungen-Tab';

  @override
  String get absorbingStartBookFromLibrary =>
      'Starte ein Buch aus dem Bibliothek-Tab';

  @override
  String get carModeTitle => 'Auto-Modus';

  @override
  String get carModeNoBookLoaded => 'Kein Buch geladen';

  @override
  String get carModeBookLabel => 'Buch';

  @override
  String get carModeChapterLabel => 'Kapitel';

  @override
  String get carModeBookmarkDefault => 'Lesezeichen';

  @override
  String get carModeBookmarkAdded => 'Lesezeichen hinzugefügt';

  @override
  String get downloadsTitle => 'Downloads';

  @override
  String get downloadsCancelSelection => 'Auswahl aufheben';

  @override
  String get downloadsSelect => 'Auswählen';

  @override
  String get downloadsNoDownloads => 'Keine Downloads';

  @override
  String get downloadsDownloading => 'Wird heruntergeladen';

  @override
  String get downloadsQueued => 'In Warteschlange';

  @override
  String get downloadsCompleted => 'Abgeschlossen';

  @override
  String get downloadsEbooks => 'eBooks';

  @override
  String get downloadsWaiting => 'Warten...';

  @override
  String get downloadsCancel => 'Abbrechen';

  @override
  String get downloadsDelete => 'Löschen';

  @override
  String downloadsDeleteCount(int count) {
    return '$count Download(s) löschen?';
  }

  @override
  String get downloadsDeleteContent =>
      'Heruntergeladene Dateien werden von diesem Gerät entfernt.';

  @override
  String downloadsDeletedCount(int count) {
    return '$count Download(s) gelöscht';
  }

  @override
  String get downloadsRemoveTitle => 'Download entfernen?';

  @override
  String downloadsRemoveContent(String title) {
    return '\"$title\" von diesem Gerät löschen?';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return '\"$title\" entfernt';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return '„$title“ konnte nicht heruntergeladen werden - eine der Dateien fehlt auf dem Server. Ein Bibliotheks-Scan kann das beheben.';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return '„$title“ konnte nicht heruntergeladen werden - nicht genug Speicherplatz';
  }

  @override
  String downloadFailedPermission(String title) {
    return '„$title“ konnte nicht heruntergeladen werden - prüfe den Download-Speicherort in den Einstellungen';
  }

  @override
  String downloadFailedGeneric(String title) {
    return '„$title“ konnte nicht heruntergeladen werden';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '$count ausgewählt';
  }

  @override
  String get bookmarksTitle => 'Alle Lesezeichen';

  @override
  String get bookmarksTabBookmarks => 'Lesezeichen';

  @override
  String get bookmarksTabHighlights => 'Markierungen';

  @override
  String get highlightOpenInBook => 'In Buch öffnen';

  @override
  String get highlightDeleteAction => 'Markierung löschen';

  @override
  String get highlightDeleted => 'Markierung gelöscht';

  @override
  String highlightsDeleteCount(int count) {
    return '$count Markierung(en) löschen?';
  }

  @override
  String highlightsDeletedCount(int count) {
    return '$count Markierung(en) gelöscht';
  }

  @override
  String get quoteShareTitle => 'Zitat teilen';

  @override
  String get quoteShareAction => 'Teilen';

  @override
  String get quoteShareFailed => 'Das Zitatbild konnte nicht erstellt werden';

  @override
  String get quoteShapePortrait => 'Portrait';

  @override
  String get quoteShapeSquare => 'Quadrat';

  @override
  String get quoteShapeStory => 'Geschichte';

  @override
  String get quoteStyleBlur => 'Unscharf';

  @override
  String get quoteStyleDim => 'Abgedunkelt';

  @override
  String get quoteStyleNone => 'Normales Cover';

  @override
  String get quoteTextLight => 'Heller Text';

  @override
  String get quoteTextDark => 'Dunkler Text';

  @override
  String get quoteFieldTitle => 'Titel';

  @override
  String get quoteFieldDetail => 'Details';

  @override
  String get quoteFieldDetailHint => 'Autor, Kapitel, Seite, wer es gesagt hat';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => 'Auswahl aufheben';

  @override
  String get bookmarksSortedByNewest => 'Sortiert nach neuesten';

  @override
  String get bookmarksSortedByPosition => 'Sortiert nach Position';

  @override
  String get bookmarksSelect => 'Auswählen';

  @override
  String get bookmarksNoBookmarks => 'Noch keine Lesezeichen';

  @override
  String get bookmarksSearchHint => 'Lesezeichen durchsuchen';

  @override
  String get bookmarksNoMatches => 'Keine Lesezeichen passen zu deiner Suche';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher werden heruntergeladen',
      one: '1 Buch wird heruntergeladen',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => 'Bereits heruntergeladen';

  @override
  String bookmarksDeleteCount(int count) {
    return '$count Lesezeichen löschen?';
  }

  @override
  String get bookmarksDeleteContent =>
      'Das kann nicht rückgängig gemacht werden.';

  @override
  String bookmarksDeletedCount(int count) {
    return '$count Lesezeichen gelöscht';
  }

  @override
  String get bookmarksJumpTitle => 'Zum Lesezeichen springen?';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '\"$title\" bei $position\nin $bookTitle';
  }

  @override
  String get bookmarksJump => 'Springen';

  @override
  String get bookmarksNotConnected => 'Nicht mit dem Server verbunden';

  @override
  String get bookmarksCouldNotLoad => 'Buch konnte nicht geladen werden';

  @override
  String bookmarksSelectedCount(int count) {
    return '$count ausgewählt';
  }

  @override
  String get statsTitle => 'Deine Statistiken';

  @override
  String get statsCouldNotLoad => 'Statistiken konnten nicht geladen werden';

  @override
  String get statsTotalListeningTime => 'GESAMTE HÖRZEIT';

  @override
  String get statsHoursUnit => 'h';

  @override
  String get statsMinutesUnit => 'm';

  @override
  String get statsSecondsUnit => 's';

  @override
  String statsDaysOfAudio(String days) {
    return 'Das sind $days Tage Audio';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return 'Das sind $hours Stunden Audio';
  }

  @override
  String get statsToday => 'Heute';

  @override
  String get statsThisWeek => 'Diese Woche';

  @override
  String get statsThisMonth => 'Diesen Monat';

  @override
  String get statsActivity => 'Aktivität';

  @override
  String get statsCurrentStreak => 'Aktueller Streak';

  @override
  String get statsBestStreak => 'Bester Streak';

  @override
  String get statsFinished => 'Beendet';

  @override
  String get statsBooksFinished => 'Bücher';

  @override
  String get statsEpisodesFinished => 'Episoden';

  @override
  String get statsBooksThisYear => 'Bücher dieses Jahr';

  @override
  String get statsEpisodesThisYear => 'Episoden dieses Jahr';

  @override
  String get statsRemoveFromYearTitle => 'Aus diesem Jahr entfernen';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return 'Das Enddatum wird weiterhin als $date auf dem Server erhalten bleiben. Dies entfernt nur \"$title\" von deiner Absorb \"Bücher-des-Jahres\" Liste.';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return 'Das Enddatum wird weiterhin auf dem Server erhalten bleiben. Dies entfernt nur \"$title\" von deiner Absorb \"Bücher-des-Jahres\" Liste.';
  }

  @override
  String get statsRemovedFromYear => 'Aus diesem Jahr entfernt';

  @override
  String get statsAddBackToYearTitle => 'Diesem Jahr wieder hinzufügen';

  @override
  String statsAddBackToYearBody(String title) {
    return '\"$title\" zurück zu deiner Absorb \"Bücher-des-Jahres\" Liste hinzufügen?';
  }

  @override
  String get statsAddBack => 'Wieder hinzufügen';

  @override
  String get statsAddedBackToYear => 'Diesem Jahr wieder hinzugefügt';

  @override
  String get statsHiddenFromYear => 'Aus diesem Jahr ausgeblendet';

  @override
  String get statsNothingHidden => 'Nichts ausgeblendet';

  @override
  String get settingsCustomizeStats => 'Statistiken anpassen';

  @override
  String get statsGoalTitle => 'Hörziel';

  @override
  String get statsGoalOff => 'Aus';

  @override
  String get statsGoalDaily => 'Täglich';

  @override
  String get statsGoalWeekly => 'Wöchentlich';

  @override
  String get statsGoalMonthly => 'Monatlich';

  @override
  String get statsGoalTarget => 'Ziel';

  @override
  String get statsGoalEnterTitle => 'Ziel festlegen';

  @override
  String get statsGoalEnterTimeHint => 'Minuten oder h:mm';

  @override
  String statsBooksShort(int count) {
    return '$count Bücher';
  }

  @override
  String get statsBookChallengeTitle => 'Lese-Challenge';

  @override
  String get statsBookChallengeDesc => 'Zu beendende Bücher für dieses Jahr';

  @override
  String get statsDailyGoal => 'Tagesziel';

  @override
  String get statsWeeklyGoal => 'Wochenziel';

  @override
  String get statsMonthlyGoal => 'Monatsziel';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$done von $target Büchern';
  }

  @override
  String get statsGoalReached => 'Ziel erreicht';

  @override
  String get statsChartTitle => 'Hörstatistik';

  @override
  String get statsChartBar => 'Leiste';

  @override
  String get statsChartLine => 'Linie';

  @override
  String get statsChartHeatmap => 'Heatmap';

  @override
  String get statsChartDays7 => '7 Tage';

  @override
  String get statsChartDays30 => '30 Tage';

  @override
  String get statsLast30Days => 'Letzten 30 Tage';

  @override
  String get statsThisYearTitle => 'Dieses Jahr';

  @override
  String get statsSectionsTitle => 'Kategorien';

  @override
  String get statsSectionTimePeriods => 'Zeiträume';

  @override
  String get statsHeatmapLess => 'Weniger';

  @override
  String get statsHeatmapMore => 'Mehr';

  @override
  String get statsDayOfWeek => 'Durchschnitt nach Wochentag';

  @override
  String get statsTimeSavedLabel => 'Nach Geschwindigkeit gespeichert';

  @override
  String statsTimeSavedSince(String date) {
    return 'seit $date';
  }

  @override
  String get statsTimeSavedReset => 'Gesparte Zeit zurücksetzen';

  @override
  String get statsTimeSavedResetConfirm =>
      'Die gesparte Zeit beginnt ab heute wieder zu zählen.';

  @override
  String get statsTimeSavedResetDone => 'Gesparte Zeit zurückgesetzt';

  @override
  String statsOnPaceFor(int count) {
    return 'Auf Kurs für $count Bücher';
  }

  @override
  String get statsDaysActive => 'Aktive Tage';

  @override
  String get statsDailyAverage => 'Täglicher Durchschnitt';

  @override
  String get statsLast7Days => 'Letzte 7 Tage';

  @override
  String get statsMostListened => 'Meistgehört';

  @override
  String get statsRecentSessions => 'Letzte Sitzungen';

  @override
  String get appShellHomeTab => 'Start';

  @override
  String get appShellLibraryTab => 'Bibliothek';

  @override
  String get appShellAbsorbingTab => 'Absorbing';

  @override
  String get appShellStatsTab => 'Statistiken';

  @override
  String get appShellSettingsTab => 'Einstellungen';

  @override
  String get appShellDiscoverTab => 'Entdecken';

  @override
  String get appShellShowsTab => 'Sendungen';

  @override
  String get appShellPodcastsTab => 'Podcasts';

  @override
  String get libraryTabEpisodes => 'Folgen';

  @override
  String get filterAllEpisodes => 'Alle';

  @override
  String get filterUnplayed => 'Ungespielt';

  @override
  String get episodeFeedEmpty => 'Keine Folgen entsprechen diesem Filter';

  @override
  String get podcastFilterUpNext => 'Als Nächstes';

  @override
  String get podcastFilterNew => 'Neu';

  @override
  String get settingsPodcastTab => 'Podcast-Tab';

  @override
  String get settingsPodcastTabDesc =>
      'Gib einer Podcast-Bibliothek einen eigenen Tab in der unteren Leiste';

  @override
  String get settingsPodcastTabLibrary => 'Podcasts Registerkarte';

  @override
  String get settingsMergeImpliedByPodcastTab =>
      'Immer eingeschaltet, während der Podcasts-Tab aktiviert ist';

  @override
  String get settingsEpisodeNotifs => 'Benachrichtigungseinstellungen';

  @override
  String get settingsEpisodeNotifsDesc =>
      'Abonnierte Podcasts im Hintergrund prüfen';

  @override
  String get notifIntervalOff => 'Aus';

  @override
  String notifIntervalMinutes(int n) {
    return 'Alle $n Minuten';
  }

  @override
  String get notifIntervalHour => 'Jede Stunde';

  @override
  String notifIntervalHours(int n) {
    return 'Alle $n Stunden';
  }

  @override
  String get settingsBatteryUnrestricted =>
      'Unbeschränkten Akkuverbrauch zulassen';

  @override
  String get settingsBatteryUnrestrictedDesc =>
      'Hindert das System daran, Hintergrundüberprüfungen auf einigen Telefonen anzuhalten';

  @override
  String get appShellPressBackToExit => 'Erneut zurück drücken zum Beenden';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get sectionAppearance => 'Darstellung';

  @override
  String get languageLabel => 'Sprache';

  @override
  String get languageSystemDefault => 'Systemstandard';

  @override
  String get languageHelpTranslateInvite =>
      'Möchtest du Absorb in deine Sprache übersetzen?';

  @override
  String get themeLabel => 'Theme';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeAuto => 'Automatisch';

  @override
  String get colorSourceLabel => 'Farbquelle';

  @override
  String get colorSourceCoverDescription =>
      'App-Farben richten sich nach dem Cover des aktuell laufenden Buchs';

  @override
  String get colorSourceWallpaperDescription =>
      'App-Farben richten sich nach deinem System-Hintergrundbild';

  @override
  String get colorSourceWallpaper => 'Hintergrundbild';

  @override
  String get colorSourceNowPlaying => 'Wiedergabe';

  @override
  String get colorSourceDynamic => 'Dynamisch';

  @override
  String get colorSourceManual => 'Manuell';

  @override
  String get colorSourceManualDescription => 'Wähle unten eine feste App-Farbe';

  @override
  String get colorSourceCustom => 'Benutzerdefiniert';

  @override
  String get useColorEverywhereLabel => 'Diese Farbe überall verwenden';

  @override
  String get useColorEverywhereSubtitle =>
      'Nutze die benutzerdefinierte Farbe statt der dynamischen für die Buchdetails und die Wiedergabekarten';

  @override
  String get flatBackgroundLabel => 'Flacher Hintergrund';

  @override
  String get flatBackgroundSubtitle =>
      'Hintergrundverlauf entfernen. Schwarz im Dunkelmodus für OLED-Bildschirme.';

  @override
  String get einkModeLabel => 'E-Ink Modus';

  @override
  String get einkModeSubtitle =>
      'Kontrastreiches Schwarz-Weiß ohne Animationen, für E-Ink-Displays gemacht';

  @override
  String get einkModeIntroBody =>
      'Für E-Ink-Displays gemacht. Die App wechselt zu einem flachen, kontrastreichen Schwarz-Weiß-Look, Animationen werden ausgeschaltet, die Wiedergabekarte verliert ihren Hintergrund und die Live-Verbindung zum Server bleibt aus, um Akku zu sparen. Wiedergabe und Fortschritt werden weiterhin normal synchronisiert. Deine Darstellungseinstellungen bleiben erhalten und kommen zurück, wenn du das ausschaltest.';

  @override
  String get einkModeIntroConfirm => 'Einschalten';

  @override
  String get backgroundIntensityLabel => 'Hintergrundintensität';

  @override
  String get startScreenLabel => 'Startbildschirm';

  @override
  String get startScreenSubtitle =>
      'Welcher Tab beim Start der App geöffnet wird';

  @override
  String get startScreenHome => 'Start';

  @override
  String get startScreenLibrary => 'Bibliothek';

  @override
  String get startScreenAbsorb => 'Absorb';

  @override
  String get startScreenStats => 'Statistiken';

  @override
  String get disablePageFade => 'Seiten-Überblendung deaktivieren';

  @override
  String get disablePageFadeOnSubtitle => 'Seiten wechseln sofort';

  @override
  String get disablePageFadeOffSubtitle =>
      'Seiten blenden beim Tab-Wechsel über';

  @override
  String get rectangleBookCovers => 'Rechteckige Buchcover';

  @override
  String get progressTextSize => 'Fortschritts-Textgröße';

  @override
  String get rectangleBookCoversOnSubtitle =>
      'Cover werden im 2:3-Buchformat angezeigt';

  @override
  String get rectangleBookCoversOffSubtitle => 'Cover sind quadratisch';

  @override
  String get coverSize => 'Cover Größe';

  @override
  String get coverSizeSubtitle =>
      'Wie viele Cover nebeneinander in das Bibliotheksraster passen';

  @override
  String get coverSizeSmall => 'Klein';

  @override
  String get coverSizeMedium => 'Mittel';

  @override
  String get coverSizeLarge => 'Groß';

  @override
  String get sectionAbsorbingCards => 'Absorbing-Karten';

  @override
  String get fullScreenPlayer => 'Vollbild-Player';

  @override
  String get fullScreenPlayerOnSubtitle =>
      'An - Bücher öffnen sich beim Abspielen im Vollbild';

  @override
  String get fullScreenPlayerOffSubtitle =>
      'Aus - Wiedergabe in der Kartenansicht';

  @override
  String get fullBookScrubber => 'Ganzes-Buch-Scrubber';

  @override
  String get fullBookScrubberOnSubtitle =>
      'An - durchziehbarer Slider über das gesamte Buch';

  @override
  String get fullBookScrubberOffSubtitle => 'Aus - nur Fortschrittsbalken';

  @override
  String get cardScrubbers => 'Karten scrubber';

  @override
  String get cardScrubbersBoth => 'Beides';

  @override
  String get cardScrubbersChapter => 'Kapitel';

  @override
  String get cardScrubbersLocked => 'Gesperrt';

  @override
  String get cardScrubbersBothSubtitle =>
      'Vollständige Buch- und Kapitelleisten können suchen';

  @override
  String get cardScrubbersChapterSubtitle =>
      'Nur die Kapitelleiste kann suchen';

  @override
  String get cardScrubbersLockedSubtitle =>
      'Fortschritt wird angezeigt, ohne zu suchen';

  @override
  String get speedAdjustedTime => 'Geschwindigkeitsangepasste Zeit';

  @override
  String get speedAdjustedTimeOnSubtitle =>
      'An - verbleibende Zeit berücksichtigt die Wiedergabegeschwindigkeit';

  @override
  String get speedAdjustedTimeOffSubtitle => 'Aus - zeigt die reine Audiodauer';

  @override
  String get buttonLayout => 'Button-Anordnung';

  @override
  String get buttonLayoutSubtitle =>
      'Wie die Aktions-Buttons auf der Karte angeordnet sind';

  @override
  String get whenAbsorbed => 'Beim Absorb';

  @override
  String get whenAbsorbedInfoTitle => 'Beim Absorb';

  @override
  String get whenAbsorbedInfoContent =>
      'Steuert, was mit einer Absorbing-Karte passiert, wenn du ein Buch oder eine Episode beendest.\n\nBeendete Karten werden automatisch von deinem Absorbing-Bildschirm entfernt.';

  @override
  String get whenAbsorbedSubtitle =>
      'Was mit der Absorbing-Karte passiert, wenn ein Buch oder eine Episode endet';

  @override
  String get whenAbsorbedShowOverlay => 'Overlay anzeigen';

  @override
  String get whenAbsorbedAutoRelease => 'Automatisch entfernen';

  @override
  String get mergeLibraries => 'Bibliotheken zusammenführen';

  @override
  String get mergeLibrariesInfoTitle => 'Bibliotheken zusammenführen';

  @override
  String get mergeLibrariesInfoContent =>
      'Wenn aktiviert, zeigt der Absorbing-Bildschirm alle deine angefangenen Bücher und Podcasts aus jeder Bibliothek in einer Ansicht. Wenn deaktiviert, werden nur Inhalte aus der aktuell ausgewählten Bibliothek angezeigt.';

  @override
  String get mergeLibrariesOnSubtitle =>
      'Absorbing-Seite zeigt Inhalte aus allen Bibliotheken';

  @override
  String get mergeLibrariesOffSubtitle =>
      'Absorbing-Seite zeigt nur die aktuelle Bibliothek';

  @override
  String get queueMode => 'Warteschlangenmodus';

  @override
  String get queueModeInfoTitle => 'Warteschlangenmodus';

  @override
  String get queueModeInfoOff => 'Aus';

  @override
  String get queueModeInfoOffDesc =>
      'Die Wiedergabe stoppt, wenn das aktuelle Buch oder die Episode endet.';

  @override
  String get queueModeInfoManual => 'Manuelle Warteschlange';

  @override
  String get queueModeInfoManualDesc =>
      'Deine Absorbing-Karten funktionieren wie eine Playlist. Wenn eine endet, läuft die nächste noch nicht beendete Karte automatisch weiter. Füge Inhalte über den Button \"Zu Absorbing hinzufügen\" bei einem Buch oder einer Episode hinzu und sortiere sie auf dem Absorbing-Bildschirm um.';

  @override
  String get queueModeOff => 'Aus';

  @override
  String get queueModeManual => 'Manuell';

  @override
  String get queueModeAuto => 'Auto';

  @override
  String get queueModePlaylist => 'Wiedergabeliste';

  @override
  String get queueModeCollection => 'Sammlung';

  @override
  String get queueModeInfoPlaylist => 'Playlist Warteschlange';

  @override
  String get queueModeInfoPlaylistDesc =>
      'Spielt von einer Wiedergabeliste alle Einträge der Reihenfolge nach ab und überspringt bereits abgeschlossene Elemente. Die Wiedergabe stoppt am Ende der Liste.';

  @override
  String get queuePlaylistPickerTitle => 'Wähle eine Playlist';

  @override
  String get queuePlaylistNone => 'Keine Wiedergabeliste ausgewählt';

  @override
  String queuePlaylistActiveLabel(String name) {
    return 'Wiedergabeliste: $name';
  }

  @override
  String get queueModePlaylistHint =>
      'Starte eine Wiedergabeliste-Warteschlange, indem du eine Wiedergabeliste auf der Startseite öffnest.';

  @override
  String get exit => 'Beenden';

  @override
  String upNext(String label) {
    return 'Als Nächstes: $label';
  }

  @override
  String get nothingUpNext => '\"Als Nächstes\" ist leer';

  @override
  String get showUpNextLabel =>
      '\"Als Nächstes\" auf der Absorbing Seite anzeigen';

  @override
  String get openSeries => 'Serie öffnen';

  @override
  String get openPlaylist => 'Playlist öffnen';

  @override
  String get openCollection => 'Sammlung öffnen';

  @override
  String get playlistPlayAction => 'Playlist abspielen';

  @override
  String get playlistAllFinished => 'Alle abgeschlossen';

  @override
  String get queueModeBooks => 'Bücher';

  @override
  String get queueModePodcasts => 'Podcasts';

  @override
  String get autoDownloadQueue => 'Auto-Download-Warteschlange';

  @override
  String get autoDownloadThisSeriesLabel =>
      'Diese Serie automatisch herunterladen';

  @override
  String get autoDownloadThisShowLabel =>
      'Diesen Podcast automatisch herunterladen';

  @override
  String get autoDownloadThisPlaylistLabel =>
      'Wiedergabeliste automatisch herunterladen';

  @override
  String get autoDownloadThisCollectionLabel =>
      'Diese Sammlung automatisch herunterladen';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return 'Die nächsten $count Inhalte heruntergeladen halten';
  }

  @override
  String get autoDownloadQueueOffSubtitle => 'Aus - nur manuelle Downloads';

  @override
  String get sectionPlayback => 'Wiedergabe';

  @override
  String get sectionMediaControls => 'Mediensteuerung';

  @override
  String get defaultSpeed => 'Standardgeschwindigkeit';

  @override
  String get defaultSpeedSubtitle =>
      'Neue Bücher starten mit dieser Geschwindigkeit - jedes Buch merkt sich seine eigene';

  @override
  String get skipBack => 'Zurückspulen';

  @override
  String get skipForward => 'Vorspulen';

  @override
  String get iosLockScreenSkipHint =>
      'Der Sperrbildschirm zeigt nur die Zahlen, für die iOS Symbole hat (5, 10, 15, 30, 45, 60, 75, 90). Andere Werte zeigen + auf der Taste, springen aber trotzdem um deinen eingestellten Wert.';

  @override
  String get longSkipButtons => 'Lange Überspringen Tasten';

  @override
  String get longSkipButtonsOnSubtitle =>
      'An - Der Player zeigt ein zweites, größeres Überspringen Paar';

  @override
  String get longSkipButtonsOffSubtitle =>
      'Aus - nur die regulären Überspringen Schaltflächen';

  @override
  String get longSkipBack => 'Langes Zurückspringen';

  @override
  String get longSkipForward => 'Langes Vorwärtsspringen';

  @override
  String get coverShapeDefault => 'Standard';

  @override
  String get coverShapeSquare => 'Quadratisch';

  @override
  String get coverShapeRectangle => 'Rechteck';

  @override
  String get coverShapeLabel => 'Cover Format';

  @override
  String get showSubtitles => 'Untertitel anzeigen';

  @override
  String get showSubtitlesOnSubtitle =>
      'Untertitel erscheinen unter den Buchtiteln in der Bibliothek und auf dem Start';

  @override
  String get showSubtitlesOffSubtitle =>
      'Aus - Untertitel nur im Detailfenster des Buchs';

  @override
  String get subtitleVisibilityLabel => 'Untertitel';

  @override
  String get subtitleVisibilityDefault => 'Standard';

  @override
  String get subtitleVisibilityShow => 'Anzeigen';

  @override
  String get subtitleVisibilityHide => 'Ausblenden';

  @override
  String currentLibrarySettingsTitle(String name) {
    return 'Aktuelle Bibliothek: $name';
  }

  @override
  String get currentLibrarySkipOverride => 'Eigene Überspringen Länge';

  @override
  String get currentLibrarySkipOverrideOnSubtitle =>
      'An - diese Bibliothek verwendet eigene Überspringen-längen';

  @override
  String get currentLibrarySkipOverrideOffSubtitle =>
      'Aus - diese Bibliothek verwendet die globalen Überspringen-längen';

  @override
  String get currentLibrarySkipBack => 'Zurückspringen';

  @override
  String get currentLibrarySkipForward => 'Vorwärts springen';

  @override
  String get chapterProgressInNotification =>
      'Kapitelfortschritt in Benachrichtigung & Android Auto';

  @override
  String get chapterProgressOnSubtitle =>
      'An - Benachrichtigung & Android Auto zeigen Kapitel Fortschritt';

  @override
  String get chapterProgressOffSubtitle =>
      'Aus - Gesamtfortschritt des Buches wird angezeigt';

  @override
  String get chapterProgressInNotificationIos =>
      'Kapitel Fortschritt auf Sperrbildschirm & CarPlay';

  @override
  String get chapterProgressOnSubtitleIos =>
      'An - Sperrbildschirm & CarPlay zeigen Kapitel Fortschritt';

  @override
  String get nowPlayingText => 'Text der Wiedergabeanzeige';

  @override
  String get nowPlayingTextSubtitle =>
      'Wähle, was die Mediensteuerung in jeder Zeile zeigt';

  @override
  String get nowPlayingTopLine => 'Obere Zeile';

  @override
  String get nowPlayingSecondLine => 'Zweite Zeile';

  @override
  String get nowPlayingNotShown => 'Nicht angezeigt';

  @override
  String get nowPlayingTopLineRequired =>
      'Die obere Zeile braucht mindestens ein Element';

  @override
  String get nowPlayingPieceChapter => 'Kapitel';

  @override
  String get nowPlayingPieceTitle => 'Buchtitel';

  @override
  String get nowPlayingPieceNarrator => 'Erzähler';

  @override
  String get nowPlayingPieceSeries => 'Serien';

  @override
  String get nowPlayingPiecePercent => 'Prozent des Buchs';

  @override
  String get nowPlayingPieceChapterNumber => 'Kapitelnummer';

  @override
  String get nowPlayingPieceTimeLeft => 'Verbleibende Zeit';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return 'Kap. $number/$total';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return 'Noch $time';
  }

  @override
  String get bookDockBadgePending => 'Ausstehend';

  @override
  String get bookDockBadgeExtracting => 'Datei wird gelesen';

  @override
  String get bookDockBadgeFetching => 'Wird gesucht';

  @override
  String get bookDockBadgeError => 'Fehler';

  @override
  String get bookDockNeedsReview => 'Prüfung nötig';

  @override
  String get bookDockNoMatch => 'Keine Übereinstimmung';

  @override
  String get bookDockApplied => 'Angewendet';

  @override
  String get bookDockNotApplied => 'Gefundene Details nicht verwendet';

  @override
  String get bookDockNoDestination => 'Kein Ziel festgelegt';

  @override
  String get bookDockNoAuthor => 'Noch kein Autor';

  @override
  String get bookDockLookUpAgain => 'Erneut suchen';

  @override
  String get bookDockLookingUp => 'Details werden erneut gesucht';

  @override
  String get bookDockLookUpFailed => 'Details konnten nicht gesucht werden';

  @override
  String get bookDockProposedChanges => 'Vorgeschlagene Änderungen';

  @override
  String get bookDockNoChanges => 'Noch keine Details online gefunden';

  @override
  String get bookDockStillReading => 'Der Server liest diese Datei noch';

  @override
  String get bookDockRoleBook => 'Buch';

  @override
  String get bookDockRoleCover => 'Cover';

  @override
  String get bookDockRoleMetadata => 'Metadaten';

  @override
  String get bookDockRoleExtra => 'Extra';

  @override
  String get bookDockFieldTitle => 'Titel';

  @override
  String get bookDockFieldSubtitle => 'Untertitel';

  @override
  String get bookDockFieldAuthors => 'Autoren';

  @override
  String get bookDockFieldSeries => 'Serien';

  @override
  String get bookDockFieldPublisher => 'Verlag';

  @override
  String get bookDockFieldYear => 'Jahr';

  @override
  String get bookDockFieldLanguage => 'Sprache';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return '$percent% Übereinstimmung';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '1 Datei',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return 'Kommt in $library';
  }

  @override
  String bookDockChangedFields(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Felder',
      one: '1 Feld',
    );
    return '$_temp0';
  }

  @override
  String bookDockFilesInEntry(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien in diesem Eintrag',
      one: 'Datei in diesem Eintrag',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return 'Hinzugefügt am $date';
  }

  @override
  String get bookDockAddToLibrary => 'Zur Bibliothek hinzufügen';

  @override
  String get bookDockUseFound => 'Gefundene Details verwenden';

  @override
  String get bookDockRemoveTitle => 'Aus dem Book Dock entfernen?';

  @override
  String get bookDockRemoveFailed => 'Diese Datei konnte nicht entfernt werden';

  @override
  String get bookDockPickLibrary => 'Zu welcher Bibliothek hinzufügen?';

  @override
  String get bookDockNoLibraries =>
      'Dein Konto kann keine Bücher zu einer Bibliothek hinzufügen';

  @override
  String get bookDockFileFailed =>
      'Diese Datei konnte nicht zur Bibliothek hinzugefügt werden';

  @override
  String get bookDockDuplicateBody =>
      'Eine Datei mit diesem Namen ist bereits in dieser Bibliothek. Aus dem Book Dock entfernen?';

  @override
  String get bookDockDetailsUpdated => 'Details aktualisiert';

  @override
  String get bookDockUseFoundFailed => 'Keine gefundenen Details zum Verwenden';

  @override
  String bookDockRemoveBody(String title) {
    return 'Dadurch wird $title vom Server gelöscht.';
  }

  @override
  String bookDockRemoved(String title) {
    return '$title aus dem Book Dock entfernt';
  }

  @override
  String bookDockFiled(String title, String library) {
    return '$title zu $library hinzugefügt';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return 'Diese Datei konnte nicht hinzugefügt werden: $reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return 'Bereits in $library';
  }

  @override
  String get bomatchSearchAll => 'Alle Quellen durchsuchen';

  @override
  String get bomatchSearching => 'Suche läuft...';

  @override
  String get bomatchSearchFailed =>
      'Die Suche nach Treffern ist fehlgeschlagen. Prüfe deine Verbindung und versuche es erneut.';

  @override
  String get bomatchNoResults => 'Keine Treffer gefunden';

  @override
  String get bomatchStrong => 'Starke Treffer';

  @override
  String get bomatchPossible => 'Mögliche Treffer';

  @override
  String get bomatchSourceTimeout => 'Zeitüberschreitung';

  @override
  String get bomatchSourceBusy => 'ausgelastet';

  @override
  String get bomatchSourceFailed => 'fehlgeschlagen';

  @override
  String get bomatchLinked => 'Verknüpft';

  @override
  String get bomatchSameIsbn => 'Gleiche ISBN';

  @override
  String get bomatchFewDetails => 'Wenige Details';

  @override
  String get bomatchBack => 'Alle Ergebnisse';

  @override
  String get bomatchFillEmpty => 'Leere füllen';

  @override
  String get bomatchTakeAll => 'Alle übernehmen';

  @override
  String get bomatchOnlyDifferences => 'Nur Unterschiede';

  @override
  String get bomatchNow => 'Jetzt';

  @override
  String get bomatchEmpty => 'Leer';

  @override
  String get bomatchKindNew => 'Neu';

  @override
  String get bomatchKindChange => 'Änderung';

  @override
  String get bomatchKindSmall => 'Kleine Änderung';

  @override
  String get bomatchKindSame => 'Gleich';

  @override
  String get bomatchKindNone => 'Nicht im Ergebnis';

  @override
  String get bomatchKeep => 'Behalten';

  @override
  String get bomatchUse => 'Verwenden';

  @override
  String get bomatchMerge => 'Zusammenführen';

  @override
  String get bomatchReplace => 'Ersetzen';

  @override
  String get bomatchUseThis => 'Diesen verwenden';

  @override
  String get bomatchChosen => 'Gewählt';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weitere Bücher',
      one: '1 weiteres Buch',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Änderungen',
      one: '1 Änderung',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count neu',
      one: '1 neu',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Änderungen anwenden',
      one: '1 Änderung anwenden',
      zero: 'Anwenden',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weitere Quellen',
      one: '1 weitere Quelle',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return 'Von $source';
  }

  @override
  String get breqTitle => 'Buchanfragen';

  @override
  String get breqTabRequest => 'Buch anfragen';

  @override
  String get breqTabMine => 'Meine Anfragen';

  @override
  String get breqTabAll => 'Alle Anfragen';

  @override
  String get breqNoAccess =>
      'Dein Konto kann auf diesem Server keine Bücher anfragen.';

  @override
  String get breqTitleHint => 'Buchtitel';

  @override
  String get breqAuthorHint => 'Autor';

  @override
  String get breqKindAudiobook => 'Hörbuch';

  @override
  String get breqKindEbook => 'eBook';

  @override
  String get breqKindComic => 'Comic';

  @override
  String get breqSearch => 'Suche';

  @override
  String get breqSearching => 'Suche läuft...';

  @override
  String get breqSearchFailed =>
      'Die Suche ist fehlgeschlagen. Prüfe deine Verbindung und versuche es erneut.';

  @override
  String get breqSearchPrompt =>
      'Suche nach einem Buch, das die Bibliothek noch nicht hat, um es anzufragen.';

  @override
  String get breqNoResults => 'Keine passenden Bücher gefunden';

  @override
  String get breqInLibrary => 'In deiner Bibliothek';

  @override
  String get breqYouAsked => 'Du hast dies angefragt';

  @override
  String get breqSomeoneAsked => 'Bereits von jemand anderem angefragt';

  @override
  String get breqView => 'Ansehen';

  @override
  String get breqRequest => 'Anfragen';

  @override
  String get breqRequested => 'Angefragt';

  @override
  String get breqAddMeToo => 'Mich auch hinzufügen';

  @override
  String get breqLibrary => 'Bibliothek';

  @override
  String get breqLibraryApprover => 'Genehmigende Person entscheiden lassen';

  @override
  String get breqLibraryChoose => 'Bibliothek wählen';

  @override
  String get breqNote => 'Notiz für die genehmigende Person';

  @override
  String get breqNoteHint => 'Alles Wissenswerte zu dieser Anfrage';

  @override
  String get breqAutoApproved => 'Deine Anfragen werden sofort genehmigt.';

  @override
  String get breqSubmitted => 'Anfrage gesendet';

  @override
  String get breqJoined => 'Du wurdest zur bestehenden Anfrage hinzugefügt';

  @override
  String get breqFailed => 'Die Anfrage konnte nicht gesendet werden';

  @override
  String get breqStatusPending => 'Ausstehend';

  @override
  String get breqStatusApproved => 'Genehmigt';

  @override
  String get breqStatusRejected => 'Abgelehnt';

  @override
  String get breqStatusCancelled => 'Abgebrochen';

  @override
  String get breqStatusSearching => 'Suche läuft';

  @override
  String get breqStatusGrabbed => 'Release gefunden';

  @override
  String get breqStatusDownloading => 'Wird heruntergeladen';

  @override
  String get breqStatusImporting => 'Wird importiert';

  @override
  String get breqStatusNeedsReview => 'Prüfung nötig';

  @override
  String get breqStatusAvailable => 'Verfügbar';

  @override
  String get breqStatusFailed => 'Fehlgeschlagen';

  @override
  String get breqWaitingApproval => 'Wartet auf Genehmigung';

  @override
  String get breqWaitingRelease => 'Wartet auf die Auswahl eines Releases';

  @override
  String get breqLookingForRelease => 'Suche nach einem Release';

  @override
  String get breqStartingDownload => 'Download wird gestartet';

  @override
  String get breqAddingToLibrary => 'Wird zur Bibliothek hinzugefügt';

  @override
  String get breqWaitingCheck => 'Wartet auf manuelle Prüfung';

  @override
  String get breqReady => 'In deiner Bibliothek bereit';

  @override
  String get breqSomethingWrong => 'Etwas ist schiefgelaufen';

  @override
  String get breqShowHidden => 'Ausgeblendete anzeigen';

  @override
  String get breqHidden => 'Ausgeblendet';

  @override
  String get breqMineEmpty => 'Du hast noch keine Bücher angefragt.';

  @override
  String get breqAllEmpty => 'Noch keine Anfragen.';

  @override
  String get breqLoadFailed => 'Anfragen konnten nicht geladen werden.';

  @override
  String get breqLoadMore => 'Mehr laden';

  @override
  String get breqApprove => 'Genehmigen';

  @override
  String get breqReject => 'Ablehnen';

  @override
  String get breqCancel => 'Anfrage abbrechen';

  @override
  String get breqHide => 'In meiner Liste ausblenden';

  @override
  String get breqUnhide => 'In meiner Liste anzeigen';

  @override
  String get breqLeave => 'Anfrage verlassen';

  @override
  String get breqDelete => 'Anfrage löschen';

  @override
  String get breqOpenBook => 'Buch öffnen';

  @override
  String get breqCancelConfirm =>
      'Diese Anfrage abbrechen? Ein laufender Download wird ebenfalls gestoppt.';

  @override
  String get breqDeleteConfirm =>
      'Diese Anfrage löschen? Das kann nicht rückgängig gemacht werden.';

  @override
  String get breqRejectTitle => 'Anfrage ablehnen';

  @override
  String get breqRejectReason => 'Grund (optional)';

  @override
  String get breqApproveTitle => 'Anfrage genehmigen';

  @override
  String get breqApproveLibraryNeeded =>
      'Wähle die Bibliothek, in die dieses Buch kommt.';

  @override
  String get breqApprovedToast => 'Anfrage genehmigt';

  @override
  String get breqRejectedToast => 'Anfrage abgelehnt';

  @override
  String get breqCancelledToast => 'Anfrage abgebrochen';

  @override
  String get breqHiddenToast => 'In deiner Liste ausgeblendet';

  @override
  String get breqRestoredToast => 'Wieder in deiner Liste';

  @override
  String get breqDeletedToast => 'Anfrage gelöscht';

  @override
  String get breqLeftToast => 'Du hast diese Anfrage verlassen';

  @override
  String get breqActionFailed => 'Die Anfrage konnte nicht aktualisiert werden';

  @override
  String get breqFactRequestedBy => 'Angefragt von';

  @override
  String get breqFactRequestedOn => 'Angefragt am';

  @override
  String get breqFactLibrary => 'Bibliothek';

  @override
  String get breqFactDecidedBy => 'Entschieden von';

  @override
  String get breqFactNote => 'Notiz des Anfragenden';

  @override
  String get breqFactDecisionNote => 'Entscheidungsnotiz';

  @override
  String get breqFactAlsoWanted => 'Auch gewünscht von';

  @override
  String get breqLibraryCta => 'Buch anfragen';

  @override
  String get breqSettingsSubtitle =>
      'Bücher anfragen, die die Bibliothek noch nicht hat';

  @override
  String get navHoldBookRequests => 'Buchanfragen';

  @override
  String breqLibraryDefault(String library) {
    return 'Standard ($library)';
  }

  @override
  String breqFailedReason(String reason) {
    return 'Die Anfrage konnte nicht gesendet werden: $reason';
  }

  @override
  String breqBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books',
      one: '1 book',
    );
    return '$_temp0';
  }

  @override
  String breqDownloadingPercent(int percent) {
    return 'Wird heruntergeladen, $percent%';
  }

  @override
  String breqAddedTo(String library) {
    return 'Zu $library hinzugefügt';
  }

  @override
  String breqRejectedWithNote(String note) {
    return 'Abgelehnt: $note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return 'Fehlgeschlagen: $reason';
  }

  @override
  String breqRequestedBy(String name) {
    return 'Angefragt von $name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return 'Die Anfrage konnte nicht aktualisiert werden: $reason';
  }

  @override
  String breqFooterCta(String query) {
    return '„$query“ anfragen';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Anfragen',
      one: '1 Anfrage',
      zero: 'Keine Anfragen',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => 'Release suchen';

  @override
  String get breqTryAnotherRelease => 'Anderes Release versuchen';

  @override
  String get breqApproveAndFind => 'Genehmigen und Release suchen';

  @override
  String get breqReviewButton => 'Download prüfen';

  @override
  String get breqStopDownload => 'Download stoppen';

  @override
  String get breqStopDownloadConfirm =>
      'Diesen Download stoppen? Die Anfrage geht zurück auf genehmigt, damit ein anderes Release gewählt werden kann.';

  @override
  String get breqDiscardImport => 'Download verwerfen';

  @override
  String get breqDiscardConfirm =>
      'Diesen Download verwerfen? Die Anfrage wird als fehlgeschlagen markiert und kann mit einem anderen Release erneut versucht werden.';

  @override
  String get breqFileAnyway => 'Zur Bibliothek hinzufügen';

  @override
  String get breqFiledToast => 'Zur Bibliothek hinzugefügt';

  @override
  String get breqDiscardedToast => 'Download verworfen';

  @override
  String get breqStoppedToast => 'Download gestoppt';

  @override
  String get breqGrabTitle => 'Dieses Release herunterladen?';

  @override
  String get breqGrab => 'Herunterladen';

  @override
  String get breqGrabbed => 'Download gestartet';

  @override
  String get breqGrabFailed => 'Der Download konnte nicht gestartet werden';

  @override
  String get breqReleaseVipWarning =>
      'Dieser Tracker erlaubt den Download nur VIP-Konten.';

  @override
  String get breqReleaseNoBookFile =>
      'Dieses Release enthält keine Buchdatei, die BookOrbit zu einer Bibliothek hinzufügen kann.';

  @override
  String get breqReleaseCheckFailed =>
      'Der Inhalt dieses Releases konnte nicht geprüft werden. Versuche es erneut oder wähle ein anderes.';

  @override
  String get breqCheckingRelease => 'Dateien werden geprüft...';

  @override
  String get breqSearchAgain => 'Erneut suchen';

  @override
  String get breqSearchTerms => 'Suchbegriffe';

  @override
  String get breqIsbnHint => 'Leer lassen, um nach Titel und Autor zu suchen';

  @override
  String get breqSearchingIndexers =>
      'Deine Indexer werden durchsucht. Das kann bis zu einer Minute dauern.';

  @override
  String get breqReleasesFailed =>
      'Die Suche nach Releases ist fehlgeschlagen.';

  @override
  String get breqNoSourcesSetUp =>
      'In BookOrbit sind keine Suchquellen eingerichtet.';

  @override
  String get breqNoSourcesOn =>
      'Alle Suchquellen sind in BookOrbit ausgeschaltet.';

  @override
  String get breqNoSourceCarries =>
      'Keine deiner Suchquellen führt diese Art von Buch.';

  @override
  String get breqNoReleases =>
      'Keine Releases gefunden. Versuche andere Suchbegriffe.';

  @override
  String get breqFromCache => 'aus einer letzten Suche';

  @override
  String get breqIndexerUnauthorized => 'Anmeldung fehlgeschlagen';

  @override
  String get breqIndexerThrottled => 'ausgelastet';

  @override
  String get breqIndexerTimeout => 'Zeitüberschreitung';

  @override
  String get breqIndexerUnreachable => 'nicht erreichbar';

  @override
  String get breqIndexerNoMedium => 'führt dies nicht';

  @override
  String get breqIndexerError => 'fehlgeschlagen';

  @override
  String get breqSortBest => 'Beste Übereinstimmung';

  @override
  String get breqSortSeeders => 'Seeder';

  @override
  String get breqSortSize => 'Größe';

  @override
  String get breqSortNewest => 'Neueste';

  @override
  String get breqFreeleech => 'Freeleech';

  @override
  String get breqVipOnly => 'Nur VIP';

  @override
  String get breqAlreadyGrabbed => 'Schon einmal heruntergeladen';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => 'Titel';

  @override
  String get breqReasonAuthor => 'Autor';

  @override
  String get breqReasonUnknownFormat => 'Unbekanntes Format';

  @override
  String get breqReasonExpectedSize => 'Größe';

  @override
  String get breqReasonSuspiciousSize => 'Ungewöhnliche Größe';

  @override
  String get breqReasonFreeleech => 'Freeleech';

  @override
  String get breqReasonSeveralBooks => 'Mehrere Bücher';

  @override
  String get breqReviewTitle => 'Download wartet auf Prüfung';

  @override
  String get breqReviewFailed =>
      'Die Download-Details konnten nicht geladen werden.';

  @override
  String get breqReviewDockGone =>
      'Die heruntergeladenen Dateien sind nicht mehr im Book Dock.';

  @override
  String get breqReviewNoLibrary =>
      'Diese Anfrage hat keine Bibliothek, zu der das Buch hinzugefügt werden kann.';

  @override
  String breqGrabFailedReason(String reason) {
    return 'Der Download konnte nicht gestartet werden: $reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return 'Der Inhalt dieses Releases konnte nicht geprüft werden: $reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return 'Die Suche nach Releases ist fehlgeschlagen: $reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return 'Die Download-Details konnten nicht geladen werden: $reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Releases',
      one: '1 Release',
      zero: 'Keine Releases',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '1 Datei',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '1 Datei',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return '$seeders Seeder, $leechers Leecher';
  }

  @override
  String breqScore(int score) {
    return 'Wertung $score';
  }

  @override
  String breqReasonPreferredFormat(String format) {
    return 'Bevorzugt: $format';
  }

  @override
  String breqReasonFormat(String format) {
    return '$format';
  }

  @override
  String breqReasonSeeders(String count) {
    return '$count Seeder';
  }

  @override
  String breqReviewScore(int score, int threshold) {
    return 'Trefferwertung $score. Downloads ab $threshold werden automatisch hinzugefügt.';
  }

  @override
  String breqReviewRequested(String value) {
    return 'Angefragt: $value';
  }

  @override
  String breqReviewImported(String value) {
    return 'Heruntergeladen: $value';
  }

  @override
  String get breqKindBoth => 'Beides';

  @override
  String get breqEbookLibrary => 'eBook-Bibliothek';

  @override
  String get breqAudiobookLibrary => 'Hörbuch-Bibliothek';

  @override
  String get breqRequestBoth => 'Beides anfragen';

  @override
  String get breqAddMeToBoth => 'Mich zu beiden hinzufügen';

  @override
  String get breqRequestEbook => 'eBook anfragen';

  @override
  String get breqRequestAudiobook => 'Hörbuch anfragen';

  @override
  String get breqAddMeEbook => 'Mich zur eBook-Anfrage hinzufügen';

  @override
  String get breqAddMeAudiobook => 'Mich zur Hörbuch-Anfrage hinzufügen';

  @override
  String get breqPairSubmitted => 'eBook und Hörbuch angefragt';

  @override
  String get breqPairOneJoined =>
      'Beides angefragt. Eines war schon unterwegs, daher wurdest du zu dieser Anfrage hinzugefügt';

  @override
  String get breqJoinedBoth => 'Du wurdest zu beiden Anfragen hinzugefügt';

  @override
  String get breqJoinsOwned =>
      'Angefragt. Es wird zur Kopie in deiner Bibliothek hinzugefügt';

  @override
  String get speedBookmarkInControls =>
      'Geschwindigkeit & Lesezeichen in Mediensteuerung';

  @override
  String get speedBookmarkOnSubtitle =>
      'An - Benachrichtigung zeigt Geschwindigkeit & Lesezeichen; Kapitel Überspringen bleibt in Android Auto';

  @override
  String get speedBookmarkOffSubtitle =>
      'Aus - Benachrichtigung zeigt Kapitel-Überspringen; Geschwindigkeit & Lesezeichen bleiben in Android Auto';

  @override
  String get lockSeekBar => 'Suchleiste sperren';

  @override
  String get lockSeekBarOnSubtitle =>
      'An - Der Fortschrittsregler wird in den Benachrichtigungen, Sperrbildschirm und Auto angezeigt, ist aber nicht verschiebbar';

  @override
  String get lockSeekBarOffSubtitle =>
      'Aus - Verschiebe den Fortschrittsregler in den Benachrichtigungen, Sperrbildschirm und Auto zum umherspringen';

  @override
  String get autoRewindOnResume => 'Auto-Zurückspulen beim Fortsetzen';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return 'An - ${min}s bis ${max}s je nach Pausendauer';
  }

  @override
  String get autoRewindOffSubtitle => 'Aus';

  @override
  String get rewindRange => 'Rückspulbereich';

  @override
  String get rewindAfterPausedFor => 'Zurückspulen nach Pause von';

  @override
  String get rewindAnyPause => 'Jede Pause';

  @override
  String get rewindAlwaysLabel => 'Immer';

  @override
  String get rewindAlwaysDescription =>
      'Spult jedes Mal beim Fortsetzen zurück, auch nach kurzen Unterbrechungen';

  @override
  String rewindAfterDescription(String seconds) {
    return 'Spult nur zurück, wenn länger als $seconds Sekunden pausiert wurde';
  }

  @override
  String get chapterBarrier => 'Kapitelgrenze';

  @override
  String get chapterBarrierSubtitle =>
      'Nicht über den Anfang des aktuellen Kapitels hinaus zurückspulen';

  @override
  String get rewindInstant => 'Sofort';

  @override
  String rewindPause(String duration) {
    return '$duration Pause';
  }

  @override
  String get rewindNoRewind => 'kein Rückspulen';

  @override
  String rewindSeconds(String seconds) {
    return '${seconds}s zurückspulen';
  }

  @override
  String get sectionSleepTimer => 'Sleep-Timer';

  @override
  String get sleep => 'Sleep';

  @override
  String get sleepTimer => 'Sleep-Timer';

  @override
  String get shakeDuringSleepTimer => 'Schütteln während Sleep-Timer';

  @override
  String get shakeOff => 'Aus';

  @override
  String get shakeAddTime => 'Zeit hinzufügen';

  @override
  String get shakeReset => 'Zurücksetzen';

  @override
  String get shakeAdds => 'Schütteln fügt hinzu';

  @override
  String get sleepAddAmount => 'Zeit hinzufügen';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes Min.';
  }

  @override
  String get shakeSensitivity => 'Schüttel-Empfindlichkeit';

  @override
  String get shakeSensitivityVeryLow => 'Sehr niedrig';

  @override
  String get shakeSensitivityLow => 'Niedrig';

  @override
  String get shakeSensitivityMedium => 'Mittel';

  @override
  String get shakeSensitivityHigh => 'Hoch';

  @override
  String get shakeSensitivityVeryHigh => 'Sehr hoch';

  @override
  String get buttonDuringSleepTimer => 'Kopfhörertaste während des Ausklingens';

  @override
  String get buttonDuringSleepTimerHint =>
      'In den letzten Momenten des Ausklingens setzt ein Druck den Timer zurück, statt zu pausieren. Doppeldruck überspringt weiterhin.';

  @override
  String get resetTimerOnPause => 'Timer bei Pause zurücksetzen';

  @override
  String get resetTimerOnPauseOnSubtitle =>
      'Timer startet bei Fortsetzung von der vollen Dauer neu';

  @override
  String get resetTimerOnPauseOffSubtitle =>
      'Timer läuft dort weiter, wo er aufgehört hat';

  @override
  String get fadeVolumeBeforeSleep => 'Lautstärke vor dem Sleep ausblenden';

  @override
  String get fadeVolumeOnSubtitle =>
      'Senkt die Lautstärke in den letzten 30 Sekunden allmählich ab';

  @override
  String get fadeVolumeOffSubtitle =>
      'Wiedergabe stoppt sofort, wenn der Timer endet';

  @override
  String get autoSleepTimer => 'Automatischer Sleep-Timer';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration Min.';
  }

  @override
  String get autoSleepTimerOffSubtitle =>
      'Sleep-Timer in einem Zeitfenster automatisch starten';

  @override
  String get windowStart => 'Fensterbeginn';

  @override
  String get windowEnd => 'Fensterende';

  @override
  String get timerDuration => 'Timer-Dauer';

  @override
  String get timer => 'Timer';

  @override
  String get endOfChapter => 'Kapitelende';

  @override
  String startMinTimer(int minutes) {
    return '$minutes-Min.-Timer starten';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return 'Sleep nach $count $label';
  }

  @override
  String get addMoreTime => 'Mehr Zeit hinzufügen';

  @override
  String get cancelTimer => 'Timer abbrechen';

  @override
  String chaptersLeftCount(int count) {
    return '$count Kap. übrig';
  }

  @override
  String get sectionDownloadsAndStorage => 'Downloads & Speicher';

  @override
  String get downloadOverWifiOnly => 'Download Netzwerk';

  @override
  String get downloadOverWifiOnSubtitle => 'Nur über WLAN';

  @override
  String get downloadOverWifiOffSubtitle => 'Beliebige Verbindungsart';

  @override
  String get autoDownloadOnWifi =>
      'Automatisches Herunterladen von angefangenen Büchern';

  @override
  String get autoDownloadOnWifiInfoTitle =>
      'Automatisches Herunterladen von angefangenen Büchern';

  @override
  String get autoDownloadOnWifiInfoContent =>
      'Wenn du ein Hörbuch streamst, wird im Hintergrund automatisch das gesamte Buch zur Offline Nutzung heruntergeladen. Der Download beachtet deine obigen Einstellungen zum Download Netzwerk. Wähle \"Beliebige Verbindungsart\", wenn Downloads auch über die mobile Datenverbindung erfolgen sollen.';

  @override
  String get autoDownloadOnWifiOnSubtitle =>
      'Gestreamte Bücher laden im Hintergrund automatisch herunter';

  @override
  String get autoDownloadOnWifiOffSubtitle => 'Aus';

  @override
  String get concurrentDownloads => 'Gleichzeitige Downloads';

  @override
  String get autoDownload => 'Auto-Download';

  @override
  String get autoDownloadSubtitle =>
      'Aktiviere pro Serie, Podcast, Wiedergabeliste oder Sammlung über deren Detailseiten';

  @override
  String get autoDownloadEnabledFor => 'Eingeschaltet für';

  @override
  String get autoDownloadEnabledForNone => 'Noch nichts';

  @override
  String get autoDownloadSourceUnnamed => 'Noch nicht geladen';

  @override
  String get keepNext => 'Nächste behalten';

  @override
  String get keepNextInfoTitle => 'Nächste behalten';

  @override
  String get keepNextInfoContent =>
      'Die Anzahl der Elemente, die heruntergeladen bleiben sollen, einschließlich des Elements, das du gerade hörst. Beispiel: \"Nächste 3 behalten\" bedeutet, das aktuelle Buch plus die nächsten 2 in der Serie oder im Podcast bleiben heruntergeladen.';

  @override
  String get deleteAbsorbedDownloads => 'Absorbed Downloads löschen';

  @override
  String get deleteAbsorbedDownloadsInfoTitle => 'Absorbed Downloads löschen';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      'Wenn aktiviert, werden heruntergeladene Bücher oder Episoden automatisch von diesem Gerät gelöscht, nachdem du sie in Absorb zu Ende gehört hast. Wenn du einen Titel im Web oder auf einem anderen Gerät beendest, bleibt der Download hier erhalten.';

  @override
  String get deleteAbsorbedOnSubtitle =>
      'Beendete Elemente werden entfernt, um Platz zu sparen';

  @override
  String get deleteAbsorbedOffSubtitle =>
      'Aus - beendete Downloads werden behalten';

  @override
  String get downloadLocation => 'Download-Speicherort';

  @override
  String get storageUsed => 'Speicher belegt';

  @override
  String storageUsedByDownloads(String size) {
    return '$size von Downloads belegt';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return '$free frei von $total';
  }

  @override
  String get manageDownloads => 'Downloads verwalten';

  @override
  String get streamingCache => 'Streaming-Cache';

  @override
  String get streamingCacheInfoTitle => 'Streaming-Cache';

  @override
  String get streamingCacheInfoContent =>
      'Cached gestreamtes Audio auf der Festplatte, damit es nicht erneut heruntergeladen werden muss, wenn du zurückspulst oder Abschnitte erneut hörst. Der Cache wird automatisch verwaltet - älteste Dateien werden entfernt, wenn die Größenbegrenzung erreicht ist. Das ist getrennt von vollständig heruntergeladenen Büchern.';

  @override
  String get streamingCacheOff => 'Aus';

  @override
  String get streamingCacheOffSubtitle =>
      'Aus - Audio wird ohne Caching gestreamt';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size MB - kürzlich gestreamtes Audio wird auf der Festplatte gecached';
  }

  @override
  String get clearCache => 'Cache leeren';

  @override
  String get streamingCacheCleared => 'Streaming-Cache geleert';

  @override
  String get sectionLibrary => 'Bibliothek';

  @override
  String get hideEbookOnlyTitles => 'Nur-eBook-Titel ausblenden';

  @override
  String get hideEbookOnlyOnSubtitle =>
      'Bücher ohne Audiodateien werden ausgeblendet';

  @override
  String get hideEbookOnlyOffSubtitle =>
      'Aus - alle Bibliothekselemente werden angezeigt';

  @override
  String get homeCardsOpenDetails => 'Details vom Start aus öffnen';

  @override
  String get homeCardsOpenDetailsOnSubtitle =>
      'Tippen auf eine Karte unter „Weiterhören“ oder „Weiterlesen“ öffnet ihre Details';

  @override
  String get homeCardsOpenDetailsOffSubtitle =>
      'Tippen auf eine Karte unter „Weiterhören“ oder „Weiterlesen“ setzt dort fort, wo du aufgehört hast';

  @override
  String get showGoodreadsButton => 'Goodreads-Button anzeigen';

  @override
  String get showGoodreadsOnSubtitle =>
      'Buchdetails zeigen einen Link zu Goodreads';

  @override
  String get showGoodreadsOffSubtitle => 'Aus - Goodreads-Button ausgeblendet';

  @override
  String get sectionPermissions => 'Berechtigungen';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get notificationsSubtitle =>
      'Für Download-Fortschritt und Wiedergabesteuerung';

  @override
  String get notificationsAlreadyEnabled =>
      'Benachrichtigungen sind bereits aktiviert';

  @override
  String get unrestrictedBattery => 'Uneingeschränkte Akkunutzung';

  @override
  String get unrestrictedBatterySubtitle =>
      'Verhindert, dass Android die Hintergrundwiedergabe beendet';

  @override
  String get batteryAlreadyUnrestricted =>
      'Akkunutzung ist bereits uneingeschränkt';

  @override
  String get sectionIssuesAndSupport => 'Probleme & Support';

  @override
  String get bugsAndFeatureRequests => 'Bugs & Feature-Wünsche';

  @override
  String get bugsAndFeatureRequestsSubtitle => 'Issue auf GitHub eröffnen';

  @override
  String get joinDiscord => 'Discord beitreten';

  @override
  String get joinDiscordSubtitle => 'Community, Support und Updates';

  @override
  String get contact => 'Kontakt';

  @override
  String get contactSubtitle => 'Geräteinfos per E-Mail senden';

  @override
  String get enableLogging => 'Logging aktivieren';

  @override
  String get enableLoggingOnSubtitle =>
      'An - Logs werden in Datei gespeichert (Neustart nötig)';

  @override
  String get enableLoggingOffSubtitle => 'Aus - keine Logs werden erfasst';

  @override
  String get loggingEnabledSnackbar =>
      'Logging aktiviert - App neu starten, um Aufzeichnung zu beginnen';

  @override
  String get loggingDisabledSnackbar =>
      'Logging deaktiviert - App neu starten, um Aufzeichnung zu beenden';

  @override
  String get sendLogs => 'Logs senden';

  @override
  String get sendLogsSubtitle => 'Logdatei als Anhang teilen';

  @override
  String failedToShare(String error) {
    return 'Teilen fehlgeschlagen: $error';
  }

  @override
  String get clearLogs => 'Logs löschen';

  @override
  String get logsCleared => 'Logs gelöscht';

  @override
  String get clearLogsQuestion => 'Protokolle löschen?';

  @override
  String get clearLogsContent =>
      'Das kann nicht rückgängig gemacht werden. Sende sie vorher, falls du sie vielleicht brauchst.';

  @override
  String get sectionAdvanced => 'Erweitert';

  @override
  String get localServer => 'Lokaler Server';

  @override
  String get localServerInfoTitle => 'Lokaler Server';

  @override
  String get localServerInfoContent =>
      'Wenn du deinen Audiobookshelf-Server zu Hause betreibst, kannst du hier eine lokale/LAN-URL festlegen. Absorb wechselt automatisch zur schnelleren lokalen Verbindung, wenn erkannt wird, dass du in deinem Heimnetzwerk bist, und greift unterwegs auf deine Remote-URL zurück.';

  @override
  String get localServerOnConnectedSubtitle => 'Verbunden über lokalen Server';

  @override
  String get localServerOnRemoteSubtitle =>
      'Aktiviert - Remote-Server wird verwendet';

  @override
  String get localServerOffSubtitle =>
      'Auto-Wechsel zu LAN-Server in deinem Heim-WLAN';

  @override
  String get localServerUrlLabel => 'URL des lokalen Servers';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar =>
      'URL des lokalen Servers gesetzt - verbindet sich automatisch in deinem Heimnetzwerk';

  @override
  String get disableAudioFocus => 'Audiofokus deaktivieren';

  @override
  String get disableAudioFocusInfoTitle => 'Audiofokus';

  @override
  String get disableAudioFocusInfoContent =>
      'Standardmäßig gibt Android jeweils einer App den Audio-\"Fokus\" - wenn Absorb spielt, pausiert anderes Audio (Musik, Videos). Wenn du den Audiofokus deaktivierst, kann Absorb neben anderen Apps wiedergegeben werden. Telefonate pausieren die Wiedergabe unabhängig von dieser Einstellung trotzdem.';

  @override
  String get disableAudioFocusOnSubtitle =>
      'An - spielt neben anderem Audio (pausiert weiterhin bei Anrufen)';

  @override
  String get disableAudioFocusOffSubtitle =>
      'Aus - anderes Audio pausiert, wenn Absorb spielt';

  @override
  String get restartRequired => 'Neustart erforderlich';

  @override
  String get restartRequiredContent =>
      'Die Änderung des Audiofokus erfordert einen vollständigen Neustart. App jetzt schließen?';

  @override
  String get closeApp => 'App schließen';

  @override
  String get trustAllCertificates => 'Allen Zertifikaten vertrauen';

  @override
  String get trustAllCertificatesInfoTitle => 'Selbstsignierte Zertifikate';

  @override
  String get mp3IndexSeeking => 'MP3-Indexsuche';

  @override
  String get mp3IndexSeekingInfoTitle => 'MP3-Indexsuche';

  @override
  String get mp3IndexSeekingInfoContent =>
      'Aktivieren dies nur, wenn deine MP3-Dateien nicht an die richtige Stelle springen. Dies ist gewöhnlicherweise eine Auswirkung von variablen Bitraten (VBR) MP3s. Die Indexsuche erstellt eine exakte Zeitkarte beim Wiedergeben der Datei, so dass ein Sprung ans Ende einer großen MP3 einen Moment dauern kann - vor allem beim Streamen, da die Datei bis zu diesem Punkt gelesen werden muss. Die Aktivierung wird erst beim nächsten Start eines Buches oder einer Podcast-Episode wirksam.';

  @override
  String get mp3IndexSeekingOnSubtitle =>
      'An - exakte Suche bei VBR MP3 Dateien';

  @override
  String get mp3IndexSeekingOffSubtitle => 'Aus - normale Suche';

  @override
  String get trustAllCertificatesInfoContent =>
      'Aktiviere dies, wenn dein Audiobookshelf-Server ein selbstsigniertes Zertifikat oder eine eigene Root-CA verwendet. Wenn aktiviert, überspringt Absorb die TLS-Zertifikatsprüfung für alle Verbindungen. Aktiviere dies nur, wenn du deinem Netzwerk vertraust.';

  @override
  String get trustAllCertificatesOnSubtitle =>
      'An - alle Zertifikate werden akzeptiert';

  @override
  String get trustAllCertificatesOffSubtitle =>
      'Aus - nur vertrauenswürdige Zertifikate akzeptiert';

  @override
  String get supportTheDev => 'Den Entwickler unterstützen';

  @override
  String get buyMeACoffee => 'Spendier mir einen Kaffee';

  @override
  String appVersionFormat(String version) {
    return 'Absorb v$version';
  }

  @override
  String betaLabel(int number) {
    return 'Beta $number';
  }

  @override
  String appVersionWithServerFormat(String version, String serverVersion) {
    return 'Absorb v$version  -  Server $serverVersion';
  }

  @override
  String get backupAndRestore => 'Sichern & Wiederherstellen';

  @override
  String get backupAndRestoreSubtitle =>
      'Alle Einstellungen in einer Datei speichern oder wiederherstellen';

  @override
  String get backUp => 'Sichern';

  @override
  String get restore => 'Wiederherstellen';

  @override
  String get allBookmarks => 'Alle Lesezeichen';

  @override
  String get allBookmarksSubtitle => 'Lesezeichen aus allen Büchern anzeigen';

  @override
  String get switchAccount => 'Konto wechseln';

  @override
  String get addAccount => 'Konto hinzufügen';

  @override
  String get logOut => 'Abmelden';

  @override
  String get includeLoginInfoTitle => 'Login-Daten einschließen?';

  @override
  String get includeLoginInfoContent =>
      'Möchtest du die Login-Daten aller deiner gespeicherten Konten in die Sicherung einschließen?\n\nDas erleichtert die Wiederherstellung auf einem neuen Gerät, aber die Datei enthält dann deine Auth-Tokens.';

  @override
  String get noSettingsOnly => 'Nein, nur Einstellungen';

  @override
  String get yesIncludeAccounts => 'Ja, Konten einschließen';

  @override
  String get backupSavedWithAccounts => 'Sicherung gespeichert (mit Konten)';

  @override
  String get backupSavedSettingsOnly =>
      'Sicherung gespeichert (nur Einstellungen)';

  @override
  String backupFailed(String error) {
    return 'Sicherung fehlgeschlagen: $error';
  }

  @override
  String get restoreBackupTitle => 'Sicherung wiederherstellen?';

  @override
  String get restoreBackupContent =>
      'Dadurch werden alle deine aktuellen Einstellungen durch die Werte aus der Sicherung ersetzt.';

  @override
  String fromAbsorbVersion(String version) {
    return 'Von Absorb v$version';
  }

  @override
  String restoreAccountsChip(int count) {
    return '$count Konto/Konten';
  }

  @override
  String restoreBookmarksChip(int count) {
    return 'Lesezeichen für $count Buch/Bücher';
  }

  @override
  String get restoreCustomHeadersChip => 'Benutzerdefinierte Header';

  @override
  String get invalidBackupFile => 'Ungültige Sicherungsdatei';

  @override
  String get settingsRestoredSuccessfully =>
      'Einstellungen erfolgreich wiederhergestellt';

  @override
  String restoreFailed(String error) {
    return 'Wiederherstellung fehlgeschlagen: $error';
  }

  @override
  String get logOutTitle => 'Abmelden?';

  @override
  String get logOutContent =>
      'Du wirst abgemeldet. Deine Downloads bleiben auf diesem Gerät.';

  @override
  String get signOut => 'Abmelden';

  @override
  String get changePasswordTitle => 'Passwort ändern';

  @override
  String get changePasswordSubtitle =>
      'Aktualisiere sicher dein Audiobookshelf Passwort';

  @override
  String get currentPassword => 'Aktuelles Passwort';

  @override
  String get newPassword => 'Neues Passwort';

  @override
  String get confirmNewPassword => 'Neues Passwort bestätigen';

  @override
  String get passwordChangeEffect =>
      'Das Ändern deines Passworts meldet dich von allen anderen Audiobookshelf Sitzungen ab. Dieses Gerät bleibt angemeldet.';

  @override
  String get passwordFieldsRequired => 'Alle Passwortfelder ausfüllen';

  @override
  String get passwordsDoNotMatch =>
      'Die neuen Passwörter stimmen nicht überein';

  @override
  String get passwordChanged =>
      'Passwort geändert. Andere angemeldete Geräte wurden getrennt.';

  @override
  String get passwordInvalid => 'Das aktuelle Kennwort ist falsch';

  @override
  String get passwordChangeUnsupported =>
      'Diese Server-Version unterstützt keine sicheren Passwortänderungen in Absorb';

  @override
  String get passwordChangeFailed =>
      'Dein Passwort konnte nicht geändert werden';

  @override
  String get otherUserPasswordResetWarning =>
      'Das Ändern dieses Passworts meldet den Benutzer auf allen Geräten ab.';

  @override
  String get manageSessionsTitle => 'Angemeldete Geräte';

  @override
  String get manageSessionsSubtitle =>
      'Audiobookshelf Sitzungen überprüfen und entfernen';

  @override
  String get sessionsCurrent => 'Aktuelles Gerät';

  @override
  String get sessionsUnknownDevice => 'Unbekanntes Gerät';

  @override
  String sessionsLastActive(String date) {
    return 'Zuletzt aktiv $date';
  }

  @override
  String get sessionsNone => 'Keine aktiven Sitzungen';

  @override
  String get sessionsLoadMore => 'Mehr laden';

  @override
  String get sessionsUnsupported =>
      'Das Session-Management benötigt Audiobookshelf 2.36 oder neuer.';

  @override
  String get sessionsLoadFailed =>
      'Angemeldete Geräte konnten nicht geladen werden';

  @override
  String get sessionsLegacyNotice =>
      'Dieser Login hat keine Sitzungsaktualisierung, daher kann Absorb dieses Gerät nicht in der Liste identifizieren.';

  @override
  String get sessionsRemove => 'Gerät abmelden';

  @override
  String get sessionsRemoveTitle => 'Dieses Gerät abmelden?';

  @override
  String get sessionsRemoveContent =>
      'Dies entfernt die Sitzungsaktualisierung. Der aktuelle Zugriff funktioniert eventuell weiter, bis das kurzlebige Token abläuft.';

  @override
  String get sessionsRemoved => 'Gerät abgemeldet';

  @override
  String get sessionsRemoveFailed => 'Das Gerät konnte nicht abgemeldet werden';

  @override
  String get sessionsSignOutAll => 'Alle Geräte abmelden';

  @override
  String get sessionsSignOutAllTitle => 'Überall abmelden?';

  @override
  String get sessionsSignOutAllContent =>
      'Dies entfernt jede Sitzungsaktualisierung, einschließlich dieses Geräts. Vorhandene Zugriffs-Token können bis zum Ablauf funktionieren.';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return 'Zeitplan verwendet die Serverzeit ($timeZone)';
  }

  @override
  String get podcastScheduleServerTimeUnknown =>
      'Zeitplan verwendet die Serverzeit';

  @override
  String get editServerAddressTitle => 'Serveradresse bearbeiten';

  @override
  String editServerAddressSubtitle(String username) {
    return 'Aktualisiere die Adresse für $username. Nutze diese Option, wenn sich lediglich die URL geändert hat - es aber noch immer der gleiche Server ist. Deine Statistiken und Downloads werden beibehalten.';
  }

  @override
  String get editServerAddressField => 'Serveradresse';

  @override
  String get editServerAddressUpdated => 'Serveradresse aktualisiert';

  @override
  String get editServerAddressFailed =>
      'Serveradresse konnte nicht aktualisiert werden';

  @override
  String get editServerAddressAction => 'Serveradresse bearbeiten';

  @override
  String get editServerConnectionTitle => 'Server-Verbindung bearbeiten';

  @override
  String editServerConnectionSubtitle(String username) {
    return 'Aktualisieren die Serveradresse und die benutzerdefinierten Header für $username. Deine Statistiken und Downloads werden beibehalten.';
  }

  @override
  String get editServerConnectionAction => 'Server-Verbindung bearbeiten';

  @override
  String get editServerConnectionUpdated => 'Serververbindung aktualisiert';

  @override
  String get editServerConnectionFailed =>
      'Serververbindung konnte nicht aktualisiert werden';

  @override
  String get editCustomHeadersDescription =>
      'Wird für Cloudflare Tunnel oder Reverse Proxies verwendet. Diese Header gelten nur für dieses gespeicherte Konto.';

  @override
  String get removeAccountAction => 'Konto entfernen';

  @override
  String get removeAccountTitle => 'Konto entfernen?';

  @override
  String removeAccountContent(String username, String server) {
    return '$username auf $server aus den gespeicherten Konten entfernen?\n\nDu kannst es jederzeit wieder hinzufügen, indem du dich erneut anmeldest.';
  }

  @override
  String get switchAccountTitle => 'Konto wechseln?';

  @override
  String switchAccountContent(String username, String server) {
    return 'Zu $username auf $server wechseln?\n\nDie aktuelle Wiedergabe wird gestoppt und die App lädt mit den Daten des anderen Kontos neu.';
  }

  @override
  String get switchButton => 'Wechseln';

  @override
  String get downloadLocationSheetTitle => 'Download-Speicherort';

  @override
  String get downloadLocationSheetSubtitle =>
      'Wähle, wo Hörbücher gespeichert werden';

  @override
  String get currentLocation => 'Aktueller Speicherort';

  @override
  String get existingDownloadsWarning =>
      'Vorhandene Downloads bleiben an ihrem aktuellen Speicherort. Nur neue Downloads verwenden den neuen Pfad.';

  @override
  String get chooseFolder => 'Ordner wählen';

  @override
  String get chooseDownloadFolder => 'Download-Ordner wählen';

  @override
  String get storagePermissionDenied =>
      'Speicherberechtigung dauerhaft verweigert - aktiviere sie in den App-Einstellungen';

  @override
  String get openSettings => 'Einstellungen öffnen';

  @override
  String get storagePermissionRequired =>
      'Speicherberechtigung ist für eigene Download-Speicherorte erforderlich';

  @override
  String get cannotWriteToFolder =>
      'Kann nicht in diesen Ordner schreiben - wähle einen anderen Speicherort oder gewähre in den Systemeinstellungen Dateizugriff';

  @override
  String downloadLocationSetTo(String label) {
    return 'Download-Speicherort gesetzt auf $label';
  }

  @override
  String get resetToDefault => 'Auf Standard zurücksetzen';

  @override
  String get resetToDefaultStorage => 'Auf Standardspeicher zurücksetzen';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Downloads liegen in einem alten benutzerdefinierten Ordner, der nicht mehr geöffnet werden kann. Lade die Dateien erneut herunter oder schließe diese Mitteilung.',
      one:
          '1 Download liegt in einem alten benutzerdefinierten Ordner, der nicht mehr geöffnet werden kann. Lade ihn erneut herunter oder schließe diese Mitteilung.',
    );
    return '$_temp0';
  }

  @override
  String get redownload => 'Erneut herunterladen';

  @override
  String get redownloadStarted => 'Wird erneut heruntergeladen';

  @override
  String get dismiss => 'Verwerfen';

  @override
  String get tipsAndHiddenFeatures => 'Tipps & versteckte Funktionen';

  @override
  String get tipsSubtitle => 'Hol das Beste aus Absorb heraus';

  @override
  String get adminTitle => 'Server-Admin';

  @override
  String get adminTasksTitle => 'Server-Aktivität';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Aufgaben laufen',
      one: '1 Aufgabe läuft',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => 'Letzte Server-Aktivität';

  @override
  String get adminTasksEmpty => 'Es laufen keine Server-Aufgaben';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return '$added hinzugefügt - $updated aktualisiert - $missing fehlen';
  }

  @override
  String get adminServer => 'Server';

  @override
  String get adminVersion => 'Version';

  @override
  String get adminUsers => 'Benutzer';

  @override
  String get adminOnline => 'Online';

  @override
  String get adminBackup => 'Sicherung';

  @override
  String get adminPurgeCache => 'Cache leeren';

  @override
  String get adminManage => 'Verwalten';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return '$userCount Konten - $onlineCount online';
  }

  @override
  String get adminPodcasts => 'Podcasts';

  @override
  String get adminPodcastsSubtitle =>
      'Sendungen suchen, hinzufügen & verwalten';

  @override
  String get adminScan => 'Scannen';

  @override
  String get adminScanning => 'Scannt...';

  @override
  String get adminMatchAll => 'Alle abgleichen';

  @override
  String get adminMatching => 'Gleicht ab...';

  @override
  String get adminMatchAllTitle => 'Alle Elemente abgleichen?';

  @override
  String adminMatchAllContent(String name) {
    return 'Metadaten für alle Elemente in $name abgleichen? Das kann eine Weile dauern.';
  }

  @override
  String adminScanStarted(String name) {
    return 'Scan für $name gestartet';
  }

  @override
  String get adminBackupCreated => 'Sicherung erstellt';

  @override
  String get adminBackupFailed => 'Sicherung fehlgeschlagen';

  @override
  String get adminCachePurged => 'Cache geleert';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => 'In App öffnen';

  @override
  String get adminRmabAdd => 'ReadMeABook-Integration hinzufügen';

  @override
  String get adminRmabUrlTitle => 'ReadMeABook-URL';

  @override
  String get adminRmabUrlHelp =>
      'Füge deine URL mit Login-Token ein. Generiere eine in RMAB, Admin, Users.';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => 'Gib eine gültige http(s)-URL ein';

  @override
  String get adminRmabSaved => 'ReadMeABook gespeichert';

  @override
  String get adminRmabRemoved => 'ReadMeABook entfernt';

  @override
  String get adminRmabReload => 'Neu laden';

  @override
  String get adminRmabLoadFailed =>
      'ReadMeABook konnte nicht geladen werden. Prüfe deine URL.';

  @override
  String get adminRmabConnected => 'Verbunden';

  @override
  String get adminRmabAskAdmin =>
      'Hol dir eine Login-URL von deinem Server-Admin';

  @override
  String get adminRmabUrlHelpUser =>
      'Hol dir eine Login-URL von deinem Server-Admin. Diese wird in RMAB > Admin > Users generiert.';

  @override
  String get adminRmabSettingsInfo =>
      'ReadMeABook ist ein selbst gehosteter Dienst zum Anfordern und Herunterladen von Hörbüchern. Es muss von deinem Server-Admin installiert und eingerichtet werden.';

  @override
  String get rmabConfigTitle => 'ReadMeABook verbinden';

  @override
  String get rmabConfigExplainerAdmin =>
      'ReadMeABook ist ein selbst gehosteter Service für das Anfordern von Hörbüchern. Erzeuge in RMAB ein API-Token unter Admin Dashboard > Einstellungen > API, dann füge diesen und die Server-URL unten ein. Absorb speichert oder lädt keine Inhalte herunter, sondern sendet ausschließlich Anfragen an deinen Server.';

  @override
  String get rmabConfigExplainerUser =>
      'ReadMeABook ist ein selbst gehosteter Service für das Anfordern von Hörbüchern. Bitte deinen Server Administrator um die RMAB URL und ein API-Token. Absorb speichert oder lädt keine Inhalte herunter, sondern sendet ausschließlich Anfragen an deinen Server.';

  @override
  String get rmabConfigLearnMore => 'Mehr über ReadMeABook erfahren';

  @override
  String get rmabConfigBaseUrlLabel => 'RMAB Server URL';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.example.com';

  @override
  String get rmabConfigTokenLabel => 'API-Token';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel => 'Web UI Login URL (Optional)';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      'Füge deine Auto-Login-URL ein, sodass dich \'In Browseransicht öffnen\' direkt anmeldet. Für einen regulären Login lasse das Feld einfach leer.';

  @override
  String get rmabConfigHeadersHelp =>
      'Zusätzliche Header, die mit jeder ReadMeABook-Anfrage gesendet werden, für Reverse Proxies wie Cloudflare Access.';

  @override
  String get rmabConfigConnect => 'Verbinden';

  @override
  String get rmabConfigDisconnect => 'Trennen';

  @override
  String get rmabConfigOpenWebView => 'In der Browseransicht öffnen';

  @override
  String rmabConfigConnectedAs(String name) {
    return 'Verbunden als $name';
  }

  @override
  String get rmabConfigErrorInvalidUrl => 'Gültige http(s)-URL eingeben';

  @override
  String get rmabConfigErrorMissingToken => 'API-Token eingeben';

  @override
  String get rmabConfigErrorUnauthorized => 'Token vom Server abgelehnt';

  @override
  String get rmabConfigErrorForbidden =>
      'Dieses Token ist für diese Aktion nicht erlaubt';

  @override
  String get rmabConfigErrorNetwork =>
      'RMAB ist nicht erreichbar. Bitte überprüfe die URL.';

  @override
  String get rmabConfigErrorGeneric =>
      'Verbindung konnte nicht hergestellt werden';

  @override
  String get rmabConfigSavedSnackbar => 'ReadMeABook verbunden';

  @override
  String get rmabConfigDisconnectedSnackbar => 'ReadMeABook getrennt';

  @override
  String get rmabRequestCta => 'Über ReadMeABook anfragen';

  @override
  String get rmabSearchHeader => 'Über ReadMeABook anfragen';

  @override
  String get rmabSearchHint => 'Nach Titel oder Autor suchen';

  @override
  String get rmabSearchEmpty => 'Keine Treffer auf Ihrem ReadMeABook-Server';

  @override
  String get rmabSearchError => 'ReadMeABook konnte nicht durchsucht werden';

  @override
  String get rmabSearchPrompt => 'Um zu Suchen, gib einen Titel oder Autor ein';

  @override
  String get rmabSearchFooterPrompt => 'Suchst du etwas anderes?';

  @override
  String rmabSearchFooterCta(String query) {
    return 'Durchsuche ReadMeABook nach \"$query\"';
  }

  @override
  String get rmabBookDetailExplainer =>
      'Die Anfrage wird über deinen ReadMeABook-Server gesendet. Der Administrator wird diese überprüfen und bearbeiten. Unter \"Meine Anfragen\" auf der ReadMeABook Kachel kannst du den Status verfolgen.';

  @override
  String get rmabBookAlreadyAvailable => 'Bereits in deiner Bibliothek';

  @override
  String get rmabBookAlreadyRequested => 'Bereits angefordert';

  @override
  String get rmabRequestSubmitting => 'Wird übermittelt…';

  @override
  String get rmabRequestSent => 'Anfrage gesendet';

  @override
  String get rmabRequestErrorAlreadyAvailable => 'Bereits in deiner Bibliothek';

  @override
  String get rmabRequestErrorBeingProcessed => 'Wird bereits bearbeitet';

  @override
  String get rmabRequestErrorDuplicate => 'Du hast dies bereits angefragt';

  @override
  String get rmabRequestErrorValidation =>
      'Anfrage konnte nicht gesendet werden';

  @override
  String get rmabRequestErrorUserNotFound =>
      'Der Tokennutzer existiert nicht mehr. Bitte verbinde ReadMeABook erneut.';

  @override
  String get rmabRequestErrorIgnored =>
      'Dieses Buch ist auf deiner Ignorieren-Liste';

  @override
  String get rmabRequestErrorGeneric => 'Anfrage konnte nicht gesendet werden';

  @override
  String get rmabRequestErrorTokenRejected =>
      'Token wurde vom Server abgelegt. Bitte verbinde ReadMeABook erneut.';

  @override
  String get rmabMyRequestsTab => 'Meine Anfragen';

  @override
  String get rmabSetupTab => 'Einrichtung';

  @override
  String get rmabMyRequestsEmpty => 'Du hast bisher keine Bücher angefragt';

  @override
  String get rmabMyRequestsError => 'Anfragen konnten nicht geladen werden';

  @override
  String get rmabMyRequestsRefresh => 'Aktualisieren';

  @override
  String get rmabRequestDetailTitle => 'Details anfragen';

  @override
  String get rmabRequestDetailStatus => 'Status';

  @override
  String get rmabRequestDetailRequestedOn => 'Angefragt am';

  @override
  String get rmabRequestDetailCompletedOn => 'Erledigt am';

  @override
  String get rmabRequestDetailProgress => 'Fortschritt';

  @override
  String get rmabStatusActive => 'Im Gang';

  @override
  String get rmabStatusWaiting => 'Warten';

  @override
  String get rmabStatusAvailable => 'Verfügbar';

  @override
  String get rmabStatusDownloaded => 'Heruntergeladen';

  @override
  String get rmabStatusFailed => 'Fehlgeschlagen';

  @override
  String get rmabStatusCancelled => 'Abgebrochen';

  @override
  String get rmabStatusDenied => 'Verweigert';

  @override
  String get rmabStatusUnknown => 'Unbekannt';

  @override
  String narratedBy(String narrator) {
    return 'Gesprochen von $narrator';
  }

  @override
  String get onAudible => 'auf Audible';

  @override
  String percentComplete(String percent) {
    return '$percent% abgeschlossen';
  }

  @override
  String get absorbing => 'Absorbing...';

  @override
  String get absorbAgain => 'Nochmal Absorb';

  @override
  String get absorb => 'Absorb';

  @override
  String get ebookOnlyNoAudio => 'Nur eBook - kein Audio';

  @override
  String get absorbAudioNotDownloaded => 'Audio nicht heruntergeladen';

  @override
  String get absorbAudioNotDownloadedEbookOnly =>
      'Audio nicht heruntergeladen, nur eBook';

  @override
  String get fullyAbsorbed => 'Vollständig Absorbed';

  @override
  String get fullyAbsorbAction => 'Vollständig Absorb';

  @override
  String get removeFromAbsorbing => 'Aus Absorbing entfernen';

  @override
  String get addToAbsorbing => 'Zu Absorbing hinzufügen';

  @override
  String get absorbNext => 'Als Nächstes absorbieren';

  @override
  String get absorbNextAdded => 'Als Nächstes in Absorbing';

  @override
  String get absorbLast => 'Zuletzt absorbieren';

  @override
  String get absorbNextHint => 'Direkt nach dem aktuell laufenden';

  @override
  String get absorbLastHint => 'Am Ende der Liste';

  @override
  String get removedFromAbsorbing => 'Aus Absorbing entfernt';

  @override
  String get addedToAbsorbing => 'Zu Absorbing hinzugefügt';

  @override
  String get removeFromContinueListening => 'Aus \"Weiterhören\" entfernen';

  @override
  String get removedFromContinueListening => 'Aus \"Weiterhören\" entfernt';

  @override
  String get removeFromContinueReading => 'Aus „Weiterlesen“ entfernen';

  @override
  String get removedFromContinueReading => 'Aus „Weiterlesen“ entfernt';

  @override
  String get sessionAdd => 'Sitzung hinzufügen';

  @override
  String get sessionStartLabel => 'Gestartet um';

  @override
  String get sessionAdded => 'Sitzung hinzugefügt';

  @override
  String get sessionAddFailed => 'Die Sitzung konnte nicht hinzugefügt werden';

  @override
  String get removeSeriesFromContinueSeries =>
      'Aus \"Serie fortsetzen\" entfernen';

  @override
  String get removedSeriesFromContinueSeries =>
      'Aus \"Serie fortsetzen\" entfernt';

  @override
  String get couldNotUpdate =>
      'Konnte nicht aktualisieren werden, versuche es erneut';

  @override
  String get addToPlaylist => 'Zur Playlist hinzufügen';

  @override
  String get addToCollection => 'Zur Sammlung hinzufügen';

  @override
  String get downloadEbook => 'eBook herunterladen';

  @override
  String get downloadEbookAgain => 'eBook erneut herunterladen';

  @override
  String get resetProgress => 'Fortschritt zurücksetzen';

  @override
  String get lookupLocalMetadata => 'Lokale Metadaten suchen';

  @override
  String get reLookupLocalMetadata => 'Lokale Metadaten erneut suchen';

  @override
  String get clearLocalMetadata => 'Lokale Metadaten löschen';

  @override
  String get searchOnGoodreads => 'Auf Goodreads suchen';

  @override
  String get editServerDetails => 'Server-Details bearbeiten';

  @override
  String get encodeTab => 'Verschlüsseln';

  @override
  String get codec => 'Codec';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get channels => 'Kanäle';

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String get startM4bEncode => 'M4B-Encodierung starten';

  @override
  String get encodeStarted => 'M4B Encodierung gestartet';

  @override
  String get encodeFailed => 'Encodieren konnte nicht gestartet werden';

  @override
  String get encodeFinished => 'M4B-Encodierung abgeschlossen';

  @override
  String get currentlyLabel => 'Momentan:';

  @override
  String encodeOutputPathNote(String path) {
    return 'Fertiggestellte M4B Dateien werden im Hörbuchordner abgelegt unter: $path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return 'Ein Backup der original Audiodateien wird gespeichert unter: /metadata/cache/items/$itemId/. Achte darauf regelmäßig den Cache zu löschen.';
  }

  @override
  String get encodeTimeNote => 'Die Encodierung kann bis zu 30 Minuten dauern.';

  @override
  String get encodeRescanNote =>
      'Wenn du den Beobachter deaktiviert hast, musst du dieses Hörbuch später erneut scannen.';

  @override
  String get aboutSection => 'Info';

  @override
  String chaptersCount(int count) {
    return 'Kapitel ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return 'Audio-Tracks ($count)';
  }

  @override
  String libraryFilesCount(int count) {
    return 'Bibliotheks-Dateien ($count)';
  }

  @override
  String get chapters => 'Kapitel';

  @override
  String get noChaptersBook => 'Dieses Buch hat keine Kapitel';

  @override
  String get noChaptersPodcast => 'Dieser Podcast hat keine Kapitel';

  @override
  String get failedToLoad => 'Laden fehlgeschlagen';

  @override
  String startedDate(String date) {
    return 'Begonnen $date';
  }

  @override
  String finishedDate(String date) {
    return 'Beendet $date';
  }

  @override
  String andCountMore(int count) {
    return 'und $count weitere';
  }

  @override
  String get markAsFullyAbsorbedQuestion =>
      'Als vollständig Absorbed markieren?';

  @override
  String get markAsFullyAbsorbedContent =>
      'Dadurch wird dein Fortschritt auf 100% gesetzt und die Wiedergabe gestoppt, falls dieses Buch gerade läuft.';

  @override
  String get markedAsFinishedNiceWork => 'Als beendet markiert - gut gemacht!';

  @override
  String get failedToUpdateCheckConnection =>
      'Aktualisieren fehlgeschlagen - prüfe deine Verbindung';

  @override
  String get markAsNotFinishedQuestion => 'Als nicht beendet markieren?';

  @override
  String get markAsNotFinishedContent =>
      'Dadurch wird der Beendet-Status entfernt, deine aktuelle Position bleibt aber erhalten.';

  @override
  String get unmark => 'Markierung entfernen';

  @override
  String get markedAsNotFinishedBackAtIt =>
      'Als nicht beendet markiert - weiter geht\'s!';

  @override
  String get resetProgressQuestion => 'Fortschritt zurücksetzen?';

  @override
  String get resetProgressListeningAndReading =>
      'Your listening and reading progress will both go back to 0%.';

  @override
  String get resetProgressListening =>
      'Your listening progress will go back to 0%.';

  @override
  String get resetProgressReading =>
      'Your reading progress will go back to 0%.';

  @override
  String get resetProgressMarksUnread =>
      'The book will also be marked as unread.';

  @override
  String get resetProgressCantUndo => 'This can\'t be undone.';

  @override
  String get progressResetFreshStart =>
      'Fortschritt zurückgesetzt - frischer Start!';

  @override
  String get clearLocalMetadataQuestion => 'Lokale Metadaten löschen?';

  @override
  String get clearLocalMetadataContent =>
      'Dadurch werden die lokal gespeicherten Metadaten entfernt und auf das zurückgesetzt, was der Server hat.';

  @override
  String get localMetadataCleared => 'Lokale Metadaten gelöscht';

  @override
  String get saveEbook => 'eBook speichern';

  @override
  String get noEbookFileFound => 'Keine eBook-Datei gefunden';

  @override
  String get bookmark => 'Lesezeichen';

  @override
  String get bookmarks => 'Lesezeichen';

  @override
  String bookmarksWithCount(int count) {
    return 'Lesezeichen ($count)';
  }

  @override
  String get playbackSpeed => 'Wiedergabegeschwindigkeit';

  @override
  String get noBookmarksYet => 'Noch keine Lesezeichen';

  @override
  String get longPressBookmarkHint =>
      'Lange auf den Lesezeichen-Button drücken zum schnellen Speichern';

  @override
  String get addBookmark => 'Lesezeichen hinzufügen';

  @override
  String get editBookmark => 'Lesezeichen bearbeiten';

  @override
  String get titleLabel => 'Titel';

  @override
  String get noteOptionalLabel => 'Notiz (optional)';

  @override
  String get editLayout => 'Layout bearbeiten';

  @override
  String get inMenu => 'Im Menü';

  @override
  String get bookmarkAdded => 'Lesezeichen hinzugefügt';

  @override
  String get startPlayingSomethingFirst => 'Spiele zuerst etwas ab';

  @override
  String get playbackHistory => 'Wiedergabeverlauf';

  @override
  String get historyLocalTab => 'Verlauf';

  @override
  String get historyServerTab => 'Sitzungen';

  @override
  String get historyNoServerSessions =>
      'Noch keine Serversitzungen für dieses Element';

  @override
  String get historyServerLoadFailed =>
      'Serversitzungen konnten nicht geladen werden';

  @override
  String get clearHistoryTooltip => 'Verlauf löschen';

  @override
  String get tapEventToJump =>
      'Tippe auf ein Ereignis, um zu dieser Position zu springen';

  @override
  String get noHistoryYet => 'Noch kein Verlauf';

  @override
  String jumpedToPosition(String position) {
    return 'Zu $position gesprungen';
  }

  @override
  String booksInSeriesCount(int count) {
    return '$count Bücher in dieser Serie';
  }

  @override
  String bookNumber(String number) {
    return 'Buch $number';
  }

  @override
  String downloadRemainingCount(int count) {
    return 'Restliche herunterladen ($count)';
  }

  @override
  String get downloadAll => 'Alle herunterladen';

  @override
  String get markAllNotFinished => 'Alle als nicht beendet markieren';

  @override
  String get markAllFinished => 'Alle als beendet markieren';

  @override
  String get markAllNotFinishedQuestion => 'Alle als nicht beendet markieren?';

  @override
  String get fullyAbsorbSeries => 'Serie vollständig Absorb?';

  @override
  String get turnAutoDownloadOff => 'Auto-Download deaktivieren';

  @override
  String get turnAutoDownloadOn => 'Auto-Download aktivieren';

  @override
  String get autoDownloadThisSeries => 'Diese Serie automatisch herunterladen?';

  @override
  String get autoDownloadSeriesContent =>
      'Lädt die nächsten Bücher beim Hören automatisch herunter.';

  @override
  String get standalone => 'Eigenständig';

  @override
  String get episodes => 'Episoden';

  @override
  String get noEpisodesFound => 'Keine Episoden gefunden';

  @override
  String get markFinished => 'Als beendet markieren';

  @override
  String get markUnfinished => 'Als unbeendet markieren';

  @override
  String get allEpisodes => 'Alle Episoden';

  @override
  String get aboutThisEpisode => 'Über diese Episode';

  @override
  String get reversePlayOrder => 'Wiedergabereihenfolge umkehren';

  @override
  String selectedCount(int count) {
    return '$count ausgewählt';
  }

  @override
  String get selectAll => 'Alle auswählen';

  @override
  String get deselectAll => 'Alle abwählen';

  @override
  String get autoDownloadThisPodcast =>
      'Diesen Podcast automatisch herunterladen?';

  @override
  String get autoDownloadPodcastContent =>
      'Lädt die nächsten Episoden beim Hören automatisch herunter.';

  @override
  String get download => 'Herunterladen';

  @override
  String get deleteDownload => 'Download löschen';

  @override
  String get casting => 'Cast läuft';

  @override
  String get castingTo => 'Cast an';

  @override
  String get editDetails => 'Details bearbeiten';

  @override
  String get quickMatch => 'Schnellabgleich';

  @override
  String get quickMatchNoUpdates => 'Keine Aktualisierungen erforderlich';

  @override
  String get custom => 'Benutzerdefiniert';

  @override
  String get authorOptionalLabel => 'Autor (optional)';

  @override
  String get noResultsFound =>
      'Keine Ergebnisse gefunden.\nPasse deine Suche oder den Anbieter an.';

  @override
  String get searchForMetadataAbove => 'Oben nach Metadaten suchen';

  @override
  String get applyThisMatch => 'Diesen Treffer anwenden?';

  @override
  String get metadataUpdated => 'Metadaten aktualisiert';

  @override
  String get failedToUpdateMetadata =>
      'Metadaten konnten nicht aktualisiert werden';

  @override
  String get subtitleLabel => 'Untertitel';

  @override
  String get authorLabel => 'Autor';

  @override
  String get narratorLabel => 'Erzähler';

  @override
  String get seriesLabel => 'Serie';

  @override
  String get addSeries => 'Serie hinzufügen';

  @override
  String get removeSeries => 'Serie entfernen';

  @override
  String get descriptionLabel => 'Beschreibung';

  @override
  String get publisherLabel => 'Verlag';

  @override
  String get yearLabel => 'Jahr';

  @override
  String get genresLabel => 'Genres';

  @override
  String get tagsLabel => 'Schlagwörter';

  @override
  String get commaSeparated => 'Komma-getrennt';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => 'Coverbild';

  @override
  String get coverRemove => 'Cover entfernen';

  @override
  String get coverRemoveConfirm =>
      'Das Cover dieses Buchs entfernen? Stattdessen wird die generierte Titelkarte angezeigt.';

  @override
  String get coverRemoved => 'Cover entfernt';

  @override
  String get coverRemoveFailed => 'Konnte Cover nicht entfernen';

  @override
  String get coverUrlLabel => 'Cover-URL';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => 'Lokale Metadaten';

  @override
  String get overrideLocalDisplay => 'Lokale Anzeige überschreiben';

  @override
  String get metadataSavedLocally => 'Metadaten lokal gespeichert';

  @override
  String get notes => 'Notizen';

  @override
  String get newNote => 'Neue Notiz';

  @override
  String get editNote => 'Notiz bearbeiten';

  @override
  String get noNotesYet => 'Noch keine Notizen';

  @override
  String get markdownIsSupported => 'Markdown wird unterstützt';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => 'Behält die Formatierung bei';

  @override
  String get plainTextTxt => 'Reiner Text (.txt)';

  @override
  String get simpleTextNoFormatting => 'Einfacher Text, keine Formatierung';

  @override
  String get untitledNote => 'Unbenannte Notiz';

  @override
  String get titleHint => 'Titel';

  @override
  String get noteBodyHint => 'Schreibe deine Notiz... (unterstützt Markdown)';

  @override
  String get nothingToPreview => 'Nichts zur Vorschau';

  @override
  String get audioEnhancements => 'Audio-Verbesserungen';

  @override
  String get presets => 'VOREINSTELLUNGEN';

  @override
  String get equalizer => 'EQUALIZER';

  @override
  String get effects => 'EFFEKTE';

  @override
  String get bassBoost => 'Bass-Boost';

  @override
  String get surround => 'Surround';

  @override
  String get loudness => 'Lautheit';

  @override
  String get monoAudio => 'Mono-Audio';

  @override
  String get skipSilence => 'Stille überspringen';

  @override
  String get resetAll => 'Alles zurücksetzen';

  @override
  String get collectionNotFound => 'Sammlung nicht gefunden';

  @override
  String get deleteCollection => 'Sammlung löschen';

  @override
  String get deleteCollectionContent =>
      'Möchtest du diese Sammlung wirklich löschen?';

  @override
  String get deleteCollectionFailed => 'Sammlung konnte nicht gelöscht werden';

  @override
  String get deletePermissionRequired =>
      'Löschberechtigung erforderlich. Bitte wende dich hierzu an den Administrator.';

  @override
  String get deleteFilesCheckbox => 'Dateien auf dem Server ebenfalls löschen';

  @override
  String get deleteFilesCheckedHint =>
      'Die Dateien werden auf dem Server endgültig gelöscht.';

  @override
  String get deleteFilesUncheckedHint =>
      'Die Dateien bleiben auf dem Server. Ein erneuter Scan kann sie wieder hinzufügen.';

  @override
  String get deleteFromServerAction => 'Vom Server löschen';

  @override
  String get deleteFromServerTitle => 'Vom Server löschen';

  @override
  String deleteFromServerContent(String title) {
    return '\"$title\" aus Audiobookshelf entfernen?';
  }

  @override
  String deletedFromServer(String title) {
    return '\"$title\" gelöscht';
  }

  @override
  String get deleteFromServerFailed =>
      'Konnte dies nicht löschen. Überprüfe die Server-Protokolle.';

  @override
  String get playlistNotFound => 'Playlist nicht gefunden';

  @override
  String get deletePlaylist => 'Playlist löschen';

  @override
  String get deletePlaylistContent =>
      'Möchtest du diese Playlist wirklich löschen?';

  @override
  String get newPlaylist => 'Neue Playlist';

  @override
  String get playlistNameHint => 'Name der Playlist';

  @override
  String addedToName(String name) {
    return 'Zu \"$name\" hinzugefügt';
  }

  @override
  String get failedToAdd => 'Hinzufügen fehlgeschlagen';

  @override
  String get newCollection => 'Neue Sammlung';

  @override
  String get collectionNameHint => 'Name der Sammlung';

  @override
  String get listsNewCollectionSubtitle =>
      'Bücher in einer Liste gruppieren, die du behältst';

  @override
  String get listsNewCollectionNeedsBookSubtitle =>
      'Mit mindestens einem Buch beginnen';

  @override
  String get listsNewPlaylistSubtitle =>
      'Bücher in der Reihenfolge anordnen, in der du sie hörst';

  @override
  String get listsAddBooksNow => 'Jetzt Bücher hinzufügen';

  @override
  String get listsPickBooksNext =>
      'Als Nächstes wählst du Bücher aus. Eine Sammlung auf diesem Server braucht mindestens eines.';

  @override
  String get listsCreate => 'Erstellen';

  @override
  String get listsCollectionNeedsBook =>
      'Eine Sammlung braucht mindestens ein Buch, daher wurde nichts erstellt.';

  @override
  String get listsCreateFailed => 'Konnte nicht erstellt werden';

  @override
  String get castToDevice => 'An Gerät casten';

  @override
  String get searchingForCastDevices => 'Suche nach Cast-Geräten...';

  @override
  String get castDevice => 'Cast-Gerät';

  @override
  String get stopCasting => 'Cast beenden';

  @override
  String get disconnect => 'Trennen';

  @override
  String get audioOutput => 'Audioausgabe';

  @override
  String get noOutputDevicesFound => 'Keine Ausgabegeräte gefunden';

  @override
  String get welcomeToAbsorb => 'Willkommen bei Absorb';

  @override
  String get welcomeTagline => 'Ein Audiobookshelf-Client.';

  @override
  String get welcomeAbsorbingTitle => 'Absorbing';

  @override
  String get welcomeAbsorbingIntro =>
      'Wir verwenden \"Absorb\" anstelle von \"abspielen\" und \"hören\".';

  @override
  String get welcomeAbsorbingTabBullet => 'Absorbing-Tab - was du gerade hörst';

  @override
  String get welcomeAbsorbButtonBullet => 'Absorb-Button - Wiedergabe starten';

  @override
  String get welcomeFullyAbsorbBullet => 'Fully Absorb - als beendet markieren';

  @override
  String get welcomeGettingAroundTitle => 'Zurechtfinden';

  @override
  String get welcomeGettingAroundBody =>
      'Tippe auf ein Cover, um die Details zu öffnen. Weiterhören-Karten sind anders - tippe für sofortige Wiedergabe, lange drücken für Details.';

  @override
  String get welcomeMakeItYoursTitle => 'Mach es zu deinem';

  @override
  String get welcomeMakeItYoursBody =>
      'Stöbere in den Einstellungen und passe Absorb deinem Geschmack an. Der Bereich Tipps & versteckte Funktionen lohnt sich auf jeden Fall.';

  @override
  String get getStarted => 'Los geht\'s';

  @override
  String get showMore => 'Mehr anzeigen';

  @override
  String get showLess => 'Weniger anzeigen';

  @override
  String get readMore => 'Weiterlesen';

  @override
  String get removeDownloadQuestion => 'Download entfernen?';

  @override
  String get removeDownloadContent => 'Dies wird von deinem Gerät entfernt.';

  @override
  String get removeWhichDownload =>
      'Das Hörbuch und das eBook sind beide auf diesem Gerät. Wähle, was entfernt werden soll.';

  @override
  String get downloadRemoved => 'Download entfernt';

  @override
  String get finished => 'Beendet';

  @override
  String get saved => 'Heruntergeladen';

  @override
  String get selectLibrary => 'Bibliothek auswählen';

  @override
  String get switchLibraryTooltip => 'Bibliothek wechseln';

  @override
  String get refreshTooltip => 'Aktualisieren';

  @override
  String get noBooksFound => 'Keine Bücher gefunden';

  @override
  String get userFallback => 'Benutzer';

  @override
  String get rootAdmin => 'Root-Admin';

  @override
  String get admin => 'Admin';

  @override
  String get serverAdmin => 'Server-Admin';

  @override
  String get serverAdminSubtitle =>
      'Benutzer, Bibliotheken & Server-Einstellungen verwalten';

  @override
  String serverUpdateAvailable(String version) {
    return 'Serverupdate $version verfügbar';
  }

  @override
  String get justNow => 'Gerade eben';

  @override
  String minutesAgo(int count) {
    return 'vor $count Min.';
  }

  @override
  String hoursAgo(int count) {
    return 'vor $count Std.';
  }

  @override
  String daysAgo(int count) {
    return 'vor $count T.';
  }

  @override
  String get audible => 'Audible';

  @override
  String get iTunes => 'iTunes';

  @override
  String get openLibrary => 'Open Library';

  @override
  String get root => 'Root';

  @override
  String get coverPlayPause => 'Cover Play/Pause';

  @override
  String get coverPlayPauseOnSubtitle =>
      'An - tippe auf das Cover für Play/Pause';

  @override
  String get coverPlayPauseOffSubtitle =>
      'Aus - eigener Play/Pause-Button in den Steuerelementen';

  @override
  String get cardBackground => 'Kartenhintergrund';

  @override
  String get cardBackgroundBlurred => 'Verschwommen';

  @override
  String get cardBackgroundGradient => 'Farbverlauf';

  @override
  String get queueModeMergedSubtitle =>
      'Wiedergabe stoppt, manuelle Warteschlange oder Auto-Absorb des nächsten Elements';

  @override
  String get queueModeSeriesLabel => 'Serie';

  @override
  String get queueModeShowLabel => 'Sendung';

  @override
  String get queueModeInfoSeries => 'Serie';

  @override
  String get queueModeInfoSeriesDesc =>
      'Spielt automatisch das nächste Buch einer Serie oder die nächste Episode einer Podcast-Sendung ab.';

  @override
  String get resetButtonGridQuestion => 'Button-Raster zurücksetzen?';

  @override
  String get resetButtonGridContent =>
      'Dies stellt das Standard-Button-Layout, die Reihenfolge und die Schaltereinstellungen wieder her.';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get buttonGridReset => 'Button-Raster zurückgesetzt';

  @override
  String get resetButtonGrid => 'Button-Raster zurücksetzen';

  @override
  String get chapterBarrierOnRewind => 'Kapitelgrenze beim Zurückspulen';

  @override
  String get chapterBarrierInfoTitle => 'Kapitelgrenze';

  @override
  String get chapterBarrierInfoContent =>
      'Beim Zurückspulen springt die Wiedergabe an den Anfang des aktuellen Kapitels, statt ins vorherige zu wechseln.\n\nTippe innerhalb von 2 Sekunden zweimal auf den Zurückspulen-Button, um die Grenze zu durchbrechen.';

  @override
  String get chapterBarrierOnRewindOnSubtitle =>
      'An - Zurückspulen springt zum Kapitelanfang';

  @override
  String get chapterBarrierOnRewindOffSubtitle =>
      'Aus - Zurückspulen überschreitet Kapitelgrenzen';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return 'An - $min Sek. bis $max Sek. je nach Pausenlänge';
  }

  @override
  String get rewindOnSessionStart => 'Zurückspulen bei Sitzungsstart';

  @override
  String get rewindOnSessionStartInfoContent =>
      'Das normale Auto-Zurückspulen wird ausgelöst, wenn du innerhalb einer aktiven Sitzung aus einer Pause fortsetzt. Diese Einstellung fügt ein Zurückspulen beim Start einer komplett neuen Sitzung hinzu - zum Beispiel nach dem Schließen der App, gestoppter Wiedergabe oder beim frischen Öffnen der App.\n\nWenn aktiviert, springt die Wiedergabe zu Beginn jeder neuen Sitzung um den vollen maximalen Zurückspul-Wert zurück, damit du noch einmal hörst, wo du aufgehört hast.';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return 'An - spult bei einer neuen Sitzung um $seconds Sek. zurück';
  }

  @override
  String rewindActivationDelayValue(String seconds) {
    return '$seconds Sek.+';
  }

  @override
  String rewindRangeValue(String min, String max) {
    return '$min Sek. - $max Sek.';
  }

  @override
  String rewindSecondsPause(String seconds) {
    return '$seconds Sek. Pause';
  }

  @override
  String rewindMinPause(String minutes) {
    return '$minutes Min. Pause';
  }

  @override
  String rewindHrPause(String hours) {
    return '$hours Std. Pause';
  }

  @override
  String get rewindOneHrPause => '1 Std. Pause';

  @override
  String speedValue(String speed) {
    return '${speed}x';
  }

  @override
  String secondsValue(String seconds) {
    return '$seconds Sek.';
  }

  @override
  String minutesValue(int minutes) {
    return '$minutes Min.';
  }

  @override
  String get chimeBeforeSleep => 'Glocke vor Sleep';

  @override
  String get chimeBeforeSleepOnSubtitle =>
      'Spielt eine sanfte Glocke, bevor der Timer endet';

  @override
  String get chimeBeforeSleepOffSubtitle => 'Keine Tonwarnung vor Sleep';

  @override
  String get windDownDuration => 'Ausklingdauer';

  @override
  String windDownDurationSubtitle(int seconds) {
    return 'Ausblenden und Glocke beginnen $seconds Sek. vor Sleep';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return 'Senkt die Lautstärke schrittweise über die letzten $seconds Sek.';
  }

  @override
  String autoSleepTimerEnabledSubtitle(
    String start,
    String end,
    String duration,
  ) {
    return '$start - $end · $duration';
  }

  @override
  String get endOfChapterShort => 'Kapitelende';

  @override
  String get endOfChapterOnSubtitle => 'Am Ende des aktuellen Kapitels stoppen';

  @override
  String get endOfChapterOffSubtitle => 'Zeitgesteuerten Sleep-Timer verwenden';

  @override
  String get showExplicitBadge => 'Explicit-Abzeichen anzeigen';

  @override
  String get showExplicitBadgeOnSubtitle =>
      'Explicit-Inhalte zeigen ein \"E\"-Abzeichen';

  @override
  String get showExplicitBadgeOffSubtitle =>
      'Aus - Explicit-Abzeichen ausgeblendet';

  @override
  String get showEbookBadge => 'eBook-Symbol anzeigen';

  @override
  String get showEbookBadgeOnSubtitle =>
      'Bücher mit eBook zeigen ein Buchsymbol auf dem Cover';

  @override
  String get showEbookBadgeOffSubtitle => 'Aus - eBook-Symbol ausgeblendet';

  @override
  String get libraryFallback => 'Bibliothek';

  @override
  String get preReleaseUpdatesInfoTitle => 'Pre-Release-Updates';

  @override
  String get preReleaseUpdatesInfoContent =>
      'Wenn aktiviert, informiert dich der Update-Checker auch über Alpha- und Pre-Release-Builds von GitHub. Diese können instabiler sein, enthalten aber die neuesten Funktionen und Korrekturen.';

  @override
  String get includePreReleases => 'Pre-Releases einbeziehen';

  @override
  String get includePreReleasesOnSubtitle =>
      'An - sucht nach Alpha- & Pre-Release-Builds';

  @override
  String get includePreReleasesOffSubtitle => 'Aus - nur stabile Versionen';

  @override
  String get setTooltip => 'Festlegen';

  @override
  String get saveAbsorbBackup => 'Absorb-Backup speichern';

  @override
  String get checkForUpdate => 'Nach Update suchen';

  @override
  String get onLatestVersion => 'Du nutzt die neueste Version';

  @override
  String get updateAvailable => 'Update verfügbar';

  @override
  String get preReleaseAvailable => 'Pre-Release verfügbar';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'Eine neue $kind von Absorb ist verfügbar: $latest\n\nDu hast $current.';
  }

  @override
  String get updateKindPreRelease => 'Pre-Release-Version';

  @override
  String get updateKindVersion => 'Version';

  @override
  String get downloadButton => 'Herunterladen';

  @override
  String get updateDownloading => 'Update wird heruntergeladen...';

  @override
  String get updateInstallPermissionDenied =>
      'Installationsberechtigung verweigert. Aktiviere für Absorb in den Systemeinstellungen \"Unbekannte Apps installieren\".';

  @override
  String get updateOpeningInBrowser =>
      'Das In-App-Update ist fehlgeschlagen, Browser wird geöffnet';

  @override
  String get sendToEreader => 'An E-Reader senden';

  @override
  String sendingToEreader(String device) {
    return 'Sende an $device...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return 'Gesendet an $device';
  }

  @override
  String get sendToEreaderFailed => 'Das E-Book konnte nicht gesendet werden';

  @override
  String get pickEreaderDevice => 'Wähle ein Gerät';

  @override
  String get adminEmail => 'E-Mail';

  @override
  String get adminEmailSubtitle => 'SMTP und E-Reader-Geräte';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => 'Einrichtungsanleitung';

  @override
  String get smtpHost => 'Host';

  @override
  String get smtpPort => 'Port';

  @override
  String get smtpSecure => 'Sicher';

  @override
  String get smtpRejectUnauthorized => 'Unzulässiges TLS ablehnen';

  @override
  String get smtpUser => 'Benutzername';

  @override
  String get smtpPass => 'Passwort';

  @override
  String get smtpFromAddress => 'Absenderadresse';

  @override
  String get smtpTestAddress => 'Testadresse';

  @override
  String get smtpSendTest => 'Test senden';

  @override
  String get smtpSaveSettings => 'Speichern';

  @override
  String get smtpSaved => 'E-Mail-Einstellungen gespeichert';

  @override
  String get smtpSaveFailed =>
      'Die E-Mail-Einstellungen konnten nicht gespeichert werden';

  @override
  String get smtpTestSent => 'Test-E-Mail gesendet';

  @override
  String get smtpTestFailed => 'Test-E-Mail fehlgeschlagen';

  @override
  String get ereaderDevicesTitle => 'E-Reader-Geräte';

  @override
  String get ereaderDevicesEmpty =>
      'Noch keine Geräte. Füge unten eines hinzu.';

  @override
  String get addEreaderDevice => 'Gerät hinzufügen';

  @override
  String get editEreaderDevice => 'Gerät bearbeiten';

  @override
  String get deleteEreaderDevice => 'Löschen';

  @override
  String get ereaderDeviceName => 'Name';

  @override
  String get ereaderDeviceEmail => 'E-Mail';

  @override
  String get ereaderAvailability => 'Wer kann dieses Gerät verwenden';

  @override
  String get ereaderAvailAdminOrUp => 'Nur für Administratoren';

  @override
  String get ereaderAvailUserOrUp => 'Alle Benutzer';

  @override
  String get ereaderAvailGuestOrUp => 'Jeder';

  @override
  String get ereaderAvailSpecificUsers => 'Bestimmte Benutzer';

  @override
  String ereaderSpecificUsersN(int count) {
    return 'Bestimmte Benutzer ($count)';
  }

  @override
  String get ereaderDevicesSaved => 'Geräte gespeichert';

  @override
  String get ereaderDevicesSaveFailed =>
      'Geräte konnten nicht gespeichert werden';

  @override
  String libraryCountOne(int count) {
    return '$count Bibliothek';
  }

  @override
  String libraryCountOther(int count) {
    return '$count Bibliotheken';
  }

  @override
  String serverVersionLabel(String version) {
    return 'Server $version';
  }

  @override
  String appVersionServerSuffix(String version) {
    return '  ·  Server $version';
  }

  @override
  String backupDateFormat(int month, int day, int year) {
    return '$day.$month.$year';
  }

  @override
  String get backupDetailsSeparator => ' · ';

  @override
  String get bookmarksSortedByPositionReversed =>
      'Nach Position sortiert (umgekehrt)';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '\"$title\" bei $position';
  }

  @override
  String get deleteBookmarkQuestion => 'Lesezeichen löschen?';

  @override
  String get cardIconsOnlyChip => 'Nur Symbole';

  @override
  String get cardMoreInGridChip => '\"Mehr\" im Raster';

  @override
  String get cardLayoutHidden => 'Ausgeblendet';

  @override
  String get speed => 'Geschwindigkeit';

  @override
  String get details => 'Details';

  @override
  String get episodeDetailsLabel => 'Episoden-Details';

  @override
  String get bookDetailsLabel => 'Buch-Details';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => 'Equalizer';

  @override
  String get cast => 'Cast';

  @override
  String castingToDevice(String device) {
    return 'Cast an $device';
  }

  @override
  String castToDeviceNamed(String device) {
    return 'An $device casten';
  }

  @override
  String get historyShort => 'Verlauf';

  @override
  String atPosition(String position) {
    return 'bei $position';
  }

  @override
  String chaptersChip(int count) {
    return '$count Kapitel';
  }

  @override
  String chapterNumber(int number) {
    return 'Kapitel $number';
  }

  @override
  String kbpsValue(int value) {
    return '$value kbps';
  }

  @override
  String get fileInfoTitle => 'Dateiinfo';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '1 Datei',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => 'Dieses Buch hat keine Dateidetails.';

  @override
  String get fileInfoAudio => 'Audio';

  @override
  String get fileInfoEbook => 'eBook';

  @override
  String get fileInfoOther => 'Weitere Dateien';

  @override
  String get fileInfoBookOrbitNote =>
      'BookOrbit meldet weder Codec noch Bitrate.';

  @override
  String fileInfoChannels(int count) {
    return '$count Kanäle';
  }

  @override
  String get fileInfoCover => 'Cover';

  @override
  String get fileInfoMetadata => 'Metadaten';

  @override
  String get fileInfoSupplement => 'Extra';

  @override
  String get fileInfoPathCopied => 'Pfad kopiert';

  @override
  String get resetMayNotHaveSynced =>
      'Zurücksetzen wurde möglicherweise nicht synchronisiert - prüfe deinen Server';

  @override
  String failedToDownloadEbook(int code) {
    return 'E-Book konnte nicht heruntergeladen werden ($code)';
  }

  @override
  String get serverReturnedErrorPage =>
      'Der Server hat eine Fehlerseite statt der E-Book-Datei zurückgegeben';

  @override
  String ebookSaved(String filename) {
    return 'Gespeichert: $filename';
  }

  @override
  String errorSavingEbook(String error) {
    return 'Fehler beim Speichern des E-Books: $error';
  }

  @override
  String failedToSaveError(String error) {
    return 'Speichern fehlgeschlagen: $error';
  }

  @override
  String get adminBackupsLabel => 'Backups';

  @override
  String get adminListeningNow => 'Hört gerade';

  @override
  String get adminLibraries => 'Bibliotheken';

  @override
  String get adminLibraryShows => 'Sendungen';

  @override
  String get adminLibraryBooks => 'Bücher';

  @override
  String get adminLibraryFolders => 'Ordner';

  @override
  String get adminLibrarySize => 'Größe';

  @override
  String get adminLibraryDuration => 'Dauer';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fehlende oder ungültige Elemente',
      one: '1 fehlendes oder ungültiges Element',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => 'Überprüfung';

  @override
  String get adminMissingTitle => 'Fehlende Elemente';

  @override
  String adminMissingSubtitle(String library) {
    return 'Einträge in $library, deren Dateien fehlen oder nicht lesbar sind';
  }

  @override
  String get adminMissingNone => 'Keine fehlenden oder ungültigen Elemente';

  @override
  String get adminMissingBadge => 'Fehlend';

  @override
  String get adminInvalidBadge => 'Ungültig';

  @override
  String get adminMissingDeleteTitle => 'Eintrag entfernen';

  @override
  String adminMissingDeleteOneContent(String title) {
    return '\"$title\" aus Audiobookshelf entfernen?';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return '$count Einträge aus Audiobookshelf entfernen?';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return '\"$count\" löschen?';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return '\"$title\" entfernt';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge entfernt',
      one: '1 Eintrag entfernt',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => 'Fehler beim Löschen des Eintrags';

  @override
  String get adminMatchAction => 'Abgleichen';

  @override
  String adminMatchingStarted(String name) {
    return 'Abgleich für $name gestartet';
  }

  @override
  String get adminMatchFailed => 'Fehlgeschlagen';

  @override
  String adminScanFailed(String name) {
    return 'Scan von $name fehlgeschlagen';
  }

  @override
  String get adminPurgeCacheFailed => 'Fehlgeschlagen';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => 'admin';

  @override
  String get adminUsersDisabledBadge => 'deaktiviert';

  @override
  String get adminUsersEditUserTooltip => 'Benutzer bearbeiten';

  @override
  String get adminUsersOnlineNow => 'Jetzt online';

  @override
  String adminUsersLastSeen(String time) {
    return 'Zuletzt gesehen $time';
  }

  @override
  String get adminUsersNever => 'Nie';

  @override
  String get adminUsersTotal => 'Gesamt';

  @override
  String get adminUsersNoReadingActivity => 'Keine Leseaktivität';

  @override
  String get adminUsersLoadingDots => 'Wird geladen...';

  @override
  String get adminUsersLoadMoreSessions => 'Weitere Sitzungen laden';

  @override
  String get adminUsersNoRecentSessions => 'Keine aktuellen Sitzungen';

  @override
  String get adminUsersLibraryProgress => 'Bibliotheksfortschritt';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return 'Mehr laden ($count übrig)';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return 'vor $count Mon.';
  }

  @override
  String get adminUsersNewUser => 'Neuer Benutzer';

  @override
  String get adminUsersEditUser => 'Benutzer bearbeiten';

  @override
  String get adminUsersUsername => 'Benutzername';

  @override
  String get adminUsersEnterUsername => 'Benutzernamen eingeben';

  @override
  String get adminUsersPassword => 'Passwort';

  @override
  String get adminUsersNewPassword => 'Neues Passwort';

  @override
  String get adminUsersEnterPassword => 'Passwort eingeben';

  @override
  String get adminUsersLeaveBlankToKeep =>
      'Leer lassen, um aktuelles zu behalten';

  @override
  String get adminUsersAccountType => 'Kontotyp';

  @override
  String get adminUsersTypeGuest => 'Gast';

  @override
  String get adminUsersTypeUser => 'Benutzer';

  @override
  String get adminUsersTypeAdmin => 'Admin';

  @override
  String get adminUsersStatus => 'Status';

  @override
  String get adminUsersAccountActive => 'Konto aktiv';

  @override
  String get adminUsersAccountActiveSub =>
      'Deaktivierte Konten können sich nicht anmelden';

  @override
  String get adminUsersLocked => 'Gesperrt';

  @override
  String get adminUsersLockedSub => 'Verhindert Passwortänderungen';

  @override
  String get adminUsersPermissions => 'Berechtigungen';

  @override
  String get adminUsersPermDownload => 'Herunterladen';

  @override
  String get adminUsersPermUpdate => 'Aktualisieren';

  @override
  String get adminUsersPermUpdateSub =>
      'Metadaten und Bibliothekselemente bearbeiten';

  @override
  String get adminUsersPermDelete => 'Löschen';

  @override
  String get adminUsersPermUpload => 'Hochladen';

  @override
  String get adminUsersPermExplicit => 'Explicit-Inhalte';

  @override
  String get adminUsersLibraryAccess => 'Bibliothekszugriff';

  @override
  String get adminUsersAccessAllLibraries => 'Zugriff auf alle Bibliotheken';

  @override
  String get adminUsersCreateUser => 'Benutzer erstellen';

  @override
  String get adminUsersSaveChanges => 'Änderungen speichern';

  @override
  String get adminUsersUsernameRequired => 'Benutzername erforderlich';

  @override
  String get adminUsersPasswordRequired => 'Passwort erforderlich';

  @override
  String get adminUsersUserCreated => 'Benutzer erstellt';

  @override
  String get adminUsersUserUpdated => 'Benutzer aktualisiert';

  @override
  String get adminUsersFailedCreate => 'Benutzer konnte nicht erstellt werden';

  @override
  String get adminUsersFailedUpdate =>
      'Benutzer konnte nicht aktualisiert werden';

  @override
  String get adminUsersThisUser => 'diesen Benutzer';

  @override
  String get adminUsersDeleteUserTitle => 'Benutzer löschen?';

  @override
  String adminUsersDeleteUserContent(String name) {
    return '$name dauerhaft löschen?';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return '$name gelöscht';
  }

  @override
  String get adminUsersFailedDelete => 'Benutzer konnte nicht gelöscht werden';

  @override
  String get adminUsersUnlinkOpenId => 'OpenID trennen';

  @override
  String get adminUsersUnlinkOpenIdTitle => 'OpenID trennen?';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return 'OpenID-Verbindung für $name entfernen? Der Benutzer muss sich später erneut mit OpenID anmelden, um wieder Zugriff zu erhalten.';
  }

  @override
  String get adminUsersOpenIdUnlinked => 'OpenID getrennt';

  @override
  String get adminUsersFailedUnlinkOpenId => 'Konnte OpenID nicht trennen';

  @override
  String adminUsersByAuthor(String author) {
    return 'von $author';
  }

  @override
  String get adminUsersListened => 'Gehört';

  @override
  String get adminUsersStartedAtPosition => 'Gestartet bei Position';

  @override
  String get adminUsersEndedAtPosition => 'Beendet bei Position';

  @override
  String get adminUsersTotalDuration => 'Gesamtdauer';

  @override
  String get adminUsersStarted => 'Gestartet';

  @override
  String get adminUsersUpdated => 'Aktualisiert';

  @override
  String get adminUsersClient => 'Client';

  @override
  String get adminUsersDevice => 'Gerät';

  @override
  String get adminUsersOs => 'Betriebssystem';

  @override
  String get adminUsersPlayMethod => 'Wiedergabemethode';

  @override
  String get adminUsersPlayDirect => 'Direktwiedergabe';

  @override
  String get adminUsersPlayDirectStream => 'Direkt-Stream';

  @override
  String get adminUsersPlayTranscode => 'Transcodieren';

  @override
  String get adminUsersPlayLocal => 'Lokal';

  @override
  String get adminPodcastsCheckNewEpisodesTitle => 'Auf neue Episoden prüfen';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      'Dies prüft die RSS-Feeds aller Podcasts und lädt alle gefundenen neuen Episoden herunter (sofern Auto-Download aktiviert ist).';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle =>
      'RSS-Feed durchsuchen und neue Episoden herunterladen';

  @override
  String get adminPodcastsCheck => 'Prüfen';

  @override
  String get adminPodcastsCheckingForNew => 'Suche nach neuen Episoden…';

  @override
  String get adminPodcastsCheckingForNewDots => 'Suche nach neuen Episoden...';

  @override
  String get adminPodcastsFailedCheckEpisodes =>
      'Episoden konnten nicht geprüft werden';

  @override
  String get adminPodcastsCheckFeedsTooltip => 'Feeds auf neue Episoden prüfen';

  @override
  String get adminPodcastsNoPodcastsYet => 'Noch keine Podcasts';

  @override
  String get adminPodcastsTapPlusHint =>
      'Tippe auf +, um Sendungen zu suchen und hinzuzufügen';

  @override
  String adminPodcastsEpisodesCount(int count) {
    return '$count Episoden';
  }

  @override
  String get adminPodcastsAddPodcast => 'Podcast hinzufügen';

  @override
  String get adminPodcastsCouldNotFindFeed => 'Podcast-Feed nicht gefunden';

  @override
  String get adminPodcastsSearchHint => 'Podcasts suchen…';

  @override
  String get adminPodcastsSearchItunesHint => 'iTunes durchsuchen...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return 'Durchsuche iTunes nach \"$query\"';
  }

  @override
  String get adminPodcastsNoPodcastsFound => 'Keine Podcasts gefunden';

  @override
  String get adminPodcastsRelToday => 'Heute';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return 'vor $count Wo.';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return 'vor $count Mon.';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return 'vor $count J.';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return 'Aktualisiert $when';
  }

  @override
  String get adminPodcastsGenreAll => 'Alle';

  @override
  String get adminPodcastsGenreArts => 'Kunst';

  @override
  String get adminPodcastsGenreComedy => 'Comedy';

  @override
  String get adminPodcastsGenreEducation => 'Bildung';

  @override
  String get adminPodcastsGenreTvFilm => 'TV & Film';

  @override
  String get adminPodcastsGenreMusic => 'Musik';

  @override
  String get adminPodcastsGenreNews => 'Nachrichten';

  @override
  String get adminPodcastsGenreReligion => 'Religion';

  @override
  String get adminPodcastsGenreScience => 'Wissenschaft';

  @override
  String get adminPodcastsGenreSports => 'Sport';

  @override
  String get adminPodcastsGenreTechnology => 'Technik';

  @override
  String get adminPodcastsGenreBusiness => 'Wirtschaft';

  @override
  String get adminPodcastsGenreFiction => 'Fiktion';

  @override
  String get adminPodcastsGenreSocietyCulture => 'Gesellschaft & Kultur';

  @override
  String get adminPodcastsGenreHealthFitness => 'Gesundheit & Fitness';

  @override
  String get adminPodcastsGenreTrueCrime => 'True Crime';

  @override
  String get adminPodcastsGenreHistory => 'Geschichte';

  @override
  String get adminPodcastsGenreKidsFamily => 'Kinder & Familie';

  @override
  String get adminPodcastsPodcastFallback => 'Podcast';

  @override
  String get adminPodcastsEpisodeFallback => 'Episode';

  @override
  String get adminPodcastsNoFeedFound => 'Keine Feed-URL gefunden';

  @override
  String get adminPodcastsNoFeedAvailable => 'Keine Feed-URL verfügbar';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return '$title zur Bibliothek hinzugefügt';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return '$title konnte nicht hinzugefügt werden';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    return '$count Episoden im Feed';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    return '+ $count weitere Episoden';
  }

  @override
  String get adminPodcastsAdding => 'Wird hinzugefügt…';

  @override
  String get adminPodcastsAddToLibrary => 'Zur Bibliothek hinzufügen';

  @override
  String get adminPodcastsRemoveShowTitle => 'Sendung entfernen?';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return '\"$title\" und alle Episoden vom Server entfernen? Dies kann nicht rückgängig gemacht werden.';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return '\"$title\" entfernt';
  }

  @override
  String get adminPodcastsFailedRemoveShow =>
      'Sendung konnte nicht entfernt werden';

  @override
  String get adminPodcastsRemoveShowTooltip => 'Sendung entfernen';

  @override
  String get adminPodcastsSelectMultipleTooltip => 'Mehrere auswählen';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return '$count heruntergeladen';
  }

  @override
  String get adminPodcastsTabDownloaded => 'Heruntergeladen';

  @override
  String get adminPodcastsTabFeed => 'Feed';

  @override
  String get adminPodcastsTabSettings => 'Einstellungen';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return '\"$title\" wird heruntergeladen';
  }

  @override
  String get adminPodcastsFailedDownload => 'Download fehlgeschlagen';

  @override
  String get adminPodcastsDeleteEpisodeTitle => 'Episode löschen?';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return '\"$title\" löschen?';
  }

  @override
  String get adminPodcastsDeleted => 'Gelöscht';

  @override
  String get adminPodcastsFailed => 'Fehlgeschlagen';

  @override
  String get adminPodcastsDeleteEpisodesTitle => 'Episoden löschen?';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return '$count Episode(n) vom Server löschen?';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return '$count Episode(n) gelöscht';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload =>
      'Feed durchsuchen, um herunterzuladen';

  @override
  String get adminPodcastsDownloadingDots => 'Wird heruntergeladen...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return '$count Episode(n) löschen';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return '$count Episode(n) werden heruntergeladen';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return '$count Episode(n) herunterladen';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter => 'Nach Episoden suchen ab';

  @override
  String get adminPodcastsSelectDate => 'Datum auswählen';

  @override
  String get adminPodcastsMaxEpisodes => 'Max. Episoden zum Herunterladen';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return 'Keine neuen Episoden nach $date gefunden';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return '$count neue Episode(n) gefunden - werden heruntergeladen';
  }

  @override
  String get adminPodcastsFailedToCheckNew =>
      'Suche nach neuen Episoden fehlgeschlagen';

  @override
  String get adminPodcastsCheckAndDownload => 'Prüfen & Herunterladen';

  @override
  String get adminPodcastsMatchPodcast => 'Podcast zuordnen';

  @override
  String get adminPodcastsMatchPodcastSubtitle =>
      'iTunes durchsuchen, um Cover und Metadaten zu aktualisieren';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes =>
      'Neue Episoden automatisch herunterladen';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle =>
      'Server lädt neue Episoden automatisch herunter';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle =>
      'Neue Episoden werden nicht automatisch heruntergeladen';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate =>
      'Auto-Download-Einstellung konnte nicht aktualisiert werden';

  @override
  String get adminPodcastsMaxEpisodesToKeep => 'Anzahl zu behaltender Episoden';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      '0 behält alle Episoden. Nachdem eine neue Episode heruntergeladen wurde, wird die älteste Episode entfernt so fern das Limit erreicht wurde.';

  @override
  String get adminPodcastsNoEpisodeLimit => 'Kein Limit';

  @override
  String get adminPodcastsEpisodeLimitInvalid =>
      '0 oder eine ganze Zahl eingeben';

  @override
  String get adminPodcastsCheckSchedule => 'Prüfplan';

  @override
  String get adminPodcastsFrequency => 'Häufigkeit';

  @override
  String get adminPodcastsFreqHourly => 'Stündlich';

  @override
  String get adminPodcastsFreqDaily => 'Täglich';

  @override
  String get adminPodcastsFreqWeekly => 'Wöchentlich';

  @override
  String get adminPodcastsDay => 'Tag';

  @override
  String get adminPodcastsTime => 'Uhrzeit';

  @override
  String get adminPodcastsDaySun => 'So';

  @override
  String get adminPodcastsDayMon => 'Mo';

  @override
  String get adminPodcastsDayTue => 'Di';

  @override
  String get adminPodcastsDayWed => 'Mi';

  @override
  String get adminPodcastsDayThu => 'Do';

  @override
  String get adminPodcastsDayFri => 'Fr';

  @override
  String get adminPodcastsDaySat => 'Sa';

  @override
  String get adminPodcastsFeedUrl => 'Feed-URL';

  @override
  String get adminPodcastsBack => 'Zurück';

  @override
  String get adminPodcastsRootOnly => 'Nur Hauptverzeichnis';

  @override
  String get adminPodcastsDeleting => 'Wird gelöscht...';

  @override
  String get adminPodcastsDeleteEpisode => 'Episode löschen';

  @override
  String adminPodcastsSeasonChip(String season) {
    return 'Staffel $season';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return 'Ep. $number';
  }

  @override
  String get adminPodcastsApplyingMatch => 'Zuordnung wird angewendet...';

  @override
  String get adminPodcastsNoResults => 'Keine Ergebnisse';

  @override
  String get adminPodcastsPodcastMatched =>
      'Podcast zugeordnet und aktualisiert';

  @override
  String get adminPodcastsFailedMatch =>
      'Podcast konnte nicht zugeordnet werden';

  @override
  String get adminPodcastsSelectAll => 'Alles auswählen';

  @override
  String get adminPodcastsSelectAllNew => 'Nur neue';

  @override
  String get adminPodcastsSortNewestFirst => 'Neueste zuerst';

  @override
  String get adminPodcastsSortOldestFirst => 'Älteste zuerst';

  @override
  String get adminPodcastsEditInfo => 'Info bearbeiten';

  @override
  String get adminPodcastsEditInfoSubtitle =>
      'Titel, Beschreibung, Cover und mehr ändern';

  @override
  String get adminPodcastsEditTitle => 'Podcast bearbeiten';

  @override
  String get adminPodcastsReleaseDate => 'Erscheinungsdatum';

  @override
  String get adminPodcastsExplicit => 'Explizit';

  @override
  String get adminPodcastsExplicitSubtitle =>
      'Diesen Podcast als explizit markieren';

  @override
  String get episodeListEpisodeFallback => 'Episode';

  @override
  String get episodeListUnknownPodcast => 'Unbekannter Podcast';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episoden als beendet markiert',
      one: '1 Episode als beendet markiert',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episoden als unbeendet markiert',
      one: '1 Episode als unbeendet markiert',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes =>
      'Neue Episoden abbestellen';

  @override
  String get episodeListSubscribeToNewEpisodes => 'Neue Episoden abonnieren';

  @override
  String get episodeListSubscribeTitle => 'Diesen Podcast abonnieren?';

  @override
  String get episodeListSubscribeContent =>
      'Neue Episoden werden automatisch heruntergeladen und zu deiner Absorbing-Warteschlange hinzugefügt, sobald sie auf dem Server erscheinen.';

  @override
  String get episodeListSubscribe => 'Abonnieren';

  @override
  String get episodeListShowFinishedEpisodes => 'Beendete Episoden anzeigen';

  @override
  String get episodeListHideFinishedEpisodes => 'Beendete Episoden ausblenden';

  @override
  String get episodeListShowSettings => 'Serien Einstellungen';

  @override
  String get episodeListPlaysNewerToOlder =>
      'Spielt von neueren zu älteren Episoden';

  @override
  String get episodeListPlaysOlderToNewer =>
      'Spielt von älteren zu neueren Episoden';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episoden',
      one: '1 Episode',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Folgen',
      one: '1 Folge',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => 'Auto-Download';

  @override
  String get episodeListSubscribedChip => 'Abonniert';

  @override
  String get episodeListExplicitChip => 'Explizit';

  @override
  String get episodeListSortNewest => 'Neueste';

  @override
  String get episodeListSortOldest => 'Älteste';

  @override
  String get episodeListSortBy => 'Episoden sortieren';

  @override
  String get episodeListSortPubDate => 'Veröffentlichungsdatum';

  @override
  String get episodeListSortTitle => 'Titel';

  @override
  String get episodeListSortSeason => 'Staffel';

  @override
  String get episodeListSortEpisode => 'Episoden Nummer';

  @override
  String get episodeListSortFileName => 'Dateiname';

  @override
  String get episodeListSortReverseHint =>
      'Erneut tippen, um Reihenfolge umzukehren';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return '\"$title\" zu Absorbing hinzugefügt';
  }

  @override
  String get episodeDetailEpisodeFallback => 'Episode';

  @override
  String get episodeDetailMarkedNotFinished => 'Als unbeendet markiert';

  @override
  String get episodeDetailMarkedFinishedNice => 'Als beendet markiert - super!';

  @override
  String get episodeDetailMarkAbsorbedContent =>
      'Dies setzt deinen Fortschritt für diese Episode auf 100 %.';

  @override
  String get episodeDetailResetProgressContent =>
      'Dies löscht den gesamten Fortschritt für diese Episode und setzt sie auf den Anfang zurück. Das kann nicht rückgängig gemacht werden.';

  @override
  String get episodeDetailToday => 'Heute';

  @override
  String get episodeDetailYesterday => 'Gestern';

  @override
  String episodeDetailDaysAgo(int count) {
    return 'vor $count T.';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return 'vor $count Wo.';
  }

  @override
  String episodeDetailDurationHm(int hours, int minutes) {
    return '$hours Std. $minutes Min.';
  }

  @override
  String episodeDetailDurationM(int minutes) {
    return '$minutes Min.';
  }

  @override
  String get episodeDetailResume => 'Fortsetzen';

  @override
  String get episodeDetailPlayEpisode => 'Episode abspielen';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return 'Episode $number';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return 'Staffel $number';
  }

  @override
  String get editMetadataUpdatedFromMatch =>
      'Metadaten aus Zuordnung aktualisiert';

  @override
  String editMetadataConfirmMatch(String title) {
    return 'Dies aktualisiert die Server-Metadaten für dieses Buch mit:\n\n\"$title\"\n\nAlle Felder und das Cover werden auf dem Server überschrieben.';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return 'Dies aktualisiert die Server-Metadaten für dieses Buch mit:\n\n\"$title\" von $author\n\nAlle Felder und das Cover werden auf dem Server überschrieben.';
  }

  @override
  String get seriesBooksFindMissingTitle => 'Fehlende Bücher finden';

  @override
  String get seriesBooksFindMissingContent =>
      'Dies durchsucht Audible nach Büchern dieser Serie, die in deiner Bibliothek fehlen könnten.\n\nBücher werden zuerst über die ASIN abgeglichen (sofern dein Server ASINs für seine Bücher hat) und greifen dann auf den Titelabgleich zurück. Die Ergebnisse sind möglicherweise nicht ganz genau.';

  @override
  String get seriesBooksCouldNotFindOnAudible =>
      'Diese Serie konnte auf Audible nicht gefunden werden';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Damit wird der Beendet-Status für alle $count Bücher dieser Serie zurückgesetzt.',
      one:
          'Damit wird der Beendet-Status für 1 Buch dieser Serie zurückgesetzt.',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Damit werden alle $count Bücher dieser Serie als beendet markiert.',
      one: 'Damit wird 1 Buch dieser Serie als beendet markiert.',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => 'Alle aufheben';

  @override
  String get seriesBooksShowAllBooks => 'Alle Bücher anzeigen';

  @override
  String get seriesBooksGroupBySubSeries => 'Nach Unterserie gruppieren';

  @override
  String get seriesBooksLoadingSubSeries => 'Unterserie wird geladen...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher',
      one: '1 Buch',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => 'Fertig';

  @override
  String get seriesBooksExplicitBadge => 'E';

  @override
  String get expandedCardStreaming => 'Streaming';

  @override
  String get expandedCardDeviceFallback => 'Gerät';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$position in $bookTitle';
  }

  @override
  String get bookmarksScreenClose => 'Schließen';

  @override
  String get bookmarksScreenSortNewest => 'Neueste';

  @override
  String get bookmarksScreenSortPosition => 'Position';

  @override
  String statsScreenStreakDays(int count) {
    return '$count T.';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count Sitzung';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count Sitzungen';
  }

  @override
  String get statsScreenDayMon => 'Mo';

  @override
  String get statsScreenDayTue => 'Di';

  @override
  String get statsScreenDayWed => 'Mi';

  @override
  String get statsScreenDayThu => 'Do';

  @override
  String get statsScreenDayFri => 'Fr';

  @override
  String get statsScreenDaySat => 'Sa';

  @override
  String get statsScreenDaySun => 'So';

  @override
  String statsScreenDurationHm(int h, int m) {
    return '$h Std. $m Min.';
  }

  @override
  String statsScreenDurationM(int m) {
    return '$m Min.';
  }

  @override
  String get statsScreenDurationLessThanMin => '<1 Min.';

  @override
  String get statsScreenDurationZero => '0 Min.';

  @override
  String statsScreenDurationShortH(int h) {
    return '$h Std.';
  }

  @override
  String statsScreenDurationShortM(int m) {
    return '$m Min.';
  }

  @override
  String get statsScreenCouldNotLoadItem =>
      'Element konnte nicht geladen werden';

  @override
  String get statsScreenCouldNotFindEpisode =>
      'Episode konnte nicht gefunden werden';

  @override
  String statsScreenByAuthor(String author) {
    return 'von $author';
  }

  @override
  String get statsScreenListened => 'Gehört';

  @override
  String get sessionEditTitle => 'Sitzung bearbeiten';

  @override
  String get sessionDayLabel => 'Tag';

  @override
  String get sessionEndPosition => 'Endposition';

  @override
  String get sessionEndPositionHint =>
      'Dies zu ändern kann auch deinen aktuellen Fortschritt aktualisieren.';

  @override
  String get statsViewSessions => 'Sitzungen anzeigen';

  @override
  String statsSessionsForDate(String date) {
    return 'Sitzungen für $date';
  }

  @override
  String get statsNoSessionsForDate =>
      'Keine Hörsitzungen für diesen Tag gefunden';

  @override
  String get statsSearchSessions => 'Sitzungen durchsuchen';

  @override
  String get statsNoSessionSearchResults =>
      'Keine Sitzungen entsprechen deiner Suche';

  @override
  String get statsSessionsLoadFailed =>
      'Sitzungen für diesen Tag konnten nicht geladen werden';

  @override
  String get sessionDeleteConfirmTitle => 'Sitzung löschen?';

  @override
  String get sessionDeleteConfirmBody =>
      'Dies entfernt die Sitzung und senkt die Hörstatistik um deren Zeit. Es kann nicht rückgängig gemacht werden.';

  @override
  String get sessionSaved => 'Sitzung aktualisiert';

  @override
  String get sessionDeleted => 'Sitzung gelöscht';

  @override
  String get sessionSaveFailed => 'Änderungen konnten nicht gespeichert werden';

  @override
  String get sessionDeleteFailed => 'Sitzung konnte nicht gelöscht werden';

  @override
  String get statsScreenStartedAtPosition => 'Gestartet bei Position';

  @override
  String get statsScreenEndedAtPosition => 'Beendet bei Position';

  @override
  String get statsScreenTotalDuration => 'Gesamtdauer';

  @override
  String get statsScreenStarted => 'Gestartet';

  @override
  String get statsScreenUpdated => 'Aktualisiert';

  @override
  String get statsScreenClient => 'Client';

  @override
  String get statsScreenDevice => 'Gerät';

  @override
  String get statsScreenOs => 'Betriebssystem';

  @override
  String get statsScreenPlayMethod => 'Wiedergabemethode';

  @override
  String get statsScreenLoading => 'Lädt...';

  @override
  String get statsScreenJumpToStart => 'Zum Anfang springen';

  @override
  String get statsScreenJumpToEnd => 'Zum Ende springen';

  @override
  String get statsScreenPlayMethodDirect => 'Direktwiedergabe';

  @override
  String get statsScreenPlayMethodDirectStream => 'Direkt-Stream';

  @override
  String get statsScreenPlayMethodTranscode => 'Transcodieren';

  @override
  String get statsScreenPlayMethodLocal => 'Lokal';

  @override
  String get statsScreenAmLabel => 'AM';

  @override
  String get statsScreenPmLabel => 'PM';

  @override
  String statsScreenDateAtTime(
    String month,
    int day,
    int year,
    int hour,
    String minute,
    String ampm,
  ) {
    return '$day. $month $year um $hour:$minute $ampm';
  }

  @override
  String get statsScreenMonthJan => 'Jan.';

  @override
  String get statsScreenMonthFeb => 'Feb.';

  @override
  String get statsScreenMonthMar => 'März';

  @override
  String get statsScreenMonthApr => 'Apr.';

  @override
  String get statsScreenMonthMay => 'Mai';

  @override
  String get statsScreenMonthJun => 'Juni';

  @override
  String get statsScreenMonthJul => 'Juli';

  @override
  String get statsScreenMonthAug => 'Aug.';

  @override
  String get statsScreenMonthSep => 'Sep.';

  @override
  String get statsScreenMonthOct => 'Okt.';

  @override
  String get statsScreenMonthNov => 'Nov.';

  @override
  String get statsScreenMonthDec => 'Dez.';

  @override
  String get upcomingReleasesTitle => 'Kommende Veröffentlichungen';

  @override
  String get upcomingReleasesRescanTitle => 'Erneut scannen?';

  @override
  String upcomingReleasesRescanContent(int days) {
    return 'Diese Ergebnisse sind $days Tage alt. Veröffentlichungstermine könnten sich geändert haben - möchtest du erneut scannen?';
  }

  @override
  String get upcomingReleasesNotNow => 'Nicht jetzt';

  @override
  String get upcomingReleasesRescan => 'Erneut scannen';

  @override
  String get upcomingReleasesRescanReleaseDate =>
      'Veröffentlichungstermin erneut scannen';

  @override
  String get upcomingReleasesRescanning => 'Wird erneut gescannt...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return 'Aktualisiert - $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound =>
      'Kein Veröffentlichungstermin gefunden';

  @override
  String get upcomingReleasesRescanFailed => 'Erneuter Scan fehlgeschlagen';

  @override
  String get upcomingReleasesRemoveFromList => 'Aus Liste entfernen';

  @override
  String get upcomingReleasesRemovedFromList => 'Aus Liste entfernt';

  @override
  String get upcomingReleasesDateChip => 'Datum';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return 'Prüfe $name... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => 'Serien werden geladen...';

  @override
  String get upcomingReleasesScannedToday => '(heute gescannt)';

  @override
  String get upcomingReleasesScannedYesterday => '(gestern gescannt)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '(vor $days Tagen gescannt)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return '$count kommend';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return '$count kürzlich';
  }

  @override
  String get upcomingReleasesNoneFound =>
      'Keine kommenden oder kürzlichen Veröffentlichungen gefunden';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$summary in $count Serien';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return '$count Serien auf Audible geprüft';
  }

  @override
  String upcomingReleasesDateFormat(String month, int day, int year) {
    return '$day. $month $year';
  }

  @override
  String upcomingReleasesSequenceLabel(String sequence) {
    return '#$sequence';
  }

  @override
  String get upcomingReleasesBadgeUpcoming => 'KOMMEND';

  @override
  String get upcomingReleasesBadgeAdded => 'HINZUGEFÜGT';

  @override
  String get upcomingReleasesBadgeMissing => 'FEHLT';

  @override
  String get upcomingReleasesScanSettingsTitle => 'Scan Einstellungen';

  @override
  String get upcomingReleasesFinishedAfterTitle =>
      'Serie als abgeschlossen betrachten nach';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      'Serien, deren letztes Buch älter ist, werden bei Scans übersprungen und nur alle ein bis zwei Monate erneut geprüft.';

  @override
  String upcomingReleasesFinishedAfterYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Jahren',
      one: '1 Jahr',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesFinishedAfterNever => 'Niemals';

  @override
  String get upcomingReleasesSkippedTitle => 'Übersprungene Serien';

  @override
  String get upcomingReleasesSkippedNone => 'Noch nichts übersprungen';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count übersprungen',
      one: '1 übersprungen',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Letztes Buch vor $count Jahren',
      one: 'Letztes Buch vor 1 Jahr',
      zero: 'Letztes Buch vor weniger als einem Jahr',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched =>
      'Diese Serie konnte bei Audible nicht zugeordnet werden';

  @override
  String get upcomingReleasesSkippedScanNow => 'Jetzt scannen';

  @override
  String get upcomingReleasesSkippedAlwaysScan => 'Immer scannen';

  @override
  String get upcomingReleasesSkippedNeverScan => 'Niemals scannen';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return 'Neue Veröffentlichungen in $name gefunden';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return 'Nichts Neues in $name';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary =>
      'Diese Liste kam aus einer anderen Bibliothek. Neu scannen zum Aktualisieren.';

  @override
  String get upcomingReleasesChipUpcoming => 'Bevorstehend';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fehlen',
      one: '1 fehlt',
      zero: 'fehlt',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => 'Keine fehlenden Bücher gefunden';

  @override
  String get upcomingReleasesScanSeries => 'Serie scannen';

  @override
  String get upcomingReleasesScanUpcomingOption =>
      'Bevorstehende Veröffentlichungen';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc =>
      'Schneller Scan nach neuen und bevorstehenden Büchern';

  @override
  String get upcomingReleasesScanDeepOption => 'Tiefer Scan';

  @override
  String get upcomingReleasesScanDeepOptionDesc =>
      'Findet auch fehlende Bücher in jeder Serie - dauert länger';

  @override
  String get upcomingReleasesFirstScanNote =>
      'Der erste Scan prüft jede Serie bei Audible und kann einige Minuten dauern. Spätere Scans sind deutlich schneller, sobald deine Serien sortiert sind.';

  @override
  String get upcomingReleasesLastScanReport => 'Letzter Scan-Report';

  @override
  String upcomingReleasesReportChecked(int count) {
    return 'Auf Audible überprüft: $count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return 'Übersprungen: $count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return 'Nicht auf Audible gefunden: $count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return 'Prüfung fehlgeschlagen: $count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return '$upcoming anstehende, $recent kürzlich erschienene gefunden';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return '$upcoming anstehende, $recent kürzlich erschienene, $missing fehlende gefunden';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return '+$count weitere';
  }

  @override
  String get upcomingReleasesBadgeNew => 'NEU';

  @override
  String get upcomingReleasesOpenLibrarySeries => 'Serie in Bibliothek öffnen';

  @override
  String get upcomingReleasesAsinCopied => 'Serien ASIN kopiert';

  @override
  String get upcomingReleasesSetSeriesAsin => 'Serien ASIN setzen';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      'Finde die Serie auf audible.com und kopiere den Seitenlink - die ASIN ist der 10-stellige Code, der mit B0 beginnt (wie B08S2YN3YS). Den ganzen Link einzufügen funktioniert auch.';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… oder audible.com-Link';

  @override
  String get upcomingReleasesSetAsinSave => 'Speichern';

  @override
  String get upcomingReleasesSetAsinInvalid =>
      'In diesem Text wurde keine ASIN gefunden';

  @override
  String get upcomingReleasesSetAsinSaved => 'Serie verknüpft - Scan läuft';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher entfernen',
      one: 'Buch entfernen',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => 'Aus diesem Scan entfernen';

  @override
  String get upcomingReleasesRemoveThisScanDesc =>
      'Kann bei einem späteren Scan zurückkehren';

  @override
  String get upcomingReleasesRemoveForever =>
      'Aus diesem und künftigen Scans entfernen';

  @override
  String get upcomingReleasesRemoveForeverDesc =>
      'Kommt in die Liste entfernter Bücher, jederzeit wiederherstellbar';

  @override
  String get upcomingReleasesRemovedForeverToast =>
      'Entfernt - erscheint nicht in künftigen Scans';

  @override
  String get upcomingReleasesRemovedBooksTitle => 'Entfernte Bücher';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher',
      one: '1 Buch',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => 'Keine entfernten Bücher';

  @override
  String get upcomingReleasesRestore => 'Wiederherstellen';

  @override
  String get upcomingReleasesRestoredToast => 'Wiederhergestellt';

  @override
  String get upcomingReleasesRestoredNextScan =>
      'Wiederhergestellt - wird nach dem nächsten Scan angezeigt';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ausgewählt',
      one: '1 ausgewählt',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => 'Anfragen';

  @override
  String get upcomingReleasesBulkRemove => 'Entfernen';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entfernt',
      one: '1 entfernt',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Anfragen gesendet',
      one: '1 Anfrage gesendet',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return '$count Übersprungen';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Serien erneut gescannt',
      one: '1 Serie erneut gescannt',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return '$count mit neuen Büchern';
  }

  @override
  String get seriesExcludeFromScan => 'Vom Serien-Scan ausschließen';

  @override
  String get seriesIncludeInScan => 'In den Serien-Scan einbeziehen';

  @override
  String get homeScreenEpisodeFallback => 'Episode';

  @override
  String get libraryScreenUnknownTitle => 'Unbekannter Titel';

  @override
  String get playlistDetailDefaultName => 'Playlist';

  @override
  String playlistDetailItemCount(int count) {
    return '$count Einträge';
  }

  @override
  String get playlistDetailUnfinished => 'Nicht beendet';

  @override
  String get playlistDetailRemoveFromPlaylist => 'Aus Playlist entfernen';

  @override
  String get playlistDetailDone => 'Fertig';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return '$count Einträge als beendet markiert';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return '$count Einträge als nicht beendet markiert';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return '$count Einträge entfernt';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return '\"$title\" zu Absorbing hinzugefügt';
  }

  @override
  String get collectionDetailDefaultName => 'Sammlung';

  @override
  String smartScopeBookCount(int count) {
    return 'Smart Scope · $count Bücher';
  }

  @override
  String get smartScopeNew => 'Neuer Smart Scope';

  @override
  String get smartScopeNewSubtitle =>
      'Eine Filterauswahl als Liste speichern, die sich selbst aktuell hält';

  @override
  String get smartScopeEditTitle => 'Smart Scope bearbeiten';

  @override
  String get smartScopeIcon => 'Symbol';

  @override
  String get smartScopePublic => 'Für alle Benutzer sichtbar';

  @override
  String get smartScopeKobo => 'Mit Kobo synchronisieren';

  @override
  String get smartScopeRules => 'Regeln';

  @override
  String get smartScopeMatchAll => 'Alle erfüllen';

  @override
  String get smartScopeMatchAny => 'Eine erfüllen';

  @override
  String get smartScopeAddRule => 'Regel hinzufügen';

  @override
  String get smartScopeAddGroup => 'Gruppe hinzufügen';

  @override
  String get smartScopeGroup => 'Gruppe';

  @override
  String get smartScopeStartFrom => 'Starten mit';

  @override
  String get smartScopeFromScratch => 'Von Grund auf erstellen';

  @override
  String get smartScopeTplHasSeries => 'Hat eine Serie';

  @override
  String get smartScopeTplRecent => 'Kürzlich hinzugefügt';

  @override
  String get smartScopeTplPdf => 'Nur PDF';

  @override
  String get smartScopeTplNoGenres => 'Keine Genres';

  @override
  String get smartScopeTplEpub => 'Nur EPUB';

  @override
  String get smartScopeCounting => 'Wird gezählt...';

  @override
  String get smartScopeSort => 'Standardsortierung';

  @override
  String get smartScopeAddSort => 'Sortierebene hinzufügen';

  @override
  String get smartScopeSortNone =>
      'Keine Sortierung festgelegt, daher werden Bücher nach Titel sortiert.';

  @override
  String get smartScopeAscending => 'Aufsteigend';

  @override
  String get smartScopeDescending => 'Absteigend';

  @override
  String get smartScopeDelete => 'Smart Scope löschen';

  @override
  String get smartScopeSaveFailed =>
      'Der Smart Scope konnte nicht gespeichert werden';

  @override
  String get smartScopeDeleteFailed =>
      'Der Smart Scope konnte nicht gelöscht werden';

  @override
  String get smartScopeLoadFailed =>
      'Der Smart Scope konnte nicht geladen werden';

  @override
  String get smartScopeUnsupportedRule =>
      'Diese Regel kann nur im BookOrbit-Web geändert werden. Sie bleibt unverändert.';

  @override
  String get smartScopeAnd => 'und';

  @override
  String get smartScopeDays => 'Tage';

  @override
  String get smartScopeWeeks => 'Wochen';

  @override
  String get smartScopeMonths => 'Monate';

  @override
  String get smartScopePickDate => 'Datum wählen';

  @override
  String get smartScopeAddValue => 'Wert hinzufügen';

  @override
  String get smartScopeValue => 'Wert';

  @override
  String get smartScopeCustomFields => 'Benutzerdefinierte Felder';

  @override
  String get smartScopeAnyProvider => 'Beliebiger Anbieter';

  @override
  String get smartScopeScoreOutstanding => 'Hervorragend';

  @override
  String get smartScopeScoreGood => 'Gut';

  @override
  String get smartScopeScoreFair => 'Befriedigend';

  @override
  String get smartScopeScorePoor => 'Schwach';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => 'Bis zu 20 Werte';

  @override
  String get scopeFieldTitle => 'Titel';

  @override
  String get scopeFieldAuthor => 'Autor';

  @override
  String get scopeFieldSeries => 'Serien';

  @override
  String get scopeFieldSeriesIndex => 'Seriennummer';

  @override
  String get scopeFieldGenre => 'Genre';

  @override
  String get scopeFieldTag => 'Schlagwort';

  @override
  String get scopeFieldReadStatus => 'Lesestatus';

  @override
  String get scopeFieldReadProgress => 'Lesefortschritt';

  @override
  String get scopeFieldRating => 'Deine Bewertung';

  @override
  String get scopeFieldFormat => 'Format';

  @override
  String get scopeFieldLibrary => 'Bibliothek';

  @override
  String get scopeFieldCollection => 'Sammlung';

  @override
  String get scopeFieldPublisher => 'Verlag';

  @override
  String get scopeFieldLanguage => 'Sprache';

  @override
  String get scopeFieldPublishedDate => 'Veröffentlichungsdatum';

  @override
  String get scopeFieldPublishedYear => 'Veröffentlichungsjahr';

  @override
  String get scopeFieldAddedAt => 'Hinzugefügt am';

  @override
  String get scopeFieldStartedAt => 'Begonnen am';

  @override
  String get scopeFieldFinishedAt => 'Beendet am';

  @override
  String get scopeFieldPageCount => 'Seitenzahl';

  @override
  String get scopeFieldFileSize => 'Dateigröße';

  @override
  String get scopeFieldCommunityRating => 'Community-Bewertung';

  @override
  String get scopeFieldCommunityRatingCount =>
      'Anzahl der Community-Rezensionen';

  @override
  String get scopeFieldMetadataScore => 'Metadaten-Wertung';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => 'Beschreibung';

  @override
  String get scopeFieldCover => 'Cover';

  @override
  String get scopeFieldAudioCover => 'Hörbuch-Cover';

  @override
  String get scopeFieldFileAvailability => 'Dateiverfügbarkeit';

  @override
  String get scopeFieldLockStatus => 'Sperrstatus';

  @override
  String get scopeFieldSeriesStatus => 'Serienstatus';

  @override
  String get scopeSortUpdatedAt => 'Aktualisiert am';

  @override
  String get scopeSortLastReadAt => 'Zuletzt gelesen';

  @override
  String get scopeSortRandom => 'Zufällig';

  @override
  String get scopeOpContains => 'enthält';

  @override
  String get scopeOpNotContains => 'enthält nicht';

  @override
  String get scopeOpStartsWith => 'beginnt mit';

  @override
  String get scopeOpEndsWith => 'endet mit';

  @override
  String get scopeOpEq => 'ist';

  @override
  String get scopeOpNotEq => 'ist nicht';

  @override
  String get scopeOpIsEmpty => 'ist leer';

  @override
  String get scopeOpIsNotEmpty => 'ist nicht leer';

  @override
  String get scopeOpGt => 'größer als';

  @override
  String get scopeOpGte => 'mindestens';

  @override
  String get scopeOpLt => 'kleiner als';

  @override
  String get scopeOpLte => 'höchstens';

  @override
  String get scopeOpBetween => 'zwischen';

  @override
  String get scopeOpIncludesAny => 'enthält eines von';

  @override
  String get scopeOpIncludesAll => 'enthält alle von';

  @override
  String get scopeOpExcludesAll => 'schließt alle aus von';

  @override
  String get scopeOpBefore => 'vor';

  @override
  String get scopeOpAfter => 'nach';

  @override
  String get scopeOpWithinLast => 'innerhalb der letzten';

  @override
  String get scopeOpIsMissing => 'fehlt';

  @override
  String get scopeOpIsPresent => 'ist vorhanden';

  @override
  String get scopeOpIsUnread => 'ist ungelesen';

  @override
  String get scopeOpIsInProgress => 'ist in Bearbeitung';

  @override
  String get scopeOpIsFinished => 'ist beendet';

  @override
  String get scopeOpIsLocked => 'ist gesperrt';

  @override
  String get scopeOpIsUnlocked => 'ist entsperrt';

  @override
  String get scopeOpIsUpNext => 'ist als Nächstes dran';

  @override
  String get scopeOpIsTrue => 'ist ja';

  @override
  String get scopeOpIsFalse => 'ist nein';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher passen',
      one: '1 Buch passt',
      zero: 'Keine Bücher passen',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return '„$name“ löschen? Das kann nicht rückgängig gemacht werden.';
  }

  @override
  String collectionDetailBookCount(int count) {
    return '$count Bücher';
  }

  @override
  String get collectionDetailDone => 'Fertig';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return '\"$title\" zu Absorbing hinzugefügt';
  }

  @override
  String get audibleSeriesNoBooksFound => 'Keine Bücher auf Audible gefunden';

  @override
  String get audibleSeriesFailedToLoad =>
      'Serie konnte nicht von Audible geladen werden';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return '$total auf Audible · $missing fehlen';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return '$total auf Audible · $missing fehlen · $upcoming kommend';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return 'Fehlend ($count)';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return 'Kommend ($count)';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return 'Alle ($count)';
  }

  @override
  String get audibleSeriesSearching => 'Audible wird durchsucht...';

  @override
  String get audibleSeriesCompleteSeries => 'Du hast die komplette Serie!';

  @override
  String get audibleSeriesNoUpcoming =>
      'Keine kommenden Veröffentlichungen gefunden';

  @override
  String get audibleSeriesUpcomingBadge => 'KOMMEND';

  @override
  String get audibleSeriesAbridged => 'Gekürzt';

  @override
  String get audibleSeriesRegionTitle => 'Audible-Region';

  @override
  String get audibleSeriesOpenOnAudible => 'Auf Audible öffnen';

  @override
  String get audibleSeriesAddToCalendar => 'Zum Kalender hinzufügen';

  @override
  String get audibleSeriesAddToUpcoming =>
      'Zu kommenden Veröffentlichungen hinzufügen';

  @override
  String get audibleSeriesAddedToUpcoming =>
      'Zu kommenden Veröffentlichungen hinzugefügt';

  @override
  String get audibleSeriesAlreadyInUpcoming =>
      'Bereits auf der kommenden Seite';

  @override
  String get audibleSeriesCouldNotOpenAudible =>
      'Audible konnte nicht geöffnet werden';

  @override
  String get audibleSeriesCouldNotOpenCalendar =>
      'Kalender konnte nicht geöffnet werden';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return 'Neues Hörbuch in der Serie $seriesName';
  }

  @override
  String get authorBooksGroupBySeries => 'Nach Serie gruppieren';

  @override
  String get authorBooksList => 'Liste';

  @override
  String get authorBooksGrid => 'Raster';

  @override
  String authorBooksBookCount(int count) {
    return '$count Bücher';
  }

  @override
  String get metadataLookupCover => 'Cover';

  @override
  String get metadataLookupChooseFields => 'Felder zum Übernehmen wählen';

  @override
  String metadataLookupApplyFields(int count) {
    return '$count Felder übernehmen';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return '$count Felder lokal gespeichert';
  }

  @override
  String get metadataLookupOverrideLocalDisplay =>
      'Lokale Anzeige überschreiben';

  @override
  String get equalizerPresetFlat => 'Flach';

  @override
  String get equalizerPresetVoiceBoost => 'Stimme verstärken';

  @override
  String get equalizerPresetBassBoost => 'Bass-Boost';

  @override
  String get equalizerPresetTrebleBoost => 'Höhen-Boost';

  @override
  String get equalizerPresetPodcast => 'Podcast';

  @override
  String get equalizerPresetAudiobook => 'Hörbuch';

  @override
  String get equalizerPresetReduceNoise => 'Rauschen reduzieren';

  @override
  String get equalizerPresetLoudness => 'Lautheit';

  @override
  String equalizerEditingSavedNamed(String title) {
    return 'Bearbeite gespeicherten EQ für \"$title\"';
  }

  @override
  String get equalizerEditingSavedGeneric => 'Bearbeite gespeicherten EQ';

  @override
  String get equalizerPerBookEq => 'EQ pro Buch';

  @override
  String get notesDeleteNoteQuestion => 'Notiz löschen?';

  @override
  String notesDeleteNoteContent(String title) {
    return '\"$title\" löschen?';
  }

  @override
  String get notesExport => 'Exportieren';

  @override
  String get notesNewNote => 'Neue Notiz';

  @override
  String get librarySortFilterUpcomingReleases => 'Serien Scan';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle =>
      'Für jeden Autor Foto und Biografie vom Metadatenanbieter abrufen';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle =>
      'Audible nach neuen Veröffentlichungen in deinen Serien durchsuchen';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Noch $count Kapitel',
      one: 'Noch 1 Kapitel',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetAddMinutesChip(int minutes) {
    return '+$minutes Min';
  }

  @override
  String sleepTimerSheetAddChaptersChip(int count) {
    return '+$count Kap';
  }

  @override
  String sleepTimerSheetMinShort(int minutes) {
    return '$minutes Min';
  }

  @override
  String sleepTimerSheetSecondsShort(int seconds) {
    return '$seconds Sek';
  }

  @override
  String sleepTimerSheetMinSecShort(int minutes, int seconds) {
    return '$minutes Min $seconds Sek';
  }

  @override
  String sleepTimerSheetChaptersValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kapitel',
      one: '1 Kapitel',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetChaptersChip(int count) {
    return '$count Kap';
  }

  @override
  String sleepTimerSheetStartChapterSleep(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sleep nach $count Kapiteln',
      one: 'Sleep nach 1 Kapitel',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => 'Bei Sleep zurückspulen';

  @override
  String get sleepTimerSheetShake => 'Schütteln';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return 'Fügt $minutes Min hinzu';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => 'Fügt 1 Kapitel hinzu';

  @override
  String get sleepTimerSheetResetsToFull => 'Setzt auf volle Dauer zurück';

  @override
  String get sleepTimerSheetTabSpecificChapter => 'Kapitel';

  @override
  String get sleepTimerSheetSpecificNoChapters => 'Keine Kapitel verfügbar';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return 'Kapitel $number';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => 'vorbei';

  @override
  String get sleepTimerSheetSpecificStart => 'Kapitelanfang';

  @override
  String get sleepTimerSheetSpecificEnd => 'Kapitelende';

  @override
  String get sleepTimerSheetSpecificEndsAt => 'Sleep-Timer endet um';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return 'in $countdown';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed =>
      'Dieser Zeitpunkt ist bereits vorbei';

  @override
  String get sleepTimerSheetSpecificStartButton => 'Timer starten';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => 'Bereits vorbei';

  @override
  String get timeAm => 'AM';

  @override
  String get timePm => 'PM';

  @override
  String get collectionPickerCollectionFallback => 'Sammlung';

  @override
  String collectionPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get playlistPickerPlaylistFallback => 'Playlist';

  @override
  String playlistPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get cardChaptersPlayFromChapterTitle => 'Ab Kapitel abspielen?';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return 'Wiedergabe ab \"$title\" starten?';
  }

  @override
  String get cardChaptersPlay => 'Abspielen';

  @override
  String get absorbingSharedToday => 'Heute';

  @override
  String get absorbingSharedYesterday => 'Gestern';

  @override
  String get absorbingSharedMonday => 'Montag';

  @override
  String get absorbingSharedTuesday => 'Dienstag';

  @override
  String get absorbingSharedWednesday => 'Mittwoch';

  @override
  String get absorbingSharedThursday => 'Donnerstag';

  @override
  String get absorbingSharedFriday => 'Freitag';

  @override
  String get absorbingSharedSaturday => 'Samstag';

  @override
  String get absorbingSharedSunday => 'Sonntag';

  @override
  String get absorbingSharedAm => 'AM';

  @override
  String get absorbingSharedPm => 'PM';

  @override
  String sectionDetailAddedToAbsorbing(String title) {
    return '\"$title\" zu Absorbing hinzugefügt';
  }

  @override
  String get sectionDetailDoneBadge => 'Fertig';

  @override
  String get homeCustomizeAddGenreTitle => 'Genre-Bereich hinzufügen';

  @override
  String get homeCustomizeAddGenreSubtitle =>
      'Wähle ein Genre für deinen Startbildschirm';

  @override
  String get homeSectionDoneBadge => 'Fertig';

  @override
  String get tipsSheetQuickBookmarksTitle => 'Schnelle Lesezeichen';

  @override
  String get tipsSheetQuickBookmarksDesc =>
      'Halte den Lesezeichen-Button auf einer Karte gedrückt, um sofort ein Lesezeichen an der aktuellen Position zu setzen, ohne das Lesezeichen-Menü zu öffnen.';

  @override
  String get tipsSheetCoverPlayPauseTitle => 'Cover zum Pausieren';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      'Tippe auf das Cover einer Karte, um abzuspielen oder zu pausieren. Schalte das in den Einstellungen unter Absorbing-Karten um. Ein dezentes Pause-Symbol zeigt sich beim Abspielen, damit du weißt, dass es antippbar ist.';

  @override
  String get tipsSheetFullScreenPlayerTitle => 'Vollbild-Player';

  @override
  String get tipsSheetFullScreenPlayerDesc =>
      'Wische auf einer Absorbing-Karte nach oben, um den Vollbild-Player zu öffnen. Wische nach unten, um ihn zu schließen.';

  @override
  String get tipsSheetQuickAddAbsorbingTitle =>
      'Schnell zu Absorbing hinzufügen';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      'Wische in einem Listen-Sheet (Serie, Autor, Suchergebnisse) nach rechts auf einem Buch, um es sofort zur Absorbing-Warteschlange hinzuzufügen.';

  @override
  String get tipsSheetShakeExtendSleepTitle => 'Schütteln verlängert Sleep';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      'Wenn ein Sleep-Timer läuft und du dein Handy schüttelst, werden zusätzliche Minuten draufgepackt. Stelle die Menge in den Einstellungen unter Sleep-Timer ein.';

  @override
  String get tipsSheetSeriesNavigationTitle => 'Serien-Navigation';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      'Tippe in den Buchdetails auf den Seriennamen, um alle Bücher der Serie in Lesereihenfolge zu sehen, mit Reihenfolge-Badges auf jedem Cover.';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => 'Zwischen Büchern wischen';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      'Wische auf dem Absorbing-Bildschirm nach links und rechts, um zwischen deinen angefangenen Büchern zu wechseln. Im manuellen Warteschlangenmodus dienen die Karten als Warteschlange, sodass das nächste Buch automatisch startet, wenn das aktuelle endet.';

  @override
  String get tipsSheetTapToSeekTitle => 'Tippen zum Spulen';

  @override
  String get tipsSheetTapToSeekDesc =>
      'Tippe irgendwo auf den Kapitel- oder Buchfortschrittsbalken, um direkt zu dieser Stelle zu springen. Du kannst die Balken auch ziehen, um feiner zu steuern.';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle =>
      'Geschwindigkeitsangepasste Zeit';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      'Restzeit und Kapitelzeiten passen sich automatisch deiner Wiedergabegeschwindigkeit an. Hörst du mit 1,5x? Die angezeigte Zeit zeigt, wie lange es tatsächlich dauert.';

  @override
  String get tipsSheetPlaybackHistoryTitle => 'Wiedergabe-Verlauf';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      'Tippe auf einer Karte auf den Verlaufs-Button, um eine Zeitleiste mit jeder Wiedergabe, Pause, Sprung und Geschwindigkeitsänderung zu sehen. Tippe auf ein Ereignis, um zu dieser Stelle zurückzuspringen.';

  @override
  String get tipsSheetAutoRewindTitle => 'Auto-Zurückspulen';

  @override
  String get tipsSheetAutoRewindDesc =>
      'Wenn du nach einer Pause weiterhörst, spult Absorb automatisch ein paar Sekunden zurück, damit du den Anschluss nicht verlierst. Wie weit zurückgespult wird, hängt davon ab, wie lange du weg warst. In den Einstellungen anpassbar.';

  @override
  String get tipsSheetSeriesQueueModeTitle => 'Serien-Warteschlangenmodus';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      'Wenn du ein Buch beendest, das Teil einer Serie ist, kann Absorb automatisch das nächste Buch abspielen. Stelle den Warteschlangenmodus in den Einstellungen auf \"Serie\".';

  @override
  String get tipsSheetOfflineModeTitle => 'Offline-Modus';

  @override
  String get tipsSheetOfflineModeDesc =>
      'Tippe auf dem Absorbing-Bildschirm auf den Flugzeug-Button, um in den Offline-Modus zu wechseln. Das stoppt die Synchronisierung, spart Daten und zeigt nur deine heruntergeladenen Bücher. Ideal für Flüge oder schlechten Empfang.';

  @override
  String get tipsSheetUpcomingReleasesTitle => 'Kommende Veröffentlichungen';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      'Tippe im Serien-Tab erneut auf Serien, um die Sortierungs- und Filterfunktionen aufzurufen. Tippe dort auf \"Kommende Veröffentlichungen\" und wähle deine Audible Region, um neue Bücher zu deinen Serien zu entdecken, geordnet nach Veröffentlichungsdatum.';

  @override
  String get tipsSheetPerBookEqTitle => 'Equalizer pro Buch';

  @override
  String get tipsSheetPerBookEqDesc =>
      'Jedes Buch merkt sich seine eigenen EQ-Einstellungen. Stell den EQ einmal für ein Sci-Fi-Epos ein und beim nächsten Mal klingt es genauso.';

  @override
  String get tipsSheetPerBookSpeedTitle => 'Geschwindigkeit pro Buch';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      'Die Wiedergabegeschwindigkeit wird pro Buch gespeichert. Sachbücher mit 1,5x und dramatische Romane mit 1,0x hören - ohne es jedes Mal neu einstellen zu müssen.';

  @override
  String get tipsSheetAutoSleepWindowTitle => 'Auto-Sleep-Zeitfenster';

  @override
  String get tipsSheetAutoSleepWindowDesc =>
      'Wähle die Stunden, in denen du normalerweise einschläfst, und der Sleep-Timer startet automatisch, wenn du in diesem Fenster zu hören beginnst.';

  @override
  String get tipsSheetSleepFadeChimeTitle => 'Sleep-Fade und Klangzeichen';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      'Wenn der Sleep-Timer endet, wird das Audio langsam ausgeblendet und ein optionales Klangzeichen ertönt, damit nicht mitten im Satz abgeschnitten wird.';

  @override
  String get tipsSheetCarModeTitle => 'Auto-Modus';

  @override
  String get tipsSheetCarModeDesc =>
      'Tippe auf das Auto-Symbol, um in den Modus mit großen Buttons zu wechseln, der für sicherere Bedienung beim Fahren gedacht ist.';

  @override
  String get tipsSheetAudibleSeriesTitle => 'Audible-Serien-Suche';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      'Öffne eine Serie und tippe auf das Drei-Punkte-Symbol, um die komplette Serienliste von Audible zu laden, inklusive fehlender Einträge und noch nicht gestarteter Bücher.';

  @override
  String get tipsSheetTranscribeBookmarkTitle => 'Lesezeichen transkribieren';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      'Wandle das Audio an einem beliebigen Lesezeichen vollständig auf deinem Gerät in Text um. Aktiviere es in den Einstellungen unter Erweitert > Transkription und lade ein Modell herunter, tippe dann bei einem Lesezeichen auf Transkribieren - der Text landet in dessen Notiz, bereit zum Überarbeiten oder Teilen.';

  @override
  String get tipsSheetFindBetweenFormatsTitle =>
      'Wechsel zwischen Hörbuch und eBook';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      'Wenn die Transkription aktiv und das Buch heruntergeladen ist, pausiere und tippe im Player auf Position im eBook finden, um das eBook an der Stelle zu öffnen, die du gerade gehört hast. Markiere im Reader etwas Text und tippe auf die Kopfhörer, um das Hörbuch genau dort zu starten.';

  @override
  String get tipsSheetShareQuoteTitle => 'Zitate teilen';

  @override
  String get tipsSheetShareQuoteDesc =>
      'Teile eine eBook-Markierung oder eine Lesezeichen-Notiz als Bild mit dem Zitat über dem Buchcover. Die Teilen-Option findest du bei Markierungen und im Lesezeichen-Fenster.';

  @override
  String get tipsSheetClipExportTitle => 'Audio-Clips exportieren';

  @override
  String get tipsSheetClipExportDesc =>
      'Öffne ein Lesezeichen und tippe Clip exportieren um einen kurzen Audioschnipsel des Buches, inklusive Coverart zu erstellen - Super um deine Lieblings Szenen zu teilen.';

  @override
  String get tipsSheetAllHighlightsTitle => 'Alle Markierungen an einem Ort';

  @override
  String get tipsSheetAllHighlightsDesc =>
      'Die Seite „Alle Lesezeichen“ hat einen Tab „Markierungen“, der jede eBook-Markierung aus jedem Buch sammelt. Tippe auf eine, um sie zu teilen oder ins Buch zurückzuspringen.';

  @override
  String get tipsSheetVolumeKeyPagesTitle => 'Umblättern mit Lautstärketasten';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      'Blättere eBook-Seiten mit den Lautstärketasten um. Aktiviere es in den Einstellungen des Readers - normale oder gespiegelte Richtung, und es kann auch bei laufendem Audio aktiv bleiben.';

  @override
  String get tipsSheetSettingsSyncTitle => 'Einstellungen synchronisieren';

  @override
  String get tipsSheetSettingsSyncDesc =>
      'Halte deine Einstellungen, buchspezifischen Geschwindigkeiten und die Absorbing-Reihenfolge über deinen eigenen WebDAV-Server auf allen Geräten gleich. Richte es in den Einstellungen unter Backup und Synchronisierung ein.';

  @override
  String get tipsSheetNavLongPressTitle => 'Untere Tabs lange drücken';

  @override
  String get tipsSheetNavLongPressDesc =>
      'Halte den Start-Tab gedrückt, um von jeder Seite die Bibliothek zu wechseln. Halte den Bibliothek-Tab gedrückt, um direkt zur Suche zu springen.';

  @override
  String get bookCardUnknownTitle => 'Unbekannter Titel';

  @override
  String get bookCardExplicitBadge => 'E';

  @override
  String get bookCardDone => 'Fertig';

  @override
  String get bookCardSaved => 'Gespeichert';

  @override
  String get episodeRowEpisode => 'Episode';

  @override
  String get episodeRowToday => 'Heute';

  @override
  String get episodeRowYesterday => 'Gestern';

  @override
  String episodeRowDaysAgo(int count) {
    return 'vor $count T';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return 'vor $count W';
  }

  @override
  String episodeRowDurationHm(int hours, int minutes) {
    return '$hours Std $minutes Min';
  }

  @override
  String episodeRowDurationM(int minutes) {
    return '$minutes Min';
  }

  @override
  String episodeRowSeasonShort(String number) {
    return 'S$number';
  }

  @override
  String episodeRowEpisodeShort(String number) {
    return 'E$number';
  }

  @override
  String get librarySearchResultsExplicitBadge => 'E';

  @override
  String get librarySearchResultsDone => 'Fertig';

  @override
  String get librarySearchResultsSaved => 'Gespeichert';

  @override
  String librarySearchResultsSequence(String number) {
    return '#$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => 'Unbekannte Serie';

  @override
  String get librarySearchResultsUnknownEpisode => 'Unbekannte Episode';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher',
      one: '1 Buch',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => 'E';

  @override
  String get libraryGridTilesDone => 'Fertig';

  @override
  String get libraryGridTilesSaved => 'Gespeichert';

  @override
  String libraryGridTilesSequence(String number) {
    return '#$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => 'Unbekannte Serie';

  @override
  String get seriesCardUnknownSeries => 'Unbekannte Serie';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher',
      one: '1 Buch',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => 'Feines Spulen';

  @override
  String get cardProgressQuarterSpeed => 'Viertelgeschwindigkeit';

  @override
  String get cardProgressHalfSpeed => 'Halbe Geschwindigkeit';

  @override
  String cardProgressChapterPrefix(String number) {
    return 'Kapitel $number';
  }

  @override
  String get cardEdgeProgressFineScrubbing => 'Feines Spulen';

  @override
  String get cardEdgeProgressQuarterSpeed => 'Viertelgeschwindigkeit';

  @override
  String get cardEdgeProgressHalfSpeed => 'Halbe Geschwindigkeit';

  @override
  String get authSessionExpired =>
      'Sitzung abgelaufen. Bitte melde dich erneut an.';

  @override
  String authCannotReachServer(String url) {
    return 'Server unter $url nicht erreichbar';
  }

  @override
  String get authInvalidUsernameOrPassword =>
      'Ungültiger Benutzername oder Passwort';

  @override
  String get authInvalidApiKey => 'Ungültiger API-Schlüssel';

  @override
  String get authLoginFailedDetail =>
      'Anmeldung fehlgeschlagen - prüfe Serveradresse und Zugangsdaten';

  @override
  String get authUnexpectedServerResponse => 'Unerwartete Server-Antwort';

  @override
  String get authSsoUnexpectedResponse =>
      'SSO hat eine unerwartete Antwort zurückgegeben';

  @override
  String get authSwitchedToLocalServer => 'Zu lokalem Server gewechselt';

  @override
  String get authSwitchedToRemoteServer => 'Zu Remote-Server gewechselt';

  @override
  String get lpDeletedFinishedDownload => 'Beendeten Download gelöscht';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count neue Episoden werden heruntergeladen',
      one: '1 neue Episode wird heruntergeladen',
    );
    return '$showTitle: $_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return '$showTitle an den Anfang deiner Warteschlange hinzugefügt';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return '$showTitle an Position 2 deiner Warteschlange hinzugefügt';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return '$showTitle an das Ende deiner Warteschlange hinzugefügt';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return 'Neue Episode von $showTitle heruntergeladen';
  }

  @override
  String get statsWeekStartsOn => 'Wochenbeginn';

  @override
  String get episodeListNewEpisodePosition => 'Position neuer Folgen';

  @override
  String get episodeListPositionTop => 'Anfang der Warteschlange';

  @override
  String get episodeListPositionSecond => 'Zweite in der Warteschlange';

  @override
  String get episodeListPositionEnd => 'Ende der Warteschlange';

  @override
  String get episodeListPositionNone => 'Nicht zur Warteschlange hinzufügen';

  @override
  String get episodeListPositionNoneDesc =>
      'Wird weiterhin benachrichtigt und heruntergeladen';

  @override
  String sleepRewindUndoNote(int minutes) {
    return 'Drücke innerhalb von $minutes Minuten auf Abspielen, und das Zurückspulen wird rückgängig gemacht';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Warteschlange: $count Einträge werden heruntergeladen',
      one: 'Warteschlange: 1 Eintrag wird heruntergeladen',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher werden heruntergeladen',
      one: '1 Buch wird heruntergeladen',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episoden werden heruntergeladen',
      one: '1 Episode wird heruntergeladen',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName => 'Download-Fortschritt';

  @override
  String get downloadNotifProgressChannelDesc =>
      'Zeigt den Fortschritt während Hörbuch-Downloads';

  @override
  String get downloadNotifAlertChannelName => 'Download-Benachrichtigungen';

  @override
  String get downloadNotifAlertChannelDesc =>
      'Benachrichtigungen, wenn Downloads beendet werden oder fehlschlagen';

  @override
  String get downloadNotifDownloadingTitle => 'Wird heruntergeladen…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Downloads aktiv',
      one: '1 Download aktiv',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return 'Wird heruntergeladen: $title';
  }

  @override
  String get downloadNotifStartingLabel => 'Wird gestartet…';

  @override
  String get downloadNotifCompleteTitle => 'Download abgeschlossen';

  @override
  String downloadNotifCompleteBody(String title) {
    return '$title ist offline verfügbar';
  }

  @override
  String get downloadNotifFailedTitle => 'Download fehlgeschlagen';

  @override
  String get upcomingNotifChannelName =>
      'Suche nach kommenden Veröffentlichungen';

  @override
  String get upcomingNotifChannelDesc =>
      'Zeigt den Fortschritt beim Scannen nach kommenden Veröffentlichungen';

  @override
  String get upcomingNotifScanTitle =>
      'Suche nach kommenden Veröffentlichungen';

  @override
  String get upcomingNotifStartingScan => 'Suche wird gestartet…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return 'Prüfe $seriesName… ($current/$total)';
  }

  @override
  String get upcomingNotifFoundTitle => 'Kommende Veröffentlichungen gefunden!';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$series Serien',
      one: '1 Serie',
    );
    return '$books kommend in $_temp0';
  }

  @override
  String get androidAutoTabContinue => 'Weiterhören';

  @override
  String get androidAutoTabLibrary => 'Bibliothek';

  @override
  String get androidAutoTabDownloads => 'Downloads';

  @override
  String get settingsSearchHint => 'Einstellungen durchsuchen...';

  @override
  String get settingsSearchNoResults => 'Keine passenden Einstellungen';

  @override
  String get carConnectAutoplay =>
      'Wiedergabe starten, wenn Android Auto verbunden wird';

  @override
  String get carConnectAutoplayIos =>
      'Wiedergabe starten, wenn CarPlay verbunden wird';

  @override
  String get carConnectAutoplayOnSubtitle =>
      'Das zuletzt gehörte Buch startet von selbst, wenn das Auto verbunden wird';

  @override
  String get carConnectAutoplayOffSubtitle =>
      'Die Wiedergabe wartet, bis du auf Abspielen drückst';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => 'Mit Siri verwenden';

  @override
  String get siriStatusOn =>
      'Ein. Siri kann deine Bücher und Podcasts anhand des Namens finden und abspielen.';

  @override
  String get siriStatusAsk =>
      'Lass Siri deine Bücher und Podcasts anhand des Namens finden und abspielen.';

  @override
  String get siriStatusOff =>
      'Siri ist für Absorb ausgeschaltet. Schalte es in den iOS-Einstellungen ein.';

  @override
  String get siriAllow => 'Erlauben';

  @override
  String get siriOpenSettings => 'Einstellungen öffnen';

  @override
  String get siriThingsToSay => 'Mögliche Sprachbefehle';

  @override
  String get siriExamples =>
      '„Spiele [Buchtitel] in Absorb“\n„Spiele [Serienname] in Absorb“\n„Spiele etwas von [Autor] in Absorb“\n„Spiele die neueste Episode von [Podcast] in Absorb“\n„Absorb fortsetzen“\n„In Absorb zurückspringen“\n„Nächstes Kapitel in Absorb“\n„Sleep-Timer in Absorb einstellen“\n„Lesezeichen in Absorb hinzufügen“\n„Was höre ich gerade in Absorb“';

  @override
  String get siriShortcutsNote =>
      'Fortsetzen, Pause, Springen, Kapitel, der Sleep-Timer, Lesezeichen und die aktuelle Wiedergabe funktionieren auch ohne diese Berechtigung. Sie sind außerdem in der Kurzbefehle-App für Automationen und die Aktionstaste verfügbar.';

  @override
  String get carBookOrder => 'Buchreihenfolge im Auto';

  @override
  String get carBookOrderReverse => 'Buchreihenfolge umkehren';

  @override
  String get carBookOrderReverseSubtitle =>
      'Z bis A, oder zuerst die zuletzt hinzugefügten';

  @override
  String get carPodcastOrder => 'Podcast-Reihenfolge im Auto';

  @override
  String get carEpisodesOldestFirst => 'Älteste Episoden zuerst';

  @override
  String get carEpisodesOldestFirstSubtitle =>
      'Für Sendungen, die du von Anfang an hörst';

  @override
  String get androidAutoCatBooks => 'Bücher';

  @override
  String get androidAutoCatSeries => 'Serien';

  @override
  String get androidAutoCatAuthors => 'Autoren';

  @override
  String get androidAutoCatCollections => 'Sammlungen';

  @override
  String get androidAutoCatPlaylists => 'Wiedergabelisten';

  @override
  String get showTipsAgain => 'Tipps wieder anzeigen';

  @override
  String get showTipsAgainSubtitle =>
      'Bringe ausgeblendete Funktions-Tipps zurück';

  @override
  String get tipsRestored => 'Tipps wiederhergestellt';

  @override
  String get resetSpeedPresets =>
      'Geschwindigkeits-Voreinstellungen zurücksetzen';

  @override
  String get resetSpeedPresetsSubtitle =>
      'Standard-Wiedergabegeschwindigkeiten wiederherstellen';

  @override
  String get speedPresetsReset =>
      'Geschwindigkeits-Voreinstellungen zurückgesetzt';

  @override
  String get editAuthor => 'Autor bearbeiten';

  @override
  String get authorName => 'Name';

  @override
  String get authorImage => 'Autorenbild';

  @override
  String get authorRemoveImage => 'Bild entfernen';

  @override
  String get authorRemoveImageTitle => 'Autorenbild entfernen?';

  @override
  String get authorRemoveImageConfirm =>
      'Dadurch wird das Bild auf dem Server gelöscht.';

  @override
  String get authorImageRemoved => 'Bild entfernt';

  @override
  String get authorImageFailed =>
      'Das Autorenbild konnte nicht aktualisiert werden';

  @override
  String get authorUpdated => 'Autor aktualisiert';

  @override
  String get authorUpdateFailed => 'Der Autor konnte nicht aktualisiert werden';

  @override
  String get authorMatched => 'Autor von Übereinstimmung aktualisiert';

  @override
  String get authorNoMatchFound => 'Kein Treffer gefunden';

  @override
  String authorMergedInto(String name) {
    return 'Zusammengeführt in $name';
  }

  @override
  String get authorQuickMatchHint =>
      'Name, ASIN, Beschreibung und Bild von Audible der gewählten Region abrufen.';

  @override
  String get region => 'Region';

  @override
  String get editTabDetails => 'Details';

  @override
  String get editTabCover => 'Cover';

  @override
  String get editTabMatch => 'Treffer';

  @override
  String get editTabEmbed => 'Einbetten';

  @override
  String get chapterEditorTitle => 'Kapitel bearbeiten';

  @override
  String get chapterNotConnected => 'Nicht mit dem Server verbunden';

  @override
  String get chapterErrorFirstNotZero =>
      'Das erste Kapitel muss bei 0:00 beginnen';

  @override
  String get chapterErrorStartAfterPrevious =>
      '\"Beginn\" muss nach dem vorherigen Kapitel liegen';

  @override
  String get chapterErrorStartBeforeEnd =>
      '\"Beginn\" muss vor dem Ende des Buches liegen';

  @override
  String get chapterErrorTitleRequired => 'Titel erforderlich';

  @override
  String get chapterEditStartTitle => 'Beginn Zeit ändern';

  @override
  String get chapterTimeHintSeconds => 'Sekunden';

  @override
  String get chapterTimeHintFull => 'HH:MM:SS oder Sekunden';

  @override
  String get chapterInvalidTime => 'Ungültige Zeitangabe';

  @override
  String get chapterLocked => 'Das Kapitel ist gesperrt';

  @override
  String get chapterAllLocked => 'Alle Kapitel sind gesperrt';

  @override
  String chapterTrackTitle(int number) {
    return 'Titel $number';
  }

  @override
  String get chapterNoAudioForPosition => 'Kein Audio für diese Position';

  @override
  String get chapterCouldNotPlayPreview =>
      'Vorschau konnte nicht abgespielt werden';

  @override
  String chapterStartSetTo(String time) {
    return 'Beginne bei $time';
  }

  @override
  String get chapterAddNumberedTitle => 'Nummerierte Kapitel hinzufügen';

  @override
  String chapterNextPreview(String first, String second) {
    return 'Nächstes: \"$first\", \"$second\", ...';
  }

  @override
  String get chapterHowMany => 'Wie viele Kapitel';

  @override
  String get add => 'Hinzufügen';

  @override
  String get chapterCountRange => 'Gib eine Zahl zwischen 1 und 150 ein';

  @override
  String get chapterTitlesUpdated => 'Kapiteltitel aktualisiert';

  @override
  String get chaptersApplied => 'Kapitel angewendet';

  @override
  String get chapterDiscardTitle => 'Änderungen verwerfen?';

  @override
  String get chapterDiscardMessage =>
      'Zu den gespeicherten Kapitel zurückkehren.';

  @override
  String get chapterRemoveAllTitle => 'Alle Kapitel entfernen?';

  @override
  String get chapterRemoveAllMessage =>
      'Dies entfernt alle Kapitel aus diesem Buch.';

  @override
  String get chapterAllRemoved => 'Alle Kapitel wurden entfernt';

  @override
  String get chapterFixHighlighted =>
      'Korrigiere zuerst die markierten Kapitel';

  @override
  String get chaptersUpdated => 'Kapitel aktualisiert';

  @override
  String get ok => 'Ok';

  @override
  String get chapterSaveButton => 'Kapitel speichern';

  @override
  String get chapterAddHint => 'Kapitel hinzufügen (z.B. \"Kapitel 01\")';

  @override
  String get chapterAddTooltip => 'Kapitel hinzufügen(n)';

  @override
  String get chapterRemoveAll => 'Alle entfernen';

  @override
  String get chapterShiftTimes => 'Zeiten verschieben';

  @override
  String get chapterFromTracks => 'Aus Titel';

  @override
  String get chapterLookup => 'Suchen';

  @override
  String get chapterShowSeconds => 'Sekunden anzeigen';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes Min';
  }

  @override
  String get chapterLoopCut => 'Schnitt wiederholen';

  @override
  String get chapterFindStart => 'Anfang finden';

  @override
  String get chapterFindStartListening => 'Hört rund um die Markierung';

  @override
  String get chapterFindStartNone => 'Nichts hier klingt wie ein Kapitelanfang';

  @override
  String get chapterFindStartWider => 'Weiter suchen';

  @override
  String get chapterFindStartCeiling =>
      'Eine halbe Stunde um die Markierung herum durchsucht. Der Anfang liegt weiter entfernt, oder es gibt keine Kapitelansage zu hören.';

  @override
  String get chapterFindStartStrong => 'Klingt nach diesem Kapitel';

  @override
  String get chapterFindStartMaybe => 'Kapitelähnliche Wörter';

  @override
  String chapterFindStartGap(String seconds) {
    return '$seconds Sek. Pause';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return 'Durchsucht: $from bis $to';
  }

  @override
  String get chapterFindStartNeedsModel =>
      'Schalte zuerst die Transkription in den Einstellungen ein und lade ein Modell herunter';

  @override
  String get chapterFindStartUseThis => 'Diesen verwenden';

  @override
  String chapterFindStartTitle(String title) {
    return 'Titel: $title';
  }

  @override
  String get chapterShiftBySeconds => 'Verschieben um (Sekunden)';

  @override
  String get chapterShiftHint =>
      'Verschiebt jedes entsperrte Kapitel. Verwende einen negativen Wert, um sie früher zu verschieben.';

  @override
  String get chapterTitleHint => 'Kapitelname';

  @override
  String get chapterStopPreview => 'Vorschau stoppen';

  @override
  String get chapterPreviewFromHere => 'Vorschau ab hier';

  @override
  String get chapterScrubHint => 'Spule an die exakte Stelle, lege dann fest';

  @override
  String chapterStartAt(String time) {
    return 'Beginne bei $time';
  }

  @override
  String get chapterUnlock => 'Entsperren';

  @override
  String get chapterLock => 'Sperren';

  @override
  String get chapterInsertBelow => 'Unten einfügen';

  @override
  String get chapterFindTitle => 'Finde Kapitel';

  @override
  String get chapterFindSubtitle =>
      'Suche nach Kapitel bei Audible/Audnexus mittels ASIN.';

  @override
  String get chapterEnterAsin => 'ASIN eingeben';

  @override
  String get chapterLookupFailed => 'Suche fehlgeschlagen - Prüfe die ASIN';

  @override
  String get chapterNoChaptersFound => 'Keine Kapitel für die ASIN gefunden';

  @override
  String get chapterRemoveBranding => 'Entferne Audible Branding (Intro/Outro)';

  @override
  String chapterFoundCount(int count) {
    return '$count Kapitel gefunden';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  Buch $book';
  }

  @override
  String get chapterAudibleLonger =>
      'Die Audible Version ist länger als deine Datei - spätere Kapitel könnten abweichen.';

  @override
  String get chapterAudibleShorter =>
      'Die Audible Version ist kürzer als deine Datei - spätere Kapitel könnten abweichen.';

  @override
  String get chapterTitlesOnly => 'Nur Titel';

  @override
  String get chapterApplyChapters => 'Kapitel übernehmen';

  @override
  String get coverSearchTitle => 'Nach einem Cover suchen';

  @override
  String get coverSearchRefineHint =>
      'Den Titel/Autor verfeinern, um die Ergebnisse aufzuräumen - das ändert das Buch nicht.';

  @override
  String get coverNoneFound => 'Keine Cover gefunden';

  @override
  String get coverEnterTitleFirst => 'Gebe zuerst einen Titel ein';

  @override
  String get coverUpdated => 'Cover aktualisiert';

  @override
  String get coverCouldNotUpdate => 'Cover konnte nicht aktualisiert werden';

  @override
  String get coverApply => 'Cover anwenden';

  @override
  String get coverUnknownResolution => 'Unbekannte Auflösung';

  @override
  String get embedIntro =>
      'Bette Metadaten wie Cover und Kapitel in Audiodateien ein.';

  @override
  String get embedBackupOption => 'Audiodateien zuerst sichern';

  @override
  String get embedNoteInFolder =>
      'Metadaten werden in die Audiodateien in deinem Hörbuchordner eingebettet.';

  @override
  String get embedNoteMultiTrack =>
      'Kapitel werden nicht in Hörbücher eingebettet, die auf mehrere Dateien aufgeteilt sind.';

  @override
  String get embedNoteNavigateAway =>
      'Du kannst diese Seite verlassen, sobald die Aufgabe gestartet wurde.';

  @override
  String get embedStartButton => 'Metadaten einbetten';

  @override
  String embedProgress(String percent) {
    return 'Einbetten-Fortschritt: $percent%';
  }

  @override
  String get embedProgressIndeterminate => 'Einbetten...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent% - läuft auch nach dem Verlassen der Seite weiter';
  }

  @override
  String get taskStarting => 'Wird gestartet...';

  @override
  String get embedBackupNoteIntro =>
      'Eine Sicherung der ursprünglichen Audiodateien erfolgt auf dem Server unter ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro =>
      '. Stelle sicher, dass du den Item-Cache regelmäßig löschst.';

  @override
  String get embedDialogTitle => 'Eingebettete Metadaten';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Audiodateien',
      one: '# Audiodatei',
    );
    return 'Metadaten in $_temp0 einbetten? Deine Audiodateien werden überschrieben$backup.';
  }

  @override
  String get embedConfirmBackupClause => ' (Originale werden zuerst gesichert)';

  @override
  String get embedConfirmAction => 'Eingebettet';

  @override
  String get embedCouldNotStart => 'Einbetten konnte nicht gestartet werden';

  @override
  String get embedStarted => 'Einbetten gestartet';

  @override
  String get embedComplete => 'Einbetten abgeschlossen';

  @override
  String get embedFailed => 'Einbetten fehlgeschlagen';

  @override
  String get encodeComplete => 'Encodierung abgeschlossen';

  @override
  String get encodeFailedTask => 'Encodierung fehlgeschlagen';

  @override
  String encodeProgress(String percent) {
    return 'Encoding-Fortschritt $percent%';
  }

  @override
  String get encodeProgressIndeterminate => 'Encodiere...';

  @override
  String get adminApiKeys => 'API Keys';

  @override
  String get adminApiKeysSubtitle => 'Programmatische Zugriffstoken';

  @override
  String get adminApiKeysNewTitle => 'Neuer API Key';

  @override
  String get adminApiKeysName => 'Name';

  @override
  String get adminApiKeysNameHint => 'z.B. Home-Assistent';

  @override
  String get adminApiKeysOwner => 'Benutzer';

  @override
  String get adminApiKeysExpiration => 'Ablaufdatum';

  @override
  String get adminApiKeysActive => 'Aktiv';

  @override
  String get adminApiKeysActiveSub =>
      'Der Key funktioniert direkt nach dem Erstellen';

  @override
  String get adminApiKeysInactive => 'Inaktiv';

  @override
  String get adminApiKeysExpired => 'Abgelaufen';

  @override
  String get adminApiKeysCreate => 'Key erstellen';

  @override
  String get adminApiKeysCreated => 'API Key erstellt';

  @override
  String get adminApiKeysTokenLabel => 'Dein neuer API Key';

  @override
  String get adminApiKeysCopyWarning =>
      'Kopiere jetzt diesen Key. Aus Sicherheitsgründen wird dieser nicht mehr angezeigt.';

  @override
  String get adminApiKeysCopy => 'Kopieren';

  @override
  String get adminApiKeysCopied => 'In Zwischenablage kopiert';

  @override
  String get adminApiKeysDone => 'Erledigt';

  @override
  String get adminApiKeysDeleteTitle => 'API Key widerrufen?';

  @override
  String get adminApiKeysDeleted => 'Der API Key wurde widerrufen';

  @override
  String get adminApiKeysRevoke => 'Widerrufen';

  @override
  String get adminApiKeysSetActive => 'Als aktiv festlegen';

  @override
  String get adminApiKeysSetInactive => 'Als inaktiv festlegen';

  @override
  String get adminApiKeysFailedCreate => 'API Key konnte nicht erstellt werden';

  @override
  String get adminApiKeysFailedDelete =>
      'API Key konnte nicht widerrufen werden';

  @override
  String get adminApiKeysFailedUpdate =>
      'API Key konnte nicht aktualisiert werden';

  @override
  String get adminApiKeysEmpty => 'Noch keine API Key vorhanden';

  @override
  String get adminApiKeysEmptySub =>
      'Erstelle einen Key, damit Apps und Skripte deinen Server erreichen können';

  @override
  String get adminApiKeysNeverUsed => 'Nie benutzt';

  @override
  String get adminApiKeysNeverExpires => 'Kein Ablauf';

  @override
  String get adminApiKeysNameRequired => 'Namen eingeben';

  @override
  String get adminApiKeysUserRequired => 'Wähle einen Nutzer';

  @override
  String get adminApiKeysExpNever => 'Nie';

  @override
  String get adminApiKeysExp7d => '7 Tage';

  @override
  String get adminApiKeysExp30d => '30 Tage';

  @override
  String get adminApiKeysExp90d => '90 Tage';

  @override
  String get adminApiKeysExp1y => '1 Jahr';

  @override
  String adminApiKeysLastUsed(String time) {
    return 'Zuletzt genutzt $time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return 'Läuft ab am $date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return 'Widerrufe \"$name\"? Apps die diesen Key verwenden verlieren sofort den Zugriff.';
  }

  @override
  String get endOfEpisode => 'Ende der Folge';

  @override
  String get sleepTimerSheetEpisodeSleepStart => 'Sleep zum Ende der Folge';

  @override
  String get bookmarkListen => 'Anhören';

  @override
  String get bookmarkPause => 'Pausieren';

  @override
  String get bookmarkPreviewFailed => 'Stelle konnte nicht wiedergeben werden.';

  @override
  String get clipExport => 'Clip exportieren';

  @override
  String get clipJumpToStart => 'Zum Anfang springen';

  @override
  String get clipJumpToEnd => 'Zum Ende springen';

  @override
  String get clipSetStart => 'Anfang festlegen';

  @override
  String get clipSetEnd => 'Ende festlegen';

  @override
  String get clipInLabel => 'Rein';

  @override
  String get clipOutLabel => 'Raus';

  @override
  String get clipSave => 'Clip speichern';

  @override
  String clipExportSaved(String filename) {
    return 'Gespeichert: $filename';
  }

  @override
  String get clipExportClamped =>
      'Clip gespeichert, gekürzt bis zum Ende dieses Titels';

  @override
  String get clipExportFailed => 'Clip konnte nicht exportiert werden.';

  @override
  String get clipDownloadToExport =>
      'Lade dieses Buch zuerst herunter, um einen Clip auf das iPhone zu exportieren.';

  @override
  String get fsPickerTitle => 'Ordner auswählen';

  @override
  String get fsServerRoot => 'Server-Root';

  @override
  String get fsEmptyFolder => 'Keine Unterordner vorhanden';

  @override
  String get fsUseThisFolder => 'Diesen Ordner verwenden';

  @override
  String get adminLibrariesManage => 'Bibliotheken';

  @override
  String get adminLibrariesManageSubtitle =>
      'Erstellen, bearbeiten und umsortieren';

  @override
  String get adminUploadTitle => 'Medien Hochladen';

  @override
  String get adminUploadSubtitle =>
      'Bücher und Podcasts aus Dateien hinzufügen';

  @override
  String get adminUploadNoLibraries =>
      'Erstelle eine Bibliothek, bevor du die Medien hochlädst.';

  @override
  String get adminUploadDestination => 'Ziel';

  @override
  String get adminUploadFolder => 'Bibliotheksordner';

  @override
  String get adminUploadDetails => 'Eintrag-Details';

  @override
  String get adminUploadOptional => 'Optional';

  @override
  String get adminUploadAutoMetadata => 'Metadaten automatisch abrufen';

  @override
  String get adminUploadAutoMetadataSubtitle =>
      'Titel, Autor und Reihe aus der besten Übereinstimmung übernehmen';

  @override
  String get adminUploadMetadataProvider => 'Metadaten-Anbieter';

  @override
  String get adminUploadMetadataSearching => 'Suche nach Metadaten...';

  @override
  String get adminUploadMetadataNoResults =>
      'Keine Metadaten gefunden. Du kannst dieses Element trotzdem hochladen.';

  @override
  String get adminUploadMetadataFailed =>
      'Konnte nicht nach Metadaten suchen. Du kannst dieses Element trotzdem hochladen.';

  @override
  String get adminUploadDestinationPreview => 'Server Ziel';

  @override
  String get adminUploadFiles => 'Dateien';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '1 Datei',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => 'Datei auswählen';

  @override
  String get adminUploadAddFiles => 'Dateien hinzufügen';

  @override
  String get adminUploadBookFilesHint =>
      'Wähle Audio- oder eBook-Dateien. Du kannst auch Cover- und Metadatendateien einbinden.';

  @override
  String get adminUploadPodcastFilesHint =>
      'Wähle eine oder mehrere Audiodateien. Du kannst auch Cover- und Metadatendateien einfügen.';

  @override
  String get adminUploadUnsupportedFiles =>
      'Einige der ausgewählten Dateien werden von Audiobookshelf nicht unterstützt.';

  @override
  String get adminUploadFilePickerFailed =>
      'Konnte die gewählten Dateien nicht öffnen.';

  @override
  String get adminUploadTitleRequired => 'Titel eingeben';

  @override
  String get adminUploadLibraryRequired => 'Wähle eine Bibliothek';

  @override
  String get adminUploadFolderRequired => 'Wähle einen Bibliotheksordner';

  @override
  String get adminUploadFilesRequired => 'Mindestens eine Datei auswählen';

  @override
  String get adminUploadPodcastFileRequired =>
      'Wähle mindestens eine Audiodatei für diesen Podcast.';

  @override
  String get adminUploadBookFileRequired =>
      'Wähle mindestens eine Audio- oder eBook-Datei für dieses Buch.';

  @override
  String get adminUploadPathCheckFailed =>
      'Der Zielordner konnte nicht überprüft werden. Es wurde nichts hochgeladen.';

  @override
  String get adminUploadDestinationExists =>
      'Dieser Zielordner existiert bereits auf dem Server.';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return 'Dieses Ziel wird bereits von \"$title\" verwendet.';
  }

  @override
  String get adminUploadAddToExistingTitle => 'Ordner existiert bereits';

  @override
  String adminUploadAddToExisting(String title) {
    return 'Dieser Ordner gehört zu „$title“. Die Dateien dort hinzufügen? Der Server übernimmt sie beim nächsten Scan.';
  }

  @override
  String get adminUploadAddToExistingNoItem =>
      'Dieser Ordner existiert bereits auf dem Server. Die Dateien dort hinzufügen?';

  @override
  String get adminUploadAddToBook => 'Zu einem vorhandenen Buch hinzufügen';

  @override
  String get adminUploadAddToBookHint => 'Diese Bibliothek durchsuchen';

  @override
  String get adminUploadNoBooksFound => 'Keine Bücher gefunden';

  @override
  String adminUploadAddingTo(String title) {
    return 'Dateien werden zu „$title“ hinzugefügt';
  }

  @override
  String adminUploadAddedTo(String title) {
    return 'Dateien zu „$title“ hinzugefügt';
  }

  @override
  String get adminUploadTargetNoFolder =>
      'Der Ordner dieses Buchs wurde auf dem Server nicht gefunden.';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return 'Der Server würde diese Dateien in „$preview“ ablegen, nicht im Ordner „$folder“ dieses Buchs. Es wurde nichts hochgeladen.';
  }

  @override
  String get adminUploadUploading => 'Wird hochgeladen...';

  @override
  String adminUploadProgress(int percent) {
    return 'Fortschritt beim Hochladen: $percent %';
  }

  @override
  String get adminUploadButton => 'Hochladen';

  @override
  String adminUploadComplete(String title) {
    return '\"$title\" hochgeladen';
  }

  @override
  String get adminUploadFailed => 'Hochladen fehlgeschlagen';

  @override
  String adminUploadFailedReason(String error) {
    return 'Hochladen fehlgeschlagen: $error';
  }

  @override
  String get adminUploadReselectFiles =>
      'Wähle die Dateien erneut aus, bevor du es wieder versuchst.';

  @override
  String get adminServerSettings => 'Servereinstellungen';

  @override
  String get adminServerSettingsSubtitle => 'Scanner, Speicher und Sortierung';

  @override
  String get adminAuthentication => 'Authentifizierung';

  @override
  String get adminAuthenticationSubtitle =>
      'Anmeldung per Passwort und OpenID Connect';

  @override
  String get adminStats => 'Statistiken';

  @override
  String get adminStatsSubtitle => 'Bibliothek und Hörstatistik';

  @override
  String get adminAllSessions => 'Alle Sitzungen';

  @override
  String get adminAllSessionsSubtitle =>
      'Alle Hörsitzungen anzeigen und verwalten';

  @override
  String get adminSessionsAllUsers => 'Alle Benutzer';

  @override
  String get adminSessionsEmpty => 'Keine Sitzungen';

  @override
  String get statsLibraryTotals => 'Gesamtsumme der Bibliothek';

  @override
  String get statsTotalItems => 'Elemente';

  @override
  String get statsAudioFiles => 'Audiodateien';

  @override
  String get statsTotalSize => 'Größe (gesamt)';

  @override
  String get statsBooks => 'Bücher';

  @override
  String get statsPodcasts => 'Podcasts';

  @override
  String get statsBooksSize => 'Büchergröße';

  @override
  String get statsYearReview => 'Jahresrückblick';

  @override
  String get statsNoYearData => 'Keine Daten für dieses Jahr';

  @override
  String get statsListeningTime => 'Wiedergabedauer';

  @override
  String get statsSessions => 'Sitzungen';

  @override
  String get statsBooksAdded => 'Bücher hinzugefügt';

  @override
  String get statsAuthorsAdded => 'Autoren hinzugefügt';

  @override
  String get statsTopAuthors => 'Top Autoren';

  @override
  String get statsTopNarrators => 'Top Erzähler';

  @override
  String get statsTopGenres => 'Top Genres';

  @override
  String get srvScannerSection => 'Scanner';

  @override
  String get srvFindCovers => 'Cover suchen';

  @override
  String get srvCoverProvider => 'Cover Anbieter';

  @override
  String get srvParseSubtitles => 'Untertitel aus Dateinamen extrahieren';

  @override
  String get srvPreferMatched => 'Übereinstimmende Metadaten bevorzugen';

  @override
  String get srvDisableWatcher => 'Ordnerbeobachter deaktivieren';

  @override
  String get srvStorageSection => 'Speicher';

  @override
  String get srvStoreCover => 'Cover in Datei einbetten';

  @override
  String get srvStoreMetadata => 'Metadaten in Datei einbetten';

  @override
  String get srvMetadataFormat => 'Metadaten Dateiformat';

  @override
  String get srvFormatSection => 'Anzeige und Format';

  @override
  String get srvDateFormat => 'Datumsformat';

  @override
  String get srvTimeFormat => 'Zeitformat';

  @override
  String get srvLanguage => 'Serversprache';

  @override
  String get srvChromecast => 'Chromecast Unterstützung';

  @override
  String get srvAllowIframe => 'Iframe-Einbettung erlauben';

  @override
  String get srvSortingSection => 'Sortierung';

  @override
  String get srvIgnorePrefixes => 'Präfixe beim Sortieren ignorieren';

  @override
  String get srvSortingPrefixes => 'Präfixe sortieren';

  @override
  String get srvAddPrefix => 'Präfix hinzufügen';

  @override
  String get srvSave => 'Einstellungen speichern';

  @override
  String get srvSavePrefixes => 'Präfixe speichern';

  @override
  String get srvSaved => 'Einstellungen gespeichert';

  @override
  String get srvSaveFailed => 'Einstellungen konnten nicht gespeichert werden';

  @override
  String get srvPrefixesSaved => 'Sortierungspräfixe aktualisiert';

  @override
  String get authSetLoadFailed =>
      'Authentifizierungseinstellungen konnten nicht geladen werden';

  @override
  String get authSetCustomMessage => 'Eigene Nachricht bei der Anmeldung';

  @override
  String get authSetMessage => 'Nachricht';

  @override
  String get authSetPasswordAuth => 'Passwort-Authentifizierung';

  @override
  String get authSetOpenId => 'OpenID-Connect-Authentifizierung';

  @override
  String get authSetGuide => 'Einrichtungsanleitung';

  @override
  String get authSetIssuerUrl => 'Issuer-URL';

  @override
  String get authSetAutoPopulate => 'Automatisch ausfüllen';

  @override
  String get authSetAuthorizeUrl => 'Authorize-URL';

  @override
  String get authSetTokenUrl => 'Token-URL';

  @override
  String get authSetUserinfoUrl => 'Userinfo-URL';

  @override
  String get authSetJwksUrl => 'JWKS-URL';

  @override
  String get authSetLogoutUrl => 'Logout-URL';

  @override
  String get authSetClientId => 'Client-ID';

  @override
  String get authSetClientSecret => 'Client-Secret';

  @override
  String get authSetSigningAlgorithm => 'Signaturalgorithmus';

  @override
  String get authSetRedirectUris => 'Erlaubte mobile Redirect-URIs';

  @override
  String get authSetRedirectUrisInfo =>
      'Apps können nach der Anmeldung nur zu diesen Adressen zurückkehren. Absorb verwendet absorb://oauth. Ein Sternchen (*) als einziger Eintrag erlaubt jede Adresse.';

  @override
  String get authSetAddRedirectUri => 'URI hinzufügen';

  @override
  String get authSetAddAbsorbRedirect => 'absorb://oauth hinzufügen';

  @override
  String get authSetSubfolder => 'Unterordner für Redirect-URLs';

  @override
  String get authSetSubfolderNone => 'Keiner';

  @override
  String get authSetWebRedirectInfo =>
      'Erlaube diese URLs bei deinem OAuth-Anbieter, damit die Anmeldung zur Web-App zurückkehren kann:';

  @override
  String get authSetButtonText => 'Schaltflächentext';

  @override
  String get authSetMatchExisting => 'Vorhandene Benutzer abgleichen nach';

  @override
  String get authSetMatchNone => 'Nicht abgleichen';

  @override
  String get authSetMatchEmail => 'E-Mail';

  @override
  String get authSetMatchUsername => 'Benutzername';

  @override
  String get authSetMatchExistingInfo =>
      'Wird zum Verknüpfen vorhandener Benutzer verwendet. Nach der Verknüpfung werden Benutzer über ihre eindeutige ID des Anbieters abgeglichen.';

  @override
  String get authSetAutoLaunch => 'Automatisch starten';

  @override
  String get authSetAutoLaunchInfo =>
      'Den Anbieter automatisch von der Web-Anmeldeseite aus öffnen. /login?autoLaunch=0 überspringt das.';

  @override
  String get authSetAutoRegister => 'Automatisch registrieren';

  @override
  String get authSetAutoRegisterInfo =>
      'Neue Benutzer nach der Anmeldung automatisch anlegen';

  @override
  String get authSetClaimsInfo =>
      'Lass diese leer, um die Zuweisung von Gruppen und Berechtigungen auszuschalten. Neue Benutzer erhalten dann die Rolle „User“.';

  @override
  String get authSetGroupClaim => 'Gruppen-Claim';

  @override
  String get authSetGroupClaimInfo =>
      'Claim, der die Gruppen des Benutzers auflistet, meist groups. Gruppen namens admin, user oder guest legen die Rolle fest, die höchste gewinnt. Passt keine Gruppe, wird die Anmeldung abgelehnt.';

  @override
  String get authSetPermsClaim => 'Claim für erweiterte Berechtigungen';

  @override
  String get authSetPermsClaimInfo =>
      'Claim mit Berechtigungen für Nicht-Admin-Benutzer. Fehlt der Claim, wird die Anmeldung abgelehnt, und eine fehlende Option gilt als aus. Erwartetes Format:';

  @override
  String get authSetRestartNote =>
      'Starte den Server nach dem Speichern neu, um OpenID-Connect-Änderungen anzuwenden.';

  @override
  String get authSetNoChanges => 'Keine Änderungen zum Speichern';

  @override
  String get authSetNeedOneMethod =>
      'Schalte mindestens eine Anmeldemethode ein';

  @override
  String authSetFieldRequired(String field) {
    return '$field ist erforderlich';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return 'Ungültige Redirect-URI: $uri';
  }

  @override
  String get authSetAsteriskAlone =>
      'Ein Sternchen (*) muss die einzige Redirect-URI sein';

  @override
  String authSetInvalidClaim(String field) {
    return '$field ist kein gültiger Claim-Name';
  }

  @override
  String authSetIssuerFailed(String error) {
    return 'Der Issuer konnte nicht gelesen werden: $error';
  }

  @override
  String get libNoneYet => 'Noch keine Bibliotheken vorhanden';

  @override
  String get libReorderFailed =>
      'Neue Reihenfolge konnte nicht gespeichert werden';

  @override
  String get libDeleteTitle => 'Bibliothek löschen?';

  @override
  String get libDeleteBody =>
      'Dies entfernt die Bibliothek und alle Elemente dauerhaft vom Server.';

  @override
  String get libDeleted => 'Bibliothek gelöscht';

  @override
  String get libDeleteFailed => 'Bibliothek konnte nicht gelöscht werden';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Ordner',
      one: '1 Ordner',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => 'Neue Bibliothek';

  @override
  String get libEditTitle => 'Bibliothek bearbeiten';

  @override
  String get libName => 'Name der Bibliothek';

  @override
  String get libMediaType => 'Medienart';

  @override
  String get libMediaBook => 'Bücher';

  @override
  String get libMediaPodcast => 'Podcasts';

  @override
  String get libProvider => 'Metadaten-Anbieter';

  @override
  String get libIcon => 'Icon';

  @override
  String get libFolders => 'Ordner';

  @override
  String get libAddFolder => 'Ordner hinzufügen';

  @override
  String get libNoFolders => 'Füge mindestens einen Ordner hinzu';

  @override
  String get libAdvanced => 'Erweiterte Einstellungen';

  @override
  String get libCoverShape => 'Form des Covers';

  @override
  String get libCoverSquare => 'Quadratisch';

  @override
  String get libCoverStandard => 'Standard';

  @override
  String get libDisableWatcher => 'Ordnerbeobachter deaktivieren';

  @override
  String get libSkipAsin =>
      'Überspringe den Abgleich von Büchern die über eine ASIN verfügen';

  @override
  String get libSkipIsbn =>
      'Überspringe den Abgleich von Büchern die über eine ISBN verfügen';

  @override
  String get libHideSingleSeries => 'Einzelbuchreihe ausblenden';

  @override
  String get libAudiobooksOnly => 'Nur Hörbücher';

  @override
  String get libEpubScripted => 'Scripted ePub Inhalt zulassen';

  @override
  String get libLaterBooksOnly =>
      'Nur aktuellere Bücher in Serie fortsetzen anzeigen';

  @override
  String get libPodcastRegion => 'Podcast Suchregion';

  @override
  String get libMarkPercent => 'Bei % als beendet markieren';

  @override
  String get libMarkTime => 'Beendet mit Sekunden verbleibend';

  @override
  String get libAutoScan => 'Auto-Scan Zeitplan (cron)';

  @override
  String get libCreate => 'Neue Bibliothek erstellen';

  @override
  String get libUpdate => 'Änderungen speichern';

  @override
  String get libNameRequired => 'Bibliotheksnamen eingeben';

  @override
  String get libCreated => 'Bibliothek erstellt';

  @override
  String get libCreateFailed => 'Bibliothek konnte nicht erstellt werden';

  @override
  String get libUpdated => 'Bibliothek aktualisiert';

  @override
  String get libUpdateFailed => 'Bibliothek konnte nicht aktualisiert werden';

  @override
  String get libRemoveFoldersTitle => 'Ordner löschen?';

  @override
  String get libRemoveFoldersBody =>
      'Das Löschen eines Ordners entfernt alle seine Einträge aus der Bibliothek. Der Vorgang kann nicht rückgängig gemacht werden.';

  @override
  String get readEbook => 'Lesen';

  @override
  String get ebookDownload => 'Herunterladen';

  @override
  String get ebookDownloaded => 'Heruntergeladen';

  @override
  String get ebookSavedOffline => 'Zum offline Lesen gespeichert';

  @override
  String get ebookRemovedOffline => 'Offlineinhalt entfernt';

  @override
  String get ebookOfflineFailed =>
      'Das eBook konnte nicht heruntergeladen werden';

  @override
  String get ebookSaveToDevice => 'Auf Gerät speichern';

  @override
  String get ebookSaveToDeviceTitle => 'Auf Gerät speichern?';

  @override
  String get ebookSaveToDeviceBody =>
      'Dies speichert eine Kopie der eBook-Datei auf deinem Gerät (du bestimmst das Verzeichnis). Das Buch wird nicht im offline Reader verfügbar sein - verwende dafür den Download.';

  @override
  String get readerFormatUnsupported =>
      'Dieses eBook-Format kann noch nicht im Reader geöffnet werden';

  @override
  String get readerCouldNotOpen =>
      'Dieses eBook konnte nicht geöffnet werden. Die Datei ist möglicherweise beschädigt.';

  @override
  String get moreActions => 'Mehr';

  @override
  String get readerChapters => 'Kapitel';

  @override
  String get readerSettings => 'Reader-Einstellungen';

  @override
  String get readerFontSize => 'Schriftgröße';

  @override
  String get readerLineSpacing => 'Zeilenabstand';

  @override
  String get readerTextAlignment => 'Ausrichtung';

  @override
  String get readerAlignJustified => 'Blocksatz';

  @override
  String get readerAlignLeft => 'Links';

  @override
  String get readerSideMargins => 'Seitenrand';

  @override
  String get readerTopBottom => 'Oben & Unten';

  @override
  String get readerPageLayout => 'Seitenlayout';

  @override
  String get readerPinTopBar =>
      'Titel und Fortschrittsleiste auf dem Bildschirm lassen';

  @override
  String get readerPinTopBarHint =>
      'Heftet sie über die Seite, statt sie per Tippen einzublenden. Die Seite wird etwas kürzer, damit kein Text verdeckt wird.';

  @override
  String get readerTopBarProgress => 'Fortschritt in der oberen Leiste';

  @override
  String get readerTopBarProgressBook => 'Buch';

  @override
  String get readerTopBarProgressChapter => 'Kapitel';

  @override
  String get readerTopBarProgressBoth => 'Beides';

  @override
  String get readerSectionText => 'Text';

  @override
  String get readerSectionPage => 'Seite';

  @override
  String get readerSectionTopBar => 'Obere Leiste und Bildschirm';

  @override
  String get readerSectionControls => 'Steuerung';

  @override
  String get readerSectionStats => 'Statistiken';

  @override
  String get readerParagraphSpacing => 'Absatzabstand';

  @override
  String get readerParagraphSpacingBook => 'Vom Buch vorgegeben';

  @override
  String get readerTapZones => 'Tippbereiche';

  @override
  String get readerTapZonesHint =>
      'Ziehe die Linien, um die Felder anzupassen. Tippe auf ein Feld, um seine Funktion zu ändern, oder starte mit einem Layout.';

  @override
  String get readerTapPrev => 'Vorherige Seite';

  @override
  String get readerTapNext => 'Nächste Seite';

  @override
  String get readerTapMenu => 'Steuerung anzeigen';

  @override
  String get readerTapNothing => 'Nichts';

  @override
  String get readerTapKeepMenu => 'Ein Feld muss die Steuerung anzeigen';

  @override
  String get readerHideControls => 'Steuerung ausblenden nach';

  @override
  String get readerHideControlsNever => 'Nie';

  @override
  String get readerBarNotes => 'Notizen und Markierungen';

  @override
  String readerHideControlsAfter(int seconds) {
    return '$seconds Sek.';
  }

  @override
  String get playerDownloadStreamingInstead =>
      'Dieser Download konnte nicht abgespielt werden, daher wird vom Server gestreamt. Ein erneuter Download kann das beheben.';

  @override
  String get readerPageTurn => 'Seitenwechsel';

  @override
  String get readerPageTurnNone => 'Keiner';

  @override
  String get readerPageTurnSlide => 'Schieben';

  @override
  String get readerPageTurnCurl => 'Umblättern';

  @override
  String get readerPageTurnRipple => 'Welle';

  @override
  String get readerScrollMode => 'Scroll-Modus';

  @override
  String get readerScrollModeHint =>
      'Durch das Buch scrollen, statt Seiten umzublättern. Gilt für jedes Buch.';

  @override
  String get readerKeepAwake => 'Bildschirm eingeschaltet lassen';

  @override
  String get readerKeepAwakeHint =>
      'Verhindert, dass sich der Bildschirm abschaltet, während du in deinem eigenen Tempo liest. Auto-Scroll und Mitlesen halten ihn immer an.';

  @override
  String get readerLayoutAuto => 'Automatisch';

  @override
  String get readerLayoutSingle => 'Eine Seite';

  @override
  String get readerLayoutTwoPage => 'Zwei Seiten';

  @override
  String get readerTheme => 'Thema';

  @override
  String get readerFont => 'Schriftart';

  @override
  String get readerVolumeNav => 'Lautstärketasten blättern Seiten um';

  @override
  String get readerVolumeNavOff => 'Aus';

  @override
  String get readerVolumeNavNormal => 'Normal';

  @override
  String get readerVolumeNavMirrored => 'Gespiegelt';

  @override
  String get readerAutoScroll => 'Auto-Scroll';

  @override
  String get readerAutoScrollSubtitle =>
      'Die nächste Seite wird von oben nach unten über diese gezeichnet - ziehe in der Bildschirmmitte, um die Geschwindigkeit zu ändern, tippe zum Stoppen';

  @override
  String get readerAutoScrollStarted => 'Auto-Scroll gestartet';

  @override
  String get readerAutoScrollPaused => 'Pausiert - gedrückt halten zum Stoppen';

  @override
  String get readerAutoScrollResumed => 'Auto-Scroll fortgesetzt';

  @override
  String get readerAutoScrollStopped => 'Auto-Scroll aus';

  @override
  String get readerAutoScrollEndOfBook => 'Ende des Buchs - Auto-Scroll aus';

  @override
  String readerAutoScrollSpeed(int percent) {
    return 'Geschwindigkeit $percent%';
  }

  @override
  String get readerMoreControls => 'Weitere Steuerung';

  @override
  String get readerAutoScrollSleep => 'Sleep-Timer für Auto-Scroll';

  @override
  String get readerAutoScrollSleepHint =>
      'Stoppt das Scrollen nach einer Weile und lässt den Bildschirm dunkel werden.';

  @override
  String readerAutoScrollSleepMinutes(int minutes) {
    return '$minutes Min';
  }

  @override
  String readerAutoScrollSleepLeft(int minutes) {
    return 'Noch $minutes Min';
  }

  @override
  String readerAutoScrollSleepIn(int minutes) {
    return 'Auto-Scroll stoppt in $minutes Min';
  }

  @override
  String get readerAutoScrollSleepOff => 'Sleep-Timer für Auto-Scroll aus';

  @override
  String get readerAutoScrollSleepEnded => 'Sleep-Timer - Auto-Scroll aus';

  @override
  String get readerDownloadStarted => 'Download gestartet';

  @override
  String get detailChaptersJumpTitle => 'Zu diesem Kapitel springen?';

  @override
  String detailChaptersJumpContent(String title) {
    return 'Die Wiedergabe springt zu „$title“.';
  }

  @override
  String get detailChaptersJump => 'Springen';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kapitel beendet',
      one: '1 Kapitel beendet',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count andere Hörer',
      one: '1 anderer Hörer',
      zero: 'Keine anderen Hörer',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => 'Als Nächstes';

  @override
  String get seriesJumpToUpNext => 'Zu „Als Nächstes“ springen';

  @override
  String get seriesStatsFinished => 'Beendet';

  @override
  String get seriesStatsListened => 'Gehört';

  @override
  String get seriesStatsLeft => 'Übrig';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done von $total';
  }

  @override
  String get detailSessionsNone => 'Noch keine Hörsitzungen';

  @override
  String detailSessionsAll(int count) {
    return 'Alle $count Sitzungen';
  }

  @override
  String get readerVolumeNavWhilePlaying =>
      'Selbst während Audio abgespielt wird';

  @override
  String get readerTranslateWith => 'Übersetzen mit';

  @override
  String get readerTranslateApp => 'App auf diesem Gerät';

  @override
  String get readerTranslateApple => 'In iOS integriert';

  @override
  String get readerTranslateWeb => 'Öffnet sich in deinem Browser';

  @override
  String get readerTranslateHint =>
      'Der ausgewählte Text wird an den gewählten Übersetzer gesendet.';

  @override
  String get readerMoreFonts => 'Weitere Schriftarten herunterladen';

  @override
  String get readerFontRemove => 'Download entfernen';

  @override
  String readerFontDownloadFailed(String font) {
    return '$font konnte nicht heruntergeladen werden';
  }

  @override
  String get readerAnnotations => 'Anmerkungen';

  @override
  String readerHighlights(int count) {
    return 'Hervorhebungen ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return 'Lesezeichen ($count)';
  }

  @override
  String get readerNoHighlights => 'Noch keine Hervorhebungen';

  @override
  String get readerHistory => 'Verlauf';

  @override
  String get sessionReading => 'Lesen';

  @override
  String get readerHistoryEmpty =>
      'Seiten, die du verlässt, werden hier aufgelistet, damit du immer zu ihnen zurückfindest.';

  @override
  String get readerHistoryClosed => 'Buch geschlossen';

  @override
  String get readerHistoryBeforeJump => 'Vor einem Sprung';

  @override
  String get readerHistoryBeforeSync => 'Vor dem Abgleich mit dem Audio';

  @override
  String get readerLogReading => 'Lesezeit in den Statistiken zählen';

  @override
  String get readerLogReadingHint =>
      'Protokolliert deine Zeit im Reader als Sitzung, damit sie in deinen Statistiken erscheint. Auf Audiobookshelf zählt sie als Hörzeit.';

  @override
  String get readerNoBookmarks => 'Noch keine Lesezeichen';

  @override
  String get readerBookmarkDefault => 'Lesezeichen';

  @override
  String get readerNoteTitle => 'Notiz';

  @override
  String get readerNoteHint => 'Notiz hinzufügen...';

  @override
  String get backupAndSync => 'Backup und Synchronisierung';

  @override
  String get backupAndSyncSubtitle =>
      'Eine Backup-Datei speichern oder Einstellungen geräteübergreifend abgleichen';

  @override
  String get syncSettingsExperimental => 'Experimentell';

  @override
  String get syncSettingsExperimentalBody =>
      'Die Synchronisierung ist neu und wird noch weiterentwickelt. Wenn zwei Geräte getrennt voneinander etwas ändern, kann eine Seite ihre Änderungen verlieren. Bewahre eine Backup-Datei als sichere Kopie auf.';

  @override
  String get syncSettingsNeedServer => 'Server nötig?';

  @override
  String get syncSettingsNeedServerSub =>
      'Jeder WebDAV-Server funktioniert. Nextcloud ist ein kostenloser, selbst gehosteter.';

  @override
  String get syncSettingsConnection => 'Verbindung';

  @override
  String get syncSettingsConnectionNotSet => 'Nicht eingerichtet';

  @override
  String get syncSettingsBackupFile => 'Backup-Datei';

  @override
  String get syncSettingsBackupFilePlain =>
      'Alles in einer Datei speichern, die du behältst.';

  @override
  String get syncSettingsBackupFileWithSync =>
      'Alles in einer Datei speichern, die du behältst. Mit Anmeldedaten schaltet das Wiederherstellen auf einem anderen Handy dort auch die Synchronisierung ein.';

  @override
  String get syncSettingsStatusOff => 'Keine Synchronisierung';

  @override
  String get syncSettingsStatusProblem => 'Dein Server ist nicht erreichbar';

  @override
  String get syncSettings => 'Einstellungen zwischen Geräten synchronisieren';

  @override
  String get syncSettingsExtras => 'Auch synchronisieren';

  @override
  String get syncSettingsIncludeRmab => 'ReadMeABook Einstellungen';

  @override
  String get syncSettingsIncludeRmabSub =>
      'Legt deinen ReadMeABook-API-Token in die synchronisierte Datei';

  @override
  String get syncSettingsSubtitle =>
      'Halte deine Einstellungen über deinen eigenen WebDAV-Server abgeglichen';

  @override
  String get syncSettingsEnable => 'Einstellungen synchronisieren';

  @override
  String get syncSettingsServerUrl => 'WebDAV-Ordner-URL';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => 'Benutzername';

  @override
  String get syncSettingsPassword => 'Passwort';

  @override
  String get syncSettingsHeaders => 'Eigene Header (optional)';

  @override
  String get syncSettingsHeadersHint =>
      'Einer pro Zeile, z. B. CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => 'Verbindung testen';

  @override
  String get syncSettingsHoldToUpload =>
      'Gedrückt halten, um jetzt hochzuladen';

  @override
  String get syncSettingsUploadNow => 'Jetzt hochladen';

  @override
  String get syncSettingsDownloadNow => 'Jetzt herunterladen';

  @override
  String get syncSettingsOk => 'Verbunden';

  @override
  String get syncSettingsNoRemote => 'Verbunden - noch nichts Synchronisiert';

  @override
  String get syncSettingsAuthFailed => 'Falscher Benutzername oder Passwort';

  @override
  String get syncSettingsNetworkError => 'Adresse konnte nicht erreicht werden';

  @override
  String get syncSettingsNotConfigured =>
      'Zuerst Adresse, Benutzername und Passwort ausfüllen';

  @override
  String get syncSettingsTooLarge =>
      'Einstellungen zu groß zum synchronisieren';

  @override
  String get syncSettingsUploaded => 'Einstellungen hochgeladen';

  @override
  String get syncSettingsApplied =>
      'Einstellungen von anderem Gerät aktualisiert';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einstellungen von deinem anderen Gerät aktualisiert',
      one: '1 Einstellung von deinem anderen Gerät aktualisiert',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => 'Bereits auf dem neusten Stand';

  @override
  String syncSettingsLastSynced(String when) {
    return 'Zuletzt synchronisiert $when';
  }

  @override
  String get syncSettingsNever => 'Noch nicht synchronisiert';

  @override
  String navHoldPickTitle(String tab) {
    return 'Halten von $tab wird...';
  }

  @override
  String get navHoldPickBody =>
      'Wähle, was langes Drücken auf diesen Tab bewirkt. Du kannst es später in den Einstellungen ändern.';

  @override
  String get navHoldSettingTitle => 'Kurzbefehle für gehaltene Tabs';

  @override
  String get navHoldSettingSubtitle => 'Was das Halten jedes Tabs bewirkt';

  @override
  String get navHoldAskNextTime => 'Erneut fragen';

  @override
  String get navHoldNothing => 'Nichts';

  @override
  String get navHoldPlayPause => 'Play / Pause';

  @override
  String get navHoldOfflineMode => 'Offline Modus';

  @override
  String get navHoldOfflineOn => 'Offline Modus an';

  @override
  String get navHoldOfflineOff => 'Offline Modus aus';

  @override
  String get navHoldMenu => 'Menü immer anzeigen';

  @override
  String get navHoldStop => 'Wiedergabe stoppen';

  @override
  String get navHoldRmabSearch => 'ReadMeABook-Suche';

  @override
  String get navHoldRmabRequests => 'Meine Buchanfragen';

  @override
  String get navHoldRmabWeb => 'ReadMeABook-Website';

  @override
  String get navHoldAdd => 'Hinzufügen';

  @override
  String get navHoldMoveLeft => 'Nach links';

  @override
  String get navHoldMoveRight => 'Nach rechts';

  @override
  String get navHoldRemoveFromMenu => 'Aus dem Menü entfernen';

  @override
  String get navHoldEditHint =>
      'Halte einen Eintrag, um ihn zu verschieben oder zu entfernen';

  @override
  String get navHoldResetMenu => 'Einträge des Halte-Menüs zurücksetzen';

  @override
  String get navHoldMenuReset => 'Menüeinträge zurückgesetzt';

  @override
  String get bookStatsAction => 'Hörstatistik';

  @override
  String get bookStatsYou => 'Du';

  @override
  String get bookStatsEveryone => 'Jeder';

  @override
  String get bookStatsListened => 'Gehörte Zeit';

  @override
  String get bookStatsSessions => 'Sitzungen';

  @override
  String get bookStatsFirst => 'Zuerst gehört';

  @override
  String get bookStatsLast => 'Zuletzt gehört';

  @override
  String get bookStatsListeners => 'Nutzer die es angefangen haben';

  @override
  String get bookStatsFinishedCount => 'Nutzer die es beendet haben';

  @override
  String get bookStatsTotalTime => 'Gehörte Zeit aller Nutzer';

  @override
  String get bookStatsNobody => 'Noch niemand hat es gehört';

  @override
  String get bookStatsScanning =>
      'Sitzungen werden durchsucht, das kann dauern...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return 'Sitzungen werden durchsucht, $done von $total Personen...';
  }

  @override
  String bookStatsLastChecked(String when) {
    return 'Geprüft $when';
  }

  @override
  String get activityYourReading => 'Dein Lesen';

  @override
  String get activityYourListening => 'Dein Hören';

  @override
  String activityLastRead(String when) {
    return 'Zuletzt gelesen $when';
  }

  @override
  String activityLastListened(String when) {
    return 'Zuletzt gehört $when';
  }

  @override
  String get activityNotStarted => 'Nicht begonnen';

  @override
  String get activityNoReading => 'Noch keine Lesesitzungen';

  @override
  String get activityTime => 'Zeit';

  @override
  String get activityAverage => 'Ø';

  @override
  String get activityProgress => 'Fortschritt';

  @override
  String activityReached(String percent) {
    return '$percent erreicht';
  }

  @override
  String get readingLogTitle => 'Leseprotokoll';

  @override
  String get readingLogTotalTime => 'Gesamtzeit';

  @override
  String get readingLogAverageSession => 'Durchschnittliche Sitzung';

  @override
  String get readingLogActiveDays => 'Aktive Tage';

  @override
  String readingLogActiveDaysOf(int active, int total) {
    return '$active von $total';
  }

  @override
  String get readingLogPace => 'Tempo';

  @override
  String readingLogPacePerHour(String percent) {
    return '$percent%/Std.';
  }

  @override
  String get readingLogLastRead => 'Zuletzt gelesen';

  @override
  String get readingLogStarted => 'Begonnen';

  @override
  String get readingLogFinished => 'Beendet';

  @override
  String get readingLogNotSet => 'Nicht festgelegt';

  @override
  String readingLogLeftMinutes(int m) {
    return 'Noch etwa $m Min bis zum Ende';
  }

  @override
  String readingLogLeftHours(int h) {
    return 'Noch etwa $h Std bis zum Ende';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return 'Noch etwa $h Std $m Min bis zum Ende';
  }

  @override
  String get readingLogLeftMax => 'Noch über 99 Std bis zum Ende';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return '$percent% mehr als in der Vorwoche';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return '$percent% weniger als in der Vorwoche';
  }

  @override
  String get readingLogNewThisWeek => 'Neu diese Woche';

  @override
  String get readingLogSameAsLastWeek => 'Gleich wie in der Vorwoche';

  @override
  String get readingLogQuietTwoWeeks => 'Nichts in den letzten zwei Wochen';

  @override
  String get readingLogWhereYouRead => 'Wo du es gelesen hast';

  @override
  String get readingLogSourceIos => 'iOS-App';

  @override
  String get readingLogSourceAndroid => 'Android-App';

  @override
  String get readingLogChartTitle => 'Fortschritt im Zeitverlauf';

  @override
  String get readingLogChartPosition => 'Erreichte Position';

  @override
  String get readingLogChartMinutes => 'Minuten';

  @override
  String get readingLogRecords => 'Rekorde';

  @override
  String get readingLogLongestSession => 'Längste Sitzung';

  @override
  String get readingLogBestDay => 'Bester Tag';

  @override
  String get readingLogLongestStreak => 'Längste Serie';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage',
      one: '1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => 'Zurückgesprungen';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Mal',
      one: '1 Mal',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => 'Zum ersten Mal geöffnet';

  @override
  String get readingLogAttempts => 'Versuche';

  @override
  String readingLogAttempt(int index) {
    return 'Versuch $index';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return 'Versuch $index begann';
  }

  @override
  String get readingLogOutcomeCompleted => 'Abgeschlossen';

  @override
  String get readingLogOutcomeSkimmed => 'Überflogen';

  @override
  String get readingLogOutcomeAbandoned => 'Abgebrochen';

  @override
  String get readingLogOutcomeInProgress => 'In Bearbeitung';

  @override
  String readingLogSpanRange(String from, String to) {
    return '$from bis $to';
  }

  @override
  String readingLogSpanSince(String from) {
    return 'Seit $from';
  }

  @override
  String readingLogSpanEnded(String to) {
    return 'Beendet $to';
  }

  @override
  String get readingLogSpanUnknown => 'Keine Daten erfasst';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sitzungen',
      one: '1 Sitzung',
    );
    return '$_temp0';
  }

  @override
  String readingLogShowing(int shown, int total) {
    return '$shown von $total';
  }

  @override
  String readingLogGapDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage ohne Lesen',
      one: '1 Tag ohne Lesen',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => 'Noch keine Sitzungen aufgezeichnet';

  @override
  String get readingLogEmptyHint =>
      'Sitzungen erscheinen hier, während du liest oder hörst, von jeder App oder jedem Gerät, das mit BookOrbit synchronisiert.';

  @override
  String get readingLogNoMatches => 'Keine Sitzungen in diesem Zeitraum';

  @override
  String get readingLogAllTime => 'Gesamte Zeit';

  @override
  String get readingLogLast30 => 'Letzte 30 Tage';

  @override
  String get readingLogLast90 => 'Letzte 90 Tage';

  @override
  String get readingLogThisYear => 'Dieses Jahr';

  @override
  String get readingLogAllFormats => 'Alle Formate';

  @override
  String get readingLogSortBy => 'Sortieren nach';

  @override
  String get readingLogSortDay => 'Tag';

  @override
  String get readingLogSortLength => 'Länge';

  @override
  String get readingLogSortChange => 'Änderung';

  @override
  String get readingLogSortReached => 'Erreicht';

  @override
  String get readingLogNewestFirst => 'Neueste zuerst';

  @override
  String get readingLogOldestFirst => 'Älteste zuerst';

  @override
  String get readingLogMostFirst => 'Meiste zuerst';

  @override
  String get readingLogLeastFirst => 'Wenigste zuerst';

  @override
  String get readingLogDeleteTitle => 'Diese Sitzung löschen?';

  @override
  String get readingLogDeleteBody =>
      'Sie wird aus dem Leseprotokoll des Buchs und aus deinen Statistiken auf BookOrbit entfernt.';

  @override
  String get readingLogDeleteFailed =>
      'Die Sitzung konnte nicht gelöscht werden';

  @override
  String get readingLogLoadFailed =>
      'Das Leseprotokoll konnte nicht geladen werden';

  @override
  String get navHoldServerScan => 'Server-Scan';

  @override
  String get navHoldScanAll => 'Alle Bibliotheken scannen';

  @override
  String navHoldScanLibrary(String name) {
    return 'Scanne $name';
  }

  @override
  String get navHoldScanStarted => 'Scan gestartet';

  @override
  String get navHoldScanFailed => 'Kann Scan nicht starten';

  @override
  String get navHoldAdminLogs => 'Server Logs';

  @override
  String navHoldAdminPage(String page) {
    return 'Admin: $page';
  }

  @override
  String get navHoldNothingPlaying => 'Noch nichts zum Abspielen';

  @override
  String get navHoldReadBook => 'Aktuelles Buch lesen';

  @override
  String get navHoldBookDetails => 'Details zum aktuellen Buch';

  @override
  String get syncSourceTitle =>
      'Welche Kopie soll die Synchronisierung behalten?';

  @override
  String get syncSourceBody =>
      'Dieses Backup hat die Einstellungs-Synchronisierung eingeschaltet. Die letzte Synchronisierung des Servers verwenden oder dieses Backup zur maßgeblichen Quelle machen? Wenn du das Backup wählst, ersetzt es die Kopie auf dem Server für alle deine synchronisierten Geräte.';

  @override
  String get syncSourceUseServer => 'Letzte Synchronisierung des Servers';

  @override
  String get syncSourceUseBackup => 'Dieses Backup';

  @override
  String get syncSettingsWhatTravels =>
      'Deine Präferenzen, buchspezifischen Geschwindigkeiten, das Start-Layout, die Absorbing-Reihenfolge, Notizen und eBook-Markierungen werden übertragen. Anmeldedaten, Download-Ordner, Auto-Download-Schalter, Reader-Darstellung und alles, was noch nicht an deinen Server gesendet wurde, bleiben auf diesem Gerät.';

  @override
  String get syncSettingsDownloadWarnTitle =>
      'Einstellungen dieses Geräts ersetzen?';

  @override
  String get syncSettingsDownloadWarnBody =>
      'Die synchronisierte Kopie überschreibt die Einstellungen auf diesem Gerät.';

  @override
  String get syncSettingsDownloadWarnConfirm => 'Ersetzen';

  @override
  String get readerCopied => 'In Zwischenablage kopiert';

  @override
  String get dictionaryNotFound =>
      'Für dieses Wort wurde keine Definition gefunden.';

  @override
  String get dictionaryError =>
      'Das Wörterbuch ist nicht erreichbar. Prüfe deine Verbindung.';

  @override
  String get dictionaryRetry => 'Erneut versuchen';

  @override
  String get dictionarySearchWeb => 'Im Web suchen';

  @override
  String get readerTooltipCopy => 'Kopieren';

  @override
  String get readerTooltipSearch => 'Suchen';

  @override
  String get readerTooltipDefine => 'Definieren';

  @override
  String get readerTooltipTranslate => 'Übersetzen';

  @override
  String get readerSearchHint => 'Dieses Buch durchsuchen…';

  @override
  String readerSearchMatches(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Treffer für \"$query\"',
      one: '$count Treffer für \"$query\"',
    );
    return '$_temp0';
  }

  @override
  String get readerSearchEmpty =>
      'Gib ein Wort oder Phrase ein und tippe auf Suche.';

  @override
  String readerSearchNoResults(String query) {
    return 'Keine Treffer für \"$query\".';
  }

  @override
  String get transcriptionTitle => 'Transkription';

  @override
  String get transcriptionAdvancedSubtitle =>
      'Zum Transkribieren von Lesezeichen und zum Finden deiner Stelle zwischen Hörbuch und eBook';

  @override
  String get transcriptionEnable => 'Transkription aktivieren';

  @override
  String get transcriptionEnableSubtitle =>
      'Fügt Lesezeichen „Transkribieren“, dem Player „Position im eBook finden“ und dem Reader „Im Hörbuch finden“ hinzu';

  @override
  String get transcriptionDisclaimer =>
      'Läuft vollständig auf deinem Gerät, nichts wird irgendwohin gesendet. Es braucht während der Arbeit zusätzlich Akku und Rechenleistung, und nur heruntergeladene Bücher können transkribiert werden.';

  @override
  String get transcriptionNeedModelHint =>
      'Lade unten ein Modell herunter, um mit dem Transkribieren zu beginnen.';

  @override
  String get transcriptionModelSection => 'Modelle';

  @override
  String get transcriptionModelTiny => 'Tiny';

  @override
  String get transcriptionModelTinyDesc =>
      'Am schnellsten, weniger genau. Etwa 31 MB.';

  @override
  String get transcriptionModelBase => 'Base';

  @override
  String get transcriptionModelBaseDesc => 'Ein guter Mittelweg. Etwa 57 MB.';

  @override
  String get transcriptionModelSmall => 'Small';

  @override
  String get transcriptionModelSmallDesc =>
      'Langsamer, aber am genauesten - am besten auf einem High-End-Handy. Etwa 182 MB.';

  @override
  String get transcriptionAutoHint =>
      'Sind mehrere heruntergeladen, wählt jeder Auftrag unter ihnen aus. Bücher mit eBook bekommen das schnellste, da der genaue Wortlaut ohnehin aus dem eBook stammt. Bücher ohne eBook bekommen das genaueste - außer beim Mitlesen, das unter Small bleibt, damit es mit der Erzählung Schritt halten kann.';

  @override
  String get transcriptionDownload => 'Herunterladen';

  @override
  String get transcriptionDownloadFailed =>
      'Download fehlgeschlagen. Prüfe deine Verbindung und versuche es erneut.';

  @override
  String get transcribe => 'Transkribieren';

  @override
  String get transcribing => 'Wird transkribiert...';

  @override
  String get transcriptionResultTitle => 'Transkript';

  @override
  String get transcriptionSaveToNote => 'In Notiz speichern';

  @override
  String get transcriptionSavedToNote => 'In der Lesezeichen-Notiz gespeichert';

  @override
  String get transcriptionDisabledHint =>
      'Schalte die Lesezeichen-Transkription in den Einstellungen unter Erweitert ein.';

  @override
  String get transcriptionNoModelDownloaded =>
      'Lade zuerst in den Einstellungen ein Transkriptionsmodell herunter.';

  @override
  String get transcriptionNotDownloadedBook =>
      'Lade dieses Buch herunter oder verbinde dich mit deinem Server, um es zu transkribieren.';

  @override
  String get transcriptionNoMetadataMsg =>
      'Diese Stelle lässt sich im Download nicht finden. Versuche, das Buch erneut herunterzuladen.';

  @override
  String get transcriptionBusyMsg =>
      'Es wird bereits etwas transkribiert. Warte einen Moment.';

  @override
  String get transcriptionEmptyMsg =>
      'An dieser Stelle wurde keine Sprache gefunden.';

  @override
  String get transcriptionFailedMsg =>
      'Diese Stelle konnte nicht transkribiert werden. Bitte versuche es erneut.';

  @override
  String get transcriptionPlaySnippet => 'Anhören';

  @override
  String get transcriptionPauseSnippet => 'Pausieren';

  @override
  String get transcriptionIntroBody =>
      'Dies hört die gewählte Menge Audio ab, beginnend kurz vor dem Lesezeichen, und wandelt sie auf deinem Gerät in Text um. Längere Ausschnitte dauern länger, und die Transkription ist nicht zu 100% genau. Der Text wird danach in der Notiz des Lesezeichens gespeichert, bereit zum Überarbeiten oder Teilen.';

  @override
  String get transcriptionUseEbookText =>
      'Den genauen Text des eBooks verwenden, wenn er zugeordnet werden kann';

  @override
  String get lyricsMode => 'Live-Transkript';

  @override
  String get lyricsListeningAhead => 'Hört voraus...';

  @override
  String get lyricsDisplaySection => 'Live-Transkript';

  @override
  String get lyricsFontSize => 'Zeilengröße';

  @override
  String get lyricsMaxLines => 'Angezeigte Zeilen';

  @override
  String get lyricsFullCover => 'Das ganze Cover verwenden';

  @override
  String get lyricsFullCoverHint =>
      'Zeigt das Transkript anstelle des Titelbilds an, solange es läuft, und passt so viele Zeilen ein, wie Platz ist.';

  @override
  String get lyricsBatteryInfo =>
      'Live-Transkript und Mitlesen brauchen während des Betriebs zusätzlich Akku und Rechenleistung. Auf Handys mit langsameren Prozessoren können Zeilen später erscheinen.';

  @override
  String get lyricsClearCache => 'Transkript-Cache leeren';

  @override
  String lyricsClearCacheHint(String size) {
    return '$size gespeicherte Transkriptzeilen. Geleerte Bücher und Episoden werden beim Hören erneut transkribiert.';
  }

  @override
  String get lyricsClearCacheConfirm =>
      'Die gespeicherten Transkripte für jedes Buch und jede Episode löschen? Sie werden beim Hören automatisch neu aufgebaut.';

  @override
  String get lyricsCacheCleared => 'Transkript-Cache geleert';

  @override
  String get lyricsIntroBody =>
      'Dies hört etwas vor der Erzählung her und zeigt jede Zeile an, während sie gesprochen wird, transkribiert auf deinem Handy - nichts verlässt das Gerät. Warte nach dem Einschalten ein paar Sekunden, bevor du auf Abspielen drückst, damit es einen Vorsprung aufbauen kann. Das Transkript erscheint, sobald der Vorsprung bereit ist, und ein pausierter Start sorgt für den flüssigsten Ablauf. Es braucht während des Betriebs zusätzlich Akku und Rechenleistung.';

  @override
  String lyricsBuildingLead(String percent) {
    return 'Vorsprung vor der Erzählung wird aufgebaut... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return 'Kann bei $speed nicht so schnell transkribieren, wie du hörst';
  }

  @override
  String get lyricsTurnOn => 'Einschalten';

  @override
  String get readAlong => 'Mitlesen';

  @override
  String get readAlongNeedsPlaying =>
      'Spiele zuerst das Hörbuch dieses Buchs ab';

  @override
  String get narrationListen => 'Anhören';

  @override
  String get narrationPlayFromHere => 'Ab hier abspielen';

  @override
  String get narrationPreparing => 'Die Erzählung wird vorbereitet';

  @override
  String get narrationNone => 'Dieses eBook hat keine Erzählung zum Abspielen';

  @override
  String get narrationDownloadTitle => 'Zum Anhören herunterladen';

  @override
  String get narrationDownloadBody =>
      'Dieses Buch ist ein EPUB3, das sich selbst vorliest. Audiobookshelf kann seine Erzählung nicht streamen, daher muss das Audio vor dem Abspielen heruntergeladen werden.';

  @override
  String get narrationDownloadStarted =>
      'Die Erzählung wird heruntergeladen. Tippe auf Absorb, wenn sie fertig ist.';

  @override
  String get narrationTextBody =>
      'Das EPUB dieses Buchs enthält zu jedem Moment des Audios den eigenen Text, daher wird der Text direkt aus dem Buch kopiert. Wähle, wie viel in die Notiz des Lesezeichens aufgenommen werden soll.';

  @override
  String get narrationTextLoading => 'Der Text wird aus dem Buch geholt';

  @override
  String get downloadToAbsorb => 'In Absorb herunterladen';

  @override
  String get narrationUpNextTitle => 'Das Nächste herunterladen';

  @override
  String narrationUpNextBody(String title) {
    return '$title ist als Nächstes in deiner Warteschlange. Es ist ein EPUB3, das sich selbst vorliest, und muss daher heruntergeladen werden, bevor es abgespielt werden kann.';
  }

  @override
  String narrationQueueStopped(String title) {
    return 'Vor $title gestoppt. Lade es herunter, um fortzufahren.';
  }

  @override
  String get transcriptionNeedsDownload =>
      'Dafür wird das Audio auf deinem Handy benötigt. Jetzt herunterladen?';

  @override
  String get transcriptionDownloadStarted =>
      'Wird heruntergeladen. Schalte dies wieder ein, wenn es fertig ist';

  @override
  String get readAlongFollow => 'Mitlesen folgt';

  @override
  String get syncReadingListening => 'Lesen und Hören synchron halten';

  @override
  String get syncReadingListeningHint =>
      'Für Bücher mit Hörbuch und eBook. Wenn du das Hören beendest, springt das eBook zu der Stelle, an der du aufgehört hast. Wenn du den Reader verlässt, springt das Hörbuch zu deiner Seite. Bewegt sich nur vorwärts.';

  @override
  String get syncEbookMoved =>
      'eBook zur Stelle verschoben, an der du aufgehört hast zu hören';

  @override
  String get syncAudioMoved =>
      'Hörbuch zur Stelle verschoben, an der du aufgehört hast zu lesen';

  @override
  String get syncAudioOffer =>
      'Tippen, um zu der Stelle zu springen, an der du aufgehört hast zu lesen';

  @override
  String get syncFindingAudio => 'Deine Seite im Hörbuch wird gesucht';

  @override
  String get syncFindingEbook => 'Deine Stelle im eBook wird gesucht';

  @override
  String get syncFailed => 'Deine Position konnte nicht synchronisiert werden';

  @override
  String get syncAlreadyTogether => 'Bereits synchron';

  @override
  String get syncPosition => 'Position synchronisieren';

  @override
  String get readAlongFollowHint =>
      'Das Wort-Timing wird zwischen den Zeitstempeln des Transkripts berechnet und kann daher innerhalb eines Satzes leicht abweichen.';

  @override
  String get readAlongFollowWord => 'Wort';

  @override
  String get readAlongFollowSentence => 'Satz';

  @override
  String get readAlongColor => 'Farbe beim Mitlesen';

  @override
  String get readAlongLost =>
      'Die Erzählung wurde auf der Seite nicht gefunden';

  @override
  String get readAlongBackToNarration => 'Zurück zur Erzählung';

  @override
  String get findInEbook => 'Im eBook finden';

  @override
  String get findInEbookSearching => 'Diese Stelle wird im eBook gesucht...';

  @override
  String get findInEbookNotFound =>
      'Diese Stelle wurde im eBook nicht gefunden.';

  @override
  String get findInEbookNeedsEpub =>
      '„Im eBook finden“ braucht ein EPUB-eBook.';

  @override
  String get findInEbookNoEbook => 'Dieses Buch hat kein eBook.';

  @override
  String get findInAudiobook => 'Im Hörbuch finden';

  @override
  String get findInAudiobookSearching =>
      'Suche nach dieser Stelle im Hörbuch...';

  @override
  String get findInAudiobookStillSearching =>
      'Das Audio wird weiter nach dieser Stelle durchsucht...';

  @override
  String get findInAudiobookSearchingLong =>
      'Langes Kapitel, die Suche läuft noch. Das kann ein bis zwei Minuten dauern...';

  @override
  String get findInAudiobookNotFound =>
      'Konnte diese Stelle nicht im Hörbuch finden.';

  @override
  String get transcriptionWhisperInfo =>
      'Transkriptionen werden von Whisper erstellt. Einer Open-Source Spracherkennung. Alles lokal auf diesem Gerät.';

  @override
  String get transcriptionWhisperLearnMore => 'Mehr über Whisper erfahren';

  @override
  String get findInAudiobookIntroBody =>
      'Dies hört das Hörbuch in der Nähe deiner Leseposition ab und ordnet es dieser Passage zu, alles auf deinem Gerät. Es kann bis zu einer Minute dauern. Lässt sich die Stelle nicht sicher zuordnen, bewegt sich nichts.';

  @override
  String get findInAudiobookAfterLabel => 'Wenn die Stelle gefunden ist';

  @override
  String get findInAudiobookStay => 'Weiterlesen';

  @override
  String get findInAudiobookGoPlayer => 'Im Player öffnen';

  @override
  String get findInAudiobookPlaying =>
      'Diese Passage wird im Hörbuch abgespielt';

  @override
  String get catchUpAudioAhead =>
      'Das Hörbuch ist weiter. Tippen, um dorthin zu gehen.';

  @override
  String get catchUpPageAhead =>
      'Diese Seite ist dem Hörbuch voraus. Tippen, um das Hörbuch hierher zu verschieben.';

  @override
  String get readerShortcutButton => 'Kurzbefehl-Taste';

  @override
  String get keepScreenOn => 'Bildschirm eingeschaltet lassen';

  @override
  String get keepScreenOnActive => 'Bildschirm bleibt an';

  @override
  String get keepScreenOnUntilClosed =>
      'Der Bildschirm bleibt an, bis du die App schließt';

  @override
  String get keepScreenOnOff => 'Der Bildschirm kann sich wieder ausschalten';

  @override
  String get keepScreenOnOffUntilRestart =>
      'Aus, bis die App neu startet. Der Schalter in den Einstellungen bleibt an';

  @override
  String get keepScreenOnPlayer => 'Bildschirm im Player eingeschaltet lassen';

  @override
  String get keepScreenOnPlayerSubtitle =>
      'Der Bildschirm bleibt an, solange der Player geöffnet ist';

  @override
  String get keepScreenOnCarMode =>
      'Bildschirm im Automodus eingeschaltet lassen';

  @override
  String get keepScreenOnCarModeSubtitle =>
      'Der Bildschirm bleibt an, solange der Automodus geöffnet ist';

  @override
  String get loginServerType => 'Servertyp';

  @override
  String get authBookOrbitDefaultPassword =>
      'Dieses Konto hat noch sein Standardpasswort. Ändere es in BookOrbit und melde dich dann erneut an.';

  @override
  String get authBookOrbitPasswordOff =>
      'Die Passwort-Anmeldung ist auf diesem Server ausgeschaltet. Melde dich mit einem Magic Link oder per Single Sign-on an.';

  @override
  String get authServerIsBookOrbit =>
      'Dies ist ein BookOrbit-Server. Wähle oben über der Serveradresse BookOrbit.';

  @override
  String get authServerIsAudiobookshelf =>
      'Dies ist ein Audiobookshelf-Server. Wähle oben über der Serveradresse Audiobookshelf.';

  @override
  String get castNotAvailableBookOrbit =>
      'Casting ist mit BookOrbit-Servern nicht verfügbar';

  @override
  String get loginMagicLink => 'Magic Link';

  @override
  String get loginMagicLinkDescription =>
      'Melde dich mit einem BookOrbit-Magic-Link an oder füge einen Passwort-Link ein, um dein Passwort festzulegen.';

  @override
  String get collectionPublicTitle => 'Öffentlich';

  @override
  String get collectionPublicSubtitle =>
      'Alle auf diesem Server können diese Sammlung sehen';

  @override
  String loginSignInWithProvider(String provider) {
    return 'Mit $provider anmelden';
  }

  @override
  String get loginSignInWithSso => 'Mit SSO anmelden';

  @override
  String get loginChooseSsoProvider => 'Wähle, wie du dich anmelden möchtest';

  @override
  String get loginRedirectUriBookOrbit =>
      'Redirect-URI: bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => 'Lesestatus';

  @override
  String get readStatusHint =>
      'BookOrbit behält einen hier gewählten Status, bis du ihn änderst.';

  @override
  String get readStatusUnread => 'Ungelesen';

  @override
  String get readStatusWantToRead => 'Möchte ich lesen';

  @override
  String get readStatusReading => 'Wird gelesen';

  @override
  String get readStatusOnHold => 'Pausiert';

  @override
  String get readStatusRereading => 'Wird erneut gelesen';

  @override
  String get readStatusRead => 'Gelesen';

  @override
  String get readStatusSkimmed => 'Überflogen';

  @override
  String get readStatusAbandoned => 'Abgebrochen';

  @override
  String get personalNoteTitle => 'Deine Notiz';

  @override
  String get personalNoteAdd => 'Private Notiz hinzufügen';

  @override
  String get personalNoteHint => 'Nur du kannst diese Notiz sehen.';

  @override
  String get moreLikeThis => 'Mehr davon';

  @override
  String get coverSlotAudiobook => 'Hörbuch-Cover';

  @override
  String get coverSlotBook => 'Buchcover';

  @override
  String get cardButtonFill => 'Tastenhintergrund';

  @override
  String get cardButtonFillSubtitle =>
      'Wie die Tasten auf der Player-Karte gefüllt sind';

  @override
  String get cardButtonFillClear => 'Transparent';

  @override
  String get cardButtonFillSubtle => 'Dezent';

  @override
  String get cardButtonFillSolid => 'Deckend';

  @override
  String get loginBookOrbitPreview =>
      'Die BookOrbit-Unterstützung ist neu. Wiedergabe, Downloads und Durchsuchen funktionieren, aber manche Ansichten sehen oder verhalten sich noch wie bei Audiobookshelf. Verfolge den Fortschritt auf GitHub und sag uns Bescheid, wenn etwas nicht stimmt.';

  @override
  String get signedOutTapToSignIn =>
      'Abgemeldet. Tippen, um dich erneut anzumelden.';

  @override
  String get authSignedOutKeepListening =>
      'Du wurdest abgemeldet. Downloads werden weiterhin abgespielt. Tippe auf die rote Wolke, um dich erneut anzumelden.';

  @override
  String signedOutSyncNote(String username, String server) {
    return 'Was du abgemeldet hörst, bleibt auf diesem Handy und wird synchronisiert, sobald du dich als $username auf $server wieder anmeldest. Jede Anmeldeart für dieses Konto funktioniert.';
  }

  @override
  String get comicReadingDirection => 'Leserichtung';

  @override
  String comicPageNumber(int page) {
    return 'Seite $page';
  }

  @override
  String get comicBookmarkRemoveFailed =>
      'Das Lesezeichen konnte nicht vom Server entfernt werden. Versuche es erneut, wenn du online bist.';

  @override
  String get comicLeftToRight => 'Von links nach rechts';

  @override
  String get comicRightToLeft => 'Von rechts nach links (Manga)';

  @override
  String get comicNeedsConnection =>
      'Dieser Comic wird seitenweise von deinem Server geöffnet und braucht daher eine Verbindung.';

  @override
  String get comicNoPages => 'In diesem Comic wurden keine Seiten gefunden.';

  @override
  String get boAdminTitle => 'Server-Admin';

  @override
  String get boAdminSubtitle =>
      'Benutzer und Bibliotheken auf diesem BookOrbit-Server';

  @override
  String get boAdminUsers => 'Benutzer';

  @override
  String get boAdminLibraries => 'Bibliotheken';

  @override
  String boAdminUserCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Personen',
      one: '1 Person',
    );
    return '$_temp0';
  }

  @override
  String boAdminLibraryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bibliotheken',
      one: '1 Bibliothek',
    );
    return '$_temp0';
  }

  @override
  String get boAdminSaved => 'Gespeichert';

  @override
  String get boAdminFailed => 'Das hat nicht geklappt. Versuche es erneut.';

  @override
  String get boAdminOffline => 'Der Server ist nicht erreichbar.';

  @override
  String get boUsersSearch => 'Benutzer suchen';

  @override
  String get boUsersNone => 'Keine Benutzer hier';

  @override
  String get boUsersFilterAll => 'Alle';

  @override
  String get boUsersFilterAdmins => 'Admins';

  @override
  String get boUsersFilterActive => 'Aktiv';

  @override
  String get boUsersFilterInactive => 'Inaktiv';

  @override
  String get boUsersFilterAttention => 'Braucht Aufmerksamkeit';

  @override
  String get boUserBadgeAdmin => 'Admin';

  @override
  String get boUserBadgeInactive => 'Inaktiv';

  @override
  String get boUserBadgeLocked => 'Gesperrt';

  @override
  String get boUserBadgeNoPassword => 'Noch kein Passwort';

  @override
  String boUserLastActive(String date) {
    return 'Zuletzt aktiv $date';
  }

  @override
  String get boUserNeverSignedIn => 'Nie angemeldet';

  @override
  String get boUserNew => 'Neuer Benutzer';

  @override
  String get boUserCreate => 'Erstellen';

  @override
  String get boUserUsername => 'Benutzername';

  @override
  String get boUserUsernameHint =>
      'Mindestens 3 Zeichen. Er kann später nicht geändert werden.';

  @override
  String get boUserName => 'Name';

  @override
  String get boUserEmail => 'E-Mail';

  @override
  String get boUserEmailInvalid => 'Gib eine gültige E-Mail-Adresse ein';

  @override
  String get boUserActive => 'Aktiv';

  @override
  String get boUserActiveSubtitle =>
      'Inaktive Benutzer können sich nicht anmelden';

  @override
  String get boUserAdmin => 'Administrator';

  @override
  String get boUserAdminSubtitle => 'Voller Zugriff auf alles auf dem Server';

  @override
  String get boUserAdminHasAll =>
      'Administratoren haben alle Berechtigungen und sehen jede Bibliothek.';

  @override
  String get boUserPermissions => 'Berechtigungen';

  @override
  String get boUserPresetNone => 'Keine';

  @override
  String get boUserPresetStandard => 'Standard';

  @override
  String get boUserPresetEverything => 'Alles';

  @override
  String get boUserLibraries => 'Bibliotheken';

  @override
  String get boUserLibrariesHint =>
      'Die Bibliotheken, die diese Person sehen kann.';

  @override
  String get boUserPasswordLink => 'Passwort-Link senden';

  @override
  String get boUserPasswordLinkSubtitle =>
      'Ein Link zum Festlegen eines neuen Passworts, 15 Minuten gültig';

  @override
  String get boUserExternal =>
      'Meldet sich per Single Sign-on an, daher wird das Passwort dort verwaltet.';

  @override
  String get boUserUnlock => 'Konto entsperren';

  @override
  String get boUserUnlocked => 'Konto entsperrt';

  @override
  String get boUserDelete => 'Benutzer löschen';

  @override
  String boUserDeleteTitle(String name) {
    return '$name löschen?';
  }

  @override
  String get boUserDeleteBody =>
      'Das Konto und alles, was die Person auf diesem Server hat, wird entfernt. Das kann nicht rückgängig gemacht werden.';

  @override
  String get boUserDeleted => 'Benutzer gelöscht';

  @override
  String get boUserLinkTitle => 'Passwort-Link';

  @override
  String boUserLinkBody(String name) {
    return 'Teile diesen Link mit $name. Damit kann ein Passwort festgelegt werden, er funktioniert 15 Minuten.';
  }

  @override
  String get boPasswordRules =>
      'Mindestens 8 Zeichen, mit einem Großbuchstaben, einem Kleinbuchstaben und einer Zahl.';

  @override
  String get boSetPasswordTitle => 'Passwort festlegen';

  @override
  String get boSetPasswordSubmit => 'Passwort festlegen und anmelden';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return 'Wähle ein Passwort für $username auf $server.';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return 'Wähle ein Passwort für dein Konto auf $server.';
  }

  @override
  String get boSetPasswordStartingBody =>
      'Dieses Konto hat noch das Passwort, mit dem es erstellt wurde. Wähle ein neues, um die Anmeldung abzuschließen.';

  @override
  String get boSetPasswordTrust =>
      'Fahre nur fort, wenn du dem Absender dieses Links vertraust.';

  @override
  String get boPasswordLinkExpired =>
      'Dieser Link ist abgelaufen oder wurde bereits verwendet. Bitte deinen Server-Admin um einen neuen.';

  @override
  String boPasswordSetSignInFailed(String error) {
    return 'Dein Passwort ist festgelegt, aber die Anmeldung ist fehlgeschlagen: $error';
  }

  @override
  String get boChangePasswordSubtitle =>
      'Dein BookOrbit-Passwort aktualisieren';

  @override
  String get boPasswordChangeEffect =>
      'Wenn du dein Passwort änderst, werden deine anderen BookOrbit-Sitzungen abgemeldet. Dieses Gerät bleibt angemeldet.';

  @override
  String get boPasswordChanged =>
      'Passwort geändert. Andere angemeldete Geräte wurden abgemeldet.';

  @override
  String boPasswordShareDescription(String username) {
    return 'Sende diesen Link oder lass $username den QR-Code scannen, um ein Passwort zu wählen und sich bei Absorb anzumelden. Er funktioniert 15 Minuten lang.';
  }

  @override
  String boPasswordShareWarning(String username) {
    return 'Jeder mit diesem Link kann das Passwort für $username festlegen, bis er verwendet wird oder abläuft.';
  }

  @override
  String get setupLinkCopyWebLink => 'Web-Link kopieren';

  @override
  String get boUserLinkCopy => 'Link kopieren';

  @override
  String get boUserLinkCopied => 'Link kopiert';

  @override
  String get boUserLinkShare => 'Teilen';

  @override
  String get boUserNoLink =>
      'Der Benutzer wurde hinzugefügt, aber der Server hat keinen Passwort-Link gesendet. Sende einen von seiner Seite aus.';

  @override
  String get boPermGroupLibrary => 'Bibliothek und Bücher';

  @override
  String get boPermGroupRequests => 'Buchanfragen';

  @override
  String get boPermGroupDevices => 'Geräte';

  @override
  String get boPermGroupIntegrations => 'Lese-Integrationen';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => 'E-Mail und Benachrichtigungen';

  @override
  String get boPermGroupAdmin => 'Administration';

  @override
  String get boPermLibraryDownload => 'Bücher herunterladen';

  @override
  String get boPermLibraryUpload => 'Bücher hochladen';

  @override
  String get boPermLibraryEditMetadata => 'Metadaten bearbeiten';

  @override
  String get boPermLibraryDeleteBooks => 'Bücher löschen';

  @override
  String get boPermBookRequestAccess => 'Bücher anfragen';

  @override
  String get boPermBookRequestAutoApprove => 'Anfragen automatisch genehmigt';

  @override
  String get boPermBookRequestSelfFulfill =>
      'Angefragte Bücher direkt herunterladen';

  @override
  String get boPermManageBookRequests => 'Buchanfragen verwalten';

  @override
  String get boPermKoboSync => 'Kobo-Sync';

  @override
  String get boPermKoreaderSync => 'KOReader-Sync';

  @override
  String get boPermOpdsAccess => 'OPDS-Zugriff';

  @override
  String get boPermHardcoverSync => 'Hardcover-Sync';

  @override
  String get boPermReadwiseSync => 'Readwise-Sync';

  @override
  String get boPermStorygraphSync => 'StoryGraph-Sync';

  @override
  String get boPermBookDockAccess => 'Book Dock verwenden';

  @override
  String get boPermManageBookDock => 'Book Dock verwalten';

  @override
  String get boPermEmailSend => 'Bücher per E-Mail senden';

  @override
  String get boPermNotificationAccess => 'Benachrichtigungen';

  @override
  String get boPermManageEmail => 'E-Mail verwalten';

  @override
  String get boPermManageLibraries => 'Bibliotheken verwalten';

  @override
  String get boPermManageMetadataConfig => 'Metadaten-Einstellungen';

  @override
  String get boPermManageIcons => 'Symbole verwalten';

  @override
  String get boPermManageUsers => 'Benutzer verwalten';

  @override
  String get boPermViewUserActivity => 'Benutzeraktivität ansehen';

  @override
  String get boPermViewAuditLog => 'Audit-Protokoll ansehen';

  @override
  String get boPermManageAppSettings => 'App-Einstellungen';

  @override
  String get boLibsNone => 'Noch keine Bibliotheken';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher',
      one: '1 Buch',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => 'Jetzt scannen';

  @override
  String get boLibScanStarted => 'Scan gestartet';

  @override
  String get boLibScanning => 'Wird gescannt';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return 'Gescannt $date: $added hinzugefügt, $updated aktualisiert, $missing fehlend';
  }

  @override
  String get boLibScanFailed => 'Der letzte Scan ist fehlgeschlagen';

  @override
  String get boLibNeverScanned => 'Noch nicht gescannt';

  @override
  String get boLibNew => 'Neue Bibliothek';

  @override
  String get boLibName => 'Name';

  @override
  String get boLibNeedName => 'Gib der Bibliothek einen Namen';

  @override
  String get boLibIcon => 'Symbol';

  @override
  String get boLibFolders => 'Ordner';

  @override
  String get boLibFoldersHint =>
      'Ordner auf dem Server, in denen die Bücher dieser Bibliothek liegen.';

  @override
  String get boLibNeedFolder => 'Füge mindestens einen Ordner hinzu';

  @override
  String get boLibAddFolder => 'Ordner hinzufügen';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '1 Datei',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return 'Bereits in $library';
  }

  @override
  String get boLibFolderUnreadable =>
      'Der Server kann diesen Ordner nicht lesen';

  @override
  String get boLibFolderRescan =>
      'Wenn du die Ordner änderst, wird die Bibliothek neu gescannt.';

  @override
  String get boLibOrganization => 'Bücher werden gespeichert als';

  @override
  String get boLibPerFolder => 'Ein Buch pro Ordner';

  @override
  String get boLibPerFile => 'Ein Buch pro Datei';

  @override
  String get boLibOrganizationFixed =>
      'Das lässt sich nach dem Erstellen der Bibliothek nicht mehr ändern.';

  @override
  String get boLibWatch => 'Auf Änderungen achten';

  @override
  String get boLibWatchSubtitle =>
      'Neue und geänderte Dateien automatisch übernehmen';

  @override
  String get boLibSchedule => 'Geplanter Scan';

  @override
  String get boLibScheduleOff => 'Aus';

  @override
  String get boLibScheduleDaily => 'Täglich';

  @override
  String get boLibScheduleWeekly => 'Wöchentlich';

  @override
  String boLibScheduleCustom(String cron) {
    return 'Benutzerdefiniert ($cron)';
  }

  @override
  String get boLibScheduleHint => 'Läuft um 3 Uhr Serverzeit.';

  @override
  String get boLibCovers => 'Cover-Format';

  @override
  String get boLibCoverBook => 'Buch (2:3)';

  @override
  String get boLibCoverSquare => 'Quadrat (1:1)';

  @override
  String get boLibAccess => 'Wer darf sie sehen';

  @override
  String get boLibAccessHint =>
      'Administratoren sehen jede Bibliothek. Andere benötigen hier Zugriff.';

  @override
  String get boLibAccessNone => 'Bisher nur Administratoren';

  @override
  String get boLibAccessAdd => 'Person hinzufügen';

  @override
  String get boLibAccessEveryoneHas => 'Alle haben bereits Zugriff';

  @override
  String get boLibLevelViewer => 'Betrachter';

  @override
  String get boLibLevelEditor => 'Bearbeiter';

  @override
  String get boLibLevelOwner => 'Besitzer';

  @override
  String get boLibAccessRemove => 'Zugriff entziehen';

  @override
  String get boLibDelete => 'Bibliothek löschen';

  @override
  String boLibDeleteTitle(String name) {
    return '$name löschen?';
  }

  @override
  String get boLibDeleteBody =>
      'Die Bibliothek wird aus BookOrbit entfernt, samt Fortschritt und Markierungen ihrer Bücher. Die Dateien auf dem Server bleiben, wo sie sind.';

  @override
  String get boLibDeleted => 'Bibliothek gelöscht';

  @override
  String get boFolderPickTitle => 'Ordner wählen';

  @override
  String get boFolderUseThis => 'Diesen Ordner verwenden';

  @override
  String get boFolderEmpty => 'Keine Ordner darin';

  @override
  String get statsTotalTime => 'GESAMTZEIT';

  @override
  String get statsTotalReadingTime => 'GESAMTE LESEZEIT';

  @override
  String statsDaysOfTime(String days) {
    return 'Das sind $days Tage';
  }

  @override
  String statsHoursOfTime(String hours) {
    return 'Das sind $hours Stunden';
  }

  @override
  String get statsMediaAll => 'Alle';

  @override
  String get statsMediaListening => 'Hören';

  @override
  String get statsMediaReading => 'Lesen';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'BookOrbit zählt deine Tage in $server, dieses Telefon ist aber auf $phone eingestellt. Zeiten spät am Tag können auf dem falschen Tag landen.';
  }

  @override
  String statsZoneUse(String zone) {
    return '$zone verwenden';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'BookOrbit verwendet jetzt $zone. Ältere Tage können einige Minuten brauchen, bis sie angepasst sind.';
  }

  @override
  String get statsZoneFailed =>
      'Die Zeitzone konnte bei BookOrbit nicht geändert werden';

  @override
  String get statsTimeOfDay => 'Tageszeit';

  @override
  String statsBusiestAround(String time) {
    return 'Am meisten los gegen $time';
  }

  @override
  String get statsFinishedByMonth => 'Beendete Bücher pro Monat';

  @override
  String statsFinishedLast12(int count) {
    return '$count in den letzten 12 Monaten';
  }

  @override
  String get statsWhereTitle => 'Wo du hörst und liest';

  @override
  String get statsLast12Months => 'Letzte 12 Monate';

  @override
  String get statsHabits => 'Gewohnheiten';

  @override
  String get statsTypicalSession => 'Typische Sitzung';

  @override
  String get statsProgressPerSession => 'Fortschritt pro Sitzung';

  @override
  String get statsTimeToFinish => 'Zeit bis zum Beenden';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage',
      one: '1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => 'Begonnene Bücher';

  @override
  String get statsBooksInProgress => 'Angefangen';

  @override
  String get statsAverageProgress => 'Durchschnittlicher Fortschritt';

  @override
  String get statsTopBooks => 'Top-Bücher';

  @override
  String get statsYearRead => 'Gelesen';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ungelesen',
      one: '1 ungelesen',
      zero: 'Nichts Neues',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => 'Alle als gelesen markieren';

  @override
  String get boNotificationsClearAll => 'Alle löschen';

  @override
  String get boNotificationsClearTitle => 'Alle Benachrichtigungen löschen?';

  @override
  String get boNotificationsClearBody =>
      'Dadurch wird jede Benachrichtigung aus deinem BookOrbit-Konto entfernt.';

  @override
  String get boNotificationsEmpty => 'Noch keine Benachrichtigungen';

  @override
  String get boNotificationsLoadFailed =>
      'Benachrichtigungen konnten nicht geladen werden';

  @override
  String get boNotificationsUpdateFailed =>
      'Benachrichtigungen konnten bei BookOrbit nicht aktualisiert werden';

  @override
  String boNotificationsOccurrences(int count) {
    return '$count Mal aufgetreten';
  }

  @override
  String get boNotificationsSettings => 'Benachrichtigungseinstellungen';

  @override
  String get boNotificationsSettingsIntro =>
      'Wähle, welche Benachrichtigungen BookOrbit für dich aufbewahrt.';

  @override
  String get boNotificationsProblemsHint =>
      '„Probleme“ benachrichtigt dich nur, wenn etwas fehlschlägt oder Aufmerksamkeit braucht.';

  @override
  String get boNotificationLevelOff => 'Aus';

  @override
  String get boNotificationLevelProblems => 'Probleme';

  @override
  String get boNotificationLevelAll => 'Alle';

  @override
  String get boNotificationsSaved =>
      'Benachrichtigungseinstellungen gespeichert';

  @override
  String get boNotificationsSaveFailed =>
      'Benachrichtigungseinstellungen konnten nicht gespeichert werden';

  @override
  String get boNotificationGroupLibrary => 'Bibliothek';

  @override
  String get boNotificationGroupFiles => 'Dateien';

  @override
  String get boNotificationGroupIntegrations => 'Integrationen';

  @override
  String get boNotificationGroupPersonal => 'Persönlich';

  @override
  String get boNotifyScanning => 'Bibliotheksscan';

  @override
  String get boNotifyScanningDesc =>
      'Wenn ein Bibliotheksscan endet, fehlschlägt oder fehlende Bücher findet.';

  @override
  String get boNotifyMetadata => 'Metadaten abrufen';

  @override
  String get boNotifyMetadataDesc =>
      'Wenn die Metadatensuche für deine Bücher endet oder fehlschlägt.';

  @override
  String get boNotifyAuthorEnrichment => 'Autorendetails';

  @override
  String get boNotifyAuthorEnrichmentDesc =>
      'Wenn Autorenbiografien und Fotos fertig heruntergeladen sind.';

  @override
  String get boNotifyFileWriteBack => 'In Dateien speichern';

  @override
  String get boNotifyFileWriteBackDesc =>
      'Wenn bearbeitete Details in die Buchdateien auf dem Datenträger gespeichert werden.';

  @override
  String get boNotifyFileRename => 'Dateien umbenennen';

  @override
  String get boNotifyFileRenameDesc =>
      'Wenn eine Buchdatei passend zu deinem Namensmuster umbenannt wird.';

  @override
  String get boNotifyBulkRename => 'Mehrfach umbenennen';

  @override
  String get boNotifyBulkRenameDesc =>
      'Wenn das Umbenennen vieler Bücher oder das Verschieben zwischen Bibliotheken endet oder fehlschlägt.';

  @override
  String get boNotifyMigration => 'Importe';

  @override
  String get boNotifyMigrationDesc =>
      'Wenn ein Import aus einer anderen Bibliotheks-App endet oder fehlschlägt.';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc =>
      'Wenn Book Dock das Hinzufügen von Büchern beendet oder auf Probleme stößt.';

  @override
  String get boNotifyBookRequests => 'Buchanfragen';

  @override
  String get boNotifyBookRequestsDesc =>
      'Wenn eine Buchanfrage gestellt oder entschieden wird oder das Buch verfügbar wird.';

  @override
  String get boNotifyEmail => 'E-Mail-Zustellung';

  @override
  String get boNotifyEmailDesc =>
      'Wenn das Senden eines Buchs per E-Mail klappt oder fehlschlägt.';

  @override
  String get boNotifyAchievements => 'Erfolge';

  @override
  String get boNotifyAchievementsDesc =>
      'Wenn du einen neuen Erfolg freischaltest.';

  @override
  String get achievementsTitle => 'Erfolge';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return '$earned von $total erreicht';
  }

  @override
  String get achievementsFilterAll => 'Alle';

  @override
  String get achievementsFilterEarned => 'Erreicht';

  @override
  String get achievementsFilterInProgress => 'Angefangen';

  @override
  String get achievementsFilterLocked => 'Gesperrt';

  @override
  String get achievementsCategoryReading => 'Lesen';

  @override
  String get achievementsCategoryLibrary => 'Bibliothek';

  @override
  String get achievementsCategoryExploration => 'Entdeckung';

  @override
  String get achievementsCategoryDedication => 'Ausdauer';

  @override
  String get achievementsCategoryDevices => 'Geräte';

  @override
  String get achievementsRarityCommon => 'Häufig';

  @override
  String get achievementsRarityRare => 'Selten';

  @override
  String get achievementsRarityEpic => 'Episch';

  @override
  String get achievementsRarityLegendary => 'Legendär';

  @override
  String get achievementsLoadFailed => 'Erfolge konnten nicht geladen werden';

  @override
  String get achievementsNoneMatch => 'Keine Erfolge entsprechen diesem Filter';

  @override
  String get achievementsSecretName => 'Geheimer Erfolg';

  @override
  String get achievementsSecretHint => 'Lies weiter, um diesen zu enthüllen.';

  @override
  String achievementsEarnedOn(String date) {
    return 'Erreicht $date';
  }

  @override
  String achievementsWhileReading(String title) {
    return 'Beim Lesen von $title';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return 'Stufe $earned von $total';
  }

  @override
  String get achievementsTiers => 'Stufen';

  @override
  String get achievementsAllTiers => 'Alle Stufen erreicht';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold Bücher';
  }

  @override
  String achievementsProgressPages(String current, String threshold) {
    return '$current / $threshold Seiten';
  }

  @override
  String achievementsProgressHours(String current, String threshold) {
    return '$current / $threshold Stunden';
  }

  @override
  String achievementsProgressAnnotations(String current, String threshold) {
    return '$current / $threshold Markierungen und Notizen';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold Bewertungen';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $threshold Genres';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold Sprachen';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold Tage';
  }

  @override
  String get achievementsHowToGetIt => 'So erreichst du es';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Du hast in den letzten $days Tagen $count Stunden gelesen.',
      one: 'Du hast in den letzten $days Tagen 1 Stunde gelesen.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Etwa $count Tage in diesem Tempo.',
      one: 'Etwa 1 Tag in diesem Tempo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Etwa $count Wochen in diesem Tempo.',
      one: 'Etwa 1 Woche in diesem Tempo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Etwa $count Monate in diesem Tempo.',
      one: 'Etwa 1 Monat in diesem Tempo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Bücher aus den ${decade}er-Jahren warten in deinen Regalen.',
      one: '1 Buch aus den ${decade}er-Jahren wartet in deinen Regalen.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Bücher aus den ${century}er-Jahren warten in deinen Regalen.',
      one: '1 Buch aus den ${century}er-Jahren wartet in deinen Regalen.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return '$title ist zu $percent gelesen und wurde am $date begonnen.';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return '$title wurde am $date begonnen.';
  }

  @override
  String get achievementsHintUntitledBook => 'Ein angefangenes Buch';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count angefangene Bücher sind über $percent.',
      one: '1 angefangenes Buch ist über $percent.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher, die du beendet hast, haben noch keine Bewertung.',
      one: '1 Buch, das du beendet hast, hat noch keine Bewertung.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Bücher mit weniger als $pages Seiten warten in deinen Regalen.',
      one: '1 Buch mit weniger als $pages Seiten wartet in deinen Regalen.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sind bereits angefangen.',
      one: '1 ist bereits angefangen.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Bücher mit $pages Seiten oder mehr warten in deinen Regalen.',
      one: '1 Buch mit $pages Seiten oder mehr wartet in deinen Regalen.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count Bücher, die vor $year erschienen sind, warten in deinen Regalen.',
      one: '1 Buch, das vor $year erschienen ist, wartet in deinen Regalen.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author: $finished beendet, $count weitere in deinen Regalen.';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher auf $language warten in deinen Regalen.',
      one: '1 Buch auf $language wartet in deinen Regalen.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Du hast $year bisher in $count Monaten gelesen.',
      one: 'Du hast $year bisher in 1 Monat gelesen.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Noch offen: $months.',
      one: 'Noch offen: $months.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return 'In deinen Regalen steht noch kein Buch mit $pages Seiten oder mehr.';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return 'In deinen Regalen ist nichts vor $year erschienen.';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deine Regale umfassen bisher nur $count Jahrzehnte.',
      one: 'Deine Regale umfassen bisher nur 1 Jahrzehnt.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deine Regale umfassen bisher nur $count Jahrhunderte.',
      one: 'Deine Regale umfassen bisher nur 1 Jahrhundert.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return 'Im $month hast du nicht gelesen, daher ist $year außer Reichweite. Die Zählung beginnt im Januar neu.';
  }

  @override
  String get achievementsSwitch => 'Erfolge';

  @override
  String get achievementsSwitchSubtitle =>
      'Erfolge bei BookOrbit verfolgen. Wenn du das ausschaltest, werden sie hier und im Web ausgeblendet.';

  @override
  String get achievementsTurnedOn => 'Erfolge eingeschaltet';

  @override
  String get achievementsTurnedOff => 'Erfolge ausgeschaltet';

  @override
  String get achievementsSwitchFailed =>
      'Erfolge konnten bei BookOrbit nicht geändert werden';

  @override
  String get boNotifyReadAlong => 'Read alongs';

  @override
  String get boNotifyReadAlongDesc =>
      'When a read along you started is ready, needs a look, or fails.';

  @override
  String get readAlongCreate => 'Create read along';

  @override
  String get readAlongLoadFailed =>
      'Couldn\'t check whether a read along can be made for this book.';

  @override
  String get readAlongCheckAgain => 'Check again';

  @override
  String get readAlongWhyWorkerOffline =>
      'BookOrbit\'s read along worker is offline right now.';

  @override
  String get readAlongWhyWorkerOutdated =>
      'BookOrbit\'s read along worker needs an update to work with this server.';

  @override
  String get readAlongWhyFilesMissing =>
      'Restore this book\'s missing files to make a read along.';

  @override
  String get readAlongWhyNoEpub =>
      'Add a plain EPUB to this book to make a read along.';

  @override
  String get readAlongWhyNoEpubHasOne =>
      'This book already has a read along and no plain EPUB to make another from.';

  @override
  String get readAlongWhyTooManyTracks =>
      'This audiobook has more files than a read along can be made from.';

  @override
  String get readAlongWhyEpubNotAllowed =>
      'This library doesn\'t take EPUB files, so a read along can\'t be added.';

  @override
  String get readAlongWhyNotMounted =>
      'BookOrbit\'s read along worker can\'t reach this library\'s folder.';

  @override
  String get readAlongWhyRunning =>
      'A read along is already being made for this book.';

  @override
  String get readAlongWhyUnknown =>
      'A read along can\'t be made for this book right now.';

  @override
  String get readAlongSheetTitle => 'Create a read along';

  @override
  String get readAlongSheetIntro =>
      'BookOrbit matches the narration to the ebook text and adds an EPUB that highlights along with the audio.';

  @override
  String get readAlongEbook => 'Ebook';

  @override
  String get readAlongEbookHint =>
      'Pick the plain EPUB that matches the narration.';

  @override
  String get readAlongAudio => 'Audiobook';

  @override
  String readAlongTracks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tracks',
      one: '1 track',
    );
    return '$_temp0';
  }

  @override
  String readAlongExistingTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'This book already has $count read alongs',
      one: 'This book already has a read along',
    );
    return '$_temp0';
  }

  @override
  String readAlongReplace(String name) {
    return 'Replace $name';
  }

  @override
  String readAlongKeepBoth(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Keep all of them',
      one: 'Keep both',
    );
    return '$_temp0';
  }

  @override
  String get readAlongKeepHint =>
      'The new read along is added as another file.';

  @override
  String get readAlongReplaceHint =>
      'The old file is only replaced once the new one passes its checks, and reading spots carry over.';

  @override
  String get readAlongReplaceNotAllowed =>
      'Replacing a read along needs permission to delete books, so the new one is added as another file.';

  @override
  String get readAlongMadeByBookOrbit => 'Made by BookOrbit';

  @override
  String get readAlongImported => 'Imported';

  @override
  String get readAlongLanguage => 'Narration language';

  @override
  String get readAlongPickLanguage => 'Choose a language';

  @override
  String readAlongLanguageUnsupported(String language) {
    return 'The speech model doesn\'t know this book\'s language ($language).';
  }

  @override
  String get readAlongLanguageFromBook => 'From this book\'s details.';

  @override
  String get readAlongLanguageIsDefault => 'Your default language.';

  @override
  String get readAlongLanguageSaved => 'Saved as your default language.';

  @override
  String get readAlongSetDefault => 'Set as default';

  @override
  String get readAlongDefaultFailed => 'Couldn\'t save your default language.';

  @override
  String get readAlongHighlighting => 'Highlighting';

  @override
  String get readAlongSentence => 'Sentence';

  @override
  String get readAlongSentenceHint =>
      'Highlights one sentence at a time. Recommended.';

  @override
  String get readAlongWord => 'Word';

  @override
  String get readAlongWordHint =>
      'Highlights each word. Takes longer and makes a bigger file. Still experimental.';

  @override
  String readAlongEstimatedSize(String size) {
    return 'Estimated size: $size';
  }

  @override
  String get readAlongBackgroundNote =>
      'Runs on the server, so you can close this. Long audiobooks can take hours, and the first run for a language downloads its speech model.';

  @override
  String readAlongLowDisk(String needed, String free) {
    return 'Low disk space: this needs about $needed of working space on the worker, which has $free free.';
  }

  @override
  String get readAlongStart => 'Start';

  @override
  String get readAlongStartFailed =>
      'The read along couldn\'t be started. Try again.';

  @override
  String get readAlongStartInvalid =>
      'Some of the picked files are no longer on this book. Check them and try again.';

  @override
  String get readAlongStartOffline =>
      'BookOrbit\'s read along worker is offline. Try again later.';

  @override
  String get readAlongNotAllowed => 'You don\'t have permission to do that.';

  @override
  String get readAlongGone => 'This read along job is gone.';

  @override
  String get readAlongMovedOn =>
      'This job had already moved on. It now shows where it is.';

  @override
  String get readAlongActionFailed => 'That didn\'t go through. Try again.';

  @override
  String readAlongStartedBy(String name) {
    return 'Started by $name';
  }

  @override
  String get readAlongStartedByOther => 'Started by another user';

  @override
  String get readAlongWaiting => 'Waiting to start';

  @override
  String get readAlongNextInLine => 'Next in line';

  @override
  String readAlongJobsAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jobs ahead',
      one: '1 job ahead',
    );
    return '$_temp0';
  }

  @override
  String get readAlongStopping => 'Stopping';

  @override
  String get readAlongStoppingHint =>
      'Finishing the current step, then it stops. Nothing will be added to this book.';

  @override
  String get readAlongStagePreparingAudio => 'Preparing the audio';

  @override
  String get readAlongStageDownloadingModel => 'Downloading the speech model';

  @override
  String get readAlongStageListening => 'Listening to the narration';

  @override
  String get readAlongStageMarkingUp => 'Marking up the ebook text';

  @override
  String get readAlongStageAligning => 'Matching the text to the narration';

  @override
  String get readAlongStageChecking => 'Checking the result';

  @override
  String get readAlongStagePublishing => 'Adding the read along to this book';

  @override
  String get readAlongStageWorking => 'Working';

  @override
  String readAlongFileOf(int current, int total) {
    return 'File $current of $total';
  }

  @override
  String readAlongTrackOf(int current, int total) {
    return 'Track $current of $total';
  }

  @override
  String readAlongChapterOf(int current, int total) {
    return 'Chapter $current of $total';
  }

  @override
  String readAlongStepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get readAlongFirstRun => 'First run for this language';

  @override
  String get readAlongJustStarted => 'Just started';

  @override
  String readAlongRunningFor(String duration) {
    return 'Running for $duration';
  }

  @override
  String get readAlongStepAudio => 'Audio';

  @override
  String get readAlongStepSpeech => 'Speech';

  @override
  String get readAlongStepText => 'Text';

  @override
  String get readAlongStepAlign => 'Align';

  @override
  String get readAlongStepCheck => 'Check';

  @override
  String get readAlongStepAdd => 'Add';

  @override
  String get readAlongReviewTitle => 'Ready for review';

  @override
  String readAlongReviewMatched(String percent) {
    return '$percent of the text matched the narration. Check it before adding it to the book.';
  }

  @override
  String get readAlongReviewPlain => 'Check it before adding it to the book.';

  @override
  String get readAlongReviewWeb =>
      'To leave chapters out and match again, open this book in BookOrbit on the web.';

  @override
  String readAlongReviewExpires(String date) {
    return 'Thrown away on its own on $date unless you review it.';
  }

  @override
  String get readAlongAddAnyway => 'Add it anyway';

  @override
  String get readAlongDiscard => 'Discard';

  @override
  String get readAlongDiscardPrompt => 'Discard this read along?';

  @override
  String get readAlongKeepIt => 'Keep it';

  @override
  String get readAlongReady => 'Read along ready';

  @override
  String get readAlongReadyWarnings => 'Read along ready, with warnings';

  @override
  String get readAlongAdded => 'Added to this book as a new EPUB.';

  @override
  String get readAlongReplaced =>
      'Replaced the old read along. Reading spots carry over.';

  @override
  String readAlongMatchedSentences(String matched, String total) {
    return '$matched of $total sentences matched the narration';
  }

  @override
  String readAlongAudioUsed(String percent) {
    return '$percent of the audio used';
  }

  @override
  String readAlongOutside(String chapters) {
    return 'Not in the narration, so left without audio: $chapters.';
  }

  @override
  String readAlongOutsideMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more chapters',
      one: '1 more chapter',
    );
    return '$_temp0';
  }

  @override
  String get readAlongWarnUnaligned =>
      'One or more audio tracks couldn\'t be matched.';

  @override
  String get readAlongWarnUnmatched =>
      'A noticeable amount of the ebook text wasn\'t matched to the narration.';

  @override
  String get readAlongWarnInterpolated =>
      'Some text timing was estimated between confident matches.';

  @override
  String get readAlongWarnDropped =>
      'Some ebook text was left out of the highlighting.';

  @override
  String get readAlongFailed => 'Read along failed';

  @override
  String get readAlongCancelled => 'Read along cancelled';

  @override
  String get readAlongDiscarded => 'Read along thrown away';

  @override
  String get readAlongNothingAdded => 'Nothing was added to this book.';

  @override
  String get readAlongExpired =>
      'It wasn\'t reviewed within 14 days, so nothing was added to this book.';

  @override
  String readAlongRetryUntil(String date) {
    return 'Retry picks up from the last finished step until $date.';
  }

  @override
  String get readAlongStartOver => 'Start over';

  @override
  String get readAlongCancel => 'Cancel read along';

  @override
  String get readAlongCancelPrompt => 'Cancel this read along?';

  @override
  String get readAlongKeepRunning => 'Keep running';

  @override
  String get readAlongErrorWorkerOffline =>
      'BookOrbit couldn\'t reach its read along worker.';

  @override
  String get readAlongErrorWorkerCrashed =>
      'The read along worker stopped unexpectedly.';

  @override
  String get readAlongErrorSourceMissing => 'A picked file is no longer there.';

  @override
  String get readAlongErrorSourceChanged =>
      'A picked file changed after the job started.';

  @override
  String get readAlongErrorInvalidSource =>
      'The EPUB or audiobook couldn\'t be read.';

  @override
  String get readAlongErrorLanguage =>
      'The speech model doesn\'t know the picked language.';

  @override
  String get readAlongErrorStorage =>
      'There isn\'t enough free disk space on the worker to finish.';

  @override
  String get readAlongErrorAudio => 'The audiobook couldn\'t be prepared.';

  @override
  String get readAlongErrorModel => 'The speech model couldn\'t be downloaded.';

  @override
  String get readAlongErrorListening =>
      'Speech recognition failed while listening to the narration.';

  @override
  String get readAlongErrorMarkup =>
      'The ebook text couldn\'t be prepared for matching.';

  @override
  String get readAlongErrorAlignment =>
      'The text couldn\'t be matched to the narration.';

  @override
  String get readAlongErrorOutput => 'The new EPUB failed its checks.';

  @override
  String get readAlongErrorPublish =>
      'The new EPUB couldn\'t be added to this book.';

  @override
  String get readAlongErrorDiscarded => 'It was thrown away at review.';

  @override
  String get readAlongErrorCancelled => 'It was cancelled.';

  @override
  String get readAlongErrorUnknown =>
      'Something went wrong while making the read along.';

  @override
  String get fileInfoNoAudiobook => 'No audiobook yet';

  @override
  String get fileInfoNoEbook => 'No e-book yet';

  @override
  String get fileInfoRequestedBySomeone => 'Requested by someone else';

  @override
  String get fileInfoOwnedSeparately => 'In your library as a separate book';

  @override
  String get fileInfoCopyPath => 'Copy path';

  @override
  String get fileInfoDeleteTitle => 'Delete file?';

  @override
  String fileInfoDeletePrompt(String name) {
    return '\"$name\" will be deleted from the server. This can\'t be undone.';
  }

  @override
  String get fileInfoDeleteLast =>
      'It\'s the book\'s last audio or e-book file, so the book will show as missing.';

  @override
  String get fileInfoDeleteNotAllowed =>
      'You don\'t have permission to delete files';

  @override
  String get chapterSourceEmbedded => 'Read from the audio files';

  @override
  String get chapterSourceTracks => 'One chapter per audio file, not saved';

  @override
  String get chapterSourceProvider => 'From fetched metadata';

  @override
  String get chapterSourceMigration => 'Imported from Audiobookshelf';

  @override
  String get chapterSourceManual => 'Edited in BookOrbit';

  @override
  String chapterSourceManualBy(String name) {
    return 'Edited by $name';
  }

  @override
  String get chapterSourceNone => 'No chapters yet';

  @override
  String get chapterProtected => 'Protected from rescans';

  @override
  String get chapterNotProtected => 'A rescan can replace these';

  @override
  String get chapterProtectOnSave => 'Protect from rescans';

  @override
  String get chapterGetFrom => 'Get Chapters From';

  @override
  String get chapterFromFiles => 'The audio files';

  @override
  String get chapterFromEbookToc => 'The e-book\'s contents';

  @override
  String get chapterFromReadAlong => 'The read along';

  @override
  String get chapterFromHistory => 'Earlier versions';

  @override
  String get chapterHistoryTitle => 'Earlier versions';

  @override
  String get chapterHistoryEmpty => 'Saved versions show up here.';

  @override
  String chapterHistoryBy(String source, String name) {
    return '$source by $name';
  }

  @override
  String get chapterReadingFiles => 'Reading the audio files...';

  @override
  String get chapterRevertToFiles => 'Revert to Files';

  @override
  String get chapterRevertTitle => 'Go back to the chapters in the files?';

  @override
  String get chapterRevertMessage =>
      'BookOrbit reads the chapters in the audio files again and stops protecting them from rescans. Unsaved edits are lost. The current list stays in the earlier versions.';

  @override
  String get chapterReverted => 'Chapters set back to the audio files';

  @override
  String get chapterWriteFiles => 'Write to Files';

  @override
  String get chapterWriteTitle => 'Write the chapters into the audio files?';

  @override
  String chapterWriteMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'This rewrites the book\'s $count audio files with these chapters.',
      one: 'This rewrites the book\'s audio file with these chapters.',
    );
    return '$_temp0 The audio itself is copied unchanged. Phones that already downloaded the book keep their copy until it\'s downloaded again.';
  }

  @override
  String get chapterWriteConfirm => 'Write';

  @override
  String get chapterWriting => 'Writing the chapters into the audio files...';

  @override
  String chapterWritten(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chapters written into all $count audio files',
      one: 'Chapters written into the audio file',
    );
    return '$_temp0';
  }

  @override
  String chapterWrittenPartly(int written, int total) {
    return 'Chapters written into $written of $total files. The rest were left as they were.';
  }

  @override
  String get chapterStaleTitle => 'These chapters changed';

  @override
  String get chapterStaleMessage =>
      'Someone else saved these chapters after you opened them. Reload to see their version. Your edits stay until you do.';

  @override
  String get chapterReload => 'Reload';

  @override
  String get chapterKeepEditing => 'Keep editing';

  @override
  String get matchExplicitYes => 'Marked explicit';

  @override
  String get matchExplicitNo => 'Not explicit';

  @override
  String get matchAbridgedYes => 'Abridged';

  @override
  String get matchAbridgedNo => 'Unabridged';

  @override
  String boQuickMatchBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'these $count books',
      one: 'this book',
    );
    return 'BookOrbit looks up $_temp0 and fills in what it finds, following its metadata settings.';
  }

  @override
  String get boQuickMatchIgnoreCache => 'Ask every source again';

  @override
  String get boQuickMatchIgnoreCacheHint =>
      'Skips saved answers. Slower, and uses more of each source\'s request limit.';

  @override
  String boAdminServerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mail servers',
      one: '1 mail server',
      zero: 'None yet',
    );
    return '$_temp0';
  }

  @override
  String get boEmailTitle => 'Send by email';

  @override
  String get boEmailSubtitle =>
      'Devices, mail servers and templates for sending books';

  @override
  String get boEmailTabDevices => 'Devices';

  @override
  String get boEmailTabServers => 'Mail servers';

  @override
  String get boEmailTabTemplates => 'Templates';

  @override
  String get boEmailTabHistory => 'History';

  @override
  String get boEmailName => 'Name';

  @override
  String boEmailDeleteTitle(String name) {
    return 'Delete $name?';
  }

  @override
  String get boEmailMakeDefault => 'Make default';

  @override
  String get boEmailBadgeDefault => 'Default';

  @override
  String get boEmailBadgeShared => 'Shared';

  @override
  String get boEmailBadgeSystem => 'Password resets';

  @override
  String get boEmailBadgeBuiltIn => 'Built in';

  @override
  String get boEmailDevicesEmpty =>
      'No devices yet. Add your e-reader\'s email address to send it books.';

  @override
  String get boEmailAddDevice => 'Add device';

  @override
  String get boEmailNewDevice => 'New device';

  @override
  String get boEmailDeviceNameHint => 'My Kindle';

  @override
  String get boEmailDeviceAddress => 'Email address';

  @override
  String get boEmailDeviceType => 'Device';

  @override
  String get boEmailDeviceNone => 'Person or inbox';

  @override
  String get boEmailDeviceKindle => 'Kindle';

  @override
  String get boEmailDeviceKobo => 'Kobo';

  @override
  String get boEmailDeviceOther => 'Other e-reader';

  @override
  String get boEmailKindleHint =>
      'Kindle gets the subject \"convert\" and only takes EPUB and PDF by email.';

  @override
  String boEmailKindleApprove(String address) {
    return 'Kindle drops mail from addresses it doesn\'t know. In Amazon\'s Personal Document Settings, add $address to the approved list.';
  }

  @override
  String get boEmailKindleApproveNoServer =>
      'Add a mail server first to see the address Kindle needs to approve.';

  @override
  String get boEmailFormat => 'Format';

  @override
  String get boEmailFormatPrimary => 'Book\'s main file';

  @override
  String get boEmailFormatHint =>
      'A book without this format gets its main file.';

  @override
  String get boEmailReadAlong => 'Read along books';

  @override
  String get boEmailReadAlongAuto => 'Automatic';

  @override
  String get boEmailReadAlongAutoHint =>
      'Text only when a copy can be made, otherwise the original.';

  @override
  String get boEmailReadAlongText => 'Text only';

  @override
  String get boEmailReadAlongTextHint =>
      'Narration removed. Small enough for email.';

  @override
  String get boEmailReadAlongOriginal => 'With narration';

  @override
  String get boEmailReadAlongOriginalHint =>
      'Keeps the narration. Often 100 MB or more, over most mail servers\' limits.';

  @override
  String get boEmailTemplate => 'Template';

  @override
  String get boEmailTemplateYourDefault => 'Your default';

  @override
  String get boEmailTemplateKindleHint =>
      'Kindle never shows the message, so it skips the template.';

  @override
  String get boEmailDefaultDevice => 'Default device';

  @override
  String get boEmailDefaultDeviceHint => 'Picked first when you send a book.';

  @override
  String get boEmailSendTest => 'Send a test email';

  @override
  String get boEmailTestSubject => 'Test email from Absorb';

  @override
  String boEmailTestBody(String name) {
    return 'This is a test from Absorb. If you can read it, books sent to $name will arrive here too.';
  }

  @override
  String boEmailTestSent(String name) {
    return 'Test email sent to $name';
  }

  @override
  String boEmailTestFailed(String error) {
    return 'The test email didn\'t go out: $error';
  }

  @override
  String get boEmailDeleteDevice => 'Delete device';

  @override
  String get boEmailDeleteDeviceBody => 'Its send history stays.';

  @override
  String get boEmailDeviceRequired => 'Enter a name and an email address';

  @override
  String get boEmailLastSendFailed => 'Last send failed';

  @override
  String get boEmailGroups => 'Groups';

  @override
  String get boEmailGroupsHint => 'Send to several devices at once.';

  @override
  String get boEmailNewGroup => 'New group';

  @override
  String get boEmailGroupNameHint => 'Book club';

  @override
  String get boEmailGroupMembers => 'Devices in this group';

  @override
  String get boEmailGroupMembersEmpty => 'Add a device first.';

  @override
  String boEmailGroupMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count devices',
      one: '1 device',
      zero: 'No devices',
    );
    return '$_temp0';
  }

  @override
  String get boEmailDeleteGroup => 'Delete group';

  @override
  String get boEmailDeleteGroupBody => 'The devices in it stay.';

  @override
  String get boEmailGroupRequired => 'Enter a group name';

  @override
  String get boEmailServersEmptyManage =>
      'No mail servers yet. Add one to start sending books.';

  @override
  String get boEmailServersEmpty =>
      'No mail servers yet. Ask an admin to add one.';

  @override
  String get boEmailAddServer => 'Add mail server';

  @override
  String get boEmailNewServer => 'New mail server';

  @override
  String get boEmailServerPresetOther => 'Other';

  @override
  String get boEmailServerPresetHint =>
      'A preset fills in the host, port and security. You can still change them.';

  @override
  String get boEmailServerHost => 'Host';

  @override
  String get boEmailServerPort => 'Port';

  @override
  String get boEmailServerSecurity => 'Security';

  @override
  String get boEmailServerSecurityNone => 'None';

  @override
  String get boEmailServerSecurityHint =>
      'STARTTLS on port 587, SSL/TLS on 465.';

  @override
  String get boEmailServerNeedsPassword => 'Signs in with a password';

  @override
  String get boEmailServerUsername => 'Username';

  @override
  String get boEmailServerPassword => 'Password';

  @override
  String get boEmailServerAppPassword => 'App password';

  @override
  String get boEmailServerPasswordKeep => 'Saved. Type to replace it';

  @override
  String get boEmailServerAppPasswordHint =>
      'Gmail and iCloud need an app password, not your account password.';

  @override
  String get boEmailServerFromName => 'From name';

  @override
  String get boEmailServerFromAddress => 'From address';

  @override
  String get boEmailServerFromAddressHint =>
      'Kindle owners need to approve this address.';

  @override
  String get boEmailServerShare => 'Share with everyone';

  @override
  String get boEmailServerShareHint =>
      'Other people can send books through this server without seeing the password.';

  @override
  String get boEmailServerSystem => 'Send password resets and sign-in links';

  @override
  String get boEmailServerSystemHint =>
      'The server BookOrbit uses for its own mail.';

  @override
  String get boEmailServerVerifyTls => 'Check the server\'s certificate';

  @override
  String get boEmailServerVerifyTlsHint =>
      'Turn this off only for a server on your own network with a self-signed certificate.';

  @override
  String get boEmailServerTest => 'Test connection';

  @override
  String get boEmailServerTestSaveFirst => 'Save first, then test';

  @override
  String get boEmailServerTestOk => 'Connected';

  @override
  String boEmailServerTestFailed(String error) {
    return 'Can\'t connect: $error';
  }

  @override
  String get boEmailServerDelete => 'Delete mail server';

  @override
  String get boEmailServerDeleteBody => 'Everyone it\'s shared with loses it.';

  @override
  String get boEmailServerSystemFirst =>
      'Turn off password resets on this server before deleting it.';

  @override
  String get boEmailServerRequired => 'Enter a name and a host';

  @override
  String get boEmailServerNotYours =>
      'Someone else added this server. Only they can change it.';

  @override
  String get boEmailTemplatesEmpty => 'No templates yet.';

  @override
  String get boEmailNewTemplate => 'New template';

  @override
  String get boEmailTemplateSubject => 'Subject';

  @override
  String get boEmailTemplateMessage => 'Message';

  @override
  String get boEmailTemplateInsert => 'Insert';

  @override
  String get boEmailTemplateInsertHint =>
      'Goes in where the cursor is. Details a book doesn\'t have print nothing.';

  @override
  String get boEmailVarBook => 'Book';

  @override
  String get boEmailVarFile => 'File';

  @override
  String get boEmailVarOther => 'Other';

  @override
  String get boEmailTemplatePreview => 'Preview';

  @override
  String get boEmailTemplatePreviewNone =>
      'Send a book once to preview a template with it.';

  @override
  String boEmailTemplateAttached(String name) {
    return 'Attached: $name';
  }

  @override
  String get boEmailTemplateBuiltIn => 'Built in. Only an admin can change it.';

  @override
  String get boEmailTemplateKindleNote =>
      'Kindle never shows a template. It always gets the subject \"convert\".';

  @override
  String get boEmailTemplateDelete => 'Delete template';

  @override
  String get boEmailTemplateDeleteBody =>
      'Devices that use it go back to your default template.';

  @override
  String get boEmailTemplateRequired => 'Enter a name and a subject';

  @override
  String get boEmailHistoryEmpty => 'Nothing sent yet.';

  @override
  String get boEmailHistoryAll => 'All';

  @override
  String get boEmailHistoryEveryone => 'Everyone';

  @override
  String get boEmailStatusSent => 'Sent';

  @override
  String get boEmailStatusSending => 'Sending';

  @override
  String boEmailStatusRetrying(int attempt) {
    return 'Trying again ($attempt)';
  }

  @override
  String get boEmailStatusFailed => 'Failed';

  @override
  String boEmailTo(String name) {
    return 'To $name';
  }

  @override
  String get boEmailResend => 'Send again';

  @override
  String get boEmailResent => 'Sending again';

  @override
  String get boEmailForget => 'Remove from history';

  @override
  String get boEmailLoadMore => 'Load more';

  @override
  String get boEmailUnknownBook => 'Deleted book';

  @override
  String get boEmailSendNoServer =>
      'No mail server is set up on this server yet.';

  @override
  String get boEmailSendAskAdmin => 'Ask an admin to add one.';

  @override
  String get boEmailSendNoDevices => 'Add a device to send this book to.';

  @override
  String get boEmailSendOptions => 'Options';

  @override
  String get boEmailSendFormatEach => 'Each device\'s own';

  @override
  String get boEmailSendServer => 'Mail server';

  @override
  String get boEmailSendButton => 'Send';

  @override
  String boEmailSendGets(String format, String size) {
    return 'Gets $format · $size';
  }

  @override
  String boEmailSendMissing(String format, String got) {
    return 'No $format, gets the $got';
  }

  @override
  String boEmailSendKindleRejects(String format) {
    return 'Kindle doesn\'t take $format by email';
  }

  @override
  String boEmailSendOverKindle(String size) {
    return '$size, over Kindle\'s 50 MB limit';
  }

  @override
  String boEmailSendOverGmail(String size) {
    return '$size, over Gmail\'s 25 MB limit';
  }

  @override
  String boEmailSendNarrated(String size) {
    return 'Gets the narrated copy · $size';
  }

  @override
  String boEmailSendHanding(String server) {
    return 'Sending through $server';
  }

  @override
  String boEmailSendAccepted(String server) {
    return 'Sent through $server';
  }

  @override
  String boEmailSendFailedLine(String error) {
    return 'Didn\'t send: $error';
  }

  @override
  String get boEmailSendStillGoing =>
      'Still sending. You\'ll get a notification when it\'s done.';

  @override
  String get boEmailKindleOriginal =>
      'A Kindle can\'t take the narrated copy. Set it to text only.';

  @override
  String get boEmailNoCopy => 'Couldn\'t make a copy without the narration.';

  @override
  String get recentSearchesTitle => 'Letzte Suchen';

  @override
  String get recentSearchesClear => 'Zurücksetzen';

  @override
  String get recentSearchesRemove => 'Entfernen';

  @override
  String get removedSeriesTapToUndo =>
      'Aus „Serie fortsetzen“ entfernt. Tippen zum Rückgängigmachen.';

  @override
  String get seriesBackOnContinueSeries => 'Wieder bei „Serie fortsetzen“';

  @override
  String get desktopShortcutPlayPause => 'Wiedergabe / Pause';

  @override
  String get desktopShortcutRewind => 'Zurückspulen';

  @override
  String get desktopShortcutForward => 'Vorspulen';

  @override
  String get desktopShortcutSlower => 'Wiedergabegeschwindigkeit verringern';

  @override
  String get desktopShortcutFaster => 'Wiedergabegeschwindigkeit erhöhen';

  @override
  String get desktopShortcutNormalSpeed =>
      'Wiedergabegeschwindigkeit zurücksetzen';

  @override
  String get desktopShortcutSearch => 'Suche öffnen';

  @override
  String get desktopShortcutLibrary => 'Bibliothek öffnen';

  @override
  String get desktopShortcutNowPlaying => 'Aktuelle Wiedergabe öffnen';

  @override
  String get desktopShortcutFullScreen => 'Vollbild';

  @override
  String get desktopShortcutClosePlayer => 'Den Vollbild-Player schließen';

  @override
  String get desktopShortcutBack =>
      'Zurück (oberste Seite oder Ansicht schließen)';

  @override
  String get desktopShortcutRefresh =>
      'Die Liste auf dem Bildschirm aktualisieren';

  @override
  String get desktopShortcutPreviousCard => 'Vorherige Absorbing-Karte';

  @override
  String get desktopShortcutNextCard => 'Nächste Absorbing-Karte';

  @override
  String get desktopShortcutContextMenu => 'Das Menü für langes Drücken öffnen';

  @override
  String get desktopShortcutMouseBack => 'Zurück-Taste der Maus';

  @override
  String get desktopShortcutRightClick => 'Rechtsklick';

  @override
  String get desktopShortcutDragShelves => 'Regale und Karten seitlich ziehen';

  @override
  String get desktopShortcutMouseDrag => 'Klicken und ziehen';

  @override
  String get fileHealthAction => 'Dateien prüfen';

  @override
  String get fileHealthTitle => 'Dateien prüfen';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alle $count Dateien sehen gut aus',
      one: 'Die Datei sieht gut aus',
      zero: 'Nichts sieht falsch aus',
    );
    return '$_temp0';
  }

  @override
  String fileHealthProblems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Probleme gefunden',
      one: '1 Problem gefunden',
    );
    return '$_temp0';
  }

  @override
  String get fileHealthReadOnlyNote =>
      'Dies liest nur, was der Server bereits meldet. Es wird nichts geändert.';

  @override
  String get fileHealthLocalChecked =>
      'Heruntergeladene Dateien auf diesem Gerät wurden ebenfalls geprüft.';

  @override
  String get fileHealthItemMissing => 'Buchordner fehlt';

  @override
  String get fileHealthItemMissingInfo =>
      'Der Server findet den Ordner dieses Buchs nicht mehr. Er wurde möglicherweise verschoben, umbenannt oder gelöscht, oder sein Laufwerk ist offline. Ein Bibliotheks-Scan auf dem Server kann ihn wiederfinden.';

  @override
  String get fileHealthItemInvalid => 'Buch als ungültig markiert';

  @override
  String get fileHealthItemInvalidInfo =>
      'Der Server hat für dieses Buch keine brauchbaren Audio- oder eBook-Dateien gefunden.';

  @override
  String get fileHealthInvalidFiles => 'Nicht lesbare Dateien';

  @override
  String get fileHealthInvalidFilesInfo =>
      'Der Server konnte diese Dateien nicht lesen. Sie sind möglicherweise beschädigt oder in einem nicht unterstützten Format, und die Wiedergabe kann dort stoppen oder springen.';

  @override
  String get fileHealthEmptyFiles => 'Dateien ohne Länge';

  @override
  String get fileHealthEmptyFilesInfo =>
      'Diese Dateien melden eine Länge von null, daher gibt es darin nichts abzuspielen. Oft sind sie leer oder abgeschnitten.';

  @override
  String get fileHealthTrackGaps => 'Lücken zwischen Dateien';

  @override
  String get fileHealthTrackGapsInfo =>
      'Die Zeitleiste des Buchs springt zwischen diesen Dateien vor und lässt eine Stelle, an der nichts abgespielt wird.';

  @override
  String get fileHealthTrackOverlaps => 'Überlappende Dateien';

  @override
  String get fileHealthTrackOverlapsInfo =>
      'Diese Dateien überlappen sich in der Zeitleiste des Buchs, daher kann ein Teil übersprungen werden oder die Position springen.';

  @override
  String get fileHealthDurationMismatch => 'Länge stimmt nicht';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return 'Die Dateien ergeben zusammen $actual, aber das Buch gibt $expected an. Fortschritt und Kapitel können abweichen. Ein erneuter Scan auf dem Server behebt das meist.';
  }

  @override
  String get fileHealthLowBitrate => 'Audio in niedriger Qualität';

  @override
  String get fileHealthLowBitrateInfo =>
      'Diese Dateien sind mit weniger als 32 kbps kodiert und klingen möglicherweise dumpf.';

  @override
  String get fileHealthMixedSampleRates => 'Gemischte Abtastraten';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      'Die Dateien wurden mit unterschiedlichen Abtastraten aufgenommen. Die meisten Player kommen damit klar, manche knacken aber oder ändern die Geschwindigkeit, wo eine Datei endet und die nächste beginnt.';

  @override
  String get fileHealthMixedChannels => 'Mono und Stereo gemischt';

  @override
  String get fileHealthMixedChannelsInfo =>
      'Manche Dateien haben eine andere Kanalanzahl als andere, daher kann sich der Klang zwischen den Dateien ändern.';

  @override
  String get fileHealthChaptersPastEnd => 'Kapitel nach dem Ende';

  @override
  String get fileHealthChaptersPastEndInfo =>
      'Diese Kapitel beginnen oder enden, nachdem das Audio zu Ende ist, daher führt der Sprung dorthin ins Leere.';

  @override
  String get fileHealthLocalMissing => 'Heruntergeladene Dateien fehlen';

  @override
  String get fileHealthLocalMissingInfo =>
      'Diese heruntergeladenen Dateien sind nicht mehr auf diesem Gerät. Die Offline-Wiedergabe schlägt an diesen Stellen fehl.';

  @override
  String get fileHealthLocalSizeMismatch =>
      'Heruntergeladene Dateien weichen ab';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      'Diese heruntergeladenen Dateien haben nicht dieselbe Größe wie die Kopien auf dem Server und sind möglicherweise unvollständig oder beschädigt.';

  @override
  String fileHealthStartsAt(String time) {
    return 'beginnt bei $time';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return '$local hier, $server auf dem Server';
  }

  @override
  String fileHealthSampleRate(String value) {
    return '$value kHz';
  }

  @override
  String get fileHealthMono => 'Mono';

  @override
  String get fileHealthStereo => 'Stereo';

  @override
  String get fileHealthRedownload => 'Dieses Buch erneut herunterladen';

  @override
  String get fileHealthRedownloadQuestion =>
      'Dieses Buch erneut herunterladen?';

  @override
  String get fileHealthRedownloadInfo =>
      'Die Kopie auf diesem Gerät wird entfernt und erneut vom Server heruntergeladen. Wenn das Buch gerade läuft, wird es gestoppt. Auf dem Server ändert sich nichts.';

  @override
  String get fileHealthNotAvailableOffline =>
      'Verbinde dich mit deinem Server, um erneut herunterzuladen';

  @override
  String get playerReconnecting =>
      'Verbindung verloren, Verbindung wird neu aufgebaut…';

  @override
  String get playerReconnectFailed =>
      'Die Verbindung zum Server konnte nicht wiederhergestellt werden, daher wurde die Wiedergabe gestoppt.';

  @override
  String get downloadsFailed => 'Fehlgeschlagene Downloads';

  @override
  String get absorbingReorderQueue => 'Warteschlange neu ordnen';

  @override
  String get playAction => 'Abspielen';

  @override
  String get pauseAction => 'Pausieren';

  @override
  String get rmabImportBooks => 'Bücher importieren';

  @override
  String get rmabImportBooksSubtitle =>
      'ReadMeABook durchsuchen und Bücher zum Anfragen wählen';

  @override
  String get rmabImportBooksConnectSubtitle =>
      'Verbinde ReadMeABook zuerst mit einer URL und einem Token';

  @override
  String get windowsSettingsTitle => 'Windows-Einstellungen';

  @override
  String get updateCheckFrequency => 'Automatische Update-Prüfung';

  @override
  String get updateCheckFrequencySubtitle =>
      'Sucht nur nach Updates; die Installation erfolgt immer manuell.';

  @override
  String get updateCheckOnStartup => 'Beim Start (einmal pro 12 Stunden)';

  @override
  String get updateCheckEverySixHours => 'Alle 6 Stunden';

  @override
  String get updateCheckEveryTwelveHours => 'Alle 12 Stunden';

  @override
  String get updateCheckDaily => 'Täglich';

  @override
  String get updateCheckNever => 'Nie automatisch';

  @override
  String onLatestVersionDetail(String version) {
    return 'Du nutzt die neueste Version ($version)';
  }

  @override
  String get updateCheckFailed =>
      'GitHub war für die Update-Prüfung nicht erreichbar. Prüfe deine Verbindung und versuche es erneut.';

  @override
  String get playlistDetailAddBooks => 'Bücher zur Wiedergabeliste hinzufügen';

  @override
  String get playlistDetailSwitchToList => 'Zur Listenansicht wechseln';

  @override
  String get playlistDetailSwitchToGrid => 'Zur Rasteransicht wechseln';

  @override
  String get adminUploadIndexing =>
      'Upload abgeschlossen; warte auf die Indizierung durch Audiobookshelf...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return '„$title“ hochgeladen; Audiobookshelf indiziert es noch';
  }

  @override
  String get adminUploadPermissionDenied =>
      'Dein Audiobookshelf-Konto hat keine Berechtigung zum Hochladen. Bitte einen Server-Administrator, den Upload-Zugriff für dein Konto zu aktivieren.';

  @override
  String get uiThemeLabel => 'UI-Theme';

  @override
  String get uiThemePickerTitle => 'Wähle einen Look';

  @override
  String get uiThemePickerIntro =>
      'Du kannst das jederzeit unter Einstellungen > Darstellung > UI-Theme ändern.';

  @override
  String get uiThemePlusName => 'Standard';

  @override
  String get uiThemePlusDescription =>
      'Der übliche Absorb-Plus-Look mit gefüllten Flächen und einem sanften Leuchten in den Farben deiner Cover.';

  @override
  String get uiThemeMidnightName => 'Midnight';

  @override
  String get uiThemeMidnightDescription =>
      'Reines Schwarz mit dünnen Umrandungen und ohne Leuchten, gemacht für OLED-Bildschirme.';

  @override
  String get uiThemeContinue => 'Weiter';

  @override
  String get uiThemeFrostedName => 'Frosted';

  @override
  String get uiThemeFrostedDescription =>
      'Sanfte Milchglas-Flächen, durch die die Farben deiner Cover schimmern.';

  @override
  String get uiThemeColorTitle => 'Wähle eine Farbe';

  @override
  String get uiThemeColorIntro =>
      'Das ist dieselbe Einstellung wie Einstellungen > Darstellung > Farbquelle.';

  @override
  String get uiThemeColorFromCover => 'Vom Cover';

  @override
  String get uiThemeBack => 'Zurück';

  @override
  String get uiThemeTryIt => 'Ausprobieren';

  @override
  String uiThemePreviewing(String name) {
    return 'Vorschau: $name';
  }

  @override
  String get uiThemeKeep => 'Behalten';

  @override
  String get uiThemeGoBack => 'Zurück';

  @override
  String get uiThemeGlass => 'Glas';

  @override
  String get uiThemeGlassLight => 'Leicht';

  @override
  String get uiThemeGlassMedium => 'Mittel';

  @override
  String get uiThemeGlassStrong => 'Stark';

  @override
  String get uiThemeDetails => 'Look-Details';

  @override
  String get uiThemeFullCovers => 'Cover in voller Qualität';

  @override
  String get uiThemeFullCoversSubtitle =>
      'Schärfere Cover, die mehr Speicher brauchen';

  @override
  String get uiThemeExtraBadges => 'Zusätzliche Cover-Abzeichen';

  @override
  String get uiThemeExtraBadgesSubtitle =>
      'eBook-Abzeichen und der Gespeichert-Streifen bei „Weiterhören“';

  @override
  String get uiThemeReadingShelf => '„Weiterlesen“ als Regal';

  @override
  String get uiThemeReadingShelfSubtitle =>
      'Ein normales Start-Regal statt großer Karten';

  @override
  String get uiThemeCompactHeader => 'Kompakte Kopfzeilen-Buttons';

  @override
  String get uiThemeCompactHeaderSubtitle =>
      'Die Buttons in der Seitenkopfzeile behalten ihre kleine Größe';

  @override
  String get uiThemePlainWording => 'Schlichte Bezeichnungen';

  @override
  String get uiThemePlainWordingOnSubtitle =>
      'Verwendet „Abspielen“, „Wiedergabe“, „Beendet“';

  @override
  String get uiThemePlainWordingOffSubtitle =>
      'Verwendet „Absorb“, „Absorbing“, „Vollständig Absorbed“';

  @override
  String get uiThemeSearchClassic => 'Klassisch';

  @override
  String whatsNewSheetTitle(String name) {
    return 'Neuigkeiten in $name';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return 'Aktualisiert von $name';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return 'Build $number';
  }

  @override
  String get whatsNewFullNotes => 'Alle Hinweise auf GitHub';

  @override
  String get whatsNewLoading => 'Neuigkeiten werden geladen';

  @override
  String get whatsNewLoadFailed => 'Die Hinweise konnten nicht geladen werden';

  @override
  String get whatsNewLoadFailedHint =>
      'Prüfe deine Verbindung oder lies sie auf GitHub.';

  @override
  String get whatsNewOpenGitHub => 'Auf GitHub öffnen';

  @override
  String get settingsSeeWhatsNew => 'Neuigkeiten ansehen';

  @override
  String get settingsSeeWhatsNewSubtitle =>
      'Die Versionshinweise für diese Version';

  @override
  String get windowsCloseToTray => 'In die Taskleiste schließen';

  @override
  String get windowsCloseToTraySubtitle =>
      'Beim Schließen des Fensters läuft Absorb Plus im Infobereich weiter. Beenden über das Tray-Symbol.';

  @override
  String get windowsStartWithWindows => 'Mit Windows starten';

  @override
  String get windowsStartWithWindowsSubtitle =>
      'Absorb Plus öffnen, wenn du dich bei Windows anmeldest';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return 'Startet: $command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return 'Eine andere Kopie ist zum Start eingerichtet: $command. Schalte ein, um stattdessen diese Kopie zu verwenden.';
  }

  @override
  String get windowsStartupDisabledBySystem =>
      'In den Autostart-Apps des Task-Managers ausgeschaltet. Schalte es dort wieder ein.';

  @override
  String get windowsStartMinimized => 'Minimiert starten';

  @override
  String get windowsStartMinimizedSubtitle =>
      'Beim Start mit Windows im Tray halten (oder minimiert, wenn „In die Taskleiste schließen“ aus ist)';

  @override
  String get windowsAlwaysOnTop => 'Immer im Vordergrund';

  @override
  String get windowsAlwaysOnTopSubtitle =>
      'Das Fenster über anderen Fenstern halten';

  @override
  String get windowsKeepAwake =>
      'PC beim Abspielen oder Herunterladen wach halten';

  @override
  String get windowsKeepAwakeSubtitle =>
      'Verhindert, dass der PC in den Ruhezustand geht. Der Bildschirm kann sich trotzdem ausschalten.';

  @override
  String get windowsSettingFailed =>
      'Windows hat diese Änderung nicht akzeptiert';

  @override
  String get windowsGlobalHotkeys => 'Globale Tastenkürzel';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Funktionieren, während Absorb Plus im Hintergrund läuft: Ctrl+Alt+Space Wiedergabe/Pause, Ctrl+Alt+Left/Right zurück-/vorspulen, Ctrl+Alt+Up/Down Lautstärke, Ctrl+Alt+B Lesezeichen hinzufügen';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return 'Von einer anderen App belegt, nicht verfügbar: $keys';
  }

  @override
  String get windowsTrayShow => 'Absorb Plus anzeigen';

  @override
  String get windowsTrayQuit => 'Absorb Plus beenden';

  @override
  String get windowsTaskbarPlay => 'Abspielen';

  @override
  String get windowsTaskbarPause => 'Pausieren';

  @override
  String get windowsTaskbarRewind => 'Zurückspulen';

  @override
  String get windowsTaskbarForward => 'Vorspulen';

  @override
  String windowsJumpListResume(String title) {
    return '$title fortsetzen';
  }

  @override
  String get githubProjectTitle => 'Absorb Plus auf GitHub';

  @override
  String get precacheTitle => 'Cover und Buchseiten vorab laden';

  @override
  String get precacheSubtitle =>
      'Lädt sie im Hintergrund über WLAN oder Kabelverbindung, damit Bildschirme sofort öffnen. Belegt etwas Speicherplatz, keinen Arbeitsspeicher.';

  @override
  String get githubProjectSubtitle =>
      'Releases, Quellcode und Projektneuigkeiten';

  @override
  String get supportSaveLogsSubtitle =>
      'Die Logdatei speichern, um sie an ein GitHub-Issue anzuhängen';

  @override
  String get supportSaveLogsDialogTitle => 'Absorb-Plus-Logs speichern';

  @override
  String supportLogsSaved(String path) {
    return 'Logs gespeichert unter $path';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return 'Die Logs konnten nicht gespeichert werden: $error';
  }

  @override
  String get supportOpenLogsFolder => 'Log-Ordner öffnen';

  @override
  String get supportOpenLogsFolderSubtitle =>
      'Die Logdatei im Dateimanager anzeigen';

  @override
  String get supportOpenLogsFolderFailed =>
      'Der Log-Ordner konnte nicht geöffnet werden';

  @override
  String get desktopDownloadFolderOpen => 'Im Explorer öffnen';

  @override
  String get desktopDownloadFolderOpenLinux => 'Ordner öffnen';

  @override
  String get desktopDownloadFolderOpenFailed =>
      'Der Ordner konnte nicht geöffnet werden';

  @override
  String get desktopDownloadFolderNotWritable =>
      'Absorb kann in diesem Ordner keine Dateien speichern. Wähle einen anderen.';

  @override
  String get desktopDownloadFolderPickFailed =>
      'Die Ordnerauswahl konnte nicht angezeigt werden';

  @override
  String get desktopDownloadFolderNetworkPath =>
      'Netzwerkordner (\\\\server\\share) können keine Downloads aufnehmen. Verbinde die Freigabe im Datei-Explorer mit einem Laufwerksbuchstaben, etwa Z:, und wähle stattdessen diesen.';

  @override
  String get desktopDownloadFolderDefault => 'Standardordner';

  @override
  String get bookSettingsTitle => 'Buch-Einstellungen';

  @override
  String bookSettingsSeries(String name) {
    return 'Serie: $name';
  }

  @override
  String get bookSettingsSpeed => 'Geschwindigkeit';

  @override
  String get bookSettingsSpeedFromSeries =>
      'Vom zuletzt abgespielten Buch dieser Serie';

  @override
  String get bookSettingsSkipIntro => 'Intro überspringen';

  @override
  String get bookSettingsSkipIntroHint =>
      'Nur wenn das Buch von Anfang an startet';

  @override
  String get bookSettingsSkipOutro => 'Outro überspringen';

  @override
  String get bookSettingsSkipOutroHint =>
      'Beendet das Buch früher und markiert es als beendet';

  @override
  String get bookSettingsSkipOff => 'Aus';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds Sek.';
  }

  @override
  String get bookSettingsWholeSeries => 'Für die ganze Serie verwenden';

  @override
  String get bookSettingsWholeSeriesHint =>
      'Intro und Outro gelten für jedes Buch dieser Serie';

  @override
  String get bookSettingsReset => 'Zurücksetzen';

  @override
  String get bookSettingsResetDone => 'Buch-Einstellungen zurückgesetzt';

  @override
  String get adminDashTitle => 'Dashboard';

  @override
  String get adminDashSubtitle =>
      'Wer hört, Bibliotheken, Benutzer und Serverwarnungen auf einen Blick';

  @override
  String get adminDashNobodyListening => 'Gerade hört niemand zu';

  @override
  String adminDashOnlineNames(String names) {
    return 'Online: $names';
  }

  @override
  String get adminDashListeningHistory => 'Hörverlauf';

  @override
  String get adminDashCouldNotLoad => 'Konnte nicht vom Server geladen werden';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Elemente',
      one: '1 Element',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => 'Alle scannen';

  @override
  String get adminDashScanAllTitle => 'Alle Bibliotheken scannen?';

  @override
  String get adminDashScanAllContent =>
      'Audiobookshelf sucht in jeder Bibliothek nach neuen, geänderten und fehlenden Dateien. Bei großen Bibliotheken kann das eine Weile dauern.';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Scan für $count Bibliotheken gestartet',
      one: 'Scan für 1 Bibliothek gestartet',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return '$failed von $total Scans konnten nicht gestartet werden';
  }

  @override
  String get adminDashNoLibraries => 'Noch keine Bibliotheken';

  @override
  String get adminDashBackUpNow => 'Jetzt sichern';

  @override
  String adminDashLastBackup(String time) {
    return 'Letzte Sicherung $time';
  }

  @override
  String get adminDashNoBackups => 'Noch keine Sicherungen';

  @override
  String get adminDashManageUsers => 'Benutzer verwalten';

  @override
  String get adminDashNeverSeen => 'Nie angemeldet';

  @override
  String get adminDashDisabled => 'Deaktiviert';

  @override
  String get adminDashLocked => 'Gesperrt';

  @override
  String get adminDashServerWarnings => 'Serverwarnungen';

  @override
  String get adminDashNoProblems =>
      'Keine Warnungen oder Fehler im heutigen Log';

  @override
  String get adminDashAllLogs => 'Alle Server-Logs';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale (integriert)';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => 'Tastenkürzel';

  @override
  String get desktopShortcutsSubtitle =>
      'Steuerung für Wiedergabe, Geschwindigkeit, Suche und Navigation';

  @override
  String get desktopShortcutsClose => 'Schließen';

  @override
  String get tailscaleConnect => 'Mit Tailscale verbinden';

  @override
  String get tailscaleConnectHint =>
      'Öffnet die Tailscale-Anmeldung in deinem Browser';

  @override
  String get tailscaleTurnOff => 'Ausschalten';

  @override
  String get tailscaleCardPitch =>
      'Erreiche deinen Server in deinem Tailnet, ohne das Tailscale-VPN einzuschalten';

  @override
  String get tailscaleIntro =>
      'Erreiche einen Server in deinem Tailnet, ohne das VPN der Tailscale-App einzuschalten. Absorb tritt deinem Tailnet als eigenes Gerät bei, nur für die eigenen Verbindungen. Testfunktion, standardmäßig aus.';

  @override
  String get tailscaleUseSwitch => 'Integriertes Tailscale verwenden';

  @override
  String get tailscaleStatusOff => 'Aus';

  @override
  String get tailscaleStatusStarting => 'Verbindung wird hergestellt…';

  @override
  String get tailscaleStatusNeedsLogin =>
      'Melde dich an, um dieses Gerät zu deinem Tailnet hinzuzufügen';

  @override
  String get tailscaleStatusNeedsApproval =>
      'Warte darauf, dass ein Admin dieses Gerät genehmigt';

  @override
  String tailscaleStatusConnected(String user) {
    return 'Verbunden als $user';
  }

  @override
  String get tailscaleStatusConnectedNoUser => 'Verbunden';

  @override
  String tailscaleStatusError(String error) {
    return 'Problem: $error';
  }

  @override
  String get tailscaleNotIncluded => 'In diesem Build nicht enthalten';

  @override
  String get tailscaleSignIn => 'Bei Tailscale anmelden';

  @override
  String get tailscaleSignInNoLink =>
      'Noch kein Anmelde-Link. Versuche es gleich noch einmal.';

  @override
  String get tailscaleToggleFailed =>
      'Das integrierte Tailscale konnte nicht ein- oder ausgeschaltet werden. Versuche es erneut.';

  @override
  String get tailscaleSignOut => 'Von Tailscale abmelden';

  @override
  String tailscaleDeviceAddress(String address) {
    return 'Dieses Gerät: $address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return 'Dein Server ($server) wird über Tailscale erreicht.';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return 'Dein Server ($server) ist keine Tailnet-Adresse und wird daher wie gewohnt erreicht. Wenn er in deinem Tailnet liegt, füge unten seinen Hostnamen hinzu.';
  }

  @override
  String get tailscaleExtraHostsLabel => 'Weitere Tailnet-Hostnamen';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      'Adressen in 100.64.0.0/10 und Namen, die auf .ts.net oder den MagicDNS-Namen deines Tailnets enden, laufen immer über Tailscale. Trenne Namen mit Kommas.';

  @override
  String playerChapterEndsAt(String time) {
    return 'Kapitel endet um $time';
  }

  @override
  String playerEndsAt(String time) {
    return 'Endet um $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return 'Zuletzt abgespielt auf $device · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return 'Zuletzt auf einem anderen Gerät abgespielt · $ago';
  }

  @override
  String get opmlExportAction => 'OPML exportieren';

  @override
  String get opmlExportDialogTitle => 'Podcast-Feeds als OPML speichern';

  @override
  String opmlExportSaved(String path) {
    return 'OPML gespeichert unter $path';
  }

  @override
  String get opmlExportDownloaded => 'OPML heruntergeladen';

  @override
  String get opmlExportFailed =>
      'Die OPML-Datei konnte nicht exportiert werden';

  @override
  String get bookCopySaveAction => 'Kopie speichern…';

  @override
  String get bookCopyDialogTitle => 'Eine Kopie dieses Buchs speichern';

  @override
  String get bookCopySaving => 'Kopie wird gespeichert…';

  @override
  String bookCopySaved(String path) {
    return 'Kopie gespeichert unter $path';
  }

  @override
  String get bookCopyFailed =>
      'Von diesem Buch konnte keine Kopie gespeichert werden';

  @override
  String get exclusiveAudioTitle => 'Exklusives Audio';

  @override
  String get exclusiveAudioSubtitle =>
      'Behebt Knistern oder springende Lautstärke, indem Windows-Soundeffekte übersprungen werden. Andere Apps sind stummgeschaltet, während Absorb abspielt. Zum Anwenden Absorb neu starten.';

  @override
  String get exclusiveAudioFallback =>
      'Your sound device refused exclusive audio, so Absorb is playing in normal mode';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return '$count neu';
  }

  @override
  String seekUndoBackTo(String time) {
    return 'Zurück zu $time';
  }

  @override
  String get goToTime => 'Go to time';

  @override
  String get goToTimeLabel => 'Time';

  @override
  String get goToTimeHint => 'h:mm:ss, mm:ss or minutes';

  @override
  String get goToTimeGo => 'Go';

  @override
  String goToTimeLength(String time) {
    return 'Length $time';
  }

  @override
  String get goToTimeInvalid => 'Type a time like 1:23:45, 23:45 or 90';

  @override
  String goToTimePastEnd(String time) {
    return 'That\'s past the end ($time)';
  }

  @override
  String get desktopShortcutGoToTime => 'Go to a time in the open player';

  @override
  String fellAsleepJumpBack(String time) {
    return 'Fell asleep around $time · Jump back';
  }

  @override
  String get surpriseMe => 'Surprise me';

  @override
  String get surpriseMeNoneLeft =>
      'You\'ve finished every book in this library';

  @override
  String get surpriseMeFailed => 'Couldn\'t pick a book. Try again.';

  @override
  String get surpriseMeOffline =>
      'Surprise me needs a connection to the server';

  @override
  String get surpriseMeBooksOnly =>
      'Surprise me picks books. Switch to a book library.';

  @override
  String get autoDownloadNextInSeries =>
      'Das nächste Buch der Serie automatisch herunterladen';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      'Wenn das gerade gespielte Buch zu 80 % durch ist oder weniger als eine Stunde übrig hat. Folgt der Einstellung „Nur über WLAN“.';

  @override
  String get emptyStateBrowseLibrary => 'Bibliothek durchsuchen';

  @override
  String get emptyStateClearSearch => 'Suche zurücksetzen';

  @override
  String get statsNoListeningYet => 'Noch nichts gehört';

  @override
  String get desktopShortcutQuickSwitcher =>
      'Schnellwechsler: Bücher finden oder überallhin gehen';

  @override
  String get desktopShortcutHelp => 'Tastenkürzel anzeigen';

  @override
  String get quickSwitcherTooltip => 'Schnellwechsler (Ctrl+K)';

  @override
  String get quickSwitcherHint =>
      'Diese Bibliothek durchsuchen oder einen Befehl eingeben';

  @override
  String get quickSwitcherNoResults => 'Keine Treffer';

  @override
  String get quickSwitcherGoHome => 'Zu Start';

  @override
  String get quickSwitcherGoLibrary => 'Zur Bibliothek';

  @override
  String get quickSwitcherGoAbsorbing => 'Zu Absorbing';

  @override
  String get quickSwitcherGoStats => 'Zu Statistiken';

  @override
  String get quickSwitcherGoSettings => 'Zu Einstellungen';

  @override
  String get quickSwitcherGoDownloads => 'Zu Downloads';

  @override
  String get quickSwitcherPlayPause => 'Abspielen / Pausieren';

  @override
  String get quickSwitcherSleepTimer => 'Sleep-Timer';

  @override
  String get quickSwitcherKeywordsAbsorbing => 'now playing player';

  @override
  String get quickSwitcherKeywordsSettings => 'preferences options';

  @override
  String get quickSwitcherKeywordsDownloads => 'offline';

  @override
  String get quickSwitcherKeywordsPlayPause => 'resume pause';

  @override
  String get quickSwitcherKeywordsSleepTimer => 'timer';

  @override
  String get quickSwitcherKeywordsShortcuts => 'keys help hotkeys keyboard';

  @override
  String get quickSwitcherKindAction => 'Aktion';

  @override
  String get quickSwitcherKindBook => 'Buch';

  @override
  String get quickSwitcherKindPodcast => 'Podcast';

  @override
  String get quickSwitcherKindSeries => 'Serie';

  @override
  String get quickSwitcherKindAuthor => 'Autor';

  @override
  String get alphabetScrollerLabel => 'Zu einem Buchstaben springen';

  @override
  String get stepperDecrease => 'Verringern';

  @override
  String get stepperIncrease => 'Erhöhen';

  @override
  String get statsStreakKeepGoing =>
      'Höre heute 5 Minuten, um die Serie fortzusetzen';

  @override
  String get statsStreakHowTo =>
      'Höre jeden Tag 5 Minuten, um einen Streak aufzubauen';

  @override
  String get statsDailyGoalSheetTitle => 'Tägliches Hörziel';

  @override
  String get statsDailyGoalSheetBody =>
      'Ein Ring auf der Streak-Karte füllt sich, während du heute hörst.';

  @override
  String get statsDailyGoalSet => 'Tagesziel festlegen';

  @override
  String get statsMonthListened => 'Gehört';

  @override
  String get statsMonthTime => 'Zeit';

  @override
  String get statsMonthTopBook => 'Top-Buch';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Ergebnisse',
      one: '1 Ergebnis',
      zero: 'Keine Ergebnisse',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => 'Sortieren und gruppieren';

  @override
  String get bookmarksViewByBook => 'Nach Buch';

  @override
  String get bookmarksViewNewest => 'Neueste zuerst';

  @override
  String get bookmarksViewPosition => 'Nach Position';

  @override
  String get bookmarksExportAction => 'Lesezeichen exportieren';

  @override
  String get bookmarksExportDialogTitle => 'Lesezeichen als Markdown speichern';

  @override
  String bookmarksExportSaved(String path) {
    return 'Lesezeichen gespeichert unter $path';
  }

  @override
  String get bookmarksExportDownloaded => 'Lesezeichen heruntergeladen';

  @override
  String get bookmarksExportFailed =>
      'Die Lesezeichen konnten nicht exportiert werden';

  @override
  String get chapterSearchHint => 'Search chapters or type a time (1:23:00)';

  @override
  String get chapterSearchNoResults => 'No chapters match';

  @override
  String get dropUploadNotAllowed =>
      'Your account can\'t upload to this server';

  @override
  String get dropUploadNothingUsable =>
      'None of the dropped files can be uploaded';

  @override
  String get dropUploadAlreadyOpen => 'Finish or close the open upload first';

  @override
  String get remoteHostTitle => 'Phone remote';

  @override
  String get remoteHostSubtitleOff => 'Control this PC from your phone';

  @override
  String remoteHostSubtitleOn(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count devices connected',
      one: '1 device connected',
      zero: 'no devices connected',
    );
    return 'On · $_temp0';
  }

  @override
  String get remoteHostSheetBody =>
      'Your phone works as a remote and a now-playing screen while the audio plays here. Only devices you pair can connect, and only over your own network.';

  @override
  String get remoteHostSwitch => 'Allow a remote';

  @override
  String get remoteHostSwitchSubtitle =>
      'Off by default. Windows may ask to let Absorb Plus through the firewall the first time.';

  @override
  String remoteHostPortsBusy(int first, int last) {
    return 'Couldn\'t start: ports $first to $last are all in use.';
  }

  @override
  String get remoteHostPairTitle => 'Pair a device';

  @override
  String get remoteHostPairHelp =>
      'On the phone, open Absorb Plus, go to Settings, Media Controls, Control another device, pick this PC and enter the code.';

  @override
  String get remoteHostCodeLabel => 'Pairing code';

  @override
  String remoteHostCodeExpires(String time) {
    return 'Expires in $time';
  }

  @override
  String get remoteHostNewCode => 'New code';

  @override
  String remoteHostAddresses(String addresses) {
    return 'Address: $addresses';
  }

  @override
  String get remoteHostNoAddress => 'This PC has no network address right now.';

  @override
  String get remoteHostNoDiscovery =>
      'The phone can\'t find this PC by itself right now; enter the address on the phone instead.';

  @override
  String get remoteHostConnectedTitle => 'Connected now';

  @override
  String get remoteHostPairedTitle => 'Paired devices';

  @override
  String get remoteHostNoDevices => 'No paired devices yet';

  @override
  String remoteHostLastUsed(String date) {
    return 'Last used $date';
  }

  @override
  String remoteHostConnectedFrom(String address, String time) {
    return '$address, connected since $time';
  }

  @override
  String get remoteHostForget => 'Forget';

  @override
  String get remoteHostDisconnect => 'Disconnect';

  @override
  String get remoteControlAnother => 'Control another device';

  @override
  String get remoteControlAnotherSubtitle =>
      'Use this device as a remote for Absorb Plus on a PC';

  @override
  String get remoteConnectSearching => 'Looking for computers on your network…';

  @override
  String get remoteConnectNoneFound =>
      'No computers found. Turn on Phone remote in the PC\'s Settings, or enter its address.';

  @override
  String get remoteConnectSearchAgain => 'Search again';

  @override
  String get remoteConnectPaired => 'Paired';

  @override
  String get remoteConnectFound => 'On your network';

  @override
  String get remoteConnectEnterAddress => 'Enter an address';

  @override
  String get remoteConnectAddressHint => '192.168.1.20:47390';

  @override
  String get remoteConnectAddressInvalid =>
      'Enter an address like 192.168.1.20 or 192.168.1.20:47390';

  @override
  String get remoteConnectNext => 'Next';

  @override
  String remoteConnectCodeTitle(String name) {
    return 'Pair with $name';
  }

  @override
  String get remoteConnectCodeHelp =>
      'Enter the 6-digit code shown in Phone remote on the PC.';

  @override
  String get remoteConnectPair => 'Pair';

  @override
  String get remoteConnectForget => 'Forget this computer';

  @override
  String get remotePairBadCode =>
      'That code isn\'t right. Check the PC and try again.';

  @override
  String get remotePairExpired =>
      'That code has expired. Use the new one on the PC.';

  @override
  String get remotePairClosed =>
      'Open Phone remote in the PC\'s Settings to see the code.';

  @override
  String get remotePairTooMany =>
      'Too many tries. Wait a minute and try again.';

  @override
  String get remotePairUnreachable =>
      'Couldn\'t reach that computer. Check that both are on the same network.';

  @override
  String get remotePairFailed => 'Pairing didn\'t work. Try again.';

  @override
  String get remoteVersionMismatch =>
      'Update Absorb Plus on both devices to use the remote.';

  @override
  String get remoteConnecting => 'Connecting…';

  @override
  String get remoteReconnecting => 'Reconnecting…';

  @override
  String remoteNothingPlaying(String name) {
    return 'Nothing is playing on $name';
  }

  @override
  String get remoteNothingLoaded => 'Start something on the PC first.';

  @override
  String get remoteCommandFailed => 'The PC couldn\'t do that.';

  @override
  String get remoteDisconnectedByHost => 'The PC disconnected this device.';

  @override
  String get remoteUnauthorized =>
      'The PC doesn\'t know this device any more. Pair it again.';

  @override
  String get remotePairAgain => 'Pair again';

  @override
  String get remoteConnectAgain => 'Connect again';

  @override
  String get remoteDisplayMode => 'Display mode';

  @override
  String get remoteDisplayExit => 'Tap to leave display mode';

  @override
  String get remotePlay => 'Play';

  @override
  String get remotePause => 'Pause';

  @override
  String get remotePreviousChapter => 'Previous chapter';

  @override
  String get remoteNextChapter => 'Next chapter';

  @override
  String remoteSkipBack(int seconds) {
    return 'Back $seconds seconds';
  }

  @override
  String remoteSkipForward(int seconds) {
    return 'Forward $seconds seconds';
  }

  @override
  String get remoteSpeed => 'Speed';

  @override
  String get remoteSleepTimer => 'Sleep timer';

  @override
  String remoteSleepMinutes(int minutes) {
    return '$minutes minutes';
  }

  @override
  String get remoteSleepEndOfChapter => 'End of chapter';

  @override
  String get remoteSleepEndOfEpisode => 'End of episode';

  @override
  String remoteSleepChapters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapters',
      one: '1 chapter',
    );
    return '$_temp0';
  }

  @override
  String get remoteSleepCancel => 'Turn off the sleep timer';

  @override
  String remoteTimeLeft(String time) {
    return '$time left';
  }

  @override
  String remoteChapterTimeLeft(String time) {
    return '$time left in the chapter';
  }

  @override
  String get quickSwitcherKeywordsRemote => 'remote phone control pc link pair';

  @override
  String get quickSwitcherKeywordsSurprise => 'random pick shuffle';

  @override
  String get developerModeOn => 'Developer mode on';

  @override
  String get developerModeAlreadyOn => 'Developer mode is already on';

  @override
  String get developerTitle => 'Developer';

  @override
  String get developerSubtitle => 'Test builds and tools for development';

  @override
  String get developerModeSwitch => 'Developer mode';

  @override
  String get developerModeSwitchSubtitle =>
      'Turning it off hides this page. Tap the version 7 times to bring it back.';

  @override
  String get testChannelTitle => 'Test channel';

  @override
  String get testChannelSubtitle => 'Install the newest test build';

  @override
  String get testChannelUnavailable =>
      'Test builds are only for the Android GitHub version.';

  @override
  String get testChannelCodeLabel => 'Test channel code';

  @override
  String get testChannelUnlock => 'Unlock';

  @override
  String get testChannelUnlocked => 'Test channel unlocked';

  @override
  String get testChannelWrongCode => 'That code isn\'t right';

  @override
  String get testChannelLaunchCheck => 'Check for test builds on launch';

  @override
  String get testChannelLaunchCheckSubtitle =>
      'Asks to install a newer test build when the app starts';

  @override
  String get testChannelWarning =>
      'Test builds are unfinished and can break things. They replace the installed app and keep your data.';

  @override
  String testChannelInstalled(String version) {
    return 'Installed: $version';
  }

  @override
  String testChannelNewest(String version) {
    return 'Newest test build: $version';
  }

  @override
  String get testChannelNone => 'No test build is up yet';

  @override
  String get testChannelUpToDate => 'Up to date';

  @override
  String get testChannelInstall => 'Install';

  @override
  String get testChannelCheckNow => 'Check now';

  @override
  String get testChannelNotes => 'What\'s in it';

  @override
  String get testBuildAvailable => 'Test build available';

  @override
  String testBuildDialogContent(String latest, String current) {
    return 'Test build $latest is out.\n\nYou are on $current.';
  }

  @override
  String testBuildPackageLabel(int build) {
    return 'Test build $build';
  }
}
