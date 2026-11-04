// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'A B S O R B';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get stillOffline => 'Ancora offline. Tocca per riprovare.';

  @override
  String get retry => 'Riprova';

  @override
  String get listsNone => 'Nessuna raccolta o playlist';

  @override
  String get listsNoneHint =>
      'Le raccolte e le playlist si creano sul tuo server Audiobookshelf e compaiono qui.';

  @override
  String get listsLoadFailed => 'Impossibile caricare le tue liste';

  @override
  String get listsLoadFailedHint =>
      'Absorb non è riuscito a contattare il server per raccolte e playlist.';

  @override
  String get listsNoneBookOrbit => 'Nessuna raccolta o Smart Scope';

  @override
  String get listsNoneHintBookOrbit =>
      'Le raccolte e gli Smart Scope si creano sul tuo server BookOrbit e compaiono qui.';

  @override
  String get listsLoadFailedHintBookOrbit =>
      'Absorb non è riuscito a contattare il server per raccolte e Smart Scope.';

  @override
  String get cancel => 'Annulla';

  @override
  String get delete => 'Elimina';

  @override
  String get remove => 'Rimuovi';

  @override
  String get save => 'Salva';

  @override
  String get done => 'Fine';

  @override
  String get edit => 'Modifica';

  @override
  String get search => 'Cerca';

  @override
  String get apply => 'Applica';

  @override
  String get enable => 'Attiva';

  @override
  String get clear => 'Cancella';

  @override
  String get off => 'Off';

  @override
  String get disabled => 'Disattivato';

  @override
  String get later => 'Più tardi';

  @override
  String get whatsNewTitle => 'Absorb è stato aggiornato';

  @override
  String whatsNewContent(String version) {
    return 'Ora sei alla versione $version.';
  }

  @override
  String get whatsNewButton => 'Scopri le novità';

  @override
  String get whatsNewKeepShowing => 'Mostra dopo ogni aggiornamento';

  @override
  String get whatsNewKeepShowingHint => 'Puoi riattivarlo nelle Impostazioni';

  @override
  String get settingsWhatsNew => 'Mostra le novità dopo gli aggiornamenti';

  @override
  String get settingsWhatsNewSubtitle =>
      'Dopo un aggiornamento, mostra le novità nell\'app';

  @override
  String get gotIt => 'Ho capito';

  @override
  String get betaLoggingTitle => 'I log sono attivi';

  @override
  String get betaLoggingContent =>
      'Poiché questa è una beta, Absorb ora conserva dei log per aiutare a individuare i problemi. Restano su questo dispositivo, a meno che tu non li condivida.\n\nPuoi inviarli o disattivarli nelle Impostazioni, in Problemi e assistenza. Se li disattivi, le beta successive li lasceranno disattivati.';

  @override
  String get preview => 'Anteprima';

  @override
  String get or => 'oppure';

  @override
  String get file => 'File';

  @override
  String get more => 'Altro';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get untitled => 'Senza titolo';

  @override
  String get noThanks => 'No, grazie';

  @override
  String get stay => 'Resta';

  @override
  String get homeTitle => 'Home';

  @override
  String get continueListening => 'Continua ad ascoltare';

  @override
  String get continueReading => 'Continua a leggere';

  @override
  String get continueSeries => 'Continua la serie';

  @override
  String get recentlyAdded => 'Aggiunti di recente';

  @override
  String get listenAgain => 'Ascolta di nuovo';

  @override
  String get discover => 'Scopri';

  @override
  String get newEpisodes => 'Nuovi episodi';

  @override
  String get downloads => 'Download';

  @override
  String get noDownloadedBooks => 'Nessun libro scaricato';

  @override
  String get yourLibraryIsEmpty => 'La tua libreria è vuota';

  @override
  String get downloadBooksWhileOnline =>
      'Scarica i libri quando sei online per ascoltarli offline';

  @override
  String get customizeHome => 'Personalizza la Home';

  @override
  String get dragToReorderTapEye =>
      'Trascina per riordinare, tocca l\'occhio per mostrare/nascondere';

  @override
  String get loginTagline => 'Inizia ad assorbire';

  @override
  String get loginConnectToServer => 'Connettiti al tuo server';

  @override
  String get loginServerAddress => 'Indirizzo del server';

  @override
  String get loginServerHint => 'mio.server.com';

  @override
  String get loginServerHelper =>
      'Funziona anche IP:porta (es. 192.168.1.5:13378)';

  @override
  String get loginCouldNotReachServer => 'Impossibile raggiungere il server';

  @override
  String get loginAdvanced => 'Avanzate';

  @override
  String get loginCustomHttpHeaders => 'Intestazioni HTTP personalizzate';

  @override
  String get loginCustomHeadersDescription =>
      'Per tunnel Cloudflare o reverse proxy che richiedono intestazioni aggiuntive. Aggiungi le intestazioni prima di inserire l\'URL del server.';

  @override
  String get loginHeaderName => 'Nome intestazione';

  @override
  String get loginHeaderValue => 'Valore';

  @override
  String get loginAddHeader => 'Aggiungi intestazione';

  @override
  String get loginSelfSignedCertificates => 'Certificati autofirmati';

  @override
  String get loginTrustAllCertificates =>
      'Fidati di tutti i certificati (per le impostazioni CA auto-firmate / personalizzate)';

  @override
  String get loginApiKey => 'Chiave API';

  @override
  String get loginApiKeyDescription =>
      'Usa una chiave API generata da un amministratore al posto di nome utente/password. Utile quando l\'aggiornamento del token fallisce per il tuo account.';

  @override
  String get loginWaitingForSso => 'In attesa di SSO...';

  @override
  String get loginRedirectUri => 'URI di reindirizzamento: absorb://oauth';

  @override
  String get loginOrSignInManually => 'oppure accedi manualmente';

  @override
  String get loginUsername => 'Nome utente';

  @override
  String get loginUsernameRequired => 'Inserisci il tuo nome utente';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginSignIn => 'Accedi';

  @override
  String loginSignInAs(String username) {
    return 'Accedere come $username?';
  }

  @override
  String get loginSignInToServer => 'Accedere a questo server?';

  @override
  String loginSignedInAs(String username) {
    return 'Accesso effettuato come $username';
  }

  @override
  String get adminCreateSetupFile => 'Condividi accesso';

  @override
  String adminSetupFileDescription(String username) {
    return 'Crea un link di accesso privato per $username che funziona solo nell\'app Absorb.';
  }

  @override
  String get adminSetupFileServerUrl =>
      'URL del server che userà il nuovo utente';

  @override
  String get adminSetupFileNoteWithHeaders =>
      'Una chiave API dedicata e le tue intestazioni personalizzate saranno incluse in modo che possano raggiungere il server. Trattare il link come una password.';

  @override
  String get adminSetupFileNote =>
      'Verrà inclusa una chiave API dedicata. Tratta il link come una password.';

  @override
  String get adminSetupFileCreate => 'Crea link';

  @override
  String get adminSetupFileSaveTitle => 'Salva file di configurazione';

  @override
  String get adminSetupFileKeyError =>
      'Impossibile creare una chiave API per questo utente';

  @override
  String adminSetupFileSaved(String username) {
    return 'File di configurazione per $username salvato';
  }

  @override
  String adminSetupFileFailed(String error) {
    return 'Creazione dell\'accesso non riuscita: $error';
  }

  @override
  String get setupLinkShareTitle => 'Condividi accesso';

  @override
  String setupLinkShareDescription(String username) {
    return 'Invia questo link privato o scansiona il codice QR per accedere come $username.';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return 'Chiunque abbia questo link può accedere come $username. Trattalo come una password.';
  }

  @override
  String get setupLinkShare => 'Condividi link';

  @override
  String get setupLinkCopy => 'Copia link';

  @override
  String get setupLinkCopied => 'Link di accesso copiato';

  @override
  String get setupLinkSaveFile => 'Salva file di configurazione';

  @override
  String get setupLinkQrError =>
      'Questo link di configurazione è troppo grande per un codice QR. Condividi il link.';

  @override
  String setupLinkShareSubject(String username) {
    return 'Accesso ad Absorb per $username';
  }

  @override
  String get setupLinkConfirmTitle => 'Accedere con questo link?';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return 'Accedere a $server come $username? Continua solo se ti fidi di chi ti ha inviato questo link.';
  }

  @override
  String get setupLinkInvalid =>
      'Questo link di accesso non è valido o è incompleto';

  @override
  String get setupLinkSigningIn => 'Verifica del link di accesso...';

  @override
  String get loginPlayDownloads => 'Riproduci i tuoi download';

  @override
  String signedOutDownloadsNote(String username) {
    return 'Hai effettuato l\'uscita. Tutto ciò che ascolti qui viene sincronizzato con $username quando accedi di nuovo.';
  }

  @override
  String get loginPasteLink => 'Incolla link di accesso';

  @override
  String get loginPasteLinkHelp =>
      'Incolla il link di accesso completo che hai ricevuto. Trattalo come una password.';

  @override
  String get loginFailed => 'Accesso non riuscito';

  @override
  String get loginSsoFailed => 'Accesso SSO non riuscito o annullato';

  @override
  String get loginSsoAuthFailed => 'Autenticazione SSO non riuscita. Riprova.';

  @override
  String get loginRestoreFromBackup => 'Importa';

  @override
  String get loginInvalidBackupFile => 'File di backup non valido';

  @override
  String get loginRestoreBackupTitle => 'Ripristinare il backup?';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return 'Verranno ripristinate tutte le impostazioni e $count account salvati. Accederai automaticamente.';
  }

  @override
  String get loginRestoreBackupNoAccounts =>
      'Verranno ripristinate tutte le impostazioni. Questo backup non include account.';

  @override
  String get loginRestore => 'Ripristina';

  @override
  String loginRestoredAndSignedIn(String username) {
    return 'Impostazioni ripristinate e accesso effettuato come $username';
  }

  @override
  String get loginSessionExpired =>
      'Impostazioni ripristinate. Sessione scaduta - accedi per continuare.';

  @override
  String get loginSettingsRestored => 'Impostazioni ripristinate';

  @override
  String loginRestoreFailed(String error) {
    return 'Ripristino non riuscito: $error';
  }

  @override
  String get loginSavedAccounts => 'account salvati';

  @override
  String get libraryTitle => 'Libreria';

  @override
  String get librarySearchBooksHint =>
      'Cerca libri, serie, autori, narratori...';

  @override
  String get librarySearchShowsHint => 'Cerca programmi ed episodi...';

  @override
  String get libraryTabLibrary => 'Libreria';

  @override
  String get libraryTabSeries => 'Serie';

  @override
  String get libraryTabAuthors => 'Autori';

  @override
  String get libraryTabNarrators => 'Narratori';

  @override
  String get libraryNoBooks => 'Nessun libro trovato';

  @override
  String get libraryNoUnfinishedBooks => 'Nessun libro da completare';

  @override
  String get libraryNoBooksInProgress => 'Nessun libro in corso';

  @override
  String get libraryNoFinishedBooks => 'Nessun libro completato';

  @override
  String get libraryAllBooksStarted => 'Tutti i libri sono stati iniziati';

  @override
  String get libraryNoDownloadedBooks => 'Nessun libro scaricato';

  @override
  String get libraryNoSeriesFound => 'Nessuna serie trovata';

  @override
  String get libraryNoBooksWithEbooks => 'Nessun libro con ebook';

  @override
  String get libraryNoBooksMissingMetadata =>
      'Nessun libro manca di questi metadati';

  @override
  String get libraryNoItemsMatchingFilter =>
      'Nessun elemento corrisponde a questo filtro';

  @override
  String libraryNoBooksInGenre(String genre) {
    return 'Nessun libro in \"$genre\"';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return 'Nessun libro con il tag \"$tag\"';
  }

  @override
  String get libraryClearFilter => 'Rimuovi filtro';

  @override
  String get libraryNoAuthorsFound => 'Nessun autore trovato';

  @override
  String get libraryNoNarratorsFound => 'Nessun narratore trovato';

  @override
  String get libraryNoResults => 'Nessun risultato trovato';

  @override
  String get librarySearchBooks => 'Libri';

  @override
  String get librarySearchShows => 'Programmi';

  @override
  String get librarySearchEpisodes => 'Episodi';

  @override
  String get librarySearchSeries => 'Serie';

  @override
  String get librarySearchAuthors => 'Autori';

  @override
  String get librarySearchTags => 'Tag';

  @override
  String get librarySearchGenres => 'Generi';

  @override
  String librarySeriesCount(int count) {
    return '$count serie';
  }

  @override
  String libraryAuthorsCount(int count) {
    return '$count autori';
  }

  @override
  String libraryNarratorsCount(int count) {
    return '$count narratori';
  }

  @override
  String libraryBooksCount(int loaded, int total) {
    return '$loaded/$total libri';
  }

  @override
  String get sort => 'Ordina';

  @override
  String get filter => 'Filtra';

  @override
  String get filterActive => 'Filtro ●';

  @override
  String get name => 'Nome';

  @override
  String get title => 'Titolo';

  @override
  String get author => 'Autore';

  @override
  String get dateAdded => 'Data di aggiunta';

  @override
  String get numberOfBooks => 'Numero di libri';

  @override
  String get sortTotalDuration => 'Durata totale';

  @override
  String get sortLastBookAdded => 'Ultimo libro aggiunto';

  @override
  String get sortLastBookUpdated => 'Ultimo libro aggiornato';

  @override
  String get publishedYear => 'Anno di pubblicazione';

  @override
  String get duration => 'Durata';

  @override
  String get random => 'Casuale';

  @override
  String get collapseSeries => 'Comprimi serie';

  @override
  String get notFinished => 'Non completati';

  @override
  String get inProgress => 'In corso';

  @override
  String get filterFinished => 'Completati';

  @override
  String get notStarted => 'Non iniziati';

  @override
  String get downloaded => 'Scaricati';

  @override
  String get hasEbook => 'Con ebook';

  @override
  String get noEbook => 'Senza ebook';

  @override
  String get hasSupplementaryEbook => 'Con ebook supplementare';

  @override
  String get noSupplementaryEbook => 'Senza ebook supplementare';

  @override
  String get noSeries => 'Senza serie';

  @override
  String get publishedDecade => 'Decennio di pubblicazione';

  @override
  String get tracks => 'Tracce';

  @override
  String get noTracks => 'Nessuna traccia';

  @override
  String get singleTrack => 'Traccia singola';

  @override
  String get multipleTracks => 'Tracce multiple';

  @override
  String get abridged => 'Abbreviato';

  @override
  String get issues => 'Problemi';

  @override
  String get rssFeedOpen => 'Feed RSS aperto';

  @override
  String get explicitContent => 'Esplicito';

  @override
  String get missingMetadata => 'Metadati mancanti';

  @override
  String get genre => 'Genere';

  @override
  String get tag => 'Tag';

  @override
  String get clearFilter => 'Rimuovi filtro';

  @override
  String get noGenresFound => 'Nessun genere trovato';

  @override
  String get noTagsFound => 'Nessun tag trovato';

  @override
  String get asc => 'CRESC';

  @override
  String get desc => 'DECR';

  @override
  String get fileSize => 'Dimensione file';

  @override
  String get lastUpdated => 'Ultimo aggiornamento';

  @override
  String get fileCreated => 'File creato';

  @override
  String get lastModified => 'Ultima modifica';

  @override
  String get authorFirstLast => 'Autore (Nome Cognome)';

  @override
  String get authorLastFirst => 'Autore (Cognome, Nome)';

  @override
  String get progressSort => 'Progressi';

  @override
  String get dateStarted => 'Data di inizio';

  @override
  String get dateFinished => 'Data di completamento';

  @override
  String get episodeCount => 'Numero di episodi';

  @override
  String get sequence => 'Numero nella serie';

  @override
  String get absorbingTitle => 'Absorbing';

  @override
  String get absorbingStop => 'Ferma';

  @override
  String get absorbingManageQueue => 'Gestisci coda';

  @override
  String get absorbingDone => 'Fine';

  @override
  String get absorbingNoDownloadedEpisodes => 'Nessun episodio scaricato';

  @override
  String get absorbingNoDownloadedBooks => 'Nessun libro scaricato';

  @override
  String get absorbingNothingPlayingYet => 'Ancora nulla in riproduzione';

  @override
  String get absorbingNothingAbsorbingYet => 'Ancora nulla in Absorbing';

  @override
  String get absorbingDownloadEpisodesToListen =>
      'Scarica gli episodi per ascoltarli offline';

  @override
  String get absorbingDownloadBooksToListen =>
      'Scarica i libri per ascoltarli offline';

  @override
  String get absorbingStartEpisodeFromShows =>
      'Avvia un episodio dalla scheda Programmi';

  @override
  String get absorbingStartBookFromLibrary =>
      'Avvia un libro dalla scheda Libreria';

  @override
  String get carModeTitle => 'Modalità auto';

  @override
  String get carModeNoBookLoaded => 'Nessun libro caricato';

  @override
  String get carModeBookLabel => 'Libro';

  @override
  String get carModeChapterLabel => 'Capitolo';

  @override
  String get carModeBookmarkDefault => 'Segnalibro';

  @override
  String get carModeBookmarkAdded => 'Segnalibro aggiunto';

  @override
  String get downloadsTitle => 'Download';

  @override
  String get downloadsCancelSelection => 'Annulla selezione';

  @override
  String get downloadsSelect => 'Seleziona';

  @override
  String get downloadsNoDownloads => 'Nessun download';

  @override
  String get downloadsDownloading => 'Download in corso';

  @override
  String get downloadsQueued => 'In coda';

  @override
  String get downloadsCompleted => 'Completati';

  @override
  String get downloadsEbooks => 'Ebook';

  @override
  String get downloadsWaiting => 'In attesa...';

  @override
  String get downloadsCancel => 'Annulla';

  @override
  String get downloadsDelete => 'Elimina';

  @override
  String downloadsDeleteCount(int count) {
    return 'Eliminare $count download?';
  }

  @override
  String get downloadsDeleteContent =>
      'I file scaricati verranno rimossi da questo dispositivo.';

  @override
  String downloadsDeletedCount(int count) {
    return '$count download eliminati';
  }

  @override
  String get downloadsRemoveTitle => 'Rimuovere il download?';

  @override
  String downloadsRemoveContent(String title) {
    return 'Eliminare \"$title\" da questo dispositivo?';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return '\"$title\" rimosso';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return 'Impossibile scaricare \"$title\": uno dei suoi file non è presente sul server. Una scansione della libreria potrebbe risolvere il problema.';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return 'Impossibile scaricare \"$title\": spazio di archiviazione insufficiente';
  }

  @override
  String downloadFailedPermission(String title) {
    return 'Impossibile scaricare \"$title\": controlla la posizione dei download nelle Impostazioni';
  }

  @override
  String downloadFailedGeneric(String title) {
    return 'Impossibile scaricare \"$title\"';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '$count selezionati';
  }

  @override
  String get bookmarksTitle => 'Tutti i segnalibri';

  @override
  String get bookmarksTabBookmarks => 'Segnalibri';

  @override
  String get bookmarksTabHighlights => 'Evidenziazioni';

  @override
  String get highlightOpenInBook => 'Apri nel libro';

  @override
  String get highlightDeleteAction => 'Elimina evidenziazione';

  @override
  String get highlightDeleted => 'Evidenziazione eliminata';

  @override
  String highlightsDeleteCount(int count) {
    return 'Eliminare $count evidenziazioni?';
  }

  @override
  String highlightsDeletedCount(int count) {
    return '$count evidenziazioni eliminate';
  }

  @override
  String get quoteShareTitle => 'Condividi citazione';

  @override
  String get quoteShareAction => 'Condividi';

  @override
  String get quoteShareFailed =>
      'Impossibile creare l\'immagine della citazione';

  @override
  String get quoteShapePortrait => 'Verticale';

  @override
  String get quoteShapeSquare => 'Quadrato';

  @override
  String get quoteShapeStory => 'Storia';

  @override
  String get quoteStyleBlur => 'Sfocato';

  @override
  String get quoteStyleDim => 'Attenuato';

  @override
  String get quoteStyleNone => 'Copertina semplice';

  @override
  String get quoteTextLight => 'Testo chiaro';

  @override
  String get quoteTextDark => 'Testo scuro';

  @override
  String get quoteFieldTitle => 'Titolo';

  @override
  String get quoteFieldDetail => 'Dettagli';

  @override
  String get quoteFieldDetailHint =>
      'Autore, capitolo, pagina, chi l\'ha detto';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => 'Annulla selezione';

  @override
  String get bookmarksSortedByNewest => 'Ordinati dal più recente';

  @override
  String get bookmarksSortedByPosition => 'Ordinati per posizione';

  @override
  String get bookmarksSelect => 'Seleziona';

  @override
  String get bookmarksNoBookmarks => 'Ancora nessun segnalibro';

  @override
  String get bookmarksSearchHint => 'Cerca segnalibri';

  @override
  String get bookmarksNoMatches => 'Nessun segnalibro corrisponde alla ricerca';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Download di $count libri in corso',
      one: 'Download di 1 libro in corso',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => 'Già scaricato';

  @override
  String bookmarksDeleteCount(int count) {
    return 'Eliminare $count segnalibri?';
  }

  @override
  String get bookmarksDeleteContent =>
      'Questa azione non può essere annullata.';

  @override
  String bookmarksDeletedCount(int count) {
    return '$count segnalibri eliminati';
  }

  @override
  String get bookmarksJumpTitle => 'Vai al segnalibro?';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '\"$title\" a $position\nin $bookTitle';
  }

  @override
  String get bookmarksJump => 'Vai';

  @override
  String get bookmarksNotConnected => 'Non connesso al server';

  @override
  String get bookmarksCouldNotLoad => 'Impossibile caricare il libro';

  @override
  String bookmarksSelectedCount(int count) {
    return '$count selezionati';
  }

  @override
  String get statsTitle => 'Le tue statistiche';

  @override
  String get statsCouldNotLoad => 'Impossibile caricare le statistiche';

  @override
  String get statsTotalListeningTime => 'TEMPO TOTALE DI ASCOLTO';

  @override
  String get statsHoursUnit => 'h';

  @override
  String get statsMinutesUnit => 'm';

  @override
  String get statsSecondsUnit => 's';

  @override
  String statsDaysOfAudio(String days) {
    return 'Sono $days giorni di audio';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return 'Sono $hours ore di audio';
  }

  @override
  String get statsToday => 'Oggi';

  @override
  String get statsThisWeek => 'Questa settimana';

  @override
  String get statsThisMonth => 'Questo mese';

  @override
  String get statsActivity => 'Attività';

  @override
  String get statsCurrentStreak => 'Serie attuale';

  @override
  String get statsBestStreak => 'Serie migliore';

  @override
  String get statsFinished => 'Completati';

  @override
  String get statsBooksFinished => 'Libri';

  @override
  String get statsEpisodesFinished => 'Episodi';

  @override
  String get statsBooksThisYear => 'Libri quest\'anno';

  @override
  String get statsEpisodesThisYear => 'Episodi quest\'anno';

  @override
  String get statsRemoveFromYearTitle => 'Rimuovi da quest\'anno';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return 'La data di completamento sul server resterà $date. Questo rimuove \"$title\" solo dall\'elenco dei libri di quest\'anno di Absorb.';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return 'La data di completamento resta sul server. Questo rimuove \"$title\" solo dall\'elenco dei libri di quest\'anno di Absorb.';
  }

  @override
  String get statsRemovedFromYear => 'Rimosso da quest\'anno';

  @override
  String get statsAddBackToYearTitle => 'Aggiungi di nuovo a quest\'anno';

  @override
  String statsAddBackToYearBody(String title) {
    return 'Aggiungere di nuovo \"$title\" all\'elenco dei libri di quest\'anno di Absorb?';
  }

  @override
  String get statsAddBack => 'Aggiungi di nuovo';

  @override
  String get statsAddedBackToYear => 'Aggiunto di nuovo a quest\'anno';

  @override
  String get statsHiddenFromYear => 'Nascosti da quest\'anno';

  @override
  String get statsNothingHidden => 'Nulla di nascosto';

  @override
  String get settingsCustomizeStats => 'Personalizza statistiche';

  @override
  String get statsGoalTitle => 'Obiettivo di ascolto';

  @override
  String get statsGoalOff => 'Off';

  @override
  String get statsGoalDaily => 'Giornaliero';

  @override
  String get statsGoalWeekly => 'Settimanale';

  @override
  String get statsGoalMonthly => 'Mensile';

  @override
  String get statsGoalTarget => 'Obiettivo';

  @override
  String get statsGoalEnterTitle => 'Imposta obiettivo';

  @override
  String get statsGoalEnterTimeHint => 'Minuti o h:mm';

  @override
  String statsBooksShort(int count) {
    return '$count libri';
  }

  @override
  String get statsBookChallengeTitle => 'Sfida di lettura';

  @override
  String get statsBookChallengeDesc => 'Libri da completare quest\'anno';

  @override
  String get statsDailyGoal => 'Obiettivo giornaliero';

  @override
  String get statsWeeklyGoal => 'Obiettivo settimanale';

  @override
  String get statsMonthlyGoal => 'Obiettivo mensile';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$done di $target libri';
  }

  @override
  String get statsGoalReached => 'Obiettivo raggiunto';

  @override
  String get statsChartTitle => 'Grafico di ascolto';

  @override
  String get statsChartBar => 'Barre';

  @override
  String get statsChartLine => 'Linea';

  @override
  String get statsChartHeatmap => 'Mappa di calore';

  @override
  String get statsChartDays7 => '7 giorni';

  @override
  String get statsChartDays30 => '30 giorni';

  @override
  String get statsLast30Days => 'Ultimi 30 giorni';

  @override
  String get statsThisYearTitle => 'Quest\'anno';

  @override
  String get statsSectionsTitle => 'Sezioni';

  @override
  String get statsSectionTimePeriods => 'Periodi di tempo';

  @override
  String get statsHeatmapLess => 'Meno';

  @override
  String get statsHeatmapMore => 'Più';

  @override
  String get statsDayOfWeek => 'Media per giorno della settimana';

  @override
  String get statsTimeSavedLabel => 'Risparmiato con la velocità';

  @override
  String statsTimeSavedSince(String date) {
    return 'dal $date';
  }

  @override
  String get statsTimeSavedReset => 'Azzera il tempo risparmiato';

  @override
  String get statsTimeSavedResetConfirm =>
      'Il tempo risparmiato ricomincerà a contare da oggi.';

  @override
  String get statsTimeSavedResetDone => 'Tempo risparmiato azzerato';

  @override
  String statsOnPaceFor(int count) {
    return 'Di questo passo: $count libri';
  }

  @override
  String get statsDaysActive => 'Giorni attivi';

  @override
  String get statsDailyAverage => 'Media giornaliera';

  @override
  String get statsLast7Days => 'Ultimi 7 giorni';

  @override
  String get statsMostListened => 'Più ascoltati';

  @override
  String get statsRecentSessions => 'Sessioni recenti';

  @override
  String get appShellHomeTab => 'Home';

  @override
  String get appShellLibraryTab => 'Libreria';

  @override
  String get appShellAbsorbingTab => 'Absorbing';

  @override
  String get appShellStatsTab => 'Statistiche';

  @override
  String get appShellSettingsTab => 'Impostazioni';

  @override
  String get appShellDiscoverTab => 'Scopri';

  @override
  String get appShellShowsTab => 'Programmi';

  @override
  String get appShellPodcastsTab => 'Podcast';

  @override
  String get libraryTabEpisodes => 'Episodi';

  @override
  String get filterAllEpisodes => 'Tutti';

  @override
  String get filterUnplayed => 'Non riprodotti';

  @override
  String get episodeFeedEmpty => 'Nessun episodio corrisponde a questo filtro';

  @override
  String get podcastFilterUpNext => 'Prossimi';

  @override
  String get podcastFilterNew => 'Nuovi';

  @override
  String get settingsPodcastTab => 'Scheda Podcast';

  @override
  String get settingsPodcastTabDesc =>
      'Dedica una scheda nella barra inferiore a una libreria di podcast';

  @override
  String get settingsPodcastTabLibrary => 'Libreria della scheda Podcast';

  @override
  String get settingsMergeImpliedByPodcastTab =>
      'Sempre attivo finché la scheda Podcast è abilitata';

  @override
  String get settingsEpisodeNotifs => 'Impostazioni delle notifiche';

  @override
  String get settingsEpisodeNotifsDesc =>
      'Nuovi episodi di podcast e prossime uscite di libri, controllati in background';

  @override
  String get notifIntervalOff => 'Off';

  @override
  String notifIntervalMinutes(int n) {
    return 'Ogni $n minuti';
  }

  @override
  String get notifIntervalHour => 'Ogni ora';

  @override
  String notifIntervalHours(int n) {
    return 'Ogni $n ore';
  }

  @override
  String get settingsBatteryUnrestricted =>
      'Consenti uso illimitato della batteria';

  @override
  String get settingsBatteryUnrestrictedDesc =>
      'Evita che il sistema sospenda i controlli in background su alcuni telefoni';

  @override
  String get appShellPressBackToExit => 'Premi di nuovo indietro per uscire';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get sectionAppearance => 'Aspetto';

  @override
  String get languageLabel => 'Lingua';

  @override
  String get languageSystemDefault => 'Predefinita del sistema';

  @override
  String get languageHelpTranslateInvite =>
      'Vuoi aiutare a tradurre Absorb nella tua lingua?';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeDark => 'Scuro';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeAuto => 'Auto';

  @override
  String get colorSourceLabel => 'Origine del colore';

  @override
  String get colorSourceCoverDescription =>
      'I colori dell\'app seguono la copertina del libro in riproduzione';

  @override
  String get colorSourceWallpaperDescription =>
      'I colori dell\'app seguono lo sfondo del sistema';

  @override
  String get colorSourceWallpaper => 'Sfondo';

  @override
  String get colorSourceNowPlaying => 'In riproduzione';

  @override
  String get colorSourceDynamic => 'Dinamico';

  @override
  String get colorSourceManual => 'Manuale';

  @override
  String get colorSourceManualDescription =>
      'Usa un colore fisso scelto qui sotto';

  @override
  String get colorSourceCustom => 'Personalizzato';

  @override
  String get useColorEverywhereLabel => 'Usa questo colore ovunque';

  @override
  String get useColorEverywhereSubtitle =>
      'Colora anche le pagine di dettaglio dei libri e la scheda del player con il colore scelto, invece che con la copertina di ogni libro';

  @override
  String get flatBackgroundLabel => 'Sfondo piatto';

  @override
  String get flatBackgroundSubtitle =>
      'Rimuove il gradiente dello sfondo. Nero puro in modalità scura per gli schermi OLED.';

  @override
  String get einkModeLabel => 'Modalità e-ink';

  @override
  String get einkModeSubtitle =>
      'Bianco e nero ad alto contrasto, senza animazioni, pensato per gli schermi e-ink';

  @override
  String get einkModeIntroBody =>
      'Pensata per gli schermi e-ink. L\'app passa a un aspetto piatto in bianco e nero ad alto contrasto, le animazioni vengono disattivate, la scheda di riproduzione perde lo sfondo e la connessione live al server resta spenta per risparmiare batteria. La riproduzione e i progressi si sincronizzano normalmente. Le tue impostazioni di aspetto vengono conservate e tornano quando la disattivi.';

  @override
  String get einkModeIntroConfirm => 'Attiva';

  @override
  String get backgroundIntensityLabel => 'Intensità dello sfondo';

  @override
  String get startScreenLabel => 'Schermata iniziale';

  @override
  String get startScreenSubtitle => 'Quale scheda aprire all\'avvio dell\'app';

  @override
  String get startScreenHome => 'Home';

  @override
  String get startScreenLibrary => 'Libreria';

  @override
  String get startScreenAbsorb => 'Absorb';

  @override
  String get startScreenStats => 'Statistiche';

  @override
  String get disablePageFade => 'Disattiva dissolvenza delle pagine';

  @override
  String get disablePageFadeOnSubtitle => 'Le pagine cambiano all\'istante';

  @override
  String get disablePageFadeOffSubtitle =>
      'Le pagine sfumano quando cambi scheda';

  @override
  String get rectangleBookCovers => 'Copertine rettangolari';

  @override
  String get progressTextSize => 'Dimensione del testo dei progressi';

  @override
  String get rectangleBookCoversOnSubtitle =>
      'Le copertine hanno le proporzioni 2:3 di un libro';

  @override
  String get rectangleBookCoversOffSubtitle => 'Le copertine sono quadrate';

  @override
  String get coverSize => 'Dimensione delle copertine';

  @override
  String get coverSizeSubtitle =>
      'Quante copertine entrano in una riga della griglia della libreria';

  @override
  String get coverSizeSmall => 'Piccola';

  @override
  String get coverSizeMedium => 'Media';

  @override
  String get coverSizeLarge => 'Grande';

  @override
  String get sectionAbsorbingCards => 'Schede Absorbing';

  @override
  String get fullScreenPlayer => 'Player a schermo intero';

  @override
  String get fullScreenPlayerOnSubtitle =>
      'Attivo: i libri si aprono a schermo intero quando li riproduci';

  @override
  String get fullScreenPlayerOffSubtitle =>
      'Disattivo: riproduci nella vista a scheda';

  @override
  String get fullBookScrubber => 'Cursore dell\'intero libro';

  @override
  String get fullBookScrubberOnSubtitle =>
      'Attivo: cursore scorrevole su tutto il libro';

  @override
  String get fullBookScrubberOffSubtitle =>
      'Disattivo: solo barra dei progressi';

  @override
  String get cardScrubbers => 'Cursori della scheda';

  @override
  String get cardScrubbersBoth => 'Entrambi';

  @override
  String get cardScrubbersChapter => 'Capitolo';

  @override
  String get cardScrubbersLocked => 'Bloccati';

  @override
  String get cardScrubbersBothSubtitle =>
      'Le barre del libro intero e del capitolo permettono di spostarsi';

  @override
  String get cardScrubbersChapterSubtitle =>
      'Solo la barra del capitolo permette di spostarsi';

  @override
  String get cardScrubbersLockedSubtitle =>
      'I progressi sono mostrati senza possibilità di spostarsi';

  @override
  String get speedAdjustedTime => 'Tempo adattato alla velocità';

  @override
  String get speedAdjustedTimeOnSubtitle =>
      'Attivo: tutti i tempi riflettono la velocità di riproduzione';

  @override
  String get speedAdjustedTimeOffSubtitle =>
      'Disattivo: mostra la durata audio reale';

  @override
  String get buttonLayout => 'Disposizione dei pulsanti';

  @override
  String get buttonLayoutSubtitle =>
      'Come sono disposti i pulsanti azione sulla scheda';

  @override
  String get whenAbsorbed => 'Al termine';

  @override
  String get whenAbsorbedInfoTitle => 'Al termine';

  @override
  String get whenAbsorbedInfoContent =>
      'Controlla cosa succede a una scheda Absorbing quando finisci un libro o un episodio.\n\nLe schede completate vengono rimosse automaticamente dalla schermata Absorbing.';

  @override
  String get whenAbsorbedSubtitle =>
      'Cosa succede alla scheda Absorbing quando un libro o un episodio finisce';

  @override
  String get whenAbsorbedShowOverlay => 'Mostra sovrapposizione';

  @override
  String get whenAbsorbedAutoRelease => 'Rilascio automatico';

  @override
  String get mergeLibraries => 'Pagina Absorbing unificata';

  @override
  String get mergeLibrariesInfoTitle => 'Pagina Absorbing unificata';

  @override
  String get mergeLibrariesInfoContent =>
      'Se attiva, la schermata Absorbing mostra in un\'unica vista tutti i tuoi libri e podcast in corso di ogni libreria. Se disattiva, vengono mostrati solo gli elementi della libreria selezionata.';

  @override
  String get mergeLibrariesOnSubtitle =>
      'La pagina Absorbing mostra gli elementi di tutte le librerie';

  @override
  String get mergeLibrariesOffSubtitle =>
      'La pagina Absorbing mostra solo la libreria corrente';

  @override
  String get queueMode => 'Modalità coda';

  @override
  String get queueModeInfoTitle => 'Modalità coda';

  @override
  String get queueModeInfoOff => 'Off';

  @override
  String get queueModeInfoOffDesc =>
      'La riproduzione si ferma quando il libro o l\'episodio corrente finisce.';

  @override
  String get queueModeInfoManual => 'Coda manuale';

  @override
  String get queueModeInfoManualDesc =>
      'Le tue schede Absorbing funzionano come una playlist. Quando una finisce, parte automaticamente la successiva non completata. Aggiungi elementi con il pulsante \"Aggiungi ad Absorbing\" su un libro o un episodio e riordinali dalla schermata Absorbing.';

  @override
  String get queueModeOff => 'Off';

  @override
  String get queueModeManual => 'Manuale';

  @override
  String get queueModeAuto => 'Auto';

  @override
  String get queueModePlaylist => 'Playlist';

  @override
  String get queueModeCollection => 'Raccolta';

  @override
  String get queueModeInfoPlaylist => 'Coda da playlist';

  @override
  String get queueModeInfoPlaylistDesc =>
      'Riproduce gli elementi in ordine da una playlist scelta, saltando quelli già completati. Si ferma alla fine dell\'elenco.';

  @override
  String get queuePlaylistPickerTitle => 'Scegli una playlist';

  @override
  String get queuePlaylistNone => 'Nessuna playlist selezionata';

  @override
  String queuePlaylistActiveLabel(String name) {
    return 'Playlist: $name';
  }

  @override
  String get queueModePlaylistHint =>
      'Avvia una coda da playlist aprendo una playlist nella home.';

  @override
  String get exit => 'Esci';

  @override
  String upNext(String label) {
    return 'Prossimo: $label';
  }

  @override
  String get nothingUpNext => 'Niente in arrivo';

  @override
  String get showUpNextLabel => 'Mostra \"Prossimo\" nella pagina Absorbing';

  @override
  String get openSeries => 'Apri serie';

  @override
  String get openPlaylist => 'Apri playlist';

  @override
  String get openCollection => 'Apri raccolta';

  @override
  String get playlistPlayAction => 'Riproduci playlist';

  @override
  String get playlistAllFinished => 'Tutto completato';

  @override
  String get queueModeBooks => 'Libri';

  @override
  String get queueModePodcasts => 'Podcast';

  @override
  String get autoDownloadQueue => 'Download automatico della coda';

  @override
  String get autoDownloadThisSeriesLabel =>
      'Scarica automaticamente questa serie';

  @override
  String get autoDownloadThisShowLabel =>
      'Scarica automaticamente questo podcast';

  @override
  String get autoDownloadThisPlaylistLabel =>
      'Scarica automaticamente questa playlist';

  @override
  String get autoDownloadThisCollectionLabel =>
      'Scarica automaticamente questa raccolta';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return 'Mantieni scaricati i prossimi $count elementi';
  }

  @override
  String get autoDownloadQueueOffSubtitle => 'Off: solo download manuali';

  @override
  String get sectionPlayback => 'Riproduzione';

  @override
  String get sectionMediaControls => 'Controlli multimediali';

  @override
  String get defaultSpeed => 'Velocità predefinita';

  @override
  String get defaultSpeedSubtitle =>
      'I nuovi libri partono a questa velocità: ogni libro ricorda la propria';

  @override
  String get skipBack => 'Salta indietro';

  @override
  String get skipForward => 'Salta avanti';

  @override
  String get iosLockScreenSkipHint =>
      'La schermata di blocco mostra solo i numeri per cui iOS ha un\'icona (5, 10, 15, 30, 45, 60, 75, 90). Gli altri valori mostrano + sul pulsante ma saltano comunque di quanto impostato.';

  @override
  String get longSkipButtons => 'Pulsanti di salto lungo';

  @override
  String get longSkipButtonsOnSubtitle =>
      'Attivo: il player mostra una seconda coppia di pulsanti di salto, più grande';

  @override
  String get longSkipButtonsOffSubtitle =>
      'Disattivo: solo i pulsanti di salto normali';

  @override
  String get longSkipBack => 'Salto lungo indietro';

  @override
  String get longSkipForward => 'Salto lungo avanti';

  @override
  String get coverShapeDefault => 'Predefinita';

  @override
  String get coverShapeSquare => 'Quadrata';

  @override
  String get coverShapeRectangle => 'Rettangolare';

  @override
  String get coverShapeLabel => 'Forma della copertina';

  @override
  String get showSubtitles => 'Mostra sottotitoli';

  @override
  String get showSubtitlesOnSubtitle =>
      'I sottotitoli compaiono sotto i titoli dei libri nella libreria e nella home';

  @override
  String get showSubtitlesOffSubtitle =>
      'Off: sottotitoli solo nella scheda dei dettagli del libro';

  @override
  String get subtitleVisibilityLabel => 'Sottotitoli';

  @override
  String get subtitleVisibilityDefault => 'Predefinito';

  @override
  String get subtitleVisibilityShow => 'Mostra';

  @override
  String get subtitleVisibilityHide => 'Nascondi';

  @override
  String currentLibrarySettingsTitle(String name) {
    return 'Libreria corrente: $name';
  }

  @override
  String get currentLibrarySkipOverride => 'Valori di salto personalizzati';

  @override
  String get currentLibrarySkipOverrideOnSubtitle =>
      'Attivo: questa libreria usa i propri valori di salto';

  @override
  String get currentLibrarySkipOverrideOffSubtitle =>
      'Disattivo: questa libreria usa i valori di salto globali';

  @override
  String get currentLibrarySkipBack => 'Salta indietro';

  @override
  String get currentLibrarySkipForward => 'Salta avanti';

  @override
  String get chapterProgressInNotification =>
      'Progresso del capitolo nella notifica e in Android Auto';

  @override
  String get chapterProgressOnSubtitle =>
      'Attivo: notifica e Android Auto mostrano il progresso del capitolo';

  @override
  String get chapterProgressOffSubtitle =>
      'Disattivo: mostrano il progresso dell\'intero libro';

  @override
  String get chapterProgressInNotificationIos =>
      'Progresso del capitolo nella schermata di blocco e in CarPlay';

  @override
  String get chapterProgressOnSubtitleIos =>
      'Attivo: schermata di blocco e CarPlay mostrano il progresso del capitolo';

  @override
  String get nowPlayingText => 'Testo di riproduzione';

  @override
  String get nowPlayingTextSubtitle =>
      'Scegli cosa mostrano i controlli multimediali su ogni riga';

  @override
  String get nowPlayingTopLine => 'Riga superiore';

  @override
  String get nowPlayingSecondLine => 'Seconda riga';

  @override
  String get nowPlayingNotShown => 'Non mostrato';

  @override
  String get nowPlayingTopLineRequired =>
      'La riga superiore richiede almeno un elemento';

  @override
  String get nowPlayingPieceChapter => 'Capitolo';

  @override
  String get nowPlayingPieceTitle => 'Titolo del libro';

  @override
  String get nowPlayingPieceNarrator => 'Narratore';

  @override
  String get nowPlayingPieceSeries => 'Serie';

  @override
  String get nowPlayingPiecePercent => 'Percentuale del libro';

  @override
  String get nowPlayingPieceChapterNumber => 'Numero del capitolo';

  @override
  String get nowPlayingPieceTimeLeft => 'Tempo rimanente';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return 'Cap. $number/$total';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return '$time rimanenti';
  }

  @override
  String get bookDockBadgePending => 'In attesa';

  @override
  String get bookDockBadgeExtracting => 'Lettura del file';

  @override
  String get bookDockBadgeFetching => 'Ricerca';

  @override
  String get bookDockBadgeError => 'Errore';

  @override
  String get bookDockNeedsReview => 'Da rivedere';

  @override
  String get bookDockNoMatch => 'Nessuna corrispondenza';

  @override
  String get bookDockApplied => 'Applicato';

  @override
  String get bookDockNotApplied => 'Dettagli trovati non usati';

  @override
  String get bookDockNoDestination => 'Nessuna destinazione impostata';

  @override
  String get bookDockNoAuthor => 'Ancora nessun autore';

  @override
  String get bookDockLookUpAgain => 'Cerca di nuovo';

  @override
  String get bookDockLookingUp => 'Nuova ricerca dei dettagli';

  @override
  String get bookDockLookUpFailed => 'Impossibile cercare i dettagli';

  @override
  String get bookDockProposedChanges => 'Modifiche proposte';

  @override
  String get bookDockNoChanges => 'Ancora nessun dettaglio trovato online';

  @override
  String get bookDockStillReading =>
      'Il server sta ancora leggendo questo file';

  @override
  String get bookDockRoleBook => 'Libro';

  @override
  String get bookDockRoleCover => 'Copertina';

  @override
  String get bookDockRoleMetadata => 'Metadati';

  @override
  String get bookDockRoleExtra => 'Extra';

  @override
  String get bookDockFieldTitle => 'Titolo';

  @override
  String get bookDockFieldSubtitle => 'Sottotitolo';

  @override
  String get bookDockFieldAuthors => 'Autori';

  @override
  String get bookDockFieldSeries => 'Serie';

  @override
  String get bookDockFieldPublisher => 'Editore';

  @override
  String get bookDockFieldYear => 'Anno';

  @override
  String get bookDockFieldLanguage => 'Lingua';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return '$percent% di corrispondenza';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return 'Va in $library';
  }

  @override
  String bookDockChangedFields(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count campi',
      one: '1 campo',
    );
    return '$_temp0';
  }

  @override
  String bookDockFilesInEntry(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file in questa voce',
      one: 'File in questa voce',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return 'Aggiunto il $date';
  }

  @override
  String get bookDockAddToLibrary => 'Aggiungi alla libreria';

  @override
  String get bookDockUseFound => 'Usa i dettagli trovati';

  @override
  String get bookDockRemoveTitle => 'Rimuovere da Book Dock?';

  @override
  String get bookDockRemoveFailed => 'Impossibile rimuovere questo file';

  @override
  String get bookDockPickLibrary => 'A quale libreria aggiungere?';

  @override
  String get bookDockNoLibraries =>
      'Il tuo account non può aggiungere libri a una libreria';

  @override
  String get bookDockFileFailed =>
      'Impossibile aggiungere questo file alla libreria';

  @override
  String get bookDockDuplicateBody =>
      'Un file con questo nome è già in quella libreria. Rimuoverlo da Book Dock?';

  @override
  String get bookDockDetailsUpdated => 'Dettagli aggiornati';

  @override
  String get bookDockUseFoundFailed => 'Nessun dettaglio trovato da usare';

  @override
  String bookDockRemoveBody(String title) {
    return 'Questo elimina $title dal server.';
  }

  @override
  String bookDockRemoved(String title) {
    return '$title rimosso da Book Dock';
  }

  @override
  String bookDockFiled(String title, String library) {
    return '$title aggiunto a $library';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return 'Impossibile aggiungere questo file: $reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return 'Già in $library';
  }

  @override
  String get bomatchSearchAll => 'Cerca in tutte le fonti';

  @override
  String get bomatchSearching => 'Ricerca in corso...';

  @override
  String get bomatchSearchFailed =>
      'Impossibile cercare corrispondenze. Controlla la connessione e riprova.';

  @override
  String get bomatchNoResults => 'Nessuna corrispondenza trovata';

  @override
  String get bomatchStrong => 'Corrispondenze forti';

  @override
  String get bomatchPossible => 'Corrispondenze possibili';

  @override
  String get bomatchSourceTimeout => 'scaduto';

  @override
  String get bomatchSourceBusy => 'occupato';

  @override
  String get bomatchSourceFailed => 'non riuscito';

  @override
  String get bomatchLinked => 'Collegato';

  @override
  String get bomatchSameIsbn => 'Stesso ISBN';

  @override
  String get bomatchFewDetails => 'Pochi dettagli';

  @override
  String get bomatchBack => 'Tutti i risultati';

  @override
  String get bomatchFillEmpty => 'Compila i vuoti';

  @override
  String get bomatchTakeAll => 'Prendi tutto';

  @override
  String get bomatchOnlyDifferences => 'Solo differenze';

  @override
  String get bomatchNow => 'Ora';

  @override
  String get bomatchEmpty => 'Vuoto';

  @override
  String get bomatchKindNew => 'Nuovo';

  @override
  String get bomatchKindChange => 'Modifica';

  @override
  String get bomatchKindSmall => 'Piccola modifica';

  @override
  String get bomatchKindSame => 'Uguale';

  @override
  String get bomatchKindNone => 'Non nel risultato';

  @override
  String get bomatchKeep => 'Mantieni';

  @override
  String get bomatchUse => 'Usa';

  @override
  String get bomatchMerge => 'Unisci';

  @override
  String get bomatchReplace => 'Sostituisci';

  @override
  String get bomatchUseThis => 'Usa questo';

  @override
  String get bomatchChosen => 'Scelto';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count altri libri',
      one: '1 altro libro',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count modifiche',
      one: '1 modifica',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nuovi',
      one: '1 nuovo',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Applica $count modifiche',
      one: 'Applica 1 modifica',
      zero: 'Applica',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count altre fonti',
      one: '1 altra fonte',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return 'Da $source';
  }

  @override
  String get breqTitle => 'Richieste di libri';

  @override
  String get breqTabRequest => 'Richiedi un libro';

  @override
  String get breqTabMine => 'Le mie richieste';

  @override
  String get breqTabAll => 'Tutte le richieste';

  @override
  String get breqNoAccess =>
      'Il tuo account non può richiedere libri su questo server.';

  @override
  String get breqTitleHint => 'Titolo del libro';

  @override
  String get breqAuthorHint => 'Autore';

  @override
  String get breqKindAudiobook => 'Audiolibro';

  @override
  String get breqKindEbook => 'Ebook';

  @override
  String get breqKindComic => 'Fumetto';

  @override
  String get breqSearch => 'Cerca';

  @override
  String get breqSearching => 'Ricerca in corso...';

  @override
  String get breqSearchFailed =>
      'Impossibile cercare. Controlla la connessione e riprova.';

  @override
  String get breqSearchPrompt =>
      'Cerca un libro che la libreria non ha ancora per richiederlo.';

  @override
  String get breqNoResults => 'Nessun libro corrispondente trovato';

  @override
  String get breqInLibrary => 'Nella tua libreria';

  @override
  String get breqYouAsked => 'L\'hai richiesto tu';

  @override
  String get breqSomeoneAsked => 'Già richiesto da qualcun altro';

  @override
  String get breqView => 'Visualizza';

  @override
  String get breqRequest => 'Richiedi';

  @override
  String get breqRequested => 'Richiesto';

  @override
  String get breqAddMeToo => 'Aggiungi anche me';

  @override
  String get breqLibrary => 'Libreria';

  @override
  String get breqLibraryApprover => 'Decide chi approva';

  @override
  String get breqLibraryChoose => 'Scegli una libreria';

  @override
  String get breqNote => 'Nota per chi approva';

  @override
  String get breqNoteHint =>
      'Qualsiasi cosa utile da sapere su questa richiesta';

  @override
  String get breqAutoApproved => 'Le tue richieste vengono approvate subito.';

  @override
  String get breqSubmitted => 'Richiesta inviata';

  @override
  String get breqJoined => 'Sei stato aggiunto alla richiesta esistente';

  @override
  String get breqFailed => 'Impossibile inviare la richiesta';

  @override
  String get breqStatusPending => 'In attesa';

  @override
  String get breqStatusApproved => 'Approvata';

  @override
  String get breqStatusRejected => 'Rifiutata';

  @override
  String get breqStatusCancelled => 'Annullata';

  @override
  String get breqStatusSearching => 'In ricerca';

  @override
  String get breqStatusGrabbed => 'Release trovata';

  @override
  String get breqStatusDownloading => 'Download in corso';

  @override
  String get breqStatusImporting => 'Importazione';

  @override
  String get breqStatusNeedsReview => 'Da rivedere';

  @override
  String get breqStatusAvailable => 'Disponibile';

  @override
  String get breqStatusFailed => 'Non riuscita';

  @override
  String get breqWaitingApproval => 'In attesa di approvazione';

  @override
  String get breqWaitingRelease => 'In attesa della scelta di una release';

  @override
  String get breqLookingForRelease => 'Ricerca di una release';

  @override
  String get breqStartingDownload => 'Avvio del download';

  @override
  String get breqAddingToLibrary => 'Aggiunta alla libreria';

  @override
  String get breqWaitingCheck => 'In attesa di un controllo manuale';

  @override
  String get breqReady => 'Pronto nella tua libreria';

  @override
  String get breqSomethingWrong => 'Qualcosa è andato storto';

  @override
  String get breqShowHidden => 'Mostra nascoste';

  @override
  String get breqHidden => 'Nascosta';

  @override
  String get breqMineEmpty => 'Non hai ancora richiesto nessun libro.';

  @override
  String get breqAllEmpty => 'Ancora nessuna richiesta.';

  @override
  String get breqLoadFailed => 'Impossibile caricare le richieste.';

  @override
  String get breqLoadMore => 'Carica altro';

  @override
  String get breqApprove => 'Approva';

  @override
  String get breqReject => 'Rifiuta';

  @override
  String get breqCancel => 'Annulla richiesta';

  @override
  String get breqHide => 'Nascondi dalla mia lista';

  @override
  String get breqUnhide => 'Mostra nella mia lista';

  @override
  String get breqLeave => 'Lascia la richiesta';

  @override
  String get breqDelete => 'Elimina richiesta';

  @override
  String get breqOpenBook => 'Apri libro';

  @override
  String get breqCancelConfirm =>
      'Annullare questa richiesta? Si interrompe anche un download in corso.';

  @override
  String get breqDeleteConfirm =>
      'Eliminare questa richiesta? Questa azione non può essere annullata.';

  @override
  String get breqRejectTitle => 'Rifiuta richiesta';

  @override
  String get breqRejectReason => 'Motivo (facoltativo)';

  @override
  String get breqApproveTitle => 'Approva richiesta';

  @override
  String get breqApproveLibraryNeeded =>
      'Scegli la libreria in cui va questo libro.';

  @override
  String get breqApprovedToast => 'Richiesta approvata';

  @override
  String get breqRejectedToast => 'Richiesta rifiutata';

  @override
  String get breqCancelledToast => 'Richiesta annullata';

  @override
  String get breqHiddenToast => 'Nascosta dalla tua lista';

  @override
  String get breqRestoredToast => 'Di nuovo nella tua lista';

  @override
  String get breqDeletedToast => 'Richiesta eliminata';

  @override
  String get breqLeftToast => 'Hai lasciato questa richiesta';

  @override
  String get breqActionFailed => 'Impossibile aggiornare la richiesta';

  @override
  String get breqFactRequestedBy => 'Richiesto da';

  @override
  String get breqFactRequestedOn => 'Richiesto il';

  @override
  String get breqFactLibrary => 'Libreria';

  @override
  String get breqFactDecidedBy => 'Deciso da';

  @override
  String get breqFactNote => 'Nota di chi ha richiesto';

  @override
  String get breqFactDecisionNote => 'Nota della decisione';

  @override
  String get breqFactAlsoWanted => 'Voluto anche da';

  @override
  String get breqLibraryCta => 'Richiedi un libro';

  @override
  String get breqSettingsSubtitle =>
      'Chiedi i libri che la libreria non ha ancora';

  @override
  String get navHoldBookRequests => 'Richieste di libri';

  @override
  String breqLibraryDefault(String library) {
    return 'Predefinita ($library)';
  }

  @override
  String breqFailedReason(String reason) {
    return 'Impossibile inviare la richiesta: $reason';
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
    return 'Download in corso, $percent%';
  }

  @override
  String breqAddedTo(String library) {
    return 'Aggiunto a $library';
  }

  @override
  String breqRejectedWithNote(String note) {
    return 'Rifiutata: $note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return 'Non riuscita: $reason';
  }

  @override
  String breqRequestedBy(String name) {
    return 'Richiesto da $name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return 'Impossibile aggiornare la richiesta: $reason';
  }

  @override
  String breqFooterCta(String query) {
    return 'Richiedi \"$query\"';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count richieste',
      one: '1 richiesta',
      zero: 'Nessuna richiesta',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => 'Trova una release';

  @override
  String get breqTryAnotherRelease => 'Prova un\'altra release';

  @override
  String get breqApproveAndFind => 'Approva e trova una release';

  @override
  String get breqReviewButton => 'Rivedi download';

  @override
  String get breqStopDownload => 'Interrompi download';

  @override
  String get breqStopDownloadConfirm =>
      'Interrompere questo download? La richiesta torna ad approvata, così si può scegliere un\'altra release.';

  @override
  String get breqDiscardImport => 'Scarta download';

  @override
  String get breqDiscardConfirm =>
      'Scartare questo download? La richiesta viene segnata come non riuscita e si può riprovare con un\'altra release.';

  @override
  String get breqFileAnyway => 'Aggiungi alla libreria';

  @override
  String get breqFiledToast => 'Aggiunto alla libreria';

  @override
  String get breqDiscardedToast => 'Download scartato';

  @override
  String get breqStoppedToast => 'Download interrotto';

  @override
  String get breqGrabTitle => 'Scaricare questa release?';

  @override
  String get breqGrab => 'Scarica';

  @override
  String get breqGrabbed => 'Download avviato';

  @override
  String get breqGrabFailed => 'Impossibile avviare quel download';

  @override
  String get breqReleaseVipWarning =>
      'Questo tracker consente il download solo agli account VIP.';

  @override
  String get breqReleaseNoBookFile =>
      'Questa release non contiene un file di libro che BookOrbit possa aggiungere a una libreria.';

  @override
  String get breqReleaseCheckFailed =>
      'Impossibile controllare il contenuto di questa release. Riprova o scegline un\'altra.';

  @override
  String get breqCheckingRelease => 'Controllo dei file...';

  @override
  String get breqSearchAgain => 'Cerca di nuovo';

  @override
  String get breqSearchTerms => 'Termini di ricerca';

  @override
  String get breqIsbnHint => 'Lascia vuoto per cercare per titolo e autore';

  @override
  String get breqSearchingIndexers =>
      'Ricerca nei tuoi indexer. Può richiedere fino a un minuto.';

  @override
  String get breqReleasesFailed => 'Impossibile cercare le release.';

  @override
  String get breqNoSourcesSetUp =>
      'In BookOrbit non è configurata alcuna fonte di ricerca.';

  @override
  String get breqNoSourcesOn =>
      'Tutte le fonti di ricerca sono disattivate in BookOrbit.';

  @override
  String get breqNoSourceCarries =>
      'Nessuna delle tue fonti di ricerca ha questo tipo di libro.';

  @override
  String get breqNoReleases =>
      'Nessuna release trovata. Prova con termini di ricerca diversi.';

  @override
  String get breqFromCache => 'da una ricerca recente';

  @override
  String get breqIndexerUnauthorized => 'accesso non riuscito';

  @override
  String get breqIndexerThrottled => 'occupato';

  @override
  String get breqIndexerTimeout => 'scaduto';

  @override
  String get breqIndexerUnreachable => 'non raggiungibile';

  @override
  String get breqIndexerNoMedium => 'non lo include';

  @override
  String get breqIndexerError => 'non riuscito';

  @override
  String get breqSortBest => 'Migliore corrispondenza';

  @override
  String get breqSortSeeders => 'Seeder';

  @override
  String get breqSortSize => 'Dimensione';

  @override
  String get breqSortNewest => 'Più recenti';

  @override
  String get breqFreeleech => 'Freeleech';

  @override
  String get breqVipOnly => 'Solo VIP';

  @override
  String get breqAlreadyGrabbed => 'Già scaricato in passato';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => 'Titolo';

  @override
  String get breqReasonAuthor => 'Autore';

  @override
  String get breqReasonUnknownFormat => 'Formato sconosciuto';

  @override
  String get breqReasonExpectedSize => 'Dimensione';

  @override
  String get breqReasonSuspiciousSize => 'Dimensione insolita';

  @override
  String get breqReasonFreeleech => 'Freeleech';

  @override
  String get breqReasonSeveralBooks => 'Più libri';

  @override
  String get breqReviewTitle => 'Download in attesa di controllo';

  @override
  String get breqReviewFailed =>
      'Impossibile caricare i dettagli del download.';

  @override
  String get breqReviewDockGone =>
      'I file scaricati non sono più nel Book Dock.';

  @override
  String get breqReviewNoLibrary =>
      'Questa richiesta non ha una libreria in cui aggiungere il libro.';

  @override
  String breqGrabFailedReason(String reason) {
    return 'Impossibile avviare quel download: $reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return 'Impossibile controllare il contenuto di questa release: $reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return 'Impossibile cercare le release: $reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return 'Impossibile caricare i dettagli del download: $reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count release',
      one: '1 release',
      zero: 'Nessuna release',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return '$seeders seeder, $leechers leecher';
  }

  @override
  String breqScore(int score) {
    return 'Punteggio $score';
  }

  @override
  String breqReasonPreferredFormat(String format) {
    return '$format preferito';
  }

  @override
  String breqReasonFormat(String format) {
    return '$format';
  }

  @override
  String breqReasonSeeders(String count) {
    return '$count seeder';
  }

  @override
  String breqReviewScore(int score, int threshold) {
    return 'Punteggio di corrispondenza $score. I download con punteggio $threshold o superiore vengono aggiunti automaticamente.';
  }

  @override
  String breqReviewRequested(String value) {
    return 'Richiesto: $value';
  }

  @override
  String breqReviewImported(String value) {
    return 'Scaricato: $value';
  }

  @override
  String get breqKindBoth => 'Entrambi';

  @override
  String get breqEbookLibrary => 'Libreria di ebook';

  @override
  String get breqAudiobookLibrary => 'Libreria di audiolibri';

  @override
  String get breqRequestBoth => 'Richiedi entrambi';

  @override
  String get breqAddMeToBoth => 'Aggiungimi a entrambi';

  @override
  String get breqRequestEbook => 'Richiedi ebook';

  @override
  String get breqRequestAudiobook => 'Richiedi audiolibro';

  @override
  String get breqAddMeEbook => 'Aggiungimi alla richiesta dell\'ebook';

  @override
  String get breqAddMeAudiobook => 'Aggiungimi alla richiesta dell\'audiolibro';

  @override
  String get breqPairSubmitted => 'Richiesti l\'ebook e l\'audiolibro';

  @override
  String get breqPairOneJoined =>
      'Richiesti entrambi. Uno era già in arrivo, quindi sei stato aggiunto a quella richiesta';

  @override
  String get breqJoinedBoth => 'Sei stato aggiunto a entrambe le richieste';

  @override
  String get breqJoinsOwned =>
      'Richiesto. Verrà affiancato alla copia già presente nella tua libreria';

  @override
  String get speedBookmarkInControls =>
      'Velocità e segnalibro nei controlli multimediali';

  @override
  String get speedBookmarkOnSubtitle =>
      'Attivo: la notifica mostra velocità e segnalibro; il salto capitolo resta in Android Auto';

  @override
  String get speedBookmarkOffSubtitle =>
      'Disattivo: la notifica mostra il salto capitolo; velocità e segnalibro restano in Android Auto';

  @override
  String get lockSeekBar => 'Blocca la barra di avanzamento';

  @override
  String get lockSeekBarOnSubtitle =>
      'Attivo: il cursore nella notifica, nella schermata di blocco e in auto mostra i progressi ma non si può trascinare';

  @override
  String get lockSeekBarOffSubtitle =>
      'Disattivo: trascina il cursore nella notifica, nella schermata di blocco e in auto per spostarti';

  @override
  String get autoRewindOnResume => 'Riavvolgimento automatico alla ripresa';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return 'Attivo: da $min s a $max s in base alla durata della pausa';
  }

  @override
  String get autoRewindOffSubtitle => 'Off';

  @override
  String get rewindRange => 'Intervallo di riavvolgimento';

  @override
  String get rewindAfterPausedFor => 'Riavvolgi dopo una pausa di';

  @override
  String get rewindAnyPause => 'Qualsiasi pausa';

  @override
  String get rewindAlwaysLabel => 'Sempre';

  @override
  String get rewindAlwaysDescription =>
      'Riavvolge a ogni ripresa, anche dopo brevi interruzioni';

  @override
  String rewindAfterDescription(String seconds) {
    return 'Riavvolge solo se in pausa da $seconds+ secondi';
  }

  @override
  String get chapterBarrier => 'Limite del capitolo';

  @override
  String get chapterBarrierSubtitle =>
      'Non riavvolgere automaticamente oltre l\'inizio del capitolo corrente';

  @override
  String get rewindInstant => 'Istantaneo';

  @override
  String rewindPause(String duration) {
    return 'Pausa di $duration';
  }

  @override
  String get rewindNoRewind => 'nessun riavvolgimento';

  @override
  String rewindSeconds(String seconds) {
    return 'Riavvolgimento di $seconds s';
  }

  @override
  String get sectionSleepTimer => 'Timer di spegnimento';

  @override
  String get sleep => 'Spegnimento';

  @override
  String get sleepTimer => 'Timer di spegnimento';

  @override
  String get shakeDuringSleepTimer => 'Scuoti durante il timer di spegnimento';

  @override
  String get shakeOff => 'Off';

  @override
  String get shakeAddTime => 'Aggiungi tempo';

  @override
  String get shakeReset => 'Azzera';

  @override
  String get shakeAdds => 'Lo scuotimento aggiunge';

  @override
  String get sleepAddAmount => 'Tempo da aggiungere';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes min';
  }

  @override
  String get shakeSensitivity => 'Sensibilità allo scuotimento';

  @override
  String get shakeSensitivityVeryLow => 'Molto bassa';

  @override
  String get shakeSensitivityLow => 'Bassa';

  @override
  String get shakeSensitivityMedium => 'Media';

  @override
  String get shakeSensitivityHigh => 'Alta';

  @override
  String get shakeSensitivityVeryHigh => 'Molto alta';

  @override
  String get buttonDuringSleepTimer =>
      'Pulsante delle cuffie durante l\'attenuazione finale';

  @override
  String get buttonDuringSleepTimerHint =>
      'Negli ultimi istanti prima dello spegnimento, una pressione azzera il timer invece di mettere in pausa. La doppia pressione continua a saltare.';

  @override
  String get resetTimerOnPause => 'Azzera il timer in pausa';

  @override
  String get resetTimerOnPauseOnSubtitle =>
      'Il timer riparte dalla durata completa quando riprendi';

  @override
  String get resetTimerOnPauseOffSubtitle =>
      'Il timer continua da dove si era fermato';

  @override
  String get fadeVolumeBeforeSleep =>
      'Abbassa il volume prima dello spegnimento';

  @override
  String get fadeVolumeOnSubtitle =>
      'Abbassa gradualmente il volume negli ultimi 30 secondi';

  @override
  String get fadeVolumeOffSubtitle =>
      'La riproduzione si ferma subito alla fine del timer';

  @override
  String get autoSleepTimer => 'Timer di spegnimento automatico';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration min';
  }

  @override
  String get autoSleepTimerOffSubtitle =>
      'Avvia automaticamente un timer di spegnimento in una fascia oraria';

  @override
  String get windowStart => 'Inizio fascia';

  @override
  String get windowEnd => 'Fine fascia';

  @override
  String get timerDuration => 'Durata del timer';

  @override
  String get timer => 'Timer';

  @override
  String get endOfChapter => 'Fine del capitolo';

  @override
  String startMinTimer(int minutes) {
    return 'Avvia timer di $minutes min';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return 'Spegni dopo $count $label';
  }

  @override
  String get addMoreTime => 'Aggiungi altro tempo';

  @override
  String get cancelTimer => 'Annulla timer';

  @override
  String chaptersLeftCount(int count) {
    return '$count cap. rimasti';
  }

  @override
  String get sectionDownloadsAndStorage => 'Download e archiviazione';

  @override
  String get downloadOverWifiOnly => 'Rete per i download';

  @override
  String get downloadOverWifiOnSubtitle => 'Solo Wi-Fi';

  @override
  String get downloadOverWifiOffSubtitle => 'Qualsiasi connessione';

  @override
  String get autoDownloadOnWifi => 'Scarica automaticamente i libri che avvii';

  @override
  String get autoDownloadOnWifiInfoTitle =>
      'Scarica automaticamente i libri che avvii';

  @override
  String get autoDownloadOnWifiInfoContent =>
      'Quando inizi ad ascoltare un libro in streaming, il libro completo viene scaricato in background, così lo avrai offline senza avviare tu il download. Questi download seguono l\'impostazione Rete per i download qui sopra: impostala su Qualsiasi connessione se vuoi che funzionino anche con i dati mobili.';

  @override
  String get autoDownloadOnWifiOnSubtitle =>
      'I libri in streaming vengono scaricati automaticamente in background';

  @override
  String get autoDownloadOnWifiOffSubtitle => 'Off';

  @override
  String get concurrentDownloads => 'Download simultanei';

  @override
  String get autoDownload => 'Download automatico';

  @override
  String get autoDownloadSubtitle =>
      'Attivalo per serie, podcast, playlist o raccolta dalle rispettive pagine di dettaglio';

  @override
  String get autoDownloadEnabledFor => 'Attivo per';

  @override
  String get autoDownloadEnabledForNone => 'Ancora nulla';

  @override
  String get autoDownloadSourceUnnamed => 'Non ancora caricato';

  @override
  String get keepNext => 'Mantieni i prossimi';

  @override
  String get keepNextInfoTitle => 'Mantieni i prossimi';

  @override
  String get keepNextInfoContent =>
      'Il numero di elementi da tenere scaricati, compreso quello che stai ascoltando. Ad esempio, \"Mantieni i prossimi 3\" significa che restano scaricati il libro corrente più i 2 successivi di quella serie, podcast, playlist o raccolta. Vale per ogni download automatico che attivi.';

  @override
  String get deleteAbsorbedDownloads => 'Elimina i download completati';

  @override
  String get deleteAbsorbedDownloadsInfoTitle =>
      'Elimina i download completati';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      'Se attivo, i libri o gli episodi scaricati vengono eliminati automaticamente da questo dispositivo dopo che li hai completati in Absorb. Completare un elemento sul web o su un altro dispositivo non elimina il suo download qui.';

  @override
  String get deleteAbsorbedOnSubtitle =>
      'Gli elementi completati vengono rimossi per risparmiare spazio';

  @override
  String get deleteAbsorbedOffSubtitle =>
      'Off: i download completati vengono conservati';

  @override
  String get downloadLocation => 'Posizione dei download';

  @override
  String get storageUsed => 'Spazio utilizzato';

  @override
  String storageUsedByDownloads(String size) {
    return '$size usati dai download';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return '$free liberi su $total';
  }

  @override
  String get manageDownloads => 'Gestisci download';

  @override
  String get streamingCache => 'Cache dello streaming';

  @override
  String get streamingCacheInfoTitle => 'Cache dello streaming';

  @override
  String get streamingCacheInfoContent =>
      'Salva su disco l\'audio in streaming, così non serve riscaricarlo se torni indietro o riascolti dei passaggi. La cache è gestita automaticamente: quando si raggiunge il limite di dimensione, i file più vecchi vengono rimossi. È separata dai libri scaricati per intero.';

  @override
  String get streamingCacheOff => 'Off';

  @override
  String get streamingCacheOffSubtitle =>
      'Off: l\'audio viene riprodotto in streaming senza cache';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size MB: l\'audio ascoltato di recente viene salvato su disco';
  }

  @override
  String get clearCache => 'Svuota cache';

  @override
  String get streamingCacheCleared => 'Cache dello streaming svuotata';

  @override
  String get sectionLibrary => 'Libreria';

  @override
  String get hideEbookOnlyTitles => 'Nascondi i titoli solo ebook';

  @override
  String get hideEbookOnlyOnSubtitle =>
      'I libri senza file audio sono nascosti';

  @override
  String get hideEbookOnlyOffSubtitle =>
      'Off: tutti gli elementi della libreria sono mostrati';

  @override
  String get homeCardsOpenDetails => 'Apri i dettagli dalla Home';

  @override
  String get homeCardsOpenDetailsOnSubtitle =>
      'Toccando una scheda di Continua ad ascoltare o Continua a leggere si aprono i suoi dettagli';

  @override
  String get homeCardsOpenDetailsOffSubtitle =>
      'Toccando una scheda di Continua ad ascoltare o Continua a leggere si riprende da dove eri rimasto';

  @override
  String get showGoodreadsButton => 'Mostra il pulsante Goodreads';

  @override
  String get showGoodreadsOnSubtitle =>
      'La scheda dei dettagli del libro mostra un link a Goodreads';

  @override
  String get showGoodreadsOffSubtitle => 'Off: pulsante Goodreads nascosto';

  @override
  String get sectionPermissions => 'Autorizzazioni';

  @override
  String get notifications => 'Notifiche';

  @override
  String get notificationsSubtitle =>
      'Per l\'avanzamento dei download e i controlli di riproduzione';

  @override
  String get notificationsAlreadyEnabled => 'Notifiche già attivate';

  @override
  String get unrestrictedBattery => 'Batteria senza restrizioni';

  @override
  String get unrestrictedBatterySubtitle =>
      'Impedisce ad Android di terminare la riproduzione in background';

  @override
  String get batteryAlreadyUnrestricted => 'Batteria già senza restrizioni';

  @override
  String get sectionIssuesAndSupport => 'Problemi e assistenza';

  @override
  String get bugsAndFeatureRequests => 'Bug e richieste di funzionalità';

  @override
  String get bugsAndFeatureRequestsSubtitle =>
      'Apri una segnalazione su GitHub';

  @override
  String get joinDiscord => 'Unisciti a Discord';

  @override
  String get joinDiscordSubtitle => 'Community, assistenza e aggiornamenti';

  @override
  String get contact => 'Contatti';

  @override
  String get contactSubtitle => 'Invia le info del dispositivo via email';

  @override
  String get enableLogging => 'Attiva i log';

  @override
  String get enableLoggingOnSubtitle =>
      'Attivo: i log vengono salvati su file (riavvia per applicare)';

  @override
  String get enableLoggingOffSubtitle => 'Off: nessun log registrato';

  @override
  String get loggingEnabledSnackbar =>
      'Log attivati: riavvia l\'app per iniziare a registrare';

  @override
  String get loggingDisabledSnackbar =>
      'Log disattivati: riavvia l\'app per smettere di registrare';

  @override
  String get sendLogs => 'Invia log';

  @override
  String get sendLogsSubtitle => 'Condividi il file dei log come allegato';

  @override
  String failedToShare(String error) {
    return 'Condivisione non riuscita: $error';
  }

  @override
  String get clearLogs => 'Cancella log';

  @override
  String get logsCleared => 'Log cancellati';

  @override
  String get clearLogsQuestion => 'Cancellare i log?';

  @override
  String get clearLogsContent =>
      'Questa azione non può essere annullata. Inviali prima, se potrebbero servirti.';

  @override
  String get sectionAdvanced => 'Avanzate';

  @override
  String get localServer => 'Server locale';

  @override
  String get localServerInfoTitle => 'Server locale';

  @override
  String get localServerInfoContent =>
      'Se esegui il tuo server Audiobookshelf in casa, qui puoi impostare un URL locale/LAN. Absorb passerà automaticamente alla connessione locale, più veloce, quando rileva che sei nella tua rete domestica, e tornerà all\'URL remoto quando sei fuori casa.';

  @override
  String get localServerOnConnectedSubtitle => 'Connesso tramite server locale';

  @override
  String get localServerOnRemoteSubtitle => 'Attivo: uso del server remoto';

  @override
  String get localServerOffSubtitle =>
      'Passa automaticamente a un server LAN sul tuo WiFi di casa';

  @override
  String get localServerUrlLabel => 'URL del server locale';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar =>
      'URL del server locale impostato: la connessione sarà automatica quando sei nella rete di casa';

  @override
  String get disableAudioFocus => 'Disattiva il focus audio';

  @override
  String get disableAudioFocusInfoTitle => 'Focus audio';

  @override
  String get disableAudioFocusInfoContent =>
      'Per impostazione predefinita, Android dà il \"focus\" audio a una sola app alla volta: quando Absorb riproduce, gli altri audio (musica, video) vanno in pausa. Disattivando il focus audio, Absorb può riprodurre insieme ad altre app. Le chiamate telefoniche metteranno comunque in pausa la riproduzione, indipendentemente da questa impostazione.';

  @override
  String get disableAudioFocusOnSubtitle =>
      'Attivo: riproduce insieme ad altri audio (va comunque in pausa per le chiamate)';

  @override
  String get disableAudioFocusOffSubtitle =>
      'Off: gli altri audio vanno in pausa quando Absorb riproduce';

  @override
  String get restartRequired => 'Riavvio necessario';

  @override
  String get restartRequiredContent =>
      'La modifica del focus audio richiede un riavvio completo per avere effetto. Chiudere l\'app ora?';

  @override
  String get closeApp => 'Chiudi app';

  @override
  String get trustAllCertificates => 'Fidati di tutti i certificati';

  @override
  String get trustAllCertificatesInfoTitle => 'Certificati autofirmati';

  @override
  String get mp3IndexSeeking => 'Ricerca MP3 con indice';

  @override
  String get mp3IndexSeekingInfoTitle => 'Ricerca MP3 con indice';

  @override
  String get mp3IndexSeekingInfoContent =>
      'Attivalo solo se hai file MP3 che non si posizionano nel punto giusto. Una ricerca imprecisa deriva di solito da MP3 a bitrate variabile (VBR). La ricerca con indice costruisce una mappa temporale esatta mentre il file viene letto, quindi spostarsi vicino alla fine di un MP3 grande può richiedere un momento, soprattutto in streaming, perché il file va letto fino a quel punto. Ha effetto alla prossima riproduzione di un libro o episodio di podcast.';

  @override
  String get mp3IndexSeekingOnSubtitle =>
      'Attivo: ricerca esatta per i file MP3 VBR';

  @override
  String get mp3IndexSeekingOffSubtitle => 'Off: ricerca normale';

  @override
  String get trustAllCertificatesInfoContent =>
      'Attivalo se il tuo server Audiobookshelf usa un certificato autofirmato o una CA radice personalizzata. Quando è attivo, Absorb salta la verifica del certificato TLS per tutte le connessioni. Attivalo solo se ti fidi della tua rete.';

  @override
  String get trustAllCertificatesOnSubtitle =>
      'Attivo: tutti i certificati vengono accettati';

  @override
  String get trustAllCertificatesOffSubtitle =>
      'Off: solo i certificati attendibili vengono accettati';

  @override
  String get supportTheDev => 'Sostieni lo sviluppatore';

  @override
  String get buyMeACoffee => 'Offrimi un caffè';

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
  String get backupAndRestore => 'Backup e ripristino';

  @override
  String get backupAndRestoreSubtitle =>
      'Salva o ripristina tutte le tue impostazioni in un file';

  @override
  String get backUp => 'Esegui backup';

  @override
  String get restore => 'Ripristina';

  @override
  String get allBookmarks => 'Tutti i segnalibri';

  @override
  String get allBookmarksSubtitle => 'Visualizza i segnalibri di tutti i libri';

  @override
  String get switchAccount => 'Cambia account';

  @override
  String get addAccount => 'Aggiungi account';

  @override
  String get logOut => 'Esci';

  @override
  String get includeLoginInfoTitle => 'Includere i dati di accesso?';

  @override
  String get includeLoginInfoContent =>
      'Vuoi includere nel backup le credenziali di accesso di tutti i tuoi account salvati?\n\nCosì è facile ripristinarli su un nuovo dispositivo, ma il file conterrà i tuoi token di autenticazione.';

  @override
  String get noSettingsOnly => 'No, solo impostazioni';

  @override
  String get yesIncludeAccounts => 'Sì, includi gli account';

  @override
  String get backupSavedWithAccounts => 'Backup salvato (con account)';

  @override
  String get backupSavedSettingsOnly => 'Backup salvato (solo impostazioni)';

  @override
  String backupFailed(String error) {
    return 'Backup non riuscito: $error';
  }

  @override
  String get restoreBackupTitle => 'Ripristinare il backup?';

  @override
  String get restoreBackupContent =>
      'Tutte le tue impostazioni attuali verranno sostituite con i valori del backup.';

  @override
  String fromAbsorbVersion(String version) {
    return 'Da Absorb v$version';
  }

  @override
  String restoreAccountsChip(int count) {
    return '$count account';
  }

  @override
  String restoreBookmarksChip(int count) {
    return 'Segnalibri per $count libri';
  }

  @override
  String get restoreCustomHeadersChip => 'Intestazioni personalizzate';

  @override
  String get invalidBackupFile => 'File di backup non valido';

  @override
  String get settingsRestoredSuccessfully =>
      'Impostazioni ripristinate correttamente';

  @override
  String restoreFailed(String error) {
    return 'Ripristino non riuscito: $error';
  }

  @override
  String get logOutTitle => 'Uscire?';

  @override
  String get logOutContent =>
      'Verrà effettuata l\'uscita. I tuoi download resteranno su questo dispositivo.';

  @override
  String get signOut => 'Esci';

  @override
  String get changePasswordTitle => 'Cambia password';

  @override
  String get changePasswordSubtitle =>
      'Aggiorna la tua password di Audiobookshelf in sicurezza';

  @override
  String get currentPassword => 'Password attuale';

  @override
  String get newPassword => 'Nuova password';

  @override
  String get confirmNewPassword => 'Conferma la nuova password';

  @override
  String get passwordChangeEffect =>
      'Cambiando la password verrai disconnesso dalle altre sessioni di Audiobookshelf. Questo dispositivo resta connesso.';

  @override
  String get passwordFieldsRequired => 'Compila tutti i campi password';

  @override
  String get passwordsDoNotMatch => 'Le nuove password non corrispondono';

  @override
  String get passwordChanged =>
      'Password cambiata. Gli altri dispositivi connessi sono stati disconnessi.';

  @override
  String get passwordInvalid => 'La password attuale non è corretta';

  @override
  String get passwordChangeUnsupported =>
      'Questa versione del server non supporta il cambio password sicuro in Absorb';

  @override
  String get passwordChangeFailed => 'Impossibile cambiare la password';

  @override
  String get otherUserPasswordResetWarning =>
      'Cambiando questa password l\'utente verrà disconnesso su tutti i dispositivi.';

  @override
  String get manageSessionsTitle => 'Dispositivi connessi';

  @override
  String get manageSessionsSubtitle =>
      'Controlla e rimuovi le sessioni di Audiobookshelf';

  @override
  String get sessionsCurrent => 'Dispositivo attuale';

  @override
  String get sessionsUnknownDevice => 'Dispositivo sconosciuto';

  @override
  String sessionsLastActive(String date) {
    return 'Ultima attività $date';
  }

  @override
  String get sessionsNone => 'Nessuna sessione attiva';

  @override
  String get sessionsLoadMore => 'Carica altro';

  @override
  String get sessionsUnsupported =>
      'La gestione delle sessioni richiede Audiobookshelf 2.36 o successivo.';

  @override
  String get sessionsLoadFailed =>
      'Impossibile caricare i dispositivi connessi';

  @override
  String get sessionsLegacyNotice =>
      'Questo accesso non ha una sessione di aggiornamento, quindi Absorb non può identificare questo dispositivo nell\'elenco.';

  @override
  String get sessionsRemove => 'Disconnetti dispositivo';

  @override
  String get sessionsRemoveTitle => 'Disconnettere questo dispositivo?';

  @override
  String get sessionsRemoveContent =>
      'Questo rimuove la sua sessione di aggiornamento. L\'accesso attuale potrebbe continuare a funzionare finché non scade il token di breve durata.';

  @override
  String get sessionsRemoved => 'Dispositivo disconnesso';

  @override
  String get sessionsRemoveFailed =>
      'Impossibile disconnettere quel dispositivo';

  @override
  String get sessionsSignOutAll => 'Disconnetti tutti i dispositivi';

  @override
  String get sessionsSignOutAllTitle => 'Disconnettere ovunque?';

  @override
  String get sessionsSignOutAllContent =>
      'Questo rimuove ogni sessione di aggiornamento, compresa quella di questo dispositivo. I token di accesso esistenti potrebbero funzionare fino alla scadenza.';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return 'La pianificazione usa l\'ora del server ($timeZone)';
  }

  @override
  String get podcastScheduleServerTimeUnknown =>
      'La pianificazione usa l\'ora del server';

  @override
  String get editServerAddressTitle => 'Modifica indirizzo del server';

  @override
  String editServerAddressSubtitle(String username) {
    return 'Aggiorna l\'indirizzo per $username. Usalo se l\'indirizzo del tuo server è cambiato: è sempre lo stesso server, solo con un nuovo URL. Statistiche e download vengono conservati.';
  }

  @override
  String get editServerAddressField => 'Indirizzo del server';

  @override
  String get editServerAddressUpdated => 'Indirizzo del server aggiornato';

  @override
  String get editServerAddressFailed =>
      'Impossibile aggiornare l\'indirizzo del server';

  @override
  String get editServerAddressAction => 'Modifica indirizzo del server';

  @override
  String get editServerConnectionTitle => 'Modifica connessione al server';

  @override
  String editServerConnectionSubtitle(String username) {
    return 'Aggiorna l\'indirizzo del server e le intestazioni personalizzate per $username. Statistiche e download vengono conservati.';
  }

  @override
  String get editServerConnectionAction => 'Modifica connessione al server';

  @override
  String get editServerConnectionUpdated => 'Connessione al server aggiornata';

  @override
  String get editServerConnectionFailed =>
      'Impossibile aggiornare la connessione al server';

  @override
  String get editCustomHeadersDescription =>
      'Usate per tunnel Cloudflare o reverse proxy. Queste intestazioni valgono solo per questo account salvato.';

  @override
  String get removeAccountAction => 'Rimuovi account';

  @override
  String get removeAccountTitle => 'Rimuovere l\'account?';

  @override
  String removeAccountContent(String username, String server) {
    return 'Rimuovere $username su $server dagli account salvati?\n\nPotrai sempre aggiungerlo di nuovo più tardi accedendo ancora.';
  }

  @override
  String get switchAccountTitle => 'Cambiare account?';

  @override
  String switchAccountContent(String username, String server) {
    return 'Passare a $username su $server?\n\nLa riproduzione in corso verrà interrotta e l\'app si ricaricherà con i dati dell\'altro account.';
  }

  @override
  String get switchButton => 'Cambia';

  @override
  String get downloadLocationSheetTitle => 'Posizione dei download';

  @override
  String get downloadLocationSheetSubtitle =>
      'Scegli dove salvare gli audiolibri';

  @override
  String get currentLocation => 'Posizione attuale';

  @override
  String get existingDownloadsWarning =>
      'I download esistenti restano nella posizione attuale. Solo i nuovi download useranno il nuovo percorso.';

  @override
  String get chooseFolder => 'Scegli cartella';

  @override
  String get chooseDownloadFolder => 'Scegli la cartella dei download';

  @override
  String get storagePermissionDenied =>
      'Autorizzazione di archiviazione negata in modo permanente: attivala nelle impostazioni dell\'app';

  @override
  String get openSettings => 'Apri Impostazioni';

  @override
  String get storagePermissionRequired =>
      'L\'autorizzazione di archiviazione è necessaria per le posizioni di download personalizzate';

  @override
  String get cannotWriteToFolder =>
      'Impossibile scrivere in quella cartella: scegli un\'altra posizione o concedi l\'accesso ai file nelle impostazioni di sistema';

  @override
  String downloadLocationSetTo(String label) {
    return 'Posizione dei download impostata su $label';
  }

  @override
  String get resetToDefault => 'Ripristina predefinito';

  @override
  String get resetToDefaultStorage => 'Ripristina l\'archiviazione predefinita';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count download si trovano in una vecchia cartella personalizzata che non può più essere aperta. Scaricali di nuovo o ignora questo avviso.',
      one:
          '1 download si trova in una vecchia cartella personalizzata che non può più essere aperta. Scaricalo di nuovo o ignora questo avviso.',
    );
    return '$_temp0';
  }

  @override
  String get redownload => 'Scarica di nuovo';

  @override
  String get redownloadStarted => 'Nuovo download in corso';

  @override
  String get dismiss => 'Ignora';

  @override
  String get tipsAndHiddenFeatures => 'Suggerimenti e funzioni nascoste';

  @override
  String get tipsSubtitle => 'Sfrutta al meglio Absorb';

  @override
  String get adminTitle => 'Amministrazione server';

  @override
  String get adminTasksTitle => 'Attività del server';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count attività in corso',
      one: '1 attività in corso',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => 'Attività recenti del server';

  @override
  String get adminTasksEmpty => 'Nessuna attività del server in corso';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return '$added aggiunti - $updated aggiornati - $missing mancanti';
  }

  @override
  String get adminServer => 'Server';

  @override
  String get adminVersion => 'Versione';

  @override
  String get adminUsers => 'Utenti';

  @override
  String get adminOnline => 'Online';

  @override
  String get adminBackup => 'Backup';

  @override
  String get adminPurgeCache => 'Svuota cache';

  @override
  String get adminManage => 'Gestisci';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return '$userCount account - $onlineCount online';
  }

  @override
  String get adminPodcasts => 'Podcast';

  @override
  String get adminPodcastsSubtitle => 'Cerca, aggiungi e gestisci i programmi';

  @override
  String get adminScan => 'Scansiona';

  @override
  String get adminScanning => 'Scansione in corso...';

  @override
  String get adminMatchAll => 'Abbina tutti';

  @override
  String get adminMatching => 'Abbinamento in corso...';

  @override
  String get adminMatchAllTitle => 'Abbinare tutti gli elementi?';

  @override
  String adminMatchAllContent(String name) {
    return 'Abbinare i metadati di tutti gli elementi in $name? Può richiedere un po\' di tempo.';
  }

  @override
  String adminScanStarted(String name) {
    return 'Scansione avviata per $name';
  }

  @override
  String get adminBackupCreated => 'Backup creato';

  @override
  String get adminBackupFailed => 'Backup non riuscito';

  @override
  String get adminCachePurged => 'Cache svuotata';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => 'Apri nell\'app';

  @override
  String get adminRmabAdd => 'Aggiungi l\'integrazione ReadMeABook';

  @override
  String get adminRmabUrlTitle => 'URL di ReadMeABook';

  @override
  String get adminRmabUrlHelp =>
      'Incolla il tuo URL con il token di accesso. Generane uno in RMAB, Admin, Utenti.';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => 'Inserisci un URL http(s) valido';

  @override
  String get adminRmabSaved => 'ReadMeABook salvato';

  @override
  String get adminRmabRemoved => 'ReadMeABook rimosso';

  @override
  String get adminRmabReload => 'Ricarica';

  @override
  String get adminRmabLoadFailed =>
      'Impossibile caricare ReadMeABook. Controlla il tuo URL.';

  @override
  String get adminRmabConnected => 'Connesso';

  @override
  String get adminRmabAskAdmin =>
      'Chiedi un URL di accesso all\'amministratore del server';

  @override
  String get adminRmabUrlHelpUser =>
      'Chiedi un URL di accesso all\'amministratore del server. Lo genera in RMAB > Admin > Utenti.';

  @override
  String get adminRmabSettingsInfo =>
      'ReadMeABook è un servizio self-hosted per richiedere e scaricare audiolibri. Deve essere installato e configurato dall\'amministratore del server.';

  @override
  String get rmabConfigTitle => 'Connetti ReadMeABook';

  @override
  String get rmabConfigExplainerAdmin =>
      'ReadMeABook è un servizio self-hosted per richiedere audiolibri. Genera un token API in RMAB da Admin Dashboard > Settings > API, poi incolla qui sotto l\'URL del server e il token. Absorb non ospita né scarica alcun contenuto, invia solo richieste al tuo server.';

  @override
  String get rmabConfigExplainerUser =>
      'ReadMeABook è un servizio self-hosted per richiedere audiolibri. Chiedi all\'amministratore del server l\'URL di RMAB e un token API. Absorb non ospita né scarica alcun contenuto, invia solo richieste al tuo server.';

  @override
  String get rmabConfigLearnMore => 'Scopri di più su ReadMeABook';

  @override
  String get rmabConfigBaseUrlLabel => 'URL del server RMAB';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.example.com';

  @override
  String get rmabConfigTokenLabel => 'Token API';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel =>
      'URL di accesso all\'interfaccia web (facoltativo)';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      'Incolla il tuo URL di accesso automatico, così \"Apri nella vista browser\" ti porta già connesso. Lascia vuoto per usare un accesso normale.';

  @override
  String get rmabConfigHeadersHelp =>
      'Intestazioni aggiuntive inviate a ogni richiesta a ReadMeABook, per reverse proxy come Cloudflare Access.';

  @override
  String get rmabConfigConnect => 'Connetti';

  @override
  String get rmabConfigDisconnect => 'Disconnetti';

  @override
  String get rmabConfigOpenWebView => 'Apri nella vista browser';

  @override
  String rmabConfigConnectedAs(String name) {
    return 'Connesso come $name';
  }

  @override
  String get rmabConfigErrorInvalidUrl => 'Inserisci un URL http(s) valido';

  @override
  String get rmabConfigErrorMissingToken => 'Inserisci il tuo token API';

  @override
  String get rmabConfigErrorUnauthorized => 'Token rifiutato dal server';

  @override
  String get rmabConfigErrorForbidden =>
      'Questo token non è autorizzato per quell\'azione';

  @override
  String get rmabConfigErrorNetwork =>
      'Impossibile raggiungere RMAB. Controlla l\'URL.';

  @override
  String get rmabConfigErrorGeneric => 'Impossibile connettersi';

  @override
  String get rmabConfigSavedSnackbar => 'ReadMeABook connesso';

  @override
  String get rmabConfigDisconnectedSnackbar => 'ReadMeABook disconnesso';

  @override
  String get rmabRequestCta => 'Richiedi tramite ReadMeABook';

  @override
  String get rmabSearchHeader => 'Richiedi tramite ReadMeABook';

  @override
  String get rmabSearchHint => 'Cerca per titolo o autore';

  @override
  String get rmabSearchEmpty =>
      'Nessuna corrispondenza sul tuo server ReadMeABook';

  @override
  String get rmabSearchError => 'Impossibile cercare in ReadMeABook';

  @override
  String get rmabSearchPrompt => 'Digita un titolo o un autore per cercare';

  @override
  String get rmabSearchFooterPrompt => 'Cerchi qualcos\'altro?';

  @override
  String rmabSearchFooterCta(String query) {
    return 'Cerca \"$query\" su ReadMeABook';
  }

  @override
  String get rmabBookDetailExplainer =>
      'Questa richiesta verrà inviata tramite il tuo server ReadMeABook. L\'amministratore la esaminerà e la elaborerà. Puoi seguirla in Le mie richieste, nel riquadro ReadMeABook.';

  @override
  String get rmabBookAlreadyAvailable => 'Già nella tua libreria';

  @override
  String get rmabBookAlreadyRequested => 'Già richiesto';

  @override
  String get rmabRequestSubmitting => 'Invio…';

  @override
  String get rmabRequestSent => 'Richiesta inviata';

  @override
  String get rmabRequestErrorAlreadyAvailable => 'Già nella tua libreria';

  @override
  String get rmabRequestErrorBeingProcessed => 'Già in elaborazione';

  @override
  String get rmabRequestErrorDuplicate => 'Hai già richiesto questo libro';

  @override
  String get rmabRequestErrorValidation => 'Impossibile inviare la richiesta';

  @override
  String get rmabRequestErrorUserNotFound =>
      'L\'utente del token non esiste più. Riconnetti ReadMeABook.';

  @override
  String get rmabRequestErrorIgnored =>
      'Questo libro è nella tua lista degli ignorati';

  @override
  String get rmabRequestErrorGeneric => 'Impossibile inviare la richiesta';

  @override
  String get rmabRequestErrorTokenRejected =>
      'Token rifiutato dal server. Riconnetti ReadMeABook.';

  @override
  String get rmabMyRequestsTab => 'Le mie richieste';

  @override
  String get rmabSetupTab => 'Configurazione';

  @override
  String get rmabMyRequestsEmpty => 'Non hai ancora richiesto nessun libro';

  @override
  String get rmabMyRequestsError => 'Impossibile caricare le richieste';

  @override
  String get rmabMyRequestsRefresh => 'Aggiorna';

  @override
  String get rmabRequestDetailTitle => 'Dettagli della richiesta';

  @override
  String get rmabRequestDetailStatus => 'Stato';

  @override
  String get rmabRequestDetailRequestedOn => 'Richiesto il';

  @override
  String get rmabRequestDetailCompletedOn => 'Completato il';

  @override
  String get rmabRequestDetailProgress => 'Progressi';

  @override
  String get rmabStatusActive => 'In corso';

  @override
  String get rmabStatusWaiting => 'In attesa';

  @override
  String get rmabStatusAvailable => 'Disponibile';

  @override
  String get rmabStatusDownloaded => 'Scaricato';

  @override
  String get rmabStatusFailed => 'Non riuscita';

  @override
  String get rmabStatusCancelled => 'Annullata';

  @override
  String get rmabStatusDenied => 'Negata';

  @override
  String get rmabStatusUnknown => 'Sconosciuto';

  @override
  String narratedBy(String narrator) {
    return 'Letto da $narrator';
  }

  @override
  String get onAudible => 'su Audible';

  @override
  String percentComplete(String percent) {
    return '$percent% completato';
  }

  @override
  String get absorbing => 'Absorbing...';

  @override
  String get absorbAgain => 'Absorb di nuovo';

  @override
  String get absorb => 'Absorb';

  @override
  String get ebookOnlyNoAudio => 'Solo ebook - nessun audio';

  @override
  String get absorbAudioNotDownloaded => 'Audio non scaricato';

  @override
  String get absorbAudioNotDownloadedEbookOnly =>
      'Audio non scaricato, solo ebook';

  @override
  String get fullyAbsorbed => 'Absorb completato';

  @override
  String get fullyAbsorbAction => 'Absorb completo';

  @override
  String get removeFromAbsorbing => 'Rimuovi da Absorbing';

  @override
  String get addToAbsorbing => 'Aggiungi ad Absorbing';

  @override
  String get absorbNext => 'Absorb dopo';

  @override
  String get absorbNextAdded => 'Prossimo in Absorbing';

  @override
  String get absorbLast => 'Absorb per ultimo';

  @override
  String get absorbNextHint => 'Subito dopo ciò che è in riproduzione';

  @override
  String get absorbLastHint => 'In fondo all\'elenco';

  @override
  String get removedFromAbsorbing => 'Rimosso da Absorbing';

  @override
  String get addedToAbsorbing => 'Aggiunto ad Absorbing';

  @override
  String get removeFromContinueListening => 'Rimuovi da Continua ad ascoltare';

  @override
  String get removedFromContinueListening => 'Rimosso da Continua ad ascoltare';

  @override
  String get removeFromContinueReading => 'Rimuovi da Continua a leggere';

  @override
  String get removedFromContinueReading => 'Rimosso da Continua a leggere';

  @override
  String get sessionAdd => 'Aggiungi sessione';

  @override
  String get sessionStartLabel => 'Iniziata alle';

  @override
  String get sessionAdded => 'Sessione aggiunta';

  @override
  String get sessionAddFailed => 'Impossibile aggiungere la sessione';

  @override
  String get removeSeriesFromContinueSeries => 'Rimuovi da Continua la serie';

  @override
  String get removedSeriesFromContinueSeries => 'Rimosso da Continua la serie';

  @override
  String get couldNotUpdate => 'Impossibile aggiornare, riprova';

  @override
  String get addToPlaylist => 'Aggiungi alla playlist';

  @override
  String get addToCollection => 'Aggiungi alla raccolta';

  @override
  String get downloadEbook => 'Scarica ebook';

  @override
  String get downloadEbookAgain => 'Scarica di nuovo l\'ebook';

  @override
  String get resetProgress => 'Azzera i progressi';

  @override
  String get lookupLocalMetadata => 'Cerca metadati locali';

  @override
  String get reLookupLocalMetadata => 'Cerca di nuovo i metadati locali';

  @override
  String get clearLocalMetadata => 'Cancella metadati locali';

  @override
  String get searchOnGoodreads => 'Cerca su Goodreads';

  @override
  String get editServerDetails => 'Modifica dettagli sul server';

  @override
  String get encodeTab => 'Codifica';

  @override
  String get codec => 'Codec';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get channels => 'Canali';

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String get startM4bEncode => 'Avvia codifica M4B';

  @override
  String get encodeStarted => 'Codifica M4B avviata';

  @override
  String get encodeFailed => 'Impossibile avviare la codifica';

  @override
  String get encodeFinished => 'Codifica M4B completata';

  @override
  String get currentlyLabel => 'Attualmente:';

  @override
  String encodeOutputPathNote(String path) {
    return 'L\'M4B finito verrà messo nella cartella dei tuoi audiolibri in: $path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return 'Una copia di backup dei tuoi file audio originali sarà conservata in: /metadata/cache/items/$itemId/. Ricordati di svuotare periodicamente la cache degli elementi.';
  }

  @override
  String get encodeTimeNote => 'La codifica può richiedere fino a 30 minuti.';

  @override
  String get encodeRescanNote =>
      'Se il watcher è disattivato, dovrai poi riscansionare questo audiolibro.';

  @override
  String get aboutSection => 'Informazioni';

  @override
  String chaptersCount(int count) {
    return 'Capitoli ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return 'Tracce audio ($count)';
  }

  @override
  String libraryFilesCount(int count) {
    return 'File della libreria ($count)';
  }

  @override
  String get chapters => 'Capitoli';

  @override
  String get noChaptersBook => 'Questo libro non ha capitoli';

  @override
  String get noChaptersPodcast => 'Questo podcast non ha capitoli';

  @override
  String get failedToLoad => 'Caricamento non riuscito';

  @override
  String startedDate(String date) {
    return 'Iniziato il $date';
  }

  @override
  String finishedDate(String date) {
    return 'Completato il $date';
  }

  @override
  String andCountMore(int count) {
    return 'e altri $count';
  }

  @override
  String get markAsFullyAbsorbedQuestion => 'Segnare come Absorb completato?';

  @override
  String get markAsFullyAbsorbedContent =>
      'I tuoi progressi verranno impostati al 100% e la riproduzione si fermerà se questo libro è in riproduzione.';

  @override
  String get markedAsFinishedNiceWork => 'Segnato come completato: bel lavoro!';

  @override
  String get failedToUpdateCheckConnection =>
      'Aggiornamento non riuscito: controlla la connessione';

  @override
  String get markAsNotFinishedQuestion => 'Segnare come non completato?';

  @override
  String get markAsNotFinishedContent =>
      'Lo stato di completato verrà rimosso e la posizione tornerà all\'inizio.';

  @override
  String get unmark => 'Rimuovi segno';

  @override
  String get markedAsNotFinishedBackAtIt =>
      'Segnato come non completato: si riparte!';

  @override
  String get resetProgressQuestion => 'Azzerare i progressi?';

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
  String get progressResetFreshStart => 'Progressi azzerati: nuovo inizio!';

  @override
  String get clearLocalMetadataQuestion => 'Cancellare i metadati locali?';

  @override
  String get clearLocalMetadataContent =>
      'Verranno rimossi i metadati salvati in locale e si userà ciò che ha il server.';

  @override
  String get localMetadataCleared => 'Metadati locali cancellati';

  @override
  String get saveEbook => 'Salva ebook';

  @override
  String get noEbookFileFound => 'Nessun file ebook trovato';

  @override
  String get bookmark => 'Segnalibro';

  @override
  String get bookmarks => 'Segnalibri';

  @override
  String bookmarksWithCount(int count) {
    return 'Segnalibri ($count)';
  }

  @override
  String get playbackSpeed => 'Velocità di riproduzione';

  @override
  String get noBookmarksYet => 'Ancora nessun segnalibro';

  @override
  String get longPressBookmarkHint =>
      'Tieni premuto il pulsante del segnalibro per salvare subito';

  @override
  String get addBookmark => 'Aggiungi segnalibro';

  @override
  String get editBookmark => 'Modifica segnalibro';

  @override
  String get titleLabel => 'Titolo';

  @override
  String get noteOptionalLabel => 'Nota (facoltativa)';

  @override
  String get editLayout => 'Modifica layout';

  @override
  String get inMenu => 'Nel menu';

  @override
  String get bookmarkAdded => 'Segnalibro aggiunto';

  @override
  String get startPlayingSomethingFirst => 'Prima avvia una riproduzione';

  @override
  String get playbackHistory => 'Cronologia di riproduzione';

  @override
  String get historyLocalTab => 'Cronologia';

  @override
  String get historyServerTab => 'Sessioni';

  @override
  String get historyNoServerSessions =>
      'Ancora nessuna sessione sul server per questo elemento';

  @override
  String get historyServerLoadFailed =>
      'Impossibile caricare le sessioni del server';

  @override
  String get clearHistoryTooltip => 'Cancella cronologia';

  @override
  String get tapEventToJump => 'Tocca un evento per andare a quella posizione';

  @override
  String get noHistoryYet => 'Ancora nessuna cronologia';

  @override
  String jumpedToPosition(String position) {
    return 'Spostato a $position';
  }

  @override
  String booksInSeriesCount(int count) {
    return '$count libri in questa serie';
  }

  @override
  String bookNumber(String number) {
    return 'Libro $number';
  }

  @override
  String downloadRemainingCount(int count) {
    return 'Scarica i rimanenti ($count)';
  }

  @override
  String get downloadAll => 'Scarica tutti';

  @override
  String get markAllNotFinished => 'Segna tutti come non completati';

  @override
  String get markAllFinished => 'Segna tutti come completati';

  @override
  String get markAllNotFinishedQuestion => 'Segnare tutti come non completati?';

  @override
  String get fullyAbsorbSeries => 'Absorb completo della serie?';

  @override
  String get turnAutoDownloadOff => 'Disattiva il download automatico';

  @override
  String get turnAutoDownloadOn => 'Attiva il download automatico';

  @override
  String get autoDownloadThisSeries =>
      'Scaricare automaticamente questa serie?';

  @override
  String get autoDownloadSeriesContent =>
      'Scarica automaticamente i libri successivi mentre ascolti.';

  @override
  String get standalone => 'Autoconclusivi';

  @override
  String get episodes => 'Episodi';

  @override
  String get noEpisodesFound => 'Nessun episodio trovato';

  @override
  String get markFinished => 'Segna come completato';

  @override
  String get markUnfinished => 'Segna come non completato';

  @override
  String get allEpisodes => 'Tutti gli episodi';

  @override
  String get aboutThisEpisode => 'Informazioni su questo episodio';

  @override
  String get reversePlayOrder => 'Inverti l\'ordine di riproduzione';

  @override
  String selectedCount(int count) {
    return '$count selezionati';
  }

  @override
  String get selectAll => 'Seleziona tutto';

  @override
  String get deselectAll => 'Deseleziona tutto';

  @override
  String get autoDownloadThisPodcast =>
      'Scaricare automaticamente questo podcast?';

  @override
  String get autoDownloadPodcastContent =>
      'Scarica automaticamente gli episodi successivi mentre ascolti.';

  @override
  String get download => 'Scarica';

  @override
  String get deleteDownload => 'Elimina download';

  @override
  String get casting => 'Trasmissione';

  @override
  String get castingTo => 'Trasmissione su';

  @override
  String get editDetails => 'Modifica dettagli';

  @override
  String get quickMatch => 'Abbinamento rapido';

  @override
  String get quickMatchNoUpdates => 'Nessun aggiornamento necessario';

  @override
  String get custom => 'Personalizzato';

  @override
  String get authorOptionalLabel => 'Autore (facoltativo)';

  @override
  String get noResultsFound =>
      'Nessun risultato trovato.\nProva a modificare la ricerca o il provider.';

  @override
  String get searchForMetadataAbove => 'Cerca i metadati qui sopra';

  @override
  String get applyThisMatch => 'Applicare questo abbinamento?';

  @override
  String get metadataUpdated => 'Metadati aggiornati';

  @override
  String get failedToUpdateMetadata => 'Impossibile aggiornare i metadati';

  @override
  String get subtitleLabel => 'Sottotitolo';

  @override
  String get authorLabel => 'Autore';

  @override
  String get narratorLabel => 'Narratore';

  @override
  String get seriesLabel => 'Serie';

  @override
  String get addSeries => 'Aggiungi serie';

  @override
  String get removeSeries => 'Rimuovi serie';

  @override
  String get descriptionLabel => 'Descrizione';

  @override
  String get publisherLabel => 'Editore';

  @override
  String get yearLabel => 'Anno';

  @override
  String get genresLabel => 'Generi';

  @override
  String get tagsLabel => 'Tag';

  @override
  String get commaSeparated => 'Separati da virgola';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => 'Immagine di copertina';

  @override
  String get coverRemove => 'Rimuovi copertina';

  @override
  String get coverRemoveConfirm =>
      'Rimuovere la copertina di questo libro? Verrà mostrata al suo posto la scheda del titolo generata.';

  @override
  String get coverRemoved => 'Copertina rimossa';

  @override
  String get coverRemoveFailed => 'Impossibile rimuovere la copertina';

  @override
  String get coverUrlLabel => 'URL della copertina';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => 'Metadati locali';

  @override
  String get overrideLocalDisplay => 'Sovrascrivi la visualizzazione locale';

  @override
  String get metadataSavedLocally => 'Metadati salvati in locale';

  @override
  String get notes => 'Note';

  @override
  String get newNote => 'Nuova nota';

  @override
  String get editNote => 'Modifica nota';

  @override
  String get noNotesYet => 'Ancora nessuna nota';

  @override
  String get markdownIsSupported => 'Markdown è supportato';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => 'Mantiene la formattazione';

  @override
  String get plainTextTxt => 'Testo semplice (.txt)';

  @override
  String get simpleTextNoFormatting => 'Testo semplice, senza formattazione';

  @override
  String get untitledNote => 'Nota senza titolo';

  @override
  String get titleHint => 'Titolo';

  @override
  String get noteBodyHint => 'Scrivi la tua nota... (supporta markdown)';

  @override
  String get nothingToPreview => 'Niente da visualizzare in anteprima';

  @override
  String get audioEnhancements => 'Miglioramenti audio';

  @override
  String get presets => 'PRESET';

  @override
  String get equalizer => 'EQUALIZZATORE';

  @override
  String get effects => 'EFFETTI';

  @override
  String get bassBoost => 'Potenziamento bassi';

  @override
  String get surround => 'Surround';

  @override
  String get loudness => 'Loudness';

  @override
  String get monoAudio => 'Audio mono';

  @override
  String get skipSilence => 'Salta i silenzi';

  @override
  String get resetAll => 'Ripristina tutto';

  @override
  String get collectionNotFound => 'Raccolta non trovata';

  @override
  String get deleteCollection => 'Elimina raccolta';

  @override
  String get deleteCollectionContent =>
      'Vuoi davvero eliminare questa raccolta?';

  @override
  String get deleteCollectionFailed => 'Impossibile eliminare la raccolta';

  @override
  String get deletePermissionRequired =>
      'Serve il permesso di eliminazione. Chiedi all\'amministratore root di concedertelo.';

  @override
  String get deleteFilesCheckbox => 'Elimina anche i file sul server';

  @override
  String get deleteFilesCheckedHint =>
      'I file vengono eliminati definitivamente dal server.';

  @override
  String get deleteFilesUncheckedHint =>
      'I file restano sul server, quindi la prossima scansione della libreria può aggiungerlo di nuovo.';

  @override
  String get deleteFromServerAction => 'Elimina dal server';

  @override
  String get deleteFromServerTitle => 'Elimina dal server';

  @override
  String deleteFromServerContent(String title) {
    return 'Eliminare \"$title\" da Audiobookshelf?';
  }

  @override
  String deletedFromServer(String title) {
    return '\"$title\" eliminato';
  }

  @override
  String get deleteFromServerFailed =>
      'Impossibile eliminare. Controlla i log del server.';

  @override
  String get playlistNotFound => 'Playlist non trovata';

  @override
  String get deletePlaylist => 'Elimina playlist';

  @override
  String get deletePlaylistContent => 'Vuoi davvero eliminare questa playlist?';

  @override
  String get newPlaylist => 'Nuova playlist';

  @override
  String get playlistNameHint => 'Nome della playlist';

  @override
  String addedToName(String name) {
    return 'Aggiunto a \"$name\"';
  }

  @override
  String get failedToAdd => 'Aggiunta non riuscita';

  @override
  String get newCollection => 'Nuova raccolta';

  @override
  String get collectionNameHint => 'Nome della raccolta';

  @override
  String get listsNewCollectionSubtitle =>
      'Raggruppa i libri in una lista che conservi';

  @override
  String get listsNewCollectionNeedsBookSubtitle =>
      'Inizia con almeno un libro';

  @override
  String get listsNewPlaylistSubtitle =>
      'Metti in fila i libri da ascoltare in ordine';

  @override
  String get listsAddBooksNow => 'Aggiungi libri ora';

  @override
  String get listsPickBooksNext =>
      'Sceglierai i libri subito dopo. Una raccolta su questo server ne richiede almeno uno.';

  @override
  String get listsCreate => 'Crea';

  @override
  String get listsCollectionNeedsBook =>
      'Una raccolta richiede almeno un libro, quindi non è stato creato nulla.';

  @override
  String get listsCreateFailed => 'Impossibile crearla';

  @override
  String get castToDevice => 'Trasmetti al dispositivo';

  @override
  String get searchingForCastDevices => 'Ricerca di dispositivi Cast...';

  @override
  String get castDevice => 'Dispositivo Cast';

  @override
  String get stopCasting => 'Interrompi trasmissione';

  @override
  String get disconnect => 'Disconnetti';

  @override
  String get audioOutput => 'Uscita audio';

  @override
  String get noOutputDevicesFound => 'Nessun dispositivo di uscita trovato';

  @override
  String get welcomeToAbsorb => 'Benvenuto in Absorb Plus';

  @override
  String get welcomeTagline => 'Un client per Audiobookshelf.';

  @override
  String get welcomeAbsorbingTitle => 'Absorbing';

  @override
  String get welcomeAbsorbingIntro =>
      'Usiamo \"absorb\" al posto di \"riproduci\" e \"ascolta\". Preferisci la dicitura classica? Cambiala nelle Impostazioni.';

  @override
  String get welcomeAbsorbingTabBullet =>
      'Scheda Absorbing - ciò che stai ascoltando ora';

  @override
  String get welcomeAbsorbButtonBullet =>
      'Pulsante Absorb - avvia la riproduzione';

  @override
  String get welcomeFullyAbsorbBullet =>
      'Absorb completo - segna come completato';

  @override
  String get welcomeGettingAroundTitle => 'Come muoversi';

  @override
  String get welcomeGettingAroundBody =>
      'Tocca una copertina per aprirne i dettagli. Le schede di Continua ad ascoltare sono diverse: tocca per riprodurre subito, tieni premuto per aprire i dettagli.';

  @override
  String get welcomeMakeItYoursTitle => 'Rendilo tuo';

  @override
  String get welcomeMakeItYoursBody =>
      'Esplora le Impostazioni per adattare Absorb ai tuoi gusti. La sezione Suggerimenti e funzioni nascoste merita un\'occhiata.';

  @override
  String get getStarted => 'Inizia';

  @override
  String get showMore => 'Mostra di più';

  @override
  String get showLess => 'Mostra meno';

  @override
  String get readMore => 'Leggi di più';

  @override
  String get removeDownloadQuestion => 'Rimuovere il download?';

  @override
  String get removeDownloadContent => 'Verrà rimosso dal tuo dispositivo.';

  @override
  String get removeWhichDownload =>
      'L\'audiolibro e l\'ebook sono entrambi su questo dispositivo. Scegli cosa rimuovere.';

  @override
  String get downloadRemoved => 'Download rimosso';

  @override
  String get finished => 'Completato';

  @override
  String get saved => 'Scaricato';

  @override
  String get selectLibrary => 'Seleziona libreria';

  @override
  String get switchLibraryTooltip => 'Cambia libreria';

  @override
  String get refreshTooltip => 'Aggiorna';

  @override
  String get noBooksFound => 'Nessun libro trovato';

  @override
  String get userFallback => 'Utente';

  @override
  String get rootAdmin => 'Amministratore root';

  @override
  String get admin => 'Amministratore';

  @override
  String get serverAdmin => 'Amministrazione server';

  @override
  String get serverAdminSubtitle =>
      'Gestisci utenti, librerie e impostazioni del server';

  @override
  String serverUpdateAvailable(String version) {
    return 'Aggiornamento del server $version disponibile';
  }

  @override
  String get justNow => 'Adesso';

  @override
  String minutesAgo(int count) {
    return '$count min fa';
  }

  @override
  String hoursAgo(int count) {
    return '$count h fa';
  }

  @override
  String daysAgo(int count) {
    return '$count g fa';
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
  String get coverPlayPause => 'Riproduci/pausa dalla copertina';

  @override
  String get coverPlayPauseOnSubtitle =>
      'Attivo: tocca la copertina per riprodurre/mettere in pausa';

  @override
  String get coverPlayPauseOffSubtitle =>
      'Off: pulsante dedicato di riproduzione/pausa nei controlli';

  @override
  String get cardBackground => 'Sfondo della scheda';

  @override
  String get cardBackgroundBlurred => 'Sfocato';

  @override
  String get cardBackgroundGradient => 'Gradiente';

  @override
  String get queueModeMergedSubtitle =>
      'La riproduzione si ferma, coda manuale o riproduzione automatica dell\'elemento successivo';

  @override
  String get queueModeSeriesLabel => 'Serie';

  @override
  String get queueModeShowLabel => 'Programma';

  @override
  String get queueModeInfoSeries => 'Serie';

  @override
  String get queueModeInfoSeriesDesc =>
      'Riproduce automaticamente il libro successivo di una serie o l\'episodio successivo di un programma podcast.';

  @override
  String get resetButtonGridQuestion => 'Ripristinare la griglia dei pulsanti?';

  @override
  String get resetButtonGridContent =>
      'Verranno ripristinati la disposizione, l\'ordine e le impostazioni di attivazione predefiniti dei pulsanti.';

  @override
  String get reset => 'Ripristina';

  @override
  String get buttonGridReset => 'Griglia dei pulsanti ripristinata';

  @override
  String get resetButtonGrid => 'Ripristina la griglia dei pulsanti';

  @override
  String get chapterBarrierOnRewind => 'Limite del capitolo al riavvolgimento';

  @override
  String get chapterBarrierInfoTitle => 'Limite del capitolo';

  @override
  String get chapterBarrierInfoContent =>
      'Quando torni indietro, la riproduzione si ferma all\'inizio del capitolo corrente invece di passare a quello precedente.\n\nTocca due volte il pulsante di salto indietro entro 2 secondi per superare il limite.';

  @override
  String get chapterBarrierOnRewindOnSubtitle =>
      'Attivo: il riavvolgimento si ferma all\'inizio del capitolo';

  @override
  String get chapterBarrierOnRewindOffSubtitle =>
      'Off: il riavvolgimento supera i confini dei capitoli';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return 'Attivo: da $min s a $max s in base alla durata della pausa';
  }

  @override
  String get rewindOnSessionStart => 'Riavvolgi all\'inizio della sessione';

  @override
  String get rewindOnSessionStartInfoContent =>
      'Il normale riavvolgimento automatico scatta quando riprendi da una pausa all\'interno di una sessione attiva. Questa impostazione aggiunge un riavvolgimento quando inizi una sessione del tutto nuova, ad esempio dopo la chiusura dell\'app, l\'interruzione della riproduzione o un nuovo avvio.\n\nSe attiva, la riproduzione riavvolge dell\'intero valore massimo all\'inizio di ogni nuova sessione, così puoi riascoltare il punto in cui eri rimasto.';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return 'Attivo: riavvolge di $seconds s all\'inizio di una nuova sessione';
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
    return 'Pausa di $seconds s';
  }

  @override
  String rewindMinPause(String minutes) {
    return 'Pausa di $minutes min';
  }

  @override
  String rewindHrPause(String hours) {
    return 'Pausa di $hours h';
  }

  @override
  String get rewindOneHrPause => 'Pausa di 1 h';

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
  String get chimeBeforeSleep => 'Suono prima dello spegnimento';

  @override
  String get chimeBeforeSleepOnSubtitle =>
      'Riproduce una campanella delicata quando il timer sta per terminare';

  @override
  String get chimeBeforeSleepOffSubtitle =>
      'Nessun avviso sonoro prima dello spegnimento';

  @override
  String get windDownDuration => 'Durata dell\'attenuazione finale';

  @override
  String windDownDurationSubtitle(int seconds) {
    return 'Dissolvenza e suono iniziano $seconds s prima dello spegnimento';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return 'Abbassa gradualmente il volume negli ultimi $seconds s';
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
  String get endOfChapterShort => 'Fine del capitolo';

  @override
  String get endOfChapterOnSubtitle => 'Ferma alla fine del capitolo corrente';

  @override
  String get endOfChapterOffSubtitle => 'Usa un timer di spegnimento a tempo';

  @override
  String get showExplicitBadge => 'Mostra il badge Esplicito';

  @override
  String get showExplicitBadgeOnSubtitle =>
      'Gli elementi espliciti mostrano un badge \"E\"';

  @override
  String get showExplicitBadgeOffSubtitle => 'Off: badge Esplicito nascosto';

  @override
  String get showEbookBadge => 'Mostra il badge ebook';

  @override
  String get showEbookBadgeOnSubtitle =>
      'I libri con un ebook mostrano un\'icona di libro sulla copertina';

  @override
  String get showEbookBadgeOffSubtitle => 'Off: badge ebook nascosto';

  @override
  String get libraryFallback => 'Libreria';

  @override
  String get preReleaseUpdatesInfoTitle => 'Aggiornamenti pre-release';

  @override
  String get preReleaseUpdatesInfoContent =>
      'Se attivo, il controllo degli aggiornamenti ti avviserà anche delle build alpha e pre-release da GitHub. Possono essere meno stabili ma includono le ultime funzionalità e correzioni.';

  @override
  String get includePreReleases => 'Includi le pre-release';

  @override
  String get includePreReleasesOnSubtitle =>
      'Attivo: controllo delle build alpha e pre-release';

  @override
  String get includePreReleasesOffSubtitle => 'Off: solo versioni stabili';

  @override
  String get setTooltip => 'Imposta';

  @override
  String get saveAbsorbBackup => 'Salva il backup di Absorb';

  @override
  String get checkForUpdate => 'Cerca aggiornamenti';

  @override
  String get onLatestVersion => 'Hai l\'ultima versione';

  @override
  String get updateAvailable => 'Aggiornamento disponibile';

  @override
  String get preReleaseAvailable => 'Pre-release disponibile';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'È disponibile una nuova $kind di Absorb: $latest\n\nStai usando $current.';
  }

  @override
  String get updateKindPreRelease => 'pre-release';

  @override
  String get updateKindVersion => 'versione';

  @override
  String get downloadButton => 'Scarica';

  @override
  String get updateDownloading => 'Download dell\'aggiornamento...';

  @override
  String get updateInstallPermissionDenied =>
      'Autorizzazione all\'installazione negata. Attiva \"Installa app sconosciute\" per Absorb nelle impostazioni di sistema.';

  @override
  String get updateOpeningInBrowser =>
      'Aggiornamento nell\'app non riuscito, apertura del browser';

  @override
  String get sendToEreader => 'Invia all\'e-reader';

  @override
  String sendingToEreader(String device) {
    return 'Invio a $device...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return 'Inviato a $device';
  }

  @override
  String get sendToEreaderFailed => 'Impossibile inviare l\'ebook';

  @override
  String get pickEreaderDevice => 'Scegli un dispositivo';

  @override
  String get adminEmail => 'Email';

  @override
  String get adminEmailSubtitle => 'SMTP e dispositivi e-reader';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => 'Guida alla configurazione';

  @override
  String get smtpHost => 'Host';

  @override
  String get smtpPort => 'Porta';

  @override
  String get smtpSecure => 'Sicuro';

  @override
  String get smtpRejectUnauthorized => 'Rifiuta TLS non autorizzato';

  @override
  String get smtpUser => 'Nome utente';

  @override
  String get smtpPass => 'Password';

  @override
  String get smtpFromAddress => 'Indirizzo mittente';

  @override
  String get smtpTestAddress => 'Indirizzo di prova';

  @override
  String get smtpSendTest => 'Invia prova';

  @override
  String get smtpSaveSettings => 'Salva';

  @override
  String get smtpSaved => 'Impostazioni email salvate';

  @override
  String get smtpSaveFailed => 'Impossibile salvare le impostazioni email';

  @override
  String get smtpTestSent => 'Email di prova inviata';

  @override
  String get smtpTestFailed => 'Invio dell\'email di prova non riuscito';

  @override
  String get ereaderDevicesTitle => 'Dispositivi e-reader';

  @override
  String get ereaderDevicesEmpty =>
      'Ancora nessun dispositivo. Aggiungine uno qui sotto.';

  @override
  String get addEreaderDevice => 'Aggiungi dispositivo';

  @override
  String get editEreaderDevice => 'Modifica dispositivo';

  @override
  String get deleteEreaderDevice => 'Elimina';

  @override
  String get ereaderDeviceName => 'Nome';

  @override
  String get ereaderDeviceEmail => 'Email';

  @override
  String get ereaderAvailability => 'Chi può usare questo dispositivo';

  @override
  String get ereaderAvailAdminOrUp => 'Solo amministratori';

  @override
  String get ereaderAvailUserOrUp => 'Tutti gli utenti';

  @override
  String get ereaderAvailGuestOrUp => 'Tutti';

  @override
  String get ereaderAvailSpecificUsers => 'Utenti specifici';

  @override
  String ereaderSpecificUsersN(int count) {
    return 'Utenti specifici ($count)';
  }

  @override
  String get ereaderDevicesSaved => 'Dispositivi salvati';

  @override
  String get ereaderDevicesSaveFailed => 'Impossibile salvare i dispositivi';

  @override
  String libraryCountOne(int count) {
    return '$count libreria';
  }

  @override
  String libraryCountOther(int count) {
    return '$count librerie';
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
    return '$day/$month/$year';
  }

  @override
  String get backupDetailsSeparator => ' · ';

  @override
  String get bookmarksSortedByPositionReversed =>
      'Ordinati per posizione (invertito)';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '\"$title\" a $position';
  }

  @override
  String get deleteBookmarkQuestion => 'Eliminare il segnalibro?';

  @override
  String get cardIconsOnlyChip => 'Solo icone';

  @override
  String get cardMoreInGridChip => '\"Altro\" nella griglia';

  @override
  String get cardLayoutHidden => 'Nascosto';

  @override
  String get speed => 'Velocità';

  @override
  String get details => 'Dettagli';

  @override
  String get episodeDetailsLabel => 'Dettagli episodio';

  @override
  String get bookDetailsLabel => 'Dettagli libro';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => 'Equalizzatore';

  @override
  String get cast => 'Trasmetti';

  @override
  String castingToDevice(String device) {
    return 'Trasmissione su $device';
  }

  @override
  String castToDeviceNamed(String device) {
    return 'Trasmetti su $device';
  }

  @override
  String get historyShort => 'Cronologia';

  @override
  String atPosition(String position) {
    return 'a $position';
  }

  @override
  String chaptersChip(int count) {
    return '$count capitoli';
  }

  @override
  String chapterNumber(int number) {
    return 'Capitolo $number';
  }

  @override
  String kbpsValue(int value) {
    return '$value kbps';
  }

  @override
  String get fileInfoTitle => 'Info sui file';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => 'Questo libro non ha dettagli sui file.';

  @override
  String get fileInfoAudio => 'Audio';

  @override
  String get fileInfoEbook => 'Ebook';

  @override
  String get fileInfoOther => 'Altri file';

  @override
  String get fileInfoBookOrbitNote => 'BookOrbit non indica codec o bitrate.';

  @override
  String fileInfoChannels(int count) {
    return '$count canali';
  }

  @override
  String get fileInfoCover => 'Copertina';

  @override
  String get fileInfoMetadata => 'Metadati';

  @override
  String get fileInfoSupplement => 'Extra';

  @override
  String get fileInfoPathCopied => 'Percorso copiato';

  @override
  String get resetMayNotHaveSynced =>
      'Il ripristino potrebbe non essersi sincronizzato - controlla il server';

  @override
  String failedToDownloadEbook(int code) {
    return 'Download dell\'ebook non riuscito ($code)';
  }

  @override
  String get serverReturnedErrorPage =>
      'Il server ha restituito una pagina di errore invece del file ebook';

  @override
  String ebookSaved(String filename) {
    return 'Salvato: $filename';
  }

  @override
  String errorSavingEbook(String error) {
    return 'Errore nel salvataggio dell\'ebook: $error';
  }

  @override
  String failedToSaveError(String error) {
    return 'Salvataggio non riuscito: $error';
  }

  @override
  String get adminBackupsLabel => 'Backup';

  @override
  String get adminListeningNow => 'In ascolto ora';

  @override
  String get adminLibraries => 'Librerie';

  @override
  String get adminLibraryShows => 'programmi';

  @override
  String get adminLibraryBooks => 'libri';

  @override
  String get adminLibraryFolders => 'cartelle';

  @override
  String get adminLibrarySize => 'dimensione';

  @override
  String get adminLibraryDuration => 'durata';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi mancanti o non validi',
      one: '1 elemento mancante o non valido',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => 'Verifica';

  @override
  String get adminMissingTitle => 'Elementi mancanti';

  @override
  String adminMissingSubtitle(String library) {
    return 'Voci in $library i cui file sono mancanti o illeggibili';
  }

  @override
  String get adminMissingNone => 'Nessun elemento mancante o non valido';

  @override
  String get adminMissingBadge => 'Mancante';

  @override
  String get adminInvalidBadge => 'Non valido';

  @override
  String get adminMissingDeleteTitle => 'Rimuovi voce';

  @override
  String adminMissingDeleteOneContent(String title) {
    return 'Rimuovere \"$title\" da Audiobookshelf?';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return 'Rimuovere $count voci da Audiobookshelf?';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return 'Elimina $count';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return '$title rimosso';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count voci rimosse',
      one: '1 voce rimossa',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => 'Eliminazione della voce non riuscita';

  @override
  String get adminMatchAction => 'Abbina';

  @override
  String adminMatchingStarted(String name) {
    return 'Abbinamento avviato per $name';
  }

  @override
  String get adminMatchFailed => 'Non riuscito';

  @override
  String adminScanFailed(String name) {
    return 'Scansione di $name non riuscita';
  }

  @override
  String get adminPurgeCacheFailed => 'Non riuscito';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => 'admin';

  @override
  String get adminUsersDisabledBadge => 'disattivato';

  @override
  String get adminUsersEditUserTooltip => 'Modifica utente';

  @override
  String get adminUsersOnlineNow => 'Online ora';

  @override
  String adminUsersLastSeen(String time) {
    return 'Ultimo accesso $time';
  }

  @override
  String get adminUsersNever => 'Mai';

  @override
  String get adminUsersTotal => 'Totale';

  @override
  String get adminUsersNoReadingActivity => 'Nessuna attività di lettura';

  @override
  String get adminUsersLoadingDots => 'Caricamento...';

  @override
  String get adminUsersLoadMoreSessions => 'Carica altre sessioni';

  @override
  String get adminUsersNoRecentSessions => 'Nessuna sessione recente';

  @override
  String get adminUsersLibraryProgress => 'Progressi della libreria';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return 'Carica altro ($count rimanenti)';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return '$count mesi fa';
  }

  @override
  String get adminUsersNewUser => 'Nuovo utente';

  @override
  String get adminUsersEditUser => 'Modifica utente';

  @override
  String get adminUsersUsername => 'Nome utente';

  @override
  String get adminUsersEnterUsername => 'Inserisci il nome utente';

  @override
  String get adminUsersPassword => 'Password';

  @override
  String get adminUsersNewPassword => 'Nuova password';

  @override
  String get adminUsersEnterPassword => 'Inserisci la password';

  @override
  String get adminUsersLeaveBlankToKeep =>
      'Lascia vuoto per mantenere quella attuale';

  @override
  String get adminUsersAccountType => 'Tipo di account';

  @override
  String get adminUsersTypeGuest => 'Ospite';

  @override
  String get adminUsersTypeUser => 'Utente';

  @override
  String get adminUsersTypeAdmin => 'Admin';

  @override
  String get adminUsersStatus => 'Stato';

  @override
  String get adminUsersAccountActive => 'Account attivo';

  @override
  String get adminUsersAccountActiveSub =>
      'Gli account disattivati non possono accedere';

  @override
  String get adminUsersLocked => 'Bloccato';

  @override
  String get adminUsersLockedSub => 'Impedisce la modifica della password';

  @override
  String get adminUsersPermissions => 'Permessi';

  @override
  String get adminUsersPermDownload => 'Download';

  @override
  String get adminUsersPermUpdate => 'Aggiornamento';

  @override
  String get adminUsersPermUpdateSub =>
      'Modifica metadati ed elementi della libreria';

  @override
  String get adminUsersPermDelete => 'Eliminazione';

  @override
  String get adminUsersPermUpload => 'Caricamento';

  @override
  String get adminUsersPermExplicit => 'Contenuti espliciti';

  @override
  String get adminUsersLibraryAccess => 'Accesso alle librerie';

  @override
  String get adminUsersAccessAllLibraries => 'Accesso a tutte le librerie';

  @override
  String get adminUsersCreateUser => 'Crea utente';

  @override
  String get adminUsersSaveChanges => 'Salva modifiche';

  @override
  String get adminUsersUsernameRequired => 'Il nome utente è obbligatorio';

  @override
  String get adminUsersPasswordRequired => 'La password è obbligatoria';

  @override
  String get adminUsersUserCreated => 'Utente creato';

  @override
  String get adminUsersUserUpdated => 'Utente aggiornato';

  @override
  String get adminUsersFailedCreate => 'Creazione dell\'utente non riuscita';

  @override
  String get adminUsersFailedUpdate =>
      'Aggiornamento dell\'utente non riuscito';

  @override
  String get adminUsersThisUser => 'questo utente';

  @override
  String get adminUsersDeleteUserTitle => 'Eliminare l\'utente?';

  @override
  String adminUsersDeleteUserContent(String name) {
    return 'Eliminare definitivamente $name?';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return '$name eliminato';
  }

  @override
  String get adminUsersFailedDelete => 'Eliminazione dell\'utente non riuscita';

  @override
  String get adminUsersUnlinkOpenId => 'Scollega OpenID';

  @override
  String get adminUsersUnlinkOpenIdTitle => 'Scollegare OpenID?';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return 'Rimuovere il collegamento OpenID per $name? Dovrà accedere di nuovo con OpenID per ricollegarlo.';
  }

  @override
  String get adminUsersOpenIdUnlinked => 'OpenID scollegato';

  @override
  String get adminUsersFailedUnlinkOpenId => 'Impossibile scollegare OpenID';

  @override
  String adminUsersByAuthor(String author) {
    return 'di $author';
  }

  @override
  String get adminUsersListened => 'Ascoltato';

  @override
  String get adminUsersStartedAtPosition => 'Iniziato alla posizione';

  @override
  String get adminUsersEndedAtPosition => 'Terminato alla posizione';

  @override
  String get adminUsersTotalDuration => 'Durata totale';

  @override
  String get adminUsersStarted => 'Iniziato';

  @override
  String get adminUsersUpdated => 'Aggiornato';

  @override
  String get adminUsersClient => 'Client';

  @override
  String get adminUsersDevice => 'Dispositivo';

  @override
  String get adminUsersOs => 'SO';

  @override
  String get adminUsersPlayMethod => 'Metodo di riproduzione';

  @override
  String get adminUsersPlayDirect => 'Riproduzione diretta';

  @override
  String get adminUsersPlayDirectStream => 'Streaming diretto';

  @override
  String get adminUsersPlayTranscode => 'Transcodifica';

  @override
  String get adminUsersPlayLocal => 'Locale';

  @override
  String get adminPodcastsCheckNewEpisodesTitle => 'Cerca nuovi episodi';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      'Verranno controllati i feed RSS di tutti i podcast e scaricati i nuovi episodi trovati (se il download automatico è attivo).';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle =>
      'Analizza il feed RSS e scarica i nuovi episodi';

  @override
  String get adminPodcastsCheck => 'Cerca';

  @override
  String get adminPodcastsCheckingForNew => 'Ricerca di nuovi episodi…';

  @override
  String get adminPodcastsCheckingForNewDots => 'Ricerca di nuovi episodi...';

  @override
  String get adminPodcastsFailedCheckEpisodes =>
      'Controllo degli episodi non riuscito';

  @override
  String get adminPodcastsCheckFeedsTooltip => 'Cerca nuovi episodi nei feed';

  @override
  String get adminPodcastsNoPodcastsYet => 'Ancora nessun podcast';

  @override
  String get adminPodcastsTapPlusHint =>
      'Tocca + per cercare e aggiungere programmi';

  @override
  String adminPodcastsEpisodesCount(int count) {
    return '$count episodi';
  }

  @override
  String get adminPodcastsAddPodcast => 'Aggiungi podcast';

  @override
  String get adminPodcastsCouldNotFindFeed =>
      'Impossibile trovare il feed del podcast';

  @override
  String get adminPodcastsSearchHint => 'Cerca podcast…';

  @override
  String get adminPodcastsSearchItunesHint => 'Cerca su iTunes...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return 'Cerca \"$query\" su iTunes';
  }

  @override
  String get adminPodcastsNoPodcastsFound => 'Nessun podcast trovato';

  @override
  String get adminPodcastsRelToday => 'Oggi';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return '$count sett. fa';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return '$count mesi fa';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return '$count anni fa';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return 'Aggiornato $when';
  }

  @override
  String get adminPodcastsGenreAll => 'Tutti';

  @override
  String get adminPodcastsGenreArts => 'Arte';

  @override
  String get adminPodcastsGenreComedy => 'Commedia';

  @override
  String get adminPodcastsGenreEducation => 'Istruzione';

  @override
  String get adminPodcastsGenreTvFilm => 'TV e film';

  @override
  String get adminPodcastsGenreMusic => 'Musica';

  @override
  String get adminPodcastsGenreNews => 'Notizie';

  @override
  String get adminPodcastsGenreReligion => 'Religione';

  @override
  String get adminPodcastsGenreScience => 'Scienza';

  @override
  String get adminPodcastsGenreSports => 'Sport';

  @override
  String get adminPodcastsGenreTechnology => 'Tecnologia';

  @override
  String get adminPodcastsGenreBusiness => 'Business';

  @override
  String get adminPodcastsGenreFiction => 'Narrativa';

  @override
  String get adminPodcastsGenreSocietyCulture => 'Società e cultura';

  @override
  String get adminPodcastsGenreHealthFitness => 'Salute e fitness';

  @override
  String get adminPodcastsGenreTrueCrime => 'True crime';

  @override
  String get adminPodcastsGenreHistory => 'Storia';

  @override
  String get adminPodcastsGenreKidsFamily => 'Bambini e famiglia';

  @override
  String get adminPodcastsPodcastFallback => 'Podcast';

  @override
  String get adminPodcastsEpisodeFallback => 'Episodio';

  @override
  String get adminPodcastsNoFeedFound => 'Nessun URL del feed trovato';

  @override
  String get adminPodcastsNoFeedAvailable => 'Nessun URL del feed disponibile';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return '$title aggiunto alla libreria';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return 'Impossibile aggiungere $title';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    return '$count episodi nel feed';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    return '+ altri $count episodi';
  }

  @override
  String get adminPodcastsAdding => 'Aggiunta…';

  @override
  String get adminPodcastsAddToLibrary => 'Aggiungi alla libreria';

  @override
  String get adminPodcastsRemoveShowTitle => 'Rimuovere il programma?';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return 'Rimuovere \"$title\" e tutti i suoi episodi dal server? L\'operazione non può essere annullata.';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return '\"$title\" rimosso';
  }

  @override
  String get adminPodcastsFailedRemoveShow =>
      'Rimozione del programma non riuscita';

  @override
  String get adminPodcastsRemoveShowTooltip => 'Rimuovi programma';

  @override
  String get adminPodcastsSelectMultipleTooltip => 'Seleziona più elementi';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return '$count scaricati';
  }

  @override
  String get adminPodcastsTabDownloaded => 'Scaricati';

  @override
  String get adminPodcastsTabFeed => 'Feed';

  @override
  String get adminPodcastsTabSettings => 'Impostazioni';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return 'Download di \"$title\"';
  }

  @override
  String get adminPodcastsFailedDownload => 'Download non riuscito';

  @override
  String get adminPodcastsDeleteEpisodeTitle => 'Eliminare l\'episodio?';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return 'Eliminare \"$title\"?';
  }

  @override
  String get adminPodcastsDeleted => 'Eliminato';

  @override
  String get adminPodcastsFailed => 'Non riuscito';

  @override
  String get adminPodcastsDeleteEpisodesTitle => 'Eliminare gli episodi?';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return 'Eliminare $count episodi dal server?';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return '$count episodi eliminati';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload =>
      'Sfoglia il feed per scaricare';

  @override
  String get adminPodcastsDownloadingDots => 'Download in corso...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return 'Elimina $count episodi';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return 'Download di $count episodi';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return 'Scarica $count episodi';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter => 'Cerca episodi dopo il';

  @override
  String get adminPodcastsSelectDate => 'Seleziona la data';

  @override
  String get adminPodcastsMaxEpisodes =>
      'Numero massimo di episodi da scaricare';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return 'Nessun nuovo episodio trovato dopo il $date';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return 'Trovati $count nuovi episodi - download in corso';
  }

  @override
  String get adminPodcastsFailedToCheckNew =>
      'Ricerca di nuovi episodi non riuscita';

  @override
  String get adminPodcastsCheckAndDownload => 'Cerca e scarica';

  @override
  String get adminPodcastsMatchPodcast => 'Abbina podcast';

  @override
  String get adminPodcastsMatchPodcastSubtitle =>
      'Cerca su iTunes per aggiornare copertina e metadati';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes =>
      'Download automatico dei nuovi episodi';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle =>
      'Il server scarica automaticamente i nuovi episodi';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle =>
      'I nuovi episodi non vengono scaricati automaticamente';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate =>
      'Aggiornamento dell\'impostazione di download automatico non riuscito';

  @override
  String get adminPodcastsMaxEpisodesToKeep =>
      'Numero massimo di episodi da conservare';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      '0 conserva tutti gli episodi. Dopo il download automatico di un nuovo episodio, Audiobookshelf rimuove l\'episodio più vecchio se il programma supera questo limite.';

  @override
  String get adminPodcastsNoEpisodeLimit => 'Nessun limite';

  @override
  String get adminPodcastsEpisodeLimitInvalid =>
      'Inserisci 0 o un numero intero';

  @override
  String get adminPodcastsCheckSchedule => 'Pianificazione dei controlli';

  @override
  String get adminPodcastsFrequency => 'Frequenza';

  @override
  String get adminPodcastsFreqHourly => 'Ogni ora';

  @override
  String get adminPodcastsFreqDaily => 'Ogni giorno';

  @override
  String get adminPodcastsFreqWeekly => 'Ogni settimana';

  @override
  String get adminPodcastsDay => 'Giorno';

  @override
  String get adminPodcastsTime => 'Ora';

  @override
  String get adminPodcastsDaySun => 'Dom';

  @override
  String get adminPodcastsDayMon => 'Lun';

  @override
  String get adminPodcastsDayTue => 'Mar';

  @override
  String get adminPodcastsDayWed => 'Mer';

  @override
  String get adminPodcastsDayThu => 'Gio';

  @override
  String get adminPodcastsDayFri => 'Ven';

  @override
  String get adminPodcastsDaySat => 'Sab';

  @override
  String get adminPodcastsFeedUrl => 'URL del feed';

  @override
  String get adminPodcastsBack => 'Indietro';

  @override
  String get adminPodcastsRootOnly => 'Solo root';

  @override
  String get adminPodcastsDeleting => 'Eliminazione...';

  @override
  String get adminPodcastsDeleteEpisode => 'Elimina episodio';

  @override
  String adminPodcastsSeasonChip(String season) {
    return 'Stagione $season';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return 'Ep. $number';
  }

  @override
  String get adminPodcastsApplyingMatch => 'Applicazione dell\'abbinamento...';

  @override
  String get adminPodcastsNoResults => 'Nessun risultato';

  @override
  String get adminPodcastsPodcastMatched => 'Podcast abbinato e aggiornato';

  @override
  String get adminPodcastsFailedMatch => 'Abbinamento del podcast non riuscito';

  @override
  String get adminPodcastsSelectAll => 'Seleziona tutto';

  @override
  String get adminPodcastsSelectAllNew => 'Solo nuovi';

  @override
  String get adminPodcastsSortNewestFirst => 'Prima i più recenti';

  @override
  String get adminPodcastsSortOldestFirst => 'Prima i più vecchi';

  @override
  String get adminPodcastsEditInfo => 'Modifica info';

  @override
  String get adminPodcastsEditInfoSubtitle =>
      'Cambia titolo, descrizione, copertina e altro';

  @override
  String get adminPodcastsEditTitle => 'Modifica podcast';

  @override
  String get adminPodcastsReleaseDate => 'Data di uscita';

  @override
  String get adminPodcastsExplicit => 'Esplicito';

  @override
  String get adminPodcastsExplicitSubtitle =>
      'Contrassegna questo podcast come esplicito';

  @override
  String get episodeListEpisodeFallback => 'Episodio';

  @override
  String get episodeListUnknownPodcast => 'Podcast sconosciuto';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodi contrassegnati come completati',
      one: '1 episodio contrassegnato come completato',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodi contrassegnati come non completati',
      one: '1 episodio contrassegnato come non completato',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes =>
      'Annulla l\'iscrizione ai nuovi episodi';

  @override
  String get episodeListSubscribeToNewEpisodes => 'Iscriviti ai nuovi episodi';

  @override
  String get episodeListSubscribeTitle => 'Iscriversi a questo podcast?';

  @override
  String get episodeListSubscribeContent =>
      'I nuovi episodi verranno scaricati automaticamente e aggiunti alla tua coda di Absorbing quando compaiono sul server.';

  @override
  String get episodeListSubscribe => 'Iscriviti';

  @override
  String get episodeListShowFinishedEpisodes => 'Mostra episodi completati';

  @override
  String get episodeListHideFinishedEpisodes => 'Nascondi episodi completati';

  @override
  String get episodeListShowSettings => 'Impostazioni del programma';

  @override
  String get episodeListPlaysNewerToOlder =>
      'Riproduce dagli episodi più recenti ai più vecchi';

  @override
  String get episodeListPlaysOlderToNewer =>
      'Riproduce dagli episodi più vecchi ai più recenti';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodi',
      one: '1 episodio',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count non completati',
      one: '1 non completato',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => 'Download automatico';

  @override
  String get episodeListSubscribedChip => 'Iscritto';

  @override
  String get episodeListExplicitChip => 'Esplicito';

  @override
  String get episodeListSortNewest => 'Più recenti';

  @override
  String get episodeListSortOldest => 'Più vecchi';

  @override
  String get episodeListSortBy => 'Ordina episodi';

  @override
  String get episodeListSortPubDate => 'Data di pubblicazione';

  @override
  String get episodeListSortTitle => 'Titolo';

  @override
  String get episodeListSortSeason => 'Stagione';

  @override
  String get episodeListSortEpisode => 'Numero episodio';

  @override
  String get episodeListSortFileName => 'Nome file';

  @override
  String get episodeListSortReverseHint =>
      'Tocca di nuovo per invertire l\'ordine';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return '\"$title\" aggiunto ad Absorbing';
  }

  @override
  String get episodeDetailEpisodeFallback => 'Episodio';

  @override
  String get episodeDetailMarkedNotFinished =>
      'Contrassegnato come non completato';

  @override
  String get episodeDetailMarkedFinishedNice =>
      'Contrassegnato come completato - bene!';

  @override
  String get episodeDetailMarkAbsorbedContent =>
      'Imposterà i tuoi progressi al 100% per questo episodio.';

  @override
  String get episodeDetailResetProgressContent =>
      'Cancellerà tutti i progressi di questo episodio e lo riporterà all\'inizio. L\'operazione non può essere annullata.';

  @override
  String get episodeDetailToday => 'Oggi';

  @override
  String get episodeDetailYesterday => 'Ieri';

  @override
  String episodeDetailDaysAgo(int count) {
    return '$count g fa';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return '$count sett. fa';
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
  String get episodeDetailResume => 'Riprendi';

  @override
  String get episodeDetailPlayEpisode => 'Riproduci episodio';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return 'Episodio $number';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return 'Stagione $number';
  }

  @override
  String get editMetadataUpdatedFromMatch =>
      'Metadati aggiornati dall\'abbinamento';

  @override
  String editMetadataConfirmMatch(String title) {
    return 'Verranno aggiornati i metadati del server per questo libro usando:\n\n\"$title\"\n\nTutti i campi e la copertina saranno sovrascritti sul server.';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return 'Verranno aggiornati i metadati del server per questo libro usando:\n\n\"$title\" di $author\n\nTutti i campi e la copertina saranno sovrascritti sul server.';
  }

  @override
  String get seriesBooksFindMissingTitle => 'Trova libri mancanti';

  @override
  String get seriesBooksFindMissingContent =>
      'Cerca su Audible i libri di questa serie che potrebbero mancare nella tua libreria.\n\nI libri vengono abbinati prima per ASIN (se il tuo server ha gli ASIN dei libri), poi per titolo. I risultati potrebbero non essere perfettamente accurati.';

  @override
  String get seriesBooksCouldNotFindOnAudible =>
      'Impossibile trovare questa serie su Audible';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Verrà rimosso lo stato di completato per tutti i $count libri di questa serie.',
      one:
          'Verrà rimosso lo stato di completato per l\'unico libro di questa serie.',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tutti i $count libri di questa serie verranno contrassegnati come completati.',
      one:
          'L\'unico libro di questa serie verrà contrassegnato come completato.',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => 'Deseleziona tutto';

  @override
  String get seriesBooksShowAllBooks => 'Mostra tutti i libri';

  @override
  String get seriesBooksGroupBySubSeries => 'Raggruppa per sottoserie';

  @override
  String get seriesBooksLoadingSubSeries => 'Caricamento delle sottoserie...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => 'Fatto';

  @override
  String get seriesBooksExplicitBadge => 'E';

  @override
  String get expandedCardStreaming => 'Streaming';

  @override
  String get expandedCardDeviceFallback => 'Dispositivo';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$position in $bookTitle';
  }

  @override
  String get bookmarksScreenClose => 'Chiudi';

  @override
  String get bookmarksScreenSortNewest => 'Più recenti';

  @override
  String get bookmarksScreenSortPosition => 'Posizione';

  @override
  String statsScreenStreakDays(int count) {
    return '$count g';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count sessione';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count sessioni';
  }

  @override
  String get statsScreenDayMon => 'Lun';

  @override
  String get statsScreenDayTue => 'Mar';

  @override
  String get statsScreenDayWed => 'Mer';

  @override
  String get statsScreenDayThu => 'Gio';

  @override
  String get statsScreenDayFri => 'Ven';

  @override
  String get statsScreenDaySat => 'Sab';

  @override
  String get statsScreenDaySun => 'Dom';

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
  String get statsScreenCouldNotLoadItem => 'Impossibile caricare l\'elemento';

  @override
  String get statsScreenCouldNotFindEpisode =>
      'Impossibile trovare l\'episodio';

  @override
  String statsScreenByAuthor(String author) {
    return 'di $author';
  }

  @override
  String get statsScreenListened => 'Ascoltato';

  @override
  String get sessionEditTitle => 'Modifica sessione';

  @override
  String get sessionDayLabel => 'Giorno';

  @override
  String get sessionEndPosition => 'Posizione finale';

  @override
  String get sessionEndPositionHint =>
      'La modifica potrebbe aggiornare anche i tuoi progressi attuali.';

  @override
  String get statsViewSessions => 'Visualizza sessioni';

  @override
  String statsSessionsForDate(String date) {
    return 'Sessioni del $date';
  }

  @override
  String get statsNoSessionsForDate =>
      'Nessuna sessione di ascolto trovata per questo giorno';

  @override
  String get statsSearchSessions => 'Cerca sessioni';

  @override
  String get statsNoSessionSearchResults =>
      'Nessuna sessione corrisponde alla ricerca';

  @override
  String get statsSessionsLoadFailed =>
      'Impossibile caricare le sessioni di questo giorno';

  @override
  String get sessionDeleteConfirmTitle => 'Eliminare la sessione?';

  @override
  String get sessionDeleteConfirmBody =>
      'Rimuove la sessione e riduce i totali di ascolto del suo tempo. L\'operazione non può essere annullata.';

  @override
  String get sessionSaved => 'Sessione aggiornata';

  @override
  String get sessionDeleted => 'Sessione eliminata';

  @override
  String get sessionSaveFailed => 'Impossibile salvare le modifiche';

  @override
  String get sessionDeleteFailed => 'Impossibile eliminare questa sessione';

  @override
  String get statsScreenStartedAtPosition => 'Iniziato alla posizione';

  @override
  String get statsScreenEndedAtPosition => 'Terminato alla posizione';

  @override
  String get statsScreenTotalDuration => 'Durata totale';

  @override
  String get statsScreenStarted => 'Iniziato';

  @override
  String get statsScreenUpdated => 'Aggiornato';

  @override
  String get statsScreenClient => 'Client';

  @override
  String get statsScreenDevice => 'Dispositivo';

  @override
  String get statsScreenOs => 'SO';

  @override
  String get statsScreenPlayMethod => 'Metodo di riproduzione';

  @override
  String get statsScreenLoading => 'Caricamento...';

  @override
  String get statsScreenJumpToStart => 'Vai all\'inizio';

  @override
  String get statsScreenJumpToEnd => 'Vai alla fine';

  @override
  String get statsScreenPlayMethodDirect => 'Riproduzione diretta';

  @override
  String get statsScreenPlayMethodDirectStream => 'Streaming diretto';

  @override
  String get statsScreenPlayMethodTranscode => 'Transcodifica';

  @override
  String get statsScreenPlayMethodLocal => 'Locale';

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
    return '$day $month $year alle $hour:$minute $ampm';
  }

  @override
  String get statsScreenMonthJan => 'gen';

  @override
  String get statsScreenMonthFeb => 'feb';

  @override
  String get statsScreenMonthMar => 'mar';

  @override
  String get statsScreenMonthApr => 'apr';

  @override
  String get statsScreenMonthMay => 'mag';

  @override
  String get statsScreenMonthJun => 'giu';

  @override
  String get statsScreenMonthJul => 'lug';

  @override
  String get statsScreenMonthAug => 'ago';

  @override
  String get statsScreenMonthSep => 'set';

  @override
  String get statsScreenMonthOct => 'ott';

  @override
  String get statsScreenMonthNov => 'nov';

  @override
  String get statsScreenMonthDec => 'dic';

  @override
  String get upcomingReleasesTitle => 'Prossime uscite';

  @override
  String get upcomingReleasesRescanTitle => 'Eseguire una nuova scansione?';

  @override
  String upcomingReleasesRescanContent(int days) {
    return 'Questi risultati risalgono a $days giorni fa. Le date di uscita potrebbero essere cambiate - vuoi eseguire una nuova scansione?';
  }

  @override
  String get upcomingReleasesNotNow => 'Non ora';

  @override
  String get upcomingReleasesRescan => 'Scansiona di nuovo';

  @override
  String get upcomingReleasesRescanReleaseDate => 'Riscansiona data di uscita';

  @override
  String get upcomingReleasesRescanning => 'Nuova scansione...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return 'Aggiornato - $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound =>
      'Nessuna data di uscita trovata';

  @override
  String get upcomingReleasesRescanFailed => 'Nuova scansione non riuscita';

  @override
  String get upcomingReleasesRemoveFromList => 'Rimuovi dall\'elenco';

  @override
  String get upcomingReleasesRemovedFromList => 'Rimosso dall\'elenco';

  @override
  String get upcomingReleasesDateChip => 'Data';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return 'Controllo di $name... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => 'Caricamento delle serie...';

  @override
  String get upcomingReleasesScannedToday => '(scansionata oggi)';

  @override
  String get upcomingReleasesScannedYesterday => '(scansionata ieri)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '(scansionata $days giorni fa)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return '$count in arrivo';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return '$count recenti';
  }

  @override
  String get upcomingReleasesNoneFound =>
      'Nessuna uscita imminente o recente trovata';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$summary in $count serie';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return 'Controllate $count serie su Audible';
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
  String get upcomingReleasesBadgeUpcoming => 'IN ARRIVO';

  @override
  String get upcomingReleasesBadgeAdded => 'AGGIUNTO';

  @override
  String get upcomingReleasesBadgeMissing => 'MANCANTE';

  @override
  String get upcomingReleasesScanSettingsTitle => 'Impostazioni di scansione';

  @override
  String get upcomingReleasesFinishedAfterTitle =>
      'Considera completata una serie dopo';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      'Le serie il cui ultimo libro è più vecchio di questo valore vengono saltate nelle scansioni e ricontrollate solo ogni uno o due mesi.';

  @override
  String upcomingReleasesFinishedAfterYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anni',
      one: '1 anno',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesFinishedAfterNever => 'Mai';

  @override
  String get upcomingReleasesSkippedTitle => 'Serie saltate';

  @override
  String get upcomingReleasesSkippedNone => 'Ancora nessuna serie saltata';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saltate',
      one: '1 saltata',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ultimo libro $count anni fa',
      one: 'Ultimo libro 1 anno fa',
      zero: 'Ultimo libro meno di un anno fa',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched =>
      'Impossibile abbinare questa serie su Audible';

  @override
  String get upcomingReleasesSkippedScanNow => 'Scansiona ora';

  @override
  String get upcomingReleasesSkippedAlwaysScan => 'Scansiona sempre';

  @override
  String get upcomingReleasesSkippedNeverScan => 'Non scansionare mai';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return 'Trovate nuove uscite in $name';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return 'Nessuna novità in $name';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary =>
      'Questo elenco proviene da un\'altra libreria. Esegui una nuova scansione per aggiornarlo.';

  @override
  String get upcomingReleasesChipUpcoming => 'In arrivo';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mancanti',
      one: '1 mancante',
      zero: 'Mancanti',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => 'Nessun libro mancante trovato';

  @override
  String get upcomingReleasesScanSeries => 'Scansiona serie';

  @override
  String get upcomingReleasesScanUpcomingOption => 'Prossime uscite';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc =>
      'Scansione rapida di libri nuovi e in arrivo';

  @override
  String get upcomingReleasesScanDeepOption => 'Scansione approfondita';

  @override
  String get upcomingReleasesScanDeepOptionDesc =>
      'Trova anche i libri mancanti in ogni serie - richiede più tempo';

  @override
  String get upcomingReleasesFirstScanNote =>
      'La prima scansione controlla ogni serie su Audible e può richiedere alcuni minuti. Le scansioni successive sono molto più rapide una volta che le serie sono state ordinate.';

  @override
  String get upcomingReleasesLastScanReport =>
      'Rapporto dell\'ultima scansione';

  @override
  String upcomingReleasesReportChecked(int count) {
    return 'Controllate su Audible: $count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return 'Saltate: $count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return 'Non abbinate su Audible: $count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return 'Controllo non riuscito: $count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return 'Trovate $upcoming in arrivo, $recent recenti';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return 'Trovate $upcoming in arrivo, $recent recenti, $missing mancanti';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return '+$count altre';
  }

  @override
  String get upcomingReleasesBadgeNew => 'NUOVO';

  @override
  String get upcomingReleasesOpenLibrarySeries =>
      'Apri la serie nella libreria';

  @override
  String get upcomingReleasesAsinCopied => 'ASIN della serie copiato';

  @override
  String get upcomingReleasesSetSeriesAsin => 'Imposta ASIN della serie';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      'Trova la serie su audible.com e copia il link della pagina - l\'ASIN è il codice di 10 caratteri che inizia con B0 (come B08S2YN3YS). Va bene anche incollare l\'intero link.';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… o link audible.com';

  @override
  String get upcomingReleasesSetAsinSave => 'Salva';

  @override
  String get upcomingReleasesSetAsinInvalid =>
      'Nessun ASIN trovato in quel testo';

  @override
  String get upcomingReleasesSetAsinSaved =>
      'Serie collegata - scansione in corso';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rimuovi $count libri',
      one: 'Rimuovi libro',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => 'Rimuovi da questa scansione';

  @override
  String get upcomingReleasesRemoveThisScanDesc =>
      'Può ricomparire in una scansione futura';

  @override
  String get upcomingReleasesRemoveForever =>
      'Rimuovi da questa e dalle scansioni future';

  @override
  String get upcomingReleasesRemoveForeverDesc =>
      'Va nell\'elenco dei rimossi, ripristinabile in qualsiasi momento';

  @override
  String get upcomingReleasesRemovedForeverToast =>
      'Rimosso - non comparirà nelle scansioni future';

  @override
  String get upcomingReleasesRemovedBooksTitle => 'Libri rimossi';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => 'Nessun libro rimosso';

  @override
  String get upcomingReleasesRestore => 'Ripristina';

  @override
  String get upcomingReleasesRestoredToast => 'Ripristinato';

  @override
  String get upcomingReleasesRestoredNextScan =>
      'Ripristinato - comparirà dopo la prossima scansione';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selezionati',
      one: '1 selezionato',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => 'Richiedi';

  @override
  String get upcomingReleasesBulkRemove => 'Rimuovi';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rimossi',
      one: '1 rimosso',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count richieste inviate',
      one: '1 richiesta inviata',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return '$count saltati';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count serie scansionate di nuovo',
      one: '1 serie scansionata di nuovo',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return '$count con nuovi libri';
  }

  @override
  String get seriesExcludeFromScan => 'Escludi dalla scansione delle serie';

  @override
  String get seriesIncludeInScan => 'Includi nella scansione delle serie';

  @override
  String get homeScreenEpisodeFallback => 'Episodio';

  @override
  String get libraryScreenUnknownTitle => 'Titolo sconosciuto';

  @override
  String get playlistDetailDefaultName => 'Playlist';

  @override
  String playlistDetailItemCount(int count) {
    return '$count elementi';
  }

  @override
  String get playlistDetailUnfinished => 'Non completati';

  @override
  String get playlistDetailRemoveFromPlaylist => 'Rimuovi dalla playlist';

  @override
  String get playlistDetailDone => 'Fatto';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return '$count elementi contrassegnati come completati';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return '$count elementi contrassegnati come non completati';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return '$count elementi rimossi';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return '\"$title\" aggiunto ad Absorbing';
  }

  @override
  String get collectionDetailDefaultName => 'Raccolta';

  @override
  String smartScopeBookCount(int count) {
    return 'Smart Scope · $count libri';
  }

  @override
  String get smartScopeNew => 'Nuovo Smart Scope';

  @override
  String get smartScopeNewSubtitle =>
      'Salva un insieme di filtri come elenco che si aggiorna da solo';

  @override
  String get smartScopeEditTitle => 'Modifica Smart Scope';

  @override
  String get smartScopeIcon => 'Icona';

  @override
  String get smartScopePublic => 'Visibile a tutti gli utenti';

  @override
  String get smartScopeKobo => 'Sincronizza con Kobo';

  @override
  String get smartScopeRules => 'Regole';

  @override
  String get smartScopeMatchAll => 'Tutte le condizioni';

  @override
  String get smartScopeMatchAny => 'Almeno una condizione';

  @override
  String get smartScopeAddRule => 'Aggiungi regola';

  @override
  String get smartScopeAddGroup => 'Aggiungi gruppo';

  @override
  String get smartScopeGroup => 'Gruppo';

  @override
  String get smartScopeStartFrom => 'Parti da';

  @override
  String get smartScopeFromScratch => 'Crea da zero';

  @override
  String get smartScopeTplHasSeries => 'Fa parte di una serie';

  @override
  String get smartScopeTplRecent => 'Aggiunti di recente';

  @override
  String get smartScopeTplPdf => 'Solo PDF';

  @override
  String get smartScopeTplNoGenres => 'Senza generi';

  @override
  String get smartScopeTplEpub => 'Solo EPUB';

  @override
  String get smartScopeCounting => 'Conteggio...';

  @override
  String get smartScopeSort => 'Ordinamento predefinito';

  @override
  String get smartScopeAddSort => 'Aggiungi livello di ordinamento';

  @override
  String get smartScopeSortNone =>
      'Nessun ordinamento impostato, quindi i libri sono ordinati per titolo.';

  @override
  String get smartScopeAscending => 'Crescente';

  @override
  String get smartScopeDescending => 'Decrescente';

  @override
  String get smartScopeDelete => 'Elimina Smart Scope';

  @override
  String get smartScopeSaveFailed => 'Impossibile salvare lo Smart Scope';

  @override
  String get smartScopeDeleteFailed => 'Impossibile eliminare lo Smart Scope';

  @override
  String get smartScopeLoadFailed => 'Impossibile caricare lo Smart Scope';

  @override
  String get smartScopeUnsupportedRule =>
      'Questa regola può essere modificata solo sul web di BookOrbit. Viene mantenuta così com\'è.';

  @override
  String get smartScopeAnd => 'e';

  @override
  String get smartScopeDays => 'giorni';

  @override
  String get smartScopeWeeks => 'settimane';

  @override
  String get smartScopeMonths => 'mesi';

  @override
  String get smartScopePickDate => 'Scegli una data';

  @override
  String get smartScopeAddValue => 'Aggiungi un valore';

  @override
  String get smartScopeValue => 'Valore';

  @override
  String get smartScopeCustomFields => 'Campi personalizzati';

  @override
  String get smartScopeAnyProvider => 'Qualsiasi provider';

  @override
  String get smartScopeScoreOutstanding => 'Eccellente';

  @override
  String get smartScopeScoreGood => 'Buono';

  @override
  String get smartScopeScoreFair => 'Discreto';

  @override
  String get smartScopeScorePoor => 'Scarso';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => 'Fino a 20 valori';

  @override
  String get scopeFieldTitle => 'Titolo';

  @override
  String get scopeFieldAuthor => 'Autore';

  @override
  String get scopeFieldSeries => 'Serie';

  @override
  String get scopeFieldSeriesIndex => 'Numero nella serie';

  @override
  String get scopeFieldGenre => 'Genere';

  @override
  String get scopeFieldTag => 'Tag';

  @override
  String get scopeFieldReadStatus => 'Stato di lettura';

  @override
  String get scopeFieldReadProgress => 'Progressi di lettura';

  @override
  String get scopeFieldRating => 'La tua valutazione';

  @override
  String get scopeFieldFormat => 'Formato';

  @override
  String get scopeFieldLibrary => 'Libreria';

  @override
  String get scopeFieldCollection => 'Raccolta';

  @override
  String get scopeFieldPublisher => 'Editore';

  @override
  String get scopeFieldLanguage => 'Lingua';

  @override
  String get scopeFieldPublishedDate => 'Data di pubblicazione';

  @override
  String get scopeFieldPublishedYear => 'Anno di pubblicazione';

  @override
  String get scopeFieldAddedAt => 'Data di aggiunta';

  @override
  String get scopeFieldStartedAt => 'Data di inizio';

  @override
  String get scopeFieldFinishedAt => 'Data di completamento';

  @override
  String get scopeFieldPageCount => 'Numero di pagine';

  @override
  String get scopeFieldFileSize => 'Dimensione del file';

  @override
  String get scopeFieldCommunityRating => 'Valutazione della community';

  @override
  String get scopeFieldCommunityRatingCount =>
      'Numero di recensioni della community';

  @override
  String get scopeFieldMetadataScore => 'Punteggio dei metadati';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => 'Descrizione';

  @override
  String get scopeFieldCover => 'Copertina';

  @override
  String get scopeFieldAudioCover => 'Copertina dell\'audiolibro';

  @override
  String get scopeFieldFileAvailability => 'Disponibilità dei file';

  @override
  String get scopeFieldLockStatus => 'Stato di blocco';

  @override
  String get scopeFieldSeriesStatus => 'Stato della serie';

  @override
  String get scopeSortUpdatedAt => 'Data di aggiornamento';

  @override
  String get scopeSortLastReadAt => 'Ultima lettura';

  @override
  String get scopeSortRandom => 'Casuale';

  @override
  String get scopeOpContains => 'contiene';

  @override
  String get scopeOpNotContains => 'non contiene';

  @override
  String get scopeOpStartsWith => 'inizia con';

  @override
  String get scopeOpEndsWith => 'finisce con';

  @override
  String get scopeOpEq => 'è';

  @override
  String get scopeOpNotEq => 'non è';

  @override
  String get scopeOpIsEmpty => 'è vuoto';

  @override
  String get scopeOpIsNotEmpty => 'non è vuoto';

  @override
  String get scopeOpGt => 'maggiore di';

  @override
  String get scopeOpGte => 'almeno';

  @override
  String get scopeOpLt => 'minore di';

  @override
  String get scopeOpLte => 'al massimo';

  @override
  String get scopeOpBetween => 'tra';

  @override
  String get scopeOpIncludesAny => 'include uno qualsiasi di';

  @override
  String get scopeOpIncludesAll => 'include tutti i';

  @override
  String get scopeOpExcludesAll => 'esclude tutti i';

  @override
  String get scopeOpBefore => 'prima del';

  @override
  String get scopeOpAfter => 'dopo il';

  @override
  String get scopeOpWithinLast => 'negli ultimi';

  @override
  String get scopeOpIsMissing => 'manca';

  @override
  String get scopeOpIsPresent => 'è presente';

  @override
  String get scopeOpIsUnread => 'non è letto';

  @override
  String get scopeOpIsInProgress => 'è in corso';

  @override
  String get scopeOpIsFinished => 'è completato';

  @override
  String get scopeOpIsLocked => 'è bloccato';

  @override
  String get scopeOpIsUnlocked => 'è sbloccato';

  @override
  String get scopeOpIsUpNext => 'è il prossimo';

  @override
  String get scopeOpIsTrue => 'è sì';

  @override
  String get scopeOpIsFalse => 'è no';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri corrispondono',
      one: '1 libro corrisponde',
      zero: 'Nessun libro corrisponde',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return 'Eliminare \"$name\"? L\'operazione non può essere annullata.';
  }

  @override
  String collectionDetailBookCount(int count) {
    return '$count libri';
  }

  @override
  String get collectionDetailDone => 'Fatto';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return '\"$title\" aggiunto ad Absorbing';
  }

  @override
  String get audibleSeriesNoBooksFound => 'Nessun libro trovato su Audible';

  @override
  String get audibleSeriesFailedToLoad =>
      'Impossibile caricare la serie da Audible';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return '$total su Audible · $missing mancanti';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return '$total su Audible · $missing mancanti · $upcoming in arrivo';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return 'Mancanti ($count)';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return 'In arrivo ($count)';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return 'Tutti ($count)';
  }

  @override
  String get audibleSeriesSearching => 'Ricerca su Audible...';

  @override
  String get audibleSeriesCompleteSeries => 'Hai la serie completa!';

  @override
  String get audibleSeriesNoUpcoming => 'Nessuna uscita imminente trovata';

  @override
  String get audibleSeriesUpcomingBadge => 'IN ARRIVO';

  @override
  String get audibleSeriesAbridged => 'Abbreviato';

  @override
  String get audibleSeriesRegionTitle => 'Regione di Audible';

  @override
  String get audibleSeriesOpenOnAudible => 'Apri su Audible';

  @override
  String get audibleSeriesAddToCalendar => 'Aggiungi al calendario';

  @override
  String get audibleSeriesAddToUpcoming => 'Aggiungi alle prossime uscite';

  @override
  String get audibleSeriesAddedToUpcoming => 'Aggiunto alle prossime uscite';

  @override
  String get audibleSeriesAlreadyInUpcoming =>
      'Già nella pagina delle prossime uscite';

  @override
  String get audibleSeriesCouldNotOpenAudible => 'Impossibile aprire Audible';

  @override
  String get audibleSeriesCouldNotOpenCalendar =>
      'Impossibile aprire il calendario';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return 'Nuova uscita di audiolibro nella serie $seriesName';
  }

  @override
  String get authorBooksGroupBySeries => 'Raggruppa per serie';

  @override
  String get authorBooksList => 'Elenco';

  @override
  String get authorBooksGrid => 'Griglia';

  @override
  String authorBooksBookCount(int count) {
    return '$count libri';
  }

  @override
  String get metadataLookupCover => 'Copertina';

  @override
  String get metadataLookupChooseFields => 'Scegli i campi da applicare';

  @override
  String metadataLookupApplyFields(int count) {
    return 'Applica $count campi';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return '$count campi salvati in locale';
  }

  @override
  String get metadataLookupOverrideLocalDisplay =>
      'Sostituisci la visualizzazione locale';

  @override
  String get equalizerPresetFlat => 'Piatto';

  @override
  String get equalizerPresetVoiceBoost => 'Voce potenziata';

  @override
  String get equalizerPresetBassBoost => 'Bassi potenziati';

  @override
  String get equalizerPresetTrebleBoost => 'Alti potenziati';

  @override
  String get equalizerPresetPodcast => 'Podcast';

  @override
  String get equalizerPresetAudiobook => 'Audiolibro';

  @override
  String get equalizerPresetReduceNoise => 'Riduzione rumore';

  @override
  String get equalizerPresetLoudness => 'Loudness';

  @override
  String equalizerEditingSavedNamed(String title) {
    return 'Modifica dell\'EQ salvato per \"$title\"';
  }

  @override
  String get equalizerEditingSavedGeneric => 'Modifica dell\'EQ salvato';

  @override
  String get equalizerPerBookEq => 'EQ per libro';

  @override
  String get notesDeleteNoteQuestion => 'Eliminare la nota?';

  @override
  String notesDeleteNoteContent(String title) {
    return 'Eliminare \"$title\"?';
  }

  @override
  String get notesExport => 'Esporta';

  @override
  String get notesNewNote => 'Nuova nota';

  @override
  String get librarySortFilterUpcomingReleases => 'Scansiona serie';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle =>
      'Recupera foto e biografia di ogni autore dal provider di metadati';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle =>
      'Cerca su Audible i libri in arrivo e mancanti nelle tue serie';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capitoli rimasti',
      one: '1 capitolo rimasto',
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
      other: '$count capitoli',
      one: '1 capitolo',
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
      other: 'Spegni dopo $count capitoli',
      one: 'Spegni dopo 1 capitolo',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => 'Riavvolgi allo spegnimento';

  @override
  String get sleepTimerSheetShake => 'Scuoti';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return 'Aggiunge $minutes min';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => 'Aggiunge 1 capitolo';

  @override
  String get sleepTimerSheetResetsToFull => 'Ripristina la durata completa';

  @override
  String get sleepTimerSheetTabSpecificChapter => 'Capitolo';

  @override
  String get sleepTimerSheetSpecificNoChapters => 'Nessun capitolo disponibile';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return 'Capitolo $number';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => 'superato';

  @override
  String get sleepTimerSheetSpecificStart => 'Inizio capitolo';

  @override
  String get sleepTimerSheetSpecificEnd => 'Fine capitolo';

  @override
  String get sleepTimerSheetSpecificEndsAt =>
      'Il timer di spegnimento terminerà a';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return 'tra $countdown';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed =>
      'Questo punto è già stato superato';

  @override
  String get sleepTimerSheetSpecificStartButton => 'Avvia timer';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => 'Già superato';

  @override
  String get timeAm => 'AM';

  @override
  String get timePm => 'PM';

  @override
  String get collectionPickerCollectionFallback => 'Raccolta';

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
  String get cardChaptersPlayFromChapterTitle => 'Riprodurre dal capitolo?';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return 'Iniziare la riproduzione da \"$title\"?';
  }

  @override
  String get cardChaptersPlay => 'Riproduci';

  @override
  String get absorbingSharedToday => 'Oggi';

  @override
  String get absorbingSharedYesterday => 'Ieri';

  @override
  String get absorbingSharedMonday => 'Lunedì';

  @override
  String get absorbingSharedTuesday => 'Martedì';

  @override
  String get absorbingSharedWednesday => 'Mercoledì';

  @override
  String get absorbingSharedThursday => 'Giovedì';

  @override
  String get absorbingSharedFriday => 'Venerdì';

  @override
  String get absorbingSharedSaturday => 'Sabato';

  @override
  String get absorbingSharedSunday => 'Domenica';

  @override
  String get absorbingSharedAm => 'AM';

  @override
  String get absorbingSharedPm => 'PM';

  @override
  String sectionDetailAddedToAbsorbing(String title) {
    return '\"$title\" aggiunto ad Absorbing';
  }

  @override
  String get sectionDetailDoneBadge => 'Fatto';

  @override
  String get homeCustomizeAddGenreTitle => 'Aggiungi sezione per genere';

  @override
  String get homeCustomizeAddGenreSubtitle =>
      'Scegli un genere da mostrare nella schermata Home';

  @override
  String get homeSectionDoneBadge => 'Fatto';

  @override
  String get tipsSheetQuickBookmarksTitle => 'Segnalibri rapidi';

  @override
  String get tipsSheetQuickBookmarksDesc =>
      'Tieni premuto il pulsante del segnalibro su qualsiasi scheda per inserire subito un segnalibro nella posizione corrente, senza aprire il foglio dei segnalibri.';

  @override
  String get tipsSheetCoverPlayPauseTitle => 'Riproduci/Pausa dalla copertina';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      'Tocca la copertina su qualsiasi scheda per avviare o mettere in pausa. Attiva o disattiva l\'opzione in Impostazioni, sotto Schede di Absorbing. Durante la riproduzione compare una tenue icona di pausa, così sai che si può toccare.';

  @override
  String get tipsSheetFullScreenPlayerTitle => 'Player a schermo intero';

  @override
  String get tipsSheetFullScreenPlayerDesc =>
      'Scorri verso l\'alto su qualsiasi scheda di Absorbing per aprire il player a schermo intero. Scorri verso il basso per chiuderlo.';

  @override
  String get tipsSheetQuickAddAbsorbingTitle => 'Aggiunta rapida ad Absorbing';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      'Scorri verso destra su qualsiasi libro in un elenco (serie, autore, risultati di ricerca) per aggiungerlo subito alla coda di Absorbing.';

  @override
  String get tipsSheetShakeExtendSleepTitle => 'Scuoti per prolungare';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      'Se il timer di spegnimento è attivo e scuoti il telefono, aggiunge alcuni minuti. Imposta la durata in Impostazioni, sotto Timer di spegnimento.';

  @override
  String get tipsSheetSeriesNavigationTitle => 'Navigazione tra le serie';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      'Tocca il nome della serie nel popup dei dettagli di un libro per vedere tutti i libri della serie, in ordine di lettura e con il numero d\'ordine su ogni copertina.';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => 'Scorri tra i libri';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      'Scorri a sinistra e a destra nella schermata Absorbing per passare da un libro in corso all\'altro. Con la modalità coda manuale attiva, le schede fungono anche da coda, quindi il successivo parte da solo quando termina quello in corso.';

  @override
  String get tipsSheetTapToSeekTitle => 'Tocca per spostarti';

  @override
  String get tipsSheetTapToSeekDesc =>
      'Tocca un punto qualsiasi della barra di avanzamento del capitolo o del libro per saltare direttamente a quella posizione. Puoi anche trascinare le barre per un controllo più preciso.';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle => 'Tempi adattati alla velocità';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      'Ogni tempo mostrato (posizione, rimanente, capitoli, segnalibri) si adatta alla velocità di riproduzione. Ascolti a 1.5x? I tempi indicati riflettono quanto ti richiederanno davvero.';

  @override
  String get tipsSheetPlaybackHistoryTitle => 'Cronologia di riproduzione';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      'Tocca il pulsante Cronologia su qualsiasi scheda per vedere la sequenza di ogni riproduzione, pausa, spostamento e cambio di velocità. Tocca un evento per tornare a quella posizione.';

  @override
  String get tipsSheetAutoRewindTitle => 'Riavvolgimento automatico';

  @override
  String get tipsSheetAutoRewindDesc =>
      'Quando riprendi dopo una pausa, Absorb riavvolge automaticamente di qualche secondo per non farti perdere il filo. Il riavvolgimento aumenta in base a quanto sei stato lontano. Configuralo in Impostazioni.';

  @override
  String get tipsSheetSeriesQueueModeTitle => 'Modalità coda per serie';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      'Quando finisci un libro che fa parte di una serie, Absorb può riprodurre automaticamente il libro successivo. Imposta la modalità coda su \"Serie\" in Impostazioni.';

  @override
  String get tipsSheetOfflineModeTitle => 'Modalità offline';

  @override
  String get tipsSheetOfflineModeDesc =>
      'Tocca il pulsante con l\'aeroplano nella schermata Absorbing per attivare la modalità offline. Interrompe la sincronizzazione, risparmia dati e mostra solo i libri scaricati. Ideale per i voli o dove il segnale è debole.';

  @override
  String get tipsSheetUpcomingReleasesTitle => 'Prossime uscite';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      'Nella scheda Serie, tocca di nuovo la scheda per aprire il foglio di ordinamento e filtri, poi scegli Prossime uscite per vedere i libri nuovi e in arrivo nelle tue serie, ordinati per data di uscita.';

  @override
  String get tipsSheetPerBookEqTitle => 'Equalizzatore per libro';

  @override
  String get tipsSheetPerBookEqDesc =>
      'Ogni libro ricorda le proprie impostazioni dell\'equalizzatore. Regola l\'EQ una volta per un\'epopea di fantascienza e la prossima volta che la ascolti suonerà allo stesso modo.';

  @override
  String get tipsSheetPerBookSpeedTitle => 'Velocità per libro';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      'La velocità di riproduzione viene salvata per ogni libro. Ascolta la saggistica a 1.5x e la narrativa drammatica a 1.0x senza doverla impostare ogni volta.';

  @override
  String get tipsSheetAutoSleepWindowTitle =>
      'Fascia di spegnimento automatico';

  @override
  String get tipsSheetAutoSleepWindowDesc =>
      'Scegli le ore in cui di solito ti addormenti e il timer di spegnimento partirà da solo quando inizi ad ascoltare in quella fascia.';

  @override
  String get tipsSheetSleepFadeChimeTitle =>
      'Dissolvenza e suono di spegnimento';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      'Quando il timer di spegnimento termina, l\'audio sfuma gradualmente e può suonare un segnale opzionale, così non si interrompe a metà frase.';

  @override
  String get tipsSheetCarModeTitle => 'Modalità auto';

  @override
  String get tipsSheetCarModeDesc =>
      'Tocca l\'icona dell\'auto per passare alla modalità con pulsanti giganti, pensata per un uso più sicuro alla guida.';

  @override
  String get tipsSheetAudibleSeriesTitle => 'Scoperta delle serie Audible';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      'Apri una serie e usa il menu extra (i tre puntini) per ottenere da Audible l\'elenco completo della serie, inclusi i titoli mancanti e i libri che non hai ancora iniziato.';

  @override
  String get tipsSheetTranscribeBookmarkTitle => 'Trascrivi i segnalibri';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      'Trasforma in testo l\'audio di qualsiasi segnalibro, interamente sul tuo dispositivo. Attivalo in Impostazioni, sotto Avanzate > Trascrizione, e scarica un modello; poi tocca Trascrivi su un segnalibro: il testo finisce nella sua nota, pronto da correggere o condividere.';

  @override
  String get tipsSheetFindBetweenFormatsTitle =>
      'Passa dall\'audiolibro all\'ebook';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      'Con la trascrizione attiva e il libro scaricato, metti in pausa e tocca Trova posizione nell\'ebook nel player per aprire l\'ebook al passaggio che hai appena ascoltato. Nel lettore, seleziona del testo e tocca le cuffie per avviare l\'audiolibro proprio da lì.';

  @override
  String get tipsSheetShareQuoteTitle => 'Condividi citazioni';

  @override
  String get tipsSheetShareQuoteDesc =>
      'Condividi un\'evidenziazione di un ebook o la nota di un segnalibro come immagine, con la citazione sopra la copertina del libro. Cerca l\'opzione di condivisione sulle evidenziazioni e nel foglio dei segnalibri.';

  @override
  String get tipsSheetClipExportTitle => 'Esporta clip audio';

  @override
  String get tipsSheetClipExportDesc =>
      'Apri un segnalibro e tocca Esporta clip per ritagliare e salvare un breve frammento audio del libro, copertina inclusa: perfetto per condividere la tua scena preferita.';

  @override
  String get tipsSheetAllHighlightsTitle =>
      'Tutte le evidenziazioni in un posto';

  @override
  String get tipsSheetAllHighlightsDesc =>
      'La pagina Tutti i segnalibri ha una scheda Evidenziazioni che raccoglie ogni evidenziazione di ebook di tutti i libri. Toccane una per condividerla o tornare al libro.';

  @override
  String get tipsSheetVolumeKeyPagesTitle =>
      'Cambio pagina con i tasti del volume';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      'Gira le pagine degli ebook con i tasti del volume. Attivalo nelle impostazioni del lettore: direzione normale o invertita, e può restare attivo anche durante la riproduzione audio.';

  @override
  String get tipsSheetSettingsSyncTitle => 'Sincronizzazione impostazioni';

  @override
  String get tipsSheetSettingsSyncDesc =>
      'Mantieni allineati tra i dispositivi le impostazioni, le velocità per libro e l\'ordine di Absorbing tramite il tuo server WebDAV. Configurala in Impostazioni, sotto Backup e sincronizzazione.';

  @override
  String get tipsSheetNavLongPressTitle =>
      'Pressione prolungata sulle schede in basso';

  @override
  String get tipsSheetNavLongPressDesc =>
      'Tieni premuta la scheda Home per cambiare libreria da qualsiasi pagina. Tieni premuta la scheda Libreria per passare direttamente alla ricerca.';

  @override
  String get bookCardUnknownTitle => 'Titolo sconosciuto';

  @override
  String get bookCardExplicitBadge => 'E';

  @override
  String get bookCardDone => 'Fatto';

  @override
  String get bookCardSaved => 'Salvato';

  @override
  String get episodeRowEpisode => 'Episodio';

  @override
  String get episodeRowToday => 'Oggi';

  @override
  String get episodeRowYesterday => 'Ieri';

  @override
  String episodeRowDaysAgo(int count) {
    return '$count g fa';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return '$count sett. fa';
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
  String get librarySearchResultsDone => 'Fatto';

  @override
  String get librarySearchResultsSaved => 'Salvato';

  @override
  String librarySearchResultsSequence(String number) {
    return '#$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => 'Serie sconosciuta';

  @override
  String get librarySearchResultsUnknownEpisode => 'Episodio sconosciuto';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => 'E';

  @override
  String get libraryGridTilesDone => 'Fatto';

  @override
  String get libraryGridTilesSaved => 'Salvato';

  @override
  String libraryGridTilesSequence(String number) {
    return '#$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => 'Serie sconosciuta';

  @override
  String get seriesCardUnknownSeries => 'Serie sconosciuta';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => 'Scorrimento di precisione';

  @override
  String get cardProgressQuarterSpeed => 'Un quarto di velocità';

  @override
  String get cardProgressHalfSpeed => 'Metà velocità';

  @override
  String cardProgressChapterPrefix(String number) {
    return 'Capitolo $number';
  }

  @override
  String get cardEdgeProgressFineScrubbing => 'Scorrimento di precisione';

  @override
  String get cardEdgeProgressQuarterSpeed => 'Un quarto di velocità';

  @override
  String get cardEdgeProgressHalfSpeed => 'Metà velocità';

  @override
  String get authSessionExpired => 'Sessione scaduta. Accedi di nuovo.';

  @override
  String authCannotReachServer(String url) {
    return 'Impossibile raggiungere il server all\'indirizzo $url';
  }

  @override
  String get authInvalidUsernameOrPassword =>
      'Nome utente o password non validi';

  @override
  String get authInvalidApiKey => 'Chiave API non valida';

  @override
  String get authLoginFailedDetail =>
      'Accesso non riuscito: controlla l\'indirizzo del server e le credenziali';

  @override
  String get authUnexpectedServerResponse => 'Risposta del server imprevista';

  @override
  String get authSsoUnexpectedResponse =>
      'L\'SSO ha restituito una risposta imprevista';

  @override
  String get authSwitchedToLocalServer => 'Passato al server locale';

  @override
  String get authSwitchedToRemoteServer => 'Passato al server remoto';

  @override
  String get lpDeletedFinishedDownload => 'Download completato eliminato';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'download di $count nuovi episodi in corso',
      one: 'download di 1 nuovo episodio in corso',
    );
    return '$showTitle: $_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return '$showTitle aggiunto in cima alla coda';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return '$showTitle aggiunto al 2º posto della coda';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return '$showTitle aggiunto in fondo alla coda';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return 'Scaricato un nuovo episodio di $showTitle';
  }

  @override
  String get statsWeekStartsOn => 'Inizio della settimana';

  @override
  String get episodeListNewEpisodePosition => 'Posizione dei nuovi episodi';

  @override
  String get episodeListPositionTop => 'In cima alla coda';

  @override
  String get episodeListPositionSecond => 'Secondo in coda';

  @override
  String get episodeListPositionEnd => 'In fondo alla coda';

  @override
  String get episodeListPositionNone => 'Non aggiungere alla coda';

  @override
  String get episodeListPositionNoneDesc =>
      'Verrai comunque avvisato e l\'episodio verrà scaricato';

  @override
  String sleepRewindUndoNote(int minutes) {
    return 'Premi play entro $minutes minuti e il riavvolgimento viene annullato';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Coda: download di $count elementi in corso',
      one: 'Coda: download di 1 elemento in corso',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Download di $count libri in corso',
      one: 'Download di 1 libro in corso',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Download di $count episodi in corso',
      one: 'Download di 1 episodio in corso',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName => 'Avanzamento download';

  @override
  String get downloadNotifProgressChannelDesc =>
      'Mostra l\'avanzamento durante il download degli audiolibri';

  @override
  String get downloadNotifAlertChannelName => 'Avvisi download';

  @override
  String get downloadNotifAlertChannelDesc =>
      'Notifiche quando i download terminano o falliscono';

  @override
  String get downloadNotifDownloadingTitle => 'Download in corso…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count download attivi',
      one: '1 download attivo',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return 'Download in corso: $title';
  }

  @override
  String get downloadNotifStartingLabel => 'Avvio in corso…';

  @override
  String get downloadNotifCompleteTitle => 'Download completato';

  @override
  String downloadNotifCompleteBody(String title) {
    return '$title è pronto per l\'ascolto offline';
  }

  @override
  String get downloadNotifFailedTitle => 'Download non riuscito';

  @override
  String get upcomingNotifChannelName => 'Scansione prossime uscite';

  @override
  String get upcomingNotifChannelDesc =>
      'Mostra l\'avanzamento durante la ricerca delle prossime uscite';

  @override
  String get upcomingNotifScanTitle => 'Ricerca delle prossime uscite';

  @override
  String get upcomingNotifStartingScan => 'Avvio della scansione…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return 'Controllo di $seriesName… ($current/$total)';
  }

  @override
  String get upcomingNotifFoundTitle => 'Trovate prossime uscite!';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$series serie',
      one: '1 serie',
    );
    return '$books in arrivo in $_temp0';
  }

  @override
  String get androidAutoTabContinue => 'Continua';

  @override
  String get androidAutoTabLibrary => 'Libreria';

  @override
  String get androidAutoTabDownloads => 'Download';

  @override
  String get settingsSearchHint => 'Cerca nelle impostazioni...';

  @override
  String get settingsSearchNoResults => 'Nessuna impostazione corrispondente';

  @override
  String get carConnectAutoplay =>
      'Avvia la riproduzione quando si connette Android Auto';

  @override
  String get carConnectAutoplayIos =>
      'Avvia la riproduzione quando si connette CarPlay';

  @override
  String get carConnectAutoplayOnSubtitle =>
      'L\'ultimo libro che stavi ascoltando parte da solo quando l\'auto si connette';

  @override
  String get carConnectAutoplayOffSubtitle =>
      'La riproduzione attende che tu prema play';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => 'Usa con Siri';

  @override
  String get siriStatusOn =>
      'Attivo. Siri può trovare e riprodurre i tuoi libri e podcast per nome.';

  @override
  String get siriStatusAsk =>
      'Lascia che Siri trovi e riproduca i tuoi libri e podcast per nome.';

  @override
  String get siriStatusOff =>
      'Siri è disattivato per Absorb. Attivalo nelle Impostazioni di iOS.';

  @override
  String get siriAllow => 'Consenti';

  @override
  String get siriOpenSettings => 'Apri Impostazioni';

  @override
  String get siriThingsToSay => 'Cosa dire';

  @override
  String get siriExamples =>
      '\"Riproduci [titolo del libro] su Absorb\"\n\"Riproduci [nome della serie] su Absorb\"\n\"Riproduci qualcosa di [autore] su Absorb\"\n\"Riproduci l\'ultimo episodio di [podcast] su Absorb\"\n\"Riprendi Absorb\"\n\"Torna indietro in Absorb\"\n\"Capitolo successivo in Absorb\"\n\"Imposta un timer di spegnimento in Absorb\"\n\"Aggiungi un segnalibro in Absorb\"\n\"Cosa sto ascoltando in Absorb\"';

  @override
  String get siriShortcutsNote =>
      'Riprendi, pausa, salti, capitoli, timer di spegnimento, segnalibri e cosa è in riproduzione funzionano anche senza questa autorizzazione. Sono disponibili anche nell\'app Comandi rapidi per le automazioni e per il tasto Azione.';

  @override
  String get carBookOrder => 'Ordine dei libri in auto';

  @override
  String get carBookOrderReverse => 'Ordine dei libri inverso';

  @override
  String get carBookOrderReverseSubtitle =>
      'Da Z ad A, o dal più vecchio aggiunto';

  @override
  String get carPodcastOrder => 'Ordine dei podcast in auto';

  @override
  String get carEpisodesOldestFirst => 'Prima gli episodi più vecchi';

  @override
  String get carEpisodesOldestFirstSubtitle =>
      'Per le serie che ascolti dall\'inizio';

  @override
  String get androidAutoCatBooks => 'Libri';

  @override
  String get androidAutoCatSeries => 'Serie';

  @override
  String get androidAutoCatAuthors => 'Autori';

  @override
  String get androidAutoCatCollections => 'Raccolte';

  @override
  String get androidAutoCatPlaylists => 'Playlist';

  @override
  String get showTipsAgain => 'Mostra di nuovo i suggerimenti';

  @override
  String get showTipsAgainSubtitle =>
      'Ripristina i suggerimenti sulle funzioni che hai chiuso';

  @override
  String get tipsRestored => 'Suggerimenti ripristinati';

  @override
  String get resetSpeedPresets => 'Reimposta le velocità predefinite';

  @override
  String get resetSpeedPresetsSubtitle =>
      'Ripristina i pulsanti di velocità di riproduzione predefiniti';

  @override
  String get speedPresetsReset => 'Velocità predefinite reimpostate';

  @override
  String get editAuthor => 'Modifica autore';

  @override
  String get authorName => 'Nome';

  @override
  String get authorImage => 'Immagine dell\'autore';

  @override
  String get authorRemoveImage => 'Rimuovi immagine';

  @override
  String get authorRemoveImageTitle => 'Rimuovere l\'immagine dell\'autore?';

  @override
  String get authorRemoveImageConfirm =>
      'L\'immagine verrà eliminata sul server.';

  @override
  String get authorImageRemoved => 'Immagine rimossa';

  @override
  String get authorImageFailed =>
      'Impossibile aggiornare l\'immagine dell\'autore';

  @override
  String get authorUpdated => 'Autore aggiornato';

  @override
  String get authorUpdateFailed => 'Impossibile aggiornare l\'autore';

  @override
  String get authorMatched => 'Autore aggiornato dalla corrispondenza';

  @override
  String get authorNoMatchFound => 'Nessuna corrispondenza trovata';

  @override
  String authorMergedInto(String name) {
    return 'Unito a $name';
  }

  @override
  String get authorQuickMatchHint =>
      'Recupera nome, ASIN, descrizione e immagine da Audible per la regione scelta.';

  @override
  String get region => 'Regione';

  @override
  String get editTabDetails => 'Dettagli';

  @override
  String get editTabCover => 'Copertina';

  @override
  String get editTabMatch => 'Corrispondenza';

  @override
  String get editTabEmbed => 'Incorpora';

  @override
  String get chapterEditorTitle => 'Modifica capitoli';

  @override
  String get chapterNotConnected => 'Non connesso a un server';

  @override
  String get chapterErrorFirstNotZero =>
      'Il primo capitolo deve iniziare a 0:00';

  @override
  String get chapterErrorStartAfterPrevious =>
      'L\'inizio deve venire dopo il capitolo precedente';

  @override
  String get chapterErrorStartBeforeEnd =>
      'L\'inizio deve precedere la fine del libro';

  @override
  String get chapterErrorTitleRequired => 'Titolo obbligatorio';

  @override
  String get chapterEditStartTitle => 'Modifica ora di inizio';

  @override
  String get chapterTimeHintSeconds => 'Secondi';

  @override
  String get chapterTimeHintFull => 'HH:MM:SS o secondi';

  @override
  String get chapterInvalidTime => 'Ora non valida';

  @override
  String get chapterLocked => 'Il capitolo è bloccato';

  @override
  String get chapterAllLocked => 'Tutti i capitoli sono bloccati';

  @override
  String chapterTrackTitle(int number) {
    return 'Traccia $number';
  }

  @override
  String get chapterNoAudioForPosition => 'Nessun audio per questa posizione';

  @override
  String get chapterCouldNotPlayPreview =>
      'Impossibile riprodurre l\'anteprima';

  @override
  String chapterStartSetTo(String time) {
    return 'Inizio impostato a $time';
  }

  @override
  String get chapterAddNumberedTitle => 'Aggiungi capitoli numerati';

  @override
  String chapterNextPreview(String first, String second) {
    return 'Poi: \"$first\", \"$second\", ...';
  }

  @override
  String get chapterHowMany => 'Quanti capitoli';

  @override
  String get add => 'Aggiungi';

  @override
  String get chapterCountRange => 'Inserisci un numero tra 1 e 150';

  @override
  String get chapterTitlesUpdated => 'Titoli dei capitoli aggiornati';

  @override
  String get chaptersApplied => 'Capitoli applicati';

  @override
  String get chapterDiscardTitle => 'Scartare le modifiche?';

  @override
  String get chapterDiscardMessage => 'Torna ai capitoli salvati.';

  @override
  String get chapterRemoveAllTitle => 'Rimuovere tutti i capitoli?';

  @override
  String get chapterRemoveAllMessage =>
      'Verranno rimossi tutti i capitoli da questo libro.';

  @override
  String get chapterAllRemoved => 'Tutti i capitoli rimossi';

  @override
  String get chapterFixHighlighted => 'Correggi prima i capitoli evidenziati';

  @override
  String get chaptersUpdated => 'Capitoli aggiornati';

  @override
  String get ok => 'OK';

  @override
  String get chapterSaveButton => 'Salva capitoli';

  @override
  String get chapterAddHint => 'Aggiungi capitolo (es. \"Capitolo 01\")';

  @override
  String get chapterAddTooltip => 'Aggiungi capitoli';

  @override
  String get chapterRemoveAll => 'Rimuovi tutti';

  @override
  String get chapterShiftTimes => 'Sposta i tempi';

  @override
  String get chapterFromTracks => 'Dalle tracce';

  @override
  String get chapterLookup => 'Cerca';

  @override
  String get chapterShowSeconds => 'Mostra secondi';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get chapterLoopCut => 'Ripeti il taglio';

  @override
  String get chapterFindStart => 'Trova l\'inizio';

  @override
  String get chapterFindStartListening => 'Ascolto attorno al marcatore';

  @override
  String get chapterFindStartNone =>
      'Niente qui sembra l\'inizio di un capitolo';

  @override
  String get chapterFindStartWider => 'Cerca più ampiamente';

  @override
  String get chapterFindStartCeiling =>
      'Cercato per mezz\'ora attorno al marcatore. L\'inizio è più lontano, oppure non c\'è alcun annuncio del capitolo da ascoltare.';

  @override
  String get chapterFindStartStrong => 'Sembra questo capitolo';

  @override
  String get chapterFindStartMaybe => 'Parole da capitolo';

  @override
  String chapterFindStartGap(String seconds) {
    return 'pausa di $seconds s';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return 'Cercato da $from a $to';
  }

  @override
  String get chapterFindStartNeedsModel =>
      'Attiva prima la trascrizione in Impostazioni e scarica un modello';

  @override
  String get chapterFindStartUseThis => 'Usa questo';

  @override
  String chapterFindStartTitle(String title) {
    return 'Titolo: $title';
  }

  @override
  String get chapterShiftBySeconds => 'Sposta di (secondi)';

  @override
  String get chapterShiftHint =>
      'Sposta tutti i capitoli sbloccati. Usa un valore negativo per anticiparli.';

  @override
  String get chapterTitleHint => 'Titolo del capitolo';

  @override
  String get chapterStopPreview => 'Interrompi anteprima';

  @override
  String get chapterPreviewFromHere => 'Anteprima da qui';

  @override
  String get chapterScrubHint => 'Trascina o regola per spostare l\'inizio';

  @override
  String chapterStartAt(String time) {
    return 'Inizia a $time';
  }

  @override
  String get chapterUnlock => 'Sblocca';

  @override
  String get chapterLock => 'Blocca';

  @override
  String get chapterInsertBelow => 'Inserisci sotto';

  @override
  String get chapterFindTitle => 'Trova capitoli';

  @override
  String get chapterFindSubtitle =>
      'Cerca i capitoli da Audible/Audnexus tramite ASIN.';

  @override
  String get chapterEnterAsin => 'Inserisci un ASIN';

  @override
  String get chapterLookupFailed => 'Ricerca non riuscita: controlla l\'ASIN';

  @override
  String get chapterNoChaptersFound =>
      'Nessun capitolo trovato per quell\'ASIN';

  @override
  String get chapterRemoveBranding =>
      'Rimuovi il marchio Audible (intro/outro)';

  @override
  String chapterFoundCount(int count) {
    return '$count capitoli trovati';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  Libro $book';
  }

  @override
  String get chapterAudibleLonger =>
      'La versione Audible è più lunga del tuo file: i capitoli finali potrebbero non combaciare.';

  @override
  String get chapterAudibleShorter =>
      'La versione Audible è più corta del tuo file: i capitoli potrebbero non combaciare.';

  @override
  String get chapterTitlesOnly => 'Solo titoli';

  @override
  String get chapterApplyChapters => 'Applica capitoli';

  @override
  String get coverSearchTitle => 'Cerca una copertina';

  @override
  String get coverSearchRefineHint =>
      'Affina titolo/autore per ripulire i risultati: il libro non viene modificato.';

  @override
  String get coverNoneFound => 'Nessuna copertina trovata';

  @override
  String get coverEnterTitleFirst => 'Inserisci prima un titolo';

  @override
  String get coverUpdated => 'Copertina aggiornata';

  @override
  String get coverCouldNotUpdate => 'Impossibile aggiornare la copertina';

  @override
  String get coverApply => 'Applica copertina';

  @override
  String get coverUnknownResolution => 'Risoluzione sconosciuta';

  @override
  String get embedIntro =>
      'Incorpora i metadati nei file audio, inclusi copertina e capitoli.';

  @override
  String get embedBackupOption => 'Esegui prima il backup dei file audio';

  @override
  String get embedNoteInFolder =>
      'I metadati verranno incorporati nelle tracce audio all\'interno della cartella dell\'audiolibro.';

  @override
  String get embedNoteMultiTrack =>
      'I capitoli non vengono incorporati negli audiolibri a più tracce.';

  @override
  String get embedNoteNavigateAway =>
      'Una volta avviata l\'operazione puoi uscire da questa pagina.';

  @override
  String get embedStartButton => 'Avvia incorporamento metadati';

  @override
  String embedProgress(String percent) {
    return 'Incorporamento $percent%';
  }

  @override
  String get embedProgressIndeterminate => 'Incorporamento...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent% - continua anche se esci da questa pagina';
  }

  @override
  String get taskStarting => 'Avvio...';

  @override
  String get embedBackupNoteIntro =>
      'Una copia di backup dei file audio originali sarà conservata sul server in ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro =>
      '. Ricorda di svuotare periodicamente la cache degli elementi.';

  @override
  String get embedDialogTitle => 'Incorpora metadati';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# file audio',
      one: '# file audio',
    );
    return 'Incorporare i metadati in $_temp0? I file audio verranno riscritti$backup.';
  }

  @override
  String get embedConfirmBackupClause =>
      ' (prima viene fatto il backup degli originali)';

  @override
  String get embedConfirmAction => 'Incorpora';

  @override
  String get embedCouldNotStart => 'Impossibile avviare l\'incorporamento';

  @override
  String get embedStarted => 'Incorporamento avviato';

  @override
  String get embedComplete => 'Incorporamento completato';

  @override
  String get embedFailed => 'Incorporamento non riuscito';

  @override
  String get encodeComplete => 'Codifica completata';

  @override
  String get encodeFailedTask => 'Codifica non riuscita';

  @override
  String encodeProgress(String percent) {
    return 'Codifica $percent%';
  }

  @override
  String get encodeProgressIndeterminate => 'Codifica...';

  @override
  String get adminApiKeys => 'Chiavi API';

  @override
  String get adminApiKeysSubtitle => 'Token di accesso programmatico';

  @override
  String get adminApiKeysNewTitle => 'Nuova chiave API';

  @override
  String get adminApiKeysName => 'Nome';

  @override
  String get adminApiKeysNameHint => 'es. Home Assistant';

  @override
  String get adminApiKeysOwner => 'Utente';

  @override
  String get adminApiKeysExpiration => 'Scadenza';

  @override
  String get adminApiKeysActive => 'Attiva';

  @override
  String get adminApiKeysActiveSub =>
      'La chiave funziona non appena viene creata';

  @override
  String get adminApiKeysInactive => 'Inattiva';

  @override
  String get adminApiKeysExpired => 'Scaduta';

  @override
  String get adminApiKeysCreate => 'Crea chiave';

  @override
  String get adminApiKeysCreated => 'Chiave API creata';

  @override
  String get adminApiKeysTokenLabel => 'La tua nuova chiave API';

  @override
  String get adminApiKeysCopyWarning =>
      'Copia subito questa chiave. Per sicurezza non verrà più mostrata.';

  @override
  String get adminApiKeysCopy => 'Copia';

  @override
  String get adminApiKeysCopied => 'Copiato negli appunti';

  @override
  String get adminApiKeysDone => 'Fatto';

  @override
  String get adminApiKeysDeleteTitle => 'Revocare la chiave API?';

  @override
  String get adminApiKeysDeleted => 'Chiave API revocata';

  @override
  String get adminApiKeysRevoke => 'Revoca';

  @override
  String get adminApiKeysSetActive => 'Imposta come attiva';

  @override
  String get adminApiKeysSetInactive => 'Imposta come inattiva';

  @override
  String get adminApiKeysFailedCreate => 'Impossibile creare la chiave API';

  @override
  String get adminApiKeysFailedDelete => 'Impossibile revocare la chiave API';

  @override
  String get adminApiKeysFailedUpdate => 'Impossibile aggiornare la chiave API';

  @override
  String get adminApiKeysEmpty => 'Ancora nessuna chiave API';

  @override
  String get adminApiKeysEmptySub =>
      'Creane una per consentire ad app e script di accedere al tuo server';

  @override
  String get adminApiKeysNeverUsed => 'Mai usata';

  @override
  String get adminApiKeysNeverExpires => 'Nessuna scadenza';

  @override
  String get adminApiKeysNameRequired => 'Inserisci un nome';

  @override
  String get adminApiKeysUserRequired => 'Scegli un utente';

  @override
  String get adminApiKeysExpNever => 'Mai';

  @override
  String get adminApiKeysExp7d => '7 giorni';

  @override
  String get adminApiKeysExp30d => '30 giorni';

  @override
  String get adminApiKeysExp90d => '90 giorni';

  @override
  String get adminApiKeysExp1y => '1 anno';

  @override
  String adminApiKeysLastUsed(String time) {
    return 'Ultimo utilizzo $time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return 'Scade il $date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return 'Revocare \"$name\"? Le app che usano questa chiave perderanno subito l\'accesso.';
  }

  @override
  String get endOfEpisode => 'Fine dell\'episodio';

  @override
  String get sleepTimerSheetEpisodeSleepStart =>
      'Spegni alla fine dell\'episodio';

  @override
  String get bookmarkListen => 'Ascolta';

  @override
  String get bookmarkPause => 'Pausa';

  @override
  String get bookmarkPreviewFailed => 'Impossibile riprodurre questo punto.';

  @override
  String get clipExport => 'Esporta clip';

  @override
  String get clipJumpToStart => 'Vai all\'inizio';

  @override
  String get clipJumpToEnd => 'Vai alla fine';

  @override
  String get clipSetStart => 'Imposta inizio';

  @override
  String get clipSetEnd => 'Imposta fine';

  @override
  String get clipInLabel => 'Inizio';

  @override
  String get clipOutLabel => 'Fine';

  @override
  String get clipSave => 'Salva clip';

  @override
  String clipExportSaved(String filename) {
    return 'Salvato $filename';
  }

  @override
  String get clipExportClamped =>
      'Clip salvata, accorciata fino alla fine di questa traccia';

  @override
  String get clipExportFailed => 'Impossibile esportare la clip.';

  @override
  String get clipDownloadToExport =>
      'Scarica prima questo libro per esportare una clip su iPhone.';

  @override
  String get fsPickerTitle => 'Seleziona cartella';

  @override
  String get fsServerRoot => 'Radice del server';

  @override
  String get fsEmptyFolder => 'Nessuna sottocartella qui';

  @override
  String get fsUseThisFolder => 'Usa questa cartella';

  @override
  String get adminLibrariesManage => 'Librerie';

  @override
  String get adminLibrariesManageSubtitle => 'Crea, modifica e riordina';

  @override
  String get adminUploadTitle => 'Carica contenuti';

  @override
  String get adminUploadSubtitle => 'Aggiungi libri e podcast dai file';

  @override
  String get adminUploadNoLibraries =>
      'Crea una libreria prima di caricare contenuti.';

  @override
  String get adminUploadDestination => 'Destinazione';

  @override
  String get adminUploadFolder => 'Cartella della libreria';

  @override
  String get adminUploadDetails => 'Dettagli dell\'elemento';

  @override
  String get adminUploadOptional => 'Facoltativo';

  @override
  String get adminUploadAutoMetadata => 'Recupera metadati automaticamente';

  @override
  String get adminUploadAutoMetadataSubtitle =>
      'Compila titolo, autore e serie dalla corrispondenza migliore';

  @override
  String get adminUploadMetadataProvider => 'Provider di metadati';

  @override
  String get adminUploadMetadataSearching => 'Ricerca dei metadati...';

  @override
  String get adminUploadMetadataNoResults =>
      'Nessuna corrispondenza per i metadati. Puoi comunque caricare questo elemento.';

  @override
  String get adminUploadMetadataFailed =>
      'Impossibile cercare i metadati. Puoi comunque caricare questo elemento.';

  @override
  String get adminUploadDestinationPreview => 'Destinazione sul server';

  @override
  String get adminUploadFiles => 'File';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => 'Scegli i file';

  @override
  String get adminUploadAddFiles => 'Aggiungi file';

  @override
  String get adminUploadBookFilesHint =>
      'Scegli file audio o ebook. Puoi includere anche copertine e file di metadati.';

  @override
  String get adminUploadPodcastFilesHint =>
      'Scegli uno o più file audio. Puoi includere anche copertine e file di metadati.';

  @override
  String get adminUploadUnsupportedFiles =>
      'Alcuni file selezionati non sono supportati da Audiobookshelf.';

  @override
  String get adminUploadFilePickerFailed =>
      'Impossibile aprire i file selezionati.';

  @override
  String get adminUploadTitleRequired => 'Inserisci un titolo';

  @override
  String get adminUploadLibraryRequired => 'Scegli una libreria';

  @override
  String get adminUploadFolderRequired => 'Scegli una cartella della libreria';

  @override
  String get adminUploadFilesRequired => 'Scegli almeno un file';

  @override
  String get adminUploadPodcastFileRequired =>
      'Scegli almeno un file audio per questo podcast.';

  @override
  String get adminUploadBookFileRequired =>
      'Scegli almeno un file audio o ebook per questo libro.';

  @override
  String get adminUploadPathCheckFailed =>
      'Impossibile controllare la cartella di destinazione. Non è stato caricato nulla.';

  @override
  String get adminUploadDestinationExists =>
      'Questa cartella di destinazione esiste già sul server.';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return 'Questa destinazione è già usata da \"$title\".';
  }

  @override
  String get adminUploadAddToExistingTitle => 'La cartella esiste già';

  @override
  String adminUploadAddToExisting(String title) {
    return 'Questa cartella appartiene a \"$title\". Aggiungere i file? Il server li rileverà alla prossima scansione.';
  }

  @override
  String get adminUploadAddToExistingNoItem =>
      'Questa cartella esiste già sul server. Aggiungere i file?';

  @override
  String get adminUploadAddToBook => 'Aggiungi a un libro esistente';

  @override
  String get adminUploadAddToBookHint => 'Cerca in questa libreria';

  @override
  String get adminUploadNoBooksFound => 'Nessun libro trovato';

  @override
  String adminUploadAddingTo(String title) {
    return 'Aggiunta dei file a \"$title\"';
  }

  @override
  String adminUploadAddedTo(String title) {
    return 'File aggiunti a \"$title\"';
  }

  @override
  String get adminUploadTargetNoFolder =>
      'Impossibile trovare la cartella di questo libro sul server.';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return 'Il server metterebbe questi file in \"$preview\", non nella cartella del libro \"$folder\". Non è stato caricato nulla.';
  }

  @override
  String get adminUploadUploading => 'Caricamento...';

  @override
  String adminUploadProgress(int percent) {
    return 'Caricamento $percent%';
  }

  @override
  String get adminUploadButton => 'Carica';

  @override
  String adminUploadComplete(String title) {
    return '\"$title\" caricato';
  }

  @override
  String get adminUploadFailed => 'Caricamento non riuscito';

  @override
  String adminUploadFailedReason(String error) {
    return 'Caricamento non riuscito: $error';
  }

  @override
  String get adminUploadReselectFiles =>
      'Scegli di nuovo i file prima di riprovare.';

  @override
  String get adminServerSettings => 'Impostazioni del server';

  @override
  String get adminServerSettingsSubtitle =>
      'Scanner, archiviazione e ordinamento';

  @override
  String get adminAuthentication => 'Autenticazione';

  @override
  String get adminAuthenticationSubtitle =>
      'Accesso con password e OpenID Connect';

  @override
  String get adminStats => 'Statistiche';

  @override
  String get adminStatsSubtitle => 'Totali della libreria e dell\'ascolto';

  @override
  String get adminAllSessions => 'Tutte le sessioni';

  @override
  String get adminAllSessionsSubtitle =>
      'Visualizza e gestisci tutte le sessioni di ascolto';

  @override
  String get adminSessionsAllUsers => 'Tutti gli utenti';

  @override
  String get adminSessionsEmpty => 'Nessuna sessione';

  @override
  String get statsLibraryTotals => 'Totali della libreria';

  @override
  String get statsTotalItems => 'Elementi';

  @override
  String get statsAudioFiles => 'File audio';

  @override
  String get statsTotalSize => 'Dimensione totale';

  @override
  String get statsBooks => 'Libri';

  @override
  String get statsPodcasts => 'Podcast';

  @override
  String get statsBooksSize => 'Dimensione dei libri';

  @override
  String get statsYearReview => 'Riepilogo dell\'anno';

  @override
  String get statsNoYearData => 'Nessun dato per quest\'anno';

  @override
  String get statsListeningTime => 'Tempo di ascolto';

  @override
  String get statsSessions => 'Sessioni';

  @override
  String get statsBooksAdded => 'Libri aggiunti';

  @override
  String get statsAuthorsAdded => 'Autori aggiunti';

  @override
  String get statsTopAuthors => 'Autori più ascoltati';

  @override
  String get statsTopNarrators => 'Narratori più ascoltati';

  @override
  String get statsTopGenres => 'Generi più ascoltati';

  @override
  String get srvScannerSection => 'Scanner';

  @override
  String get srvFindCovers => 'Cerca copertine';

  @override
  String get srvCoverProvider => 'Provider delle copertine';

  @override
  String get srvParseSubtitles => 'Ricava i sottotitoli dal nome del file';

  @override
  String get srvPreferMatched => 'Preferisci i metadati abbinati';

  @override
  String get srvDisableWatcher => 'Disattiva il controllo delle cartelle';

  @override
  String get srvStorageSection => 'Archiviazione';

  @override
  String get srvStoreCover => 'Salva la copertina con l\'elemento';

  @override
  String get srvStoreMetadata => 'Salva i metadati con l\'elemento';

  @override
  String get srvMetadataFormat => 'Formato del file dei metadati';

  @override
  String get srvFormatSection => 'Visualizzazione e formato';

  @override
  String get srvDateFormat => 'Formato della data';

  @override
  String get srvTimeFormat => 'Formato dell\'ora';

  @override
  String get srvLanguage => 'Lingua del server';

  @override
  String get srvChromecast => 'Supporto Chromecast';

  @override
  String get srvAllowIframe => 'Consenti l\'incorporamento in iframe';

  @override
  String get srvSortingSection => 'Ordinamento';

  @override
  String get srvIgnorePrefixes => 'Ignora i prefissi nell\'ordinamento';

  @override
  String get srvSortingPrefixes => 'Prefissi di ordinamento';

  @override
  String get srvAddPrefix => 'Aggiungi prefisso';

  @override
  String get srvSave => 'Salva impostazioni';

  @override
  String get srvSavePrefixes => 'Salva prefissi';

  @override
  String get srvSaved => 'Impostazioni salvate';

  @override
  String get srvSaveFailed => 'Impossibile salvare le impostazioni';

  @override
  String get srvPrefixesSaved => 'Prefissi di ordinamento aggiornati';

  @override
  String get authSetLoadFailed =>
      'Impossibile caricare le impostazioni di autenticazione';

  @override
  String get authSetCustomMessage => 'Messaggio personalizzato all\'accesso';

  @override
  String get authSetMessage => 'Messaggio';

  @override
  String get authSetPasswordAuth => 'Autenticazione con password';

  @override
  String get authSetOpenId => 'Autenticazione OpenID Connect';

  @override
  String get authSetGuide => 'Guida alla configurazione';

  @override
  String get authSetIssuerUrl => 'URL dell\'issuer';

  @override
  String get authSetAutoPopulate => 'Compilazione automatica';

  @override
  String get authSetAuthorizeUrl => 'URL di autorizzazione';

  @override
  String get authSetTokenUrl => 'URL del token';

  @override
  String get authSetUserinfoUrl => 'URL Userinfo';

  @override
  String get authSetJwksUrl => 'URL JWKS';

  @override
  String get authSetLogoutUrl => 'URL di disconnessione';

  @override
  String get authSetClientId => 'ID client';

  @override
  String get authSetClientSecret => 'Segreto del client';

  @override
  String get authSetSigningAlgorithm => 'Algoritmo di firma';

  @override
  String get authSetRedirectUris => 'URI di reindirizzamento mobile consentiti';

  @override
  String get authSetRedirectUrisInfo =>
      'Dopo l\'accesso, le app possono tornare solo a questi indirizzi. Absorb usa absorb://oauth. Un asterisco (*) come unica voce consente qualsiasi indirizzo.';

  @override
  String get authSetAddRedirectUri => 'Aggiungi URI';

  @override
  String get authSetAddAbsorbRedirect => 'Aggiungi absorb://oauth';

  @override
  String get authSetSubfolder =>
      'Sottocartella per gli URL di reindirizzamento';

  @override
  String get authSetSubfolderNone => 'Nessuna';

  @override
  String get authSetWebRedirectInfo =>
      'Consenti questi URL nel tuo provider OAuth così l\'accesso può tornare all\'app web:';

  @override
  String get authSetButtonText => 'Testo del pulsante';

  @override
  String get authSetMatchExisting => 'Abbina gli utenti esistenti tramite';

  @override
  String get authSetMatchNone => 'Non abbinare';

  @override
  String get authSetMatchEmail => 'Email';

  @override
  String get authSetMatchUsername => 'Nome utente';

  @override
  String get authSetMatchExistingInfo =>
      'Serve a collegare gli utenti esistenti. Una volta collegati, gli utenti vengono abbinati tramite il loro ID univoco del provider.';

  @override
  String get authSetAutoLaunch => 'Avvio automatico';

  @override
  String get authSetAutoLaunchInfo =>
      'Apre automaticamente il provider dalla pagina di accesso web. /login?autoLaunch=0 lo salta.';

  @override
  String get authSetAutoRegister => 'Registrazione automatica';

  @override
  String get authSetAutoRegisterInfo =>
      'Crea automaticamente i nuovi utenti dopo il loro accesso';

  @override
  String get authSetClaimsInfo =>
      'Lascia questi campi vuoti per disattivare l\'assegnazione di gruppi e permessi. I nuovi utenti riceveranno il ruolo Utente.';

  @override
  String get authSetGroupClaim => 'Claim dei gruppi';

  @override
  String get authSetGroupClaimInfo =>
      'Claim che elenca i gruppi dell\'utente, di solito groups. I gruppi chiamati admin, user o guest impostano il ruolo e prevale il più alto. Se nessun gruppo corrisponde, l\'accesso viene rifiutato.';

  @override
  String get authSetPermsClaim => 'Claim dei permessi avanzati';

  @override
  String get authSetPermsClaimInfo =>
      'Claim con i permessi per gli utenti non amministratori. Se il claim manca, l\'accesso viene rifiutato, e un\'opzione mancante conta come disattivata. Formato previsto:';

  @override
  String get authSetRestartNote =>
      'Riavvia il server dopo il salvataggio per applicare le modifiche a OpenID Connect.';

  @override
  String get authSetNoChanges => 'Nessuna modifica da salvare';

  @override
  String get authSetNeedOneMethod => 'Attiva almeno un metodo di accesso';

  @override
  String authSetFieldRequired(String field) {
    return '$field è obbligatorio';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return 'URI di reindirizzamento non valido: $uri';
  }

  @override
  String get authSetAsteriskAlone =>
      'Un asterisco (*) deve essere l\'unico URI di reindirizzamento';

  @override
  String authSetInvalidClaim(String field) {
    return '$field non è un nome di claim valido';
  }

  @override
  String authSetIssuerFailed(String error) {
    return 'Impossibile leggere l\'issuer: $error';
  }

  @override
  String get libNoneYet => 'Ancora nessuna libreria';

  @override
  String get libReorderFailed => 'Impossibile salvare il nuovo ordine';

  @override
  String get libDeleteTitle => 'Eliminare la libreria?';

  @override
  String get libDeleteBody =>
      'Questo rimuove definitivamente la libreria e tutti i suoi elementi dal server.';

  @override
  String get libDeleted => 'Libreria eliminata';

  @override
  String get libDeleteFailed => 'Impossibile eliminare la libreria';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cartelle',
      one: '1 cartella',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => 'Nuova libreria';

  @override
  String get libEditTitle => 'Modifica libreria';

  @override
  String get libName => 'Nome della libreria';

  @override
  String get libMediaType => 'Tipo di contenuto';

  @override
  String get libMediaBook => 'Libri';

  @override
  String get libMediaPodcast => 'Podcast';

  @override
  String get libProvider => 'Provider di metadati';

  @override
  String get libIcon => 'Icona';

  @override
  String get libFolders => 'Cartelle';

  @override
  String get libAddFolder => 'Aggiungi cartella';

  @override
  String get libNoFolders => 'Aggiungi almeno una cartella';

  @override
  String get libAdvanced => 'Impostazioni avanzate';

  @override
  String get libCoverShape => 'Forma della copertina';

  @override
  String get libCoverSquare => 'Quadrata';

  @override
  String get libCoverStandard => 'Standard';

  @override
  String get libDisableWatcher => 'Disattiva il controllo delle cartelle';

  @override
  String get libSkipAsin => 'Salta l\'abbinamento dei libri con ASIN';

  @override
  String get libSkipIsbn => 'Salta l\'abbinamento dei libri con ISBN';

  @override
  String get libHideSingleSeries => 'Nascondi le serie di un solo libro';

  @override
  String get libAudiobooksOnly => 'Solo audiolibri';

  @override
  String get libEpubScripted => 'Consenti contenuti ePub con script';

  @override
  String get libLaterBooksOnly =>
      'Mostra solo i libri successivi in Continua la serie';

  @override
  String get libPodcastRegion => 'Regione di ricerca dei podcast';

  @override
  String get libMarkPercent => 'Completato al % di avanzamento';

  @override
  String get libMarkTime => 'Completato con secondi rimanenti';

  @override
  String get libAutoScan => 'Pianificazione scansione automatica (cron)';

  @override
  String get libCreate => 'Crea libreria';

  @override
  String get libUpdate => 'Salva modifiche';

  @override
  String get libNameRequired => 'Inserisci un nome per la libreria';

  @override
  String get libCreated => 'Libreria creata';

  @override
  String get libCreateFailed => 'Impossibile creare la libreria';

  @override
  String get libUpdated => 'Libreria aggiornata';

  @override
  String get libUpdateFailed => 'Impossibile aggiornare la libreria';

  @override
  String get libRemoveFoldersTitle => 'Rimuovere le cartelle?';

  @override
  String get libRemoveFoldersBody =>
      'Rimuovendo una cartella, i suoi elementi vengono eliminati dalla libreria. Non si può annullare.';

  @override
  String get readEbook => 'Leggi';

  @override
  String get ebookDownload => 'Scarica';

  @override
  String get ebookDownloaded => 'Scaricato';

  @override
  String get ebookSavedOffline => 'Salvato per la lettura offline';

  @override
  String get ebookRemovedOffline => 'Rimosso dall\'offline';

  @override
  String get ebookOfflineFailed => 'Impossibile scaricare l\'ebook';

  @override
  String get ebookSaveToDevice => 'Salva sul dispositivo';

  @override
  String get ebookSaveToDeviceTitle => 'Salvare sul dispositivo?';

  @override
  String get ebookSaveToDeviceBody =>
      'Salva una copia del file dell\'ebook in una posizione a tua scelta sul dispositivo. Non rende il libro disponibile offline nel lettore: usa Scarica per questo.';

  @override
  String get readerFormatUnsupported =>
      'Questo formato di ebook non può ancora essere aperto nel lettore';

  @override
  String get readerCouldNotOpen =>
      'Impossibile aprire questo ebook. Il file potrebbe essere danneggiato.';

  @override
  String get moreActions => 'Altro';

  @override
  String get readerChapters => 'Capitoli';

  @override
  String get readerSettings => 'Impostazioni del lettore';

  @override
  String get readerFontSize => 'Dimensione del carattere';

  @override
  String get readerLineSpacing => 'Interlinea';

  @override
  String get readerTextAlignment => 'Allineamento';

  @override
  String get readerAlignJustified => 'Giustificato';

  @override
  String get readerAlignLeft => 'A sinistra';

  @override
  String get readerSideMargins => 'Margini laterali';

  @override
  String get readerTopBottom => 'Alto e basso';

  @override
  String get readerPageLayout => 'Layout della pagina';

  @override
  String get readerPinTopBar =>
      'Mantieni titolo e barra di avanzamento sullo schermo';

  @override
  String get readerPinTopBarHint =>
      'Li fissa sopra la pagina invece di mostrarli al tocco. La pagina diventa un po\' più corta così nessun testo viene coperto.';

  @override
  String get readerTopBarProgress => 'Progressi nella barra superiore';

  @override
  String get readerTopBarProgressBook => 'Libro';

  @override
  String get readerTopBarProgressChapter => 'Capitolo';

  @override
  String get readerTopBarProgressBoth => 'Entrambi';

  @override
  String get readerSectionText => 'Testo';

  @override
  String get readerSectionPage => 'Pagina';

  @override
  String get readerSectionTopBar => 'Barra superiore e schermo';

  @override
  String get readerSectionControls => 'Controlli';

  @override
  String get readerSectionStats => 'Statistiche';

  @override
  String get readerParagraphSpacing => 'Spaziatura dei paragrafi';

  @override
  String get readerParagraphSpacingBook => 'Quella del libro';

  @override
  String get readerTapZones => 'Zone di tocco';

  @override
  String get readerTapZonesHint =>
      'Trascina le linee per ridimensionare i quadrati. Tocca un quadrato per cambiarne la funzione, oppure parti da un layout.';

  @override
  String get readerTapPrev => 'Pagina precedente';

  @override
  String get readerTapNext => 'Pagina successiva';

  @override
  String get readerTapMenu => 'Mostra i controlli';

  @override
  String get readerTapNothing => 'Niente';

  @override
  String get readerTapKeepMenu => 'Un quadrato deve mostrare i controlli';

  @override
  String get readerHideControls => 'Nascondi i controlli dopo';

  @override
  String get readerHideControlsNever => 'Mai';

  @override
  String get readerBarNotes => 'Note ed evidenziazioni';

  @override
  String readerHideControlsAfter(int seconds) {
    return '${seconds}s';
  }

  @override
  String get playerDownloadStreamingInstead =>
      'Questo download non è stato riproducibile, quindi va in streaming dal server. Scaricarlo di nuovo potrebbe risolvere.';

  @override
  String get readerPageTurn => 'Cambio pagina';

  @override
  String get readerPageTurnNone => 'Nessuno';

  @override
  String get readerPageTurnSlide => 'Scorrimento';

  @override
  String get readerPageTurnCurl => 'Arricciamento';

  @override
  String get readerPageTurnRipple => 'Increspatura';

  @override
  String get readerScrollMode => 'Modalità di scorrimento';

  @override
  String get readerScrollModeHint =>
      'Scorri il libro verso il basso invece di girare le pagine. Vale per tutti i libri.';

  @override
  String get readerKeepAwake => 'Mantieni lo schermo acceso';

  @override
  String get readerKeepAwakeHint =>
      'Impedisce allo schermo di spegnersi mentre leggi al tuo ritmo. Lo scorrimento automatico e la lettura sincronizzata lo tengono sempre acceso.';

  @override
  String get readerLayoutAuto => 'Automatico';

  @override
  String get readerLayoutSingle => 'Singola';

  @override
  String get readerLayoutTwoPage => 'Doppia pagina';

  @override
  String get readerTheme => 'Tema';

  @override
  String get readerFont => 'Carattere';

  @override
  String get readerVolumeNav => 'I tasti del volume girano le pagine';

  @override
  String get readerVolumeNavOff => 'No';

  @override
  String get readerVolumeNavNormal => 'Normale';

  @override
  String get readerVolumeNavMirrored => 'Invertito';

  @override
  String get readerAutoScroll => 'Scorrimento automatico';

  @override
  String get readerAutoScrollSubtitle =>
      'La pagina successiva si sovrappone a questa dall\'alto verso il basso: trascina al centro dello schermo per cambiare velocità, tocca per fermare';

  @override
  String get readerAutoScrollStarted => 'Scorrimento automatico avviato';

  @override
  String get readerAutoScrollPaused => 'In pausa: tieni premuto per fermare';

  @override
  String get readerAutoScrollResumed => 'Scorrimento automatico ripreso';

  @override
  String get readerAutoScrollStopped => 'Scorrimento automatico disattivato';

  @override
  String get readerAutoScrollEndOfBook =>
      'Fine del libro: scorrimento automatico disattivato';

  @override
  String readerAutoScrollSpeed(int percent) {
    return 'Velocità $percent%';
  }

  @override
  String get readerMoreControls => 'Altri controlli';

  @override
  String get readerAutoScrollSleep =>
      'Timer di spegnimento dello scorrimento automatico';

  @override
  String get readerAutoScrollSleepHint =>
      'Ferma lo scorrimento dopo un po\' e lascia spegnere lo schermo.';

  @override
  String readerAutoScrollSleepMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String readerAutoScrollSleepLeft(int minutes) {
    return '$minutes min rimanenti';
  }

  @override
  String readerAutoScrollSleepIn(int minutes) {
    return 'Lo scorrimento automatico si ferma tra $minutes min';
  }

  @override
  String get readerAutoScrollSleepOff =>
      'Timer di spegnimento dello scorrimento automatico disattivato';

  @override
  String get readerAutoScrollSleepEnded =>
      'Timer di spegnimento: scorrimento automatico disattivato';

  @override
  String get readerDownloadStarted => 'Download avviato';

  @override
  String get detailChaptersJumpTitle => 'Passare a questo capitolo?';

  @override
  String detailChaptersJumpContent(String title) {
    return 'La riproduzione passa a \"$title\".';
  }

  @override
  String get detailChaptersJump => 'Vai';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capitoli completati',
      one: '1 capitolo completato',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count altri ascoltatori',
      one: '1 altro ascoltatore',
      zero: 'Nessun altro ascoltatore',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => 'Prossimo';

  @override
  String get seriesJumpToUpNext => 'Vai al prossimo';

  @override
  String get seriesStatsFinished => 'Completati';

  @override
  String get seriesStatsListened => 'Ascoltati';

  @override
  String get seriesStatsLeft => 'Rimanenti';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done di $total';
  }

  @override
  String get detailSessionsNone => 'Ancora nessuna sessione di ascolto';

  @override
  String detailSessionsAll(int count) {
    return 'Tutte le $count sessioni';
  }

  @override
  String get readerVolumeNavWhilePlaying =>
      'Anche durante la riproduzione dell\'audio';

  @override
  String get readerTranslateWith => 'Traduci con';

  @override
  String get readerTranslateApp => 'App su questo dispositivo';

  @override
  String get readerTranslateApple => 'Integrato in iOS';

  @override
  String get readerTranslateWeb => 'Si apre nel browser';

  @override
  String get readerTranslateHint =>
      'Il testo selezionato viene inviato al traduttore che scegli.';

  @override
  String get readerMoreFonts => 'Scarica altri caratteri';

  @override
  String get readerFontRemove => 'Rimuovi download';

  @override
  String readerFontDownloadFailed(String font) {
    return 'Impossibile scaricare $font';
  }

  @override
  String get readerAnnotations => 'Annotazioni';

  @override
  String readerHighlights(int count) {
    return 'Evidenziazioni ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return 'Segnalibri ($count)';
  }

  @override
  String get readerNoHighlights => 'Ancora nessuna evidenziazione';

  @override
  String get readerHistory => 'Cronologia';

  @override
  String get sessionReading => 'Lettura';

  @override
  String get readerHistoryEmpty =>
      'Le pagine che lasci sono elencate qui, così puoi sempre tornarci.';

  @override
  String get readerHistoryClosed => 'Libro chiuso';

  @override
  String get readerHistoryBeforeJump => 'Prima di un salto';

  @override
  String get readerHistoryBeforeSync => 'Prima dell\'abbinamento con l\'audio';

  @override
  String get readerLogReading => 'Conta il tempo di lettura nelle statistiche';

  @override
  String get readerLogReadingHint =>
      'Registra il tempo nel lettore come sessione, così compare nelle tue statistiche. Su Audiobookshelf conta come tempo di ascolto.';

  @override
  String get readerNoBookmarks => 'Ancora nessun segnalibro';

  @override
  String get readerBookmarkDefault => 'Segnalibro';

  @override
  String get readerNoteTitle => 'Nota';

  @override
  String get readerNoteHint => 'Aggiungi una nota...';

  @override
  String get backupAndSync => 'Backup e sincronizzazione';

  @override
  String get backupAndSyncSubtitle =>
      'Salva un file di backup o mantieni le impostazioni allineate tra i dispositivi';

  @override
  String get syncSettingsExperimental => 'Sperimentale';

  @override
  String get syncSettingsExperimentalBody =>
      'La sincronizzazione è nuova e ancora in sviluppo. Se due dispositivi modificano qualcosa mentre sono scollegati, uno dei due può perdere le proprie modifiche. Tieni un file di backup come copia di sicurezza.';

  @override
  String get syncSettingsNeedServer => 'Serve un server?';

  @override
  String get syncSettingsNeedServerSub =>
      'Funziona qualsiasi server WebDAV. Nextcloud è uno gratuito da ospitare in proprio.';

  @override
  String get syncSettingsConnection => 'Connessione';

  @override
  String get syncSettingsConnectionNotSet => 'Non ancora configurata';

  @override
  String get syncSettingsBackupFile => 'File di backup';

  @override
  String get syncSettingsBackupFilePlain =>
      'Salva tutto in un file che conservi tu.';

  @override
  String get syncSettingsBackupFileWithSync =>
      'Salva tutto in un file che conservi tu. Include i dati di accesso e, ripristinandolo su un altro telefono, attiva la sincronizzazione anche lì.';

  @override
  String get syncSettingsStatusOff => 'Sincronizzazione disattivata';

  @override
  String get syncSettingsStatusProblem => 'Impossibile raggiungere il server';

  @override
  String get syncSettings => 'Sincronizza le impostazioni tra i dispositivi';

  @override
  String get syncSettingsExtras => 'Sincronizza anche';

  @override
  String get syncSettingsIncludeRmab => 'Impostazioni di ReadMeABook';

  @override
  String get syncSettingsIncludeRmabSub =>
      'Inserisce il tuo token API di ReadMeABook nel file sincronizzato';

  @override
  String get syncSettingsSubtitle =>
      'Mantieni le impostazioni allineate tramite il tuo server WebDAV';

  @override
  String get syncSettingsEnable => 'Sincronizza le impostazioni';

  @override
  String get syncSettingsServerUrl => 'URL della cartella WebDAV';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => 'Nome utente';

  @override
  String get syncSettingsPassword => 'Password';

  @override
  String get syncSettingsHeaders => 'Intestazioni personalizzate (facoltativo)';

  @override
  String get syncSettingsHeadersHint =>
      'Una per riga, ad esempio CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => 'Verifica connessione';

  @override
  String get syncSettingsHoldToUpload => 'Tieni premuto per caricare ora';

  @override
  String get syncSettingsUploadNow => 'Carica ora';

  @override
  String get syncSettingsDownloadNow => 'Scarica ora';

  @override
  String get syncSettingsOk => 'Connesso';

  @override
  String get syncSettingsNoRemote => 'Connesso: ancora nulla sincronizzato';

  @override
  String get syncSettingsAuthFailed => 'Nome utente o password errati';

  @override
  String get syncSettingsNetworkError =>
      'Impossibile raggiungere quell\'indirizzo';

  @override
  String get syncSettingsNotConfigured =>
      'Inserisci prima indirizzo, nome utente e password';

  @override
  String get syncSettingsTooLarge =>
      'Le tue impostazioni sono troppo grandi per essere sincronizzate';

  @override
  String get syncSettingsUploaded => 'Impostazioni caricate';

  @override
  String get syncSettingsApplied =>
      'Impostazioni aggiornate dall\'altro dispositivo';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count impostazioni aggiornate dall\'altro dispositivo',
      one: '1 impostazione aggiornata dall\'altro dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => 'Già aggiornato';

  @override
  String syncSettingsLastSynced(String when) {
    return 'Ultima sincronizzazione $when';
  }

  @override
  String get syncSettingsNever => 'Non ancora sincronizzato';

  @override
  String navHoldPickTitle(String tab) {
    return 'Tenendo premuto $tab...';
  }

  @override
  String get navHoldPickBody =>
      'Scegli cosa fa una pressione prolungata su questa scheda. Puoi cambiarlo in seguito nelle Impostazioni.';

  @override
  String get navHoldSettingTitle => 'Scorciatoie a pressione prolungata';

  @override
  String get navHoldSettingSubtitle => 'Cosa fa tenere premuta ogni scheda';

  @override
  String get navHoldAskNextTime => 'Chiedi la prossima volta';

  @override
  String get navHoldNothing => 'Niente';

  @override
  String get navHoldPlayPause => 'Riproduci / pausa';

  @override
  String get navHoldOfflineMode => 'Modalità offline';

  @override
  String get navHoldOfflineOn => 'Modalità offline attiva';

  @override
  String get navHoldOfflineOff => 'Modalità offline disattivata';

  @override
  String get navHoldMenu => 'Mostra sempre il menu';

  @override
  String get navHoldStop => 'Interrompi la riproduzione';

  @override
  String get navHoldRmabSearch => 'Ricerca ReadMeABook';

  @override
  String get navHoldRmabRequests => 'Le mie richieste di libri';

  @override
  String get navHoldRmabWeb => 'Sito di ReadMeABook';

  @override
  String get navHoldAdd => 'Aggiungi';

  @override
  String get navHoldMoveLeft => 'Sposta a sinistra';

  @override
  String get navHoldMoveRight => 'Sposta a destra';

  @override
  String get navHoldRemoveFromMenu => 'Rimuovi dal menu';

  @override
  String get navHoldEditHint =>
      'Tieni premuta una voce per spostarla o rimuoverla';

  @override
  String get navHoldResetMenu =>
      'Ripristina le voci del menu a pressione prolungata';

  @override
  String get navHoldMenuReset => 'Voci del menu ripristinate';

  @override
  String get bookStatsAction => 'Statistiche di ascolto';

  @override
  String get bookStatsYou => 'Tu';

  @override
  String get bookStatsEveryone => 'Tutti';

  @override
  String get bookStatsListened => 'Tempo di ascolto';

  @override
  String get bookStatsSessions => 'Sessioni';

  @override
  String get bookStatsFirst => 'Primo ascolto';

  @override
  String get bookStatsLast => 'Ultimo ascolto';

  @override
  String get bookStatsListeners => 'Persone che l\'hanno iniziato';

  @override
  String get bookStatsFinishedCount => 'Persone che l\'hanno completato';

  @override
  String get bookStatsTotalTime => 'Tempo di ascolto di tutti';

  @override
  String get bookStatsNobody => 'Nessuno l\'ha ancora iniziato';

  @override
  String get bookStatsScanning =>
      'Scansione delle sessioni in corso, potrebbe richiedere un po\'...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return 'Scansione delle sessioni, $done persone su $total...';
  }

  @override
  String bookStatsLastChecked(String when) {
    return 'Controllato $when';
  }

  @override
  String get activityYourReading => 'La tua lettura';

  @override
  String get activityYourListening => 'Il tuo ascolto';

  @override
  String activityLastRead(String when) {
    return 'Ultima lettura $when';
  }

  @override
  String activityLastListened(String when) {
    return 'Ultimo ascolto $when';
  }

  @override
  String get activityNotStarted => 'Non iniziato';

  @override
  String get activityNoReading => 'Ancora nessuna sessione di lettura';

  @override
  String get activityTime => 'Tempo';

  @override
  String get activityAverage => 'Media';

  @override
  String get activityProgress => 'Progressi';

  @override
  String activityReached(String percent) {
    return '$percent raggiunto';
  }

  @override
  String get readingLogTitle => 'Registro di lettura';

  @override
  String get readingLogTotalTime => 'Tempo totale';

  @override
  String get readingLogAverageSession => 'Sessione media';

  @override
  String get readingLogActiveDays => 'Giorni attivi';

  @override
  String readingLogActiveDaysOf(int active, int total) {
    return '$active su $total';
  }

  @override
  String get readingLogPace => 'Ritmo';

  @override
  String readingLogPacePerHour(String percent) {
    return '$percent%/h';
  }

  @override
  String get readingLogLastRead => 'Ultima lettura';

  @override
  String get readingLogStarted => 'Iniziato';

  @override
  String get readingLogFinished => 'Completato';

  @override
  String get readingLogNotSet => 'Non impostato';

  @override
  String readingLogLeftMinutes(int m) {
    return 'Circa $m min al termine';
  }

  @override
  String readingLogLeftHours(int h) {
    return 'Circa $h h al termine';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return 'Circa $h h $m min al termine';
  }

  @override
  String get readingLogLeftMax => 'Oltre 99 h al termine';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return 'In aumento del $percent% rispetto alla settimana prima';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return 'In calo del $percent% rispetto alla settimana prima';
  }

  @override
  String get readingLogNewThisWeek => 'Novità di questa settimana';

  @override
  String get readingLogSameAsLastWeek => 'Come la settimana prima';

  @override
  String get readingLogQuietTwoWeeks => 'Niente nelle ultime due settimane';

  @override
  String get readingLogWhereYouRead => 'Dove l\'hai letto';

  @override
  String get readingLogSourceIos => 'App iOS';

  @override
  String get readingLogSourceAndroid => 'App Android';

  @override
  String get readingLogChartTitle => 'Progressi nel tempo';

  @override
  String get readingLogChartPosition => 'Posizione raggiunta';

  @override
  String get readingLogChartMinutes => 'Minuti';

  @override
  String get readingLogRecords => 'Record';

  @override
  String get readingLogLongestSession => 'Sessione più lunga';

  @override
  String get readingLogBestDay => 'Giorno migliore';

  @override
  String get readingLogLongestStreak => 'Serie più lunga';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni',
      one: '1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => 'Tornato indietro';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count volte',
      one: '1 volta',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => 'Prima apertura';

  @override
  String get readingLogAttempts => 'Tentativi';

  @override
  String readingLogAttempt(int index) {
    return 'Tentativo $index';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return 'Tentativo $index iniziato';
  }

  @override
  String get readingLogOutcomeCompleted => 'Completato';

  @override
  String get readingLogOutcomeSkimmed => 'Sfogliato';

  @override
  String get readingLogOutcomeAbandoned => 'Abbandonato';

  @override
  String get readingLogOutcomeInProgress => 'In corso';

  @override
  String readingLogSpanRange(String from, String to) {
    return 'dal $from al $to';
  }

  @override
  String readingLogSpanSince(String from) {
    return 'Dal $from';
  }

  @override
  String readingLogSpanEnded(String to) {
    return 'Terminato il $to';
  }

  @override
  String get readingLogSpanUnknown => 'Nessuna data registrata';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sessioni',
      one: '1 sessione',
    );
    return '$_temp0';
  }

  @override
  String readingLogShowing(int shown, int total) {
    return '$shown su $total';
  }

  @override
  String readingLogGapDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni senza lettura',
      one: '1 giorno senza lettura',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => 'Ancora nessuna sessione registrata';

  @override
  String get readingLogEmptyHint =>
      'Le sessioni compaiono qui mentre leggi o ascolti, da qualsiasi app o dispositivo che si sincronizza con BookOrbit.';

  @override
  String get readingLogNoMatches => 'Nessuna sessione in questo intervallo';

  @override
  String get readingLogAllTime => 'Sempre';

  @override
  String get readingLogLast30 => 'Ultimi 30 giorni';

  @override
  String get readingLogLast90 => 'Ultimi 90 giorni';

  @override
  String get readingLogThisYear => 'Quest\'anno';

  @override
  String get readingLogAllFormats => 'Tutti i formati';

  @override
  String get readingLogSortBy => 'Ordina per';

  @override
  String get readingLogSortDay => 'Giorno';

  @override
  String get readingLogSortLength => 'Durata';

  @override
  String get readingLogSortChange => 'Variazione';

  @override
  String get readingLogSortReached => 'Raggiunto';

  @override
  String get readingLogNewestFirst => 'Prima i più recenti';

  @override
  String get readingLogOldestFirst => 'Prima i più vecchi';

  @override
  String get readingLogMostFirst => 'Prima i maggiori';

  @override
  String get readingLogLeastFirst => 'Prima i minori';

  @override
  String get readingLogDeleteTitle => 'Eliminare questa sessione?';

  @override
  String get readingLogDeleteBody =>
      'Viene rimossa dal registro di lettura del libro e dalle tue statistiche su BookOrbit.';

  @override
  String get readingLogDeleteFailed => 'Impossibile eliminare la sessione';

  @override
  String get readingLogLoadFailed =>
      'Impossibile caricare il registro di lettura';

  @override
  String get navHoldServerScan => 'Scansione del server';

  @override
  String get navHoldScanAll => 'Scansiona tutte le librerie';

  @override
  String navHoldScanLibrary(String name) {
    return 'Scansiona $name';
  }

  @override
  String get navHoldScanStarted => 'Scansione avviata';

  @override
  String get navHoldScanFailed => 'Impossibile avviare la scansione';

  @override
  String get navHoldAdminLogs => 'Log del server';

  @override
  String navHoldAdminPage(String page) {
    return 'Amministrazione: $page';
  }

  @override
  String get navHoldNothingPlaying => 'Ancora niente da riprodurre';

  @override
  String get navHoldReadBook => 'Leggi il libro corrente';

  @override
  String get navHoldBookDetails => 'Dettagli del libro corrente';

  @override
  String get syncSourceTitle =>
      'Quale copia deve mantenere la sincronizzazione?';

  @override
  String get syncSourceBody =>
      'Questo backup ha attivato la sincronizzazione delle impostazioni. Usare l\'ultima sincronizzazione del server o rendere questo backup la fonte di riferimento? Scegliendo il backup si sostituisce la copia sul server per tutti i tuoi dispositivi sincronizzati.';

  @override
  String get syncSourceUseServer => 'Ultima sincronizzazione del server';

  @override
  String get syncSourceUseBackup => 'Questo backup';

  @override
  String get syncSettingsWhatTravels =>
      'Si sincronizzano preferenze, velocità per libro, layout della home, ordine di Absorbing, note ed evidenziazioni degli ebook. Account, cartelle dei download, interruttori dei download automatici, aspetto del lettore e tutto ciò che non è ancora stato inviato al server restano su questo dispositivo.';

  @override
  String get syncSettingsDownloadWarnTitle =>
      'Sostituire le impostazioni di questo dispositivo?';

  @override
  String get syncSettingsDownloadWarnBody =>
      'La copia sincronizzata sovrascriverà le impostazioni di questo dispositivo.';

  @override
  String get syncSettingsDownloadWarnConfirm => 'Sostituisci';

  @override
  String get readerCopied => 'Copiato negli appunti';

  @override
  String get dictionaryNotFound =>
      'Nessuna definizione trovata per questa parola.';

  @override
  String get dictionaryError =>
      'Impossibile raggiungere il dizionario. Controlla la connessione.';

  @override
  String get dictionaryRetry => 'Riprova';

  @override
  String get dictionarySearchWeb => 'Cerca sul web';

  @override
  String get readerTooltipCopy => 'Copia';

  @override
  String get readerTooltipSearch => 'Cerca';

  @override
  String get readerTooltipDefine => 'Definisci';

  @override
  String get readerTooltipTranslate => 'Traduci';

  @override
  String get readerSearchHint => 'Cerca in questo libro…';

  @override
  String readerSearchMatches(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count risultati per \"$query\"',
      one: '$count risultato per \"$query\"',
    );
    return '$_temp0';
  }

  @override
  String get readerSearchEmpty =>
      'Scrivi una parola o una frase e tocca cerca.';

  @override
  String readerSearchNoResults(String query) {
    return 'Nessun risultato per \"$query\".';
  }

  @override
  String get transcriptionTitle => 'Trascrizione';

  @override
  String get transcriptionAdvancedSubtitle =>
      'Per trascrivere i segnalibri e trovare il punto giusto tra audiolibro ed ebook';

  @override
  String get transcriptionEnable => 'Attiva la trascrizione';

  @override
  String get transcriptionEnableSubtitle =>
      'Aggiunge Trascrivi ai segnalibri, Trova la posizione nell\'ebook al player e Trova nell\'audiolibro al lettore';

  @override
  String get transcriptionDisclaimer =>
      'Funziona interamente sul dispositivo, non viene inviato nulla da nessuna parte. Usa più batteria e più risorse mentre lavora, e si possono trascrivere solo i libri scaricati.';

  @override
  String get transcriptionNeedModelHint =>
      'Scarica un modello qui sotto per iniziare a trascrivere.';

  @override
  String get transcriptionModelSection => 'Modelli';

  @override
  String get transcriptionModelTiny => 'Tiny';

  @override
  String get transcriptionModelTinyDesc =>
      'Il più veloce, meno preciso. Circa 31 MB.';

  @override
  String get transcriptionModelBase => 'Base';

  @override
  String get transcriptionModelBaseDesc => 'Un buon compromesso. Circa 57 MB.';

  @override
  String get transcriptionModelSmall => 'Small';

  @override
  String get transcriptionModelSmallDesc =>
      'Più lento ma il più preciso: ideale su un telefono di fascia alta. Circa 182 MB.';

  @override
  String get transcriptionAutoHint =>
      'Se ne hai scaricato più di uno, ogni lavoro sceglie tra di essi. I libri con un ebook usano il più veloce, perché le parole esatte vengono comunque dall\'ebook. Quelli senza usano il più preciso, tranne la lettura sincronizzata, che resta sotto Small per stare al passo con la voce narrante.';

  @override
  String get transcriptionDownload => 'Scarica';

  @override
  String get transcriptionDownloadFailed =>
      'Download non riuscito. Controlla la connessione e riprova.';

  @override
  String get transcribe => 'Trascrivi';

  @override
  String get transcribing => 'Trascrizione in corso...';

  @override
  String get transcriptionResultTitle => 'Trascrizione';

  @override
  String get transcriptionSaveToNote => 'Salva nella nota';

  @override
  String get transcriptionSavedToNote => 'Salvato nella nota del segnalibro';

  @override
  String get transcriptionDisabledHint =>
      'Attiva la trascrizione dei segnalibri in Impostazioni, sotto Avanzate.';

  @override
  String get transcriptionNoModelDownloaded =>
      'Prima scarica un modello di trascrizione in Impostazioni.';

  @override
  String get transcriptionNotDownloadedBook =>
      'Scarica questo libro o connettiti al server per trascriverlo.';

  @override
  String get transcriptionNoMetadataMsg =>
      'Impossibile individuare questo punto nel download. Prova a scaricare di nuovo il libro.';

  @override
  String get transcriptionBusyMsg =>
      'Sto già trascrivendo qualcosa. Attendi un momento.';

  @override
  String get transcriptionEmptyMsg => 'Nessun parlato trovato in questo punto.';

  @override
  String get transcriptionFailedMsg =>
      'Impossibile trascrivere questo punto. Riprova.';

  @override
  String get transcriptionPlaySnippet => 'Ascolta';

  @override
  String get transcriptionPauseSnippet => 'Pausa';

  @override
  String get transcriptionIntroBody =>
      'Ascolta la quantità di audio scelta, partendo poco prima del segnalibro, e la trasforma in testo sul tuo dispositivo. Le clip più lunghe richiedono più tempo e la trascrizione non è precisa al 100%. A fine operazione il testo viene salvato nella nota del segnalibro, pronto per essere corretto o condiviso.';

  @override
  String get transcriptionUseEbookText =>
      'Usa il testo esatto dell\'ebook quando è possibile abbinarlo';

  @override
  String get lyricsMode => 'Trascrizione in tempo reale';

  @override
  String get lyricsListeningAhead => 'Ascolto in anticipo...';

  @override
  String get lyricsDisplaySection => 'Trascrizione in tempo reale';

  @override
  String get lyricsFontSize => 'Dimensione delle righe';

  @override
  String get lyricsMaxLines => 'Righe mostrate';

  @override
  String get lyricsFullCover => 'Usa tutta la copertina';

  @override
  String get lyricsFullCoverHint =>
      'Mostra la trascrizione al posto dell\'immagine mentre è attiva, con tutte le righe che ci stanno.';

  @override
  String get lyricsBatteryInfo =>
      'La trascrizione in tempo reale e la lettura sincronizzata usano più batteria e più risorse mentre sono attive. Sui telefoni con processori più lenti le righe possono comparire con più ritardo.';

  @override
  String get lyricsClearCache => 'Svuota la cache delle trascrizioni';

  @override
  String lyricsClearCacheHint(String size) {
    return '$size di righe di trascrizione salvate. Libri ed episodi cancellati vengono trascritti di nuovo mentre ascolti.';
  }

  @override
  String get lyricsClearCacheConfirm =>
      'Eliminare le trascrizioni salvate di ogni libro ed episodio? Vengono ricreate automaticamente mentre ascolti.';

  @override
  String get lyricsCacheCleared => 'Cache delle trascrizioni svuotata';

  @override
  String get lyricsIntroBody =>
      'Ascolta un po\' in anticipo la voce narrante e mostra ogni riga mentre viene pronunciata, trascritta sul tuo telefono: nulla lascia il dispositivo. Dopo averla attivata, aspetta qualche secondo prima di premere play mentre prende vantaggio. La trascrizione compare quando il vantaggio è pronto, e partire in pausa garantisce la resa più fluida. Usa più batteria e più risorse mentre è attiva.';

  @override
  String lyricsBuildingLead(String percent) {
    return 'Presa di vantaggio sulla narrazione... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return 'Impossibile trascrivere alla velocità con cui ascolti a $speed';
  }

  @override
  String get lyricsTurnOn => 'Attiva';

  @override
  String get readAlong => 'Lettura sincronizzata';

  @override
  String get readAlongNeedsPlaying =>
      'Prima riproduci l\'audiolibro di questo libro';

  @override
  String get narrationListen => 'Ascolta';

  @override
  String get narrationPlayFromHere => 'Riproduci da qui';

  @override
  String get narrationPreparing => 'Preparazione della narrazione';

  @override
  String get narrationNone =>
      'Questo ebook non ha una narrazione da riprodurre';

  @override
  String get narrationDownloadTitle => 'Scarica per ascoltare';

  @override
  String get narrationDownloadBody =>
      'Questo libro è un EPUB3 che si legge da solo ad alta voce. Audiobookshelf non può trasmettere in streaming la sua narrazione, quindi l\'audio va scaricato prima della riproduzione.';

  @override
  String get narrationDownloadStarted =>
      'Download della narrazione in corso. Tocca Absorb al termine.';

  @override
  String get narrationTextBody =>
      'L\'EPUB di questo libro ha le proprie parole per ogni momento dell\'audio, quindi il testo viene copiato direttamente dal libro. Scegli quanto aggiungere alla nota del segnalibro.';

  @override
  String get narrationTextLoading => 'Recupero delle parole dal libro';

  @override
  String get downloadToAbsorb => 'Scarica in Absorb';

  @override
  String get narrationUpNextTitle => 'Scarica il prossimo';

  @override
  String narrationUpNextBody(String title) {
    return '$title è il prossimo nella tua coda. È un EPUB3 che si legge da solo ad alta voce, quindi va scaricato prima di poterlo riprodurre.';
  }

  @override
  String narrationQueueStopped(String title) {
    return 'Fermato prima di $title. Scaricalo per continuare.';
  }

  @override
  String get transcriptionNeedsDownload =>
      'Serve l\'audio sul tuo telefono. Scaricarlo ora?';

  @override
  String get transcriptionDownloadStarted =>
      'Download in corso. Riattivalo al termine';

  @override
  String get readAlongFollow => 'La lettura sincronizzata segue';

  @override
  String get syncReadingListening => 'Mantieni sincronizzati lettura e ascolto';

  @override
  String get syncReadingListeningHint =>
      'Per i libri con audiolibro ed ebook. Quando smetti di ascoltare, l\'ebook passa al punto in cui ti sei fermato. Quando esci dal lettore, l\'audiolibro passa alla tua pagina. Si sposta solo in avanti.';

  @override
  String get syncEbookMoved =>
      'Ebook spostato al punto in cui hai smesso di ascoltare';

  @override
  String get syncAudioMoved =>
      'Audiolibro spostato al punto in cui hai smesso di leggere';

  @override
  String get syncAudioOffer =>
      'Tocca per andare al punto in cui hai smesso di leggere';

  @override
  String get syncFindingAudio => 'Ricerca della tua pagina nell\'audiolibro';

  @override
  String get syncFindingEbook => 'Ricerca del tuo punto nell\'ebook';

  @override
  String get syncFailed => 'Impossibile sincronizzare la tua posizione';

  @override
  String get syncAlreadyTogether => 'Già sincronizzato';

  @override
  String get syncPosition => 'Sincronizza posizione';

  @override
  String get readAlongFollowHint =>
      'I tempi delle parole sono calcolati tra i timestamp della trascrizione, quindi possono scostarsi leggermente all\'interno di una frase.';

  @override
  String get readAlongFollowWord => 'Parola';

  @override
  String get readAlongFollowSentence => 'Frase';

  @override
  String get readAlongColor => 'Colore della lettura sincronizzata';

  @override
  String get readAlongLost => 'Impossibile trovare la narrazione sulla pagina';

  @override
  String get readAlongBackToNarration => 'Torna alla narrazione';

  @override
  String get findInEbook => 'Trova nell\'ebook';

  @override
  String get findInEbookSearching => 'Ricerca di questo punto nell\'ebook...';

  @override
  String get findInEbookNotFound =>
      'Impossibile trovare questo punto nell\'ebook.';

  @override
  String get findInEbookNeedsEpub =>
      'Trova nell\'ebook richiede un ebook EPUB.';

  @override
  String get findInEbookNoEbook => 'Questo libro non ha un ebook.';

  @override
  String get findInAudiobook => 'Trova nell\'audiolibro';

  @override
  String get findInAudiobookSearching =>
      'Ricerca di questo punto nell\'audiolibro...';

  @override
  String get findInAudiobookStillSearching =>
      'Ricerca di questo punto nell\'audio ancora in corso...';

  @override
  String get findInAudiobookSearchingLong =>
      'Capitolo lungo, ricerca ancora in corso. Può richiedere un paio di minuti...';

  @override
  String get findInAudiobookNotFound =>
      'Impossibile trovare questo punto nell\'audiolibro.';

  @override
  String get transcriptionWhisperInfo =>
      'La trascrizione si basa su Whisper, un modello aperto di riconoscimento vocale che ascolta la narrazione e scrive le parole, il tutto su questo dispositivo.';

  @override
  String get transcriptionWhisperLearnMore => 'Scopri di più su Whisper';

  @override
  String get findInAudiobookIntroBody =>
      'Ascolta l\'audiolibro vicino al punto in cui stai leggendo e lo abbina a questo passaggio, tutto sul tuo dispositivo. Può richiedere fino a un minuto. Se il punto non si può abbinare con sicurezza, non si sposta nulla.';

  @override
  String get findInAudiobookAfterLabel => 'Quando il punto viene trovato';

  @override
  String get findInAudiobookStay => 'Continua a leggere';

  @override
  String get findInAudiobookGoPlayer => 'Apri il player';

  @override
  String get findInAudiobookPlaying =>
      'Riproduzione di questo passaggio nell\'audiolibro';

  @override
  String get catchUpAudioAhead =>
      'L\'audiolibro è più avanti. Tocca per andarci.';

  @override
  String get catchUpPageAhead =>
      'Questa pagina è più avanti dell\'audiolibro. Tocca per portare l\'audiolibro qui.';

  @override
  String get readerShortcutButton => 'Pulsante di scelta rapida';

  @override
  String get keepScreenOn => 'Mantieni lo schermo acceso';

  @override
  String get keepScreenOnActive => 'Lo schermo resta acceso';

  @override
  String get keepScreenOnUntilClosed =>
      'Lo schermo resta acceso finché non chiudi l\'app';

  @override
  String get keepScreenOnOff => 'Lo schermo può spegnersi di nuovo';

  @override
  String get keepScreenOnOffUntilRestart =>
      'Disattivato fino al riavvio dell\'app. L\'interruttore nelle Impostazioni resta attivo';

  @override
  String get keepScreenOnPlayer => 'Mantieni lo schermo acceso nel player';

  @override
  String get keepScreenOnPlayerSubtitle =>
      'Lo schermo resta acceso mentre il player è aperto';

  @override
  String get keepScreenOnCarMode =>
      'Mantieni lo schermo acceso in modalità auto';

  @override
  String get keepScreenOnCarModeSubtitle =>
      'Lo schermo resta acceso mentre la modalità auto è aperta';

  @override
  String get loginServerType => 'Tipo di server';

  @override
  String get authBookOrbitDefaultPassword =>
      'Questo account ha ancora la password predefinita. Cambiala in BookOrbit, poi accedi di nuovo.';

  @override
  String get authBookOrbitPasswordOff =>
      'L\'accesso con password è disattivato su questo server. Accedi con un magic link o con il single sign-on.';

  @override
  String get authServerIsBookOrbit =>
      'Questo è un server BookOrbit. Scegli BookOrbit sopra l\'indirizzo del server.';

  @override
  String get authServerIsAudiobookshelf =>
      'Questo è un server Audiobookshelf. Scegli Audiobookshelf sopra l\'indirizzo del server.';

  @override
  String get castNotAvailableBookOrbit =>
      'Il casting non è disponibile con i server BookOrbit';

  @override
  String get loginMagicLink => 'Magic link';

  @override
  String get loginMagicLinkDescription =>
      'Accedi con un magic link di BookOrbit, oppure incolla un link per la password per impostare la tua password.';

  @override
  String get collectionPublicTitle => 'Pubblica';

  @override
  String get collectionPublicSubtitle =>
      'Tutti su questo server possono vedere questa raccolta';

  @override
  String loginSignInWithProvider(String provider) {
    return 'Accedi con $provider';
  }

  @override
  String get loginSignInWithSso => 'Accedi con SSO';

  @override
  String get loginChooseSsoProvider => 'Scegli come accedere';

  @override
  String get loginRedirectUriBookOrbit =>
      'URI di reindirizzamento: bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => 'Stato di lettura';

  @override
  String get readStatusHint =>
      'BookOrbit mantiene lo stato che scegli qui finché non lo cambi.';

  @override
  String get readStatusUnread => 'Non letto';

  @override
  String get readStatusWantToRead => 'Da leggere';

  @override
  String get readStatusReading => 'In lettura';

  @override
  String get readStatusOnHold => 'In sospeso';

  @override
  String get readStatusRereading => 'In rilettura';

  @override
  String get readStatusRead => 'Letto';

  @override
  String get readStatusSkimmed => 'Sfogliato';

  @override
  String get readStatusAbandoned => 'Abbandonato';

  @override
  String get personalNoteTitle => 'La tua nota';

  @override
  String get personalNoteAdd => 'Aggiungi una nota privata';

  @override
  String get personalNoteHint => 'Solo tu puoi vedere questa nota.';

  @override
  String get moreLikeThis => 'Altri simili';

  @override
  String get coverSlotAudiobook => 'Copertina dell\'audiolibro';

  @override
  String get coverSlotBook => 'Copertina del libro';

  @override
  String get cardButtonFill => 'Sfondo dei pulsanti';

  @override
  String get cardButtonFillSubtitle =>
      'Come sono riempiti i pulsanti sulla scheda del player';

  @override
  String get cardButtonFillClear => 'Trasparente';

  @override
  String get cardButtonFillSubtle => 'Tenue';

  @override
  String get cardButtonFillSolid => 'Pieno';

  @override
  String get loginBookOrbitPreview =>
      'Il supporto a BookOrbit è nuovo. Riproduzione, download e navigazione funzionano, ma alcune schermate potrebbero ancora sembrare o comportarsi come Audiobookshelf. Segui l\'avanzamento su GitHub e segnalaci se qualcosa non va.';

  @override
  String get signedOutTapToSignIn =>
      'Disconnesso. Tocca per accedere di nuovo.';

  @override
  String get authSignedOutKeepListening =>
      'Sei stato disconnesso. I download si riproducono ancora. Tocca la nuvola rossa per accedere di nuovo.';

  @override
  String signedOutSyncNote(String username, String server) {
    return 'Ciò che ascolti da disconnesso resta su questo telefono e si sincronizza quando accedi di nuovo come $username su $server. Va bene qualsiasi modo di accedere a quell\'account.';
  }

  @override
  String get comicReadingDirection => 'Direzione di lettura';

  @override
  String comicPageNumber(int page) {
    return 'Pagina $page';
  }

  @override
  String get comicBookmarkRemoveFailed =>
      'Impossibile rimuovere il segnalibro dal server. Riprova quando sei online.';

  @override
  String get comicLeftToRight => 'Da sinistra a destra';

  @override
  String get comicRightToLeft => 'Da destra a sinistra (manga)';

  @override
  String get comicNeedsConnection =>
      'Questo fumetto si apre pagina per pagina dal tuo server, quindi serve una connessione.';

  @override
  String get comicNoPages => 'Nessuna pagina trovata in questo fumetto.';

  @override
  String get boAdminTitle => 'Amministrazione del server';

  @override
  String get boAdminSubtitle => 'Utenti e librerie di questo server BookOrbit';

  @override
  String get boAdminUsers => 'Utenti';

  @override
  String get boAdminLibraries => 'Librerie';

  @override
  String boAdminUserCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count persone',
      one: '1 persona',
    );
    return '$_temp0';
  }

  @override
  String boAdminLibraryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count librerie',
      one: '1 libreria',
    );
    return '$_temp0';
  }

  @override
  String get boAdminSaved => 'Salvato';

  @override
  String get boAdminFailed => 'Non ha funzionato. Riprova.';

  @override
  String get boAdminOffline => 'Impossibile raggiungere il server.';

  @override
  String get boUsersSearch => 'Cerca utenti';

  @override
  String get boUsersNone => 'Nessun utente qui';

  @override
  String get boUsersFilterAll => 'Tutti';

  @override
  String get boUsersFilterAdmins => 'Amministratori';

  @override
  String get boUsersFilterActive => 'Attivi';

  @override
  String get boUsersFilterInactive => 'Inattivi';

  @override
  String get boUsersFilterAttention => 'Richiedono attenzione';

  @override
  String get boUserBadgeAdmin => 'Admin';

  @override
  String get boUserBadgeInactive => 'Inattivo';

  @override
  String get boUserBadgeLocked => 'Bloccato';

  @override
  String get boUserBadgeNoPassword => 'Ancora nessuna password';

  @override
  String boUserLastActive(String date) {
    return 'Ultima attività $date';
  }

  @override
  String get boUserNeverSignedIn => 'Non ha mai effettuato l\'accesso';

  @override
  String get boUserNew => 'Nuovo utente';

  @override
  String get boUserCreate => 'Crea';

  @override
  String get boUserUsername => 'Nome utente';

  @override
  String get boUserUsernameHint =>
      'Almeno 3 caratteri. Non si può cambiare in seguito.';

  @override
  String get boUserName => 'Nome';

  @override
  String get boUserEmail => 'Email';

  @override
  String get boUserEmailInvalid => 'Inserisci un indirizzo email valido';

  @override
  String get boUserActive => 'Attivo';

  @override
  String get boUserActiveSubtitle => 'Gli utenti inattivi non possono accedere';

  @override
  String get boUserAdmin => 'Amministratore';

  @override
  String get boUserAdminSubtitle => 'Accesso completo a tutto sul server';

  @override
  String get boUserAdminHasAll =>
      'Gli amministratori hanno tutti i permessi e vedono tutte le librerie.';

  @override
  String get boUserPermissions => 'Permessi';

  @override
  String get boUserPresetNone => 'Nessuno';

  @override
  String get boUserPresetStandard => 'Standard';

  @override
  String get boUserPresetEverything => 'Tutti';

  @override
  String get boUserLibraries => 'Librerie';

  @override
  String get boUserLibrariesHint =>
      'Le librerie che questa persona può vedere.';

  @override
  String get boUserPasswordLink => 'Invia link per la password';

  @override
  String get boUserPasswordLinkSubtitle =>
      'Un link per impostare una nuova password, valido per 15 minuti';

  @override
  String get boUserExternal =>
      'Accede tramite single sign-on, quindi la password è gestita lì.';

  @override
  String get boUserUnlock => 'Sblocca account';

  @override
  String get boUserUnlocked => 'Account sbloccato';

  @override
  String get boUserDelete => 'Elimina utente';

  @override
  String boUserDeleteTitle(String name) {
    return 'Eliminare $name?';
  }

  @override
  String get boUserDeleteBody =>
      'Il suo account e tutto ciò che ha su questo server vengono rimossi. Non si può annullare.';

  @override
  String get boUserDeleted => 'Utente eliminato';

  @override
  String get boUserLinkTitle => 'Link per la password';

  @override
  String boUserLinkBody(String name) {
    return 'Condividi questo link con $name. Gli permette di impostare una password e funziona per 15 minuti.';
  }

  @override
  String get boPasswordRules =>
      'Almeno 8 caratteri, con una lettera maiuscola, una minuscola e un numero.';

  @override
  String get boSetPasswordTitle => 'Imposta la tua password';

  @override
  String get boSetPasswordSubmit => 'Imposta password e accedi';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return 'Scegli una password per $username su $server.';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return 'Scegli una password per il tuo account su $server.';
  }

  @override
  String get boSetPasswordStartingBody =>
      'Questo account ha ancora la password con cui è stato creato. Scegline una nuova per completare l\'accesso.';

  @override
  String get boSetPasswordTrust =>
      'Continua solo se ti fidi di chi ti ha inviato questo link.';

  @override
  String get boPasswordLinkExpired =>
      'Questo link è scaduto o è già stato usato. Chiedi un nuovo link all\'amministratore del server.';

  @override
  String boPasswordSetSignInFailed(String error) {
    return 'La password è impostata, ma l\'accesso non è riuscito: $error';
  }

  @override
  String get boChangePasswordSubtitle =>
      'Aggiorna la tua password di BookOrbit';

  @override
  String get boPasswordChangeEffect =>
      'Cambiando la password, le tue altre sessioni BookOrbit vengono disconnesse. Questo dispositivo resta connesso.';

  @override
  String get boPasswordChanged =>
      'Password cambiata. Gli altri dispositivi connessi sono stati disconnessi.';

  @override
  String boPasswordShareDescription(String username) {
    return 'Invia questo link o fai scansionare il codice QR a $username per scegliere una password e accedere ad Absorb. Funziona per 15 minuti.';
  }

  @override
  String boPasswordShareWarning(String username) {
    return 'Chiunque abbia questo link può scegliere la password di $username finché non viene usato o scade.';
  }

  @override
  String get setupLinkCopyWebLink => 'Copia link web';

  @override
  String get boUserLinkCopy => 'Copia link';

  @override
  String get boUserLinkCopied => 'Link copiato';

  @override
  String get boUserLinkShare => 'Condividi';

  @override
  String get boUserNoLink =>
      'L\'utente è stato aggiunto, ma il server non ha inviato un link per la password. Inviane uno dalla sua pagina.';

  @override
  String get boPermGroupLibrary => 'Libreria e libri';

  @override
  String get boPermGroupRequests => 'Richieste di libri';

  @override
  String get boPermGroupDevices => 'Dispositivi';

  @override
  String get boPermGroupIntegrations => 'Integrazioni di lettura';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => 'Email e notifiche';

  @override
  String get boPermGroupAdmin => 'Amministrazione';

  @override
  String get boPermLibraryDownload => 'Scaricare libri';

  @override
  String get boPermLibraryUpload => 'Caricare libri';

  @override
  String get boPermLibraryEditMetadata => 'Modificare i metadati';

  @override
  String get boPermLibraryDeleteBooks => 'Eliminare libri';

  @override
  String get boPermBookRequestAccess => 'Richiedere libri';

  @override
  String get boPermBookRequestAutoApprove =>
      'Richieste approvate automaticamente';

  @override
  String get boPermBookRequestSelfFulfill =>
      'Scaricare direttamente i libri richiesti';

  @override
  String get boPermManageBookRequests => 'Gestire le richieste di libri';

  @override
  String get boPermKoboSync => 'Sincronizzazione Kobo';

  @override
  String get boPermKoreaderSync => 'Sincronizzazione KOReader';

  @override
  String get boPermOpdsAccess => 'Accesso OPDS';

  @override
  String get boPermHardcoverSync => 'Sincronizzazione Hardcover';

  @override
  String get boPermReadwiseSync => 'Sincronizzazione Readwise';

  @override
  String get boPermStorygraphSync => 'Sincronizzazione StoryGraph';

  @override
  String get boPermBookDockAccess => 'Usare il Book Dock';

  @override
  String get boPermManageBookDock => 'Gestire il Book Dock';

  @override
  String get boPermEmailSend => 'Inviare libri per email';

  @override
  String get boPermNotificationAccess => 'Notifiche';

  @override
  String get boPermManageEmail => 'Gestire le email';

  @override
  String get boPermManageLibraries => 'Gestire le librerie';

  @override
  String get boPermManageMetadataConfig => 'Impostazioni dei metadati';

  @override
  String get boPermManageIcons => 'Gestire le icone';

  @override
  String get boPermManageUsers => 'Gestire gli utenti';

  @override
  String get boPermViewUserActivity => 'Vedere l\'attività degli utenti';

  @override
  String get boPermViewAuditLog => 'Vedere il registro di controllo';

  @override
  String get boPermManageAppSettings => 'Impostazioni dell\'app';

  @override
  String get boLibsNone => 'Ancora nessuna libreria';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => 'Scansiona ora';

  @override
  String get boLibScanStarted => 'Scansione avviata';

  @override
  String get boLibScanning => 'Scansione in corso';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return 'Scansionata $date: $added aggiunti, $updated aggiornati, $missing mancanti';
  }

  @override
  String get boLibScanFailed => 'L\'ultima scansione non è riuscita';

  @override
  String get boLibNeverScanned => 'Non ancora scansionata';

  @override
  String get boLibNew => 'Nuova libreria';

  @override
  String get boLibName => 'Nome';

  @override
  String get boLibNeedName => 'Dai un nome alla libreria';

  @override
  String get boLibIcon => 'Icona';

  @override
  String get boLibFolders => 'Cartelle';

  @override
  String get boLibFoldersHint =>
      'Cartelle sul server in cui si trovano i libri di questa libreria.';

  @override
  String get boLibNeedFolder => 'Aggiungi almeno una cartella';

  @override
  String get boLibAddFolder => 'Aggiungi cartella';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '1 file',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return 'Già in $library';
  }

  @override
  String get boLibFolderUnreadable =>
      'Il server non riesce a leggere questa cartella';

  @override
  String get boLibFolderRescan =>
      'Modificando le cartelle la libreria viene scansionata di nuovo.';

  @override
  String get boLibOrganization => 'I libri sono archiviati come';

  @override
  String get boLibPerFolder => 'Un libro per cartella';

  @override
  String get boLibPerFile => 'Un libro per file';

  @override
  String get boLibOrganizationFixed =>
      'Non si può modificare dopo aver creato la libreria.';

  @override
  String get boLibWatch => 'Monitora le modifiche';

  @override
  String get boLibWatchSubtitle =>
      'Rileva file nuovi e modificati non appena compaiono';

  @override
  String get boLibSchedule => 'Scansione pianificata';

  @override
  String get boLibScheduleOff => 'Disattivata';

  @override
  String get boLibScheduleDaily => 'Ogni giorno';

  @override
  String get boLibScheduleWeekly => 'Ogni settimana';

  @override
  String boLibScheduleCustom(String cron) {
    return 'Personalizzata ($cron)';
  }

  @override
  String get boLibScheduleHint => 'Viene eseguita alle 3:00, ora del server.';

  @override
  String get boLibCovers => 'Forma delle copertine';

  @override
  String get boLibCoverBook => 'Libro (2:3)';

  @override
  String get boLibCoverSquare => 'Quadrata (1:1)';

  @override
  String get boLibAccess => 'Chi può vederla';

  @override
  String get boLibAccessHint =>
      'Gli amministratori vedono tutte le librerie. Gli altri hanno bisogno dell\'accesso qui.';

  @override
  String get boLibAccessNone => 'Per ora solo gli amministratori';

  @override
  String get boLibAccessAdd => 'Aggiungi persona';

  @override
  String get boLibAccessEveryoneHas => 'Tutti hanno già accesso';

  @override
  String get boLibLevelViewer => 'Lettore';

  @override
  String get boLibLevelEditor => 'Editor';

  @override
  String get boLibLevelOwner => 'Proprietario';

  @override
  String get boLibAccessRemove => 'Rimuovi accesso';

  @override
  String get boLibDelete => 'Elimina libreria';

  @override
  String boLibDeleteTitle(String name) {
    return 'Eliminare $name?';
  }

  @override
  String get boLibDeleteBody =>
      'La libreria viene rimossa da BookOrbit, insieme ai progressi e alle evidenziazioni dei suoi libri. I file sul server restano dove sono.';

  @override
  String get boLibDeleted => 'Libreria eliminata';

  @override
  String get boFolderPickTitle => 'Scegli una cartella';

  @override
  String get boFolderUseThis => 'Usa questa cartella';

  @override
  String get boFolderEmpty => 'Nessuna cartella all\'interno';

  @override
  String get statsTotalTime => 'TEMPO TOTALE';

  @override
  String get statsTotalReadingTime => 'TEMPO TOTALE DI LETTURA';

  @override
  String statsDaysOfTime(String days) {
    return 'Sono $days giorni';
  }

  @override
  String statsHoursOfTime(String hours) {
    return 'Sono $hours ore';
  }

  @override
  String get statsMediaAll => 'Tutto';

  @override
  String get statsMediaListening => 'Ascolto';

  @override
  String get statsMediaReading => 'Lettura';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'BookOrbit conta i tuoi giorni nel fuso orario $server, ma questo telefono è impostato su $phone. Le ore tarde della giornata possono finire nel giorno sbagliato.';
  }

  @override
  String statsZoneUse(String zone) {
    return 'Usa $zone';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'BookOrbit ora usa $zone. I giorni precedenti possono impiegare qualche minuto per aggiornarsi.';
  }

  @override
  String get statsZoneFailed =>
      'Impossibile cambiare il fuso orario su BookOrbit';

  @override
  String get statsTimeOfDay => 'Ora del giorno';

  @override
  String statsBusiestAround(String time) {
    return 'Più attivo intorno alle $time';
  }

  @override
  String get statsFinishedByMonth => 'Libri completati per mese';

  @override
  String statsFinishedLast12(int count) {
    return '$count negli ultimi 12 mesi';
  }

  @override
  String get statsWhereTitle => 'Dove ascolti e leggi';

  @override
  String get statsLast12Months => 'Ultimi 12 mesi';

  @override
  String get statsHabits => 'Abitudini';

  @override
  String get statsTypicalSession => 'Sessione tipica';

  @override
  String get statsProgressPerSession => 'Progressi per sessione';

  @override
  String get statsTimeToFinish => 'Tempo per completare';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni',
      one: '1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => 'Libri iniziati';

  @override
  String get statsBooksInProgress => 'In corso';

  @override
  String get statsAverageProgress => 'Progressi medi';

  @override
  String get statsTopBooks => 'Libri più ascoltati';

  @override
  String get statsYearRead => 'Letti';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count non lette',
      one: '1 non letta',
      zero: 'Nessuna novità',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => 'Segna tutte come lette';

  @override
  String get boNotificationsClearAll => 'Cancella tutte';

  @override
  String get boNotificationsClearTitle => 'Cancellare tutte le notifiche?';

  @override
  String get boNotificationsClearBody =>
      'Verranno rimosse tutte le notifiche dal tuo account BookOrbit.';

  @override
  String get boNotificationsEmpty => 'Ancora nessuna notifica';

  @override
  String get boNotificationsLoadFailed => 'Impossibile caricare le notifiche';

  @override
  String get boNotificationsUpdateFailed =>
      'Impossibile aggiornare le notifiche su BookOrbit';

  @override
  String boNotificationsOccurrences(int count) {
    return 'Accaduto $count volte';
  }

  @override
  String get boNotificationsSettings => 'Impostazioni notifiche';

  @override
  String get boNotificationsSettingsIntro =>
      'Scegli quali notifiche conserva BookOrbit per te.';

  @override
  String get boNotificationsProblemsHint =>
      'Con Problemi ricevi una notifica solo quando qualcosa fallisce o richiede attenzione.';

  @override
  String get boNotificationLevelOff => 'Disattivate';

  @override
  String get boNotificationLevelProblems => 'Problemi';

  @override
  String get boNotificationLevelAll => 'Tutte';

  @override
  String get boNotificationsSaved => 'Impostazioni notifiche salvate';

  @override
  String get boNotificationsSaveFailed =>
      'Impossibile salvare le impostazioni delle notifiche';

  @override
  String get boNotificationGroupLibrary => 'Libreria';

  @override
  String get boNotificationGroupFiles => 'File';

  @override
  String get boNotificationGroupIntegrations => 'Integrazioni';

  @override
  String get boNotificationGroupPersonal => 'Personali';

  @override
  String get boNotifyScanning => 'Scansione della libreria';

  @override
  String get boNotifyScanningDesc =>
      'Quando una scansione della libreria termina, fallisce o trova libri mancanti.';

  @override
  String get boNotifyMetadata => 'Recupero dei metadati';

  @override
  String get boNotifyMetadataDesc =>
      'Quando la ricerca dei metadati per i tuoi libri termina o fallisce.';

  @override
  String get boNotifyAuthorEnrichment => 'Dettagli degli autori';

  @override
  String get boNotifyAuthorEnrichmentDesc =>
      'Quando finisce il download di biografie e foto degli autori.';

  @override
  String get boNotifyFileWriteBack => 'Salvataggio nei file';

  @override
  String get boNotifyFileWriteBackDesc =>
      'Quando i dettagli modificati vengono salvati nei file dei libri su disco.';

  @override
  String get boNotifyFileRename => 'Rinomina dei file';

  @override
  String get boNotifyFileRenameDesc =>
      'Quando un file di un libro viene rinominato secondo il tuo schema di denominazione.';

  @override
  String get boNotifyBulkRename => 'Rinomina multipla';

  @override
  String get boNotifyBulkRenameDesc =>
      'Quando la rinomina di molti libri, o lo spostamento di libri tra librerie, termina o fallisce.';

  @override
  String get boNotifyMigration => 'Importazioni';

  @override
  String get boNotifyMigrationDesc =>
      'Quando un\'importazione da un\'altra app di libreria termina o fallisce.';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc =>
      'Quando Book Dock finisce di aggiungere libri o incontra problemi.';

  @override
  String get boNotifyBookRequests => 'Richieste di libri';

  @override
  String get boNotifyBookRequestsDesc =>
      'Quando una richiesta di libro viene inviata o decisa, o il libro diventa disponibile.';

  @override
  String get boNotifyEmail => 'Invio email';

  @override
  String get boNotifyEmailDesc =>
      'Quando l\'invio di un libro per email riesce o fallisce.';

  @override
  String get boNotifyAchievements => 'Traguardi';

  @override
  String get boNotifyAchievementsDesc => 'Quando sblocchi un nuovo traguardo.';

  @override
  String get achievementsTitle => 'Traguardi';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return '$earned di $total ottenuti';
  }

  @override
  String get achievementsFilterAll => 'Tutti';

  @override
  String get achievementsFilterEarned => 'Ottenuti';

  @override
  String get achievementsFilterInProgress => 'In corso';

  @override
  String get achievementsFilterLocked => 'Bloccati';

  @override
  String get achievementsCategoryReading => 'Lettura';

  @override
  String get achievementsCategoryLibrary => 'Libreria';

  @override
  String get achievementsCategoryExploration => 'Esplorazione';

  @override
  String get achievementsCategoryDedication => 'Dedizione';

  @override
  String get achievementsCategoryDevices => 'Dispositivi';

  @override
  String get achievementsRarityCommon => 'Comune';

  @override
  String get achievementsRarityRare => 'Raro';

  @override
  String get achievementsRarityEpic => 'Epico';

  @override
  String get achievementsRarityLegendary => 'Leggendario';

  @override
  String get achievementsLoadFailed => 'Impossibile caricare i traguardi';

  @override
  String get achievementsNoneMatch =>
      'Nessun traguardo corrisponde a questo filtro';

  @override
  String get achievementsSecretName => 'Traguardo segreto';

  @override
  String get achievementsSecretHint => 'Continua a leggere per scoprirlo.';

  @override
  String achievementsEarnedOn(String date) {
    return 'Ottenuto il $date';
  }

  @override
  String achievementsWhileReading(String title) {
    return 'Leggendo $title';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return 'Livello $earned di $total';
  }

  @override
  String get achievementsTiers => 'Livelli';

  @override
  String get achievementsAllTiers => 'Tutti i livelli ottenuti';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold libri';
  }

  @override
  String achievementsProgressPages(String current, String threshold) {
    return '$current / $threshold pagine';
  }

  @override
  String achievementsProgressHours(String current, String threshold) {
    return '$current / $threshold ore';
  }

  @override
  String achievementsProgressAnnotations(String current, String threshold) {
    return '$current / $threshold evidenziazioni e note';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold valutazioni';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $threshold generi';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold lingue';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold giorni';
  }

  @override
  String get achievementsHowToGetIt => 'Come ottenerlo';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hai letto $count ore negli ultimi $days giorni.',
      one: 'Hai letto 1 ora negli ultimi $days giorni.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Circa $count giorni a questo ritmo.',
      one: 'Circa 1 giorno a questo ritmo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Circa $count settimane a questo ritmo.',
      one: 'Circa 1 settimana a questo ritmo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Circa $count mesi a questo ritmo.',
      one: 'Circa 1 mese a questo ritmo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri degli anni $decade ti aspettano sugli scaffali.',
      one: '1 libro degli anni $decade ti aspetta sugli scaffali.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri del $century ti aspettano sugli scaffali.',
      one: '1 libro del $century ti aspetta sugli scaffali.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return '$title è letto al $percent ed è stato iniziato il $date.';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return '$title è stato iniziato il $date.';
  }

  @override
  String get achievementsHintUntitledBook => 'Un libro in corso';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri in corso hanno superato il $percent.',
      one: '1 libro in corso ha superato il $percent.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count libri che hai completato non hanno ancora una valutazione.',
      one: '1 libro che hai completato non ha ancora una valutazione.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri sotto le $pages pagine ti aspettano sugli scaffali.',
      one: '1 libro sotto le $pages pagine ti aspetta sugli scaffali.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sono già in corso.',
      one: '1 è già in corso.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri di $pages pagine o più ti aspettano sugli scaffali.',
      one: '1 libro di $pages pagine o più ti aspetta sugli scaffali.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count libri pubblicati prima del $year ti aspettano sugli scaffali.',
      one: '1 libro pubblicato prima del $year ti aspetta sugli scaffali.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author: $finished completati, altri $count sugli scaffali.';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri in $language ti aspettano sugli scaffali.',
      one: '1 libro in $language ti aspetta sugli scaffali.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Finora hai letto in $count mesi del $year.',
      one: 'Finora hai letto in 1 mese del $year.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Restano $months.',
      one: 'Resta $months.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return 'Nessun libro sui tuoi scaffali ha ancora $pages pagine o più.';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return 'Niente sui tuoi scaffali è stato pubblicato prima del $year.';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Finora i tuoi scaffali coprono solo $count decenni.',
      one: 'Finora i tuoi scaffali coprono solo 1 decennio.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Finora i tuoi scaffali coprono solo $count secoli.',
      one: 'Finora i tuoi scaffali coprono solo 1 secolo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return 'Non hai letto a $month, quindi $year è fuori portata. Il conteggio riparte a gennaio.';
  }

  @override
  String get achievementsSwitch => 'Traguardi';

  @override
  String get achievementsSwitchSubtitle =>
      'Tieni traccia dei traguardi su BookOrbit. Disattivandoli, vengono nascosti qui e sul web.';

  @override
  String get achievementsTurnedOn => 'Traguardi attivati';

  @override
  String get achievementsTurnedOff => 'Traguardi disattivati';

  @override
  String get achievementsSwitchFailed =>
      'Impossibile modificare i traguardi su BookOrbit';

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
  String get recentSearchesTitle => 'Ricerche recenti';

  @override
  String get recentSearchesClear => 'Cancella';

  @override
  String get recentSearchesRemove => 'Rimuovi';

  @override
  String get removedSeriesTapToUndo =>
      'Rimosso da Continua la serie. Tocca per annullare.';

  @override
  String get seriesBackOnContinueSeries => 'Di nuovo in Continua la serie';

  @override
  String get desktopShortcutPlayPause => 'Riproduci / pausa';

  @override
  String get desktopShortcutRewind => 'Riavvolgi';

  @override
  String get desktopShortcutForward => 'Avanti veloce';

  @override
  String get desktopShortcutSlower => 'Riduci la velocità di riproduzione';

  @override
  String get desktopShortcutFaster => 'Aumenta la velocità di riproduzione';

  @override
  String get desktopShortcutNormalSpeed =>
      'Ripristina la velocità di riproduzione';

  @override
  String get desktopShortcutSearch => 'Apri la ricerca';

  @override
  String get desktopShortcutLibrary => 'Apri la libreria';

  @override
  String get desktopShortcutNowPlaying => 'Apri In riproduzione';

  @override
  String get desktopShortcutFullScreen => 'Schermo intero';

  @override
  String get desktopShortcutClosePlayer => 'Chiudi il player a schermo intero';

  @override
  String get desktopShortcutBack =>
      'Indietro (chiude la pagina o il pannello in primo piano)';

  @override
  String get desktopShortcutRefresh => 'Aggiorna l\'elenco sullo schermo';

  @override
  String get desktopShortcutPreviousCard => 'Scheda Absorbing precedente';

  @override
  String get desktopShortcutNextCard => 'Scheda Absorbing successiva';

  @override
  String get desktopShortcutContextMenu => 'Apri il menu del tocco prolungato';

  @override
  String get desktopShortcutMouseBack => 'Pulsante indietro del mouse';

  @override
  String get desktopShortcutRightClick => 'Clic destro';

  @override
  String get desktopShortcutDragShelves =>
      'Trascina scaffali e schede in orizzontale';

  @override
  String get desktopShortcutMouseDrag => 'Clic e trascina';

  @override
  String get fileHealthAction => 'Controlla i file';

  @override
  String get fileHealthTitle => 'Controlla i file';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tutti i $count file sembrano a posto',
      one: 'Il file sembra a posto',
      zero: 'Non sembra esserci nulla di sbagliato',
    );
    return '$_temp0';
  }

  @override
  String fileHealthProblems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count problemi trovati',
      one: '1 problema trovato',
    );
    return '$_temp0';
  }

  @override
  String get fileHealthReadOnlyNote =>
      'Legge solo ciò che il server già segnala. Non viene modificato nulla.';

  @override
  String get fileHealthLocalChecked =>
      'Sono stati controllati anche i file scaricati su questo dispositivo.';

  @override
  String get fileHealthItemMissing => 'Cartella del libro mancante';

  @override
  String get fileHealthItemMissingInfo =>
      'Il server non trova più la cartella di questo libro. Potrebbe essere stata spostata, rinominata o eliminata, oppure il suo disco è offline. Una scansione della libreria sul server può ritrovarla.';

  @override
  String get fileHealthItemInvalid => 'Libro contrassegnato come non valido';

  @override
  String get fileHealthItemInvalidInfo =>
      'Il server non ha trovato file audio o ebook utilizzabili per questo libro.';

  @override
  String get fileHealthInvalidFiles => 'File illeggibili';

  @override
  String get fileHealthInvalidFilesInfo =>
      'Il server non è riuscito a leggere questi file. Potrebbero essere danneggiati o in un formato non supportato, e la riproduzione può interrompersi o saltarli.';

  @override
  String get fileHealthEmptyFiles => 'File senza durata';

  @override
  String get fileHealthEmptyFilesInfo =>
      'Questi file indicano una durata pari a zero, quindi non c\'è nulla da riprodurre. Spesso sono vuoti o troncati.';

  @override
  String get fileHealthTrackGaps => 'Vuoti tra i file';

  @override
  String get fileHealthTrackGapsInfo =>
      'La cronologia del libro salta in avanti tra questi file, lasciando un tratto in cui non si riproduce nulla.';

  @override
  String get fileHealthTrackOverlaps => 'File sovrapposti';

  @override
  String get fileHealthTrackOverlapsInfo =>
      'Questi file si sovrappongono nella cronologia del libro, quindi una parte può essere saltata o la posizione può scattare.';

  @override
  String get fileHealthDurationMismatch => 'La durata non torna';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return 'I file sommano $actual, ma il libro dichiara una durata di $expected. Progressi e capitoli possono risultare sfalsati. Di solito una nuova scansione sul server risolve il problema.';
  }

  @override
  String get fileHealthLowBitrate => 'Audio di bassa qualità';

  @override
  String get fileHealthLowBitrateInfo =>
      'Questi file sono codificati sotto i 32 kbps e potrebbero suonare ovattati.';

  @override
  String get fileHealthMixedSampleRates => 'Frequenze di campionamento miste';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      'I file sono stati registrati a frequenze di campionamento diverse. La maggior parte dei player funziona comunque, ma alcuni possono produrre scatti o cambi di velocità dove finisce un file e inizia il successivo.';

  @override
  String get fileHealthMixedChannels => 'Mono e stereo misti';

  @override
  String get fileHealthMixedChannelsInfo =>
      'Alcuni file hanno un numero di canali diverso dagli altri, quindi il suono può cambiare da un file all\'altro.';

  @override
  String get fileHealthChaptersPastEnd => 'Capitoli oltre la fine';

  @override
  String get fileHealthChaptersPastEndInfo =>
      'Questi capitoli iniziano o finiscono dopo la fine dell\'audio, quindi saltare a essi può non portare da nessuna parte.';

  @override
  String get fileHealthLocalMissing => 'File scaricati mancanti';

  @override
  String get fileHealthLocalMissingInfo =>
      'Questi file scaricati non sono più presenti su questo dispositivo. La riproduzione offline non funzionerà dove dovrebbero trovarsi.';

  @override
  String get fileHealthLocalSizeMismatch => 'File scaricati diversi';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      'Questi file scaricati non hanno la stessa dimensione delle copie sul server, quindi potrebbero essere incompleti o danneggiati.';

  @override
  String fileHealthStartsAt(String time) {
    return 'inizia a $time';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return '$local qui, $server sul server';
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
  String get fileHealthRedownload => 'Scarica di nuovo questo libro';

  @override
  String get fileHealthRedownloadQuestion => 'Scaricare di nuovo questo libro?';

  @override
  String get fileHealthRedownloadInfo =>
      'La copia su questo dispositivo viene rimossa e scaricata di nuovo dal server. Se il libro è in riproduzione, si interrompe. Sul server non cambia nulla.';

  @override
  String get fileHealthNotAvailableOffline =>
      'Connettiti al server per scaricare di nuovo';

  @override
  String get playerReconnecting => 'Connessione persa, riconnessione…';

  @override
  String get playerReconnectFailed =>
      'Impossibile riconnettersi al server, quindi la riproduzione si è interrotta.';

  @override
  String get downloadsFailed => 'Download non riusciti';

  @override
  String get absorbingReorderQueue => 'Riordina coda';

  @override
  String get playAction => 'Riproduci';

  @override
  String get pauseAction => 'Pausa';

  @override
  String get rmabImportBooks => 'Importa libri';

  @override
  String get rmabImportBooksSubtitle =>
      'Cerca su ReadMeABook e scegli i libri da richiedere';

  @override
  String get rmabImportBooksConnectSubtitle =>
      'Prima connetti ReadMeABook con un URL e un token';

  @override
  String get windowsSettingsTitle => 'Impostazioni di Windows';

  @override
  String get updateCheckFrequency => 'Controllo automatico degli aggiornamenti';

  @override
  String get updateCheckFrequencySubtitle =>
      'Controlla solo la presenza di aggiornamenti; l\'installazione è sempre manuale.';

  @override
  String get updateCheckOnStartup => 'All\'avvio (una volta ogni 12 ore)';

  @override
  String get updateCheckEverySixHours => 'Ogni 6 ore';

  @override
  String get updateCheckEveryTwelveHours => 'Ogni 12 ore';

  @override
  String get updateCheckDaily => 'Ogni giorno';

  @override
  String get updateCheckNever => 'Mai automaticamente';

  @override
  String onLatestVersionDetail(String version) {
    return 'Hai l\'ultima versione ($version)';
  }

  @override
  String get updateCheckFailed =>
      'Impossibile raggiungere GitHub per cercare aggiornamenti. Controlla la connessione e riprova.';

  @override
  String get playlistDetailAddBooks => 'Aggiungi libri alla playlist';

  @override
  String get playlistDetailSwitchToList => 'Passa alla vista elenco';

  @override
  String get playlistDetailSwitchToGrid => 'Passa alla vista griglia';

  @override
  String get adminUploadIndexing =>
      'Caricamento completato; in attesa che Audiobookshelf indicizzi...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return 'Caricato \"$title\"; Audiobookshelf lo sta ancora indicizzando';
  }

  @override
  String get adminUploadPermissionDenied =>
      'Il tuo account Audiobookshelf non ha il permesso di caricare. Chiedi a un amministratore del server di abilitare il caricamento per il tuo account.';

  @override
  String get uiThemeLabel => 'Tema dell\'interfaccia';

  @override
  String get uiThemePickerTitle => 'Scegli uno stile';

  @override
  String get uiThemePickerIntro =>
      'Puoi cambiarlo in qualsiasi momento in Impostazioni > Aspetto > Tema dell\'interfaccia.';

  @override
  String get uiThemePlusName => 'Standard';

  @override
  String get uiThemePlusDescription =>
      'Il solito aspetto di Absorb Plus, con pannelli pieni e un morbido bagliore dai colori delle copertine.';

  @override
  String get uiThemeMidnightName => 'Mezzanotte';

  @override
  String get uiThemeMidnightDescription =>
      'Nero puro con contorni sottili e nessun bagliore, pensato per gli schermi OLED.';

  @override
  String get uiThemeContinue => 'Continua';

  @override
  String get uiThemeFrostedName => 'Smerigliato';

  @override
  String get uiThemeFrostedDescription =>
      'Pannelli morbidi in vetro smerigliato con i colori delle copertine che traspaiono.';

  @override
  String get uiThemeColorTitle => 'Scegli un colore';

  @override
  String get uiThemeColorIntro =>
      'È la stessa impostazione di Impostazioni > Aspetto > Origine del colore.';

  @override
  String get uiThemeColorFromCover => 'Dalla copertina';

  @override
  String get uiThemeBack => 'Indietro';

  @override
  String get uiThemeTryIt => 'Provalo';

  @override
  String uiThemePreviewing(String name) {
    return 'Anteprima di $name';
  }

  @override
  String get uiThemeKeep => 'Mantieni';

  @override
  String get uiThemeGoBack => 'Torna indietro';

  @override
  String get uiThemeGlass => 'Vetro';

  @override
  String get uiThemeGlassLight => 'Leggero';

  @override
  String get uiThemeGlassMedium => 'Medio';

  @override
  String get uiThemeGlassStrong => 'Intenso';

  @override
  String get uiThemeDetails => 'Dettagli dell\'aspetto';

  @override
  String get uiThemeFullCovers => 'Copertine a piena qualità';

  @override
  String get uiThemeFullCoversSubtitle =>
      'Copertine più nitide che usano più memoria';

  @override
  String get uiThemeExtraBadges => 'Badge extra sulle copertine';

  @override
  String get uiThemeExtraBadgesSubtitle =>
      'Badge ebook e striscia dei salvati in Continua ad ascoltare';

  @override
  String get uiThemeReadingShelf => 'Continua a leggere come scaffale';

  @override
  String get uiThemeReadingShelfSubtitle =>
      'Un normale scaffale della Home invece delle schede grandi';

  @override
  String get uiThemeCompactHeader => 'Pulsanti compatti nell\'intestazione';

  @override
  String get uiThemeCompactHeaderSubtitle =>
      'I pulsanti nell\'intestazione delle pagine restano piccoli';

  @override
  String get uiThemePlainWording => 'Terminologia semplice';

  @override
  String get uiThemePlainWordingOnSubtitle =>
      'Usa \"Riproduci\", \"In riproduzione\", \"Completato\"';

  @override
  String get uiThemePlainWordingOffSubtitle =>
      'Usa \"Absorb\", \"Absorbing\", \"Fully Absorbed\"';

  @override
  String get uiThemeSearchClassic => 'Classico';

  @override
  String whatsNewSheetTitle(String name) {
    return 'Novità di $name';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return 'Aggiornato da $name';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return 'build $number';
  }

  @override
  String get whatsNewFullNotes => 'Note complete su GitHub';

  @override
  String get whatsNewLoading => 'Caricamento delle novità';

  @override
  String get whatsNewLoadFailed => 'Impossibile caricare le note';

  @override
  String get whatsNewLoadFailedHint =>
      'Controlla la connessione, oppure leggile su GitHub.';

  @override
  String get whatsNewOpenGitHub => 'Apri su GitHub';

  @override
  String get settingsSeeWhatsNew => 'Vedi le novità';

  @override
  String get settingsSeeWhatsNewSubtitle =>
      'Le note di rilascio di questa versione';

  @override
  String get windowsCloseToTray => 'Chiudi nell\'area di notifica';

  @override
  String get windowsCloseToTraySubtitle =>
      'Chiudendo la finestra, Absorb Plus resta in esecuzione nell\'area di notifica. Esci dall\'icona nell\'area di notifica.';

  @override
  String get windowsStartWithWindows => 'Avvia con Windows';

  @override
  String get windowsStartWithWindowsSubtitle =>
      'Apri Absorb Plus quando accedi a Windows';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return 'Si avvia: $command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return 'Un\'altra copia è impostata per avviarsi: $command. Attiva per usare questa copia.';
  }

  @override
  String get windowsStartupDisabledBySystem =>
      'Disattivata in App di avvio di Gestione attività. Riattivala da lì.';

  @override
  String get windowsStartMinimized => 'Avvia ridotto a icona';

  @override
  String get windowsStartMinimizedSubtitle =>
      'Quando si avvia con Windows, resta nell\'area di notifica (o ridotto a icona se Chiudi nell\'area di notifica è disattivato)';

  @override
  String get windowsAlwaysOnTop => 'Sempre in primo piano';

  @override
  String get windowsAlwaysOnTopSubtitle =>
      'Mantieni la finestra sopra le altre';

  @override
  String get windowsKeepAwake =>
      'Mantieni il PC attivo durante riproduzione o download';

  @override
  String get windowsKeepAwakeSubtitle =>
      'Impedisce al PC di andare in sospensione. Lo schermo può comunque spegnersi.';

  @override
  String get windowsSettingFailed => 'Windows non ha accettato la modifica';

  @override
  String get windowsGlobalHotkeys => 'Scorciatoie globali';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Funzionano con Absorb Plus in secondo piano: Ctrl+Alt+Space riproduci/pausa, Ctrl+Alt+Left/Right indietro/avanti, Ctrl+Alt+Up/Down volume, Ctrl+Alt+B aggiungi segnalibro';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return 'Occupate da un\'altra app, non disponibili: $keys';
  }

  @override
  String get windowsTrayShow => 'Mostra Absorb Plus';

  @override
  String get windowsTrayQuit => 'Esci da Absorb Plus';

  @override
  String get windowsTaskbarPlay => 'Riproduci';

  @override
  String get windowsTaskbarPause => 'Pausa';

  @override
  String get windowsTaskbarRewind => 'Indietro';

  @override
  String get windowsTaskbarForward => 'Avanti veloce';

  @override
  String windowsJumpListResume(String title) {
    return 'Riprendi $title';
  }

  @override
  String get supportContactSubtitle =>
      'Fai una domanda su GitHub di Absorb Plus';

  @override
  String get githubProjectTitle => 'Absorb Plus su GitHub';

  @override
  String get precacheTitle => 'Precarica copertine e pagine dei libri';

  @override
  String get precacheSubtitle =>
      'Le scarica in background su Wi-Fi o connessione cablata, così le schermate si aprono subito. Usa un po\' di spazio su disco, non di memoria.';

  @override
  String get githubProjectSubtitle =>
      'Versioni, codice sorgente e novità del progetto';

  @override
  String get supportSaveLogsSubtitle =>
      'Salva il file di log da allegare a una segnalazione su GitHub';

  @override
  String get supportSaveLogsDialogTitle => 'Salva i log di Absorb Plus';

  @override
  String supportLogsSaved(String path) {
    return 'Log salvati in $path';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return 'Impossibile salvare i log: $error';
  }

  @override
  String get supportOpenLogsFolder => 'Apri cartella dei log';

  @override
  String get supportOpenLogsFolderSubtitle =>
      'Mostra il file di log nel gestore file';

  @override
  String get supportOpenLogsFolderFailed =>
      'Impossibile aprire la cartella dei log';

  @override
  String get desktopDownloadFolderOpen => 'Apri in Esplora risorse';

  @override
  String get desktopDownloadFolderOpenLinux => 'Apri cartella';

  @override
  String get desktopDownloadFolderOpenFailed =>
      'Impossibile aprire la cartella';

  @override
  String get desktopDownloadFolderNotWritable =>
      'Absorb non può salvare file in quella cartella. Scegline un\'altra.';

  @override
  String get desktopDownloadFolderPickFailed =>
      'Impossibile mostrare il selettore di cartelle';

  @override
  String get desktopDownloadFolderNetworkPath =>
      'Le cartelle di rete (\\\\server\\share) non possono contenere download. Associa la condivisione a una lettera di unità in Esplora risorse, ad esempio Z:, e scegli quella.';

  @override
  String get desktopDownloadFolderDefault => 'Cartella predefinita';

  @override
  String get bookSettingsTitle => 'Impostazioni del libro';

  @override
  String bookSettingsSeries(String name) {
    return 'Serie: $name';
  }

  @override
  String get bookSettingsSpeed => 'Velocità';

  @override
  String get bookSettingsSpeedFromSeries =>
      'Dall\'ultimo libro che hai riprodotto in questa serie';

  @override
  String get bookSettingsSkipIntro => 'Salta intro';

  @override
  String get bookSettingsSkipIntroHint =>
      'Solo quando il libro parte dall\'inizio';

  @override
  String get bookSettingsSkipOutro => 'Salta outro';

  @override
  String get bookSettingsSkipOutroHint =>
      'Termina il libro in anticipo e lo segna come completato';

  @override
  String get bookSettingsSkipOff => 'Disattivato';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get bookSettingsWholeSeries => 'Usa per l\'intera serie';

  @override
  String get bookSettingsWholeSeriesHint =>
      'Intro e outro valgono per ogni libro di questa serie';

  @override
  String get bookSettingsReset => 'Reimposta';

  @override
  String get bookSettingsResetDone => 'Impostazioni del libro reimpostate';

  @override
  String get adminDashTitle => 'Dashboard';

  @override
  String get adminDashSubtitle =>
      'Chi sta ascoltando, librerie, utenti e avvisi del server a colpo d\'occhio';

  @override
  String get adminDashNobodyListening =>
      'Nessuno sta ascoltando in questo momento';

  @override
  String adminDashOnlineNames(String names) {
    return 'Online: $names';
  }

  @override
  String get adminDashListeningHistory => 'Cronologia di ascolto';

  @override
  String get adminDashCouldNotLoad =>
      'Impossibile caricare questi dati dal server';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => 'Scansiona tutto';

  @override
  String get adminDashScanAllTitle => 'Scansionare tutte le librerie?';

  @override
  String get adminDashScanAllContent =>
      'Audiobookshelf cercherà file nuovi, modificati e mancanti in ogni libreria. Con librerie grandi può richiedere un po\' di tempo.';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Scansione avviata per $count librerie',
      one: 'Scansione avviata per 1 libreria',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return '$failed scansioni su $total non sono partite';
  }

  @override
  String get adminDashNoLibraries => 'Ancora nessuna libreria';

  @override
  String get adminDashBackUpNow => 'Esegui backup ora';

  @override
  String adminDashLastBackup(String time) {
    return 'Ultimo backup $time';
  }

  @override
  String get adminDashNoBackups => 'Ancora nessun backup';

  @override
  String get adminDashManageUsers => 'Gestisci utenti';

  @override
  String get adminDashNeverSeen => 'Mai acceduto';

  @override
  String get adminDashDisabled => 'Disabilitato';

  @override
  String get adminDashLocked => 'Bloccato';

  @override
  String get adminDashServerWarnings => 'Avvisi del server';

  @override
  String get adminDashNoProblems => 'Nessun avviso o errore nel log di oggi';

  @override
  String get adminDashAllLogs => 'Tutti i log del server';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale (integrato)';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => 'Scorciatoie da tastiera';

  @override
  String get desktopShortcutsSubtitle =>
      'Controlli di riproduzione, velocità, ricerca e navigazione';

  @override
  String get desktopShortcutsClose => 'Chiudi';

  @override
  String get tailscaleConnect => 'Connetti con Tailscale';

  @override
  String get tailscaleConnectHint => 'Apre l\'accesso a Tailscale nel browser';

  @override
  String get tailscaleTurnOff => 'Disattiva';

  @override
  String get tailscaleCardPitch =>
      'Raggiungi il tuo server nella tua tailnet senza attivare la VPN di Tailscale';

  @override
  String get tailscaleIntro =>
      'Raggiungi un server nella tua tailnet senza attivare la VPN dell\'app Tailscale. Absorb entra nella tua tailnet come dispositivo a sé, solo per le proprie connessioni. Funzione sperimentale, disattivata per impostazione predefinita.';

  @override
  String get tailscaleUseSwitch => 'Usa Tailscale integrato';

  @override
  String get tailscaleStatusOff => 'Disattivato';

  @override
  String get tailscaleStatusStarting => 'Connessione…';

  @override
  String get tailscaleStatusNeedsLogin =>
      'Accedi per aggiungere questo dispositivo alla tua tailnet';

  @override
  String get tailscaleStatusNeedsApproval =>
      'In attesa che un amministratore approvi questo dispositivo';

  @override
  String tailscaleStatusConnected(String user) {
    return 'Connesso come $user';
  }

  @override
  String get tailscaleStatusConnectedNoUser => 'Connesso';

  @override
  String tailscaleStatusError(String error) {
    return 'Problema: $error';
  }

  @override
  String get tailscaleNotIncluded => 'Non incluso in questa versione';

  @override
  String get tailscaleSignIn => 'Accedi con Tailscale';

  @override
  String get tailscaleSignInNoLink =>
      'Ancora nessun link di accesso. Riprova tra un attimo.';

  @override
  String get tailscaleToggleFailed =>
      'Impossibile attivare o disattivare Tailscale integrato. Riprova.';

  @override
  String get tailscaleSignOut => 'Esci da Tailscale';

  @override
  String tailscaleDeviceAddress(String address) {
    return 'Questo dispositivo: $address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return 'Il tuo server ($server) viene raggiunto tramite Tailscale.';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return 'Il tuo server ($server) non è un indirizzo della tailnet, quindi viene raggiunto normalmente. Se è nella tua tailnet, aggiungi qui sotto il suo nome host.';
  }

  @override
  String get tailscaleExtraHostsLabel => 'Altri nomi host della tailnet';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      'Gli indirizzi in 100.64.0.0/10 e i nomi che terminano con .ts.net o con il nome MagicDNS della tua tailnet passano sempre da Tailscale. Separa i nomi con virgole.';

  @override
  String playerChapterEndsAt(String time) {
    return 'Il capitolo termina alle $time';
  }

  @override
  String playerEndsAt(String time) {
    return 'Termina alle $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return 'Ultima riproduzione su $device · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return 'Ultima riproduzione su un altro dispositivo · $ago';
  }

  @override
  String get opmlExportAction => 'Esporta OPML';

  @override
  String get opmlExportDialogTitle => 'Salva i feed dei podcast come OPML';

  @override
  String opmlExportSaved(String path) {
    return 'OPML salvato in $path';
  }

  @override
  String get opmlExportDownloaded => 'OPML scaricato';

  @override
  String get opmlExportFailed => 'Impossibile esportare il file OPML';

  @override
  String get bookCopySaveAction => 'Salva una copia…';

  @override
  String get bookCopyDialogTitle => 'Salva una copia di questo libro';

  @override
  String get bookCopySaving => 'Salvataggio della copia…';

  @override
  String bookCopySaved(String path) {
    return 'Copia salvata in $path';
  }

  @override
  String get bookCopyFailed => 'Impossibile salvare una copia di questo libro';

  @override
  String get exclusiveAudioTitle => 'Audio esclusivo';

  @override
  String get exclusiveAudioSubtitle =>
      'Risolve scricchiolii o volume instabile saltando gli effetti sonori di Windows. Le altre app vengono silenziate mentre Absorb riproduce. Riavvia Absorb per applicare.';

  @override
  String get exclusiveAudioFallback =>
      'Your sound device refused exclusive audio, so Absorb is playing in normal mode';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return '$count nuovi';
  }

  @override
  String seekUndoBackTo(String time) {
    return 'Torna a $time';
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
      'Scarica automaticamente il libro successivo della serie';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      'Quando il libro in riproduzione è all\'80% o mancano meno di un\'ora. Rispetta l\'impostazione solo Wi-Fi.';

  @override
  String get emptyStateBrowseLibrary => 'Sfoglia la libreria';

  @override
  String get emptyStateClearSearch => 'Cancella ricerca';

  @override
  String get statsNoListeningYet => 'Ancora nessun ascolto';

  @override
  String get desktopShortcutQuickSwitcher =>
      'Selettore rapido: trova libri o vai ovunque';

  @override
  String get desktopShortcutHelp => 'Mostra le scorciatoie da tastiera';

  @override
  String get quickSwitcherTooltip => 'Selettore rapido (Ctrl+K)';

  @override
  String get quickSwitcherHint =>
      'Cerca in questa libreria o digita un comando';

  @override
  String get quickSwitcherNoResults => 'Nessun risultato';

  @override
  String get quickSwitcherGoHome => 'Vai a Home';

  @override
  String get quickSwitcherGoLibrary => 'Vai a Libreria';

  @override
  String get quickSwitcherGoAbsorbing => 'Vai ad Absorbing';

  @override
  String get quickSwitcherGoStats => 'Vai a Statistiche';

  @override
  String get quickSwitcherGoSettings => 'Vai a Impostazioni';

  @override
  String get quickSwitcherGoDownloads => 'Vai a Download';

  @override
  String get quickSwitcherPlayPause => 'Riproduci / pausa';

  @override
  String get quickSwitcherSleepTimer => 'Timer di spegnimento';

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
  String get quickSwitcherKindAction => 'Azione';

  @override
  String get quickSwitcherKindBook => 'Libro';

  @override
  String get quickSwitcherKindPodcast => 'Podcast';

  @override
  String get quickSwitcherKindSeries => 'Serie';

  @override
  String get quickSwitcherKindAuthor => 'Autore';

  @override
  String get alphabetScrollerLabel => 'Vai a una lettera';

  @override
  String get stepperDecrease => 'Diminuisci';

  @override
  String get stepperIncrease => 'Aumenta';

  @override
  String get statsStreakKeepGoing => 'Ascolta 5 minuti oggi per mantenerla';

  @override
  String get statsStreakHowTo =>
      'Ascolta 5 minuti al giorno per costruire una serie';

  @override
  String get statsDailyGoalSheetTitle => 'Obiettivo di ascolto giornaliero';

  @override
  String get statsDailyGoalSheetBody =>
      'Un anello sulla scheda della serie si riempie mentre ascolti oggi.';

  @override
  String get statsDailyGoalSet => 'Imposta un obiettivo giornaliero';

  @override
  String get statsDailyGoalEdit => 'Cambia obiettivo giornaliero';

  @override
  String get statsMonthListened => 'Ascoltato';

  @override
  String get statsMonthTime => 'Tempo';

  @override
  String get statsMonthTopBook => 'Libro più ascoltato';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count risultati',
      one: '1 risultato',
      zero: 'Nessun risultato',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => 'Ordina e raggruppa';

  @override
  String get bookmarksViewByBook => 'Per libro';

  @override
  String get bookmarksViewNewest => 'Più recenti prima';

  @override
  String get bookmarksViewPosition => 'Per posizione';

  @override
  String get bookmarksExportAction => 'Esporta segnalibri';

  @override
  String get bookmarksExportDialogTitle => 'Salva i segnalibri come Markdown';

  @override
  String bookmarksExportSaved(String path) {
    return 'Segnalibri salvati in $path';
  }

  @override
  String get bookmarksExportDownloaded => 'Segnalibri scaricati';

  @override
  String get bookmarksExportFailed => 'Impossibile esportare i segnalibri';

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
