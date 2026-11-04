// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get appTitle => 'A B S O R B';

  @override
  String get online => 'Tilkoblet';

  @override
  String get offline => 'Frakoblet';

  @override
  String get stillOffline => 'Fortsatt frakoblet. Trykk for å prøve igjen.';

  @override
  String get retry => 'Prøv igjen';

  @override
  String get listsNone => 'Ingen samlinger eller spillelister';

  @override
  String get listsNoneHint =>
      'Samlinger og spillelister opprettes på Audiobookshelf-serveren din og vises her.';

  @override
  String get listsLoadFailed => 'Kunne ikke laste listene dine';

  @override
  String get listsLoadFailedHint =>
      'Absorb fikk ikke kontakt med serveren din for samlinger og spillelister.';

  @override
  String get listsNoneBookOrbit => 'Ingen samlinger eller Smart Scopes';

  @override
  String get listsNoneHintBookOrbit =>
      'Samlinger og Smart Scopes opprettes på BookOrbit-serveren din og vises her.';

  @override
  String get listsLoadFailedHintBookOrbit =>
      'Absorb fikk ikke kontakt med serveren din for samlinger og Smart Scopes.';

  @override
  String get cancel => 'Avbryt';

  @override
  String get delete => 'Slett';

  @override
  String get remove => 'Fjern';

  @override
  String get save => 'Lagre';

  @override
  String get done => 'Ferdig';

  @override
  String get edit => 'Rediger';

  @override
  String get search => 'Søk';

  @override
  String get apply => 'Bruk';

  @override
  String get enable => 'Aktiver';

  @override
  String get clear => 'Tøm';

  @override
  String get off => 'Av';

  @override
  String get disabled => 'Deaktivert';

  @override
  String get later => 'Senere';

  @override
  String get whatsNewTitle => 'Absorb er oppdatert';

  @override
  String whatsNewContent(String version) {
    return 'Du bruker nå $version.';
  }

  @override
  String get whatsNewButton => 'Se hva som er nytt';

  @override
  String get whatsNewKeepShowing => 'Vis dette etter hver oppdatering';

  @override
  String get whatsNewKeepShowingHint =>
      'Du kan slå det på igjen i Innstillinger';

  @override
  String get settingsWhatsNew => 'Vis nyheter etter oppdateringer';

  @override
  String get settingsWhatsNewSubtitle =>
      'Vis hva som er nytt i appen etter en oppdatering';

  @override
  String get gotIt => 'Greit';

  @override
  String get betaLoggingTitle => 'Logging er på';

  @override
  String get betaLoggingContent =>
      'Siden dette er en betaversjon, lagrer Absorb nå logger for å hjelpe med å finne feil. De blir værende på denne enheten med mindre du deler dem.\n\nDu kan sende dem eller slå dem av i Innstillinger, under Problemer og støtte. Hvis du slår dem av, forblir de av i senere betaversjoner.';

  @override
  String get preview => 'Forhåndsvisning';

  @override
  String get or => 'eller';

  @override
  String get file => 'Fil';

  @override
  String get more => 'Mer';

  @override
  String get unknown => 'Ukjent';

  @override
  String get untitled => 'Uten tittel';

  @override
  String get noThanks => 'Nei takk';

  @override
  String get stay => 'Bli';

  @override
  String get homeTitle => 'Hjem';

  @override
  String get continueListening => 'Fortsett å lytte';

  @override
  String get continueReading => 'Fortsett å lese';

  @override
  String get continueSeries => 'Fortsett serien';

  @override
  String get recentlyAdded => 'Nylig lagt til';

  @override
  String get listenAgain => 'Lytt igjen';

  @override
  String get discover => 'Oppdag';

  @override
  String get newEpisodes => 'Nye episoder';

  @override
  String get downloads => 'Nedlastinger';

  @override
  String get noDownloadedBooks => 'Ingen nedlastede bøker';

  @override
  String get yourLibraryIsEmpty => 'Biblioteket ditt er tomt';

  @override
  String get downloadBooksWhileOnline =>
      'Last ned bøker mens du er tilkoblet for å lytte frakoblet';

  @override
  String get customizeHome => 'Tilpass Hjem';

  @override
  String get dragToReorderTapEye =>
      'Dra for å endre rekkefølge, trykk på øyet for å vise/skjule';

  @override
  String get loginTagline => 'Begynn å absorbere';

  @override
  String get loginConnectToServer => 'Koble til serveren din';

  @override
  String get loginServerAddress => 'Serveradresse';

  @override
  String get loginServerHint => 'min.server.no';

  @override
  String get loginServerHelper =>
      'IP:port fungerer også (f.eks. 192.168.1.5:13378)';

  @override
  String get loginCouldNotReachServer => 'Fikk ikke kontakt med serveren';

  @override
  String get loginAdvanced => 'Avansert';

  @override
  String get loginCustomHttpHeaders => 'Egendefinerte HTTP-hoder';

  @override
  String get loginCustomHeadersDescription =>
      'For Cloudflare-tunneler eller reverse proxy-er som krever ekstra hoder. Legg til hoder før du skriver inn server-URL-en.';

  @override
  String get loginHeaderName => 'Navn på hode';

  @override
  String get loginHeaderValue => 'Verdi';

  @override
  String get loginAddHeader => 'Legg til hode';

  @override
  String get loginSelfSignedCertificates => 'Selvsignerte sertifikater';

  @override
  String get loginTrustAllCertificates =>
      'Stol på alle sertifikater (for selvsignerte / egendefinerte CA-oppsett)';

  @override
  String get loginApiKey => 'API-nøkkel';

  @override
  String get loginApiKeyDescription =>
      'Bruk en API-nøkkel opprettet av en administrator i stedet for brukernavn/passord. Nyttig når token-fornyelse feiler for kontoen din.';

  @override
  String get loginWaitingForSso => 'Venter på SSO...';

  @override
  String get loginRedirectUri => 'Redirect URI: absorb://oauth';

  @override
  String get loginOrSignInManually => 'eller logg inn manuelt';

  @override
  String get loginUsername => 'Brukernavn';

  @override
  String get loginUsernameRequired => 'Skriv inn brukernavnet ditt';

  @override
  String get loginPassword => 'Passord';

  @override
  String get loginSignIn => 'Logg inn';

  @override
  String loginSignInAs(String username) {
    return 'Logge inn som $username?';
  }

  @override
  String get loginSignInToServer => 'Logge inn på denne serveren?';

  @override
  String loginSignedInAs(String username) {
    return 'Logget inn som $username';
  }

  @override
  String get adminCreateSetupFile => 'Del innlogging';

  @override
  String adminSetupFileDescription(String username) {
    return 'Oppretter en privat innloggingslenke for $username som bare fungerer i Absorb-appen.';
  }

  @override
  String get adminSetupFileServerUrl =>
      'Server-URL som den nye brukeren skal bruke';

  @override
  String get adminSetupFileNoteWithHeaders =>
      'En egen API-nøkkel og dine egendefinerte hoder tas med slik at de får kontakt med serveren. Behandle lenken som et passord.';

  @override
  String get adminSetupFileNote =>
      'En egen API-nøkkel tas med. Behandle lenken som et passord.';

  @override
  String get adminSetupFileCreate => 'Opprett lenke';

  @override
  String get adminSetupFileSaveTitle => 'Lagre oppsettsfil';

  @override
  String get adminSetupFileKeyError =>
      'Kunne ikke opprette en API-nøkkel for denne brukeren';

  @override
  String adminSetupFileSaved(String username) {
    return 'Oppsettsfil for $username lagret';
  }

  @override
  String adminSetupFileFailed(String error) {
    return 'Kunne ikke opprette innlogging: $error';
  }

  @override
  String get setupLinkShareTitle => 'Del innlogging';

  @override
  String setupLinkShareDescription(String username) {
    return 'Send denne private lenken eller la dem skanne QR-koden for å logge inn som $username.';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return 'Alle med denne lenken kan logge inn som $username. Behandle den som et passord.';
  }

  @override
  String get setupLinkShare => 'Del lenke';

  @override
  String get setupLinkCopy => 'Kopier lenke';

  @override
  String get setupLinkCopied => 'Innloggingslenke kopiert';

  @override
  String get setupLinkSaveFile => 'Lagre oppsettsfil';

  @override
  String get setupLinkQrError =>
      'Denne oppsettslenken er for stor for en QR-kode. Del lenken i stedet.';

  @override
  String setupLinkShareSubject(String username) {
    return 'Absorb-innlogging for $username';
  }

  @override
  String get setupLinkConfirmTitle => 'Logge inn med denne lenken?';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return 'Logge inn på $server som $username? Fortsett bare hvis du stoler på avsenderen av lenken.';
  }

  @override
  String get setupLinkInvalid =>
      'Denne innloggingslenken er ugyldig eller ufullstendig';

  @override
  String get setupLinkSigningIn => 'Sjekker innloggingslenken...';

  @override
  String get loginPlayDownloads => 'Spill av nedlastingene dine';

  @override
  String signedOutDownloadsNote(String username) {
    return 'Du er logget ut. Alt du lytter til her synkroniseres til $username når du logger inn igjen.';
  }

  @override
  String get loginPasteLink => 'Lim inn innloggingslenke';

  @override
  String get loginPasteLinkHelp =>
      'Lim inn hele innloggingslenken du fikk. Behandle den som et passord.';

  @override
  String get loginFailed => 'Innlogging mislyktes';

  @override
  String get loginSsoFailed => 'SSO-innlogging mislyktes eller ble avbrutt';

  @override
  String get loginSsoAuthFailed => 'SSO-autentisering mislyktes. Prøv igjen.';

  @override
  String get loginRestoreFromBackup => 'Importer';

  @override
  String get loginInvalidBackupFile => 'Ugyldig sikkerhetskopifil';

  @override
  String get loginRestoreBackupTitle => 'Gjenopprette sikkerhetskopi?';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return 'Dette gjenoppretter alle innstillinger og $count lagrede konto(er). Du blir logget inn automatisk.';
  }

  @override
  String get loginRestoreBackupNoAccounts =>
      'Dette gjenoppretter alle innstillinger. Ingen kontoer var med i denne sikkerhetskopien.';

  @override
  String get loginRestore => 'Gjenopprett';

  @override
  String loginRestoredAndSignedIn(String username) {
    return 'Innstillinger gjenopprettet og logget inn som $username';
  }

  @override
  String get loginSessionExpired =>
      'Innstillinger gjenopprettet. Økten er utløpt – logg inn for å fortsette.';

  @override
  String get loginSettingsRestored => 'Innstillinger gjenopprettet';

  @override
  String loginRestoreFailed(String error) {
    return 'Gjenoppretting mislyktes: $error';
  }

  @override
  String get loginSavedAccounts => 'lagrede kontoer';

  @override
  String get libraryTitle => 'Bibliotek';

  @override
  String get librarySearchBooksHint =>
      'Søk etter bøker, serier, forfattere, opplesere...';

  @override
  String get librarySearchShowsHint => 'Søk etter programmer og episoder...';

  @override
  String get libraryTabLibrary => 'Bibliotek';

  @override
  String get libraryTabSeries => 'Serier';

  @override
  String get libraryTabAuthors => 'Forfattere';

  @override
  String get libraryTabNarrators => 'Opplesere';

  @override
  String get libraryNoBooks => 'Fant ingen bøker';

  @override
  String get libraryNoUnfinishedBooks => 'Ingen uferdige bøker';

  @override
  String get libraryNoBooksInProgress => 'Ingen bøker under lesing';

  @override
  String get libraryNoFinishedBooks => 'Ingen fullførte bøker';

  @override
  String get libraryAllBooksStarted => 'Alle bøker er påbegynt';

  @override
  String get libraryNoDownloadedBooks => 'Ingen nedlastede bøker';

  @override
  String get libraryNoSeriesFound => 'Fant ingen serier';

  @override
  String get libraryNoBooksWithEbooks => 'Ingen bøker med e-bøker';

  @override
  String get libraryNoBooksMissingMetadata =>
      'Ingen bøker mangler disse metadataene';

  @override
  String get libraryNoItemsMatchingFilter =>
      'Ingen elementer samsvarer med dette filteret';

  @override
  String libraryNoBooksInGenre(String genre) {
    return 'Ingen bøker i «$genre»';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return 'Ingen bøker med taggen «$tag»';
  }

  @override
  String get libraryClearFilter => 'Fjern filter';

  @override
  String get libraryNoAuthorsFound => 'Fant ingen forfattere';

  @override
  String get libraryNoNarratorsFound => 'Fant ingen opplesere';

  @override
  String get libraryNoResults => 'Ingen resultater';

  @override
  String get librarySearchBooks => 'Bøker';

  @override
  String get librarySearchShows => 'Programmer';

  @override
  String get librarySearchEpisodes => 'Episoder';

  @override
  String get librarySearchSeries => 'Serier';

  @override
  String get librarySearchAuthors => 'Forfattere';

  @override
  String get librarySearchTags => 'Tagger';

  @override
  String get librarySearchGenres => 'Sjangere';

  @override
  String librarySeriesCount(int count) {
    return '$count serier';
  }

  @override
  String libraryAuthorsCount(int count) {
    return '$count forfattere';
  }

  @override
  String libraryNarratorsCount(int count) {
    return '$count opplesere';
  }

  @override
  String libraryBooksCount(int loaded, int total) {
    return '$loaded/$total bøker';
  }

  @override
  String get sort => 'Sorter';

  @override
  String get filter => 'Filter';

  @override
  String get filterActive => 'Filter ●';

  @override
  String get name => 'Navn';

  @override
  String get title => 'Tittel';

  @override
  String get author => 'Forfatter';

  @override
  String get dateAdded => 'Dato lagt til';

  @override
  String get numberOfBooks => 'Antall bøker';

  @override
  String get sortTotalDuration => 'Total varighet';

  @override
  String get sortLastBookAdded => 'Sist lagt til bok';

  @override
  String get sortLastBookUpdated => 'Sist oppdatert bok';

  @override
  String get publishedYear => 'Utgivelsesår';

  @override
  String get duration => 'Varighet';

  @override
  String get random => 'Tilfeldig';

  @override
  String get collapseSeries => 'Slå sammen serier';

  @override
  String get notFinished => 'Ikke fullført';

  @override
  String get inProgress => 'Pågår';

  @override
  String get filterFinished => 'Fullført';

  @override
  String get notStarted => 'Ikke påbegynt';

  @override
  String get downloaded => 'Nedlastet';

  @override
  String get hasEbook => 'Har e-bok';

  @override
  String get noEbook => 'Ingen e-bok';

  @override
  String get hasSupplementaryEbook => 'Har tilleggs-e-bok';

  @override
  String get noSupplementaryEbook => 'Ingen tilleggs-e-bok';

  @override
  String get noSeries => 'Ingen serie';

  @override
  String get publishedDecade => 'Utgivelsestiår';

  @override
  String get tracks => 'Spor';

  @override
  String get noTracks => 'Ingen spor';

  @override
  String get singleTrack => 'Ett spor';

  @override
  String get multipleTracks => 'Flere spor';

  @override
  String get abridged => 'Forkortet';

  @override
  String get issues => 'Problemer';

  @override
  String get rssFeedOpen => 'RSS-strøm åpen';

  @override
  String get explicitContent => 'Eksplisitt';

  @override
  String get missingMetadata => 'Manglende metadata';

  @override
  String get genre => 'Sjanger';

  @override
  String get tag => 'Tagg';

  @override
  String get clearFilter => 'Fjern filter';

  @override
  String get noGenresFound => 'Fant ingen sjangere';

  @override
  String get noTagsFound => 'Fant ingen tagger';

  @override
  String get asc => 'STIG.';

  @override
  String get desc => 'SYNK.';

  @override
  String get fileSize => 'Filstørrelse';

  @override
  String get lastUpdated => 'Sist oppdatert';

  @override
  String get fileCreated => 'Fil opprettet';

  @override
  String get lastModified => 'Sist endret';

  @override
  String get authorFirstLast => 'Forfatter (Fornavn Etternavn)';

  @override
  String get authorLastFirst => 'Forfatter (Etternavn, Fornavn)';

  @override
  String get progressSort => 'Fremdrift';

  @override
  String get dateStarted => 'Dato påbegynt';

  @override
  String get dateFinished => 'Dato fullført';

  @override
  String get episodeCount => 'Antall episoder';

  @override
  String get sequence => 'Serierekkefølge';

  @override
  String get absorbingTitle => 'Absorbing';

  @override
  String get absorbingStop => 'Stopp';

  @override
  String get absorbingManageQueue => 'Administrer kø';

  @override
  String get absorbingDone => 'Ferdig';

  @override
  String get absorbingNoDownloadedEpisodes => 'Ingen nedlastede episoder';

  @override
  String get absorbingNoDownloadedBooks => 'Ingen nedlastede bøker';

  @override
  String get absorbingNothingPlayingYet => 'Ingenting spilles ennå';

  @override
  String get absorbingNothingAbsorbingYet => 'Ingenting absorberes ennå';

  @override
  String get absorbingDownloadEpisodesToListen =>
      'Last ned episoder for å lytte frakoblet';

  @override
  String get absorbingDownloadBooksToListen =>
      'Last ned bøker for å lytte frakoblet';

  @override
  String get absorbingStartEpisodeFromShows =>
      'Start en episode fra fanen Programmer';

  @override
  String get absorbingStartBookFromLibrary =>
      'Start en bok fra fanen Bibliotek';

  @override
  String get carModeTitle => 'Bilmodus';

  @override
  String get carModeNoBookLoaded => 'Ingen bok lastet';

  @override
  String get carModeBookLabel => 'Bok';

  @override
  String get carModeChapterLabel => 'Kapittel';

  @override
  String get carModeBookmarkDefault => 'Bokmerke';

  @override
  String get carModeBookmarkAdded => 'Bokmerke lagt til';

  @override
  String get downloadsTitle => 'Nedlastinger';

  @override
  String get downloadsCancelSelection => 'Avbryt utvalg';

  @override
  String get downloadsSelect => 'Velg';

  @override
  String get downloadsNoDownloads => 'Ingen nedlastinger';

  @override
  String get downloadsDownloading => 'Laster ned';

  @override
  String get downloadsQueued => 'I kø';

  @override
  String get downloadsCompleted => 'Fullført';

  @override
  String get downloadsEbooks => 'E-bøker';

  @override
  String get downloadsWaiting => 'Venter...';

  @override
  String get downloadsCancel => 'Avbryt';

  @override
  String get downloadsDelete => 'Slett';

  @override
  String downloadsDeleteCount(int count) {
    return 'Slette $count nedlasting(er)?';
  }

  @override
  String get downloadsDeleteContent =>
      'Nedlastede filer fjernes fra denne enheten.';

  @override
  String downloadsDeletedCount(int count) {
    return 'Slettet $count nedlasting(er)';
  }

  @override
  String get downloadsRemoveTitle => 'Fjerne nedlasting?';

  @override
  String downloadsRemoveContent(String title) {
    return 'Slette «$title» fra denne enheten?';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return '«$title» fjernet';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return 'Kunne ikke laste ned «$title» – en av filene finnes ikke på serveren. En biblioteksskanning kan løse det.';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return 'Kunne ikke laste ned «$title» – ikke nok lagringsplass';
  }

  @override
  String downloadFailedPermission(String title) {
    return 'Kunne ikke laste ned «$title» – sjekk nedlastingsplasseringen i Innstillinger';
  }

  @override
  String downloadFailedGeneric(String title) {
    return 'Kunne ikke laste ned «$title»';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '$count valgt';
  }

  @override
  String get bookmarksTitle => 'Alle bokmerker';

  @override
  String get bookmarksTabBookmarks => 'Bokmerker';

  @override
  String get bookmarksTabHighlights => 'Markeringer';

  @override
  String get highlightOpenInBook => 'Åpne i boken';

  @override
  String get highlightDeleteAction => 'Slett markering';

  @override
  String get highlightDeleted => 'Markering slettet';

  @override
  String highlightsDeleteCount(int count) {
    return 'Slette $count markering(er)?';
  }

  @override
  String highlightsDeletedCount(int count) {
    return 'Slettet $count markering(er)';
  }

  @override
  String get quoteShareTitle => 'Del sitat';

  @override
  String get quoteShareAction => 'Del';

  @override
  String get quoteShareFailed => 'Kunne ikke lage sitatbildet';

  @override
  String get quoteShapePortrait => 'Stående';

  @override
  String get quoteShapeSquare => 'Kvadrat';

  @override
  String get quoteShapeStory => 'Story';

  @override
  String get quoteStyleBlur => 'Uskarpt';

  @override
  String get quoteStyleDim => 'Dempet';

  @override
  String get quoteStyleNone => 'Rent omslag';

  @override
  String get quoteTextLight => 'Lys tekst';

  @override
  String get quoteTextDark => 'Mørk tekst';

  @override
  String get quoteFieldTitle => 'Tittel';

  @override
  String get quoteFieldDetail => 'Detaljer';

  @override
  String get quoteFieldDetailHint =>
      'Forfatter, kapittel, side, hvem som sa det';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => 'Avbryt utvalg';

  @override
  String get bookmarksSortedByNewest => 'Sortert etter nyeste';

  @override
  String get bookmarksSortedByPosition => 'Sortert etter posisjon';

  @override
  String get bookmarksSelect => 'Velg';

  @override
  String get bookmarksNoBookmarks => 'Ingen bokmerker ennå';

  @override
  String get bookmarksSearchHint => 'Søk i bokmerker';

  @override
  String get bookmarksNoMatches => 'Ingen bokmerker samsvarer med søket';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Laster ned $count bøker',
      one: 'Laster ned 1 bok',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => 'Allerede nedlastet';

  @override
  String bookmarksDeleteCount(int count) {
    return 'Slette $count bokmerke(r)?';
  }

  @override
  String get bookmarksDeleteContent => 'Dette kan ikke angres.';

  @override
  String bookmarksDeletedCount(int count) {
    return 'Slettet $count bokmerke(r)';
  }

  @override
  String get bookmarksJumpTitle => 'Hoppe til bokmerke?';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '«$title» ved $position\ni $bookTitle';
  }

  @override
  String get bookmarksJump => 'Hopp';

  @override
  String get bookmarksNotConnected => 'Ikke koblet til serveren';

  @override
  String get bookmarksCouldNotLoad => 'Kunne ikke laste boken';

  @override
  String bookmarksSelectedCount(int count) {
    return '$count valgt';
  }

  @override
  String get statsTitle => 'Din statistikk';

  @override
  String get statsCouldNotLoad => 'Kunne ikke laste statistikk';

  @override
  String get statsTotalListeningTime => 'TOTAL LYTTETID';

  @override
  String get statsHoursUnit => 't';

  @override
  String get statsMinutesUnit => 'm';

  @override
  String get statsSecondsUnit => 's';

  @override
  String statsDaysOfAudio(String days) {
    return 'Det er $days dager med lyd';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return 'Det er $hours timer med lyd';
  }

  @override
  String get statsToday => 'I dag';

  @override
  String get statsThisWeek => 'Denne uken';

  @override
  String get statsThisMonth => 'Denne måneden';

  @override
  String get statsActivity => 'Aktivitet';

  @override
  String get statsCurrentStreak => 'Nåværende rekke';

  @override
  String get statsBestStreak => 'Beste rekke';

  @override
  String get statsFinished => 'Fullført';

  @override
  String get statsBooksFinished => 'Bøker';

  @override
  String get statsEpisodesFinished => 'Episoder';

  @override
  String get statsBooksThisYear => 'Bøker i år';

  @override
  String get statsEpisodesThisYear => 'Episoder i år';

  @override
  String get statsRemoveFromYearTitle => 'Fjern fra i år';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return 'Fullføringsdatoen forblir $date på serveren. Dette fjerner bare «$title» fra Absorbs liste over bøker i år.';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return 'Fullføringsdatoen forblir på serveren. Dette fjerner bare «$title» fra Absorbs liste over bøker i år.';
  }

  @override
  String get statsRemovedFromYear => 'Fjernet fra i år';

  @override
  String get statsAddBackToYearTitle => 'Legg tilbake i år';

  @override
  String statsAddBackToYearBody(String title) {
    return 'Legge «$title» tilbake i Absorbs liste over bøker i år?';
  }

  @override
  String get statsAddBack => 'Legg tilbake';

  @override
  String get statsAddedBackToYear => 'Lagt tilbake i år';

  @override
  String get statsHiddenFromYear => 'Skjult fra i år';

  @override
  String get statsNothingHidden => 'Ingenting skjult';

  @override
  String get settingsCustomizeStats => 'Tilpass statistikk';

  @override
  String get statsGoalTitle => 'Lyttemål';

  @override
  String get statsGoalOff => 'Av';

  @override
  String get statsGoalDaily => 'Daglig';

  @override
  String get statsGoalWeekly => 'Ukentlig';

  @override
  String get statsGoalMonthly => 'Månedlig';

  @override
  String get statsGoalTarget => 'Mål';

  @override
  String get statsGoalEnterTitle => 'Angi mål';

  @override
  String get statsGoalEnterTimeHint => 'Minutter eller t:mm';

  @override
  String statsBooksShort(int count) {
    return '$count bøker';
  }

  @override
  String get statsBookChallengeTitle => 'Leseutfordring';

  @override
  String get statsBookChallengeDesc => 'Bøker å fullføre i år';

  @override
  String get statsDailyGoal => 'Dagsmål';

  @override
  String get statsWeeklyGoal => 'Ukesmål';

  @override
  String get statsMonthlyGoal => 'Månedsmål';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$done av $target bøker';
  }

  @override
  String get statsGoalReached => 'Målet er nådd';

  @override
  String get statsChartTitle => 'Lyttediagram';

  @override
  String get statsChartBar => 'Søyle';

  @override
  String get statsChartLine => 'Linje';

  @override
  String get statsChartHeatmap => 'Varmekart';

  @override
  String get statsChartDays7 => '7 dager';

  @override
  String get statsChartDays30 => '30 dager';

  @override
  String get statsLast30Days => 'Siste 30 dager';

  @override
  String get statsThisYearTitle => 'I år';

  @override
  String get statsSectionsTitle => 'Seksjoner';

  @override
  String get statsSectionTimePeriods => 'Tidsperioder';

  @override
  String get statsHeatmapLess => 'Mindre';

  @override
  String get statsHeatmapMore => 'Mer';

  @override
  String get statsDayOfWeek => 'Gjennomsnitt per ukedag';

  @override
  String get statsTimeSavedLabel => 'Spart med hastighet';

  @override
  String statsTimeSavedSince(String date) {
    return 'siden $date';
  }

  @override
  String get statsTimeSavedReset => 'Nullstill spart tid';

  @override
  String get statsTimeSavedResetConfirm =>
      'Spart tid begynner å telle på nytt fra i dag.';

  @override
  String get statsTimeSavedResetDone => 'Spart tid nullstilt';

  @override
  String statsOnPaceFor(int count) {
    return 'På vei mot $count bøker';
  }

  @override
  String get statsDaysActive => 'Aktive dager';

  @override
  String get statsDailyAverage => 'Daglig snitt';

  @override
  String get statsLast7Days => 'Siste 7 dager';

  @override
  String get statsMostListened => 'Mest lyttet til';

  @override
  String get statsRecentSessions => 'Siste økter';

  @override
  String get appShellHomeTab => 'Hjem';

  @override
  String get appShellLibraryTab => 'Bibliotek';

  @override
  String get appShellAbsorbingTab => 'Absorbing';

  @override
  String get appShellStatsTab => 'Statistikk';

  @override
  String get appShellSettingsTab => 'Innstillinger';

  @override
  String get appShellDiscoverTab => 'Oppdag';

  @override
  String get appShellShowsTab => 'Programmer';

  @override
  String get appShellPodcastsTab => 'Podkaster';

  @override
  String get libraryTabEpisodes => 'Episoder';

  @override
  String get filterAllEpisodes => 'Alle';

  @override
  String get filterUnplayed => 'Ikke spilt';

  @override
  String get episodeFeedEmpty => 'Ingen episoder samsvarer med dette filteret';

  @override
  String get podcastFilterUpNext => 'Neste';

  @override
  String get podcastFilterNew => 'Nye';

  @override
  String get settingsPodcastTab => 'Podkast-fane';

  @override
  String get settingsPodcastTabDesc =>
      'Gi ett podkastbibliotek en egen fane i nedre linje';

  @override
  String get settingsPodcastTabLibrary => 'Bibliotek for podkast-fanen';

  @override
  String get settingsMergeImpliedByPodcastTab =>
      'Alltid på mens Podkaster-fanen er aktivert';

  @override
  String get settingsEpisodeNotifs => 'Varslingsinnstillinger';

  @override
  String get settingsEpisodeNotifsDesc =>
      'Nye podkastepisoder og kommende bokutgivelser, sjekkes i bakgrunnen';

  @override
  String get notifIntervalOff => 'Av';

  @override
  String notifIntervalMinutes(int n) {
    return 'Hvert $n. minutt';
  }

  @override
  String get notifIntervalHour => 'Hver time';

  @override
  String notifIntervalHours(int n) {
    return 'Hver $n. time';
  }

  @override
  String get settingsBatteryUnrestricted => 'Tillat ubegrenset batteribruk';

  @override
  String get settingsBatteryUnrestrictedDesc =>
      'Hindrer systemet i å sette bakgrunnssjekker på pause på noen telefoner';

  @override
  String get appShellPressBackToExit => 'Trykk tilbake igjen for å avslutte';

  @override
  String get settingsTitle => 'Innstillinger';

  @override
  String get sectionAppearance => 'Utseende';

  @override
  String get languageLabel => 'Språk';

  @override
  String get languageSystemDefault => 'Systemstandard';

  @override
  String get languageHelpTranslateInvite =>
      'Vil du hjelpe til med å oversette Absorb til språket ditt?';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeDark => 'Mørkt';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => 'Lyst';

  @override
  String get themeAuto => 'Auto';

  @override
  String get colorSourceLabel => 'Fargekilde';

  @override
  String get colorSourceCoverDescription =>
      'Appfargene følger omslaget til boken som spilles nå';

  @override
  String get colorSourceWallpaperDescription =>
      'Appfargene følger bakgrunnsbildet i systemet';

  @override
  String get colorSourceWallpaper => 'Bakgrunnsbilde';

  @override
  String get colorSourceNowPlaying => 'Spilles nå';

  @override
  String get colorSourceDynamic => 'Dynamisk';

  @override
  String get colorSourceManual => 'Manuell';

  @override
  String get colorSourceManualDescription =>
      'Bruk en fast appfarge du velger nedenfor';

  @override
  String get colorSourceCustom => 'Egendefinert';

  @override
  String get useColorEverywhereLabel => 'Bruk denne fargen overalt';

  @override
  String get useColorEverywhereSubtitle =>
      'Fargelegg også bokdetaljsider og spillerkortet med fargen du har valgt, i stedet for hver bokes omslag';

  @override
  String get flatBackgroundLabel => 'Flat bakgrunn';

  @override
  String get flatBackgroundSubtitle =>
      'Fjern bakgrunnsgradienten. Ren svart i mørk modus for OLED-skjermer.';

  @override
  String get einkModeLabel => 'E-ink-modus';

  @override
  String get einkModeSubtitle =>
      'Svart-hvitt med høy kontrast og uten animasjoner, laget for e-ink-skjermer';

  @override
  String get einkModeIntroBody =>
      'Laget for e-ink-skjermer. Appen bytter til et flatt svart-hvitt utseende med høy kontrast, animasjoner slås av, avspillingskortet mister bakgrunnen sin, og den direkte serverforbindelsen holdes av for å spare batteri. Avspilling og fremdrift synkroniseres fortsatt som vanlig. Utseendeinnstillingene dine beholdes og kommer tilbake når du slår dette av.';

  @override
  String get einkModeIntroConfirm => 'Slå på';

  @override
  String get backgroundIntensityLabel => 'Bakgrunnsintensitet';

  @override
  String get startScreenLabel => 'Startskjerm';

  @override
  String get startScreenSubtitle => 'Hvilken fane som åpnes når appen starter';

  @override
  String get startScreenHome => 'Hjem';

  @override
  String get startScreenLibrary => 'Bibliotek';

  @override
  String get startScreenAbsorb => 'Absorb';

  @override
  String get startScreenStats => 'Statistikk';

  @override
  String get disablePageFade => 'Slå av sideovergang';

  @override
  String get disablePageFadeOnSubtitle => 'Sider byttes umiddelbart';

  @override
  String get disablePageFadeOffSubtitle => 'Sider tones ved bytte av fane';

  @override
  String get rectangleBookCovers => 'Rektangulære bokomslag';

  @override
  String get progressTextSize => 'Tekststørrelse for fremdrift';

  @override
  String get rectangleBookCoversOnSubtitle =>
      'Omslag vises i bokproporsjon 2:3';

  @override
  String get rectangleBookCoversOffSubtitle => 'Omslag er kvadratiske';

  @override
  String get coverSize => 'Omslagsstørrelse';

  @override
  String get coverSizeSubtitle =>
      'Hvor mange omslag som får plass på tvers i bibliotekrutenettet';

  @override
  String get coverSizeSmall => 'Liten';

  @override
  String get coverSizeMedium => 'Middels';

  @override
  String get coverSizeLarge => 'Stor';

  @override
  String get sectionAbsorbingCards => 'Absorbing-kort';

  @override
  String get fullScreenPlayer => 'Fullskjermspiller';

  @override
  String get fullScreenPlayerOnSubtitle =>
      'På – bøker åpnes i fullskjerm når de spilles';

  @override
  String get fullScreenPlayerOffSubtitle => 'Av – spill av i kortvisning';

  @override
  String get fullBookScrubber => 'Glidebryter for hele boken';

  @override
  String get fullBookScrubberOnSubtitle =>
      'På – glidebryter for hele boken som kan spoles';

  @override
  String get fullBookScrubberOffSubtitle => 'Av – bare fremdriftslinje';

  @override
  String get cardScrubbers => 'Glidebrytere på kort';

  @override
  String get cardScrubbersBoth => 'Begge';

  @override
  String get cardScrubbersChapter => 'Kapittel';

  @override
  String get cardScrubbersLocked => 'Låst';

  @override
  String get cardScrubbersBothSubtitle =>
      'Linjene for hele boken og kapittelet kan spoles';

  @override
  String get cardScrubbersChapterSubtitle => 'Bare kapittellinjen kan spoles';

  @override
  String get cardScrubbersLockedSubtitle => 'Fremdrift vises uten spoling';

  @override
  String get speedAdjustedTime => 'Hastighetsjustert tid';

  @override
  String get speedAdjustedTimeOnSubtitle =>
      'På – alle tider følger avspillingshastigheten din';

  @override
  String get speedAdjustedTimeOffSubtitle => 'Av – viser rå lydvarighet';

  @override
  String get buttonLayout => 'Knappeoppsett';

  @override
  String get buttonLayoutSubtitle =>
      'Hvordan handlingsknappene er ordnet på kortet';

  @override
  String get whenAbsorbed => 'Når absorbert';

  @override
  String get whenAbsorbedInfoTitle => 'Når absorbert';

  @override
  String get whenAbsorbedInfoContent =>
      'Styrer hva som skjer med et Absorbing-kort når du fullfører en bok eller episode.\n\nFullførte kort fjernes automatisk fra Absorbing-skjermen din.';

  @override
  String get whenAbsorbedSubtitle =>
      'Hva som skjer med kortet når en bok eller episode er ferdig';

  @override
  String get whenAbsorbedShowOverlay => 'Vis overlegg';

  @override
  String get whenAbsorbedAutoRelease => 'Frigjør automatisk';

  @override
  String get mergeLibraries => 'Samlet Absorbing-side';

  @override
  String get mergeLibrariesInfoTitle => 'Samlet Absorbing-side';

  @override
  String get mergeLibrariesInfoContent =>
      'Når dette er på, viser Absorbing-skjermen alle bøker og podkaster du holder på med fra alle bibliotek i én visning. Når det er av, vises bare elementer fra biblioteket du har valgt nå.';

  @override
  String get mergeLibrariesOnSubtitle =>
      'Absorbing-siden viser elementer fra alle bibliotek';

  @override
  String get mergeLibrariesOffSubtitle =>
      'Absorbing-siden viser bare gjeldende bibliotek';

  @override
  String get queueMode => 'Kømodus';

  @override
  String get queueModeInfoTitle => 'Kømodus';

  @override
  String get queueModeInfoOff => 'Av';

  @override
  String get queueModeInfoOffDesc =>
      'Avspillingen stopper når gjeldende bok eller episode er ferdig.';

  @override
  String get queueModeInfoManual => 'Manuell kø';

  @override
  String get queueModeInfoManualDesc =>
      'Absorbing-kortene dine fungerer som en spilleliste. Når ett er ferdig, spilles neste ufullførte kort automatisk. Legg til elementer med knappen «Legg til i Absorbing» på en bok eller episode, og endre rekkefølgen fra Absorbing-skjermen.';

  @override
  String get queueModeOff => 'Av';

  @override
  String get queueModeManual => 'Manuell';

  @override
  String get queueModeAuto => 'Auto';

  @override
  String get queueModePlaylist => 'Spilleliste';

  @override
  String get queueModeCollection => 'Samling';

  @override
  String get queueModeInfoPlaylist => 'Spillelistekø';

  @override
  String get queueModeInfoPlaylistDesc =>
      'Spiller elementer i rekkefølge fra en valgt spilleliste og hopper over alt som allerede er fullført. Stopper på slutten av listen.';

  @override
  String get queuePlaylistPickerTitle => 'Velg en spilleliste';

  @override
  String get queuePlaylistNone => 'Ingen spilleliste valgt';

  @override
  String queuePlaylistActiveLabel(String name) {
    return 'Spilleliste: $name';
  }

  @override
  String get queueModePlaylistHint =>
      'Start en spillelistekø ved å åpne en spilleliste på hjemsiden.';

  @override
  String get exit => 'Avslutt';

  @override
  String upNext(String label) {
    return 'Neste: $label';
  }

  @override
  String get nothingUpNext => 'Ingenting neste';

  @override
  String get showUpNextLabel => 'Vis Neste på Absorbing-siden';

  @override
  String get openSeries => 'Åpne serie';

  @override
  String get openPlaylist => 'Åpne spilleliste';

  @override
  String get openCollection => 'Åpne samling';

  @override
  String get playlistPlayAction => 'Spill av spilleliste';

  @override
  String get playlistAllFinished => 'Alt fullført';

  @override
  String get queueModeBooks => 'Bøker';

  @override
  String get queueModePodcasts => 'Podkaster';

  @override
  String get autoDownloadQueue => 'Last ned køen automatisk';

  @override
  String get autoDownloadThisSeriesLabel => 'Last ned denne serien automatisk';

  @override
  String get autoDownloadThisShowLabel => 'Last ned denne podkasten automatisk';

  @override
  String get autoDownloadThisPlaylistLabel =>
      'Last ned denne spillelisten automatisk';

  @override
  String get autoDownloadThisCollectionLabel =>
      'Last ned denne samlingen automatisk';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return 'Hold de neste $count elementene nedlastet';
  }

  @override
  String get autoDownloadQueueOffSubtitle => 'Av – bare manuelle nedlastinger';

  @override
  String get sectionPlayback => 'Avspilling';

  @override
  String get sectionMediaControls => 'Mediekontroller';

  @override
  String get defaultSpeed => 'Standardhastighet';

  @override
  String get defaultSpeedSubtitle =>
      'Nye bøker starter med denne hastigheten – hver bok husker sin egen';

  @override
  String get skipBack => 'Hopp tilbake';

  @override
  String get skipForward => 'Hopp fremover';

  @override
  String get iosLockScreenSkipHint =>
      'Låseskjermen tegner bare tallene iOS har ikoner for (5, 10, 15, 30, 45, 60, 75, 90). Andre verdier viser + på knappen, men hopper likevel med verdien du har valgt.';

  @override
  String get longSkipButtons => 'Knapper for lange hopp';

  @override
  String get longSkipButtonsOnSubtitle =>
      'På – spilleren viser et ekstra, større par hoppknapper';

  @override
  String get longSkipButtonsOffSubtitle => 'Av – bare de vanlige hoppknappene';

  @override
  String get longSkipBack => 'Langt hopp tilbake';

  @override
  String get longSkipForward => 'Langt hopp fremover';

  @override
  String get coverShapeDefault => 'Standard';

  @override
  String get coverShapeSquare => 'Kvadrat';

  @override
  String get coverShapeRectangle => 'Rektangel';

  @override
  String get coverShapeLabel => 'Omslagsform';

  @override
  String get showSubtitles => 'Vis undertitler';

  @override
  String get showSubtitlesOnSubtitle =>
      'Undertitler vises under boktitler i biblioteket og på Hjem';

  @override
  String get showSubtitlesOffSubtitle => 'Av – undertitler bare i bokdetaljene';

  @override
  String get subtitleVisibilityLabel => 'Undertitler';

  @override
  String get subtitleVisibilityDefault => 'Standard';

  @override
  String get subtitleVisibilityShow => 'Vis';

  @override
  String get subtitleVisibilityHide => 'Skjul';

  @override
  String currentLibrarySettingsTitle(String name) {
    return 'Gjeldende bibliotek: $name';
  }

  @override
  String get currentLibrarySkipOverride => 'Egendefinerte hoppverdier';

  @override
  String get currentLibrarySkipOverrideOnSubtitle =>
      'På – dette biblioteket bruker egne hoppverdier';

  @override
  String get currentLibrarySkipOverrideOffSubtitle =>
      'Av – dette biblioteket bruker de globale hoppverdiene';

  @override
  String get currentLibrarySkipBack => 'Hopp tilbake';

  @override
  String get currentLibrarySkipForward => 'Hopp fremover';

  @override
  String get chapterProgressInNotification =>
      'Kapittelfremdrift i varsel og Android Auto';

  @override
  String get chapterProgressOnSubtitle =>
      'På – varsel og Android Auto viser kapittelfremdrift';

  @override
  String get chapterProgressOffSubtitle =>
      'Av – de viser fremdrift for hele boken';

  @override
  String get chapterProgressInNotificationIos =>
      'Kapittelfremdrift på låseskjermen og i CarPlay';

  @override
  String get chapterProgressOnSubtitleIos =>
      'På – låseskjermen og CarPlay viser kapittelfremdrift';

  @override
  String get nowPlayingText => 'Tekst for Spilles nå';

  @override
  String get nowPlayingTextSubtitle =>
      'Velg hva mediekontrollene viser på hver linje';

  @override
  String get nowPlayingTopLine => 'Øverste linje';

  @override
  String get nowPlayingSecondLine => 'Andre linje';

  @override
  String get nowPlayingNotShown => 'Vises ikke';

  @override
  String get nowPlayingTopLineRequired =>
      'Øverste linje må ha minst ett element';

  @override
  String get nowPlayingPieceChapter => 'Kapittel';

  @override
  String get nowPlayingPieceTitle => 'Boktittel';

  @override
  String get nowPlayingPieceNarrator => 'Oppleser';

  @override
  String get nowPlayingPieceSeries => 'Serie';

  @override
  String get nowPlayingPiecePercent => 'Bokprosent';

  @override
  String get nowPlayingPieceChapterNumber => 'Kapittelnummer';

  @override
  String get nowPlayingPieceTimeLeft => 'Tid igjen';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return 'Kap. $number/$total';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return '$time igjen';
  }

  @override
  String get bookDockBadgePending => 'Venter';

  @override
  String get bookDockBadgeExtracting => 'Leser fil';

  @override
  String get bookDockBadgeFetching => 'Slår opp';

  @override
  String get bookDockBadgeError => 'Feil';

  @override
  String get bookDockNeedsReview => 'Må gjennomgås';

  @override
  String get bookDockNoMatch => 'Ingen treff';

  @override
  String get bookDockApplied => 'Brukt';

  @override
  String get bookDockNotApplied => 'Funnede detaljer ikke brukt';

  @override
  String get bookDockNoDestination => 'Ingen destinasjon valgt';

  @override
  String get bookDockNoAuthor => 'Ingen forfatter ennå';

  @override
  String get bookDockLookUpAgain => 'Slå opp igjen';

  @override
  String get bookDockLookingUp => 'Slår opp detaljer på nytt';

  @override
  String get bookDockLookUpFailed => 'Kunne ikke slå opp detaljer';

  @override
  String get bookDockProposedChanges => 'Foreslåtte endringer';

  @override
  String get bookDockNoChanges => 'Ingen detaljer funnet på nettet ennå';

  @override
  String get bookDockStillReading => 'Serveren leser fortsatt denne filen';

  @override
  String get bookDockRoleBook => 'Bok';

  @override
  String get bookDockRoleCover => 'Omslag';

  @override
  String get bookDockRoleMetadata => 'Metadata';

  @override
  String get bookDockRoleExtra => 'Ekstra';

  @override
  String get bookDockFieldTitle => 'Tittel';

  @override
  String get bookDockFieldSubtitle => 'Undertittel';

  @override
  String get bookDockFieldAuthors => 'Forfattere';

  @override
  String get bookDockFieldSeries => 'Serie';

  @override
  String get bookDockFieldPublisher => 'Forlag';

  @override
  String get bookDockFieldYear => 'År';

  @override
  String get bookDockFieldLanguage => 'Språk';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return '$percent % treff';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return 'Havner i $library';
  }

  @override
  String bookDockChangedFields(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count felt',
      one: '1 felt',
    );
    return '$_temp0';
  }

  @override
  String bookDockFilesInEntry(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer i denne oppføringen',
      one: 'Fil i denne oppføringen',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return 'Lagt til $date';
  }

  @override
  String get bookDockAddToLibrary => 'Legg til i bibliotek';

  @override
  String get bookDockUseFound => 'Bruk funnede detaljer';

  @override
  String get bookDockRemoveTitle => 'Fjerne fra Book Dock?';

  @override
  String get bookDockRemoveFailed => 'Kunne ikke fjerne denne filen';

  @override
  String get bookDockPickLibrary => 'Legge til i hvilket bibliotek?';

  @override
  String get bookDockNoLibraries =>
      'Kontoen din kan ikke legge til bøker i et bibliotek';

  @override
  String get bookDockFileFailed =>
      'Kunne ikke legge denne filen til i biblioteket';

  @override
  String get bookDockDuplicateBody =>
      'En fil med dette navnet finnes allerede i det biblioteket. Fjerne den fra Book Dock?';

  @override
  String get bookDockDetailsUpdated => 'Detaljer oppdatert';

  @override
  String get bookDockUseFoundFailed => 'Ingen funnede detaljer å bruke';

  @override
  String bookDockRemoveBody(String title) {
    return 'Dette sletter $title fra serveren.';
  }

  @override
  String bookDockRemoved(String title) {
    return 'Fjernet $title fra Book Dock';
  }

  @override
  String bookDockFiled(String title, String library) {
    return 'La til $title i $library';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return 'Kunne ikke legge til denne filen: $reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return 'Finnes allerede i $library';
  }

  @override
  String get bomatchSearchAll => 'Søk i alle kilder';

  @override
  String get bomatchSearching => 'Søker...';

  @override
  String get bomatchSearchFailed =>
      'Kunne ikke søke etter treff. Sjekk tilkoblingen og prøv igjen.';

  @override
  String get bomatchNoResults => 'Fant ingen treff';

  @override
  String get bomatchStrong => 'Sterke treff';

  @override
  String get bomatchPossible => 'Mulige treff';

  @override
  String get bomatchSourceTimeout => 'tidsavbrudd';

  @override
  String get bomatchSourceBusy => 'opptatt';

  @override
  String get bomatchSourceFailed => 'feilet';

  @override
  String get bomatchLinked => 'Koblet';

  @override
  String get bomatchSameIsbn => 'Samme ISBN';

  @override
  String get bomatchFewDetails => 'Få detaljer';

  @override
  String get bomatchBack => 'Alle resultater';

  @override
  String get bomatchFillEmpty => 'Fyll tomme';

  @override
  String get bomatchTakeAll => 'Ta alle';

  @override
  String get bomatchOnlyDifferences => 'Bare forskjeller';

  @override
  String get bomatchNow => 'Nå';

  @override
  String get bomatchEmpty => 'Tom';

  @override
  String get bomatchKindNew => 'Ny';

  @override
  String get bomatchKindChange => 'Endring';

  @override
  String get bomatchKindSmall => 'Liten endring';

  @override
  String get bomatchKindSame => 'Samme';

  @override
  String get bomatchKindNone => 'Ikke i resultatet';

  @override
  String get bomatchKeep => 'Behold';

  @override
  String get bomatchUse => 'Bruk';

  @override
  String get bomatchMerge => 'Slå sammen';

  @override
  String get bomatchReplace => 'Erstatt';

  @override
  String get bomatchUseThis => 'Bruk denne';

  @override
  String get bomatchChosen => 'Valgt';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count andre bøker',
      one: '1 annen bok',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count endringer',
      one: '1 endring',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nye',
      one: '1 ny',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bruk $count endringer',
      one: 'Bruk 1 endring',
      zero: 'Bruk',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count andre kilder',
      one: '1 annen kilde',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return 'Fra $source';
  }

  @override
  String get breqTitle => 'Bokforespørsler';

  @override
  String get breqTabRequest => 'Be om en bok';

  @override
  String get breqTabMine => 'Mine forespørsler';

  @override
  String get breqTabAll => 'Alle forespørsler';

  @override
  String get breqNoAccess =>
      'Kontoen din kan ikke be om bøker på denne serveren.';

  @override
  String get breqTitleHint => 'Boktittel';

  @override
  String get breqAuthorHint => 'Forfatter';

  @override
  String get breqKindAudiobook => 'Lydbok';

  @override
  String get breqKindEbook => 'E-bok';

  @override
  String get breqKindComic => 'Tegneserie';

  @override
  String get breqSearch => 'Søk';

  @override
  String get breqSearching => 'Søker...';

  @override
  String get breqSearchFailed =>
      'Kunne ikke søke. Sjekk tilkoblingen og prøv igjen.';

  @override
  String get breqSearchPrompt =>
      'Søk etter en bok biblioteket ikke har ennå, for å be om den.';

  @override
  String get breqNoResults => 'Fant ingen bøker som passer';

  @override
  String get breqInLibrary => 'I biblioteket ditt';

  @override
  String get breqYouAsked => 'Du ba om denne';

  @override
  String get breqSomeoneAsked => 'Allerede etterspurt av en annen';

  @override
  String get breqView => 'Vis';

  @override
  String get breqRequest => 'Be om';

  @override
  String get breqRequested => 'Etterspurt';

  @override
  String get breqAddMeToo => 'Legg meg til også';

  @override
  String get breqLibrary => 'Bibliotek';

  @override
  String get breqLibraryApprover => 'La godkjenneren bestemme';

  @override
  String get breqLibraryChoose => 'Velg et bibliotek';

  @override
  String get breqNote => 'Merknad til godkjenneren';

  @override
  String get breqNoteHint => 'Alt som er verdt å vite om denne forespørselen';

  @override
  String get breqAutoApproved => 'Forespørslene dine godkjennes med en gang.';

  @override
  String get breqSubmitted => 'Forespørsel sendt';

  @override
  String get breqJoined => 'Du er lagt til i den eksisterende forespørselen';

  @override
  String get breqFailed => 'Kunne ikke sende forespørselen';

  @override
  String get breqStatusPending => 'Venter';

  @override
  String get breqStatusApproved => 'Godkjent';

  @override
  String get breqStatusRejected => 'Avvist';

  @override
  String get breqStatusCancelled => 'Avbrutt';

  @override
  String get breqStatusSearching => 'Søker';

  @override
  String get breqStatusGrabbed => 'Utgivelse funnet';

  @override
  String get breqStatusDownloading => 'Laster ned';

  @override
  String get breqStatusImporting => 'Importerer';

  @override
  String get breqStatusNeedsReview => 'Må gjennomgås';

  @override
  String get breqStatusAvailable => 'Tilgjengelig';

  @override
  String get breqStatusFailed => 'Mislyktes';

  @override
  String get breqWaitingApproval => 'Venter på godkjenning';

  @override
  String get breqWaitingRelease => 'Venter på at en utgivelse velges';

  @override
  String get breqLookingForRelease => 'Leter etter en utgivelse';

  @override
  String get breqStartingDownload => 'Starter nedlastingen';

  @override
  String get breqAddingToLibrary => 'Legger til i biblioteket';

  @override
  String get breqWaitingCheck => 'Venter på manuell kontroll';

  @override
  String get breqReady => 'Klar i biblioteket ditt';

  @override
  String get breqSomethingWrong => 'Noe gikk galt';

  @override
  String get breqShowHidden => 'Vis skjulte';

  @override
  String get breqHidden => 'Skjult';

  @override
  String get breqMineEmpty => 'Du har ikke bedt om noen bøker ennå.';

  @override
  String get breqAllEmpty => 'Ingen forespørsler ennå.';

  @override
  String get breqLoadFailed => 'Kunne ikke laste forespørsler.';

  @override
  String get breqLoadMore => 'Last inn flere';

  @override
  String get breqApprove => 'Godkjenn';

  @override
  String get breqReject => 'Avvis';

  @override
  String get breqCancel => 'Avbryt forespørsel';

  @override
  String get breqHide => 'Skjul fra listen min';

  @override
  String get breqUnhide => 'Vis i listen min';

  @override
  String get breqLeave => 'Forlat forespørsel';

  @override
  String get breqDelete => 'Slett forespørsel';

  @override
  String get breqOpenBook => 'Åpne bok';

  @override
  String get breqCancelConfirm =>
      'Avbryte denne forespørselen? En pågående nedlasting stoppes også.';

  @override
  String get breqDeleteConfirm =>
      'Slette denne forespørselen? Dette kan ikke angres.';

  @override
  String get breqRejectTitle => 'Avvis forespørsel';

  @override
  String get breqRejectReason => 'Årsak (valgfritt)';

  @override
  String get breqApproveTitle => 'Godkjenn forespørsel';

  @override
  String get breqApproveLibraryNeeded =>
      'Velg biblioteket denne boken skal inn i.';

  @override
  String get breqApprovedToast => 'Forespørsel godkjent';

  @override
  String get breqRejectedToast => 'Forespørsel avvist';

  @override
  String get breqCancelledToast => 'Forespørsel avbrutt';

  @override
  String get breqHiddenToast => 'Skjult fra listen din';

  @override
  String get breqRestoredToast => 'Tilbake i listen din';

  @override
  String get breqDeletedToast => 'Forespørsel slettet';

  @override
  String get breqLeftToast => 'Du forlot denne forespørselen';

  @override
  String get breqActionFailed => 'Kunne ikke oppdatere forespørselen';

  @override
  String get breqFactRequestedBy => 'Etterspurt av';

  @override
  String get breqFactRequestedOn => 'Etterspurt';

  @override
  String get breqFactLibrary => 'Bibliotek';

  @override
  String get breqFactDecidedBy => 'Avgjort av';

  @override
  String get breqFactNote => 'Merknad fra den som ba om boken';

  @override
  String get breqFactDecisionNote => 'Merknad om avgjørelsen';

  @override
  String get breqFactAlsoWanted => 'Også ønsket av';

  @override
  String get breqLibraryCta => 'Be om en bok';

  @override
  String get breqSettingsSubtitle => 'Be om bøker biblioteket ikke har ennå';

  @override
  String get navHoldBookRequests => 'Bokforespørsler';

  @override
  String breqLibraryDefault(String library) {
    return 'Standard ($library)';
  }

  @override
  String breqFailedReason(String reason) {
    return 'Kunne ikke sende forespørselen: $reason';
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
    return 'Laster ned, $percent %';
  }

  @override
  String breqAddedTo(String library) {
    return 'Lagt til i $library';
  }

  @override
  String breqRejectedWithNote(String note) {
    return 'Avvist: $note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return 'Mislyktes: $reason';
  }

  @override
  String breqRequestedBy(String name) {
    return 'Etterspurt av $name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return 'Kunne ikke oppdatere forespørselen: $reason';
  }

  @override
  String breqFooterCta(String query) {
    return 'Be om «$query»';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count forespørsler',
      one: '1 forespørsel',
      zero: 'Ingen forespørsler',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => 'Finn en utgivelse';

  @override
  String get breqTryAnotherRelease => 'Prøv en annen utgivelse';

  @override
  String get breqApproveAndFind => 'Godkjenn og finn en utgivelse';

  @override
  String get breqReviewButton => 'Gjennomgå nedlasting';

  @override
  String get breqStopDownload => 'Stopp nedlasting';

  @override
  String get breqStopDownloadConfirm =>
      'Stoppe denne nedlastingen? Forespørselen settes tilbake til godkjent slik at en annen utgivelse kan velges.';

  @override
  String get breqDiscardImport => 'Forkast nedlasting';

  @override
  String get breqDiscardConfirm =>
      'Forkaste denne nedlastingen? Forespørselen merkes som mislykket og kan prøves igjen med en annen utgivelse.';

  @override
  String get breqFileAnyway => 'Legg til i bibliotek';

  @override
  String get breqFiledToast => 'Lagt til i biblioteket';

  @override
  String get breqDiscardedToast => 'Nedlasting forkastet';

  @override
  String get breqStoppedToast => 'Nedlasting stoppet';

  @override
  String get breqGrabTitle => 'Laste ned denne utgivelsen?';

  @override
  String get breqGrab => 'Last ned';

  @override
  String get breqGrabbed => 'Nedlasting startet';

  @override
  String get breqGrabFailed => 'Kunne ikke starte nedlastingen';

  @override
  String get breqReleaseVipWarning =>
      'Denne trackeren lar bare VIP-kontoer laste ned dette.';

  @override
  String get breqReleaseNoBookFile =>
      'Denne utgivelsen har ingen bokfil BookOrbit kan legge til i et bibliotek.';

  @override
  String get breqReleaseCheckFailed =>
      'Kunne ikke sjekke hva som er i denne utgivelsen. Prøv igjen eller velg en annen.';

  @override
  String get breqCheckingRelease => 'Sjekker filene...';

  @override
  String get breqSearchAgain => 'Søk igjen';

  @override
  String get breqSearchTerms => 'Søkeord';

  @override
  String get breqIsbnHint => 'La stå tomt for å søke etter tittel og forfatter';

  @override
  String get breqSearchingIndexers =>
      'Søker i indekserne dine. Det kan ta opptil ett minutt.';

  @override
  String get breqReleasesFailed => 'Kunne ikke søke etter utgivelser.';

  @override
  String get breqNoSourcesSetUp => 'Ingen søkekilder er satt opp i BookOrbit.';

  @override
  String get breqNoSourcesOn => 'Alle søkekilder er slått av i BookOrbit.';

  @override
  String get breqNoSourceCarries =>
      'Ingen av søkekildene dine har denne typen bok.';

  @override
  String get breqNoReleases => 'Fant ingen utgivelser. Prøv andre søkeord.';

  @override
  String get breqFromCache => 'fra et nylig søk';

  @override
  String get breqIndexerUnauthorized => 'innlogging mislyktes';

  @override
  String get breqIndexerThrottled => 'opptatt';

  @override
  String get breqIndexerTimeout => 'tidsavbrudd';

  @override
  String get breqIndexerUnreachable => 'utilgjengelig';

  @override
  String get breqIndexerNoMedium => 'har ikke dette';

  @override
  String get breqIndexerError => 'feilet';

  @override
  String get breqSortBest => 'Beste treff';

  @override
  String get breqSortSeeders => 'Seedere';

  @override
  String get breqSortSize => 'Størrelse';

  @override
  String get breqSortNewest => 'Nyeste';

  @override
  String get breqFreeleech => 'Freeleech';

  @override
  String get breqVipOnly => 'Bare VIP';

  @override
  String get breqAlreadyGrabbed => 'Lastet ned før';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => 'Tittel';

  @override
  String get breqReasonAuthor => 'Forfatter';

  @override
  String get breqReasonUnknownFormat => 'Ukjent format';

  @override
  String get breqReasonExpectedSize => 'Størrelse';

  @override
  String get breqReasonSuspiciousSize => 'Uvanlig størrelse';

  @override
  String get breqReasonFreeleech => 'Freeleech';

  @override
  String get breqReasonSeveralBooks => 'Flere bøker';

  @override
  String get breqReviewTitle => 'Nedlasting venter på kontroll';

  @override
  String get breqReviewFailed => 'Kunne ikke laste nedlastingsdetaljene.';

  @override
  String get breqReviewDockGone =>
      'De nedlastede filene er ikke lenger i Book Dock.';

  @override
  String get breqReviewNoLibrary =>
      'Denne forespørselen har ikke noe bibliotek å legge boken til i.';

  @override
  String breqGrabFailedReason(String reason) {
    return 'Kunne ikke starte nedlastingen: $reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return 'Kunne ikke sjekke hva som er i denne utgivelsen: $reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return 'Kunne ikke søke etter utgivelser: $reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return 'Kunne ikke laste nedlastingsdetaljene: $reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count utgivelser',
      one: '1 utgivelse',
      zero: 'Ingen utgivelser',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return '$seeders seedere, $leechers leechere';
  }

  @override
  String breqScore(int score) {
    return 'Poengsum $score';
  }

  @override
  String breqReasonPreferredFormat(String format) {
    return 'Foretrukket $format';
  }

  @override
  String breqReasonFormat(String format) {
    return '$format';
  }

  @override
  String breqReasonSeeders(String count) {
    return '$count seedere';
  }

  @override
  String breqReviewScore(int score, int threshold) {
    return 'Treffpoeng $score. Nedlastinger med $threshold eller mer legges til automatisk.';
  }

  @override
  String breqReviewRequested(String value) {
    return 'Etterspurt: $value';
  }

  @override
  String breqReviewImported(String value) {
    return 'Lastet ned: $value';
  }

  @override
  String get breqKindBoth => 'Begge';

  @override
  String get breqEbookLibrary => 'E-bokbibliotek';

  @override
  String get breqAudiobookLibrary => 'Lydbokbibliotek';

  @override
  String get breqRequestBoth => 'Be om begge';

  @override
  String get breqAddMeToBoth => 'Legg meg til på begge';

  @override
  String get breqRequestEbook => 'Be om e-bok';

  @override
  String get breqRequestAudiobook => 'Be om lydbok';

  @override
  String get breqAddMeEbook => 'Legg meg til i e-bokforespørselen';

  @override
  String get breqAddMeAudiobook => 'Legg meg til i lydbokforespørselen';

  @override
  String get breqPairSubmitted => 'Ba om e-boken og lydboken';

  @override
  String get breqPairOneJoined =>
      'Ba om begge. Den ene var allerede på vei, så du ble lagt til i den forespørselen';

  @override
  String get breqJoinedBoth => 'Du er lagt til i begge forespørslene';

  @override
  String get breqJoinsOwned =>
      'Forespørsel sendt. Den slås sammen med kopien som allerede er i biblioteket ditt';

  @override
  String get speedBookmarkInControls =>
      'Hastighet og bokmerke i mediekontroller';

  @override
  String get speedBookmarkOnSubtitle =>
      'På – varselet viser hastighet og bokmerke; kapittelhopp forblir i Android Auto';

  @override
  String get speedBookmarkOffSubtitle =>
      'Av – varselet viser kapittelhopp; hastighet og bokmerke forblir i Android Auto';

  @override
  String get lockSeekBar => 'Lås spolelinjen';

  @override
  String get lockSeekBarOnSubtitle =>
      'På – glidebryteren i varselet, på låseskjermen og i bilen viser fremdrift, men kan ikke dras';

  @override
  String get lockSeekBarOffSubtitle =>
      'Av – dra i glidebryteren i varselet, på låseskjermen og i bilen for å hoppe';

  @override
  String get autoRewindOnResume => 'Spol tilbake automatisk ved gjenopptak';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return 'På – $min s til $max s etter pauselengde';
  }

  @override
  String get autoRewindOffSubtitle => 'Av';

  @override
  String get rewindRange => 'Spoleområde';

  @override
  String get rewindAfterPausedFor => 'Spol tilbake etter pause på';

  @override
  String get rewindAnyPause => 'Enhver pause';

  @override
  String get rewindAlwaysLabel => 'Alltid';

  @override
  String get rewindAlwaysDescription =>
      'Spoler tilbake hver gang du gjenopptar, selv etter korte avbrudd';

  @override
  String rewindAfterDescription(String seconds) {
    return 'Spoler bare tilbake hvis pausen var på $seconds+ sekunder';
  }

  @override
  String get chapterBarrier => 'Kapittelgrense';

  @override
  String get chapterBarrierSubtitle =>
      'Ikke spol automatisk tilbake forbi starten av gjeldende kapittel';

  @override
  String get rewindInstant => 'Umiddelbart';

  @override
  String rewindPause(String duration) {
    return '$duration pause';
  }

  @override
  String get rewindNoRewind => 'ingen spoling';

  @override
  String rewindSeconds(String seconds) {
    return '$seconds s tilbakespoling';
  }

  @override
  String get sectionSleepTimer => 'Sovetimer';

  @override
  String get sleep => 'Søvn';

  @override
  String get sleepTimer => 'Sovetimer';

  @override
  String get shakeDuringSleepTimer => 'Risting under sovetimer';

  @override
  String get shakeOff => 'Av';

  @override
  String get shakeAddTime => 'Legg til tid';

  @override
  String get shakeReset => 'Nullstill';

  @override
  String get shakeAdds => 'Risting legger til';

  @override
  String get sleepAddAmount => 'Tid som legges til';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes min';
  }

  @override
  String get shakeSensitivity => 'Rystefølsomhet';

  @override
  String get shakeSensitivityVeryLow => 'Svært lav';

  @override
  String get shakeSensitivityLow => 'Lav';

  @override
  String get shakeSensitivityMedium => 'Middels';

  @override
  String get shakeSensitivityHigh => 'Høy';

  @override
  String get shakeSensitivityVeryHigh => 'Svært høy';

  @override
  String get buttonDuringSleepTimer => 'Hodetelefonknapp under nedtrapping';

  @override
  String get buttonDuringSleepTimerHint =>
      'Helt mot slutten av nedtrappingen nullstiller ett trykk timeren i stedet for å pause. Dobbelttrykk hopper fortsatt.';

  @override
  String get resetTimerOnPause => 'Nullstill timer ved pause';

  @override
  String get resetTimerOnPauseOnSubtitle =>
      'Timeren starter på nytt med full varighet når du gjenopptar';

  @override
  String get resetTimerOnPauseOffSubtitle =>
      'Timeren fortsetter fra der den stoppet';

  @override
  String get fadeVolumeBeforeSleep => 'Demp lyden før søvn';

  @override
  String get fadeVolumeOnSubtitle =>
      'Senker volumet gradvis de siste 30 sekundene';

  @override
  String get fadeVolumeOffSubtitle =>
      'Avspillingen stopper umiddelbart når timeren er ferdig';

  @override
  String get autoSleepTimer => 'Automatisk sovetimer';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration min';
  }

  @override
  String get autoSleepTimerOffSubtitle =>
      'Start en sovetimer automatisk i et tidsvindu';

  @override
  String get windowStart => 'Vinduet starter';

  @override
  String get windowEnd => 'Vinduet slutter';

  @override
  String get timerDuration => 'Timervarighet';

  @override
  String get timer => 'Timer';

  @override
  String get endOfChapter => 'Slutten av kapittelet';

  @override
  String startMinTimer(int minutes) {
    return 'Start $minutes min timer';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return 'Sov etter $count $label';
  }

  @override
  String get addMoreTime => 'Legg til mer tid';

  @override
  String get cancelTimer => 'Avbryt timer';

  @override
  String chaptersLeftCount(int count) {
    return '$count kap. igjen';
  }

  @override
  String get sectionDownloadsAndStorage => 'Nedlastinger og lagring';

  @override
  String get downloadOverWifiOnly => 'Nedlastingsnettverk';

  @override
  String get downloadOverWifiOnSubtitle => 'Bare Wi-Fi';

  @override
  String get downloadOverWifiOffSubtitle => 'Alle tilkoblinger';

  @override
  String get autoDownloadOnWifi => 'Last ned påbegynte bøker automatisk';

  @override
  String get autoDownloadOnWifiInfoTitle =>
      'Last ned påbegynte bøker automatisk';

  @override
  String get autoDownloadOnWifiInfoContent =>
      'Når du begynner å strømme en bok, lastes hele boken ned i bakgrunnen, slik at du har den frakoblet uten å starte nedlastingen selv. Disse nedlastingene følger innstillingen Nedlastingsnettverk ovenfor, så sett den til Alle tilkoblinger hvis de også skal kjøre på mobildata.';

  @override
  String get autoDownloadOnWifiOnSubtitle =>
      'Strømmede bøker lastes ned automatisk i bakgrunnen';

  @override
  String get autoDownloadOnWifiOffSubtitle => 'Av';

  @override
  String get concurrentDownloads => 'Samtidige nedlastinger';

  @override
  String get autoDownload => 'Automatisk nedlasting';

  @override
  String get autoDownloadSubtitle =>
      'Slå på per serie, podkast, spilleliste eller samling fra detaljsidene deres';

  @override
  String get autoDownloadEnabledFor => 'Slått på for';

  @override
  String get autoDownloadEnabledForNone => 'Ingenting ennå';

  @override
  String get autoDownloadSourceUnnamed => 'Ikke lastet ennå';

  @override
  String get keepNext => 'Behold neste';

  @override
  String get keepNextInfoTitle => 'Behold neste';

  @override
  String get keepNextInfoContent =>
      'Antall elementer som skal holdes nedlastet, inkludert det du lytter til nå. For eksempel betyr «Behold neste 3» at gjeldende bok pluss de neste 2 i serien, podkasten, spillelisten eller samlingen forblir nedlastet. Dette gjelder alle automatiske nedlastinger du slår på.';

  @override
  String get deleteAbsorbedDownloads => 'Slett absorberte nedlastinger';

  @override
  String get deleteAbsorbedDownloadsInfoTitle =>
      'Slett absorberte nedlastinger';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      'Når dette er på, slettes nedlastede bøker eller episoder automatisk fra denne enheten etter at du har fullført dem i Absorb. Å fullføre et element på nettet eller på en annen enhet sletter ikke nedlastingen her.';

  @override
  String get deleteAbsorbedOnSubtitle =>
      'Fullførte elementer fjernes for å spare plass';

  @override
  String get deleteAbsorbedOffSubtitle =>
      'Av – fullførte nedlastinger beholdes';

  @override
  String get downloadLocation => 'Nedlastingsplassering';

  @override
  String get storageUsed => 'Brukt lagring';

  @override
  String storageUsedByDownloads(String size) {
    return '$size brukt av nedlastinger';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return '$free ledig av $total';
  }

  @override
  String get manageDownloads => 'Administrer nedlastinger';

  @override
  String get streamingCache => 'Strømmebuffer';

  @override
  String get streamingCacheInfoTitle => 'Strømmebuffer';

  @override
  String get streamingCacheInfoContent =>
      'Bufrer strømmet lyd på disk slik at den ikke må lastes ned på nytt hvis du spoler tilbake eller lytter til deler på nytt. Bufferet administreres automatisk – de eldste filene fjernes når størrelsesgrensen nås. Dette er atskilt fra fullstendig nedlastede bøker.';

  @override
  String get streamingCacheOff => 'Av';

  @override
  String get streamingCacheOffSubtitle => 'Av – lyd strømmes uten buffer';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size MB – nylig strømmet lyd bufres på disk';
  }

  @override
  String get clearCache => 'Tøm buffer';

  @override
  String get streamingCacheCleared => 'Strømmebuffer tømt';

  @override
  String get sectionLibrary => 'Bibliotek';

  @override
  String get hideEbookOnlyTitles => 'Skjul titler med bare e-bok';

  @override
  String get hideEbookOnlyOnSubtitle => 'Bøker uten lydfiler skjules';

  @override
  String get hideEbookOnlyOffSubtitle => 'Av – alle bibliotekelementer vises';

  @override
  String get homeCardsOpenDetails => 'Åpne detaljer fra Hjem';

  @override
  String get homeCardsOpenDetailsOnSubtitle =>
      'Trykk på et kort under Fortsett å lytte eller Fortsett å lese åpner detaljene';

  @override
  String get homeCardsOpenDetailsOffSubtitle =>
      'Trykk på et kort under Fortsett å lytte eller Fortsett å lese tar deg dit du slapp';

  @override
  String get showGoodreadsButton => 'Vis Goodreads-knapp';

  @override
  String get showGoodreadsOnSubtitle =>
      'Bokdetaljene viser en lenke til Goodreads';

  @override
  String get showGoodreadsOffSubtitle => 'Av – Goodreads-knappen er skjult';

  @override
  String get sectionPermissions => 'Tillatelser';

  @override
  String get notifications => 'Varsler';

  @override
  String get notificationsSubtitle =>
      'For nedlastingsfremdrift og avspillingskontroller';

  @override
  String get notificationsAlreadyEnabled => 'Varsler er allerede aktivert';

  @override
  String get unrestrictedBattery => 'Ubegrenset batteri';

  @override
  String get unrestrictedBatterySubtitle =>
      'Hindrer Android i å avslutte avspilling i bakgrunnen';

  @override
  String get batteryAlreadyUnrestricted => 'Batteriet er allerede ubegrenset';

  @override
  String get sectionIssuesAndSupport => 'Problemer og støtte';

  @override
  String get bugsAndFeatureRequests => 'Feil og funksjonsønsker';

  @override
  String get bugsAndFeatureRequestsSubtitle => 'Opprett en sak på GitHub';

  @override
  String get joinDiscord => 'Bli med på Discord';

  @override
  String get joinDiscordSubtitle => 'Fellesskap, støtte og oppdateringer';

  @override
  String get contact => 'Kontakt';

  @override
  String get contactSubtitle => 'Send enhetsinfo på e-post';

  @override
  String get enableLogging => 'Slå på logging';

  @override
  String get enableLoggingOnSubtitle =>
      'På – logger lagres i fil (start på nytt for å bruke)';

  @override
  String get enableLoggingOffSubtitle => 'Av – ingen logger lagres';

  @override
  String get loggingEnabledSnackbar =>
      'Logging slått på – start appen på nytt for å begynne å logge';

  @override
  String get loggingDisabledSnackbar =>
      'Logging slått av – start appen på nytt for å slutte å logge';

  @override
  String get sendLogs => 'Send logger';

  @override
  String get sendLogsSubtitle => 'Del loggfilen som vedlegg';

  @override
  String failedToShare(String error) {
    return 'Kunne ikke dele: $error';
  }

  @override
  String get clearLogs => 'Tøm logger';

  @override
  String get logsCleared => 'Logger tømt';

  @override
  String get clearLogsQuestion => 'Tømme logger?';

  @override
  String get clearLogsContent =>
      'Dette kan ikke angres. Send dem først hvis du kan trenge dem.';

  @override
  String get sectionAdvanced => 'Avansert';

  @override
  String get localServer => 'Lokal server';

  @override
  String get localServerInfoTitle => 'Lokal server';

  @override
  String get localServerInfoContent =>
      'Hvis du kjører Audiobookshelf-serveren hjemme, kan du angi en lokal URL/LAN-URL her. Absorb bytter automatisk til den raskere lokale tilkoblingen når den oppdager at du er på hjemmenettverket, og går tilbake til den eksterne URL-en når du er borte.';

  @override
  String get localServerOnConnectedSubtitle => 'Koblet til via lokal server';

  @override
  String get localServerOnRemoteSubtitle => 'Aktivert – bruker ekstern server';

  @override
  String get localServerOffSubtitle =>
      'Bytt automatisk til en LAN-server på hjemme-WiFi';

  @override
  String get localServerUrlLabel => 'URL til lokal server';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar =>
      'URL til lokal server er angitt – kobler til automatisk når du er på hjemmenettverket';

  @override
  String get disableAudioFocus => 'Slå av lydfokus';

  @override
  String get disableAudioFocusInfoTitle => 'Lydfokus';

  @override
  String get disableAudioFocusInfoContent =>
      'Som standard gir Android «fokus» til én app om gangen – når Absorb spiller, settes annen lyd (musikk, videoer) på pause. Når du slår av lydfokus, kan Absorb spille sammen med andre apper. Telefonsamtaler setter fortsatt avspillingen på pause uansett denne innstillingen.';

  @override
  String get disableAudioFocusOnSubtitle =>
      'På – spiller sammen med annen lyd (pauser fortsatt for samtaler)';

  @override
  String get disableAudioFocusOffSubtitle =>
      'Av – annen lyd settes på pause når Absorb spiller';

  @override
  String get restartRequired => 'Omstart kreves';

  @override
  String get restartRequiredContent =>
      'Endring av lydfokus krever full omstart for å tre i kraft. Lukke appen nå?';

  @override
  String get closeApp => 'Lukk appen';

  @override
  String get trustAllCertificates => 'Stol på alle sertifikater';

  @override
  String get trustAllCertificatesInfoTitle => 'Selvsignerte sertifikater';

  @override
  String get mp3IndexSeeking => 'MP3-indeksspoling';

  @override
  String get mp3IndexSeekingInfoTitle => 'MP3-indeksspoling';

  @override
  String get mp3IndexSeekingInfoContent =>
      'Slå på dette bare hvis du har MP3-filer som ikke spoler til riktig posisjon. Unøyaktig spoling kommer vanligvis fra MP3-filer med variabel bitrate (VBR). Indeksspoling bygger et nøyaktig tidskart mens filen leses, så det kan ta et øyeblikk å hoppe nær slutten av en stor MP3 – særlig ved strømming, siden filen må leses fram til det punktet. Trer i kraft neste gang en bok eller podkastepisode starter.';

  @override
  String get mp3IndexSeekingOnSubtitle =>
      'På – nøyaktig spoling for VBR MP3-filer';

  @override
  String get mp3IndexSeekingOffSubtitle => 'Av – vanlig spoling';

  @override
  String get trustAllCertificatesInfoContent =>
      'Slå på dette hvis Audiobookshelf-serveren din bruker et selvsignert sertifikat eller en egendefinert rot-CA. Når det er på, hopper Absorb over TLS-sertifikatverifisering for alle tilkoblinger. Slå det på bare hvis du stoler på nettverket ditt.';

  @override
  String get trustAllCertificatesOnSubtitle => 'På – godtar alle sertifikater';

  @override
  String get trustAllCertificatesOffSubtitle =>
      'Av – bare pålitelige sertifikater godtas';

  @override
  String get supportTheDev => 'Støtt utvikleren';

  @override
  String get buyMeACoffee => 'Spander en kaffe';

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
  String get backupAndRestore => 'Sikkerhetskopi og gjenoppretting';

  @override
  String get backupAndRestoreSubtitle =>
      'Lagre eller gjenopprett alle innstillingene dine til/fra en fil';

  @override
  String get backUp => 'Sikkerhetskopier';

  @override
  String get restore => 'Gjenopprett';

  @override
  String get allBookmarks => 'Alle bokmerker';

  @override
  String get allBookmarksSubtitle => 'Se bokmerker på tvers av alle bøker';

  @override
  String get switchAccount => 'Bytt konto';

  @override
  String get addAccount => 'Legg til konto';

  @override
  String get logOut => 'Logg ut';

  @override
  String get includeLoginInfoTitle => 'Ta med innloggingsinfo?';

  @override
  String get includeLoginInfoContent =>
      'Vil du ta med innloggingsopplysninger for alle lagrede kontoer i sikkerhetskopien?\n\nDet gjør det enkelt å gjenopprette på en ny enhet, men filen vil inneholde autentiseringstokenene dine.';

  @override
  String get noSettingsOnly => 'Nei, bare innstillinger';

  @override
  String get yesIncludeAccounts => 'Ja, ta med kontoer';

  @override
  String get backupSavedWithAccounts => 'Sikkerhetskopi lagret (med kontoer)';

  @override
  String get backupSavedSettingsOnly =>
      'Sikkerhetskopi lagret (bare innstillinger)';

  @override
  String backupFailed(String error) {
    return 'Sikkerhetskopiering mislyktes: $error';
  }

  @override
  String get restoreBackupTitle => 'Gjenopprette sikkerhetskopi?';

  @override
  String get restoreBackupContent =>
      'Dette erstatter alle gjeldende innstillinger med verdiene fra sikkerhetskopien.';

  @override
  String fromAbsorbVersion(String version) {
    return 'Fra Absorb v$version';
  }

  @override
  String restoreAccountsChip(int count) {
    return '$count konto(er)';
  }

  @override
  String restoreBookmarksChip(int count) {
    return 'Bokmerker for $count bok/bøker';
  }

  @override
  String get restoreCustomHeadersChip => 'Egendefinerte hoder';

  @override
  String get invalidBackupFile => 'Ugyldig sikkerhetskopifil';

  @override
  String get settingsRestoredSuccessfully => 'Innstillinger gjenopprettet';

  @override
  String restoreFailed(String error) {
    return 'Gjenoppretting mislyktes: $error';
  }

  @override
  String get logOutTitle => 'Logge ut?';

  @override
  String get logOutContent =>
      'Dette logger deg ut. Nedlastingene dine blir værende på denne enheten.';

  @override
  String get signOut => 'Logg ut';

  @override
  String get changePasswordTitle => 'Endre passord';

  @override
  String get changePasswordSubtitle =>
      'Oppdater Audiobookshelf-passordet ditt trygt';

  @override
  String get currentPassword => 'Nåværende passord';

  @override
  String get newPassword => 'Nytt passord';

  @override
  String get confirmNewPassword => 'Bekreft nytt passord';

  @override
  String get passwordChangeEffect =>
      'Når du endrer passordet, logges de andre Audiobookshelf-øktene dine ut. Denne enheten forblir innlogget.';

  @override
  String get passwordFieldsRequired => 'Fyll ut alle passordfeltene';

  @override
  String get passwordsDoNotMatch => 'De nye passordene stemmer ikke overens';

  @override
  String get passwordChanged =>
      'Passord endret. Andre innloggede enheter ble koblet fra.';

  @override
  String get passwordInvalid => 'Det nåværende passordet er feil';

  @override
  String get passwordChangeUnsupported =>
      'Denne serverversjonen støtter ikke trygg passordendring i Absorb';

  @override
  String get passwordChangeFailed => 'Kunne ikke endre passordet ditt';

  @override
  String get otherUserPasswordResetWarning =>
      'Når dette passordet endres, logges brukeren ut på alle enheter.';

  @override
  String get manageSessionsTitle => 'Innloggede enheter';

  @override
  String get manageSessionsSubtitle =>
      'Se gjennom og fjern Audiobookshelf-økter';

  @override
  String get sessionsCurrent => 'Denne enheten';

  @override
  String get sessionsUnknownDevice => 'Ukjent enhet';

  @override
  String sessionsLastActive(String date) {
    return 'Sist aktiv $date';
  }

  @override
  String get sessionsNone => 'Ingen aktive økter';

  @override
  String get sessionsLoadMore => 'Last inn flere';

  @override
  String get sessionsUnsupported =>
      'Øktadministrasjon krever Audiobookshelf 2.36 eller nyere.';

  @override
  String get sessionsLoadFailed => 'Kunne ikke laste innloggede enheter';

  @override
  String get sessionsLegacyNotice =>
      'Denne innloggingen har ingen oppdateringsøkt, så Absorb kan ikke identifisere denne enheten i listen.';

  @override
  String get sessionsRemove => 'Logg ut enhet';

  @override
  String get sessionsRemoveTitle => 'Logge ut denne enheten?';

  @override
  String get sessionsRemoveContent =>
      'Dette fjerner oppdateringsøkten. Gjeldende tilgang kan fortsette å fungere til det kortvarige tokenet utløper.';

  @override
  String get sessionsRemoved => 'Enhet logget ut';

  @override
  String get sessionsRemoveFailed => 'Kunne ikke logge ut den enheten';

  @override
  String get sessionsSignOutAll => 'Logg ut alle enheter';

  @override
  String get sessionsSignOutAllTitle => 'Logge ut overalt?';

  @override
  String get sessionsSignOutAllContent =>
      'Dette fjerner alle oppdateringsøkter, inkludert denne enheten. Eksisterende tilgangstokener kan fungere til de utløper.';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return 'Tidsplanen bruker servertid ($timeZone)';
  }

  @override
  String get podcastScheduleServerTimeUnknown => 'Tidsplanen bruker servertid';

  @override
  String get editServerAddressTitle => 'Rediger serveradresse';

  @override
  String editServerAddressSubtitle(String username) {
    return 'Oppdater adressen for $username. Bruk dette hvis serveradressen har endret seg – det er fortsatt samme server, bare en ny URL. Statistikken og nedlastingene dine beholdes.';
  }

  @override
  String get editServerAddressField => 'Serveradresse';

  @override
  String get editServerAddressUpdated => 'Serveradresse oppdatert';

  @override
  String get editServerAddressFailed => 'Kunne ikke oppdatere serveradressen';

  @override
  String get editServerAddressAction => 'Rediger serveradresse';

  @override
  String get editServerConnectionTitle => 'Rediger servertilkobling';

  @override
  String editServerConnectionSubtitle(String username) {
    return 'Oppdater serveradressen og de egendefinerte hodene for $username. Statistikken og nedlastingene dine beholdes.';
  }

  @override
  String get editServerConnectionAction => 'Rediger servertilkobling';

  @override
  String get editServerConnectionUpdated => 'Servertilkobling oppdatert';

  @override
  String get editServerConnectionFailed =>
      'Kunne ikke oppdatere servertilkoblingen';

  @override
  String get editCustomHeadersDescription =>
      'Brukes for Cloudflare-tunneler eller reverse proxy-er. Disse hodene gjelder bare for denne lagrede kontoen.';

  @override
  String get removeAccountAction => 'Fjern konto';

  @override
  String get removeAccountTitle => 'Fjerne konto?';

  @override
  String removeAccountContent(String username, String server) {
    return 'Fjerne $username på $server fra lagrede kontoer?\n\nDu kan alltid legge den til igjen senere ved å logge inn på nytt.';
  }

  @override
  String get switchAccountTitle => 'Bytte konto?';

  @override
  String switchAccountContent(String username, String server) {
    return 'Bytte til $username på $server?\n\nGjeldende avspilling stoppes, og appen lastes på nytt med den andre kontoens data.';
  }

  @override
  String get switchButton => 'Bytt';

  @override
  String get downloadLocationSheetTitle => 'Nedlastingsplassering';

  @override
  String get downloadLocationSheetSubtitle => 'Velg hvor lydbøker lagres';

  @override
  String get currentLocation => 'Gjeldende plassering';

  @override
  String get existingDownloadsWarning =>
      'Eksisterende nedlastinger blir værende på sin nåværende plassering. Bare nye nedlastinger bruker den nye banen.';

  @override
  String get chooseFolder => 'Velg mappe';

  @override
  String get chooseDownloadFolder => 'Velg nedlastingsmappe';

  @override
  String get storagePermissionDenied =>
      'Lagringstillatelse er permanent avslått – slå den på i appinnstillingene';

  @override
  String get openSettings => 'Åpne innstillinger';

  @override
  String get storagePermissionRequired =>
      'Lagringstillatelse kreves for egendefinerte nedlastingsplasseringer';

  @override
  String get cannotWriteToFolder =>
      'Kan ikke skrive til den mappen – velg en annen plassering eller gi filtilgang i systeminnstillingene';

  @override
  String downloadLocationSetTo(String label) {
    return 'Nedlastingsplassering satt til $label';
  }

  @override
  String get resetToDefault => 'Tilbakestill til standard';

  @override
  String get resetToDefaultStorage => 'Tilbakestill til standard lagring';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count nedlastinger ligger i en gammel egendefinert mappe som ikke lenger kan åpnes. Last dem ned på nytt eller lukk dette varselet.',
      one:
          '1 nedlasting ligger i en gammel egendefinert mappe som ikke lenger kan åpnes. Last den ned på nytt eller lukk dette varselet.',
    );
    return '$_temp0';
  }

  @override
  String get redownload => 'Last ned på nytt';

  @override
  String get redownloadStarted => 'Laster ned på nytt';

  @override
  String get dismiss => 'Lukk';

  @override
  String get tipsAndHiddenFeatures => 'Tips og skjulte funksjoner';

  @override
  String get tipsSubtitle => 'Få mest mulig ut av Absorb';

  @override
  String get adminTitle => 'Serveradmin';

  @override
  String get adminTasksTitle => 'Serveraktivitet';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oppgaver kjører',
      one: '1 oppgave kjører',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => 'Nylig serveraktivitet';

  @override
  String get adminTasksEmpty => 'Ingen serveroppgaver kjører';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return '$added lagt til - $updated oppdatert - $missing mangler';
  }

  @override
  String get adminServer => 'Server';

  @override
  String get adminVersion => 'Versjon';

  @override
  String get adminUsers => 'Brukere';

  @override
  String get adminOnline => 'Tilkoblet';

  @override
  String get adminBackup => 'Sikkerhetskopi';

  @override
  String get adminPurgeCache => 'Tøm buffer';

  @override
  String get adminManage => 'Administrer';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return '$userCount kontoer - $onlineCount tilkoblet';
  }

  @override
  String get adminPodcasts => 'Podkaster';

  @override
  String get adminPodcastsSubtitle =>
      'Søk etter, legg til og administrer programmer';

  @override
  String get adminScan => 'Skann';

  @override
  String get adminScanning => 'Skanner...';

  @override
  String get adminMatchAll => 'Match alle';

  @override
  String get adminMatching => 'Matcher...';

  @override
  String get adminMatchAllTitle => 'Matche alle elementer?';

  @override
  String adminMatchAllContent(String name) {
    return 'Matche metadata for alle elementer i $name? Dette kan ta en stund.';
  }

  @override
  String adminScanStarted(String name) {
    return 'Skanning startet for $name';
  }

  @override
  String get adminBackupCreated => 'Sikkerhetskopi opprettet';

  @override
  String get adminBackupFailed => 'Sikkerhetskopiering mislyktes';

  @override
  String get adminCachePurged => 'Buffer tømt';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => 'Åpne i appen';

  @override
  String get adminRmabAdd => 'Legg til ReadMeABook-integrasjon';

  @override
  String get adminRmabUrlTitle => 'ReadMeABook-URL';

  @override
  String get adminRmabUrlHelp =>
      'Lim inn URL-en din med innloggingstoken. Generer en i RMAB, Admin, Brukere.';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => 'Skriv inn en gyldig http(s)-URL';

  @override
  String get adminRmabSaved => 'ReadMeABook lagret';

  @override
  String get adminRmabRemoved => 'ReadMeABook fjernet';

  @override
  String get adminRmabReload => 'Last på nytt';

  @override
  String get adminRmabLoadFailed =>
      'Kunne ikke laste ReadMeABook. Sjekk URL-en din.';

  @override
  String get adminRmabConnected => 'Tilkoblet';

  @override
  String get adminRmabAskAdmin =>
      'Få en innloggings-URL fra serveradministratoren din';

  @override
  String get adminRmabUrlHelpUser =>
      'Få en innloggings-URL fra serveradministratoren din. De genererer en i RMAB > Admin > Brukere.';

  @override
  String get adminRmabSettingsInfo =>
      'ReadMeABook er en selvdrevet tjeneste for å be om og laste ned lydbøker. Den må installeres og settes opp av serveradministratoren din.';

  @override
  String get rmabConfigTitle => 'Koble til ReadMeABook';

  @override
  String get rmabConfigExplainerAdmin =>
      'ReadMeABook er en selvdrevet tjeneste for å be om lydbøker. Generer et API-token i RMAB under Admin Dashboard > Settings > API, og lim deretter inn server-URL-en og tokenet nedenfor. Absorb er ikke vert for eller laster ned noe innhold, den sender bare forespørsler til serveren din.';

  @override
  String get rmabConfigExplainerUser =>
      'ReadMeABook er en selvdrevet tjeneste for å be om lydbøker. Be serveradministratoren din om RMAB-URL-en og et API-token. Absorb er ikke vert for eller laster ned noe innhold, den sender bare forespørsler til serveren din.';

  @override
  String get rmabConfigLearnMore => 'Les mer om ReadMeABook';

  @override
  String get rmabConfigBaseUrlLabel => 'RMAB-server-URL';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.example.com';

  @override
  String get rmabConfigTokenLabel => 'API-token';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel =>
      'Innloggings-URL for nettgrensesnitt (valgfritt)';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      'Lim inn URL-en din for automatisk innlogging slik at «Åpne i nettleservisning» tar deg inn innlogget. La stå tomt for å bruke vanlig innlogging.';

  @override
  String get rmabConfigHeadersHelp =>
      'Ekstra hoder som sendes med hver ReadMeABook-forespørsel, for reverse proxy-er som Cloudflare Access.';

  @override
  String get rmabConfigConnect => 'Koble til';

  @override
  String get rmabConfigDisconnect => 'Koble fra';

  @override
  String get rmabConfigOpenWebView => 'Åpne i nettleservisning';

  @override
  String rmabConfigConnectedAs(String name) {
    return 'Koblet til som $name';
  }

  @override
  String get rmabConfigErrorInvalidUrl => 'Skriv inn en gyldig http(s)-URL';

  @override
  String get rmabConfigErrorMissingToken => 'Skriv inn API-tokenet ditt';

  @override
  String get rmabConfigErrorUnauthorized => 'Tokenet ble avvist av serveren';

  @override
  String get rmabConfigErrorForbidden =>
      'Dette tokenet har ikke lov til den handlingen';

  @override
  String get rmabConfigErrorNetwork =>
      'Fikk ikke kontakt med RMAB. Sjekk URL-en.';

  @override
  String get rmabConfigErrorGeneric => 'Kunne ikke koble til';

  @override
  String get rmabConfigSavedSnackbar => 'ReadMeABook tilkoblet';

  @override
  String get rmabConfigDisconnectedSnackbar => 'ReadMeABook frakoblet';

  @override
  String get rmabRequestCta => 'Be om via ReadMeABook';

  @override
  String get rmabSearchHeader => 'Be om via ReadMeABook';

  @override
  String get rmabSearchHint => 'Søk etter tittel eller forfatter';

  @override
  String get rmabSearchEmpty => 'Ingen treff på ReadMeABook-serveren din';

  @override
  String get rmabSearchError => 'Kunne ikke søke i ReadMeABook';

  @override
  String get rmabSearchPrompt => 'Skriv en tittel eller forfatter for å søke';

  @override
  String get rmabSearchFooterPrompt => 'Leter du etter noe annet?';

  @override
  String rmabSearchFooterCta(String query) {
    return 'Søk i ReadMeABook etter «$query»';
  }

  @override
  String get rmabBookDetailExplainer =>
      'Denne forespørselen sendes via ReadMeABook-serveren din. Administratoren gjennomgår og behandler den. Du kan følge den under Mine forespørsler på ReadMeABook-flisen.';

  @override
  String get rmabBookAlreadyAvailable => 'Finnes allerede i biblioteket ditt';

  @override
  String get rmabBookAlreadyRequested => 'Allerede etterspurt';

  @override
  String get rmabRequestSubmitting => 'Sender…';

  @override
  String get rmabRequestSent => 'Forespørsel sendt';

  @override
  String get rmabRequestErrorAlreadyAvailable =>
      'Finnes allerede i biblioteket ditt';

  @override
  String get rmabRequestErrorBeingProcessed => 'Behandles allerede';

  @override
  String get rmabRequestErrorDuplicate => 'Du har allerede bedt om denne';

  @override
  String get rmabRequestErrorValidation => 'Kunne ikke sende forespørselen';

  @override
  String get rmabRequestErrorUserNotFound =>
      'Token-brukeren finnes ikke lenger. Koble til ReadMeABook på nytt.';

  @override
  String get rmabRequestErrorIgnored =>
      'Denne boken står på ignoreringslisten din';

  @override
  String get rmabRequestErrorGeneric => 'Kunne ikke sende forespørselen';

  @override
  String get rmabRequestErrorTokenRejected =>
      'Tokenet ble avvist av serveren. Koble til ReadMeABook på nytt.';

  @override
  String get rmabMyRequestsTab => 'Mine forespørsler';

  @override
  String get rmabSetupTab => 'Oppsett';

  @override
  String get rmabMyRequestsEmpty => 'Du har ikke bedt om noen bøker ennå';

  @override
  String get rmabMyRequestsError => 'Kunne ikke laste forespørsler';

  @override
  String get rmabMyRequestsRefresh => 'Oppdater';

  @override
  String get rmabRequestDetailTitle => 'Forespørselsdetaljer';

  @override
  String get rmabRequestDetailStatus => 'Status';

  @override
  String get rmabRequestDetailRequestedOn => 'Etterspurt';

  @override
  String get rmabRequestDetailCompletedOn => 'Fullført';

  @override
  String get rmabRequestDetailProgress => 'Fremdrift';

  @override
  String get rmabStatusActive => 'Pågår';

  @override
  String get rmabStatusWaiting => 'Venter';

  @override
  String get rmabStatusAvailable => 'Tilgjengelig';

  @override
  String get rmabStatusDownloaded => 'Nedlastet';

  @override
  String get rmabStatusFailed => 'Mislyktes';

  @override
  String get rmabStatusCancelled => 'Avbrutt';

  @override
  String get rmabStatusDenied => 'Avslått';

  @override
  String get rmabStatusUnknown => 'Ukjent';

  @override
  String narratedBy(String narrator) {
    return 'Lest av $narrator';
  }

  @override
  String get onAudible => 'på Audible';

  @override
  String percentComplete(String percent) {
    return '$percent % fullført';
  }

  @override
  String get absorbing => 'Absorberer...';

  @override
  String get absorbAgain => 'Absorber igjen';

  @override
  String get absorb => 'Absorber';

  @override
  String get ebookOnlyNoAudio => 'Bare e-bok – ingen lyd';

  @override
  String get absorbAudioNotDownloaded => 'Lyd er ikke lastet ned';

  @override
  String get absorbAudioNotDownloadedEbookOnly =>
      'Lyd er ikke lastet ned, bare e-bok';

  @override
  String get fullyAbsorbed => 'Fullstendig absorbert';

  @override
  String get fullyAbsorbAction => 'Absorber fullstendig';

  @override
  String get removeFromAbsorbing => 'Fjern fra Absorbing';

  @override
  String get addToAbsorbing => 'Legg til i Absorbing';

  @override
  String get absorbNext => 'Absorber neste';

  @override
  String get absorbNextAdded => 'Neste i Absorbing';

  @override
  String get absorbLast => 'Absorber sist';

  @override
  String get absorbNextHint => 'Rett etter det som spilles nå';

  @override
  String get absorbLastHint => 'På slutten av listen';

  @override
  String get removedFromAbsorbing => 'Fjernet fra Absorbing';

  @override
  String get addedToAbsorbing => 'Lagt til i Absorbing';

  @override
  String get removeFromContinueListening => 'Fjern fra Fortsett å lytte';

  @override
  String get removedFromContinueListening => 'Fjernet fra Fortsett å lytte';

  @override
  String get removeFromContinueReading => 'Fjern fra Fortsett å lese';

  @override
  String get removedFromContinueReading => 'Fjernet fra Fortsett å lese';

  @override
  String get sessionAdd => 'Legg til økt';

  @override
  String get sessionStartLabel => 'Startet kl.';

  @override
  String get sessionAdded => 'Økt lagt til';

  @override
  String get sessionAddFailed => 'Kunne ikke legge til økten';

  @override
  String get removeSeriesFromContinueSeries => 'Fjern fra Fortsett serien';

  @override
  String get removedSeriesFromContinueSeries => 'Fjernet fra Fortsett serien';

  @override
  String get couldNotUpdate => 'Kunne ikke oppdatere, prøv igjen';

  @override
  String get addToPlaylist => 'Legg til i spilleliste';

  @override
  String get addToCollection => 'Legg til i samling';

  @override
  String get downloadEbook => 'Last ned e-bok';

  @override
  String get downloadEbookAgain => 'Last ned e-bok på nytt';

  @override
  String get resetProgress => 'Nullstill fremdrift';

  @override
  String get lookupLocalMetadata => 'Slå opp lokal metadata';

  @override
  String get reLookupLocalMetadata => 'Slå opp lokal metadata på nytt';

  @override
  String get clearLocalMetadata => 'Fjern lokal metadata';

  @override
  String get searchOnGoodreads => 'Søk på Goodreads';

  @override
  String get editServerDetails => 'Rediger serverdetaljer';

  @override
  String get encodeTab => 'Kode';

  @override
  String get codec => 'Kodek';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get channels => 'Kanaler';

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String get startM4bEncode => 'Start M4B-koding';

  @override
  String get encodeStarted => 'M4B-koding startet';

  @override
  String get encodeFailed => 'Kunne ikke starte kodingen';

  @override
  String get encodeFinished => 'M4B-koding fullført';

  @override
  String get currentlyLabel => 'Nå:';

  @override
  String encodeOutputPathNote(String path) {
    return 'Ferdig M4B legges i lydbokmappen din på: $path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return 'En sikkerhetskopi av de opprinnelige lydfilene lagres i: /metadata/cache/items/$itemId/. Husk å tømme elementbufferet jevnlig.';
  }

  @override
  String get encodeTimeNote => 'Koding kan ta opptil 30 minutter.';

  @override
  String get encodeRescanNote =>
      'Hvis du har slått av overvåkeren, må du skanne denne lydboken på nytt etterpå.';

  @override
  String get aboutSection => 'Om';

  @override
  String chaptersCount(int count) {
    return 'Kapitler ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return 'Lydspor ($count)';
  }

  @override
  String libraryFilesCount(int count) {
    return 'Bibliotekfiler ($count)';
  }

  @override
  String get chapters => 'Kapitler';

  @override
  String get noChaptersBook => 'Denne boken har ingen kapitler';

  @override
  String get noChaptersPodcast => 'Denne podkasten har ingen kapitler';

  @override
  String get failedToLoad => 'Kunne ikke laste';

  @override
  String startedDate(String date) {
    return 'Påbegynt $date';
  }

  @override
  String finishedDate(String date) {
    return 'Fullført $date';
  }

  @override
  String andCountMore(int count) {
    return 'og $count til';
  }

  @override
  String get markAsFullyAbsorbedQuestion => 'Merke som fullstendig absorbert?';

  @override
  String get markAsFullyAbsorbedContent =>
      'Dette setter fremdriften din til 100 % og stopper avspillingen hvis denne boken spilles.';

  @override
  String get markedAsFinishedNiceWork => 'Merket som fullført – godt jobbet!';

  @override
  String get failedToUpdateCheckConnection =>
      'Kunne ikke oppdatere – sjekk tilkoblingen';

  @override
  String get markAsNotFinishedQuestion => 'Merke som ikke fullført?';

  @override
  String get markAsNotFinishedContent =>
      'Dette fjerner fullført-status og setter posisjonen din tilbake til starten.';

  @override
  String get unmark => 'Fjern merking';

  @override
  String get markedAsNotFinishedBackAtIt =>
      'Merket som ikke fullført – i gang igjen!';

  @override
  String get resetProgressQuestion => 'Nullstille fremdrift?';

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
  String get progressResetFreshStart => 'Fremdrift nullstilt – en ny start!';

  @override
  String get clearLocalMetadataQuestion => 'Fjerne lokal metadata?';

  @override
  String get clearLocalMetadataContent =>
      'Dette fjerner den lokalt lagrede metadataen og går tilbake til det serveren har.';

  @override
  String get localMetadataCleared => 'Lokal metadata fjernet';

  @override
  String get saveEbook => 'Lagre e-bok';

  @override
  String get noEbookFileFound => 'Fant ingen e-bokfil';

  @override
  String get bookmark => 'Bokmerke';

  @override
  String get bookmarks => 'Bokmerker';

  @override
  String bookmarksWithCount(int count) {
    return 'Bokmerker ($count)';
  }

  @override
  String get playbackSpeed => 'Avspillingshastighet';

  @override
  String get noBookmarksYet => 'Ingen bokmerker ennå';

  @override
  String get longPressBookmarkHint =>
      'Trykk lenge på bokmerkeknappen for hurtiglagring';

  @override
  String get addBookmark => 'Legg til bokmerke';

  @override
  String get editBookmark => 'Rediger bokmerke';

  @override
  String get titleLabel => 'Tittel';

  @override
  String get noteOptionalLabel => 'Notat (valgfritt)';

  @override
  String get editLayout => 'Rediger oppsett';

  @override
  String get inMenu => 'I menyen';

  @override
  String get bookmarkAdded => 'Bokmerke lagt til';

  @override
  String get startPlayingSomethingFirst => 'Begynn å spille noe først';

  @override
  String get playbackHistory => 'Avspillingslogg';

  @override
  String get historyLocalTab => 'Logg';

  @override
  String get historyServerTab => 'Økter';

  @override
  String get historyNoServerSessions =>
      'Ingen serverøkter for dette elementet ennå';

  @override
  String get historyServerLoadFailed => 'Kunne ikke laste serverøkter';

  @override
  String get clearHistoryTooltip => 'Tøm logg';

  @override
  String get tapEventToJump =>
      'Trykk på en hendelse for å hoppe til den posisjonen';

  @override
  String get noHistoryYet => 'Ingen logg ennå';

  @override
  String jumpedToPosition(String position) {
    return 'Hoppet til $position';
  }

  @override
  String booksInSeriesCount(int count) {
    return '$count bøker i denne serien';
  }

  @override
  String bookNumber(String number) {
    return 'Bok $number';
  }

  @override
  String downloadRemainingCount(int count) {
    return 'Last ned resten ($count)';
  }

  @override
  String get downloadAll => 'Last ned alle';

  @override
  String get markAllNotFinished => 'Merk alle som ikke fullført';

  @override
  String get markAllFinished => 'Merk alle som fullført';

  @override
  String get markAllNotFinishedQuestion => 'Merke alle som ikke fullført?';

  @override
  String get fullyAbsorbSeries => 'Absorbere serien fullstendig?';

  @override
  String get turnAutoDownloadOff => 'Slå av automatisk nedlasting';

  @override
  String get turnAutoDownloadOn => 'Slå på automatisk nedlasting';

  @override
  String get autoDownloadThisSeries => 'Last ned denne serien automatisk?';

  @override
  String get autoDownloadSeriesContent =>
      'Last ned de neste bøkene automatisk mens du lytter.';

  @override
  String get standalone => 'Frittstående';

  @override
  String get episodes => 'Episoder';

  @override
  String get noEpisodesFound => 'Fant ingen episoder';

  @override
  String get markFinished => 'Merk som fullført';

  @override
  String get markUnfinished => 'Merk som ikke fullført';

  @override
  String get allEpisodes => 'Alle episoder';

  @override
  String get aboutThisEpisode => 'Om denne episoden';

  @override
  String get reversePlayOrder => 'Omvendt avspillingsrekkefølge';

  @override
  String selectedCount(int count) {
    return '$count valgt';
  }

  @override
  String get selectAll => 'Velg alle';

  @override
  String get deselectAll => 'Fjern alle valg';

  @override
  String get autoDownloadThisPodcast => 'Last ned denne podkasten automatisk?';

  @override
  String get autoDownloadPodcastContent =>
      'Last ned de neste episodene automatisk mens du lytter.';

  @override
  String get download => 'Last ned';

  @override
  String get deleteDownload => 'Slett nedlasting';

  @override
  String get casting => 'Caster';

  @override
  String get castingTo => 'Caster til';

  @override
  String get editDetails => 'Rediger detaljer';

  @override
  String get quickMatch => 'Hurtigmatch';

  @override
  String get quickMatchNoUpdates => 'Ingen oppdateringer nødvendig';

  @override
  String get custom => 'Egendefinert';

  @override
  String get authorOptionalLabel => 'Forfatter (valgfritt)';

  @override
  String get noResultsFound =>
      'Ingen resultater.\nPrøv å justere søket eller leverandøren.';

  @override
  String get searchForMetadataAbove => 'Søk etter metadata ovenfor';

  @override
  String get applyThisMatch => 'Bruke dette treffet?';

  @override
  String get metadataUpdated => 'Metadata oppdatert';

  @override
  String get failedToUpdateMetadata => 'Kunne ikke oppdatere metadata';

  @override
  String get subtitleLabel => 'Undertittel';

  @override
  String get authorLabel => 'Forfatter';

  @override
  String get narratorLabel => 'Oppleser';

  @override
  String get seriesLabel => 'Serie';

  @override
  String get addSeries => 'Legg til serie';

  @override
  String get removeSeries => 'Fjern serie';

  @override
  String get descriptionLabel => 'Beskrivelse';

  @override
  String get publisherLabel => 'Forlag';

  @override
  String get yearLabel => 'År';

  @override
  String get genresLabel => 'Sjangere';

  @override
  String get tagsLabel => 'Tagger';

  @override
  String get commaSeparated => 'Kommaseparert';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => 'Omslagsbilde';

  @override
  String get coverRemove => 'Fjern omslag';

  @override
  String get coverRemoveConfirm =>
      'Fjerne omslaget til denne boken? Det genererte tittelkortet vises i stedet.';

  @override
  String get coverRemoved => 'Omslag fjernet';

  @override
  String get coverRemoveFailed => 'Kunne ikke fjerne omslaget';

  @override
  String get coverUrlLabel => 'Omslags-URL';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => 'Lokal metadata';

  @override
  String get overrideLocalDisplay => 'Overstyr lokal visning';

  @override
  String get metadataSavedLocally => 'Metadata lagret lokalt';

  @override
  String get notes => 'Notater';

  @override
  String get newNote => 'Nytt notat';

  @override
  String get editNote => 'Rediger notat';

  @override
  String get noNotesYet => 'Ingen notater ennå';

  @override
  String get markdownIsSupported => 'Markdown støttes';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => 'Beholder formateringen';

  @override
  String get plainTextTxt => 'Ren tekst (.txt)';

  @override
  String get simpleTextNoFormatting => 'Enkel tekst, uten formatering';

  @override
  String get untitledNote => 'Notat uten tittel';

  @override
  String get titleHint => 'Tittel';

  @override
  String get noteBodyHint => 'Skriv notatet ditt... (støtter markdown)';

  @override
  String get nothingToPreview => 'Ingenting å forhåndsvise';

  @override
  String get audioEnhancements => 'Lydforbedringer';

  @override
  String get presets => 'FORHÅNDSINNSTILLINGER';

  @override
  String get equalizer => 'EQUALIZER';

  @override
  String get effects => 'EFFEKTER';

  @override
  String get bassBoost => 'Bassforsterkning';

  @override
  String get surround => 'Surround';

  @override
  String get loudness => 'Loudness';

  @override
  String get monoAudio => 'Monolyd';

  @override
  String get skipSilence => 'Hopp over stillhet';

  @override
  String get resetAll => 'Nullstill alt';

  @override
  String get collectionNotFound => 'Fant ikke samlingen';

  @override
  String get deleteCollection => 'Slett samling';

  @override
  String get deleteCollectionContent =>
      'Er du sikker på at du vil slette denne samlingen?';

  @override
  String get deleteCollectionFailed => 'Kunne ikke slette samlingen';

  @override
  String get deletePermissionRequired =>
      'Slettetillatelse kreves. Be root-administratoren om å gi deg slettetillatelsen.';

  @override
  String get deleteFilesCheckbox => 'Slett også filene på serveren';

  @override
  String get deleteFilesCheckedHint => 'Filene slettes permanent fra serveren.';

  @override
  String get deleteFilesUncheckedHint =>
      'Filene blir værende på serveren, så neste bibliotekskanning kan legge dette til igjen.';

  @override
  String get deleteFromServerAction => 'Slett fra server';

  @override
  String get deleteFromServerTitle => 'Slett fra server';

  @override
  String deleteFromServerContent(String title) {
    return 'Slette «$title» fra Audiobookshelf?';
  }

  @override
  String deletedFromServer(String title) {
    return 'Slettet «$title»';
  }

  @override
  String get deleteFromServerFailed =>
      'Kunne ikke slette det. Sjekk serverloggene.';

  @override
  String get playlistNotFound => 'Fant ikke spillelisten';

  @override
  String get deletePlaylist => 'Slett spilleliste';

  @override
  String get deletePlaylistContent =>
      'Er du sikker på at du vil slette denne spillelisten?';

  @override
  String get newPlaylist => 'Ny spilleliste';

  @override
  String get playlistNameHint => 'Navn på spilleliste';

  @override
  String addedToName(String name) {
    return 'Lagt til i «$name»';
  }

  @override
  String get failedToAdd => 'Kunne ikke legge til';

  @override
  String get newCollection => 'Ny samling';

  @override
  String get collectionNameHint => 'Navn på samling';

  @override
  String get listsNewCollectionSubtitle =>
      'Grupper bøker i en liste du beholder';

  @override
  String get listsNewCollectionNeedsBookSubtitle =>
      'Start den med minst én bok';

  @override
  String get listsNewPlaylistSubtitle =>
      'Sett opp bøker du vil lytte til i rekkefølge';

  @override
  String get listsAddBooksNow => 'Legg til bøker nå';

  @override
  String get listsPickBooksNext =>
      'Du velger bøker neste. En samling på denne serveren må ha minst én.';

  @override
  String get listsCreate => 'Opprett';

  @override
  String get listsCollectionNeedsBook =>
      'En samling trenger minst én bok, så ingenting ble opprettet.';

  @override
  String get listsCreateFailed => 'Kunne ikke opprette den';

  @override
  String get castToDevice => 'Cast til enhet';

  @override
  String get searchingForCastDevices => 'Søker etter Cast-enheter...';

  @override
  String get castDevice => 'Cast-enhet';

  @override
  String get stopCasting => 'Stopp casting';

  @override
  String get disconnect => 'Koble fra';

  @override
  String get audioOutput => 'Lydutgang';

  @override
  String get noOutputDevicesFound => 'Fant ingen utgangsenheter';

  @override
  String get welcomeToAbsorb => 'Velkommen til Absorb Plus';

  @override
  String get welcomeTagline => 'En Audiobookshelf-klient.';

  @override
  String get welcomeAbsorbingTitle => 'Absorbing';

  @override
  String get welcomeAbsorbingIntro =>
      'Vi bruker «absorbere» i stedet for «spille av» og «lytte». Foretrekker du de klassiske ordene? Bytt i Innstillinger.';

  @override
  String get welcomeAbsorbingTabBullet =>
      'Absorbing-fanen – det du lytter til nå';

  @override
  String get welcomeAbsorbButtonBullet => 'Absorber-knappen – start avspilling';

  @override
  String get welcomeFullyAbsorbBullet =>
      'Absorber fullstendig – merk som fullført';

  @override
  String get welcomeGettingAroundTitle => 'Finn frem';

  @override
  String get welcomeGettingAroundBody =>
      'Trykk på et omslag for å åpne detaljene. Kortene under Fortsett å lytte er annerledes – trykk for å spille av med en gang, trykk og hold for å åpne detaljer.';

  @override
  String get welcomeMakeItYoursTitle => 'Gjør den til din egen';

  @override
  String get welcomeMakeItYoursBody =>
      'Utforsk Innstillinger for å tilpasse Absorb etter din smak. Delen Tips og skjulte funksjoner der er verdt et besøk.';

  @override
  String get getStarted => 'Kom i gang';

  @override
  String get showMore => 'Vis mer';

  @override
  String get showLess => 'Vis mindre';

  @override
  String get readMore => 'Les mer';

  @override
  String get removeDownloadQuestion => 'Fjerne nedlasting?';

  @override
  String get removeDownloadContent => 'Dette fjernes fra enheten din.';

  @override
  String get removeWhichDownload =>
      'Både lydboken og e-boken ligger på denne enheten. Velg hva som skal fjernes.';

  @override
  String get downloadRemoved => 'Nedlasting fjernet';

  @override
  String get finished => 'Fullført';

  @override
  String get saved => 'Nedlastet';

  @override
  String get selectLibrary => 'Velg bibliotek';

  @override
  String get switchLibraryTooltip => 'Bytt bibliotek';

  @override
  String get refreshTooltip => 'Oppdater';

  @override
  String get noBooksFound => 'Fant ingen bøker';

  @override
  String get userFallback => 'Bruker';

  @override
  String get rootAdmin => 'Root-administrator';

  @override
  String get admin => 'Administrator';

  @override
  String get serverAdmin => 'Serveradmin';

  @override
  String get serverAdminSubtitle =>
      'Administrer brukere, bibliotek og serverinnstillinger';

  @override
  String serverUpdateAvailable(String version) {
    return 'Serveroppdatering $version er tilgjengelig';
  }

  @override
  String get justNow => 'Nå nettopp';

  @override
  String minutesAgo(int count) {
    return '$count min siden';
  }

  @override
  String hoursAgo(int count) {
    return '$count t siden';
  }

  @override
  String daysAgo(int count) {
    return '$count d siden';
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
  String get coverPlayPause => 'Spill av/pause med omslag';

  @override
  String get coverPlayPauseOnSubtitle =>
      'På – trykk på omslaget for å spille av/pause';

  @override
  String get coverPlayPauseOffSubtitle =>
      'Av – egen avspillings-/pauseknapp i kontrollene';

  @override
  String get cardBackground => 'Kortbakgrunn';

  @override
  String get cardBackgroundBlurred => 'Uskarp';

  @override
  String get cardBackgroundGradient => 'Gradient';

  @override
  String get queueModeMergedSubtitle =>
      'Avspillingen stopper, manuell kø eller spiller neste element automatisk';

  @override
  String get queueModeSeriesLabel => 'Serie';

  @override
  String get queueModeShowLabel => 'Program';

  @override
  String get queueModeInfoSeries => 'Serie';

  @override
  String get queueModeInfoSeriesDesc =>
      'Spiller automatisk neste bok i en serie eller neste episode i et podkastprogram.';

  @override
  String get resetButtonGridQuestion => 'Nullstille knapperutenettet?';

  @override
  String get resetButtonGridContent =>
      'Dette gjenoppretter standard knappeoppsett, rekkefølge og av/på-innstillinger.';

  @override
  String get reset => 'Nullstill';

  @override
  String get buttonGridReset => 'Knapperutenett nullstilt';

  @override
  String get resetButtonGrid => 'Nullstill knapperutenett';

  @override
  String get chapterBarrierOnRewind => 'Kapittelgrense ved tilbakespoling';

  @override
  String get chapterBarrierInfoTitle => 'Kapittelgrense';

  @override
  String get chapterBarrierInfoContent =>
      'Når du hopper tilbake, går avspillingen til starten av gjeldende kapittel i stedet for å krysse inn i det forrige.\n\nDobbelttrykk på tilbakehoppknappen innen 2 sekunder for å bryte gjennom grensen.';

  @override
  String get chapterBarrierOnRewindOnSubtitle =>
      'På – tilbakespoling stopper ved kapittelstart';

  @override
  String get chapterBarrierOnRewindOffSubtitle =>
      'Av – tilbakespoling krysser kapittelgrenser';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return 'På -$min s til $max s etter pauselengde';
  }

  @override
  String get rewindOnSessionStart => 'Spol tilbake ved øktstart';

  @override
  String get rewindOnSessionStartInfoContent =>
      'Vanlig automatisk tilbakespoling utløses når du gjenopptar etter en pause i en aktiv økt. Denne innstillingen legger til en tilbakespoling når en helt ny økt starter – for eksempel etter at appen ble lukket, avspillingen ble stoppet eller du åpner appen på nytt.\n\nNår den er på, spoles avspillingen tilbake med full maksimal tilbakespoling i starten av hver ny økt, slik at du kan høre igjen der du slapp.';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return 'På – spoler tilbake $seconds s ved start av en ny økt';
  }

  @override
  String rewindActivationDelayValue(String seconds) {
    return '$seconds s+';
  }

  @override
  String rewindRangeValue(String min, String max) {
    return '$min s – $max s';
  }

  @override
  String rewindSecondsPause(String seconds) {
    return '$seconds s pause';
  }

  @override
  String rewindMinPause(String minutes) {
    return '$minutes min pause';
  }

  @override
  String rewindHrPause(String hours) {
    return '$hours t pause';
  }

  @override
  String get rewindOneHrPause => '1 t pause';

  @override
  String speedValue(String speed) {
    return '${speed}x';
  }

  @override
  String secondsValue(String seconds) {
    return '$seconds s';
  }

  @override
  String minutesValue(int minutes) {
    return '$minutes min';
  }

  @override
  String get chimeBeforeSleep => 'Klokkeslag før søvn';

  @override
  String get chimeBeforeSleepOnSubtitle =>
      'Spiller en mild bjelle når timeren snart er ferdig';

  @override
  String get chimeBeforeSleepOffSubtitle => 'Ingen lydvarsel før søvn';

  @override
  String get windDownDuration => 'Nedtrappingstid';

  @override
  String windDownDurationSubtitle(int seconds) {
    return 'Dempingen og klokkeslaget starter $seconds s før søvn';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return 'Senker volumet gradvis de siste $seconds s';
  }

  @override
  String autoSleepTimerEnabledSubtitle(
    String start,
    String end,
    String duration,
  ) {
    return '$start – $end · $duration';
  }

  @override
  String get endOfChapterShort => 'Slutten av kapittelet';

  @override
  String get endOfChapterOnSubtitle => 'Stopp på slutten av gjeldende kapittel';

  @override
  String get endOfChapterOffSubtitle => 'Bruk en tidsstyrt sovetimer';

  @override
  String get showExplicitBadge => 'Vis eksplisitt-merke';

  @override
  String get showExplicitBadgeOnSubtitle =>
      'Eksplisitte elementer får et «E»-merke';

  @override
  String get showExplicitBadgeOffSubtitle => 'Av – eksplisitt-merket er skjult';

  @override
  String get showEbookBadge => 'Vis e-bokmerke';

  @override
  String get showEbookBadgeOnSubtitle =>
      'Bøker med e-bok får et bokikon på omslaget';

  @override
  String get showEbookBadgeOffSubtitle => 'Av – e-bokmerket er skjult';

  @override
  String get libraryFallback => 'Bibliotek';

  @override
  String get preReleaseUpdatesInfoTitle => 'Forhåndsutgivelser';

  @override
  String get preReleaseUpdatesInfoContent =>
      'Når dette er på, varsler oppdateringssjekken deg også om alfa- og forhåndsutgivelser fra GitHub. De kan være mindre stabile, men har de nyeste funksjonene og rettelsene.';

  @override
  String get includePreReleases => 'Ta med forhåndsutgivelser';

  @override
  String get includePreReleasesOnSubtitle =>
      'På – ser etter alfa- og forhåndsutgivelser';

  @override
  String get includePreReleasesOffSubtitle => 'Av – bare stabile utgivelser';

  @override
  String get setTooltip => 'Angi';

  @override
  String get saveAbsorbBackup => 'Lagre Absorb-sikkerhetskopi';

  @override
  String get checkForUpdate => 'Se etter oppdatering';

  @override
  String get onLatestVersion => 'Du har den nyeste versjonen';

  @override
  String get updateAvailable => 'Oppdatering tilgjengelig';

  @override
  String get preReleaseAvailable => 'Forhåndsutgivelse tilgjengelig';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'En ny $kind av Absorb er tilgjengelig: $latest\n\nDu bruker $current.';
  }

  @override
  String get updateKindPreRelease => 'forhåndsutgivelse';

  @override
  String get updateKindVersion => 'versjon';

  @override
  String get downloadButton => 'Last ned';

  @override
  String get updateDownloading => 'Laster ned oppdatering...';

  @override
  String get updateInstallPermissionDenied =>
      'Installasjonstillatelse nektet. Slå på «Installer ukjente apper» for Absorb i systeminnstillingene.';

  @override
  String get updateOpeningInBrowser =>
      'Oppdatering i appen mislyktes, åpner nettleseren';

  @override
  String get sendToEreader => 'Send til e-leser';

  @override
  String sendingToEreader(String device) {
    return 'Sender til $device ...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return 'Sendt til $device';
  }

  @override
  String get sendToEreaderFailed => 'Kunne ikke sende e-boken';

  @override
  String get pickEreaderDevice => 'Velg en enhet';

  @override
  String get adminEmail => 'E-post';

  @override
  String get adminEmailSubtitle => 'SMTP og e-leserenheter';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => 'Oppsettguide';

  @override
  String get smtpHost => 'Vert';

  @override
  String get smtpPort => 'Port';

  @override
  String get smtpSecure => 'Sikker';

  @override
  String get smtpRejectUnauthorized => 'Avvis uautorisert TLS';

  @override
  String get smtpUser => 'Brukernavn';

  @override
  String get smtpPass => 'Passord';

  @override
  String get smtpFromAddress => 'Avsenderadresse';

  @override
  String get smtpTestAddress => 'Testadresse';

  @override
  String get smtpSendTest => 'Send test';

  @override
  String get smtpSaveSettings => 'Lagre';

  @override
  String get smtpSaved => 'E-postinnstillinger lagret';

  @override
  String get smtpSaveFailed => 'Kunne ikke lagre e-postinnstillingene';

  @override
  String get smtpTestSent => 'Test-e-post sendt';

  @override
  String get smtpTestFailed => 'Test-e-posten mislyktes';

  @override
  String get ereaderDevicesTitle => 'E-leserenheter';

  @override
  String get ereaderDevicesEmpty => 'Ingen enheter ennå. Legg til en nedenfor.';

  @override
  String get addEreaderDevice => 'Legg til enhet';

  @override
  String get editEreaderDevice => 'Rediger enhet';

  @override
  String get deleteEreaderDevice => 'Slett';

  @override
  String get ereaderDeviceName => 'Navn';

  @override
  String get ereaderDeviceEmail => 'E-post';

  @override
  String get ereaderAvailability => 'Hvem kan bruke denne enheten';

  @override
  String get ereaderAvailAdminOrUp => 'Bare administratorer';

  @override
  String get ereaderAvailUserOrUp => 'Alle brukere';

  @override
  String get ereaderAvailGuestOrUp => 'Alle';

  @override
  String get ereaderAvailSpecificUsers => 'Bestemte brukere';

  @override
  String ereaderSpecificUsersN(int count) {
    return 'Bestemte brukere ($count)';
  }

  @override
  String get ereaderDevicesSaved => 'Enheter lagret';

  @override
  String get ereaderDevicesSaveFailed => 'Kunne ikke lagre enhetene';

  @override
  String libraryCountOne(int count) {
    return '$count bibliotek';
  }

  @override
  String libraryCountOther(int count) {
    return '$count bibliotek';
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
      'Sortert etter posisjon (omvendt)';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '«$title» ved $position';
  }

  @override
  String get deleteBookmarkQuestion => 'Slette bokmerket?';

  @override
  String get cardIconsOnlyChip => 'Bare ikoner';

  @override
  String get cardMoreInGridChip => '«Mer» i rutenett';

  @override
  String get cardLayoutHidden => 'Skjult';

  @override
  String get speed => 'Hastighet';

  @override
  String get details => 'Detaljer';

  @override
  String get episodeDetailsLabel => 'Episodedetaljer';

  @override
  String get bookDetailsLabel => 'Bokdetaljer';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => 'Equalizer';

  @override
  String get cast => 'Cast';

  @override
  String castingToDevice(String device) {
    return 'Caster til $device';
  }

  @override
  String castToDeviceNamed(String device) {
    return 'Cast til $device';
  }

  @override
  String get historyShort => 'Historikk';

  @override
  String atPosition(String position) {
    return 'ved $position';
  }

  @override
  String chaptersChip(int count) {
    return '$count kapitler';
  }

  @override
  String chapterNumber(int number) {
    return 'Kapittel $number';
  }

  @override
  String kbpsValue(int value) {
    return '$value kbps';
  }

  @override
  String get fileInfoTitle => 'Filinfo';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => 'Denne boken har ingen fildetaljer.';

  @override
  String get fileInfoAudio => 'Lyd';

  @override
  String get fileInfoEbook => 'E-bok';

  @override
  String get fileInfoOther => 'Andre filer';

  @override
  String get fileInfoBookOrbitNote =>
      'BookOrbit oppgir ikke kodek eller bitrate.';

  @override
  String fileInfoChannels(int count) {
    return '$count kanaler';
  }

  @override
  String get fileInfoCover => 'Omslag';

  @override
  String get fileInfoMetadata => 'Metadata';

  @override
  String get fileInfoSupplement => 'Tillegg';

  @override
  String get fileInfoPathCopied => 'Sti kopiert';

  @override
  String get resetMayNotHaveSynced =>
      'Tilbakestillingen er kanskje ikke synkronisert – sjekk serveren din';

  @override
  String failedToDownloadEbook(int code) {
    return 'Kunne ikke laste ned e-boken ($code)';
  }

  @override
  String get serverReturnedErrorPage =>
      'Serveren returnerte en feilside i stedet for e-bokfilen';

  @override
  String ebookSaved(String filename) {
    return 'Lagret: $filename';
  }

  @override
  String errorSavingEbook(String error) {
    return 'Feil ved lagring av e-bok: $error';
  }

  @override
  String failedToSaveError(String error) {
    return 'Kunne ikke lagre: $error';
  }

  @override
  String get adminBackupsLabel => 'Sikkerhetskopier';

  @override
  String get adminListeningNow => 'Lytter nå';

  @override
  String get adminLibraries => 'Bibliotek';

  @override
  String get adminLibraryShows => 'programmer';

  @override
  String get adminLibraryBooks => 'bøker';

  @override
  String get adminLibraryFolders => 'mapper';

  @override
  String get adminLibrarySize => 'størrelse';

  @override
  String get adminLibraryDuration => 'varighet';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count manglende eller ugyldige elementer',
      one: '1 manglende eller ugyldig element',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => 'Gjennomgå';

  @override
  String get adminMissingTitle => 'Manglende elementer';

  @override
  String adminMissingSubtitle(String library) {
    return 'Oppføringer i $library der filene mangler eller er uleselige';
  }

  @override
  String get adminMissingNone => 'Ingen manglende eller ugyldige elementer';

  @override
  String get adminMissingBadge => 'Mangler';

  @override
  String get adminInvalidBadge => 'Ugyldig';

  @override
  String get adminMissingDeleteTitle => 'Fjern oppføring';

  @override
  String adminMissingDeleteOneContent(String title) {
    return 'Fjerne «$title» fra Audiobookshelf?';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return 'Fjerne $count oppføringer fra Audiobookshelf?';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return 'Slett $count';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return 'Fjernet $title';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fjernet $count oppføringer',
      one: 'Fjernet 1 oppføring',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => 'Kunne ikke slette oppføringen';

  @override
  String get adminMatchAction => 'Match';

  @override
  String adminMatchingStarted(String name) {
    return 'Matching startet for $name';
  }

  @override
  String get adminMatchFailed => 'Mislyktes';

  @override
  String adminScanFailed(String name) {
    return 'Kunne ikke skanne $name';
  }

  @override
  String get adminPurgeCacheFailed => 'Mislyktes';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => 'admin';

  @override
  String get adminUsersDisabledBadge => 'deaktivert';

  @override
  String get adminUsersEditUserTooltip => 'Rediger bruker';

  @override
  String get adminUsersOnlineNow => 'Pålogget nå';

  @override
  String adminUsersLastSeen(String time) {
    return 'Sist sett $time';
  }

  @override
  String get adminUsersNever => 'Aldri';

  @override
  String get adminUsersTotal => 'Totalt';

  @override
  String get adminUsersNoReadingActivity => 'Ingen leseaktivitet';

  @override
  String get adminUsersLoadingDots => 'Laster ...';

  @override
  String get adminUsersLoadMoreSessions => 'Last inn flere økter';

  @override
  String get adminUsersNoRecentSessions => 'Ingen nylige økter';

  @override
  String get adminUsersLibraryProgress => 'Bibliotekfremdrift';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return 'Last inn flere ($count gjenstår)';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return '$count md. siden';
  }

  @override
  String get adminUsersNewUser => 'Ny bruker';

  @override
  String get adminUsersEditUser => 'Rediger bruker';

  @override
  String get adminUsersUsername => 'Brukernavn';

  @override
  String get adminUsersEnterUsername => 'Skriv inn brukernavn';

  @override
  String get adminUsersPassword => 'Passord';

  @override
  String get adminUsersNewPassword => 'Nytt passord';

  @override
  String get adminUsersEnterPassword => 'Skriv inn passord';

  @override
  String get adminUsersLeaveBlankToKeep =>
      'La stå tomt for å beholde gjeldende';

  @override
  String get adminUsersAccountType => 'Kontotype';

  @override
  String get adminUsersTypeGuest => 'Gjest';

  @override
  String get adminUsersTypeUser => 'Bruker';

  @override
  String get adminUsersTypeAdmin => 'Administrator';

  @override
  String get adminUsersStatus => 'Status';

  @override
  String get adminUsersAccountActive => 'Konto aktiv';

  @override
  String get adminUsersAccountActiveSub =>
      'Deaktiverte kontoer kan ikke logge inn';

  @override
  String get adminUsersLocked => 'Låst';

  @override
  String get adminUsersLockedSub => 'Hindrer passordendringer';

  @override
  String get adminUsersPermissions => 'Tillatelser';

  @override
  String get adminUsersPermDownload => 'Last ned';

  @override
  String get adminUsersPermUpdate => 'Oppdater';

  @override
  String get adminUsersPermUpdateSub =>
      'Rediger metadata og bibliotekelementer';

  @override
  String get adminUsersPermDelete => 'Slett';

  @override
  String get adminUsersPermUpload => 'Last opp';

  @override
  String get adminUsersPermExplicit => 'Eksplisitt innhold';

  @override
  String get adminUsersLibraryAccess => 'Bibliotektilgang';

  @override
  String get adminUsersAccessAllLibraries => 'Tilgang til alle bibliotek';

  @override
  String get adminUsersCreateUser => 'Opprett bruker';

  @override
  String get adminUsersSaveChanges => 'Lagre endringer';

  @override
  String get adminUsersUsernameRequired => 'Brukernavn er påkrevd';

  @override
  String get adminUsersPasswordRequired => 'Passord er påkrevd';

  @override
  String get adminUsersUserCreated => 'Bruker opprettet';

  @override
  String get adminUsersUserUpdated => 'Bruker oppdatert';

  @override
  String get adminUsersFailedCreate => 'Kunne ikke opprette brukeren';

  @override
  String get adminUsersFailedUpdate => 'Kunne ikke oppdatere brukeren';

  @override
  String get adminUsersThisUser => 'denne brukeren';

  @override
  String get adminUsersDeleteUserTitle => 'Slette brukeren?';

  @override
  String adminUsersDeleteUserContent(String name) {
    return 'Slette $name permanent?';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return '$name slettet';
  }

  @override
  String get adminUsersFailedDelete => 'Kunne ikke slette brukeren';

  @override
  String get adminUsersUnlinkOpenId => 'Koble fra OpenID';

  @override
  String get adminUsersUnlinkOpenIdTitle => 'Koble fra OpenID?';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return 'Fjerne OpenID-tilkoblingen for $name? Vedkommende må logge inn med OpenID igjen for å koble til på nytt.';
  }

  @override
  String get adminUsersOpenIdUnlinked => 'OpenID frakoblet';

  @override
  String get adminUsersFailedUnlinkOpenId => 'Kunne ikke koble fra OpenID';

  @override
  String adminUsersByAuthor(String author) {
    return 'av $author';
  }

  @override
  String get adminUsersListened => 'Lyttet';

  @override
  String get adminUsersStartedAtPosition => 'Startet ved posisjon';

  @override
  String get adminUsersEndedAtPosition => 'Sluttet ved posisjon';

  @override
  String get adminUsersTotalDuration => 'Total varighet';

  @override
  String get adminUsersStarted => 'Startet';

  @override
  String get adminUsersUpdated => 'Oppdatert';

  @override
  String get adminUsersClient => 'Klient';

  @override
  String get adminUsersDevice => 'Enhet';

  @override
  String get adminUsersOs => 'OS';

  @override
  String get adminUsersPlayMethod => 'Avspillingsmetode';

  @override
  String get adminUsersPlayDirect => 'Direkte avspilling';

  @override
  String get adminUsersPlayDirectStream => 'Direkte strømming';

  @override
  String get adminUsersPlayTranscode => 'Transkoding';

  @override
  String get adminUsersPlayLocal => 'Lokal';

  @override
  String get adminPodcastsCheckNewEpisodesTitle => 'Se etter nye episoder';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      'Dette sjekker RSS-strømmene til alle podkaster og laster ned eventuelle nye episoder som finnes (hvis automatisk nedlasting er slått på).';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle =>
      'Skann RSS-strøm og last ned nye episoder';

  @override
  String get adminPodcastsCheck => 'Sjekk';

  @override
  String get adminPodcastsCheckingForNew => 'Ser etter nye episoder…';

  @override
  String get adminPodcastsCheckingForNewDots => 'Ser etter nye episoder ...';

  @override
  String get adminPodcastsFailedCheckEpisodes => 'Kunne ikke sjekke episoder';

  @override
  String get adminPodcastsCheckFeedsTooltip =>
      'Se etter nye episoder i strømmene';

  @override
  String get adminPodcastsNoPodcastsYet => 'Ingen podkaster ennå';

  @override
  String get adminPodcastsTapPlusHint =>
      'Trykk på + for å søke etter og legge til programmer';

  @override
  String adminPodcastsEpisodesCount(int count) {
    return '$count episoder';
  }

  @override
  String get adminPodcastsAddPodcast => 'Legg til podkast';

  @override
  String get adminPodcastsCouldNotFindFeed => 'Fant ikke podkaststrømmen';

  @override
  String get adminPodcastsSearchHint => 'Søk etter podkaster…';

  @override
  String get adminPodcastsSearchItunesHint => 'Søk på iTunes ...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return 'Søk på iTunes etter «$query»';
  }

  @override
  String get adminPodcastsNoPodcastsFound => 'Fant ingen podkaster';

  @override
  String get adminPodcastsRelToday => 'I dag';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return '$count u. siden';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return '$count md. siden';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return '$count år siden';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return 'Oppdatert $when';
  }

  @override
  String get adminPodcastsGenreAll => 'Alle';

  @override
  String get adminPodcastsGenreArts => 'Kunst';

  @override
  String get adminPodcastsGenreComedy => 'Humor';

  @override
  String get adminPodcastsGenreEducation => 'Utdanning';

  @override
  String get adminPodcastsGenreTvFilm => 'TV og film';

  @override
  String get adminPodcastsGenreMusic => 'Musikk';

  @override
  String get adminPodcastsGenreNews => 'Nyheter';

  @override
  String get adminPodcastsGenreReligion => 'Religion';

  @override
  String get adminPodcastsGenreScience => 'Vitenskap';

  @override
  String get adminPodcastsGenreSports => 'Sport';

  @override
  String get adminPodcastsGenreTechnology => 'Teknologi';

  @override
  String get adminPodcastsGenreBusiness => 'Næringsliv';

  @override
  String get adminPodcastsGenreFiction => 'Fiksjon';

  @override
  String get adminPodcastsGenreSocietyCulture => 'Samfunn og kultur';

  @override
  String get adminPodcastsGenreHealthFitness => 'Helse og trening';

  @override
  String get adminPodcastsGenreTrueCrime => 'Ekte kriminalitet';

  @override
  String get adminPodcastsGenreHistory => 'Historie';

  @override
  String get adminPodcastsGenreKidsFamily => 'Barn og familie';

  @override
  String get adminPodcastsPodcastFallback => 'Podkast';

  @override
  String get adminPodcastsEpisodeFallback => 'Episode';

  @override
  String get adminPodcastsNoFeedFound => 'Fant ingen strøm-URL';

  @override
  String get adminPodcastsNoFeedAvailable => 'Ingen strøm-URL tilgjengelig';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return '$title lagt til i biblioteket';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return 'Kunne ikke legge til $title';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    return '$count episoder i strømmen';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    return '+ $count flere episoder';
  }

  @override
  String get adminPodcastsAdding => 'Legger til…';

  @override
  String get adminPodcastsAddToLibrary => 'Legg til i biblioteket';

  @override
  String get adminPodcastsRemoveShowTitle => 'Fjerne programmet?';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return 'Fjerne «$title» og alle episodene fra serveren? Dette kan ikke angres.';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return 'Fjernet «$title»';
  }

  @override
  String get adminPodcastsFailedRemoveShow => 'Kunne ikke fjerne programmet';

  @override
  String get adminPodcastsRemoveShowTooltip => 'Fjern program';

  @override
  String get adminPodcastsSelectMultipleTooltip => 'Velg flere';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return '$count nedlastet';
  }

  @override
  String get adminPodcastsTabDownloaded => 'Nedlastet';

  @override
  String get adminPodcastsTabFeed => 'Strøm';

  @override
  String get adminPodcastsTabSettings => 'Innstillinger';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return 'Laster ned «$title»';
  }

  @override
  String get adminPodcastsFailedDownload => 'Nedlastingen mislyktes';

  @override
  String get adminPodcastsDeleteEpisodeTitle => 'Slette episoden?';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return 'Slette «$title»?';
  }

  @override
  String get adminPodcastsDeleted => 'Slettet';

  @override
  String get adminPodcastsFailed => 'Mislyktes';

  @override
  String get adminPodcastsDeleteEpisodesTitle => 'Slette episodene?';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return 'Slette $count episode(r) fra serveren?';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return 'Slettet $count episode(r)';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload =>
      'Bla i strømmen for å laste ned';

  @override
  String get adminPodcastsDownloadingDots => 'Laster ned ...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return 'Slett $count episode(r)';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return 'Laster ned $count episode(r)';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return 'Last ned $count episode(r)';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter => 'Se etter episoder etter';

  @override
  String get adminPodcastsSelectDate => 'Velg dato';

  @override
  String get adminPodcastsMaxEpisodes => 'Maks antall episoder å laste ned';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return 'Fant ingen nye episoder etter $date';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return 'Fant $count ny(e) episode(r) – laster ned';
  }

  @override
  String get adminPodcastsFailedToCheckNew =>
      'Kunne ikke se etter nye episoder';

  @override
  String get adminPodcastsCheckAndDownload => 'Sjekk og last ned';

  @override
  String get adminPodcastsMatchPodcast => 'Match podkast';

  @override
  String get adminPodcastsMatchPodcastSubtitle =>
      'Søk på iTunes for å oppdatere omslag og metadata';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes =>
      'Last ned nye episoder automatisk';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle =>
      'Serveren laster ned nye episoder automatisk';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle =>
      'Nye episoder lastes ikke ned automatisk';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate =>
      'Kunne ikke oppdatere innstillingen for automatisk nedlasting';

  @override
  String get adminPodcastsMaxEpisodesToKeep => 'Maks antall episoder å beholde';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      '0 beholder alle episoder. Etter at en ny episode er lastet ned automatisk, fjerner Audiobookshelf den eldste episoden når programmet er over denne grensen.';

  @override
  String get adminPodcastsNoEpisodeLimit => 'Ingen grense';

  @override
  String get adminPodcastsEpisodeLimitInvalid => 'Skriv inn 0 eller et heltall';

  @override
  String get adminPodcastsCheckSchedule => 'Sjekkeplan';

  @override
  String get adminPodcastsFrequency => 'Frekvens';

  @override
  String get adminPodcastsFreqHourly => 'Hver time';

  @override
  String get adminPodcastsFreqDaily => 'Daglig';

  @override
  String get adminPodcastsFreqWeekly => 'Ukentlig';

  @override
  String get adminPodcastsDay => 'Dag';

  @override
  String get adminPodcastsTime => 'Tid';

  @override
  String get adminPodcastsDaySun => 'Søn';

  @override
  String get adminPodcastsDayMon => 'Man';

  @override
  String get adminPodcastsDayTue => 'Tir';

  @override
  String get adminPodcastsDayWed => 'Ons';

  @override
  String get adminPodcastsDayThu => 'Tor';

  @override
  String get adminPodcastsDayFri => 'Fre';

  @override
  String get adminPodcastsDaySat => 'Lør';

  @override
  String get adminPodcastsFeedUrl => 'Strøm-URL';

  @override
  String get adminPodcastsBack => 'Tilbake';

  @override
  String get adminPodcastsRootOnly => 'Bare root';

  @override
  String get adminPodcastsDeleting => 'Sletter ...';

  @override
  String get adminPodcastsDeleteEpisode => 'Slett episode';

  @override
  String adminPodcastsSeasonChip(String season) {
    return 'Sesong $season';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return 'Ep. $number';
  }

  @override
  String get adminPodcastsApplyingMatch => 'Bruker match ...';

  @override
  String get adminPodcastsNoResults => 'Ingen resultater';

  @override
  String get adminPodcastsPodcastMatched => 'Podkasten er matchet og oppdatert';

  @override
  String get adminPodcastsFailedMatch => 'Kunne ikke matche podkasten';

  @override
  String get adminPodcastsSelectAll => 'Velg alle';

  @override
  String get adminPodcastsSelectAllNew => 'Bare nye';

  @override
  String get adminPodcastsSortNewestFirst => 'Nyeste først';

  @override
  String get adminPodcastsSortOldestFirst => 'Eldste først';

  @override
  String get adminPodcastsEditInfo => 'Rediger info';

  @override
  String get adminPodcastsEditInfoSubtitle =>
      'Endre tittel, beskrivelse, omslag og mer';

  @override
  String get adminPodcastsEditTitle => 'Rediger podkast';

  @override
  String get adminPodcastsReleaseDate => 'Utgivelsesdato';

  @override
  String get adminPodcastsExplicit => 'Eksplisitt';

  @override
  String get adminPodcastsExplicitSubtitle =>
      'Marker denne podkasten som eksplisitt';

  @override
  String get episodeListEpisodeFallback => 'Episode';

  @override
  String get episodeListUnknownPodcast => 'Ukjent podkast';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episoder markert som fullført',
      one: '1 episode markert som fullført',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episoder markert som ufullført',
      one: '1 episode markert som ufullført',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes =>
      'Avslutt abonnement på nye episoder';

  @override
  String get episodeListSubscribeToNewEpisodes => 'Abonner på nye episoder';

  @override
  String get episodeListSubscribeTitle => 'Abonnere på denne podkasten?';

  @override
  String get episodeListSubscribeContent =>
      'Nye episoder lastes automatisk ned og legges til i Absorbing-køen din når de dukker opp på serveren.';

  @override
  String get episodeListSubscribe => 'Abonner';

  @override
  String get episodeListShowFinishedEpisodes => 'Vis fullførte episoder';

  @override
  String get episodeListHideFinishedEpisodes => 'Skjul fullførte episoder';

  @override
  String get episodeListShowSettings => 'Vis innstillinger';

  @override
  String get episodeListPlaysNewerToOlder => 'Spiller nyere til eldre episoder';

  @override
  String get episodeListPlaysOlderToNewer => 'Spiller eldre til nyere episoder';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episoder',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ufullførte',
      one: '1 ufullført',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => 'Autonedlasting';

  @override
  String get episodeListSubscribedChip => 'Abonnert';

  @override
  String get episodeListExplicitChip => 'Eksplisitt';

  @override
  String get episodeListSortNewest => 'Nyeste';

  @override
  String get episodeListSortOldest => 'Eldste';

  @override
  String get episodeListSortBy => 'Sorter episoder';

  @override
  String get episodeListSortPubDate => 'Publiseringsdato';

  @override
  String get episodeListSortTitle => 'Tittel';

  @override
  String get episodeListSortSeason => 'Sesong';

  @override
  String get episodeListSortEpisode => 'Episodenummer';

  @override
  String get episodeListSortFileName => 'Filnavn';

  @override
  String get episodeListSortReverseHint => 'Trykk igjen for å snu rekkefølgen';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return 'La til «$title» i Absorbing';
  }

  @override
  String get episodeDetailEpisodeFallback => 'Episode';

  @override
  String get episodeDetailMarkedNotFinished => 'Markert som ikke fullført';

  @override
  String get episodeDetailMarkedFinishedNice => 'Markert som fullført – bra!';

  @override
  String get episodeDetailMarkAbsorbedContent =>
      'Dette setter fremdriften din til 100 % for denne episoden.';

  @override
  String get episodeDetailResetProgressContent =>
      'Dette sletter all fremdrift for denne episoden og setter den tilbake til begynnelsen. Dette kan ikke angres.';

  @override
  String get episodeDetailToday => 'I dag';

  @override
  String get episodeDetailYesterday => 'I går';

  @override
  String episodeDetailDaysAgo(int count) {
    return '$count d. siden';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return '$count u. siden';
  }

  @override
  String episodeDetailDurationHm(int hours, int minutes) {
    return '$hours t $minutes min';
  }

  @override
  String episodeDetailDurationM(int minutes) {
    return '$minutes min';
  }

  @override
  String get episodeDetailResume => 'Fortsett';

  @override
  String get episodeDetailPlayEpisode => 'Spill av episode';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return 'Episode $number';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return 'Sesong $number';
  }

  @override
  String get editMetadataUpdatedFromMatch => 'Metadata oppdatert fra match';

  @override
  String editMetadataConfirmMatch(String title) {
    return 'Dette oppdaterer metadataene på serveren for denne boken med:\n\n«$title»\n\nAlle felt og omslaget blir overskrevet på serveren.';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return 'Dette oppdaterer metadataene på serveren for denne boken med:\n\n«$title» av $author\n\nAlle felt og omslaget blir overskrevet på serveren.';
  }

  @override
  String get seriesBooksFindMissingTitle => 'Finn manglende bøker';

  @override
  String get seriesBooksFindMissingContent =>
      'Dette søker i Audible etter bøker i denne serien som kan mangle i biblioteket ditt.\n\nBøker matches først etter ASIN (avhengig av om serveren din har ASIN-er for bøkene sine), og deretter etter tittel. Resultatene er kanskje ikke helt nøyaktige.';

  @override
  String get seriesBooksCouldNotFindOnAudible =>
      'Fant ikke denne serien på Audible';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Dette fjerner fullført-statusen for alle $count bøkene i denne serien.',
      one: 'Dette fjerner fullført-statusen for den ene boken i denne serien.',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dette markerer alle $count bøkene i denne serien som fullført.',
      one: 'Dette markerer den ene boken i denne serien som fullført.',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => 'Fjern alle markeringer';

  @override
  String get seriesBooksShowAllBooks => 'Vis alle bøker';

  @override
  String get seriesBooksGroupBySubSeries => 'Grupper etter underserie';

  @override
  String get seriesBooksLoadingSubSeries => 'Laster underserier ...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker',
      one: '1 bok',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => 'Ferdig';

  @override
  String get seriesBooksExplicitBadge => 'E';

  @override
  String get expandedCardStreaming => 'Strømmer';

  @override
  String get expandedCardDeviceFallback => 'Enhet';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$position i $bookTitle';
  }

  @override
  String get bookmarksScreenClose => 'Lukk';

  @override
  String get bookmarksScreenSortNewest => 'Nyeste';

  @override
  String get bookmarksScreenSortPosition => 'Posisjon';

  @override
  String statsScreenStreakDays(int count) {
    return '$count d';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count økt';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count økter';
  }

  @override
  String get statsScreenDayMon => 'Man';

  @override
  String get statsScreenDayTue => 'Tir';

  @override
  String get statsScreenDayWed => 'Ons';

  @override
  String get statsScreenDayThu => 'Tor';

  @override
  String get statsScreenDayFri => 'Fre';

  @override
  String get statsScreenDaySat => 'Lør';

  @override
  String get statsScreenDaySun => 'Søn';

  @override
  String statsScreenDurationHm(int h, int m) {
    return '$h t $m min';
  }

  @override
  String statsScreenDurationM(int m) {
    return '$m min';
  }

  @override
  String get statsScreenDurationLessThanMin => '<1 min';

  @override
  String get statsScreenDurationZero => '0 min';

  @override
  String statsScreenDurationShortH(int h) {
    return '$h t';
  }

  @override
  String statsScreenDurationShortM(int m) {
    return '$m min';
  }

  @override
  String get statsScreenCouldNotLoadItem => 'Kunne ikke laste elementet';

  @override
  String get statsScreenCouldNotFindEpisode => 'Fant ikke episoden';

  @override
  String statsScreenByAuthor(String author) {
    return 'av $author';
  }

  @override
  String get statsScreenListened => 'Lyttet';

  @override
  String get sessionEditTitle => 'Rediger økt';

  @override
  String get sessionDayLabel => 'Dag';

  @override
  String get sessionEndPosition => 'Sluttposisjon';

  @override
  String get sessionEndPositionHint =>
      'Å endre dette kan også oppdatere din nåværende fremdrift.';

  @override
  String get statsViewSessions => 'Vis økter';

  @override
  String statsSessionsForDate(String date) {
    return 'Økter for $date';
  }

  @override
  String get statsNoSessionsForDate => 'Fant ingen lytteøkter for denne dagen';

  @override
  String get statsSearchSessions => 'Søk i økter';

  @override
  String get statsNoSessionSearchResults => 'Ingen økter samsvarer med søket';

  @override
  String get statsSessionsLoadFailed =>
      'Kunne ikke laste øktene for denne dagen';

  @override
  String get sessionDeleteConfirmTitle => 'Slette økten?';

  @override
  String get sessionDeleteConfirmBody =>
      'Dette fjerner økten og reduserer lyttetotalene dine med tiden den varte. Det kan ikke angres.';

  @override
  String get sessionSaved => 'Økt oppdatert';

  @override
  String get sessionDeleted => 'Økt slettet';

  @override
  String get sessionSaveFailed => 'Kunne ikke lagre endringene';

  @override
  String get sessionDeleteFailed => 'Kunne ikke slette denne økten';

  @override
  String get statsScreenStartedAtPosition => 'Startet ved posisjon';

  @override
  String get statsScreenEndedAtPosition => 'Sluttet ved posisjon';

  @override
  String get statsScreenTotalDuration => 'Total varighet';

  @override
  String get statsScreenStarted => 'Startet';

  @override
  String get statsScreenUpdated => 'Oppdatert';

  @override
  String get statsScreenClient => 'Klient';

  @override
  String get statsScreenDevice => 'Enhet';

  @override
  String get statsScreenOs => 'OS';

  @override
  String get statsScreenPlayMethod => 'Avspillingsmetode';

  @override
  String get statsScreenLoading => 'Laster ...';

  @override
  String get statsScreenJumpToStart => 'Hopp til start';

  @override
  String get statsScreenJumpToEnd => 'Hopp til slutt';

  @override
  String get statsScreenPlayMethodDirect => 'Direkte avspilling';

  @override
  String get statsScreenPlayMethodDirectStream => 'Direkte strømming';

  @override
  String get statsScreenPlayMethodTranscode => 'Transkoding';

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
    return '$day. $month $year kl. $hour:$minute $ampm';
  }

  @override
  String get statsScreenMonthJan => 'jan';

  @override
  String get statsScreenMonthFeb => 'feb';

  @override
  String get statsScreenMonthMar => 'mar';

  @override
  String get statsScreenMonthApr => 'apr';

  @override
  String get statsScreenMonthMay => 'mai';

  @override
  String get statsScreenMonthJun => 'jun';

  @override
  String get statsScreenMonthJul => 'jul';

  @override
  String get statsScreenMonthAug => 'aug';

  @override
  String get statsScreenMonthSep => 'sep';

  @override
  String get statsScreenMonthOct => 'okt';

  @override
  String get statsScreenMonthNov => 'nov';

  @override
  String get statsScreenMonthDec => 'des';

  @override
  String get upcomingReleasesTitle => 'Kommende utgivelser';

  @override
  String get upcomingReleasesRescanTitle => 'Skanne på nytt?';

  @override
  String upcomingReleasesRescanContent(int days) {
    return 'Disse resultatene er $days dager gamle. Utgivelsesdatoer kan ha endret seg – vil du skanne på nytt?';
  }

  @override
  String get upcomingReleasesNotNow => 'Ikke nå';

  @override
  String get upcomingReleasesRescan => 'Skann på nytt';

  @override
  String get upcomingReleasesRescanReleaseDate =>
      'Skann utgivelsesdato på nytt';

  @override
  String get upcomingReleasesRescanning => 'Skanner på nytt ...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return 'Oppdatert – $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound => 'Fant ingen utgivelsesdato';

  @override
  String get upcomingReleasesRescanFailed => 'Ny skanning mislyktes';

  @override
  String get upcomingReleasesRemoveFromList => 'Fjern fra listen';

  @override
  String get upcomingReleasesRemovedFromList => 'Fjernet fra listen';

  @override
  String get upcomingReleasesDateChip => 'Dato';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return 'Sjekker $name ... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => 'Laster serier ...';

  @override
  String get upcomingReleasesScannedToday => '(skannet i dag)';

  @override
  String get upcomingReleasesScannedYesterday => '(skannet i går)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '(skannet for $days dager siden)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return '$count kommende';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return '$count nylige';
  }

  @override
  String get upcomingReleasesNoneFound =>
      'Fant ingen kommende eller nylige utgivelser';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$summary i $count serier';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return 'Sjekket $count serier på Audible';
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
  String get upcomingReleasesBadgeUpcoming => 'KOMMER';

  @override
  String get upcomingReleasesBadgeAdded => 'LAGT TIL';

  @override
  String get upcomingReleasesBadgeMissing => 'MANGLER';

  @override
  String get upcomingReleasesScanSettingsTitle => 'Skanneinnstillinger';

  @override
  String get upcomingReleasesFinishedAfterTitle =>
      'Anse en serie som avsluttet etter';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      'Serier der siste bok er eldre enn dette, hoppes over under skanninger og sjekkes bare på nytt hver måned eller annenhver måned.';

  @override
  String upcomingReleasesFinishedAfterYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count år',
      one: '1 år',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesFinishedAfterNever => 'Aldri';

  @override
  String get upcomingReleasesSkippedTitle => 'Hoppede over serier';

  @override
  String get upcomingReleasesSkippedNone => 'Ingenting hoppet over ennå';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hoppet over',
      one: '1 hoppet over',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Siste bok for $count år siden',
      one: 'Siste bok for 1 år siden',
      zero: 'Siste bok for under et år siden',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched =>
      'Kunne ikke matche denne serien på Audible';

  @override
  String get upcomingReleasesSkippedScanNow => 'Skann nå';

  @override
  String get upcomingReleasesSkippedAlwaysScan => 'Skann alltid';

  @override
  String get upcomingReleasesSkippedNeverScan => 'Skann aldri';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return 'Fant nye utgivelser i $name';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return 'Ingenting nytt i $name';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary =>
      'Denne listen kom fra et annet bibliotek. Skann på nytt for å oppdatere den.';

  @override
  String get upcomingReleasesChipUpcoming => 'Kommende';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mangler',
      one: '1 mangler',
      zero: 'Mangler',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => 'Fant ingen manglende bøker';

  @override
  String get upcomingReleasesScanSeries => 'Skann serier';

  @override
  String get upcomingReleasesScanUpcomingOption => 'Kommende utgivelser';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc =>
      'Rask skanning etter nye og kommende bøker';

  @override
  String get upcomingReleasesScanDeepOption => 'Dypskanning';

  @override
  String get upcomingReleasesScanDeepOptionDesc =>
      'Finner også manglende bøker i hver serie – tar lengre tid';

  @override
  String get upcomingReleasesFirstScanNote =>
      'Den første skanningen sjekker hver serie på Audible og kan ta noen minutter. Senere skanninger blir mye raskere når seriene dine er sortert.';

  @override
  String get upcomingReleasesLastScanReport => 'Rapport fra siste skanning';

  @override
  String upcomingReleasesReportChecked(int count) {
    return 'Sjekket på Audible: $count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return 'Hoppet over: $count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return 'Kunne ikke matches på Audible: $count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return 'Kunne ikke sjekkes: $count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return 'Fant $upcoming kommende, $recent nylige';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return 'Fant $upcoming kommende, $recent nylige, $missing manglende';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return '+$count til';
  }

  @override
  String get upcomingReleasesBadgeNew => 'NY';

  @override
  String get upcomingReleasesOpenLibrarySeries => 'Åpne serien i biblioteket';

  @override
  String get upcomingReleasesAsinCopied => 'Serie-ASIN kopiert';

  @override
  String get upcomingReleasesSetSeriesAsin => 'Angi serie-ASIN';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      'Finn serien på audible.com og kopier lenken til siden – ASIN er koden på 10 tegn som begynner med B0 (for eksempel B08S2YN3YS). Du kan også lime inn hele lenken.';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… eller audible.com-lenke';

  @override
  String get upcomingReleasesSetAsinSave => 'Lagre';

  @override
  String get upcomingReleasesSetAsinInvalid => 'Fant ingen ASIN i den teksten';

  @override
  String get upcomingReleasesSetAsinSaved => 'Serien er koblet – skanner nå';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fjern $count bøker',
      one: 'Fjern bok',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => 'Fjern fra denne skanningen';

  @override
  String get upcomingReleasesRemoveThisScanDesc =>
      'Kan dukke opp igjen ved en senere skanning';

  @override
  String get upcomingReleasesRemoveForever =>
      'Fjern fra denne og fremtidige skanninger';

  @override
  String get upcomingReleasesRemoveForeverDesc =>
      'Havner i listen over fjernede, gjenopprett når som helst';

  @override
  String get upcomingReleasesRemovedForeverToast =>
      'Fjernet – vises ikke ved fremtidige skanninger';

  @override
  String get upcomingReleasesRemovedBooksTitle => 'Fjernede bøker';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker',
      one: '1 bok',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => 'Ingen fjernede bøker';

  @override
  String get upcomingReleasesRestore => 'Gjenopprett';

  @override
  String get upcomingReleasesRestoredToast => 'Gjenopprettet';

  @override
  String get upcomingReleasesRestoredNextScan =>
      'Gjenopprettet – vises etter neste skanning';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valgt',
      one: '1 valgt',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => 'Forespør';

  @override
  String get upcomingReleasesBulkRemove => 'Fjern';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fjernet',
      one: '1 fjernet',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count forespørsler sendt',
      one: '1 forespørsel sendt',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return '$count hoppet over';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count serier skannet på nytt',
      one: '1 serie skannet på nytt',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return '$count med nye bøker';
  }

  @override
  String get seriesExcludeFromScan => 'Utelat fra serieskanning';

  @override
  String get seriesIncludeInScan => 'Ta med i serieskanning';

  @override
  String get homeScreenEpisodeFallback => 'Episode';

  @override
  String get libraryScreenUnknownTitle => 'Ukjent tittel';

  @override
  String get playlistDetailDefaultName => 'Spilleliste';

  @override
  String playlistDetailItemCount(int count) {
    return '$count elementer';
  }

  @override
  String get playlistDetailUnfinished => 'Ufullført';

  @override
  String get playlistDetailRemoveFromPlaylist => 'Fjern fra spillelisten';

  @override
  String get playlistDetailDone => 'Ferdig';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return '$count elementer markert som fullført';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return '$count elementer markert som ufullført';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return '$count elementer fjernet';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return 'La til «$title» i Absorbing';
  }

  @override
  String get collectionDetailDefaultName => 'Samling';

  @override
  String smartScopeBookCount(int count) {
    return 'Smart Scope · $count bøker';
  }

  @override
  String get smartScopeNew => 'Ny Smart Scope';

  @override
  String get smartScopeNewSubtitle =>
      'Lagre et sett med filtre som en liste som holder seg oppdatert selv';

  @override
  String get smartScopeEditTitle => 'Rediger Smart Scope';

  @override
  String get smartScopeIcon => 'Ikon';

  @override
  String get smartScopePublic => 'Synlig for alle brukere';

  @override
  String get smartScopeKobo => 'Synkroniser til Kobo';

  @override
  String get smartScopeRules => 'Regler';

  @override
  String get smartScopeMatchAll => 'Samsvar med alle';

  @override
  String get smartScopeMatchAny => 'Samsvar med minst én';

  @override
  String get smartScopeAddRule => 'Legg til regel';

  @override
  String get smartScopeAddGroup => 'Legg til gruppe';

  @override
  String get smartScopeGroup => 'Gruppe';

  @override
  String get smartScopeStartFrom => 'Start fra';

  @override
  String get smartScopeFromScratch => 'Bygg fra bunnen av';

  @override
  String get smartScopeTplHasSeries => 'Har en serie';

  @override
  String get smartScopeTplRecent => 'Nylig lagt til';

  @override
  String get smartScopeTplPdf => 'Bare PDF';

  @override
  String get smartScopeTplNoGenres => 'Ingen sjangre';

  @override
  String get smartScopeTplEpub => 'Bare EPUB';

  @override
  String get smartScopeCounting => 'Teller ...';

  @override
  String get smartScopeSort => 'Standard sortering';

  @override
  String get smartScopeAddSort => 'Legg til sorteringsnivå';

  @override
  String get smartScopeSortNone =>
      'Ingen sortering valgt, så bøkene sorteres etter tittel.';

  @override
  String get smartScopeAscending => 'Stigende';

  @override
  String get smartScopeDescending => 'Synkende';

  @override
  String get smartScopeDelete => 'Slett Smart Scope';

  @override
  String get smartScopeSaveFailed => 'Kunne ikke lagre Smart Scope';

  @override
  String get smartScopeDeleteFailed => 'Kunne ikke slette Smart Scope';

  @override
  String get smartScopeLoadFailed => 'Kunne ikke laste Smart Scope';

  @override
  String get smartScopeUnsupportedRule =>
      'Denne regelen kan bare endres på BookOrbit-nettsiden. Den beholdes som den er.';

  @override
  String get smartScopeAnd => 'og';

  @override
  String get smartScopeDays => 'dager';

  @override
  String get smartScopeWeeks => 'uker';

  @override
  String get smartScopeMonths => 'måneder';

  @override
  String get smartScopePickDate => 'Velg en dato';

  @override
  String get smartScopeAddValue => 'Legg til en verdi';

  @override
  String get smartScopeValue => 'Verdi';

  @override
  String get smartScopeCustomFields => 'Egendefinerte felt';

  @override
  String get smartScopeAnyProvider => 'Alle leverandører';

  @override
  String get smartScopeScoreOutstanding => 'Enestående';

  @override
  String get smartScopeScoreGood => 'God';

  @override
  String get smartScopeScoreFair => 'Brukbar';

  @override
  String get smartScopeScorePoor => 'Dårlig';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => 'Opptil 20 verdier';

  @override
  String get scopeFieldTitle => 'Tittel';

  @override
  String get scopeFieldAuthor => 'Forfatter';

  @override
  String get scopeFieldSeries => 'Serie';

  @override
  String get scopeFieldSeriesIndex => 'Serienummer';

  @override
  String get scopeFieldGenre => 'Sjanger';

  @override
  String get scopeFieldTag => 'Etikett';

  @override
  String get scopeFieldReadStatus => 'Lesestatus';

  @override
  String get scopeFieldReadProgress => 'Lesefremdrift';

  @override
  String get scopeFieldRating => 'Din vurdering';

  @override
  String get scopeFieldFormat => 'Format';

  @override
  String get scopeFieldLibrary => 'Bibliotek';

  @override
  String get scopeFieldCollection => 'Samling';

  @override
  String get scopeFieldPublisher => 'Forlag';

  @override
  String get scopeFieldLanguage => 'Språk';

  @override
  String get scopeFieldPublishedDate => 'Utgivelsesdato';

  @override
  String get scopeFieldPublishedYear => 'Utgivelsesår';

  @override
  String get scopeFieldAddedAt => 'Dato lagt til';

  @override
  String get scopeFieldStartedAt => 'Dato startet';

  @override
  String get scopeFieldFinishedAt => 'Dato fullført';

  @override
  String get scopeFieldPageCount => 'Antall sider';

  @override
  String get scopeFieldFileSize => 'Filstørrelse';

  @override
  String get scopeFieldCommunityRating => 'Fellesskapsvurdering';

  @override
  String get scopeFieldCommunityRatingCount => 'Antall fellesskapsanmeldelser';

  @override
  String get scopeFieldMetadataScore => 'Metadatapoeng';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => 'Beskrivelse';

  @override
  String get scopeFieldCover => 'Omslag';

  @override
  String get scopeFieldAudioCover => 'Lydbokomslag';

  @override
  String get scopeFieldFileAvailability => 'Filtilgjengelighet';

  @override
  String get scopeFieldLockStatus => 'Låsestatus';

  @override
  String get scopeFieldSeriesStatus => 'Seriestatus';

  @override
  String get scopeSortUpdatedAt => 'Dato oppdatert';

  @override
  String get scopeSortLastReadAt => 'Sist lest';

  @override
  String get scopeSortRandom => 'Tilfeldig';

  @override
  String get scopeOpContains => 'inneholder';

  @override
  String get scopeOpNotContains => 'inneholder ikke';

  @override
  String get scopeOpStartsWith => 'begynner med';

  @override
  String get scopeOpEndsWith => 'slutter med';

  @override
  String get scopeOpEq => 'er';

  @override
  String get scopeOpNotEq => 'er ikke';

  @override
  String get scopeOpIsEmpty => 'er tom';

  @override
  String get scopeOpIsNotEmpty => 'er ikke tom';

  @override
  String get scopeOpGt => 'større enn';

  @override
  String get scopeOpGte => 'minst';

  @override
  String get scopeOpLt => 'mindre enn';

  @override
  String get scopeOpLte => 'høyst';

  @override
  String get scopeOpBetween => 'mellom';

  @override
  String get scopeOpIncludesAny => 'inneholder minst én av';

  @override
  String get scopeOpIncludesAll => 'inneholder alle av';

  @override
  String get scopeOpExcludesAll => 'utelater alle av';

  @override
  String get scopeOpBefore => 'før';

  @override
  String get scopeOpAfter => 'etter';

  @override
  String get scopeOpWithinLast => 'innenfor de siste';

  @override
  String get scopeOpIsMissing => 'mangler';

  @override
  String get scopeOpIsPresent => 'finnes';

  @override
  String get scopeOpIsUnread => 'er ulest';

  @override
  String get scopeOpIsInProgress => 'pågår';

  @override
  String get scopeOpIsFinished => 'er fullført';

  @override
  String get scopeOpIsLocked => 'er låst';

  @override
  String get scopeOpIsUnlocked => 'er ulåst';

  @override
  String get scopeOpIsUpNext => 'er neste';

  @override
  String get scopeOpIsTrue => 'er ja';

  @override
  String get scopeOpIsFalse => 'er nei';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker samsvarer',
      one: '1 bok samsvarer',
      zero: 'Ingen bøker samsvarer',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return 'Slette «$name»? Dette kan ikke angres.';
  }

  @override
  String collectionDetailBookCount(int count) {
    return '$count bøker';
  }

  @override
  String get collectionDetailDone => 'Ferdig';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return 'La til «$title» i Absorbing';
  }

  @override
  String get audibleSeriesNoBooksFound => 'Fant ingen bøker på Audible';

  @override
  String get audibleSeriesFailedToLoad => 'Kunne ikke laste serien fra Audible';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return '$total på Audible · $missing mangler';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return '$total på Audible · $missing mangler · $upcoming kommende';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return 'Mangler ($count)';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return 'Kommende ($count)';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return 'Alle ($count)';
  }

  @override
  String get audibleSeriesSearching => 'Søker på Audible ...';

  @override
  String get audibleSeriesCompleteSeries => 'Du har hele serien!';

  @override
  String get audibleSeriesNoUpcoming => 'Fant ingen kommende utgivelser';

  @override
  String get audibleSeriesUpcomingBadge => 'KOMMER';

  @override
  String get audibleSeriesAbridged => 'Forkortet';

  @override
  String get audibleSeriesRegionTitle => 'Audible-region';

  @override
  String get audibleSeriesOpenOnAudible => 'Åpne på Audible';

  @override
  String get audibleSeriesAddToCalendar => 'Legg til i kalender';

  @override
  String get audibleSeriesAddToUpcoming => 'Legg til i kommende utgivelser';

  @override
  String get audibleSeriesAddedToUpcoming => 'Lagt til i kommende utgivelser';

  @override
  String get audibleSeriesAlreadyInUpcoming =>
      'Allerede på siden for kommende utgivelser';

  @override
  String get audibleSeriesCouldNotOpenAudible => 'Kunne ikke åpne Audible';

  @override
  String get audibleSeriesCouldNotOpenCalendar => 'Kunne ikke åpne kalenderen';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return 'Ny lydbokutgivelse i serien $seriesName';
  }

  @override
  String get authorBooksGroupBySeries => 'Grupper etter serie';

  @override
  String get authorBooksList => 'Liste';

  @override
  String get authorBooksGrid => 'Rutenett';

  @override
  String authorBooksBookCount(int count) {
    return '$count bøker';
  }

  @override
  String get metadataLookupCover => 'Omslag';

  @override
  String get metadataLookupChooseFields => 'Velg felt som skal brukes';

  @override
  String metadataLookupApplyFields(int count) {
    return 'Bruk $count felt';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return '$count felt lagret lokalt';
  }

  @override
  String get metadataLookupOverrideLocalDisplay => 'Overstyr lokal visning';

  @override
  String get equalizerPresetFlat => 'Flat';

  @override
  String get equalizerPresetVoiceBoost => 'Stemmeforsterkning';

  @override
  String get equalizerPresetBassBoost => 'Bassforsterkning';

  @override
  String get equalizerPresetTrebleBoost => 'Diskantforsterkning';

  @override
  String get equalizerPresetPodcast => 'Podkast';

  @override
  String get equalizerPresetAudiobook => 'Lydbok';

  @override
  String get equalizerPresetReduceNoise => 'Reduser støy';

  @override
  String get equalizerPresetLoudness => 'Loudness';

  @override
  String equalizerEditingSavedNamed(String title) {
    return 'Redigerer lagret EQ for «$title»';
  }

  @override
  String get equalizerEditingSavedGeneric => 'Redigerer lagret EQ';

  @override
  String get equalizerPerBookEq => 'EQ per bok';

  @override
  String get notesDeleteNoteQuestion => 'Slette notatet?';

  @override
  String notesDeleteNoteContent(String title) {
    return 'Slette «$title»?';
  }

  @override
  String get notesExport => 'Eksporter';

  @override
  String get notesNewNote => 'Nytt notat';

  @override
  String get librarySortFilterUpcomingReleases => 'Skann serier';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle =>
      'Hent et bilde og en biografi for hver forfatter fra metadataleverandøren';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle =>
      'Sjekk Audible for kommende og manglende bøker i seriene dine';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kapitler igjen',
      one: '1 kapittel igjen',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetAddMinutesChip(int minutes) {
    return '+$minutes min';
  }

  @override
  String sleepTimerSheetAddChaptersChip(int count) {
    return '+$count kap.';
  }

  @override
  String sleepTimerSheetMinShort(int minutes) {
    return '$minutes min';
  }

  @override
  String sleepTimerSheetSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String sleepTimerSheetMinSecShort(int minutes, int seconds) {
    return '$minutes min $seconds s';
  }

  @override
  String sleepTimerSheetChaptersValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kapitler',
      one: '1 kapittel',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetChaptersChip(int count) {
    return '$count kap.';
  }

  @override
  String sleepTimerSheetStartChapterSleep(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sov etter $count kapitler',
      one: 'Sov etter 1 kapittel',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => 'Spol tilbake ved søvn';

  @override
  String get sleepTimerSheetShake => 'Rist';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return 'Legger til $minutes min';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => 'Legger til 1 kapittel';

  @override
  String get sleepTimerSheetResetsToFull => 'Tilbakestilles til full varighet';

  @override
  String get sleepTimerSheetTabSpecificChapter => 'Kapittel';

  @override
  String get sleepTimerSheetSpecificNoChapters => 'Ingen kapitler tilgjengelig';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return 'Kapittel $number';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => 'passert';

  @override
  String get sleepTimerSheetSpecificStart => 'Kapittelstart';

  @override
  String get sleepTimerSheetSpecificEnd => 'Kapittelslutt';

  @override
  String get sleepTimerSheetSpecificEndsAt => 'Sovetimeren slutter ved';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return 'om $countdown';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed =>
      'Dette punktet er allerede passert';

  @override
  String get sleepTimerSheetSpecificStartButton => 'Start timer';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => 'Allerede passert';

  @override
  String get timeAm => 'AM';

  @override
  String get timePm => 'PM';

  @override
  String get collectionPickerCollectionFallback => 'Samling';

  @override
  String collectionPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get playlistPickerPlaylistFallback => 'Spilleliste';

  @override
  String playlistPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get cardChaptersPlayFromChapterTitle => 'Spille av fra kapittelet?';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return 'Begynne å spille av fra «$title»?';
  }

  @override
  String get cardChaptersPlay => 'Spill av';

  @override
  String get absorbingSharedToday => 'I dag';

  @override
  String get absorbingSharedYesterday => 'I går';

  @override
  String get absorbingSharedMonday => 'Mandag';

  @override
  String get absorbingSharedTuesday => 'Tirsdag';

  @override
  String get absorbingSharedWednesday => 'Onsdag';

  @override
  String get absorbingSharedThursday => 'Torsdag';

  @override
  String get absorbingSharedFriday => 'Fredag';

  @override
  String get absorbingSharedSaturday => 'Lørdag';

  @override
  String get absorbingSharedSunday => 'Søndag';

  @override
  String get absorbingSharedAm => 'AM';

  @override
  String get absorbingSharedPm => 'PM';

  @override
  String sectionDetailAddedToAbsorbing(String title) {
    return 'La til «$title» i Absorbing';
  }

  @override
  String get sectionDetailDoneBadge => 'Ferdig';

  @override
  String get homeCustomizeAddGenreTitle => 'Legg til sjangerseksjon';

  @override
  String get homeCustomizeAddGenreSubtitle =>
      'Velg en sjanger som skal vises på startskjermen';

  @override
  String get homeSectionDoneBadge => 'Ferdig';

  @override
  String get tipsSheetQuickBookmarksTitle => 'Raske bokmerker';

  @override
  String get tipsSheetQuickBookmarksDesc =>
      'Trykk og hold bokmerkeknappen på et hvilket som helst kort for å legge et bokmerke ved gjeldende posisjon med en gang, uten å åpne bokmerkearket.';

  @override
  String get tipsSheetCoverPlayPauseTitle => 'Spill av/pause på omslaget';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      'Trykk på omslaget på et kort for å spille av eller pause. Slå dette av eller på i Innstillinger under Absorbing-kort. Et svakt pauseikon vises under avspilling, så du ser at det kan trykkes på.';

  @override
  String get tipsSheetFullScreenPlayerTitle => 'Fullskjermspiller';

  @override
  String get tipsSheetFullScreenPlayerDesc =>
      'Sveip opp på et Absorbing-kort for å åpne fullskjermspilleren. Sveip ned for å lukke den.';

  @override
  String get tipsSheetQuickAddAbsorbingTitle => 'Rask tillegging i Absorbing';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      'Sveip til høyre på en bok i et listeark (serie, forfatter, søkeresultater) for å legge den til i Absorbing-køen din med en gang.';

  @override
  String get tipsSheetShakeExtendSleepTitle =>
      'Rist for å forlenge sovetimeren';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      'Hvis en sovetimer går og du rister telefonen, legges det til ekstra minutter. Still inn mengden i Innstillinger under Sovetimer.';

  @override
  String get tipsSheetSeriesNavigationTitle => 'Seriennavigasjon';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      'Trykk på serienavnet i detaljvinduet til en bok for å se alle bøkene i serien, sortert i lesrekkefølge med nummermerker på hvert omslag.';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => 'Sveip mellom bøker';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      'Sveip til venstre og høyre på Absorbing-skjermen for å bytte mellom bøkene du holder på med. Med manuell kømodus på fungerer kortene også som køen din, så den neste spilles av automatisk når den gjeldende er ferdig.';

  @override
  String get tipsSheetTapToSeekTitle => 'Trykk for å spole';

  @override
  String get tipsSheetTapToSeekDesc =>
      'Trykk hvor som helst på fremdriftslinjen for kapittel eller bok for å hoppe rett til den posisjonen. Du kan også dra i linjene for finere kontroll.';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle => 'Hastighetsjustert tid';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      'All tid som vises – posisjon, gjenstående, kapitler, bokmerker – justeres etter avspillingshastigheten din. Lytter du på 1.5x? Tidene som vises viser hvor lang tid det faktisk tar deg.';

  @override
  String get tipsSheetPlaybackHistoryTitle => 'Avspillingshistorikk';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      'Trykk på Historikk-knappen på et kort for å se en tidslinje over hver avspilling, pause, spoling og hastighetsendring. Trykk på en hendelse for å hoppe tilbake til den posisjonen.';

  @override
  String get tipsSheetAutoRewindTitle => 'Automatisk tilbakespoling';

  @override
  String get tipsSheetAutoRewindDesc =>
      'Når du fortsetter etter en pause, spoler Absorb automatisk tilbake noen sekunder, så du ikke mister tråden. Hvor langt det spoles avhenger av hvor lenge du var borte. Still det inn i Innstillinger.';

  @override
  String get tipsSheetSeriesQueueModeTitle => 'Seriekømodus';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      'Når du fullfører en bok som er del av en serie, kan Absorb spille av neste bok automatisk. Sett kømodus til «Serie» i Innstillinger.';

  @override
  String get tipsSheetOfflineModeTitle => 'Frakoblet modus';

  @override
  String get tipsSheetOfflineModeDesc =>
      'Trykk på flyknappen på Absorbing-skjermen for å gå til frakoblet modus. Da stoppes synkroniseringen, data spares, og bare de nedlastede bøkene dine vises. Praktisk på flyreiser eller der dekningen er dårlig.';

  @override
  String get tipsSheetUpcomingReleasesTitle => 'Kommende utgivelser';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      'Trykk på Serie-fanen igjen for å åpne arket for sortering og filtrering, og velg deretter Kommende utgivelser for å se nye og kommende bøker i seriene dine, sortert etter utgivelsesdato.';

  @override
  String get tipsSheetPerBookEqTitle => 'Equalizer per bok';

  @override
  String get tipsSheetPerBookEqDesc =>
      'Hver bok husker sine egne equalizer-innstillinger. Juster EQ én gang for et sci-fi-epos, og neste gang du spiller det, høres det likt ut.';

  @override
  String get tipsSheetPerBookSpeedTitle => 'Hastighet per bok';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      'Avspillingshastigheten lagres per bok. Kjør sakprosa på 1.5x og dramatisk fiksjon på 1.0x uten å stille den inn hver gang.';

  @override
  String get tipsSheetAutoSleepWindowTitle => 'Automatisk søvnvindu';

  @override
  String get tipsSheetAutoSleepWindowDesc =>
      'Velg timene du vanligvis sovner, så starter sovetimeren av seg selv når du begynner å lytte i det tidsrommet.';

  @override
  String get tipsSheetSleepFadeChimeTitle => 'Uttoning og lyd ved søvn';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      'Når sovetimeren utløper, tones lyden gradvis ut, og en valgfri klokkelyd spilles, så det ikke kuttes midt i en setning.';

  @override
  String get tipsSheetCarModeTitle => 'Bilmodus';

  @override
  String get tipsSheetCarModeDesc =>
      'Trykk på bilikonet for å bytte til en modus med kjempeknapper, laget for tryggere bruk under kjøring.';

  @override
  String get tipsSheetAudibleSeriesTitle => 'Finn serier fra Audible';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      'Åpne en serie og bruk menyen med de tre prikkene for å hente hele serielisten fra Audible, inkludert manglende bøker og bøker du ikke har begynt på.';

  @override
  String get tipsSheetTranscribeBookmarkTitle => 'Transkriber bokmerker';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      'Gjør lyden ved et bokmerke om til tekst, helt på enheten din. Slå det på i Innstillinger under Avansert > Transkripsjon og last ned en modell, og trykk deretter på Transkriber på et bokmerke – teksten havner i notatet, klar til å rettes opp eller deles.';

  @override
  String get tipsSheetFindBetweenFormatsTitle => 'Hopp mellom lydbok og e-bok';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      'Med transkripsjon på og boken nedlastet kan du pause og trykke på Finn posisjon i e-bok i spilleren for å åpne e-boken ved passasjen du nettopp hørte. I leseren kan du markere tekst og trykke på hodetelefonene for å starte lydboken akkurat der.';

  @override
  String get tipsSheetShareQuoteTitle => 'Del sitater';

  @override
  String get tipsSheetShareQuoteDesc =>
      'Del en e-bokmarkering eller et bokmerkenotat som et bilde med sitatet over bokomslaget. Se etter delingsvalget på markeringer og i bokmerkearket.';

  @override
  String get tipsSheetClipExportTitle => 'Eksporter lydklipp';

  @override
  String get tipsSheetClipExportDesc =>
      'Åpne et bokmerke og trykk på Eksporter klipp for å beskjære og lagre et kort lydutdrag av boken, med omslag – flott for å dele en favorittscene.';

  @override
  String get tipsSheetAllHighlightsTitle => 'Alle markeringer på ett sted';

  @override
  String get tipsSheetAllHighlightsDesc =>
      'Siden Alle bokmerker har en Markeringer-fane som samler hver e-bokmarkering fra alle bøker. Trykk på en for å dele den eller hoppe tilbake til boken.';

  @override
  String get tipsSheetVolumeKeyPagesTitle => 'Bla med volumknappene';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      'Bla om sider i e-bøker med volumknappene. Slå det på i leserens innstillinger – vanlig eller speilvendt retning, og det kan være på selv mens lyd spilles.';

  @override
  String get tipsSheetSettingsSyncTitle => 'Synkronisering av innstillinger';

  @override
  String get tipsSheetSettingsSyncDesc =>
      'Hold innstillingene, hastighetene per bok og Absorbing-rekkefølgen i takt på tvers av enheter via din egen WebDAV-server. Sett det opp i Innstillinger under Sikkerhetskopi og synkronisering.';

  @override
  String get tipsSheetNavLongPressTitle => 'Trykk og hold bunnfanene';

  @override
  String get tipsSheetNavLongPressDesc =>
      'Trykk og hold Hjem-fanen for å bytte bibliotek fra hvilken som helst side. Trykk og hold Bibliotek-fanen for å hoppe rett til søk.';

  @override
  String get bookCardUnknownTitle => 'Ukjent tittel';

  @override
  String get bookCardExplicitBadge => 'E';

  @override
  String get bookCardDone => 'Ferdig';

  @override
  String get bookCardSaved => 'Lagret';

  @override
  String get episodeRowEpisode => 'Episode';

  @override
  String get episodeRowToday => 'I dag';

  @override
  String get episodeRowYesterday => 'I går';

  @override
  String episodeRowDaysAgo(int count) {
    return '$count d. siden';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return '$count u. siden';
  }

  @override
  String episodeRowDurationHm(int hours, int minutes) {
    return '$hours t $minutes min';
  }

  @override
  String episodeRowDurationM(int minutes) {
    return '$minutes min';
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
  String get librarySearchResultsDone => 'Ferdig';

  @override
  String get librarySearchResultsSaved => 'Lagret';

  @override
  String librarySearchResultsSequence(String number) {
    return '#$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => 'Ukjent serie';

  @override
  String get librarySearchResultsUnknownEpisode => 'Ukjent episode';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker',
      one: '1 bok',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => 'E';

  @override
  String get libraryGridTilesDone => 'Ferdig';

  @override
  String get libraryGridTilesSaved => 'Lagret';

  @override
  String libraryGridTilesSequence(String number) {
    return '#$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => 'Ukjent serie';

  @override
  String get seriesCardUnknownSeries => 'Ukjent serie';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker',
      one: '1 bok',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => 'Finspoling';

  @override
  String get cardProgressQuarterSpeed => 'Kvart hastighet';

  @override
  String get cardProgressHalfSpeed => 'Halv hastighet';

  @override
  String cardProgressChapterPrefix(String number) {
    return 'Kapittel $number';
  }

  @override
  String get cardEdgeProgressFineScrubbing => 'Finspoling';

  @override
  String get cardEdgeProgressQuarterSpeed => 'Kvart hastighet';

  @override
  String get cardEdgeProgressHalfSpeed => 'Halv hastighet';

  @override
  String get authSessionExpired => 'Økten er utløpt. Logg inn på nytt.';

  @override
  String authCannotReachServer(String url) {
    return 'Får ikke kontakt med serveren på $url';
  }

  @override
  String get authInvalidUsernameOrPassword =>
      'Ugyldig brukernavn eller passord';

  @override
  String get authInvalidApiKey => 'Ugyldig API-nøkkel';

  @override
  String get authLoginFailedDetail =>
      'Innloggingen mislyktes – sjekk serveradressen og påloggingsopplysningene dine';

  @override
  String get authUnexpectedServerResponse => 'Uventet svar fra serveren';

  @override
  String get authSsoUnexpectedResponse => 'SSO ga et uventet svar';

  @override
  String get authSwitchedToLocalServer => 'Byttet til lokal server';

  @override
  String get authSwitchedToRemoteServer => 'Byttet til ekstern server';

  @override
  String get lpDeletedFinishedDownload => 'Slettet fullført nedlasting';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nye episoder lastes ned',
      one: '1 ny episode lastes ned',
    );
    return '$showTitle: $_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return '$showTitle lagt til øverst i køen din';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return '$showTitle lagt til som nummer 2 i køen din';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return '$showTitle lagt til sist i køen din';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return 'Ny episode av $showTitle lastet ned';
  }

  @override
  String get statsWeekStartsOn => 'Uken starter på';

  @override
  String get episodeListNewEpisodePosition => 'Plassering av ny episode';

  @override
  String get episodeListPositionTop => 'Øverst i køen';

  @override
  String get episodeListPositionSecond => 'Nummer to i køen';

  @override
  String get episodeListPositionEnd => 'Sist i køen';

  @override
  String get episodeListPositionNone => 'Ikke legg til i køen';

  @override
  String get episodeListPositionNoneDesc =>
      'Du får fortsatt varsel, og den lastes ned';

  @override
  String sleepRewindUndoNote(int minutes) {
    return 'Trykk på spill av innen $minutes minutter, så angres tilbakespolingen';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kø: laster ned $count elementer',
      one: 'Kø: laster ned 1 element',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Laster ned $count bøker',
      one: 'Laster ned 1 bok',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Laster ned $count episoder',
      one: 'Laster ned 1 episode',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName => 'Nedlastingsfremdrift';

  @override
  String get downloadNotifProgressChannelDesc =>
      'Viser fremdrift under nedlasting av lydbøker';

  @override
  String get downloadNotifAlertChannelName => 'Nedlastingsvarsler';

  @override
  String get downloadNotifAlertChannelDesc =>
      'Varsler når nedlastinger er ferdige eller mislykkes';

  @override
  String get downloadNotifDownloadingTitle => 'Laster ned…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nedlastinger aktive',
      one: '1 nedlasting aktiv',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return 'Laster ned: $title';
  }

  @override
  String get downloadNotifStartingLabel => 'Starter…';

  @override
  String get downloadNotifCompleteTitle => 'Nedlasting fullført';

  @override
  String downloadNotifCompleteBody(String title) {
    return '$title er klar til å høres på frakoblet';
  }

  @override
  String get downloadNotifFailedTitle => 'Nedlastingen mislyktes';

  @override
  String get upcomingNotifChannelName => 'Skanning etter kommende utgivelser';

  @override
  String get upcomingNotifChannelDesc =>
      'Viser fremdrift under skanning etter kommende utgivelser';

  @override
  String get upcomingNotifScanTitle => 'Skanner etter kommende utgivelser';

  @override
  String get upcomingNotifStartingScan => 'Starter skanning…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return 'Sjekker $seriesName… ($current/$total)';
  }

  @override
  String get upcomingNotifFoundTitle => 'Fant kommende utgivelser!';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$series serier',
      one: '1 serie',
    );
    return '$books kommende i $_temp0';
  }

  @override
  String get androidAutoTabContinue => 'Fortsett';

  @override
  String get androidAutoTabLibrary => 'Bibliotek';

  @override
  String get androidAutoTabDownloads => 'Nedlastinger';

  @override
  String get settingsSearchHint => 'Søk i innstillinger ...';

  @override
  String get settingsSearchNoResults => 'Ingen samsvarende innstillinger';

  @override
  String get carConnectAutoplay =>
      'Start avspilling når Android Auto kobles til';

  @override
  String get carConnectAutoplayIos => 'Start avspilling når CarPlay kobles til';

  @override
  String get carConnectAutoplayOnSubtitle =>
      'Boken du sist lyttet til starter av seg selv når bilen kobles til';

  @override
  String get carConnectAutoplayOffSubtitle =>
      'Avspillingen venter til du trykker på spill av';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => 'Bruk med Siri';

  @override
  String get siriStatusOn =>
      'På. Siri kan finne og spille av bøkene og podkastene dine på navn.';

  @override
  String get siriStatusAsk =>
      'La Siri finne og spille av bøkene og podkastene dine på navn.';

  @override
  String get siriStatusOff =>
      'Siri er slått av for Absorb. Slå den på i iOS-innstillinger.';

  @override
  String get siriAllow => 'Tillat';

  @override
  String get siriOpenSettings => 'Åpne Innstillinger';

  @override
  String get siriThingsToSay => 'Ting du kan si';

  @override
  String get siriExamples =>
      '«Spill [boktittel] i Absorb»\n«Spill [serienavn] i Absorb»\n«Spill noe av [forfatter] i Absorb»\n«Spill siste episode av [podkast] i Absorb»\n«Fortsett Absorb»\n«Spol tilbake i Absorb»\n«Neste kapittel i Absorb»\n«Sett en sovetimer i Absorb»\n«Legg til et bokmerke i Absorb»\n«Hva hører jeg på i Absorb»';

  @override
  String get siriShortcutsNote =>
      'Fortsett, pause, hopp, kapitler, sovetimeren, bokmerker og hva som spilles fungerer også uten denne tillatelsen. De finnes også i Snarveier-appen for automatiseringer og handlingsknappen.';

  @override
  String get carBookOrder => 'Bokrekkefølge i bilen';

  @override
  String get carBookOrderReverse => 'Omvendt bokrekkefølge';

  @override
  String get carBookOrderReverseSubtitle =>
      'Å til A, eller eldst lagt til først';

  @override
  String get carPodcastOrder => 'Podkastrekkefølge i bilen';

  @override
  String get carEpisodesOldestFirst => 'Eldste episoder først';

  @override
  String get carEpisodesOldestFirstSubtitle =>
      'For programmer du hører på fra begynnelsen';

  @override
  String get androidAutoCatBooks => 'Bøker';

  @override
  String get androidAutoCatSeries => 'Serier';

  @override
  String get androidAutoCatAuthors => 'Forfattere';

  @override
  String get androidAutoCatCollections => 'Samlinger';

  @override
  String get androidAutoCatPlaylists => 'Spillelister';

  @override
  String get showTipsAgain => 'Vis tips igjen';

  @override
  String get showTipsAgainSubtitle =>
      'Hent tilbake funksjonstips du har avvist';

  @override
  String get tipsRestored => 'Tips gjenopprettet';

  @override
  String get resetSpeedPresets => 'Tilbakestill hastighetsforvalg';

  @override
  String get resetSpeedPresetsSubtitle =>
      'Gjenopprett standard hastighetsknapper for avspilling';

  @override
  String get speedPresetsReset => 'Hastighetsforvalg tilbakestilt';

  @override
  String get editAuthor => 'Rediger forfatter';

  @override
  String get authorName => 'Navn';

  @override
  String get authorImage => 'Forfatterbilde';

  @override
  String get authorRemoveImage => 'Fjern bilde';

  @override
  String get authorRemoveImageTitle => 'Fjerne forfatterbildet?';

  @override
  String get authorRemoveImageConfirm => 'Dette sletter bildet på serveren.';

  @override
  String get authorImageRemoved => 'Bilde fjernet';

  @override
  String get authorImageFailed => 'Kunne ikke oppdatere forfatterbildet';

  @override
  String get authorUpdated => 'Forfatter oppdatert';

  @override
  String get authorUpdateFailed => 'Kunne ikke oppdatere forfatteren';

  @override
  String get authorMatched => 'Forfatter oppdatert fra match';

  @override
  String get authorNoMatchFound => 'Fant ingen match';

  @override
  String authorMergedInto(String name) {
    return 'Slått sammen med $name';
  }

  @override
  String get authorQuickMatchHint =>
      'Hent navn, ASIN, beskrivelse og bilde fra Audible for den valgte regionen.';

  @override
  String get region => 'Region';

  @override
  String get editTabDetails => 'Detaljer';

  @override
  String get editTabCover => 'Omslag';

  @override
  String get editTabMatch => 'Match';

  @override
  String get editTabEmbed => 'Bygg inn';

  @override
  String get chapterEditorTitle => 'Rediger kapitler';

  @override
  String get chapterNotConnected => 'Ikke koblet til en server';

  @override
  String get chapterErrorFirstNotZero => 'Første kapittel må starte på 0:00';

  @override
  String get chapterErrorStartAfterPrevious =>
      'Starten må komme etter forrige kapittel';

  @override
  String get chapterErrorStartBeforeEnd => 'Starten må være før boken slutter';

  @override
  String get chapterErrorTitleRequired => 'Tittel er påkrevd';

  @override
  String get chapterEditStartTitle => 'Rediger starttid';

  @override
  String get chapterTimeHintSeconds => 'Sekunder';

  @override
  String get chapterTimeHintFull => 'TT:MM:SS eller sekunder';

  @override
  String get chapterInvalidTime => 'Ugyldig tid';

  @override
  String get chapterLocked => 'Kapittelet er låst';

  @override
  String get chapterAllLocked => 'Alle kapitler er låst';

  @override
  String chapterTrackTitle(int number) {
    return 'Spor $number';
  }

  @override
  String get chapterNoAudioForPosition => 'Ingen lyd for denne posisjonen';

  @override
  String get chapterCouldNotPlayPreview =>
      'Kunne ikke spille av forhåndsvisningen';

  @override
  String chapterStartSetTo(String time) {
    return 'Start satt til $time';
  }

  @override
  String get chapterAddNumberedTitle => 'Legg til nummererte kapitler';

  @override
  String chapterNextPreview(String first, String second) {
    return 'Neste: «$first», «$second», ...';
  }

  @override
  String get chapterHowMany => 'Hvor mange kapitler';

  @override
  String get add => 'Legg til';

  @override
  String get chapterCountRange => 'Skriv inn et antall mellom 1 og 150';

  @override
  String get chapterTitlesUpdated => 'Kapitteltitler oppdatert';

  @override
  String get chaptersApplied => 'Kapitler tatt i bruk';

  @override
  String get chapterDiscardTitle => 'Forkaste endringer?';

  @override
  String get chapterDiscardMessage => 'Gå tilbake til de lagrede kapitlene.';

  @override
  String get chapterRemoveAllTitle => 'Fjerne alle kapitler?';

  @override
  String get chapterRemoveAllMessage =>
      'Dette fjerner alle kapitler fra denne boken.';

  @override
  String get chapterAllRemoved => 'Alle kapitler fjernet';

  @override
  String get chapterFixHighlighted => 'Rett opp de uthevede kapitlene først';

  @override
  String get chaptersUpdated => 'Kapitler oppdatert';

  @override
  String get ok => 'OK';

  @override
  String get chapterSaveButton => 'Lagre kapitler';

  @override
  String get chapterAddHint => 'Legg til kapittel (f.eks. «Kapittel 01»)';

  @override
  String get chapterAddTooltip => 'Legg til kapittel/kapitler';

  @override
  String get chapterRemoveAll => 'Fjern alle';

  @override
  String get chapterShiftTimes => 'Forskyv tider';

  @override
  String get chapterFromTracks => 'Fra spor';

  @override
  String get chapterLookup => 'Slå opp';

  @override
  String get chapterShowSeconds => 'Vis sekunder';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get chapterLoopCut => 'Gjenta utsnittet';

  @override
  String get chapterFindStart => 'Finn starten';

  @override
  String get chapterFindStartListening => 'Lytter rundt markøren';

  @override
  String get chapterFindStartNone =>
      'Ingenting her høres ut som en kapittelstart';

  @override
  String get chapterFindStartWider => 'Søk bredere';

  @override
  String get chapterFindStartCeiling =>
      'Søkte en halv time rundt markøren. Starten er lenger unna enn det, eller så er det ingen kapittelannonsering å høre.';

  @override
  String get chapterFindStartStrong => 'Høres ut som dette kapittelet';

  @override
  String get chapterFindStartMaybe => 'Kapittellignende ord';

  @override
  String chapterFindStartGap(String seconds) {
    return '$seconds s pause';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return 'Søkte fra $from til $to';
  }

  @override
  String get chapterFindStartNeedsModel =>
      'Slå på transkripsjon i Innstillinger og last ned en modell først';

  @override
  String get chapterFindStartUseThis => 'Bruk denne';

  @override
  String chapterFindStartTitle(String title) {
    return 'Tittel: $title';
  }

  @override
  String get chapterShiftBySeconds => 'Forskyv med (sekunder)';

  @override
  String get chapterShiftHint =>
      'Forskyver alle ulåste kapitler. Bruk en negativ verdi for å flytte dem tidligere.';

  @override
  String get chapterTitleHint => 'Kapitteltittel';

  @override
  String get chapterStopPreview => 'Stopp forhåndsvisning';

  @override
  String get chapterPreviewFromHere => 'Forhåndsvis herfra';

  @override
  String get chapterScrubHint => 'Dra eller puff for å flytte starten';

  @override
  String chapterStartAt(String time) {
    return 'Start ved $time';
  }

  @override
  String get chapterUnlock => 'Lås opp';

  @override
  String get chapterLock => 'Lås';

  @override
  String get chapterInsertBelow => 'Sett inn nedenfor';

  @override
  String get chapterFindTitle => 'Finn kapitler';

  @override
  String get chapterFindSubtitle =>
      'Slår opp kapitler fra Audible/Audnexus med ASIN.';

  @override
  String get chapterEnterAsin => 'Skriv inn en ASIN';

  @override
  String get chapterLookupFailed => 'Oppslaget mislyktes – sjekk ASIN-en';

  @override
  String get chapterNoChaptersFound => 'Fant ingen kapitler for den ASIN-en';

  @override
  String get chapterRemoveBranding =>
      'Fjern Audible-merkevarebygging (intro/outro)';

  @override
  String chapterFoundCount(int count) {
    return 'Fant $count kapitler';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  Bok $book';
  }

  @override
  String get chapterAudibleLonger =>
      'Audible-versjonen er lengre enn filen din – senere kapitler stemmer kanskje ikke.';

  @override
  String get chapterAudibleShorter =>
      'Audible-versjonen er kortere enn filen din – kapitlene stemmer kanskje ikke.';

  @override
  String get chapterTitlesOnly => 'Bare titler';

  @override
  String get chapterApplyChapters => 'Bruk kapitler';

  @override
  String get coverSearchTitle => 'Søk etter et omslag';

  @override
  String get coverSearchRefineHint =>
      'Finjuster tittel/forfatter for å rydde opp i resultatene – dette endrer ikke boken.';

  @override
  String get coverNoneFound => 'Fant ingen omslag';

  @override
  String get coverEnterTitleFirst => 'Skriv inn en tittel først';

  @override
  String get coverUpdated => 'Omslag oppdatert';

  @override
  String get coverCouldNotUpdate => 'Kunne ikke oppdatere omslaget';

  @override
  String get coverApply => 'Bruk omslag';

  @override
  String get coverUnknownResolution => 'Ukjent oppløsning';

  @override
  String get embedIntro =>
      'Bygg metadata inn i lydfilene, inkludert omslagsbilde og kapitler.';

  @override
  String get embedBackupOption => 'Sikkerhetskopier lydfilene først';

  @override
  String get embedNoteInFolder =>
      'Metadata bygges inn i lydsporene i lydbokmappen din.';

  @override
  String get embedNoteMultiTrack =>
      'Kapitler bygges ikke inn i lydbøker med flere spor.';

  @override
  String get embedNoteNavigateAway =>
      'Når oppgaven er startet, kan du forlate denne siden.';

  @override
  String get embedStartButton => 'Start innbygging av metadata';

  @override
  String embedProgress(String percent) {
    return 'Bygger inn $percent %';
  }

  @override
  String get embedProgressIndeterminate => 'Bygger inn ...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent % – fortsetter å kjøre hvis du forlater denne siden';
  }

  @override
  String get taskStarting => 'Starter ...';

  @override
  String get embedBackupNoteIntro =>
      'En sikkerhetskopi av de opprinnelige lydfilene lagres på serveren i ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro => '. Husk å tømme elementbufferen jevnlig.';

  @override
  String get embedDialogTitle => 'Bygg inn metadata';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# lydfiler',
      one: '# lydfil',
    );
    return 'Bygge metadata inn i $_temp0? Lydfilene dine skrives på nytt$backup.';
  }

  @override
  String get embedConfirmBackupClause =>
      ' (originalene sikkerhetskopieres først)';

  @override
  String get embedConfirmAction => 'Bygg inn';

  @override
  String get embedCouldNotStart => 'Kunne ikke starte innbyggingen';

  @override
  String get embedStarted => 'Innbygging startet';

  @override
  String get embedComplete => 'Innbygging fullført';

  @override
  String get embedFailed => 'Innbyggingen mislyktes';

  @override
  String get encodeComplete => 'Koding fullført';

  @override
  String get encodeFailedTask => 'Kodingen mislyktes';

  @override
  String encodeProgress(String percent) {
    return 'Koder $percent %';
  }

  @override
  String get encodeProgressIndeterminate => 'Koder ...';

  @override
  String get adminApiKeys => 'API-nøkler';

  @override
  String get adminApiKeysSubtitle => 'Tilgangstokener for programmatisk bruk';

  @override
  String get adminApiKeysNewTitle => 'Ny API-nøkkel';

  @override
  String get adminApiKeysName => 'Navn';

  @override
  String get adminApiKeysNameHint => 'f.eks. Home Assistant';

  @override
  String get adminApiKeysOwner => 'Bruker';

  @override
  String get adminApiKeysExpiration => 'Utløp';

  @override
  String get adminApiKeysActive => 'Aktiv';

  @override
  String get adminApiKeysActiveSub =>
      'Nøkkelen fungerer så snart den er opprettet';

  @override
  String get adminApiKeysInactive => 'Inaktiv';

  @override
  String get adminApiKeysExpired => 'Utløpt';

  @override
  String get adminApiKeysCreate => 'Opprett nøkkel';

  @override
  String get adminApiKeysCreated => 'API-nøkkel opprettet';

  @override
  String get adminApiKeysTokenLabel => 'Din nye API-nøkkel';

  @override
  String get adminApiKeysCopyWarning =>
      'Kopier denne nøkkelen nå. Av sikkerhetshensyn vises den ikke igjen.';

  @override
  String get adminApiKeysCopy => 'Kopier';

  @override
  String get adminApiKeysCopied => 'Kopiert til utklippstavlen';

  @override
  String get adminApiKeysDone => 'Ferdig';

  @override
  String get adminApiKeysDeleteTitle => 'Tilbakekalle API-nøkkelen?';

  @override
  String get adminApiKeysDeleted => 'API-nøkkel tilbakekalt';

  @override
  String get adminApiKeysRevoke => 'Tilbakekall';

  @override
  String get adminApiKeysSetActive => 'Sett aktiv';

  @override
  String get adminApiKeysSetInactive => 'Sett inaktiv';

  @override
  String get adminApiKeysFailedCreate => 'Kunne ikke opprette API-nøkkelen';

  @override
  String get adminApiKeysFailedDelete => 'Kunne ikke tilbakekalle API-nøkkelen';

  @override
  String get adminApiKeysFailedUpdate => 'Kunne ikke oppdatere API-nøkkelen';

  @override
  String get adminApiKeysEmpty => 'Ingen API-nøkler ennå';

  @override
  String get adminApiKeysEmptySub =>
      'Opprett en for å gi apper og skript tilgang til serveren din';

  @override
  String get adminApiKeysNeverUsed => 'Aldri brukt';

  @override
  String get adminApiKeysNeverExpires => 'Utløper aldri';

  @override
  String get adminApiKeysNameRequired => 'Skriv inn et navn';

  @override
  String get adminApiKeysUserRequired => 'Velg en bruker';

  @override
  String get adminApiKeysExpNever => 'Aldri';

  @override
  String get adminApiKeysExp7d => '7 dager';

  @override
  String get adminApiKeysExp30d => '30 dager';

  @override
  String get adminApiKeysExp90d => '90 dager';

  @override
  String get adminApiKeysExp1y => '1 år';

  @override
  String adminApiKeysLastUsed(String time) {
    return 'Sist brukt $time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return 'Utløper $date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return 'Tilbakekalle «$name»? Apper som bruker denne nøkkelen mister tilgangen umiddelbart.';
  }

  @override
  String get endOfEpisode => 'Slutten av episoden';

  @override
  String get sleepTimerSheetEpisodeSleepStart => 'Sov ved slutten av episoden';

  @override
  String get bookmarkListen => 'Lytt';

  @override
  String get bookmarkPause => 'Pause';

  @override
  String get bookmarkPreviewFailed => 'Kunne ikke spille av dette stedet.';

  @override
  String get clipExport => 'Eksporter klipp';

  @override
  String get clipJumpToStart => 'Hopp til start';

  @override
  String get clipJumpToEnd => 'Hopp til slutt';

  @override
  String get clipSetStart => 'Sett start';

  @override
  String get clipSetEnd => 'Sett slutt';

  @override
  String get clipInLabel => 'Inn';

  @override
  String get clipOutLabel => 'Ut';

  @override
  String get clipSave => 'Lagre klipp';

  @override
  String clipExportSaved(String filename) {
    return 'Lagret $filename';
  }

  @override
  String get clipExportClamped =>
      'Klippet er lagret, forkortet til slutten av dette sporet';

  @override
  String get clipExportFailed => 'Kunne ikke eksportere klippet.';

  @override
  String get clipDownloadToExport =>
      'Last ned denne boken først for å eksportere et klipp på iPhone.';

  @override
  String get fsPickerTitle => 'Velg mappe';

  @override
  String get fsServerRoot => 'Serverrot';

  @override
  String get fsEmptyFolder => 'Ingen undermapper her';

  @override
  String get fsUseThisFolder => 'Bruk denne mappen';

  @override
  String get adminLibrariesManage => 'Bibliotek';

  @override
  String get adminLibrariesManageSubtitle =>
      'Opprett, rediger og endre rekkefølge';

  @override
  String get adminUploadTitle => 'Last opp media';

  @override
  String get adminUploadSubtitle => 'Legg til bøker og podkaster fra filer';

  @override
  String get adminUploadNoLibraries =>
      'Opprett et bibliotek før du laster opp media.';

  @override
  String get adminUploadDestination => 'Destinasjon';

  @override
  String get adminUploadFolder => 'Biblioteksmappe';

  @override
  String get adminUploadDetails => 'Elementdetaljer';

  @override
  String get adminUploadOptional => 'Valgfritt';

  @override
  String get adminUploadAutoMetadata => 'Hent metadata automatisk';

  @override
  String get adminUploadAutoMetadataSubtitle =>
      'Fyll ut tittel, forfatter og serie fra beste treff';

  @override
  String get adminUploadMetadataProvider => 'Metadatakilde';

  @override
  String get adminUploadMetadataSearching => 'Søker etter metadata...';

  @override
  String get adminUploadMetadataNoResults =>
      'Fant ingen metadatatreff. Du kan likevel laste opp dette elementet.';

  @override
  String get adminUploadMetadataFailed =>
      'Kunne ikke søke etter metadata. Du kan likevel laste opp dette elementet.';

  @override
  String get adminUploadDestinationPreview => 'Serverdestinasjon';

  @override
  String get adminUploadFiles => 'Filer';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => 'Velg filer';

  @override
  String get adminUploadAddFiles => 'Legg til filer';

  @override
  String get adminUploadBookFilesHint =>
      'Velg lyd- eller e-bokfiler. Du kan også ta med omslag og metadatafiler.';

  @override
  String get adminUploadPodcastFilesHint =>
      'Velg én eller flere lydfiler. Du kan også ta med omslag og metadatafiler.';

  @override
  String get adminUploadUnsupportedFiles =>
      'Noen av de valgte filene støttes ikke av Audiobookshelf.';

  @override
  String get adminUploadFilePickerFailed => 'Kunne ikke åpne de valgte filene.';

  @override
  String get adminUploadTitleRequired => 'Skriv inn en tittel';

  @override
  String get adminUploadLibraryRequired => 'Velg et bibliotek';

  @override
  String get adminUploadFolderRequired => 'Velg en biblioteksmappe';

  @override
  String get adminUploadFilesRequired => 'Velg minst én fil';

  @override
  String get adminUploadPodcastFileRequired =>
      'Velg minst én lydfil for denne podkasten.';

  @override
  String get adminUploadBookFileRequired =>
      'Velg minst én lyd- eller e-bokfil for denne boken.';

  @override
  String get adminUploadPathCheckFailed =>
      'Kunne ikke sjekke destinasjonsmappen. Ingenting ble lastet opp.';

  @override
  String get adminUploadDestinationExists =>
      'Den destinasjonsmappen finnes allerede på serveren.';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return 'Den destinasjonen brukes allerede av «$title».';
  }

  @override
  String get adminUploadAddToExistingTitle => 'Mappen finnes allerede';

  @override
  String adminUploadAddToExisting(String title) {
    return 'Den mappen tilhører «$title». Legge filene til i den? Serveren henter dem ved neste skanning.';
  }

  @override
  String get adminUploadAddToExistingNoItem =>
      'Den mappen finnes allerede på serveren. Legge filene til i den?';

  @override
  String get adminUploadAddToBook => 'Legg til i en eksisterende bok';

  @override
  String get adminUploadAddToBookHint => 'Søk i dette biblioteket';

  @override
  String get adminUploadNoBooksFound => 'Fant ingen bøker';

  @override
  String adminUploadAddingTo(String title) {
    return 'Legger filer til i «$title»';
  }

  @override
  String adminUploadAddedTo(String title) {
    return 'La filer til i «$title»';
  }

  @override
  String get adminUploadTargetNoFolder =>
      'Fant ikke mappen til den boken på serveren.';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return 'Serveren ville lagt disse filene i «$preview», ikke i bokens mappe «$folder». Ingenting ble lastet opp.';
  }

  @override
  String get adminUploadUploading => 'Laster opp...';

  @override
  String adminUploadProgress(int percent) {
    return 'Laster opp $percent %';
  }

  @override
  String get adminUploadButton => 'Last opp';

  @override
  String adminUploadComplete(String title) {
    return 'Lastet opp «$title»';
  }

  @override
  String get adminUploadFailed => 'Opplastingen mislyktes';

  @override
  String adminUploadFailedReason(String error) {
    return 'Opplastingen mislyktes: $error';
  }

  @override
  String get adminUploadReselectFiles =>
      'Velg filene på nytt før du prøver igjen.';

  @override
  String get adminServerSettings => 'Serverinnstillinger';

  @override
  String get adminServerSettingsSubtitle => 'Skanner, lagring og sortering';

  @override
  String get adminAuthentication => 'Autentisering';

  @override
  String get adminAuthenticationSubtitle =>
      'Passord og OpenID Connect-innlogging';

  @override
  String get adminStats => 'Statistikk';

  @override
  String get adminStatsSubtitle => 'Totaler for bibliotek og lytting';

  @override
  String get adminAllSessions => 'Alle økter';

  @override
  String get adminAllSessionsSubtitle => 'Se og administrer alle lyttinger';

  @override
  String get adminSessionsAllUsers => 'Alle brukere';

  @override
  String get adminSessionsEmpty => 'Ingen økter';

  @override
  String get statsLibraryTotals => 'Bibliotektotaler';

  @override
  String get statsTotalItems => 'Elementer';

  @override
  String get statsAudioFiles => 'Lydfiler';

  @override
  String get statsTotalSize => 'Total størrelse';

  @override
  String get statsBooks => 'Bøker';

  @override
  String get statsPodcasts => 'Podkaster';

  @override
  String get statsBooksSize => 'Størrelse på bøker';

  @override
  String get statsYearReview => 'Året i oversikt';

  @override
  String get statsNoYearData => 'Ingen data for dette året';

  @override
  String get statsListeningTime => 'Lyttetid';

  @override
  String get statsSessions => 'Økter';

  @override
  String get statsBooksAdded => 'Bøker lagt til';

  @override
  String get statsAuthorsAdded => 'Forfattere lagt til';

  @override
  String get statsTopAuthors => 'Toppforfattere';

  @override
  String get statsTopNarrators => 'Toppopplesere';

  @override
  String get statsTopGenres => 'Topp sjangre';

  @override
  String get srvScannerSection => 'Skanner';

  @override
  String get srvFindCovers => 'Finn omslag';

  @override
  String get srvCoverProvider => 'Omslagskilde';

  @override
  String get srvParseSubtitles => 'Hent undertitler fra filnavn';

  @override
  String get srvPreferMatched => 'Foretrekk matchede metadata';

  @override
  String get srvDisableWatcher => 'Slå av mappeovervåking';

  @override
  String get srvStorageSection => 'Lagring';

  @override
  String get srvStoreCover => 'Lagre omslag sammen med elementet';

  @override
  String get srvStoreMetadata => 'Lagre metadata sammen med elementet';

  @override
  String get srvMetadataFormat => 'Format på metadatafil';

  @override
  String get srvFormatSection => 'Visning og format';

  @override
  String get srvDateFormat => 'Datoformat';

  @override
  String get srvTimeFormat => 'Tidsformat';

  @override
  String get srvLanguage => 'Serverspråk';

  @override
  String get srvChromecast => 'Chromecast-støtte';

  @override
  String get srvAllowIframe => 'Tillat iframe-innbygging';

  @override
  String get srvSortingSection => 'Sortering';

  @override
  String get srvIgnorePrefixes => 'Ignorer prefikser ved sortering';

  @override
  String get srvSortingPrefixes => 'Sorteringsprefikser';

  @override
  String get srvAddPrefix => 'Legg til prefiks';

  @override
  String get srvSave => 'Lagre innstillinger';

  @override
  String get srvSavePrefixes => 'Lagre prefikser';

  @override
  String get srvSaved => 'Innstillingene er lagret';

  @override
  String get srvSaveFailed => 'Kunne ikke lagre innstillingene';

  @override
  String get srvPrefixesSaved => 'Sorteringsprefikser oppdatert';

  @override
  String get authSetLoadFailed =>
      'Kunne ikke laste autentiseringsinnstillinger';

  @override
  String get authSetCustomMessage => 'Egendefinert melding ved innlogging';

  @override
  String get authSetMessage => 'Melding';

  @override
  String get authSetPasswordAuth => 'Passordautentisering';

  @override
  String get authSetOpenId => 'OpenID Connect-autentisering';

  @override
  String get authSetGuide => 'Oppsettsveiledning';

  @override
  String get authSetIssuerUrl => 'Issuer-URL';

  @override
  String get authSetAutoPopulate => 'Fyll ut automatisk';

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
  String get authSetClientId => 'Klient-ID';

  @override
  String get authSetClientSecret => 'Klienthemmelighet';

  @override
  String get authSetSigningAlgorithm => 'Signeringsalgoritme';

  @override
  String get authSetRedirectUris => 'Tillatte mobile omdirigerings-URI-er';

  @override
  String get authSetRedirectUrisInfo =>
      'Apper kan bare gå tilbake til disse adressene etter innlogging. Absorb bruker absorb://oauth. En stjerne (*) som eneste oppføring tillater alle adresser.';

  @override
  String get authSetAddRedirectUri => 'Legg til URI';

  @override
  String get authSetAddAbsorbRedirect => 'Legg til absorb://oauth';

  @override
  String get authSetSubfolder => 'Undermappe for omdirigerings-URL-er';

  @override
  String get authSetSubfolderNone => 'Ingen';

  @override
  String get authSetWebRedirectInfo =>
      'Tillat disse URL-ene hos OAuth-leverandøren din, slik at innloggingen kan gå tilbake til nettappen:';

  @override
  String get authSetButtonText => 'Knappetekst';

  @override
  String get authSetMatchExisting => 'Match eksisterende brukere etter';

  @override
  String get authSetMatchNone => 'Ikke match';

  @override
  String get authSetMatchEmail => 'E-post';

  @override
  String get authSetMatchUsername => 'Brukernavn';

  @override
  String get authSetMatchExistingInfo =>
      'Brukes til å koble eksisterende brukere. Når de er koblet, matches brukerne med den unike ID-en fra leverandøren.';

  @override
  String get authSetAutoLaunch => 'Start automatisk';

  @override
  String get authSetAutoLaunchInfo =>
      'Åpne leverandøren automatisk fra innloggingssiden på nettet. /login?autoLaunch=0 hopper over dette.';

  @override
  String get authSetAutoRegister => 'Registrer automatisk';

  @override
  String get authSetAutoRegisterInfo =>
      'Opprett nye brukere automatisk når de logger inn';

  @override
  String get authSetClaimsInfo =>
      'La disse stå tomme for å slå av tildeling av grupper og tillatelser. Nye brukere får da brukerrollen.';

  @override
  String get authSetGroupClaim => 'Gruppe-claim';

  @override
  String get authSetGroupClaimInfo =>
      'Claim som lister brukerens grupper, vanligvis groups. Grupper som heter admin, user eller guest setter rollen, og den høyeste vinner. Hvis ingen gruppe passer, avvises innloggingen.';

  @override
  String get authSetPermsClaim => 'Avansert tillatelses-claim';

  @override
  String get authSetPermsClaimInfo =>
      'Claim med tillatelser for brukere som ikke er administratorer. Hvis claim mangler, avvises innloggingen, og et manglende valg regnes som av. Forventet format:';

  @override
  String get authSetRestartNote =>
      'Start serveren på nytt etter lagring for å ta i bruk endringer i OpenID Connect.';

  @override
  String get authSetNoChanges => 'Ingen endringer å lagre';

  @override
  String get authSetNeedOneMethod => 'Slå på minst én innloggingsmetode';

  @override
  String authSetFieldRequired(String field) {
    return '$field er påkrevd';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return 'Ugyldig omdirigerings-URI: $uri';
  }

  @override
  String get authSetAsteriskAlone =>
      'En stjerne (*) må være eneste omdirigerings-URI';

  @override
  String authSetInvalidClaim(String field) {
    return '$field er ikke et gyldig claim-navn';
  }

  @override
  String authSetIssuerFailed(String error) {
    return 'Kunne ikke lese issuer: $error';
  }

  @override
  String get libNoneYet => 'Ingen bibliotek ennå';

  @override
  String get libReorderFailed => 'Kunne ikke lagre den nye rekkefølgen';

  @override
  String get libDeleteTitle => 'Slette biblioteket?';

  @override
  String get libDeleteBody =>
      'Dette fjerner biblioteket og alle elementene i det permanent fra serveren.';

  @override
  String get libDeleted => 'Biblioteket er slettet';

  @override
  String get libDeleteFailed => 'Kunne ikke slette biblioteket';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mapper',
      one: '1 mappe',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => 'Nytt bibliotek';

  @override
  String get libEditTitle => 'Rediger bibliotek';

  @override
  String get libName => 'Biblioteknavn';

  @override
  String get libMediaType => 'Medietype';

  @override
  String get libMediaBook => 'Bøker';

  @override
  String get libMediaPodcast => 'Podkaster';

  @override
  String get libProvider => 'Metadatakilde';

  @override
  String get libIcon => 'Ikon';

  @override
  String get libFolders => 'Mapper';

  @override
  String get libAddFolder => 'Legg til mappe';

  @override
  String get libNoFolders => 'Legg til minst én mappe';

  @override
  String get libAdvanced => 'Avanserte innstillinger';

  @override
  String get libCoverShape => 'Omslagsform';

  @override
  String get libCoverSquare => 'Kvadratisk';

  @override
  String get libCoverStandard => 'Standard';

  @override
  String get libDisableWatcher => 'Slå av mappeovervåking';

  @override
  String get libSkipAsin => 'Hopp over matching av bøker som har ASIN';

  @override
  String get libSkipIsbn => 'Hopp over matching av bøker som har ISBN';

  @override
  String get libHideSingleSeries => 'Skjul serier med én bok';

  @override
  String get libAudiobooksOnly => 'Kun lydbøker';

  @override
  String get libEpubScripted => 'Tillat skriptet ePub-innhold';

  @override
  String get libLaterBooksOnly => 'Vis bare senere bøker i Fortsett serie';

  @override
  String get libPodcastRegion => 'Søkeregion for podkaster';

  @override
  String get libMarkPercent => 'Fullført ved % fullført';

  @override
  String get libMarkTime => 'Fullført med sekunder igjen';

  @override
  String get libAutoScan => 'Tidsplan for automatisk skanning (cron)';

  @override
  String get libCreate => 'Opprett bibliotek';

  @override
  String get libUpdate => 'Lagre endringer';

  @override
  String get libNameRequired => 'Skriv inn et biblioteknavn';

  @override
  String get libCreated => 'Biblioteket er opprettet';

  @override
  String get libCreateFailed => 'Kunne ikke opprette biblioteket';

  @override
  String get libUpdated => 'Biblioteket er oppdatert';

  @override
  String get libUpdateFailed => 'Kunne ikke oppdatere biblioteket';

  @override
  String get libRemoveFoldersTitle => 'Fjerne mapper?';

  @override
  String get libRemoveFoldersBody =>
      'Når du fjerner en mappe, slettes elementene i den fra biblioteket. Dette kan ikke angres.';

  @override
  String get readEbook => 'Les';

  @override
  String get ebookDownload => 'Last ned';

  @override
  String get ebookDownloaded => 'Nedlastet';

  @override
  String get ebookSavedOffline => 'Lagret for frakoblet lesing';

  @override
  String get ebookRemovedOffline => 'Fjernet fra frakoblet';

  @override
  String get ebookOfflineFailed => 'Kunne ikke laste ned e-boken';

  @override
  String get ebookSaveToDevice => 'Lagre på enheten';

  @override
  String get ebookSaveToDeviceTitle => 'Lagre på enheten?';

  @override
  String get ebookSaveToDeviceBody =>
      'Dette lagrer en kopi av e-bokfilen et sted på enheten din (du velger hvor). Boken blir ikke tilgjengelig frakoblet i leseren - bruk Last ned til det.';

  @override
  String get readerFormatUnsupported =>
      'Dette e-bokformatet kan ikke åpnes i leseren ennå';

  @override
  String get readerCouldNotOpen =>
      'Denne e-boken kunne ikke åpnes. Filen kan være skadet.';

  @override
  String get moreActions => 'Mer';

  @override
  String get readerChapters => 'Kapitler';

  @override
  String get readerSettings => 'Leserinnstillinger';

  @override
  String get readerFontSize => 'Skriftstørrelse';

  @override
  String get readerLineSpacing => 'Linjeavstand';

  @override
  String get readerTextAlignment => 'Justering';

  @override
  String get readerAlignJustified => 'Blokkjustert';

  @override
  String get readerAlignLeft => 'Venstre';

  @override
  String get readerSideMargins => 'Sidemarger';

  @override
  String get readerTopBottom => 'Topp og bunn';

  @override
  String get readerPageLayout => 'Sideoppsett';

  @override
  String get readerPinTopBar => 'Behold tittel og fremdriftslinje på skjermen';

  @override
  String get readerPinTopBarHint =>
      'Fester dem over siden i stedet for å vise dem ved trykk. Siden blir litt kortere, så ingen tekst skjules.';

  @override
  String get readerTopBarProgress => 'Fremdrift i toppfeltet';

  @override
  String get readerTopBarProgressBook => 'Bok';

  @override
  String get readerTopBarProgressChapter => 'Kapittel';

  @override
  String get readerTopBarProgressBoth => 'Begge';

  @override
  String get readerSectionText => 'Tekst';

  @override
  String get readerSectionPage => 'Side';

  @override
  String get readerSectionTopBar => 'Toppfelt og skjerm';

  @override
  String get readerSectionControls => 'Kontroller';

  @override
  String get readerSectionStats => 'Statistikk';

  @override
  String get readerParagraphSpacing => 'Avsnittsavstand';

  @override
  String get readerParagraphSpacingBook => 'Bokens egen';

  @override
  String get readerTapZones => 'Trykksoner';

  @override
  String get readerTapZonesHint =>
      'Dra i linjene for å endre størrelsen på rutene. Trykk på en rute for å endre hva den gjør, eller start fra et oppsett.';

  @override
  String get readerTapPrev => 'Forrige side';

  @override
  String get readerTapNext => 'Neste side';

  @override
  String get readerTapMenu => 'Vis kontroller';

  @override
  String get readerTapNothing => 'Ingenting';

  @override
  String get readerTapKeepMenu => 'Én rute må vise kontrollene';

  @override
  String get readerHideControls => 'Skjul kontroller etter';

  @override
  String get readerHideControlsNever => 'Aldri';

  @override
  String get readerBarNotes => 'Notater og markeringer';

  @override
  String readerHideControlsAfter(int seconds) {
    return '$seconds s';
  }

  @override
  String get playerDownloadStreamingInstead =>
      'Denne nedlastingen kunne ikke spilles av, så den strømmes fra serveren. Å laste den ned på nytt kan hjelpe.';

  @override
  String get readerPageTurn => 'Sidebytte';

  @override
  String get readerPageTurnNone => 'Ingen';

  @override
  String get readerPageTurnSlide => 'Gli';

  @override
  String get readerPageTurnCurl => 'Bla';

  @override
  String get readerPageTurnRipple => 'Krusning';

  @override
  String get readerScrollMode => 'Rullemodus';

  @override
  String get readerScrollModeHint =>
      'Rull nedover i boken i stedet for å bla sider. Gjelder alle bøker.';

  @override
  String get readerKeepAwake => 'Hold skjermen på';

  @override
  String get readerKeepAwakeHint =>
      'Hindrer at skjermen slår seg av mens du leser i eget tempo. Autorulling og lesing med lyd holder den alltid på.';

  @override
  String get readerLayoutAuto => 'Auto';

  @override
  String get readerLayoutSingle => 'Enkel';

  @override
  String get readerLayoutTwoPage => 'To sider';

  @override
  String get readerTheme => 'Tema';

  @override
  String get readerFont => 'Skrift';

  @override
  String get readerVolumeNav => 'Volumtaster blar sider';

  @override
  String get readerVolumeNavOff => 'Av';

  @override
  String get readerVolumeNavNormal => 'Normal';

  @override
  String get readerVolumeNavMirrored => 'Speilvendt';

  @override
  String get readerAutoScroll => 'Autorulling';

  @override
  String get readerAutoScrollSubtitle =>
      'Neste side males over denne ovenfra og ned - dra midt på skjermen for å endre hastighet, trykk for å stoppe';

  @override
  String get readerAutoScrollStarted => 'Autorulling startet';

  @override
  String get readerAutoScrollPaused =>
      'Satt på pause - trykk og hold for å stoppe';

  @override
  String get readerAutoScrollResumed => 'Autorulling gjenopptatt';

  @override
  String get readerAutoScrollStopped => 'Autorulling av';

  @override
  String get readerAutoScrollEndOfBook => 'Slutten av boken - autorulling av';

  @override
  String readerAutoScrollSpeed(int percent) {
    return 'Hastighet $percent %';
  }

  @override
  String get readerMoreControls => 'Flere kontroller';

  @override
  String get readerAutoScrollSleep => 'Sovetimer for autorulling';

  @override
  String get readerAutoScrollSleepHint =>
      'Stopper rullingen etter en stund og lar skjermen bli mørk.';

  @override
  String readerAutoScrollSleepMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String readerAutoScrollSleepLeft(int minutes) {
    return '$minutes min igjen';
  }

  @override
  String readerAutoScrollSleepIn(int minutes) {
    return 'Autorullingen stopper om $minutes min';
  }

  @override
  String get readerAutoScrollSleepOff => 'Sovetimer for autorulling av';

  @override
  String get readerAutoScrollSleepEnded => 'Sovetimer - autorulling av';

  @override
  String get readerDownloadStarted => 'Nedlastingen startet';

  @override
  String get detailChaptersJumpTitle => 'Hoppe til dette kapittelet?';

  @override
  String detailChaptersJumpContent(String title) {
    return 'Avspillingen flyttes til «$title».';
  }

  @override
  String get detailChaptersJump => 'Hopp';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kapitler fullført',
      one: '1 kapittel fullført',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count andre lyttere',
      one: '1 annen lytter',
      zero: 'Ingen andre lyttere',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => 'Neste';

  @override
  String get seriesJumpToUpNext => 'Hopp til neste';

  @override
  String get seriesStatsFinished => 'Fullført';

  @override
  String get seriesStatsListened => 'Lyttet';

  @override
  String get seriesStatsLeft => 'Igjen';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done av $total';
  }

  @override
  String get detailSessionsNone => 'Ingen lyttesesjoner ennå';

  @override
  String detailSessionsAll(int count) {
    return 'Alle $count økter';
  }

  @override
  String get readerVolumeNavWhilePlaying => 'Også mens lyd spilles av';

  @override
  String get readerTranslateWith => 'Oversett med';

  @override
  String get readerTranslateApp => 'App på denne enheten';

  @override
  String get readerTranslateApple => 'Innebygd i iOS';

  @override
  String get readerTranslateWeb => 'Åpnes i nettleseren';

  @override
  String get readerTranslateHint =>
      'Valgt tekst sendes til oversetteren du velger.';

  @override
  String get readerMoreFonts => 'Last ned flere skrifter';

  @override
  String get readerFontRemove => 'Fjern nedlasting';

  @override
  String readerFontDownloadFailed(String font) {
    return 'Kunne ikke laste ned $font';
  }

  @override
  String get readerAnnotations => 'Merknader';

  @override
  String readerHighlights(int count) {
    return 'Markeringer ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return 'Bokmerker ($count)';
  }

  @override
  String get readerNoHighlights => 'Ingen markeringer ennå';

  @override
  String get readerHistory => 'Historikk';

  @override
  String get sessionReading => 'Lesing';

  @override
  String get readerHistoryEmpty =>
      'Sider du forlater, vises her, så du alltid kan komme tilbake til dem.';

  @override
  String get readerHistoryClosed => 'Lukket boken';

  @override
  String get readerHistoryBeforeJump => 'Før et hopp';

  @override
  String get readerHistoryBeforeSync => 'Før tilpasning til lyden';

  @override
  String get readerLogReading => 'Ta med lesetid i statistikken';

  @override
  String get readerLogReadingHint =>
      'Logger tiden din i leseren som en økt, slik at den vises i statistikken din. På Audiobookshelf telles den som lyttetid.';

  @override
  String get readerNoBookmarks => 'Ingen bokmerker ennå';

  @override
  String get readerBookmarkDefault => 'Bokmerke';

  @override
  String get readerNoteTitle => 'Notat';

  @override
  String get readerNoteHint => 'Legg til et notat...';

  @override
  String get backupAndSync => 'Sikkerhetskopi og synkronisering';

  @override
  String get backupAndSyncSubtitle =>
      'Lagre en sikkerhetskopifil, eller hold innstillinger like på tvers av enheter';

  @override
  String get syncSettingsExperimental => 'Eksperimentell';

  @override
  String get syncSettingsExperimentalBody =>
      'Synkroniseringen er ny og under arbeid. Hvis to enheter endrer ting mens de er frakoblet fra hverandre, kan den ene siden miste endringene sine. Ha en sikkerhetskopifil som trygg kopi.';

  @override
  String get syncSettingsNeedServer => 'Trenger du en server?';

  @override
  String get syncSettingsNeedServerSub =>
      'Alle WebDAV-servere fungerer. Nextcloud er en gratis server du kan drifte selv.';

  @override
  String get syncSettingsConnection => 'Tilkobling';

  @override
  String get syncSettingsConnectionNotSet => 'Ikke satt opp ennå';

  @override
  String get syncSettingsBackupFile => 'Sikkerhetskopifil';

  @override
  String get syncSettingsBackupFilePlain =>
      'Lagre alt i en fil du beholder selv.';

  @override
  String get syncSettingsBackupFileWithSync =>
      'Lagre alt i en fil du beholder selv. Ta med innloggingsinfo, så slår gjenoppretting på en annen telefon på synkronisering der også.';

  @override
  String get syncSettingsStatusOff => 'Synkroniserer ikke';

  @override
  String get syncSettingsStatusProblem => 'Kunne ikke nå serveren din';

  @override
  String get syncSettings => 'Synkroniser innstillinger mellom enheter';

  @override
  String get syncSettingsExtras => 'Synkroniser også';

  @override
  String get syncSettingsIncludeRmab => 'ReadMeABook-innstillinger';

  @override
  String get syncSettingsIncludeRmabSub =>
      'Legger ReadMeABook API-tokenet ditt i den synkroniserte filen';

  @override
  String get syncSettingsSubtitle =>
      'Hold innstillingene like via din egen WebDAV-server';

  @override
  String get syncSettingsEnable => 'Synkroniser innstillinger';

  @override
  String get syncSettingsServerUrl => 'URL til WebDAV-mappe';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => 'Brukernavn';

  @override
  String get syncSettingsPassword => 'Passord';

  @override
  String get syncSettingsHeaders => 'Egendefinerte headere (valgfritt)';

  @override
  String get syncSettingsHeadersHint =>
      'Én per linje, f.eks. CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => 'Test tilkobling';

  @override
  String get syncSettingsHoldToUpload => 'Trykk og hold for å laste opp nå';

  @override
  String get syncSettingsUploadNow => 'Last opp nå';

  @override
  String get syncSettingsDownloadNow => 'Last ned nå';

  @override
  String get syncSettingsOk => 'Tilkoblet';

  @override
  String get syncSettingsNoRemote => 'Tilkoblet - ingenting synkronisert ennå';

  @override
  String get syncSettingsAuthFailed => 'Feil brukernavn eller passord';

  @override
  String get syncSettingsNetworkError => 'Kunne ikke nå den adressen';

  @override
  String get syncSettingsNotConfigured =>
      'Fyll inn adresse, brukernavn og passord først';

  @override
  String get syncSettingsTooLarge =>
      'Innstillingene dine er for store til å synkroniseres';

  @override
  String get syncSettingsUploaded => 'Innstillingene er lastet opp';

  @override
  String get syncSettingsApplied =>
      'Innstillinger oppdatert fra den andre enheten din';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count innstillinger oppdatert fra den andre enheten din',
      one: '1 innstilling oppdatert fra den andre enheten din',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => 'Allerede oppdatert';

  @override
  String syncSettingsLastSynced(String when) {
    return 'Sist synkronisert $when';
  }

  @override
  String get syncSettingsNever => 'Ikke synkronisert ennå';

  @override
  String navHoldPickTitle(String tab) {
    return 'Hva skal $tab gjøre ved hold...';
  }

  @override
  String get navHoldPickBody =>
      'Velg hva et langt trykk på denne fanen gjør. Du kan endre det senere i Innstillinger.';

  @override
  String get navHoldSettingTitle => 'Snarveier ved hold på fane';

  @override
  String get navHoldSettingSubtitle => 'Hva hold på hver fane gjør';

  @override
  String get navHoldAskNextTime => 'Spør neste gang';

  @override
  String get navHoldNothing => 'Ingenting';

  @override
  String get navHoldPlayPause => 'Spill av / pause';

  @override
  String get navHoldOfflineMode => 'Frakoblet modus';

  @override
  String get navHoldOfflineOn => 'Frakoblet modus på';

  @override
  String get navHoldOfflineOff => 'Frakoblet modus av';

  @override
  String get navHoldMenu => 'Vis alltid meny';

  @override
  String get navHoldStop => 'Stopp avspilling';

  @override
  String get navHoldRmabSearch => 'ReadMeABook-søk';

  @override
  String get navHoldRmabRequests => 'Mine bokforespørsler';

  @override
  String get navHoldRmabWeb => 'ReadMeABook-nettsted';

  @override
  String get navHoldAdd => 'Legg til';

  @override
  String get navHoldMoveLeft => 'Flytt til venstre';

  @override
  String get navHoldMoveRight => 'Flytt til høyre';

  @override
  String get navHoldRemoveFromMenu => 'Fjern fra menyen';

  @override
  String get navHoldEditHint =>
      'Hold på et element for å flytte eller fjerne det';

  @override
  String get navHoldResetMenu => 'Tilbakestill elementene i holdmenyen';

  @override
  String get navHoldMenuReset => 'Menyelementer tilbakestilt';

  @override
  String get bookStatsAction => 'Lyttestatistikk';

  @override
  String get bookStatsYou => 'Du';

  @override
  String get bookStatsEveryone => 'Alle';

  @override
  String get bookStatsListened => 'Tid lyttet';

  @override
  String get bookStatsSessions => 'Økter';

  @override
  String get bookStatsFirst => 'Først lyttet';

  @override
  String get bookStatsLast => 'Sist lyttet';

  @override
  String get bookStatsListeners => 'Folk som har startet den';

  @override
  String get bookStatsFinishedCount => 'Folk som har fullført den';

  @override
  String get bookStatsTotalTime => 'Tid lyttet av alle';

  @override
  String get bookStatsNobody => 'Ingen har startet denne ennå';

  @override
  String get bookStatsScanning => 'Går gjennom økter, dette kan ta en stund...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return 'Går gjennom økter, $done av $total personer...';
  }

  @override
  String bookStatsLastChecked(String when) {
    return 'Sjekket $when';
  }

  @override
  String get activityYourReading => 'Din lesing';

  @override
  String get activityYourListening => 'Din lytting';

  @override
  String activityLastRead(String when) {
    return 'Sist lest $when';
  }

  @override
  String activityLastListened(String when) {
    return 'Sist lyttet $when';
  }

  @override
  String get activityNotStarted => 'Ikke startet';

  @override
  String get activityNoReading => 'Ingen leseøkter ennå';

  @override
  String get activityTime => 'Tid';

  @override
  String get activityAverage => 'Snitt';

  @override
  String get activityProgress => 'Fremdrift';

  @override
  String activityReached(String percent) {
    return '$percent nådd';
  }

  @override
  String get readingLogTitle => 'Leselogg';

  @override
  String get readingLogTotalTime => 'Total tid';

  @override
  String get readingLogAverageSession => 'Gjennomsnittlig økt';

  @override
  String get readingLogActiveDays => 'Aktive dager';

  @override
  String readingLogActiveDaysOf(int active, int total) {
    return '$active av $total';
  }

  @override
  String get readingLogPace => 'Tempo';

  @override
  String readingLogPacePerHour(String percent) {
    return '$percent %/t';
  }

  @override
  String get readingLogLastRead => 'Sist lest';

  @override
  String get readingLogStarted => 'Startet';

  @override
  String get readingLogFinished => 'Fullført';

  @override
  String get readingLogNotSet => 'Ikke satt';

  @override
  String readingLogLeftMinutes(int m) {
    return 'Ca. $m min til du er ferdig';
  }

  @override
  String readingLogLeftHours(int h) {
    return 'Ca. $h t til du er ferdig';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return 'Ca. $h t $m min til du er ferdig';
  }

  @override
  String get readingLogLeftMax => 'Over 99 t til du er ferdig';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return 'Opp $percent % fra uken før';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return 'Ned $percent % fra uken før';
  }

  @override
  String get readingLogNewThisWeek => 'Ny denne uken';

  @override
  String get readingLogSameAsLastWeek => 'Likt som uken før';

  @override
  String get readingLogQuietTwoWeeks => 'Ingenting de siste to ukene';

  @override
  String get readingLogWhereYouRead => 'Hvor du leste den';

  @override
  String get readingLogSourceIos => 'iOS-app';

  @override
  String get readingLogSourceAndroid => 'Android-app';

  @override
  String get readingLogChartTitle => 'Fremdrift over tid';

  @override
  String get readingLogChartPosition => 'Posisjon nådd';

  @override
  String get readingLogChartMinutes => 'Minutter';

  @override
  String get readingLogRecords => 'Rekorder';

  @override
  String get readingLogLongestSession => 'Lengste økt';

  @override
  String get readingLogBestDay => 'Beste dag';

  @override
  String get readingLogLongestStreak => 'Lengste rekke';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dager',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => 'Hoppet tilbake';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ganger',
      one: '1 gang',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => 'Først åpnet';

  @override
  String get readingLogAttempts => 'Forsøk';

  @override
  String readingLogAttempt(int index) {
    return 'Forsøk $index';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return 'Forsøk $index startet';
  }

  @override
  String get readingLogOutcomeCompleted => 'Fullført';

  @override
  String get readingLogOutcomeSkimmed => 'Skummet';

  @override
  String get readingLogOutcomeAbandoned => 'Gitt opp';

  @override
  String get readingLogOutcomeInProgress => 'Pågår';

  @override
  String readingLogSpanRange(String from, String to) {
    return '$from til $to';
  }

  @override
  String readingLogSpanSince(String from) {
    return 'Siden $from';
  }

  @override
  String readingLogSpanEnded(String to) {
    return 'Avsluttet $to';
  }

  @override
  String get readingLogSpanUnknown => 'Ingen datoer registrert';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count økter',
      one: '1 økt',
    );
    return '$_temp0';
  }

  @override
  String readingLogShowing(int shown, int total) {
    return '$shown av $total';
  }

  @override
  String readingLogGapDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dager uten lesing',
      one: '1 dag uten lesing',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => 'Ingen økter registrert ennå';

  @override
  String get readingLogEmptyHint =>
      'Økter vises her når du leser eller lytter, fra alle apper og enheter som synkroniserer med BookOrbit.';

  @override
  String get readingLogNoMatches => 'Ingen økter i dette tidsrommet';

  @override
  String get readingLogAllTime => 'Alle tider';

  @override
  String get readingLogLast30 => 'Siste 30 dager';

  @override
  String get readingLogLast90 => 'Siste 90 dager';

  @override
  String get readingLogThisYear => 'I år';

  @override
  String get readingLogAllFormats => 'Alle formater';

  @override
  String get readingLogSortBy => 'Sorter etter';

  @override
  String get readingLogSortDay => 'Dag';

  @override
  String get readingLogSortLength => 'Lengde';

  @override
  String get readingLogSortChange => 'Endring';

  @override
  String get readingLogSortReached => 'Nådd';

  @override
  String get readingLogNewestFirst => 'Nyeste først';

  @override
  String get readingLogOldestFirst => 'Eldste først';

  @override
  String get readingLogMostFirst => 'Mest først';

  @override
  String get readingLogLeastFirst => 'Minst først';

  @override
  String get readingLogDeleteTitle => 'Slette denne økten?';

  @override
  String get readingLogDeleteBody =>
      'Den fjernes fra bokens lesing og fra statistikken din på BookOrbit.';

  @override
  String get readingLogDeleteFailed => 'Kunne ikke slette økten';

  @override
  String get readingLogLoadFailed => 'Kunne ikke laste leseloggen';

  @override
  String get navHoldServerScan => 'Serverskanning';

  @override
  String get navHoldScanAll => 'Skann alle bibliotek';

  @override
  String navHoldScanLibrary(String name) {
    return 'Skann $name';
  }

  @override
  String get navHoldScanStarted => 'Skanning startet';

  @override
  String get navHoldScanFailed => 'Kunne ikke starte skanningen';

  @override
  String get navHoldAdminLogs => 'Serverlogger';

  @override
  String navHoldAdminPage(String page) {
    return 'Admin: $page';
  }

  @override
  String get navHoldNothingPlaying => 'Ingenting å spille av ennå';

  @override
  String get navHoldReadBook => 'Les gjeldende bok';

  @override
  String get navHoldBookDetails => 'Detaljer om gjeldende bok';

  @override
  String get syncSourceTitle => 'Hvilken kopi skal synkroniseringen beholde?';

  @override
  String get syncSourceBody =>
      'Denne sikkerhetskopien slo på synkronisering av innstillinger. Bruke serverens siste synkronisering, eller gjøre denne sikkerhetskopien til fasit? Hvis du velger sikkerhetskopien, erstattes kopien på serveren for alle de synkroniserte enhetene dine.';

  @override
  String get syncSourceUseServer => 'Serverens siste synkronisering';

  @override
  String get syncSourceUseBackup => 'Denne sikkerhetskopien';

  @override
  String get syncSettingsWhatTravels =>
      'Preferansene dine, hastigheter per bok, hjemmeoppsett, rekkefølgen i Absorbing, notater og e-bokmarkeringer følger med. Innlogginger, nedlastingsmapper, brytere for automatisk nedlasting, lesernes utseende og alt som ikke er sendt til serveren din, blir værende på denne enheten.';

  @override
  String get syncSettingsDownloadWarnTitle =>
      'Erstatte innstillingene på denne enheten?';

  @override
  String get syncSettingsDownloadWarnBody =>
      'Den synkroniserte kopien overskriver innstillingene på denne enheten.';

  @override
  String get syncSettingsDownloadWarnConfirm => 'Erstatt';

  @override
  String get readerCopied => 'Kopiert til utklippstavlen';

  @override
  String get dictionaryNotFound => 'Fant ingen definisjon av dette ordet.';

  @override
  String get dictionaryError =>
      'Kunne ikke nå ordboken. Sjekk tilkoblingen din.';

  @override
  String get dictionaryRetry => 'Prøv igjen';

  @override
  String get dictionarySearchWeb => 'Søk på nettet';

  @override
  String get readerTooltipCopy => 'Kopier';

  @override
  String get readerTooltipSearch => 'Søk';

  @override
  String get readerTooltipDefine => 'Definer';

  @override
  String get readerTooltipTranslate => 'Oversett';

  @override
  String get readerSearchHint => 'Søk i denne boken…';

  @override
  String readerSearchMatches(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count treff for «$query»',
      one: '$count treff for «$query»',
    );
    return '$_temp0';
  }

  @override
  String get readerSearchEmpty =>
      'Skriv et ord eller en frase og trykk på søk.';

  @override
  String readerSearchNoResults(String query) {
    return 'Ingen treff for «$query».';
  }

  @override
  String get transcriptionTitle => 'Transkribering';

  @override
  String get transcriptionAdvancedSubtitle =>
      'For å transkribere bokmerker og finne plassen din mellom lydbok og e-bok';

  @override
  String get transcriptionEnable => 'Slå på transkribering';

  @override
  String get transcriptionEnableSubtitle =>
      'Legger til Transkriber på bokmerker, Finn posisjon i e-bok i spilleren og Finn i lydbok i leseren';

  @override
  String get transcriptionDisclaimer =>
      'Kjører helt på enheten din, ingenting sendes noe sted. Bruker ekstra batteri og prosessorkraft mens det jobber, og bare nedlastede bøker kan transkriberes.';

  @override
  String get transcriptionNeedModelHint =>
      'Last ned en modell nedenfor for å begynne å transkribere.';

  @override
  String get transcriptionModelSection => 'Modeller';

  @override
  String get transcriptionModelTiny => 'Liten';

  @override
  String get transcriptionModelTinyDesc =>
      'Raskest, men mindre nøyaktig. Ca. 31 MB.';

  @override
  String get transcriptionModelBase => 'Basis';

  @override
  String get transcriptionModelBaseDesc => 'En god mellomting. Ca. 57 MB.';

  @override
  String get transcriptionModelSmall => 'Stor';

  @override
  String get transcriptionModelSmallDesc =>
      'Tregere, men mest nøyaktig - best på en kraftig telefon. Ca. 182 MB.';

  @override
  String get transcriptionAutoHint =>
      'Hvis du har lastet ned mer enn én, velger hver jobb mellom dem. Bøker med e-bok får den raskeste, siden de nøyaktige ordene kommer fra e-boken uansett. Bøker uten e-bok får den mest nøyaktige - unntatt lesing med lyd, som holder seg under Stor for å henge med i opplesingen.';

  @override
  String get transcriptionDownload => 'Last ned';

  @override
  String get transcriptionDownloadFailed =>
      'Nedlastingen mislyktes. Sjekk tilkoblingen din og prøv igjen.';

  @override
  String get transcribe => 'Transkriber';

  @override
  String get transcribing => 'Transkriberer...';

  @override
  String get transcriptionResultTitle => 'Transkripsjon';

  @override
  String get transcriptionSaveToNote => 'Lagre i notat';

  @override
  String get transcriptionSavedToNote => 'Lagret i bokmerkenotatet';

  @override
  String get transcriptionDisabledHint =>
      'Slå på transkribering av bokmerker i Innstillinger, under Avansert.';

  @override
  String get transcriptionNoModelDownloaded =>
      'Last ned en transkripsjonsmodell i Innstillinger først.';

  @override
  String get transcriptionNotDownloadedBook =>
      'Last ned denne boken eller koble til serveren din for å transkribere den.';

  @override
  String get transcriptionNoMetadataMsg =>
      'Kan ikke finne dette stedet i nedlastingen. Prøv å laste ned boken på nytt.';

  @override
  String get transcriptionBusyMsg => 'Transkriberer allerede noe. Vent litt.';

  @override
  String get transcriptionEmptyMsg => 'Fant ingen tale på dette stedet.';

  @override
  String get transcriptionFailedMsg =>
      'Kunne ikke transkribere dette stedet. Prøv igjen.';

  @override
  String get transcriptionPlaySnippet => 'Lytt';

  @override
  String get transcriptionPauseSnippet => 'Pause';

  @override
  String get transcriptionIntroBody =>
      'Dette lytter til den valgte mengden lyd, fra rett før bokmerket, og gjør den om til tekst på enheten din. Lengre klipp tar lengre tid, og transkribering er ikke 100 % nøyaktig. Teksten lagres i bokmerkets notat når den er ferdig, klar til å rettes eller deles.';

  @override
  String get transcriptionUseEbookText =>
      'Bruk e-bokens eksakte tekst når den kan matches';

  @override
  String get lyricsMode => 'Direktetranskripsjon';

  @override
  String get lyricsListeningAhead => 'Lytter i forkant...';

  @override
  String get lyricsDisplaySection => 'Direktetranskripsjon';

  @override
  String get lyricsFontSize => 'Linjestørrelse';

  @override
  String get lyricsMaxLines => 'Viste linjer';

  @override
  String get lyricsFullCover => 'Bruk hele omslaget';

  @override
  String get lyricsFullCoverHint =>
      'Viser transkripsjonen i stedet for omslagsbildet mens den kjører, med så mange linjer som det er plass til.';

  @override
  String get lyricsBatteryInfo =>
      'Direktetranskripsjon og lesing med lyd bruker ekstra batteri og prosessorkraft mens de kjører. På telefoner med tregere prosessor kan det ta lengre tid før linjer vises.';

  @override
  String get lyricsClearCache => 'Tøm transkripsjonsbuffer';

  @override
  String lyricsClearCacheHint(String size) {
    return '$size med lagrede transkripsjonslinjer. Tømte bøker og episoder transkriberes på nytt mens du lytter.';
  }

  @override
  String get lyricsClearCacheConfirm =>
      'Slette de lagrede transkripsjonene for alle bøker og episoder? De bygges opp igjen automatisk mens du lytter.';

  @override
  String get lyricsCacheCleared => 'Transkripsjonsbufferen er tømt';

  @override
  String get lyricsIntroBody =>
      'Dette lytter litt foran opplesingen og viser hver linje mens den leses, transkribert på telefonen din - ingenting forlater enheten. Etter at du har slått det på, vent noen sekunder med å trykke på avspilling mens det kommer i forkant. Transkripsjonen vises når forspranget er klart, og det går jevnest hvis du starter på pause. Det bruker ekstra batteri og prosessorkraft mens det kjører.';

  @override
  String lyricsBuildingLead(String percent) {
    return 'Kommer i forkant av opplesingen... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return 'Kan ikke transkribere like fort som du lytter med $speed';
  }

  @override
  String get lyricsTurnOn => 'Slå på';

  @override
  String get readAlong => 'Les med lyd';

  @override
  String get readAlongNeedsPlaying => 'Spill av lydboken først';

  @override
  String get narrationListen => 'Lytt';

  @override
  String get narrationPlayFromHere => 'Spill av herfra';

  @override
  String get narrationPreparing => 'Gjør opplesingen klar';

  @override
  String get narrationNone => 'Denne e-boken har ingen opplesing å spille av';

  @override
  String get narrationDownloadTitle => 'Last ned for å lytte';

  @override
  String get narrationDownloadBody =>
      'Denne boken er en EPUB3 som leser seg selv høyt. Audiobookshelf kan ikke strømme opplesingen, så lyden må lastes ned før den spilles av.';

  @override
  String get narrationDownloadStarted =>
      'Laster ned opplesingen. Trykk på Absorb når den er ferdig.';

  @override
  String get narrationTextBody =>
      'EPUB-en til denne boken har sine egne ord for hvert øyeblikk i lyden, så teksten kopieres rett fra boken. Velg hvor mye som skal legges til i bokmerkets notat.';

  @override
  String get narrationTextLoading => 'Henter ordene fra boken';

  @override
  String get downloadToAbsorb => 'Last ned til Absorb';

  @override
  String get narrationUpNextTitle => 'Last ned det som kommer neste';

  @override
  String narrationUpNextBody(String title) {
    return '$title er neste i køen din. Det er en EPUB3 som leser seg selv høyt, så den må lastes ned før den kan spilles av.';
  }

  @override
  String narrationQueueStopped(String title) {
    return 'Stoppet før $title. Last den ned for å fortsette.';
  }

  @override
  String get transcriptionNeedsDownload =>
      'Dette trenger lyden på telefonen din. Laste den ned nå?';

  @override
  String get transcriptionDownloadStarted =>
      'Laster ned. Slå dette på igjen når det er ferdig';

  @override
  String get readAlongFollow => 'Les med lyd følger';

  @override
  String get syncReadingListening => 'Hold lesing og lytting synkronisert';

  @override
  String get syncReadingListeningHint =>
      'For bøker med både lydbok og e-bok. Når du slutter å lytte, flyttes e-boken dit du stoppet. Når du forlater leseren, flyttes lydboken til siden din. Flytter bare fremover.';

  @override
  String get syncEbookMoved => 'E-boken er flyttet dit du sluttet å lytte';

  @override
  String get syncAudioMoved => 'Lydboken er flyttet dit du sluttet å lese';

  @override
  String get syncAudioOffer => 'Trykk for å hoppe dit du sluttet å lese';

  @override
  String get syncFindingAudio => 'Finner siden din i lydboken';

  @override
  String get syncFindingEbook => 'Finner plassen din i e-boken';

  @override
  String get syncFailed => 'Kunne ikke synkronisere plassen din';

  @override
  String get syncAlreadyTogether => 'Allerede synkronisert';

  @override
  String get syncPosition => 'Synkroniser posisjon';

  @override
  String get readAlongFollowHint =>
      'Ordtidspunktene beregnes mellom tidsstemplene i transkripsjonen, så de kan avvike litt inne i en setning.';

  @override
  String get readAlongFollowWord => 'Ord';

  @override
  String get readAlongFollowSentence => 'Setning';

  @override
  String get readAlongColor => 'Farge for lesing med lyd';

  @override
  String get readAlongLost => 'Finner ikke opplesingen på siden';

  @override
  String get readAlongBackToNarration => 'Tilbake til opplesingen';

  @override
  String get findInEbook => 'Finn i e-bok';

  @override
  String get findInEbookSearching => 'Finner dette stedet i e-boken...';

  @override
  String get findInEbookNotFound => 'Fant ikke dette stedet i e-boken.';

  @override
  String get findInEbookNeedsEpub => 'Finn i e-bok krever en EPUB-e-bok.';

  @override
  String get findInEbookNoEbook => 'Denne boken har ingen e-bok.';

  @override
  String get findInAudiobook => 'Finn i lydbok';

  @override
  String get findInAudiobookSearching => 'Finner dette stedet i lydboken...';

  @override
  String get findInAudiobookStillSearching =>
      'Søker fortsatt i lyden etter dette stedet...';

  @override
  String get findInAudiobookSearchingLong =>
      'Langt kapittel, søker fortsatt. Dette kan ta et minutt eller to...';

  @override
  String get findInAudiobookNotFound => 'Fant ikke dette stedet i lydboken.';

  @override
  String get transcriptionWhisperInfo =>
      'Transkribering drives av Whisper, en åpen modell for talegjenkjenning som lytter til opplesingen og skriver ut ordene - alt på denne enheten.';

  @override
  String get transcriptionWhisperLearnMore => 'Les mer om Whisper';

  @override
  String get findInAudiobookIntroBody =>
      'Dette lytter til lydboken der du leser og matcher den med denne passasjen, alt på enheten din. Det kan ta opptil et minutt. Hvis stedet ikke kan matches med sikkerhet, flyttes ingenting.';

  @override
  String get findInAudiobookAfterLabel => 'Når stedet er funnet';

  @override
  String get findInAudiobookStay => 'Fortsett å lese';

  @override
  String get findInAudiobookGoPlayer => 'Åpne spilleren';

  @override
  String get findInAudiobookPlaying => 'Spiller denne passasjen i lydboken';

  @override
  String get catchUpAudioAhead =>
      'Lydboken er lenger fremme. Trykk for å gå dit.';

  @override
  String get catchUpPageAhead =>
      'Denne siden er foran lydboken. Trykk for å flytte lydboken hit.';

  @override
  String get readerShortcutButton => 'Snarveisknapp';

  @override
  String get keepScreenOn => 'Hold skjermen på';

  @override
  String get keepScreenOnActive => 'Skjermen forblir på';

  @override
  String get keepScreenOnUntilClosed =>
      'Skjermen forblir på til du lukker appen';

  @override
  String get keepScreenOnOff => 'Skjermen kan slå seg av igjen';

  @override
  String get keepScreenOnOffUntilRestart =>
      'Av til appen startes på nytt. Bryteren i Innstillinger forblir på';

  @override
  String get keepScreenOnPlayer => 'Hold skjermen på i spilleren';

  @override
  String get keepScreenOnPlayerSubtitle =>
      'Skjermen forblir på mens spilleren er åpen';

  @override
  String get keepScreenOnCarMode => 'Hold skjermen på i bilmodus';

  @override
  String get keepScreenOnCarModeSubtitle =>
      'Skjermen forblir på mens bilmodus er åpen';

  @override
  String get loginServerType => 'Servertype';

  @override
  String get authBookOrbitDefaultPassword =>
      'Denne kontoen har fortsatt standardpassordet. Endre det i BookOrbit, og logg inn på nytt.';

  @override
  String get authBookOrbitPasswordOff =>
      'Passordinnlogging er slått av på denne serveren. Logg inn med en magisk lenke eller enkel pålogging (SSO).';

  @override
  String get authServerIsBookOrbit =>
      'Dette er en BookOrbit-server. Velg BookOrbit over serveradressen.';

  @override
  String get authServerIsAudiobookshelf =>
      'Dette er en Audiobookshelf-server. Velg Audiobookshelf over serveradressen.';

  @override
  String get castNotAvailableBookOrbit =>
      'Casting er ikke tilgjengelig med BookOrbit-servere';

  @override
  String get loginMagicLink => 'Magisk lenke';

  @override
  String get loginMagicLinkDescription =>
      'Logg inn med en magisk lenke fra BookOrbit, eller lim inn en passordlenke for å velge passordet ditt.';

  @override
  String get collectionPublicTitle => 'Offentlig';

  @override
  String get collectionPublicSubtitle =>
      'Alle på denne serveren kan se denne samlingen';

  @override
  String loginSignInWithProvider(String provider) {
    return 'Logg inn med $provider';
  }

  @override
  String get loginSignInWithSso => 'Logg inn med SSO';

  @override
  String get loginChooseSsoProvider => 'Velg hvordan du vil logge inn';

  @override
  String get loginRedirectUriBookOrbit =>
      'Omdirigerings-URI: bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => 'Lesestatus';

  @override
  String get readStatusHint =>
      'BookOrbit beholder en status du velger her til du endrer den.';

  @override
  String get readStatusUnread => 'Ulest';

  @override
  String get readStatusWantToRead => 'Vil lese';

  @override
  String get readStatusReading => 'Leser';

  @override
  String get readStatusOnHold => 'På vent';

  @override
  String get readStatusRereading => 'Leser på nytt';

  @override
  String get readStatusRead => 'Lest';

  @override
  String get readStatusSkimmed => 'Skummet';

  @override
  String get readStatusAbandoned => 'Gitt opp';

  @override
  String get personalNoteTitle => 'Ditt notat';

  @override
  String get personalNoteAdd => 'Legg til et privat notat';

  @override
  String get personalNoteHint => 'Bare du kan se dette notatet.';

  @override
  String get moreLikeThis => 'Mer som dette';

  @override
  String get coverSlotAudiobook => 'Omslag for lydbok';

  @override
  String get coverSlotBook => 'Bokomslag';

  @override
  String get cardButtonFill => 'Knappebakgrunn';

  @override
  String get cardButtonFillSubtitle =>
      'Hvordan knappene på spillerkortet fylles';

  @override
  String get cardButtonFillClear => 'Gjennomsiktig';

  @override
  String get cardButtonFillSubtle => 'Diskret';

  @override
  String get cardButtonFillSolid => 'Heldekkende';

  @override
  String get loginBookOrbitPreview =>
      'Støtten for BookOrbit er ny. Avspilling, nedlastinger og bla-funksjonen virker, men noen skjermer kan fortsatt se ut eller oppføre seg som Audiobookshelf. Følg med på fremdriften på GitHub, og si fra hvis noe virker feil.';

  @override
  String get signedOutTapToSignIn => 'Logget ut. Trykk for å logge inn igjen.';

  @override
  String get authSignedOutKeepListening =>
      'Du er logget ut. Nedlastinger spilles fortsatt av. Trykk på den røde skyen for å logge inn igjen.';

  @override
  String signedOutSyncNote(String username, String server) {
    return 'Det du lytter til mens du er logget ut, lagres på denne telefonen og synkroniseres når du logger inn igjen som $username på $server. Alle måter å logge inn på den kontoen fungerer.';
  }

  @override
  String get comicReadingDirection => 'Leseretning';

  @override
  String comicPageNumber(int page) {
    return 'Side $page';
  }

  @override
  String get comicBookmarkRemoveFailed =>
      'Kunne ikke fjerne bokmerket fra serveren. Prøv igjen når du er på nett.';

  @override
  String get comicLeftToRight => 'Venstre til høyre';

  @override
  String get comicRightToLeft => 'Høyre til venstre (manga)';

  @override
  String get comicNeedsConnection =>
      'Denne tegneserien åpnes side for side fra serveren din, så den trenger en tilkobling.';

  @override
  String get comicNoPages => 'Fant ingen sider i denne tegneserien.';

  @override
  String get boAdminTitle => 'Serveradmin';

  @override
  String get boAdminSubtitle =>
      'Brukere og bibliotek på denne BookOrbit-serveren';

  @override
  String get boAdminUsers => 'Brukere';

  @override
  String get boAdminLibraries => 'Bibliotek';

  @override
  String boAdminUserCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personer',
      one: '1 person',
    );
    return '$_temp0';
  }

  @override
  String boAdminLibraryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bibliotek',
      one: '1 bibliotek',
    );
    return '$_temp0';
  }

  @override
  String get boAdminSaved => 'Lagret';

  @override
  String get boAdminFailed => 'Det fungerte ikke. Prøv igjen.';

  @override
  String get boAdminOffline => 'Kunne ikke nå serveren.';

  @override
  String get boUsersSearch => 'Søk etter brukere';

  @override
  String get boUsersNone => 'Ingen brukere her';

  @override
  String get boUsersFilterAll => 'Alle';

  @override
  String get boUsersFilterAdmins => 'Administratorer';

  @override
  String get boUsersFilterActive => 'Aktive';

  @override
  String get boUsersFilterInactive => 'Inaktive';

  @override
  String get boUsersFilterAttention => 'Trenger oppmerksomhet';

  @override
  String get boUserBadgeAdmin => 'Admin';

  @override
  String get boUserBadgeInactive => 'Inaktiv';

  @override
  String get boUserBadgeLocked => 'Låst';

  @override
  String get boUserBadgeNoPassword => 'Ikke passord ennå';

  @override
  String boUserLastActive(String date) {
    return 'Sist aktiv $date';
  }

  @override
  String get boUserNeverSignedIn => 'Aldri logget inn';

  @override
  String get boUserNew => 'Ny bruker';

  @override
  String get boUserCreate => 'Opprett';

  @override
  String get boUserUsername => 'Brukernavn';

  @override
  String get boUserUsernameHint => 'Minst 3 tegn. Kan ikke endres senere.';

  @override
  String get boUserName => 'Navn';

  @override
  String get boUserEmail => 'E-post';

  @override
  String get boUserEmailInvalid => 'Skriv inn en gyldig e-postadresse';

  @override
  String get boUserActive => 'Aktiv';

  @override
  String get boUserActiveSubtitle => 'Inaktive brukere kan ikke logge inn';

  @override
  String get boUserAdmin => 'Administrator';

  @override
  String get boUserAdminSubtitle => 'Full tilgang til alt på serveren';

  @override
  String get boUserAdminHasAll =>
      'Administratorer har alle tillatelser og ser alle bibliotek.';

  @override
  String get boUserPermissions => 'Tillatelser';

  @override
  String get boUserPresetNone => 'Ingen';

  @override
  String get boUserPresetStandard => 'Standard';

  @override
  String get boUserPresetEverything => 'Alt';

  @override
  String get boUserLibraries => 'Bibliotek';

  @override
  String get boUserLibrariesHint => 'Bibliotekene denne personen kan se.';

  @override
  String get boUserPasswordLink => 'Send passordlenke';

  @override
  String get boUserPasswordLinkSubtitle =>
      'En lenke for å velge nytt passord, gyldig i 15 minutter';

  @override
  String get boUserExternal =>
      'Logger inn via enkel pålogging (SSO), så passordet administreres der.';

  @override
  String get boUserUnlock => 'Lås opp konto';

  @override
  String get boUserUnlocked => 'Kontoen er låst opp';

  @override
  String get boUserDelete => 'Slett bruker';

  @override
  String boUserDeleteTitle(String name) {
    return 'Slette $name?';
  }

  @override
  String get boUserDeleteBody =>
      'Kontoen og alt de har på denne serveren fjernes. Dette kan ikke angres.';

  @override
  String get boUserDeleted => 'Brukeren er slettet';

  @override
  String get boUserLinkTitle => 'Passordlenke';

  @override
  String boUserLinkBody(String name) {
    return 'Del denne lenken med $name. Den lar vedkommende velge et passord og fungerer i 15 minutter.';
  }

  @override
  String get boPasswordRules =>
      'Minst 8 tegn, med en stor bokstav, en liten bokstav og et tall.';

  @override
  String get boSetPasswordTitle => 'Velg passordet ditt';

  @override
  String get boSetPasswordSubmit => 'Velg passord og logg inn';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return 'Velg et passord for $username på $server.';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return 'Velg et passord for kontoen din på $server.';
  }

  @override
  String get boSetPasswordStartingBody =>
      'Denne kontoen har fortsatt passordet den ble opprettet med. Velg et nytt for å fullføre innloggingen.';

  @override
  String get boSetPasswordTrust =>
      'Fortsett bare hvis du stoler på avsenderen av denne lenken.';

  @override
  String get boPasswordLinkExpired =>
      'Denne lenken er utløpt eller allerede brukt. Be serveradministratoren om en ny.';

  @override
  String boPasswordSetSignInFailed(String error) {
    return 'Passordet er satt, men innloggingen mislyktes: $error';
  }

  @override
  String get boChangePasswordSubtitle => 'Oppdater BookOrbit-passordet ditt';

  @override
  String get boPasswordChangeEffect =>
      'Når du endrer passordet, logges de andre BookOrbit-øktene dine ut. Denne enheten forblir innlogget.';

  @override
  String get boPasswordChanged =>
      'Passordet er endret. Andre innloggede enheter ble logget ut.';

  @override
  String boPasswordShareDescription(String username) {
    return 'Send denne lenken, eller la $username skanne QR-koden for å velge passord og logge inn på Absorb. Den fungerer i 15 minutter.';
  }

  @override
  String boPasswordShareWarning(String username) {
    return 'Alle med denne lenken kan velge passordet for $username til den er brukt eller utløper.';
  }

  @override
  String get setupLinkCopyWebLink => 'Kopier nettlenke';

  @override
  String get boUserLinkCopy => 'Kopier lenke';

  @override
  String get boUserLinkCopied => 'Lenke kopiert';

  @override
  String get boUserLinkShare => 'Del';

  @override
  String get boUserNoLink =>
      'Brukeren ble lagt til, men serveren sendte ingen passordlenke. Send en fra brukerens side.';

  @override
  String get boPermGroupLibrary => 'Bibliotek og bøker';

  @override
  String get boPermGroupRequests => 'Bokforespørsler';

  @override
  String get boPermGroupDevices => 'Enheter';

  @override
  String get boPermGroupIntegrations => 'Leseintegrasjoner';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => 'E-post og varsler';

  @override
  String get boPermGroupAdmin => 'Administrasjon';

  @override
  String get boPermLibraryDownload => 'Last ned bøker';

  @override
  String get boPermLibraryUpload => 'Last opp bøker';

  @override
  String get boPermLibraryEditMetadata => 'Rediger metadata';

  @override
  String get boPermLibraryDeleteBooks => 'Slett bøker';

  @override
  String get boPermBookRequestAccess => 'Be om bøker';

  @override
  String get boPermBookRequestAutoApprove =>
      'Forespørsler godkjennes automatisk';

  @override
  String get boPermBookRequestSelfFulfill => 'Last ned ønskede bøker direkte';

  @override
  String get boPermManageBookRequests => 'Administrer bokforespørsler';

  @override
  String get boPermKoboSync => 'Kobo-synkronisering';

  @override
  String get boPermKoreaderSync => 'KOReader-synkronisering';

  @override
  String get boPermOpdsAccess => 'OPDS-tilgang';

  @override
  String get boPermHardcoverSync => 'Hardcover-synkronisering';

  @override
  String get boPermReadwiseSync => 'Readwise-synkronisering';

  @override
  String get boPermStorygraphSync => 'StoryGraph-synkronisering';

  @override
  String get boPermBookDockAccess => 'Bruk Book Dock';

  @override
  String get boPermManageBookDock => 'Administrer Book Dock';

  @override
  String get boPermEmailSend => 'Send bøker på e-post';

  @override
  String get boPermNotificationAccess => 'Varsler';

  @override
  String get boPermManageEmail => 'Administrer e-post';

  @override
  String get boPermManageLibraries => 'Administrer bibliotek';

  @override
  String get boPermManageMetadataConfig => 'Metadatainnstillinger';

  @override
  String get boPermManageIcons => 'Administrer ikoner';

  @override
  String get boPermManageUsers => 'Administrer brukere';

  @override
  String get boPermViewUserActivity => 'Se brukeraktivitet';

  @override
  String get boPermViewAuditLog => 'Se revisjonsloggen';

  @override
  String get boPermManageAppSettings => 'Appinnstillinger';

  @override
  String get boLibsNone => 'Ingen bibliotek ennå';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker',
      one: '1 bok',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => 'Skann nå';

  @override
  String get boLibScanStarted => 'Skanning startet';

  @override
  String get boLibScanning => 'Skanner';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return 'Skannet $date: $added lagt til, $updated oppdatert, $missing mangler';
  }

  @override
  String get boLibScanFailed => 'Den siste skanningen mislyktes';

  @override
  String get boLibNeverScanned => 'Ikke skannet ennå';

  @override
  String get boLibNew => 'Nytt bibliotek';

  @override
  String get boLibName => 'Navn';

  @override
  String get boLibNeedName => 'Gi biblioteket et navn';

  @override
  String get boLibIcon => 'Ikon';

  @override
  String get boLibFolders => 'Mapper';

  @override
  String get boLibFoldersHint =>
      'Mapper på serveren der bøkene i dette biblioteket ligger.';

  @override
  String get boLibNeedFolder => 'Legg til minst én mappe';

  @override
  String get boLibAddFolder => 'Legg til mappe';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return 'Allerede i $library';
  }

  @override
  String get boLibFolderUnreadable => 'Serveren kan ikke lese denne mappen';

  @override
  String get boLibFolderRescan =>
      'Når du endrer mappene, skannes biblioteket på nytt.';

  @override
  String get boLibOrganization => 'Bøker lagres som';

  @override
  String get boLibPerFolder => 'Én bok per mappe';

  @override
  String get boLibPerFile => 'Én bok per fil';

  @override
  String get boLibOrganizationFixed =>
      'Dette kan ikke endres etter at biblioteket er opprettet.';

  @override
  String get boLibWatch => 'Se etter endringer';

  @override
  String get boLibWatchSubtitle =>
      'Plukk opp nye og endrede filer etter hvert som de dukker opp';

  @override
  String get boLibSchedule => 'Planlagt skanning';

  @override
  String get boLibScheduleOff => 'Av';

  @override
  String get boLibScheduleDaily => 'Daglig';

  @override
  String get boLibScheduleWeekly => 'Ukentlig';

  @override
  String boLibScheduleCustom(String cron) {
    return 'Egendefinert ($cron)';
  }

  @override
  String get boLibScheduleHint => 'Kjører kl. 03.00 servertid.';

  @override
  String get boLibCovers => 'Omslagsform';

  @override
  String get boLibCoverBook => 'Bok (2:3)';

  @override
  String get boLibCoverSquare => 'Kvadratisk (1:1)';

  @override
  String get boLibAccess => 'Hvem kan se det';

  @override
  String get boLibAccessHint =>
      'Administratorer ser alle bibliotek. Andre trenger tilgang her.';

  @override
  String get boLibAccessNone => 'Bare administratorer så langt';

  @override
  String get boLibAccessAdd => 'Legg til person';

  @override
  String get boLibAccessEveryoneHas => 'Alle har allerede tilgang';

  @override
  String get boLibLevelViewer => 'Leser';

  @override
  String get boLibLevelEditor => 'Redaktør';

  @override
  String get boLibLevelOwner => 'Eier';

  @override
  String get boLibAccessRemove => 'Fjern tilgang';

  @override
  String get boLibDelete => 'Slett bibliotek';

  @override
  String boLibDeleteTitle(String name) {
    return 'Slette $name?';
  }

  @override
  String get boLibDeleteBody =>
      'Biblioteket fjernes fra BookOrbit, sammen med fremdrift og markeringer for bøkene. Filene på serveren blir liggende.';

  @override
  String get boLibDeleted => 'Biblioteket er slettet';

  @override
  String get boFolderPickTitle => 'Velg en mappe';

  @override
  String get boFolderUseThis => 'Bruk denne mappen';

  @override
  String get boFolderEmpty => 'Ingen mapper inni';

  @override
  String get statsTotalTime => 'TOTAL TID';

  @override
  String get statsTotalReadingTime => 'TOTAL LESETID';

  @override
  String statsDaysOfTime(String days) {
    return 'Det er $days dager';
  }

  @override
  String statsHoursOfTime(String hours) {
    return 'Det er $hours timer';
  }

  @override
  String get statsMediaAll => 'Alle';

  @override
  String get statsMediaListening => 'Lytting';

  @override
  String get statsMediaReading => 'Lesing';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'BookOrbit teller dagene dine i $server, men denne telefonen er satt til $phone. Tid sent på dagen kan havne på feil dag.';
  }

  @override
  String statsZoneUse(String zone) {
    return 'Bruk $zone';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'BookOrbit bruker nå $zone. Eldre dager kan bruke noen minutter på å oppdateres.';
  }

  @override
  String get statsZoneFailed => 'Kunne ikke endre tidssonen på BookOrbit';

  @override
  String get statsTimeOfDay => 'Tid på døgnet';

  @override
  String statsBusiestAround(String time) {
    return 'Travlest rundt $time';
  }

  @override
  String get statsFinishedByMonth => 'Bøker fullført per måned';

  @override
  String statsFinishedLast12(int count) {
    return '$count de siste 12 månedene';
  }

  @override
  String get statsWhereTitle => 'Hvor du lytter og leser';

  @override
  String get statsLast12Months => 'Siste 12 måneder';

  @override
  String get statsHabits => 'Vaner';

  @override
  String get statsTypicalSession => 'Typisk økt';

  @override
  String get statsProgressPerSession => 'Fremdrift per økt';

  @override
  String get statsTimeToFinish => 'Tid til fullføring';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dager',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => 'Bøker startet';

  @override
  String get statsBooksInProgress => 'Pågår';

  @override
  String get statsAverageProgress => 'Gjennomsnittlig fremdrift';

  @override
  String get statsTopBooks => 'Toppbøker';

  @override
  String get statsYearRead => 'Lest';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uleste',
      one: '1 ulest',
      zero: 'Ingenting nytt',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => 'Merk alle som lest';

  @override
  String get boNotificationsClearAll => 'Fjern alle';

  @override
  String get boNotificationsClearTitle => 'Fjerne alle varsler?';

  @override
  String get boNotificationsClearBody =>
      'Dette fjerner alle varsler fra BookOrbit-kontoen din.';

  @override
  String get boNotificationsEmpty => 'Ingen varsler ennå';

  @override
  String get boNotificationsLoadFailed => 'Kunne ikke laste varsler';

  @override
  String get boNotificationsUpdateFailed =>
      'Kunne ikke oppdatere varsler på BookOrbit';

  @override
  String boNotificationsOccurrences(int count) {
    return 'Skjedde $count ganger';
  }

  @override
  String get boNotificationsSettings => 'Varselinnstillinger';

  @override
  String get boNotificationsSettingsIntro =>
      'Velg hvilke varsler BookOrbit skal beholde for deg.';

  @override
  String get boNotificationsProblemsHint =>
      'Problemer varsler deg bare når noe feiler eller trenger oppmerksomhet.';

  @override
  String get boNotificationLevelOff => 'Av';

  @override
  String get boNotificationLevelProblems => 'Problemer';

  @override
  String get boNotificationLevelAll => 'Alle';

  @override
  String get boNotificationsSaved => 'Varselinnstillingene er lagret';

  @override
  String get boNotificationsSaveFailed =>
      'Kunne ikke lagre varselinnstillingene';

  @override
  String get boNotificationGroupLibrary => 'Bibliotek';

  @override
  String get boNotificationGroupFiles => 'Filer';

  @override
  String get boNotificationGroupIntegrations => 'Integrasjoner';

  @override
  String get boNotificationGroupPersonal => 'Personlig';

  @override
  String get boNotifyScanning => 'Bibliotekskanning';

  @override
  String get boNotifyScanningDesc =>
      'Når en bibliotekskanning er ferdig, feiler eller finner manglende bøker.';

  @override
  String get boNotifyMetadata => 'Henting av metadata';

  @override
  String get boNotifyMetadataDesc =>
      'Når oppslag av metadata for bøkene dine er ferdige eller feiler.';

  @override
  String get boNotifyAuthorEnrichment => 'Forfatterdetaljer';

  @override
  String get boNotifyAuthorEnrichmentDesc =>
      'Når forfatterbiografier og bilder er ferdig nedlastet.';

  @override
  String get boNotifyFileWriteBack => 'Lagring til filer';

  @override
  String get boNotifyFileWriteBackDesc =>
      'Når redigerte detaljer lagres i bokfilene på disken.';

  @override
  String get boNotifyFileRename => 'Endring av filnavn';

  @override
  String get boNotifyFileRenameDesc =>
      'Når en bokfil får nytt navn for å passe til navnemønsteret ditt.';

  @override
  String get boNotifyBulkRename => 'Masseomdøping';

  @override
  String get boNotifyBulkRenameDesc =>
      'Når omdøping av mange bøker, eller flytting av bøker mellom bibliotek, er ferdig eller feiler.';

  @override
  String get boNotifyMigration => 'Importer';

  @override
  String get boNotifyMigrationDesc =>
      'Når en import fra en annen biblioteksapp er ferdig eller feiler.';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc =>
      'Når Book Dock er ferdig med å legge til bøker eller støter på problemer.';

  @override
  String get boNotifyBookRequests => 'Bokforespørsler';

  @override
  String get boNotifyBookRequestsDesc =>
      'Når en bokforespørsel sendes inn eller avgjøres, eller boken blir tilgjengelig.';

  @override
  String get boNotifyEmail => 'E-postlevering';

  @override
  String get boNotifyEmailDesc =>
      'Når det lykkes eller feiler å sende en bok på e-post.';

  @override
  String get boNotifyAchievements => 'Prestasjoner';

  @override
  String get boNotifyAchievementsDesc => 'Når du låser opp en ny prestasjon.';

  @override
  String get achievementsTitle => 'Prestasjoner';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return '$earned av $total opptjent';
  }

  @override
  String get achievementsFilterAll => 'Alle';

  @override
  String get achievementsFilterEarned => 'Opptjent';

  @override
  String get achievementsFilterInProgress => 'Pågår';

  @override
  String get achievementsFilterLocked => 'Låst';

  @override
  String get achievementsCategoryReading => 'Lesing';

  @override
  String get achievementsCategoryLibrary => 'Bibliotek';

  @override
  String get achievementsCategoryExploration => 'Utforskning';

  @override
  String get achievementsCategoryDedication => 'Dedikasjon';

  @override
  String get achievementsCategoryDevices => 'Enheter';

  @override
  String get achievementsRarityCommon => 'Vanlig';

  @override
  String get achievementsRarityRare => 'Sjelden';

  @override
  String get achievementsRarityEpic => 'Episk';

  @override
  String get achievementsRarityLegendary => 'Legendarisk';

  @override
  String get achievementsLoadFailed => 'Kunne ikke laste prestasjoner';

  @override
  String get achievementsNoneMatch =>
      'Ingen prestasjoner passer med dette filteret';

  @override
  String get achievementsSecretName => 'Hemmelig prestasjon';

  @override
  String get achievementsSecretHint => 'Fortsett å lese for å avsløre denne.';

  @override
  String achievementsEarnedOn(String date) {
    return 'Opptjent $date';
  }

  @override
  String achievementsWhileReading(String title) {
    return 'Mens du leste $title';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return 'Nivå $earned av $total';
  }

  @override
  String get achievementsTiers => 'Nivåer';

  @override
  String get achievementsAllTiers => 'Alle nivåer opptjent';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold bøker';
  }

  @override
  String achievementsProgressPages(String current, String threshold) {
    return '$current / $threshold sider';
  }

  @override
  String achievementsProgressHours(String current, String threshold) {
    return '$current / $threshold timer';
  }

  @override
  String achievementsProgressAnnotations(String current, String threshold) {
    return '$current / $threshold markeringer og notater';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold vurderinger';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $threshold sjangre';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold språk';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold dager';
  }

  @override
  String get achievementsHowToGetIt => 'Slik får du den';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Du leste $count timer de siste $days dagene.',
      one: 'Du leste 1 time de siste $days dagene.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ca. $count dager i dette tempoet.',
      one: 'Ca. 1 dag i dette tempoet.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ca. $count uker i dette tempoet.',
      one: 'Ca. 1 uke i dette tempoet.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ca. $count måneder i dette tempoet.',
      one: 'Ca. 1 måned i dette tempoet.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker fra $decade-tallet venter i hyllene dine.',
      one: '1 bok fra $decade-tallet venter i hyllene dine.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker fra $century-tallet venter i hyllene dine.',
      one: '1 bok fra $century-tallet venter i hyllene dine.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return '$title er $percent lest og ble startet $date.';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return '$title ble startet $date.';
  }

  @override
  String get achievementsHintUntitledBook => 'En bok som pågår';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker som pågår, er over $percent.',
      one: '1 bok som pågår, er over $percent.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker du har fullført, har ingen vurdering ennå.',
      one: '1 bok du har fullført, har ingen vurdering ennå.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker under $pages sider venter i hyllene dine.',
      one: '1 bok under $pages sider venter i hyllene dine.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pågår allerede.',
      one: '1 pågår allerede.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker på $pages sider eller mer venter i hyllene dine.',
      one: '1 bok på $pages sider eller mer venter i hyllene dine.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker utgitt før $year venter i hyllene dine.',
      one: '1 bok utgitt før $year venter i hyllene dine.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author: $finished fullført, $count til i hyllene dine.';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker på $language venter i hyllene dine.',
      one: '1 bok på $language venter i hyllene dine.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Du har lest i $count måneder av $year så langt.',
      one: 'Du har lest i 1 måned av $year så langt.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$months gjenstår.',
      one: '$months gjenstår.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return 'Ingen bok i hyllene dine har $pages sider eller mer ennå.';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return 'Ingenting i hyllene dine ble utgitt før $year.';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hyllene dine spenner bare over $count tiår så langt.',
      one: 'Hyllene dine spenner bare over 1 tiår så langt.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hyllene dine spenner bare over $count århundrer så langt.',
      one: 'Hyllene dine spenner bare over 1 århundre så langt.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return 'Du leste ikke i $month, så $year er utenfor rekkevidde. Tellingen starter på nytt i januar.';
  }

  @override
  String get achievementsSwitch => 'Prestasjoner';

  @override
  String get achievementsSwitchSubtitle =>
      'Følg prestasjoner på BookOrbit. Når du slår dette av, skjules de her og på nettet.';

  @override
  String get achievementsTurnedOn => 'Prestasjoner er slått på';

  @override
  String get achievementsTurnedOff => 'Prestasjoner er slått av';

  @override
  String get achievementsSwitchFailed =>
      'Kunne ikke endre prestasjoner på BookOrbit';

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
  String get recentSearchesTitle => 'Nylige søk';

  @override
  String get recentSearchesClear => 'Tøm';

  @override
  String get recentSearchesRemove => 'Fjern';

  @override
  String get removedSeriesTapToUndo =>
      'Fjernet fra Fortsett serien. Trykk for å angre.';

  @override
  String get seriesBackOnContinueSeries => 'Tilbake i Fortsett serien';

  @override
  String get desktopShortcutPlayPause => 'Spill av / pause';

  @override
  String get desktopShortcutRewind => 'Spol tilbake';

  @override
  String get desktopShortcutForward => 'Spol fremover';

  @override
  String get desktopShortcutSlower => 'Reduser avspillingshastigheten';

  @override
  String get desktopShortcutFaster => 'Øk avspillingshastigheten';

  @override
  String get desktopShortcutNormalSpeed =>
      'Tilbakestill avspillingshastigheten';

  @override
  String get desktopShortcutSearch => 'Åpne søk';

  @override
  String get desktopShortcutLibrary => 'Åpne biblioteket';

  @override
  String get desktopShortcutNowPlaying => 'Åpne Spilles nå';

  @override
  String get desktopShortcutFullScreen => 'Fullskjerm';

  @override
  String get desktopShortcutClosePlayer => 'Lukk fullskjermspilleren';

  @override
  String get desktopShortcutBack => 'Gå tilbake (lukk øverste side eller ark)';

  @override
  String get desktopShortcutRefresh => 'Oppdater listen på skjermen';

  @override
  String get desktopShortcutPreviousCard => 'Forrige Absorbing-kort';

  @override
  String get desktopShortcutNextCard => 'Neste Absorbing-kort';

  @override
  String get desktopShortcutContextMenu => 'Åpne menyen for langt trykk';

  @override
  String get desktopShortcutMouseBack => 'Tilbakeknapp på musen';

  @override
  String get desktopShortcutRightClick => 'Høyreklikk';

  @override
  String get desktopShortcutDragShelves => 'Dra hyller og kort sideveis';

  @override
  String get desktopShortcutMouseDrag => 'Klikk og dra';

  @override
  String get fileHealthAction => 'Sjekk filer';

  @override
  String get fileHealthTitle => 'Sjekk filer';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alle $count filer ser fine ut',
      one: 'Filen ser fin ut',
      zero: 'Ingenting ser galt ut',
    );
    return '$_temp0';
  }

  @override
  String fileHealthProblems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count problemer funnet',
      one: '1 problem funnet',
    );
    return '$_temp0';
  }

  @override
  String get fileHealthReadOnlyNote =>
      'Dette leser bare det serveren allerede rapporterer. Ingenting endres.';

  @override
  String get fileHealthLocalChecked =>
      'Nedlastede filer på denne enheten ble også sjekket.';

  @override
  String get fileHealthItemMissing => 'Bokmappen mangler';

  @override
  String get fileHealthItemMissingInfo =>
      'Serveren finner ikke denne bokens mappe lenger. Den kan ha blitt flyttet, omdøpt eller slettet, eller stasjonen er frakoblet. En biblioteksskanning på serveren kan finne den igjen.';

  @override
  String get fileHealthItemInvalid => 'Boken er markert som ugyldig';

  @override
  String get fileHealthItemInvalidInfo =>
      'Serveren fant ingen brukbare lyd- eller e-bokfiler for denne boken.';

  @override
  String get fileHealthInvalidFiles => 'Uleselige filer';

  @override
  String get fileHealthInvalidFilesInfo =>
      'Serveren kunne ikke lese disse filene. De kan være skadet eller i et format den ikke støtter, og avspillingen kan stoppe eller hoppe over dem.';

  @override
  String get fileHealthEmptyFiles => 'Filer uten lengde';

  @override
  String get fileHealthEmptyFilesInfo =>
      'Disse filene oppgir lengde null, så det er ingenting å spille av i dem. De er ofte tomme eller avkuttet.';

  @override
  String get fileHealthTrackGaps => 'Hull mellom filer';

  @override
  String get fileHealthTrackGapsInfo =>
      'Bokens tidslinje hopper fremover mellom disse filene og etterlater en strekning der ingenting spilles.';

  @override
  String get fileHealthTrackOverlaps => 'Overlappende filer';

  @override
  String get fileHealthTrackOverlapsInfo =>
      'Disse filene overlapper i bokens tidslinje, så en del av en fil kan bli hoppet over, eller posisjonen kan hoppe.';

  @override
  String get fileHealthDurationMismatch => 'Lengden stemmer ikke';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return 'Filene utgjør til sammen $actual, men boken oppgir at den er $expected lang. Fremdrift og kapitler kan være feil. En ny skanning på serveren løser vanligvis dette.';
  }

  @override
  String get fileHealthLowBitrate => 'Lyd av lav kvalitet';

  @override
  String get fileHealthLowBitrateInfo =>
      'Disse filene er kodet under 32 kbps og kan høres dempet ut.';

  @override
  String get fileHealthMixedSampleRates => 'Blandede samplingsfrekvenser';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      'Filene er tatt opp med ulike samplingsfrekvenser. De fleste spillere takler det, men noen kan klikke eller endre hastighet der én fil slutter og den neste begynner.';

  @override
  String get fileHealthMixedChannels => 'Mono og stereo blandet';

  @override
  String get fileHealthMixedChannelsInfo =>
      'Noen filer har et annet antall kanaler enn andre, så lyden kan endre seg mellom filene.';

  @override
  String get fileHealthChaptersPastEnd => 'Kapitler etter slutten';

  @override
  String get fileHealthChaptersPastEndInfo =>
      'Disse kapitlene starter eller slutter etter at lyden er ferdig, så hopp til dem kan ende ingensteds.';

  @override
  String get fileHealthLocalMissing => 'Nedlastede filer mangler';

  @override
  String get fileHealthLocalMissingInfo =>
      'Disse nedlastede filene er borte fra denne enheten. Avspilling frakoblet vil mislykkes der de skulle ha vært.';

  @override
  String get fileHealthLocalSizeMismatch => 'Nedlastede filer er forskjellige';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      'Disse nedlastede filene har ikke samme størrelse som serverens kopier, så de kan være ufullstendige eller skadet.';

  @override
  String fileHealthStartsAt(String time) {
    return 'starter ved $time';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return '$local her, $server på serveren';
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
  String get fileHealthRedownload => 'Last ned denne boken på nytt';

  @override
  String get fileHealthRedownloadQuestion => 'Laste ned denne boken på nytt?';

  @override
  String get fileHealthRedownloadInfo =>
      'Kopien på denne enheten fjernes og lastes ned på nytt fra serveren. Hvis boken spilles av, stopper den. Ingenting endres på serveren.';

  @override
  String get fileHealthNotAvailableOffline =>
      'Koble til serveren for å laste ned på nytt';

  @override
  String get playerReconnecting => 'Mistet forbindelsen, kobler til igjen…';

  @override
  String get playerReconnectFailed =>
      'Kunne ikke koble til serveren igjen, så avspillingen stoppet.';

  @override
  String get downloadsFailed => 'Mislykkede nedlastinger';

  @override
  String get absorbingReorderQueue => 'Endre rekkefølge på køen';

  @override
  String get playAction => 'Spill av';

  @override
  String get pauseAction => 'Pause';

  @override
  String get rmabImportBooks => 'Importer bøker';

  @override
  String get rmabImportBooksSubtitle =>
      'Søk i ReadMeABook og velg bøker å be om';

  @override
  String get rmabImportBooksConnectSubtitle =>
      'Koble til ReadMeABook med en URL og et token først';

  @override
  String get windowsSettingsTitle => 'Windows-innstillinger';

  @override
  String get updateCheckFrequency => 'Automatisk sjekk etter oppdateringer';

  @override
  String get updateCheckFrequencySubtitle =>
      'Sjekker bare etter oppdateringer; installasjon er alltid manuell.';

  @override
  String get updateCheckOnStartup => 'Ved oppstart (én gang per 12 timer)';

  @override
  String get updateCheckEverySixHours => 'Hver 6. time';

  @override
  String get updateCheckEveryTwelveHours => 'Hver 12. time';

  @override
  String get updateCheckDaily => 'Daglig';

  @override
  String get updateCheckNever => 'Aldri automatisk';

  @override
  String onLatestVersionDetail(String version) {
    return 'Du har den nyeste versjonen ($version)';
  }

  @override
  String get updateCheckFailed =>
      'Kunne ikke nå GitHub for å se etter oppdateringer. Sjekk tilkoblingen din og prøv igjen.';

  @override
  String get playlistDetailAddBooks => 'Legg bøker til i spillelisten';

  @override
  String get playlistDetailSwitchToList => 'Bytt til listevisning';

  @override
  String get playlistDetailSwitchToGrid => 'Bytt til rutenettvisning';

  @override
  String get adminUploadIndexing =>
      'Opplastingen er ferdig; venter på at Audiobookshelf skal indeksere...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return 'Lastet opp «$title»; Audiobookshelf indekserer den fortsatt';
  }

  @override
  String get adminUploadPermissionDenied =>
      'Audiobookshelf-kontoen din har ikke tillatelse til å laste opp. Be en serveradministrator slå på opplastingstilgang for kontoen din.';

  @override
  String get uiThemeLabel => 'Brukergrensesnitttema';

  @override
  String get uiThemePickerTitle => 'Velg et utseende';

  @override
  String get uiThemePickerIntro =>
      'Du kan endre dette når som helst i Innstillinger > Utseende > Brukergrensesnitttema.';

  @override
  String get uiThemePlusName => 'Standard';

  @override
  String get uiThemePlusDescription =>
      'Det vanlige Absorb Plus-utseendet, med fylte paneler og en myk glød fra omslagsfargene dine.';

  @override
  String get uiThemeMidnightName => 'Midnatt';

  @override
  String get uiThemeMidnightDescription =>
      'Helt svart med tynne omriss og ingen glød, laget for OLED-skjermer.';

  @override
  String get uiThemeContinue => 'Fortsett';

  @override
  String get uiThemeFrostedName => 'Frostet';

  @override
  String get uiThemeFrostedDescription =>
      'Myke paneler av frostet glass med omslagsfargene dine som skinner gjennom.';

  @override
  String get uiThemeColorTitle => 'Velg en farge';

  @override
  String get uiThemeColorIntro =>
      'Dette er den samme innstillingen som Innstillinger > Utseende > Fargekilde.';

  @override
  String get uiThemeColorFromCover => 'Fra omslag';

  @override
  String get uiThemeBack => 'Tilbake';

  @override
  String get uiThemeTryIt => 'Prøv det';

  @override
  String uiThemePreviewing(String name) {
    return 'Forhåndsviser $name';
  }

  @override
  String get uiThemeKeep => 'Behold';

  @override
  String get uiThemeGoBack => 'Gå tilbake';

  @override
  String get uiThemeGlass => 'Glass';

  @override
  String get uiThemeGlassLight => 'Lett';

  @override
  String get uiThemeGlassMedium => 'Middels';

  @override
  String get uiThemeGlassStrong => 'Sterk';

  @override
  String get uiThemeDetails => 'Utseendedetaljer';

  @override
  String get uiThemeFullCovers => 'Omslag i full kvalitet';

  @override
  String get uiThemeFullCoversSubtitle =>
      'Skarpere omslag som bruker mer minne';

  @override
  String get uiThemeExtraBadges => 'Ekstra omslagsmerker';

  @override
  String get uiThemeExtraBadgesSubtitle =>
      'E-bokmerke og den lagrede stripen på Fortsett å lytte';

  @override
  String get uiThemeReadingShelf => 'Fortsett å lese som hylle';

  @override
  String get uiThemeReadingShelfSubtitle =>
      'En vanlig hylle på Hjem i stedet for store kort';

  @override
  String get uiThemeCompactHeader => 'Kompakte topptekstknapper';

  @override
  String get uiThemeCompactHeaderSubtitle =>
      'Knappene i sidetoppen beholder sin lille størrelse';

  @override
  String get uiThemePlainWording => 'Enkel ordbruk';

  @override
  String get uiThemePlainWordingOnSubtitle =>
      'Bruker «Spill av», «Spilles nå», «Fullført»';

  @override
  String get uiThemePlainWordingOffSubtitle =>
      'Bruker «Absorb», «Absorbing», «Fully Absorbed»';

  @override
  String get uiThemeSearchClassic => 'Klassisk';

  @override
  String whatsNewSheetTitle(String name) {
    return 'Hva er nytt i $name';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return 'Oppdatert fra $name';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return 'build $number';
  }

  @override
  String get whatsNewFullNotes => 'Fullstendige notater på GitHub';

  @override
  String get whatsNewLoading => 'Laster hva som er nytt';

  @override
  String get whatsNewLoadFailed => 'Kunne ikke laste notatene';

  @override
  String get whatsNewLoadFailedHint =>
      'Sjekk tilkoblingen din, eller les dem på GitHub.';

  @override
  String get whatsNewOpenGitHub => 'Åpne på GitHub';

  @override
  String get settingsSeeWhatsNew => 'Se hva som er nytt';

  @override
  String get settingsSeeWhatsNewSubtitle =>
      'Utgivelsesnotatene for denne versjonen';

  @override
  String get windowsCloseToTray => 'Lukk til systemstatusfeltet';

  @override
  String get windowsCloseToTraySubtitle =>
      'Når du lukker vinduet, kjører Absorb Plus videre i varslingsfeltet. Avslutt fra ikonet i systemstatusfeltet.';

  @override
  String get windowsStartWithWindows => 'Start med Windows';

  @override
  String get windowsStartWithWindowsSubtitle =>
      'Åpne Absorb Plus når du logger inn på Windows';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return 'Starter: $command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return 'En annen kopi er satt til å starte: $command. Slå på for å bruke denne kopien i stedet.';
  }

  @override
  String get windowsStartupDisabledBySystem =>
      'Slått av i Oppstartsapper i Oppgavebehandling. Slå det på igjen der.';

  @override
  String get windowsStartMinimized => 'Start minimert';

  @override
  String get windowsStartMinimizedSubtitle =>
      'Når den starter med Windows, hold den i systemstatusfeltet (eller minimert hvis Lukk til systemstatusfeltet er av)';

  @override
  String get windowsAlwaysOnTop => 'Alltid øverst';

  @override
  String get windowsAlwaysOnTopSubtitle => 'Hold vinduet over andre vinduer';

  @override
  String get windowsKeepAwake =>
      'Hold PC-en våken under avspilling og nedlasting';

  @override
  String get windowsKeepAwakeSubtitle =>
      'Hindrer at PC-en går i hvilemodus. Skjermen kan fortsatt slå seg av.';

  @override
  String get windowsSettingFailed => 'Windows godtok ikke den endringen';

  @override
  String get windowsGlobalHotkeys => 'Globale hurtigtaster';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Fungerer mens Absorb Plus er i bakgrunnen: Ctrl+Alt+Space spill av/pause, Ctrl+Alt+Left/Right hopp tilbake/fremover, Ctrl+Alt+Up/Down volum, Ctrl+Alt+B legg til bokmerke';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return 'Opptatt av en annen app, ikke tilgjengelig: $keys';
  }

  @override
  String get windowsTrayShow => 'Vis Absorb Plus';

  @override
  String get windowsTrayQuit => 'Avslutt Absorb Plus';

  @override
  String get windowsTaskbarPlay => 'Spill av';

  @override
  String get windowsTaskbarPause => 'Pause';

  @override
  String get windowsTaskbarRewind => 'Spol tilbake';

  @override
  String get windowsTaskbarForward => 'Spol fremover';

  @override
  String windowsJumpListResume(String title) {
    return 'Fortsett $title';
  }

  @override
  String get githubProjectTitle => 'Absorb Plus på GitHub';

  @override
  String get precacheTitle => 'Forhåndslast omslag og bokssider';

  @override
  String get precacheSubtitle =>
      'Henter dem i bakgrunnen på Wi-Fi eller kablet tilkobling, så skjermer åpnes umiddelbart. Bruker litt diskplass, ikke minne.';

  @override
  String get githubProjectSubtitle =>
      'Utgivelser, kildekode og prosjektnyheter';

  @override
  String get supportSaveLogsSubtitle =>
      'Lagre loggfilen for å legge den ved en GitHub-sak';

  @override
  String get supportSaveLogsDialogTitle => 'Lagre Absorb Plus-logger';

  @override
  String supportLogsSaved(String path) {
    return 'Logger lagret i $path';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return 'Kunne ikke lagre loggene: $error';
  }

  @override
  String get supportOpenLogsFolder => 'Åpne loggmappen';

  @override
  String get supportOpenLogsFolderSubtitle =>
      'Vis loggfilen i filbehandleren din';

  @override
  String get supportOpenLogsFolderFailed => 'Kunne ikke åpne loggmappen';

  @override
  String get desktopDownloadFolderOpen => 'Åpne i Utforsker';

  @override
  String get desktopDownloadFolderOpenLinux => 'Åpne mappen';

  @override
  String get desktopDownloadFolderOpenFailed => 'Kunne ikke åpne mappen';

  @override
  String get desktopDownloadFolderNotWritable =>
      'Absorb kan ikke lagre filer i den mappen. Velg en annen.';

  @override
  String get desktopDownloadFolderPickFailed => 'Kunne ikke vise mappevelgeren';

  @override
  String get desktopDownloadFolderNetworkPath =>
      'Nettverksmapper (\\\\server\\share) kan ikke inneholde nedlastinger. Tilordne ressursen til en stasjonsbokstav i Filutforsker, for eksempel Z:, og velg den i stedet.';

  @override
  String get desktopDownloadFolderDefault => 'Standardmappe';

  @override
  String get bookSettingsTitle => 'Bokinnstillinger';

  @override
  String bookSettingsSeries(String name) {
    return 'Serie: $name';
  }

  @override
  String get bookSettingsSpeed => 'Hastighet';

  @override
  String get bookSettingsSpeedFromSeries =>
      'Fra den siste boken du spilte av i denne serien';

  @override
  String get bookSettingsSkipIntro => 'Hopp over intro';

  @override
  String get bookSettingsSkipIntroHint =>
      'Bare når boken starter fra begynnelsen';

  @override
  String get bookSettingsSkipOutro => 'Hopp over outro';

  @override
  String get bookSettingsSkipOutroHint =>
      'Avslutter boken tidlig og merker den som fullført';

  @override
  String get bookSettingsSkipOff => 'Av';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get bookSettingsWholeSeries => 'Bruk for hele serien';

  @override
  String get bookSettingsWholeSeriesHint =>
      'Intro og outro gjelder for alle bøker i denne serien';

  @override
  String get bookSettingsReset => 'Tilbakestill';

  @override
  String get bookSettingsResetDone => 'Bokinnstillingene er tilbakestilt';

  @override
  String get adminDashTitle => 'Dashbord';

  @override
  String get adminDashSubtitle =>
      'Hvem som lytter, bibliotek, brukere og serveradvarsler på et øyeblikk';

  @override
  String get adminDashNobodyListening => 'Ingen lytter akkurat nå';

  @override
  String adminDashOnlineNames(String names) {
    return 'Pålogget: $names';
  }

  @override
  String get adminDashListeningHistory => 'Lyttehistorikk';

  @override
  String get adminDashCouldNotLoad => 'Kunne ikke laste dette fra serveren';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementer',
      one: '1 element',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => 'Skann alle';

  @override
  String get adminDashScanAllTitle => 'Skanne alle bibliotek?';

  @override
  String get adminDashScanAllContent =>
      'Audiobookshelf leter etter nye, endrede og manglende filer i alle bibliotek. Dette kan ta en stund for store bibliotek.';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skanning startet for $count bibliotek',
      one: 'Skanning startet for 1 bibliotek',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return '$failed av $total skanninger kunne ikke startes';
  }

  @override
  String get adminDashNoLibraries => 'Ingen bibliotek ennå';

  @override
  String get adminDashBackUpNow => 'Ta sikkerhetskopi nå';

  @override
  String adminDashLastBackup(String time) {
    return 'Siste sikkerhetskopi $time';
  }

  @override
  String get adminDashNoBackups => 'Ingen sikkerhetskopier ennå';

  @override
  String get adminDashManageUsers => 'Administrer brukere';

  @override
  String get adminDashNeverSeen => 'Aldri logget inn';

  @override
  String get adminDashDisabled => 'Deaktivert';

  @override
  String get adminDashLocked => 'Låst';

  @override
  String get adminDashServerWarnings => 'Serveradvarsler';

  @override
  String get adminDashNoProblems => 'Ingen advarsler eller feil i dagens logg';

  @override
  String get adminDashAllLogs => 'Alle serverlogger';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale (innebygd)';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => 'Hurtigtaster';

  @override
  String get desktopShortcutsSubtitle =>
      'Kontroller for avspilling, hastighet, søk og navigasjon';

  @override
  String get desktopShortcutsClose => 'Lukk';

  @override
  String get tailscaleConnect => 'Koble til med Tailscale';

  @override
  String get tailscaleConnectHint =>
      'Åpner Tailscale-innloggingen i nettleseren din';

  @override
  String get tailscaleTurnOff => 'Slå av';

  @override
  String get tailscaleCardPitch =>
      'Nå serveren din på tailnettet ditt uten å slå på Tailscale-VPN';

  @override
  String get tailscaleIntro =>
      'Nå en server på tailnettet ditt uten å slå på VPN i Tailscale-appen. Absorb blir med i tailnettet ditt som sin egen enhet, bare for sine egne tilkoblinger. Testfunksjon, av som standard.';

  @override
  String get tailscaleUseSwitch => 'Bruk innebygd Tailscale';

  @override
  String get tailscaleStatusOff => 'Av';

  @override
  String get tailscaleStatusStarting => 'Kobler til…';

  @override
  String get tailscaleStatusNeedsLogin =>
      'Logg inn for å legge denne enheten til i tailnettet ditt';

  @override
  String get tailscaleStatusNeedsApproval =>
      'Venter på at en admin skal godkjenne denne enheten';

  @override
  String tailscaleStatusConnected(String user) {
    return 'Tilkoblet som $user';
  }

  @override
  String get tailscaleStatusConnectedNoUser => 'Tilkoblet';

  @override
  String tailscaleStatusError(String error) {
    return 'Problem: $error';
  }

  @override
  String get tailscaleNotIncluded => 'Ikke inkludert i denne builden';

  @override
  String get tailscaleSignIn => 'Logg inn med Tailscale';

  @override
  String get tailscaleSignInNoLink =>
      'Ingen innloggingslenke ennå. Prøv igjen om et øyeblikk.';

  @override
  String get tailscaleToggleFailed =>
      'Kunne ikke slå innebygd Tailscale på eller av. Prøv igjen.';

  @override
  String get tailscaleSignOut => 'Logg ut av Tailscale';

  @override
  String tailscaleDeviceAddress(String address) {
    return 'Denne enheten: $address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return 'Serveren din ($server) nås via Tailscale.';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return 'Serveren din ($server) er ikke en tailnet-adresse, så den nås som vanlig. Hvis den er på tailnettet ditt, legg til vertsnavnet nedenfor.';
  }

  @override
  String get tailscaleExtraHostsLabel => 'Andre tailnet-vertsnavn';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      'Adresser i 100.64.0.0/10 og navn som ender på .ts.net eller tailnettets MagicDNS-navn går alltid via Tailscale. Skill navn med komma.';

  @override
  String playerChapterEndsAt(String time) {
    return 'Kapittelet slutter kl. $time';
  }

  @override
  String playerEndsAt(String time) {
    return 'Slutter kl. $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return 'Sist spilt på $device · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return 'Sist spilt på en annen enhet · $ago';
  }

  @override
  String get opmlExportAction => 'Eksporter OPML';

  @override
  String get opmlExportDialogTitle => 'Lagre podkastfeeder som OPML';

  @override
  String opmlExportSaved(String path) {
    return 'OPML lagret i $path';
  }

  @override
  String get opmlExportDownloaded => 'OPML lastet ned';

  @override
  String get opmlExportFailed => 'Kunne ikke eksportere OPML-filen';

  @override
  String get bookCopySaveAction => 'Lagre en kopi…';

  @override
  String get bookCopyDialogTitle => 'Lagre en kopi av denne boken';

  @override
  String get bookCopySaving => 'Lagrer en kopi…';

  @override
  String bookCopySaved(String path) {
    return 'Kopi lagret i $path';
  }

  @override
  String get bookCopyFailed => 'Kunne ikke lagre en kopi av denne boken';

  @override
  String get exclusiveAudioTitle => 'Eksklusiv lyd';

  @override
  String get exclusiveAudioSubtitle =>
      'Fikser knitring eller hoppende volum ved å hoppe over Windows-lydeffekter. Andre apper dempes mens Absorb spiller. Start Absorb på nytt for å ta det i bruk.';

  @override
  String get exclusiveAudioFallback =>
      'Your sound device refused exclusive audio, so Absorb is playing in normal mode';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return '$count nye';
  }

  @override
  String seekUndoBackTo(String time) {
    return 'Tilbake til $time';
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
      'Last ned neste bok i serien automatisk';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      'Når boken du spiller er 80 % ferdig eller har under en time igjen. Følger innstillingen Kun Wi-Fi.';

  @override
  String get emptyStateBrowseLibrary => 'Bla i biblioteket';

  @override
  String get emptyStateClearSearch => 'Tøm søket';

  @override
  String get statsNoListeningYet => 'Ingen lytting ennå';

  @override
  String get desktopShortcutQuickSwitcher =>
      'Hurtigbytte: finn bøker eller gå hvor som helst';

  @override
  String get desktopShortcutHelp => 'Vis hurtigtaster';

  @override
  String get quickSwitcherTooltip => 'Hurtigbytte (Ctrl+K)';

  @override
  String get quickSwitcherHint =>
      'Søk i dette biblioteket eller skriv en kommando';

  @override
  String get quickSwitcherNoResults => 'Ingen treff';

  @override
  String get quickSwitcherGoHome => 'Gå til Hjem';

  @override
  String get quickSwitcherGoLibrary => 'Gå til Bibliotek';

  @override
  String get quickSwitcherGoAbsorbing => 'Gå til Absorbing';

  @override
  String get quickSwitcherGoStats => 'Gå til Statistikk';

  @override
  String get quickSwitcherGoSettings => 'Gå til Innstillinger';

  @override
  String get quickSwitcherGoDownloads => 'Gå til Nedlastinger';

  @override
  String get quickSwitcherPlayPause => 'Spill av / pause';

  @override
  String get quickSwitcherSleepTimer => 'Sovetimer';

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
  String get quickSwitcherKindAction => 'Handling';

  @override
  String get quickSwitcherKindBook => 'Bok';

  @override
  String get quickSwitcherKindPodcast => 'Podkast';

  @override
  String get quickSwitcherKindSeries => 'Serie';

  @override
  String get quickSwitcherKindAuthor => 'Forfatter';

  @override
  String get alphabetScrollerLabel => 'Hopp til en bokstav';

  @override
  String get stepperDecrease => 'Reduser';

  @override
  String get stepperIncrease => 'Øk';

  @override
  String get statsStreakKeepGoing =>
      'Lytt 5 minutter i dag for å holde rekken gående';

  @override
  String get statsStreakHowTo =>
      'Lytt 5 minutter om dagen for å bygge en rekke';

  @override
  String get statsDailyGoalSheetTitle => 'Daglig lyttemål';

  @override
  String get statsDailyGoalSheetBody =>
      'En ring på rekkekortet fylles mens du lytter i dag.';

  @override
  String get statsDailyGoalSet => 'Sett et daglig mål';

  @override
  String get statsMonthListened => 'Lyttet';

  @override
  String get statsMonthTime => 'Tid';

  @override
  String get statsMonthTopBook => 'Toppbok';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultater',
      one: '1 resultat',
      zero: 'Ingen resultater',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => 'Sorter og grupper';

  @override
  String get bookmarksViewByBook => 'Etter bok';

  @override
  String get bookmarksViewNewest => 'Nyeste først';

  @override
  String get bookmarksViewPosition => 'Etter posisjon';

  @override
  String get bookmarksExportAction => 'Eksporter bokmerker';

  @override
  String get bookmarksExportDialogTitle => 'Lagre bokmerker som Markdown';

  @override
  String bookmarksExportSaved(String path) {
    return 'Bokmerker lagret i $path';
  }

  @override
  String get bookmarksExportDownloaded => 'Bokmerker lastet ned';

  @override
  String get bookmarksExportFailed => 'Kunne ikke eksportere bokmerkene';

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

  @override
  String get downloadEtaUnderMinute => '<1 min left';

  @override
  String downloadEtaMinutes(int minutes) {
    return '$minutes min left';
  }

  @override
  String downloadEtaHours(int hours) {
    return '$hours hr left';
  }

  @override
  String downloadEtaHoursMinutes(int hours, int minutes) {
    return '$hours hr $minutes min left';
  }

  @override
  String get sameSpeedAllBooksTitle => 'Same speed for every book';

  @override
  String get sameSpeedAllBooksSubtitle =>
      'Every book plays at the default speed, and changing the speed in the player changes it for all books. Off: each book (or its series) keeps its own speed.';
}
