// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'A B S O R B';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get stillOffline => 'Încă offline. Atinge pentru a reîncerca.';

  @override
  String get retry => 'Reîncearcă';

  @override
  String get listsNone => 'Nicio colecție sau listă de redare';

  @override
  String get listsNoneHint =>
      'Colecțiile și listele de redare se creează pe serverul tău Audiobookshelf și apar aici.';

  @override
  String get listsLoadFailed => 'Nu am putut încărca listele tale';

  @override
  String get listsLoadFailedHint =>
      'Absorb nu a putut contacta serverul pentru colecții și liste de redare.';

  @override
  String get listsNoneBookOrbit => 'Nicio colecție sau Smart Scope';

  @override
  String get listsNoneHintBookOrbit =>
      'Colecțiile și Smart Scopes se creează pe serverul tău BookOrbit și apar aici.';

  @override
  String get listsLoadFailedHintBookOrbit =>
      'Absorb nu a putut contacta serverul pentru colecții și Smart Scopes.';

  @override
  String get cancel => 'Anulează';

  @override
  String get delete => 'Șterge';

  @override
  String get remove => 'Elimină';

  @override
  String get save => 'Salvează';

  @override
  String get done => 'Gata';

  @override
  String get edit => 'Editează';

  @override
  String get search => 'Caută';

  @override
  String get apply => 'Aplică';

  @override
  String get enable => 'Activează';

  @override
  String get clear => 'Golește';

  @override
  String get off => 'Oprit';

  @override
  String get disabled => 'Dezactivat';

  @override
  String get later => 'Mai târziu';

  @override
  String get whatsNewTitle => 'Absorb a fost actualizat';

  @override
  String whatsNewContent(String version) {
    return 'Acum ești pe $version.';
  }

  @override
  String get whatsNewButton => 'Vezi ce e nou';

  @override
  String get whatsNewKeepShowing => 'Afișează după fiecare actualizare';

  @override
  String get whatsNewKeepShowingHint => 'Îl poți reactiva în Setări';

  @override
  String get settingsWhatsNew => 'Arată noutățile după actualizări';

  @override
  String get settingsWhatsNewSubtitle =>
      'După o actualizare, arată noutățile în aplicație';

  @override
  String get gotIt => 'Am înțeles';

  @override
  String get betaLoggingTitle => 'Jurnalele sunt activate';

  @override
  String get betaLoggingContent =>
      'Fiind o versiune beta, Absorb păstrează acum jurnale pentru a ajuta la depistarea problemelor. Rămân pe acest dispozitiv, dacă nu le trimiți tu.\n\nPoți să le trimiți sau să le dezactivezi în Setări, la Probleme și asistență. Dacă le dezactivezi, versiunile beta ulterioare le lasă dezactivate.';

  @override
  String get preview => 'Previzualizare';

  @override
  String get or => 'sau';

  @override
  String get file => 'Fișier';

  @override
  String get more => 'Mai multe';

  @override
  String get unknown => 'Necunoscut';

  @override
  String get untitled => 'Fără titlu';

  @override
  String get noThanks => 'Nu, mulțumesc';

  @override
  String get stay => 'Rămâi';

  @override
  String get homeTitle => 'Acasă';

  @override
  String get continueListening => 'Continuă ascultarea';

  @override
  String get continueReading => 'Continuă citirea';

  @override
  String get continueSeries => 'Continuă seria';

  @override
  String get recentlyAdded => 'Adăugate recent';

  @override
  String get listenAgain => 'Ascultă din nou';

  @override
  String get discover => 'Descoperă';

  @override
  String get newEpisodes => 'Episoade noi';

  @override
  String get downloads => 'Descărcări';

  @override
  String get noDownloadedBooks => 'Nicio carte descărcată';

  @override
  String get yourLibraryIsEmpty => 'Biblioteca ta este goală';

  @override
  String get downloadBooksWhileOnline =>
      'Descarcă cărți cât ești online pentru a le asculta offline';

  @override
  String get customizeHome => 'Personalizează Acasă';

  @override
  String get dragToReorderTapEye =>
      'Trage pentru a reordona, atinge ochiul pentru a afișa/ascunde';

  @override
  String get loginTagline => 'Începe să absorbi';

  @override
  String get loginConnectToServer => 'Conectează-te la serverul tău';

  @override
  String get loginServerAddress => 'Adresa serverului';

  @override
  String get loginServerHint => 'my.server.com';

  @override
  String get loginServerHelper => 'Merge și IP:port (de ex. 192.168.1.5:13378)';

  @override
  String get loginCouldNotReachServer => 'Nu s-a putut contacta serverul';

  @override
  String get loginAdvanced => 'Avansat';

  @override
  String get loginCustomHttpHeaders => 'Antete HTTP personalizate';

  @override
  String get loginCustomHeadersDescription =>
      'Pentru tunelurile Cloudflare sau proxy-urile inverse care necesită antete suplimentare. Adaugă antetele înainte de a introduce adresa serverului.';

  @override
  String get loginHeaderName => 'Numele antetului';

  @override
  String get loginHeaderValue => 'Valoare';

  @override
  String get loginAddHeader => 'Adaugă antet';

  @override
  String get loginSelfSignedCertificates => 'Certificate autosemnate';

  @override
  String get loginTrustAllCertificates =>
      'Ai încredere în toate certificatele (pentru configurări cu certificate autosemnate / CA personalizat)';

  @override
  String get loginApiKey => 'Cheie API';

  @override
  String get loginApiKeyDescription =>
      'Folosește o cheie API generată de administrator în loc de nume de utilizator/parolă. Utilă când reîmprospătarea token-ului eșuează pentru contul tău.';

  @override
  String get loginWaitingForSso => 'Se așteaptă SSO...';

  @override
  String get loginRedirectUri => 'URI de redirecționare: absorb://oauth';

  @override
  String get loginOrSignInManually => 'sau conectează-te manual';

  @override
  String get loginUsername => 'Nume de utilizator';

  @override
  String get loginUsernameRequired => 'Introdu numele de utilizator';

  @override
  String get loginPassword => 'Parolă';

  @override
  String get loginSignIn => 'Conectare';

  @override
  String loginSignInAs(String username) {
    return 'Te conectezi ca $username?';
  }

  @override
  String get loginSignInToServer => 'Te conectezi la acest server?';

  @override
  String loginSignedInAs(String username) {
    return 'Conectat ca $username';
  }

  @override
  String get adminCreateSetupFile => 'Partajează conectarea';

  @override
  String adminSetupFileDescription(String username) {
    return 'Creează un link de conectare privat pentru $username, care funcționează doar în aplicația Absorb.';
  }

  @override
  String get adminSetupFileServerUrl =>
      'Adresa serverului pe care o va folosi noul utilizator';

  @override
  String get adminSetupFileNoteWithHeaders =>
      'Vor fi incluse o cheie API dedicată și antetele tale personalizate, ca să poată ajunge la server. Tratează linkul ca pe o parolă.';

  @override
  String get adminSetupFileNote =>
      'Va fi inclusă o cheie API dedicată. Tratează linkul ca pe o parolă.';

  @override
  String get adminSetupFileCreate => 'Creează link';

  @override
  String get adminSetupFileSaveTitle => 'Salvează fișierul de configurare';

  @override
  String get adminSetupFileKeyError =>
      'Nu s-a putut crea o cheie API pentru acest utilizator';

  @override
  String adminSetupFileSaved(String username) {
    return 'Fișierul de configurare pentru $username a fost salvat';
  }

  @override
  String adminSetupFileFailed(String error) {
    return 'Crearea conectării a eșuat: $error';
  }

  @override
  String get setupLinkShareTitle => 'Partajează conectarea';

  @override
  String setupLinkShareDescription(String username) {
    return 'Trimite acest link privat sau cere-i să scaneze codul QR pentru a se conecta ca $username.';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return 'Oricine are acest link se poate conecta ca $username. Tratează-l ca pe o parolă.';
  }

  @override
  String get setupLinkShare => 'Partajează linkul';

  @override
  String get setupLinkCopy => 'Copiază linkul';

  @override
  String get setupLinkCopied => 'Linkul de conectare a fost copiat';

  @override
  String get setupLinkSaveFile => 'Salvează fișierul de configurare';

  @override
  String get setupLinkQrError =>
      'Acest link de configurare este prea mare pentru un cod QR. Partajează linkul în schimb.';

  @override
  String setupLinkShareSubject(String username) {
    return 'Conectare Absorb pentru $username';
  }

  @override
  String get setupLinkConfirmTitle => 'Te conectezi cu acest link?';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return 'Te conectezi la $server ca $username? Continuă doar dacă ai încredere în cel care ți-a trimis linkul.';
  }

  @override
  String get setupLinkInvalid =>
      'Acest link de conectare este invalid sau incomplet';

  @override
  String get setupLinkSigningIn => 'Se verifică linkul de conectare...';

  @override
  String get loginPlayDownloads => 'Redă descărcările tale';

  @override
  String signedOutDownloadsNote(String username) {
    return 'Ești deconectat. Tot ce asculți aici se sincronizează cu $username când te conectezi din nou.';
  }

  @override
  String get loginPasteLink => 'Lipește linkul de conectare';

  @override
  String get loginPasteLinkHelp =>
      'Lipește linkul complet de conectare pe care l-ai primit. Tratează-l ca pe o parolă.';

  @override
  String get loginFailed => 'Conectarea a eșuat';

  @override
  String get loginSsoFailed => 'Conectarea SSO a eșuat sau a fost anulată';

  @override
  String get loginSsoAuthFailed =>
      'Autentificarea SSO a eșuat. Încearcă din nou.';

  @override
  String get loginRestoreFromBackup => 'Importă';

  @override
  String get loginInvalidBackupFile => 'Fișier de copie de rezervă invalid';

  @override
  String get loginRestoreBackupTitle => 'Restaurezi copia de rezervă?';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return 'Aceasta va restaura toate setările și $count conturi salvate. Vei fi conectat automat.';
  }

  @override
  String get loginRestoreBackupNoAccounts =>
      'Aceasta va restaura toate setările. Această copie de rezervă nu include conturi.';

  @override
  String get loginRestore => 'Restaurează';

  @override
  String loginRestoredAndSignedIn(String username) {
    return 'Setările au fost restaurate și ai fost conectat ca $username';
  }

  @override
  String get loginSessionExpired =>
      'Setările au fost restaurate. Sesiunea a expirat - conectează-te pentru a continua.';

  @override
  String get loginSettingsRestored => 'Setările au fost restaurate';

  @override
  String loginRestoreFailed(String error) {
    return 'Restaurarea a eșuat: $error';
  }

  @override
  String get loginSavedAccounts => 'conturi salvate';

  @override
  String get libraryTitle => 'Bibliotecă';

  @override
  String get librarySearchBooksHint =>
      'Caută cărți, serii, autori, naratori...';

  @override
  String get librarySearchShowsHint => 'Caută emisiuni și episoade...';

  @override
  String get libraryTabLibrary => 'Bibliotecă';

  @override
  String get libraryTabSeries => 'Serii';

  @override
  String get libraryTabAuthors => 'Autori';

  @override
  String get libraryTabNarrators => 'Naratori';

  @override
  String get libraryNoBooks => 'Nu s-au găsit cărți';

  @override
  String get libraryNoUnfinishedBooks => 'Nicio carte neterminată';

  @override
  String get libraryNoBooksInProgress => 'Nicio carte în curs';

  @override
  String get libraryNoFinishedBooks => 'Nicio carte terminată';

  @override
  String get libraryAllBooksStarted => 'Toate cărțile au fost începute';

  @override
  String get libraryNoDownloadedBooks => 'Nicio carte descărcată';

  @override
  String get libraryNoSeriesFound => 'Nu s-au găsit serii';

  @override
  String get libraryNoBooksWithEbooks => 'Nicio carte cu e-book';

  @override
  String get libraryNoBooksMissingMetadata =>
      'Nicio carte nu are aceste metadate lipsă';

  @override
  String get libraryNoItemsMatchingFilter =>
      'Niciun element nu corespunde acestui filtru';

  @override
  String libraryNoBooksInGenre(String genre) {
    return 'Nicio carte în \"$genre\"';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return 'Nicio carte cu eticheta \"$tag\"';
  }

  @override
  String get libraryClearFilter => 'Șterge filtrul';

  @override
  String get libraryNoAuthorsFound => 'Nu s-au găsit autori';

  @override
  String get libraryNoNarratorsFound => 'Nu s-au găsit naratori';

  @override
  String get libraryNoResults => 'Nu s-au găsit rezultate';

  @override
  String get librarySearchBooks => 'Cărți';

  @override
  String get librarySearchShows => 'Emisiuni';

  @override
  String get librarySearchEpisodes => 'Episoade';

  @override
  String get librarySearchSeries => 'Serii';

  @override
  String get librarySearchAuthors => 'Autori';

  @override
  String get librarySearchTags => 'Etichete';

  @override
  String get librarySearchGenres => 'Genuri';

  @override
  String librarySeriesCount(int count) {
    return '$count serii';
  }

  @override
  String libraryAuthorsCount(int count) {
    return '$count autori';
  }

  @override
  String libraryNarratorsCount(int count) {
    return '$count naratori';
  }

  @override
  String libraryBooksCount(int loaded, int total) {
    return '$loaded/$total cărți';
  }

  @override
  String get sort => 'Sortează';

  @override
  String get filter => 'Filtrează';

  @override
  String get filterActive => 'Filtru ●';

  @override
  String get name => 'Nume';

  @override
  String get title => 'Titlu';

  @override
  String get author => 'Autor';

  @override
  String get dateAdded => 'Data adăugării';

  @override
  String get numberOfBooks => 'Număr de cărți';

  @override
  String get sortTotalDuration => 'Durată totală';

  @override
  String get sortLastBookAdded => 'Ultima carte adăugată';

  @override
  String get sortLastBookUpdated => 'Ultima carte actualizată';

  @override
  String get publishedYear => 'Anul publicării';

  @override
  String get duration => 'Durată';

  @override
  String get random => 'Aleatoriu';

  @override
  String get collapseSeries => 'Restrânge seriile';

  @override
  String get notFinished => 'Neterminate';

  @override
  String get inProgress => 'În curs';

  @override
  String get filterFinished => 'Terminate';

  @override
  String get notStarted => 'Neîncepute';

  @override
  String get downloaded => 'Descărcat';

  @override
  String get hasEbook => 'Are e-book';

  @override
  String get noEbook => 'Fără e-book';

  @override
  String get hasSupplementaryEbook => 'Are e-book suplimentar';

  @override
  String get noSupplementaryEbook => 'Fără e-book suplimentar';

  @override
  String get noSeries => 'Fără serie';

  @override
  String get publishedDecade => 'Deceniul publicării';

  @override
  String get tracks => 'Piste';

  @override
  String get noTracks => 'Fără piste';

  @override
  String get singleTrack => 'Pistă unică';

  @override
  String get multipleTracks => 'Mai multe piste';

  @override
  String get abridged => 'Prescurtat';

  @override
  String get issues => 'Probleme';

  @override
  String get rssFeedOpen => 'Flux RSS deschis';

  @override
  String get explicitContent => 'Explicit';

  @override
  String get missingMetadata => 'Metadate lipsă';

  @override
  String get genre => 'Gen';

  @override
  String get tag => 'Etichetă';

  @override
  String get clearFilter => 'Șterge filtrul';

  @override
  String get noGenresFound => 'Nu s-au găsit genuri';

  @override
  String get noTagsFound => 'Nu s-au găsit etichete';

  @override
  String get asc => 'CRESC.';

  @override
  String get desc => 'DESC.';

  @override
  String get fileSize => 'Dimensiune fișier';

  @override
  String get lastUpdated => 'Ultima actualizare';

  @override
  String get fileCreated => 'Fișier creat';

  @override
  String get lastModified => 'Ultima modificare';

  @override
  String get authorFirstLast => 'Autor (Prenume Nume)';

  @override
  String get authorLastFirst => 'Autor (Nume, Prenume)';

  @override
  String get progressSort => 'Progres';

  @override
  String get dateStarted => 'Data începerii';

  @override
  String get dateFinished => 'Data terminării';

  @override
  String get episodeCount => 'Număr de episoade';

  @override
  String get sequence => 'Numărul în serie';

  @override
  String get absorbingTitle => 'Absorbing';

  @override
  String get absorbingStop => 'Oprește';

  @override
  String get absorbingManageQueue => 'Gestionează coada';

  @override
  String get absorbingDone => 'Gata';

  @override
  String get absorbingNoDownloadedEpisodes => 'Niciun episod descărcat';

  @override
  String get absorbingNoDownloadedBooks => 'Nicio carte descărcată';

  @override
  String get absorbingNothingPlayingYet => 'Nimic în redare încă';

  @override
  String get absorbingNothingAbsorbingYet => 'Nimic absorbit încă';

  @override
  String get absorbingDownloadEpisodesToListen =>
      'Descarcă episoade pentru a le asculta offline';

  @override
  String get absorbingDownloadBooksToListen =>
      'Descarcă cărți pentru a le asculta offline';

  @override
  String get absorbingStartEpisodeFromShows =>
      'Pornește un episod din fila Emisiuni';

  @override
  String get absorbingStartBookFromLibrary =>
      'Pornește o carte din fila Bibliotecă';

  @override
  String get carModeTitle => 'Mod mașină';

  @override
  String get carModeNoBookLoaded => 'Nicio carte încărcată';

  @override
  String get carModeBookLabel => 'Carte';

  @override
  String get carModeChapterLabel => 'Capitol';

  @override
  String get carModeBookmarkDefault => 'Marcaj';

  @override
  String get carModeBookmarkAdded => 'Marcaj adăugat';

  @override
  String get downloadsTitle => 'Descărcări';

  @override
  String get downloadsCancelSelection => 'Anulează selecția';

  @override
  String get downloadsSelect => 'Selectează';

  @override
  String get downloadsNoDownloads => 'Nicio descărcare';

  @override
  String get downloadsDownloading => 'Se descarcă';

  @override
  String get downloadsQueued => 'În coadă';

  @override
  String get downloadsCompleted => 'Finalizate';

  @override
  String get downloadsEbooks => 'E-book-uri';

  @override
  String get downloadsWaiting => 'Se așteaptă...';

  @override
  String get downloadsCancel => 'Anulează';

  @override
  String get downloadsDelete => 'Șterge';

  @override
  String downloadsDeleteCount(int count) {
    return 'Ștergi $count descărcări?';
  }

  @override
  String get downloadsDeleteContent =>
      'Fișierele descărcate vor fi eliminate de pe acest dispozitiv.';

  @override
  String downloadsDeletedCount(int count) {
    return '$count descărcări șterse';
  }

  @override
  String get downloadsRemoveTitle => 'Elimini descărcarea?';

  @override
  String downloadsRemoveContent(String title) {
    return 'Ștergi \"$title\" de pe acest dispozitiv?';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return '\"$title\" a fost eliminat';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return 'Nu s-a putut descărca \"$title\" - unul dintre fișiere nu se află pe server. O scanare a bibliotecii ar putea rezolva problema.';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return 'Nu s-a putut descărca \"$title\" - spațiu de stocare insuficient';
  }

  @override
  String downloadFailedPermission(String title) {
    return 'Nu s-a putut descărca \"$title\" - verifică locația descărcărilor în Setări';
  }

  @override
  String downloadFailedGeneric(String title) {
    return 'Nu s-a putut descărca \"$title\"';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '$count selectate';
  }

  @override
  String get bookmarksTitle => 'Toate marcajele';

  @override
  String get bookmarksTabBookmarks => 'Marcaje';

  @override
  String get bookmarksTabHighlights => 'Evidențieri';

  @override
  String get highlightOpenInBook => 'Deschide în carte';

  @override
  String get highlightDeleteAction => 'Șterge evidențierea';

  @override
  String get highlightDeleted => 'Evidențiere ștearsă';

  @override
  String highlightsDeleteCount(int count) {
    return 'Ștergi $count evidențieri?';
  }

  @override
  String highlightsDeletedCount(int count) {
    return '$count evidențieri șterse';
  }

  @override
  String get quoteShareTitle => 'Partajează citatul';

  @override
  String get quoteShareAction => 'Partajează';

  @override
  String get quoteShareFailed => 'Nu s-a putut crea imaginea citatului';

  @override
  String get quoteShapePortrait => 'Portret';

  @override
  String get quoteShapeSquare => 'Pătrat';

  @override
  String get quoteShapeStory => 'Poveste';

  @override
  String get quoteStyleBlur => 'Neclar';

  @override
  String get quoteStyleDim => 'Întunecat';

  @override
  String get quoteStyleNone => 'Copertă simplă';

  @override
  String get quoteTextLight => 'Text deschis';

  @override
  String get quoteTextDark => 'Text închis';

  @override
  String get quoteFieldTitle => 'Titlu';

  @override
  String get quoteFieldDetail => 'Detalii';

  @override
  String get quoteFieldDetailHint => 'Autor, capitol, pagină, cine a spus-o';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => 'Anulează selecția';

  @override
  String get bookmarksSortedByNewest => 'Sortate după cele mai noi';

  @override
  String get bookmarksSortedByPosition => 'Sortate după poziție';

  @override
  String get bookmarksSelect => 'Selectează';

  @override
  String get bookmarksNoBookmarks => 'Niciun marcaj încă';

  @override
  String get bookmarksSearchHint => 'Caută marcaje';

  @override
  String get bookmarksNoMatches => 'Niciun marcaj nu corespunde căutării';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se descarcă $count de cărți',
      few: 'Se descarcă $count cărți',
      one: 'Se descarcă 1 carte',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => 'Deja descărcate';

  @override
  String bookmarksDeleteCount(int count) {
    return 'Ștergi $count marcaje?';
  }

  @override
  String get bookmarksDeleteContent => 'Această acțiune nu poate fi anulată.';

  @override
  String bookmarksDeletedCount(int count) {
    return '$count marcaje șterse';
  }

  @override
  String get bookmarksJumpTitle => 'Sari la marcaj?';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '\"$title\" la $position\nîn $bookTitle';
  }

  @override
  String get bookmarksJump => 'Sari';

  @override
  String get bookmarksNotConnected => 'Neconectat la server';

  @override
  String get bookmarksCouldNotLoad => 'Nu s-a putut încărca cartea';

  @override
  String bookmarksSelectedCount(int count) {
    return '$count selectate';
  }

  @override
  String get statsTitle => 'Statisticile tale';

  @override
  String get statsCouldNotLoad => 'Nu s-au putut încărca statisticile';

  @override
  String get statsTotalListeningTime => 'TIMP TOTAL DE ASCULTARE';

  @override
  String get statsHoursUnit => 'h';

  @override
  String get statsMinutesUnit => 'm';

  @override
  String get statsSecondsUnit => 's';

  @override
  String statsDaysOfAudio(String days) {
    return 'Asta înseamnă $days zile de audio';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return 'Asta înseamnă $hours ore de audio';
  }

  @override
  String get statsToday => 'Azi';

  @override
  String get statsThisWeek => 'Săptămâna aceasta';

  @override
  String get statsThisMonth => 'Luna aceasta';

  @override
  String get statsActivity => 'Activitate';

  @override
  String get statsCurrentStreak => 'Serie curentă';

  @override
  String get statsBestStreak => 'Cea mai bună serie';

  @override
  String get statsFinished => 'Terminate';

  @override
  String get statsBooksFinished => 'Cărți';

  @override
  String get statsEpisodesFinished => 'Episoade';

  @override
  String get statsBooksThisYear => 'Cărți în acest an';

  @override
  String get statsEpisodesThisYear => 'Episoade în acest an';

  @override
  String get statsRemoveFromYearTitle => 'Elimină din acest an';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return 'Data terminării va rămâne $date pe server. Aceasta doar elimină \"$title\" din lista Absorb cu cărțile din acest an.';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return 'Data terminării rămâne pe server. Aceasta doar elimină \"$title\" din lista Absorb cu cărțile din acest an.';
  }

  @override
  String get statsRemovedFromYear => 'Eliminat din acest an';

  @override
  String get statsAddBackToYearTitle => 'Adaugă înapoi în acest an';

  @override
  String statsAddBackToYearBody(String title) {
    return 'Adaugi \"$title\" înapoi în lista Absorb cu cărțile din acest an?';
  }

  @override
  String get statsAddBack => 'Adaugă înapoi';

  @override
  String get statsAddedBackToYear => 'Adăugat înapoi în acest an';

  @override
  String get statsHiddenFromYear => 'Ascunse din acest an';

  @override
  String get statsNothingHidden => 'Nimic ascuns';

  @override
  String get settingsCustomizeStats => 'Personalizează statisticile';

  @override
  String get statsGoalTitle => 'Obiectiv de ascultare';

  @override
  String get statsGoalOff => 'Oprit';

  @override
  String get statsGoalDaily => 'Zilnic';

  @override
  String get statsGoalWeekly => 'Săptămânal';

  @override
  String get statsGoalMonthly => 'Lunar';

  @override
  String get statsGoalTarget => 'Țintă';

  @override
  String get statsGoalEnterTitle => 'Setează ținta';

  @override
  String get statsGoalEnterTimeHint => 'Minute sau h:mm';

  @override
  String statsBooksShort(int count) {
    return '$count cărți';
  }

  @override
  String get statsBookChallengeTitle => 'Provocare de lectură';

  @override
  String get statsBookChallengeDesc => 'Cărți de terminat în acest an';

  @override
  String get statsDailyGoal => 'Obiectiv zilnic';

  @override
  String get statsWeeklyGoal => 'Obiectiv săptămânal';

  @override
  String get statsMonthlyGoal => 'Obiectiv lunar';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$done din $target cărți';
  }

  @override
  String get statsGoalReached => 'Obiectiv atins';

  @override
  String get statsChartTitle => 'Grafic de ascultare';

  @override
  String get statsChartBar => 'Bare';

  @override
  String get statsChartLine => 'Linie';

  @override
  String get statsChartHeatmap => 'Hartă termică';

  @override
  String get statsChartDays7 => '7 zile';

  @override
  String get statsChartDays30 => '30 de zile';

  @override
  String get statsLast30Days => 'Ultimele 30 de zile';

  @override
  String get statsThisYearTitle => 'Acest an';

  @override
  String get statsSectionsTitle => 'Secțiuni';

  @override
  String get statsSectionTimePeriods => 'Perioade de timp';

  @override
  String get statsHeatmapLess => 'Mai puțin';

  @override
  String get statsHeatmapMore => 'Mai mult';

  @override
  String get statsDayOfWeek => 'Media pe zile ale săptămânii';

  @override
  String get statsTimeSavedLabel => 'Economisit prin viteză';

  @override
  String statsTimeSavedSince(String date) {
    return 'din $date';
  }

  @override
  String get statsTimeSavedReset => 'Resetează timpul economisit';

  @override
  String get statsTimeSavedResetConfirm =>
      'Timpul economisit va începe să se numere din nou de azi.';

  @override
  String get statsTimeSavedResetDone => 'Timpul economisit a fost resetat';

  @override
  String statsOnPaceFor(int count) {
    return 'În ritm pentru $count cărți';
  }

  @override
  String get statsDaysActive => 'Zile active';

  @override
  String get statsDailyAverage => 'Media zilnică';

  @override
  String get statsLast7Days => 'Ultimele 7 zile';

  @override
  String get statsMostListened => 'Cele mai ascultate';

  @override
  String get statsRecentSessions => 'Sesiuni recente';

  @override
  String get appShellHomeTab => 'Acasă';

  @override
  String get appShellLibraryTab => 'Bibliotecă';

  @override
  String get appShellAbsorbingTab => 'Absorbing';

  @override
  String get appShellStatsTab => 'Statistici';

  @override
  String get appShellSettingsTab => 'Setări';

  @override
  String get appShellDiscoverTab => 'Descoperă';

  @override
  String get appShellShowsTab => 'Emisiuni';

  @override
  String get appShellPodcastsTab => 'Podcasturi';

  @override
  String get libraryTabEpisodes => 'Episoade';

  @override
  String get filterAllEpisodes => 'Toate';

  @override
  String get filterUnplayed => 'Neredate';

  @override
  String get episodeFeedEmpty => 'Niciun episod nu corespunde acestui filtru';

  @override
  String get podcastFilterUpNext => 'Urmează';

  @override
  String get podcastFilterNew => 'Noi';

  @override
  String get settingsPodcastTab => 'Fila Podcasturi';

  @override
  String get settingsPodcastTabDesc =>
      'Dă unei biblioteci de podcasturi propria filă în bara de jos';

  @override
  String get settingsPodcastTabLibrary => 'Biblioteca filei Podcasturi';

  @override
  String get settingsMergeImpliedByPodcastTab =>
      'Mereu activat cât timp fila Podcasturi este activă';

  @override
  String get settingsEpisodeNotifs => 'Setări de notificări';

  @override
  String get settingsEpisodeNotifsDesc =>
      'Episoade noi de podcast și apariții viitoare de cărți, verificate în fundal';

  @override
  String get notifIntervalOff => 'Oprit';

  @override
  String notifIntervalMinutes(int n) {
    return 'La fiecare $n minute';
  }

  @override
  String get notifIntervalHour => 'În fiecare oră';

  @override
  String notifIntervalHours(int n) {
    return 'La fiecare $n ore';
  }

  @override
  String get settingsBatteryUnrestricted =>
      'Permite utilizarea nerestricționată a bateriei';

  @override
  String get settingsBatteryUnrestrictedDesc =>
      'Împiedică sistemul să oprească verificările în fundal pe unele telefoane';

  @override
  String get appShellPressBackToExit => 'Apasă din nou înapoi pentru a ieși';

  @override
  String get settingsTitle => 'Setări';

  @override
  String get sectionAppearance => 'Aspect';

  @override
  String get languageLabel => 'Limbă';

  @override
  String get languageSystemDefault => 'Implicit sistem';

  @override
  String get languageHelpTranslateInvite =>
      'Vrei să ajuți la traducerea Absorb în limba ta?';

  @override
  String get themeLabel => 'Temă';

  @override
  String get themeDark => 'Întunecată';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => 'Luminoasă';

  @override
  String get themeAuto => 'Automată';

  @override
  String get colorSourceLabel => 'Sursa culorii';

  @override
  String get colorSourceCoverDescription =>
      'Culorile aplicației urmăresc coperta cărții redate în prezent';

  @override
  String get colorSourceWallpaperDescription =>
      'Culorile aplicației urmăresc imaginea de fundal a sistemului';

  @override
  String get colorSourceWallpaper => 'Imagine de fundal';

  @override
  String get colorSourceNowPlaying => 'În redare';

  @override
  String get colorSourceDynamic => 'Dinamică';

  @override
  String get colorSourceManual => 'Manuală';

  @override
  String get colorSourceManualDescription =>
      'Folosește o culoare fixă a aplicației, aleasă mai jos';

  @override
  String get colorSourceCustom => 'Personalizată';

  @override
  String get useColorEverywhereLabel => 'Folosește această culoare peste tot';

  @override
  String get useColorEverywhereSubtitle =>
      'Colorează și paginile de detalii ale cărților și cardul player-ului cu culoarea setată, în loc de coperta fiecărei cărți';

  @override
  String get flatBackgroundLabel => 'Fundal uni';

  @override
  String get flatBackgroundSubtitle =>
      'Elimină gradientul de fundal. Negru pur în modul întunecat pentru ecrane OLED.';

  @override
  String get einkModeLabel => 'Mod e-ink';

  @override
  String get einkModeSubtitle =>
      'Alb-negru cu contrast ridicat și fără animații, creat pentru ecrane e-ink';

  @override
  String get einkModeIntroBody =>
      'Creat pentru ecrane e-ink. Aplicația trece la un aspect alb-negru uni, cu contrast ridicat, animațiile sunt dezactivate, cardul de redare își pierde fundalul, iar conexiunea live cu serverul rămâne oprită pentru a economisi bateria. Redarea și progresul se sincronizează în continuare normal. Setările de aspect sunt păstrate și revin când dezactivezi acest mod.';

  @override
  String get einkModeIntroConfirm => 'Activează';

  @override
  String get backgroundIntensityLabel => 'Intensitatea fundalului';

  @override
  String get startScreenLabel => 'Ecran de pornire';

  @override
  String get startScreenSubtitle =>
      'Fila care se deschide la lansarea aplicației';

  @override
  String get startScreenHome => 'Acasă';

  @override
  String get startScreenLibrary => 'Bibliotecă';

  @override
  String get startScreenAbsorb => 'Absorb';

  @override
  String get startScreenStats => 'Statistici';

  @override
  String get disablePageFade => 'Dezactivează estomparea paginilor';

  @override
  String get disablePageFadeOnSubtitle => 'Paginile se schimbă instant';

  @override
  String get disablePageFadeOffSubtitle =>
      'Paginile se estompează la schimbarea filelor';

  @override
  String get rectangleBookCovers => 'Coperți dreptunghiulare';

  @override
  String get progressTextSize => 'Dimensiunea textului de progres';

  @override
  String get rectangleBookCoversOnSubtitle =>
      'Copertele sunt afișate în proporția 2:3 a cărților';

  @override
  String get rectangleBookCoversOffSubtitle => 'Copertele sunt pătrate';

  @override
  String get coverSize => 'Dimensiunea copertelor';

  @override
  String get coverSizeSubtitle =>
      'Câte coperți încap pe lățimea grilei bibliotecii';

  @override
  String get coverSizeSmall => 'Mică';

  @override
  String get coverSizeMedium => 'Medie';

  @override
  String get coverSizeLarge => 'Mare';

  @override
  String get sectionAbsorbingCards => 'Carduri Absorbing';

  @override
  String get fullScreenPlayer => 'Player pe tot ecranul';

  @override
  String get fullScreenPlayerOnSubtitle =>
      'Activat - cărțile se deschid pe tot ecranul la redare';

  @override
  String get fullScreenPlayerOffSubtitle =>
      'Oprit - redare în vizualizarea cardului';

  @override
  String get fullBookScrubber => 'Cursor pentru toată cartea';

  @override
  String get fullBookScrubberOnSubtitle =>
      'Activat - cursor de derulare pe întreaga carte';

  @override
  String get fullBookScrubberOffSubtitle => 'Oprit - doar bara de progres';

  @override
  String get cardScrubbers => 'Cursoare pe card';

  @override
  String get cardScrubbersBoth => 'Ambele';

  @override
  String get cardScrubbersChapter => 'Capitol';

  @override
  String get cardScrubbersLocked => 'Blocate';

  @override
  String get cardScrubbersBothSubtitle =>
      'Barele cărții întregi și ale capitolului pot derula';

  @override
  String get cardScrubbersChapterSubtitle =>
      'Doar bara capitolului poate derula';

  @override
  String get cardScrubbersLockedSubtitle =>
      'Progresul este afișat fără derulare';

  @override
  String get speedAdjustedTime => 'Timp ajustat după viteză';

  @override
  String get speedAdjustedTimeOnSubtitle =>
      'Activat - toate duratele reflectă viteza de redare';

  @override
  String get speedAdjustedTimeOffSubtitle =>
      'Oprit - se afișează durata audio reală';

  @override
  String get buttonLayout => 'Aranjarea butoanelor';

  @override
  String get buttonLayoutSubtitle =>
      'Cum sunt aranjate butoanele de acțiune pe card';

  @override
  String get whenAbsorbed => 'Când e absorbit';

  @override
  String get whenAbsorbedInfoTitle => 'Când e absorbit';

  @override
  String get whenAbsorbedInfoContent =>
      'Controlează ce se întâmplă cu un card Absorbing când termini o carte sau un episod.\n\nCardurile terminate sunt eliminate automat din ecranul Absorbing.';

  @override
  String get whenAbsorbedSubtitle =>
      'Ce se întâmplă cu cardul Absorbing când se termină o carte sau un episod';

  @override
  String get whenAbsorbedShowOverlay => 'Afișează suprapunerea';

  @override
  String get whenAbsorbedAutoRelease => 'Eliberare automată';

  @override
  String get mergeLibraries => 'Pagină Absorbing unificată';

  @override
  String get mergeLibrariesInfoTitle => 'Pagină Absorbing unificată';

  @override
  String get mergeLibrariesInfoContent =>
      'Când este activată, ecranul Absorbing afișează toate cărțile și podcasturile în curs din toate bibliotecile, într-o singură vedere. Când este dezactivată, sunt afișate doar elementele din biblioteca selectată în prezent.';

  @override
  String get mergeLibrariesOnSubtitle =>
      'Pagina Absorbing afișează elemente din toate bibliotecile';

  @override
  String get mergeLibrariesOffSubtitle =>
      'Pagina Absorbing afișează doar biblioteca curentă';

  @override
  String get queueMode => 'Mod coadă';

  @override
  String get queueModeInfoTitle => 'Mod coadă';

  @override
  String get queueModeInfoOff => 'Oprit';

  @override
  String get queueModeInfoOffDesc =>
      'Redarea se oprește când se termină cartea sau episodul curent.';

  @override
  String get queueModeInfoManual => 'Coadă manuală';

  @override
  String get queueModeInfoManualDesc =>
      'Cardurile Absorbing funcționează ca o listă de redare. Când unul se termină, următorul card neterminat pornește automat. Adaugă elemente cu butonul \"Adaugă în Absorbing\" de pe o carte sau un episod și reordonează-le din ecranul Absorbing.';

  @override
  String get queueModeOff => 'Oprit';

  @override
  String get queueModeManual => 'Manual';

  @override
  String get queueModeAuto => 'Automat';

  @override
  String get queueModePlaylist => 'Listă de redare';

  @override
  String get queueModeCollection => 'Colecție';

  @override
  String get queueModeInfoPlaylist => 'Coadă din listă de redare';

  @override
  String get queueModeInfoPlaylistDesc =>
      'Redă elementele în ordine dintr-o listă de redare aleasă, sărind peste cele deja terminate. Se oprește la sfârșitul listei.';

  @override
  String get queuePlaylistPickerTitle => 'Alege o listă de redare';

  @override
  String get queuePlaylistNone => 'Nicio listă de redare selectată';

  @override
  String queuePlaylistActiveLabel(String name) {
    return 'Listă de redare: $name';
  }

  @override
  String get queueModePlaylistHint =>
      'Pornește o coadă din listă de redare deschizând o listă de redare din pagina Acasă.';

  @override
  String get exit => 'Ieșire';

  @override
  String upNext(String label) {
    return 'Urmează: $label';
  }

  @override
  String get nothingUpNext => 'Nimic următor';

  @override
  String get showUpNextLabel => 'Afișează „Urmează” în pagina Absorbing';

  @override
  String get openSeries => 'Deschide seria';

  @override
  String get openPlaylist => 'Deschide lista de redare';

  @override
  String get openCollection => 'Deschide colecția';

  @override
  String get playlistPlayAction => 'Redă lista de redare';

  @override
  String get playlistAllFinished => 'Toate terminate';

  @override
  String get queueModeBooks => 'Cărți';

  @override
  String get queueModePodcasts => 'Podcasturi';

  @override
  String get autoDownloadQueue => 'Descărcare automată a cozii';

  @override
  String get autoDownloadThisSeriesLabel => 'Descarcă automat această serie';

  @override
  String get autoDownloadThisShowLabel => 'Descarcă automat acest podcast';

  @override
  String get autoDownloadThisPlaylistLabel =>
      'Descarcă automat această listă de redare';

  @override
  String get autoDownloadThisCollectionLabel =>
      'Descarcă automat această colecție';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return 'Păstrează descărcate următoarele $count elemente';
  }

  @override
  String get autoDownloadQueueOffSubtitle => 'Oprit - doar descărcări manuale';

  @override
  String get sectionPlayback => 'Redare';

  @override
  String get sectionMediaControls => 'Comenzi media';

  @override
  String get defaultSpeed => 'Viteză implicită';

  @override
  String get defaultSpeedSubtitle =>
      'Cărțile noi pornesc la această viteză - fiecare carte o reține pe a ei';

  @override
  String get skipBack => 'Sari înapoi';

  @override
  String get skipForward => 'Sari înainte';

  @override
  String get iosLockScreenSkipHint =>
      'Ecranul de blocare afișează doar numerele pentru care iOS are pictograme (5, 10, 15, 30, 45, 60, 75, 90). Alte valori afișează + pe buton, dar tot sar conform setării tale.';

  @override
  String get longSkipButtons => 'Butoane de salt lung';

  @override
  String get longSkipButtonsOnSubtitle =>
      'Activat - player-ul afișează o a doua pereche de butoane de salt, mai mare';

  @override
  String get longSkipButtonsOffSubtitle =>
      'Oprit - doar butoanele obișnuite de salt';

  @override
  String get longSkipBack => 'Salt lung înapoi';

  @override
  String get longSkipForward => 'Salt lung înainte';

  @override
  String get coverShapeDefault => 'Implicită';

  @override
  String get coverShapeSquare => 'Pătrată';

  @override
  String get coverShapeRectangle => 'Dreptunghiulară';

  @override
  String get coverShapeLabel => 'Forma copertei';

  @override
  String get showSubtitles => 'Afișează subtitlurile';

  @override
  String get showSubtitlesOnSubtitle =>
      'Subtitlurile apar sub titlurile cărților în bibliotecă și pe Acasă';

  @override
  String get showSubtitlesOffSubtitle =>
      'Oprit - subtitluri doar în fișa de detalii a cărții';

  @override
  String get subtitleVisibilityLabel => 'Subtitluri';

  @override
  String get subtitleVisibilityDefault => 'Implicit';

  @override
  String get subtitleVisibilityShow => 'Afișează';

  @override
  String get subtitleVisibilityHide => 'Ascunde';

  @override
  String currentLibrarySettingsTitle(String name) {
    return 'Biblioteca curentă: $name';
  }

  @override
  String get currentLibrarySkipOverride => 'Valori de salt personalizate';

  @override
  String get currentLibrarySkipOverrideOnSubtitle =>
      'Activat - această bibliotecă folosește propriile valori de salt';

  @override
  String get currentLibrarySkipOverrideOffSubtitle =>
      'Oprit - această bibliotecă folosește valorile globale de salt';

  @override
  String get currentLibrarySkipBack => 'Sari înapoi';

  @override
  String get currentLibrarySkipForward => 'Sari înainte';

  @override
  String get chapterProgressInNotification =>
      'Progresul capitolului în notificare și Android Auto';

  @override
  String get chapterProgressOnSubtitle =>
      'Activat - notificarea și Android Auto afișează progresul capitolului';

  @override
  String get chapterProgressOffSubtitle =>
      'Oprit - afișează progresul întregii cărți';

  @override
  String get chapterProgressInNotificationIos =>
      'Progresul capitolului pe ecranul de blocare și în CarPlay';

  @override
  String get chapterProgressOnSubtitleIos =>
      'Activat - ecranul de blocare și CarPlay afișează progresul capitolului';

  @override
  String get nowPlayingText => 'Text „În redare”';

  @override
  String get nowPlayingTextSubtitle =>
      'Alege ce afișează comenzile media pe fiecare rând';

  @override
  String get nowPlayingTopLine => 'Rândul de sus';

  @override
  String get nowPlayingSecondLine => 'Al doilea rând';

  @override
  String get nowPlayingNotShown => 'Neafișat';

  @override
  String get nowPlayingTopLineRequired =>
      'Rândul de sus necesită cel puțin un element';

  @override
  String get nowPlayingPieceChapter => 'Capitol';

  @override
  String get nowPlayingPieceTitle => 'Titlul cărții';

  @override
  String get nowPlayingPieceNarrator => 'Narator';

  @override
  String get nowPlayingPieceSeries => 'Serie';

  @override
  String get nowPlayingPiecePercent => 'Procentul din carte';

  @override
  String get nowPlayingPieceChapterNumber => 'Numărul capitolului';

  @override
  String get nowPlayingPieceTimeLeft => 'Timp rămas';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return 'Cap. $number/$total';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return '$time rămase';
  }

  @override
  String get bookDockBadgePending => 'În așteptare';

  @override
  String get bookDockBadgeExtracting => 'Se citește fișierul';

  @override
  String get bookDockBadgeFetching => 'Se caută';

  @override
  String get bookDockBadgeError => 'Eroare';

  @override
  String get bookDockNeedsReview => 'Necesită verificare';

  @override
  String get bookDockNoMatch => 'Fără potrivire';

  @override
  String get bookDockApplied => 'Aplicat';

  @override
  String get bookDockNotApplied => 'Detaliile găsite nu au fost folosite';

  @override
  String get bookDockNoDestination => 'Nicio destinație setată';

  @override
  String get bookDockNoAuthor => 'Niciun autor încă';

  @override
  String get bookDockLookUpAgain => 'Caută din nou';

  @override
  String get bookDockLookingUp => 'Se caută din nou detaliile';

  @override
  String get bookDockLookUpFailed => 'Nu s-au putut căuta detaliile';

  @override
  String get bookDockProposedChanges => 'Modificări propuse';

  @override
  String get bookDockNoChanges => 'Încă nu s-au găsit detalii online';

  @override
  String get bookDockStillReading => 'Serverul încă citește acest fișier';

  @override
  String get bookDockRoleBook => 'Carte';

  @override
  String get bookDockRoleCover => 'Copertă';

  @override
  String get bookDockRoleMetadata => 'Metadate';

  @override
  String get bookDockRoleExtra => 'Suplimentar';

  @override
  String get bookDockFieldTitle => 'Titlu';

  @override
  String get bookDockFieldSubtitle => 'Subtitlu';

  @override
  String get bookDockFieldAuthors => 'Autori';

  @override
  String get bookDockFieldSeries => 'Serie';

  @override
  String get bookDockFieldPublisher => 'Editură';

  @override
  String get bookDockFieldYear => 'An';

  @override
  String get bookDockFieldLanguage => 'Limbă';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return '$percent% potrivire';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fișiere',
      few: '$count fișiere',
      one: '1 fișier',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return 'Merge în $library';
  }

  @override
  String bookDockChangedFields(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de câmpuri',
      few: '$count câmpuri',
      one: '1 câmp',
    );
    return '$_temp0';
  }

  @override
  String bookDockFilesInEntry(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fișiere în această intrare',
      few: '$count fișiere în această intrare',
      one: 'Fișier în această intrare',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return 'Adăugat $date';
  }

  @override
  String get bookDockAddToLibrary => 'Adaugă în bibliotecă';

  @override
  String get bookDockUseFound => 'Folosește detaliile găsite';

  @override
  String get bookDockRemoveTitle => 'Elimini din Book Dock?';

  @override
  String get bookDockRemoveFailed => 'Nu s-a putut elimina acest fișier';

  @override
  String get bookDockPickLibrary => 'În ce bibliotecă adaugi?';

  @override
  String get bookDockNoLibraries =>
      'Contul tău nu poate adăuga cărți într-o bibliotecă';

  @override
  String get bookDockFileFailed =>
      'Nu s-a putut adăuga acest fișier în bibliotecă';

  @override
  String get bookDockDuplicateBody =>
      'Un fișier cu acest nume există deja în acea bibliotecă. Îl elimini din Book Dock?';

  @override
  String get bookDockDetailsUpdated => 'Detalii actualizate';

  @override
  String get bookDockUseFoundFailed => 'Nu există detalii găsite de folosit';

  @override
  String bookDockRemoveBody(String title) {
    return 'Aceasta șterge $title de pe server.';
  }

  @override
  String bookDockRemoved(String title) {
    return '$title a fost eliminat din Book Dock';
  }

  @override
  String bookDockFiled(String title, String library) {
    return '$title a fost adăugat în $library';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return 'Nu s-a putut adăuga acest fișier: $reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return 'Deja în $library';
  }

  @override
  String get bomatchSearchAll => 'Caută în toate sursele';

  @override
  String get bomatchSearching => 'Se caută...';

  @override
  String get bomatchSearchFailed =>
      'Nu s-au putut căuta potriviri. Verifică conexiunea și încearcă din nou.';

  @override
  String get bomatchNoResults => 'Nu s-au găsit potriviri';

  @override
  String get bomatchStrong => 'Potriviri puternice';

  @override
  String get bomatchPossible => 'Potriviri posibile';

  @override
  String get bomatchSourceTimeout => 'timp expirat';

  @override
  String get bomatchSourceBusy => 'ocupat';

  @override
  String get bomatchSourceFailed => 'eșuat';

  @override
  String get bomatchLinked => 'Asociat';

  @override
  String get bomatchSameIsbn => 'Același ISBN';

  @override
  String get bomatchFewDetails => 'Puține detalii';

  @override
  String get bomatchBack => 'Toate rezultatele';

  @override
  String get bomatchFillEmpty => 'Completează golurile';

  @override
  String get bomatchTakeAll => 'Preia tot';

  @override
  String get bomatchOnlyDifferences => 'Doar diferențele';

  @override
  String get bomatchNow => 'Acum';

  @override
  String get bomatchEmpty => 'Gol';

  @override
  String get bomatchKindNew => 'Nou';

  @override
  String get bomatchKindChange => 'Modificare';

  @override
  String get bomatchKindSmall => 'Modificare minoră';

  @override
  String get bomatchKindSame => 'Identic';

  @override
  String get bomatchKindNone => 'Absent din rezultat';

  @override
  String get bomatchKeep => 'Păstrează';

  @override
  String get bomatchUse => 'Folosește';

  @override
  String get bomatchMerge => 'Îmbină';

  @override
  String get bomatchReplace => 'Înlocuiește';

  @override
  String get bomatchUseThis => 'Folosește-l';

  @override
  String get bomatchChosen => 'Ales';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de alte cărți',
      few: '$count alte cărți',
      one: '1 altă carte',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de modificări',
      few: '$count modificări',
      one: '1 modificare',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de noi',
      few: '$count noi',
      one: '1 nou',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aplică $count de modificări',
      few: 'Aplică $count modificări',
      one: 'Aplică 1 modificare',
      zero: 'Aplică',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de alte surse',
      few: '$count alte surse',
      one: '1 altă sursă',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return 'Din $source';
  }

  @override
  String get breqTitle => 'Cereri de cărți';

  @override
  String get breqTabRequest => 'Cere o carte';

  @override
  String get breqTabMine => 'Cererile mele';

  @override
  String get breqTabAll => 'Toate cererile';

  @override
  String get breqNoAccess => 'Contul tău nu poate cere cărți pe acest server.';

  @override
  String get breqTitleHint => 'Titlul cărții';

  @override
  String get breqAuthorHint => 'Autor';

  @override
  String get breqKindAudiobook => 'Carte audio';

  @override
  String get breqKindEbook => 'E-book';

  @override
  String get breqKindComic => 'Benzi desenate';

  @override
  String get breqSearch => 'Caută';

  @override
  String get breqSearching => 'Se caută...';

  @override
  String get breqSearchFailed =>
      'Căutarea a eșuat. Verifică conexiunea și încearcă din nou.';

  @override
  String get breqSearchPrompt =>
      'Caută o carte pe care biblioteca nu o are încă, pentru a o cere.';

  @override
  String get breqNoResults => 'Nu s-au găsit cărți potrivite';

  @override
  String get breqInLibrary => 'În biblioteca ta';

  @override
  String get breqYouAsked => 'Ai cerut-o tu';

  @override
  String get breqSomeoneAsked => 'Deja cerută de altcineva';

  @override
  String get breqView => 'Vezi';

  @override
  String get breqRequest => 'Cere';

  @override
  String get breqRequested => 'Cerută';

  @override
  String get breqAddMeToo => 'Adaugă-mă și pe mine';

  @override
  String get breqLibrary => 'Bibliotecă';

  @override
  String get breqLibraryApprover => 'Lasă aprobatorul să decidă';

  @override
  String get breqLibraryChoose => 'Alege o bibliotecă';

  @override
  String get breqNote => 'Notă pentru aprobator';

  @override
  String get breqNoteHint => 'Orice merită știut despre această cerere';

  @override
  String get breqAutoApproved => 'Cererile tale sunt aprobate imediat.';

  @override
  String get breqSubmitted => 'Cerere trimisă';

  @override
  String get breqJoined => 'Ai fost adăugat la cererea existentă';

  @override
  String get breqFailed => 'Nu s-a putut trimite cererea';

  @override
  String get breqStatusPending => 'În așteptare';

  @override
  String get breqStatusApproved => 'Aprobată';

  @override
  String get breqStatusRejected => 'Respinsă';

  @override
  String get breqStatusCancelled => 'Anulată';

  @override
  String get breqStatusSearching => 'Se caută';

  @override
  String get breqStatusGrabbed => 'Ediție găsită';

  @override
  String get breqStatusDownloading => 'Se descarcă';

  @override
  String get breqStatusImporting => 'Se importă';

  @override
  String get breqStatusNeedsReview => 'Necesită verificare';

  @override
  String get breqStatusAvailable => 'Disponibilă';

  @override
  String get breqStatusFailed => 'Eșuată';

  @override
  String get breqWaitingApproval => 'Se așteaptă aprobarea';

  @override
  String get breqWaitingRelease => 'Se așteaptă alegerea unei ediții';

  @override
  String get breqLookingForRelease => 'Se caută o ediție';

  @override
  String get breqStartingDownload => 'Se pornește descărcarea';

  @override
  String get breqAddingToLibrary => 'Se adaugă în bibliotecă';

  @override
  String get breqWaitingCheck => 'Se așteaptă o verificare manuală';

  @override
  String get breqReady => 'Gata în biblioteca ta';

  @override
  String get breqSomethingWrong => 'Ceva nu a mers bine';

  @override
  String get breqShowHidden => 'Arată cele ascunse';

  @override
  String get breqHidden => 'Ascunse';

  @override
  String get breqMineEmpty => 'Nu ai cerut încă nicio carte.';

  @override
  String get breqAllEmpty => 'Nicio cerere încă.';

  @override
  String get breqLoadFailed => 'Nu s-au putut încărca cererile.';

  @override
  String get breqLoadMore => 'Încarcă mai multe';

  @override
  String get breqApprove => 'Aprobă';

  @override
  String get breqReject => 'Respinge';

  @override
  String get breqCancel => 'Anulează cererea';

  @override
  String get breqHide => 'Ascunde din lista mea';

  @override
  String get breqUnhide => 'Arată în lista mea';

  @override
  String get breqLeave => 'Părăsește cererea';

  @override
  String get breqDelete => 'Șterge cererea';

  @override
  String get breqOpenBook => 'Deschide cartea';

  @override
  String get breqCancelConfirm =>
      'Anulezi această cerere? O descărcare în curs se oprește și ea.';

  @override
  String get breqDeleteConfirm =>
      'Ștergi această cerere? Acțiunea nu poate fi anulată.';

  @override
  String get breqRejectTitle => 'Respinge cererea';

  @override
  String get breqRejectReason => 'Motiv (opțional)';

  @override
  String get breqApproveTitle => 'Aprobă cererea';

  @override
  String get breqApproveLibraryNeeded =>
      'Alege biblioteca în care intră această carte.';

  @override
  String get breqApprovedToast => 'Cerere aprobată';

  @override
  String get breqRejectedToast => 'Cerere respinsă';

  @override
  String get breqCancelledToast => 'Cerere anulată';

  @override
  String get breqHiddenToast => 'Ascunsă din lista ta';

  @override
  String get breqRestoredToast => 'Înapoi în lista ta';

  @override
  String get breqDeletedToast => 'Cerere ștearsă';

  @override
  String get breqLeftToast => 'Ai părăsit această cerere';

  @override
  String get breqActionFailed => 'Nu s-a putut actualiza cererea';

  @override
  String get breqFactRequestedBy => 'Cerută de';

  @override
  String get breqFactRequestedOn => 'Cerută la';

  @override
  String get breqFactLibrary => 'Bibliotecă';

  @override
  String get breqFactDecidedBy => 'Decisă de';

  @override
  String get breqFactNote => 'Notă de la solicitant';

  @override
  String get breqFactDecisionNote => 'Notă de decizie';

  @override
  String get breqFactAlsoWanted => 'Dorită și de';

  @override
  String get breqLibraryCta => 'Cere o carte';

  @override
  String get breqSettingsSubtitle =>
      'Cere cărți pe care biblioteca nu le are încă';

  @override
  String get navHoldBookRequests => 'Cereri de cărți';

  @override
  String breqLibraryDefault(String library) {
    return 'Implicită ($library)';
  }

  @override
  String breqFailedReason(String reason) {
    return 'Nu s-a putut trimite cererea: $reason';
  }

  @override
  String breqBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți',
      few: '$count cărți',
      one: '1 carte',
    );
    return '$_temp0';
  }

  @override
  String breqDownloadingPercent(int percent) {
    return 'Se descarcă, $percent%';
  }

  @override
  String breqAddedTo(String library) {
    return 'Adăugată în $library';
  }

  @override
  String breqRejectedWithNote(String note) {
    return 'Respinsă: $note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return 'Eșuată: $reason';
  }

  @override
  String breqRequestedBy(String name) {
    return 'Cerută de $name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return 'Nu s-a putut actualiza cererea: $reason';
  }

  @override
  String breqFooterCta(String query) {
    return 'Cere „$query”';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cereri',
      few: '$count cereri',
      one: '1 cerere',
      zero: 'Nicio cerere',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => 'Găsește o ediție';

  @override
  String get breqTryAnotherRelease => 'Încearcă altă ediție';

  @override
  String get breqApproveAndFind => 'Aprobă și găsește o ediție';

  @override
  String get breqReviewButton => 'Verifică descărcarea';

  @override
  String get breqStopDownload => 'Oprește descărcarea';

  @override
  String get breqStopDownloadConfirm =>
      'Oprești această descărcare? Cererea revine la starea aprobată, ca să poată fi aleasă altă ediție.';

  @override
  String get breqDiscardImport => 'Renunță la descărcare';

  @override
  String get breqDiscardConfirm =>
      'Renunți la această descărcare? Cererea este marcată ca eșuată și poate fi reîncercată cu altă ediție.';

  @override
  String get breqFileAnyway => 'Adaugă în bibliotecă';

  @override
  String get breqFiledToast => 'Adăugată în bibliotecă';

  @override
  String get breqDiscardedToast => 'Descărcare eliminată';

  @override
  String get breqStoppedToast => 'Descărcare oprită';

  @override
  String get breqGrabTitle => 'Descarci această ediție?';

  @override
  String get breqGrab => 'Descarcă';

  @override
  String get breqGrabbed => 'Descărcarea a început';

  @override
  String get breqGrabFailed => 'Nu s-a putut porni descărcarea';

  @override
  String get breqReleaseVipWarning =>
      'Acest tracker permite descărcarea doar conturilor VIP.';

  @override
  String get breqReleaseNoBookFile =>
      'Această ediție nu are niciun fișier de carte pe care BookOrbit să-l poată adăuga într-o bibliotecă.';

  @override
  String get breqReleaseCheckFailed =>
      'Nu s-a putut verifica ce conține această ediție. Încearcă din nou sau alege alta.';

  @override
  String get breqCheckingRelease => 'Se verifică fișierele...';

  @override
  String get breqSearchAgain => 'Caută din nou';

  @override
  String get breqSearchTerms => 'Termeni de căutare';

  @override
  String get breqIsbnHint => 'Lasă gol pentru a căuta după titlu și autor';

  @override
  String get breqSearchingIndexers =>
      'Se caută în indexatoarele tale. Poate dura până la un minut.';

  @override
  String get breqReleasesFailed => 'Nu s-au putut căuta ediții.';

  @override
  String get breqNoSourcesSetUp =>
      'Nicio sursă de căutare nu este configurată în BookOrbit.';

  @override
  String get breqNoSourcesOn =>
      'Toate sursele de căutare sunt dezactivate în BookOrbit.';

  @override
  String get breqNoSourceCarries =>
      'Niciuna dintre sursele tale de căutare nu are acest tip de carte.';

  @override
  String get breqNoReleases =>
      'Nu s-au găsit ediții. Încearcă alți termeni de căutare.';

  @override
  String get breqFromCache => 'dintr-o căutare recentă';

  @override
  String get breqIndexerUnauthorized => 'conectarea a eșuat';

  @override
  String get breqIndexerThrottled => 'ocupat';

  @override
  String get breqIndexerTimeout => 'timp expirat';

  @override
  String get breqIndexerUnreachable => 'inaccesibil';

  @override
  String get breqIndexerNoMedium => 'nu are așa ceva';

  @override
  String get breqIndexerError => 'eșuat';

  @override
  String get breqSortBest => 'Cea mai bună potrivire';

  @override
  String get breqSortSeeders => 'Seederi';

  @override
  String get breqSortSize => 'Dimensiune';

  @override
  String get breqSortNewest => 'Cele mai noi';

  @override
  String get breqFreeleech => 'Freeleech';

  @override
  String get breqVipOnly => 'Doar VIP';

  @override
  String get breqAlreadyGrabbed => 'Descărcată înainte';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => 'Titlu';

  @override
  String get breqReasonAuthor => 'Autor';

  @override
  String get breqReasonUnknownFormat => 'Format necunoscut';

  @override
  String get breqReasonExpectedSize => 'Dimensiune';

  @override
  String get breqReasonSuspiciousSize => 'Dimensiune neobișnuită';

  @override
  String get breqReasonFreeleech => 'Freeleech';

  @override
  String get breqReasonSeveralBooks => 'Mai multe cărți';

  @override
  String get breqReviewTitle => 'Descărcare în așteptarea verificării';

  @override
  String get breqReviewFailed => 'Nu s-au putut încărca detaliile descărcării.';

  @override
  String get breqReviewDockGone =>
      'Fișierele descărcate nu se mai află în Book Dock.';

  @override
  String get breqReviewNoLibrary =>
      'Această cerere nu are o bibliotecă în care să fie adăugată cartea.';

  @override
  String breqGrabFailedReason(String reason) {
    return 'Nu s-a putut porni descărcarea: $reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return 'Nu s-a putut verifica ce conține această ediție: $reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return 'Nu s-au putut căuta ediții: $reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return 'Nu s-au putut încărca detaliile descărcării: $reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de ediții',
      few: '$count ediții',
      one: '1 ediție',
      zero: 'Nicio ediție',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fișiere',
      few: '$count fișiere',
      one: '1 fișier',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fișiere',
      few: '$count fișiere',
      one: '1 fișier',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return '$seeders seederi, $leechers leecheri';
  }

  @override
  String breqScore(int score) {
    return 'Scor $score';
  }

  @override
  String breqReasonPreferredFormat(String format) {
    return '$format preferat';
  }

  @override
  String breqReasonFormat(String format) {
    return '$format';
  }

  @override
  String breqReasonSeeders(String count) {
    return '$count seederi';
  }

  @override
  String breqReviewScore(int score, int threshold) {
    return 'Scor de potrivire $score. Descărcările cu scor de $threshold sau mai mare sunt adăugate automat.';
  }

  @override
  String breqReviewRequested(String value) {
    return 'Cerut: $value';
  }

  @override
  String breqReviewImported(String value) {
    return 'Descărcat: $value';
  }

  @override
  String get breqKindBoth => 'Ambele';

  @override
  String get breqEbookLibrary => 'Bibliotecă de e-book-uri';

  @override
  String get breqAudiobookLibrary => 'Bibliotecă de cărți audio';

  @override
  String get breqRequestBoth => 'Cere ambele';

  @override
  String get breqAddMeToBoth => 'Adaugă-mă la ambele';

  @override
  String get breqRequestEbook => 'Cere e-book';

  @override
  String get breqRequestAudiobook => 'Cere carte audio';

  @override
  String get breqAddMeEbook => 'Adaugă-mă la cererea de e-book';

  @override
  String get breqAddMeAudiobook => 'Adaugă-mă la cererea de carte audio';

  @override
  String get breqPairSubmitted => 'Ai cerut e-book-ul și cartea audio';

  @override
  String get breqPairOneJoined =>
      'Ai cerut ambele. Una era deja în curs, așa că ai fost adăugat la acea cerere';

  @override
  String get breqJoinedBoth => 'Ai fost adăugat la ambele cereri';

  @override
  String get breqJoinsOwned =>
      'Cerută. Se va alătura exemplarului deja existent în biblioteca ta';

  @override
  String get speedBookmarkInControls => 'Viteză și marcaj în comenzile media';

  @override
  String get speedBookmarkOnSubtitle =>
      'Activat - notificarea afișează viteza și marcajul; saltul între capitole rămâne în Android Auto';

  @override
  String get speedBookmarkOffSubtitle =>
      'Oprit - notificarea afișează saltul între capitole; viteza și marcajul rămân în Android Auto';

  @override
  String get lockSeekBar => 'Blochează bara de derulare';

  @override
  String get lockSeekBarOnSubtitle =>
      'Activat - cursorul din notificare, de pe ecranul de blocare și din mașină arată progresul, dar nu poate fi tras';

  @override
  String get lockSeekBarOffSubtitle =>
      'Oprit - trage cursorul din notificare, de pe ecranul de blocare și din mașină pentru a sări în alt punct';

  @override
  String get autoRewindOnResume => 'Derulare automată înapoi la reluare';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return 'Activat - de la ${min}s la ${max}s, în funcție de durata pauzei';
  }

  @override
  String get autoRewindOffSubtitle => 'Oprit';

  @override
  String get rewindRange => 'Interval de derulare';

  @override
  String get rewindAfterPausedFor => 'Derulează după o pauză de';

  @override
  String get rewindAnyPause => 'Orice pauză';

  @override
  String get rewindAlwaysLabel => 'Întotdeauna';

  @override
  String get rewindAlwaysDescription =>
      'Derulează înapoi la fiecare reluare, chiar și după întreruperi scurte';

  @override
  String rewindAfterDescription(String seconds) {
    return 'Derulează înapoi doar dacă pauza a durat $seconds+ secunde';
  }

  @override
  String get chapterBarrier => 'Limita capitolului';

  @override
  String get chapterBarrierSubtitle =>
      'Nu derula automat înapoi dincolo de începutul capitolului curent';

  @override
  String get rewindInstant => 'Instant';

  @override
  String rewindPause(String duration) {
    return 'Pauză de $duration';
  }

  @override
  String get rewindNoRewind => 'fără derulare';

  @override
  String rewindSeconds(String seconds) {
    return 'derulare de ${seconds}s';
  }

  @override
  String get sectionSleepTimer => 'Temporizator de somn';

  @override
  String get sleep => 'Somn';

  @override
  String get sleepTimer => 'Temporizator de somn';

  @override
  String get shakeDuringSleepTimer =>
      'Scuturare în timpul temporizatorului de somn';

  @override
  String get shakeOff => 'Oprit';

  @override
  String get shakeAddTime => 'Adaugă timp';

  @override
  String get shakeReset => 'Resetează';

  @override
  String get shakeAdds => 'Scuturarea adaugă';

  @override
  String get sleepAddAmount => 'Cantitatea de timp adăugat';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes min';
  }

  @override
  String get shakeSensitivity => 'Sensibilitatea la scuturare';

  @override
  String get shakeSensitivityVeryLow => 'Foarte scăzută';

  @override
  String get shakeSensitivityLow => 'Scăzută';

  @override
  String get shakeSensitivityMedium => 'Medie';

  @override
  String get shakeSensitivityHigh => 'Ridicată';

  @override
  String get shakeSensitivityVeryHigh => 'Foarte ridicată';

  @override
  String get buttonDuringSleepTimer =>
      'Butonul căștilor în timpul stingerii treptate';

  @override
  String get buttonDuringSleepTimerHint =>
      'În ultimele momente ale stingerii treptate, o singură apăsare resetează temporizatorul în loc să pună pe pauză. Dubla apăsare tot sare peste.';

  @override
  String get resetTimerOnPause => 'Resetează temporizatorul la pauză';

  @override
  String get resetTimerOnPauseOnSubtitle =>
      'Temporizatorul repornește de la durata completă când reiei redarea';

  @override
  String get resetTimerOnPauseOffSubtitle =>
      'Temporizatorul continuă de unde a rămas';

  @override
  String get fadeVolumeBeforeSleep => 'Reduce treptat volumul înainte de somn';

  @override
  String get fadeVolumeOnSubtitle =>
      'Reduce treptat volumul în ultimele 30 de secunde';

  @override
  String get fadeVolumeOffSubtitle =>
      'Redarea se oprește imediat când se încheie temporizatorul';

  @override
  String get autoSleepTimer => 'Temporizator de somn automat';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration min';
  }

  @override
  String get autoSleepTimerOffSubtitle =>
      'Pornește automat un temporizator de somn într-un interval orar';

  @override
  String get windowStart => 'Începutul intervalului';

  @override
  String get windowEnd => 'Sfârșitul intervalului';

  @override
  String get timerDuration => 'Durata temporizatorului';

  @override
  String get timer => 'Temporizator';

  @override
  String get endOfChapter => 'Sfârșitul capitolului';

  @override
  String startMinTimer(int minutes) {
    return 'Pornește temporizator de $minutes min';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return 'Somn după $count $label';
  }

  @override
  String get addMoreTime => 'Adaugă mai mult timp';

  @override
  String get cancelTimer => 'Anulează temporizatorul';

  @override
  String chaptersLeftCount(int count) {
    return '$count cap. rămase';
  }

  @override
  String get sectionDownloadsAndStorage => 'Descărcări și stocare';

  @override
  String get downloadOverWifiOnly => 'Rețea pentru descărcări';

  @override
  String get downloadOverWifiOnSubtitle => 'Doar Wi-Fi';

  @override
  String get downloadOverWifiOffSubtitle => 'Orice conexiune';

  @override
  String get autoDownloadOnWifi => 'Descarcă automat cărțile pe care le începi';

  @override
  String get autoDownloadOnWifiInfoTitle =>
      'Descarcă automat cărțile pe care le începi';

  @override
  String get autoDownloadOnWifiInfoContent =>
      'Când începi să asculți o carte în streaming, cartea întreagă se descarcă în fundal, astfel încât să o ai offline fără să pornești tu descărcarea. Aceste descărcări respectă setarea Rețea pentru descărcări de mai sus, așa că setează-o pe Orice conexiune dacă vrei să ruleze și pe datele mobile.';

  @override
  String get autoDownloadOnWifiOnSubtitle =>
      'Cărțile ascultate în streaming se descarcă automat în fundal';

  @override
  String get autoDownloadOnWifiOffSubtitle => 'Oprit';

  @override
  String get concurrentDownloads => 'Descărcări simultane';

  @override
  String get autoDownload => 'Descărcare automată';

  @override
  String get autoDownloadSubtitle =>
      'Activează-o pentru fiecare serie, podcast, listă de redare sau colecție din paginile lor de detalii';

  @override
  String get autoDownloadEnabledFor => 'Activată pentru';

  @override
  String get autoDownloadEnabledForNone => 'Încă nimic';

  @override
  String get autoDownloadSourceUnnamed => 'Încă neîncărcat';

  @override
  String get keepNext => 'Păstrează următoarele';

  @override
  String get keepNextInfoTitle => 'Păstrează următoarele';

  @override
  String get keepNextInfoContent =>
      'Numărul de elemente care rămân descărcate, inclusiv cel pe care îl asculți acum. De exemplu, „Păstrează următoarele 3” înseamnă că rămân descărcate cartea curentă și următoarele 2 din acea serie, podcast, listă de redare sau colecție. Se aplică fiecărei descărcări automate pe care o activezi.';

  @override
  String get deleteAbsorbedDownloads => 'Șterge descărcările absorbite';

  @override
  String get deleteAbsorbedDownloadsInfoTitle =>
      'Șterge descărcările absorbite';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      'Când este activată, cărțile sau episoadele descărcate sunt șterse automat de pe acest dispozitiv după ce le termini în Absorb. Terminarea unui element pe web sau pe alt dispozitiv nu șterge descărcarea de aici.';

  @override
  String get deleteAbsorbedOnSubtitle =>
      'Elementele terminate sunt eliminate pentru a economisi spațiu';

  @override
  String get deleteAbsorbedOffSubtitle =>
      'Oprit - descărcările terminate sunt păstrate';

  @override
  String get downloadLocation => 'Locația descărcărilor';

  @override
  String get storageUsed => 'Spațiu utilizat';

  @override
  String storageUsedByDownloads(String size) {
    return '$size utilizați de descărcări';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return '$free liberi din $total';
  }

  @override
  String get manageDownloads => 'Gestionează descărcările';

  @override
  String get streamingCache => 'Cache de streaming';

  @override
  String get streamingCacheInfoTitle => 'Cache de streaming';

  @override
  String get streamingCacheInfoContent =>
      'Păstrează în cache pe disc sunetul ascultat în streaming, ca să nu fie descărcat din nou dacă derulezi înapoi sau reasculți secțiuni. Cache-ul este gestionat automat - cele mai vechi fișiere sunt eliminate când se atinge limita de dimensiune. Este separat de cărțile descărcate complet.';

  @override
  String get streamingCacheOff => 'Oprit';

  @override
  String get streamingCacheOffSubtitle =>
      'Oprit - sunetul este redat în streaming fără cache';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size MB - sunetul ascultat recent în streaming este păstrat în cache pe disc';
  }

  @override
  String get clearCache => 'Golește cache-ul';

  @override
  String get streamingCacheCleared => 'Cache-ul de streaming a fost golit';

  @override
  String get sectionLibrary => 'Bibliotecă';

  @override
  String get hideEbookOnlyTitles => 'Ascunde titlurile doar e-book';

  @override
  String get hideEbookOnlyOnSubtitle =>
      'Cărțile fără fișiere audio sunt ascunse';

  @override
  String get hideEbookOnlyOffSubtitle =>
      'Oprit - toate elementele bibliotecii sunt afișate';

  @override
  String get homeCardsOpenDetails => 'Deschide detaliile din Acasă';

  @override
  String get homeCardsOpenDetailsOnSubtitle =>
      'Atingerea unui card Continuă ascultarea sau Continuă citirea deschide detaliile';

  @override
  String get homeCardsOpenDetailsOffSubtitle =>
      'Atingerea unui card Continuă ascultarea sau Continuă citirea reia de unde ai rămas';

  @override
  String get showGoodreadsButton => 'Afișează butonul Goodreads';

  @override
  String get showGoodreadsOnSubtitle =>
      'Fișa de detalii a cărții arată un link către Goodreads';

  @override
  String get showGoodreadsOffSubtitle =>
      'Oprit - butonul Goodreads este ascuns';

  @override
  String get sectionPermissions => 'Permisiuni';

  @override
  String get notifications => 'Notificări';

  @override
  String get notificationsSubtitle =>
      'Pentru progresul descărcărilor și comenzile de redare';

  @override
  String get notificationsAlreadyEnabled => 'Notificările sunt deja activate';

  @override
  String get unrestrictedBattery => 'Baterie nerestricționată';

  @override
  String get unrestrictedBatterySubtitle =>
      'Împiedică Android să oprească redarea în fundal';

  @override
  String get batteryAlreadyUnrestricted => 'Bateria este deja nerestricționată';

  @override
  String get sectionIssuesAndSupport => 'Probleme și asistență';

  @override
  String get bugsAndFeatureRequests => 'Erori și cereri de funcții';

  @override
  String get bugsAndFeatureRequestsSubtitle => 'Deschide o problemă pe GitHub';

  @override
  String get joinDiscord => 'Alătură-te pe Discord';

  @override
  String get joinDiscordSubtitle => 'Comunitate, asistență și noutăți';

  @override
  String get contact => 'Contact';

  @override
  String get contactSubtitle =>
      'Trimite informații despre dispozitiv prin e-mail';

  @override
  String get enableLogging => 'Activează jurnalele';

  @override
  String get enableLoggingOnSubtitle =>
      'Activat - jurnalele sunt salvate într-un fișier (repornește pentru aplicare)';

  @override
  String get enableLoggingOffSubtitle => 'Oprit - nu se captează jurnale';

  @override
  String get loggingEnabledSnackbar =>
      'Jurnalele sunt activate - repornește aplicația pentru a începe captarea';

  @override
  String get loggingDisabledSnackbar =>
      'Jurnalele sunt dezactivate - repornește aplicația pentru a opri captarea';

  @override
  String get sendLogs => 'Trimite jurnalele';

  @override
  String get sendLogsSubtitle => 'Partajează fișierul de jurnal ca atașament';

  @override
  String failedToShare(String error) {
    return 'Partajarea a eșuat: $error';
  }

  @override
  String get clearLogs => 'Șterge jurnalele';

  @override
  String get logsCleared => 'Jurnalele au fost șterse';

  @override
  String get clearLogsQuestion => 'Ștergi jurnalele?';

  @override
  String get clearLogsContent =>
      'Acțiunea nu poate fi anulată. Trimite-le mai întâi dacă s-ar putea să ai nevoie de ele.';

  @override
  String get sectionAdvanced => 'Avansat';

  @override
  String get localServer => 'Server local';

  @override
  String get localServerInfoTitle => 'Server local';

  @override
  String get localServerInfoContent =>
      'Dacă îți rulezi serverul Audiobookshelf acasă, poți seta aici o adresă locală/LAN. Absorb va trece automat la conexiunea locală, mai rapidă, când detectează că ești în rețeaua de acasă, și va reveni la adresa de la distanță când ești plecat.';

  @override
  String get localServerOnConnectedSubtitle => 'Conectat prin serverul local';

  @override
  String get localServerOnRemoteSubtitle =>
      'Activat - se folosește serverul de la distanță';

  @override
  String get localServerOffSubtitle =>
      'Trece automat la un server LAN în WiFi-ul de acasă';

  @override
  String get localServerUrlLabel => 'Adresa serverului local';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar =>
      'Adresa serverului local a fost setată - se va conecta automat când ești în rețeaua de acasă';

  @override
  String get disableAudioFocus => 'Dezactivează focalizarea audio';

  @override
  String get disableAudioFocusInfoTitle => 'Focalizare audio';

  @override
  String get disableAudioFocusInfoContent =>
      'Implicit, Android acordă „focalizarea” audio unei singure aplicații la un moment dat - când Absorb redă, alte sunete (muzică, videoclipuri) se opresc. Dezactivarea focalizării audio permite Absorb să redea alături de alte aplicații. Apelurile telefonice tot opresc redarea, indiferent de această setare.';

  @override
  String get disableAudioFocusOnSubtitle =>
      'Activat - redă alături de alte sunete (se oprește totuși la apeluri)';

  @override
  String get disableAudioFocusOffSubtitle =>
      'Oprit - alte sunete se opresc când Absorb redă';

  @override
  String get restartRequired => 'Repornire necesară';

  @override
  String get restartRequiredContent =>
      'Schimbarea focalizării audio necesită o repornire completă pentru a avea efect. Închizi aplicația acum?';

  @override
  String get closeApp => 'Închide aplicația';

  @override
  String get trustAllCertificates => 'Ai încredere în toate certificatele';

  @override
  String get trustAllCertificatesInfoTitle => 'Certificate autosemnate';

  @override
  String get mp3IndexSeeking => 'Derulare MP3 prin index';

  @override
  String get mp3IndexSeekingInfoTitle => 'Derulare MP3 prin index';

  @override
  String get mp3IndexSeekingInfoContent =>
      'Activează-o doar dacă ai fișiere MP3 care nu derulează la poziția corectă. Derularea inexactă provine de obicei din MP3-uri cu rată de biți variabilă (VBR). Derularea prin index construiește o hartă exactă a timpului pe măsură ce fișierul este citit, așa că un salt aproape de sfârșitul unui MP3 mare poate dura puțin - mai ales în streaming, deoarece fișierul trebuie citit până în acel punct. Are efect la următoarea pornire a unei cărți sau a unui episod de podcast.';

  @override
  String get mp3IndexSeekingOnSubtitle =>
      'Activat - derulare exactă pentru fișiere MP3 VBR';

  @override
  String get mp3IndexSeekingOffSubtitle => 'Oprit - derulare normală';

  @override
  String get trustAllCertificatesInfoContent =>
      'Activează-o dacă serverul tău Audiobookshelf folosește un certificat autosemnat sau un CA rădăcină personalizat. Când este activată, Absorb va sări peste verificarea certificatelor TLS pentru toate conexiunile. Activează-o doar dacă ai încredere în rețeaua ta.';

  @override
  String get trustAllCertificatesOnSubtitle =>
      'Activat - se acceptă toate certificatele';

  @override
  String get trustAllCertificatesOffSubtitle =>
      'Oprit - se acceptă doar certificatele de încredere';

  @override
  String get supportTheDev => 'Sprijină dezvoltatorul';

  @override
  String get buyMeACoffee => 'Cumpără-mi o cafea';

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
  String get backupAndRestore => 'Copie de rezervă și restaurare';

  @override
  String get backupAndRestoreSubtitle =>
      'Salvează sau restaurează toate setările într-un fișier';

  @override
  String get backUp => 'Fă copie';

  @override
  String get restore => 'Restaurează';

  @override
  String get allBookmarks => 'Toate marcajele';

  @override
  String get allBookmarksSubtitle => 'Vezi marcajele din toate cărțile';

  @override
  String get switchAccount => 'Schimbă contul';

  @override
  String get addAccount => 'Adaugă cont';

  @override
  String get logOut => 'Deconectare';

  @override
  String get includeLoginInfoTitle => 'Incluzi datele de conectare?';

  @override
  String get includeLoginInfoContent =>
      'Vrei să incluzi în copia de rezervă datele de conectare ale tuturor conturilor salvate?\n\nAsta face restaurarea ușoară pe un dispozitiv nou, dar fișierul va conține token-urile tale de autentificare.';

  @override
  String get noSettingsOnly => 'Nu, doar setările';

  @override
  String get yesIncludeAccounts => 'Da, include conturile';

  @override
  String get backupSavedWithAccounts => 'Copie de rezervă salvată (cu conturi)';

  @override
  String get backupSavedSettingsOnly =>
      'Copie de rezervă salvată (doar setări)';

  @override
  String backupFailed(String error) {
    return 'Copierea de rezervă a eșuat: $error';
  }

  @override
  String get restoreBackupTitle => 'Restaurezi copia de rezervă?';

  @override
  String get restoreBackupContent =>
      'Aceasta va înlocui toate setările curente cu valorile din copia de rezervă.';

  @override
  String fromAbsorbVersion(String version) {
    return 'Din Absorb v$version';
  }

  @override
  String restoreAccountsChip(int count) {
    return '$count cont(uri)';
  }

  @override
  String restoreBookmarksChip(int count) {
    return 'Marcaje pentru $count carte/cărți';
  }

  @override
  String get restoreCustomHeadersChip => 'Antete personalizate';

  @override
  String get invalidBackupFile => 'Fișier de copie de rezervă invalid';

  @override
  String get settingsRestoredSuccessfully =>
      'Setările au fost restaurate cu succes';

  @override
  String restoreFailed(String error) {
    return 'Restaurarea a eșuat: $error';
  }

  @override
  String get logOutTitle => 'Te deconectezi?';

  @override
  String get logOutContent =>
      'Vei fi deconectat. Descărcările rămân pe acest dispozitiv.';

  @override
  String get signOut => 'Deconectare';

  @override
  String get changePasswordTitle => 'Schimbă parola';

  @override
  String get changePasswordSubtitle =>
      'Actualizează-ți parola Audiobookshelf în siguranță';

  @override
  String get currentPassword => 'Parola curentă';

  @override
  String get newPassword => 'Parola nouă';

  @override
  String get confirmNewPassword => 'Confirmă parola nouă';

  @override
  String get passwordChangeEffect =>
      'Schimbarea parolei deconectează celelalte sesiuni Audiobookshelf. Acest dispozitiv rămâne conectat.';

  @override
  String get passwordFieldsRequired =>
      'Completează toate câmpurile pentru parolă';

  @override
  String get passwordsDoNotMatch => 'Parolele noi nu se potrivesc';

  @override
  String get passwordChanged =>
      'Parola a fost schimbată. Celelalte dispozitive conectate au fost deconectate.';

  @override
  String get passwordInvalid => 'Parola curentă este incorectă';

  @override
  String get passwordChangeUnsupported =>
      'Această versiune de server nu acceptă schimbarea sigură a parolei în Absorb';

  @override
  String get passwordChangeFailed => 'Nu s-a putut schimba parola';

  @override
  String get otherUserPasswordResetWarning =>
      'Schimbarea acestei parole deconectează utilizatorul pe toate dispozitivele.';

  @override
  String get manageSessionsTitle => 'Dispozitive conectate';

  @override
  String get manageSessionsSubtitle =>
      'Verifică și elimină sesiunile Audiobookshelf';

  @override
  String get sessionsCurrent => 'Dispozitivul curent';

  @override
  String get sessionsUnknownDevice => 'Dispozitiv necunoscut';

  @override
  String sessionsLastActive(String date) {
    return 'Ultima activitate: $date';
  }

  @override
  String get sessionsNone => 'Nicio sesiune activă';

  @override
  String get sessionsLoadMore => 'Încarcă mai multe';

  @override
  String get sessionsUnsupported =>
      'Gestionarea sesiunilor necesită Audiobookshelf 2.36 sau mai nou.';

  @override
  String get sessionsLoadFailed =>
      'Nu s-au putut încărca dispozitivele conectate';

  @override
  String get sessionsLegacyNotice =>
      'Această conectare nu are o sesiune de reîmprospătare, așa că Absorb nu poate identifica acest dispozitiv în listă.';

  @override
  String get sessionsRemove => 'Deconectează dispozitivul';

  @override
  String get sessionsRemoveTitle => 'Deconectezi acest dispozitiv?';

  @override
  String get sessionsRemoveContent =>
      'Aceasta elimină sesiunea sa de reîmprospătare. Accesul curent poate continua să funcționeze până expiră token-ul său de scurtă durată.';

  @override
  String get sessionsRemoved => 'Dispozitiv deconectat';

  @override
  String get sessionsRemoveFailed => 'Nu s-a putut deconecta acel dispozitiv';

  @override
  String get sessionsSignOutAll => 'Deconectează toate dispozitivele';

  @override
  String get sessionsSignOutAllTitle => 'Deconectezi peste tot?';

  @override
  String get sessionsSignOutAllContent =>
      'Aceasta elimină toate sesiunile de reîmprospătare, inclusiv pe cea a acestui dispozitiv. Token-urile de acces existente pot funcționa până expiră.';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return 'Programul folosește ora serverului ($timeZone)';
  }

  @override
  String get podcastScheduleServerTimeUnknown =>
      'Programul folosește ora serverului';

  @override
  String get editServerAddressTitle => 'Editează adresa serverului';

  @override
  String editServerAddressSubtitle(String username) {
    return 'Actualizează adresa pentru $username. Folosește asta dacă adresa serverului s-a schimbat - este același server, doar cu o adresă nouă. Statisticile și descărcările tale sunt păstrate.';
  }

  @override
  String get editServerAddressField => 'Adresa serverului';

  @override
  String get editServerAddressUpdated => 'Adresa serverului a fost actualizată';

  @override
  String get editServerAddressFailed =>
      'Nu s-a putut actualiza adresa serverului';

  @override
  String get editServerAddressAction => 'Editează adresa serverului';

  @override
  String get editServerConnectionTitle => 'Editează conexiunea la server';

  @override
  String editServerConnectionSubtitle(String username) {
    return 'Actualizează adresa serverului și antetele personalizate pentru $username. Statisticile și descărcările tale sunt păstrate.';
  }

  @override
  String get editServerConnectionAction => 'Editează conexiunea la server';

  @override
  String get editServerConnectionUpdated =>
      'Conexiunea la server a fost actualizată';

  @override
  String get editServerConnectionFailed =>
      'Nu s-a putut actualiza conexiunea la server';

  @override
  String get editCustomHeadersDescription =>
      'Folosite pentru tuneluri Cloudflare sau proxy-uri inverse. Aceste antete se aplică doar acestui cont salvat.';

  @override
  String get removeAccountAction => 'Elimină contul';

  @override
  String get removeAccountTitle => 'Elimini contul?';

  @override
  String removeAccountContent(String username, String server) {
    return 'Elimini $username de pe $server din conturile salvate?\n\nÎl poți adăuga oricând înapoi conectându-te din nou.';
  }

  @override
  String get switchAccountTitle => 'Schimbi contul?';

  @override
  String switchAccountContent(String username, String server) {
    return 'Treci la $username pe $server?\n\nRedarea curentă va fi oprită, iar aplicația se va reîncărca cu datele celuilalt cont.';
  }

  @override
  String get switchButton => 'Schimbă';

  @override
  String get downloadLocationSheetTitle => 'Locația descărcărilor';

  @override
  String get downloadLocationSheetSubtitle =>
      'Alege unde sunt salvate cărțile audio';

  @override
  String get currentLocation => 'Locația curentă';

  @override
  String get existingDownloadsWarning =>
      'Descărcările existente rămân în locația lor curentă. Doar descărcările noi folosesc noua cale.';

  @override
  String get chooseFolder => 'Alege folderul';

  @override
  String get chooseDownloadFolder => 'Alege folderul de descărcări';

  @override
  String get storagePermissionDenied =>
      'Permisiunea de stocare a fost refuzată definitiv - activează-o din setările aplicației';

  @override
  String get openSettings => 'Deschide Setările';

  @override
  String get storagePermissionRequired =>
      'Permisiunea de stocare este necesară pentru locații de descărcare personalizate';

  @override
  String get cannotWriteToFolder =>
      'Nu se poate scrie în acel folder - alege altă locație sau acordă acces la fișiere din setările sistemului';

  @override
  String downloadLocationSetTo(String label) {
    return 'Locația descărcărilor a fost setată la $label';
  }

  @override
  String get resetToDefault => 'Resetează la implicit';

  @override
  String get resetToDefaultStorage => 'Resetează la stocarea implicită';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count de descărcări se află într-un folder personalizat vechi, care nu mai poate fi deschis. Descarcă-le din nou sau închide această notificare.',
      few:
          '$count descărcări se află într-un folder personalizat vechi, care nu mai poate fi deschis. Descarcă-le din nou sau închide această notificare.',
      one:
          '1 descărcare se află într-un folder personalizat vechi, care nu mai poate fi deschis. Descarcă-o din nou sau închide această notificare.',
    );
    return '$_temp0';
  }

  @override
  String get redownload => 'Descarcă din nou';

  @override
  String get redownloadStarted => 'Se descarcă din nou';

  @override
  String get dismiss => 'Închide';

  @override
  String get tipsAndHiddenFeatures => 'Sfaturi și funcții ascunse';

  @override
  String get tipsSubtitle => 'Profită la maximum de Absorb';

  @override
  String get adminTitle => 'Administrare server';

  @override
  String get adminTasksTitle => 'Activitatea serverului';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de sarcini în execuție',
      few: '$count sarcini în execuție',
      one: '1 sarcină în execuție',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => 'Activitate recentă a serverului';

  @override
  String get adminTasksEmpty => 'Nicio sarcină a serverului nu rulează';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return '$added adăugate - $updated actualizate - $missing lipsă';
  }

  @override
  String get adminServer => 'Server';

  @override
  String get adminVersion => 'Versiune';

  @override
  String get adminUsers => 'Utilizatori';

  @override
  String get adminOnline => 'Online';

  @override
  String get adminBackup => 'Copie de rezervă';

  @override
  String get adminPurgeCache => 'Golește cache-ul';

  @override
  String get adminManage => 'Gestionează';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return '$userCount conturi - $onlineCount online';
  }

  @override
  String get adminPodcasts => 'Podcasturi';

  @override
  String get adminPodcastsSubtitle => 'Caută, adaugă și gestionează emisiuni';

  @override
  String get adminScan => 'Scanează';

  @override
  String get adminScanning => 'Se scanează...';

  @override
  String get adminMatchAll => 'Potrivește tot';

  @override
  String get adminMatching => 'Se potrivește...';

  @override
  String get adminMatchAllTitle => 'Potrivești toate elementele?';

  @override
  String adminMatchAllContent(String name) {
    return 'Potrivești metadatele pentru toate elementele din $name? Poate dura ceva timp.';
  }

  @override
  String adminScanStarted(String name) {
    return 'Scanarea a început pentru $name';
  }

  @override
  String get adminBackupCreated => 'Copie de rezervă creată';

  @override
  String get adminBackupFailed => 'Copierea de rezervă a eșuat';

  @override
  String get adminCachePurged => 'Cache golit';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => 'Deschide în aplicație';

  @override
  String get adminRmabAdd => 'Adaugă integrarea ReadMeABook';

  @override
  String get adminRmabUrlTitle => 'Adresa ReadMeABook';

  @override
  String get adminRmabUrlHelp =>
      'Lipește adresa cu token-ul de conectare. Generează una în RMAB, Admin, Utilizatori.';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => 'Introdu o adresă http(s) validă';

  @override
  String get adminRmabSaved => 'ReadMeABook a fost salvat';

  @override
  String get adminRmabRemoved => 'ReadMeABook a fost eliminat';

  @override
  String get adminRmabReload => 'Reîncarcă';

  @override
  String get adminRmabLoadFailed =>
      'Nu s-a putut încărca ReadMeABook. Verifică adresa.';

  @override
  String get adminRmabConnected => 'Conectat';

  @override
  String get adminRmabAskAdmin =>
      'Cere o adresă de conectare de la administratorul serverului';

  @override
  String get adminRmabUrlHelpUser =>
      'Cere o adresă de conectare de la administratorul serverului. Acesta o generează în RMAB > Admin > Utilizatori.';

  @override
  String get adminRmabSettingsInfo =>
      'ReadMeABook este un serviciu auto-găzduit pentru cererea și descărcarea cărților audio. Trebuie instalat și configurat de administratorul serverului.';

  @override
  String get rmabConfigTitle => 'Conectează ReadMeABook';

  @override
  String get rmabConfigExplainerAdmin =>
      'ReadMeABook este un serviciu auto-găzduit pentru cererea de cărți audio. Generează un token API în RMAB, la Admin Dashboard > Settings > API, apoi lipește mai jos adresa serverului și token-ul. Absorb nu găzduiește și nu descarcă niciun conținut, doar trimite cereri către serverul tău.';

  @override
  String get rmabConfigExplainerUser =>
      'ReadMeABook este un serviciu auto-găzduit pentru cererea de cărți audio. Cere administratorului serverului adresa RMAB și un token API. Absorb nu găzduiește și nu descarcă niciun conținut, doar trimite cereri către serverul tău.';

  @override
  String get rmabConfigLearnMore => 'Află mai multe despre ReadMeABook';

  @override
  String get rmabConfigBaseUrlLabel => 'Adresa serverului RMAB';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.example.com';

  @override
  String get rmabConfigTokenLabel => 'Token API';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel =>
      'Adresa de conectare a interfeței web (opțional)';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      'Lipește adresa de conectare automată, ca „Deschide în vizualizarea browserului” să te ducă deja conectat. Lasă gol pentru conectare obișnuită.';

  @override
  String get rmabConfigHeadersHelp =>
      'Antete suplimentare trimise cu fiecare cerere ReadMeABook, pentru proxy-uri inverse precum Cloudflare Access.';

  @override
  String get rmabConfigConnect => 'Conectează';

  @override
  String get rmabConfigDisconnect => 'Deconectează';

  @override
  String get rmabConfigOpenWebView => 'Deschide în vizualizarea browserului';

  @override
  String rmabConfigConnectedAs(String name) {
    return 'Conectat ca $name';
  }

  @override
  String get rmabConfigErrorInvalidUrl => 'Introdu o adresă http(s) validă';

  @override
  String get rmabConfigErrorMissingToken => 'Introdu token-ul API';

  @override
  String get rmabConfigErrorUnauthorized => 'Token respins de server';

  @override
  String get rmabConfigErrorForbidden =>
      'Acest token nu are voie să facă acea acțiune';

  @override
  String get rmabConfigErrorNetwork =>
      'Nu s-a putut contacta RMAB. Verifică adresa.';

  @override
  String get rmabConfigErrorGeneric => 'Nu s-a putut realiza conectarea';

  @override
  String get rmabConfigSavedSnackbar => 'ReadMeABook a fost conectat';

  @override
  String get rmabConfigDisconnectedSnackbar => 'ReadMeABook a fost deconectat';

  @override
  String get rmabRequestCta => 'Cere prin ReadMeABook';

  @override
  String get rmabSearchHeader => 'Cere prin ReadMeABook';

  @override
  String get rmabSearchHint => 'Caută după titlu sau autor';

  @override
  String get rmabSearchEmpty => 'Nicio potrivire pe serverul tău ReadMeABook';

  @override
  String get rmabSearchError => 'Nu s-a putut căuta în ReadMeABook';

  @override
  String get rmabSearchPrompt => 'Scrie un titlu sau un autor pentru a căuta';

  @override
  String get rmabSearchFooterPrompt => 'Cauți altceva?';

  @override
  String rmabSearchFooterCta(String query) {
    return 'Caută „$query” în ReadMeABook';
  }

  @override
  String get rmabBookDetailExplainer =>
      'Această cerere va fi trimisă prin serverul tău ReadMeABook. Administratorul o va verifica și o va procesa. O poți urmări la Cererile mele, în panoul ReadMeABook.';

  @override
  String get rmabBookAlreadyAvailable => 'Deja în biblioteca ta';

  @override
  String get rmabBookAlreadyRequested => 'Deja cerută';

  @override
  String get rmabRequestSubmitting => 'Se trimite…';

  @override
  String get rmabRequestSent => 'Cerere trimisă';

  @override
  String get rmabRequestErrorAlreadyAvailable => 'Deja în biblioteca ta';

  @override
  String get rmabRequestErrorBeingProcessed => 'Deja în curs de procesare';

  @override
  String get rmabRequestErrorDuplicate => 'Ai cerut deja aceasta';

  @override
  String get rmabRequestErrorValidation => 'Nu s-a putut trimite cererea';

  @override
  String get rmabRequestErrorUserNotFound =>
      'Utilizatorul token-ului nu mai există. Reconectează ReadMeABook.';

  @override
  String get rmabRequestErrorIgnored =>
      'Această carte este în lista ta de ignorate';

  @override
  String get rmabRequestErrorGeneric => 'Nu s-a putut trimite cererea';

  @override
  String get rmabRequestErrorTokenRejected =>
      'Token respins de server. Reconectează ReadMeABook.';

  @override
  String get rmabMyRequestsTab => 'Cererile mele';

  @override
  String get rmabSetupTab => 'Configurare';

  @override
  String get rmabMyRequestsEmpty => 'Nu ai cerut încă nicio carte';

  @override
  String get rmabMyRequestsError => 'Nu s-au putut încărca cererile';

  @override
  String get rmabMyRequestsRefresh => 'Reîmprospătează';

  @override
  String get rmabRequestDetailTitle => 'Detaliile cererii';

  @override
  String get rmabRequestDetailStatus => 'Stare';

  @override
  String get rmabRequestDetailRequestedOn => 'Cerută la';

  @override
  String get rmabRequestDetailCompletedOn => 'Finalizată la';

  @override
  String get rmabRequestDetailProgress => 'Progres';

  @override
  String get rmabStatusActive => 'În curs';

  @override
  String get rmabStatusWaiting => 'În așteptare';

  @override
  String get rmabStatusAvailable => 'Disponibilă';

  @override
  String get rmabStatusDownloaded => 'Descărcată';

  @override
  String get rmabStatusFailed => 'Eșuată';

  @override
  String get rmabStatusCancelled => 'Anulată';

  @override
  String get rmabStatusDenied => 'Refuzată';

  @override
  String get rmabStatusUnknown => 'Necunoscută';

  @override
  String narratedBy(String narrator) {
    return 'Narată de $narrator';
  }

  @override
  String get onAudible => 'pe Audible';

  @override
  String percentComplete(String percent) {
    return '$percent% finalizat';
  }

  @override
  String get absorbing => 'Absorbing...';

  @override
  String get absorbAgain => 'Absorb din nou';

  @override
  String get absorb => 'Absorb';

  @override
  String get ebookOnlyNoAudio => 'Doar e-book - fără audio';

  @override
  String get absorbAudioNotDownloaded => 'Audio nedescărcat';

  @override
  String get absorbAudioNotDownloadedEbookOnly =>
      'Audio nedescărcat, doar e-book';

  @override
  String get fullyAbsorbed => 'Absorbit complet';

  @override
  String get fullyAbsorbAction => 'Absorbă complet';

  @override
  String get removeFromAbsorbing => 'Elimină din Absorbing';

  @override
  String get addToAbsorbing => 'Adaugă în Absorbing';

  @override
  String get absorbNext => 'Absorbă următorul';

  @override
  String get absorbNextAdded => 'Următorul în Absorbing';

  @override
  String get absorbLast => 'Absorbă la sfârșit';

  @override
  String get absorbNextHint => 'Imediat după ce se redă acum';

  @override
  String get absorbLastHint => 'La sfârșitul listei';

  @override
  String get removedFromAbsorbing => 'Eliminat din Absorbing';

  @override
  String get addedToAbsorbing => 'Adăugat în Absorbing';

  @override
  String get removeFromContinueListening => 'Elimină din Continuă ascultarea';

  @override
  String get removedFromContinueListening => 'Eliminat din Continuă ascultarea';

  @override
  String get removeFromContinueReading => 'Elimină din Continuă citirea';

  @override
  String get removedFromContinueReading => 'Eliminat din Continuă citirea';

  @override
  String get sessionAdd => 'Adaugă sesiune';

  @override
  String get sessionStartLabel => 'Început la';

  @override
  String get sessionAdded => 'Sesiune adăugată';

  @override
  String get sessionAddFailed => 'Nu s-a putut adăuga sesiunea';

  @override
  String get removeSeriesFromContinueSeries => 'Elimină din Continuă seria';

  @override
  String get removedSeriesFromContinueSeries => 'Eliminat din Continuă seria';

  @override
  String get couldNotUpdate => 'Nu s-a putut actualiza, încearcă din nou';

  @override
  String get addToPlaylist => 'Adaugă în listă de redare';

  @override
  String get addToCollection => 'Adaugă în colecție';

  @override
  String get downloadEbook => 'Descarcă e-book-ul';

  @override
  String get downloadEbookAgain => 'Descarcă din nou e-book-ul';

  @override
  String get resetProgress => 'Resetează progresul';

  @override
  String get lookupLocalMetadata => 'Caută metadate locale';

  @override
  String get reLookupLocalMetadata => 'Caută din nou metadate locale';

  @override
  String get clearLocalMetadata => 'Șterge metadatele locale';

  @override
  String get searchOnGoodreads => 'Caută pe Goodreads';

  @override
  String get editServerDetails => 'Editează detaliile de pe server';

  @override
  String get encodeTab => 'Codare';

  @override
  String get codec => 'Codec';

  @override
  String get bitrate => 'Rată de biți';

  @override
  String get channels => 'Canale';

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String get startM4bEncode => 'Pornește codarea M4B';

  @override
  String get encodeStarted => 'Codarea M4B a început';

  @override
  String get encodeFailed => 'Codarea nu a putut porni';

  @override
  String get encodeFinished => 'Codarea M4B s-a încheiat';

  @override
  String get currentlyLabel => 'În prezent:';

  @override
  String encodeOutputPathNote(String path) {
    return 'M4B-ul finalizat va fi pus în folderul tău de cărți audio la: $path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return 'O copie de rezervă a fișierelor audio originale va fi stocată în: /metadata/cache/items/$itemId/. Nu uita să golești periodic cache-ul elementelor.';
  }

  @override
  String get encodeTimeNote => 'Codarea poate dura până la 30 de minute.';

  @override
  String get encodeRescanNote =>
      'Dacă ai dezactivat watcher-ul, va trebui să scanezi din nou această carte audio după aceea.';

  @override
  String get aboutSection => 'Despre';

  @override
  String chaptersCount(int count) {
    return 'Capitole ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return 'Piste audio ($count)';
  }

  @override
  String libraryFilesCount(int count) {
    return 'Fișierele bibliotecii ($count)';
  }

  @override
  String get chapters => 'Capitole';

  @override
  String get noChaptersBook => 'Această carte nu are capitole';

  @override
  String get noChaptersPodcast => 'Acest podcast nu are capitole';

  @override
  String get failedToLoad => 'Încărcarea a eșuat';

  @override
  String startedDate(String date) {
    return 'Început $date';
  }

  @override
  String finishedDate(String date) {
    return 'Terminat $date';
  }

  @override
  String andCountMore(int count) {
    return 'și încă $count';
  }

  @override
  String get markAsFullyAbsorbedQuestion => 'Marchezi ca absorbit complet?';

  @override
  String get markAsFullyAbsorbedContent =>
      'Aceasta va seta progresul la 100% și va opri redarea dacă această carte este în redare.';

  @override
  String get markedAsFinishedNiceWork => 'Marcat ca terminat - bravo!';

  @override
  String get failedToUpdateCheckConnection =>
      'Actualizarea a eșuat - verifică conexiunea';

  @override
  String get markAsNotFinishedQuestion => 'Marchezi ca neterminat?';

  @override
  String get markAsNotFinishedContent =>
      'Aceasta va șterge starea de terminat și va readuce poziția la început.';

  @override
  String get unmark => 'Demarchează';

  @override
  String get markedAsNotFinishedBackAtIt =>
      'Marcat ca neterminat - hai înapoi la treabă!';

  @override
  String get resetProgressQuestion => 'Resetezi progresul?';

  @override
  String get resetProgressListeningAndReading =>
      'Progresul de ascultare și de citire va reveni la 0%.';

  @override
  String get resetProgressListening =>
      'Progresul de ascultare va reveni la 0%.';

  @override
  String get resetProgressReading => 'Progresul de citire va reveni la 0%.';

  @override
  String get resetProgressMarksUnread => 'Cartea va fi marcată și ca necitită.';

  @override
  String get resetProgressCantUndo => 'Această acțiune nu poate fi anulată.';

  @override
  String get progressResetFreshStart => 'Progres resetat - o nouă pornire!';

  @override
  String get clearLocalMetadataQuestion => 'Ștergi metadatele locale?';

  @override
  String get clearLocalMetadataContent =>
      'Aceasta va elimina metadatele stocate local și va reveni la ce are serverul.';

  @override
  String get localMetadataCleared => 'Metadatele locale au fost șterse';

  @override
  String get saveEbook => 'Salvează e-book-ul';

  @override
  String get noEbookFileFound => 'Nu s-a găsit niciun fișier e-book';

  @override
  String get bookmark => 'Marcaj';

  @override
  String get bookmarks => 'Marcaje';

  @override
  String bookmarksWithCount(int count) {
    return 'Marcaje ($count)';
  }

  @override
  String get playbackSpeed => 'Viteză de redare';

  @override
  String get noBookmarksYet => 'Niciun marcaj încă';

  @override
  String get longPressBookmarkHint =>
      'Ține apăsat butonul de marcaj pentru salvare rapidă';

  @override
  String get addBookmark => 'Adaugă marcaj';

  @override
  String get editBookmark => 'Editează marcajul';

  @override
  String get titleLabel => 'Titlu';

  @override
  String get noteOptionalLabel => 'Notă (opțional)';

  @override
  String get editLayout => 'Editează aranjarea';

  @override
  String get inMenu => 'În meniu';

  @override
  String get bookmarkAdded => 'Marcaj adăugat';

  @override
  String get startPlayingSomethingFirst => 'Începe mai întâi să redai ceva';

  @override
  String get playbackHistory => 'Istoricul redării';

  @override
  String get historyLocalTab => 'Istoric';

  @override
  String get historyServerTab => 'Sesiuni';

  @override
  String get historyNoServerSessions =>
      'Încă nu există sesiuni pe server pentru acest element';

  @override
  String get historyServerLoadFailed =>
      'Nu s-au putut încărca sesiunile de pe server';

  @override
  String get clearHistoryTooltip => 'Șterge istoricul';

  @override
  String get tapEventToJump =>
      'Atinge un eveniment pentru a sări la acea poziție';

  @override
  String get noHistoryYet => 'Niciun istoric încă';

  @override
  String jumpedToPosition(String position) {
    return 'S-a sărit la $position';
  }

  @override
  String booksInSeriesCount(int count) {
    return '$count cărți în această serie';
  }

  @override
  String bookNumber(String number) {
    return 'Cartea $number';
  }

  @override
  String downloadRemainingCount(int count) {
    return 'Descarcă restul ($count)';
  }

  @override
  String get downloadAll => 'Descarcă tot';

  @override
  String get markAllNotFinished => 'Marchează toate ca neterminate';

  @override
  String get markAllFinished => 'Marchează toate ca terminate';

  @override
  String get markAllNotFinishedQuestion => 'Marchezi toate ca neterminate?';

  @override
  String get fullyAbsorbSeries => 'Absorbi complet seria?';

  @override
  String get turnAutoDownloadOff => 'Dezactivează descărcarea automată';

  @override
  String get turnAutoDownloadOn => 'Activează descărcarea automată';

  @override
  String get autoDownloadThisSeries => 'Descarci automat această serie?';

  @override
  String get autoDownloadSeriesContent =>
      'Descarcă automat următoarele cărți pe măsură ce asculți.';

  @override
  String get standalone => 'Independente';

  @override
  String get episodes => 'Episoade';

  @override
  String get noEpisodesFound => 'Nu s-au găsit episoade';

  @override
  String get markFinished => 'Marchează ca terminat';

  @override
  String get markUnfinished => 'Marchează ca neterminat';

  @override
  String get allEpisodes => 'Toate episoadele';

  @override
  String get aboutThisEpisode => 'Despre acest episod';

  @override
  String get reversePlayOrder => 'Inversează ordinea de redare';

  @override
  String selectedCount(int count) {
    return '$count selectate';
  }

  @override
  String get selectAll => 'Selectează tot';

  @override
  String get deselectAll => 'Deselectează tot';

  @override
  String get autoDownloadThisPodcast => 'Descarci automat acest podcast?';

  @override
  String get autoDownloadPodcastContent =>
      'Descarcă automat următoarele episoade pe măsură ce asculți.';

  @override
  String get download => 'Descarcă';

  @override
  String get deleteDownload => 'Șterge descărcarea';

  @override
  String get casting => 'Se proiectează';

  @override
  String get castingTo => 'Se proiectează pe';

  @override
  String get editDetails => 'Editează detaliile';

  @override
  String get quickMatch => 'Potrivire rapidă';

  @override
  String get quickMatchNoUpdates => 'Nu sunt necesare actualizări';

  @override
  String get custom => 'Personalizat';

  @override
  String get authorOptionalLabel => 'Autor (opțional)';

  @override
  String get noResultsFound =>
      'Nu s-au găsit rezultate.\nÎncearcă să ajustezi căutarea sau furnizorul.';

  @override
  String get searchForMetadataAbove => 'Caută metadate mai sus';

  @override
  String get applyThisMatch => 'Aplici această potrivire?';

  @override
  String get metadataUpdated => 'Metadate actualizate';

  @override
  String get failedToUpdateMetadata => 'Actualizarea metadatelor a eșuat';

  @override
  String get subtitleLabel => 'Subtitlu';

  @override
  String get authorLabel => 'Autor';

  @override
  String get narratorLabel => 'Narator';

  @override
  String get seriesLabel => 'Serie';

  @override
  String get addSeries => 'Adaugă serie';

  @override
  String get removeSeries => 'Elimină seria';

  @override
  String get descriptionLabel => 'Descriere';

  @override
  String get publisherLabel => 'Editură';

  @override
  String get yearLabel => 'An';

  @override
  String get genresLabel => 'Genuri';

  @override
  String get tagsLabel => 'Etichete';

  @override
  String get commaSeparated => 'Separate prin virgulă';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => 'Imaginea copertei';

  @override
  String get coverRemove => 'Elimină coperta';

  @override
  String get coverRemoveConfirm =>
      'Elimini coperta acestei cărți? Va fi afișat în schimb cardul de titlu generat.';

  @override
  String get coverRemoved => 'Coperta a fost eliminată';

  @override
  String get coverRemoveFailed => 'Nu s-a putut elimina coperta';

  @override
  String get coverUrlLabel => 'Adresa copertei';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => 'Metadate locale';

  @override
  String get overrideLocalDisplay => 'Suprascrie afișarea locală';

  @override
  String get metadataSavedLocally => 'Metadate salvate local';

  @override
  String get notes => 'Note';

  @override
  String get newNote => 'Notă nouă';

  @override
  String get editNote => 'Editează nota';

  @override
  String get noNotesYet => 'Nicio notă încă';

  @override
  String get markdownIsSupported => 'Markdown este acceptat';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => 'Păstrează formatarea intactă';

  @override
  String get plainTextTxt => 'Text simplu (.txt)';

  @override
  String get simpleTextNoFormatting => 'Text simplu, fără formatare';

  @override
  String get untitledNote => 'Notă fără titlu';

  @override
  String get titleHint => 'Titlu';

  @override
  String get noteBodyHint => 'Scrie nota ta... (acceptă markdown)';

  @override
  String get nothingToPreview => 'Nimic de previzualizat';

  @override
  String get audioEnhancements => 'Îmbunătățiri audio';

  @override
  String get presets => 'PRESETĂRI';

  @override
  String get equalizer => 'EGALIZATOR';

  @override
  String get effects => 'EFECTE';

  @override
  String get bassBoost => 'Amplificare bas';

  @override
  String get surround => 'Surround';

  @override
  String get loudness => 'Intensitate sonoră';

  @override
  String get monoAudio => 'Audio mono';

  @override
  String get skipSilence => 'Sari peste liniște';

  @override
  String get resetAll => 'Resetează tot';

  @override
  String get collectionNotFound => 'Colecția nu a fost găsită';

  @override
  String get deleteCollection => 'Șterge colecția';

  @override
  String get deleteCollectionContent =>
      'Sigur vrei să ștergi această colecție?';

  @override
  String get deleteCollectionFailed => 'Nu s-a putut șterge colecția';

  @override
  String get deletePermissionRequired =>
      'Este necesară permisiunea de ștergere. Cere administratorului root să ți-o acorde.';

  @override
  String get deleteFilesCheckbox => 'Șterge și fișierele de pe server';

  @override
  String get deleteFilesCheckedHint =>
      'Fișierele sunt șterse definitiv de pe server.';

  @override
  String get deleteFilesUncheckedHint =>
      'Fișierele rămân pe server, așa că următoarea scanare a bibliotecii poate adăuga din nou elementul.';

  @override
  String get deleteFromServerAction => 'Șterge de pe server';

  @override
  String get deleteFromServerTitle => 'Șterge de pe server';

  @override
  String deleteFromServerContent(String title) {
    return 'Ștergi \"$title\" din Audiobookshelf?';
  }

  @override
  String deletedFromServer(String title) {
    return '\"$title\" a fost șters';
  }

  @override
  String get deleteFromServerFailed =>
      'Nu s-a putut șterge. Verifică jurnalele serverului.';

  @override
  String get playlistNotFound => 'Lista de redare nu a fost găsită';

  @override
  String get deletePlaylist => 'Șterge lista de redare';

  @override
  String get deletePlaylistContent =>
      'Sigur vrei să ștergi această listă de redare?';

  @override
  String get newPlaylist => 'Listă de redare nouă';

  @override
  String get playlistNameHint => 'Numele listei de redare';

  @override
  String addedToName(String name) {
    return 'Adăugat în \"$name\"';
  }

  @override
  String get failedToAdd => 'Adăugarea a eșuat';

  @override
  String get newCollection => 'Colecție nouă';

  @override
  String get collectionNameHint => 'Numele colecției';

  @override
  String get listsNewCollectionSubtitle =>
      'Grupează cărți într-o listă pe care o păstrezi';

  @override
  String get listsNewCollectionNeedsBookSubtitle =>
      'Începe-o cu cel puțin o carte';

  @override
  String get listsNewPlaylistSubtitle => 'Aliniază cărți de ascultat în ordine';

  @override
  String get listsAddBooksNow => 'Adaugă cărți acum';

  @override
  String get listsPickBooksNext =>
      'Vei alege cărți în pasul următor. O colecție de pe acest server necesită cel puțin una.';

  @override
  String get listsCreate => 'Creează';

  @override
  String get listsCollectionNeedsBook =>
      'O colecție necesită cel puțin o carte, așa că nu s-a creat nimic.';

  @override
  String get listsCreateFailed => 'Nu s-a putut crea';

  @override
  String get castToDevice => 'Proiectează pe un dispozitiv';

  @override
  String get searchingForCastDevices => 'Se caută dispozitive Cast...';

  @override
  String get castDevice => 'Dispozitiv Cast';

  @override
  String get stopCasting => 'Oprește proiectarea';

  @override
  String get disconnect => 'Deconectează';

  @override
  String get audioOutput => 'Ieșire audio';

  @override
  String get noOutputDevicesFound => 'Nu s-au găsit dispozitive de ieșire';

  @override
  String get welcomeToAbsorb => 'Bun venit în Absorb Plus';

  @override
  String get welcomeTagline => 'Un client Audiobookshelf.';

  @override
  String get welcomeAbsorbingTitle => 'Absorbing';

  @override
  String get welcomeAbsorbingIntro =>
      'Folosim „absorb” în loc de „redă” și „ascultă”. Preferi formularea clasică? Schimbă-o în Setări.';

  @override
  String get welcomeAbsorbingTabBullet =>
      'Fila Absorbing - ce asculți în prezent';

  @override
  String get welcomeAbsorbButtonBullet => 'Butonul Absorb - pornește redarea';

  @override
  String get welcomeFullyAbsorbBullet =>
      'Absorbă complet - marchează ca terminat';

  @override
  String get welcomeGettingAroundTitle => 'Cum te descurci';

  @override
  String get welcomeGettingAroundBody =>
      'Atinge orice copertă pentru a deschide detaliile. Cardurile Continuă ascultarea sunt diferite - atinge pentru a reda imediat, ține apăsat pentru a deschide detaliile.';

  @override
  String get welcomeMakeItYoursTitle => 'Fă-o a ta';

  @override
  String get welcomeMakeItYoursBody =>
      'Explorează Setările pentru a regla Absorb după gustul tău. Secțiunea Sfaturi și funcții ascunse merită o privire.';

  @override
  String get getStarted => 'Începe';

  @override
  String get showMore => 'Arată mai mult';

  @override
  String get showLess => 'Arată mai puțin';

  @override
  String get readMore => 'Citește mai mult';

  @override
  String get removeDownloadQuestion => 'Elimini descărcarea?';

  @override
  String get removeDownloadContent =>
      'Aceasta va fi eliminată de pe dispozitivul tău.';

  @override
  String get removeWhichDownload =>
      'Cartea audio și e-book-ul sunt ambele pe acest dispozitiv. Alege ce elimini.';

  @override
  String get downloadRemoved => 'Descărcare eliminată';

  @override
  String get finished => 'Terminat';

  @override
  String get saved => 'Descărcat';

  @override
  String get selectLibrary => 'Selectează biblioteca';

  @override
  String get switchLibraryTooltip => 'Schimbă biblioteca';

  @override
  String get refreshTooltip => 'Reîmprospătează';

  @override
  String get noBooksFound => 'Nu s-au găsit cărți';

  @override
  String get userFallback => 'Utilizator';

  @override
  String get rootAdmin => 'Administrator root';

  @override
  String get admin => 'Administrator';

  @override
  String get serverAdmin => 'Administrare server';

  @override
  String get serverAdminSubtitle =>
      'Gestionează utilizatori, biblioteci și setările serverului';

  @override
  String serverUpdateAvailable(String version) {
    return 'Actualizare de server $version disponibilă';
  }

  @override
  String get justNow => 'Chiar acum';

  @override
  String minutesAgo(int count) {
    return 'acum ${count}m';
  }

  @override
  String hoursAgo(int count) {
    return 'acum ${count}h';
  }

  @override
  String daysAgo(int count) {
    return 'acum ${count}z';
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
  String get coverPlayPause => 'Redare/pauză pe copertă';

  @override
  String get coverPlayPauseOnSubtitle =>
      'Activat - atinge coperta pentru redare/pauză';

  @override
  String get coverPlayPauseOffSubtitle =>
      'Oprit - buton dedicat de redare/pauză în comenzi';

  @override
  String get cardBackground => 'Fundalul cardului';

  @override
  String get cardBackgroundBlurred => 'Neclar';

  @override
  String get cardBackgroundGradient => 'Gradient';

  @override
  String get queueModeMergedSubtitle =>
      'Redarea se oprește, coadă manuală sau redare automată a următorului element';

  @override
  String get queueModeSeriesLabel => 'Serie';

  @override
  String get queueModeShowLabel => 'Emisiune';

  @override
  String get queueModeInfoSeries => 'Serie';

  @override
  String get queueModeInfoSeriesDesc =>
      'Redă automat următoarea carte dintr-o serie sau următorul episod dintr-un podcast.';

  @override
  String get resetButtonGridQuestion => 'Resetezi grila de butoane?';

  @override
  String get resetButtonGridContent =>
      'Aceasta va restaura aranjarea implicită a butoanelor, ordinea și setările de comutare.';

  @override
  String get reset => 'Resetează';

  @override
  String get buttonGridReset => 'Grila de butoane a fost resetată';

  @override
  String get resetButtonGrid => 'Resetează grila de butoane';

  @override
  String get chapterBarrierOnRewind => 'Limita capitolului la derulare înapoi';

  @override
  String get chapterBarrierInfoTitle => 'Limita capitolului';

  @override
  String get chapterBarrierInfoContent =>
      'La saltul înapoi, redarea se oprește la începutul capitolului curent în loc să treacă în cel anterior.\n\nApasă de două ori butonul de salt înapoi în 2 secunde pentru a depăși limita.';

  @override
  String get chapterBarrierOnRewindOnSubtitle =>
      'Activat - derularea înapoi se oprește la începutul capitolului';

  @override
  String get chapterBarrierOnRewindOffSubtitle =>
      'Oprit - derularea înapoi trece peste limitele capitolelor';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return 'Activat - de la ${min}s la ${max}s, în funcție de durata pauzei';
  }

  @override
  String get rewindOnSessionStart => 'Derulare înapoi la începutul sesiunii';

  @override
  String get rewindOnSessionStartInfoContent =>
      'Derularea automată obișnuită se activează când reiei redarea după o pauză într-o sesiune activă. Această setare adaugă o derulare înapoi când începi o sesiune complet nouă - de exemplu după ce aplicația a fost închisă, redarea a fost oprită sau deschizi aplicația de la zero.\n\nCând este activată, redarea derulează înapoi cu valoarea maximă completă la începutul fiecărei sesiuni noi, ca să poți reasculta de unde ai rămas.';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return 'Activat - derulează înapoi ${seconds}s la începerea unei sesiuni noi';
  }

  @override
  String rewindActivationDelayValue(String seconds) {
    return '${seconds}s+';
  }

  @override
  String rewindRangeValue(String min, String max) {
    return '${min}s – ${max}s';
  }

  @override
  String rewindSecondsPause(String seconds) {
    return 'pauză de ${seconds}s';
  }

  @override
  String rewindMinPause(String minutes) {
    return 'pauză de $minutes min';
  }

  @override
  String rewindHrPause(String hours) {
    return 'pauză de $hours h';
  }

  @override
  String get rewindOneHrPause => 'pauză de 1 h';

  @override
  String speedValue(String speed) {
    return '${speed}x';
  }

  @override
  String secondsValue(String seconds) {
    return '${seconds}s';
  }

  @override
  String minutesValue(int minutes) {
    return '$minutes min';
  }

  @override
  String get chimeBeforeSleep => 'Sunet înainte de somn';

  @override
  String get chimeBeforeSleepOnSubtitle =>
      'Redă un clopoțel discret când temporizatorul este pe punctul de a se încheia';

  @override
  String get chimeBeforeSleepOffSubtitle =>
      'Fără avertizare sonoră înainte de somn';

  @override
  String get windDownDuration => 'Durata stingerii treptate';

  @override
  String windDownDurationSubtitle(int seconds) {
    return 'Reducerea volumului și sunetul încep cu ${seconds}s înainte de somn';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return 'Reduce treptat volumul în ultimele ${seconds}s';
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
  String get endOfChapterShort => 'Sfârșitul capitolului';

  @override
  String get endOfChapterOnSubtitle =>
      'Oprește la sfârșitul capitolului curent';

  @override
  String get endOfChapterOffSubtitle =>
      'Folosește un temporizator de somn cu durată';

  @override
  String get showExplicitBadge => 'Afișează insigna de conținut explicit';

  @override
  String get showExplicitBadgeOnSubtitle =>
      'Elementele explicite afișează o insignă „E”';

  @override
  String get showExplicitBadgeOffSubtitle =>
      'Oprit - insigna de conținut explicit este ascunsă';

  @override
  String get showEbookBadge => 'Afișează insigna e-book';

  @override
  String get showEbookBadgeOnSubtitle =>
      'Cărțile cu e-book afișează o pictogramă de carte pe copertă';

  @override
  String get showEbookBadgeOffSubtitle => 'Oprit - insigna e-book este ascunsă';

  @override
  String get libraryFallback => 'Bibliotecă';

  @override
  String get preReleaseUpdatesInfoTitle => 'Actualizări de pre-lansare';

  @override
  String get preReleaseUpdatesInfoContent =>
      'Când este activată, verificatorul de actualizări te va anunța și despre versiunile alpha și de pre-lansare de pe GitHub. Acestea pot fi mai puțin stabile, dar includ cele mai noi funcții și remedieri.';

  @override
  String get includePreReleases => 'Include pre-lansările';

  @override
  String get includePreReleasesOnSubtitle =>
      'Activat - se verifică și versiunile alpha și de pre-lansare';

  @override
  String get includePreReleasesOffSubtitle => 'Oprit - doar versiuni stabile';

  @override
  String get setTooltip => 'Setează';

  @override
  String get saveAbsorbBackup => 'Salvează copia de rezervă Absorb';

  @override
  String get checkForUpdate => 'Caută actualizări';

  @override
  String get onLatestVersion => 'Ai cea mai recentă versiune';

  @override
  String get updateAvailable => 'Actualizare disponibilă';

  @override
  String get preReleaseAvailable => 'Pre-lansare disponibilă';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'Este disponibilă o nouă $kind Absorb: $latest\n\nAi versiunea $current.';
  }

  @override
  String get updateKindPreRelease => 'pre-lansare';

  @override
  String get updateKindVersion => 'versiune';

  @override
  String get downloadButton => 'Descarcă';

  @override
  String get updateDownloading => 'Se descarcă actualizarea...';

  @override
  String get updateInstallPermissionDenied =>
      'Permisiunea de instalare a fost refuzată. Activează „Instalare aplicații necunoscute” pentru Absorb în setările sistemului.';

  @override
  String get updateOpeningInBrowser =>
      'Actualizarea în aplicație a eșuat, se deschide browserul';

  @override
  String get sendToEreader => 'Trimite la e-reader';

  @override
  String sendingToEreader(String device) {
    return 'Se trimite la $device...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return 'Trimis la $device';
  }

  @override
  String get sendToEreaderFailed => 'Cartea electronică nu a putut fi trimisă';

  @override
  String get pickEreaderDevice => 'Alege un dispozitiv';

  @override
  String get adminEmail => 'E-mail';

  @override
  String get adminEmailSubtitle => 'SMTP și dispozitive e-reader';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => 'Ghid de configurare';

  @override
  String get smtpHost => 'Gazdă';

  @override
  String get smtpPort => 'Port';

  @override
  String get smtpSecure => 'Securizat';

  @override
  String get smtpRejectUnauthorized => 'Respinge TLS neautorizat';

  @override
  String get smtpUser => 'Nume de utilizator';

  @override
  String get smtpPass => 'Parolă';

  @override
  String get smtpFromAddress => 'Adresa expeditorului';

  @override
  String get smtpTestAddress => 'Adresă de test';

  @override
  String get smtpSendTest => 'Trimite test';

  @override
  String get smtpSaveSettings => 'Salvează';

  @override
  String get smtpSaved => 'Setările de e-mail au fost salvate';

  @override
  String get smtpSaveFailed => 'Setările de e-mail nu au putut fi salvate';

  @override
  String get smtpTestSent => 'E-mailul de test a fost trimis';

  @override
  String get smtpTestFailed => 'E-mailul de test a eșuat';

  @override
  String get ereaderDevicesTitle => 'Dispozitive e-reader';

  @override
  String get ereaderDevicesEmpty =>
      'Încă nu există dispozitive. Adaugă unul mai jos.';

  @override
  String get addEreaderDevice => 'Adaugă dispozitiv';

  @override
  String get editEreaderDevice => 'Editează dispozitivul';

  @override
  String get deleteEreaderDevice => 'Șterge';

  @override
  String get ereaderDeviceName => 'Nume';

  @override
  String get ereaderDeviceEmail => 'E-mail';

  @override
  String get ereaderAvailability => 'Cine poate folosi acest dispozitiv';

  @override
  String get ereaderAvailAdminOrUp => 'Doar administratorii';

  @override
  String get ereaderAvailUserOrUp => 'Toți utilizatorii';

  @override
  String get ereaderAvailGuestOrUp => 'Toată lumea';

  @override
  String get ereaderAvailSpecificUsers => 'Utilizatori anume';

  @override
  String ereaderSpecificUsersN(int count) {
    return 'Utilizatori anume ($count)';
  }

  @override
  String get ereaderDevicesSaved => 'Dispozitivele au fost salvate';

  @override
  String get ereaderDevicesSaveFailed => 'Dispozitivele nu au putut fi salvate';

  @override
  String libraryCountOne(int count) {
    return '$count bibliotecă';
  }

  @override
  String libraryCountOther(int count) {
    return '$count biblioteci';
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
      'Sortate după poziție (inversat)';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '„$title” la $position';
  }

  @override
  String get deleteBookmarkQuestion => 'Ștergi marcajul?';

  @override
  String get cardIconsOnlyChip => 'Doar pictograme';

  @override
  String get cardMoreInGridChip => '„Mai mult” în grilă';

  @override
  String get cardLayoutHidden => 'Ascuns';

  @override
  String get speed => 'Viteză';

  @override
  String get details => 'Detalii';

  @override
  String get episodeDetailsLabel => 'Detaliile episodului';

  @override
  String get bookDetailsLabel => 'Detaliile cărții';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => 'Egalizator';

  @override
  String get cast => 'Proiectează';

  @override
  String castingToDevice(String device) {
    return 'Se proiectează pe $device';
  }

  @override
  String castToDeviceNamed(String device) {
    return 'Proiectează pe $device';
  }

  @override
  String get historyShort => 'Istoric';

  @override
  String atPosition(String position) {
    return 'la $position';
  }

  @override
  String chaptersChip(int count) {
    return '$count capitole';
  }

  @override
  String chapterNumber(int number) {
    return 'Capitolul $number';
  }

  @override
  String kbpsValue(int value) {
    return '$value kbps';
  }

  @override
  String get fileInfoTitle => 'Informații fișier';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fișiere',
      few: '$count fișiere',
      one: '1 fișier',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => 'Această carte nu are detalii despre fișiere.';

  @override
  String get fileInfoAudio => 'Audio';

  @override
  String get fileInfoEbook => 'Carte electronică';

  @override
  String get fileInfoOther => 'Alte fișiere';

  @override
  String get fileInfoBookOrbitNote =>
      'BookOrbit nu raportează codecul sau rata de biți.';

  @override
  String fileInfoChannels(int count) {
    return '$count canale';
  }

  @override
  String get fileInfoCover => 'Copertă';

  @override
  String get fileInfoMetadata => 'Metadate';

  @override
  String get fileInfoSupplement => 'Suplimentar';

  @override
  String get fileInfoPathCopied => 'Calea a fost copiată';

  @override
  String get resetMayNotHaveSynced =>
      'Este posibil ca resetarea să nu se fi sincronizat - verifică serverul';

  @override
  String failedToDownloadEbook(int code) {
    return 'Descărcarea cărții electronice a eșuat ($code)';
  }

  @override
  String get serverReturnedErrorPage =>
      'Serverul a returnat o pagină de eroare în loc de fișierul cărții electronice';

  @override
  String ebookSaved(String filename) {
    return 'Salvat: $filename';
  }

  @override
  String errorSavingEbook(String error) {
    return 'Eroare la salvarea cărții electronice: $error';
  }

  @override
  String failedToSaveError(String error) {
    return 'Salvarea a eșuat: $error';
  }

  @override
  String get adminBackupsLabel => 'Copii de rezervă';

  @override
  String get adminListeningNow => 'Ascultă acum';

  @override
  String get adminLibraries => 'Biblioteci';

  @override
  String get adminLibraryShows => 'emisiuni';

  @override
  String get adminLibraryBooks => 'cărți';

  @override
  String get adminLibraryFolders => 'foldere';

  @override
  String get adminLibrarySize => 'dimensiune';

  @override
  String get adminLibraryDuration => 'durată';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de elemente lipsă sau nevalide',
      few: '$count elemente lipsă sau nevalide',
      one: '1 element lipsă sau nevalid',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => 'Verifică';

  @override
  String get adminMissingTitle => 'Elemente lipsă';

  @override
  String adminMissingSubtitle(String library) {
    return 'Intrări din $library ale căror fișiere lipsesc sau sunt ilizibile';
  }

  @override
  String get adminMissingNone => 'Niciun element lipsă sau nevalid';

  @override
  String get adminMissingBadge => 'Lipsă';

  @override
  String get adminInvalidBadge => 'Nevalid';

  @override
  String get adminMissingDeleteTitle => 'Elimină intrarea';

  @override
  String adminMissingDeleteOneContent(String title) {
    return 'Elimini „$title” din Audiobookshelf?';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return 'Elimini $count intrări din Audiobookshelf?';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return 'Șterge $count';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return '$title a fost eliminat';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de intrări eliminate',
      few: '$count intrări eliminate',
      one: '1 intrare eliminată',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => 'Ștergerea intrării a eșuat';

  @override
  String get adminMatchAction => 'Potrivește';

  @override
  String adminMatchingStarted(String name) {
    return 'Potrivirea a început pentru $name';
  }

  @override
  String get adminMatchFailed => 'Eșuat';

  @override
  String adminScanFailed(String name) {
    return 'Scanarea $name a eșuat';
  }

  @override
  String get adminPurgeCacheFailed => 'Eșuat';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => 'admin';

  @override
  String get adminUsersDisabledBadge => 'dezactivat';

  @override
  String get adminUsersEditUserTooltip => 'Editează utilizatorul';

  @override
  String get adminUsersOnlineNow => 'Online acum';

  @override
  String adminUsersLastSeen(String time) {
    return 'Văzut ultima dată $time';
  }

  @override
  String get adminUsersNever => 'Niciodată';

  @override
  String get adminUsersTotal => 'Total';

  @override
  String get adminUsersNoReadingActivity => 'Nicio activitate de citire';

  @override
  String get adminUsersLoadingDots => 'Se încarcă...';

  @override
  String get adminUsersLoadMoreSessions => 'Încarcă mai multe sesiuni';

  @override
  String get adminUsersNoRecentSessions => 'Nicio sesiune recentă';

  @override
  String get adminUsersLibraryProgress => 'Progresul bibliotecii';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return 'Încarcă mai multe ($count rămase)';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return 'acum $count luni';
  }

  @override
  String get adminUsersNewUser => 'Utilizator nou';

  @override
  String get adminUsersEditUser => 'Editează utilizatorul';

  @override
  String get adminUsersUsername => 'Nume de utilizator';

  @override
  String get adminUsersEnterUsername => 'Introdu numele de utilizator';

  @override
  String get adminUsersPassword => 'Parolă';

  @override
  String get adminUsersNewPassword => 'Parolă nouă';

  @override
  String get adminUsersEnterPassword => 'Introdu parola';

  @override
  String get adminUsersLeaveBlankToKeep =>
      'Lasă gol pentru a păstra parola curentă';

  @override
  String get adminUsersAccountType => 'Tip de cont';

  @override
  String get adminUsersTypeGuest => 'Invitat';

  @override
  String get adminUsersTypeUser => 'Utilizator';

  @override
  String get adminUsersTypeAdmin => 'Administrator';

  @override
  String get adminUsersStatus => 'Stare';

  @override
  String get adminUsersAccountActive => 'Cont activ';

  @override
  String get adminUsersAccountActiveSub =>
      'Conturile dezactivate nu se pot conecta';

  @override
  String get adminUsersLocked => 'Blocat';

  @override
  String get adminUsersLockedSub => 'Împiedică schimbarea parolei';

  @override
  String get adminUsersPermissions => 'Permisiuni';

  @override
  String get adminUsersPermDownload => 'Descărcare';

  @override
  String get adminUsersPermUpdate => 'Actualizare';

  @override
  String get adminUsersPermUpdateSub =>
      'Editează metadatele și elementele din bibliotecă';

  @override
  String get adminUsersPermDelete => 'Ștergere';

  @override
  String get adminUsersPermUpload => 'Încărcare';

  @override
  String get adminUsersPermExplicit => 'Conținut explicit';

  @override
  String get adminUsersLibraryAccess => 'Acces la biblioteci';

  @override
  String get adminUsersAccessAllLibraries => 'Acces la toate bibliotecile';

  @override
  String get adminUsersCreateUser => 'Creează utilizator';

  @override
  String get adminUsersSaveChanges => 'Salvează modificările';

  @override
  String get adminUsersUsernameRequired =>
      'Numele de utilizator este obligatoriu';

  @override
  String get adminUsersPasswordRequired => 'Parola este obligatorie';

  @override
  String get adminUsersUserCreated => 'Utilizator creat';

  @override
  String get adminUsersUserUpdated => 'Utilizator actualizat';

  @override
  String get adminUsersFailedCreate => 'Crearea utilizatorului a eșuat';

  @override
  String get adminUsersFailedUpdate => 'Actualizarea utilizatorului a eșuat';

  @override
  String get adminUsersThisUser => 'acest utilizator';

  @override
  String get adminUsersDeleteUserTitle => 'Ștergi utilizatorul?';

  @override
  String adminUsersDeleteUserContent(String name) {
    return 'Ștergi definitiv pe $name?';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return '$name a fost șters';
  }

  @override
  String get adminUsersFailedDelete => 'Ștergerea utilizatorului a eșuat';

  @override
  String get adminUsersUnlinkOpenId => 'Deconectează OpenID';

  @override
  String get adminUsersUnlinkOpenIdTitle => 'Deconectezi OpenID?';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return 'Elimini conexiunea OpenID pentru $name? Va trebui să se conecteze din nou cu OpenID pentru a o reasocia.';
  }

  @override
  String get adminUsersOpenIdUnlinked => 'OpenID deconectat';

  @override
  String get adminUsersFailedUnlinkOpenId => 'Deconectarea OpenID a eșuat';

  @override
  String adminUsersByAuthor(String author) {
    return 'de $author';
  }

  @override
  String get adminUsersListened => 'Ascultat';

  @override
  String get adminUsersStartedAtPosition => 'Început la poziția';

  @override
  String get adminUsersEndedAtPosition => 'Încheiat la poziția';

  @override
  String get adminUsersTotalDuration => 'Durată totală';

  @override
  String get adminUsersStarted => 'Început';

  @override
  String get adminUsersUpdated => 'Actualizat';

  @override
  String get adminUsersClient => 'Client';

  @override
  String get adminUsersDevice => 'Dispozitiv';

  @override
  String get adminUsersOs => 'SO';

  @override
  String get adminUsersPlayMethod => 'Metodă de redare';

  @override
  String get adminUsersPlayDirect => 'Redare directă';

  @override
  String get adminUsersPlayDirectStream => 'Flux direct';

  @override
  String get adminUsersPlayTranscode => 'Transcodare';

  @override
  String get adminUsersPlayLocal => 'Local';

  @override
  String get adminPodcastsCheckNewEpisodesTitle => 'Caută episoade noi';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      'Aceasta va verifica fluxurile RSS ale tuturor podcasturilor și va descărca episoadele noi găsite (dacă descărcarea automată este activată).';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle =>
      'Scanează fluxul RSS și descarcă episoadele noi';

  @override
  String get adminPodcastsCheck => 'Verifică';

  @override
  String get adminPodcastsCheckingForNew => 'Se caută episoade noi…';

  @override
  String get adminPodcastsCheckingForNewDots => 'Se caută episoade noi...';

  @override
  String get adminPodcastsFailedCheckEpisodes =>
      'Verificarea episoadelor a eșuat';

  @override
  String get adminPodcastsCheckFeedsTooltip =>
      'Verifică fluxurile pentru episoade noi';

  @override
  String get adminPodcastsNoPodcastsYet => 'Încă nu există podcasturi';

  @override
  String get adminPodcastsTapPlusHint =>
      'Atinge + pentru a căuta și adăuga emisiuni';

  @override
  String adminPodcastsEpisodesCount(int count) {
    return '$count episoade';
  }

  @override
  String get adminPodcastsAddPodcast => 'Adaugă podcast';

  @override
  String get adminPodcastsCouldNotFindFeed =>
      'Fluxul podcastului nu a fost găsit';

  @override
  String get adminPodcastsSearchHint => 'Caută podcasturi…';

  @override
  String get adminPodcastsSearchItunesHint => 'Caută în iTunes...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return 'Caută „$query” în iTunes';
  }

  @override
  String get adminPodcastsNoPodcastsFound => 'Nu s-a găsit niciun podcast';

  @override
  String get adminPodcastsRelToday => 'Astăzi';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return 'acum $count săpt.';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return 'acum $count luni';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return 'acum $count ani';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return 'Actualizat $when';
  }

  @override
  String get adminPodcastsGenreAll => 'Toate';

  @override
  String get adminPodcastsGenreArts => 'Arte';

  @override
  String get adminPodcastsGenreComedy => 'Comedie';

  @override
  String get adminPodcastsGenreEducation => 'Educație';

  @override
  String get adminPodcastsGenreTvFilm => 'TV și film';

  @override
  String get adminPodcastsGenreMusic => 'Muzică';

  @override
  String get adminPodcastsGenreNews => 'Știri';

  @override
  String get adminPodcastsGenreReligion => 'Religie';

  @override
  String get adminPodcastsGenreScience => 'Știință';

  @override
  String get adminPodcastsGenreSports => 'Sport';

  @override
  String get adminPodcastsGenreTechnology => 'Tehnologie';

  @override
  String get adminPodcastsGenreBusiness => 'Afaceri';

  @override
  String get adminPodcastsGenreFiction => 'Ficțiune';

  @override
  String get adminPodcastsGenreSocietyCulture => 'Societate și cultură';

  @override
  String get adminPodcastsGenreHealthFitness => 'Sănătate și fitness';

  @override
  String get adminPodcastsGenreTrueCrime => 'Crime reale';

  @override
  String get adminPodcastsGenreHistory => 'Istorie';

  @override
  String get adminPodcastsGenreKidsFamily => 'Copii și familie';

  @override
  String get adminPodcastsPodcastFallback => 'Podcast';

  @override
  String get adminPodcastsEpisodeFallback => 'Episod';

  @override
  String get adminPodcastsNoFeedFound => 'Nu s-a găsit nicio adresă de flux';

  @override
  String get adminPodcastsNoFeedAvailable => 'Nicio adresă de flux disponibilă';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return '$title a fost adăugat în bibliotecă';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return 'Adăugarea $title a eșuat';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    return '$count episoade în flux';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    return '+ încă $count episoade';
  }

  @override
  String get adminPodcastsAdding => 'Se adaugă…';

  @override
  String get adminPodcastsAddToLibrary => 'Adaugă în bibliotecă';

  @override
  String get adminPodcastsRemoveShowTitle => 'Elimini emisiunea?';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return 'Elimini „$title” și toate episoadele ei de pe server? Acțiunea nu poate fi anulată.';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return '„$title” a fost eliminată';
  }

  @override
  String get adminPodcastsFailedRemoveShow => 'Eliminarea emisiunii a eșuat';

  @override
  String get adminPodcastsRemoveShowTooltip => 'Elimină emisiunea';

  @override
  String get adminPodcastsSelectMultipleTooltip => 'Selectează mai multe';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return '$count descărcate';
  }

  @override
  String get adminPodcastsTabDownloaded => 'Descărcate';

  @override
  String get adminPodcastsTabFeed => 'Flux';

  @override
  String get adminPodcastsTabSettings => 'Setări';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return 'Se descarcă „$title”';
  }

  @override
  String get adminPodcastsFailedDownload => 'Descărcarea a eșuat';

  @override
  String get adminPodcastsDeleteEpisodeTitle => 'Ștergi episodul?';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return 'Ștergi „$title”?';
  }

  @override
  String get adminPodcastsDeleted => 'Șters';

  @override
  String get adminPodcastsFailed => 'Eșuat';

  @override
  String get adminPodcastsDeleteEpisodesTitle => 'Ștergi episoadele?';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return 'Ștergi $count episod(e) de pe server?';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return '$count episod(e) șterse';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload =>
      'Răsfoiește fluxul pentru a descărca';

  @override
  String get adminPodcastsDownloadingDots => 'Se descarcă...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return 'Șterge $count episod(e)';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return 'Se descarcă $count episod(e)';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return 'Descarcă $count episod(e)';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter => 'Caută episoade după';

  @override
  String get adminPodcastsSelectDate => 'Selectează data';

  @override
  String get adminPodcastsMaxEpisodes =>
      'Numărul maxim de episoade de descărcat';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return 'Nu s-au găsit episoade noi după $date';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return 'S-au găsit $count episod(e) noi - se descarcă';
  }

  @override
  String get adminPodcastsFailedToCheckNew =>
      'Căutarea episoadelor noi a eșuat';

  @override
  String get adminPodcastsCheckAndDownload => 'Verifică și descarcă';

  @override
  String get adminPodcastsMatchPodcast => 'Potrivește podcastul';

  @override
  String get adminPodcastsMatchPodcastSubtitle =>
      'Caută în iTunes pentru a actualiza coperta și metadatele';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes =>
      'Descarcă automat episoadele noi';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle =>
      'Serverul descarcă automat episoadele noi';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle =>
      'Episoadele noi nu se descarcă automat';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate =>
      'Actualizarea setării de descărcare automată a eșuat';

  @override
  String get adminPodcastsMaxEpisodesToKeep =>
      'Numărul maxim de episoade păstrate';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      '0 păstrează toate episoadele. După descărcarea automată a unui episod nou, Audiobookshelf elimină cel mai vechi episod dacă emisiunea depășește această limită.';

  @override
  String get adminPodcastsNoEpisodeLimit => 'Fără limită';

  @override
  String get adminPodcastsEpisodeLimitInvalid =>
      'Introdu 0 sau un număr întreg';

  @override
  String get adminPodcastsCheckSchedule => 'Program de verificare';

  @override
  String get adminPodcastsFrequency => 'Frecvență';

  @override
  String get adminPodcastsFreqHourly => 'La fiecare oră';

  @override
  String get adminPodcastsFreqDaily => 'Zilnic';

  @override
  String get adminPodcastsFreqWeekly => 'Săptămânal';

  @override
  String get adminPodcastsDay => 'Zi';

  @override
  String get adminPodcastsTime => 'Oră';

  @override
  String get adminPodcastsDaySun => 'Dum';

  @override
  String get adminPodcastsDayMon => 'Lun';

  @override
  String get adminPodcastsDayTue => 'Mar';

  @override
  String get adminPodcastsDayWed => 'Mie';

  @override
  String get adminPodcastsDayThu => 'Joi';

  @override
  String get adminPodcastsDayFri => 'Vin';

  @override
  String get adminPodcastsDaySat => 'Sâm';

  @override
  String get adminPodcastsFeedUrl => 'Adresa fluxului';

  @override
  String get adminPodcastsBack => 'Înapoi';

  @override
  String get adminPodcastsRootOnly => 'Doar root';

  @override
  String get adminPodcastsDeleting => 'Se șterge...';

  @override
  String get adminPodcastsDeleteEpisode => 'Șterge episodul';

  @override
  String adminPodcastsSeasonChip(String season) {
    return 'Sezonul $season';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return 'Ep. $number';
  }

  @override
  String get adminPodcastsApplyingMatch => 'Se aplică potrivirea...';

  @override
  String get adminPodcastsNoResults => 'Niciun rezultat';

  @override
  String get adminPodcastsPodcastMatched =>
      'Podcastul a fost potrivit și actualizat';

  @override
  String get adminPodcastsFailedMatch => 'Potrivirea podcastului a eșuat';

  @override
  String get adminPodcastsSelectAll => 'Selectează tot';

  @override
  String get adminPodcastsSelectAllNew => 'Doar cele noi';

  @override
  String get adminPodcastsSortNewestFirst => 'Cele mai noi mai întâi';

  @override
  String get adminPodcastsSortOldestFirst => 'Cele mai vechi mai întâi';

  @override
  String get adminPodcastsEditInfo => 'Editează informațiile';

  @override
  String get adminPodcastsEditInfoSubtitle =>
      'Schimbă titlul, descrierea, coperta și altele';

  @override
  String get adminPodcastsEditTitle => 'Editează podcastul';

  @override
  String get adminPodcastsReleaseDate => 'Data lansării';

  @override
  String get adminPodcastsExplicit => 'Explicit';

  @override
  String get adminPodcastsExplicitSubtitle =>
      'Marchează acest podcast ca explicit';

  @override
  String get episodeListEpisodeFallback => 'Episod';

  @override
  String get episodeListUnknownPodcast => 'Podcast necunoscut';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de episoade marcate ca terminate',
      few: '$count episoade marcate ca terminate',
      one: '1 episod marcat ca terminat',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de episoade marcate ca neterminate',
      few: '$count episoade marcate ca neterminate',
      one: '1 episod marcat ca neterminat',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes =>
      'Dezabonează-te de la episoadele noi';

  @override
  String get episodeListSubscribeToNewEpisodes =>
      'Abonează-te la episoadele noi';

  @override
  String get episodeListSubscribeTitle => 'Te abonezi la acest podcast?';

  @override
  String get episodeListSubscribeContent =>
      'Episoadele noi vor fi descărcate automat și adăugate în coada ta Absorbing când apar pe server.';

  @override
  String get episodeListSubscribe => 'Abonează-te';

  @override
  String get episodeListShowFinishedEpisodes => 'Arată episoadele terminate';

  @override
  String get episodeListHideFinishedEpisodes => 'Ascunde episoadele terminate';

  @override
  String get episodeListShowSettings => 'Arată setările';

  @override
  String get episodeListPlaysNewerToOlder =>
      'Redă de la episoadele mai noi la cele mai vechi';

  @override
  String get episodeListPlaysOlderToNewer =>
      'Redă de la episoadele mai vechi la cele mai noi';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de episoade',
      few: '$count episoade',
      one: '1 episod',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de neterminate',
      few: '$count neterminate',
      one: '1 neterminat',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => 'Descărcare automată';

  @override
  String get episodeListSubscribedChip => 'Abonat';

  @override
  String get episodeListExplicitChip => 'Explicit';

  @override
  String get episodeListSortNewest => 'Cele mai noi';

  @override
  String get episodeListSortOldest => 'Cele mai vechi';

  @override
  String get episodeListSortBy => 'Sortează episoadele';

  @override
  String get episodeListSortPubDate => 'Data publicării';

  @override
  String get episodeListSortTitle => 'Titlu';

  @override
  String get episodeListSortSeason => 'Sezon';

  @override
  String get episodeListSortEpisode => 'Număr episod';

  @override
  String get episodeListSortFileName => 'Nume fișier';

  @override
  String get episodeListSortReverseHint =>
      'Atinge din nou pentru a inversa ordinea';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return '„$title” a fost adăugat în Absorbing';
  }

  @override
  String get episodeDetailEpisodeFallback => 'Episod';

  @override
  String get episodeDetailMarkedNotFinished => 'Marcat ca neterminat';

  @override
  String get episodeDetailMarkedFinishedNice => 'Marcat ca terminat - bravo!';

  @override
  String get episodeDetailMarkAbsorbedContent =>
      'Progresul tău pentru acest episod va fi setat la 100%.';

  @override
  String get episodeDetailResetProgressContent =>
      'Aceasta va șterge tot progresul pentru acest episod și îl va readuce la început. Acțiunea nu poate fi anulată.';

  @override
  String get episodeDetailToday => 'Astăzi';

  @override
  String get episodeDetailYesterday => 'Ieri';

  @override
  String episodeDetailDaysAgo(int count) {
    return 'acum $count z.';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return 'acum $count săpt.';
  }

  @override
  String episodeDetailDurationHm(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String episodeDetailDurationM(int minutes) {
    return '$minutes min';
  }

  @override
  String get episodeDetailResume => 'Reia';

  @override
  String get episodeDetailPlayEpisode => 'Redă episodul';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return 'Episodul $number';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return 'Sezonul $number';
  }

  @override
  String get editMetadataUpdatedFromMatch =>
      'Metadate actualizate din potrivire';

  @override
  String editMetadataConfirmMatch(String title) {
    return 'Aceasta va actualiza metadatele de pe server pentru această carte folosind:\n\n„$title”\n\nToate câmpurile și coperta vor fi suprascrise pe server.';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return 'Aceasta va actualiza metadatele de pe server pentru această carte folosind:\n\n„$title” de $author\n\nToate câmpurile și coperta vor fi suprascrise pe server.';
  }

  @override
  String get seriesBooksFindMissingTitle => 'Găsește cărțile lipsă';

  @override
  String get seriesBooksFindMissingContent =>
      'Aceasta caută în Audible cărți din această serie care ar putea lipsi din biblioteca ta.\n\nCărțile sunt potrivite mai întâi după ASIN (dacă serverul tău are ASIN-uri pentru cărți), apoi după titlu. Rezultatele pot să nu fie perfect exacte.';

  @override
  String get seriesBooksCouldNotFindOnAudible =>
      'Această serie nu a fost găsită în Audible';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Aceasta va șterge starea „terminat” pentru toate cele $count de cărți din această serie.',
      few:
          'Aceasta va șterge starea „terminat” pentru toate cele $count cărți din această serie.',
      one:
          'Aceasta va șterge starea „terminat” pentru cartea din această serie.',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Aceasta va marca drept terminate toate cele $count de cărți din această serie.',
      few:
          'Aceasta va marca drept terminate toate cele $count cărți din această serie.',
      one: 'Aceasta va marca drept terminată cartea din această serie.',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => 'Demarchează tot';

  @override
  String get seriesBooksShowAllBooks => 'Arată toate cărțile';

  @override
  String get seriesBooksGroupBySubSeries => 'Grupează pe subserii';

  @override
  String get seriesBooksLoadingSubSeries => 'Se încarcă subseriile...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți',
      few: '$count cărți',
      one: '1 carte',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => 'Gata';

  @override
  String get seriesBooksExplicitBadge => 'E';

  @override
  String get expandedCardStreaming => 'Flux în direct';

  @override
  String get expandedCardDeviceFallback => 'Dispozitiv';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$position în $bookTitle';
  }

  @override
  String get bookmarksScreenClose => 'Închide';

  @override
  String get bookmarksScreenSortNewest => 'Cele mai noi';

  @override
  String get bookmarksScreenSortPosition => 'Poziție';

  @override
  String statsScreenStreakDays(int count) {
    return '$count z';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count sesiune';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count sesiuni';
  }

  @override
  String get statsScreenDayMon => 'Lun';

  @override
  String get statsScreenDayTue => 'Mar';

  @override
  String get statsScreenDayWed => 'Mie';

  @override
  String get statsScreenDayThu => 'Joi';

  @override
  String get statsScreenDayFri => 'Vin';

  @override
  String get statsScreenDaySat => 'Sâm';

  @override
  String get statsScreenDaySun => 'Dum';

  @override
  String statsScreenDurationHm(int h, int m) {
    return '$h h $m min';
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
    return '$h h';
  }

  @override
  String statsScreenDurationShortM(int m) {
    return '$m min';
  }

  @override
  String get statsScreenCouldNotLoadItem => 'Elementul nu a putut fi încărcat';

  @override
  String get statsScreenCouldNotFindEpisode => 'Episodul nu a fost găsit';

  @override
  String statsScreenByAuthor(String author) {
    return 'de $author';
  }

  @override
  String get statsScreenListened => 'Ascultat';

  @override
  String get sessionEditTitle => 'Editează sesiunea';

  @override
  String get sessionDayLabel => 'Zi';

  @override
  String get sessionEndPosition => 'Poziția de final';

  @override
  String get sessionEndPositionHint =>
      'Modificarea ei poate actualiza și progresul tău curent.';

  @override
  String get statsViewSessions => 'Vezi sesiunile';

  @override
  String statsSessionsForDate(String date) {
    return 'Sesiuni pentru $date';
  }

  @override
  String get statsNoSessionsForDate =>
      'Nu s-a găsit nicio sesiune de ascultare pentru această zi';

  @override
  String get statsSearchSessions => 'Caută în sesiuni';

  @override
  String get statsNoSessionSearchResults =>
      'Nicio sesiune nu se potrivește căutării';

  @override
  String get statsSessionsLoadFailed =>
      'Sesiunile pentru această zi nu au putut fi încărcate';

  @override
  String get sessionDeleteConfirmTitle => 'Ștergi sesiunea?';

  @override
  String get sessionDeleteConfirmBody =>
      'Aceasta elimină sesiunea și scade totalurile de ascultare cu durata ei. Acțiunea nu poate fi anulată.';

  @override
  String get sessionSaved => 'Sesiune actualizată';

  @override
  String get sessionDeleted => 'Sesiune ștearsă';

  @override
  String get sessionSaveFailed => 'Modificările nu au putut fi salvate';

  @override
  String get sessionDeleteFailed => 'Această sesiune nu a putut fi ștearsă';

  @override
  String get statsScreenStartedAtPosition => 'Început la poziția';

  @override
  String get statsScreenEndedAtPosition => 'Încheiat la poziția';

  @override
  String get statsScreenTotalDuration => 'Durată totală';

  @override
  String get statsScreenStarted => 'Început';

  @override
  String get statsScreenUpdated => 'Actualizat';

  @override
  String get statsScreenClient => 'Client';

  @override
  String get statsScreenDevice => 'Dispozitiv';

  @override
  String get statsScreenOs => 'SO';

  @override
  String get statsScreenPlayMethod => 'Metodă de redare';

  @override
  String get statsScreenLoading => 'Se încarcă...';

  @override
  String get statsScreenJumpToStart => 'Sari la început';

  @override
  String get statsScreenJumpToEnd => 'Sari la final';

  @override
  String get statsScreenPlayMethodDirect => 'Redare directă';

  @override
  String get statsScreenPlayMethodDirectStream => 'Flux direct';

  @override
  String get statsScreenPlayMethodTranscode => 'Transcodare';

  @override
  String get statsScreenPlayMethodLocal => 'Local';

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
    return '$day $month $year, $hour:$minute $ampm';
  }

  @override
  String get statsScreenMonthJan => 'ian.';

  @override
  String get statsScreenMonthFeb => 'feb.';

  @override
  String get statsScreenMonthMar => 'mar.';

  @override
  String get statsScreenMonthApr => 'apr.';

  @override
  String get statsScreenMonthMay => 'mai';

  @override
  String get statsScreenMonthJun => 'iun.';

  @override
  String get statsScreenMonthJul => 'iul.';

  @override
  String get statsScreenMonthAug => 'aug.';

  @override
  String get statsScreenMonthSep => 'sept.';

  @override
  String get statsScreenMonthOct => 'oct.';

  @override
  String get statsScreenMonthNov => 'nov.';

  @override
  String get statsScreenMonthDec => 'dec.';

  @override
  String get upcomingReleasesTitle => 'Apariții viitoare';

  @override
  String get upcomingReleasesRescanTitle => 'Scanezi din nou?';

  @override
  String upcomingReleasesRescanContent(int days) {
    return 'Aceste rezultate au $days zile. Datele de apariție s-ar putea să se fi schimbat - vrei să scanezi din nou?';
  }

  @override
  String get upcomingReleasesNotNow => 'Nu acum';

  @override
  String get upcomingReleasesRescan => 'Scanează din nou';

  @override
  String get upcomingReleasesRescanReleaseDate => 'Rescanează data apariției';

  @override
  String get upcomingReleasesRescanning => 'Se rescanează...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return 'Actualizat - $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound =>
      'Nu s-a găsit nicio dată de apariție';

  @override
  String get upcomingReleasesRescanFailed => 'Rescanarea a eșuat';

  @override
  String get upcomingReleasesRemoveFromList => 'Elimină din listă';

  @override
  String get upcomingReleasesRemovedFromList => 'Eliminat din listă';

  @override
  String get upcomingReleasesDateChip => 'Dată';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return 'Se verifică $name... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => 'Se încarcă seriile...';

  @override
  String get upcomingReleasesScannedToday => '(scanat astăzi)';

  @override
  String get upcomingReleasesScannedYesterday => '(scanat ieri)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '(scanat acum $days zile)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return '$count viitoare';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return '$count recente';
  }

  @override
  String get upcomingReleasesNoneFound =>
      'Nu s-au găsit apariții viitoare sau recente';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$summary din $count serii';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return 'S-au verificat $count serii în Audible';
  }

  @override
  String upcomingReleasesDateFormat(String month, int day, int year) {
    return '$day $month $year';
  }

  @override
  String upcomingReleasesSequenceLabel(String sequence) {
    return '#$sequence';
  }

  @override
  String get upcomingReleasesBadgeUpcoming => 'VIITOR';

  @override
  String get upcomingReleasesBadgeAdded => 'ADĂUGAT';

  @override
  String get upcomingReleasesBadgeMissing => 'LIPSĂ';

  @override
  String get upcomingReleasesScanSettingsTitle => 'Setări de scanare';

  @override
  String get upcomingReleasesFinishedAfterTitle =>
      'Consideră o serie încheiată după';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      'Seriile a căror ultimă carte este mai veche de atât sunt omise la scanări și reverificate doar la una-două luni.';

  @override
  String upcomingReleasesFinishedAfterYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de ani',
      few: '$count ani',
      one: '1 an',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesFinishedAfterNever => 'Niciodată';

  @override
  String get upcomingReleasesSkippedTitle => 'Serii omise';

  @override
  String get upcomingReleasesSkippedNone => 'Încă nu s-a omis nimic';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de omise',
      few: '$count omise',
      one: '1 omisă',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ultima carte are $count de ani',
      few: 'Ultima carte are $count ani',
      one: 'Ultima carte are 1 an',
      zero: 'Ultima carte are sub un an',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched =>
      'Această serie nu a putut fi potrivită în Audible';

  @override
  String get upcomingReleasesSkippedScanNow => 'Scanează acum';

  @override
  String get upcomingReleasesSkippedAlwaysScan => 'Scanează mereu';

  @override
  String get upcomingReleasesSkippedNeverScan => 'Nu scana niciodată';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return 'S-au găsit apariții noi în $name';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return 'Nimic nou în $name';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary =>
      'Această listă provine dintr-o altă bibliotecă. Rulează o rescanare pentru a o reîmprospăta.';

  @override
  String get upcomingReleasesChipUpcoming => 'Viitoare';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lipsă',
      few: '$count lipsă',
      one: '1 lipsă',
      zero: 'Lipsă',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => 'Nu s-au găsit cărți lipsă';

  @override
  String get upcomingReleasesScanSeries => 'Scanează seriile';

  @override
  String get upcomingReleasesScanUpcomingOption => 'Apariții viitoare';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc =>
      'Scanare rapidă pentru cărți noi și viitoare';

  @override
  String get upcomingReleasesScanDeepOption => 'Scanare amănunțită';

  @override
  String get upcomingReleasesScanDeepOptionDesc =>
      'Găsește și cărțile lipsă din fiecare serie - durează mai mult';

  @override
  String get upcomingReleasesFirstScanNote =>
      'Prima scanare verifică fiecare serie în Audible și poate dura câteva minute. Scanările următoare sunt mult mai rapide odată ce seriile sunt sortate.';

  @override
  String get upcomingReleasesLastScanReport => 'Raportul ultimei scanări';

  @override
  String upcomingReleasesReportChecked(int count) {
    return 'Verificate în Audible: $count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return 'Omise: $count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return 'Nepotrivite în Audible: $count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return 'Verificare eșuată: $count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return 'S-au găsit $upcoming viitoare, $recent recente';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return 'S-au găsit $upcoming viitoare, $recent recente, $missing lipsă';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return '+$count în plus';
  }

  @override
  String get upcomingReleasesBadgeNew => 'NOU';

  @override
  String get upcomingReleasesOpenLibrarySeries =>
      'Deschide seria în bibliotecă';

  @override
  String get upcomingReleasesAsinCopied => 'ASIN-ul seriei a fost copiat';

  @override
  String get upcomingReleasesSetSeriesAsin => 'Setează ASIN-ul seriei';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      'Găsește seria pe audible.com și copiază linkul paginii - ASIN-ul este codul de 10 caractere care începe cu B0 (de exemplu B08S2YN3YS). Merge și lipirea întregului link.';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… sau link audible.com';

  @override
  String get upcomingReleasesSetAsinSave => 'Salvează';

  @override
  String get upcomingReleasesSetAsinInvalid =>
      'Nu s-a găsit niciun ASIN în acel text';

  @override
  String get upcomingReleasesSetAsinSaved =>
      'Serie asociată - se scanează acum';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Elimină $count de cărți',
      few: 'Elimină $count cărți',
      one: 'Elimină cartea',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => 'Elimină din această scanare';

  @override
  String get upcomingReleasesRemoveThisScanDesc =>
      'Poate reapărea la o scanare viitoare';

  @override
  String get upcomingReleasesRemoveForever =>
      'Elimină din această scanare și din cele viitoare';

  @override
  String get upcomingReleasesRemoveForeverDesc =>
      'Ajunge în lista eliminatelor, o poți restaura oricând';

  @override
  String get upcomingReleasesRemovedForeverToast =>
      'Eliminat - nu va apărea la scanările viitoare';

  @override
  String get upcomingReleasesRemovedBooksTitle => 'Cărți eliminate';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți',
      few: '$count cărți',
      one: '1 carte',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => 'Nicio carte eliminată';

  @override
  String get upcomingReleasesRestore => 'Restaurează';

  @override
  String get upcomingReleasesRestoredToast => 'Restaurat';

  @override
  String get upcomingReleasesRestoredNextScan =>
      'Restaurat - va apărea după următoarea scanare';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de selectate',
      few: '$count selectate',
      one: '1 selectată',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => 'Solicită';

  @override
  String get upcomingReleasesBulkRemove => 'Elimină';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de eliminate',
      few: '$count eliminate',
      one: '1 eliminată',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de solicitări trimise',
      few: '$count solicitări trimise',
      one: '1 solicitare trimisă',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return '$count omise';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de serii rescanate',
      few: '$count serii rescanate',
      one: '1 serie rescanată',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return '$count cu cărți noi';
  }

  @override
  String get seriesExcludeFromScan => 'Exclude din scanarea seriilor';

  @override
  String get seriesIncludeInScan => 'Include în scanarea seriilor';

  @override
  String get homeScreenEpisodeFallback => 'Episod';

  @override
  String get libraryScreenUnknownTitle => 'Titlu necunoscut';

  @override
  String get playlistDetailDefaultName => 'Listă de redare';

  @override
  String playlistDetailItemCount(int count) {
    return '$count elemente';
  }

  @override
  String get playlistDetailUnfinished => 'Neterminate';

  @override
  String get playlistDetailRemoveFromPlaylist => 'Elimină din lista de redare';

  @override
  String get playlistDetailDone => 'Gata';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return '$count elemente marcate ca terminate';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return '$count elemente marcate ca neterminate';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return '$count elemente eliminate';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return '„$title” a fost adăugat în Absorbing';
  }

  @override
  String get collectionDetailDefaultName => 'Colecție';

  @override
  String smartScopeBookCount(int count) {
    return 'Smart Scope · cărți: $count';
  }

  @override
  String get smartScopeNew => 'Smart Scope nou';

  @override
  String get smartScopeNewSubtitle =>
      'Salvează un set de filtre ca o listă care se actualizează singură';

  @override
  String get smartScopeEditTitle => 'Editează Smart Scope';

  @override
  String get smartScopeIcon => 'Pictogramă';

  @override
  String get smartScopePublic => 'Vizibil pentru toți utilizatorii';

  @override
  String get smartScopeKobo => 'Sincronizează cu Kobo';

  @override
  String get smartScopeRules => 'Reguli';

  @override
  String get smartScopeMatchAll => 'Toate se potrivesc';

  @override
  String get smartScopeMatchAny => 'Oricare se potrivește';

  @override
  String get smartScopeAddRule => 'Adaugă regulă';

  @override
  String get smartScopeAddGroup => 'Adaugă grup';

  @override
  String get smartScopeGroup => 'Grup';

  @override
  String get smartScopeStartFrom => 'Pornește de la';

  @override
  String get smartScopeFromScratch => 'Creează de la zero';

  @override
  String get smartScopeTplHasSeries => 'Are o serie';

  @override
  String get smartScopeTplRecent => 'Adăugate recent';

  @override
  String get smartScopeTplPdf => 'Doar PDF';

  @override
  String get smartScopeTplNoGenres => 'Fără genuri';

  @override
  String get smartScopeTplEpub => 'Doar EPUB';

  @override
  String get smartScopeCounting => 'Se numără...';

  @override
  String get smartScopeSort => 'Sortare implicită';

  @override
  String get smartScopeAddSort => 'Adaugă nivel de sortare';

  @override
  String get smartScopeSortNone =>
      'Nicio sortare setată, deci cărțile se sortează după titlu.';

  @override
  String get smartScopeAscending => 'Crescător';

  @override
  String get smartScopeDescending => 'Descrescător';

  @override
  String get smartScopeDelete => 'Șterge Smart Scope';

  @override
  String get smartScopeSaveFailed => 'Smart Scope nu a putut fi salvat';

  @override
  String get smartScopeDeleteFailed => 'Smart Scope nu a putut fi șters';

  @override
  String get smartScopeLoadFailed => 'Smart Scope nu a putut fi încărcat';

  @override
  String get smartScopeUnsupportedRule =>
      'Această regulă poate fi modificată doar în interfața web BookOrbit. Rămâne neschimbată.';

  @override
  String get smartScopeAnd => 'și';

  @override
  String get smartScopeDays => 'zile';

  @override
  String get smartScopeWeeks => 'săptămâni';

  @override
  String get smartScopeMonths => 'luni';

  @override
  String get smartScopePickDate => 'Alege o dată';

  @override
  String get smartScopeAddValue => 'Adaugă o valoare';

  @override
  String get smartScopeValue => 'Valoare';

  @override
  String get smartScopeCustomFields => 'Câmpuri personalizate';

  @override
  String get smartScopeAnyProvider => 'Orice furnizor';

  @override
  String get smartScopeScoreOutstanding => 'Excelent';

  @override
  String get smartScopeScoreGood => 'Bun';

  @override
  String get smartScopeScoreFair => 'Acceptabil';

  @override
  String get smartScopeScorePoor => 'Slab';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => 'Cel mult 20 de valori';

  @override
  String get scopeFieldTitle => 'Titlu';

  @override
  String get scopeFieldAuthor => 'Autor';

  @override
  String get scopeFieldSeries => 'Serie';

  @override
  String get scopeFieldSeriesIndex => 'Numărul în serie';

  @override
  String get scopeFieldGenre => 'Gen';

  @override
  String get scopeFieldTag => 'Etichetă';

  @override
  String get scopeFieldReadStatus => 'Stare citire';

  @override
  String get scopeFieldReadProgress => 'Progres citire';

  @override
  String get scopeFieldRating => 'Nota ta';

  @override
  String get scopeFieldFormat => 'Format';

  @override
  String get scopeFieldLibrary => 'Bibliotecă';

  @override
  String get scopeFieldCollection => 'Colecție';

  @override
  String get scopeFieldPublisher => 'Editură';

  @override
  String get scopeFieldLanguage => 'Limbă';

  @override
  String get scopeFieldPublishedDate => 'Data publicării';

  @override
  String get scopeFieldPublishedYear => 'Anul publicării';

  @override
  String get scopeFieldAddedAt => 'Data adăugării';

  @override
  String get scopeFieldStartedAt => 'Data începerii';

  @override
  String get scopeFieldFinishedAt => 'Data terminării';

  @override
  String get scopeFieldPageCount => 'Număr de pagini';

  @override
  String get scopeFieldFileSize => 'Dimensiune fișier';

  @override
  String get scopeFieldCommunityRating => 'Nota comunității';

  @override
  String get scopeFieldCommunityRatingCount =>
      'Număr de recenzii din comunitate';

  @override
  String get scopeFieldMetadataScore => 'Scor metadate';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => 'Descriere';

  @override
  String get scopeFieldCover => 'Copertă';

  @override
  String get scopeFieldAudioCover => 'Coperta cărții audio';

  @override
  String get scopeFieldFileAvailability => 'Disponibilitate fișier';

  @override
  String get scopeFieldLockStatus => 'Stare blocare';

  @override
  String get scopeFieldSeriesStatus => 'Stare serie';

  @override
  String get scopeSortUpdatedAt => 'Data actualizării';

  @override
  String get scopeSortLastReadAt => 'Ultima citire';

  @override
  String get scopeSortRandom => 'Aleatoriu';

  @override
  String get scopeOpContains => 'conține';

  @override
  String get scopeOpNotContains => 'nu conține';

  @override
  String get scopeOpStartsWith => 'începe cu';

  @override
  String get scopeOpEndsWith => 'se termină cu';

  @override
  String get scopeOpEq => 'este';

  @override
  String get scopeOpNotEq => 'nu este';

  @override
  String get scopeOpIsEmpty => 'este gol';

  @override
  String get scopeOpIsNotEmpty => 'nu este gol';

  @override
  String get scopeOpGt => 'mai mare decât';

  @override
  String get scopeOpGte => 'cel puțin';

  @override
  String get scopeOpLt => 'mai mic decât';

  @override
  String get scopeOpLte => 'cel mult';

  @override
  String get scopeOpBetween => 'între';

  @override
  String get scopeOpIncludesAny => 'include oricare dintre';

  @override
  String get scopeOpIncludesAll => 'include toate';

  @override
  String get scopeOpExcludesAll => 'exclude toate';

  @override
  String get scopeOpBefore => 'înainte de';

  @override
  String get scopeOpAfter => 'după';

  @override
  String get scopeOpWithinLast => 'în ultimele';

  @override
  String get scopeOpIsMissing => 'lipsește';

  @override
  String get scopeOpIsPresent => 'este prezent';

  @override
  String get scopeOpIsUnread => 'este necitit';

  @override
  String get scopeOpIsInProgress => 'este în curs';

  @override
  String get scopeOpIsFinished => 'este terminat';

  @override
  String get scopeOpIsLocked => 'este blocat';

  @override
  String get scopeOpIsUnlocked => 'este deblocat';

  @override
  String get scopeOpIsUpNext => 'este următorul';

  @override
  String get scopeOpIsTrue => 'este da';

  @override
  String get scopeOpIsFalse => 'este nu';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți se potrivesc',
      few: '$count cărți se potrivesc',
      one: '1 carte se potrivește',
      zero: 'Nicio carte nu se potrivește',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return 'Ștergi „$name”? Acțiunea nu poate fi anulată.';
  }

  @override
  String collectionDetailBookCount(int count) {
    return '$count cărți';
  }

  @override
  String get collectionDetailDone => 'Gata';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return '„$title” a fost adăugat în Absorbing';
  }

  @override
  String get audibleSeriesNoBooksFound => 'Nu s-au găsit cărți în Audible';

  @override
  String get audibleSeriesFailedToLoad =>
      'Seria nu a putut fi încărcată din Audible';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return '$total în Audible · $missing lipsă';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return '$total în Audible · $missing lipsă · $upcoming viitoare';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return 'Lipsă ($count)';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return 'Viitoare ($count)';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return 'Toate ($count)';
  }

  @override
  String get audibleSeriesSearching => 'Se caută în Audible...';

  @override
  String get audibleSeriesCompleteSeries => 'Ai seria completă!';

  @override
  String get audibleSeriesNoUpcoming => 'Nu s-au găsit apariții viitoare';

  @override
  String get audibleSeriesUpcomingBadge => 'VIITOR';

  @override
  String get audibleSeriesAbridged => 'Prescurtat';

  @override
  String get audibleSeriesRegionTitle => 'Regiune Audible';

  @override
  String get audibleSeriesOpenOnAudible => 'Deschide în Audible';

  @override
  String get audibleSeriesAddToCalendar => 'Adaugă în calendar';

  @override
  String get audibleSeriesAddToUpcoming => 'Adaugă la aparițiile viitoare';

  @override
  String get audibleSeriesAddedToUpcoming => 'Adăugat la aparițiile viitoare';

  @override
  String get audibleSeriesAlreadyInUpcoming =>
      'Deja în pagina aparițiilor viitoare';

  @override
  String get audibleSeriesCouldNotOpenAudible =>
      'Audible nu a putut fi deschis';

  @override
  String get audibleSeriesCouldNotOpenCalendar =>
      'Calendarul nu a putut fi deschis';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return 'Apariție nouă de carte audio în seria $seriesName';
  }

  @override
  String get authorBooksGroupBySeries => 'Grupează pe serii';

  @override
  String get authorBooksList => 'Listă';

  @override
  String get authorBooksGrid => 'Grilă';

  @override
  String authorBooksBookCount(int count) {
    return '$count cărți';
  }

  @override
  String get metadataLookupCover => 'Copertă';

  @override
  String get metadataLookupChooseFields => 'Alege câmpurile de aplicat';

  @override
  String metadataLookupApplyFields(int count) {
    return 'Aplică $count câmpuri';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return '$count câmpuri salvate local';
  }

  @override
  String get metadataLookupOverrideLocalDisplay => 'Suprascrie afișarea locală';

  @override
  String get equalizerPresetFlat => 'Plat';

  @override
  String get equalizerPresetVoiceBoost => 'Voce amplificată';

  @override
  String get equalizerPresetBassBoost => 'Bași amplificați';

  @override
  String get equalizerPresetTrebleBoost => 'Înalte amplificate';

  @override
  String get equalizerPresetPodcast => 'Podcast';

  @override
  String get equalizerPresetAudiobook => 'Carte audio';

  @override
  String get equalizerPresetReduceNoise => 'Reducere zgomot';

  @override
  String get equalizerPresetLoudness => 'Intensitate';

  @override
  String equalizerEditingSavedNamed(String title) {
    return 'Se editează egalizatorul salvat pentru „$title”';
  }

  @override
  String get equalizerEditingSavedGeneric => 'Se editează egalizatorul salvat';

  @override
  String get equalizerPerBookEq => 'Egalizator per carte';

  @override
  String get notesDeleteNoteQuestion => 'Ștergi notița?';

  @override
  String notesDeleteNoteContent(String title) {
    return 'Ștergi „$title”?';
  }

  @override
  String get notesExport => 'Exportă';

  @override
  String get notesNewNote => 'Notiță nouă';

  @override
  String get librarySortFilterUpcomingReleases => 'Scanează seriile';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle =>
      'Preia o fotografie și o biografie pentru fiecare autor de la furnizorul de metadate';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle =>
      'Caută în Audible cărți viitoare și lipsă din seriile tale';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de capitole rămase',
      few: '$count capitole rămase',
      one: '1 capitol rămas',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetAddMinutesChip(int minutes) {
    return '+$minutes min';
  }

  @override
  String sleepTimerSheetAddChaptersChip(int count) {
    return '+$count cap.';
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
      other: '$count de capitole',
      few: '$count capitole',
      one: '1 capitol',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetChaptersChip(int count) {
    return '$count cap.';
  }

  @override
  String sleepTimerSheetStartChapterSleep(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Oprire după $count de capitole',
      few: 'Oprire după $count capitole',
      one: 'Oprire după 1 capitol',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => 'Derulează înapoi la oprire';

  @override
  String get sleepTimerSheetShake => 'Scuturare';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return 'Adaugă $minutes min';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => 'Adaugă 1 capitol';

  @override
  String get sleepTimerSheetResetsToFull => 'Revine la durata completă';

  @override
  String get sleepTimerSheetTabSpecificChapter => 'Capitol';

  @override
  String get sleepTimerSheetSpecificNoChapters =>
      'Nu sunt capitole disponibile';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return 'Capitolul $number';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => 'trecut';

  @override
  String get sleepTimerSheetSpecificStart => 'Începutul capitolului';

  @override
  String get sleepTimerSheetSpecificEnd => 'Sfârșitul capitolului';

  @override
  String get sleepTimerSheetSpecificEndsAt =>
      'Temporizatorul de somn se va încheia la';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return 'în $countdown';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed =>
      'Acest punct a trecut deja';

  @override
  String get sleepTimerSheetSpecificStartButton => 'Pornește temporizatorul';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => 'Deja trecut';

  @override
  String get timeAm => 'AM';

  @override
  String get timePm => 'PM';

  @override
  String get collectionPickerCollectionFallback => 'Colecție';

  @override
  String collectionPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get playlistPickerPlaylistFallback => 'Listă de redare';

  @override
  String playlistPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get cardChaptersPlayFromChapterTitle => 'Redai de la capitol?';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return 'Începi redarea de la „$title”?';
  }

  @override
  String get cardChaptersPlay => 'Redă';

  @override
  String get absorbingSharedToday => 'Astăzi';

  @override
  String get absorbingSharedYesterday => 'Ieri';

  @override
  String get absorbingSharedMonday => 'Luni';

  @override
  String get absorbingSharedTuesday => 'Marți';

  @override
  String get absorbingSharedWednesday => 'Miercuri';

  @override
  String get absorbingSharedThursday => 'Joi';

  @override
  String get absorbingSharedFriday => 'Vineri';

  @override
  String get absorbingSharedSaturday => 'Sâmbătă';

  @override
  String get absorbingSharedSunday => 'Duminică';

  @override
  String get absorbingSharedAm => 'AM';

  @override
  String get absorbingSharedPm => 'PM';

  @override
  String sectionDetailAddedToAbsorbing(String title) {
    return '„$title” a fost adăugat în Absorbing';
  }

  @override
  String get sectionDetailDoneBadge => 'Gata';

  @override
  String get homeCustomizeAddGenreTitle => 'Adaugă secțiune de gen';

  @override
  String get homeCustomizeAddGenreSubtitle =>
      'Alege un gen de afișat pe ecranul principal';

  @override
  String get homeSectionDoneBadge => 'Gata';

  @override
  String get tipsSheetQuickBookmarksTitle => 'Marcaje rapide';

  @override
  String get tipsSheetQuickBookmarksDesc =>
      'Apasă lung butonul de marcaj de pe orice card pentru a plasa instant un marcaj la poziția curentă, fără a deschide foaia de marcaje.';

  @override
  String get tipsSheetCoverPlayPauseTitle => 'Redare/pauză din copertă';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      'Atinge coperta de pe orice card pentru a reda sau a pune pe pauză. Îl poți activa sau dezactiva în Setări, la Carduri Absorbing. O pictogramă de pauză discretă apare în timpul redării, ca să știi că poți atinge.';

  @override
  String get tipsSheetFullScreenPlayerTitle => 'Player pe ecran complet';

  @override
  String get tipsSheetFullScreenPlayerDesc =>
      'Glisează în sus pe orice card Absorbing pentru a deschide playerul pe ecran complet. Glisează în jos pentru a-l închide.';

  @override
  String get tipsSheetQuickAddAbsorbingTitle => 'Adăugare rapidă în Absorbing';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      'Glisează la dreapta pe orice carte dintr-o listă (serie, autor, rezultate de căutare) pentru a o adăuga instant în coada ta Absorbing.';

  @override
  String get tipsSheetShakeExtendSleepTitle =>
      'Scuturare pentru prelungirea somnului';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      'Dacă ai un temporizator de somn pornit și scuturi telefonul, se adaugă minute în plus. Setezi cantitatea în Setări, la Temporizator de somn.';

  @override
  String get tipsSheetSeriesNavigationTitle => 'Navigare în serie';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      'Atinge numele seriei în fereastra de detalii a oricărei cărți pentru a vedea toate cărțile din serie, în ordinea citirii, cu insigne de număr pe fiecare copertă.';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => 'Glisare între cărți';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      'Glisează la stânga și la dreapta pe ecranul Absorbing pentru a comuta între cărțile începute. Cu modul de coadă manuală activ, cardurile funcționează și ca o coadă, așa că următoarea se redă automat când se termină cea curentă.';

  @override
  String get tipsSheetTapToSeekTitle => 'Atinge pentru a derula';

  @override
  String get tipsSheetTapToSeekDesc =>
      'Atinge oriunde pe bara de progres a capitolului sau a cărții pentru a sări direct la acea poziție. Poți trage și barele pentru un control mai fin.';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle => 'Timp ajustat la viteză';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      'Toate duratele afișate - poziția, timpul rămas, capitolele, marcajele - se ajustează la viteza ta de redare. Asculți la 1.5x? Duratele arată cât vor dura de fapt pentru tine.';

  @override
  String get tipsSheetPlaybackHistoryTitle => 'Istoricul redării';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      'Atinge butonul Istoric de pe orice card pentru a vedea o cronologie a fiecărei redări, pauze, derulări și schimbări de viteză. Atinge orice eveniment pentru a reveni la acea poziție.';

  @override
  String get tipsSheetAutoRewindTitle => 'Derulare automată înapoi';

  @override
  String get tipsSheetAutoRewindDesc =>
      'Când reiei după o pauză, Absorb derulează automat câteva secunde înapoi ca să nu pierzi firul. Durata derulării crește în funcție de cât ai lipsit. O configurezi în Setări.';

  @override
  String get tipsSheetSeriesQueueModeTitle => 'Modul coadă de serie';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      'Când termini o carte care face parte dintr-o serie, Absorb poate reda automat următoarea carte. Setează modul de coadă pe „Serie” în Setări.';

  @override
  String get tipsSheetOfflineModeTitle => 'Mod offline';

  @override
  String get tipsSheetOfflineModeDesc =>
      'Atinge butonul cu avion de pe ecranul Absorbing pentru a intra în modul offline. Aceasta oprește sincronizarea, economisește date și arată doar cărțile descărcate. Excelent pentru zboruri sau zone cu semnal slab.';

  @override
  String get tipsSheetUpcomingReleasesTitle => 'Apariții viitoare';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      'În fila Serii, atinge din nou fila pentru a deschide foaia de sortare și filtrare, apoi alege Apariții viitoare pentru a vedea cărțile noi și viitoare din seriile tale, sortate după data apariției.';

  @override
  String get tipsSheetPerBookEqTitle => 'Egalizator per carte';

  @override
  String get tipsSheetPerBookEqDesc =>
      'Fiecare carte își amintește propriile setări de egalizator. Ajustează egalizatorul o dată pentru o epopee SF și data viitoare când o redai, sună la fel.';

  @override
  String get tipsSheetPerBookSpeedTitle => 'Viteză per carte';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      'Viteza de redare se salvează pentru fiecare carte. Ascultă non-ficțiune la 1.5x și ficțiune dramatică la 1.0x fără să o setezi de fiecare dată.';

  @override
  String get tipsSheetAutoSleepWindowTitle => 'Interval de somn automat';

  @override
  String get tipsSheetAutoSleepWindowDesc =>
      'Alege orele la care adormi de obicei, iar temporizatorul de somn va porni singur când începi să asculți în acel interval.';

  @override
  String get tipsSheetSleepFadeChimeTitle => 'Estompare și sunet de somn';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      'Când temporizatorul de somn se încheie, sunetul se estompează treptat și poate fi redat un sunet opțional, ca să nu se întrerupă în mijlocul unei propoziții.';

  @override
  String get tipsSheetCarModeTitle => 'Mod mașină';

  @override
  String get tipsSheetCarModeDesc =>
      'Atinge pictograma mașinii pentru a trece la modul cu butoane uriașe, conceput pentru o utilizare mai sigură la volan.';

  @override
  String get tipsSheetAudibleSeriesTitle => 'Descoperirea seriilor din Audible';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      'Deschide o serie și folosește meniul suplimentar (cele trei puncte) pentru a prelua lista completă a seriei din Audible, inclusiv intrările lipsă și cărțile pe care nu le-ai început.';

  @override
  String get tipsSheetTranscribeBookmarkTitle => 'Transcrie marcajele';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      'Transformă în text, integral pe dispozitivul tău, audio de la orice marcaj. Activează opțiunea în Setări, la Avansat > Transcriere, descarcă un model, apoi atinge Transcrie la un marcaj - textul ajunge în notița lui, gata de corectat sau de distribuit.';

  @override
  String get tipsSheetFindBetweenFormatsTitle =>
      'Sari între cartea audio și cartea electronică';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      'Cu transcrierea activată și cartea descărcată, pune pe pauză și atinge Găsește poziția în cartea electronică din player pentru a deschide cartea electronică la pasajul pe care tocmai l-ai auzit. În cititor, selectează un text și atinge căștile pentru a porni cartea audio chiar de acolo.';

  @override
  String get tipsSheetShareQuoteTitle => 'Distribuie citate';

  @override
  String get tipsSheetShareQuoteDesc =>
      'Distribuie o evidențiere dintr-o carte electronică sau o notiță de marcaj ca imagine, cu citatul peste coperta cărții. Caută opțiunea de distribuire la evidențieri și în foaia de marcaje.';

  @override
  String get tipsSheetClipExportTitle => 'Exportă clipuri audio';

  @override
  String get tipsSheetClipExportDesc =>
      'Deschide un marcaj și atinge Exportă clip pentru a tăia și salva un scurt fragment audio din carte, cu tot cu copertă - ideal pentru a distribui o scenă preferată.';

  @override
  String get tipsSheetAllHighlightsTitle =>
      'Toate evidențierile într-un singur loc';

  @override
  String get tipsSheetAllHighlightsDesc =>
      'Pagina Toate marcajele are o filă Evidențieri care adună toate evidențierile din toate cărțile electronice. Atinge una pentru a o distribui sau a reveni în carte.';

  @override
  String get tipsSheetVolumeKeyPagesTitle =>
      'Întoarcerea paginilor cu tastele de volum';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      'Întoarce paginile cărții electronice cu tastele de volum. Activează opțiunea în setările cititorului - direcție normală sau inversată, și poate rămâne activă chiar și când se redă audio.';

  @override
  String get tipsSheetSettingsSyncTitle => 'Sincronizarea setărilor';

  @override
  String get tipsSheetSettingsSyncDesc =>
      'Păstrează setările, vitezele per carte și ordinea din Absorbing sincronizate între dispozitive prin propriul tău server WebDAV. Configurează-l în Setări, la Copii de rezervă și sincronizare.';

  @override
  String get tipsSheetNavLongPressTitle => 'Apăsare lungă pe filele de jos';

  @override
  String get tipsSheetNavLongPressDesc =>
      'Ține apăsată fila Acasă pentru a comuta între biblioteci de pe orice pagină. Ține apăsată fila Bibliotecă pentru a ajunge direct în căutare.';

  @override
  String get bookCardUnknownTitle => 'Titlu necunoscut';

  @override
  String get bookCardExplicitBadge => 'E';

  @override
  String get bookCardDone => 'Gata';

  @override
  String get bookCardSaved => 'Salvat';

  @override
  String get episodeRowEpisode => 'Episod';

  @override
  String get episodeRowToday => 'Astăzi';

  @override
  String get episodeRowYesterday => 'Ieri';

  @override
  String episodeRowDaysAgo(int count) {
    return 'acum $count z.';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return 'acum $count săpt.';
  }

  @override
  String episodeRowDurationHm(int hours, int minutes) {
    return '$hours h $minutes min';
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
  String get librarySearchResultsDone => 'Gata';

  @override
  String get librarySearchResultsSaved => 'Salvat';

  @override
  String librarySearchResultsSequence(String number) {
    return '#$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => 'Serie necunoscută';

  @override
  String get librarySearchResultsUnknownEpisode => 'Episod necunoscut';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți',
      few: '$count cărți',
      one: '1 carte',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => 'E';

  @override
  String get libraryGridTilesDone => 'Gata';

  @override
  String get libraryGridTilesSaved => 'Salvat';

  @override
  String libraryGridTilesSequence(String number) {
    return '#$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => 'Serie necunoscută';

  @override
  String get seriesCardUnknownSeries => 'Serie necunoscută';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți',
      few: '$count cărți',
      one: '1 carte',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => 'Derulare fină';

  @override
  String get cardProgressQuarterSpeed => 'Un sfert de viteză';

  @override
  String get cardProgressHalfSpeed => 'Jumătate de viteză';

  @override
  String cardProgressChapterPrefix(String number) {
    return 'Capitolul $number';
  }

  @override
  String get cardEdgeProgressFineScrubbing => 'Derulare fină';

  @override
  String get cardEdgeProgressQuarterSpeed => 'Un sfert de viteză';

  @override
  String get cardEdgeProgressHalfSpeed => 'Jumătate de viteză';

  @override
  String get authSessionExpired => 'Sesiunea a expirat. Conectează-te din nou.';

  @override
  String authCannotReachServer(String url) {
    return 'Serverul de la $url nu poate fi contactat';
  }

  @override
  String get authInvalidUsernameOrPassword =>
      'Nume de utilizator sau parolă incorecte';

  @override
  String get authInvalidApiKey => 'Cheie API nevalidă';

  @override
  String get authLoginFailedDetail =>
      'Conectarea a eșuat - verifică adresa serverului și datele de autentificare';

  @override
  String get authUnexpectedServerResponse => 'Răspuns neașteptat de la server';

  @override
  String get authSsoUnexpectedResponse =>
      'SSO a returnat un răspuns neașteptat';

  @override
  String get authSwitchedToLocalServer => 'S-a trecut la serverul local';

  @override
  String get authSwitchedToRemoteServer => 'S-a trecut la serverul la distanță';

  @override
  String get lpDeletedFinishedDownload => 'Descărcare terminată ștearsă';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'se descarcă $count de episoade noi',
      few: 'se descarcă $count episoade noi',
      one: 'se descarcă 1 episod nou',
    );
    return '$showTitle: $_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return '$showTitle a fost adăugat la începutul cozii';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return '$showTitle a fost adăugat pe locul 2 în coadă';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return '$showTitle a fost adăugat la sfârșitul cozii';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return 'Episod nou $showTitle descărcat';
  }

  @override
  String get statsWeekStartsOn => 'Săptămâna începe luni';

  @override
  String get episodeListNewEpisodePosition => 'Poziția episodului nou';

  @override
  String get episodeListPositionTop => 'Începutul cozii';

  @override
  String get episodeListPositionSecond => 'Al doilea în coadă';

  @override
  String get episodeListPositionEnd => 'Sfârșitul cozii';

  @override
  String get episodeListPositionNone => 'Nu adăuga în coadă';

  @override
  String get episodeListPositionNoneDesc =>
      'Primești totuși notificări și descărcare';

  @override
  String sleepRewindUndoNote(int minutes) {
    return 'Apasă redare în $minutes minute și derularea înapoi este anulată';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Coadă: se descarcă $count de elemente',
      few: 'Coadă: se descarcă $count elemente',
      one: 'Coadă: se descarcă 1 element',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se descarcă $count de cărți',
      few: 'Se descarcă $count cărți',
      one: 'Se descarcă 1 carte',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se descarcă $count de episoade',
      few: 'Se descarcă $count episoade',
      one: 'Se descarcă 1 episod',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName => 'Progresul descărcărilor';

  @override
  String get downloadNotifProgressChannelDesc =>
      'Arată progresul în timpul descărcării cărților audio';

  @override
  String get downloadNotifAlertChannelName => 'Alerte de descărcare';

  @override
  String get downloadNotifAlertChannelDesc =>
      'Notificări când descărcările se termină sau eșuează';

  @override
  String get downloadNotifDownloadingTitle => 'Se descarcă…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de descărcări active',
      few: '$count descărcări active',
      one: '1 descărcare activă',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return 'Se descarcă: $title';
  }

  @override
  String get downloadNotifStartingLabel => 'Se pornește…';

  @override
  String get downloadNotifCompleteTitle => 'Descărcare finalizată';

  @override
  String downloadNotifCompleteBody(String title) {
    return '$title este gata de ascultat offline';
  }

  @override
  String get downloadNotifFailedTitle => 'Descărcare eșuată';

  @override
  String get upcomingNotifChannelName => 'Scanarea aparițiilor viitoare';

  @override
  String get upcomingNotifChannelDesc =>
      'Arată progresul la scanarea aparițiilor viitoare';

  @override
  String get upcomingNotifScanTitle => 'Se scanează aparițiile viitoare';

  @override
  String get upcomingNotifStartingScan => 'Se pornește scanarea…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return 'Se verifică $seriesName… ($current/$total)';
  }

  @override
  String get upcomingNotifFoundTitle => 'Apariții viitoare găsite!';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$series de serii',
      few: '$series serii',
      one: '1 serie',
    );
    return '$books viitoare în $_temp0';
  }

  @override
  String get androidAutoTabContinue => 'Continuă';

  @override
  String get androidAutoTabLibrary => 'Bibliotecă';

  @override
  String get androidAutoTabDownloads => 'Descărcări';

  @override
  String get settingsSearchHint => 'Caută în setări...';

  @override
  String get settingsSearchNoResults => 'Nicio setare potrivită';

  @override
  String get carConnectAutoplay =>
      'Pornește redarea când se conectează Android Auto';

  @override
  String get carConnectAutoplayIos =>
      'Pornește redarea când se conectează CarPlay';

  @override
  String get carConnectAutoplayOnSubtitle =>
      'Ultima carte pe care o ascultai pornește singură când se conectează mașina';

  @override
  String get carConnectAutoplayOffSubtitle =>
      'Redarea așteaptă să apeși redare';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => 'Folosește cu Siri';

  @override
  String get siriStatusOn =>
      'Activat. Siri poate găsi și reda cărțile și podcasturile tale după nume.';

  @override
  String get siriStatusAsk =>
      'Lasă Siri să găsească și să redea cărțile și podcasturile tale după nume.';

  @override
  String get siriStatusOff =>
      'Siri este dezactivat pentru Absorb. Activează-l în Setările iOS.';

  @override
  String get siriAllow => 'Permite';

  @override
  String get siriOpenSettings => 'Deschide setările';

  @override
  String get siriThingsToSay => 'Ce poți spune';

  @override
  String get siriExamples =>
      '„Redă [titlul cărții] în Absorb”\n„Redă [numele seriei] în Absorb”\n„Redă ceva de [autor] în Absorb”\n„Redă cel mai recent episod din [podcast] în Absorb”\n„Reia Absorb”\n„Derulează înapoi în Absorb”\n„Capitolul următor în Absorb”\n„Setează un temporizator de somn în Absorb”\n„Adaugă un marcaj în Absorb”\n„Ce ascult în Absorb”';

  @override
  String get siriShortcutsNote =>
      'Reluarea, pauza, săriturile, capitolele, temporizatorul de somn, marcajele și ce se redă funcționează și fără această permisiune. Se găsesc și în aplicația Comenzi rapide, pentru automatizări și butonul Acțiune.';

  @override
  String get carBookOrder => 'Ordinea cărților în mașină';

  @override
  String get carBookOrderReverse => 'Inversează ordinea cărților';

  @override
  String get carBookOrderReverseSubtitle =>
      'De la Z la A, sau cele mai vechi adăugate primele';

  @override
  String get carPodcastOrder => 'Ordinea podcasturilor în mașină';

  @override
  String get carEpisodesOldestFirst => 'Cele mai vechi episoade primele';

  @override
  String get carEpisodesOldestFirstSubtitle =>
      'Pentru emisiunile pe care le asculți de la început';

  @override
  String get androidAutoCatBooks => 'Cărți';

  @override
  String get androidAutoCatSeries => 'Serii';

  @override
  String get androidAutoCatAuthors => 'Autori';

  @override
  String get androidAutoCatCollections => 'Colecții';

  @override
  String get androidAutoCatPlaylists => 'Liste de redare';

  @override
  String get showTipsAgain => 'Arată din nou sfaturile';

  @override
  String get showTipsAgainSubtitle =>
      'Readu sfaturile despre funcții pe care le-ai închis';

  @override
  String get tipsRestored => 'Sfaturi restaurate';

  @override
  String get resetSpeedPresets => 'Resetează presetările de viteză';

  @override
  String get resetSpeedPresetsSubtitle =>
      'Restaurează butoanele implicite de viteză de redare';

  @override
  String get speedPresetsReset => 'Presetările de viteză au fost resetate';

  @override
  String get editAuthor => 'Editează autorul';

  @override
  String get authorName => 'Nume';

  @override
  String get authorImage => 'Imaginea autorului';

  @override
  String get authorRemoveImage => 'Elimină imaginea';

  @override
  String get authorRemoveImageTitle => 'Elimini imaginea autorului?';

  @override
  String get authorRemoveImageConfirm =>
      'Aceasta șterge imaginea de pe server.';

  @override
  String get authorImageRemoved => 'Imagine eliminată';

  @override
  String get authorImageFailed =>
      'Imaginea autorului nu a putut fi actualizată';

  @override
  String get authorUpdated => 'Autor actualizat';

  @override
  String get authorUpdateFailed => 'Autorul nu a putut fi actualizat';

  @override
  String get authorMatched => 'Autor actualizat din potrivire';

  @override
  String get authorNoMatchFound => 'Nu s-a găsit nicio potrivire';

  @override
  String authorMergedInto(String name) {
    return 'Îmbinat cu $name';
  }

  @override
  String get authorQuickMatchHint =>
      'Preia numele, ASIN-ul, descrierea și imaginea din Audible pentru regiunea aleasă.';

  @override
  String get region => 'Regiune';

  @override
  String get editTabDetails => 'Detalii';

  @override
  String get editTabCover => 'Copertă';

  @override
  String get editTabMatch => 'Potrivire';

  @override
  String get editTabEmbed => 'Încorporare';

  @override
  String get chapterEditorTitle => 'Editează capitolele';

  @override
  String get chapterNotConnected => 'Neconectat la un server';

  @override
  String get chapterErrorFirstNotZero =>
      'Primul capitol trebuie să înceapă la 0:00';

  @override
  String get chapterErrorStartAfterPrevious =>
      'Începutul trebuie să fie după capitolul anterior';

  @override
  String get chapterErrorStartBeforeEnd =>
      'Începutul trebuie să fie înainte de sfârșitul cărții';

  @override
  String get chapterErrorTitleRequired => 'Titlul este obligatoriu';

  @override
  String get chapterEditStartTitle => 'Editează ora de început';

  @override
  String get chapterTimeHintSeconds => 'Secunde';

  @override
  String get chapterTimeHintFull => 'HH:MM:SS sau secunde';

  @override
  String get chapterInvalidTime => 'Oră nevalidă';

  @override
  String get chapterLocked => 'Capitolul este blocat';

  @override
  String get chapterAllLocked => 'Toate capitolele sunt blocate';

  @override
  String chapterTrackTitle(int number) {
    return 'Pista $number';
  }

  @override
  String get chapterNoAudioForPosition =>
      'Nu există audio pentru această poziție';

  @override
  String get chapterCouldNotPlayPreview =>
      'Previzualizarea nu a putut fi redată';

  @override
  String chapterStartSetTo(String time) {
    return 'Începutul setat la $time';
  }

  @override
  String get chapterAddNumberedTitle => 'Adaugă capitole numerotate';

  @override
  String chapterNextPreview(String first, String second) {
    return 'Următoarele: „$first”, „$second”, ...';
  }

  @override
  String get chapterHowMany => 'Câte capitole';

  @override
  String get add => 'Adaugă';

  @override
  String get chapterCountRange => 'Introdu un număr între 1 și 150';

  @override
  String get chapterTitlesUpdated =>
      'Titlurile capitolelor au fost actualizate';

  @override
  String get chaptersApplied => 'Capitole aplicate';

  @override
  String get chapterDiscardTitle => 'Renunți la modificări?';

  @override
  String get chapterDiscardMessage => 'Revine la capitolele salvate.';

  @override
  String get chapterRemoveAllTitle => 'Elimini toate capitolele?';

  @override
  String get chapterRemoveAllMessage =>
      'Aceasta elimină toate capitolele din această carte.';

  @override
  String get chapterAllRemoved => 'Toate capitolele au fost eliminate';

  @override
  String get chapterFixHighlighted =>
      'Corectează mai întâi capitolele evidențiate';

  @override
  String get chaptersUpdated => 'Capitole actualizate';

  @override
  String get ok => 'OK';

  @override
  String get chapterSaveButton => 'Salvează capitolele';

  @override
  String get chapterAddHint => 'Adaugă capitol (de ex. „Capitolul 01”)';

  @override
  String get chapterAddTooltip => 'Adaugă capitole';

  @override
  String get chapterRemoveAll => 'Elimină tot';

  @override
  String get chapterShiftTimes => 'Decalează orele';

  @override
  String get chapterFromTracks => 'Din piste';

  @override
  String get chapterLookup => 'Caută';

  @override
  String get chapterShowSeconds => 'Arată secundele';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get chapterLoopCut => 'Repetă tăietura';

  @override
  String get chapterFindStart => 'Găsește începutul';

  @override
  String get chapterFindStartListening => 'Se ascultă în jurul marcajului';

  @override
  String get chapterFindStartNone =>
      'Nimic de aici nu sună a început de capitol';

  @override
  String get chapterFindStartWider => 'Caută mai larg';

  @override
  String get chapterFindStartCeiling =>
      'S-a căutat o jumătate de oră în jurul marcajului. Începutul este mai departe de atât sau nu există un anunț de capitol de auzit.';

  @override
  String get chapterFindStartStrong => 'Sună a acest capitol';

  @override
  String get chapterFindStartMaybe => 'Cuvinte de capitol';

  @override
  String chapterFindStartGap(String seconds) {
    return 'pauză de $seconds s';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return 'S-a căutat de la $from la $to';
  }

  @override
  String get chapterFindStartNeedsModel =>
      'Activează mai întâi transcrierea în Setări și descarcă un model';

  @override
  String get chapterFindStartUseThis => 'Folosește acesta';

  @override
  String chapterFindStartTitle(String title) {
    return 'Titlu: $title';
  }

  @override
  String get chapterShiftBySeconds => 'Decalează cu (secunde)';

  @override
  String get chapterShiftHint =>
      'Decalează toate capitolele deblocate. Folosește o valoare negativă pentru a le muta mai devreme.';

  @override
  String get chapterTitleHint => 'Titlul capitolului';

  @override
  String get chapterStopPreview => 'Oprește previzualizarea';

  @override
  String get chapterPreviewFromHere => 'Previzualizează de aici';

  @override
  String get chapterScrubHint => 'Trage sau ajustează pentru a muta începutul';

  @override
  String chapterStartAt(String time) {
    return 'Începe la $time';
  }

  @override
  String get chapterUnlock => 'Deblochează';

  @override
  String get chapterLock => 'Blochează';

  @override
  String get chapterInsertBelow => 'Inserează dedesubt';

  @override
  String get chapterFindTitle => 'Găsește capitole';

  @override
  String get chapterFindSubtitle =>
      'Caută capitole în Audible/Audnexus după ASIN.';

  @override
  String get chapterEnterAsin => 'Introdu un ASIN';

  @override
  String get chapterLookupFailed => 'Căutarea a eșuat - verifică ASIN-ul';

  @override
  String get chapterNoChaptersFound =>
      'Nu s-au găsit capitole pentru acel ASIN';

  @override
  String get chapterRemoveBranding => 'Elimină marca Audible (intro/outro)';

  @override
  String chapterFoundCount(int count) {
    return '$count capitole găsite';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  Carte $book';
  }

  @override
  String get chapterAudibleLonger =>
      'Versiunea Audible este mai lungă decât fișierul tău - capitolele de mai târziu s-ar putea să nu se potrivească.';

  @override
  String get chapterAudibleShorter =>
      'Versiunea Audible este mai scurtă decât fișierul tău - capitolele s-ar putea să nu se potrivească.';

  @override
  String get chapterTitlesOnly => 'Doar titlurile';

  @override
  String get chapterApplyChapters => 'Aplică capitolele';

  @override
  String get coverSearchTitle => 'Caută o copertă';

  @override
  String get coverSearchRefineHint =>
      'Rafinează titlul/autorul pentru a curăța rezultatele - aceasta nu modifică cartea.';

  @override
  String get coverNoneFound => 'Nu s-au găsit coperte';

  @override
  String get coverEnterTitleFirst => 'Introdu mai întâi un titlu';

  @override
  String get coverUpdated => 'Copertă actualizată';

  @override
  String get coverCouldNotUpdate => 'Coperta nu a putut fi actualizată';

  @override
  String get coverApply => 'Aplică coperta';

  @override
  String get coverUnknownResolution => 'Rezoluție necunoscută';

  @override
  String get embedIntro =>
      'Încorporează metadatele în fișierele audio, inclusiv imaginea de copertă și capitolele.';

  @override
  String get embedBackupOption =>
      'Fă mai întâi o copie de rezervă a fișierelor audio';

  @override
  String get embedNoteInFolder =>
      'Metadatele vor fi încorporate în pistele audio din folderul cărții audio.';

  @override
  String get embedNoteMultiTrack =>
      'Capitolele nu se încorporează în cărțile audio cu mai multe piste.';

  @override
  String get embedNoteNavigateAway =>
      'După pornirea sarcinii, poți părăsi această pagină.';

  @override
  String get embedStartButton => 'Pornește încorporarea metadatelor';

  @override
  String embedProgress(String percent) {
    return 'Se încorporează $percent%';
  }

  @override
  String get embedProgressIndeterminate => 'Se încorporează...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent% - continuă să ruleze dacă părăsești această pagină';
  }

  @override
  String get taskStarting => 'Se pornește...';

  @override
  String get embedBackupNoteIntro =>
      'O copie de rezervă a fișierelor audio originale va fi stocată pe server în ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro =>
      '. Nu uita să golești periodic memoria cache a elementelor.';

  @override
  String get embedDialogTitle => 'Încorporează metadatele';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# de fișiere audio',
      few: '# fișiere audio',
      one: '# fișier audio',
    );
    return 'Încorporezi metadatele în $_temp0? Fișierele tale audio vor fi rescrise$backup.';
  }

  @override
  String get embedConfirmBackupClause =>
      ' (originalele sunt salvate mai întâi)';

  @override
  String get embedConfirmAction => 'Încorporează';

  @override
  String get embedCouldNotStart => 'Încorporarea nu a putut porni';

  @override
  String get embedStarted => 'Încorporarea a pornit';

  @override
  String get embedComplete => 'Încorporare finalizată';

  @override
  String get embedFailed => 'Încorporarea a eșuat';

  @override
  String get encodeComplete => 'Codare finalizată';

  @override
  String get encodeFailedTask => 'Codarea a eșuat';

  @override
  String encodeProgress(String percent) {
    return 'Se codifică $percent%';
  }

  @override
  String get encodeProgressIndeterminate => 'Se codifică...';

  @override
  String get adminApiKeys => 'Chei API';

  @override
  String get adminApiKeysSubtitle => 'Token-uri de acces programatic';

  @override
  String get adminApiKeysNewTitle => 'Cheie API nouă';

  @override
  String get adminApiKeysName => 'Nume';

  @override
  String get adminApiKeysNameHint => 'de ex. Home Assistant';

  @override
  String get adminApiKeysOwner => 'Utilizator';

  @override
  String get adminApiKeysExpiration => 'Expirare';

  @override
  String get adminApiKeysActive => 'Activă';

  @override
  String get adminApiKeysActiveSub =>
      'Cheia funcționează imediat ce este creată';

  @override
  String get adminApiKeysInactive => 'Inactivă';

  @override
  String get adminApiKeysExpired => 'Expirată';

  @override
  String get adminApiKeysCreate => 'Creează cheia';

  @override
  String get adminApiKeysCreated => 'Cheie API creată';

  @override
  String get adminApiKeysTokenLabel => 'Noua ta cheie API';

  @override
  String get adminApiKeysCopyWarning =>
      'Copiază această cheie acum. Din motive de securitate nu va mai fi afișată.';

  @override
  String get adminApiKeysCopy => 'Copiază';

  @override
  String get adminApiKeysCopied => 'Copiat în clipboard';

  @override
  String get adminApiKeysDone => 'Gata';

  @override
  String get adminApiKeysDeleteTitle => 'Revoci cheia API?';

  @override
  String get adminApiKeysDeleted => 'Cheie API revocată';

  @override
  String get adminApiKeysRevoke => 'Revocă';

  @override
  String get adminApiKeysSetActive => 'Setează ca activă';

  @override
  String get adminApiKeysSetInactive => 'Setează ca inactivă';

  @override
  String get adminApiKeysFailedCreate => 'Cheia API nu a putut fi creată';

  @override
  String get adminApiKeysFailedDelete => 'Cheia API nu a putut fi revocată';

  @override
  String get adminApiKeysFailedUpdate => 'Cheia API nu a putut fi actualizată';

  @override
  String get adminApiKeysEmpty => 'Încă nu există chei API';

  @override
  String get adminApiKeysEmptySub =>
      'Creează una pentru a permite aplicațiilor și scripturilor să acceseze serverul tău';

  @override
  String get adminApiKeysNeverUsed => 'Niciodată folosită';

  @override
  String get adminApiKeysNeverExpires => 'Fără expirare';

  @override
  String get adminApiKeysNameRequired => 'Introdu un nume';

  @override
  String get adminApiKeysUserRequired => 'Alege un utilizator';

  @override
  String get adminApiKeysExpNever => 'Niciodată';

  @override
  String get adminApiKeysExp7d => '7 zile';

  @override
  String get adminApiKeysExp30d => '30 de zile';

  @override
  String get adminApiKeysExp90d => '90 de zile';

  @override
  String get adminApiKeysExp1y => '1 an';

  @override
  String adminApiKeysLastUsed(String time) {
    return 'Folosită ultima dată $time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return 'Expiră $date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return 'Revoci „$name”? Aplicațiile care folosesc această cheie își vor pierde imediat accesul.';
  }

  @override
  String get endOfEpisode => 'Sfârșitul episodului';

  @override
  String get sleepTimerSheetEpisodeSleepStart =>
      'Oprire la sfârșitul episodului';

  @override
  String get bookmarkListen => 'Ascultă';

  @override
  String get bookmarkPause => 'Pauză';

  @override
  String get bookmarkPreviewFailed => 'Acest punct nu a putut fi redat.';

  @override
  String get clipExport => 'Exportă clip';

  @override
  String get clipJumpToStart => 'Sari la început';

  @override
  String get clipJumpToEnd => 'Sari la final';

  @override
  String get clipSetStart => 'Setează începutul';

  @override
  String get clipSetEnd => 'Setează finalul';

  @override
  String get clipInLabel => 'Intrare';

  @override
  String get clipOutLabel => 'Ieșire';

  @override
  String get clipSave => 'Salvează clipul';

  @override
  String clipExportSaved(String filename) {
    return '$filename salvat';
  }

  @override
  String get clipExportClamped =>
      'Clip salvat, scurtat până la sfârșitul acestei piste';

  @override
  String get clipExportFailed => 'Clipul nu a putut fi exportat.';

  @override
  String get clipDownloadToExport =>
      'Descarcă mai întâi această carte pentru a exporta un clip pe iPhone.';

  @override
  String get fsPickerTitle => 'Selectează folderul';

  @override
  String get fsServerRoot => 'Rădăcina serverului';

  @override
  String get fsEmptyFolder => 'Nu există subfoldere aici';

  @override
  String get fsUseThisFolder => 'Folosește acest folder';

  @override
  String get adminLibrariesManage => 'Biblioteci';

  @override
  String get adminLibrariesManageSubtitle => 'Creează, editează și reordonează';

  @override
  String get adminUploadTitle => 'Încarcă media';

  @override
  String get adminUploadSubtitle => 'Adaugă cărți și podcasturi din fișiere';

  @override
  String get adminUploadNoLibraries =>
      'Creează o bibliotecă înainte de a încărca media.';

  @override
  String get adminUploadDestination => 'Destinație';

  @override
  String get adminUploadFolder => 'Dosarul bibliotecii';

  @override
  String get adminUploadDetails => 'Detaliile elementului';

  @override
  String get adminUploadOptional => 'Opțional';

  @override
  String get adminUploadAutoMetadata => 'Preia automat metadatele';

  @override
  String get adminUploadAutoMetadataSubtitle =>
      'Completează titlul, autorul și seria din cea mai bună potrivire';

  @override
  String get adminUploadMetadataProvider => 'Furnizor de metadate';

  @override
  String get adminUploadMetadataSearching => 'Se caută metadate...';

  @override
  String get adminUploadMetadataNoResults =>
      'Nu s-a găsit nicio potrivire de metadate. Poți încărca totuși acest element.';

  @override
  String get adminUploadMetadataFailed =>
      'Nu s-au putut căuta metadatele. Poți încărca totuși acest element.';

  @override
  String get adminUploadDestinationPreview => 'Destinația de pe server';

  @override
  String get adminUploadFiles => 'Fișiere';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fișiere',
      few: '$count fișiere',
      one: '1 fișier',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => 'Alege fișiere';

  @override
  String get adminUploadAddFiles => 'Adaugă fișiere';

  @override
  String get adminUploadBookFilesHint =>
      'Alege fișiere audio sau de carte electronică. Poți include și coperte și fișiere de metadate.';

  @override
  String get adminUploadPodcastFilesHint =>
      'Alege unul sau mai multe fișiere audio. Poți include și coperte și fișiere de metadate.';

  @override
  String get adminUploadUnsupportedFiles =>
      'Unele fișiere selectate nu sunt acceptate de Audiobookshelf.';

  @override
  String get adminUploadFilePickerFailed =>
      'Nu s-au putut deschide fișierele selectate.';

  @override
  String get adminUploadTitleRequired => 'Introdu un titlu';

  @override
  String get adminUploadLibraryRequired => 'Alege o bibliotecă';

  @override
  String get adminUploadFolderRequired => 'Alege un dosar al bibliotecii';

  @override
  String get adminUploadFilesRequired => 'Alege cel puțin un fișier';

  @override
  String get adminUploadPodcastFileRequired =>
      'Alege cel puțin un fișier audio pentru acest podcast.';

  @override
  String get adminUploadBookFileRequired =>
      'Alege cel puțin un fișier audio sau de carte electronică pentru această carte.';

  @override
  String get adminUploadPathCheckFailed =>
      'Nu s-a putut verifica dosarul de destinație. Nu s-a încărcat nimic.';

  @override
  String get adminUploadDestinationExists =>
      'Acest dosar de destinație există deja pe server.';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return 'Această destinație este deja folosită de „$title”.';
  }

  @override
  String get adminUploadAddToExistingTitle => 'Dosarul există deja';

  @override
  String adminUploadAddToExisting(String title) {
    return 'Acest dosar aparține de „$title”. Adaugi fișierele în el? Serverul le preia la următoarea scanare.';
  }

  @override
  String get adminUploadAddToExistingNoItem =>
      'Acest dosar există deja pe server. Adaugi fișierele în el?';

  @override
  String get adminUploadAddToBook => 'Adaugă la o carte existentă';

  @override
  String get adminUploadAddToBookHint => 'Caută în această bibliotecă';

  @override
  String get adminUploadNoBooksFound => 'Nu s-a găsit nicio carte';

  @override
  String adminUploadAddingTo(String title) {
    return 'Se adaugă fișiere la „$title”';
  }

  @override
  String adminUploadAddedTo(String title) {
    return 'Fișiere adăugate la „$title”';
  }

  @override
  String get adminUploadTargetNoFolder =>
      'Nu s-a găsit dosarul acelei cărți pe server.';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return 'Serverul ar pune aceste fișiere în „$preview”, nu în dosarul cărții „$folder”. Nu s-a încărcat nimic.';
  }

  @override
  String get adminUploadUploading => 'Se încarcă...';

  @override
  String adminUploadProgress(int percent) {
    return 'Se încarcă $percent%';
  }

  @override
  String get adminUploadButton => 'Încarcă';

  @override
  String adminUploadComplete(String title) {
    return '„$title” a fost încărcat';
  }

  @override
  String get adminUploadFailed => 'Încărcarea a eșuat';

  @override
  String adminUploadFailedReason(String error) {
    return 'Încărcarea a eșuat: $error';
  }

  @override
  String get adminUploadReselectFiles =>
      'Alege din nou fișierele înainte de a reîncerca.';

  @override
  String get adminServerSettings => 'Setări server';

  @override
  String get adminServerSettingsSubtitle => 'Scanner, stocare și sortare';

  @override
  String get adminAuthentication => 'Autentificare';

  @override
  String get adminAuthenticationSubtitle =>
      'Conectare cu parolă și OpenID Connect';

  @override
  String get adminStats => 'Statistici';

  @override
  String get adminStatsSubtitle => 'Totaluri pentru bibliotecă și ascultare';

  @override
  String get adminAllSessions => 'Toate sesiunile';

  @override
  String get adminAllSessionsSubtitle =>
      'Vezi și gestionează toate sesiunile de ascultare';

  @override
  String get adminSessionsAllUsers => 'Toți utilizatorii';

  @override
  String get adminSessionsEmpty => 'Nicio sesiune';

  @override
  String get statsLibraryTotals => 'Totaluri bibliotecă';

  @override
  String get statsTotalItems => 'Elemente';

  @override
  String get statsAudioFiles => 'Fișiere audio';

  @override
  String get statsTotalSize => 'Dimensiune totală';

  @override
  String get statsBooks => 'Cărți';

  @override
  String get statsPodcasts => 'Podcasturi';

  @override
  String get statsBooksSize => 'Dimensiunea cărților';

  @override
  String get statsYearReview => 'Anul în retrospectivă';

  @override
  String get statsNoYearData => 'Nu există date pentru acest an';

  @override
  String get statsListeningTime => 'Timp de ascultare';

  @override
  String get statsSessions => 'Sesiuni';

  @override
  String get statsBooksAdded => 'Cărți adăugate';

  @override
  String get statsAuthorsAdded => 'Autori adăugați';

  @override
  String get statsTopAuthors => 'Top autori';

  @override
  String get statsTopNarrators => 'Top naratori';

  @override
  String get statsTopGenres => 'Top genuri';

  @override
  String get srvScannerSection => 'Scanner';

  @override
  String get srvFindCovers => 'Caută coperte';

  @override
  String get srvCoverProvider => 'Furnizor de coperte';

  @override
  String get srvParseSubtitles => 'Extrage subtitlurile din numele fișierului';

  @override
  String get srvPreferMatched => 'Preferă metadatele potrivite';

  @override
  String get srvDisableWatcher => 'Dezactivează monitorizarea dosarelor';

  @override
  String get srvStorageSection => 'Stocare';

  @override
  String get srvStoreCover => 'Păstrează coperta împreună cu elementul';

  @override
  String get srvStoreMetadata => 'Păstrează metadatele împreună cu elementul';

  @override
  String get srvMetadataFormat => 'Formatul fișierului de metadate';

  @override
  String get srvFormatSection => 'Afișare și format';

  @override
  String get srvDateFormat => 'Format dată';

  @override
  String get srvTimeFormat => 'Format oră';

  @override
  String get srvLanguage => 'Limba serverului';

  @override
  String get srvChromecast => 'Suport Chromecast';

  @override
  String get srvAllowIframe => 'Permite încorporarea în iframe';

  @override
  String get srvSortingSection => 'Sortare';

  @override
  String get srvIgnorePrefixes => 'Ignoră prefixele la sortare';

  @override
  String get srvSortingPrefixes => 'Prefixe de sortare';

  @override
  String get srvAddPrefix => 'Adaugă prefix';

  @override
  String get srvSave => 'Salvează setările';

  @override
  String get srvSavePrefixes => 'Salvează prefixele';

  @override
  String get srvSaved => 'Setări salvate';

  @override
  String get srvSaveFailed => 'Nu s-au putut salva setările';

  @override
  String get srvPrefixesSaved => 'Prefixele de sortare au fost actualizate';

  @override
  String get authSetLoadFailed =>
      'Nu s-au putut încărca setările de autentificare';

  @override
  String get authSetCustomMessage => 'Mesaj personalizat la conectare';

  @override
  String get authSetMessage => 'Mesaj';

  @override
  String get authSetPasswordAuth => 'Autentificare cu parolă';

  @override
  String get authSetOpenId => 'Autentificare OpenID Connect';

  @override
  String get authSetGuide => 'Ghid de configurare';

  @override
  String get authSetIssuerUrl => 'URL emitent';

  @override
  String get authSetAutoPopulate => 'Completare automată';

  @override
  String get authSetAuthorizeUrl => 'URL de autorizare';

  @override
  String get authSetTokenUrl => 'URL token';

  @override
  String get authSetUserinfoUrl => 'URL userinfo';

  @override
  String get authSetJwksUrl => 'URL JWKS';

  @override
  String get authSetLogoutUrl => 'URL de deconectare';

  @override
  String get authSetClientId => 'ID client';

  @override
  String get authSetClientSecret => 'Secret client';

  @override
  String get authSetSigningAlgorithm => 'Algoritm de semnare';

  @override
  String get authSetRedirectUris => 'URI-uri de redirecționare mobile permise';

  @override
  String get authSetRedirectUrisInfo =>
      'Aplicațiile se pot întoarce doar la aceste adrese după conectare. Absorb folosește absorb://oauth. Un asterisc (*) ca unică intrare permite orice adresă.';

  @override
  String get authSetAddRedirectUri => 'Adaugă URI';

  @override
  String get authSetAddAbsorbRedirect => 'Adaugă absorb://oauth';

  @override
  String get authSetSubfolder => 'Subdosar pentru URL-urile de redirecționare';

  @override
  String get authSetSubfolderNone => 'Niciunul';

  @override
  String get authSetWebRedirectInfo =>
      'Permite aceste URL-uri la furnizorul tău OAuth, ca să se poată reveni în aplicația web după conectare:';

  @override
  String get authSetButtonText => 'Textul butonului';

  @override
  String get authSetMatchExisting => 'Potrivește utilizatorii existenți după';

  @override
  String get authSetMatchNone => 'Nu potrivi';

  @override
  String get authSetMatchEmail => 'E-mail';

  @override
  String get authSetMatchUsername => 'Nume de utilizator';

  @override
  String get authSetMatchExistingInfo =>
      'Se folosește pentru a asocia utilizatorii existenți. După asociere, utilizatorii sunt potriviți după ID-ul lor unic de la furnizor.';

  @override
  String get authSetAutoLaunch => 'Lansare automată';

  @override
  String get authSetAutoLaunchInfo =>
      'Deschide automat furnizorul din pagina de conectare web. /login?autoLaunch=0 o omite.';

  @override
  String get authSetAutoRegister => 'Înregistrare automată';

  @override
  String get authSetAutoRegisterInfo =>
      'Creează utilizatori noi automat după ce se conectează';

  @override
  String get authSetClaimsInfo =>
      'Lasă-le goale pentru a dezactiva atribuirea grupurilor și a permisiunilor. Utilizatorii noi primesc atunci rolul de utilizator.';

  @override
  String get authSetGroupClaim => 'Claim de grup';

  @override
  String get authSetGroupClaimInfo =>
      'Claim-ul care listează grupurile utilizatorului, de obicei groups. Grupurile numite admin, user sau guest stabilesc rolul, iar cel mai înalt are prioritate. Dacă niciun grup nu se potrivește, conectarea este refuzată.';

  @override
  String get authSetPermsClaim => 'Claim avansat de permisiuni';

  @override
  String get authSetPermsClaimInfo =>
      'Claim cu permisiuni pentru utilizatorii non-admin. Dacă lipsește claim-ul, conectarea este refuzată, iar o opțiune lipsă se consideră dezactivată. Format așteptat:';

  @override
  String get authSetRestartNote =>
      'Repornește serverul după salvare pentru a aplica modificările OpenID Connect.';

  @override
  String get authSetNoChanges => 'Nu există modificări de salvat';

  @override
  String get authSetNeedOneMethod =>
      'Activează cel puțin o metodă de conectare';

  @override
  String authSetFieldRequired(String field) {
    return '$field este obligatoriu';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return 'URI de redirecționare nevalid: $uri';
  }

  @override
  String get authSetAsteriskAlone =>
      'Un asterisc (*) trebuie să fie singurul URI de redirecționare';

  @override
  String authSetInvalidClaim(String field) {
    return '$field nu este un nume de claim valid';
  }

  @override
  String authSetIssuerFailed(String error) {
    return 'Nu s-a putut citi emitentul: $error';
  }

  @override
  String get libNoneYet => 'Încă nu există biblioteci';

  @override
  String get libReorderFailed => 'Nu s-a putut salva noua ordine';

  @override
  String get libDeleteTitle => 'Ștergi biblioteca?';

  @override
  String get libDeleteBody =>
      'Aceasta elimină definitiv biblioteca și toate elementele ei de pe server.';

  @override
  String get libDeleted => 'Bibliotecă ștearsă';

  @override
  String get libDeleteFailed => 'Nu s-a putut șterge biblioteca';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de dosare',
      few: '$count dosare',
      one: '1 dosar',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => 'Bibliotecă nouă';

  @override
  String get libEditTitle => 'Editează biblioteca';

  @override
  String get libName => 'Numele bibliotecii';

  @override
  String get libMediaType => 'Tip media';

  @override
  String get libMediaBook => 'Cărți';

  @override
  String get libMediaPodcast => 'Podcasturi';

  @override
  String get libProvider => 'Furnizor de metadate';

  @override
  String get libIcon => 'Pictogramă';

  @override
  String get libFolders => 'Dosare';

  @override
  String get libAddFolder => 'Adaugă dosar';

  @override
  String get libNoFolders => 'Adaugă cel puțin un dosar';

  @override
  String get libAdvanced => 'Setări avansate';

  @override
  String get libCoverShape => 'Forma copertei';

  @override
  String get libCoverSquare => 'Pătrată';

  @override
  String get libCoverStandard => 'Standard';

  @override
  String get libDisableWatcher => 'Dezactivează monitorizarea dosarelor';

  @override
  String get libSkipAsin => 'Omite potrivirea cărților care au ASIN';

  @override
  String get libSkipIsbn => 'Omite potrivirea cărților care au ISBN';

  @override
  String get libHideSingleSeries => 'Ascunde seriile cu o singură carte';

  @override
  String get libAudiobooksOnly => 'Doar cărți audio';

  @override
  String get libEpubScripted => 'Permite conținut ePub cu scripturi';

  @override
  String get libLaterBooksOnly =>
      'Arată doar cărțile următoare în Continuă seria';

  @override
  String get libPodcastRegion => 'Regiunea de căutare a podcasturilor';

  @override
  String get libMarkPercent => 'Terminat la % parcurs';

  @override
  String get libMarkTime => 'Terminat cu secunde rămase';

  @override
  String get libAutoScan => 'Program de scanare automată (cron)';

  @override
  String get libCreate => 'Creează biblioteca';

  @override
  String get libUpdate => 'Salvează modificările';

  @override
  String get libNameRequired => 'Introdu un nume pentru bibliotecă';

  @override
  String get libCreated => 'Bibliotecă creată';

  @override
  String get libCreateFailed => 'Nu s-a putut crea biblioteca';

  @override
  String get libUpdated => 'Bibliotecă actualizată';

  @override
  String get libUpdateFailed => 'Nu s-a putut actualiza biblioteca';

  @override
  String get libRemoveFoldersTitle => 'Elimini dosarele?';

  @override
  String get libRemoveFoldersBody =>
      'Eliminarea unui dosar șterge elementele lui din bibliotecă. Acțiunea nu poate fi anulată.';

  @override
  String get readEbook => 'Citește';

  @override
  String get ebookDownload => 'Descarcă';

  @override
  String get ebookDownloaded => 'Descărcat';

  @override
  String get ebookSavedOffline => 'Salvată pentru citire offline';

  @override
  String get ebookRemovedOffline => 'Eliminată din offline';

  @override
  String get ebookOfflineFailed => 'Nu s-a putut descărca cartea electronică';

  @override
  String get ebookSaveToDevice => 'Salvează pe dispozitiv';

  @override
  String get ebookSaveToDeviceTitle => 'Salvezi pe dispozitiv?';

  @override
  String get ebookSaveToDeviceBody =>
      'Aceasta salvează o copie a fișierului cărții electronice undeva pe dispozitiv (tu alegi unde). Nu face cartea disponibilă offline în cititor - folosește Descarcă pentru asta.';

  @override
  String get readerFormatUnsupported =>
      'Acest format de carte electronică nu poate fi deschis încă în cititor';

  @override
  String get readerCouldNotOpen =>
      'Această carte electronică nu a putut fi deschisă. Este posibil ca fișierul să fie deteriorat.';

  @override
  String get moreActions => 'Mai multe';

  @override
  String get readerChapters => 'Capitole';

  @override
  String get readerSettings => 'Setări cititor';

  @override
  String get readerFontSize => 'Dimensiune font';

  @override
  String get readerLineSpacing => 'Spațiere între rânduri';

  @override
  String get readerTextAlignment => 'Aliniere';

  @override
  String get readerAlignJustified => 'Aliniat stânga-dreapta';

  @override
  String get readerAlignLeft => 'Stânga';

  @override
  String get readerSideMargins => 'Margini laterale';

  @override
  String get readerTopBottom => 'Sus și jos';

  @override
  String get readerPageLayout => 'Aspectul paginii';

  @override
  String get readerPinTopBar => 'Păstrează titlul și bara de progres pe ecran';

  @override
  String get readerPinTopBarHint =>
      'Le fixează deasupra paginii în loc să le arate la atingere. Pagina devine puțin mai scurtă, ca să nu fie acoperit niciun text.';

  @override
  String get readerTopBarProgress => 'Progres în bara de sus';

  @override
  String get readerTopBarProgressBook => 'Carte';

  @override
  String get readerTopBarProgressChapter => 'Capitol';

  @override
  String get readerTopBarProgressBoth => 'Ambele';

  @override
  String get readerSectionText => 'Text';

  @override
  String get readerSectionPage => 'Pagină';

  @override
  String get readerSectionTopBar => 'Bara de sus și ecranul';

  @override
  String get readerSectionControls => 'Comenzi';

  @override
  String get readerSectionStats => 'Statistici';

  @override
  String get readerParagraphSpacing => 'Spațiere între paragrafe';

  @override
  String get readerParagraphSpacingBook => 'Cea a cărții';

  @override
  String get readerTapZones => 'Zone de atingere';

  @override
  String get readerTapZonesHint =>
      'Trage liniile pentru a redimensiona pătratele. Atinge un pătrat pentru a schimba ce face sau pornește de la un aspect gata făcut.';

  @override
  String get readerTapPrev => 'Pagina anterioară';

  @override
  String get readerTapNext => 'Pagina următoare';

  @override
  String get readerTapMenu => 'Arată comenzile';

  @override
  String get readerTapNothing => 'Nimic';

  @override
  String get readerTapKeepMenu => 'Un pătrat trebuie să arate comenzile';

  @override
  String get readerHideControls => 'Ascunde comenzile după';

  @override
  String get readerHideControlsNever => 'Niciodată';

  @override
  String get readerBarNotes => 'Notițe și evidențieri';

  @override
  String readerHideControlsAfter(int seconds) {
    return '${seconds}s';
  }

  @override
  String get playerDownloadStreamingInstead =>
      'Această descărcare nu a putut fi redată, așa că se redă în flux de pe server. Descărcarea ei din nou poate rezolva problema.';

  @override
  String get readerPageTurn => 'Întoarcerea paginii';

  @override
  String get readerPageTurnNone => 'Fără';

  @override
  String get readerPageTurnSlide => 'Glisare';

  @override
  String get readerPageTurnCurl => 'Răsfoire';

  @override
  String get readerPageTurnRipple => 'Ondulare';

  @override
  String get readerScrollMode => 'Mod derulare';

  @override
  String get readerScrollModeHint =>
      'Derulează în jos prin carte în loc să întorci paginile. Se aplică tuturor cărților.';

  @override
  String get readerKeepAwake => 'Menține ecranul pornit';

  @override
  String get readerKeepAwakeHint =>
      'Împiedică stingerea ecranului cât timp citești în ritmul tău. Derularea automată și citirea în paralel îl mențin mereu pornit.';

  @override
  String get readerLayoutAuto => 'Automat';

  @override
  String get readerLayoutSingle => 'O pagină';

  @override
  String get readerLayoutTwoPage => 'Două pagini';

  @override
  String get readerTheme => 'Temă';

  @override
  String get readerFont => 'Font';

  @override
  String get readerVolumeNav => 'Tastele de volum întorc paginile';

  @override
  String get readerVolumeNavOff => 'Oprit';

  @override
  String get readerVolumeNavNormal => 'Normal';

  @override
  String get readerVolumeNavMirrored => 'Inversat';

  @override
  String get readerAutoScroll => 'Derulare automată';

  @override
  String get readerAutoScrollSubtitle =>
      'Pagina următoare se desenează peste aceasta de sus în jos - trage de mijlocul ecranului pentru a schimba viteza, atinge pentru a opri';

  @override
  String get readerAutoScrollStarted => 'Derulare automată pornită';

  @override
  String get readerAutoScrollPaused => 'În pauză - ține apăsat pentru a opri';

  @override
  String get readerAutoScrollResumed => 'Derulare automată reluată';

  @override
  String get readerAutoScrollStopped => 'Derulare automată oprită';

  @override
  String get readerAutoScrollEndOfBook =>
      'Sfârșitul cărții - derulare automată oprită';

  @override
  String readerAutoScrollSpeed(int percent) {
    return 'Viteză $percent%';
  }

  @override
  String get readerMoreControls => 'Mai multe comenzi';

  @override
  String get readerAutoScrollSleep =>
      'Temporizator de somn pentru derularea automată';

  @override
  String get readerAutoScrollSleepHint =>
      'Oprește derularea după un timp și lasă ecranul să se stingă.';

  @override
  String readerAutoScrollSleepMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String readerAutoScrollSleepLeft(int minutes) {
    return '$minutes min rămase';
  }

  @override
  String readerAutoScrollSleepIn(int minutes) {
    return 'Derularea automată se oprește în $minutes min';
  }

  @override
  String get readerAutoScrollSleepOff =>
      'Temporizator de somn pentru derularea automată oprit';

  @override
  String get readerAutoScrollSleepEnded =>
      'Temporizator de somn - derulare automată oprită';

  @override
  String get readerDownloadStarted => 'Descărcare pornită';

  @override
  String get detailChaptersJumpTitle => 'Sari la acest capitol?';

  @override
  String detailChaptersJumpContent(String title) {
    return 'Redarea trece la „$title”.';
  }

  @override
  String get detailChaptersJump => 'Sari';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de capitole terminate',
      few: '$count capitole terminate',
      one: '1 capitol terminat',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de alți ascultători',
      few: '$count alți ascultători',
      one: '1 alt ascultător',
      zero: 'Niciun alt ascultător',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => 'Urmează';

  @override
  String get seriesJumpToUpNext => 'Sari la următoarea';

  @override
  String get seriesStatsFinished => 'Terminate';

  @override
  String get seriesStatsListened => 'Ascultate';

  @override
  String get seriesStatsLeft => 'Rămase';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done din $total';
  }

  @override
  String get detailSessionsNone => 'Încă nu există sesiuni de ascultare';

  @override
  String detailSessionsAll(int count) {
    return 'Toate cele $count sesiuni';
  }

  @override
  String get readerVolumeNavWhilePlaying => 'Chiar și când se redă audio';

  @override
  String get readerTranslateWith => 'Tradu cu';

  @override
  String get readerTranslateApp => 'Aplicație de pe acest dispozitiv';

  @override
  String get readerTranslateApple => 'Integrat în iOS';

  @override
  String get readerTranslateWeb => 'Se deschide în browser';

  @override
  String get readerTranslateHint =>
      'Textul selectat este trimis traducătorului ales.';

  @override
  String get readerMoreFonts => 'Descarcă mai multe fonturi';

  @override
  String get readerFontRemove => 'Elimină descărcarea';

  @override
  String readerFontDownloadFailed(String font) {
    return 'Nu s-a putut descărca $font';
  }

  @override
  String get readerAnnotations => 'Adnotări';

  @override
  String readerHighlights(int count) {
    return 'Evidențieri ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return 'Marcaje ($count)';
  }

  @override
  String get readerNoHighlights => 'Încă nu există evidențieri';

  @override
  String get readerHistory => 'Istoric';

  @override
  String get sessionReading => 'Citire';

  @override
  String get readerHistoryEmpty =>
      'Paginile pe care le părăsești sunt listate aici, ca să te poți întoarce oricând la ele.';

  @override
  String get readerHistoryClosed => 'Cartea a fost închisă';

  @override
  String get readerHistoryBeforeJump => 'Înainte de un salt';

  @override
  String get readerHistoryBeforeSync => 'Înainte de potrivirea cu audio';

  @override
  String get readerLogReading => 'Include timpul de citire în statistici';

  @override
  String get readerLogReadingHint =>
      'Înregistrează timpul petrecut în cititor ca sesiune, ca să apară în statisticile tale. În Audiobookshelf se numără ca timp de ascultare.';

  @override
  String get readerNoBookmarks => 'Încă nu există marcaje';

  @override
  String get readerBookmarkDefault => 'Marcaj';

  @override
  String get readerNoteTitle => 'Notiță';

  @override
  String get readerNoteHint => 'Adaugă o notiță...';

  @override
  String get backupAndSync => 'Copie de siguranță și sincronizare';

  @override
  String get backupAndSyncSubtitle =>
      'Salvează un fișier de rezervă sau păstrează setările la fel pe toate dispozitivele';

  @override
  String get syncSettingsExperimental => 'Experimental';

  @override
  String get syncSettingsExperimentalBody =>
      'Sincronizarea este nouă și încă în lucru. Dacă două dispozitive modifică lucruri cât timp sunt separate, o parte își poate pierde modificările. Păstrează un fișier de rezervă drept copie sigură.';

  @override
  String get syncSettingsNeedServer => 'Ai nevoie de un server?';

  @override
  String get syncSettingsNeedServerSub =>
      'Funcționează orice server WebDAV. Nextcloud este unul gratuit, auto-găzduit.';

  @override
  String get syncSettingsConnection => 'Conexiune';

  @override
  String get syncSettingsConnectionNotSet => 'Încă nu este configurată';

  @override
  String get syncSettingsBackupFile => 'Fișier de rezervă';

  @override
  String get syncSettingsBackupFilePlain =>
      'Salvează totul într-un fișier pe care îl păstrezi tu.';

  @override
  String get syncSettingsBackupFileWithSync =>
      'Salvează totul într-un fișier pe care îl păstrezi tu. Include datele de conectare, iar restaurarea lui pe alt telefon activează și acolo sincronizarea.';

  @override
  String get syncSettingsStatusOff => 'Nu se sincronizează';

  @override
  String get syncSettingsStatusProblem => 'Nu s-a putut contacta serverul';

  @override
  String get syncSettings => 'Sincronizează setările între dispozitive';

  @override
  String get syncSettingsExtras => 'Sincronizează și';

  @override
  String get syncSettingsIncludeRmab => 'Setările ReadMeABook';

  @override
  String get syncSettingsIncludeRmabSub =>
      'Pune tokenul tău API ReadMeABook în fișierul sincronizat';

  @override
  String get syncSettingsSubtitle =>
      'Păstrează setările la fel prin propriul tău server WebDAV';

  @override
  String get syncSettingsEnable => 'Sincronizează setările';

  @override
  String get syncSettingsServerUrl => 'URL-ul dosarului WebDAV';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => 'Nume de utilizator';

  @override
  String get syncSettingsPassword => 'Parolă';

  @override
  String get syncSettingsHeaders => 'Antete personalizate (opțional)';

  @override
  String get syncSettingsHeadersHint =>
      'Câte unul pe rând, de exemplu CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => 'Testează conexiunea';

  @override
  String get syncSettingsHoldToUpload => 'Ține apăsat pentru a încărca acum';

  @override
  String get syncSettingsUploadNow => 'Încarcă acum';

  @override
  String get syncSettingsDownloadNow => 'Descarcă acum';

  @override
  String get syncSettingsOk => 'Conectat';

  @override
  String get syncSettingsNoRemote => 'Conectat - încă nu s-a sincronizat nimic';

  @override
  String get syncSettingsAuthFailed => 'Nume de utilizator sau parolă greșite';

  @override
  String get syncSettingsNetworkError => 'Adresa nu a putut fi contactată';

  @override
  String get syncSettingsNotConfigured =>
      'Completează mai întâi adresa, numele de utilizator și parola';

  @override
  String get syncSettingsTooLarge =>
      'Setările tale sunt prea mari pentru a fi sincronizate';

  @override
  String get syncSettingsUploaded => 'Setări încărcate';

  @override
  String get syncSettingsApplied =>
      'Setări actualizate de pe celălalt dispozitiv';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de setări actualizate de pe celălalt dispozitiv',
      few: '$count setări actualizate de pe celălalt dispozitiv',
      one: '1 setare actualizată de pe celălalt dispozitiv',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => 'Deja la zi';

  @override
  String syncSettingsLastSynced(String when) {
    return 'Ultima sincronizare: $when';
  }

  @override
  String get syncSettingsNever => 'Încă nesincronizat';

  @override
  String navHoldPickTitle(String tab) {
    return 'Ținerea apăsată pe $tab va...';
  }

  @override
  String get navHoldPickBody =>
      'Alege ce face o apăsare lungă pe această filă. Poți schimba mai târziu în Setări.';

  @override
  String get navHoldSettingTitle => 'Scurtături la ținere apăsată pe file';

  @override
  String get navHoldSettingSubtitle =>
      'Ce face ținerea apăsată pe fiecare filă';

  @override
  String get navHoldAskNextTime => 'Întreabă data viitoare';

  @override
  String get navHoldNothing => 'Nimic';

  @override
  String get navHoldPlayPause => 'Redare / pauză';

  @override
  String get navHoldOfflineMode => 'Mod offline';

  @override
  String get navHoldOfflineOn => 'Mod offline activat';

  @override
  String get navHoldOfflineOff => 'Mod offline dezactivat';

  @override
  String get navHoldMenu => 'Arată mereu meniul';

  @override
  String get navHoldStop => 'Oprește redarea';

  @override
  String get navHoldRmabSearch => 'Căutare ReadMeABook';

  @override
  String get navHoldRmabRequests => 'Cererile mele de cărți';

  @override
  String get navHoldRmabWeb => 'Site-ul ReadMeABook';

  @override
  String get navHoldAdd => 'Adaugă';

  @override
  String get navHoldMoveLeft => 'Mută la stânga';

  @override
  String get navHoldMoveRight => 'Mută la dreapta';

  @override
  String get navHoldRemoveFromMenu => 'Elimină din meniu';

  @override
  String get navHoldEditHint =>
      'Ține apăsat pe un element pentru a-l muta sau elimina';

  @override
  String get navHoldResetMenu =>
      'Resetează elementele meniului de ținere apăsată';

  @override
  String get navHoldMenuReset => 'Elementele meniului au fost resetate';

  @override
  String get bookStatsAction => 'Statistici de ascultare';

  @override
  String get bookStatsYou => 'Tu';

  @override
  String get bookStatsEveryone => 'Toată lumea';

  @override
  String get bookStatsListened => 'Timp ascultat';

  @override
  String get bookStatsSessions => 'Sesiuni';

  @override
  String get bookStatsFirst => 'Prima ascultare';

  @override
  String get bookStatsLast => 'Ultima ascultare';

  @override
  String get bookStatsListeners => 'Persoane care au început-o';

  @override
  String get bookStatsFinishedCount => 'Persoane care au terminat-o';

  @override
  String get bookStatsTotalTime => 'Timp ascultat de toată lumea';

  @override
  String get bookStatsNobody => 'Nimeni nu a început-o încă';

  @override
  String get bookStatsScanning => 'Se parcurg sesiunile, poate dura o vreme...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return 'Se parcurg sesiunile, $done din $total persoane...';
  }

  @override
  String bookStatsLastChecked(String when) {
    return 'Verificat $when';
  }

  @override
  String get activityYourReading => 'Citirea ta';

  @override
  String get activityYourListening => 'Ascultarea ta';

  @override
  String activityLastRead(String when) {
    return 'Ultima citire $when';
  }

  @override
  String activityLastListened(String when) {
    return 'Ultima ascultare $when';
  }

  @override
  String get activityNotStarted => 'Neînceput';

  @override
  String get activityNoReading => 'Încă nu există sesiuni de citire';

  @override
  String get activityTime => 'Timp';

  @override
  String get activityAverage => 'Med.';

  @override
  String get activityProgress => 'Progres';

  @override
  String activityReached(String percent) {
    return '$percent atins';
  }

  @override
  String get readingLogTitle => 'Jurnal de citire';

  @override
  String get readingLogTotalTime => 'Timp total';

  @override
  String get readingLogAverageSession => 'Sesiune medie';

  @override
  String get readingLogActiveDays => 'Zile active';

  @override
  String readingLogActiveDaysOf(int active, int total) {
    return '$active din $total';
  }

  @override
  String get readingLogPace => 'Ritm';

  @override
  String readingLogPacePerHour(String percent) {
    return '$percent%/h';
  }

  @override
  String get readingLogLastRead => 'Ultima citire';

  @override
  String get readingLogStarted => 'Început';

  @override
  String get readingLogFinished => 'Terminat';

  @override
  String get readingLogNotSet => 'Nesetat';

  @override
  String readingLogLeftMinutes(int m) {
    return 'Aproximativ $m min până la final';
  }

  @override
  String readingLogLeftHours(int h) {
    return 'Aproximativ $h h până la final';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return 'Aproximativ $h h $m min până la final';
  }

  @override
  String get readingLogLeftMax => 'Peste 99 h până la final';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return 'Cu $percent% mai mult decât săptămâna anterioară';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return 'Cu $percent% mai puțin decât săptămâna anterioară';
  }

  @override
  String get readingLogNewThisWeek => 'Nou în această săptămână';

  @override
  String get readingLogSameAsLastWeek => 'La fel ca săptămâna anterioară';

  @override
  String get readingLogQuietTwoWeeks => 'Nimic în ultimele două săptămâni';

  @override
  String get readingLogWhereYouRead => 'Unde ai citit-o';

  @override
  String get readingLogSourceIos => 'Aplicația iOS';

  @override
  String get readingLogSourceAndroid => 'Aplicația Android';

  @override
  String get readingLogChartTitle => 'Progres în timp';

  @override
  String get readingLogChartPosition => 'Poziția atinsă';

  @override
  String get readingLogChartMinutes => 'Minute';

  @override
  String get readingLogRecords => 'Recorduri';

  @override
  String get readingLogLongestSession => 'Cea mai lungă sesiune';

  @override
  String get readingLogBestDay => 'Cea mai bună zi';

  @override
  String get readingLogLongestStreak => 'Cea mai lungă serie';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de zile',
      few: '$count zile',
      one: '1 zi',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => 'Reveniri înapoi';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de ori',
      few: '$count ori',
      one: '1 dată',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => 'Prima deschidere';

  @override
  String get readingLogAttempts => 'Încercări';

  @override
  String readingLogAttempt(int index) {
    return 'Încercarea $index';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return 'Încercarea $index a început';
  }

  @override
  String get readingLogOutcomeCompleted => 'Finalizată';

  @override
  String get readingLogOutcomeSkimmed => 'Răsfoită';

  @override
  String get readingLogOutcomeAbandoned => 'Abandonată';

  @override
  String get readingLogOutcomeInProgress => 'În curs';

  @override
  String readingLogSpanRange(String from, String to) {
    return '$from - $to';
  }

  @override
  String readingLogSpanSince(String from) {
    return 'Din $from';
  }

  @override
  String readingLogSpanEnded(String to) {
    return 'Încheiată $to';
  }

  @override
  String get readingLogSpanUnknown => 'Nicio dată înregistrată';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de sesiuni',
      few: '$count sesiuni',
      one: '1 sesiune',
    );
    return '$_temp0';
  }

  @override
  String readingLogShowing(int shown, int total) {
    return '$shown din $total';
  }

  @override
  String readingLogGapDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de zile fără citit',
      few: '$count zile fără citit',
      one: '1 zi fără citit',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => 'Încă nu există sesiuni înregistrate';

  @override
  String get readingLogEmptyHint =>
      'Sesiunile apar aici pe măsură ce citești sau asculți, din orice aplicație sau dispozitiv care se sincronizează cu BookOrbit.';

  @override
  String get readingLogNoMatches => 'Nicio sesiune în acest interval';

  @override
  String get readingLogAllTime => 'Din totdeauna';

  @override
  String get readingLogLast30 => 'Ultimele 30 de zile';

  @override
  String get readingLogLast90 => 'Ultimele 90 de zile';

  @override
  String get readingLogThisYear => 'Anul acesta';

  @override
  String get readingLogAllFormats => 'Toate formatele';

  @override
  String get readingLogSortBy => 'Sortează după';

  @override
  String get readingLogSortDay => 'Zi';

  @override
  String get readingLogSortLength => 'Durată';

  @override
  String get readingLogSortChange => 'Schimbare';

  @override
  String get readingLogSortReached => 'Atins';

  @override
  String get readingLogNewestFirst => 'Cele mai noi mai întâi';

  @override
  String get readingLogOldestFirst => 'Cele mai vechi mai întâi';

  @override
  String get readingLogMostFirst => 'Cele mai multe mai întâi';

  @override
  String get readingLogLeastFirst => 'Cele mai puține mai întâi';

  @override
  String get readingLogDeleteTitle => 'Ștergi această sesiune?';

  @override
  String get readingLogDeleteBody =>
      'Va fi eliminată din jurnalul de citire al cărții și din statisticile tale din BookOrbit.';

  @override
  String get readingLogDeleteFailed => 'Nu s-a putut șterge sesiunea';

  @override
  String get readingLogLoadFailed => 'Nu s-a putut încărca jurnalul de citire';

  @override
  String get navHoldServerScan => 'Scanare server';

  @override
  String get navHoldScanAll => 'Scanează toate bibliotecile';

  @override
  String navHoldScanLibrary(String name) {
    return 'Scanează $name';
  }

  @override
  String get navHoldScanStarted => 'Scanare pornită';

  @override
  String get navHoldScanFailed => 'Nu s-a putut porni scanarea';

  @override
  String get navHoldAdminLogs => 'Jurnalele serverului';

  @override
  String navHoldAdminPage(String page) {
    return 'Admin: $page';
  }

  @override
  String get navHoldNothingPlaying => 'Încă nu e nimic de redat';

  @override
  String get navHoldReadBook => 'Citește cartea curentă';

  @override
  String get navHoldBookDetails => 'Detaliile cărții curente';

  @override
  String get syncSourceTitle => 'Ce copie să păstreze sincronizarea?';

  @override
  String get syncSourceBody =>
      'Această copie de rezervă a activat sincronizarea setărilor. Folosești ultima sincronizare de pe server sau faci din această copie sursa de adevăr? Alegerea copiei de rezervă înlocuiește copia de pe server pentru toate dispozitivele tale sincronizate.';

  @override
  String get syncSourceUseServer => 'Ultima sincronizare de pe server';

  @override
  String get syncSourceUseBackup => 'Această copie de rezervă';

  @override
  String get syncSettingsWhatTravels =>
      'Se sincronizează preferințele, vitezele pe carte, aspectul paginii Acasă, ordinea din Absorbing, notițele și evidențierile din cărțile electronice. Datele de conectare, dosarele de descărcare, comutatoarele de descărcare automată, aspectul cititorului și tot ce nu a fost încă trimis pe server rămân pe acest dispozitiv.';

  @override
  String get syncSettingsDownloadWarnTitle =>
      'Înlocuiești setările acestui dispozitiv?';

  @override
  String get syncSettingsDownloadWarnBody =>
      'Copia sincronizată va suprascrie setările de pe acest dispozitiv.';

  @override
  String get syncSettingsDownloadWarnConfirm => 'Înlocuiește';

  @override
  String get readerCopied => 'Copiat în clipboard';

  @override
  String get dictionaryNotFound =>
      'Nu s-a găsit nicio definiție pentru acest cuvânt.';

  @override
  String get dictionaryError =>
      'Dicționarul nu a putut fi contactat. Verifică conexiunea.';

  @override
  String get dictionaryRetry => 'Reîncearcă';

  @override
  String get dictionarySearchWeb => 'Caută pe web';

  @override
  String get readerTooltipCopy => 'Copiază';

  @override
  String get readerTooltipSearch => 'Caută';

  @override
  String get readerTooltipDefine => 'Definește';

  @override
  String get readerTooltipTranslate => 'Tradu';

  @override
  String get readerSearchHint => 'Caută în această carte…';

  @override
  String readerSearchMatches(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de rezultate pentru „$query”',
      few: '$count rezultate pentru „$query”',
      one: '$count rezultat pentru „$query”',
    );
    return '$_temp0';
  }

  @override
  String get readerSearchEmpty =>
      'Scrie un cuvânt sau o expresie și atinge căutare.';

  @override
  String readerSearchNoResults(String query) {
    return 'Niciun rezultat pentru „$query”.';
  }

  @override
  String get transcriptionTitle => 'Transcriere';

  @override
  String get transcriptionAdvancedSubtitle =>
      'Pentru transcrierea marcajelor și găsirea locului între cartea audio și cea electronică';

  @override
  String get transcriptionEnable => 'Activează transcrierea';

  @override
  String get transcriptionEnableSubtitle =>
      'Adaugă Transcrie la marcaje, Găsește poziția în cartea electronică în player și Găsește în cartea audio în cititor';

  @override
  String get transcriptionDisclaimer =>
      'Rulează integral pe dispozitivul tău, nimic nu este trimis nicăieri. Folosește mai multă baterie și putere de procesare cât timp lucrează, iar doar cărțile descărcate pot fi transcrise.';

  @override
  String get transcriptionNeedModelHint =>
      'Descarcă un model mai jos pentru a începe transcrierea.';

  @override
  String get transcriptionModelSection => 'Modele';

  @override
  String get transcriptionModelTiny => 'Foarte mic';

  @override
  String get transcriptionModelTinyDesc =>
      'Cel mai rapid, mai puțin precis. Aproximativ 31 MB.';

  @override
  String get transcriptionModelBase => 'De bază';

  @override
  String get transcriptionModelBaseDesc =>
      'Un compromis bun. Aproximativ 57 MB.';

  @override
  String get transcriptionModelSmall => 'Mic';

  @override
  String get transcriptionModelSmallDesc =>
      'Mai lent, dar cel mai precis - cel mai bun pe un telefon performant. Aproximativ 182 MB.';

  @override
  String get transcriptionAutoHint =>
      'Dacă ai descărcat mai multe, fiecare lucrare alege dintre ele. Cărțile cu carte electronică primesc cel mai rapid model, deoarece cuvintele exacte vin oricum din cartea electronică. Cele fără carte electronică primesc cel mai precis - cu excepția citirii în paralel, care rămâne sub Mic, ca să țină pasul cu naratorul.';

  @override
  String get transcriptionDownload => 'Descarcă';

  @override
  String get transcriptionDownloadFailed =>
      'Descărcarea a eșuat. Verifică conexiunea și încearcă din nou.';

  @override
  String get transcribe => 'Transcrie';

  @override
  String get transcribing => 'Se transcrie...';

  @override
  String get transcriptionResultTitle => 'Transcriere';

  @override
  String get transcriptionSaveToNote => 'Salvează în notiță';

  @override
  String get transcriptionSavedToNote => 'Salvat în notița marcajului';

  @override
  String get transcriptionDisabledHint =>
      'Activează transcrierea marcajelor în Setări, la Avansat.';

  @override
  String get transcriptionNoModelDownloaded =>
      'Descarcă mai întâi un model de transcriere în Setări.';

  @override
  String get transcriptionNotDownloadedBook =>
      'Descarcă această carte sau conectează-te la server pentru a o transcrie.';

  @override
  String get transcriptionNoMetadataMsg =>
      'Nu se poate localiza acest loc în descărcare. Încearcă să descarci din nou cartea.';

  @override
  String get transcriptionBusyMsg =>
      'Se transcrie deja altceva. Mai așteaptă puțin.';

  @override
  String get transcriptionEmptyMsg => 'Nu s-a găsit vorbire în acest loc.';

  @override
  String get transcriptionFailedMsg =>
      'Nu s-a putut transcrie acest loc. Încearcă din nou.';

  @override
  String get transcriptionPlaySnippet => 'Ascultă';

  @override
  String get transcriptionPauseSnippet => 'Pauză';

  @override
  String get transcriptionIntroBody =>
      'Aceasta ascultă cantitatea de audio aleasă, începând chiar înainte de marcaj, și o transformă în text pe dispozitivul tău. Fragmentele mai lungi durează mai mult, iar transcrierea nu este precisă 100%. Textul este salvat în notița marcajului când e gata, pregătit de corectat sau de partajat.';

  @override
  String get transcriptionUseEbookText =>
      'Folosește textul exact al cărții electronice când poate fi potrivit';

  @override
  String get lyricsMode => 'Transcriere în direct';

  @override
  String get lyricsListeningAhead => 'Se ascultă în avans...';

  @override
  String get lyricsDisplaySection => 'Transcriere în direct';

  @override
  String get lyricsFontSize => 'Dimensiunea rândului';

  @override
  String get lyricsMaxLines => 'Rânduri afișate';

  @override
  String get lyricsFullCover => 'Folosește toată coperta';

  @override
  String get lyricsFullCoverHint =>
      'Arată transcrierea în locul imaginii cât timp rulează, încadrând cât mai multe rânduri încap.';

  @override
  String get lyricsBatteryInfo =>
      'Transcrierea în direct și citirea în paralel folosesc mai multă baterie și putere de procesare cât timp rulează. Pe telefoanele cu procesoare mai lente, rândurile pot apărea mai greu.';

  @override
  String get lyricsClearCache => 'Golește memoria cache a transcrierilor';

  @override
  String lyricsClearCacheHint(String size) {
    return '$size de rânduri de transcriere salvate. Cărțile și episoadele șterse sunt transcrise din nou pe măsură ce asculți.';
  }

  @override
  String get lyricsClearCacheConfirm =>
      'Ștergi transcrierile salvate pentru fiecare carte și episod? Se refac automat pe măsură ce asculți.';

  @override
  String get lyricsCacheCleared =>
      'Memoria cache a transcrierilor a fost golită';

  @override
  String get lyricsIntroBody =>
      'Aceasta ascultă puțin înaintea naratorului și arată fiecare rând pe măsură ce este rostit, transcris pe telefonul tău - nimic nu părăsește dispozitivul. După activare, așteaptă câteva secunde înainte de a apăsa redare, cât timp ia avans. Transcrierea apare când avansul este gata, iar pornirea din pauză îi oferă cea mai fluentă rulare. Folosește mai multă baterie și putere de procesare cât timp rulează.';

  @override
  String lyricsBuildingLead(String percent) {
    return 'Se ia avans față de narator... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return 'Nu se poate transcrie la fel de repede cât asculți la $speed';
  }

  @override
  String get lyricsTurnOn => 'Activează';

  @override
  String get readAlong => 'Citire în paralel';

  @override
  String get readAlongNeedsPlaying =>
      'Redă mai întâi cartea audio a acestei cărți';

  @override
  String get narrationListen => 'Ascultă';

  @override
  String get narrationPlayFromHere => 'Redă de aici';

  @override
  String get narrationPreparing => 'Se pregătește narațiunea';

  @override
  String get narrationNone =>
      'Această carte electronică nu are narațiune de redat';

  @override
  String get narrationDownloadTitle => 'Descarcă pentru a asculta';

  @override
  String get narrationDownloadBody =>
      'Această carte este un EPUB3 care se citește singur cu voce tare. Audiobookshelf nu poate transmite narațiunea în flux, așa că audio trebuie descărcat înainte de redare.';

  @override
  String get narrationDownloadStarted =>
      'Se descarcă narațiunea. Atinge Absorb când se termină.';

  @override
  String get narrationTextBody =>
      'EPUB-ul acestei cărți are propriile cuvinte pentru fiecare moment din audio, așa că textul este copiat direct din carte. Alege cât să adaugi în notița marcajului.';

  @override
  String get narrationTextLoading => 'Se preiau cuvintele din carte';

  @override
  String get downloadToAbsorb => 'Descarcă în Absorb';

  @override
  String get narrationUpNextTitle => 'Descarcă ce urmează';

  @override
  String narrationUpNextBody(String title) {
    return '$title este următoarea din coada ta. Este un EPUB3 care se citește singur cu voce tare, așa că trebuie descărcată înainte de redare.';
  }

  @override
  String narrationQueueStopped(String title) {
    return 'S-a oprit înainte de $title. Descarcă-o pentru a continua.';
  }

  @override
  String get transcriptionNeedsDownload =>
      'Aceasta are nevoie de audio pe telefonul tău. Îl descarci acum?';

  @override
  String get transcriptionDownloadStarted =>
      'Se descarcă. Activează din nou aceasta când se termină';

  @override
  String get readAlongFollow => 'Citirea în paralel urmărește';

  @override
  String get syncReadingListening =>
      'Păstrează citirea și ascultarea sincronizate';

  @override
  String get syncReadingListeningHint =>
      'Pentru cărțile cu versiune audio și electronică. Când oprești ascultarea, cartea electronică trece la locul unde ai rămas. Când părăsești cititorul, cartea audio trece la pagina ta. Merge doar înainte.';

  @override
  String get syncEbookMoved =>
      'Cartea electronică a trecut la locul unde ai oprit ascultarea';

  @override
  String get syncAudioMoved =>
      'Cartea audio a trecut la locul unde ai oprit citirea';

  @override
  String get syncAudioOffer =>
      'Atinge pentru a sări la locul unde ai oprit citirea';

  @override
  String get syncFindingAudio => 'Se caută pagina ta în cartea audio';

  @override
  String get syncFindingEbook => 'Se caută locul tău în cartea electronică';

  @override
  String get syncFailed => 'Nu s-a putut sincroniza poziția';

  @override
  String get syncAlreadyTogether => 'Deja sincronizate';

  @override
  String get syncPosition => 'Sincronizează poziția';

  @override
  String get readAlongFollowHint =>
      'Momentul fiecărui cuvânt este calculat între marcajele de timp ale transcrierii, așa că poate devia ușor în interiorul unei propoziții.';

  @override
  String get readAlongFollowWord => 'Cuvânt';

  @override
  String get readAlongFollowSentence => 'Propoziție';

  @override
  String get readAlongColor => 'Culoarea citirii în paralel';

  @override
  String get readAlongLost => 'Nu se găsește narațiunea pe pagină';

  @override
  String get readAlongBackToNarration => 'Înapoi la narațiune';

  @override
  String get findInEbook => 'Găsește în cartea electronică';

  @override
  String get findInEbookSearching =>
      'Se caută acest loc în cartea electronică...';

  @override
  String get findInEbookNotFound =>
      'Nu s-a găsit acest loc în cartea electronică.';

  @override
  String get findInEbookNeedsEpub =>
      'Găsește în cartea electronică necesită o carte electronică EPUB.';

  @override
  String get findInEbookNoEbook =>
      'Această carte nu are o versiune electronică.';

  @override
  String get findInAudiobook => 'Găsește în cartea audio';

  @override
  String get findInAudiobookSearching =>
      'Se caută acest loc în cartea audio...';

  @override
  String get findInAudiobookStillSearching =>
      'Se mai caută acest loc în audio...';

  @override
  String get findInAudiobookSearchingLong =>
      'Capitol lung, încă se caută. Poate dura un minut sau două...';

  @override
  String get findInAudiobookNotFound =>
      'Nu s-a găsit acest loc în cartea audio.';

  @override
  String get transcriptionWhisperInfo =>
      'Transcrierea este realizată de Whisper, un model deschis de recunoaștere a vorbirii care ascultă narațiunea și scrie cuvintele - totul pe acest dispozitiv.';

  @override
  String get transcriptionWhisperLearnMore => 'Află mai multe despre Whisper';

  @override
  String get findInAudiobookIntroBody =>
      'Aceasta ascultă cartea audio în apropierea locului unde citești și o potrivește cu acest pasaj, totul pe dispozitivul tău. Poate dura până la un minut. Dacă locul nu poate fi potrivit cu încredere, nu se mișcă nimic.';

  @override
  String get findInAudiobookAfterLabel => 'Când locul este găsit';

  @override
  String get findInAudiobookStay => 'Continuă să citești';

  @override
  String get findInAudiobookGoPlayer => 'Deschide playerul';

  @override
  String get findInAudiobookPlaying => 'Se redă acest pasaj din cartea audio';

  @override
  String get catchUpAudioAhead =>
      'Cartea audio este mai avansată. Atinge pentru a merge acolo.';

  @override
  String get catchUpPageAhead =>
      'Această pagină este înaintea cărții audio. Atinge pentru a muta cartea audio aici.';

  @override
  String get readerShortcutButton => 'Buton de comandă rapidă';

  @override
  String get keepScreenOn => 'Menține ecranul pornit';

  @override
  String get keepScreenOnActive => 'Ecranul rămâne pornit';

  @override
  String get keepScreenOnUntilClosed =>
      'Ecranul rămâne pornit până închizi aplicația';

  @override
  String get keepScreenOnOff => 'Ecranul se poate stinge din nou';

  @override
  String get keepScreenOnOffUntilRestart =>
      'Oprit până la repornirea aplicației. Comutatorul din Setări rămâne activat';

  @override
  String get keepScreenOnPlayer => 'Menține ecranul pornit în player';

  @override
  String get keepScreenOnPlayerSubtitle =>
      'Ecranul rămâne pornit cât timp playerul este deschis';

  @override
  String get keepScreenOnCarMode => 'Menține ecranul pornit în modul mașină';

  @override
  String get keepScreenOnCarModeSubtitle =>
      'Ecranul rămâne pornit cât timp modul mașină este deschis';

  @override
  String get loginServerType => 'Tip de server';

  @override
  String get authBookOrbitDefaultPassword =>
      'Acest cont are încă parola implicită. Schimb-o în BookOrbit, apoi conectează-te din nou.';

  @override
  String get authBookOrbitPasswordOff =>
      'Conectarea cu parolă este dezactivată pe acest server. Conectează-te cu un link magic sau prin autentificare unică.';

  @override
  String get authServerIsBookOrbit =>
      'Acesta este un server BookOrbit. Alege BookOrbit deasupra adresei serverului.';

  @override
  String get authServerIsAudiobookshelf =>
      'Acesta este un server Audiobookshelf. Alege Audiobookshelf deasupra adresei serverului.';

  @override
  String get castNotAvailableBookOrbit =>
      'Proiectarea (cast) nu este disponibilă cu serverele BookOrbit';

  @override
  String get loginMagicLink => 'Link magic';

  @override
  String get loginMagicLinkDescription =>
      'Conectează-te cu un link magic BookOrbit sau lipește un link de parolă pentru a-ți seta parola.';

  @override
  String get collectionPublicTitle => 'Publică';

  @override
  String get collectionPublicSubtitle =>
      'Toți cei de pe acest server pot vedea această colecție';

  @override
  String loginSignInWithProvider(String provider) {
    return 'Conectează-te cu $provider';
  }

  @override
  String get loginSignInWithSso => 'Conectează-te cu SSO';

  @override
  String get loginChooseSsoProvider => 'Alege cum te conectezi';

  @override
  String get loginRedirectUriBookOrbit =>
      'URI de redirecționare: bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => 'Stare de citire';

  @override
  String get readStatusHint =>
      'BookOrbit păstrează o stare pe care o alegi aici până o schimbi.';

  @override
  String get readStatusUnread => 'Necitită';

  @override
  String get readStatusWantToRead => 'Vreau să o citesc';

  @override
  String get readStatusReading => 'În citire';

  @override
  String get readStatusOnHold => 'În așteptare';

  @override
  String get readStatusRereading => 'Recitită';

  @override
  String get readStatusRead => 'Citită';

  @override
  String get readStatusSkimmed => 'Răsfoită';

  @override
  String get readStatusAbandoned => 'Abandonată';

  @override
  String get personalNoteTitle => 'Notița ta';

  @override
  String get personalNoteAdd => 'Adaugă o notiță privată';

  @override
  String get personalNoteHint => 'Doar tu poți vedea această notiță.';

  @override
  String get moreLikeThis => 'Mai multe ca aceasta';

  @override
  String get coverSlotAudiobook => 'Coperta cărții audio';

  @override
  String get coverSlotBook => 'Coperta cărții';

  @override
  String get cardButtonFill => 'Fundalul butoanelor';

  @override
  String get cardButtonFillSubtitle =>
      'Cum sunt umplute butoanele de pe cardul playerului';

  @override
  String get cardButtonFillClear => 'Transparent';

  @override
  String get cardButtonFillSubtle => 'Discret';

  @override
  String get cardButtonFillSolid => 'Plin';

  @override
  String get loginBookOrbitPreview =>
      'Suportul pentru BookOrbit este nou. Redarea, descărcările și navigarea funcționează, dar unele ecrane pot arăta sau funcționa încă precum Audiobookshelf. Urmărește progresul pe GitHub și spune-ne dacă ceva nu pare în regulă.';

  @override
  String get signedOutTapToSignIn =>
      'Deconectat. Atinge pentru a te conecta din nou.';

  @override
  String get authSignedOutKeepListening =>
      'Ai fost deconectat. Descărcările se redau în continuare. Atinge norul roșu pentru a te conecta din nou.';

  @override
  String signedOutSyncNote(String username, String server) {
    return 'Ce asculți cât timp ești deconectat se păstrează pe acest telefon și se sincronizează când te conectezi din nou ca $username pe $server. Orice mod de conectare la acel cont funcționează.';
  }

  @override
  String get comicReadingDirection => 'Direcția de citire';

  @override
  String comicPageNumber(int page) {
    return 'Pagina $page';
  }

  @override
  String get comicBookmarkRemoveFailed =>
      'Nu s-a putut elimina marcajul de pe server. Încearcă din nou când ești online.';

  @override
  String get comicLeftToRight => 'De la stânga la dreapta';

  @override
  String get comicRightToLeft => 'De la dreapta la stânga (manga)';

  @override
  String get comicNeedsConnection =>
      'Această bandă desenată se deschide pagină cu pagină de pe server, deci necesită o conexiune.';

  @override
  String get comicNoPages => 'Nu s-au găsit pagini în această bandă desenată.';

  @override
  String get boAdminTitle => 'Administrare server';

  @override
  String get boAdminSubtitle =>
      'Utilizatorii și bibliotecile de pe acest server BookOrbit';

  @override
  String get boAdminUsers => 'Utilizatori';

  @override
  String get boAdminLibraries => 'Biblioteci';

  @override
  String boAdminUserCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de persoane',
      few: '$count persoane',
      one: '1 persoană',
    );
    return '$_temp0';
  }

  @override
  String boAdminLibraryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de biblioteci',
      few: '$count biblioteci',
      one: '1 bibliotecă',
    );
    return '$_temp0';
  }

  @override
  String get boAdminSaved => 'Salvat';

  @override
  String get boAdminFailed => 'Nu a funcționat. Încearcă din nou.';

  @override
  String get boAdminOffline => 'Serverul nu a putut fi contactat.';

  @override
  String get boUsersSearch => 'Caută utilizatori';

  @override
  String get boUsersNone => 'Niciun utilizator aici';

  @override
  String get boUsersFilterAll => 'Toți';

  @override
  String get boUsersFilterAdmins => 'Administratori';

  @override
  String get boUsersFilterActive => 'Activi';

  @override
  String get boUsersFilterInactive => 'Inactivi';

  @override
  String get boUsersFilterAttention => 'Necesită atenție';

  @override
  String get boUserBadgeAdmin => 'Admin';

  @override
  String get boUserBadgeInactive => 'Inactiv';

  @override
  String get boUserBadgeLocked => 'Blocat';

  @override
  String get boUserBadgeNoPassword => 'Încă fără parolă';

  @override
  String boUserLastActive(String date) {
    return 'Ultima activitate $date';
  }

  @override
  String get boUserNeverSignedIn => 'Nu s-a conectat niciodată';

  @override
  String get boUserNew => 'Utilizator nou';

  @override
  String get boUserCreate => 'Creează';

  @override
  String get boUserUsername => 'Nume de utilizator';

  @override
  String get boUserUsernameHint =>
      'Cel puțin 3 caractere. Nu poate fi schimbat ulterior.';

  @override
  String get boUserName => 'Nume';

  @override
  String get boUserEmail => 'E-mail';

  @override
  String get boUserEmailInvalid => 'Introdu o adresă de e-mail validă';

  @override
  String get boUserActive => 'Activ';

  @override
  String get boUserActiveSubtitle => 'Utilizatorii inactivi nu se pot conecta';

  @override
  String get boUserAdmin => 'Administrator';

  @override
  String get boUserAdminSubtitle => 'Acces complet la tot ce este pe server';

  @override
  String get boUserAdminHasAll =>
      'Administratorii au toate permisiunile și văd toate bibliotecile.';

  @override
  String get boUserPermissions => 'Permisiuni';

  @override
  String get boUserPresetNone => 'Niciuna';

  @override
  String get boUserPresetStandard => 'Standard';

  @override
  String get boUserPresetEverything => 'Toate';

  @override
  String get boUserLibraries => 'Biblioteci';

  @override
  String get boUserLibrariesHint =>
      'Bibliotecile pe care le poate vedea această persoană.';

  @override
  String get boUserPasswordLink => 'Trimite link de parolă';

  @override
  String get boUserPasswordLinkSubtitle =>
      'Un link pentru setarea unei parole noi, valabil 15 minute';

  @override
  String get boUserExternal =>
      'Se conectează prin autentificare unică, așa că parola este gestionată acolo.';

  @override
  String get boUserUnlock => 'Deblochează contul';

  @override
  String get boUserUnlocked => 'Cont deblocat';

  @override
  String get boUserDelete => 'Șterge utilizatorul';

  @override
  String boUserDeleteTitle(String name) {
    return 'Ștergi $name?';
  }

  @override
  String get boUserDeleteBody =>
      'Contul și tot ce are pe acest server vor fi eliminate. Acțiunea nu poate fi anulată.';

  @override
  String get boUserDeleted => 'Utilizator șters';

  @override
  String get boUserLinkTitle => 'Link de parolă';

  @override
  String boUserLinkBody(String name) {
    return 'Trimite acest link lui $name. Îi permite să seteze o parolă și este valabil 15 minute.';
  }

  @override
  String get boPasswordRules =>
      'Cel puțin 8 caractere, cu o literă mare, o literă mică și o cifră.';

  @override
  String get boSetPasswordTitle => 'Setează-ți parola';

  @override
  String get boSetPasswordSubmit => 'Setează parola și conectează-te';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return 'Alege o parolă pentru $username pe $server.';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return 'Alege o parolă pentru contul tău de pe $server.';
  }

  @override
  String get boSetPasswordStartingBody =>
      'Acest cont are încă parola cu care a fost creat. Alege una nouă pentru a încheia conectarea.';

  @override
  String get boSetPasswordTrust =>
      'Continuă doar dacă ai încredere în cine ți-a trimis acest link.';

  @override
  String get boPasswordLinkExpired =>
      'Acest link a expirat sau a fost deja folosit. Cere administratorului serverului unul nou.';

  @override
  String boPasswordSetSignInFailed(String error) {
    return 'Parola ta a fost setată, dar conectarea a eșuat: $error';
  }

  @override
  String get boChangePasswordSubtitle => 'Actualizează-ți parola BookOrbit';

  @override
  String get boPasswordChangeEffect =>
      'Schimbarea parolei te deconectează de pe celelalte sesiuni BookOrbit. Acest dispozitiv rămâne conectat.';

  @override
  String get boPasswordChanged =>
      'Parola a fost schimbată. Celelalte dispozitive conectate au fost deconectate.';

  @override
  String boPasswordShareDescription(String username) {
    return 'Trimite acest link sau cere-i lui $username să scaneze codul QR pentru a alege o parolă și a se conecta la Absorb. Este valabil 15 minute.';
  }

  @override
  String boPasswordShareWarning(String username) {
    return 'Oricine are acest link poate alege parola pentru $username până când este folosit sau expiră.';
  }

  @override
  String get setupLinkCopyWebLink => 'Copiază linkul web';

  @override
  String get boUserLinkCopy => 'Copiază linkul';

  @override
  String get boUserLinkCopied => 'Link copiat';

  @override
  String get boUserLinkShare => 'Partajează';

  @override
  String get boUserNoLink =>
      'Utilizatorul a fost adăugat, dar serverul nu a trimis niciun link de parolă. Trimite unul de pe pagina lui.';

  @override
  String get boPermGroupLibrary => 'Bibliotecă și cărți';

  @override
  String get boPermGroupRequests => 'Cereri de cărți';

  @override
  String get boPermGroupDevices => 'Dispozitive';

  @override
  String get boPermGroupIntegrations => 'Integrări de citire';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => 'E-mail și notificări';

  @override
  String get boPermGroupAdmin => 'Administrare';

  @override
  String get boPermLibraryDownload => 'Descarcă cărți';

  @override
  String get boPermLibraryUpload => 'Încarcă cărți';

  @override
  String get boPermLibraryEditMetadata => 'Editează metadatele';

  @override
  String get boPermLibraryDeleteBooks => 'Șterge cărți';

  @override
  String get boPermBookRequestAccess => 'Cere cărți';

  @override
  String get boPermBookRequestAutoApprove => 'Cereri aprobate automat';

  @override
  String get boPermBookRequestSelfFulfill => 'Descarcă direct cărțile cerute';

  @override
  String get boPermManageBookRequests => 'Gestionează cererile de cărți';

  @override
  String get boPermKoboSync => 'Sincronizare Kobo';

  @override
  String get boPermKoreaderSync => 'Sincronizare KOReader';

  @override
  String get boPermOpdsAccess => 'Acces OPDS';

  @override
  String get boPermHardcoverSync => 'Sincronizare Hardcover';

  @override
  String get boPermReadwiseSync => 'Sincronizare Readwise';

  @override
  String get boPermStorygraphSync => 'Sincronizare StoryGraph';

  @override
  String get boPermBookDockAccess => 'Folosește Book Dock';

  @override
  String get boPermManageBookDock => 'Gestionează Book Dock';

  @override
  String get boPermEmailSend => 'Trimite cărți prin e-mail';

  @override
  String get boPermNotificationAccess => 'Notificări';

  @override
  String get boPermManageEmail => 'Gestionează e-mailul';

  @override
  String get boPermManageLibraries => 'Gestionează bibliotecile';

  @override
  String get boPermManageMetadataConfig => 'Setări de metadate';

  @override
  String get boPermManageIcons => 'Gestionează pictogramele';

  @override
  String get boPermManageUsers => 'Gestionează utilizatorii';

  @override
  String get boPermViewUserActivity => 'Vezi activitatea utilizatorilor';

  @override
  String get boPermViewAuditLog => 'Vezi jurnalul de audit';

  @override
  String get boPermManageAppSettings => 'Setările aplicației';

  @override
  String get boLibsNone => 'Încă nu există biblioteci';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți',
      few: '$count cărți',
      one: '1 carte',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => 'Scanează acum';

  @override
  String get boLibScanStarted => 'Scanare pornită';

  @override
  String get boLibScanning => 'Se scanează';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return 'Scanat $date: $added adăugate, $updated actualizate, $missing lipsă';
  }

  @override
  String get boLibScanFailed => 'Ultima scanare a eșuat';

  @override
  String get boLibNeverScanned => 'Încă nescanată';

  @override
  String get boLibNew => 'Bibliotecă nouă';

  @override
  String get boLibName => 'Nume';

  @override
  String get boLibNeedName => 'Dă un nume bibliotecii';

  @override
  String get boLibIcon => 'Pictogramă';

  @override
  String get boLibFolders => 'Dosare';

  @override
  String get boLibFoldersHint =>
      'Dosarele de pe server în care se află cărțile acestei biblioteci.';

  @override
  String get boLibNeedFolder => 'Adaugă cel puțin un dosar';

  @override
  String get boLibAddFolder => 'Adaugă dosar';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fișiere',
      few: '$count fișiere',
      one: '1 fișier',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return 'Deja în $library';
  }

  @override
  String get boLibFolderUnreadable => 'Serverul nu poate citi acest dosar';

  @override
  String get boLibFolderRescan => 'Schimbarea dosarelor rescanează biblioteca.';

  @override
  String get boLibOrganization => 'Cărțile sunt stocate ca';

  @override
  String get boLibPerFolder => 'O carte pe dosar';

  @override
  String get boLibPerFile => 'O carte pe fișier';

  @override
  String get boLibOrganizationFixed =>
      'Aceasta nu poate fi schimbată după crearea bibliotecii.';

  @override
  String get boLibWatch => 'Urmărește modificările';

  @override
  String get boLibWatchSubtitle =>
      'Preia fișierele noi și modificate pe măsură ce apar';

  @override
  String get boLibSchedule => 'Scanare programată';

  @override
  String get boLibScheduleOff => 'Oprită';

  @override
  String get boLibScheduleDaily => 'Zilnic';

  @override
  String get boLibScheduleWeekly => 'Săptămânal';

  @override
  String boLibScheduleCustom(String cron) {
    return 'Personalizat ($cron)';
  }

  @override
  String get boLibScheduleHint => 'Rulează la ora 3:00, ora serverului.';

  @override
  String get boLibCovers => 'Forma copertei';

  @override
  String get boLibCoverBook => 'Carte (2:3)';

  @override
  String get boLibCoverSquare => 'Pătrată (1:1)';

  @override
  String get boLibAccess => 'Cine o poate vedea';

  @override
  String get boLibAccessHint =>
      'Administratorii văd toate bibliotecile. Ceilalți au nevoie de acces aici.';

  @override
  String get boLibAccessNone => 'Deocamdată doar administratorii';

  @override
  String get boLibAccessAdd => 'Adaugă persoană';

  @override
  String get boLibAccessEveryoneHas => 'Toată lumea are deja acces';

  @override
  String get boLibLevelViewer => 'Vizualizare';

  @override
  String get boLibLevelEditor => 'Editare';

  @override
  String get boLibLevelOwner => 'Proprietar';

  @override
  String get boLibAccessRemove => 'Elimină accesul';

  @override
  String get boLibDelete => 'Șterge biblioteca';

  @override
  String boLibDeleteTitle(String name) {
    return 'Ștergi $name?';
  }

  @override
  String get boLibDeleteBody =>
      'Biblioteca este eliminată din BookOrbit, împreună cu progresul și evidențierile cărților ei. Fișierele de pe server rămân unde sunt.';

  @override
  String get boLibDeleted => 'Bibliotecă ștearsă';

  @override
  String get boFolderPickTitle => 'Alege un dosar';

  @override
  String get boFolderUseThis => 'Folosește acest dosar';

  @override
  String get boFolderEmpty => 'Niciun dosar înăuntru';

  @override
  String get statsTotalTime => 'TIMP TOTAL';

  @override
  String get statsTotalReadingTime => 'TIMP TOTAL DE CITIRE';

  @override
  String statsDaysOfTime(String days) {
    return 'Adică $days zile';
  }

  @override
  String statsHoursOfTime(String hours) {
    return 'Adică $hours ore';
  }

  @override
  String get statsMediaAll => 'Toate';

  @override
  String get statsMediaListening => 'Ascultare';

  @override
  String get statsMediaReading => 'Citire';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'BookOrbit îți numără zilele în $server, dar acest telefon este setat pe $phone. Orele târzii din zi pot ajunge în ziua greșită.';
  }

  @override
  String statsZoneUse(String zone) {
    return 'Folosește $zone';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'BookOrbit folosește acum $zone. Zilele mai vechi pot dura câteva minute până se actualizează.';
  }

  @override
  String get statsZoneFailed => 'Nu s-a putut schimba fusul orar în BookOrbit';

  @override
  String get statsTimeOfDay => 'Ora din zi';

  @override
  String statsBusiestAround(String time) {
    return 'Cea mai aglomerată în jurul orei $time';
  }

  @override
  String get statsFinishedByMonth => 'Cărți terminate pe luni';

  @override
  String statsFinishedLast12(int count) {
    return '$count în ultimele 12 luni';
  }

  @override
  String get statsWhereTitle => 'Unde asculți și citești';

  @override
  String get statsLast12Months => 'Ultimele 12 luni';

  @override
  String get statsHabits => 'Obiceiuri';

  @override
  String get statsTypicalSession => 'Sesiune tipică';

  @override
  String get statsProgressPerSession => 'Progres pe sesiune';

  @override
  String get statsTimeToFinish => 'Timp până la final';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de zile',
      few: '$count zile',
      one: '1 zi',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => 'Cărți începute';

  @override
  String get statsBooksInProgress => 'În curs';

  @override
  String get statsAverageProgress => 'Progres mediu';

  @override
  String get statsTopBooks => 'Top cărți';

  @override
  String get statsYearRead => 'Citit';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de necitite',
      few: '$count necitite',
      one: '1 necitită',
      zero: 'Nimic nou',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => 'Marchează toate ca citite';

  @override
  String get boNotificationsClearAll => 'Șterge toate';

  @override
  String get boNotificationsClearTitle => 'Ștergi toate notificările?';

  @override
  String get boNotificationsClearBody =>
      'Aceasta elimină toate notificările din contul tău BookOrbit.';

  @override
  String get boNotificationsEmpty => 'Încă nu există notificări';

  @override
  String get boNotificationsLoadFailed => 'Nu s-au putut încărca notificările';

  @override
  String get boNotificationsUpdateFailed =>
      'Nu s-au putut actualiza notificările în BookOrbit';

  @override
  String boNotificationsOccurrences(int count) {
    return 'S-a întâmplat de $count ori';
  }

  @override
  String get boNotificationsSettings => 'Setări notificări';

  @override
  String get boNotificationsSettingsIntro =>
      'Alege ce notificări păstrează BookOrbit pentru tine.';

  @override
  String get boNotificationsProblemsHint =>
      'Problemele te notifică doar când ceva eșuează sau necesită atenție.';

  @override
  String get boNotificationLevelOff => 'Oprite';

  @override
  String get boNotificationLevelProblems => 'Probleme';

  @override
  String get boNotificationLevelAll => 'Toate';

  @override
  String get boNotificationsSaved => 'Setările notificărilor au fost salvate';

  @override
  String get boNotificationsSaveFailed =>
      'Nu s-au putut salva setările notificărilor';

  @override
  String get boNotificationGroupLibrary => 'Bibliotecă';

  @override
  String get boNotificationGroupFiles => 'Fișiere';

  @override
  String get boNotificationGroupIntegrations => 'Integrări';

  @override
  String get boNotificationGroupPersonal => 'Personale';

  @override
  String get boNotifyScanning => 'Scanarea bibliotecii';

  @override
  String get boNotifyScanningDesc =>
      'Când o scanare a bibliotecii se termină, eșuează sau găsește cărți lipsă.';

  @override
  String get boNotifyMetadata => 'Preluarea metadatelor';

  @override
  String get boNotifyMetadataDesc =>
      'Când căutările de metadate pentru cărțile tale se termină sau eșuează.';

  @override
  String get boNotifyAuthorEnrichment => 'Detalii despre autori';

  @override
  String get boNotifyAuthorEnrichmentDesc =>
      'Când biografiile și fotografiile autorilor se termină de descărcat.';

  @override
  String get boNotifyFileWriteBack => 'Salvarea în fișiere';

  @override
  String get boNotifyFileWriteBackDesc =>
      'Când detaliile editate sunt salvate în fișierele cărților de pe disc.';

  @override
  String get boNotifyFileRename => 'Redenumirea fișierelor';

  @override
  String get boNotifyFileRenameDesc =>
      'Când un fișier de carte este redenumit conform modelului tău de denumire.';

  @override
  String get boNotifyBulkRename => 'Redenumire în masă';

  @override
  String get boNotifyBulkRenameDesc =>
      'Când redenumirea mai multor cărți sau mutarea cărților între biblioteci se termină sau eșuează.';

  @override
  String get boNotifyMigration => 'Importuri';

  @override
  String get boNotifyMigrationDesc =>
      'Când un import din altă aplicație de biblioteci se termină sau eșuează.';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc =>
      'Când Book Dock termină de adăugat cărți sau întâmpină probleme.';

  @override
  String get boNotifyBookRequests => 'Cereri de cărți';

  @override
  String get boNotifyBookRequestsDesc =>
      'Când o cerere de carte este trimisă sau soluționată ori cartea devine disponibilă.';

  @override
  String get boNotifyEmail => 'Trimiterea e-mailurilor';

  @override
  String get boNotifyEmailDesc =>
      'Când trimiterea unei cărți prin e-mail reușește sau eșuează.';

  @override
  String get boNotifyAchievements => 'Realizări';

  @override
  String get boNotifyAchievementsDesc => 'Când deblochezi o realizare nouă.';

  @override
  String get achievementsTitle => 'Realizări';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return '$earned din $total obținute';
  }

  @override
  String get achievementsFilterAll => 'Toate';

  @override
  String get achievementsFilterEarned => 'Obținute';

  @override
  String get achievementsFilterInProgress => 'În curs';

  @override
  String get achievementsFilterLocked => 'Blocate';

  @override
  String get achievementsCategoryReading => 'Citire';

  @override
  String get achievementsCategoryLibrary => 'Bibliotecă';

  @override
  String get achievementsCategoryExploration => 'Explorare';

  @override
  String get achievementsCategoryDedication => 'Dedicare';

  @override
  String get achievementsCategoryDevices => 'Dispozitive';

  @override
  String get achievementsRarityCommon => 'Comună';

  @override
  String get achievementsRarityRare => 'Rară';

  @override
  String get achievementsRarityEpic => 'Epică';

  @override
  String get achievementsRarityLegendary => 'Legendară';

  @override
  String get achievementsLoadFailed => 'Nu s-au putut încărca realizările';

  @override
  String get achievementsNoneMatch =>
      'Nicio realizare nu se potrivește cu acest filtru';

  @override
  String get achievementsSecretName => 'Realizare secretă';

  @override
  String get achievementsSecretHint =>
      'Continuă să citești pentru a o dezvălui.';

  @override
  String achievementsEarnedOn(String date) {
    return 'Obținută $date';
  }

  @override
  String achievementsWhileReading(String title) {
    return 'În timp ce citeai $title';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return 'Nivelul $earned din $total';
  }

  @override
  String get achievementsTiers => 'Niveluri';

  @override
  String get achievementsAllTiers => 'Toate nivelurile obținute';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold cărți';
  }

  @override
  String achievementsProgressPages(String current, String threshold) {
    return '$current / $threshold pagini';
  }

  @override
  String achievementsProgressHours(String current, String threshold) {
    return '$current / $threshold ore';
  }

  @override
  String achievementsProgressAnnotations(String current, String threshold) {
    return '$current / $threshold evidențieri și notițe';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold evaluări';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $threshold genuri';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold limbi';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold zile';
  }

  @override
  String get achievementsHowToGetIt => 'Cum o obții';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ai citit $count de ore în ultimele $days zile.',
      few: 'Ai citit $count ore în ultimele $days zile.',
      one: 'Ai citit 1 oră în ultimele $days zile.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aproximativ $count de zile în acest ritm.',
      few: 'Aproximativ $count zile în acest ritm.',
      one: 'Aproximativ 1 zi în acest ritm.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aproximativ $count de săptămâni în acest ritm.',
      few: 'Aproximativ $count săptămâni în acest ritm.',
      one: 'Aproximativ 1 săptămână în acest ritm.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aproximativ $count de luni în acest ritm.',
      few: 'Aproximativ $count luni în acest ritm.',
      one: 'Aproximativ 1 lună în acest ritm.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți din anii $decade te așteaptă pe rafturi.',
      few: '$count cărți din anii $decade te așteaptă pe rafturi.',
      one: 'O carte din anii $decade te așteaptă pe rafturi.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți din secolul $century te așteaptă pe rafturi.',
      few: '$count cărți din secolul $century te așteaptă pe rafturi.',
      one: 'O carte din secolul $century te așteaptă pe rafturi.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return '$title este citită $percent și a fost începută pe $date.';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return '$title a fost începută pe $date.';
  }

  @override
  String get achievementsHintUntitledBook => 'O carte în curs';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți în curs au depășit $percent.',
      few: '$count cărți în curs au depășit $percent.',
      one: 'O carte în curs a depășit $percent.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count de cărți pe care le-ai terminat nu au încă nicio evaluare.',
      few: '$count cărți pe care le-ai terminat nu au încă nicio evaluare.',
      one: 'O carte pe care ai terminat-o nu are încă nicio evaluare.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți sub $pages de pagini te așteaptă pe rafturi.',
      few: '$count cărți sub $pages de pagini te așteaptă pe rafturi.',
      one: 'O carte sub $pages de pagini te așteaptă pe rafturi.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sunt deja în curs.',
      few: '$count sunt deja în curs.',
      one: 'Una este deja în curs.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count de cărți de $pages pagini sau mai mult te așteaptă pe rafturi.',
      few: '$count cărți de $pages pagini sau mai mult te așteaptă pe rafturi.',
      one: 'O carte de $pages pagini sau mai mult te așteaptă pe rafturi.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count de cărți publicate înainte de $year te așteaptă pe rafturi.',
      few: '$count cărți publicate înainte de $year te așteaptă pe rafturi.',
      one: 'O carte publicată înainte de $year te așteaptă pe rafturi.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author: $finished terminate, încă $count pe rafturile tale.';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți în $language te așteaptă pe rafturi.',
      few: '$count cărți în $language te așteaptă pe rafturi.',
      one: 'O carte în $language te așteaptă pe rafturi.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ai citit până acum în $count de luni din $year.',
      few: 'Ai citit până acum în $count luni din $year.',
      one: 'Ai citit până acum într-o lună din $year.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Au mai rămas $months.',
      few: 'Au mai rămas $months.',
      one: 'Mai rămâne $months.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return 'Nicio carte de pe rafturile tale nu are $pages pagini sau mai mult.';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return 'Nimic de pe rafturile tale nu a fost publicat înainte de $year.';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rafturile tale acoperă până acum doar $count de decenii.',
      few: 'Rafturile tale acoperă până acum doar $count decenii.',
      one: 'Rafturile tale acoperă până acum doar 1 deceniu.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rafturile tale acoperă până acum doar $count de secole.',
      few: 'Rafturile tale acoperă până acum doar $count secole.',
      one: 'Rafturile tale acoperă până acum doar 1 secol.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return 'Nu ai citit în $month, deci $year este departe de atins. Numărătoarea reîncepe în ianuarie.';
  }

  @override
  String get achievementsSwitch => 'Realizări';

  @override
  String get achievementsSwitchSubtitle =>
      'Urmărește realizările în BookOrbit. Dezactivarea lor le ascunde aici și pe web.';

  @override
  String get achievementsTurnedOn => 'Realizări activate';

  @override
  String get achievementsTurnedOff => 'Realizări dezactivate';

  @override
  String get achievementsSwitchFailed =>
      'Nu s-au putut schimba realizările în BookOrbit';

  @override
  String get boNotifyReadAlong => 'Citiri sincronizate';

  @override
  String get boNotifyReadAlongDesc =>
      'Când o citire sincronizată pornită de tine este gata, necesită verificare sau eșuează.';

  @override
  String get readAlongCreate => 'Creează citire sincronizată';

  @override
  String get readAlongLoadFailed =>
      'Nu s-a putut verifica dacă se poate crea o citire sincronizată pentru această carte.';

  @override
  String get readAlongCheckAgain => 'Verifică din nou';

  @override
  String get readAlongWhyWorkerOffline =>
      'Procesorul de citiri sincronizate din BookOrbit este offline acum.';

  @override
  String get readAlongWhyWorkerOutdated =>
      'Procesorul de citiri sincronizate din BookOrbit trebuie actualizat pentru a funcționa cu acest server.';

  @override
  String get readAlongWhyFilesMissing =>
      'Restaurează fișierele lipsă ale acestei cărți pentru a crea o citire sincronizată.';

  @override
  String get readAlongWhyNoEpub =>
      'Adaugă un EPUB simplu la această carte pentru a crea o citire sincronizată.';

  @override
  String get readAlongWhyNoEpubHasOne =>
      'Această carte are deja o citire sincronizată și niciun EPUB simplu din care să se creeze alta.';

  @override
  String get readAlongWhyTooManyTracks =>
      'Acest audiobook are mai multe fișiere decât poate folosi o citire sincronizată.';

  @override
  String get readAlongWhyEpubNotAllowed =>
      'Această bibliotecă nu acceptă fișiere EPUB, deci nu se poate adăuga o citire sincronizată.';

  @override
  String get readAlongWhyNotMounted =>
      'Procesorul de citiri sincronizate din BookOrbit nu poate accesa folderul acestei biblioteci.';

  @override
  String get readAlongWhyRunning =>
      'Se creează deja o citire sincronizată pentru această carte.';

  @override
  String get readAlongWhyUnknown =>
      'Momentan nu se poate crea o citire sincronizată pentru această carte.';

  @override
  String get readAlongSheetTitle => 'Creează o citire sincronizată';

  @override
  String get readAlongSheetIntro =>
      'BookOrbit potrivește narațiunea cu textul cărții electronice și adaugă un EPUB care evidențiază textul în ritmul audio.';

  @override
  String get readAlongEbook => 'Carte electronică';

  @override
  String get readAlongEbookHint =>
      'Alege EPUB-ul simplu care corespunde narațiunii.';

  @override
  String get readAlongAudio => 'Audiobook';

  @override
  String readAlongTracks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de piste',
      few: '$count piste',
      one: '1 pistă',
    );
    return '$_temp0';
  }

  @override
  String readAlongExistingTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Această carte are deja $count de citiri sincronizate',
      few: 'Această carte are deja $count citiri sincronizate',
      one: 'Această carte are deja o citire sincronizată',
    );
    return '$_temp0';
  }

  @override
  String readAlongReplace(String name) {
    return 'Înlocuiește $name';
  }

  @override
  String readAlongKeepBoth(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Păstrează-le pe toate',
      one: 'Păstrează ambele',
    );
    return '$_temp0';
  }

  @override
  String get readAlongKeepHint =>
      'Noua citire sincronizată este adăugată ca fișier separat.';

  @override
  String get readAlongReplaceHint =>
      'Fișierul vechi este înlocuit abia după ce cel nou trece verificările, iar pozițiile de citire se păstrează.';

  @override
  String get readAlongReplaceNotAllowed =>
      'Înlocuirea unei citiri sincronizate necesită permisiunea de a șterge cărți, așa că cea nouă este adăugată ca fișier separat.';

  @override
  String get readAlongMadeByBookOrbit => 'Creată de BookOrbit';

  @override
  String get readAlongImported => 'Importată';

  @override
  String get readAlongLanguage => 'Limba narațiunii';

  @override
  String get readAlongPickLanguage => 'Alege o limbă';

  @override
  String readAlongLanguageUnsupported(String language) {
    return 'Modelul vocal nu cunoaște limba acestei cărți ($language).';
  }

  @override
  String get readAlongLanguageFromBook => 'Din detaliile acestei cărți.';

  @override
  String get readAlongLanguageIsDefault => 'Limba ta implicită.';

  @override
  String get readAlongLanguageSaved => 'Salvată ca limbă implicită.';

  @override
  String get readAlongSetDefault => 'Setează ca implicită';

  @override
  String get readAlongDefaultFailed => 'Limba implicită nu a putut fi salvată.';

  @override
  String get readAlongHighlighting => 'Evidențiere';

  @override
  String get readAlongSentence => 'Propoziție';

  @override
  String get readAlongSentenceHint =>
      'Evidențiază câte o propoziție. Recomandat.';

  @override
  String get readAlongWord => 'Cuvânt';

  @override
  String get readAlongWordHint =>
      'Evidențiază fiecare cuvânt. Durează mai mult și produce un fișier mai mare. Încă experimental.';

  @override
  String readAlongEstimatedSize(String size) {
    return 'Dimensiune estimată: $size';
  }

  @override
  String get readAlongBackgroundNote =>
      'Rulează pe server, deci poți închide această fereastră. Audiobookurile lungi pot dura ore, iar prima rulare pentru o limbă descarcă modelul vocal.';

  @override
  String readAlongLowDisk(String needed, String free) {
    return 'Spațiu pe disc insuficient: sunt necesari aproximativ $needed de spațiu de lucru pe procesor, care are $free liberi.';
  }

  @override
  String get readAlongStart => 'Începe';

  @override
  String get readAlongStartFailed =>
      'Citirea sincronizată nu a putut porni. Încearcă din nou.';

  @override
  String get readAlongStartInvalid =>
      'Unele fișiere alese nu se mai află la această carte. Verifică-le și încearcă din nou.';

  @override
  String get readAlongStartOffline =>
      'Procesorul de citiri sincronizate din BookOrbit este offline. Încearcă mai târziu.';

  @override
  String get readAlongNotAllowed => 'Nu ai permisiunea de a face asta.';

  @override
  String get readAlongGone =>
      'Această lucrare de citire sincronizată nu mai există.';

  @override
  String get readAlongMovedOn =>
      'Această lucrare avansase deja. Acum se afișează starea ei curentă.';

  @override
  String get readAlongActionFailed => 'Nu a funcționat. Încearcă din nou.';

  @override
  String readAlongStartedBy(String name) {
    return 'Pornită de $name';
  }

  @override
  String get readAlongStartedByOther => 'Pornită de alt utilizator';

  @override
  String get readAlongWaiting => 'Așteaptă să înceapă';

  @override
  String get readAlongNextInLine => 'Următoarea la rând';

  @override
  String readAlongJobsAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de lucrări înainte',
      few: '$count lucrări înainte',
      one: '1 lucrare înainte',
    );
    return '$_temp0';
  }

  @override
  String get readAlongStopping => 'Se oprește';

  @override
  String get readAlongStoppingHint =>
      'Se termină pasul curent, apoi se oprește. Nimic nu va fi adăugat la această carte.';

  @override
  String get readAlongStagePreparingAudio => 'Se pregătește audio';

  @override
  String get readAlongStageDownloadingModel => 'Se descarcă modelul vocal';

  @override
  String get readAlongStageListening => 'Se ascultă narațiunea';

  @override
  String get readAlongStageMarkingUp =>
      'Se marchează textul cărții electronice';

  @override
  String get readAlongStageAligning => 'Se potrivește textul cu narațiunea';

  @override
  String get readAlongStageChecking => 'Se verifică rezultatul';

  @override
  String get readAlongStagePublishing =>
      'Se adaugă citirea sincronizată la această carte';

  @override
  String get readAlongStageWorking => 'Se lucrează';

  @override
  String readAlongFileOf(int current, int total) {
    return 'Fișierul $current din $total';
  }

  @override
  String readAlongTrackOf(int current, int total) {
    return 'Pista $current din $total';
  }

  @override
  String readAlongChapterOf(int current, int total) {
    return 'Capitolul $current din $total';
  }

  @override
  String readAlongStepOf(int current, int total) {
    return 'Pasul $current din $total';
  }

  @override
  String get readAlongFirstRun => 'Prima rulare pentru această limbă';

  @override
  String get readAlongJustStarted => 'Abia a început';

  @override
  String readAlongRunningFor(String duration) {
    return 'Rulează de $duration';
  }

  @override
  String get readAlongStepAudio => 'Audio';

  @override
  String get readAlongStepSpeech => 'Voce';

  @override
  String get readAlongStepText => 'Text';

  @override
  String get readAlongStepAlign => 'Aliniere';

  @override
  String get readAlongStepCheck => 'Verificare';

  @override
  String get readAlongStepAdd => 'Adăugare';

  @override
  String get readAlongReviewTitle => 'Gata de verificare';

  @override
  String readAlongReviewMatched(String percent) {
    return '$percent din text s-a potrivit cu narațiunea. Verific-o înainte de a o adăuga la carte.';
  }

  @override
  String get readAlongReviewPlain =>
      'Verific-o înainte de a o adăuga la carte.';

  @override
  String get readAlongReviewWeb =>
      'Pentru a omite capitole și a potrivi din nou, deschide această carte în BookOrbit pe web.';

  @override
  String readAlongReviewExpires(String date) {
    return 'Va fi aruncată automat pe $date dacă nu o verifici.';
  }

  @override
  String get readAlongAddAnyway => 'Adaug-o oricum';

  @override
  String get readAlongDiscard => 'Aruncă';

  @override
  String get readAlongDiscardPrompt => 'Arunci această citire sincronizată?';

  @override
  String get readAlongKeepIt => 'Păstreaz-o';

  @override
  String get readAlongReady => 'Citire sincronizată gata';

  @override
  String get readAlongReadyWarnings =>
      'Citire sincronizată gata, cu avertismente';

  @override
  String get readAlongAdded => 'Adăugată la această carte ca EPUB nou.';

  @override
  String get readAlongReplaced =>
      'Citirea sincronizată veche a fost înlocuită. Pozițiile de citire se păstrează.';

  @override
  String readAlongMatchedSentences(String matched, String total) {
    return '$matched din $total propoziții s-au potrivit cu narațiunea';
  }

  @override
  String readAlongAudioUsed(String percent) {
    return '$percent din audio folosit';
  }

  @override
  String readAlongOutside(String chapters) {
    return 'Nu fac parte din narațiune, deci rămân fără audio: $chapters.';
  }

  @override
  String readAlongOutsideMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'încă $count de capitole',
      few: 'încă $count capitole',
      one: 'încă 1 capitol',
    );
    return '$_temp0';
  }

  @override
  String get readAlongWarnUnaligned =>
      'Una sau mai multe piste audio nu au putut fi potrivite.';

  @override
  String get readAlongWarnUnmatched =>
      'O parte considerabilă din textul cărții electronice nu s-a potrivit cu narațiunea.';

  @override
  String get readAlongWarnInterpolated =>
      'Sincronizarea unor texte a fost estimată între potrivirile sigure.';

  @override
  String get readAlongWarnDropped =>
      'Unele texte din cartea electronică au fost omise din evidențiere.';

  @override
  String get readAlongFailed => 'Citirea sincronizată a eșuat';

  @override
  String get readAlongCancelled => 'Citire sincronizată anulată';

  @override
  String get readAlongDiscarded => 'Citire sincronizată aruncată';

  @override
  String get readAlongNothingAdded =>
      'Nimic nu a fost adăugat la această carte.';

  @override
  String get readAlongExpired =>
      'Nu a fost verificată în 14 zile, deci nimic nu a fost adăugat la această carte.';

  @override
  String readAlongRetryUntil(String date) {
    return 'Reîncercarea reia de la ultimul pas terminat până pe $date.';
  }

  @override
  String get readAlongStartOver => 'Reîncepe';

  @override
  String get readAlongCancel => 'Anulează citirea sincronizată';

  @override
  String get readAlongCancelPrompt => 'Anulezi această citire sincronizată?';

  @override
  String get readAlongKeepRunning => 'Lasă să ruleze';

  @override
  String get readAlongErrorWorkerOffline =>
      'BookOrbit nu a putut contacta procesorul de citiri sincronizate.';

  @override
  String get readAlongErrorWorkerCrashed =>
      'Procesorul de citiri sincronizate s-a oprit neașteptat.';

  @override
  String get readAlongErrorSourceMissing => 'Un fișier ales nu mai există.';

  @override
  String get readAlongErrorSourceChanged =>
      'Un fișier ales s-a schimbat după pornirea lucrării.';

  @override
  String get readAlongErrorInvalidSource =>
      'EPUB-ul sau audiobookul nu a putut fi citit.';

  @override
  String get readAlongErrorLanguage =>
      'Modelul vocal nu cunoaște limba aleasă.';

  @override
  String get readAlongErrorStorage =>
      'Nu există suficient spațiu liber pe disc pe procesor pentru a termina.';

  @override
  String get readAlongErrorAudio => 'Audiobookul nu a putut fi pregătit.';

  @override
  String get readAlongErrorModel => 'Modelul vocal nu a putut fi descărcat.';

  @override
  String get readAlongErrorListening =>
      'Recunoașterea vocală a eșuat în timpul ascultării narațiunii.';

  @override
  String get readAlongErrorMarkup =>
      'Textul cărții electronice nu a putut fi pregătit pentru potrivire.';

  @override
  String get readAlongErrorAlignment =>
      'Textul nu a putut fi potrivit cu narațiunea.';

  @override
  String get readAlongErrorOutput => 'Noul EPUB nu a trecut verificările.';

  @override
  String get readAlongErrorPublish =>
      'Noul EPUB nu a putut fi adăugat la această carte.';

  @override
  String get readAlongErrorDiscarded => 'A fost aruncată la verificare.';

  @override
  String get readAlongErrorCancelled => 'A fost anulată.';

  @override
  String get readAlongErrorUnknown =>
      'Ceva nu a mers bine la crearea citirii sincronizate.';

  @override
  String get fileInfoNoAudiobook => 'Încă niciun audiobook';

  @override
  String get fileInfoNoEbook => 'Încă nicio carte electronică';

  @override
  String get fileInfoRequestedBySomeone => 'Solicitată de altcineva';

  @override
  String get fileInfoOwnedSeparately => 'În biblioteca ta ca o carte separată';

  @override
  String get fileInfoCopyPath => 'Copiază calea';

  @override
  String get fileInfoDeleteTitle => 'Ștergi fișierul?';

  @override
  String fileInfoDeletePrompt(String name) {
    return '„$name” va fi șters de pe server. Această acțiune nu poate fi anulată.';
  }

  @override
  String get fileInfoDeleteLast =>
      'Este ultimul fișier audio sau de carte electronică al cărții, deci cartea va apărea ca lipsă.';

  @override
  String get fileInfoDeleteNotAllowed =>
      'Nu ai permisiunea de a șterge fișiere';

  @override
  String get chapterSourceEmbedded => 'Citite din fișierele audio';

  @override
  String get chapterSourceTracks => 'Un capitol pe fișier audio, nesalvat';

  @override
  String get chapterSourceProvider => 'Din metadatele preluate';

  @override
  String get chapterSourceMigration => 'Importate din Audiobookshelf';

  @override
  String get chapterSourceManual => 'Editate în BookOrbit';

  @override
  String chapterSourceManualBy(String name) {
    return 'Editate de $name';
  }

  @override
  String get chapterSourceNone => 'Încă niciun capitol';

  @override
  String get chapterProtected => 'Protejate la rescanări';

  @override
  String get chapterNotProtected => 'O rescanare le poate înlocui';

  @override
  String get chapterProtectOnSave => 'Protejează la rescanări';

  @override
  String get chapterGetFrom => 'Preia capitolele din';

  @override
  String get chapterFromFiles => 'Fișierele audio';

  @override
  String get chapterFromEbookToc => 'Cuprinsul cărții electronice';

  @override
  String get chapterFromReadAlong => 'Citirea sincronizată';

  @override
  String get chapterFromHistory => 'Versiuni anterioare';

  @override
  String get chapterHistoryTitle => 'Versiuni anterioare';

  @override
  String get chapterHistoryEmpty => 'Versiunile salvate apar aici.';

  @override
  String chapterHistoryBy(String source, String name) {
    return '$source de $name';
  }

  @override
  String get chapterReadingFiles => 'Se citesc fișierele audio...';

  @override
  String get chapterRevertToFiles => 'Revino la fișiere';

  @override
  String get chapterRevertTitle => 'Revii la capitolele din fișiere?';

  @override
  String get chapterRevertMessage =>
      'BookOrbit citește din nou capitolele din fișierele audio și nu le mai protejează la rescanări. Modificările nesalvate se pierd. Lista curentă rămâne în versiunile anterioare.';

  @override
  String get chapterReverted =>
      'Capitolele au fost readuse la cele din fișierele audio';

  @override
  String get chapterWriteFiles => 'Scrie în fișiere';

  @override
  String get chapterWriteTitle => 'Scrii capitolele în fișierele audio?';

  @override
  String chapterWriteMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Cele $count de fișiere audio ale cărții vor fi rescrise cu aceste capitole.',
      few:
          'Cele $count fișiere audio ale cărții vor fi rescrise cu aceste capitole.',
      one: 'Fișierul audio al cărții va fi rescris cu aceste capitole.',
    );
    return '$_temp0 Sunetul în sine este copiat nemodificat. Telefoanele care au descărcat deja cartea își păstrează copia până la o nouă descărcare.';
  }

  @override
  String get chapterWriteConfirm => 'Scrie';

  @override
  String get chapterWriting => 'Se scriu capitolele în fișierele audio...';

  @override
  String chapterWritten(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Capitole scrise în toate cele $count de fișiere audio',
      few: 'Capitole scrise în toate cele $count fișiere audio',
      one: 'Capitole scrise în fișierul audio',
    );
    return '$_temp0';
  }

  @override
  String chapterWrittenPartly(int written, int total) {
    return 'Capitole scrise în $written din $total fișiere. Restul au rămas neschimbate.';
  }

  @override
  String get chapterStaleTitle => 'Aceste capitole s-au schimbat';

  @override
  String get chapterStaleMessage =>
      'Altcineva a salvat aceste capitole după ce le-ai deschis. Reîncarcă pentru a vedea versiunea lui. Modificările tale rămân până atunci.';

  @override
  String get chapterReload => 'Reîncarcă';

  @override
  String get chapterKeepEditing => 'Continuă editarea';

  @override
  String get matchExplicitYes => 'Marcată explicit';

  @override
  String get matchExplicitNo => 'Nu este explicită';

  @override
  String get matchAbridgedYes => 'Prescurtată';

  @override
  String get matchAbridgedNo => 'Integrală';

  @override
  String boQuickMatchBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'aceste $count de cărți',
      few: 'aceste $count cărți',
      one: 'această carte',
    );
    return 'BookOrbit caută $_temp0 și completează ce găsește, conform setărilor sale de metadate.';
  }

  @override
  String get boQuickMatchIgnoreCache => 'Întreabă din nou toate sursele';

  @override
  String get boQuickMatchIgnoreCacheHint =>
      'Ignoră răspunsurile salvate. Mai lent și folosește mai mult din limita de cereri a fiecărei surse.';

  @override
  String boAdminServerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de servere de e-mail',
      few: '$count servere de e-mail',
      one: '1 server de e-mail',
      zero: 'Niciunul încă',
    );
    return '$_temp0';
  }

  @override
  String get boEmailTitle => 'Trimite prin e-mail';

  @override
  String get boEmailSubtitle =>
      'Dispozitive, servere de e-mail și șabloane pentru trimiterea cărților';

  @override
  String get boEmailTabDevices => 'Dispozitive';

  @override
  String get boEmailTabServers => 'Servere de e-mail';

  @override
  String get boEmailTabTemplates => 'Șabloane';

  @override
  String get boEmailTabHistory => 'Istoric';

  @override
  String get boEmailName => 'Nume';

  @override
  String boEmailDeleteTitle(String name) {
    return 'Ștergi $name?';
  }

  @override
  String get boEmailMakeDefault => 'Setează ca implicit';

  @override
  String get boEmailBadgeDefault => 'Implicit';

  @override
  String get boEmailBadgeShared => 'Partajat';

  @override
  String get boEmailBadgeSystem => 'Resetări de parolă';

  @override
  String get boEmailBadgeBuiltIn => 'Încorporat';

  @override
  String get boEmailDevicesEmpty =>
      'Încă niciun dispozitiv. Adaugă adresa de e-mail a e-readerului pentru a-i trimite cărți.';

  @override
  String get boEmailAddDevice => 'Adaugă dispozitiv';

  @override
  String get boEmailNewDevice => 'Dispozitiv nou';

  @override
  String get boEmailDeviceNameHint => 'Kindle-ul meu';

  @override
  String get boEmailDeviceAddress => 'Adresă de e-mail';

  @override
  String get boEmailDeviceType => 'Dispozitiv';

  @override
  String get boEmailDeviceNone => 'Persoană sau inbox';

  @override
  String get boEmailDeviceKindle => 'Kindle';

  @override
  String get boEmailDeviceKobo => 'Kobo';

  @override
  String get boEmailDeviceOther => 'Alt e-reader';

  @override
  String get boEmailKindleHint =>
      'Kindle primește subiectul „convert” și acceptă prin e-mail doar EPUB și PDF.';

  @override
  String boEmailKindleApprove(String address) {
    return 'Kindle ignoră e-mailurile de la adrese necunoscute. În Personal Document Settings din Amazon, adaugă $address în lista aprobată.';
  }

  @override
  String get boEmailKindleApproveNoServer =>
      'Adaugă mai întâi un server de e-mail pentru a vedea adresa pe care Kindle trebuie s-o aprobe.';

  @override
  String get boEmailFormat => 'Format';

  @override
  String get boEmailFormatPrimary => 'Fișierul principal al cărții';

  @override
  String get boEmailFormatHint =>
      'O carte fără acest format primește fișierul principal.';

  @override
  String get boEmailReadAlong => 'Cărți cu citire sincronizată';

  @override
  String get boEmailReadAlongAuto => 'Automat';

  @override
  String get boEmailReadAlongAutoHint =>
      'Doar text când se poate face o copie, altfel originalul.';

  @override
  String get boEmailReadAlongText => 'Doar text';

  @override
  String get boEmailReadAlongTextHint =>
      'Fără narațiune. Suficient de mic pentru e-mail.';

  @override
  String get boEmailReadAlongOriginal => 'Cu narațiune';

  @override
  String get boEmailReadAlongOriginalHint =>
      'Păstrează narațiunea. Adesea 100 MB sau mai mult, peste limita majorității serverelor de e-mail.';

  @override
  String get boEmailTemplate => 'Șablon';

  @override
  String get boEmailTemplateYourDefault => 'Cel implicit al tău';

  @override
  String get boEmailTemplateKindleHint =>
      'Kindle nu afișează niciodată mesajul, deci omite șablonul.';

  @override
  String get boEmailDefaultDevice => 'Dispozitiv implicit';

  @override
  String get boEmailDefaultDeviceHint => 'Ales primul când trimiți o carte.';

  @override
  String get boEmailSendTest => 'Trimite un e-mail de test';

  @override
  String get boEmailTestSubject => 'E-mail de test de la Absorb';

  @override
  String boEmailTestBody(String name) {
    return 'Acesta este un test de la Absorb. Dacă îl poți citi, cărțile trimise la $name vor ajunge și ele aici.';
  }

  @override
  String boEmailTestSent(String name) {
    return 'E-mail de test trimis la $name';
  }

  @override
  String boEmailTestFailed(String error) {
    return 'E-mailul de test nu a fost trimis: $error';
  }

  @override
  String get boEmailDeleteDevice => 'Șterge dispozitivul';

  @override
  String get boEmailDeleteDeviceBody => 'Istoricul trimiterilor rămâne.';

  @override
  String get boEmailDeviceRequired => 'Introdu un nume și o adresă de e-mail';

  @override
  String get boEmailLastSendFailed => 'Ultima trimitere a eșuat';

  @override
  String get boEmailGroups => 'Grupuri';

  @override
  String get boEmailGroupsHint => 'Trimite la mai multe dispozitive deodată.';

  @override
  String get boEmailNewGroup => 'Grup nou';

  @override
  String get boEmailGroupNameHint => 'Club de lectură';

  @override
  String get boEmailGroupMembers => 'Dispozitive din acest grup';

  @override
  String get boEmailGroupMembersEmpty => 'Adaugă mai întâi un dispozitiv.';

  @override
  String boEmailGroupMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de dispozitive',
      few: '$count dispozitive',
      one: '1 dispozitiv',
      zero: 'Niciun dispozitiv',
    );
    return '$_temp0';
  }

  @override
  String get boEmailDeleteGroup => 'Șterge grupul';

  @override
  String get boEmailDeleteGroupBody => 'Dispozitivele din el rămân.';

  @override
  String get boEmailGroupRequired => 'Introdu un nume de grup';

  @override
  String get boEmailServersEmptyManage =>
      'Încă niciun server de e-mail. Adaugă unul pentru a începe să trimiți cărți.';

  @override
  String get boEmailServersEmpty =>
      'Încă niciun server de e-mail. Roagă un administrator să adauge unul.';

  @override
  String get boEmailAddServer => 'Adaugă server de e-mail';

  @override
  String get boEmailNewServer => 'Server de e-mail nou';

  @override
  String get boEmailServerPresetOther => 'Altul';

  @override
  String get boEmailServerPresetHint =>
      'Un set predefinit completează gazda, portul și securitatea. Le poți totuși modifica.';

  @override
  String get boEmailServerHost => 'Gazdă';

  @override
  String get boEmailServerPort => 'Port';

  @override
  String get boEmailServerSecurity => 'Securitate';

  @override
  String get boEmailServerSecurityNone => 'Niciuna';

  @override
  String get boEmailServerSecurityHint =>
      'STARTTLS pe portul 587, SSL/TLS pe 465.';

  @override
  String get boEmailServerNeedsPassword => 'Se conectează cu o parolă';

  @override
  String get boEmailServerUsername => 'Nume de utilizator';

  @override
  String get boEmailServerPassword => 'Parolă';

  @override
  String get boEmailServerAppPassword => 'Parolă de aplicație';

  @override
  String get boEmailServerPasswordKeep => 'Salvată. Scrie pentru a o înlocui';

  @override
  String get boEmailServerAppPasswordHint =>
      'Gmail și iCloud necesită o parolă de aplicație, nu parola contului.';

  @override
  String get boEmailServerFromName => 'Nume expeditor';

  @override
  String get boEmailServerFromAddress => 'Adresă expeditor';

  @override
  String get boEmailServerFromAddressHint =>
      'Proprietarii de Kindle trebuie să aprobe această adresă.';

  @override
  String get boEmailServerShare => 'Partajează cu toată lumea';

  @override
  String get boEmailServerShareHint =>
      'Alte persoane pot trimite cărți prin acest server fără să vadă parola.';

  @override
  String get boEmailServerSystem =>
      'Trimite resetări de parolă și linkuri de conectare';

  @override
  String get boEmailServerSystemHint =>
      'Serverul pe care BookOrbit îl folosește pentru propriile e-mailuri.';

  @override
  String get boEmailServerVerifyTls => 'Verifică certificatul serverului';

  @override
  String get boEmailServerVerifyTlsHint =>
      'Dezactivează doar pentru un server din rețeaua ta cu certificat autosemnat.';

  @override
  String get boEmailServerTest => 'Testează conexiunea';

  @override
  String get boEmailServerTestSaveFirst => 'Salvează întâi, apoi testează';

  @override
  String get boEmailServerTestOk => 'Conectat';

  @override
  String boEmailServerTestFailed(String error) {
    return 'Nu se poate conecta: $error';
  }

  @override
  String get boEmailServerDelete => 'Șterge serverul de e-mail';

  @override
  String get boEmailServerDeleteBody =>
      'Toți cei cu care este partajat îl pierd.';

  @override
  String get boEmailServerSystemFirst =>
      'Dezactivează resetările de parolă pe acest server înainte de a-l șterge.';

  @override
  String get boEmailServerRequired => 'Introdu un nume și o gazdă';

  @override
  String get boEmailServerNotYours =>
      'Acest server a fost adăugat de altcineva. Doar acea persoană îl poate modifica.';

  @override
  String get boEmailTemplatesEmpty => 'Încă niciun șablon.';

  @override
  String get boEmailNewTemplate => 'Șablon nou';

  @override
  String get boEmailTemplateSubject => 'Subiect';

  @override
  String get boEmailTemplateMessage => 'Mesaj';

  @override
  String get boEmailTemplateInsert => 'Inserează';

  @override
  String get boEmailTemplateInsertHint =>
      'Se inserează unde se află cursorul. Detaliile pe care o carte nu le are nu afișează nimic.';

  @override
  String get boEmailVarBook => 'Carte';

  @override
  String get boEmailVarFile => 'Fișier';

  @override
  String get boEmailVarOther => 'Altele';

  @override
  String get boEmailTemplatePreview => 'Previzualizare';

  @override
  String get boEmailTemplatePreviewNone =>
      'Trimite o carte o dată pentru a previzualiza un șablon cu ea.';

  @override
  String boEmailTemplateAttached(String name) {
    return 'Atașat: $name';
  }

  @override
  String get boEmailTemplateBuiltIn =>
      'Încorporat. Doar un administrator îl poate modifica.';

  @override
  String get boEmailTemplateKindleNote =>
      'Kindle nu afișează niciodată un șablon. Primește întotdeauna subiectul „convert”.';

  @override
  String get boEmailTemplateDelete => 'Șterge șablonul';

  @override
  String get boEmailTemplateDeleteBody =>
      'Dispozitivele care îl folosesc revin la șablonul tău implicit.';

  @override
  String get boEmailTemplateRequired => 'Introdu un nume și un subiect';

  @override
  String get boEmailHistoryEmpty => 'Încă nu s-a trimis nimic.';

  @override
  String get boEmailHistoryAll => 'Toate';

  @override
  String get boEmailHistoryEveryone => 'Toți';

  @override
  String get boEmailStatusSent => 'Trimis';

  @override
  String get boEmailStatusSending => 'Se trimite';

  @override
  String boEmailStatusRetrying(int attempt) {
    return 'Se reîncearcă ($attempt)';
  }

  @override
  String get boEmailStatusFailed => 'Eșuat';

  @override
  String boEmailTo(String name) {
    return 'Către $name';
  }

  @override
  String get boEmailResend => 'Trimite din nou';

  @override
  String get boEmailResent => 'Se trimite din nou';

  @override
  String get boEmailForget => 'Elimină din istoric';

  @override
  String get boEmailLoadMore => 'Încarcă mai multe';

  @override
  String get boEmailUnknownBook => 'Carte ștearsă';

  @override
  String get boEmailSendNoServer =>
      'Încă nu este configurat niciun server de e-mail pe acest server.';

  @override
  String get boEmailSendAskAdmin => 'Roagă un administrator să adauge unul.';

  @override
  String get boEmailSendNoDevices =>
      'Adaugă un dispozitiv la care să trimiți această carte.';

  @override
  String get boEmailSendOptions => 'Opțiuni';

  @override
  String get boEmailSendFormatEach => 'Cel propriu fiecărui dispozitiv';

  @override
  String get boEmailSendServer => 'Server de e-mail';

  @override
  String get boEmailSendButton => 'Trimite';

  @override
  String boEmailSendGets(String format, String size) {
    return 'Primește $format · $size';
  }

  @override
  String boEmailSendMissing(String format, String got) {
    return 'Fără $format, primește $got';
  }

  @override
  String boEmailSendKindleRejects(String format) {
    return 'Kindle nu acceptă $format prin e-mail';
  }

  @override
  String boEmailSendOverKindle(String size) {
    return '$size, peste limita de 50 MB a Kindle';
  }

  @override
  String boEmailSendOverGmail(String size) {
    return '$size, peste limita de 25 MB a Gmail';
  }

  @override
  String boEmailSendNarrated(String size) {
    return 'Primește copia cu narațiune · $size';
  }

  @override
  String boEmailSendHanding(String server) {
    return 'Se trimite prin $server';
  }

  @override
  String boEmailSendAccepted(String server) {
    return 'Trimis prin $server';
  }

  @override
  String boEmailSendFailedLine(String error) {
    return 'Nu s-a trimis: $error';
  }

  @override
  String get boEmailSendStillGoing =>
      'Încă se trimite. Vei primi o notificare când se termină.';

  @override
  String get boEmailKindleOriginal =>
      'Un Kindle nu acceptă copia cu narațiune. Setează „Doar text”.';

  @override
  String get boEmailNoCopy => 'Nu s-a putut crea o copie fără narațiune.';

  @override
  String get recentSearchesTitle => 'Căutări recente';

  @override
  String get recentSearchesClear => 'Golește';

  @override
  String get recentSearchesRemove => 'Elimină';

  @override
  String get removedSeriesTapToUndo =>
      'Eliminat din Continuă seria. Atinge pentru a anula.';

  @override
  String get seriesBackOnContinueSeries => 'Înapoi în Continuă seria';

  @override
  String get desktopShortcutPlayPause => 'Redare / pauză';

  @override
  String get desktopShortcutRewind => 'Derulare înapoi';

  @override
  String get desktopShortcutForward => 'Derulare înainte';

  @override
  String get desktopShortcutSlower => 'Redu viteza de redare';

  @override
  String get desktopShortcutFaster => 'Crește viteza de redare';

  @override
  String get desktopShortcutNormalSpeed => 'Resetează viteza de redare';

  @override
  String get desktopShortcutSearch => 'Deschide căutarea';

  @override
  String get desktopShortcutLibrary => 'Deschide biblioteca';

  @override
  String get desktopShortcutNowPlaying => 'Deschide redarea curentă';

  @override
  String get desktopShortcutFullScreen => 'Ecran complet';

  @override
  String get desktopShortcutClosePlayer => 'Închide playerul pe ecran complet';

  @override
  String get desktopShortcutBack => 'Înapoi (închide pagina sau panoul de sus)';

  @override
  String get desktopShortcutRefresh => 'Reîmprospătează lista de pe ecran';

  @override
  String get desktopShortcutPreviousCard => 'Cardul Absorbing anterior';

  @override
  String get desktopShortcutNextCard => 'Cardul Absorbing următor';

  @override
  String get desktopShortcutContextMenu => 'Deschide meniul de apăsare lungă';

  @override
  String get desktopShortcutMouseBack => 'Butonul Înapoi al mouse-ului';

  @override
  String get desktopShortcutRightClick => 'Clic dreapta';

  @override
  String get desktopShortcutDragShelves =>
      'Trage rafturile și cardurile lateral';

  @override
  String get desktopShortcutMouseDrag => 'Clic și tragere';

  @override
  String get fileHealthAction => 'Verifică fișierele';

  @override
  String get fileHealthTitle => 'Verifică fișierele';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Toate cele $count de fișiere par în regulă',
      few: 'Toate cele $count fișiere par în regulă',
      one: 'Fișierul pare în regulă',
      zero: 'Nu pare să fie nimic în neregulă',
    );
    return '$_temp0';
  }

  @override
  String fileHealthProblems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de probleme găsite',
      few: '$count probleme găsite',
      one: '1 problemă găsită',
    );
    return '$_temp0';
  }

  @override
  String get fileHealthReadOnlyNote =>
      'Aceasta doar citește ce raportează deja serverul. Nu se modifică nimic.';

  @override
  String get fileHealthLocalChecked =>
      'Au fost verificate și fișierele descărcate pe acest dispozitiv.';

  @override
  String get fileHealthItemMissing => 'Folderul cărții lipsește';

  @override
  String get fileHealthItemMissingInfo =>
      'Serverul nu mai găsește folderul acestei cărți. Poate că a fost mutat, redenumit sau șters, ori unitatea lui este offline. O scanare a bibliotecii pe server îl poate găsi din nou.';

  @override
  String get fileHealthItemInvalid => 'Carte marcată ca nevalidă';

  @override
  String get fileHealthItemInvalidInfo =>
      'Serverul nu a găsit fișiere audio sau de carte electronică utilizabile pentru această carte.';

  @override
  String get fileHealthInvalidFiles => 'Fișiere ilizibile';

  @override
  String get fileHealthInvalidFilesInfo =>
      'Serverul nu a putut citi aceste fișiere. Pot fi deteriorate sau într-un format neacceptat, iar redarea se poate opri sau le poate sări.';

  @override
  String get fileHealthEmptyFiles => 'Fișiere fără durată';

  @override
  String get fileHealthEmptyFilesInfo =>
      'Aceste fișiere raportează durata zero, deci nu au nimic de redat. Adesea sunt goale sau trunchiate.';

  @override
  String get fileHealthTrackGaps => 'Goluri între fișiere';

  @override
  String get fileHealthTrackGapsInfo =>
      'Cronologia cărții sare înainte între aceste fișiere și lasă o porțiune în care nu se redă nimic.';

  @override
  String get fileHealthTrackOverlaps => 'Fișiere suprapuse';

  @override
  String get fileHealthTrackOverlapsInfo =>
      'Aceste fișiere se suprapun în cronologia cărții, așa că o parte dintr-unul poate fi sărită sau poziția poate sări.';

  @override
  String get fileHealthDurationMismatch => 'Durata nu se potrivește';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return 'Fișierele însumează $actual, dar cartea indică o durată de $expected. Progresul și capitolele pot fi decalate. O rescanare pe server de obicei rezolvă asta.';
  }

  @override
  String get fileHealthLowBitrate => 'Audio de calitate scăzută';

  @override
  String get fileHealthLowBitrateInfo =>
      'Aceste fișiere sunt codate sub 32 kbps și pot suna înfundat.';

  @override
  String get fileHealthMixedSampleRates => 'Rate de eșantionare diferite';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      'Fișierele au fost înregistrate cu rate de eșantionare diferite. Majoritatea playerelor se descurcă, dar unele pot produce pocnituri sau schimba viteza acolo unde se termină un fișier și începe următorul.';

  @override
  String get fileHealthMixedChannels => 'Mono și stereo amestecate';

  @override
  String get fileHealthMixedChannelsInfo =>
      'Unele fișiere au un număr diferit de canale față de altele, deci sunetul se poate schimba între fișiere.';

  @override
  String get fileHealthChaptersPastEnd => 'Capitole după final';

  @override
  String get fileHealthChaptersPastEndInfo =>
      'Aceste capitole încep sau se termină după ce se încheie audio, așa că salturile la ele pot să nu ducă nicăieri.';

  @override
  String get fileHealthLocalMissing => 'Fișiere descărcate lipsă';

  @override
  String get fileHealthLocalMissingInfo =>
      'Aceste fișiere descărcate nu mai există pe acest dispozitiv. Redarea offline va eșua acolo unde ar trebui să fie.';

  @override
  String get fileHealthLocalSizeMismatch => 'Fișiere descărcate diferite';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      'Aceste fișiere descărcate nu au aceeași dimensiune ca copiile de pe server, deci pot fi incomplete sau deteriorate.';

  @override
  String fileHealthStartsAt(String time) {
    return 'începe la $time';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return '$local aici, $server pe server';
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
  String get fileHealthRedownload => 'Descarcă din nou această carte';

  @override
  String get fileHealthRedownloadQuestion => 'Descarci din nou această carte?';

  @override
  String get fileHealthRedownloadInfo =>
      'Copia de pe acest dispozitiv este ștearsă și descărcată din nou de pe server. Dacă cartea se redă, redarea se oprește. Nimic nu se schimbă pe server.';

  @override
  String get fileHealthNotAvailableOffline =>
      'Conectează-te la server pentru a descărca din nou';

  @override
  String get playerReconnecting => 'Conexiune pierdută, se reconectează…';

  @override
  String get playerReconnectFailed =>
      'Nu s-a putut reconecta la server, așa că redarea s-a oprit.';

  @override
  String get downloadsFailed => 'Descărcări eșuate';

  @override
  String get absorbingReorderQueue => 'Reordonează coada';

  @override
  String get playAction => 'Redă';

  @override
  String get pauseAction => 'Pauză';

  @override
  String get rmabImportBooks => 'Importă cărți';

  @override
  String get rmabImportBooksSubtitle =>
      'Caută în ReadMeABook și alege cărțile de cerut';

  @override
  String get rmabImportBooksConnectSubtitle =>
      'Conectează mai întâi ReadMeABook cu un URL și un token';

  @override
  String get windowsSettingsTitle => 'Setări Windows';

  @override
  String get updateCheckFrequency => 'Verificări automate de actualizări';

  @override
  String get updateCheckFrequencySubtitle =>
      'Doar verifică actualizările; instalarea este întotdeauna manuală.';

  @override
  String get updateCheckOnStartup => 'La pornire (o dată la 12 ore)';

  @override
  String get updateCheckEverySixHours => 'La fiecare 6 ore';

  @override
  String get updateCheckEveryTwelveHours => 'La fiecare 12 ore';

  @override
  String get updateCheckDaily => 'Zilnic';

  @override
  String get updateCheckNever => 'Niciodată automat';

  @override
  String onLatestVersionDetail(String version) {
    return 'Ai cea mai recentă versiune ($version)';
  }

  @override
  String get updateCheckFailed =>
      'Nu s-a putut contacta GitHub pentru a verifica actualizările. Verifică conexiunea și încearcă din nou.';

  @override
  String get playlistDetailAddBooks => 'Adaugă cărți în lista de redare';

  @override
  String get playlistDetailSwitchToList => 'Treci la vizualizarea listă';

  @override
  String get playlistDetailSwitchToGrid => 'Treci la vizualizarea grilă';

  @override
  String get adminUploadIndexing =>
      'Încărcare finalizată; se așteaptă ca Audiobookshelf să indexeze...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return '„$title” a fost încărcat; Audiobookshelf îl indexează încă';
  }

  @override
  String get adminUploadPermissionDenied =>
      'Contul tău Audiobookshelf nu are permisiunea de încărcare. Cere unui administrator al serverului să activeze accesul la încărcare pentru contul tău.';

  @override
  String get uiThemeLabel => 'Temă de interfață';

  @override
  String get uiThemePickerTitle => 'Alege un aspect';

  @override
  String get uiThemePickerIntro =>
      'Poți schimba oricând din Setări > Aspect > Temă de interfață.';

  @override
  String get uiThemePlusName => 'Standard';

  @override
  String get uiThemePlusDescription =>
      'Aspectul obișnuit Absorb Plus, cu panouri pline și o lumină discretă din culorile coperților tale.';

  @override
  String get uiThemeMidnightName => 'Miezul nopții';

  @override
  String get uiThemeMidnightDescription =>
      'Negru pur, cu contururi subțiri și fără strălucire, creat pentru ecranele OLED.';

  @override
  String get uiThemeContinue => 'Continuă';

  @override
  String get uiThemeFrostedName => 'Sticlă mată';

  @override
  String get uiThemeFrostedDescription =>
      'Panouri moi din sticlă mată, prin care strălucesc culorile coperților tale.';

  @override
  String get uiThemeColorTitle => 'Alege o culoare';

  @override
  String get uiThemeColorIntro =>
      'Este aceeași setare ca Setări > Aspect > Sursa culorii.';

  @override
  String get uiThemeColorFromCover => 'Din copertă';

  @override
  String get uiThemeBack => 'Înapoi';

  @override
  String get uiThemeTryIt => 'Încearcă';

  @override
  String uiThemePreviewing(String name) {
    return 'Previzualizare $name';
  }

  @override
  String get uiThemeKeep => 'Păstrează';

  @override
  String get uiThemeGoBack => 'Înapoi';

  @override
  String get uiThemeGlass => 'Sticlă';

  @override
  String get uiThemeGlassLight => 'Ușoară';

  @override
  String get uiThemeGlassMedium => 'Medie';

  @override
  String get uiThemeGlassStrong => 'Intensă';

  @override
  String get uiThemeDetails => 'Detalii aspect';

  @override
  String get uiThemeFullCovers => 'Coperți la calitate maximă';

  @override
  String get uiThemeFullCoversSubtitle =>
      'Coperți mai clare, care folosesc mai multă memorie';

  @override
  String get uiThemeExtraBadges => 'Insigne suplimentare pe coperți';

  @override
  String get uiThemeExtraBadgesSubtitle =>
      'Insigna de carte electronică și banda de salvat din Continuă ascultarea';

  @override
  String get uiThemeReadingShelf => 'Continuă citirea ca raft';

  @override
  String get uiThemeReadingShelfSubtitle =>
      'Un raft obișnuit pe Acasă în loc de carduri mari';

  @override
  String get uiThemeCompactHeader => 'Butoane compacte în antet';

  @override
  String get uiThemeCompactHeaderSubtitle =>
      'Butoanele din antetul paginii își păstrează dimensiunea mică';

  @override
  String get uiThemePlainWording => 'Formulări simple';

  @override
  String get uiThemePlainWordingOnSubtitle =>
      'Se folosesc „Redă”, „Se redă acum”, „Terminat”';

  @override
  String get uiThemePlainWordingOffSubtitle =>
      'Se folosesc „Absorb”, „Absorbing”, „Fully Absorbed”';

  @override
  String get uiThemeSearchClassic => 'Clasic';

  @override
  String whatsNewSheetTitle(String name) {
    return 'Ce e nou în $name';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return 'Actualizat de la $name';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return 'versiunea $number';
  }

  @override
  String get whatsNewFullNotes => 'Notele complete pe GitHub';

  @override
  String get whatsNewLoading => 'Se încarcă noutățile';

  @override
  String get whatsNewLoadFailed => 'Nu s-au putut încărca notele';

  @override
  String get whatsNewLoadFailedHint =>
      'Verifică conexiunea sau citește-le pe GitHub.';

  @override
  String get whatsNewOpenGitHub => 'Deschide pe GitHub';

  @override
  String get settingsSeeWhatsNew => 'Vezi ce e nou';

  @override
  String get settingsSeeWhatsNewSubtitle =>
      'Notele de lansare pentru această versiune';

  @override
  String get windowsCloseToTray => 'Închide în bara de sistem';

  @override
  String get windowsCloseToTraySubtitle =>
      'Închiderea ferestrei păstrează Absorb Plus rulând în zona de notificare. Ieși din pictograma din bara de sistem.';

  @override
  String get windowsStartWithWindows => 'Pornește cu Windows';

  @override
  String get windowsStartWithWindowsSubtitle =>
      'Deschide Absorb Plus când te conectezi la Windows';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return 'Pornește: $command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return 'O altă copie este setată să pornească: $command. Activează pentru a folosi această copie în schimb.';
  }

  @override
  String get windowsStartupDisabledBySystem =>
      'Dezactivată din Aplicații la pornire din Task Manager. Reactivează-o acolo.';

  @override
  String get windowsStartMinimized => 'Pornește minimizat';

  @override
  String get windowsStartMinimizedSubtitle =>
      'Când pornește cu Windows, îl păstrează în bara de sistem (sau minimizat dacă Închide în bara de sistem este dezactivat)';

  @override
  String get windowsAlwaysOnTop => 'Mereu deasupra';

  @override
  String get windowsAlwaysOnTopSubtitle =>
      'Păstrează fereastra deasupra celorlalte ferestre';

  @override
  String get windowsKeepAwake =>
      'Menține PC-ul treaz cât timp redă sau descarcă';

  @override
  String get windowsKeepAwakeSubtitle =>
      'Împiedică intrarea PC-ului în repaus. Ecranul se poate stinge în continuare.';

  @override
  String get windowsSettingFailed => 'Windows nu a acceptat această modificare';

  @override
  String get windowsGlobalHotkeys => 'Comenzi rapide globale';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Funcționează cât timp Absorb Plus este în fundal: Ctrl+Alt+Space redare/pauză, Ctrl+Alt+Left/Right salt înapoi/înainte, Ctrl+Alt+Up/Down volum, Ctrl+Alt+B adaugă marcaj';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return 'Ocupate de altă aplicație, indisponibile: $keys';
  }

  @override
  String get windowsTrayShow => 'Arată Absorb Plus';

  @override
  String get windowsTrayQuit => 'Închide Absorb Plus';

  @override
  String get windowsTaskbarPlay => 'Redă';

  @override
  String get windowsTaskbarPause => 'Pauză';

  @override
  String get windowsTaskbarRewind => 'Derulează înapoi';

  @override
  String get windowsTaskbarForward => 'Derulează înainte';

  @override
  String windowsJumpListResume(String title) {
    return 'Reia $title';
  }

  @override
  String get githubProjectTitle => 'Absorb Plus pe GitHub';

  @override
  String get precacheTitle => 'Preîncarcă coperțile și paginile cărților';

  @override
  String get precacheSubtitle =>
      'Le preia în fundal prin Wi-Fi sau conexiune prin cablu, ca ecranele să se deschidă instant. Folosește puțin spațiu pe disc, nu memorie.';

  @override
  String get githubProjectSubtitle =>
      'Lansări, cod sursă și noutăți despre proiect';

  @override
  String get supportSaveLogsSubtitle =>
      'Salvează fișierul jurnal pentru a-l atașa la un raport pe GitHub';

  @override
  String get supportSaveLogsDialogTitle => 'Salvează jurnalele Absorb Plus';

  @override
  String supportLogsSaved(String path) {
    return 'Jurnale salvate în $path';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return 'Nu s-au putut salva jurnalele: $error';
  }

  @override
  String get supportOpenLogsFolder => 'Deschide dosarul de jurnale';

  @override
  String get supportOpenLogsFolderSubtitle =>
      'Arată fișierul jurnal în managerul de fișiere';

  @override
  String get supportOpenLogsFolderFailed =>
      'Nu s-a putut deschide dosarul de jurnale';

  @override
  String get desktopDownloadFolderOpen => 'Deschide în Explorer';

  @override
  String get desktopDownloadFolderOpenLinux => 'Deschide dosarul';

  @override
  String get desktopDownloadFolderOpenFailed => 'Nu s-a putut deschide dosarul';

  @override
  String get desktopDownloadFolderNotWritable =>
      'Absorb nu poate salva fișiere în acel dosar. Alege altul.';

  @override
  String get desktopDownloadFolderPickFailed =>
      'Nu s-a putut afișa selectorul de dosare';

  @override
  String get desktopDownloadFolderNetworkPath =>
      'Dosarele de rețea (\\\\server\\share) nu pot conține descărcări. Mapează resursa partajată la o literă de unitate în File Explorer, de exemplu Z:, și alege aceea.';

  @override
  String get desktopDownloadFolderDefault => 'Dosar implicit';

  @override
  String get bookSettingsTitle => 'Setări carte';

  @override
  String bookSettingsSeries(String name) {
    return 'Serie: $name';
  }

  @override
  String get bookSettingsSpeed => 'Viteză';

  @override
  String get bookSettingsSpeedFromSeries =>
      'De la ultima carte redată din această serie';

  @override
  String get bookSettingsSkipIntro => 'Omite introducerea';

  @override
  String get bookSettingsSkipIntroHint =>
      'Doar când cartea pornește de la început';

  @override
  String get bookSettingsSkipOutro => 'Omite finalul';

  @override
  String get bookSettingsSkipOutroHint =>
      'Încheie cartea mai devreme și o marchează ca terminată';

  @override
  String get bookSettingsSkipOff => 'Oprit';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get bookSettingsWholeSeries => 'Folosește pentru toată seria';

  @override
  String get bookSettingsWholeSeriesHint =>
      'Introducerea și finalul se aplică fiecărei cărți din această serie';

  @override
  String get bookSettingsReset => 'Resetează';

  @override
  String get bookSettingsResetDone => 'Setările cărții au fost resetate';

  @override
  String get adminDashTitle => 'Panou de control';

  @override
  String get adminDashSubtitle =>
      'Cine ascultă, biblioteci, utilizatori și avertismente de server dintr-o privire';

  @override
  String get adminDashNobodyListening => 'Nimeni nu ascultă acum';

  @override
  String adminDashOnlineNames(String names) {
    return 'Online: $names';
  }

  @override
  String get adminDashListeningHistory => 'Istoric de ascultare';

  @override
  String get adminDashCouldNotLoad => 'Nu s-a putut încărca de pe server';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de elemente',
      few: '$count elemente',
      one: '1 element',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => 'Scanează tot';

  @override
  String get adminDashScanAllTitle => 'Scanezi toate bibliotecile?';

  @override
  String get adminDashScanAllContent =>
      'Audiobookshelf va căuta fișiere noi, modificate și lipsă în fiecare bibliotecă. Poate dura o vreme la bibliotecile mari.';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Scanare pornită pentru $count de biblioteci',
      few: 'Scanare pornită pentru $count biblioteci',
      one: 'Scanare pornită pentru 1 bibliotecă',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return '$failed din $total scanări nu au putut porni';
  }

  @override
  String get adminDashNoLibraries => 'Încă nu există biblioteci';

  @override
  String get adminDashBackUpNow => 'Fă o copie de siguranță acum';

  @override
  String adminDashLastBackup(String time) {
    return 'Ultima copie de siguranță $time';
  }

  @override
  String get adminDashNoBackups => 'Încă nu există copii de siguranță';

  @override
  String get adminDashManageUsers => 'Gestionează utilizatorii';

  @override
  String get adminDashNeverSeen => 'Nu s-a conectat niciodată';

  @override
  String get adminDashDisabled => 'Dezactivat';

  @override
  String get adminDashLocked => 'Blocat';

  @override
  String get adminDashServerWarnings => 'Avertismente server';

  @override
  String get adminDashNoProblems =>
      'Fără avertismente sau erori în jurnalul de azi';

  @override
  String get adminDashAllLogs => 'Toate jurnalele serverului';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale (integrat)';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => 'Comenzi rapide de la tastatură';

  @override
  String get desktopShortcutsSubtitle =>
      'Comenzi pentru redare, viteză, căutare și navigare';

  @override
  String get desktopShortcutsClose => 'Închide';

  @override
  String get tailscaleConnect => 'Conectează-te cu Tailscale';

  @override
  String get tailscaleConnectHint => 'Deschide conectarea Tailscale în browser';

  @override
  String get tailscaleTurnOff => 'Dezactivează';

  @override
  String get tailscaleCardPitch =>
      'Ajungi la serverul tău în tailnet fără a activa VPN-ul Tailscale';

  @override
  String get tailscaleIntro =>
      'Ajungi la un server din tailnet fără a activa VPN-ul aplicației Tailscale. Absorb se alătură tailnetului tău ca dispozitiv propriu, doar pentru propriile conexiuni. Funcție de test, dezactivată implicit.';

  @override
  String get tailscaleUseSwitch => 'Folosește Tailscale integrat';

  @override
  String get tailscaleStatusOff => 'Oprit';

  @override
  String get tailscaleStatusStarting => 'Se conectează…';

  @override
  String get tailscaleStatusNeedsLogin =>
      'Conectează-te pentru a adăuga acest dispozitiv în tailnet';

  @override
  String get tailscaleStatusNeedsApproval =>
      'Se așteaptă ca un administrator să aprobe acest dispozitiv';

  @override
  String tailscaleStatusConnected(String user) {
    return 'Conectat ca $user';
  }

  @override
  String get tailscaleStatusConnectedNoUser => 'Conectat';

  @override
  String tailscaleStatusError(String error) {
    return 'Problemă: $error';
  }

  @override
  String get tailscaleNotIncluded => 'Neinclus în această versiune';

  @override
  String get tailscaleSignIn => 'Conectează-te cu Tailscale';

  @override
  String get tailscaleSignInNoLink =>
      'Încă nu există un link de conectare. Încearcă din nou peste puțin timp.';

  @override
  String get tailscaleToggleFailed =>
      'Nu s-a putut activa sau dezactiva Tailscale integrat. Încearcă din nou.';

  @override
  String get tailscaleSignOut => 'Deconectează-te de la Tailscale';

  @override
  String tailscaleDeviceAddress(String address) {
    return 'Acest dispozitiv: $address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return 'Serverul tău ($server) este accesat prin Tailscale.';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return 'Serverul tău ($server) nu este o adresă din tailnet, așa că este accesat ca de obicei. Dacă se află în tailnetul tău, adaugă mai jos numele lui de gazdă.';
  }

  @override
  String get tailscaleExtraHostsLabel => 'Alte nume de gazdă din tailnet';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      'Adresele din 100.64.0.0/10 și numele care se termină în .ts.net sau numele MagicDNS al tailnetului tău trec mereu prin Tailscale. Separă numele prin virgule.';

  @override
  String playerChapterEndsAt(String time) {
    return 'Capitolul se termină la $time';
  }

  @override
  String playerEndsAt(String time) {
    return 'Se termină la $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return 'Ultima redare pe $device · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return 'Ultima redare pe alt dispozitiv · $ago';
  }

  @override
  String get opmlExportAction => 'Exportă OPML';

  @override
  String get opmlExportDialogTitle => 'Salvează fluxurile de podcast ca OPML';

  @override
  String opmlExportSaved(String path) {
    return 'OPML salvat în $path';
  }

  @override
  String get opmlExportDownloaded => 'OPML descărcat';

  @override
  String get opmlExportFailed => 'Nu s-a putut exporta fișierul OPML';

  @override
  String get bookCopySaveAction => 'Salvează o copie…';

  @override
  String get bookCopyDialogTitle => 'Salvează o copie a acestei cărți';

  @override
  String get bookCopySaving => 'Se salvează o copie…';

  @override
  String bookCopySaved(String path) {
    return 'Copie salvată în $path';
  }

  @override
  String get bookCopyFailed => 'Nu s-a putut salva o copie a acestei cărți';

  @override
  String get exclusiveAudioTitle => 'Audio exclusiv';

  @override
  String get exclusiveAudioSubtitle =>
      'Elimină trosnetele sau volumul sacadat omițând efectele sonore Windows. Celelalte aplicații sunt puse pe mut cât timp Absorb redă. Repornește Absorb pentru a aplica.';

  @override
  String get exclusiveAudioFallback =>
      'Dispozitivul tău audio a refuzat modul audio exclusiv, deci Absorb redă în modul normal';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return '$count noi';
  }

  @override
  String seekUndoBackTo(String time) {
    return 'Înapoi la $time';
  }

  @override
  String get goToTime => 'Mergi la moment';

  @override
  String get goToTimeLabel => 'Timp';

  @override
  String get goToTimeHint => 'h:mm:ss, mm:ss sau minute';

  @override
  String get goToTimeGo => 'Mergi';

  @override
  String goToTimeLength(String time) {
    return 'Durată $time';
  }

  @override
  String get goToTimeInvalid => 'Scrie un timp precum 1:23:45, 23:45 sau 90';

  @override
  String goToTimePastEnd(String time) {
    return 'Depășește sfârșitul ($time)';
  }

  @override
  String get desktopShortcutGoToTime =>
      'Mergi la un moment în playerul deschis';

  @override
  String fellAsleepJumpBack(String time) {
    return 'Adormit în jurul orei $time · Revino';
  }

  @override
  String get surpriseMe => 'Surprinde-mă';

  @override
  String get surpriseMeNoneLeft =>
      'Ai terminat toate cărțile din această bibliotecă';

  @override
  String get surpriseMeFailed =>
      'Nu s-a putut alege o carte. Încearcă din nou.';

  @override
  String get surpriseMeOffline => 'Surprinde-mă necesită conexiune la server';

  @override
  String get surpriseMeBooksOnly =>
      'Surprinde-mă alege cărți. Treci la o bibliotecă de cărți.';

  @override
  String get autoDownloadNextInSeries =>
      'Descarcă automat următoarea carte din serie';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      'Când cartea pe care o asculți este parcursă în proporție de 80% sau mai are sub o oră. Respectă setarea doar prin Wi-Fi.';

  @override
  String get emptyStateBrowseLibrary => 'Răsfoiește biblioteca';

  @override
  String get emptyStateClearSearch => 'Șterge căutarea';

  @override
  String get statsNoListeningYet => 'Încă nu ai ascultat nimic';

  @override
  String get desktopShortcutQuickSwitcher =>
      'Comutator rapid: găsește cărți sau mergi oriunde';

  @override
  String get desktopShortcutHelp => 'Arată comenzile rapide de la tastatură';

  @override
  String get quickSwitcherTooltip => 'Comutator rapid (Ctrl+K)';

  @override
  String get quickSwitcherHint =>
      'Caută în această bibliotecă sau scrie o comandă';

  @override
  String get quickSwitcherNoResults => 'Niciun rezultat';

  @override
  String get quickSwitcherGoHome => 'Mergi la Acasă';

  @override
  String get quickSwitcherGoLibrary => 'Mergi la Bibliotecă';

  @override
  String get quickSwitcherGoAbsorbing => 'Mergi la Absorbing';

  @override
  String get quickSwitcherGoStats => 'Mergi la Statistici';

  @override
  String get quickSwitcherGoSettings => 'Mergi la Setări';

  @override
  String get quickSwitcherGoDownloads => 'Mergi la Descărcări';

  @override
  String get quickSwitcherPlayPause => 'Redare / pauză';

  @override
  String get quickSwitcherSleepTimer => 'Temporizator de somn';

  @override
  String get quickSwitcherKeywordsAbsorbing =>
      'în curs de redare player now playing';

  @override
  String get quickSwitcherKeywordsSettings =>
      'preferințe opțiuni preferences options';

  @override
  String get quickSwitcherKeywordsDownloads => 'descărcări offline';

  @override
  String get quickSwitcherKeywordsPlayPause =>
      'redare pauză reluare resume pause';

  @override
  String get quickSwitcherKeywordsSleepTimer => 'temporizator somn timer';

  @override
  String get quickSwitcherKeywordsShortcuts =>
      'scurtături taste ajutor tastatură keys help hotkeys keyboard';

  @override
  String get quickSwitcherKindAction => 'Acțiune';

  @override
  String get quickSwitcherKindBook => 'Carte';

  @override
  String get quickSwitcherKindPodcast => 'Podcast';

  @override
  String get quickSwitcherKindSeries => 'Serie';

  @override
  String get quickSwitcherKindAuthor => 'Autor';

  @override
  String get alphabetScrollerLabel => 'Sari la o literă';

  @override
  String get stepperDecrease => 'Scade';

  @override
  String get stepperIncrease => 'Crește';

  @override
  String get statsStreakKeepGoing =>
      'Ascultă 5 minute astăzi pentru a continua seria';

  @override
  String get statsStreakHowTo =>
      'Ascultă 5 minute pe zi pentru a construi o serie';

  @override
  String get statsDailyGoalSheetTitle => 'Obiectiv zilnic de ascultare';

  @override
  String get statsDailyGoalSheetBody =>
      'Un inel de pe cardul seriei se umple pe măsură ce asculți astăzi.';

  @override
  String get statsDailyGoalSet => 'Setează un obiectiv zilnic';

  @override
  String get statsMonthListened => 'Ascultat';

  @override
  String get statsMonthTime => 'Timp';

  @override
  String get statsMonthTopBook => 'Cartea de top';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de rezultate',
      few: '$count rezultate',
      one: '1 rezultat',
      zero: 'Niciun rezultat',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => 'Sortează și grupează';

  @override
  String get bookmarksViewByBook => 'După carte';

  @override
  String get bookmarksViewNewest => 'Cele mai noi mai întâi';

  @override
  String get bookmarksViewPosition => 'După poziție';

  @override
  String get bookmarksExportAction => 'Exportă marcajele';

  @override
  String get bookmarksExportDialogTitle => 'Salvează marcajele ca Markdown';

  @override
  String bookmarksExportSaved(String path) {
    return 'Marcaje salvate în $path';
  }

  @override
  String get bookmarksExportDownloaded => 'Marcaje descărcate';

  @override
  String get bookmarksExportFailed => 'Nu s-au putut exporta marcajele';

  @override
  String get chapterSearchHint => 'Caută capitole sau scrie un timp (1:23:00)';

  @override
  String get chapterSearchNoResults => 'Niciun capitol nu corespunde';

  @override
  String get dropUploadNotAllowed =>
      'Contul tău nu poate încărca pe acest server';

  @override
  String get dropUploadNothingUsable =>
      'Niciunul dintre fișierele trase nu poate fi încărcat';

  @override
  String get dropUploadAlreadyOpen =>
      'Termină sau închide mai întâi încărcarea deschisă';

  @override
  String get remoteHostTitle => 'Controlează de pe telefon';

  @override
  String get remoteHostSubtitleOff =>
      'Folosește telefonul ca telecomandă pentru Absorb de pe acest PC';

  @override
  String remoteHostSubtitleOn(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de telefoane conectate',
      few: '$count telefoane conectate',
      one: '1 telefon conectat',
      zero: 'niciun telefon conectat',
    );
    return 'Activat · $_temp0';
  }

  @override
  String get remoteHostSheetBody =>
      'Folosește telefonul ca telecomandă pentru acest PC. Sunetul continuă să se redea pe PC, iar telefonul arată ce se redă, împreună cu butoanele. Telefonul și acest PC trebuie să fie în aceeași rețea Wi-Fi.';

  @override
  String get remoteHostSwitch => 'Activează';

  @override
  String get remoteHostSwitchSubtitle =>
      'Windows poate cere prima dată să permiți Absorb Plus prin firewall. Permite.';

  @override
  String get remoteHostKeepOn => 'Păstrează activ la pornirea Absorb';

  @override
  String get remoteHostKeepOnSubtitle =>
      'Când este dezactivat, se oprește de fiecare dată când închizi Absorb.';

  @override
  String remoteHostPortsBusy(int first, int last) {
    return 'Nu a putut porni: porturile $first–$last sunt toate ocupate.';
  }

  @override
  String get remoteHostPairTitle => 'Asociază telefonul';

  @override
  String get remoteHostStep1 => '1. Activează-l aici.';

  @override
  String get remoteHostStep2 =>
      '2. Scanează codul cu camera telefonului sau deschide Absorb pe telefon și mergi la Setări > Controlează calculatorul.';

  @override
  String get remoteHostStep3 =>
      '3. Introdu codul pe telefon, apoi alege Permite aici.';

  @override
  String get remoteHostCodeLabel => 'Cod';

  @override
  String remoteHostCodeExpires(String time) {
    return 'Valabil $time';
  }

  @override
  String get remoteHostPairFirst => 'Asociază un telefon';

  @override
  String get remoteHostPairAnother => 'Asociază alt dispozitiv';

  @override
  String get remoteHostPairingClosed =>
      'Asocierea este închisă. Apasă butonul pentru un cod nou; este valabil 2 minute și pentru un singur dispozitiv.';

  @override
  String get remoteHostFull =>
      'Sunt asociate 5 dispozitive, maximul permis. Uită unul pentru a asocia altul.';

  @override
  String remoteHostAddresses(String addresses) {
    return 'Adresa acestui PC: $addresses';
  }

  @override
  String get remoteHostNoAddress =>
      'Acest PC nu are acum nicio adresă de rețea.';

  @override
  String get remoteHostNoDiscovery =>
      'Telefonul poate să nu găsească singur acest PC; introdu pe telefon adresa acestui PC.';

  @override
  String get remoteHostConnectedTitle => 'Conectate acum';

  @override
  String get remoteHostPairedTitle => 'Dispozitive asociate';

  @override
  String get remoteHostNoDevices => 'Încă niciun dispozitiv asociat';

  @override
  String get remoteHostUnusedNote =>
      'Un dispozitiv nefolosit 90 de zile este uitat.';

  @override
  String remoteHostLastUsed(String date) {
    return 'Folosit ultima dată $date';
  }

  @override
  String remoteHostConnectedFrom(String address, String time) {
    return '$address, conectat din $time';
  }

  @override
  String get remoteHostForget => 'Uită';

  @override
  String get remoteHostForgetAll => 'Uită-le pe toate';

  @override
  String get remoteHostForgetAllConfirm =>
      'Uiți toate dispozitivele asociate? Fiecare trebuie să se asocieze din nou pentru a controla acest PC.';

  @override
  String get remoteHostDisconnect => 'Deconectează';

  @override
  String remoteHostAllowTitle(String name) {
    return 'Permiți lui „$name” să controleze Absorb pe acest PC?';
  }

  @override
  String get remoteHostAllowBody =>
      'Permite doar un dispozitiv pe care îl cunoști. Poate reda, pune pe pauză și schimba ce se redă aici. Lipsa unui răspuns înseamnă refuz.';

  @override
  String get remoteHostAllow => 'Permite';

  @override
  String get remoteHostDeny => 'Refuză';

  @override
  String get remoteControlAnother => 'Controlează calculatorul';

  @override
  String get remoteControlAnotherSubtitle =>
      'Folosește acest telefon ca telecomandă pentru Absorb de pe PC';

  @override
  String get remoteConnectIntro =>
      'Folosește acest telefon ca telecomandă pentru Absorb de pe PC. Sunetul continuă să se redea pe PC. Telefonul și PC-ul trebuie să fie în aceeași rețea Wi-Fi. Pe PC, deschide Setări > Controlează de pe telefon și activează opțiunea.';

  @override
  String get remoteConnectSearching =>
      'Se caută calculatoare în rețeaua Wi-Fi…';

  @override
  String get remoteConnectNoneFound =>
      'Nu s-a găsit niciun calculator. Pe PC, deschide Setări > Controlează de pe telefon și activează opțiunea, sau introdu adresa lui.';

  @override
  String get remoteConnectSearchAgain => 'Caută din nou';

  @override
  String get remoteConnectPaired => 'Asociat';

  @override
  String get remoteConnectFound => 'În rețeaua ta Wi-Fi';

  @override
  String get remoteConnectEnterAddress => 'Introdu o adresă';

  @override
  String get remoteConnectAddressHint => '192.168.1.20:47390';

  @override
  String get remoteConnectAddressInvalid =>
      'Introdu o adresă precum 192.168.1.20 sau 192.168.1.20:47390';

  @override
  String get remoteConnectNext => 'Înainte';

  @override
  String remoteConnectCodeTitle(String name) {
    return 'Asociază cu $name';
  }

  @override
  String get remoteConnectCodeHelp =>
      'Introdu codul din 6 cifre afișat pe PC la Controlează de pe telefon.';

  @override
  String get remoteConnectWaiting => 'Acum alege Permite pe PC…';

  @override
  String get remoteConnectPair => 'Asociază';

  @override
  String get remoteConnectForget => 'Uită acest calculator';

  @override
  String get remotePairBadCode =>
      'Codul nu este corect. Verifică PC-ul și încearcă din nou.';

  @override
  String get remotePairExpired =>
      'Codul a expirat. Obține unul nou pe PC cu Asociază alt dispozitiv.';

  @override
  String get remotePairClosed =>
      'Asocierea nu este deschisă pe PC. Pe PC, apasă Asociază alt dispozitiv pentru un cod nou.';

  @override
  String get remotePairDenied =>
      'PC-ul nu a permis acest telefon. Încearcă din nou și alege Permite pe PC.';

  @override
  String get remotePairTooManyDevices =>
      'Acel PC are deja 5 dispozitive asociate. Uită mai întâi unul pe PC.';

  @override
  String get remotePairTooMany =>
      'Prea multe încercări. Așteaptă un minut și încearcă din nou.';

  @override
  String get remotePairUnreachable =>
      'Telefonul și PC-ul nu sunt în aceeași rețea Wi-Fi sau PC-ul nu a activat opțiunea. Verifică ambele și încearcă din nou.';

  @override
  String get remotePairFailed => 'Asocierea nu a funcționat. Încearcă din nou.';

  @override
  String get remoteVersionMismatch =>
      'Actualizează Absorb Plus pe ambele dispozitive pentru a folosi telecomanda.';

  @override
  String get remoteConnecting => 'Se conectează…';

  @override
  String get remoteReconnecting => 'Se reconectează…';

  @override
  String get remoteUnreachableHint =>
      'PC-ul nu poate fi contactat. Verifică dacă este pornit, dacă Absorb este deschis și dacă ambele sunt în aceeași rețea Wi-Fi.';

  @override
  String remoteNothingPlaying(String name) {
    return 'Nimic nu se redă pe $name';
  }

  @override
  String get remoteNothingLoaded => 'Pornește mai întâi ceva pe PC.';

  @override
  String get remoteCommandFailed => 'PC-ul nu a putut face asta.';

  @override
  String get remoteNotOnList => 'Această carte nu mai este în lista PC-ului.';

  @override
  String get remoteDisconnectedByHost => 'PC-ul a deconectat acest dispozitiv.';

  @override
  String get remoteUnauthorized =>
      'PC-ul nu mai recunoaște acest dispozitiv. Asociază-l din nou.';

  @override
  String get remotePairAgain => 'Asociază din nou';

  @override
  String get remoteConnectAgain => 'Conectează din nou';

  @override
  String get remotePlay => 'Redă';

  @override
  String get remotePause => 'Pauză';

  @override
  String get remoteStop => 'Oprește';

  @override
  String get remotePreviousChapter => 'Capitolul anterior';

  @override
  String get remoteNextChapter => 'Capitolul următor';

  @override
  String remoteSkipBack(int seconds) {
    return 'Înapoi $seconds secunde';
  }

  @override
  String remoteSkipForward(int seconds) {
    return 'Înainte $seconds secunde';
  }

  @override
  String get remoteSpeed => 'Viteză';

  @override
  String get remoteSpeedSlower => 'Mai lent';

  @override
  String get remoteSpeedFaster => 'Mai rapid';

  @override
  String get remoteSleepTimer => 'Temporizator de somn';

  @override
  String remoteSleepMinutes(int minutes) {
    return '$minutes minute';
  }

  @override
  String get remoteSleepEndOfChapter => 'Sfârșitul capitolului';

  @override
  String get remoteSleepEndOfEpisode => 'Sfârșitul episodului';

  @override
  String remoteSleepChapters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de capitole',
      few: '$count capitole',
      one: '1 capitol',
    );
    return '$_temp0';
  }

  @override
  String get remoteSleepCancel => 'Oprește temporizatorul de somn';

  @override
  String get remoteVolume => 'Volum';

  @override
  String get remoteMute => 'Dezactivează sunetul';

  @override
  String get remoteUnmute => 'Activează sunetul';

  @override
  String get remoteChapters => 'Capitole';

  @override
  String get remoteBookmark => 'Marcaj';

  @override
  String get remoteBookmarkTitle => 'Adaugă un marcaj aici';

  @override
  String get remoteBookmarkNoteHint => 'Notă (opțional)';

  @override
  String get remoteBookmarkAdd => 'Adaugă';

  @override
  String get remoteBookmarkAdded => 'Marcaj adăugat pe PC';

  @override
  String get remoteContinueListening => 'Continuă ascultarea';

  @override
  String get remoteContinueEmpty => 'Nimic în curs pe PC.';

  @override
  String remoteTimeLeft(String time) {
    return '$time rămase';
  }

  @override
  String remoteChapterTimeLeft(String time) {
    return '$time rămase în capitol';
  }

  @override
  String get remoteLockScreenControls => 'Show controls on the lock screen';

  @override
  String get remoteMoreOptions => 'More options';

  @override
  String remoteHostBrowserAddress(String url) {
    return 'Or open $url in any browser on the same Wi-Fi (iPhone, tablet, laptop) and type the code there.';
  }

  @override
  String get remoteHostBrowserDevice => 'Web browser';

  @override
  String get remoteCustomize => 'Personalizează';

  @override
  String get remoteCustomizeTitle => 'Personalizează telecomanda';

  @override
  String get remoteCustomizeHintPortrait =>
      'Editezi aspectul vertical. Trage un bloc de mâner sau ține-l apăsat pentru a-l muta. Rotește telefonul pentru a edita aspectul orizontal.';

  @override
  String get remoteCustomizeHintLandscape =>
      'Editezi aspectul orizontal. Trage blocurile în cadrul unei coloane sau între cele două. Rotește telefonul pentru a edita aspectul vertical.';

  @override
  String get remoteCustomizeReset => 'Resetează la implicit';

  @override
  String get remoteCustomizePresets => 'Presetări';

  @override
  String get remoteCustomizeAddTitle => 'Adaugă pe ecran';

  @override
  String get remoteCustomizeDropHere => 'Plasează blocurile aici';

  @override
  String get remoteCustomizeMove => 'Trage pentru a muta';

  @override
  String get remoteCustomizeEmpty =>
      'Nimic pe acest ecran. Atinge Personalizează pentru a adăuga controale.';

  @override
  String get remotePresetDefault => 'Implicit';

  @override
  String get remotePresetMinimal => 'Minimal';

  @override
  String get remotePresetNightstand => 'Noptieră';

  @override
  String get remotePresetFull => 'Complet';

  @override
  String get remoteBlockCover => 'Copertă';

  @override
  String get remoteBlockTitle => 'Titlu și autor';

  @override
  String get remoteBlockChapterTitle => 'Titlul capitolului';

  @override
  String get remoteBlockProgress => 'Bară de progres';

  @override
  String get remoteBlockTimeLeft => 'Timp rămas';

  @override
  String get remoteBlockTransport => 'Butoane de redare';

  @override
  String get remoteBlockClock => 'Ceas';

  @override
  String get remoteBlockSpacer => 'Spațiu';

  @override
  String get remoteSizeSmall => 'Mic';

  @override
  String get remoteSizeMedium => 'Mediu';

  @override
  String get remoteSizeLarge => 'Mare';

  @override
  String get remoteSizeCompact => 'Compact';

  @override
  String get remoteSizeNormal => 'Normal';

  @override
  String get remoteDisplayBackground => 'Fundal';

  @override
  String get remoteDisplayBackgroundTheme => 'Temă';

  @override
  String get remoteDisplayBackgroundCover => 'Copertă estompată';

  @override
  String get remoteDisplayBackgroundBlack => 'Negru';

  @override
  String get remoteDisplayTextSize => 'Dimensiune text';

  @override
  String get remoteDisplayTextHuge => 'Uriaș';

  @override
  String get remoteDisplay24Hour => 'Ceas de 24 de ore';

  @override
  String get remoteDisplayDim => 'Estompează ecranul după';

  @override
  String get remoteDisplayDimNever => 'Niciodată';

  @override
  String get remoteFullScreen => 'Full screen';

  @override
  String get remoteFullScreenHint => 'Tap empty space to exit full screen';

  @override
  String get remoteBlockOptions => 'Options';

  @override
  String get remoteOptSize => 'Size';

  @override
  String get remoteOptAlign => 'Alignment';

  @override
  String get remoteOptAlignLeft => 'Left';

  @override
  String get remoteOptAlignCenter => 'Center';

  @override
  String get remoteOptAlignRight => 'Right';

  @override
  String get remoteOptGap => 'Space above';

  @override
  String get remoteOptDefault => 'Default';

  @override
  String get remoteOptNone => 'None';

  @override
  String get remoteOptCorners => 'Corners';

  @override
  String get remoteOptCornersSquare => 'Square';

  @override
  String get remoteOptCornersRounded => 'Rounded';

  @override
  String get remoteOptCornersCircle => 'Circle';

  @override
  String get remoteOptShadow => 'Shadow';

  @override
  String get remoteOptLines => 'Lines';

  @override
  String get remoteOptTime => 'Time on the right';

  @override
  String get remoteOptTimeTotal => 'Total length';

  @override
  String get remoteOptSpan => 'Range';

  @override
  String get remoteOptSpanChapter => 'Chapter';

  @override
  String get remoteOptSpanBook => 'Whole book';

  @override
  String get remoteOptButtons => 'Buttons';

  @override
  String get remoteOptButtonBack => 'Skip back';

  @override
  String get remoteOptButtonPlay => 'Play/pause';

  @override
  String get remoteOptButtonForward => 'Skip forward';

  @override
  String get remoteOptSkipSeconds => 'Show the skip seconds';

  @override
  String get remoteOptStyle => 'Style';

  @override
  String get remoteOptStyleSlider => 'Slider';

  @override
  String get remoteOptStyleButtons => '− and + buttons';

  @override
  String get remoteOptPresets => 'Choices';

  @override
  String get remoteOptHours => 'Clock format';

  @override
  String get remoteOptHoursPhone => 'Phone setting';

  @override
  String get remoteOpt12Hour => '12-hour clock';

  @override
  String get remoteOptDate => 'Show the date';

  @override
  String get remoteVolumeDown => 'Volume down';

  @override
  String get remoteVolumeUp => 'Volume up';

  @override
  String get remoteLook => 'Look';

  @override
  String get remoteLookAccent => 'Accent color';

  @override
  String get remoteLookAccentCover => 'From cover';

  @override
  String get remoteLookAccentTheme => 'App theme';

  @override
  String remoteLookSwatch(int number) {
    return 'Color $number';
  }

  @override
  String get remoteLookBackgroundGradient => 'Soft gradient';

  @override
  String get remoteLookButtons => 'Button style';

  @override
  String get remoteLookButtonsFilled => 'Filled';

  @override
  String get remoteLookButtonsOutlined => 'Outlined';

  @override
  String get remoteLookButtonsPlain => 'Plain';

  @override
  String get remoteLookCornersSharp => 'Sharp';

  @override
  String get remoteLookCornersExtra => 'Extra round';

  @override
  String get remoteLookSpacing => 'Spacing';

  @override
  String get remoteLookSpacingComfortable => 'Comfortable';

  @override
  String get remoteLookReset => 'Reset look';

  @override
  String get quickSwitcherKeywordsRemote =>
      'telecomandă telefon control pc legătură asociere remote phone pair';

  @override
  String get quickSwitcherKeywordsSurprise =>
      'aleatoriu surpriză random pick shuffle';

  @override
  String get developerModeOn => 'Modul dezvoltator activat';

  @override
  String get developerModeAlreadyOn => 'Modul dezvoltator este deja activat';

  @override
  String get developerTitle => 'Dezvoltator';

  @override
  String get developerSubtitle =>
      'Versiuni de test și instrumente pentru dezvoltare';

  @override
  String get developerModeSwitch => 'Mod dezvoltator';

  @override
  String get developerModeSwitchSubtitle =>
      'Dezactivarea ascunde această pagină. Atinge versiunea de 7 ori pentru a o readuce.';

  @override
  String get testChannelTitle => 'Canal de test';

  @override
  String get testChannelSubtitle =>
      'Instalează cea mai recentă versiune de test';

  @override
  String get testChannelUnavailable =>
      'Versiunile de test sunt doar pentru versiunea Android de pe GitHub.';

  @override
  String get testChannelCodeLabel => 'Cod canal de test';

  @override
  String get testChannelUnlock => 'Deblochează';

  @override
  String get testChannelUnlocked => 'Canal de test deblocat';

  @override
  String get testChannelWrongCode => 'Codul nu este corect';

  @override
  String get testChannelLaunchCheck => 'Caută versiuni de test la pornire';

  @override
  String get testChannelLaunchCheckSubtitle =>
      'Cere să instalezi o versiune de test mai nouă la pornirea aplicației';

  @override
  String get testChannelWarning =>
      'Versiunile de test sunt neterminate și pot strica lucruri. Ele înlocuiesc aplicația instalată și îți păstrează datele.';

  @override
  String testChannelInstalled(String version) {
    return 'Instalată: $version';
  }

  @override
  String testChannelNewest(String version) {
    return 'Cea mai recentă versiune de test: $version';
  }

  @override
  String get testChannelNone => 'Încă nu există nicio versiune de test';

  @override
  String get testChannelUpToDate => 'La zi';

  @override
  String get testChannelInstall => 'Instalează';

  @override
  String get testChannelCheckNow => 'Verifică acum';

  @override
  String get testChannelNotes => 'Ce conține';

  @override
  String testBuildNotesTitle(int build) {
    return 'What\'s new in build $build';
  }

  @override
  String get patchNotesTitle => 'Patch notes';

  @override
  String get patchNotesSubtitle =>
      'What changed in each test build on this phone';

  @override
  String get patchNotesEmpty =>
      'No patch notes yet. They show up here after the next test build is installed.';

  @override
  String patchNotesBuild(int build) {
    return 'Build $build';
  }

  @override
  String get testBuildAvailable => 'Versiune de test disponibilă';

  @override
  String testBuildDialogContent(String latest, String current) {
    return 'Versiunea de test $latest este disponibilă.\n\nFolosești $current.';
  }

  @override
  String testBuildPackageLabel(int build) {
    return 'Versiune de test $build';
  }

  @override
  String get githubSignIn => 'Conectare cu GitHub';

  @override
  String get githubSignInSubtitle =>
      'Versiunile de test sunt private: conectează-te pentru a le primi';

  @override
  String get githubSignInNotSetUp =>
      'Conectarea cu GitHub nu este încă configurată în această versiune';

  @override
  String get githubSignInAgain => 'Conectează-te din nou';

  @override
  String get githubSignInExpired => 'Conectarea ta GitHub a expirat';

  @override
  String githubSignedInAs(String login) {
    return 'Conectat la GitHub ca $login';
  }

  @override
  String get githubSignedIn => 'Conectat la GitHub';

  @override
  String get githubSignOut => 'Deconectare';

  @override
  String get githubSignInEnterCode => 'Introdu acest cod pe GitHub:';

  @override
  String get githubSignInOpen => 'Deschide github.com/login/device';

  @override
  String get githubSignInCopyCode => 'Copiază codul';

  @override
  String get githubSignInCodeCopied => 'Cod copiat';

  @override
  String get githubSignInWaiting => 'Se așteaptă aprobarea ta pe GitHub...';

  @override
  String get githubSignInDenied => 'Conectarea a fost anulată pe GitHub.';

  @override
  String get githubSignInCodeExpired => 'Codul a expirat. Încearcă din nou.';

  @override
  String get githubSignInFailed =>
      'Nu te-ai putut conecta la GitHub. Încearcă din nou.';

  @override
  String get githubSignInTryAgain => 'Încearcă din nou';

  @override
  String get testChannelSignInNeeded =>
      'Conectează-te cu GitHub pentru a primi versiunile de test';

  @override
  String get downloadEtaUnderMinute => '<1 min rămas';

  @override
  String downloadEtaMinutes(int minutes) {
    return '$minutes min rămase';
  }

  @override
  String downloadEtaHours(int hours) {
    return '$hours h rămase';
  }

  @override
  String downloadEtaHoursMinutes(int hours, int minutes) {
    return '$hours h $minutes min rămase';
  }

  @override
  String get sameSpeedAllBooksTitle => 'Aceeași viteză pentru fiecare carte';

  @override
  String get sameSpeedAllBooksSubtitle =>
      'Fiecare carte se redă la viteza implicită, iar schimbarea vitezei în player o schimbă pentru toate cărțile. Dezactivat: fiecare carte (sau seria ei) își păstrează propria viteză.';

  @override
  String setupStepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get setupNext => 'Next';

  @override
  String get setupBack => 'Back';

  @override
  String get setupSkip => 'Skip';

  @override
  String get setupWelcomeBody =>
      'Listen to the audiobooks and podcasts on your own Audiobookshelf server. A few quick steps and you\'re in.';

  @override
  String get setupConnectTitle => 'Connect to your server';

  @override
  String setupSignedInAs(String user) {
    return 'Signed in as $user';
  }

  @override
  String get setupLookIntro => 'Tap a look or a color to use it right away.';

  @override
  String get setupListeningTitle => 'Listening';

  @override
  String get setupListeningIntro =>
      'The basics. Settings > Playback has the rest.';

  @override
  String get setupDownloadsTitle => 'Downloads';

  @override
  String get setupDownloadsIntro =>
      'Download books to listen without a connection.';

  @override
  String get setupPermissionsTitle => 'Permissions';

  @override
  String get setupPermissionsIntro =>
      'Android asks you before Absorb can do these.';

  @override
  String get setupAllow => 'Allow';

  @override
  String get setupAllowed => 'Allowed';

  @override
  String get setupDoneTitle => 'You\'re all set';

  @override
  String get setupDoneLater => 'Change any of this later in Settings.';

  @override
  String get setupDoneStart => 'Start listening';

  @override
  String setupSummaryLook(String name) {
    return 'Look: $name';
  }

  @override
  String setupSummarySpeed(String speed) {
    return 'Default speed: ${speed}x';
  }

  @override
  String setupSummarySkip(int back, int forward) {
    return 'Skip back ${back}s, forward ${forward}s';
  }

  @override
  String get setupRunAgain => 'Run setup again';

  @override
  String get setupRunAgainSubtitle =>
      'The look, playback basics and more, step by step';

  @override
  String get loginDesignTitle => 'Sign-in screen design';

  @override
  String get loginDesignPreviewTitle => 'Preview sign-in designs';

  @override
  String get loginDesignClassic => 'Current';

  @override
  String get loginDesignClassicName => 'Classic';

  @override
  String get loginDesignCard => 'A · Clean card';

  @override
  String get loginDesignSteps => 'B · Two steps';

  @override
  String get loginDesignSplit => 'C · Split';

  @override
  String get loginDesignStepsGlass => 'B2 · Glass steps';

  @override
  String get loginDesignStepsDesktop => 'B3 · Desktop steps';

  @override
  String get loginDesignStepsHero => 'B4 · Hero steps';

  @override
  String get loginStepLibrary => 'Your library';

  @override
  String get loginStepSignIn => 'Sign in';

  @override
  String get loginStepsKeyboardHint => 'Enter to continue, Esc to go back';

  @override
  String get loginDesignUse => 'Use this design';

  @override
  String get loginDesignInUse => 'In use';

  @override
  String get loginDesignPreviewNote =>
      'Preview: this design would sign you in here';

  @override
  String get loginDesignAdvancedSubtitle =>
      'Custom headers, API key and certificates';

  @override
  String get loginMoreWays => 'More ways to sign in';

  @override
  String get loginRecentServers => 'Recent servers';

  @override
  String get loginWhereIsLibrary => 'Where is your library?';

  @override
  String get loginWhereIsLibraryIntro =>
      'Enter your server\'s address, the same one you open in a browser.';

  @override
  String get loginContinue => 'Continue';

  @override
  String get loginChangeServer => 'Change server';

  @override
  String loginSignInToNamed(String server) {
    return 'Sign in to $server';
  }

  @override
  String get loginSignInToNamedIntro =>
      'Use the account you have on this server.';

  @override
  String get loginSplitPitch =>
      'Your audiobooks, podcasts and ebooks from your own server, on every device.';

  @override
  String get quickSwitcherKeywordsLoginDesign =>
      'login sign in screen design layout preview';
}
