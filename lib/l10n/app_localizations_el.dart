// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'A B S O R B';

  @override
  String get online => 'Σε σύνδεση';

  @override
  String get offline => 'Εκτός σύνδεσης';

  @override
  String get stillOffline =>
      'Ακόμα εκτός σύνδεσης. Πατήστε για νέα προσπάθεια.';

  @override
  String get retry => 'Επανάληψη';

  @override
  String get listsNone => 'Δεν υπάρχουν συλλογές ή λίστες αναπαραγωγής';

  @override
  String get listsNoneHint =>
      'Οι συλλογές και οι λίστες αναπαραγωγής δημιουργούνται στον διακομιστή Audiobookshelf και εμφανίζονται εδώ.';

  @override
  String get listsLoadFailed => 'Δεν ήταν δυνατή η φόρτωση των λιστών σας';

  @override
  String get listsLoadFailedHint =>
      'Το Absorb δεν μπόρεσε να συνδεθεί με τον διακομιστή σας για τις συλλογές και τις λίστες αναπαραγωγής.';

  @override
  String get listsNoneBookOrbit => 'Δεν υπάρχουν συλλογές ή Smart Scopes';

  @override
  String get listsNoneHintBookOrbit =>
      'Οι συλλογές και τα Smart Scopes δημιουργούνται στον διακομιστή BookOrbit και εμφανίζονται εδώ.';

  @override
  String get listsLoadFailedHintBookOrbit =>
      'Το Absorb δεν μπόρεσε να συνδεθεί με τον διακομιστή σας για τις συλλογές και τα Smart Scopes.';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get remove => 'Αφαίρεση';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get done => 'Τέλος';

  @override
  String get edit => 'Επεξεργασία';

  @override
  String get search => 'Αναζήτηση';

  @override
  String get apply => 'Εφαρμογή';

  @override
  String get enable => 'Ενεργοποίηση';

  @override
  String get clear => 'Εκκαθάριση';

  @override
  String get off => 'Ανενεργό';

  @override
  String get disabled => 'Απενεργοποιημένο';

  @override
  String get later => 'Αργότερα';

  @override
  String get whatsNewTitle => 'Το Absorb ενημερώθηκε';

  @override
  String whatsNewContent(String version) {
    return 'Χρησιμοποιείτε πλέον την έκδοση $version.';
  }

  @override
  String get whatsNewButton => 'Δείτε τι νέο υπάρχει';

  @override
  String get whatsNewKeepShowing => 'Εμφάνιση μετά από κάθε ενημέρωση';

  @override
  String get whatsNewKeepShowingHint =>
      'Μπορείτε να το ενεργοποιήσετε ξανά στις Ρυθμίσεις';

  @override
  String get settingsWhatsNew => 'Εμφάνιση των νέων μετά τις ενημερώσεις';

  @override
  String get settingsWhatsNewSubtitle =>
      'Μετά από μια ενημέρωση, εμφάνιση των νέων στην εφαρμογή';

  @override
  String get gotIt => 'Κατάλαβα';

  @override
  String get betaLoggingTitle => 'Τα αρχεία καταγραφής είναι ενεργά';

  @override
  String get betaLoggingContent =>
      'Επειδή πρόκειται για beta, το Absorb κρατά πλέον αρχεία καταγραφής για τον εντοπισμό προβλημάτων. Μένουν σε αυτήν τη συσκευή εκτός αν τα μοιραστείτε.\n\nΜπορείτε να τα στείλετε ή να τα απενεργοποιήσετε στις Ρυθμίσεις, στην ενότητα Προβλήματα & υποστήριξη. Αν τα απενεργοποιήσετε, οι επόμενες beta θα τα αφήσουν απενεργοποιημένα.';

  @override
  String get preview => 'Προεπισκόπηση';

  @override
  String get or => 'ή';

  @override
  String get file => 'Αρχείο';

  @override
  String get more => 'Περισσότερα';

  @override
  String get unknown => 'Άγνωστο';

  @override
  String get untitled => 'Χωρίς τίτλο';

  @override
  String get noThanks => 'Όχι, ευχαριστώ';

  @override
  String get stay => 'Παραμονή';

  @override
  String get homeTitle => 'Αρχική';

  @override
  String get continueListening => 'Συνέχεια ακρόασης';

  @override
  String get continueReading => 'Συνέχεια ανάγνωσης';

  @override
  String get continueSeries => 'Συνέχεια σειράς';

  @override
  String get recentlyAdded => 'Προστέθηκαν πρόσφατα';

  @override
  String get listenAgain => 'Ακούστε ξανά';

  @override
  String get discover => 'Ανακάλυψη';

  @override
  String get newEpisodes => 'Νέα επεισόδια';

  @override
  String get downloads => 'Λήψεις';

  @override
  String get noDownloadedBooks => 'Δεν υπάρχουν ληφθέντα βιβλία';

  @override
  String get yourLibraryIsEmpty => 'Η βιβλιοθήκη σας είναι κενή';

  @override
  String get downloadBooksWhileOnline =>
      'Κάντε λήψη βιβλίων ενώ είστε συνδεδεμένοι για ακρόαση εκτός σύνδεσης';

  @override
  String get customizeHome => 'Προσαρμογή αρχικής';

  @override
  String get dragToReorderTapEye =>
      'Σύρετε για αναδιάταξη, πατήστε το μάτι για εμφάνιση/απόκρυψη';

  @override
  String get loginTagline => 'Ξεκινήστε το Absorbing';

  @override
  String get loginConnectToServer => 'Σύνδεση στον διακομιστή σας';

  @override
  String get loginServerAddress => 'Διεύθυνση διακομιστή';

  @override
  String get loginServerHint => 'my.server.com';

  @override
  String get loginServerHelper =>
      'Λειτουργεί και IP:θύρα (π.χ. 192.168.1.5:13378)';

  @override
  String get loginCouldNotReachServer =>
      'Δεν ήταν δυνατή η σύνδεση με τον διακομιστή';

  @override
  String get loginAdvanced => 'Για προχωρημένους';

  @override
  String get loginCustomHttpHeaders => 'Προσαρμοσμένες κεφαλίδες HTTP';

  @override
  String get loginCustomHeadersDescription =>
      'Για σήραγγες Cloudflare ή αντίστροφους διακομιστές μεσολάβησης που απαιτούν επιπλέον κεφαλίδες. Προσθέστε τις κεφαλίδες πριν εισαγάγετε τη διεύθυνση του διακομιστή.';

  @override
  String get loginHeaderName => 'Όνομα κεφαλίδας';

  @override
  String get loginHeaderValue => 'Τιμή';

  @override
  String get loginAddHeader => 'Προσθήκη κεφαλίδας';

  @override
  String get loginSelfSignedCertificates => 'Αυτο-υπογεγραμμένα πιστοποιητικά';

  @override
  String get loginTrustAllCertificates =>
      'Εμπιστοσύνη σε όλα τα πιστοποιητικά (για αυτο-υπογεγραμμένα / προσαρμοσμένη αρχή πιστοποίησης)';

  @override
  String get loginApiKey => 'Κλειδί API';

  @override
  String get loginApiKeyDescription =>
      'Χρησιμοποιήστε κλειδί API που δημιουργήθηκε από διαχειριστή αντί για όνομα χρήστη/κωδικό πρόσβασης. Χρήσιμο όταν αποτυγχάνει η ανανέωση του διακριτικού για τον λογαριασμό σας.';

  @override
  String get loginWaitingForSso => 'Αναμονή για SSO...';

  @override
  String get loginRedirectUri => 'URI ανακατεύθυνσης: absorb://oauth';

  @override
  String get loginOrSignInManually => 'ή συνδεθείτε χειροκίνητα';

  @override
  String get loginUsername => 'Όνομα χρήστη';

  @override
  String get loginUsernameRequired => 'Εισαγάγετε το όνομα χρήστη σας';

  @override
  String get loginPassword => 'Κωδικός πρόσβασης';

  @override
  String get loginSignIn => 'Σύνδεση';

  @override
  String loginSignInAs(String username) {
    return 'Σύνδεση ως $username;';
  }

  @override
  String get loginSignInToServer => 'Σύνδεση σε αυτόν τον διακομιστή;';

  @override
  String loginSignedInAs(String username) {
    return 'Συνδεθήκατε ως $username';
  }

  @override
  String get adminCreateSetupFile => 'Κοινοποίηση σύνδεσης';

  @override
  String adminSetupFileDescription(String username) {
    return 'Δημιουργεί έναν ιδιωτικό σύνδεσμο σύνδεσης για τον χρήστη $username που λειτουργεί μόνο στην εφαρμογή Absorb.';
  }

  @override
  String get adminSetupFileServerUrl =>
      'Διεύθυνση διακομιστή που θα χρησιμοποιήσει ο νέος χρήστης';

  @override
  String get adminSetupFileNoteWithHeaders =>
      'Θα συμπεριληφθούν ένα ειδικό κλειδί API και οι προσαρμοσμένες κεφαλίδες σας, ώστε να έχει πρόσβαση στον διακομιστή. Αντιμετωπίστε τον σύνδεσμο σαν κωδικό πρόσβασης.';

  @override
  String get adminSetupFileNote =>
      'Θα συμπεριληφθεί ένα ειδικό κλειδί API. Αντιμετωπίστε τον σύνδεσμο σαν κωδικό πρόσβασης.';

  @override
  String get adminSetupFileCreate => 'Δημιουργία συνδέσμου';

  @override
  String get adminSetupFileSaveTitle => 'Αποθήκευση αρχείου ρύθμισης';

  @override
  String get adminSetupFileKeyError =>
      'Δεν ήταν δυνατή η δημιουργία κλειδιού API για αυτόν τον χρήστη';

  @override
  String adminSetupFileSaved(String username) {
    return 'Το αρχείο ρύθμισης για τον χρήστη $username αποθηκεύτηκε';
  }

  @override
  String adminSetupFileFailed(String error) {
    return 'Αποτυχία δημιουργίας σύνδεσης: $error';
  }

  @override
  String get setupLinkShareTitle => 'Κοινοποίηση σύνδεσης';

  @override
  String setupLinkShareDescription(String username) {
    return 'Στείλτε αυτόν τον ιδιωτικό σύνδεσμο ή ζητήστε να σαρώσουν τον κωδικό QR για να συνδεθούν ως $username.';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return 'Όποιος έχει αυτόν τον σύνδεσμο μπορεί να συνδεθεί ως $username. Αντιμετωπίστε τον σαν κωδικό πρόσβασης.';
  }

  @override
  String get setupLinkShare => 'Κοινοποίηση συνδέσμου';

  @override
  String get setupLinkCopy => 'Αντιγραφή συνδέσμου';

  @override
  String get setupLinkCopied => 'Ο σύνδεσμος σύνδεσης αντιγράφηκε';

  @override
  String get setupLinkSaveFile => 'Αποθήκευση αρχείου ρύθμισης';

  @override
  String get setupLinkQrError =>
      'Αυτός ο σύνδεσμος ρύθμισης είναι πολύ μεγάλος για κωδικό QR. Κοινοποιήστε τον σύνδεσμο.';

  @override
  String setupLinkShareSubject(String username) {
    return 'Σύνδεση στο Absorb για τον χρήστη $username';
  }

  @override
  String get setupLinkConfirmTitle => 'Σύνδεση με αυτόν τον σύνδεσμο;';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return 'Σύνδεση στον $server ως $username; Συνεχίστε μόνο αν εμπιστεύεστε αυτόν που σας έστειλε τον σύνδεσμο.';
  }

  @override
  String get setupLinkInvalid =>
      'Αυτός ο σύνδεσμος σύνδεσης δεν είναι έγκυρος ή είναι ελλιπής';

  @override
  String get setupLinkSigningIn => 'Έλεγχος συνδέσμου σύνδεσης...';

  @override
  String get loginPlayDownloads => 'Αναπαραγωγή των λήψεών σας';

  @override
  String signedOutDownloadsNote(String username) {
    return 'Έχετε αποσυνδεθεί. Ό,τι ακούτε εδώ συγχρονίζεται με τον χρήστη $username όταν συνδεθείτε ξανά.';
  }

  @override
  String get loginPasteLink => 'Επικόλληση συνδέσμου σύνδεσης';

  @override
  String get loginPasteLinkHelp =>
      'Επικολλήστε ολόκληρο τον σύνδεσμο σύνδεσης που λάβατε. Αντιμετωπίστε τον σαν κωδικό πρόσβασης.';

  @override
  String get loginFailed => 'Η σύνδεση απέτυχε';

  @override
  String get loginSsoFailed => 'Η σύνδεση SSO απέτυχε ή ακυρώθηκε';

  @override
  String get loginSsoAuthFailed =>
      'Ο έλεγχος ταυτότητας SSO απέτυχε. Δοκιμάστε ξανά.';

  @override
  String get loginRestoreFromBackup => 'Εισαγωγή';

  @override
  String get loginInvalidBackupFile => 'Μη έγκυρο αρχείο αντιγράφου ασφαλείας';

  @override
  String get loginRestoreBackupTitle => 'Επαναφορά αντιγράφου ασφαλείας;';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return 'Θα γίνει επαναφορά όλων των ρυθμίσεων και $count αποθηκευμένου(-ων) λογαριασμού(-ών). Θα συνδεθείτε αυτόματα.';
  }

  @override
  String get loginRestoreBackupNoAccounts =>
      'Θα γίνει επαναφορά όλων των ρυθμίσεων. Αυτό το αντίγραφο ασφαλείας δεν περιλαμβάνει λογαριασμούς.';

  @override
  String get loginRestore => 'Επαναφορά';

  @override
  String loginRestoredAndSignedIn(String username) {
    return 'Οι ρυθμίσεις επαναφέρθηκαν και συνδεθήκατε ως $username';
  }

  @override
  String get loginSessionExpired =>
      'Οι ρυθμίσεις επαναφέρθηκαν. Η συνεδρία έληξε - συνδεθείτε για να συνεχίσετε.';

  @override
  String get loginSettingsRestored => 'Οι ρυθμίσεις επαναφέρθηκαν';

  @override
  String loginRestoreFailed(String error) {
    return 'Η επαναφορά απέτυχε: $error';
  }

  @override
  String get loginSavedAccounts => 'αποθηκευμένοι λογαριασμοί';

  @override
  String get libraryTitle => 'Βιβλιοθήκη';

  @override
  String get librarySearchBooksHint =>
      'Αναζήτηση βιβλίων, σειρών, συγγραφέων, αφηγητών...';

  @override
  String get librarySearchShowsHint => 'Αναζήτηση εκπομπών και επεισοδίων...';

  @override
  String get libraryTabLibrary => 'Βιβλιοθήκη';

  @override
  String get libraryTabSeries => 'Σειρές';

  @override
  String get libraryTabAuthors => 'Συγγραφείς';

  @override
  String get libraryTabNarrators => 'Αφηγητές';

  @override
  String get libraryNoBooks => 'Δεν βρέθηκαν βιβλία';

  @override
  String get libraryNoUnfinishedBooks => 'Δεν υπάρχουν μη ολοκληρωμένα βιβλία';

  @override
  String get libraryNoBooksInProgress => 'Δεν υπάρχουν βιβλία σε εξέλιξη';

  @override
  String get libraryNoFinishedBooks => 'Δεν υπάρχουν ολοκληρωμένα βιβλία';

  @override
  String get libraryAllBooksStarted => 'Έχουν ξεκινήσει όλα τα βιβλία';

  @override
  String get libraryNoDownloadedBooks => 'Δεν υπάρχουν ληφθέντα βιβλία';

  @override
  String get libraryNoSeriesFound => 'Δεν βρέθηκαν σειρές';

  @override
  String get libraryNoBooksWithEbooks =>
      'Δεν υπάρχουν βιβλία με ηλεκτρονικά βιβλία';

  @override
  String get libraryNoBooksMissingMetadata =>
      'Κανένα βιβλίο δεν στερείται αυτών των μεταδεδομένων';

  @override
  String get libraryNoItemsMatchingFilter =>
      'Κανένα στοιχείο δεν ταιριάζει με αυτό το φίλτρο';

  @override
  String libraryNoBooksInGenre(String genre) {
    return 'Δεν υπάρχουν βιβλία στο «$genre»';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return 'Δεν υπάρχουν βιβλία με την ετικέτα «$tag»';
  }

  @override
  String get libraryClearFilter => 'Εκκαθάριση φίλτρου';

  @override
  String get libraryNoAuthorsFound => 'Δεν βρέθηκαν συγγραφείς';

  @override
  String get libraryNoNarratorsFound => 'Δεν βρέθηκαν αφηγητές';

  @override
  String get libraryNoResults => 'Δεν βρέθηκαν αποτελέσματα';

  @override
  String get librarySearchBooks => 'Βιβλία';

  @override
  String get librarySearchShows => 'Εκπομπές';

  @override
  String get librarySearchEpisodes => 'Επεισόδια';

  @override
  String get librarySearchSeries => 'Σειρές';

  @override
  String get librarySearchAuthors => 'Συγγραφείς';

  @override
  String get librarySearchTags => 'Ετικέτες';

  @override
  String get librarySearchGenres => 'Είδη';

  @override
  String librarySeriesCount(int count) {
    return '$count σειρές';
  }

  @override
  String libraryAuthorsCount(int count) {
    return '$count συγγραφείς';
  }

  @override
  String libraryNarratorsCount(int count) {
    return '$count αφηγητές';
  }

  @override
  String libraryBooksCount(int loaded, int total) {
    return '$loaded/$total βιβλία';
  }

  @override
  String get sort => 'Ταξινόμηση';

  @override
  String get filter => 'Φίλτρο';

  @override
  String get filterActive => 'Φίλτρο ●';

  @override
  String get name => 'Όνομα';

  @override
  String get title => 'Τίτλος';

  @override
  String get author => 'Συγγραφέας';

  @override
  String get dateAdded => 'Ημερομηνία προσθήκης';

  @override
  String get numberOfBooks => 'Αριθμός βιβλίων';

  @override
  String get sortTotalDuration => 'Συνολική διάρκεια';

  @override
  String get sortLastBookAdded => 'Τελευταίο βιβλίο που προστέθηκε';

  @override
  String get sortLastBookUpdated => 'Τελευταίο βιβλίο που ενημερώθηκε';

  @override
  String get publishedYear => 'Έτος έκδοσης';

  @override
  String get duration => 'Διάρκεια';

  @override
  String get random => 'Τυχαία';

  @override
  String get collapseSeries => 'Σύμπτυξη σειρών';

  @override
  String get notFinished => 'Μη ολοκληρωμένα';

  @override
  String get inProgress => 'Σε εξέλιξη';

  @override
  String get filterFinished => 'Ολοκληρώθηκε';

  @override
  String get notStarted => 'Δεν ξεκίνησαν';

  @override
  String get downloaded => 'Ληφθέντα';

  @override
  String get hasEbook => 'Με ηλεκτρονικό βιβλίο';

  @override
  String get noEbook => 'Χωρίς ηλεκτρονικό βιβλίο';

  @override
  String get hasSupplementaryEbook => 'Με συμπληρωματικό ηλεκτρονικό βιβλίο';

  @override
  String get noSupplementaryEbook => 'Χωρίς συμπληρωματικό ηλεκτρονικό βιβλίο';

  @override
  String get noSeries => 'Χωρίς σειρά';

  @override
  String get publishedDecade => 'Δεκαετία έκδοσης';

  @override
  String get tracks => 'Κομμάτια';

  @override
  String get noTracks => 'Χωρίς κομμάτια';

  @override
  String get singleTrack => 'Ένα κομμάτι';

  @override
  String get multipleTracks => 'Πολλά κομμάτια';

  @override
  String get abridged => 'Συντομευμένο';

  @override
  String get issues => 'Προβλήματα';

  @override
  String get rssFeedOpen => 'Ανοιχτή ροή RSS';

  @override
  String get explicitContent => 'Ακατάλληλο περιεχόμενο';

  @override
  String get missingMetadata => 'Ελλιπή μεταδεδομένα';

  @override
  String get genre => 'Είδος';

  @override
  String get tag => 'Ετικέτα';

  @override
  String get clearFilter => 'Εκκαθάριση φίλτρου';

  @override
  String get noGenresFound => 'Δεν βρέθηκαν είδη';

  @override
  String get noTagsFound => 'Δεν βρέθηκαν ετικέτες';

  @override
  String get asc => 'ΑΥΞ.';

  @override
  String get desc => 'ΦΘΙΝ.';

  @override
  String get fileSize => 'Μέγεθος αρχείου';

  @override
  String get lastUpdated => 'Τελευταία ενημέρωση';

  @override
  String get fileCreated => 'Δημιουργία αρχείου';

  @override
  String get lastModified => 'Τελευταία τροποποίηση';

  @override
  String get authorFirstLast => 'Συγγραφέας (Όνομα Επώνυμο)';

  @override
  String get authorLastFirst => 'Συγγραφέας (Επώνυμο, Όνομα)';

  @override
  String get progressSort => 'Πρόοδος';

  @override
  String get dateStarted => 'Ημερομηνία έναρξης';

  @override
  String get dateFinished => 'Ημερομηνία ολοκλήρωσης';

  @override
  String get episodeCount => 'Αριθμός επεισοδίων';

  @override
  String get sequence => 'Σειρά στην ακολουθία';

  @override
  String get absorbingTitle => 'Absorbing';

  @override
  String get absorbingStop => 'Διακοπή';

  @override
  String get absorbingManageQueue => 'Διαχείριση ουράς';

  @override
  String get absorbingDone => 'Τέλος';

  @override
  String get absorbingNoDownloadedEpisodes => 'Δεν υπάρχουν ληφθέντα επεισόδια';

  @override
  String get absorbingNoDownloadedBooks => 'Δεν υπάρχουν ληφθέντα βιβλία';

  @override
  String get absorbingNothingPlayingYet => 'Δεν παίζει τίποτα ακόμα';

  @override
  String get absorbingNothingAbsorbingYet =>
      'Δεν υπάρχει τίποτα στο Absorbing ακόμα';

  @override
  String get absorbingDownloadEpisodesToListen =>
      'Κάντε λήψη επεισοδίων για ακρόαση εκτός σύνδεσης';

  @override
  String get absorbingDownloadBooksToListen =>
      'Κάντε λήψη βιβλίων για ακρόαση εκτός σύνδεσης';

  @override
  String get absorbingStartEpisodeFromShows =>
      'Ξεκινήστε ένα επεισόδιο από την καρτέλα Εκπομπές';

  @override
  String get absorbingStartBookFromLibrary =>
      'Ξεκινήστε ένα βιβλίο από την καρτέλα Βιβλιοθήκη';

  @override
  String get carModeTitle => 'Λειτουργία αυτοκινήτου';

  @override
  String get carModeNoBookLoaded => 'Δεν έχει φορτωθεί βιβλίο';

  @override
  String get carModeBookLabel => 'Βιβλίο';

  @override
  String get carModeChapterLabel => 'Κεφάλαιο';

  @override
  String get carModeBookmarkDefault => 'Σελιδοδείκτης';

  @override
  String get carModeBookmarkAdded => 'Ο σελιδοδείκτης προστέθηκε';

  @override
  String get downloadsTitle => 'Λήψεις';

  @override
  String get downloadsCancelSelection => 'Ακύρωση επιλογής';

  @override
  String get downloadsSelect => 'Επιλογή';

  @override
  String get downloadsNoDownloads => 'Δεν υπάρχουν λήψεις';

  @override
  String get downloadsDownloading => 'Λήψη σε εξέλιξη';

  @override
  String get downloadsQueued => 'Στην ουρά';

  @override
  String get downloadsCompleted => 'Ολοκληρώθηκαν';

  @override
  String get downloadsEbooks => 'Ηλεκτρονικά βιβλία';

  @override
  String get downloadsWaiting => 'Αναμονή...';

  @override
  String get downloadsCancel => 'Ακύρωση';

  @override
  String get downloadsDelete => 'Διαγραφή';

  @override
  String downloadsDeleteCount(int count) {
    return 'Διαγραφή $count λήψης(-εων);';
  }

  @override
  String get downloadsDeleteContent =>
      'Τα ληφθέντα αρχεία θα αφαιρεθούν από αυτήν τη συσκευή.';

  @override
  String downloadsDeletedCount(int count) {
    return 'Διαγράφηκαν $count λήψη(-εις)';
  }

  @override
  String get downloadsRemoveTitle => 'Αφαίρεση λήψης;';

  @override
  String downloadsRemoveContent(String title) {
    return 'Διαγραφή του «$title» από αυτήν τη συσκευή;';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return 'Το «$title» αφαιρέθηκε';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return 'Δεν ήταν δυνατή η λήψη του «$title» - ένα από τα αρχεία του δεν υπάρχει στον διακομιστή. Μια σάρωση της βιβλιοθήκης μπορεί να το διορθώσει.';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return 'Δεν ήταν δυνατή η λήψη του «$title» - δεν υπάρχει αρκετός χώρος αποθήκευσης';
  }

  @override
  String downloadFailedPermission(String title) {
    return 'Δεν ήταν δυνατή η λήψη του «$title» - ελέγξτε τη θέση λήψης στις Ρυθμίσεις';
  }

  @override
  String downloadFailedGeneric(String title) {
    return 'Δεν ήταν δυνατή η λήψη του «$title»';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '$count επιλεγμένα';
  }

  @override
  String get bookmarksTitle => 'Όλοι οι σελιδοδείκτες';

  @override
  String get bookmarksTabBookmarks => 'Σελιδοδείκτες';

  @override
  String get bookmarksTabHighlights => 'Επισημάνσεις';

  @override
  String get highlightOpenInBook => 'Άνοιγμα στο βιβλίο';

  @override
  String get highlightDeleteAction => 'Διαγραφή επισήμανσης';

  @override
  String get highlightDeleted => 'Η επισήμανση διαγράφηκε';

  @override
  String highlightsDeleteCount(int count) {
    return 'Διαγραφή $count επισήμανσης(-εων);';
  }

  @override
  String highlightsDeletedCount(int count) {
    return 'Διαγράφηκαν $count επισήμανση(-εις)';
  }

  @override
  String get quoteShareTitle => 'Κοινοποίηση παραθέματος';

  @override
  String get quoteShareAction => 'Κοινοποίηση';

  @override
  String get quoteShareFailed =>
      'Δεν ήταν δυνατή η δημιουργία της εικόνας παραθέματος';

  @override
  String get quoteShapePortrait => 'Κατακόρυφο';

  @override
  String get quoteShapeSquare => 'Τετράγωνο';

  @override
  String get quoteShapeStory => 'Story';

  @override
  String get quoteStyleBlur => 'Θολό';

  @override
  String get quoteStyleDim => 'Σκουρυμένο';

  @override
  String get quoteStyleNone => 'Απλό εξώφυλλο';

  @override
  String get quoteTextLight => 'Ανοιχτό κείμενο';

  @override
  String get quoteTextDark => 'Σκούρο κείμενο';

  @override
  String get quoteFieldTitle => 'Τίτλος';

  @override
  String get quoteFieldDetail => 'Λεπτομέρειες';

  @override
  String get quoteFieldDetailHint =>
      'Συγγραφέας, κεφάλαιο, σελίδα, ποιος το είπε';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => 'Ακύρωση επιλογής';

  @override
  String get bookmarksSortedByNewest => 'Ταξινόμηση κατά νεότερα';

  @override
  String get bookmarksSortedByPosition => 'Ταξινόμηση κατά θέση';

  @override
  String get bookmarksSelect => 'Επιλογή';

  @override
  String get bookmarksNoBookmarks => 'Δεν υπάρχουν σελιδοδείκτες ακόμα';

  @override
  String get bookmarksSearchHint => 'Αναζήτηση σελιδοδεικτών';

  @override
  String get bookmarksNoMatches =>
      'Κανένας σελιδοδείκτης δεν ταιριάζει με την αναζήτησή σας';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Λήψη $count βιβλίων',
      one: 'Λήψη 1 βιβλίου',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => 'Έχουν ήδη ληφθεί';

  @override
  String bookmarksDeleteCount(int count) {
    return 'Διαγραφή $count σελιδοδείκτη(-ών);';
  }

  @override
  String get bookmarksDeleteContent =>
      'Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';

  @override
  String bookmarksDeletedCount(int count) {
    return 'Διαγράφηκαν $count σελιδοδείκτης(-ες)';
  }

  @override
  String get bookmarksJumpTitle => 'Μετάβαση στον σελιδοδείκτη;';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '«$title» στο $position\nστο $bookTitle';
  }

  @override
  String get bookmarksJump => 'Μετάβαση';

  @override
  String get bookmarksNotConnected => 'Δεν υπάρχει σύνδεση με τον διακομιστή';

  @override
  String get bookmarksCouldNotLoad => 'Δεν ήταν δυνατή η φόρτωση του βιβλίου';

  @override
  String bookmarksSelectedCount(int count) {
    return '$count επιλεγμένα';
  }

  @override
  String get statsTitle => 'Τα στατιστικά σας';

  @override
  String get statsCouldNotLoad => 'Δεν ήταν δυνατή η φόρτωση των στατιστικών';

  @override
  String get statsTotalListeningTime => 'ΣΥΝΟΛΙΚΟΣ ΧΡΟΝΟΣ ΑΚΡΟΑΣΗΣ';

  @override
  String get statsHoursUnit => 'ω';

  @override
  String get statsMinutesUnit => 'λ';

  @override
  String get statsSecondsUnit => 'δ';

  @override
  String statsDaysOfAudio(String days) {
    return 'Αυτό ισοδυναμεί με $days ημέρες ήχου';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return 'Αυτό ισοδυναμεί με $hours ώρες ήχου';
  }

  @override
  String get statsToday => 'Σήμερα';

  @override
  String get statsThisWeek => 'Αυτή την εβδομάδα';

  @override
  String get statsThisMonth => 'Αυτόν τον μήνα';

  @override
  String get statsActivity => 'Δραστηριότητα';

  @override
  String get statsCurrentStreak => 'Τρέχουσα συνέχεια';

  @override
  String get statsBestStreak => 'Καλύτερη συνέχεια';

  @override
  String get statsFinished => 'Ολοκληρώθηκε';

  @override
  String get statsBooksFinished => 'Βιβλία';

  @override
  String get statsEpisodesFinished => 'Επεισόδια';

  @override
  String get statsBooksThisYear => 'Βιβλία φέτος';

  @override
  String get statsEpisodesThisYear => 'Επεισόδια φέτος';

  @override
  String get statsRemoveFromYearTitle => 'Αφαίρεση από φέτος';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return 'Η ημερομηνία ολοκλήρωσης θα παραμείνει $date στον διακομιστή. Αυτό αφαιρεί μόνο το «$title» από τη λίστα βιβλίων της χρονιάς στο Absorb.';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return 'Η ημερομηνία ολοκλήρωσης παραμένει στον διακομιστή. Αυτό αφαιρεί μόνο το «$title» από τη λίστα βιβλίων της χρονιάς στο Absorb.';
  }

  @override
  String get statsRemovedFromYear => 'Αφαιρέθηκε από φέτος';

  @override
  String get statsAddBackToYearTitle => 'Επανάθεση στη φετινή χρονιά';

  @override
  String statsAddBackToYearBody(String title) {
    return 'Να προστεθεί το «$title» ξανά στη λίστα βιβλίων της χρονιάς στο Absorb;';
  }

  @override
  String get statsAddBack => 'Προσθήκη ξανά';

  @override
  String get statsAddedBackToYear => 'Προστέθηκε ξανά στη φετινή χρονιά';

  @override
  String get statsHiddenFromYear => 'Κρυμμένα από φέτος';

  @override
  String get statsNothingHidden => 'Δεν υπάρχει κάτι κρυμμένο';

  @override
  String get settingsCustomizeStats => 'Προσαρμογή στατιστικών';

  @override
  String get statsGoalTitle => 'Στόχος ακρόασης';

  @override
  String get statsGoalOff => 'Ανενεργό';

  @override
  String get statsGoalDaily => 'Ημερήσιος';

  @override
  String get statsGoalWeekly => 'Εβδομαδιαίος';

  @override
  String get statsGoalMonthly => 'Μηνιαίος';

  @override
  String get statsGoalTarget => 'Στόχος';

  @override
  String get statsGoalEnterTitle => 'Ορισμός στόχου';

  @override
  String get statsGoalEnterTimeHint => 'Λεπτά ή ω:λλ';

  @override
  String statsBooksShort(int count) {
    return '$count βιβλία';
  }

  @override
  String get statsBookChallengeTitle => 'Πρόκληση ανάγνωσης';

  @override
  String get statsBookChallengeDesc => 'Βιβλία προς ολοκλήρωση φέτος';

  @override
  String get statsDailyGoal => 'Ημερήσιος στόχος';

  @override
  String get statsWeeklyGoal => 'Εβδομαδιαίος στόχος';

  @override
  String get statsMonthlyGoal => 'Μηνιαίος στόχος';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$done από $target βιβλία';
  }

  @override
  String get statsGoalReached => 'Ο στόχος επιτεύχθηκε';

  @override
  String get statsChartTitle => 'Γράφημα ακρόασης';

  @override
  String get statsChartBar => 'Ράβδοι';

  @override
  String get statsChartLine => 'Γραμμή';

  @override
  String get statsChartHeatmap => 'Θερμικός χάρτης';

  @override
  String get statsChartDays7 => '7 ημέρες';

  @override
  String get statsChartDays30 => '30 ημέρες';

  @override
  String get statsLast30Days => 'Τελευταίες 30 ημέρες';

  @override
  String get statsThisYearTitle => 'Φέτος';

  @override
  String get statsSectionsTitle => 'Ενότητες';

  @override
  String get statsSectionTimePeriods => 'Χρονικές περίοδοι';

  @override
  String get statsHeatmapLess => 'Λιγότερο';

  @override
  String get statsHeatmapMore => 'Περισσότερο';

  @override
  String get statsDayOfWeek => 'Μέσος όρος ανά ημέρα της εβδομάδας';

  @override
  String get statsTimeSavedLabel => 'Εξοικονόμηση λόγω ταχύτητας';

  @override
  String statsTimeSavedSince(String date) {
    return 'από $date';
  }

  @override
  String get statsTimeSavedReset => 'Μηδενισμός χρόνου που εξοικονομήθηκε';

  @override
  String get statsTimeSavedResetConfirm =>
      'Ο χρόνος που εξοικονομήθηκε θα αρχίσει να μετράει ξανά από σήμερα.';

  @override
  String get statsTimeSavedResetDone =>
      'Ο χρόνος που εξοικονομήθηκε μηδενίστηκε';

  @override
  String statsOnPaceFor(int count) {
    return 'Με ρυθμό για $count βιβλία';
  }

  @override
  String get statsDaysActive => 'Ενεργές ημέρες';

  @override
  String get statsDailyAverage => 'Ημερήσιος μέσος όρος';

  @override
  String get statsLast7Days => 'Τελευταίες 7 ημέρες';

  @override
  String get statsMostListened => 'Πιο ακουσμένα';

  @override
  String get statsRecentSessions => 'Πρόσφατες συνεδρίες';

  @override
  String get appShellHomeTab => 'Αρχική';

  @override
  String get appShellLibraryTab => 'Βιβλιοθήκη';

  @override
  String get appShellAbsorbingTab => 'Absorbing';

  @override
  String get appShellStatsTab => 'Στατιστικά';

  @override
  String get appShellSettingsTab => 'Ρυθμίσεις';

  @override
  String get appShellDiscoverTab => 'Ανακάλυψη';

  @override
  String get appShellShowsTab => 'Εκπομπές';

  @override
  String get appShellPodcastsTab => 'Podcast';

  @override
  String get libraryTabEpisodes => 'Επεισόδια';

  @override
  String get filterAllEpisodes => 'Όλα';

  @override
  String get filterUnplayed => 'Μη αναπαραγμένα';

  @override
  String get episodeFeedEmpty =>
      'Κανένα επεισόδιο δεν ταιριάζει με αυτό το φίλτρο';

  @override
  String get podcastFilterUpNext => 'Επόμενα';

  @override
  String get podcastFilterNew => 'Νέα';

  @override
  String get settingsPodcastTab => 'Καρτέλα Podcast';

  @override
  String get settingsPodcastTabDesc =>
      'Δώστε σε μία βιβλιοθήκη podcast τη δική της καρτέλα στη γραμμή κάτω';

  @override
  String get settingsPodcastTabLibrary => 'Βιβλιοθήκη καρτέλας Podcast';

  @override
  String get settingsMergeImpliedByPodcastTab =>
      'Πάντα ενεργό όσο είναι ενεργοποιημένη η καρτέλα Podcast';

  @override
  String get settingsEpisodeNotifs => 'Ρυθμίσεις ειδοποιήσεων';

  @override
  String get settingsEpisodeNotifsDesc =>
      'Νέα επεισόδια podcast και επερχόμενες κυκλοφορίες βιβλίων, με έλεγχο στο παρασκήνιο';

  @override
  String get notifIntervalOff => 'Ανενεργό';

  @override
  String notifIntervalMinutes(int n) {
    return 'Κάθε $n λεπτά';
  }

  @override
  String get notifIntervalHour => 'Κάθε ώρα';

  @override
  String notifIntervalHours(int n) {
    return 'Κάθε $n ώρες';
  }

  @override
  String get settingsBatteryUnrestricted =>
      'Να επιτρέπεται απεριόριστη χρήση μπαταρίας';

  @override
  String get settingsBatteryUnrestrictedDesc =>
      'Εμποδίζει το σύστημα να παγώνει τους ελέγχους στο παρασκήνιο σε ορισμένα τηλέφωνα';

  @override
  String get appShellPressBackToExit => 'Πατήστε ξανά πίσω για έξοδο';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get sectionAppearance => 'Εμφάνιση';

  @override
  String get languageLabel => 'Γλώσσα';

  @override
  String get languageSystemDefault => 'Προεπιλογή συστήματος';

  @override
  String get languageHelpTranslateInvite =>
      'Θέλετε να βοηθήσετε στη μετάφραση του Absorb στη γλώσσα σας;';

  @override
  String get themeLabel => 'Θέμα';

  @override
  String get themeDark => 'Σκούρο';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => 'Ανοιχτό';

  @override
  String get themeAuto => 'Αυτόματο';

  @override
  String get colorSourceLabel => 'Πηγή χρώματος';

  @override
  String get colorSourceCoverDescription =>
      'Τα χρώματα της εφαρμογής ακολουθούν το εξώφυλλο του βιβλίου που παίζει';

  @override
  String get colorSourceWallpaperDescription =>
      'Τα χρώματα της εφαρμογής ακολουθούν την ταπετσαρία του συστήματος';

  @override
  String get colorSourceWallpaper => 'Ταπετσαρία';

  @override
  String get colorSourceNowPlaying => 'Τώρα παίζει';

  @override
  String get colorSourceDynamic => 'Δυναμικό';

  @override
  String get colorSourceManual => 'Χειροκίνητο';

  @override
  String get colorSourceManualDescription =>
      'Χρήση σταθερού χρώματος εφαρμογής της επιλογής σας παρακάτω';

  @override
  String get colorSourceCustom => 'Προσαρμοσμένο';

  @override
  String get useColorEverywhereLabel => 'Χρήση αυτού του χρώματος παντού';

  @override
  String get useColorEverywhereSubtitle =>
      'Χρωματίζει επίσης τις σελίδες λεπτομερειών βιβλίου και την κάρτα αναπαραγωγής με το χρώμα που ορίσατε αντί για το εξώφυλλο κάθε βιβλίου';

  @override
  String get flatBackgroundLabel => 'Επίπεδο φόντο';

  @override
  String get flatBackgroundSubtitle =>
      'Αφαιρεί τη διαβάθμιση του φόντου. Καθαρό μαύρο στη σκούρα λειτουργία για οθόνες OLED.';

  @override
  String get einkModeLabel => 'Λειτουργία e-ink';

  @override
  String get einkModeSubtitle =>
      'Ασπρόμαυρη εμφάνιση υψηλής αντίθεσης χωρίς κινούμενα στοιχεία, για οθόνες e-ink';

  @override
  String get einkModeIntroBody =>
      'Φτιαγμένο για οθόνες e-ink. Η εφαρμογή αλλάζει σε επίπεδη ασπρόμαυρη εμφάνιση υψηλής αντίθεσης, τα κινούμενα στοιχεία απενεργοποιούνται, η κάρτα αναπαραγωγής χάνει το φόντο της και η ζωντανή σύνδεση με τον διακομιστή μένει ανενεργή για εξοικονόμηση μπαταρίας. Η αναπαραγωγή και η πρόοδος συγχρονίζονται κανονικά. Οι ρυθμίσεις εμφάνισής σας διατηρούνται και επιστρέφουν όταν το απενεργοποιήσετε.';

  @override
  String get einkModeIntroConfirm => 'Ενεργοποίηση';

  @override
  String get backgroundIntensityLabel => 'Ένταση φόντου';

  @override
  String get startScreenLabel => 'Αρχική οθόνη';

  @override
  String get startScreenSubtitle =>
      'Ποια καρτέλα ανοίγει κατά την εκκίνηση της εφαρμογής';

  @override
  String get startScreenHome => 'Αρχική';

  @override
  String get startScreenLibrary => 'Βιβλιοθήκη';

  @override
  String get startScreenAbsorb => 'Absorb';

  @override
  String get startScreenStats => 'Στατιστικά';

  @override
  String get disablePageFade => 'Απενεργοποίηση σταδιακής εναλλαγής σελίδων';

  @override
  String get disablePageFadeOnSubtitle => 'Οι σελίδες αλλάζουν άμεσα';

  @override
  String get disablePageFadeOffSubtitle =>
      'Οι σελίδες εναλλάσσονται σταδιακά κατά την αλλαγή καρτελών';

  @override
  String get rectangleBookCovers => 'Ορθογώνια εξώφυλλα βιβλίων';

  @override
  String get progressTextSize => 'Μέγεθος κειμένου προόδου';

  @override
  String get rectangleBookCoversOnSubtitle =>
      'Τα εξώφυλλα εμφανίζονται σε αναλογία βιβλίου 2:3';

  @override
  String get rectangleBookCoversOffSubtitle => 'Τα εξώφυλλα είναι τετράγωνα';

  @override
  String get coverSize => 'Μέγεθος εξωφύλλων';

  @override
  String get coverSizeSubtitle =>
      'Πόσα εξώφυλλα χωρούν σε μία γραμμή του πλέγματος της βιβλιοθήκης';

  @override
  String get coverSizeSmall => 'Μικρό';

  @override
  String get coverSizeMedium => 'Μεσαίο';

  @override
  String get coverSizeLarge => 'Μεγάλο';

  @override
  String get sectionAbsorbingCards => 'Κάρτες Absorbing';

  @override
  String get fullScreenPlayer => 'Αναπαραγωγή πλήρους οθόνης';

  @override
  String get fullScreenPlayerOnSubtitle =>
      'Ενεργό - τα βιβλία ανοίγουν σε πλήρη οθόνη κατά την αναπαραγωγή';

  @override
  String get fullScreenPlayerOffSubtitle =>
      'Ανενεργό - αναπαραγωγή μέσα στην προβολή κάρτας';

  @override
  String get fullBookScrubber => 'Ολίσθηση σε ολόκληρο το βιβλίο';

  @override
  String get fullBookScrubberOnSubtitle =>
      'Ενεργό - ρυθμιστικό αναζήτησης σε ολόκληρο το βιβλίο';

  @override
  String get fullBookScrubberOffSubtitle => 'Ανενεργό - μόνο γραμμή προόδου';

  @override
  String get cardScrubbers => 'Ρυθμιστικά κάρτας';

  @override
  String get cardScrubbersBoth => 'Και τα δύο';

  @override
  String get cardScrubbersChapter => 'Κεφάλαιο';

  @override
  String get cardScrubbersLocked => 'Κλειδωμένα';

  @override
  String get cardScrubbersBothSubtitle =>
      'Οι γραμμές ολόκληρου βιβλίου και κεφαλαίου επιτρέπουν αναζήτηση';

  @override
  String get cardScrubbersChapterSubtitle =>
      'Μόνο η γραμμή κεφαλαίου επιτρέπει αναζήτηση';

  @override
  String get cardScrubbersLockedSubtitle =>
      'Η πρόοδος εμφανίζεται χωρίς δυνατότητα αναζήτησης';

  @override
  String get speedAdjustedTime => 'Χρόνος προσαρμοσμένος στην ταχύτητα';

  @override
  String get speedAdjustedTimeOnSubtitle =>
      'Ενεργό - όλοι οι χρόνοι αντικατοπτρίζουν την ταχύτητα αναπαραγωγής';

  @override
  String get speedAdjustedTimeOffSubtitle =>
      'Ανενεργό - εμφάνιση της πραγματικής διάρκειας ήχου';

  @override
  String get buttonLayout => 'Διάταξη κουμπιών';

  @override
  String get buttonLayoutSubtitle =>
      'Πώς διατάσσονται τα κουμπιά ενεργειών στην κάρτα';

  @override
  String get whenAbsorbed => 'Όταν ολοκληρωθεί';

  @override
  String get whenAbsorbedInfoTitle => 'Όταν ολοκληρωθεί';

  @override
  String get whenAbsorbedInfoContent =>
      'Ελέγχει τι συμβαίνει σε μια κάρτα Absorbing όταν τελειώνετε ένα βιβλίο ή επεισόδιο.\n\nΟι ολοκληρωμένες κάρτες αφαιρούνται αυτόματα από την οθόνη Absorbing.';

  @override
  String get whenAbsorbedSubtitle =>
      'Τι συμβαίνει με την κάρτα όταν ολοκληρωθεί ένα βιβλίο ή επεισόδιο';

  @override
  String get whenAbsorbedShowOverlay => 'Εμφάνιση επικάλυψης';

  @override
  String get whenAbsorbedAutoRelease => 'Αυτόματη αφαίρεση';

  @override
  String get mergeLibraries => 'Ενοποιημένη σελίδα Absorbing';

  @override
  String get mergeLibrariesInfoTitle => 'Ενοποιημένη σελίδα Absorbing';

  @override
  String get mergeLibrariesInfoContent =>
      'Όταν είναι ενεργή, η οθόνη Absorbing εμφανίζει όλα τα βιβλία και τα podcast σε εξέλιξη από όλες τις βιβλιοθήκες σε μία προβολή. Όταν είναι ανενεργή, εμφανίζονται μόνο στοιχεία από τη βιβλιοθήκη που έχετε επιλέξει αυτήν τη στιγμή.';

  @override
  String get mergeLibrariesOnSubtitle =>
      'Η σελίδα Absorbing εμφανίζει στοιχεία από όλες τις βιβλιοθήκες';

  @override
  String get mergeLibrariesOffSubtitle =>
      'Η σελίδα Absorbing εμφανίζει μόνο την τρέχουσα βιβλιοθήκη';

  @override
  String get queueMode => 'Λειτουργία ουράς';

  @override
  String get queueModeInfoTitle => 'Λειτουργία ουράς';

  @override
  String get queueModeInfoOff => 'Ανενεργό';

  @override
  String get queueModeInfoOffDesc =>
      'Η αναπαραγωγή σταματά όταν τελειώσει το τρέχον βιβλίο ή επεισόδιο.';

  @override
  String get queueModeInfoManual => 'Χειροκίνητη ουρά';

  @override
  String get queueModeInfoManualDesc =>
      'Οι κάρτες Absorbing λειτουργούν ως λίστα αναπαραγωγής. Όταν τελειώνει μία, παίζει αυτόματα η επόμενη μη ολοκληρωμένη κάρτα. Προσθέστε στοιχεία με το κουμπί «Προσθήκη στο Absorbing» σε ένα βιβλίο ή επεισόδιο και αναδιατάξτε τα από την οθόνη Absorbing.';

  @override
  String get queueModeOff => 'Ανενεργό';

  @override
  String get queueModeManual => 'Χειροκίνητο';

  @override
  String get queueModeAuto => 'Αυτόματο';

  @override
  String get queueModePlaylist => 'Λίστα αναπαραγωγής';

  @override
  String get queueModeCollection => 'Συλλογή';

  @override
  String get queueModeInfoPlaylist => 'Ουρά λίστας αναπαραγωγής';

  @override
  String get queueModeInfoPlaylistDesc =>
      'Παίζει τα στοιχεία με τη σειρά από μια επιλεγμένη λίστα αναπαραγωγής, παραλείποντας ό,τι έχει ήδη ολοκληρωθεί. Σταματά στο τέλος της λίστας.';

  @override
  String get queuePlaylistPickerTitle => 'Επιλέξτε λίστα αναπαραγωγής';

  @override
  String get queuePlaylistNone => 'Δεν έχει επιλεγεί λίστα αναπαραγωγής';

  @override
  String queuePlaylistActiveLabel(String name) {
    return 'Λίστα αναπαραγωγής: $name';
  }

  @override
  String get queueModePlaylistHint =>
      'Ξεκινήστε ουρά λίστας αναπαραγωγής ανοίγοντας μια λίστα αναπαραγωγής στην αρχική σελίδα.';

  @override
  String get exit => 'Έξοδος';

  @override
  String upNext(String label) {
    return 'Επόμενο: $label';
  }

  @override
  String get nothingUpNext => 'Δεν υπάρχει επόμενο';

  @override
  String get showUpNextLabel => 'Εμφάνιση του «Επόμενο» στη σελίδα Absorbing';

  @override
  String get openSeries => 'Άνοιγμα σειράς';

  @override
  String get openPlaylist => 'Άνοιγμα λίστας αναπαραγωγής';

  @override
  String get openCollection => 'Άνοιγμα συλλογής';

  @override
  String get playlistPlayAction => 'Αναπαραγωγή λίστας';

  @override
  String get playlistAllFinished => 'Όλα ολοκληρώθηκαν';

  @override
  String get queueModeBooks => 'Βιβλία';

  @override
  String get queueModePodcasts => 'Podcast';

  @override
  String get autoDownloadQueue => 'Αυτόματη λήψη ουράς';

  @override
  String get autoDownloadThisSeriesLabel => 'Αυτόματη λήψη αυτής της σειράς';

  @override
  String get autoDownloadThisShowLabel => 'Αυτόματη λήψη αυτού του podcast';

  @override
  String get autoDownloadThisPlaylistLabel =>
      'Αυτόματη λήψη αυτής της λίστας αναπαραγωγής';

  @override
  String get autoDownloadThisCollectionLabel =>
      'Αυτόματη λήψη αυτής της συλλογής';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return 'Διατήρηση των επόμενων $count στοιχείων ληφθέντων';
  }

  @override
  String get autoDownloadQueueOffSubtitle =>
      'Ανενεργό - μόνο χειροκίνητες λήψεις';

  @override
  String get sectionPlayback => 'Αναπαραγωγή';

  @override
  String get sectionMediaControls => 'Στοιχεία ελέγχου πολυμέσων';

  @override
  String get defaultSpeed => 'Προεπιλεγμένη ταχύτητα';

  @override
  String get defaultSpeedSubtitle =>
      'Τα νέα βιβλία ξεκινούν με αυτήν την ταχύτητα - κάθε βιβλίο θυμάται τη δική του';

  @override
  String get skipBack => 'Μετάβαση πίσω';

  @override
  String get skipForward => 'Μετάβαση μπροστά';

  @override
  String get iosLockScreenSkipHint =>
      'Η οθόνη κλειδώματος εμφανίζει μόνο τους αριθμούς για τους οποίους το iOS έχει εικονίδια (5, 10, 15, 30, 45, 60, 75, 90). Άλλα ποσά εμφανίζουν + στο κουμπί αλλά παραλείπουν πάλι σύμφωνα με τη ρύθμισή σας.';

  @override
  String get longSkipButtons => 'Κουμπιά μεγάλης μετάβασης';

  @override
  String get longSkipButtonsOnSubtitle =>
      'Ενεργό - το πρόγραμμα αναπαραγωγής εμφανίζει ένα δεύτερο, μεγαλύτερο ζεύγος';

  @override
  String get longSkipButtonsOffSubtitle =>
      'Ανενεργό - μόνο τα κανονικά κουμπιά μετάβασης';

  @override
  String get longSkipBack => 'Μεγάλη μετάβαση πίσω';

  @override
  String get longSkipForward => 'Μεγάλη μετάβαση μπροστά';

  @override
  String get coverShapeDefault => 'Προεπιλογή';

  @override
  String get coverShapeSquare => 'Τετράγωνο';

  @override
  String get coverShapeRectangle => 'Ορθογώνιο';

  @override
  String get coverShapeLabel => 'Σχήμα εξωφύλλου';

  @override
  String get showSubtitles => 'Εμφάνιση υποτίτλων';

  @override
  String get showSubtitlesOnSubtitle =>
      'Οι υπότιτλοι εμφανίζονται κάτω από τους τίτλους βιβλίων στη βιβλιοθήκη και στην αρχική';

  @override
  String get showSubtitlesOffSubtitle =>
      'Ανενεργό - υπότιτλοι μόνο στο φύλλο λεπτομερειών του βιβλίου';

  @override
  String get subtitleVisibilityLabel => 'Υπότιτλοι';

  @override
  String get subtitleVisibilityDefault => 'Προεπιλογή';

  @override
  String get subtitleVisibilityShow => 'Εμφάνιση';

  @override
  String get subtitleVisibilityHide => 'Απόκρυψη';

  @override
  String currentLibrarySettingsTitle(String name) {
    return 'Τρέχουσα βιβλιοθήκη: $name';
  }

  @override
  String get currentLibrarySkipOverride => 'Προσαρμοσμένα ποσά μετάβασης';

  @override
  String get currentLibrarySkipOverrideOnSubtitle =>
      'Ενεργό - αυτή η βιβλιοθήκη χρησιμοποιεί τα δικά της ποσά μετάβασης';

  @override
  String get currentLibrarySkipOverrideOffSubtitle =>
      'Ανενεργό - αυτή η βιβλιοθήκη χρησιμοποιεί τα καθολικά ποσά μετάβασης';

  @override
  String get currentLibrarySkipBack => 'Μετάβαση πίσω';

  @override
  String get currentLibrarySkipForward => 'Μετάβαση μπροστά';

  @override
  String get chapterProgressInNotification =>
      'Πρόοδος κεφαλαίου στην ειδοποίηση & στο Android Auto';

  @override
  String get chapterProgressOnSubtitle =>
      'Ενεργό - η ειδοποίηση & το Android Auto δείχνουν την πρόοδο του κεφαλαίου';

  @override
  String get chapterProgressOffSubtitle =>
      'Ανενεργό - δείχνουν την πρόοδο ολόκληρου του βιβλίου';

  @override
  String get chapterProgressInNotificationIos =>
      'Πρόοδος κεφαλαίου στην οθόνη κλειδώματος & στο CarPlay';

  @override
  String get chapterProgressOnSubtitleIos =>
      'Ενεργό - η οθόνη κλειδώματος & το CarPlay δείχνουν την πρόοδο του κεφαλαίου';

  @override
  String get nowPlayingText => 'Κείμενο «Τώρα παίζει»';

  @override
  String get nowPlayingTextSubtitle =>
      'Επιλέξτε τι εμφανίζουν τα στοιχεία ελέγχου πολυμέσων σε κάθε γραμμή';

  @override
  String get nowPlayingTopLine => 'Πάνω γραμμή';

  @override
  String get nowPlayingSecondLine => 'Δεύτερη γραμμή';

  @override
  String get nowPlayingNotShown => 'Δεν εμφανίζεται';

  @override
  String get nowPlayingTopLineRequired =>
      'Η πάνω γραμμή χρειάζεται τουλάχιστον ένα στοιχείο';

  @override
  String get nowPlayingPieceChapter => 'Κεφάλαιο';

  @override
  String get nowPlayingPieceTitle => 'Τίτλος βιβλίου';

  @override
  String get nowPlayingPieceNarrator => 'Αφηγητής';

  @override
  String get nowPlayingPieceSeries => 'Σειρά';

  @override
  String get nowPlayingPiecePercent => 'Ποσοστό βιβλίου';

  @override
  String get nowPlayingPieceChapterNumber => 'Αριθμός κεφαλαίου';

  @override
  String get nowPlayingPieceTimeLeft => 'Χρόνος που απομένει';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return 'Κεφ. $number/$total';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return 'Απομένουν $time';
  }

  @override
  String get bookDockBadgePending => 'Σε αναμονή';

  @override
  String get bookDockBadgeExtracting => 'Ανάγνωση αρχείου';

  @override
  String get bookDockBadgeFetching => 'Αναζήτηση';

  @override
  String get bookDockBadgeError => 'Σφάλμα';

  @override
  String get bookDockNeedsReview => 'Χρειάζεται έλεγχο';

  @override
  String get bookDockNoMatch => 'Καμία αντιστοιχία';

  @override
  String get bookDockApplied => 'Εφαρμόστηκε';

  @override
  String get bookDockNotApplied =>
      'Οι λεπτομέρειες που βρέθηκαν δεν χρησιμοποιήθηκαν';

  @override
  String get bookDockNoDestination => 'Δεν έχει οριστεί προορισμός';

  @override
  String get bookDockNoAuthor => 'Χωρίς συγγραφέα ακόμα';

  @override
  String get bookDockLookUpAgain => 'Αναζήτηση ξανά';

  @override
  String get bookDockLookingUp => 'Νέα αναζήτηση λεπτομερειών';

  @override
  String get bookDockLookUpFailed => 'Δεν ήταν δυνατή η αναζήτηση λεπτομερειών';

  @override
  String get bookDockProposedChanges => 'Προτεινόμενες αλλαγές';

  @override
  String get bookDockNoChanges =>
      'Δεν βρέθηκαν ακόμα λεπτομέρειες στο διαδίκτυο';

  @override
  String get bookDockStillReading =>
      'Ο διακομιστής διαβάζει ακόμα αυτό το αρχείο';

  @override
  String get bookDockRoleBook => 'Βιβλίο';

  @override
  String get bookDockRoleCover => 'Εξώφυλλο';

  @override
  String get bookDockRoleMetadata => 'Μεταδεδομένα';

  @override
  String get bookDockRoleExtra => 'Επιπλέον';

  @override
  String get bookDockFieldTitle => 'Τίτλος';

  @override
  String get bookDockFieldSubtitle => 'Υπότιτλος';

  @override
  String get bookDockFieldAuthors => 'Συγγραφείς';

  @override
  String get bookDockFieldSeries => 'Σειρά';

  @override
  String get bookDockFieldPublisher => 'Εκδότης';

  @override
  String get bookDockFieldYear => 'Έτος';

  @override
  String get bookDockFieldLanguage => 'Γλώσσα';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return '$percent% αντιστοιχία';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία',
      one: '1 αρχείο',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return 'Πηγαίνει στη βιβλιοθήκη $library';
  }

  @override
  String bookDockChangedFields(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count πεδία',
      one: '1 πεδίο',
    );
    return '$_temp0';
  }

  @override
  String bookDockFilesInEntry(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία σε αυτήν την καταχώριση',
      one: 'Αρχείο σε αυτήν την καταχώριση',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return 'Προστέθηκε $date';
  }

  @override
  String get bookDockAddToLibrary => 'Προσθήκη στη βιβλιοθήκη';

  @override
  String get bookDockUseFound => 'Χρήση των λεπτομερειών που βρέθηκαν';

  @override
  String get bookDockRemoveTitle => 'Αφαίρεση από το Book Dock;';

  @override
  String get bookDockRemoveFailed =>
      'Δεν ήταν δυνατή η αφαίρεση αυτού του αρχείου';

  @override
  String get bookDockPickLibrary => 'Σε ποια βιβλιοθήκη να προστεθεί;';

  @override
  String get bookDockNoLibraries =>
      'Ο λογαριασμός σας δεν μπορεί να προσθέσει βιβλία σε βιβλιοθήκη';

  @override
  String get bookDockFileFailed =>
      'Δεν ήταν δυνατή η προσθήκη αυτού του αρχείου στη βιβλιοθήκη';

  @override
  String get bookDockDuplicateBody =>
      'Ένα αρχείο με αυτό το όνομα υπάρχει ήδη σε εκείνη τη βιβλιοθήκη. Να αφαιρεθεί από το Book Dock;';

  @override
  String get bookDockDetailsUpdated => 'Οι λεπτομέρειες ενημερώθηκαν';

  @override
  String get bookDockUseFoundFailed => 'Δεν υπάρχουν λεπτομέρειες προς χρήση';

  @override
  String bookDockRemoveBody(String title) {
    return 'Αυτό διαγράφει το $title από τον διακομιστή.';
  }

  @override
  String bookDockRemoved(String title) {
    return 'Το $title αφαιρέθηκε από το Book Dock';
  }

  @override
  String bookDockFiled(String title, String library) {
    return 'Το $title προστέθηκε στη βιβλιοθήκη $library';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return 'Δεν ήταν δυνατή η προσθήκη αυτού του αρχείου: $reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return 'Υπάρχει ήδη στη βιβλιοθήκη $library';
  }

  @override
  String get bomatchSearchAll => 'Αναζήτηση σε όλες τις πηγές';

  @override
  String get bomatchSearching => 'Αναζήτηση...';

  @override
  String get bomatchSearchFailed =>
      'Δεν ήταν δυνατή η αναζήτηση αντιστοιχιών. Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';

  @override
  String get bomatchNoResults => 'Δεν βρέθηκαν αντιστοιχίες';

  @override
  String get bomatchStrong => 'Ισχυρές αντιστοιχίες';

  @override
  String get bomatchPossible => 'Πιθανές αντιστοιχίες';

  @override
  String get bomatchSourceTimeout => 'έληξε ο χρόνος';

  @override
  String get bomatchSourceBusy => 'κατειλημμένο';

  @override
  String get bomatchSourceFailed => 'απέτυχε';

  @override
  String get bomatchLinked => 'Συνδέθηκε';

  @override
  String get bomatchSameIsbn => 'Ίδιο ISBN';

  @override
  String get bomatchFewDetails => 'Λίγες λεπτομέρειες';

  @override
  String get bomatchBack => 'Όλα τα αποτελέσματα';

  @override
  String get bomatchFillEmpty => 'Συμπλήρωση κενών';

  @override
  String get bomatchTakeAll => 'Λήψη όλων';

  @override
  String get bomatchOnlyDifferences => 'Μόνο διαφορές';

  @override
  String get bomatchNow => 'Τώρα';

  @override
  String get bomatchEmpty => 'Κενό';

  @override
  String get bomatchKindNew => 'Νέο';

  @override
  String get bomatchKindChange => 'Αλλαγή';

  @override
  String get bomatchKindSmall => 'Μικρή αλλαγή';

  @override
  String get bomatchKindSame => 'Ίδιο';

  @override
  String get bomatchKindNone => 'Δεν υπάρχει στο αποτέλεσμα';

  @override
  String get bomatchKeep => 'Διατήρηση';

  @override
  String get bomatchUse => 'Χρήση';

  @override
  String get bomatchMerge => 'Συγχώνευση';

  @override
  String get bomatchReplace => 'Αντικατάσταση';

  @override
  String get bomatchUseThis => 'Χρήση αυτού';

  @override
  String get bomatchChosen => 'Επιλέχθηκε';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count άλλα βιβλία',
      one: '1 άλλο βιβλίο',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αλλαγές',
      one: '1 αλλαγή',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count νέα',
      one: '1 νέο',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Εφαρμογή $count αλλαγών',
      one: 'Εφαρμογή 1 αλλαγής',
      zero: 'Εφαρμογή',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count άλλες πηγές',
      one: '1 άλλη πηγή',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return 'Από $source';
  }

  @override
  String get breqTitle => 'Αιτήματα βιβλίων';

  @override
  String get breqTabRequest => 'Αίτημα βιβλίου';

  @override
  String get breqTabMine => 'Τα αιτήματά μου';

  @override
  String get breqTabAll => 'Όλα τα αιτήματα';

  @override
  String get breqNoAccess =>
      'Ο λογαριασμός σας δεν μπορεί να ζητήσει βιβλία σε αυτόν τον διακομιστή.';

  @override
  String get breqTitleHint => 'Τίτλος βιβλίου';

  @override
  String get breqAuthorHint => 'Συγγραφέας';

  @override
  String get breqKindAudiobook => 'Ηχητικό βιβλίο';

  @override
  String get breqKindEbook => 'Ηλεκτρονικό βιβλίο';

  @override
  String get breqKindComic => 'Κόμικ';

  @override
  String get breqSearch => 'Αναζήτηση';

  @override
  String get breqSearching => 'Αναζήτηση...';

  @override
  String get breqSearchFailed =>
      'Δεν ήταν δυνατή η αναζήτηση. Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';

  @override
  String get breqSearchPrompt =>
      'Αναζητήστε ένα βιβλίο που δεν υπάρχει ακόμα στη βιβλιοθήκη για να το ζητήσετε.';

  @override
  String get breqNoResults => 'Δεν βρέθηκαν βιβλία που να ταιριάζουν';

  @override
  String get breqInLibrary => 'Στη βιβλιοθήκη σας';

  @override
  String get breqYouAsked => 'Το ζητήσατε εσείς';

  @override
  String get breqSomeoneAsked => 'Έχει ήδη ζητηθεί από κάποιον άλλον';

  @override
  String get breqView => 'Προβολή';

  @override
  String get breqRequest => 'Αίτημα';

  @override
  String get breqRequested => 'Ζητήθηκε';

  @override
  String get breqAddMeToo => 'Προσθήκη και εμένα';

  @override
  String get breqLibrary => 'Βιβλιοθήκη';

  @override
  String get breqLibraryApprover => 'Να αποφασίσει ο εγκρίνων';

  @override
  String get breqLibraryChoose => 'Επιλέξτε βιβλιοθήκη';

  @override
  String get breqNote => 'Σημείωση για τον εγκρίνοντα';

  @override
  String get breqNoteHint =>
      'Οτιδήποτε αξίζει να γνωρίζουμε για αυτό το αίτημα';

  @override
  String get breqAutoApproved => 'Τα αιτήματά σας εγκρίνονται αμέσως.';

  @override
  String get breqSubmitted => 'Το αίτημα υποβλήθηκε';

  @override
  String get breqJoined => 'Προστεθήκατε στο υπάρχον αίτημα';

  @override
  String get breqFailed => 'Δεν ήταν δυνατή η αποστολή του αιτήματος';

  @override
  String get breqStatusPending => 'Σε αναμονή';

  @override
  String get breqStatusApproved => 'Εγκρίθηκε';

  @override
  String get breqStatusRejected => 'Απορρίφθηκε';

  @override
  String get breqStatusCancelled => 'Ακυρώθηκε';

  @override
  String get breqStatusSearching => 'Αναζήτηση';

  @override
  String get breqStatusGrabbed => 'Βρέθηκε έκδοση';

  @override
  String get breqStatusDownloading => 'Λήψη σε εξέλιξη';

  @override
  String get breqStatusImporting => 'Εισαγωγή';

  @override
  String get breqStatusNeedsReview => 'Χρειάζεται έλεγχο';

  @override
  String get breqStatusAvailable => 'Διαθέσιμο';

  @override
  String get breqStatusFailed => 'Απέτυχε';

  @override
  String get breqWaitingApproval => 'Αναμονή έγκρισης';

  @override
  String get breqWaitingRelease => 'Αναμονή για επιλογή έκδοσης';

  @override
  String get breqLookingForRelease => 'Αναζήτηση έκδοσης';

  @override
  String get breqStartingDownload => 'Έναρξη λήψης';

  @override
  String get breqAddingToLibrary => 'Προσθήκη στη βιβλιοθήκη';

  @override
  String get breqWaitingCheck => 'Αναμονή χειροκίνητου ελέγχου';

  @override
  String get breqReady => 'Έτοιμο στη βιβλιοθήκη σας';

  @override
  String get breqSomethingWrong => 'Κάτι πήγε στραβά';

  @override
  String get breqShowHidden => 'Εμφάνιση κρυμμένων';

  @override
  String get breqHidden => 'Κρυμμένο';

  @override
  String get breqMineEmpty => 'Δεν έχετε ζητήσει ακόμα κανένα βιβλίο.';

  @override
  String get breqAllEmpty => 'Δεν υπάρχουν αιτήματα ακόμα.';

  @override
  String get breqLoadFailed => 'Δεν ήταν δυνατή η φόρτωση των αιτημάτων.';

  @override
  String get breqLoadMore => 'Φόρτωση περισσότερων';

  @override
  String get breqApprove => 'Έγκριση';

  @override
  String get breqReject => 'Απόρριψη';

  @override
  String get breqCancel => 'Ακύρωση αιτήματος';

  @override
  String get breqHide => 'Απόκρυψη από τη λίστα μου';

  @override
  String get breqUnhide => 'Εμφάνιση στη λίστα μου';

  @override
  String get breqLeave => 'Αποχώρηση από το αίτημα';

  @override
  String get breqDelete => 'Διαγραφή αιτήματος';

  @override
  String get breqOpenBook => 'Άνοιγμα βιβλίου';

  @override
  String get breqCancelConfirm =>
      'Να ακυρωθεί αυτό το αίτημα; Θα σταματήσει και κάθε λήψη σε εξέλιξη.';

  @override
  String get breqDeleteConfirm =>
      'Να διαγραφεί αυτό το αίτημα; Αυτή η ενέργεια δεν μπορεί να αναιρεθεί.';

  @override
  String get breqRejectTitle => 'Απόρριψη αιτήματος';

  @override
  String get breqRejectReason => 'Λόγος (προαιρετικό)';

  @override
  String get breqApproveTitle => 'Έγκριση αιτήματος';

  @override
  String get breqApproveLibraryNeeded =>
      'Επιλέξτε τη βιβλιοθήκη στην οποία θα μπει αυτό το βιβλίο.';

  @override
  String get breqApprovedToast => 'Το αίτημα εγκρίθηκε';

  @override
  String get breqRejectedToast => 'Το αίτημα απορρίφθηκε';

  @override
  String get breqCancelledToast => 'Το αίτημα ακυρώθηκε';

  @override
  String get breqHiddenToast => 'Κρύφτηκε από τη λίστα σας';

  @override
  String get breqRestoredToast => 'Επέστρεψε στη λίστα σας';

  @override
  String get breqDeletedToast => 'Το αίτημα διαγράφηκε';

  @override
  String get breqLeftToast => 'Αποχωρήσατε από αυτό το αίτημα';

  @override
  String get breqActionFailed => 'Δεν ήταν δυνατή η ενημέρωση του αιτήματος';

  @override
  String get breqFactRequestedBy => 'Ζητήθηκε από';

  @override
  String get breqFactRequestedOn => 'Ζητήθηκε στις';

  @override
  String get breqFactLibrary => 'Βιβλιοθήκη';

  @override
  String get breqFactDecidedBy => 'Απόφαση από';

  @override
  String get breqFactNote => 'Σημείωση από τον αιτούντα';

  @override
  String get breqFactDecisionNote => 'Σημείωση απόφασης';

  @override
  String get breqFactAlsoWanted => 'Το θέλουν επίσης';

  @override
  String get breqLibraryCta => 'Αίτημα βιβλίου';

  @override
  String get breqSettingsSubtitle =>
      'Ζητήστε βιβλία που δεν υπάρχουν ακόμα στη βιβλιοθήκη';

  @override
  String get navHoldBookRequests => 'Αιτήματα βιβλίων';

  @override
  String breqLibraryDefault(String library) {
    return 'Προεπιλογή ($library)';
  }

  @override
  String breqFailedReason(String reason) {
    return 'Δεν ήταν δυνατή η αποστολή του αιτήματος: $reason';
  }

  @override
  String breqBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία',
      one: '1 βιβλίο',
    );
    return '$_temp0';
  }

  @override
  String breqDownloadingPercent(int percent) {
    return 'Λήψη, $percent%';
  }

  @override
  String breqAddedTo(String library) {
    return 'Προστέθηκε στη βιβλιοθήκη $library';
  }

  @override
  String breqRejectedWithNote(String note) {
    return 'Απορρίφθηκε: $note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return 'Απέτυχε: $reason';
  }

  @override
  String breqRequestedBy(String name) {
    return 'Ζητήθηκε από $name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return 'Δεν ήταν δυνατή η ενημέρωση του αιτήματος: $reason';
  }

  @override
  String breqFooterCta(String query) {
    return 'Αίτημα για «$query»';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αιτήματα',
      one: '1 αίτημα',
      zero: 'Κανένα αίτημα',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => 'Εύρεση έκδοσης';

  @override
  String get breqTryAnotherRelease => 'Δοκιμή άλλης έκδοσης';

  @override
  String get breqApproveAndFind => 'Έγκριση και εύρεση έκδοσης';

  @override
  String get breqReviewButton => 'Έλεγχος λήψης';

  @override
  String get breqStopDownload => 'Διακοπή λήψης';

  @override
  String get breqStopDownloadConfirm =>
      'Να διακοπεί αυτή η λήψη; Το αίτημα επιστρέφει σε κατάσταση εγκεκριμένου ώστε να επιλεγεί άλλη έκδοση.';

  @override
  String get breqDiscardImport => 'Απόρριψη λήψης';

  @override
  String get breqDiscardConfirm =>
      'Να απορριφθεί αυτή η λήψη; Το αίτημα επισημαίνεται ως αποτυχημένο και μπορεί να δοκιμαστεί ξανά με άλλη έκδοση.';

  @override
  String get breqFileAnyway => 'Προσθήκη στη βιβλιοθήκη';

  @override
  String get breqFiledToast => 'Προστέθηκε στη βιβλιοθήκη';

  @override
  String get breqDiscardedToast => 'Η λήψη απορρίφθηκε';

  @override
  String get breqStoppedToast => 'Η λήψη σταμάτησε';

  @override
  String get breqGrabTitle => 'Λήψη αυτής της έκδοσης;';

  @override
  String get breqGrab => 'Λήψη';

  @override
  String get breqGrabbed => 'Η λήψη ξεκίνησε';

  @override
  String get breqGrabFailed => 'Δεν ήταν δυνατή η έναρξη αυτής της λήψης';

  @override
  String get breqReleaseVipWarning =>
      'Αυτός ο tracker επιτρέπει τη λήψη μόνο σε λογαριασμούς VIP.';

  @override
  String get breqReleaseNoBookFile =>
      'Αυτή η έκδοση δεν έχει αρχείο βιβλίου που το BookOrbit μπορεί να προσθέσει σε βιβλιοθήκη.';

  @override
  String get breqReleaseCheckFailed =>
      'Δεν ήταν δυνατός ο έλεγχος του περιεχομένου αυτής της έκδοσης. Δοκιμάστε ξανά ή επιλέξτε άλλη.';

  @override
  String get breqCheckingRelease => 'Έλεγχος των αρχείων...';

  @override
  String get breqSearchAgain => 'Νέα αναζήτηση';

  @override
  String get breqSearchTerms => 'Όροι αναζήτησης';

  @override
  String get breqIsbnHint => 'Αφήστε κενό για αναζήτηση με τίτλο και συγγραφέα';

  @override
  String get breqSearchingIndexers =>
      'Αναζήτηση στους indexers σας. Μπορεί να διαρκέσει έως και ένα λεπτό.';

  @override
  String get breqReleasesFailed => 'Δεν ήταν δυνατή η αναζήτηση εκδόσεων.';

  @override
  String get breqNoSourcesSetUp =>
      'Δεν έχουν ρυθμιστεί πηγές αναζήτησης στο BookOrbit.';

  @override
  String get breqNoSourcesOn =>
      'Όλες οι πηγές αναζήτησης είναι απενεργοποιημένες στο BookOrbit.';

  @override
  String get breqNoSourceCarries =>
      'Καμία από τις πηγές αναζήτησης δεν διαθέτει αυτό το είδος βιβλίου.';

  @override
  String get breqNoReleases =>
      'Δεν βρέθηκαν εκδόσεις. Δοκιμάστε άλλους όρους αναζήτησης.';

  @override
  String get breqFromCache => 'από πρόσφατη αναζήτηση';

  @override
  String get breqIndexerUnauthorized => 'η σύνδεση απέτυχε';

  @override
  String get breqIndexerThrottled => 'απασχολημένο';

  @override
  String get breqIndexerTimeout => 'έληξε ο χρόνος';

  @override
  String get breqIndexerUnreachable => 'μη προσβάσιμο';

  @override
  String get breqIndexerNoMedium => 'δεν το διαθέτει';

  @override
  String get breqIndexerError => 'απέτυχε';

  @override
  String get breqSortBest => 'Καλύτερη αντιστοίχιση';

  @override
  String get breqSortSeeders => 'Seeders';

  @override
  String get breqSortSize => 'Μέγεθος';

  @override
  String get breqSortNewest => 'Νεότερα';

  @override
  String get breqFreeleech => 'Freeleech';

  @override
  String get breqVipOnly => 'Μόνο VIP';

  @override
  String get breqAlreadyGrabbed => 'Έχει ληφθεί ξανά';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => 'Τίτλος';

  @override
  String get breqReasonAuthor => 'Συγγραφέας';

  @override
  String get breqReasonUnknownFormat => 'Άγνωστη μορφή';

  @override
  String get breqReasonExpectedSize => 'Μέγεθος';

  @override
  String get breqReasonSuspiciousSize => 'Ασυνήθιστο μέγεθος';

  @override
  String get breqReasonFreeleech => 'Freeleech';

  @override
  String get breqReasonSeveralBooks => 'Πολλά βιβλία';

  @override
  String get breqReviewTitle => 'Λήψη σε αναμονή ελέγχου';

  @override
  String get breqReviewFailed => 'Αδυναμία φόρτωσης των στοιχείων της λήψης.';

  @override
  String get breqReviewDockGone =>
      'Τα ληφθέντα αρχεία δεν βρίσκονται πλέον στο Book Dock.';

  @override
  String get breqReviewNoLibrary =>
      'Αυτό το αίτημα δεν έχει βιβλιοθήκη για την προσθήκη του βιβλίου.';

  @override
  String breqGrabFailedReason(String reason) {
    return 'Αδυναμία έναρξης αυτής της λήψης: $reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return 'Αδυναμία ελέγχου του περιεχομένου αυτής της έκδοσης: $reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return 'Αδυναμία αναζήτησης εκδόσεων: $reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return 'Αδυναμία φόρτωσης των στοιχείων της λήψης: $reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εκδόσεις',
      one: '1 έκδοση',
      zero: 'Καμία έκδοση',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία',
      one: '1 αρχείο',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία',
      one: '1 αρχείο',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return '$seeders seeders, $leechers leechers';
  }

  @override
  String breqScore(int score) {
    return 'Βαθμολογία $score';
  }

  @override
  String breqReasonPreferredFormat(String format) {
    return 'Προτιμώμενο $format';
  }

  @override
  String breqReasonFormat(String format) {
    return '$format';
  }

  @override
  String breqReasonSeeders(String count) {
    return '$count seeders';
  }

  @override
  String breqReviewScore(int score, int threshold) {
    return 'Βαθμολογία αντιστοίχισης $score. Οι λήψεις με βαθμολογία $threshold ή υψηλότερη προστίθενται αυτόματα.';
  }

  @override
  String breqReviewRequested(String value) {
    return 'Ζητήθηκε: $value';
  }

  @override
  String breqReviewImported(String value) {
    return 'Ελήφθη: $value';
  }

  @override
  String get breqKindBoth => 'Και τα δύο';

  @override
  String get breqEbookLibrary => 'Βιβλιοθήκη ηλεκτρονικών βιβλίων';

  @override
  String get breqAudiobookLibrary => 'Βιβλιοθήκη ηχητικών βιβλίων';

  @override
  String get breqRequestBoth => 'Αίτημα και για τα δύο';

  @override
  String get breqAddMeToBoth => 'Προσθήκη μου και στα δύο';

  @override
  String get breqRequestEbook => 'Αίτημα ηλεκτρονικού βιβλίου';

  @override
  String get breqRequestAudiobook => 'Αίτημα ηχητικού βιβλίου';

  @override
  String get breqAddMeEbook => 'Προσθήκη μου στο αίτημα ηλεκτρονικού βιβλίου';

  @override
  String get breqAddMeAudiobook => 'Προσθήκη μου στο αίτημα ηχητικού βιβλίου';

  @override
  String get breqPairSubmitted =>
      'Ζητήθηκαν το ηλεκτρονικό και το ηχητικό βιβλίο';

  @override
  String get breqPairOneJoined =>
      'Ζητήθηκαν και τα δύο. Το ένα ήταν ήδη καθ\' οδόν, οπότε προστεθήκατε σε αυτό το αίτημα';

  @override
  String get breqJoinedBoth => 'Προστεθήκατε και στα δύο αιτήματα';

  @override
  String get breqJoinsOwned =>
      'Το αίτημα υποβλήθηκε. Θα ενωθεί με το αντίγραφο που έχετε ήδη στη βιβλιοθήκη σας';

  @override
  String get speedBookmarkInControls =>
      'Ταχύτητα και σελιδοδείκτης στα χειριστήρια πολυμέσων';

  @override
  String get speedBookmarkOnSubtitle =>
      'Ενεργό - η ειδοποίηση δείχνει ταχύτητα και σελιδοδείκτη· η μετάβαση κεφαλαίου μένει στο Android Auto';

  @override
  String get speedBookmarkOffSubtitle =>
      'Ανενεργό - η ειδοποίηση δείχνει μετάβαση κεφαλαίου· η ταχύτητα και ο σελιδοδείκτης μένουν στο Android Auto';

  @override
  String get lockSeekBar => 'Κλείδωμα γραμμής αναζήτησης';

  @override
  String get lockSeekBarOnSubtitle =>
      'Ενεργό - ο δρομέας στην ειδοποίηση, την οθόνη κλειδώματος και το αυτοκίνητο δείχνει την πρόοδο αλλά δεν μπορεί να σύρεται';

  @override
  String get lockSeekBarOffSubtitle =>
      'Ανενεργό - σύρετε τον δρομέα στην ειδοποίηση, την οθόνη κλειδώματος και το αυτοκίνητο για να μετακινηθείτε';

  @override
  String get autoRewindOnResume => 'Αυτόματη επαναφορά κατά την επανέναρξη';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return 'Ενεργό - ${min}s έως ${max}s ανάλογα με τη διάρκεια της παύσης';
  }

  @override
  String get autoRewindOffSubtitle => 'Ανενεργό';

  @override
  String get rewindRange => 'Εύρος επαναφοράς';

  @override
  String get rewindAfterPausedFor => 'Επαναφορά μετά από παύση';

  @override
  String get rewindAnyPause => 'Οποιαδήποτε παύση';

  @override
  String get rewindAlwaysLabel => 'Πάντα';

  @override
  String get rewindAlwaysDescription =>
      'Επαναφορά σε κάθε επανέναρξη, ακόμη και μετά από σύντομες διακοπές';

  @override
  String rewindAfterDescription(String seconds) {
    return 'Επαναφορά μόνο αν η παύση διαρκέσει $seconds+ δευτερόλεπτα';
  }

  @override
  String get chapterBarrier => 'Όριο κεφαλαίου';

  @override
  String get chapterBarrierSubtitle =>
      'Να μην γίνεται αυτόματη επαναφορά πριν από την αρχή του τρέχοντος κεφαλαίου';

  @override
  String get rewindInstant => 'Άμεσα';

  @override
  String rewindPause(String duration) {
    return 'Παύση $duration';
  }

  @override
  String get rewindNoRewind => 'χωρίς επαναφορά';

  @override
  String rewindSeconds(String seconds) {
    return 'Επαναφορά ${seconds}s';
  }

  @override
  String get sectionSleepTimer => 'Χρονοδιακόπτης ύπνου';

  @override
  String get sleep => 'Ύπνος';

  @override
  String get sleepTimer => 'Χρονοδιακόπτης ύπνου';

  @override
  String get shakeDuringSleepTimer => 'Ανακίνηση κατά τον χρονοδιακόπτη ύπνου';

  @override
  String get shakeOff => 'Ανενεργό';

  @override
  String get shakeAddTime => 'Προσθήκη χρόνου';

  @override
  String get shakeReset => 'Επαναφορά';

  @override
  String get shakeAdds => 'Η ανακίνηση προσθέτει';

  @override
  String get sleepAddAmount => 'Ποσό χρόνου προς προσθήκη';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes λεπτά';
  }

  @override
  String get shakeSensitivity => 'Ευαισθησία ανακίνησης';

  @override
  String get shakeSensitivityVeryLow => 'Πολύ χαμηλή';

  @override
  String get shakeSensitivityLow => 'Χαμηλή';

  @override
  String get shakeSensitivityMedium => 'Μεσαία';

  @override
  String get shakeSensitivityHigh => 'Υψηλή';

  @override
  String get shakeSensitivityVeryHigh => 'Πολύ υψηλή';

  @override
  String get buttonDuringSleepTimer => 'Κουμπί ακουστικών κατά την τελική φάση';

  @override
  String get buttonDuringSleepTimerHint =>
      'Στις τελευταίες στιγμές πριν το τέλος, ένα πάτημα επαναφέρει τον χρονοδιακόπτη αντί να κάνει παύση. Το διπλό πάτημα εξακολουθεί να προχωρά στο επόμενο.';

  @override
  String get resetTimerOnPause => 'Επαναφορά χρονοδιακόπτη στην παύση';

  @override
  String get resetTimerOnPauseOnSubtitle =>
      'Ο χρονοδιακόπτης ξεκινά ξανά από την πλήρη διάρκεια όταν συνεχίσετε';

  @override
  String get resetTimerOnPauseOffSubtitle =>
      'Ο χρονοδιακόπτης συνεχίζει από εκεί που σταμάτησε';

  @override
  String get fadeVolumeBeforeSleep => 'Σταδιακή μείωση έντασης πριν τον ύπνο';

  @override
  String get fadeVolumeOnSubtitle =>
      'Μειώνει σταδιακά την ένταση στα τελευταία 30 δευτερόλεπτα';

  @override
  String get fadeVolumeOffSubtitle =>
      'Η αναπαραγωγή σταματά αμέσως όταν λήξει ο χρονοδιακόπτης';

  @override
  String get autoSleepTimer => 'Αυτόματος χρονοδιακόπτης ύπνου';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration λεπτά';
  }

  @override
  String get autoSleepTimerOffSubtitle =>
      'Αυτόματη έναρξη χρονοδιακόπτη ύπνου μέσα σε ένα χρονικό παράθυρο';

  @override
  String get windowStart => 'Έναρξη παραθύρου';

  @override
  String get windowEnd => 'Λήξη παραθύρου';

  @override
  String get timerDuration => 'Διάρκεια χρονοδιακόπτη';

  @override
  String get timer => 'Χρονοδιακόπτης';

  @override
  String get endOfChapter => 'Τέλος κεφαλαίου';

  @override
  String startMinTimer(int minutes) {
    return 'Έναρξη χρονοδιακόπτη $minutes λεπτών';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return 'Ύπνος μετά από $count $label';
  }

  @override
  String get addMoreTime => 'Προσθήκη χρόνου';

  @override
  String get cancelTimer => 'Ακύρωση χρονοδιακόπτη';

  @override
  String chaptersLeftCount(int count) {
    return '$count κεφ. απομένουν';
  }

  @override
  String get sectionDownloadsAndStorage => 'Λήψεις και αποθήκευση';

  @override
  String get downloadOverWifiOnly => 'Δίκτυο λήψης';

  @override
  String get downloadOverWifiOnSubtitle => 'Μόνο Wi-Fi';

  @override
  String get downloadOverWifiOffSubtitle => 'Οποιαδήποτε σύνδεση';

  @override
  String get autoDownloadOnWifi => 'Αυτόματη λήψη βιβλίων που ξεκινάτε';

  @override
  String get autoDownloadOnWifiInfoTitle =>
      'Αυτόματη λήψη βιβλίων που ξεκινάτε';

  @override
  String get autoDownloadOnWifiInfoContent =>
      'Όταν ξεκινάτε ροή ενός βιβλίου, ολόκληρο το βιβλίο λαμβάνεται στο παρασκήνιο ώστε να το έχετε εκτός σύνδεσης χωρίς να ξεκινήσετε μόνοι σας τη λήψη. Αυτές οι λήψεις ακολουθούν τη ρύθμιση Δίκτυο λήψης παραπάνω, οπότε ορίστε την σε Οποιαδήποτε σύνδεση αν θέλετε να εκτελούνται και με δεδομένα κινητής.';

  @override
  String get autoDownloadOnWifiOnSubtitle =>
      'Τα βιβλία που ακούτε σε ροή λαμβάνονται αυτόματα στο παρασκήνιο';

  @override
  String get autoDownloadOnWifiOffSubtitle => 'Ανενεργό';

  @override
  String get concurrentDownloads => 'Ταυτόχρονες λήψεις';

  @override
  String get autoDownload => 'Αυτόματη λήψη';

  @override
  String get autoDownloadSubtitle =>
      'Ενεργοποίηση ανά σειρά, podcast, λίστα αναπαραγωγής ή συλλογή από τις σελίδες λεπτομερειών τους';

  @override
  String get autoDownloadEnabledFor => 'Ενεργό για';

  @override
  String get autoDownloadEnabledForNone => 'Τίποτα ακόμη';

  @override
  String get autoDownloadSourceUnnamed => 'Δεν έχει φορτωθεί ακόμη';

  @override
  String get keepNext => 'Διατήρηση επόμενων';

  @override
  String get keepNextInfoTitle => 'Διατήρηση επόμενων';

  @override
  String get keepNextInfoContent =>
      'Ο αριθμός στοιχείων που διατηρούνται ληφθέντα, συμπεριλαμβανομένου αυτού που ακούτε τώρα. Για παράδειγμα, η «Διατήρηση επόμενων 3» σημαίνει ότι το τρέχον βιβλίο και τα επόμενα 2 της ίδιας σειράς, podcast, λίστας αναπαραγωγής ή συλλογής θα παραμένουν ληφθέντα. Ισχύει για κάθε αυτόματη λήψη που ενεργοποιείτε.';

  @override
  String get deleteAbsorbedDownloads => 'Διαγραφή απορροφημένων λήψεων';

  @override
  String get deleteAbsorbedDownloadsInfoTitle =>
      'Διαγραφή απορροφημένων λήψεων';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      'Όταν είναι ενεργό, τα ληφθέντα βιβλία ή επεισόδια διαγράφονται αυτόματα από αυτήν τη συσκευή αφού τα ολοκληρώσετε στο Absorb. Η ολοκλήρωση ενός στοιχείου στον ιστό ή σε άλλη συσκευή δεν διαγράφει τη λήψη του εδώ.';

  @override
  String get deleteAbsorbedOnSubtitle =>
      'Τα ολοκληρωμένα στοιχεία αφαιρούνται για εξοικονόμηση χώρου';

  @override
  String get deleteAbsorbedOffSubtitle =>
      'Ανενεργό - οι ολοκληρωμένες λήψεις διατηρούνται';

  @override
  String get downloadLocation => 'Θέση λήψης';

  @override
  String get storageUsed => 'Χώρος που χρησιμοποιείται';

  @override
  String storageUsedByDownloads(String size) {
    return '$size χρησιμοποιούνται από λήψεις';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return '$free ελεύθερα από $total';
  }

  @override
  String get manageDownloads => 'Διαχείριση λήψεων';

  @override
  String get streamingCache => 'Προσωρινή μνήμη ροής';

  @override
  String get streamingCacheInfoTitle => 'Προσωρινή μνήμη ροής';

  @override
  String get streamingCacheInfoContent =>
      'Αποθηκεύει προσωρινά στον δίσκο τον ήχο που ακούτε σε ροή, ώστε να μη χρειάζεται να ληφθεί ξανά αν πάτε πίσω ή ξανακούσετε κάποια σημεία. Η προσωρινή μνήμη διαχειρίζεται αυτόματα - τα παλαιότερα αρχεία αφαιρούνται όταν συμπληρωθεί το όριο μεγέθους. Είναι ξεχωριστή από τα πλήρως ληφθέντα βιβλία.';

  @override
  String get streamingCacheOff => 'Ανενεργό';

  @override
  String get streamingCacheOffSubtitle =>
      'Ανενεργό - ο ήχος μεταδίδεται χωρίς προσωρινή αποθήκευση';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size MB - ο ήχος που ακούστηκε πρόσφατα σε ροή αποθηκεύεται προσωρινά στον δίσκο';
  }

  @override
  String get clearCache => 'Εκκαθάριση προσωρινής μνήμης';

  @override
  String get streamingCacheCleared => 'Η προσωρινή μνήμη ροής εκκαθαρίστηκε';

  @override
  String get sectionLibrary => 'Βιβλιοθήκη';

  @override
  String get hideEbookOnlyTitles => 'Απόκρυψη τίτλων μόνο ηλεκτρονικού βιβλίου';

  @override
  String get hideEbookOnlyOnSubtitle =>
      'Τα βιβλία χωρίς αρχεία ήχου είναι κρυμμένα';

  @override
  String get hideEbookOnlyOffSubtitle =>
      'Ανενεργό - εμφανίζονται όλα τα στοιχεία της βιβλιοθήκης';

  @override
  String get homeCardsOpenDetails => 'Άνοιγμα λεπτομερειών από την Αρχική';

  @override
  String get homeCardsOpenDetailsOnSubtitle =>
      'Το πάτημα σε κάρτα Συνέχεια ακρόασης ή Συνέχεια ανάγνωσης ανοίγει τις λεπτομέρειές της';

  @override
  String get homeCardsOpenDetailsOffSubtitle =>
      'Το πάτημα σε κάρτα Συνέχεια ακρόασης ή Συνέχεια ανάγνωσης συνεχίζει από εκεί που μείνατε';

  @override
  String get showGoodreadsButton => 'Εμφάνιση κουμπιού Goodreads';

  @override
  String get showGoodreadsOnSubtitle =>
      'Το φύλλο λεπτομερειών βιβλίου δείχνει σύνδεσμο προς το Goodreads';

  @override
  String get showGoodreadsOffSubtitle =>
      'Ανενεργό - το κουμπί Goodreads είναι κρυμμένο';

  @override
  String get sectionPermissions => 'Άδειες';

  @override
  String get notifications => 'Ειδοποιήσεις';

  @override
  String get notificationsSubtitle =>
      'Για την πρόοδο λήψεων και τα χειριστήρια αναπαραγωγής';

  @override
  String get notificationsAlreadyEnabled => 'Οι ειδοποιήσεις είναι ήδη ενεργές';

  @override
  String get unrestrictedBattery => 'Μπαταρία χωρίς περιορισμούς';

  @override
  String get unrestrictedBatterySubtitle =>
      'Εμποδίζει το Android να τερματίζει την αναπαραγωγή στο παρασκήνιο';

  @override
  String get batteryAlreadyUnrestricted =>
      'Η μπαταρία είναι ήδη χωρίς περιορισμούς';

  @override
  String get sectionIssuesAndSupport => 'Προβλήματα και υποστήριξη';

  @override
  String get bugsAndFeatureRequests => 'Σφάλματα και αιτήματα λειτουργιών';

  @override
  String get bugsAndFeatureRequestsSubtitle => 'Ανοίξτε ένα issue στο GitHub';

  @override
  String get joinDiscord => 'Συμμετοχή στο Discord';

  @override
  String get joinDiscordSubtitle => 'Κοινότητα, υποστήριξη και ενημερώσεις';

  @override
  String get contact => 'Επικοινωνία';

  @override
  String get contactSubtitle => 'Αποστολή στοιχείων συσκευής με email';

  @override
  String get enableLogging => 'Ενεργοποίηση καταγραφής';

  @override
  String get enableLoggingOnSubtitle =>
      'Ενεργό - τα αρχεία καταγραφής αποθηκεύονται σε αρχείο (επανεκκίνηση για εφαρμογή)';

  @override
  String get enableLoggingOffSubtitle =>
      'Ανενεργό - δεν καταγράφονται αρχεία καταγραφής';

  @override
  String get loggingEnabledSnackbar =>
      'Η καταγραφή ενεργοποιήθηκε - κάντε επανεκκίνηση της εφαρμογής για να ξεκινήσει';

  @override
  String get loggingDisabledSnackbar =>
      'Η καταγραφή απενεργοποιήθηκε - κάντε επανεκκίνηση της εφαρμογής για να σταματήσει';

  @override
  String get sendLogs => 'Αποστολή αρχείων καταγραφής';

  @override
  String get sendLogsSubtitle =>
      'Κοινοποίηση του αρχείου καταγραφής ως συνημμένου';

  @override
  String failedToShare(String error) {
    return 'Αποτυχία κοινοποίησης: $error';
  }

  @override
  String get clearLogs => 'Εκκαθάριση αρχείων καταγραφής';

  @override
  String get logsCleared => 'Τα αρχεία καταγραφής εκκαθαρίστηκαν';

  @override
  String get clearLogsQuestion => 'Εκκαθάριση αρχείων καταγραφής;';

  @override
  String get clearLogsContent =>
      'Αυτή η ενέργεια δεν αναιρείται. Στείλτε τα πρώτα αν ίσως τα χρειαστείτε.';

  @override
  String get sectionAdvanced => 'Για προχωρημένους';

  @override
  String get localServer => 'Τοπικός διακομιστής';

  @override
  String get localServerInfoTitle => 'Τοπικός διακομιστής';

  @override
  String get localServerInfoContent =>
      'Αν ο διακομιστής Audiobookshelf τρέχει στο σπίτι σας, μπορείτε να ορίσετε εδώ μια τοπική διεύθυνση URL/LAN. Το Absorb θα μεταβαίνει αυτόματα στη ταχύτερη τοπική σύνδεση όταν εντοπίζει ότι βρίσκεστε στο οικιακό σας δίκτυο, και θα επιστρέφει στην απομακρυσμένη διεύθυνση όταν λείπετε.';

  @override
  String get localServerOnConnectedSubtitle =>
      'Σύνδεση μέσω τοπικού διακομιστή';

  @override
  String get localServerOnRemoteSubtitle =>
      'Ενεργό - χρήση απομακρυσμένου διακομιστή';

  @override
  String get localServerOffSubtitle =>
      'Αυτόματη μετάβαση σε διακομιστή LAN στο οικιακό σας WiFi';

  @override
  String get localServerUrlLabel => 'URL τοπικού διακομιστή';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar =>
      'Το URL τοπικού διακομιστή ορίστηκε - θα συνδέεται αυτόματα όταν βρίσκεστε στο οικιακό σας δίκτυο';

  @override
  String get disableAudioFocus => 'Απενεργοποίηση εστίασης ήχου';

  @override
  String get disableAudioFocusInfoTitle => 'Εστίαση ήχου';

  @override
  String get disableAudioFocusInfoContent =>
      'Από προεπιλογή, το Android δίνει «εστίαση» ήχου σε μία εφαρμογή τη φορά - όταν παίζει το Absorb, ο υπόλοιπος ήχος (μουσική, βίντεο) κάνει παύση. Η απενεργοποίηση της εστίασης ήχου επιτρέπει στο Absorb να παίζει μαζί με άλλες εφαρμογές. Οι τηλεφωνικές κλήσεις θα διακόπτουν πάντα την αναπαραγωγή, ανεξάρτητα από αυτήν τη ρύθμιση.';

  @override
  String get disableAudioFocusOnSubtitle =>
      'Ενεργό - παίζει μαζί με άλλο ήχο (διακόπτεται ακόμη για κλήσεις)';

  @override
  String get disableAudioFocusOffSubtitle =>
      'Ανενεργό - ο άλλος ήχος κάνει παύση όταν παίζει το Absorb';

  @override
  String get restartRequired => 'Απαιτείται επανεκκίνηση';

  @override
  String get restartRequiredContent =>
      'Η αλλαγή της εστίασης ήχου απαιτεί πλήρη επανεκκίνηση για να ισχύσει. Να κλείσει η εφαρμογή τώρα;';

  @override
  String get closeApp => 'Κλείσιμο εφαρμογής';

  @override
  String get trustAllCertificates => 'Εμπιστοσύνη σε όλα τα πιστοποιητικά';

  @override
  String get trustAllCertificatesInfoTitle => 'Αυτοϋπογραφόμενα πιστοποιητικά';

  @override
  String get mp3IndexSeeking => 'Αναζήτηση MP3 με ευρετήριο';

  @override
  String get mp3IndexSeekingInfoTitle => 'Αναζήτηση MP3 με ευρετήριο';

  @override
  String get mp3IndexSeekingInfoContent =>
      'Ενεργοποιήστε το μόνο αν έχετε αρχεία MP3 που δεν μεταβαίνουν στη σωστή θέση. Η ανακριβής αναζήτηση προέρχεται συνήθως από MP3 μεταβλητού ρυθμού bit (VBR). Η αναζήτηση με ευρετήριο δημιουργεί έναν ακριβή χάρτη χρόνου καθώς διαβάζεται το αρχείο, οπότε η μετάβαση κοντά στο τέλος ενός μεγάλου MP3 μπορεί να καθυστερήσει λίγο - ειδικά σε ροή, αφού το αρχείο πρέπει να διαβαστεί μέχρι εκείνο το σημείο. Ισχύει την επόμενη φορά που θα ξεκινήσει ένα βιβλίο ή επεισόδιο podcast.';

  @override
  String get mp3IndexSeekingOnSubtitle =>
      'Ενεργό - ακριβής αναζήτηση για αρχεία MP3 VBR';

  @override
  String get mp3IndexSeekingOffSubtitle => 'Ανενεργό - κανονική αναζήτηση';

  @override
  String get trustAllCertificatesInfoContent =>
      'Ενεργοποιήστε το αν ο διακομιστής Audiobookshelf χρησιμοποιεί αυτοϋπογραφόμενο πιστοποιητικό ή προσαρμοσμένη ρίζα CA. Όταν είναι ενεργό, το Absorb παραλείπει τον έλεγχο πιστοποιητικών TLS για όλες τις συνδέσεις. Ενεργοποιήστε το μόνο αν εμπιστεύεστε το δίκτυό σας.';

  @override
  String get trustAllCertificatesOnSubtitle =>
      'Ενεργό - γίνονται δεκτά όλα τα πιστοποιητικά';

  @override
  String get trustAllCertificatesOffSubtitle =>
      'Ανενεργό - γίνονται δεκτά μόνο αξιόπιστα πιστοποιητικά';

  @override
  String get supportTheDev => 'Υποστηρίξτε τον προγραμματιστή';

  @override
  String get buyMeACoffee => 'Κεράστε με έναν καφέ';

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
    return 'Absorb v$version  -  Διακομιστής $serverVersion';
  }

  @override
  String get backupAndRestore => 'Αντίγραφο ασφαλείας και επαναφορά';

  @override
  String get backupAndRestoreSubtitle =>
      'Αποθήκευση ή επαναφορά όλων των ρυθμίσεών σας σε αρχείο';

  @override
  String get backUp => 'Δημιουργία αντιγράφου';

  @override
  String get restore => 'Επαναφορά';

  @override
  String get allBookmarks => 'Όλοι οι σελιδοδείκτες';

  @override
  String get allBookmarksSubtitle => 'Προβολή σελιδοδεικτών από όλα τα βιβλία';

  @override
  String get switchAccount => 'Αλλαγή λογαριασμού';

  @override
  String get addAccount => 'Προσθήκη λογαριασμού';

  @override
  String get logOut => 'Αποσύνδεση';

  @override
  String get includeLoginInfoTitle => 'Να συμπεριληφθούν στοιχεία σύνδεσης;';

  @override
  String get includeLoginInfoContent =>
      'Θέλετε να συμπεριληφθούν τα στοιχεία σύνδεσης όλων των αποθηκευμένων λογαριασμών σας στο αντίγραφο ασφαλείας;\n\nΑυτό διευκολύνει την επαναφορά σε νέα συσκευή, αλλά το αρχείο θα περιέχει τα διακριτικά ταυτοποίησης (tokens) σας.';

  @override
  String get noSettingsOnly => 'Όχι, μόνο ρυθμίσεις';

  @override
  String get yesIncludeAccounts => 'Ναι, με λογαριασμούς';

  @override
  String get backupSavedWithAccounts =>
      'Το αντίγραφο αποθηκεύτηκε (με λογαριασμούς)';

  @override
  String get backupSavedSettingsOnly =>
      'Το αντίγραφο αποθηκεύτηκε (μόνο ρυθμίσεις)';

  @override
  String backupFailed(String error) {
    return 'Η δημιουργία αντιγράφου απέτυχε: $error';
  }

  @override
  String get restoreBackupTitle => 'Επαναφορά αντιγράφου;';

  @override
  String get restoreBackupContent =>
      'Αυτό θα αντικαταστήσει όλες τις τρέχουσες ρυθμίσεις με τις τιμές του αντιγράφου.';

  @override
  String fromAbsorbVersion(String version) {
    return 'Από το Absorb v$version';
  }

  @override
  String restoreAccountsChip(int count) {
    return '$count λογαριασμός(-οί)';
  }

  @override
  String restoreBookmarksChip(int count) {
    return 'Σελιδοδείκτες για $count βιβλίο(-α)';
  }

  @override
  String get restoreCustomHeadersChip => 'Προσαρμοσμένες κεφαλίδες';

  @override
  String get invalidBackupFile => 'Μη έγκυρο αρχείο αντιγράφου';

  @override
  String get settingsRestoredSuccessfully =>
      'Οι ρυθμίσεις επαναφέρθηκαν με επιτυχία';

  @override
  String restoreFailed(String error) {
    return 'Η επαναφορά απέτυχε: $error';
  }

  @override
  String get logOutTitle => 'Αποσύνδεση;';

  @override
  String get logOutContent =>
      'Θα αποσυνδεθείτε. Οι λήψεις σας θα παραμείνουν σε αυτήν τη συσκευή.';

  @override
  String get signOut => 'Αποσύνδεση';

  @override
  String get changePasswordTitle => 'Αλλαγή κωδικού πρόσβασης';

  @override
  String get changePasswordSubtitle =>
      'Ενημερώστε με ασφάλεια τον κωδικό σας στο Audiobookshelf';

  @override
  String get currentPassword => 'Τρέχων κωδικός πρόσβασης';

  @override
  String get newPassword => 'Νέος κωδικός πρόσβασης';

  @override
  String get confirmNewPassword => 'Επιβεβαίωση νέου κωδικού πρόσβασης';

  @override
  String get passwordChangeEffect =>
      'Η αλλαγή του κωδικού σας αποσυνδέει τις άλλες συνεδρίες σας στο Audiobookshelf. Αυτή η συσκευή παραμένει συνδεδεμένη.';

  @override
  String get passwordFieldsRequired =>
      'Συμπληρώστε όλα τα πεδία κωδικού πρόσβασης';

  @override
  String get passwordsDoNotMatch => 'Οι νέοι κωδικοί πρόσβασης δεν ταιριάζουν';

  @override
  String get passwordChanged =>
      'Ο κωδικός πρόσβασης άλλαξε. Οι άλλες συνδεδεμένες συσκευές αποσυνδέθηκαν.';

  @override
  String get passwordInvalid => 'Ο τρέχων κωδικός πρόσβασης είναι λανθασμένος';

  @override
  String get passwordChangeUnsupported =>
      'Αυτή η έκδοση διακομιστή δεν υποστηρίζει ασφαλή αλλαγή κωδικού πρόσβασης στο Absorb';

  @override
  String get passwordChangeFailed =>
      'Δεν ήταν δυνατή η αλλαγή του κωδικού πρόσβασης';

  @override
  String get otherUserPasswordResetWarning =>
      'Η αλλαγή αυτού του κωδικού αποσυνδέει τον χρήστη από κάθε συσκευή.';

  @override
  String get manageSessionsTitle => 'Συνδεδεμένες συσκευές';

  @override
  String get manageSessionsSubtitle =>
      'Έλεγχος και αφαίρεση συνεδριών Audiobookshelf';

  @override
  String get sessionsCurrent => 'Τρέχουσα συσκευή';

  @override
  String get sessionsUnknownDevice => 'Άγνωστη συσκευή';

  @override
  String sessionsLastActive(String date) {
    return 'Τελευταία δραστηριότητα $date';
  }

  @override
  String get sessionsNone => 'Καμία ενεργή συνεδρία';

  @override
  String get sessionsLoadMore => 'Φόρτωση περισσότερων';

  @override
  String get sessionsUnsupported =>
      'Η διαχείριση συνεδριών απαιτεί Audiobookshelf 2.36 ή νεότερο.';

  @override
  String get sessionsLoadFailed =>
      'Δεν ήταν δυνατή η φόρτωση των συνδεδεμένων συσκευών';

  @override
  String get sessionsLegacyNotice =>
      'Αυτή η σύνδεση δεν έχει συνεδρία ανανέωσης, οπότε το Absorb δεν μπορεί να αναγνωρίσει αυτήν τη συσκευή στη λίστα.';

  @override
  String get sessionsRemove => 'Αποσύνδεση συσκευής';

  @override
  String get sessionsRemoveTitle => 'Αποσύνδεση αυτής της συσκευής;';

  @override
  String get sessionsRemoveContent =>
      'Αυτό αφαιρεί τη συνεδρία ανανέωσής της. Η τρέχουσα πρόσβασή της μπορεί να συνεχίσει να λειτουργεί μέχρι να λήξει το βραχύβιο διακριτικό.';

  @override
  String get sessionsRemoved => 'Η συσκευή αποσυνδέθηκε';

  @override
  String get sessionsRemoveFailed =>
      'Δεν ήταν δυνατή η αποσύνδεση αυτής της συσκευής';

  @override
  String get sessionsSignOutAll => 'Αποσύνδεση όλων των συσκευών';

  @override
  String get sessionsSignOutAllTitle => 'Αποσύνδεση από παντού;';

  @override
  String get sessionsSignOutAllContent =>
      'Αυτό αφαιρεί κάθε συνεδρία ανανέωσης, συμπεριλαμβανομένης αυτής της συσκευής. Τα υπάρχοντα διακριτικά πρόσβασης μπορεί να λειτουργούν μέχρι να λήξουν.';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return 'Το πρόγραμμα χρησιμοποιεί την ώρα του διακομιστή ($timeZone)';
  }

  @override
  String get podcastScheduleServerTimeUnknown =>
      'Το πρόγραμμα χρησιμοποιεί την ώρα του διακομιστή';

  @override
  String get editServerAddressTitle => 'Επεξεργασία διεύθυνσης διακομιστή';

  @override
  String editServerAddressSubtitle(String username) {
    return 'Ενημερώστε τη διεύθυνση για τον χρήστη $username. Χρησιμοποιήστε το αν άλλαξε η διεύθυνση του διακομιστή σας - είναι ο ίδιος διακομιστής, απλώς με νέο URL. Τα στατιστικά και οι λήψεις σας διατηρούνται.';
  }

  @override
  String get editServerAddressField => 'Διεύθυνση διακομιστή';

  @override
  String get editServerAddressUpdated => 'Η διεύθυνση διακομιστή ενημερώθηκε';

  @override
  String get editServerAddressFailed =>
      'Αδυναμία ενημέρωσης της διεύθυνσης διακομιστή';

  @override
  String get editServerAddressAction => 'Επεξεργασία διεύθυνσης διακομιστή';

  @override
  String get editServerConnectionTitle => 'Επεξεργασία σύνδεσης διακομιστή';

  @override
  String editServerConnectionSubtitle(String username) {
    return 'Ενημερώστε τη διεύθυνση διακομιστή και τις προσαρμοσμένες κεφαλίδες για τον χρήστη $username. Τα στατιστικά και οι λήψεις σας διατηρούνται.';
  }

  @override
  String get editServerConnectionAction => 'Επεξεργασία σύνδεσης διακομιστή';

  @override
  String get editServerConnectionUpdated => 'Η σύνδεση διακομιστή ενημερώθηκε';

  @override
  String get editServerConnectionFailed =>
      'Αδυναμία ενημέρωσης της σύνδεσης διακομιστή';

  @override
  String get editCustomHeadersDescription =>
      'Χρησιμοποιούνται για σήραγγες Cloudflare ή αντίστροφους διαμεσολαβητές (reverse proxies). Αυτές οι κεφαλίδες ισχύουν μόνο για αυτόν τον αποθηκευμένο λογαριασμό.';

  @override
  String get removeAccountAction => 'Αφαίρεση λογαριασμού';

  @override
  String get removeAccountTitle => 'Αφαίρεση λογαριασμού;';

  @override
  String removeAccountContent(String username, String server) {
    return 'Να αφαιρεθεί ο χρήστης $username στο $server από τους αποθηκευμένους λογαριασμούς;\n\nΜπορείτε πάντα να τον προσθέσετε ξανά αργότερα συνδεόμενοι ξανά.';
  }

  @override
  String get switchAccountTitle => 'Αλλαγή λογαριασμού;';

  @override
  String switchAccountContent(String username, String server) {
    return 'Αλλαγή στον χρήστη $username στο $server;\n\nΗ τρέχουσα αναπαραγωγή θα σταματήσει και η εφαρμογή θα φορτώσει ξανά με τα δεδομένα του άλλου λογαριασμού.';
  }

  @override
  String get switchButton => 'Αλλαγή';

  @override
  String get downloadLocationSheetTitle => 'Θέση λήψης';

  @override
  String get downloadLocationSheetSubtitle =>
      'Επιλέξτε πού αποθηκεύονται τα ηχητικά βιβλία';

  @override
  String get currentLocation => 'Τρέχουσα θέση';

  @override
  String get existingDownloadsWarning =>
      'Οι υπάρχουσες λήψεις παραμένουν στην τρέχουσα θέση τους. Μόνο οι νέες λήψεις χρησιμοποιούν τη νέα διαδρομή.';

  @override
  String get chooseFolder => 'Επιλογή φακέλου';

  @override
  String get chooseDownloadFolder => 'Επιλογή φακέλου λήψης';

  @override
  String get storagePermissionDenied =>
      'Η άδεια αποθήκευσης απορρίφθηκε μόνιμα - ενεργοποιήστε την στις ρυθμίσεις της εφαρμογής';

  @override
  String get openSettings => 'Άνοιγμα ρυθμίσεων';

  @override
  String get storagePermissionRequired =>
      'Απαιτείται άδεια αποθήκευσης για προσαρμοσμένες θέσεις λήψης';

  @override
  String get cannotWriteToFolder =>
      'Δεν είναι δυνατή η εγγραφή σε αυτόν τον φάκελο - επιλέξτε άλλη θέση ή δώστε πρόσβαση σε αρχεία στις ρυθμίσεις συστήματος';

  @override
  String downloadLocationSetTo(String label) {
    return 'Η θέση λήψης ορίστηκε σε $label';
  }

  @override
  String get resetToDefault => 'Επαναφορά στην προεπιλογή';

  @override
  String get resetToDefaultStorage => 'Επαναφορά στην προεπιλεγμένη αποθήκευση';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count λήψεις βρίσκονται σε παλιό προσαρμοσμένο φάκελο που δεν μπορεί πλέον να ανοιχτεί. Κάντε τες ξανά ή παραβλέψτε αυτήν την ειδοποίηση.',
      one:
          '1 λήψη βρίσκεται σε παλιό προσαρμοσμένο φάκελο που δεν μπορεί πλέον να ανοιχτεί. Κάντε την ξανά ή παραβλέψτε αυτήν την ειδοποίηση.',
    );
    return '$_temp0';
  }

  @override
  String get redownload => 'Νέα λήψη';

  @override
  String get redownloadStarted => 'Γίνεται νέα λήψη';

  @override
  String get dismiss => 'Παράβλεψη';

  @override
  String get tipsAndHiddenFeatures => 'Συμβουλές και κρυφές λειτουργίες';

  @override
  String get tipsSubtitle => 'Αξιοποιήστε στο έπακρο το Absorb';

  @override
  String get adminTitle => 'Διαχείριση διακομιστή';

  @override
  String get adminTasksTitle => 'Δραστηριότητα διακομιστή';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εργασίες σε εξέλιξη',
      one: '1 εργασία σε εξέλιξη',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => 'Πρόσφατη δραστηριότητα διακομιστή';

  @override
  String get adminTasksEmpty => 'Δεν εκτελούνται εργασίες διακομιστή';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return '$added προστέθηκαν - $updated ενημερώθηκαν - $missing λείπουν';
  }

  @override
  String get adminServer => 'Διακομιστής';

  @override
  String get adminVersion => 'Έκδοση';

  @override
  String get adminUsers => 'Χρήστες';

  @override
  String get adminOnline => 'Συνδεδεμένοι';

  @override
  String get adminBackup => 'Αντίγραφο ασφαλείας';

  @override
  String get adminPurgeCache => 'Εκκαθάριση προσωρινής μνήμης';

  @override
  String get adminManage => 'Διαχείριση';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return '$userCount λογαριασμοί - $onlineCount συνδεδεμένοι';
  }

  @override
  String get adminPodcasts => 'Podcast';

  @override
  String get adminPodcastsSubtitle =>
      'Αναζήτηση, προσθήκη και διαχείριση εκπομπών';

  @override
  String get adminScan => 'Σάρωση';

  @override
  String get adminScanning => 'Σάρωση...';

  @override
  String get adminMatchAll => 'Αντιστοίχιση όλων';

  @override
  String get adminMatching => 'Αντιστοίχιση...';

  @override
  String get adminMatchAllTitle => 'Αντιστοίχιση όλων των στοιχείων;';

  @override
  String adminMatchAllContent(String name) {
    return 'Αντιστοίχιση μεταδεδομένων για όλα τα στοιχεία στο $name; Αυτό μπορεί να διαρκέσει λίγο.';
  }

  @override
  String adminScanStarted(String name) {
    return 'Η σάρωση ξεκίνησε για το $name';
  }

  @override
  String get adminBackupCreated => 'Το αντίγραφο ασφαλείας δημιουργήθηκε';

  @override
  String get adminBackupFailed => 'Η δημιουργία αντιγράφου ασφαλείας απέτυχε';

  @override
  String get adminCachePurged => 'Η προσωρινή μνήμη εκκαθαρίστηκε';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => 'Άνοιγμα στην εφαρμογή';

  @override
  String get adminRmabAdd => 'Προσθήκη ενσωμάτωσης ReadMeABook';

  @override
  String get adminRmabUrlTitle => 'URL ReadMeABook';

  @override
  String get adminRmabUrlHelp =>
      'Επικολλήστε το URL σας με το διακριτικό σύνδεσης. Δημιουργήστε ένα στο RMAB, Admin, Users.';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => 'Εισαγάγετε έγκυρο URL http(s)';

  @override
  String get adminRmabSaved => 'Το ReadMeABook αποθηκεύτηκε';

  @override
  String get adminRmabRemoved => 'Το ReadMeABook αφαιρέθηκε';

  @override
  String get adminRmabReload => 'Επαναφόρτωση';

  @override
  String get adminRmabLoadFailed =>
      'Αδυναμία φόρτωσης του ReadMeABook. Ελέγξτε το URL σας.';

  @override
  String get adminRmabConnected => 'Συνδεδεμένο';

  @override
  String get adminRmabAskAdmin =>
      'Ζητήστε ένα URL σύνδεσης από τον διαχειριστή του διακομιστή σας';

  @override
  String get adminRmabUrlHelpUser =>
      'Ζητήστε ένα URL σύνδεσης από τον διαχειριστή του διακομιστή σας. Το δημιουργεί στο RMAB > Admin > Users.';

  @override
  String get adminRmabSettingsInfo =>
      'Το ReadMeABook είναι μια υπηρεσία αυτοφιλοξενίας για αίτημα και λήψη ηχητικών βιβλίων. Πρέπει να εγκατασταθεί και να ρυθμιστεί από τον διαχειριστή του διακομιστή σας.';

  @override
  String get rmabConfigTitle => 'Σύνδεση με το ReadMeABook';

  @override
  String get rmabConfigExplainerAdmin =>
      'Το ReadMeABook είναι μια υπηρεσία αυτοφιλοξενίας για αιτήματα ηχητικών βιβλίων. Δημιουργήστε ένα διακριτικό API στο RMAB στο Admin Dashboard > Settings > API και επικολλήστε παρακάτω το URL του διακομιστή και το διακριτικό. Το Absorb δεν φιλοξενεί ούτε κατεβάζει περιεχόμενο, απλώς στέλνει αιτήματα στον διακομιστή σας.';

  @override
  String get rmabConfigExplainerUser =>
      'Το ReadMeABook είναι μια υπηρεσία αυτοφιλοξενίας για αιτήματα ηχητικών βιβλίων. Ζητήστε από τον διαχειριστή του διακομιστή σας το URL του RMAB και ένα διακριτικό API. Το Absorb δεν φιλοξενεί ούτε κατεβάζει περιεχόμενο, απλώς στέλνει αιτήματα στον διακομιστή σας.';

  @override
  String get rmabConfigLearnMore => 'Μάθετε περισσότερα για το ReadMeABook';

  @override
  String get rmabConfigBaseUrlLabel => 'URL διακομιστή RMAB';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.example.com';

  @override
  String get rmabConfigTokenLabel => 'Διακριτικό API';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel => 'URL σύνδεσης web UI (προαιρετικό)';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      'Επικολλήστε το URL αυτόματης σύνδεσης ώστε το «Άνοιγμα σε προβολή προγράμματος περιήγησης» να σας συνδέει αυτόματα. Αφήστε κενό για κανονική σύνδεση.';

  @override
  String get rmabConfigHeadersHelp =>
      'Επιπλέον κεφαλίδες που στέλνονται με κάθε αίτημα προς το ReadMeABook, για reverse proxies όπως το Cloudflare Access.';

  @override
  String get rmabConfigConnect => 'Σύνδεση';

  @override
  String get rmabConfigDisconnect => 'Αποσύνδεση';

  @override
  String get rmabConfigOpenWebView =>
      'Άνοιγμα σε προβολή προγράμματος περιήγησης';

  @override
  String rmabConfigConnectedAs(String name) {
    return 'Συνδεδεμένο ως $name';
  }

  @override
  String get rmabConfigErrorInvalidUrl => 'Εισαγάγετε έγκυρο URL http(s)';

  @override
  String get rmabConfigErrorMissingToken => 'Εισαγάγετε το διακριτικό API σας';

  @override
  String get rmabConfigErrorUnauthorized =>
      'Το διακριτικό απορρίφθηκε από τον διακομιστή';

  @override
  String get rmabConfigErrorForbidden =>
      'Αυτό το διακριτικό δεν επιτρέπεται για αυτήν την ενέργεια';

  @override
  String get rmabConfigErrorNetwork =>
      'Αδυναμία επικοινωνίας με το RMAB. Ελέγξτε το URL.';

  @override
  String get rmabConfigErrorGeneric => 'Αδυναμία σύνδεσης';

  @override
  String get rmabConfigSavedSnackbar => 'Το ReadMeABook συνδέθηκε';

  @override
  String get rmabConfigDisconnectedSnackbar => 'Το ReadMeABook αποσυνδέθηκε';

  @override
  String get rmabRequestCta => 'Αίτημα μέσω ReadMeABook';

  @override
  String get rmabSearchHeader => 'Αίτημα μέσω ReadMeABook';

  @override
  String get rmabSearchHint => 'Αναζήτηση με τίτλο ή συγγραφέα';

  @override
  String get rmabSearchEmpty =>
      'Καμία αντιστοίχιση στον διακομιστή ReadMeABook σας';

  @override
  String get rmabSearchError => 'Αδυναμία αναζήτησης στο ReadMeABook';

  @override
  String get rmabSearchPrompt =>
      'Πληκτρολογήστε τίτλο ή συγγραφέα για αναζήτηση';

  @override
  String get rmabSearchFooterPrompt => 'Ψάχνετε για κάτι άλλο;';

  @override
  String rmabSearchFooterCta(String query) {
    return 'Αναζήτηση στο ReadMeABook για «$query»';
  }

  @override
  String get rmabBookDetailExplainer =>
      'Αυτό το αίτημα θα σταλεί μέσω του διακομιστή ReadMeABook σας. Ο διαχειριστής θα το ελέγξει και θα το επεξεργαστεί. Μπορείτε να το παρακολουθείτε στα Τα αιτήματά μου, στο πλακίδιο ReadMeABook.';

  @override
  String get rmabBookAlreadyAvailable => 'Ήδη στη βιβλιοθήκη σας';

  @override
  String get rmabBookAlreadyRequested => 'Έχει ήδη ζητηθεί';

  @override
  String get rmabRequestSubmitting => 'Υποβολή…';

  @override
  String get rmabRequestSent => 'Το αίτημα στάλθηκε';

  @override
  String get rmabRequestErrorAlreadyAvailable => 'Ήδη στη βιβλιοθήκη σας';

  @override
  String get rmabRequestErrorBeingProcessed => 'Ήδη σε επεξεργασία';

  @override
  String get rmabRequestErrorDuplicate => 'Το έχετε ήδη ζητήσει';

  @override
  String get rmabRequestErrorValidation => 'Αδυναμία αποστολής του αιτήματος';

  @override
  String get rmabRequestErrorUserNotFound =>
      'Ο χρήστης του διακριτικού δεν υπάρχει πλέον. Συνδεθείτε ξανά με το ReadMeABook.';

  @override
  String get rmabRequestErrorIgnored =>
      'Αυτό το βιβλίο βρίσκεται στη λίστα αγνόησής σας';

  @override
  String get rmabRequestErrorGeneric => 'Αδυναμία αποστολής του αιτήματος';

  @override
  String get rmabRequestErrorTokenRejected =>
      'Το διακριτικό απορρίφθηκε από τον διακομιστή. Συνδεθείτε ξανά με το ReadMeABook.';

  @override
  String get rmabMyRequestsTab => 'Τα αιτήματά μου';

  @override
  String get rmabSetupTab => 'Ρύθμιση';

  @override
  String get rmabMyRequestsEmpty => 'Δεν έχετε ζητήσει ακόμη κανένα βιβλίο';

  @override
  String get rmabMyRequestsError => 'Αδυναμία φόρτωσης αιτημάτων';

  @override
  String get rmabMyRequestsRefresh => 'Ανανέωση';

  @override
  String get rmabRequestDetailTitle => 'Λεπτομέρειες αιτήματος';

  @override
  String get rmabRequestDetailStatus => 'Κατάσταση';

  @override
  String get rmabRequestDetailRequestedOn => 'Ζητήθηκε στις';

  @override
  String get rmabRequestDetailCompletedOn => 'Ολοκληρώθηκε στις';

  @override
  String get rmabRequestDetailProgress => 'Πρόοδος';

  @override
  String get rmabStatusActive => 'Σε εξέλιξη';

  @override
  String get rmabStatusWaiting => 'Σε αναμονή';

  @override
  String get rmabStatusAvailable => 'Διαθέσιμο';

  @override
  String get rmabStatusDownloaded => 'Ληφθέν';

  @override
  String get rmabStatusFailed => 'Απέτυχε';

  @override
  String get rmabStatusCancelled => 'Ακυρώθηκε';

  @override
  String get rmabStatusDenied => 'Απορρίφθηκε';

  @override
  String get rmabStatusUnknown => 'Άγνωστο';

  @override
  String narratedBy(String narrator) {
    return 'Αφηγητής: $narrator';
  }

  @override
  String get onAudible => 'στο Audible';

  @override
  String percentComplete(String percent) {
    return '$percent% ολοκληρώθηκε';
  }

  @override
  String get absorbing => 'Absorbing...';

  @override
  String get absorbAgain => 'Absorb ξανά';

  @override
  String get absorb => 'Absorb';

  @override
  String get ebookOnlyNoAudio => 'Μόνο ηλεκτρονικό βιβλίο - χωρίς ήχο';

  @override
  String get absorbAudioNotDownloaded => 'Ο ήχος δεν έχει ληφθεί';

  @override
  String get absorbAudioNotDownloadedEbookOnly =>
      'Ο ήχος δεν έχει ληφθεί, μόνο ηλεκτρονικό βιβλίο';

  @override
  String get fullyAbsorbed => 'Fully Absorbed';

  @override
  String get fullyAbsorbAction => 'Fully Absorb';

  @override
  String get removeFromAbsorbing => 'Αφαίρεση από το Absorbing';

  @override
  String get addToAbsorbing => 'Προσθήκη στο Absorbing';

  @override
  String get absorbNext => 'Absorb επόμενο';

  @override
  String get absorbNextAdded => 'Επόμενο στο Absorbing';

  @override
  String get absorbLast => 'Absorb τελευταίο';

  @override
  String get absorbNextHint => 'Αμέσως μετά από ό,τι παίζει τώρα';

  @override
  String get absorbLastHint => 'Στο τέλος της λίστας';

  @override
  String get removedFromAbsorbing => 'Αφαιρέθηκε από το Absorbing';

  @override
  String get addedToAbsorbing => 'Προστέθηκε στο Absorbing';

  @override
  String get removeFromContinueListening => 'Αφαίρεση από τη Συνέχεια ακρόασης';

  @override
  String get removedFromContinueListening =>
      'Αφαιρέθηκε από τη Συνέχεια ακρόασης';

  @override
  String get removeFromContinueReading => 'Αφαίρεση από τη Συνέχεια ανάγνωσης';

  @override
  String get removedFromContinueReading =>
      'Αφαιρέθηκε από τη Συνέχεια ανάγνωσης';

  @override
  String get sessionAdd => 'Προσθήκη συνεδρίας';

  @override
  String get sessionStartLabel => 'Ξεκίνησε στις';

  @override
  String get sessionAdded => 'Η συνεδρία προστέθηκε';

  @override
  String get sessionAddFailed => 'Δεν ήταν δυνατή η προσθήκη της συνεδρίας';

  @override
  String get removeSeriesFromContinueSeries =>
      'Αφαίρεση από τη Συνέχεια σειράς';

  @override
  String get removedSeriesFromContinueSeries =>
      'Αφαιρέθηκε από τη Συνέχεια σειράς';

  @override
  String get couldNotUpdate => 'Αδυναμία ενημέρωσης, δοκιμάστε ξανά';

  @override
  String get addToPlaylist => 'Προσθήκη σε λίστα αναπαραγωγής';

  @override
  String get addToCollection => 'Προσθήκη σε συλλογή';

  @override
  String get downloadEbook => 'Λήψη ηλεκτρονικού βιβλίου';

  @override
  String get downloadEbookAgain => 'Νέα λήψη ηλεκτρονικού βιβλίου';

  @override
  String get resetProgress => 'Επαναφορά προόδου';

  @override
  String get lookupLocalMetadata => 'Αναζήτηση τοπικών μεταδεδομένων';

  @override
  String get reLookupLocalMetadata => 'Νέα αναζήτηση τοπικών μεταδεδομένων';

  @override
  String get clearLocalMetadata => 'Εκκαθάριση τοπικών μεταδεδομένων';

  @override
  String get searchOnGoodreads => 'Αναζήτηση στο Goodreads';

  @override
  String get editServerDetails => 'Επεξεργασία στοιχείων διακομιστή';

  @override
  String get encodeTab => 'Κωδικοποίηση';

  @override
  String get codec => 'Κωδικοποιητής';

  @override
  String get bitrate => 'Ρυθμός bit';

  @override
  String get channels => 'Κανάλια';

  @override
  String get mono => 'Μονοφωνικό';

  @override
  String get stereo => 'Στερεοφωνικό';

  @override
  String get startM4bEncode => 'Έναρξη κωδικοποίησης M4B';

  @override
  String get encodeStarted => 'Η κωδικοποίηση M4B ξεκίνησε';

  @override
  String get encodeFailed => 'Αποτυχία έναρξης κωδικοποίησης';

  @override
  String get encodeFinished => 'Η κωδικοποίηση M4B ολοκληρώθηκε';

  @override
  String get currentlyLabel => 'Τώρα:';

  @override
  String encodeOutputPathNote(String path) {
    return 'Το ολοκληρωμένο M4B θα τοποθετηθεί στον φάκελο των ηχητικών βιβλίων σας στη διαδρομή: $path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return 'Ένα αντίγραφο ασφαλείας των αρχικών αρχείων ήχου θα αποθηκευτεί στο: /metadata/cache/items/$itemId/. Φροντίστε να εκκαθαρίζετε περιοδικά την προσωρινή μνήμη στοιχείων.';
  }

  @override
  String get encodeTimeNote =>
      'Η κωδικοποίηση μπορεί να διαρκέσει έως και 30 λεπτά.';

  @override
  String get encodeRescanNote =>
      'Αν έχετε απενεργοποιήσει το watcher, θα χρειαστεί να σαρώσετε ξανά αυτό το ηχητικό βιβλίο στη συνέχεια.';

  @override
  String get aboutSection => 'Πληροφορίες';

  @override
  String chaptersCount(int count) {
    return 'Κεφάλαια ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return 'Κομμάτια ήχου ($count)';
  }

  @override
  String libraryFilesCount(int count) {
    return 'Αρχεία βιβλιοθήκης ($count)';
  }

  @override
  String get chapters => 'Κεφάλαια';

  @override
  String get noChaptersBook => 'Αυτό το βιβλίο δεν έχει κεφάλαια';

  @override
  String get noChaptersPodcast => 'Αυτό το podcast δεν έχει κεφάλαια';

  @override
  String get failedToLoad => 'Αποτυχία φόρτωσης';

  @override
  String startedDate(String date) {
    return 'Ξεκίνησε $date';
  }

  @override
  String finishedDate(String date) {
    return 'Ολοκληρώθηκε $date';
  }

  @override
  String andCountMore(int count) {
    return 'και άλλα $count';
  }

  @override
  String get markAsFullyAbsorbedQuestion => 'Επισήμανση ως Fully Absorbed;';

  @override
  String get markAsFullyAbsorbedContent =>
      'Η πρόοδός σας θα οριστεί στο 100% και η αναπαραγωγή θα σταματήσει αν παίζει αυτό το βιβλίο.';

  @override
  String get markedAsFinishedNiceWork =>
      'Επισημάνθηκε ως ολοκληρωμένο - μπράβο!';

  @override
  String get failedToUpdateCheckConnection =>
      'Αποτυχία ενημέρωσης - ελέγξτε τη σύνδεσή σας';

  @override
  String get markAsNotFinishedQuestion => 'Επισήμανση ως μη ολοκληρωμένου;';

  @override
  String get markAsNotFinishedContent =>
      'Θα διαγραφεί η κατάσταση ολοκλήρωσης και η θέση σας θα επιστρέψει στην αρχή.';

  @override
  String get unmark => 'Αφαίρεση επισήμανσης';

  @override
  String get markedAsNotFinishedBackAtIt =>
      'Επισημάνθηκε ως μη ολοκληρωμένο - πάμε πάλι!';

  @override
  String get resetProgressQuestion => 'Επαναφορά προόδου;';

  @override
  String get resetProgressListeningAndReading =>
      'Η πρόοδος ακρόασης και ανάγνωσης θα επανέλθει και στις δύο στο 0%.';

  @override
  String get resetProgressListening =>
      'Η πρόοδος ακρόασης θα επανέλθει στο 0%.';

  @override
  String get resetProgressReading => 'Η πρόοδος ανάγνωσης θα επανέλθει στο 0%.';

  @override
  String get resetProgressMarksUnread =>
      'Το βιβλίο θα επισημανθεί επίσης ως μη αναγνωσμένο.';

  @override
  String get resetProgressCantUndo => 'Αυτή η ενέργεια δεν αναιρείται.';

  @override
  String get progressResetFreshStart => 'Η πρόοδος επαναφέρθηκε - νέα αρχή!';

  @override
  String get clearLocalMetadataQuestion => 'Εκκαθάριση τοπικών μεταδεδομένων;';

  @override
  String get clearLocalMetadataContent =>
      'Θα αφαιρεθούν τα τοπικά αποθηκευμένα μεταδεδομένα και θα χρησιμοποιηθούν όσα έχει ο διακομιστής.';

  @override
  String get localMetadataCleared => 'Τα τοπικά μεταδεδομένα εκκαθαρίστηκαν';

  @override
  String get saveEbook => 'Αποθήκευση ηλεκτρονικού βιβλίου';

  @override
  String get noEbookFileFound => 'Δεν βρέθηκε αρχείο ηλεκτρονικού βιβλίου';

  @override
  String get bookmark => 'Σελιδοδείκτης';

  @override
  String get bookmarks => 'Σελιδοδείκτες';

  @override
  String bookmarksWithCount(int count) {
    return 'Σελιδοδείκτες ($count)';
  }

  @override
  String get playbackSpeed => 'Ταχύτητα αναπαραγωγής';

  @override
  String get noBookmarksYet => 'Δεν υπάρχουν σελιδοδείκτες ακόμη';

  @override
  String get longPressBookmarkHint =>
      'Πατήστε παρατεταμένα το κουμπί σελιδοδείκτη για γρήγορη αποθήκευση';

  @override
  String get addBookmark => 'Προσθήκη σελιδοδείκτη';

  @override
  String get editBookmark => 'Επεξεργασία σελιδοδείκτη';

  @override
  String get titleLabel => 'Τίτλος';

  @override
  String get noteOptionalLabel => 'Σημείωση (προαιρετικό)';

  @override
  String get editLayout => 'Επεξεργασία διάταξης';

  @override
  String get inMenu => 'Στο μενού';

  @override
  String get bookmarkAdded => 'Ο σελιδοδείκτης προστέθηκε';

  @override
  String get startPlayingSomethingFirst =>
      'Ξεκινήστε πρώτα την αναπαραγωγή κάποιου στοιχείου';

  @override
  String get playbackHistory => 'Ιστορικό αναπαραγωγής';

  @override
  String get historyLocalTab => 'Ιστορικό';

  @override
  String get historyServerTab => 'Συνεδρίες';

  @override
  String get historyNoServerSessions =>
      'Δεν υπάρχουν ακόμη συνεδρίες διακομιστή για αυτό το στοιχείο';

  @override
  String get historyServerLoadFailed =>
      'Δεν ήταν δυνατή η φόρτωση των συνεδριών διακομιστή';

  @override
  String get clearHistoryTooltip => 'Εκκαθάριση ιστορικού';

  @override
  String get tapEventToJump =>
      'Πατήστε ένα συμβάν για μετάβαση σε εκείνη τη θέση';

  @override
  String get noHistoryYet => 'Δεν υπάρχει ιστορικό ακόμη';

  @override
  String jumpedToPosition(String position) {
    return 'Μετάβαση στο $position';
  }

  @override
  String booksInSeriesCount(int count) {
    return '$count βιβλία σε αυτήν τη σειρά';
  }

  @override
  String bookNumber(String number) {
    return 'Βιβλίο $number';
  }

  @override
  String downloadRemainingCount(int count) {
    return 'Λήψη υπολοίπων ($count)';
  }

  @override
  String get downloadAll => 'Λήψη όλων';

  @override
  String get markAllNotFinished => 'Επισήμανση όλων ως μη ολοκληρωμένων';

  @override
  String get markAllFinished => 'Επισήμανση όλων ως ολοκληρωμένων';

  @override
  String get markAllNotFinishedQuestion =>
      'Επισήμανση όλων ως μη ολοκληρωμένων;';

  @override
  String get fullyAbsorbSeries => 'Fully Absorb σειράς;';

  @override
  String get turnAutoDownloadOff => 'Απενεργοποίηση αυτόματης λήψης';

  @override
  String get turnAutoDownloadOn => 'Ενεργοποίηση αυτόματης λήψης';

  @override
  String get autoDownloadThisSeries => 'Αυτόματη λήψη αυτής της σειράς;';

  @override
  String get autoDownloadSeriesContent =>
      'Αυτόματη λήψη των επόμενων βιβλίων καθώς ακούτε.';

  @override
  String get standalone => 'Αυτόνομα';

  @override
  String get episodes => 'Επεισόδια';

  @override
  String get noEpisodesFound => 'Δεν βρέθηκαν επεισόδια';

  @override
  String get markFinished => 'Επισήμανση ως ολοκληρωμένου';

  @override
  String get markUnfinished => 'Επισήμανση ως μη ολοκληρωμένου';

  @override
  String get allEpisodes => 'Όλα τα επεισόδια';

  @override
  String get aboutThisEpisode => 'Σχετικά με αυτό το επεισόδιο';

  @override
  String get reversePlayOrder => 'Αντίστροφη σειρά αναπαραγωγής';

  @override
  String selectedCount(int count) {
    return '$count επιλεγμένα';
  }

  @override
  String get selectAll => 'Επιλογή όλων';

  @override
  String get deselectAll => 'Αποεπιλογή όλων';

  @override
  String get autoDownloadThisPodcast => 'Αυτόματη λήψη αυτού του podcast;';

  @override
  String get autoDownloadPodcastContent =>
      'Αυτόματη λήψη των επόμενων επεισοδίων καθώς ακούτε.';

  @override
  String get download => 'Λήψη';

  @override
  String get deleteDownload => 'Διαγραφή λήψης';

  @override
  String get casting => 'Μετάδοση';

  @override
  String get castingTo => 'Μετάδοση σε';

  @override
  String get editDetails => 'Επεξεργασία στοιχείων';

  @override
  String get quickMatch => 'Γρήγορη αντιστοίχιση';

  @override
  String get quickMatchNoUpdates => 'Δεν χρειάζονται ενημερώσεις';

  @override
  String get custom => 'Προσαρμοσμένο';

  @override
  String get authorOptionalLabel => 'Συγγραφέας (προαιρετικό)';

  @override
  String get noResultsFound =>
      'Δεν βρέθηκαν αποτελέσματα.\nΔοκιμάστε να προσαρμόσετε την αναζήτηση ή τον πάροχο.';

  @override
  String get searchForMetadataAbove => 'Αναζητήστε μεταδεδομένα παραπάνω';

  @override
  String get applyThisMatch => 'Εφαρμογή αυτής της αντιστοίχισης;';

  @override
  String get metadataUpdated => 'Τα μεταδεδομένα ενημερώθηκαν';

  @override
  String get failedToUpdateMetadata => 'Αποτυχία ενημέρωσης μεταδεδομένων';

  @override
  String get subtitleLabel => 'Υπότιτλος';

  @override
  String get authorLabel => 'Συγγραφέας';

  @override
  String get narratorLabel => 'Αφηγητής';

  @override
  String get seriesLabel => 'Σειρά';

  @override
  String get addSeries => 'Προσθήκη σειράς';

  @override
  String get removeSeries => 'Αφαίρεση σειράς';

  @override
  String get descriptionLabel => 'Περιγραφή';

  @override
  String get publisherLabel => 'Εκδότης';

  @override
  String get yearLabel => 'Έτος';

  @override
  String get genresLabel => 'Είδη';

  @override
  String get tagsLabel => 'Ετικέτες';

  @override
  String get commaSeparated => 'Χωρισμένα με κόμμα';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => 'Εικόνα εξωφύλλου';

  @override
  String get coverRemove => 'Αφαίρεση εξωφύλλου';

  @override
  String get coverRemoveConfirm =>
      'Να αφαιρεθεί το εξώφυλλο αυτού του βιβλίου; Θα εμφανίζεται στη θέση του η δημιουργημένη κάρτα τίτλου.';

  @override
  String get coverRemoved => 'Το εξώφυλλο αφαιρέθηκε';

  @override
  String get coverRemoveFailed => 'Δεν ήταν δυνατή η αφαίρεση του εξωφύλλου';

  @override
  String get coverUrlLabel => 'URL εξωφύλλου';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => 'Τοπικά μεταδεδομένα';

  @override
  String get overrideLocalDisplay => 'Παράκαμψη τοπικής εμφάνισης';

  @override
  String get metadataSavedLocally => 'Τα μεταδεδομένα αποθηκεύτηκαν τοπικά';

  @override
  String get notes => 'Σημειώσεις';

  @override
  String get newNote => 'Νέα σημείωση';

  @override
  String get editNote => 'Επεξεργασία σημείωσης';

  @override
  String get noNotesYet => 'Δεν υπάρχουν σημειώσεις ακόμη';

  @override
  String get markdownIsSupported => 'Υποστηρίζεται Markdown';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => 'Διατηρεί τη μορφοποίηση';

  @override
  String get plainTextTxt => 'Απλό κείμενο (.txt)';

  @override
  String get simpleTextNoFormatting => 'Απλό κείμενο, χωρίς μορφοποίηση';

  @override
  String get untitledNote => 'Σημείωση χωρίς τίτλο';

  @override
  String get titleHint => 'Τίτλος';

  @override
  String get noteBodyHint =>
      'Γράψτε τη σημείωσή σας... (υποστηρίζεται markdown)';

  @override
  String get nothingToPreview => 'Τίποτα για προεπισκόπηση';

  @override
  String get audioEnhancements => 'Βελτιώσεις ήχου';

  @override
  String get presets => 'ΠΡΟΕΠΙΛΟΓΕΣ';

  @override
  String get equalizer => 'ΙΣΟΣΤΑΘΜΙΣΤΗΣ';

  @override
  String get effects => 'ΕΦΕ';

  @override
  String get bassBoost => 'Ενίσχυση μπάσων';

  @override
  String get surround => 'Surround';

  @override
  String get loudness => 'Ένταση ήχου (Loudness)';

  @override
  String get monoAudio => 'Μονοφωνικός ήχος';

  @override
  String get skipSilence => 'Παράλειψη σιωπής';

  @override
  String get resetAll => 'Επαναφορά όλων';

  @override
  String get collectionNotFound => 'Η συλλογή δεν βρέθηκε';

  @override
  String get deleteCollection => 'Διαγραφή συλλογής';

  @override
  String get deleteCollectionContent =>
      'Είστε βέβαιοι ότι θέλετε να διαγράψετε αυτήν τη συλλογή;';

  @override
  String get deleteCollectionFailed => 'Αδυναμία διαγραφής της συλλογής';

  @override
  String get deletePermissionRequired =>
      'Απαιτείται άδεια διαγραφής. Ζητήστε από τον root διαχειριστή να σας τη χορηγήσει.';

  @override
  String get deleteFilesCheckbox => 'Διαγραφή και των αρχείων στον διακομιστή';

  @override
  String get deleteFilesCheckedHint =>
      'Τα αρχεία διαγράφονται οριστικά από τον διακομιστή.';

  @override
  String get deleteFilesUncheckedHint =>
      'Τα αρχεία παραμένουν στον διακομιστή, οπότε η επόμενη σάρωση βιβλιοθήκης μπορεί να το προσθέσει ξανά.';

  @override
  String get deleteFromServerAction => 'Διαγραφή από τον διακομιστή';

  @override
  String get deleteFromServerTitle => 'Διαγραφή από τον διακομιστή';

  @override
  String deleteFromServerContent(String title) {
    return 'Διαγραφή του «$title» από το Audiobookshelf;';
  }

  @override
  String deletedFromServer(String title) {
    return 'Διαγράφηκε το «$title»';
  }

  @override
  String get deleteFromServerFailed =>
      'Αδυναμία διαγραφής. Ελέγξτε τα αρχεία καταγραφής του διακομιστή.';

  @override
  String get playlistNotFound => 'Η λίστα αναπαραγωγής δεν βρέθηκε';

  @override
  String get deletePlaylist => 'Διαγραφή λίστας αναπαραγωγής';

  @override
  String get deletePlaylistContent =>
      'Είστε βέβαιοι ότι θέλετε να διαγράψετε αυτήν τη λίστα αναπαραγωγής;';

  @override
  String get newPlaylist => 'Νέα λίστα αναπαραγωγής';

  @override
  String get playlistNameHint => 'Όνομα λίστας αναπαραγωγής';

  @override
  String addedToName(String name) {
    return 'Προστέθηκε στο «$name»';
  }

  @override
  String get failedToAdd => 'Αποτυχία προσθήκης';

  @override
  String get newCollection => 'Νέα συλλογή';

  @override
  String get collectionNameHint => 'Όνομα συλλογής';

  @override
  String get listsNewCollectionSubtitle =>
      'Ομαδοποιήστε βιβλία σε μια λίστα που κρατάτε';

  @override
  String get listsNewCollectionNeedsBookSubtitle =>
      'Ξεκινήστε την με τουλάχιστον ένα βιβλίο';

  @override
  String get listsNewPlaylistSubtitle =>
      'Τακτοποιήστε βιβλία για να τα ακούτε με σειρά';

  @override
  String get listsAddBooksNow => 'Προσθήκη βιβλίων τώρα';

  @override
  String get listsPickBooksNext =>
      'Στη συνέχεια θα επιλέξετε βιβλία. Μια συλλογή σε αυτόν τον διακομιστή χρειάζεται τουλάχιστον ένα.';

  @override
  String get listsCreate => 'Δημιουργία';

  @override
  String get listsCollectionNeedsBook =>
      'Μια συλλογή χρειάζεται τουλάχιστον ένα βιβλίο, οπότε δεν δημιουργήθηκε τίποτα.';

  @override
  String get listsCreateFailed => 'Αδυναμία δημιουργίας';

  @override
  String get castToDevice => 'Μετάδοση σε συσκευή';

  @override
  String get searchingForCastDevices => 'Αναζήτηση συσκευών Cast...';

  @override
  String get castDevice => 'Συσκευή Cast';

  @override
  String get stopCasting => 'Διακοπή μετάδοσης';

  @override
  String get disconnect => 'Αποσύνδεση';

  @override
  String get audioOutput => 'Έξοδος ήχου';

  @override
  String get noOutputDevicesFound => 'Δεν βρέθηκαν συσκευές εξόδου';

  @override
  String get welcomeToAbsorb => 'Καλώς ήρθατε στο Absorb Plus';

  @override
  String get welcomeTagline => 'Ένας πελάτης Audiobookshelf.';

  @override
  String get welcomeAbsorbingTitle => 'Absorbing';

  @override
  String get welcomeAbsorbingIntro =>
      'Χρησιμοποιούμε το «absorb» αντί για «αναπαραγωγή» και «ακρόαση». Προτιμάτε την κλασική διατύπωση; Αλλάξτε την στις Ρυθμίσεις.';

  @override
  String get welcomeAbsorbingTabBullet =>
      'Καρτέλα Absorbing - αυτό που ακούτε αυτήν τη στιγμή';

  @override
  String get welcomeAbsorbButtonBullet => 'Κουμπί Absorb - έναρξη αναπαραγωγής';

  @override
  String get welcomeFullyAbsorbBullet =>
      'Fully Absorb - επισήμανση ως ολοκληρωμένου';

  @override
  String get welcomeGettingAroundTitle => 'Πλοήγηση';

  @override
  String get welcomeGettingAroundBody =>
      'Πατήστε σε οποιοδήποτε εξώφυλλο για να ανοίξετε τις λεπτομέρειές του. Οι κάρτες Συνέχεια ακρόασης διαφέρουν - πατήστε για άμεση αναπαραγωγή, πατήστε παρατεταμένα για άνοιγμα λεπτομερειών.';

  @override
  String get welcomeMakeItYoursTitle => 'Κάντε το δικό σας';

  @override
  String get welcomeMakeItYoursBody =>
      'Πειραματιστείτε στις Ρυθμίσεις για να προσαρμόσετε το Absorb στα γούστα σας. Αξίζει να δείτε την ενότητα Συμβουλές και κρυφές λειτουργίες εκεί μέσα.';

  @override
  String get getStarted => 'Ξεκινήστε';

  @override
  String get showMore => 'Εμφάνιση περισσότερων';

  @override
  String get showLess => 'Εμφάνιση λιγότερων';

  @override
  String get readMore => 'Διαβάστε περισσότερα';

  @override
  String get removeDownloadQuestion => 'Αφαίρεση λήψης;';

  @override
  String get removeDownloadContent => 'Θα αφαιρεθεί από τη συσκευή σας.';

  @override
  String get removeWhichDownload =>
      'Το ηχητικό βιβλίο και το ηλεκτρονικό βιβλίο βρίσκονται και τα δύο σε αυτήν τη συσκευή. Επιλέξτε τι θα αφαιρεθεί.';

  @override
  String get downloadRemoved => 'Η λήψη αφαιρέθηκε';

  @override
  String get finished => 'Ολοκληρώθηκε';

  @override
  String get saved => 'Ληφθέν';

  @override
  String get selectLibrary => 'Επιλογή βιβλιοθήκης';

  @override
  String get switchLibraryTooltip => 'Αλλαγή βιβλιοθήκης';

  @override
  String get refreshTooltip => 'Ανανέωση';

  @override
  String get noBooksFound => 'Δεν βρέθηκαν βιβλία';

  @override
  String get userFallback => 'Χρήστης';

  @override
  String get rootAdmin => 'Root διαχειριστής';

  @override
  String get admin => 'Διαχειριστής';

  @override
  String get serverAdmin => 'Διαχείριση διακομιστή';

  @override
  String get serverAdminSubtitle =>
      'Διαχείριση χρηστών, βιβλιοθηκών και ρυθμίσεων διακομιστή';

  @override
  String serverUpdateAvailable(String version) {
    return 'Διαθέσιμη ενημέρωση διακομιστή $version';
  }

  @override
  String get justNow => 'Μόλις τώρα';

  @override
  String minutesAgo(int count) {
    return 'πριν από $count λ.';
  }

  @override
  String hoursAgo(int count) {
    return 'πριν από $count ώρ.';
  }

  @override
  String daysAgo(int count) {
    return 'πριν από $count ημ.';
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
  String get coverPlayPause => 'Αναπαραγωγή/παύση από το εξώφυλλο';

  @override
  String get coverPlayPauseOnSubtitle =>
      'Ενεργό - πατήστε το εξώφυλλο για αναπαραγωγή/παύση';

  @override
  String get coverPlayPauseOffSubtitle =>
      'Ανενεργό - ξεχωριστό κουμπί αναπαραγωγής/παύσης στα χειριστήρια';

  @override
  String get cardBackground => 'Φόντο κάρτας';

  @override
  String get cardBackgroundBlurred => 'Θολό';

  @override
  String get cardBackgroundGradient => 'Διαβάθμιση';

  @override
  String get queueModeMergedSubtitle =>
      'Η αναπαραγωγή σταματά, χειροκίνητη ουρά ή αυτόματη αναπαραγωγή του επόμενου στοιχείου';

  @override
  String get queueModeSeriesLabel => 'Σειρά';

  @override
  String get queueModeShowLabel => 'Εκπομπή';

  @override
  String get queueModeInfoSeries => 'Σειρά';

  @override
  String get queueModeInfoSeriesDesc =>
      'Παίζει αυτόματα το επόμενο βιβλίο μιας σειράς ή το επόμενο επεισόδιο μιας εκπομπής podcast.';

  @override
  String get resetButtonGridQuestion => 'Επαναφορά πλέγματος κουμπιών;';

  @override
  String get resetButtonGridContent =>
      'Θα επαναφερθούν η προεπιλεγμένη διάταξη κουμπιών, η σειρά και οι ρυθμίσεις εναλλαγής.';

  @override
  String get reset => 'Επαναφορά';

  @override
  String get buttonGridReset => 'Το πλέγμα κουμπιών επαναφέρθηκε';

  @override
  String get resetButtonGrid => 'Επαναφορά πλέγματος κουμπιών';

  @override
  String get chapterBarrierOnRewind => 'Όριο κεφαλαίου στην επαναφορά';

  @override
  String get chapterBarrierInfoTitle => 'Όριο κεφαλαίου';

  @override
  String get chapterBarrierInfoContent =>
      'Κατά την πίσω μετάβαση, η αναπαραγωγή θα πηγαίνει στην αρχή του τρέχοντος κεφαλαίου αντί να περνά στο προηγούμενο.\n\nΠατήστε δύο φορές το κουμπί πίσω μετάβασης μέσα σε 2 δευτερόλεπτα για να ξεπεράσετε το όριο.';

  @override
  String get chapterBarrierOnRewindOnSubtitle =>
      'Ενεργό - η επαναφορά σταματά στην αρχή του κεφαλαίου';

  @override
  String get chapterBarrierOnRewindOffSubtitle =>
      'Ανενεργό - η επαναφορά διασχίζει τα όρια κεφαλαίων';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return 'Ενεργό - ${min}s έως ${max}s ανάλογα με τη διάρκεια της παύσης';
  }

  @override
  String get rewindOnSessionStart => 'Επαναφορά στην έναρξη συνεδρίας';

  @override
  String get rewindOnSessionStartInfoContent =>
      'Η κανονική αυτόματη επαναφορά ενεργοποιείται όταν συνεχίζετε από παύση μέσα σε ενεργή συνεδρία. Αυτή η ρύθμιση προσθέτει επαναφορά κατά την έναρξη εντελώς νέας συνεδρίας - για παράδειγμα αφού κλείσει η εφαρμογή, σταματήσει η αναπαραγωγή ή ανοίξετε την εφαρμογή από την αρχή.\n\nΌταν είναι ενεργή, η αναπαραγωγή γυρίζει πίσω κατά το πλήρες μέγιστο ποσό επαναφοράς στην αρχή κάθε νέας συνεδρίας, ώστε να ξανακούσετε το σημείο που σταματήσατε.';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return 'Ενεργό - επαναφορά ${seconds}s κατά την έναρξη νέας συνεδρίας';
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
    return 'παύση ${seconds}s';
  }

  @override
  String rewindMinPause(String minutes) {
    return 'παύση $minutes λεπτών';
  }

  @override
  String rewindHrPause(String hours) {
    return 'παύση $hours ωρών';
  }

  @override
  String get rewindOneHrPause => 'παύση 1 ώρας';

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
    return '$minutes λεπτά';
  }

  @override
  String get chimeBeforeSleep => 'Ήχος ειδοποίησης πριν τον ύπνο';

  @override
  String get chimeBeforeSleepOnSubtitle =>
      'Παίζει ένα απαλό κουδούνι όταν ο χρονοδιακόπτης πρόκειται να λήξει';

  @override
  String get chimeBeforeSleepOffSubtitle =>
      'Καμία ηχητική προειδοποίηση πριν τον ύπνο';

  @override
  String get windDownDuration => 'Διάρκεια τελικής φάσης';

  @override
  String windDownDurationSubtitle(int seconds) {
    return 'Η σταδιακή μείωση και ο ήχος ξεκινούν ${seconds}s πριν τον ύπνο';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return 'Μειώνει σταδιακά την ένταση στα τελευταία ${seconds}s';
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
  String get endOfChapterShort => 'Τέλος κεφαλαίου';

  @override
  String get endOfChapterOnSubtitle =>
      'Διακοπή στο τέλος του τρέχοντος κεφαλαίου';

  @override
  String get endOfChapterOffSubtitle => 'Χρήση χρονοδιακόπτη ύπνου με διάρκεια';

  @override
  String get showExplicitBadge => 'Εμφάνιση σήματος ακατάλληλου περιεχομένου';

  @override
  String get showExplicitBadgeOnSubtitle =>
      'Τα στοιχεία με ακατάλληλο περιεχόμενο δείχνουν σήμα «E»';

  @override
  String get showExplicitBadgeOffSubtitle =>
      'Ανενεργό - το σήμα είναι κρυμμένο';

  @override
  String get showEbookBadge => 'Εμφάνιση σήματος ηλεκτρονικού βιβλίου';

  @override
  String get showEbookBadgeOnSubtitle =>
      'Τα βιβλία με ηλεκτρονικό βιβλίο δείχνουν εικονίδιο βιβλίου στο εξώφυλλο';

  @override
  String get showEbookBadgeOffSubtitle =>
      'Ανενεργό - το σήμα ηλεκτρονικού βιβλίου είναι κρυμμένο';

  @override
  String get libraryFallback => 'Βιβλιοθήκη';

  @override
  String get preReleaseUpdatesInfoTitle => 'Ενημερώσεις προ-έκδοσης';

  @override
  String get preReleaseUpdatesInfoContent =>
      'Όταν είναι ενεργό, ο έλεγχος ενημερώσεων θα σας ειδοποιεί και για εκδόσεις alpha και προ-εκδόσεις από το GitHub. Μπορεί να είναι λιγότερο σταθερές, αλλά περιλαμβάνουν τις πιο πρόσφατες λειτουργίες και διορθώσεις.';

  @override
  String get includePreReleases => 'Συμπερίληψη προ-εκδόσεων';

  @override
  String get includePreReleasesOnSubtitle =>
      'Ενεργό - έλεγχος για εκδόσεις alpha και προ-εκδόσεις';

  @override
  String get includePreReleasesOffSubtitle =>
      'Ανενεργό - μόνο σταθερές εκδόσεις';

  @override
  String get setTooltip => 'Ορισμός';

  @override
  String get saveAbsorbBackup => 'Αποθήκευση αντιγράφου ασφαλείας του Absorb';

  @override
  String get checkForUpdate => 'Έλεγχος για ενημέρωση';

  @override
  String get onLatestVersion => 'Έχετε την τελευταία έκδοση';

  @override
  String get updateAvailable => 'Διαθέσιμη ενημέρωση';

  @override
  String get preReleaseAvailable => 'Διαθέσιμη προ-έκδοση';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'Υπάρχει νέα $kind του Absorb: $latest\n\nΕίστε στην έκδοση $current.';
  }

  @override
  String get updateKindPreRelease => 'προ-έκδοση';

  @override
  String get updateKindVersion => 'έκδοση';

  @override
  String get downloadButton => 'Λήψη';

  @override
  String get updateDownloading => 'Λήψη ενημέρωσης...';

  @override
  String get updateInstallPermissionDenied =>
      'Η άδεια εγκατάστασης απορρίφθηκε. Ενεργοποιήστε το «Εγκατάσταση άγνωστων εφαρμογών» για το Absorb στις ρυθμίσεις του συστήματος.';

  @override
  String get updateOpeningInBrowser =>
      'Η ενημέρωση εντός εφαρμογής απέτυχε, άνοιγμα στο πρόγραμμα περιήγησης';

  @override
  String get sendToEreader => 'Αποστολή σε e-reader';

  @override
  String sendingToEreader(String device) {
    return 'Αποστολή στη συσκευή $device...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return 'Στάλθηκε στη συσκευή $device';
  }

  @override
  String get sendToEreaderFailed =>
      'Δεν ήταν δυνατή η αποστολή του ηλεκτρονικού βιβλίου';

  @override
  String get pickEreaderDevice => 'Επιλέξτε συσκευή';

  @override
  String get adminEmail => 'Email';

  @override
  String get adminEmailSubtitle => 'SMTP και συσκευές e-reader';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => 'Οδηγός ρύθμισης';

  @override
  String get smtpHost => 'Διακομιστής';

  @override
  String get smtpPort => 'Θύρα';

  @override
  String get smtpSecure => 'Ασφαλής';

  @override
  String get smtpRejectUnauthorized => 'Απόρριψη μη εξουσιοδοτημένου TLS';

  @override
  String get smtpUser => 'Όνομα χρήστη';

  @override
  String get smtpPass => 'Κωδικός πρόσβασης';

  @override
  String get smtpFromAddress => 'Διεύθυνση αποστολέα';

  @override
  String get smtpTestAddress => 'Διεύθυνση δοκιμής';

  @override
  String get smtpSendTest => 'Αποστολή δοκιμής';

  @override
  String get smtpSaveSettings => 'Αποθήκευση';

  @override
  String get smtpSaved => 'Οι ρυθμίσεις email αποθηκεύτηκαν';

  @override
  String get smtpSaveFailed =>
      'Δεν ήταν δυνατή η αποθήκευση των ρυθμίσεων email';

  @override
  String get smtpTestSent => 'Το δοκιμαστικό email στάλθηκε';

  @override
  String get smtpTestFailed => 'Το δοκιμαστικό email απέτυχε';

  @override
  String get ereaderDevicesTitle => 'Συσκευές e-reader';

  @override
  String get ereaderDevicesEmpty =>
      'Δεν υπάρχουν συσκευές ακόμη. Προσθέστε μία παρακάτω.';

  @override
  String get addEreaderDevice => 'Προσθήκη συσκευής';

  @override
  String get editEreaderDevice => 'Επεξεργασία συσκευής';

  @override
  String get deleteEreaderDevice => 'Διαγραφή';

  @override
  String get ereaderDeviceName => 'Όνομα';

  @override
  String get ereaderDeviceEmail => 'Email';

  @override
  String get ereaderAvailability =>
      'Ποιος μπορεί να χρησιμοποιεί αυτή τη συσκευή';

  @override
  String get ereaderAvailAdminOrUp => 'Μόνο διαχειριστές';

  @override
  String get ereaderAvailUserOrUp => 'Όλοι οι χρήστες';

  @override
  String get ereaderAvailGuestOrUp => 'Όλοι';

  @override
  String get ereaderAvailSpecificUsers => 'Συγκεκριμένοι χρήστες';

  @override
  String ereaderSpecificUsersN(int count) {
    return 'Συγκεκριμένοι χρήστες ($count)';
  }

  @override
  String get ereaderDevicesSaved => 'Οι συσκευές αποθηκεύτηκαν';

  @override
  String get ereaderDevicesSaveFailed =>
      'Δεν ήταν δυνατή η αποθήκευση των συσκευών';

  @override
  String libraryCountOne(int count) {
    return '$count βιβλιοθήκη';
  }

  @override
  String libraryCountOther(int count) {
    return '$count βιβλιοθήκες';
  }

  @override
  String serverVersionLabel(String version) {
    return 'Διακομιστής $version';
  }

  @override
  String appVersionServerSuffix(String version) {
    return '  ·  Διακομιστής $version';
  }

  @override
  String backupDateFormat(int month, int day, int year) {
    return '$day/$month/$year';
  }

  @override
  String get backupDetailsSeparator => ' · ';

  @override
  String get bookmarksSortedByPositionReversed =>
      'Ταξινόμηση κατά θέση (αντίστροφη)';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '«$title» στο $position';
  }

  @override
  String get deleteBookmarkQuestion => 'Διαγραφή σελιδοδείκτη;';

  @override
  String get cardIconsOnlyChip => 'Μόνο εικονίδια';

  @override
  String get cardMoreInGridChip => '«Περισσότερα» στο πλέγμα';

  @override
  String get cardLayoutHidden => 'Κρυφό';

  @override
  String get speed => 'Ταχύτητα';

  @override
  String get details => 'Λεπτομέρειες';

  @override
  String get episodeDetailsLabel => 'Λεπτομέρειες επεισοδίου';

  @override
  String get bookDetailsLabel => 'Λεπτομέρειες βιβλίου';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => 'Ισοσταθμιστής';

  @override
  String get cast => 'Μετάδοση';

  @override
  String castingToDevice(String device) {
    return 'Μετάδοση στη συσκευή $device';
  }

  @override
  String castToDeviceNamed(String device) {
    return 'Μετάδοση στη συσκευή $device';
  }

  @override
  String get historyShort => 'Ιστορικό';

  @override
  String atPosition(String position) {
    return 'στο $position';
  }

  @override
  String chaptersChip(int count) {
    return '$count κεφάλαια';
  }

  @override
  String chapterNumber(int number) {
    return 'Κεφάλαιο $number';
  }

  @override
  String kbpsValue(int value) {
    return '$value kbps';
  }

  @override
  String get fileInfoTitle => 'Πληροφορίες αρχείων';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία',
      one: '1 αρχείο',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => 'Αυτό το βιβλίο δεν έχει λεπτομέρειες αρχείων.';

  @override
  String get fileInfoAudio => 'Ήχος';

  @override
  String get fileInfoEbook => 'Ηλεκτρονικό βιβλίο';

  @override
  String get fileInfoOther => 'Άλλα αρχεία';

  @override
  String get fileInfoBookOrbitNote =>
      'Το BookOrbit δεν αναφέρει κωδικοποιητή ή ρυθμό bit.';

  @override
  String fileInfoChannels(int count) {
    return '$count κανάλια';
  }

  @override
  String get fileInfoCover => 'Εξώφυλλο';

  @override
  String get fileInfoMetadata => 'Μεταδεδομένα';

  @override
  String get fileInfoSupplement => 'Πρόσθετο';

  @override
  String get fileInfoPathCopied => 'Η διαδρομή αντιγράφηκε';

  @override
  String get resetMayNotHaveSynced =>
      'Η επαναφορά ίσως δεν συγχρονίστηκε - ελέγξτε τον διακομιστή σας';

  @override
  String failedToDownloadEbook(int code) {
    return 'Αποτυχία λήψης ηλεκτρονικού βιβλίου ($code)';
  }

  @override
  String get serverReturnedErrorPage =>
      'Ο διακομιστής επέστρεψε σελίδα σφάλματος αντί για το αρχείο του ηλεκτρονικού βιβλίου';

  @override
  String ebookSaved(String filename) {
    return 'Αποθηκεύτηκε: $filename';
  }

  @override
  String errorSavingEbook(String error) {
    return 'Σφάλμα αποθήκευσης ηλεκτρονικού βιβλίου: $error';
  }

  @override
  String failedToSaveError(String error) {
    return 'Αποτυχία αποθήκευσης: $error';
  }

  @override
  String get adminBackupsLabel => 'Αντίγραφα ασφαλείας';

  @override
  String get adminListeningNow => 'Ακούνε τώρα';

  @override
  String get adminLibraries => 'Βιβλιοθήκες';

  @override
  String get adminLibraryShows => 'εκπομπές';

  @override
  String get adminLibraryBooks => 'βιβλία';

  @override
  String get adminLibraryFolders => 'φάκελοι';

  @override
  String get adminLibrarySize => 'μέγεθος';

  @override
  String get adminLibraryDuration => 'διάρκεια';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count στοιχεία που λείπουν ή δεν είναι έγκυρα',
      one: '1 στοιχείο που λείπει ή δεν είναι έγκυρο',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => 'Έλεγχος';

  @override
  String get adminMissingTitle => 'Στοιχεία που λείπουν';

  @override
  String adminMissingSubtitle(String library) {
    return 'Εγγραφές στη βιβλιοθήκη $library των οποίων τα αρχεία λείπουν ή δεν διαβάζονται';
  }

  @override
  String get adminMissingNone =>
      'Δεν υπάρχουν στοιχεία που λείπουν ή δεν είναι έγκυρα';

  @override
  String get adminMissingBadge => 'Λείπει';

  @override
  String get adminInvalidBadge => 'Μη έγκυρο';

  @override
  String get adminMissingDeleteTitle => 'Αφαίρεση εγγραφής';

  @override
  String adminMissingDeleteOneContent(String title) {
    return 'Αφαίρεση του «$title» από το Audiobookshelf;';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return 'Αφαίρεση $count εγγραφών από το Audiobookshelf;';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return 'Διαγραφή $count';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return 'Αφαιρέθηκε το $title';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Αφαιρέθηκαν $count εγγραφές',
      one: 'Αφαιρέθηκε 1 εγγραφή',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => 'Αποτυχία διαγραφής εγγραφής';

  @override
  String get adminMatchAction => 'Αντιστοίχιση';

  @override
  String adminMatchingStarted(String name) {
    return 'Η αντιστοίχιση ξεκίνησε για $name';
  }

  @override
  String get adminMatchFailed => 'Απέτυχε';

  @override
  String adminScanFailed(String name) {
    return 'Αποτυχία σάρωσης του $name';
  }

  @override
  String get adminPurgeCacheFailed => 'Απέτυχε';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => 'διαχειριστής';

  @override
  String get adminUsersDisabledBadge => 'απενεργοποιημένος';

  @override
  String get adminUsersEditUserTooltip => 'Επεξεργασία χρήστη';

  @override
  String get adminUsersOnlineNow => 'Συνδεδεμένος τώρα';

  @override
  String adminUsersLastSeen(String time) {
    return 'Τελευταία δραστηριότητα $time';
  }

  @override
  String get adminUsersNever => 'Ποτέ';

  @override
  String get adminUsersTotal => 'Σύνολο';

  @override
  String get adminUsersNoReadingActivity => 'Καμία δραστηριότητα ανάγνωσης';

  @override
  String get adminUsersLoadingDots => 'Φόρτωση...';

  @override
  String get adminUsersLoadMoreSessions => 'Φόρτωση περισσότερων συνεδριών';

  @override
  String get adminUsersNoRecentSessions => 'Δεν υπάρχουν πρόσφατες συνεδρίες';

  @override
  String get adminUsersLibraryProgress => 'Πρόοδος βιβλιοθήκης';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return 'Φόρτωση περισσότερων (απομένουν $count)';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return 'πριν από $count μ.';
  }

  @override
  String get adminUsersNewUser => 'Νέος χρήστης';

  @override
  String get adminUsersEditUser => 'Επεξεργασία χρήστη';

  @override
  String get adminUsersUsername => 'Όνομα χρήστη';

  @override
  String get adminUsersEnterUsername => 'Εισαγάγετε όνομα χρήστη';

  @override
  String get adminUsersPassword => 'Κωδικός πρόσβασης';

  @override
  String get adminUsersNewPassword => 'Νέος κωδικός πρόσβασης';

  @override
  String get adminUsersEnterPassword => 'Εισαγάγετε κωδικό πρόσβασης';

  @override
  String get adminUsersLeaveBlankToKeep =>
      'Αφήστε κενό για να διατηρηθεί ο τρέχων';

  @override
  String get adminUsersAccountType => 'Τύπος λογαριασμού';

  @override
  String get adminUsersTypeGuest => 'Επισκέπτης';

  @override
  String get adminUsersTypeUser => 'Χρήστης';

  @override
  String get adminUsersTypeAdmin => 'Διαχειριστής';

  @override
  String get adminUsersStatus => 'Κατάσταση';

  @override
  String get adminUsersAccountActive => 'Ενεργός λογαριασμός';

  @override
  String get adminUsersAccountActiveSub =>
      'Οι απενεργοποιημένοι λογαριασμοί δεν μπορούν να συνδεθούν';

  @override
  String get adminUsersLocked => 'Κλειδωμένος';

  @override
  String get adminUsersLockedSub => 'Αποτρέπει την αλλαγή κωδικού πρόσβασης';

  @override
  String get adminUsersPermissions => 'Δικαιώματα';

  @override
  String get adminUsersPermDownload => 'Λήψη';

  @override
  String get adminUsersPermUpdate => 'Ενημέρωση';

  @override
  String get adminUsersPermUpdateSub =>
      'Επεξεργασία μεταδεδομένων και στοιχείων βιβλιοθήκης';

  @override
  String get adminUsersPermDelete => 'Διαγραφή';

  @override
  String get adminUsersPermUpload => 'Μεταφόρτωση';

  @override
  String get adminUsersPermExplicit => 'Περιεχόμενο για ενήλικες';

  @override
  String get adminUsersLibraryAccess => 'Πρόσβαση σε βιβλιοθήκες';

  @override
  String get adminUsersAccessAllLibraries => 'Πρόσβαση σε όλες τις βιβλιοθήκες';

  @override
  String get adminUsersCreateUser => 'Δημιουργία χρήστη';

  @override
  String get adminUsersSaveChanges => 'Αποθήκευση αλλαγών';

  @override
  String get adminUsersUsernameRequired => 'Το όνομα χρήστη είναι υποχρεωτικό';

  @override
  String get adminUsersPasswordRequired =>
      'Ο κωδικός πρόσβασης είναι υποχρεωτικός';

  @override
  String get adminUsersUserCreated => 'Ο χρήστης δημιουργήθηκε';

  @override
  String get adminUsersUserUpdated => 'Ο χρήστης ενημερώθηκε';

  @override
  String get adminUsersFailedCreate => 'Αποτυχία δημιουργίας χρήστη';

  @override
  String get adminUsersFailedUpdate => 'Αποτυχία ενημέρωσης χρήστη';

  @override
  String get adminUsersThisUser => 'αυτόν τον χρήστη';

  @override
  String get adminUsersDeleteUserTitle => 'Διαγραφή χρήστη;';

  @override
  String adminUsersDeleteUserContent(String name) {
    return 'Οριστική διαγραφή του $name;';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return 'Ο χρήστης $name διαγράφηκε';
  }

  @override
  String get adminUsersFailedDelete => 'Αποτυχία διαγραφής χρήστη';

  @override
  String get adminUsersUnlinkOpenId => 'Αποσύνδεση OpenID';

  @override
  String get adminUsersUnlinkOpenIdTitle => 'Αποσύνδεση OpenID;';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return 'Αφαίρεση της σύνδεσης OpenID για τον χρήστη $name; Θα χρειαστεί να συνδεθεί ξανά με OpenID για να γίνει εκ νέου σύνδεση.';
  }

  @override
  String get adminUsersOpenIdUnlinked => 'Το OpenID αποσυνδέθηκε';

  @override
  String get adminUsersFailedUnlinkOpenId => 'Αποτυχία αποσύνδεσης OpenID';

  @override
  String adminUsersByAuthor(String author) {
    return 'από $author';
  }

  @override
  String get adminUsersListened => 'Ακροάθηκε';

  @override
  String get adminUsersStartedAtPosition => 'Ξεκίνησε στη θέση';

  @override
  String get adminUsersEndedAtPosition => 'Τελείωσε στη θέση';

  @override
  String get adminUsersTotalDuration => 'Συνολική διάρκεια';

  @override
  String get adminUsersStarted => 'Ξεκίνησε';

  @override
  String get adminUsersUpdated => 'Ενημερώθηκε';

  @override
  String get adminUsersClient => 'Πελάτης';

  @override
  String get adminUsersDevice => 'Συσκευή';

  @override
  String get adminUsersOs => 'Λειτουργικό σύστημα';

  @override
  String get adminUsersPlayMethod => 'Μέθοδος αναπαραγωγής';

  @override
  String get adminUsersPlayDirect => 'Άμεση αναπαραγωγή';

  @override
  String get adminUsersPlayDirectStream => 'Άμεση ροή';

  @override
  String get adminUsersPlayTranscode => 'Μετακωδικοποίηση';

  @override
  String get adminUsersPlayLocal => 'Τοπική';

  @override
  String get adminPodcastsCheckNewEpisodesTitle => 'Έλεγχος για νέα επεισόδια';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      'Θα γίνει έλεγχος των ροών RSS όλων των podcast και λήψη των νέων επεισοδίων που θα βρεθούν (αν είναι ενεργή η αυτόματη λήψη).';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle =>
      'Σάρωση ροής RSS και λήψη νέων επεισοδίων';

  @override
  String get adminPodcastsCheck => 'Έλεγχος';

  @override
  String get adminPodcastsCheckingForNew => 'Έλεγχος για νέα επεισόδια…';

  @override
  String get adminPodcastsCheckingForNewDots => 'Έλεγχος για νέα επεισόδια...';

  @override
  String get adminPodcastsFailedCheckEpisodes => 'Αποτυχία ελέγχου επεισοδίων';

  @override
  String get adminPodcastsCheckFeedsTooltip => 'Έλεγχος ροών για νέα επεισόδια';

  @override
  String get adminPodcastsNoPodcastsYet => 'Δεν υπάρχουν podcast ακόμη';

  @override
  String get adminPodcastsTapPlusHint =>
      'Πατήστε + για αναζήτηση και προσθήκη εκπομπών';

  @override
  String adminPodcastsEpisodesCount(int count) {
    return '$count επεισόδια';
  }

  @override
  String get adminPodcastsAddPodcast => 'Προσθήκη podcast';

  @override
  String get adminPodcastsCouldNotFindFeed => 'Δεν βρέθηκε η ροή του podcast';

  @override
  String get adminPodcastsSearchHint => 'Αναζήτηση podcast…';

  @override
  String get adminPodcastsSearchItunesHint => 'Αναζήτηση στο iTunes...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return 'Αναζήτηση στο iTunes για «$query»';
  }

  @override
  String get adminPodcastsNoPodcastsFound => 'Δεν βρέθηκαν podcast';

  @override
  String get adminPodcastsRelToday => 'Σήμερα';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return 'πριν από $count εβδ.';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return 'πριν από $count μ.';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return 'πριν από $count έτ.';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return 'Ενημερώθηκε $when';
  }

  @override
  String get adminPodcastsGenreAll => 'Όλα';

  @override
  String get adminPodcastsGenreArts => 'Τέχνες';

  @override
  String get adminPodcastsGenreComedy => 'Κωμωδία';

  @override
  String get adminPodcastsGenreEducation => 'Εκπαίδευση';

  @override
  String get adminPodcastsGenreTvFilm => 'Τηλεόραση και ταινίες';

  @override
  String get adminPodcastsGenreMusic => 'Μουσική';

  @override
  String get adminPodcastsGenreNews => 'Ειδήσεις';

  @override
  String get adminPodcastsGenreReligion => 'Θρησκεία';

  @override
  String get adminPodcastsGenreScience => 'Επιστήμη';

  @override
  String get adminPodcastsGenreSports => 'Αθλητισμός';

  @override
  String get adminPodcastsGenreTechnology => 'Τεχνολογία';

  @override
  String get adminPodcastsGenreBusiness => 'Επιχειρήσεις';

  @override
  String get adminPodcastsGenreFiction => 'Μυθοπλασία';

  @override
  String get adminPodcastsGenreSocietyCulture => 'Κοινωνία και πολιτισμός';

  @override
  String get adminPodcastsGenreHealthFitness => 'Υγεία και φυσική κατάσταση';

  @override
  String get adminPodcastsGenreTrueCrime => 'Αληθινό έγκλημα';

  @override
  String get adminPodcastsGenreHistory => 'Ιστορία';

  @override
  String get adminPodcastsGenreKidsFamily => 'Παιδιά και οικογένεια';

  @override
  String get adminPodcastsPodcastFallback => 'Podcast';

  @override
  String get adminPodcastsEpisodeFallback => 'Επεισόδιο';

  @override
  String get adminPodcastsNoFeedFound => 'Δεν βρέθηκε URL ροής';

  @override
  String get adminPodcastsNoFeedAvailable => 'Δεν υπάρχει διαθέσιμο URL ροής';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return 'Το $title προστέθηκε στη βιβλιοθήκη';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return 'Αποτυχία προσθήκης του $title';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    return '$count επεισόδια στη ροή';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    return '+ $count ακόμη επεισόδια';
  }

  @override
  String get adminPodcastsAdding => 'Προσθήκη…';

  @override
  String get adminPodcastsAddToLibrary => 'Προσθήκη στη βιβλιοθήκη';

  @override
  String get adminPodcastsRemoveShowTitle => 'Αφαίρεση εκπομπής;';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return 'Αφαίρεση του «$title» και όλων των επεισοδίων του από τον διακομιστή; Αυτό δεν μπορεί να αναιρεθεί.';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return 'Αφαιρέθηκε το «$title»';
  }

  @override
  String get adminPodcastsFailedRemoveShow => 'Αποτυχία αφαίρεσης εκπομπής';

  @override
  String get adminPodcastsRemoveShowTooltip => 'Αφαίρεση εκπομπής';

  @override
  String get adminPodcastsSelectMultipleTooltip => 'Πολλαπλή επιλογή';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return '$count ληφθέντα';
  }

  @override
  String get adminPodcastsTabDownloaded => 'Ληφθέντα';

  @override
  String get adminPodcastsTabFeed => 'Ροή';

  @override
  String get adminPodcastsTabSettings => 'Ρυθμίσεις';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return 'Λήψη του «$title»';
  }

  @override
  String get adminPodcastsFailedDownload => 'Αποτυχία λήψης';

  @override
  String get adminPodcastsDeleteEpisodeTitle => 'Διαγραφή επεισοδίου;';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return 'Διαγραφή του «$title»;';
  }

  @override
  String get adminPodcastsDeleted => 'Διαγράφηκε';

  @override
  String get adminPodcastsFailed => 'Απέτυχε';

  @override
  String get adminPodcastsDeleteEpisodesTitle => 'Διαγραφή επεισοδίων;';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return 'Διαγραφή $count επεισοδίου/ων από τον διακομιστή;';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return 'Διαγράφηκαν $count επεισόδιο/α';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload => 'Περιήγηση στη ροή για λήψη';

  @override
  String get adminPodcastsDownloadingDots => 'Λήψη...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return 'Διαγραφή $count επεισοδίου/ων';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return 'Λήψη $count επεισοδίου/ων';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return 'Λήψη $count επεισοδίου/ων';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter =>
      'Αναζήτηση επεισοδίων μετά από';

  @override
  String get adminPodcastsSelectDate => 'Επιλογή ημερομηνίας';

  @override
  String get adminPodcastsMaxEpisodes =>
      'Μέγιστος αριθμός επεισοδίων προς λήψη';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return 'Δεν βρέθηκαν νέα επεισόδια μετά τις $date';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return 'Βρέθηκαν $count νέο/α επεισόδιο/α - γίνεται λήψη';
  }

  @override
  String get adminPodcastsFailedToCheckNew =>
      'Αποτυχία ελέγχου για νέα επεισόδια';

  @override
  String get adminPodcastsCheckAndDownload => 'Έλεγχος και λήψη';

  @override
  String get adminPodcastsMatchPodcast => 'Αντιστοίχιση podcast';

  @override
  String get adminPodcastsMatchPodcastSubtitle =>
      'Αναζήτηση στο iTunes για ενημέρωση εξώφυλλου και μεταδεδομένων';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes =>
      'Αυτόματη λήψη νέων επεισοδίων';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle =>
      'Ο διακομιστής κατεβάζει αυτόματα τα νέα επεισόδια';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle =>
      'Τα νέα επεισόδια δεν κατεβαίνουν αυτόματα';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate =>
      'Αποτυχία ενημέρωσης της ρύθμισης αυτόματης λήψης';

  @override
  String get adminPodcastsMaxEpisodesToKeep =>
      'Μέγιστος αριθμός επεισοδίων προς διατήρηση';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      'Το 0 διατηρεί όλα τα επεισόδια. Μετά την αυτόματη λήψη ενός νέου επεισοδίου, το Audiobookshelf αφαιρεί το παλαιότερο επεισόδιο όταν η εκπομπή ξεπερνά αυτό το όριο.';

  @override
  String get adminPodcastsNoEpisodeLimit => 'Χωρίς όριο';

  @override
  String get adminPodcastsEpisodeLimitInvalid =>
      'Εισαγάγετε 0 ή έναν ακέραιο αριθμό';

  @override
  String get adminPodcastsCheckSchedule => 'Πρόγραμμα ελέγχου';

  @override
  String get adminPodcastsFrequency => 'Συχνότητα';

  @override
  String get adminPodcastsFreqHourly => 'Ωριαία';

  @override
  String get adminPodcastsFreqDaily => 'Ημερήσια';

  @override
  String get adminPodcastsFreqWeekly => 'Εβδομαδιαία';

  @override
  String get adminPodcastsDay => 'Ημέρα';

  @override
  String get adminPodcastsTime => 'Ώρα';

  @override
  String get adminPodcastsDaySun => 'Κυρ';

  @override
  String get adminPodcastsDayMon => 'Δευ';

  @override
  String get adminPodcastsDayTue => 'Τρί';

  @override
  String get adminPodcastsDayWed => 'Τετ';

  @override
  String get adminPodcastsDayThu => 'Πέμ';

  @override
  String get adminPodcastsDayFri => 'Παρ';

  @override
  String get adminPodcastsDaySat => 'Σάβ';

  @override
  String get adminPodcastsFeedUrl => 'URL ροής';

  @override
  String get adminPodcastsBack => 'Πίσω';

  @override
  String get adminPodcastsRootOnly => 'Μόνο root';

  @override
  String get adminPodcastsDeleting => 'Διαγραφή...';

  @override
  String get adminPodcastsDeleteEpisode => 'Διαγραφή επεισοδίου';

  @override
  String adminPodcastsSeasonChip(String season) {
    return 'Κύκλος $season';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return 'Επ. $number';
  }

  @override
  String get adminPodcastsApplyingMatch => 'Εφαρμογή αντιστοίχισης...';

  @override
  String get adminPodcastsNoResults => 'Κανένα αποτέλεσμα';

  @override
  String get adminPodcastsPodcastMatched =>
      'Το podcast αντιστοιχίστηκε και ενημερώθηκε';

  @override
  String get adminPodcastsFailedMatch => 'Αποτυχία αντιστοίχισης του podcast';

  @override
  String get adminPodcastsSelectAll => 'Επιλογή όλων';

  @override
  String get adminPodcastsSelectAllNew => 'Μόνο τα νέα';

  @override
  String get adminPodcastsSortNewestFirst => 'Πρώτα τα νεότερα';

  @override
  String get adminPodcastsSortOldestFirst => 'Πρώτα τα παλαιότερα';

  @override
  String get adminPodcastsEditInfo => 'Επεξεργασία στοιχείων';

  @override
  String get adminPodcastsEditInfoSubtitle =>
      'Αλλαγή τίτλου, περιγραφής, εξώφυλλου και άλλων';

  @override
  String get adminPodcastsEditTitle => 'Επεξεργασία podcast';

  @override
  String get adminPodcastsReleaseDate => 'Ημερομηνία κυκλοφορίας';

  @override
  String get adminPodcastsExplicit => 'Για ενήλικες';

  @override
  String get adminPodcastsExplicitSubtitle =>
      'Επισήμανση αυτού του podcast ως περιεχομένου για ενήλικες';

  @override
  String get episodeListEpisodeFallback => 'Επεισόδιο';

  @override
  String get episodeListUnknownPodcast => 'Άγνωστο podcast';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count επεισόδια επισημάνθηκαν ως ολοκληρωμένα',
      one: '1 επεισόδιο επισημάνθηκε ως ολοκληρωμένο',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count επεισόδια επισημάνθηκαν ως μη ολοκληρωμένα',
      one: '1 επεισόδιο επισημάνθηκε ως μη ολοκληρωμένο',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes =>
      'Διακοπή συνδρομής στα νέα επεισόδια';

  @override
  String get episodeListSubscribeToNewEpisodes => 'Συνδρομή στα νέα επεισόδια';

  @override
  String get episodeListSubscribeTitle => 'Συνδρομή σε αυτό το podcast;';

  @override
  String get episodeListSubscribeContent =>
      'Τα νέα επεισόδια θα λαμβάνονται αυτόματα και θα προστίθενται στην ουρά Absorbing μόλις εμφανιστούν στον διακομιστή.';

  @override
  String get episodeListSubscribe => 'Συνδρομή';

  @override
  String get episodeListShowFinishedEpisodes =>
      'Εμφάνιση ολοκληρωμένων επεισοδίων';

  @override
  String get episodeListHideFinishedEpisodes =>
      'Απόκρυψη ολοκληρωμένων επεισοδίων';

  @override
  String get episodeListShowSettings => 'Εμφάνιση ρυθμίσεων';

  @override
  String get episodeListPlaysNewerToOlder =>
      'Αναπαραγωγή από τα νεότερα στα παλαιότερα επεισόδια';

  @override
  String get episodeListPlaysOlderToNewer =>
      'Αναπαραγωγή από τα παλαιότερα στα νεότερα επεισόδια';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count επεισόδια',
      one: '1 επεισόδιο',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count μη ολοκληρωμένα',
      one: '1 μη ολοκληρωμένο',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => 'Αυτόματη λήψη';

  @override
  String get episodeListSubscribedChip => 'Συνδρομητής';

  @override
  String get episodeListExplicitChip => 'Για ενήλικες';

  @override
  String get episodeListSortNewest => 'Νεότερα';

  @override
  String get episodeListSortOldest => 'Παλαιότερα';

  @override
  String get episodeListSortBy => 'Ταξινόμηση επεισοδίων';

  @override
  String get episodeListSortPubDate => 'Ημερομηνία δημοσίευσης';

  @override
  String get episodeListSortTitle => 'Τίτλος';

  @override
  String get episodeListSortSeason => 'Κύκλος';

  @override
  String get episodeListSortEpisode => 'Αριθμός επεισοδίου';

  @override
  String get episodeListSortFileName => 'Όνομα αρχείου';

  @override
  String get episodeListSortReverseHint =>
      'Πατήστε ξανά για αντιστροφή της σειράς';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return 'Το «$title» προστέθηκε στο Absorbing';
  }

  @override
  String get episodeDetailEpisodeFallback => 'Επεισόδιο';

  @override
  String get episodeDetailMarkedNotFinished =>
      'Επισημάνθηκε ως μη ολοκληρωμένο';

  @override
  String get episodeDetailMarkedFinishedNice =>
      'Επισημάνθηκε ως ολοκληρωμένο - μπράβο!';

  @override
  String get episodeDetailMarkAbsorbedContent =>
      'Η πρόοδός σας για αυτό το επεισόδιο θα οριστεί στο 100%.';

  @override
  String get episodeDetailResetProgressContent =>
      'Θα διαγραφεί όλη η πρόοδος για αυτό το επεισόδιο και θα επιστρέψει στην αρχή. Δεν μπορεί να αναιρεθεί.';

  @override
  String get episodeDetailToday => 'Σήμερα';

  @override
  String get episodeDetailYesterday => 'Χθες';

  @override
  String episodeDetailDaysAgo(int count) {
    return 'πριν από $count ημ.';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return 'πριν από $count εβδ.';
  }

  @override
  String episodeDetailDurationHm(int hours, int minutes) {
    return '$hours ώ $minutes λ';
  }

  @override
  String episodeDetailDurationM(int minutes) {
    return '$minutes λ';
  }

  @override
  String get episodeDetailResume => 'Συνέχεια';

  @override
  String get episodeDetailPlayEpisode => 'Αναπαραγωγή επεισοδίου';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return 'Επεισόδιο $number';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return 'Κύκλος $number';
  }

  @override
  String get editMetadataUpdatedFromMatch =>
      'Τα μεταδεδομένα ενημερώθηκαν από την αντιστοίχιση';

  @override
  String editMetadataConfirmMatch(String title) {
    return 'Θα ενημερωθούν τα μεταδεδομένα του διακομιστή για αυτό το βιβλίο με βάση:\n\n«$title»\n\nΌλα τα πεδία και το εξώφυλλο θα αντικατασταθούν στον διακομιστή.';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return 'Θα ενημερωθούν τα μεταδεδομένα του διακομιστή για αυτό το βιβλίο με βάση:\n\n«$title» από $author\n\nΌλα τα πεδία και το εξώφυλλο θα αντικατασταθούν στον διακομιστή.';
  }

  @override
  String get seriesBooksFindMissingTitle => 'Εύρεση βιβλίων που λείπουν';

  @override
  String get seriesBooksFindMissingContent =>
      'Γίνεται αναζήτηση στο Audible για βιβλία αυτής της σειράς που ίσως λείπουν από τη βιβλιοθήκη σας.\n\nΤα βιβλία αντιστοιχίζονται πρώτα με ASIN (αν ο διακομιστής σας έχει ASIN για τα βιβλία του) και, αν όχι, με βάση τον τίτλο. Τα αποτελέσματα ενδέχεται να μην είναι απόλυτα ακριβή.';

  @override
  String get seriesBooksCouldNotFindOnAudible =>
      'Δεν βρέθηκε αυτή η σειρά στο Audible';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Θα καθαριστεί η κατάσταση ολοκλήρωσης για όλα τα $count βιβλία αυτής της σειράς.',
      one:
          'Θα καθαριστεί η κατάσταση ολοκλήρωσης για το 1 βιβλίο αυτής της σειράς.',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Και τα $count βιβλία αυτής της σειράς θα επισημανθούν ως ολοκληρωμένα.',
      one: 'Το 1 βιβλίο αυτής της σειράς θα επισημανθεί ως ολοκληρωμένο.',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => 'Αφαίρεση επισήμανσης όλων';

  @override
  String get seriesBooksShowAllBooks => 'Εμφάνιση όλων των βιβλίων';

  @override
  String get seriesBooksGroupBySubSeries => 'Ομαδοποίηση κατά υποσειρά';

  @override
  String get seriesBooksLoadingSubSeries => 'Φόρτωση υποσειρών...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία',
      one: '1 βιβλίο',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => 'Τέλος';

  @override
  String get seriesBooksExplicitBadge => 'E';

  @override
  String get expandedCardStreaming => 'Ροή';

  @override
  String get expandedCardDeviceFallback => 'Συσκευή';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$position στο «$bookTitle»';
  }

  @override
  String get bookmarksScreenClose => 'Κλείσιμο';

  @override
  String get bookmarksScreenSortNewest => 'Νεότερα';

  @override
  String get bookmarksScreenSortPosition => 'Θέση';

  @override
  String statsScreenStreakDays(int count) {
    return '$count ημ.';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count συνεδρία';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count συνεδρίες';
  }

  @override
  String get statsScreenDayMon => 'Δευ';

  @override
  String get statsScreenDayTue => 'Τρί';

  @override
  String get statsScreenDayWed => 'Τετ';

  @override
  String get statsScreenDayThu => 'Πέμ';

  @override
  String get statsScreenDayFri => 'Παρ';

  @override
  String get statsScreenDaySat => 'Σάβ';

  @override
  String get statsScreenDaySun => 'Κυρ';

  @override
  String statsScreenDurationHm(int h, int m) {
    return '$h ώ $m λ';
  }

  @override
  String statsScreenDurationM(int m) {
    return '$m λ';
  }

  @override
  String get statsScreenDurationLessThanMin => '<1 λ';

  @override
  String get statsScreenDurationZero => '0 λ';

  @override
  String statsScreenDurationShortH(int h) {
    return '$h ώ';
  }

  @override
  String statsScreenDurationShortM(int m) {
    return '$m λ';
  }

  @override
  String get statsScreenCouldNotLoadItem =>
      'Δεν ήταν δυνατή η φόρτωση του στοιχείου';

  @override
  String get statsScreenCouldNotFindEpisode => 'Δεν βρέθηκε το επεισόδιο';

  @override
  String statsScreenByAuthor(String author) {
    return 'από $author';
  }

  @override
  String get statsScreenListened => 'Ακροάθηκε';

  @override
  String get sessionEditTitle => 'Επεξεργασία συνεδρίας';

  @override
  String get sessionDayLabel => 'Ημέρα';

  @override
  String get sessionEndPosition => 'Θέση λήξης';

  @override
  String get sessionEndPositionHint =>
      'Η αλλαγή αυτού μπορεί να ενημερώσει και την τρέχουσα πρόοδό σας.';

  @override
  String get statsViewSessions => 'Προβολή συνεδριών';

  @override
  String statsSessionsForDate(String date) {
    return 'Συνεδρίες για $date';
  }

  @override
  String get statsNoSessionsForDate =>
      'Δεν βρέθηκαν συνεδρίες ακρόασης για αυτή την ημέρα';

  @override
  String get statsSearchSessions => 'Αναζήτηση συνεδριών';

  @override
  String get statsNoSessionSearchResults =>
      'Καμία συνεδρία δεν ταιριάζει με την αναζήτησή σας';

  @override
  String get statsSessionsLoadFailed =>
      'Δεν ήταν δυνατή η φόρτωση των συνεδριών για αυτή την ημέρα';

  @override
  String get sessionDeleteConfirmTitle => 'Διαγραφή συνεδρίας;';

  @override
  String get sessionDeleteConfirmBody =>
      'Η συνεδρία αφαιρείται και τα συνολικά σας στατιστικά ακρόασης μειώνονται κατά τη διάρκειά της. Δεν μπορεί να αναιρεθεί.';

  @override
  String get sessionSaved => 'Η συνεδρία ενημερώθηκε';

  @override
  String get sessionDeleted => 'Η συνεδρία διαγράφηκε';

  @override
  String get sessionSaveFailed => 'Δεν ήταν δυνατή η αποθήκευση των αλλαγών';

  @override
  String get sessionDeleteFailed =>
      'Δεν ήταν δυνατή η διαγραφή αυτής της συνεδρίας';

  @override
  String get statsScreenStartedAtPosition => 'Ξεκίνησε στη θέση';

  @override
  String get statsScreenEndedAtPosition => 'Τελείωσε στη θέση';

  @override
  String get statsScreenTotalDuration => 'Συνολική διάρκεια';

  @override
  String get statsScreenStarted => 'Ξεκίνησε';

  @override
  String get statsScreenUpdated => 'Ενημερώθηκε';

  @override
  String get statsScreenClient => 'Πελάτης';

  @override
  String get statsScreenDevice => 'Συσκευή';

  @override
  String get statsScreenOs => 'Λειτουργικό σύστημα';

  @override
  String get statsScreenPlayMethod => 'Μέθοδος αναπαραγωγής';

  @override
  String get statsScreenLoading => 'Φόρτωση...';

  @override
  String get statsScreenJumpToStart => 'Μετάβαση στην αρχή';

  @override
  String get statsScreenJumpToEnd => 'Μετάβαση στο τέλος';

  @override
  String get statsScreenPlayMethodDirect => 'Άμεση αναπαραγωγή';

  @override
  String get statsScreenPlayMethodDirectStream => 'Άμεση ροή';

  @override
  String get statsScreenPlayMethodTranscode => 'Μετακωδικοποίηση';

  @override
  String get statsScreenPlayMethodLocal => 'Τοπική';

  @override
  String get statsScreenAmLabel => 'π.μ.';

  @override
  String get statsScreenPmLabel => 'μ.μ.';

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
  String get statsScreenMonthJan => 'Ιαν';

  @override
  String get statsScreenMonthFeb => 'Φεβ';

  @override
  String get statsScreenMonthMar => 'Μαρ';

  @override
  String get statsScreenMonthApr => 'Απρ';

  @override
  String get statsScreenMonthMay => 'Μάι';

  @override
  String get statsScreenMonthJun => 'Ιουν';

  @override
  String get statsScreenMonthJul => 'Ιουλ';

  @override
  String get statsScreenMonthAug => 'Αυγ';

  @override
  String get statsScreenMonthSep => 'Σεπ';

  @override
  String get statsScreenMonthOct => 'Οκτ';

  @override
  String get statsScreenMonthNov => 'Νοε';

  @override
  String get statsScreenMonthDec => 'Δεκ';

  @override
  String get upcomingReleasesTitle => 'Επερχόμενες κυκλοφορίες';

  @override
  String get upcomingReleasesRescanTitle => 'Νέα σάρωση;';

  @override
  String upcomingReleasesRescanContent(int days) {
    return 'Αυτά τα αποτελέσματα είναι $days ημερών. Οι ημερομηνίες κυκλοφορίας ίσως έχουν αλλάξει - θέλετε νέα σάρωση;';
  }

  @override
  String get upcomingReleasesNotNow => 'Όχι τώρα';

  @override
  String get upcomingReleasesRescan => 'Νέα σάρωση';

  @override
  String get upcomingReleasesRescanReleaseDate =>
      'Νέα σάρωση ημερομηνίας κυκλοφορίας';

  @override
  String get upcomingReleasesRescanning => 'Νέα σάρωση...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return 'Ενημερώθηκε - $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound =>
      'Δεν βρέθηκε ημερομηνία κυκλοφορίας';

  @override
  String get upcomingReleasesRescanFailed => 'Η νέα σάρωση απέτυχε';

  @override
  String get upcomingReleasesRemoveFromList => 'Αφαίρεση από τη λίστα';

  @override
  String get upcomingReleasesRemovedFromList => 'Αφαιρέθηκε από τη λίστα';

  @override
  String get upcomingReleasesDateChip => 'Ημερομηνία';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return 'Έλεγχος του $name... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => 'Φόρτωση σειρών...';

  @override
  String get upcomingReleasesScannedToday => '(σαρώθηκε σήμερα)';

  @override
  String get upcomingReleasesScannedYesterday => '(σαρώθηκε χθες)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '(σαρώθηκε πριν από $days ημέρες)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return '$count επερχόμενα';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return '$count πρόσφατα';
  }

  @override
  String get upcomingReleasesNoneFound =>
      'Δεν βρέθηκαν επερχόμενες ή πρόσφατες κυκλοφορίες';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$summary σε $count σειρές';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return 'Ελέγχθηκαν $count σειρές στο Audible';
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
  String get upcomingReleasesBadgeUpcoming => 'ΕΠΕΡΧΟΜΕΝΟ';

  @override
  String get upcomingReleasesBadgeAdded => 'ΠΡΟΣΤΕΘΗΚΕ';

  @override
  String get upcomingReleasesBadgeMissing => 'ΛΕΙΠΕΙ';

  @override
  String get upcomingReleasesScanSettingsTitle => 'Ρυθμίσεις σάρωσης';

  @override
  String get upcomingReleasesFinishedAfterTitle =>
      'Θεώρηση σειράς ως ολοκληρωμένης μετά από';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      'Οι σειρές των οποίων το τελευταίο βιβλίο είναι παλαιότερο από αυτό το όριο παραλείπονται στις σαρώσεις και ελέγχονται ξανά μόνο ανά ένα-δύο μήνες.';

  @override
  String upcomingReleasesFinishedAfterYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count έτη',
      one: '1 έτος',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesFinishedAfterNever => 'Ποτέ';

  @override
  String get upcomingReleasesSkippedTitle => 'Σειρές που παραλείφθηκαν';

  @override
  String get upcomingReleasesSkippedNone => 'Δεν έχει παραλειφθεί τίποτα ακόμη';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count παραλείφθηκαν',
      one: '1 παραλείφθηκε',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Τελευταίο βιβλίο πριν από $count έτη',
      one: 'Τελευταίο βιβλίο πριν από 1 έτος',
      zero: 'Τελευταίο βιβλίο πριν από λιγότερο από έτος',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched =>
      'Δεν ήταν δυνατή η αντιστοίχιση αυτής της σειράς στο Audible';

  @override
  String get upcomingReleasesSkippedScanNow => 'Σάρωση τώρα';

  @override
  String get upcomingReleasesSkippedAlwaysScan => 'Πάντα σάρωση';

  @override
  String get upcomingReleasesSkippedNeverScan => 'Ποτέ σάρωση';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return 'Βρέθηκαν νέες κυκλοφορίες στο $name';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return 'Τίποτα νέο στο $name';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary =>
      'Αυτή η λίστα προέρχεται από άλλη βιβλιοθήκη. Κάντε νέα σάρωση για να ανανεωθεί.';

  @override
  String get upcomingReleasesChipUpcoming => 'Επερχόμενα';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count λείπουν',
      one: '1 λείπει',
      zero: 'Λείπουν',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => 'Δεν βρέθηκαν βιβλία που λείπουν';

  @override
  String get upcomingReleasesScanSeries => 'Σάρωση σειρών';

  @override
  String get upcomingReleasesScanUpcomingOption => 'Επερχόμενες κυκλοφορίες';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc =>
      'Γρήγορη σάρωση για νέα και επερχόμενα βιβλία';

  @override
  String get upcomingReleasesScanDeepOption => 'Βαθιά σάρωση';

  @override
  String get upcomingReleasesScanDeepOptionDesc =>
      'Βρίσκει επίσης βιβλία που λείπουν σε κάθε σειρά - διαρκεί περισσότερο';

  @override
  String get upcomingReleasesFirstScanNote =>
      'Η πρώτη σάρωση ελέγχει κάθε σειρά στο Audible και μπορεί να διαρκέσει μερικά λεπτά. Οι επόμενες γίνονται πολύ πιο γρήγορα όταν οι σειρές σας έχουν ταξινομηθεί.';

  @override
  String get upcomingReleasesLastScanReport => 'Αναφορά τελευταίας σάρωσης';

  @override
  String upcomingReleasesReportChecked(int count) {
    return 'Ελέγχθηκαν στο Audible: $count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return 'Παραλείφθηκαν: $count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return 'Χωρίς αντιστοίχιση στο Audible: $count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return 'Αποτυχία ελέγχου: $count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return 'Βρέθηκαν $upcoming επερχόμενα, $recent πρόσφατα';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return 'Βρέθηκαν $upcoming επερχόμενα, $recent πρόσφατα, $missing που λείπουν';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return '+$count ακόμη';
  }

  @override
  String get upcomingReleasesBadgeNew => 'ΝΕΟ';

  @override
  String get upcomingReleasesOpenLibrarySeries =>
      'Άνοιγμα σειράς στη βιβλιοθήκη';

  @override
  String get upcomingReleasesAsinCopied => 'Το ASIN της σειράς αντιγράφηκε';

  @override
  String get upcomingReleasesSetSeriesAsin => 'Ορισμός ASIN σειράς';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      'Βρείτε τη σειρά στο audible.com και αντιγράψτε τον σύνδεσμο της σελίδας - το ASIN είναι ο κωδικός 10 χαρακτήρων που ξεκινά με B0 (π.χ. B08S2YN3YS). Λειτουργεί και η επικόλληση ολόκληρου του συνδέσμου.';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… ή σύνδεσμος audible.com';

  @override
  String get upcomingReleasesSetAsinSave => 'Αποθήκευση';

  @override
  String get upcomingReleasesSetAsinInvalid =>
      'Δεν βρέθηκε ASIN σε αυτό το κείμενο';

  @override
  String get upcomingReleasesSetAsinSaved =>
      'Η σειρά συνδέθηκε - γίνεται σάρωση';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Αφαίρεση $count βιβλίων',
      one: 'Αφαίρεση βιβλίου',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => 'Αφαίρεση από αυτή τη σάρωση';

  @override
  String get upcomingReleasesRemoveThisScanDesc =>
      'Μπορεί να επανεμφανιστεί σε μελλοντική σάρωση';

  @override
  String get upcomingReleasesRemoveForever =>
      'Αφαίρεση από αυτή και τις μελλοντικές σαρώσεις';

  @override
  String get upcomingReleasesRemoveForeverDesc =>
      'Πηγαίνει στη λίστα των αφαιρεθέντων, με δυνατότητα επαναφοράς οποτεδήποτε';

  @override
  String get upcomingReleasesRemovedForeverToast =>
      'Αφαιρέθηκε - δεν θα εμφανίζεται στις μελλοντικές σαρώσεις';

  @override
  String get upcomingReleasesRemovedBooksTitle => 'Αφαιρεθέντα βιβλία';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία',
      one: '1 βιβλίο',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => 'Δεν υπάρχουν αφαιρεθέντα βιβλία';

  @override
  String get upcomingReleasesRestore => 'Επαναφορά';

  @override
  String get upcomingReleasesRestoredToast => 'Έγινε επαναφορά';

  @override
  String get upcomingReleasesRestoredNextScan =>
      'Έγινε επαναφορά - θα εμφανιστεί μετά την επόμενη σάρωση';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count επιλεγμένα',
      one: '1 επιλεγμένο',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => 'Αίτημα';

  @override
  String get upcomingReleasesBulkRemove => 'Αφαίρεση';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αφαιρέθηκαν',
      one: '1 αφαιρέθηκε',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'στάλθηκαν $count αιτήματα',
      one: 'στάλθηκε 1 αίτημα',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return '$count παραλείφθηκαν';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'έγινε νέα σάρωση σε $count σειρές',
      one: 'έγινε νέα σάρωση σε 1 σειρά',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return '$count με νέα βιβλία';
  }

  @override
  String get seriesExcludeFromScan => 'Εξαίρεση από τη σάρωση σειρών';

  @override
  String get seriesIncludeInScan => 'Συμπερίληψη στη σάρωση σειρών';

  @override
  String get homeScreenEpisodeFallback => 'Επεισόδιο';

  @override
  String get libraryScreenUnknownTitle => 'Άγνωστος τίτλος';

  @override
  String get playlistDetailDefaultName => 'Λίστα αναπαραγωγής';

  @override
  String playlistDetailItemCount(int count) {
    return '$count στοιχεία';
  }

  @override
  String get playlistDetailUnfinished => 'Μη ολοκληρωμένα';

  @override
  String get playlistDetailRemoveFromPlaylist =>
      'Αφαίρεση από τη λίστα αναπαραγωγής';

  @override
  String get playlistDetailDone => 'Τέλος';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return '$count στοιχεία επισημάνθηκαν ως ολοκληρωμένα';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return '$count στοιχεία επισημάνθηκαν ως μη ολοκληρωμένα';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return '$count στοιχεία αφαιρέθηκαν';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return 'Το «$title» προστέθηκε στο Absorbing';
  }

  @override
  String get collectionDetailDefaultName => 'Συλλογή';

  @override
  String smartScopeBookCount(int count) {
    return 'Smart Scope · $count βιβλία';
  }

  @override
  String get smartScopeNew => 'Νέο Smart Scope';

  @override
  String get smartScopeNewSubtitle =>
      'Αποθηκεύστε ένα σύνολο φίλτρων ως λίστα που ενημερώνεται μόνη της';

  @override
  String get smartScopeEditTitle => 'Επεξεργασία Smart Scope';

  @override
  String get smartScopeIcon => 'Εικονίδιο';

  @override
  String get smartScopePublic => 'Ορατό σε όλους τους χρήστες';

  @override
  String get smartScopeKobo => 'Συγχρονισμός με Kobo';

  @override
  String get smartScopeRules => 'Κανόνες';

  @override
  String get smartScopeMatchAll => 'Αντιστοιχία με όλους';

  @override
  String get smartScopeMatchAny => 'Αντιστοιχία με οποιονδήποτε';

  @override
  String get smartScopeAddRule => 'Προσθήκη κανόνα';

  @override
  String get smartScopeAddGroup => 'Προσθήκη ομάδας';

  @override
  String get smartScopeGroup => 'Ομάδα';

  @override
  String get smartScopeStartFrom => 'Έναρξη από';

  @override
  String get smartScopeFromScratch => 'Δημιουργία από το μηδέν';

  @override
  String get smartScopeTplHasSeries => 'Έχει σειρά';

  @override
  String get smartScopeTplRecent => 'Προστέθηκε πρόσφατα';

  @override
  String get smartScopeTplPdf => 'Μόνο PDF';

  @override
  String get smartScopeTplNoGenres => 'Χωρίς είδη';

  @override
  String get smartScopeTplEpub => 'Μόνο EPUB';

  @override
  String get smartScopeCounting => 'Καταμέτρηση...';

  @override
  String get smartScopeSort => 'Προεπιλεγμένη ταξινόμηση';

  @override
  String get smartScopeAddSort => 'Προσθήκη επιπέδου ταξινόμησης';

  @override
  String get smartScopeSortNone =>
      'Δεν έχει οριστεί ταξινόμηση, οπότε τα βιβλία ταξινομούνται κατά τίτλο.';

  @override
  String get smartScopeAscending => 'Αύξουσα';

  @override
  String get smartScopeDescending => 'Φθίνουσα';

  @override
  String get smartScopeDelete => 'Διαγραφή Smart Scope';

  @override
  String get smartScopeSaveFailed =>
      'Δεν ήταν δυνατή η αποθήκευση του Smart Scope';

  @override
  String get smartScopeDeleteFailed =>
      'Δεν ήταν δυνατή η διαγραφή του Smart Scope';

  @override
  String get smartScopeLoadFailed =>
      'Δεν ήταν δυνατή η φόρτωση του Smart Scope';

  @override
  String get smartScopeUnsupportedRule =>
      'Αυτός ο κανόνας μπορεί να αλλάξει μόνο στο web του BookOrbit. Διατηρείται ως έχει.';

  @override
  String get smartScopeAnd => 'και';

  @override
  String get smartScopeDays => 'ημέρες';

  @override
  String get smartScopeWeeks => 'εβδομάδες';

  @override
  String get smartScopeMonths => 'μήνες';

  @override
  String get smartScopePickDate => 'Επιλέξτε ημερομηνία';

  @override
  String get smartScopeAddValue => 'Προσθήκη τιμής';

  @override
  String get smartScopeValue => 'Τιμή';

  @override
  String get smartScopeCustomFields => 'Προσαρμοσμένα πεδία';

  @override
  String get smartScopeAnyProvider => 'Οποιοσδήποτε πάροχος';

  @override
  String get smartScopeScoreOutstanding => 'Εξαιρετικό';

  @override
  String get smartScopeScoreGood => 'Καλό';

  @override
  String get smartScopeScoreFair => 'Μέτριο';

  @override
  String get smartScopeScorePoor => 'Κακό';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => 'Έως 20 τιμές';

  @override
  String get scopeFieldTitle => 'Τίτλος';

  @override
  String get scopeFieldAuthor => 'Συγγραφέας';

  @override
  String get scopeFieldSeries => 'Σειρά';

  @override
  String get scopeFieldSeriesIndex => 'Αριθμός σειράς';

  @override
  String get scopeFieldGenre => 'Είδος';

  @override
  String get scopeFieldTag => 'Ετικέτα';

  @override
  String get scopeFieldReadStatus => 'Κατάσταση ανάγνωσης';

  @override
  String get scopeFieldReadProgress => 'Πρόοδος ανάγνωσης';

  @override
  String get scopeFieldRating => 'Η βαθμολογία σας';

  @override
  String get scopeFieldFormat => 'Μορφή';

  @override
  String get scopeFieldLibrary => 'Βιβλιοθήκη';

  @override
  String get scopeFieldCollection => 'Συλλογή';

  @override
  String get scopeFieldPublisher => 'Εκδότης';

  @override
  String get scopeFieldLanguage => 'Γλώσσα';

  @override
  String get scopeFieldPublishedDate => 'Ημερομηνία έκδοσης';

  @override
  String get scopeFieldPublishedYear => 'Έτος έκδοσης';

  @override
  String get scopeFieldAddedAt => 'Ημερομηνία προσθήκης';

  @override
  String get scopeFieldStartedAt => 'Ημερομηνία έναρξης';

  @override
  String get scopeFieldFinishedAt => 'Ημερομηνία ολοκλήρωσης';

  @override
  String get scopeFieldPageCount => 'Αριθμός σελίδων';

  @override
  String get scopeFieldFileSize => 'Μέγεθος αρχείου';

  @override
  String get scopeFieldCommunityRating => 'Βαθμολογία κοινότητας';

  @override
  String get scopeFieldCommunityRatingCount => 'Αριθμός κριτικών κοινότητας';

  @override
  String get scopeFieldMetadataScore => 'Βαθμολογία μεταδεδομένων';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => 'Περιγραφή';

  @override
  String get scopeFieldCover => 'Εξώφυλλο';

  @override
  String get scopeFieldAudioCover => 'Εξώφυλλο ηχητικού βιβλίου';

  @override
  String get scopeFieldFileAvailability => 'Διαθεσιμότητα αρχείων';

  @override
  String get scopeFieldLockStatus => 'Κατάσταση κλειδώματος';

  @override
  String get scopeFieldSeriesStatus => 'Κατάσταση σειράς';

  @override
  String get scopeSortUpdatedAt => 'Ημερομηνία ενημέρωσης';

  @override
  String get scopeSortLastReadAt => 'Τελευταία ανάγνωση';

  @override
  String get scopeSortRandom => 'Τυχαία';

  @override
  String get scopeOpContains => 'περιέχει';

  @override
  String get scopeOpNotContains => 'δεν περιέχει';

  @override
  String get scopeOpStartsWith => 'ξεκινά με';

  @override
  String get scopeOpEndsWith => 'τελειώνει με';

  @override
  String get scopeOpEq => 'είναι';

  @override
  String get scopeOpNotEq => 'δεν είναι';

  @override
  String get scopeOpIsEmpty => 'είναι κενό';

  @override
  String get scopeOpIsNotEmpty => 'δεν είναι κενό';

  @override
  String get scopeOpGt => 'μεγαλύτερο από';

  @override
  String get scopeOpGte => 'τουλάχιστον';

  @override
  String get scopeOpLt => 'μικρότερο από';

  @override
  String get scopeOpLte => 'το πολύ';

  @override
  String get scopeOpBetween => 'μεταξύ';

  @override
  String get scopeOpIncludesAny => 'περιλαμβάνει οποιοδήποτε από';

  @override
  String get scopeOpIncludesAll => 'περιλαμβάνει όλα από';

  @override
  String get scopeOpExcludesAll => 'εξαιρεί όλα από';

  @override
  String get scopeOpBefore => 'πριν από';

  @override
  String get scopeOpAfter => 'μετά από';

  @override
  String get scopeOpWithinLast => 'εντός των τελευταίων';

  @override
  String get scopeOpIsMissing => 'λείπει';

  @override
  String get scopeOpIsPresent => 'υπάρχει';

  @override
  String get scopeOpIsUnread => 'δεν έχει διαβαστεί';

  @override
  String get scopeOpIsInProgress => 'βρίσκεται σε εξέλιξη';

  @override
  String get scopeOpIsFinished => 'έχει ολοκληρωθεί';

  @override
  String get scopeOpIsLocked => 'είναι κλειδωμένο';

  @override
  String get scopeOpIsUnlocked => 'είναι ξεκλείδωτο';

  @override
  String get scopeOpIsUpNext => 'είναι το επόμενο';

  @override
  String get scopeOpIsTrue => 'είναι ναι';

  @override
  String get scopeOpIsFalse => 'είναι όχι';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία ταιριάζουν',
      one: '1 βιβλίο ταιριάζει',
      zero: 'Κανένα βιβλίο δεν ταιριάζει',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return 'Διαγραφή του «$name»; Δεν μπορεί να αναιρεθεί.';
  }

  @override
  String collectionDetailBookCount(int count) {
    return '$count βιβλία';
  }

  @override
  String get collectionDetailDone => 'Τέλος';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return 'Το «$title» προστέθηκε στο Absorbing';
  }

  @override
  String get audibleSeriesNoBooksFound => 'Δεν βρέθηκαν βιβλία στο Audible';

  @override
  String get audibleSeriesFailedToLoad =>
      'Αποτυχία φόρτωσης της σειράς από το Audible';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return '$total στο Audible · $missing λείπουν';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return '$total στο Audible · $missing λείπουν · $upcoming επερχόμενα';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return 'Λείπουν ($count)';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return 'Επερχόμενα ($count)';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return 'Όλα ($count)';
  }

  @override
  String get audibleSeriesSearching => 'Αναζήτηση στο Audible...';

  @override
  String get audibleSeriesCompleteSeries => 'Έχετε ολόκληρη τη σειρά!';

  @override
  String get audibleSeriesNoUpcoming => 'Δεν βρέθηκαν επερχόμενες κυκλοφορίες';

  @override
  String get audibleSeriesUpcomingBadge => 'ΕΠΕΡΧΟΜΕΝΟ';

  @override
  String get audibleSeriesAbridged => 'Συνοπτική έκδοση';

  @override
  String get audibleSeriesRegionTitle => 'Περιοχή Audible';

  @override
  String get audibleSeriesOpenOnAudible => 'Άνοιγμα στο Audible';

  @override
  String get audibleSeriesAddToCalendar => 'Προσθήκη στο ημερολόγιο';

  @override
  String get audibleSeriesAddToUpcoming =>
      'Προσθήκη στις επερχόμενες κυκλοφορίες';

  @override
  String get audibleSeriesAddedToUpcoming =>
      'Προστέθηκε στις επερχόμενες κυκλοφορίες';

  @override
  String get audibleSeriesAlreadyInUpcoming =>
      'Υπάρχει ήδη στη σελίδα επερχόμενων';

  @override
  String get audibleSeriesCouldNotOpenAudible =>
      'Δεν ήταν δυνατό το άνοιγμα του Audible';

  @override
  String get audibleSeriesCouldNotOpenCalendar =>
      'Δεν ήταν δυνατό το άνοιγμα του ημερολογίου';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return 'Νέα κυκλοφορία ηχητικού βιβλίου στη σειρά $seriesName';
  }

  @override
  String get authorBooksGroupBySeries => 'Ομαδοποίηση κατά σειρά';

  @override
  String get authorBooksList => 'Λίστα';

  @override
  String get authorBooksGrid => 'Πλέγμα';

  @override
  String authorBooksBookCount(int count) {
    return '$count βιβλία';
  }

  @override
  String get metadataLookupCover => 'Εξώφυλλο';

  @override
  String get metadataLookupChooseFields => 'Επιλογή πεδίων προς εφαρμογή';

  @override
  String metadataLookupApplyFields(int count) {
    return 'Εφαρμογή $count πεδίων';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return '$count πεδία αποθηκεύτηκαν τοπικά';
  }

  @override
  String get metadataLookupOverrideLocalDisplay =>
      'Παράκαμψη τοπικής εμφάνισης';

  @override
  String get equalizerPresetFlat => 'Επίπεδο';

  @override
  String get equalizerPresetVoiceBoost => 'Ενίσχυση φωνής';

  @override
  String get equalizerPresetBassBoost => 'Ενίσχυση μπάσων';

  @override
  String get equalizerPresetTrebleBoost => 'Ενίσχυση πρίμων';

  @override
  String get equalizerPresetPodcast => 'Podcast';

  @override
  String get equalizerPresetAudiobook => 'Ηχητικό βιβλίο';

  @override
  String get equalizerPresetReduceNoise => 'Μείωση θορύβου';

  @override
  String get equalizerPresetLoudness => 'Ένταση';

  @override
  String equalizerEditingSavedNamed(String title) {
    return 'Επεξεργασία αποθηκευμένου EQ για το «$title»';
  }

  @override
  String get equalizerEditingSavedGeneric => 'Επεξεργασία αποθηκευμένου EQ';

  @override
  String get equalizerPerBookEq => 'EQ ανά βιβλίο';

  @override
  String get notesDeleteNoteQuestion => 'Διαγραφή σημείωσης;';

  @override
  String notesDeleteNoteContent(String title) {
    return 'Διαγραφή του «$title»;';
  }

  @override
  String get notesExport => 'Εξαγωγή';

  @override
  String get notesNewNote => 'Νέα σημείωση';

  @override
  String get librarySortFilterUpcomingReleases => 'Σάρωση σειρών';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle =>
      'Λήψη φωτογραφίας και βιογραφικού για κάθε συγγραφέα από τον πάροχο μεταδεδομένων';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle =>
      'Έλεγχος του Audible για επερχόμενα και ελλιπή βιβλία στις σειρές σας';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'απομένουν $count κεφάλαια',
      one: 'απομένει 1 κεφάλαιο',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetAddMinutesChip(int minutes) {
    return '+$minutes λ';
  }

  @override
  String sleepTimerSheetAddChaptersChip(int count) {
    return '+$count κεφ.';
  }

  @override
  String sleepTimerSheetMinShort(int minutes) {
    return '$minutes λ';
  }

  @override
  String sleepTimerSheetSecondsShort(int seconds) {
    return '$seconds δ';
  }

  @override
  String sleepTimerSheetMinSecShort(int minutes, int seconds) {
    return '$minutes λ $seconds δ';
  }

  @override
  String sleepTimerSheetChaptersValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κεφάλαια',
      one: '1 κεφάλαιο',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetChaptersChip(int count) {
    return '$count κεφ.';
  }

  @override
  String sleepTimerSheetStartChapterSleep(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ύπνος μετά από $count κεφάλαια',
      one: 'Ύπνος μετά από 1 κεφάλαιο',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => 'Επαναφορά πίσω κατά τον ύπνο';

  @override
  String get sleepTimerSheetShake => 'Ανακίνηση';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return 'Προσθέτει $minutes λεπτά';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => 'Προσθέτει 1 κεφάλαιο';

  @override
  String get sleepTimerSheetResetsToFull => 'Επαναφέρει την πλήρη διάρκεια';

  @override
  String get sleepTimerSheetTabSpecificChapter => 'Κεφάλαιο';

  @override
  String get sleepTimerSheetSpecificNoChapters =>
      'Δεν υπάρχουν διαθέσιμα κεφάλαια';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return 'Κεφάλαιο $number';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => 'παρήλθε';

  @override
  String get sleepTimerSheetSpecificStart => 'Αρχή κεφαλαίου';

  @override
  String get sleepTimerSheetSpecificEnd => 'Τέλος κεφαλαίου';

  @override
  String get sleepTimerSheetSpecificEndsAt =>
      'Ο χρονοδιακόπτης ύπνου θα λήξει στις';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return 'σε $countdown';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed =>
      'Αυτό το σημείο έχει ήδη παρέλθει';

  @override
  String get sleepTimerSheetSpecificStartButton => 'Έναρξη χρονοδιακόπτη';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => 'Έχει ήδη παρέλθει';

  @override
  String get timeAm => 'π.μ.';

  @override
  String get timePm => 'μ.μ.';

  @override
  String get collectionPickerCollectionFallback => 'Συλλογή';

  @override
  String collectionPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get playlistPickerPlaylistFallback => 'Λίστα αναπαραγωγής';

  @override
  String playlistPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get cardChaptersPlayFromChapterTitle => 'Αναπαραγωγή από το κεφάλαιο;';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return 'Έναρξη αναπαραγωγής από το «$title»;';
  }

  @override
  String get cardChaptersPlay => 'Αναπαραγωγή';

  @override
  String get absorbingSharedToday => 'Σήμερα';

  @override
  String get absorbingSharedYesterday => 'Χθες';

  @override
  String get absorbingSharedMonday => 'Δευτέρα';

  @override
  String get absorbingSharedTuesday => 'Τρίτη';

  @override
  String get absorbingSharedWednesday => 'Τετάρτη';

  @override
  String get absorbingSharedThursday => 'Πέμπτη';

  @override
  String get absorbingSharedFriday => 'Παρασκευή';

  @override
  String get absorbingSharedSaturday => 'Σάββατο';

  @override
  String get absorbingSharedSunday => 'Κυριακή';

  @override
  String get absorbingSharedAm => 'π.μ.';

  @override
  String get absorbingSharedPm => 'μ.μ.';

  @override
  String sectionDetailAddedToAbsorbing(String title) {
    return 'Το «$title» προστέθηκε στο Absorbing';
  }

  @override
  String get sectionDetailDoneBadge => 'Τέλος';

  @override
  String get homeCustomizeAddGenreTitle => 'Προσθήκη ενότητας είδους';

  @override
  String get homeCustomizeAddGenreSubtitle =>
      'Επιλέξτε ένα είδος για εμφάνιση στην αρχική οθόνη';

  @override
  String get homeSectionDoneBadge => 'Τέλος';

  @override
  String get tipsSheetQuickBookmarksTitle => 'Γρήγοροι σελιδοδείκτες';

  @override
  String get tipsSheetQuickBookmarksDesc =>
      'Πατήστε παρατεταμένα το κουμπί σελιδοδείκτη σε οποιαδήποτε κάρτα για να προσθέσετε άμεσα σελιδοδείκτη στην τρέχουσα θέση χωρίς να ανοίξετε το φύλλο σελιδοδεικτών.';

  @override
  String get tipsSheetCoverPlayPauseTitle =>
      'Αναπαραγωγή/παύση από το εξώφυλλο';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      'Πατήστε το εξώφυλλο σε οποιαδήποτε κάρτα για αναπαραγωγή ή παύση. Εναλλάξτε το στις Ρυθμίσεις, στις Κάρτες Absorbing. Ένα αχνό εικονίδιο παύσης εμφανίζεται κατά την αναπαραγωγή ώστε να ξέρετε ότι πατιέται.';

  @override
  String get tipsSheetFullScreenPlayerTitle =>
      'Πρόγραμμα αναπαραγωγής πλήρους οθόνης';

  @override
  String get tipsSheetFullScreenPlayerDesc =>
      'Σύρετε προς τα πάνω σε οποιαδήποτε κάρτα absorbing για να ανοίξετε το πρόγραμμα αναπαραγωγής πλήρους οθόνης. Σύρετε προς τα κάτω για να το κλείσετε.';

  @override
  String get tipsSheetQuickAddAbsorbingTitle =>
      'Γρήγορη προσθήκη στο Absorbing';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      'Σύρετε δεξιά σε οποιοδήποτε βιβλίο σε φύλλο λίστας (σειρά, συγγραφέας, αποτελέσματα αναζήτησης) για να το προσθέσετε άμεσα στην ουρά absorbing.';

  @override
  String get tipsSheetShakeExtendSleepTitle => 'Ανακίνηση για παράταση ύπνου';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      'Αν έχετε ενεργό χρονοδιακόπτη ύπνου και ανακινήσετε το τηλέφωνο, θα προστεθούν επιπλέον λεπτά. Ορίστε το ποσό στις Ρυθμίσεις, στον Χρονοδιακόπτη ύπνου.';

  @override
  String get tipsSheetSeriesNavigationTitle => 'Πλοήγηση σειράς';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      'Πατήστε το όνομα της σειράς στο αναδυόμενο παράθυρο λεπτομερειών ενός βιβλίου για να δείτε όλα τα βιβλία της σειράς, ταξινομημένα με σειρά ανάγνωσης και με σήματα αρίθμησης σε κάθε εξώφυλλο.';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => 'Σύρσιμο μεταξύ βιβλίων';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      'Σύρετε αριστερά και δεξιά στην οθόνη Absorbing για εναλλαγή μεταξύ των βιβλίων που διαβάζετε. Με ενεργή τη χειροκίνητη λειτουργία ουράς, οι κάρτες λειτουργούν και ως ουρά, ώστε το επόμενο να παίζει αυτόματα όταν τελειώσει το τρέχον.';

  @override
  String get tipsSheetTapToSeekTitle => 'Πάτημα για αναζήτηση';

  @override
  String get tipsSheetTapToSeekDesc =>
      'Πατήστε οπουδήποτε στη γραμμή προόδου κεφαλαίου ή βιβλίου για μετάβαση απευθείας σε εκείνη τη θέση. Μπορείτε επίσης να σύρετε τις γραμμές για ακριβή έλεγχο.';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle =>
      'Χρόνος προσαρμοσμένος στην ταχύτητα';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      'Κάθε χρόνος που εμφανίζεται - θέση, υπόλοιπο, κεφάλαια, σελιδοδείκτες - προσαρμόζεται στην ταχύτητα αναπαραγωγής. Ακούτε στο 1.5x; Οι χρόνοι δείχνουν πόσο θα σας πάρει πραγματικά.';

  @override
  String get tipsSheetPlaybackHistoryTitle => 'Ιστορικό αναπαραγωγής';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      'Πατήστε το κουμπί Ιστορικό σε οποιαδήποτε κάρτα για να δείτε χρονολόγιο κάθε αναπαραγωγής, παύσης, αναζήτησης και αλλαγής ταχύτητας. Πατήστε οποιοδήποτε συμβάν για να επιστρέψετε σε εκείνη τη θέση.';

  @override
  String get tipsSheetAutoRewindTitle => 'Αυτόματη επαναφορά';

  @override
  String get tipsSheetAutoRewindDesc =>
      'Όταν συνεχίζετε μετά από παύση, το Absorb γυρίζει αυτόματα πίσω λίγα δευτερόλεπτα για να μη χάσετε το σημείο σας. Το ποσό εξαρτάται από το πόσο καιρό λείπατε. Ρυθμίστε το στις Ρυθμίσεις.';

  @override
  String get tipsSheetSeriesQueueModeTitle => 'Λειτουργία ουράς σειράς';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      'Όταν τελειώσετε ένα βιβλίο που ανήκει σε σειρά, το Absorb μπορεί να παίξει αυτόματα το επόμενο. Ορίστε τη λειτουργία ουράς σε «Σειρά» στις Ρυθμίσεις.';

  @override
  String get tipsSheetOfflineModeTitle => 'Λειτουργία εκτός σύνδεσης';

  @override
  String get tipsSheetOfflineModeDesc =>
      'Πατήστε το κουμπί αεροπλάνου στην οθόνη Absorbing για να μπείτε σε λειτουργία εκτός σύνδεσης. Σταματά τον συγχρονισμό, εξοικονομεί δεδομένα και εμφανίζει μόνο τα ληφθέντα βιβλία. Ιδανικό για πτήσεις ή περιοχές με χαμηλό σήμα.';

  @override
  String get tipsSheetUpcomingReleasesTitle => 'Επερχόμενες κυκλοφορίες';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      'Στην καρτέλα Σειρές, πατήστε ξανά την καρτέλα για να ανοίξει το φύλλο ταξινόμησης και φίλτρων, και επιλέξτε Επερχόμενες κυκλοφορίες για να δείτε νέα και επερχόμενα βιβλία στις σειρές σας, ταξινομημένα κατά ημερομηνία κυκλοφορίας.';

  @override
  String get tipsSheetPerBookEqTitle => 'Ισοσταθμιστής ανά βιβλίο';

  @override
  String get tipsSheetPerBookEqDesc =>
      'Κάθε βιβλίο θυμάται τις δικές του ρυθμίσεις ισοσταθμιστή. Ρυθμίστε τον EQ μία φορά για ένα έπος επιστημονικής φαντασίας και την επόμενη φορά θα ακούγεται το ίδιο.';

  @override
  String get tipsSheetPerBookSpeedTitle => 'Ταχύτητα ανά βιβλίο';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      'Η ταχύτητα αναπαραγωγής αποθηκεύεται ανά βιβλίο. Ακούστε μη λογοτεχνία στο 1.5x και δραματική λογοτεχνία στο 1.0x χωρίς να το ορίζετε κάθε φορά.';

  @override
  String get tipsSheetAutoSleepWindowTitle => 'Παράθυρο αυτόματου ύπνου';

  @override
  String get tipsSheetAutoSleepWindowDesc =>
      'Επιλέξτε τις ώρες που συνήθως κοιμάστε και ο χρονοδιακόπτης ύπνου θα ξεκινά μόνος του όταν αρχίζετε να ακούτε μέσα σε αυτό το παράθυρο.';

  @override
  String get tipsSheetSleepFadeChimeTitle => 'Σταδιακή μείωση και ήχος ύπνου';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      'Όταν λήγει ο χρονοδιακόπτης ύπνου, ο ήχος μειώνεται σταδιακά και παίζει προαιρετικό κουδούνι ώστε να μην κόβεται στη μέση μιας πρότασης.';

  @override
  String get tipsSheetCarModeTitle => 'Λειτουργία αυτοκινήτου';

  @override
  String get tipsSheetCarModeDesc =>
      'Πατήστε το εικονίδιο αυτοκινήτου για εναλλαγή στη λειτουργία με τεράστια κουμπιά, σχεδιασμένη για ασφαλέστερη χρήση κατά την οδήγηση.';

  @override
  String get tipsSheetAudibleSeriesTitle => 'Ανακάλυψη σειρών Audible';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      'Ανοίξτε μια σειρά και χρησιμοποιήστε το μενού επιλογών (οι τρεις τελείες) για να λάβετε την πλήρη λίστα της σειράς από το Audible, με τα βιβλία που λείπουν και αυτά που δεν έχετε ξεκινήσει.';

  @override
  String get tipsSheetTranscribeBookmarkTitle =>
      'Απομαγνητοφώνηση σελιδοδεικτών';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      'Μετατρέψτε τον ήχο σε οποιονδήποτε σελιδοδείκτη σε κείμενο, εξ ολοκλήρου στη συσκευή σας. Ενεργοποιήστε το στις Ρυθμίσεις, στις Για προχωρημένους > Απομαγνητοφώνηση και κάντε λήψη ενός μοντέλου, μετά πατήστε Απομαγνητοφώνηση σε έναν σελιδοδείκτη - το κείμενο μπαίνει στη σημείωσή του, έτοιμο για διόρθωση ή κοινοποίηση.';

  @override
  String get tipsSheetFindBetweenFormatsTitle =>
      'Μετάβαση μεταξύ ηχητικού και ηλεκτρονικού βιβλίου';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      'Με ενεργή την απομαγνητοφώνηση και ληφθέν το βιβλίο, κάντε παύση και πατήστε Εύρεση θέσης στο ηλεκτρονικό βιβλίο στο πρόγραμμα αναπαραγωγής για να ανοίξει το ηλεκτρονικό βιβλίο στο απόσπασμα που μόλις ακούσατε. Στον αναγνώστη, επιλέξτε κείμενο και πατήστε τα ακουστικά για να ξεκινήσει το ηχητικό βιβλίο ακριβώς από εκεί.';

  @override
  String get tipsSheetShareQuoteTitle => 'Κοινοποίηση αποσπασμάτων';

  @override
  String get tipsSheetShareQuoteDesc =>
      'Κοινοποιήστε μια επισήμανση ηλεκτρονικού βιβλίου ή μια σημείωση σελιδοδείκτη ως εικόνα με το απόσπασμα πάνω από το εξώφυλλο του βιβλίου. Αναζητήστε την επιλογή κοινοποίησης στις επισημάνσεις και στο φύλλο σελιδοδεικτών.';

  @override
  String get tipsSheetClipExportTitle => 'Εξαγωγή αποσπασμάτων ήχου';

  @override
  String get tipsSheetClipExportDesc =>
      'Ανοίξτε έναν σελιδοδείκτη και πατήστε Εξαγωγή αποσπάσματος για να κόψετε και να αποθηκεύσετε ένα σύντομο απόσπασμα ήχου του βιβλίου, με το εξώφυλλο - ιδανικό για κοινοποίηση μιας αγαπημένης σκηνής.';

  @override
  String get tipsSheetAllHighlightsTitle => 'Όλες οι επισημάνσεις σε ένα μέρος';

  @override
  String get tipsSheetAllHighlightsDesc =>
      'Η σελίδα Όλοι οι σελιδοδείκτες έχει μια καρτέλα Επισημάνσεις που συγκεντρώνει κάθε επισήμανση ηλεκτρονικού βιβλίου από κάθε βιβλίο. Πατήστε μία για να την κοινοποιήσετε ή να επιστρέψετε στο βιβλίο.';

  @override
  String get tipsSheetVolumeKeyPagesTitle =>
      'Αλλαγή σελίδας με τα πλήκτρα έντασης';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      'Γυρίστε τις σελίδες του ηλεκτρονικού βιβλίου με τα πλήκτρα έντασης. Ενεργοποιήστε το στις ρυθμίσεις του αναγνώστη - κανονική ή ανεστραμμένη κατεύθυνση, και μπορεί να παραμένει ενεργό ακόμη και όταν παίζει ήχος.';

  @override
  String get tipsSheetSettingsSyncTitle => 'Συγχρονισμός ρυθμίσεων';

  @override
  String get tipsSheetSettingsSyncDesc =>
      'Κρατήστε τις ρυθμίσεις, τις ταχύτητες ανά βιβλίο και τη σειρά του Absorbing συγχρονισμένα μεταξύ συσκευών μέσω του δικού σας διακομιστή WebDAV. Ρυθμίστε το στις Ρυθμίσεις, στο Αντίγραφο ασφαλείας και συγχρονισμός.';

  @override
  String get tipsSheetNavLongPressTitle =>
      'Παρατεταμένο πάτημα στις καρτέλες κάτω';

  @override
  String get tipsSheetNavLongPressDesc =>
      'Κρατήστε πατημένη την καρτέλα Αρχική για να αλλάξετε βιβλιοθήκη από οποιαδήποτε σελίδα. Κρατήστε πατημένη την καρτέλα Βιβλιοθήκη για να μεταβείτε απευθείας στην αναζήτηση.';

  @override
  String get bookCardUnknownTitle => 'Άγνωστος τίτλος';

  @override
  String get bookCardExplicitBadge => 'E';

  @override
  String get bookCardDone => 'Τέλος';

  @override
  String get bookCardSaved => 'Ληφθέν';

  @override
  String get episodeRowEpisode => 'Επεισόδιο';

  @override
  String get episodeRowToday => 'Σήμερα';

  @override
  String get episodeRowYesterday => 'Χθες';

  @override
  String episodeRowDaysAgo(int count) {
    return 'πριν $countημ.';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return 'πριν $countεβδ.';
  }

  @override
  String episodeRowDurationHm(int hours, int minutes) {
    return '$hoursω $minutesλ';
  }

  @override
  String episodeRowDurationM(int minutes) {
    return '$minutesλ';
  }

  @override
  String episodeRowSeasonShort(String number) {
    return 'Σ$number';
  }

  @override
  String episodeRowEpisodeShort(String number) {
    return 'Ε$number';
  }

  @override
  String get librarySearchResultsExplicitBadge => 'E';

  @override
  String get librarySearchResultsDone => 'Τέλος';

  @override
  String get librarySearchResultsSaved => 'Ληφθέν';

  @override
  String librarySearchResultsSequence(String number) {
    return '#$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => 'Άγνωστη σειρά';

  @override
  String get librarySearchResultsUnknownEpisode => 'Άγνωστο επεισόδιο';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία',
      one: '1 βιβλίο',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => 'E';

  @override
  String get libraryGridTilesDone => 'Τέλος';

  @override
  String get libraryGridTilesSaved => 'Ληφθέν';

  @override
  String libraryGridTilesSequence(String number) {
    return '#$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => 'Άγνωστη σειρά';

  @override
  String get seriesCardUnknownSeries => 'Άγνωστη σειρά';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία',
      one: '1 βιβλίο',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => 'Ακριβής μετακίνηση';

  @override
  String get cardProgressQuarterSpeed => 'Τέταρτο ταχύτητας';

  @override
  String get cardProgressHalfSpeed => 'Μισή ταχύτητα';

  @override
  String cardProgressChapterPrefix(String number) {
    return 'Κεφάλαιο $number';
  }

  @override
  String get cardEdgeProgressFineScrubbing => 'Ακριβής μετακίνηση';

  @override
  String get cardEdgeProgressQuarterSpeed => 'Τέταρτο ταχύτητας';

  @override
  String get cardEdgeProgressHalfSpeed => 'Μισή ταχύτητα';

  @override
  String get authSessionExpired => 'Η συνεδρία έληξε. Συνδεθείτε ξανά.';

  @override
  String authCannotReachServer(String url) {
    return 'Αδυναμία επικοινωνίας με τον διακομιστή στο $url';
  }

  @override
  String get authInvalidUsernameOrPassword =>
      'Μη έγκυρο όνομα χρήστη ή κωδικός πρόσβασης';

  @override
  String get authInvalidApiKey => 'Μη έγκυρο κλειδί API';

  @override
  String get authLoginFailedDetail =>
      'Η σύνδεση απέτυχε - ελέγξτε τη διεύθυνση του διακομιστή και τα στοιχεία σας';

  @override
  String get authUnexpectedServerResponse =>
      'Μη αναμενόμενη απάντηση διακομιστή';

  @override
  String get authSsoUnexpectedResponse =>
      'Το SSO επέστρεψε μη αναμενόμενη απάντηση';

  @override
  String get authSwitchedToLocalServer => 'Μετάβαση σε τοπικό διακομιστή';

  @override
  String get authSwitchedToRemoteServer =>
      'Μετάβαση σε απομακρυσμένο διακομιστή';

  @override
  String get lpDeletedFinishedDownload => 'Η ολοκληρωμένη λήψη διαγράφηκε';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'λήψη $count νέων επεισοδίων',
      one: 'λήψη 1 νέου επεισοδίου',
    );
    return '$showTitle: $_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return 'Το $showTitle προστέθηκε στην κορυφή της ουράς σας';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return 'Το $showTitle προστέθηκε 2ο στην ουρά σας';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return 'Το $showTitle προστέθηκε στο τέλος της ουράς σας';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return 'Λήφθηκε νέο επεισόδιο του $showTitle';
  }

  @override
  String get statsWeekStartsOn => 'Η εβδομάδα ξεκινά';

  @override
  String get episodeListNewEpisodePosition => 'Θέση νέου επεισοδίου';

  @override
  String get episodeListPositionTop => 'Κορυφή ουράς';

  @override
  String get episodeListPositionSecond => 'Δεύτερο στην ουρά';

  @override
  String get episodeListPositionEnd => 'Τέλος ουράς';

  @override
  String get episodeListPositionNone => 'Να μην προστίθεται στην ουρά';

  @override
  String get episodeListPositionNoneDesc => 'Θα υπάρχει ειδοποίηση και λήψη';

  @override
  String sleepRewindUndoNote(int minutes) {
    return 'Πατήστε αναπαραγωγή εντός $minutes λεπτών και η επαναφορά αναιρείται';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ουρά: λήψη $count στοιχείων',
      one: 'Ουρά: λήψη 1 στοιχείου',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Λήψη $count βιβλίων',
      one: 'Λήψη 1 βιβλίου',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Λήψη $count επεισοδίων',
      one: 'Λήψη 1 επεισοδίου',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName => 'Πρόοδος λήψεων';

  @override
  String get downloadNotifProgressChannelDesc =>
      'Εμφανίζει την πρόοδο κατά τη λήψη ηχητικών βιβλίων';

  @override
  String get downloadNotifAlertChannelName => 'Ειδοποιήσεις λήψεων';

  @override
  String get downloadNotifAlertChannelDesc =>
      'Ειδοποιήσεις όταν ολοκληρώνονται ή αποτυγχάνουν λήψεις';

  @override
  String get downloadNotifDownloadingTitle => 'Λήψη…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ενεργές λήψεις',
      one: '1 ενεργή λήψη',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return 'Λήψη: $title';
  }

  @override
  String get downloadNotifStartingLabel => 'Έναρξη…';

  @override
  String get downloadNotifCompleteTitle => 'Η λήψη ολοκληρώθηκε';

  @override
  String downloadNotifCompleteBody(String title) {
    return 'Το $title είναι έτοιμο για ακρόαση εκτός σύνδεσης';
  }

  @override
  String get downloadNotifFailedTitle => 'Η λήψη απέτυχε';

  @override
  String get upcomingNotifChannelName => 'Σάρωση επερχόμενων κυκλοφοριών';

  @override
  String get upcomingNotifChannelDesc =>
      'Εμφανίζει την πρόοδο κατά τη σάρωση για επερχόμενες κυκλοφορίες';

  @override
  String get upcomingNotifScanTitle => 'Σάρωση για επερχόμενες κυκλοφορίες';

  @override
  String get upcomingNotifStartingScan => 'Έναρξη σάρωσης…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return 'Έλεγχος $seriesName… ($current/$total)';
  }

  @override
  String get upcomingNotifFoundTitle => 'Βρέθηκαν επερχόμενες κυκλοφορίες!';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$series σειρές',
      one: '1 σειρά',
    );
    return '$books επερχόμενα σε $_temp0';
  }

  @override
  String get androidAutoTabContinue => 'Συνέχεια';

  @override
  String get androidAutoTabLibrary => 'Βιβλιοθήκη';

  @override
  String get androidAutoTabDownloads => 'Λήψεις';

  @override
  String get settingsSearchHint => 'Αναζήτηση ρυθμίσεων...';

  @override
  String get settingsSearchNoResults => 'Καμία αντίστοιχη ρύθμιση';

  @override
  String get carConnectAutoplay =>
      'Έναρξη αναπαραγωγής όταν συνδεθεί το Android Auto';

  @override
  String get carConnectAutoplayIos =>
      'Έναρξη αναπαραγωγής όταν συνδεθεί το CarPlay';

  @override
  String get carConnectAutoplayOnSubtitle =>
      'Το τελευταίο βιβλίο που ακούγατε ξεκινά αυτόματα όταν συνδεθεί το αυτοκίνητο';

  @override
  String get carConnectAutoplayOffSubtitle =>
      'Η αναπαραγωγή περιμένει να πατήσετε αναπαραγωγή';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => 'Χρήση με το Siri';

  @override
  String get siriStatusOn =>
      'Ενεργό. Το Siri μπορεί να βρει και να παίξει τα βιβλία και τα podcast σας με το όνομά τους.';

  @override
  String get siriStatusAsk =>
      'Αφήστε το Siri να βρίσκει και να παίζει τα βιβλία και τα podcast σας με το όνομά τους.';

  @override
  String get siriStatusOff =>
      'Το Siri είναι απενεργοποιημένο για το Absorb. Ενεργοποιήστε το στις Ρυθμίσεις του iOS.';

  @override
  String get siriAllow => 'Να επιτρέπεται';

  @override
  String get siriOpenSettings => 'Άνοιγμα ρυθμίσεων';

  @override
  String get siriThingsToSay => 'Τι να πείτε';

  @override
  String get siriExamples =>
      '«Παίξε [τίτλος βιβλίου] στο Absorb»\n«Παίξε [όνομα σειράς] στο Absorb»\n«Παίξε κάτι από [συγγραφέας] στο Absorb»\n«Παίξε το τελευταίο επεισόδιο του [podcast] στο Absorb»\n«Συνέχισε το Absorb»\n«Πήγαινε πίσω στο Absorb»\n«Επόμενο κεφάλαιο στο Absorb»\n«Ορισμός χρονοδιακόπτη ύπνου στο Absorb»\n«Πρόσθεσε σελιδοδείκτη στο Absorb»\n«Τι ακούω στο Absorb»';

  @override
  String get siriShortcutsNote =>
      'Η συνέχιση, η παύση, οι μεταβάσεις, τα κεφάλαια, ο χρονοδιακόπτης ύπνου, οι σελιδοδείκτες και το τι παίζει λειτουργούν ακόμη και χωρίς αυτήν την άδεια. Υπάρχουν επίσης στην εφαρμογή Συντομεύσεις για αυτοματισμούς και το κουμπί Action.';

  @override
  String get carBookOrder => 'Σειρά βιβλίων στο αυτοκίνητο';

  @override
  String get carBookOrderReverse => 'Αντίστροφη σειρά βιβλίων';

  @override
  String get carBookOrderReverseSubtitle =>
      'Ω προς Α, ή πρώτα τα παλαιότερα προστεθέντα';

  @override
  String get carPodcastOrder => 'Σειρά podcast στο αυτοκίνητο';

  @override
  String get carEpisodesOldestFirst => 'Πρώτα τα παλαιότερα επεισόδια';

  @override
  String get carEpisodesOldestFirstSubtitle =>
      'Για εκπομπές που ακούτε από την αρχή';

  @override
  String get androidAutoCatBooks => 'Βιβλία';

  @override
  String get androidAutoCatSeries => 'Σειρές';

  @override
  String get androidAutoCatAuthors => 'Συγγραφείς';

  @override
  String get androidAutoCatCollections => 'Συλλογές';

  @override
  String get androidAutoCatPlaylists => 'Λίστες αναπαραγωγής';

  @override
  String get showTipsAgain => 'Εμφάνιση συμβουλών ξανά';

  @override
  String get showTipsAgainSubtitle =>
      'Επαναφορά των συμβουλών λειτουργιών που έχετε κλείσει';

  @override
  String get tipsRestored => 'Οι συμβουλές επαναφέρθηκαν';

  @override
  String get resetSpeedPresets => 'Επαναφορά προεπιλογών ταχύτητας';

  @override
  String get resetSpeedPresetsSubtitle =>
      'Επαναφορά των προεπιλεγμένων επιλογών ταχύτητας αναπαραγωγής';

  @override
  String get speedPresetsReset => 'Οι προεπιλογές ταχύτητας επαναφέρθηκαν';

  @override
  String get editAuthor => 'Επεξεργασία συγγραφέα';

  @override
  String get authorName => 'Όνομα';

  @override
  String get authorImage => 'Εικόνα συγγραφέα';

  @override
  String get authorRemoveImage => 'Αφαίρεση εικόνας';

  @override
  String get authorRemoveImageTitle => 'Αφαίρεση εικόνας συγγραφέα;';

  @override
  String get authorRemoveImageConfirm =>
      'Αυτό διαγράφει την εικόνα στον διακομιστή.';

  @override
  String get authorImageRemoved => 'Η εικόνα αφαιρέθηκε';

  @override
  String get authorImageFailed => 'Αδυναμία ενημέρωσης της εικόνας συγγραφέα';

  @override
  String get authorUpdated => 'Ο συγγραφέας ενημερώθηκε';

  @override
  String get authorUpdateFailed => 'Αδυναμία ενημέρωσης του συγγραφέα';

  @override
  String get authorMatched => 'Ο συγγραφέας ενημερώθηκε από αντιστοίχιση';

  @override
  String get authorNoMatchFound => 'Δεν βρέθηκε αντιστοίχιση';

  @override
  String authorMergedInto(String name) {
    return 'Συγχωνεύθηκε στο $name';
  }

  @override
  String get authorQuickMatchHint =>
      'Λήψη ονόματος, ASIN, περιγραφής και εικόνας από το Audible για την επιλεγμένη περιοχή.';

  @override
  String get region => 'Περιοχή';

  @override
  String get editTabDetails => 'Λεπτομέρειες';

  @override
  String get editTabCover => 'Εξώφυλλο';

  @override
  String get editTabMatch => 'Αντιστοίχιση';

  @override
  String get editTabEmbed => 'Ενσωμάτωση';

  @override
  String get chapterEditorTitle => 'Επεξεργασία κεφαλαίων';

  @override
  String get chapterNotConnected => 'Δεν υπάρχει σύνδεση με διακομιστή';

  @override
  String get chapterErrorFirstNotZero =>
      'Το πρώτο κεφάλαιο πρέπει να ξεκινά στο 0:00';

  @override
  String get chapterErrorStartAfterPrevious =>
      'Η έναρξη πρέπει να είναι μετά το προηγούμενο κεφάλαιο';

  @override
  String get chapterErrorStartBeforeEnd =>
      'Η έναρξη πρέπει να είναι πριν το τέλος του βιβλίου';

  @override
  String get chapterErrorTitleRequired => 'Απαιτείται τίτλος';

  @override
  String get chapterEditStartTitle => 'Επεξεργασία ώρας έναρξης';

  @override
  String get chapterTimeHintSeconds => 'Δευτερόλεπτα';

  @override
  String get chapterTimeHintFull => 'ΩΩ:ΛΛ:ΔΔ ή δευτερόλεπτα';

  @override
  String get chapterInvalidTime => 'Μη έγκυρος χρόνος';

  @override
  String get chapterLocked => 'Το κεφάλαιο είναι κλειδωμένο';

  @override
  String get chapterAllLocked => 'Όλα τα κεφάλαια είναι κλειδωμένα';

  @override
  String chapterTrackTitle(int number) {
    return 'Κομμάτι $number';
  }

  @override
  String get chapterNoAudioForPosition => 'Δεν υπάρχει ήχος για αυτήν τη θέση';

  @override
  String get chapterCouldNotPlayPreview =>
      'Δεν ήταν δυνατή η αναπαραγωγή της προεπισκόπησης';

  @override
  String chapterStartSetTo(String time) {
    return 'Η έναρξη ορίστηκε σε $time';
  }

  @override
  String get chapterAddNumberedTitle => 'Προσθήκη αριθμημένων κεφαλαίων';

  @override
  String chapterNextPreview(String first, String second) {
    return 'Επόμενα: «$first», «$second», ...';
  }

  @override
  String get chapterHowMany => 'Πόσα κεφάλαια';

  @override
  String get add => 'Προσθήκη';

  @override
  String get chapterCountRange => 'Εισαγάγετε αριθμό από 1 έως 150';

  @override
  String get chapterTitlesUpdated => 'Οι τίτλοι κεφαλαίων ενημερώθηκαν';

  @override
  String get chaptersApplied => 'Τα κεφάλαια εφαρμόστηκαν';

  @override
  String get chapterDiscardTitle => 'Απόρριψη αλλαγών;';

  @override
  String get chapterDiscardMessage => 'Επιστροφή στα αποθηκευμένα κεφάλαια.';

  @override
  String get chapterRemoveAllTitle => 'Αφαίρεση όλων των κεφαλαίων;';

  @override
  String get chapterRemoveAllMessage =>
      'Αυτό αφαιρεί όλα τα κεφάλαια από αυτό το βιβλίο.';

  @override
  String get chapterAllRemoved => 'Όλα τα κεφάλαια αφαιρέθηκαν';

  @override
  String get chapterFixHighlighted =>
      'Διορθώστε πρώτα τα επισημασμένα κεφάλαια';

  @override
  String get chaptersUpdated => 'Τα κεφάλαια ενημερώθηκαν';

  @override
  String get ok => 'OK';

  @override
  String get chapterSaveButton => 'Αποθήκευση κεφαλαίων';

  @override
  String get chapterAddHint => 'Προσθήκη κεφαλαίου (π.χ. «Κεφάλαιο 01»)';

  @override
  String get chapterAddTooltip => 'Προσθήκη κεφαλαίων';

  @override
  String get chapterRemoveAll => 'Αφαίρεση όλων';

  @override
  String get chapterShiftTimes => 'Μετατόπιση χρόνων';

  @override
  String get chapterFromTracks => 'Από κομμάτια';

  @override
  String get chapterLookup => 'Αναζήτηση';

  @override
  String get chapterShowSeconds => 'Εμφάνιση δευτερολέπτων';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes λεπτά';
  }

  @override
  String get chapterLoopCut => 'Επανάληψη της κοπής';

  @override
  String get chapterFindStart => 'Εύρεση της αρχής';

  @override
  String get chapterFindStartListening => 'Ακρόαση γύρω από τον δείκτη';

  @override
  String get chapterFindStartNone =>
      'Τίποτα εδώ δεν ακούγεται σαν αρχή κεφαλαίου';

  @override
  String get chapterFindStartWider => 'Ευρύτερη αναζήτηση';

  @override
  String get chapterFindStartCeiling =>
      'Έγινε αναζήτηση μισής ώρας γύρω από τον δείκτη. Η αρχή βρίσκεται πιο μακριά ή δεν υπάρχει ανακοίνωση κεφαλαίου στον ήχο.';

  @override
  String get chapterFindStartStrong => 'Ακούγεται σαν αυτό το κεφάλαιο';

  @override
  String get chapterFindStartMaybe => 'Λέξεις τύπου κεφαλαίου';

  @override
  String chapterFindStartGap(String seconds) {
    return 'Κενό ${seconds}s';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return 'Αναζήτηση από $from έως $to';
  }

  @override
  String get chapterFindStartNeedsModel =>
      'Ενεργοποιήστε πρώτα την απομαγνητοφώνηση στις Ρυθμίσεις και κάντε λήψη ενός μοντέλου';

  @override
  String get chapterFindStartUseThis => 'Χρήση αυτού';

  @override
  String chapterFindStartTitle(String title) {
    return 'Τίτλος: $title';
  }

  @override
  String get chapterShiftBySeconds => 'Μετατόπιση κατά (δευτερόλεπτα)';

  @override
  String get chapterShiftHint =>
      'Μετατοπίζει κάθε ξεκλείδωτο κεφάλαιο. Χρησιμοποιήστε αρνητική τιμή για να τα μετακινήσετε νωρίτερα.';

  @override
  String get chapterTitleHint => 'Τίτλος κεφαλαίου';

  @override
  String get chapterStopPreview => 'Διακοπή προεπισκόπησης';

  @override
  String get chapterPreviewFromHere => 'Προεπισκόπηση από εδώ';

  @override
  String get chapterScrubHint =>
      'Σύρετε ή μετακινήστε για να αλλάξετε την έναρξη';

  @override
  String chapterStartAt(String time) {
    return 'Έναρξη στις $time';
  }

  @override
  String get chapterUnlock => 'Ξεκλείδωμα';

  @override
  String get chapterLock => 'Κλείδωμα';

  @override
  String get chapterInsertBelow => 'Εισαγωγή από κάτω';

  @override
  String get chapterFindTitle => 'Εύρεση κεφαλαίων';

  @override
  String get chapterFindSubtitle =>
      'Αναζητά κεφάλαια από το Audible/Audnexus με ASIN.';

  @override
  String get chapterEnterAsin => 'Εισαγάγετε ένα ASIN';

  @override
  String get chapterLookupFailed => 'Η αναζήτηση απέτυχε - ελέγξτε το ASIN';

  @override
  String get chapterNoChaptersFound => 'Δεν βρέθηκαν κεφάλαια για αυτό το ASIN';

  @override
  String get chapterRemoveBranding =>
      'Αφαίρεση branding Audible (εισαγωγή/επίλογος)';

  @override
  String chapterFoundCount(int count) {
    return 'Βρέθηκαν $count κεφάλαια';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  Βιβλίο $book';
  }

  @override
  String get chapterAudibleLonger =>
      'Η έκδοση του Audible είναι μεγαλύτερη από το αρχείο σας - τα τελευταία κεφάλαια μπορεί να μην ταιριάζουν.';

  @override
  String get chapterAudibleShorter =>
      'Η έκδοση του Audible είναι μικρότερη από το αρχείο σας - τα κεφάλαια μπορεί να μην ταιριάζουν.';

  @override
  String get chapterTitlesOnly => 'Μόνο τίτλοι';

  @override
  String get chapterApplyChapters => 'Εφαρμογή κεφαλαίων';

  @override
  String get coverSearchTitle => 'Αναζήτηση εξωφύλλου';

  @override
  String get coverSearchRefineHint =>
      'Βελτιώστε τον τίτλο/συγγραφέα για πιο καθαρά αποτελέσματα - αυτό δεν αλλάζει το βιβλίο.';

  @override
  String get coverNoneFound => 'Δεν βρέθηκαν εξώφυλλα';

  @override
  String get coverEnterTitleFirst => 'Εισαγάγετε πρώτα έναν τίτλο';

  @override
  String get coverUpdated => 'Το εξώφυλλο ενημερώθηκε';

  @override
  String get coverCouldNotUpdate => 'Δεν ήταν δυνατή η ενημέρωση του εξωφύλλου';

  @override
  String get coverApply => 'Εφαρμογή εξωφύλλου';

  @override
  String get coverUnknownResolution => 'Άγνωστη ανάλυση';

  @override
  String get embedIntro =>
      'Ενσωμάτωση μεταδεδομένων στα αρχεία ήχου, μαζί με το εξώφυλλο και τα κεφάλαια.';

  @override
  String get embedBackupOption => 'Αρχικά αντίγραφο ασφαλείας των αρχείων ήχου';

  @override
  String get embedNoteInFolder =>
      'Τα μεταδεδομένα θα ενσωματωθούν στα κομμάτια ήχου μέσα στον φάκελο των ηχητικών βιβλίων σας.';

  @override
  String get embedNoteMultiTrack =>
      'Τα κεφάλαια δεν ενσωματώνονται σε ηχητικά βιβλία πολλών κομματιών.';

  @override
  String get embedNoteNavigateAway =>
      'Μόλις ξεκινήσει η εργασία, μπορείτε να φύγετε από αυτήν τη σελίδα.';

  @override
  String get embedStartButton => 'Έναρξη ενσωμάτωσης μεταδεδομένων';

  @override
  String embedProgress(String percent) {
    return 'Ενσωμάτωση $percent%';
  }

  @override
  String get embedProgressIndeterminate => 'Ενσωμάτωση...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent% - συνεχίζεται αν φύγετε από αυτήν τη σελίδα';
  }

  @override
  String get taskStarting => 'Έναρξη...';

  @override
  String get embedBackupNoteIntro =>
      'Ένα αντίγραφο ασφαλείας των αρχικών αρχείων ήχου θα αποθηκευτεί στον διακομιστή στο ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro =>
      '. Φροντίστε να εκκαθαρίζετε περιοδικά την προσωρινή μνήμη στοιχείων.';

  @override
  String get embedDialogTitle => 'Ενσωμάτωση μεταδεδομένων';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# αρχεία ήχου',
      one: '# αρχείο ήχου',
    );
    return 'Ενσωμάτωση μεταδεδομένων σε $_temp0; Τα αρχεία ήχου σας θα ξαναγραφούν$backup.';
  }

  @override
  String get embedConfirmBackupClause =>
      ' (πρώτα αντίγραφο ασφαλείας των αρχικών)';

  @override
  String get embedConfirmAction => 'Ενσωμάτωση';

  @override
  String get embedCouldNotStart => 'Δεν ήταν δυνατή η έναρξη της ενσωμάτωσης';

  @override
  String get embedStarted => 'Η ενσωμάτωση ξεκίνησε';

  @override
  String get embedComplete => 'Η ενσωμάτωση ολοκληρώθηκε';

  @override
  String get embedFailed => 'Η ενσωμάτωση απέτυχε';

  @override
  String get encodeComplete => 'Η κωδικοποίηση ολοκληρώθηκε';

  @override
  String get encodeFailedTask => 'Η κωδικοποίηση απέτυχε';

  @override
  String encodeProgress(String percent) {
    return 'Κωδικοποίηση $percent%';
  }

  @override
  String get encodeProgressIndeterminate => 'Κωδικοποίηση...';

  @override
  String get adminApiKeys => 'Κλειδιά API';

  @override
  String get adminApiKeysSubtitle => 'Διακριτικά προγραμματιστικής πρόσβασης';

  @override
  String get adminApiKeysNewTitle => 'Νέο κλειδί API';

  @override
  String get adminApiKeysName => 'Όνομα';

  @override
  String get adminApiKeysNameHint => 'π.χ. Home Assistant';

  @override
  String get adminApiKeysOwner => 'Χρήστης';

  @override
  String get adminApiKeysExpiration => 'Λήξη';

  @override
  String get adminApiKeysActive => 'Ενεργό';

  @override
  String get adminApiKeysActiveSub => 'Το κλειδί λειτουργεί μόλις δημιουργηθεί';

  @override
  String get adminApiKeysInactive => 'Ανενεργό';

  @override
  String get adminApiKeysExpired => 'Έληξε';

  @override
  String get adminApiKeysCreate => 'Δημιουργία κλειδιού';

  @override
  String get adminApiKeysCreated => 'Το κλειδί API δημιουργήθηκε';

  @override
  String get adminApiKeysTokenLabel => 'Το νέο κλειδί API σας';

  @override
  String get adminApiKeysCopyWarning =>
      'Αντιγράψτε αυτό το κλειδί τώρα. Για λόγους ασφαλείας δεν θα εμφανιστεί ξανά.';

  @override
  String get adminApiKeysCopy => 'Αντιγραφή';

  @override
  String get adminApiKeysCopied => 'Αντιγράφηκε στο πρόχειρο';

  @override
  String get adminApiKeysDone => 'Τέλος';

  @override
  String get adminApiKeysDeleteTitle => 'Ανάκληση κλειδιού API;';

  @override
  String get adminApiKeysDeleted => 'Το κλειδί API ανακλήθηκε';

  @override
  String get adminApiKeysRevoke => 'Ανάκληση';

  @override
  String get adminApiKeysSetActive => 'Ορισμός ως ενεργό';

  @override
  String get adminApiKeysSetInactive => 'Ορισμός ως ανενεργό';

  @override
  String get adminApiKeysFailedCreate => 'Αδυναμία δημιουργίας κλειδιού API';

  @override
  String get adminApiKeysFailedDelete => 'Αδυναμία ανάκλησης κλειδιού API';

  @override
  String get adminApiKeysFailedUpdate => 'Αδυναμία ενημέρωσης κλειδιού API';

  @override
  String get adminApiKeysEmpty => 'Δεν υπάρχουν ακόμη κλειδιά API';

  @override
  String get adminApiKeysEmptySub =>
      'Δημιουργήστε ένα για να επιτρέψετε σε εφαρμογές και σενάρια να φτάνουν στον διακομιστή σας';

  @override
  String get adminApiKeysNeverUsed => 'Δεν έχει χρησιμοποιηθεί';

  @override
  String get adminApiKeysNeverExpires => 'Χωρίς λήξη';

  @override
  String get adminApiKeysNameRequired => 'Εισαγάγετε όνομα';

  @override
  String get adminApiKeysUserRequired => 'Επιλέξτε χρήστη';

  @override
  String get adminApiKeysExpNever => 'Ποτέ';

  @override
  String get adminApiKeysExp7d => '7 ημέρες';

  @override
  String get adminApiKeysExp30d => '30 ημέρες';

  @override
  String get adminApiKeysExp90d => '90 ημέρες';

  @override
  String get adminApiKeysExp1y => '1 έτος';

  @override
  String adminApiKeysLastUsed(String time) {
    return 'Τελευταία χρήση $time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return 'Λήγει $date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return 'Ανάκληση του «$name»; Οι εφαρμογές που χρησιμοποιούν αυτό το κλειδί θα χάσουν αμέσως την πρόσβαση.';
  }

  @override
  String get endOfEpisode => 'Τέλος επεισοδίου';

  @override
  String get sleepTimerSheetEpisodeSleepStart =>
      'Ύπνος στο τέλος του επεισοδίου';

  @override
  String get bookmarkListen => 'Ακρόαση';

  @override
  String get bookmarkPause => 'Παύση';

  @override
  String get bookmarkPreviewFailed =>
      'Αδυναμία αναπαραγωγής αυτού του σημείου.';

  @override
  String get clipExport => 'Εξαγωγή αποσπάσματος';

  @override
  String get clipJumpToStart => 'Μετάβαση στην αρχή';

  @override
  String get clipJumpToEnd => 'Μετάβαση στο τέλος';

  @override
  String get clipSetStart => 'Ορισμός αρχής';

  @override
  String get clipSetEnd => 'Ορισμός τέλους';

  @override
  String get clipInLabel => 'Αρχή';

  @override
  String get clipOutLabel => 'Τέλος';

  @override
  String get clipSave => 'Αποθήκευση αποσπάσματος';

  @override
  String clipExportSaved(String filename) {
    return 'Αποθηκεύτηκε το $filename';
  }

  @override
  String get clipExportClamped =>
      'Το απόσπασμα αποθηκεύτηκε, κόπηκε στο τέλος αυτού του κομματιού';

  @override
  String get clipExportFailed => 'Αδυναμία εξαγωγής του αποσπάσματος.';

  @override
  String get clipDownloadToExport =>
      'Κάντε πρώτα λήψη αυτού του βιβλίου για να εξαγάγετε απόσπασμα στο iPhone.';

  @override
  String get fsPickerTitle => 'Επιλογή φακέλου';

  @override
  String get fsServerRoot => 'Ρίζα διακομιστή';

  @override
  String get fsEmptyFolder => 'Δεν υπάρχουν υποφάκελοι εδώ';

  @override
  String get fsUseThisFolder => 'Χρήση αυτού του φακέλου';

  @override
  String get adminLibrariesManage => 'Βιβλιοθήκες';

  @override
  String get adminLibrariesManageSubtitle =>
      'Δημιουργία, επεξεργασία και αναδιάταξη';

  @override
  String get adminUploadTitle => 'Μεταφόρτωση πολυμέσων';

  @override
  String get adminUploadSubtitle => 'Προσθήκη βιβλίων και podcast από αρχεία';

  @override
  String get adminUploadNoLibraries =>
      'Δημιουργήστε μια βιβλιοθήκη πριν από τη μεταφόρτωση πολυμέσων.';

  @override
  String get adminUploadDestination => 'Προορισμός';

  @override
  String get adminUploadFolder => 'Φάκελος βιβλιοθήκης';

  @override
  String get adminUploadDetails => 'Στοιχεία αντικειμένου';

  @override
  String get adminUploadOptional => 'Προαιρετικό';

  @override
  String get adminUploadAutoMetadata => 'Αυτόματη λήψη μεταδεδομένων';

  @override
  String get adminUploadAutoMetadataSubtitle =>
      'Συμπλήρωση τίτλου, συγγραφέα και σειράς από την καλύτερη αντιστοιχία';

  @override
  String get adminUploadMetadataProvider => 'Πάροχος μεταδεδομένων';

  @override
  String get adminUploadMetadataSearching => 'Αναζήτηση μεταδεδομένων...';

  @override
  String get adminUploadMetadataNoResults =>
      'Δεν βρέθηκε αντιστοιχία μεταδεδομένων. Μπορείτε να μεταφορτώσετε το αντικείμενο ούτως ή άλλως.';

  @override
  String get adminUploadMetadataFailed =>
      'Η αναζήτηση μεταδεδομένων απέτυχε. Μπορείτε να μεταφορτώσετε το αντικείμενο ούτως ή άλλως.';

  @override
  String get adminUploadDestinationPreview => 'Προορισμός στον διακομιστή';

  @override
  String get adminUploadFiles => 'Αρχεία';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία',
      one: '1 αρχείο',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => 'Επιλογή αρχείων';

  @override
  String get adminUploadAddFiles => 'Προσθήκη αρχείων';

  @override
  String get adminUploadBookFilesHint =>
      'Επιλέξτε αρχεία ήχου ή ηλεκτρονικών βιβλίων. Μπορείτε να συμπεριλάβετε και εξώφυλλα ή αρχεία μεταδεδομένων.';

  @override
  String get adminUploadPodcastFilesHint =>
      'Επιλέξτε ένα ή περισσότερα αρχεία ήχου. Μπορείτε να συμπεριλάβετε και εξώφυλλα ή αρχεία μεταδεδομένων.';

  @override
  String get adminUploadUnsupportedFiles =>
      'Ορισμένα από τα επιλεγμένα αρχεία δεν υποστηρίζονται από το Audiobookshelf.';

  @override
  String get adminUploadFilePickerFailed =>
      'Δεν ήταν δυνατό το άνοιγμα των επιλεγμένων αρχείων.';

  @override
  String get adminUploadTitleRequired => 'Εισαγάγετε έναν τίτλο';

  @override
  String get adminUploadLibraryRequired => 'Επιλέξτε μια βιβλιοθήκη';

  @override
  String get adminUploadFolderRequired => 'Επιλέξτε έναν φάκελο βιβλιοθήκης';

  @override
  String get adminUploadFilesRequired => 'Επιλέξτε τουλάχιστον ένα αρχείο';

  @override
  String get adminUploadPodcastFileRequired =>
      'Επιλέξτε τουλάχιστον ένα αρχείο ήχου για αυτό το podcast.';

  @override
  String get adminUploadBookFileRequired =>
      'Επιλέξτε τουλάχιστον ένα αρχείο ήχου ή ηλεκτρονικού βιβλίου για αυτό το βιβλίο.';

  @override
  String get adminUploadPathCheckFailed =>
      'Δεν ήταν δυνατός ο έλεγχος του φακέλου προορισμού. Δεν μεταφορτώθηκε τίποτα.';

  @override
  String get adminUploadDestinationExists =>
      'Ο φάκελος προορισμού υπάρχει ήδη στον διακομιστή.';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return 'Ο προορισμός χρησιμοποιείται ήδη από το «$title».';
  }

  @override
  String get adminUploadAddToExistingTitle => 'Ο φάκελος υπάρχει ήδη';

  @override
  String adminUploadAddToExisting(String title) {
    return 'Ο φάκελος ανήκει στο «$title». Να προστεθούν τα αρχεία σε αυτόν; Ο διακομιστής θα τα εντοπίσει στην επόμενη σάρωση.';
  }

  @override
  String get adminUploadAddToExistingNoItem =>
      'Ο φάκελος υπάρχει ήδη στον διακομιστή. Να προστεθούν τα αρχεία σε αυτόν;';

  @override
  String get adminUploadAddToBook => 'Προσθήκη σε υπάρχον βιβλίο';

  @override
  String get adminUploadAddToBookHint => 'Αναζήτηση σε αυτή τη βιβλιοθήκη';

  @override
  String get adminUploadNoBooksFound => 'Δεν βρέθηκαν βιβλία';

  @override
  String adminUploadAddingTo(String title) {
    return 'Προσθήκη αρχείων στο «$title»';
  }

  @override
  String adminUploadAddedTo(String title) {
    return 'Τα αρχεία προστέθηκαν στο «$title»';
  }

  @override
  String get adminUploadTargetNoFolder =>
      'Δεν βρέθηκε ο φάκελος του βιβλίου στον διακομιστή.';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return 'Ο διακομιστής θα τοποθετούσε τα αρχεία στο «$preview», όχι στον φάκελο του βιβλίου «$folder». Δεν μεταφορτώθηκε τίποτα.';
  }

  @override
  String get adminUploadUploading => 'Μεταφόρτωση...';

  @override
  String adminUploadProgress(int percent) {
    return 'Μεταφόρτωση $percent%';
  }

  @override
  String get adminUploadButton => 'Μεταφόρτωση';

  @override
  String adminUploadComplete(String title) {
    return 'Το «$title» μεταφορτώθηκε';
  }

  @override
  String get adminUploadFailed => 'Η μεταφόρτωση απέτυχε';

  @override
  String adminUploadFailedReason(String error) {
    return 'Η μεταφόρτωση απέτυχε: $error';
  }

  @override
  String get adminUploadReselectFiles =>
      'Επιλέξτε ξανά τα αρχεία πριν επαναλάβετε.';

  @override
  String get adminServerSettings => 'Ρυθμίσεις διακομιστή';

  @override
  String get adminServerSettingsSubtitle =>
      'Σαρωτής, αποθήκευση και ταξινόμηση';

  @override
  String get adminAuthentication => 'Έλεγχος ταυτότητας';

  @override
  String get adminAuthenticationSubtitle =>
      'Σύνδεση με κωδικό πρόσβασης και OpenID Connect';

  @override
  String get adminStats => 'Στατιστικά';

  @override
  String get adminStatsSubtitle => 'Σύνολα βιβλιοθήκης και ακρόασης';

  @override
  String get adminAllSessions => 'Όλες οι συνεδρίες';

  @override
  String get adminAllSessionsSubtitle =>
      'Προβολή και διαχείριση όλων των συνεδριών ακρόασης';

  @override
  String get adminSessionsAllUsers => 'Όλοι οι χρήστες';

  @override
  String get adminSessionsEmpty => 'Καμία συνεδρία';

  @override
  String get statsLibraryTotals => 'Σύνολα βιβλιοθήκης';

  @override
  String get statsTotalItems => 'Αντικείμενα';

  @override
  String get statsAudioFiles => 'Αρχεία ήχου';

  @override
  String get statsTotalSize => 'Συνολικό μέγεθος';

  @override
  String get statsBooks => 'Βιβλία';

  @override
  String get statsPodcasts => 'Podcast';

  @override
  String get statsBooksSize => 'Μέγεθος βιβλίων';

  @override
  String get statsYearReview => 'Ανασκόπηση έτους';

  @override
  String get statsNoYearData => 'Δεν υπάρχουν δεδομένα για αυτό το έτος';

  @override
  String get statsListeningTime => 'Χρόνος ακρόασης';

  @override
  String get statsSessions => 'Συνεδρίες';

  @override
  String get statsBooksAdded => 'Βιβλία που προστέθηκαν';

  @override
  String get statsAuthorsAdded => 'Συγγραφείς που προστέθηκαν';

  @override
  String get statsTopAuthors => 'Κορυφαίοι συγγραφείς';

  @override
  String get statsTopNarrators => 'Κορυφαίοι αφηγητές';

  @override
  String get statsTopGenres => 'Κορυφαία είδη';

  @override
  String get srvScannerSection => 'Σαρωτής';

  @override
  String get srvFindCovers => 'Εύρεση εξώφυλλων';

  @override
  String get srvCoverProvider => 'Πάροχος εξώφυλλων';

  @override
  String get srvParseSubtitles => 'Ανάγνωση υποτίτλων από το όνομα αρχείου';

  @override
  String get srvPreferMatched => 'Προτίμηση αντιστοιχισμένων μεταδεδομένων';

  @override
  String get srvDisableWatcher => 'Απενεργοποίηση παρακολούθησης φακέλων';

  @override
  String get srvStorageSection => 'Αποθήκευση';

  @override
  String get srvStoreCover => 'Αποθήκευση εξώφυλλου με το αντικείμενο';

  @override
  String get srvStoreMetadata => 'Αποθήκευση μεταδεδομένων με το αντικείμενο';

  @override
  String get srvMetadataFormat => 'Μορφή αρχείου μεταδεδομένων';

  @override
  String get srvFormatSection => 'Εμφάνιση και μορφή';

  @override
  String get srvDateFormat => 'Μορφή ημερομηνίας';

  @override
  String get srvTimeFormat => 'Μορφή ώρας';

  @override
  String get srvLanguage => 'Γλώσσα διακομιστή';

  @override
  String get srvChromecast => 'Υποστήριξη Chromecast';

  @override
  String get srvAllowIframe => 'Να επιτρέπεται η ενσωμάτωση iframe';

  @override
  String get srvSortingSection => 'Ταξινόμηση';

  @override
  String get srvIgnorePrefixes => 'Παράβλεψη προθεμάτων στην ταξινόμηση';

  @override
  String get srvSortingPrefixes => 'Προθέματα ταξινόμησης';

  @override
  String get srvAddPrefix => 'Προσθήκη προθέματος';

  @override
  String get srvSave => 'Αποθήκευση ρυθμίσεων';

  @override
  String get srvSavePrefixes => 'Αποθήκευση προθεμάτων';

  @override
  String get srvSaved => 'Οι ρυθμίσεις αποθηκεύτηκαν';

  @override
  String get srvSaveFailed => 'Δεν ήταν δυνατή η αποθήκευση των ρυθμίσεων';

  @override
  String get srvPrefixesSaved => 'Τα προθέματα ταξινόμησης ενημερώθηκαν';

  @override
  String get authSetLoadFailed =>
      'Δεν ήταν δυνατή η φόρτωση των ρυθμίσεων ελέγχου ταυτότητας';

  @override
  String get authSetCustomMessage => 'Προσαρμοσμένο μήνυμα στη σύνδεση';

  @override
  String get authSetMessage => 'Μήνυμα';

  @override
  String get authSetPasswordAuth => 'Έλεγχος ταυτότητας με κωδικό πρόσβασης';

  @override
  String get authSetOpenId => 'Έλεγχος ταυτότητας OpenID Connect';

  @override
  String get authSetGuide => 'Οδηγός ρύθμισης';

  @override
  String get authSetIssuerUrl => 'URL εκδότη';

  @override
  String get authSetAutoPopulate => 'Αυτόματη συμπλήρωση';

  @override
  String get authSetAuthorizeUrl => 'URL εξουσιοδότησης';

  @override
  String get authSetTokenUrl => 'URL διακριτικού';

  @override
  String get authSetUserinfoUrl => 'URL πληροφοριών χρήστη';

  @override
  String get authSetJwksUrl => 'URL JWKS';

  @override
  String get authSetLogoutUrl => 'URL αποσύνδεσης';

  @override
  String get authSetClientId => 'Αναγνωριστικό πελάτη';

  @override
  String get authSetClientSecret => 'Μυστικό πελάτη';

  @override
  String get authSetSigningAlgorithm => 'Αλγόριθμος υπογραφής';

  @override
  String get authSetRedirectUris =>
      'Επιτρεπόμενα URI ανακατεύθυνσης για κινητά';

  @override
  String get authSetRedirectUrisInfo =>
      'Οι εφαρμογές μπορούν να επιστρέψουν μετά τη σύνδεση μόνο σε αυτές τις διευθύνσεις. Το Absorb χρησιμοποιεί absorb://oauth. Ένας αστερίσκος (*) ως μοναδική εγγραφή επιτρέπει οποιαδήποτε διεύθυνση.';

  @override
  String get authSetAddRedirectUri => 'Προσθήκη URI';

  @override
  String get authSetAddAbsorbRedirect => 'Προσθήκη absorb://oauth';

  @override
  String get authSetSubfolder => 'Υποφάκελος για τα URL ανακατεύθυνσης';

  @override
  String get authSetSubfolderNone => 'Κανένας';

  @override
  String get authSetWebRedirectInfo =>
      'Επιτρέψτε αυτά τα URL στον πάροχο OAuth ώστε η σύνδεση να επιστρέφει στην εφαρμογή web:';

  @override
  String get authSetButtonText => 'Κείμενο κουμπιού';

  @override
  String get authSetMatchExisting => 'Αντιστοίχιση υπαρχόντων χρηστών με';

  @override
  String get authSetMatchNone => 'Χωρίς αντιστοίχιση';

  @override
  String get authSetMatchEmail => 'Email';

  @override
  String get authSetMatchUsername => 'Όνομα χρήστη';

  @override
  String get authSetMatchExistingInfo =>
      'Χρησιμοποιείται για τη σύνδεση υπαρχόντων χρηστών. Μετά τη σύνδεση, οι χρήστες αντιστοιχίζονται με το μοναδικό αναγνωριστικό τους από τον πάροχο.';

  @override
  String get authSetAutoLaunch => 'Αυτόματη εκκίνηση';

  @override
  String get authSetAutoLaunchInfo =>
      'Άνοιγμα του παρόχου αυτόματα από τη σελίδα σύνδεσης web. Το /login?autoLaunch=0 την παρακάμπτει.';

  @override
  String get authSetAutoRegister => 'Αυτόματη εγγραφή';

  @override
  String get authSetAutoRegisterInfo =>
      'Δημιουργία νέων χρηστών αυτόματα μετά τη σύνδεσή τους';

  @override
  String get authSetClaimsInfo =>
      'Αφήστε τα κενά για να απενεργοποιήσετε την ανάθεση ομάδων και δικαιωμάτων. Οι νέοι χρήστες θα λαμβάνουν τότε τον ρόλο User.';

  @override
  String get authSetGroupClaim => 'Claim ομάδας';

  @override
  String get authSetGroupClaimInfo =>
      'Το claim που απαριθμεί τις ομάδες του χρήστη, συνήθως groups. Οι ομάδες με όνομα admin, user ή guest ορίζουν τον ρόλο και επικρατεί η υψηλότερη. Αν καμία ομάδα δεν ταιριάζει, η σύνδεση απορρίπτεται.';

  @override
  String get authSetPermsClaim => 'Claim προηγμένων δικαιωμάτων';

  @override
  String get authSetPermsClaimInfo =>
      'Claim με δικαιώματα για χρήστες που δεν είναι διαχειριστές. Αν το claim λείπει, η σύνδεση απορρίπτεται και μια επιλογή που λείπει θεωρείται απενεργοποιημένη. Αναμενόμενη μορφή:';

  @override
  String get authSetRestartNote =>
      'Κάντε επανεκκίνηση του διακομιστή μετά την αποθήκευση για να εφαρμοστούν οι αλλαγές OpenID Connect.';

  @override
  String get authSetNoChanges => 'Δεν υπάρχουν αλλαγές για αποθήκευση';

  @override
  String get authSetNeedOneMethod =>
      'Ενεργοποιήστε τουλάχιστον μία μέθοδο σύνδεσης';

  @override
  String authSetFieldRequired(String field) {
    return 'Το πεδίο $field είναι υποχρεωτικό';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return 'Μη έγκυρο URI ανακατεύθυνσης: $uri';
  }

  @override
  String get authSetAsteriskAlone =>
      'Ο αστερίσκος (*) πρέπει να είναι το μοναδικό URI ανακατεύθυνσης';

  @override
  String authSetInvalidClaim(String field) {
    return 'Το $field δεν είναι έγκυρο όνομα claim';
  }

  @override
  String authSetIssuerFailed(String error) {
    return 'Δεν ήταν δυνατή η ανάγνωση του εκδότη: $error';
  }

  @override
  String get libNoneYet => 'Δεν υπάρχουν βιβλιοθήκες ακόμη';

  @override
  String get libReorderFailed => 'Δεν ήταν δυνατή η αποθήκευση της νέας σειράς';

  @override
  String get libDeleteTitle => 'Διαγραφή βιβλιοθήκης;';

  @override
  String get libDeleteBody =>
      'Αυτό αφαιρεί οριστικά τη βιβλιοθήκη και όλα τα αντικείμενά της από τον διακομιστή.';

  @override
  String get libDeleted => 'Η βιβλιοθήκη διαγράφηκε';

  @override
  String get libDeleteFailed => 'Δεν ήταν δυνατή η διαγραφή της βιβλιοθήκης';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φάκελοι',
      one: '1 φάκελος',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => 'Νέα βιβλιοθήκη';

  @override
  String get libEditTitle => 'Επεξεργασία βιβλιοθήκης';

  @override
  String get libName => 'Όνομα βιβλιοθήκης';

  @override
  String get libMediaType => 'Τύπος πολυμέσων';

  @override
  String get libMediaBook => 'Βιβλία';

  @override
  String get libMediaPodcast => 'Podcast';

  @override
  String get libProvider => 'Πάροχος μεταδεδομένων';

  @override
  String get libIcon => 'Εικονίδιο';

  @override
  String get libFolders => 'Φάκελοι';

  @override
  String get libAddFolder => 'Προσθήκη φακέλου';

  @override
  String get libNoFolders => 'Προσθέστε τουλάχιστον έναν φάκελο';

  @override
  String get libAdvanced => 'Σύνθετες ρυθμίσεις';

  @override
  String get libCoverShape => 'Σχήμα εξώφυλλου';

  @override
  String get libCoverSquare => 'Τετράγωνο';

  @override
  String get libCoverStandard => 'Στάνταρ';

  @override
  String get libDisableWatcher => 'Απενεργοποίηση παρακολούθησης φακέλων';

  @override
  String get libSkipAsin => 'Παράλειψη αντιστοίχισης βιβλίων με ASIN';

  @override
  String get libSkipIsbn => 'Παράλειψη αντιστοίχισης βιβλίων με ISBN';

  @override
  String get libHideSingleSeries => 'Απόκρυψη σειρών ενός βιβλίου';

  @override
  String get libAudiobooksOnly => 'Μόνο ηχητικά βιβλία';

  @override
  String get libEpubScripted => 'Να επιτρέπεται περιεχόμενο ePub με σενάρια';

  @override
  String get libLaterBooksOnly =>
      'Εμφάνιση μόνο των επόμενων βιβλίων στη Συνέχεια σειράς';

  @override
  String get libPodcastRegion => 'Περιοχή αναζήτησης podcast';

  @override
  String get libMarkPercent => 'Ολοκληρώθηκε στο % της προόδου';

  @override
  String get libMarkTime => 'Ολοκληρώθηκε με υπόλοιπο δευτερολέπτων';

  @override
  String get libAutoScan => 'Πρόγραμμα αυτόματης σάρωσης (cron)';

  @override
  String get libCreate => 'Δημιουργία βιβλιοθήκης';

  @override
  String get libUpdate => 'Αποθήκευση αλλαγών';

  @override
  String get libNameRequired => 'Εισαγάγετε ένα όνομα βιβλιοθήκης';

  @override
  String get libCreated => 'Η βιβλιοθήκη δημιουργήθηκε';

  @override
  String get libCreateFailed => 'Δεν ήταν δυνατή η δημιουργία της βιβλιοθήκης';

  @override
  String get libUpdated => 'Η βιβλιοθήκη ενημερώθηκε';

  @override
  String get libUpdateFailed => 'Δεν ήταν δυνατή η ενημέρωση της βιβλιοθήκης';

  @override
  String get libRemoveFoldersTitle => 'Αφαίρεση φακέλων;';

  @override
  String get libRemoveFoldersBody =>
      'Η αφαίρεση ενός φακέλου διαγράφει τα αντικείμενά του από τη βιβλιοθήκη. Αυτό δεν μπορεί να αναιρεθεί.';

  @override
  String get readEbook => 'Ανάγνωση';

  @override
  String get ebookDownload => 'Λήψη';

  @override
  String get ebookDownloaded => 'Ληφθέν';

  @override
  String get ebookSavedOffline => 'Αποθηκεύτηκε για ανάγνωση εκτός σύνδεσης';

  @override
  String get ebookRemovedOffline =>
      'Αφαιρέθηκε από την αποθήκευση εκτός σύνδεσης';

  @override
  String get ebookOfflineFailed =>
      'Δεν ήταν δυνατή η λήψη του ηλεκτρονικού βιβλίου';

  @override
  String get ebookSaveToDevice => 'Αποθήκευση στη συσκευή';

  @override
  String get ebookSaveToDeviceTitle => 'Αποθήκευση στη συσκευή;';

  @override
  String get ebookSaveToDeviceBody =>
      'Αποθηκεύει ένα αντίγραφο του αρχείου του ηλεκτρονικού βιβλίου κάπου στη συσκευή σας (εσείς επιλέγετε πού). Δεν θα κάνει το βιβλίο διαθέσιμο εκτός σύνδεσης στον αναγνώστη - γι\' αυτό χρησιμοποιήστε τη Λήψη.';

  @override
  String get readerFormatUnsupported =>
      'Αυτή η μορφή ηλεκτρονικού βιβλίου δεν μπορεί ακόμη να ανοιχτεί στον αναγνώστη';

  @override
  String get readerCouldNotOpen =>
      'Δεν ήταν δυνατό το άνοιγμα αυτού του ηλεκτρονικού βιβλίου. Το αρχείο ίσως είναι κατεστραμμένο.';

  @override
  String get moreActions => 'Περισσότερα';

  @override
  String get readerChapters => 'Κεφάλαια';

  @override
  String get readerSettings => 'Ρυθμίσεις αναγνώστη';

  @override
  String get readerFontSize => 'Μέγεθος γραμματοσειράς';

  @override
  String get readerLineSpacing => 'Διάστιχο';

  @override
  String get readerTextAlignment => 'Στοίχιση';

  @override
  String get readerAlignJustified => 'Πλήρης';

  @override
  String get readerAlignLeft => 'Αριστερά';

  @override
  String get readerSideMargins => 'Πλαϊνά περιθώρια';

  @override
  String get readerTopBottom => 'Επάνω και κάτω';

  @override
  String get readerPageLayout => 'Διάταξη σελίδας';

  @override
  String get readerPinTopBar =>
      'Διατήρηση τίτλου και γραμμής προόδου στην οθόνη';

  @override
  String get readerPinTopBarHint =>
      'Τα καρφιτσώνει πάνω από τη σελίδα αντί να εμφανίζονται με πάτημα. Η σελίδα γίνεται λίγο πιο κοντή ώστε να μην καλύπτεται κείμενο.';

  @override
  String get readerTopBarProgress => 'Πρόοδος στην επάνω γραμμή';

  @override
  String get readerTopBarProgressBook => 'Βιβλίο';

  @override
  String get readerTopBarProgressChapter => 'Κεφάλαιο';

  @override
  String get readerTopBarProgressBoth => 'Και τα δύο';

  @override
  String get readerSectionText => 'Κείμενο';

  @override
  String get readerSectionPage => 'Σελίδα';

  @override
  String get readerSectionTopBar => 'Επάνω γραμμή και οθόνη';

  @override
  String get readerSectionControls => 'Χειριστήρια';

  @override
  String get readerSectionStats => 'Στατιστικά';

  @override
  String get readerParagraphSpacing => 'Απόσταση παραγράφων';

  @override
  String get readerParagraphSpacingBook => 'Του ίδιου του βιβλίου';

  @override
  String get readerTapZones => 'Ζώνες πατήματος';

  @override
  String get readerTapZonesHint =>
      'Σύρετε τις γραμμές για να αλλάξετε το μέγεθος των τετραγώνων. Πατήστε ένα τετράγωνο για να αλλάξετε τι κάνει ή ξεκινήστε από μια διάταξη.';

  @override
  String get readerTapPrev => 'Προηγούμενη σελίδα';

  @override
  String get readerTapNext => 'Επόμενη σελίδα';

  @override
  String get readerTapMenu => 'Εμφάνιση χειριστηρίων';

  @override
  String get readerTapNothing => 'Τίποτα';

  @override
  String get readerTapKeepMenu =>
      'Ένα τετράγωνο πρέπει να εμφανίζει τα χειριστήρια';

  @override
  String get readerHideControls => 'Απόκρυψη χειριστηρίων μετά από';

  @override
  String get readerHideControlsNever => 'Ποτέ';

  @override
  String get readerBarNotes => 'Σημειώσεις και επισημάνσεις';

  @override
  String readerHideControlsAfter(int seconds) {
    return '$secondsδ';
  }

  @override
  String get playerDownloadStreamingInstead =>
      'Αυτή η λήψη δεν μπόρεσε να αναπαραχθεί, οπότε γίνεται ροή από τον διακομιστή. Μια νέα λήψη ίσως το διορθώσει.';

  @override
  String get readerPageTurn => 'Αλλαγή σελίδας';

  @override
  String get readerPageTurnNone => 'Καμία';

  @override
  String get readerPageTurnSlide => 'Ολίσθηση';

  @override
  String get readerPageTurnCurl => 'Κύλιση φύλλου';

  @override
  String get readerPageTurnRipple => 'Κυματισμός';

  @override
  String get readerScrollMode => 'Λειτουργία κύλισης';

  @override
  String get readerScrollModeHint =>
      'Κύλιση προς τα κάτω στο βιβλίο αντί για αλλαγή σελίδων. Ισχύει για όλα τα βιβλία.';

  @override
  String get readerKeepAwake => 'Διατήρηση της οθόνης αναμμένης';

  @override
  String get readerKeepAwakeHint =>
      'Εμποδίζει το σβήσιμο της οθόνης όσο διαβάζετε με τον δικό σας ρυθμό. Η αυτόματη κύλιση και η ανάγνωση με τον ήχο την κρατούν πάντα αναμμένη.';

  @override
  String get readerLayoutAuto => 'Αυτόματα';

  @override
  String get readerLayoutSingle => 'Μονή';

  @override
  String get readerLayoutTwoPage => 'Διπλή σελίδα';

  @override
  String get readerTheme => 'Θέμα';

  @override
  String get readerFont => 'Γραμματοσειρά';

  @override
  String get readerVolumeNav => 'Τα πλήκτρα έντασης αλλάζουν σελίδα';

  @override
  String get readerVolumeNavOff => 'Ανενεργό';

  @override
  String get readerVolumeNavNormal => 'Κανονικό';

  @override
  String get readerVolumeNavMirrored => 'Αντίστροφο';

  @override
  String get readerAutoScroll => 'Αυτόματη κύλιση';

  @override
  String get readerAutoScrollSubtitle =>
      'Η επόμενη σελίδα καλύπτει αυτήν από πάνω προς τα κάτω - σύρετε τη μέση της οθόνης για να αλλάξετε ταχύτητα, πατήστε για διακοπή';

  @override
  String get readerAutoScrollStarted => 'Η αυτόματη κύλιση ξεκίνησε';

  @override
  String get readerAutoScrollPaused =>
      'Σε παύση - πατήστε παρατεταμένα για διακοπή';

  @override
  String get readerAutoScrollResumed => 'Η αυτόματη κύλιση συνεχίστηκε';

  @override
  String get readerAutoScrollStopped => 'Η αυτόματη κύλιση απενεργοποιήθηκε';

  @override
  String get readerAutoScrollEndOfBook =>
      'Τέλος βιβλίου - η αυτόματη κύλιση απενεργοποιήθηκε';

  @override
  String readerAutoScrollSpeed(int percent) {
    return 'Ταχύτητα $percent%';
  }

  @override
  String get readerMoreControls => 'Περισσότερα χειριστήρια';

  @override
  String get readerAutoScrollSleep => 'Χρονοδιακόπτης ύπνου αυτόματης κύλισης';

  @override
  String get readerAutoScrollSleepHint =>
      'Σταματά την κύλιση μετά από λίγο και αφήνει την οθόνη να σβήσει.';

  @override
  String readerAutoScrollSleepMinutes(int minutes) {
    return '$minutes λεπτά';
  }

  @override
  String readerAutoScrollSleepLeft(int minutes) {
    return 'απομένουν $minutes λεπτά';
  }

  @override
  String readerAutoScrollSleepIn(int minutes) {
    return 'Η αυτόματη κύλιση σταματά σε $minutes λεπτά';
  }

  @override
  String get readerAutoScrollSleepOff =>
      'Ο χρονοδιακόπτης ύπνου αυτόματης κύλισης είναι ανενεργός';

  @override
  String get readerAutoScrollSleepEnded =>
      'Χρονοδιακόπτης ύπνου - η αυτόματη κύλιση απενεργοποιήθηκε';

  @override
  String get readerDownloadStarted => 'Η λήψη ξεκίνησε';

  @override
  String get detailChaptersJumpTitle => 'Μετάβαση σε αυτό το κεφάλαιο;';

  @override
  String detailChaptersJumpContent(String title) {
    return 'Η αναπαραγωγή μετακινείται στο «$title».';
  }

  @override
  String get detailChaptersJump => 'Μετάβαση';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κεφάλαια ολοκληρώθηκαν',
      one: '1 κεφάλαιο ολοκληρώθηκε',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count άλλοι ακροατές',
      one: '1 άλλος ακροατής',
      zero: 'Κανένας άλλος ακροατής',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => 'Επόμενο';

  @override
  String get seriesJumpToUpNext => 'Μετάβαση στο επόμενο';

  @override
  String get seriesStatsFinished => 'Ολοκληρώθηκαν';

  @override
  String get seriesStatsListened => 'Ακούστηκαν';

  @override
  String get seriesStatsLeft => 'Απομένουν';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done από $total';
  }

  @override
  String get detailSessionsNone => 'Δεν υπάρχουν συνεδρίες ακρόασης ακόμη';

  @override
  String detailSessionsAll(int count) {
    return 'Όλες οι $count συνεδρίες';
  }

  @override
  String get readerVolumeNavWhilePlaying =>
      'Ακόμη και κατά την αναπαραγωγή ήχου';

  @override
  String get readerTranslateWith => 'Μετάφραση με';

  @override
  String get readerTranslateApp => 'Εφαρμογή σε αυτή τη συσκευή';

  @override
  String get readerTranslateApple => 'Ενσωματωμένο στο iOS';

  @override
  String get readerTranslateWeb => 'Ανοίγει στο πρόγραμμα περιήγησης';

  @override
  String get readerTranslateHint =>
      'Το επιλεγμένο κείμενο αποστέλλεται στον μεταφραστή που θα επιλέξετε.';

  @override
  String get readerMoreFonts => 'Λήψη περισσότερων γραμματοσειρών';

  @override
  String get readerFontRemove => 'Αφαίρεση λήψης';

  @override
  String readerFontDownloadFailed(String font) {
    return 'Δεν ήταν δυνατή η λήψη της γραμματοσειράς $font';
  }

  @override
  String get readerAnnotations => 'Σχολιασμοί';

  @override
  String readerHighlights(int count) {
    return 'Επισημάνσεις ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return 'Σελιδοδείκτες ($count)';
  }

  @override
  String get readerNoHighlights => 'Δεν υπάρχουν επισημάνσεις ακόμη';

  @override
  String get readerHistory => 'Ιστορικό';

  @override
  String get sessionReading => 'Ανάγνωση';

  @override
  String get readerHistoryEmpty =>
      'Οι σελίδες που αφήνετε εμφανίζονται εδώ, ώστε να μπορείτε πάντα να επιστρέφετε σε αυτές.';

  @override
  String get readerHistoryClosed => 'Έκλεισε το βιβλίο';

  @override
  String get readerHistoryBeforeJump => 'Πριν από μια μετάβαση';

  @override
  String get readerHistoryBeforeSync => 'Πριν από την αντιστοίχιση με τον ήχο';

  @override
  String get readerLogReading => 'Καταμέτρηση χρόνου ανάγνωσης στα στατιστικά';

  @override
  String get readerLogReadingHint =>
      'Καταγράφει τον χρόνο σας στον αναγνώστη ως συνεδρία ώστε να εμφανίζεται στα στατιστικά σας. Στο Audiobookshelf μετράει ως χρόνος ακρόασης.';

  @override
  String get readerNoBookmarks => 'Δεν υπάρχουν σελιδοδείκτες ακόμη';

  @override
  String get readerBookmarkDefault => 'Σελιδοδείκτης';

  @override
  String get readerNoteTitle => 'Σημείωση';

  @override
  String get readerNoteHint => 'Προσθέστε μια σημείωση...';

  @override
  String get backupAndSync => 'Αντίγραφο ασφαλείας και συγχρονισμός';

  @override
  String get backupAndSyncSubtitle =>
      'Αποθηκεύστε ένα αρχείο αντιγράφου ή διατηρήστε τις ρυθμίσεις συγχρονισμένες σε όλες τις συσκευές';

  @override
  String get syncSettingsExperimental => 'Πειραματικό';

  @override
  String get syncSettingsExperimentalBody =>
      'Ο συγχρονισμός είναι νέος και βρίσκεται ακόμη υπό ανάπτυξη. Αν δύο συσκευές αλλάξουν πράγματα ενώ δεν είναι συνδεδεμένες, η μία πλευρά μπορεί να χάσει τις αλλαγές της. Κρατήστε ένα αρχείο αντιγράφου ως ασφαλές αντίγραφο.';

  @override
  String get syncSettingsNeedServer => 'Χρειάζεστε διακομιστή;';

  @override
  String get syncSettingsNeedServerSub =>
      'Λειτουργεί οποιοσδήποτε διακομιστής WebDAV. Το Nextcloud είναι ένας δωρεάν διακομιστής για αυτοφιλοξενία.';

  @override
  String get syncSettingsConnection => 'Σύνδεση';

  @override
  String get syncSettingsConnectionNotSet => 'Δεν έχει ρυθμιστεί ακόμη';

  @override
  String get syncSettingsBackupFile => 'Αρχείο αντιγράφου ασφαλείας';

  @override
  String get syncSettingsBackupFilePlain =>
      'Αποθήκευση των πάντων σε ένα αρχείο που κρατάτε εσείς.';

  @override
  String get syncSettingsBackupFileWithSync =>
      'Αποθήκευση των πάντων σε ένα αρχείο που κρατάτε εσείς. Συμπεριλαμβάνει τα στοιχεία σύνδεσης και η επαναφορά του σε άλλο τηλέφωνο ενεργοποιεί και εκεί τον συγχρονισμό.';

  @override
  String get syncSettingsStatusOff => 'Χωρίς συγχρονισμό';

  @override
  String get syncSettingsStatusProblem =>
      'Δεν ήταν δυνατή η επικοινωνία με τον διακομιστή σας';

  @override
  String get syncSettings => 'Συγχρονισμός ρυθμίσεων μεταξύ συσκευών';

  @override
  String get syncSettingsExtras => 'Συγχρονισμός και';

  @override
  String get syncSettingsIncludeRmab => 'Ρυθμίσεις ReadMeABook';

  @override
  String get syncSettingsIncludeRmabSub =>
      'Τοποθετεί το διακριτικό API του ReadMeABook στο συγχρονισμένο αρχείο';

  @override
  String get syncSettingsSubtitle =>
      'Διατηρήστε τις ρυθμίσεις σας συγχρονισμένες μέσω του δικού σας διακομιστή WebDAV';

  @override
  String get syncSettingsEnable => 'Συγχρονισμός ρυθμίσεων';

  @override
  String get syncSettingsServerUrl => 'URL φακέλου WebDAV';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => 'Όνομα χρήστη';

  @override
  String get syncSettingsPassword => 'Κωδικός πρόσβασης';

  @override
  String get syncSettingsHeaders => 'Προσαρμοσμένες κεφαλίδες (προαιρετικό)';

  @override
  String get syncSettingsHeadersHint =>
      'Μία ανά γραμμή, όπως CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => 'Δοκιμή σύνδεσης';

  @override
  String get syncSettingsHoldToUpload =>
      'Πατήστε παρατεταμένα για άμεση μεταφόρτωση';

  @override
  String get syncSettingsUploadNow => 'Μεταφόρτωση τώρα';

  @override
  String get syncSettingsDownloadNow => 'Λήψη τώρα';

  @override
  String get syncSettingsOk => 'Συνδέθηκε';

  @override
  String get syncSettingsNoRemote =>
      'Συνδέθηκε - δεν έχει συγχρονιστεί τίποτα ακόμη';

  @override
  String get syncSettingsAuthFailed => 'Λάθος όνομα χρήστη ή κωδικός πρόσβασης';

  @override
  String get syncSettingsNetworkError =>
      'Δεν ήταν δυνατή η επικοινωνία με αυτή τη διεύθυνση';

  @override
  String get syncSettingsNotConfigured =>
      'Συμπληρώστε πρώτα τη διεύθυνση, το όνομα χρήστη και τον κωδικό πρόσβασης';

  @override
  String get syncSettingsTooLarge =>
      'Οι ρυθμίσεις σας είναι πολύ μεγάλες για συγχρονισμό';

  @override
  String get syncSettingsUploaded => 'Οι ρυθμίσεις μεταφορτώθηκαν';

  @override
  String get syncSettingsApplied =>
      'Οι ρυθμίσεις ενημερώθηκαν από την άλλη συσκευή σας';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ρυθμίσεις ενημερώθηκαν από την άλλη συσκευή σας',
      one: '1 ρύθμιση ενημερώθηκε από την άλλη συσκευή σας',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => 'Ήδη ενημερωμένο';

  @override
  String syncSettingsLastSynced(String when) {
    return 'Τελευταίος συγχρονισμός $when';
  }

  @override
  String get syncSettingsNever => 'Δεν έχει συγχρονιστεί ακόμη';

  @override
  String navHoldPickTitle(String tab) {
    return 'Το παρατεταμένο πάτημα στο $tab θα...';
  }

  @override
  String get navHoldPickBody =>
      'Επιλέξτε τι κάνει το παρατεταμένο πάτημα σε αυτή την καρτέλα. Μπορείτε να το αλλάξετε αργότερα στις Ρυθμίσεις.';

  @override
  String get navHoldSettingTitle =>
      'Συντομεύσεις παρατεταμένου πατήματος καρτελών';

  @override
  String get navHoldSettingSubtitle =>
      'Τι κάνει το παρατεταμένο πάτημα σε κάθε καρτέλα';

  @override
  String get navHoldAskNextTime => 'Ερώτηση την επόμενη φορά';

  @override
  String get navHoldNothing => 'Τίποτα';

  @override
  String get navHoldPlayPause => 'Αναπαραγωγή / παύση';

  @override
  String get navHoldOfflineMode => 'Λειτουργία εκτός σύνδεσης';

  @override
  String get navHoldOfflineOn => 'Λειτουργία εκτός σύνδεσης ενεργή';

  @override
  String get navHoldOfflineOff => 'Λειτουργία εκτός σύνδεσης ανενεργή';

  @override
  String get navHoldMenu => 'Να εμφανίζεται πάντα το μενού';

  @override
  String get navHoldStop => 'Διακοπή αναπαραγωγής';

  @override
  String get navHoldRmabSearch => 'Αναζήτηση ReadMeABook';

  @override
  String get navHoldRmabRequests => 'Τα αιτήματά μου για βιβλία';

  @override
  String get navHoldRmabWeb => 'Ιστότοπος ReadMeABook';

  @override
  String get navHoldAdd => 'Προσθήκη';

  @override
  String get navHoldMoveLeft => 'Μετακίνηση αριστερά';

  @override
  String get navHoldMoveRight => 'Μετακίνηση δεξιά';

  @override
  String get navHoldRemoveFromMenu => 'Αφαίρεση από το μενού';

  @override
  String get navHoldEditHint =>
      'Πατήστε παρατεταμένα ένα στοιχείο για να το μετακινήσετε ή να το αφαιρέσετε';

  @override
  String get navHoldResetMenu =>
      'Επαναφορά στοιχείων του μενού παρατεταμένου πατήματος';

  @override
  String get navHoldMenuReset => 'Τα στοιχεία του μενού επαναφέρθηκαν';

  @override
  String get bookStatsAction => 'Στατιστικά ακρόασης';

  @override
  String get bookStatsYou => 'Εσείς';

  @override
  String get bookStatsEveryone => 'Όλοι';

  @override
  String get bookStatsListened => 'Χρόνος ακρόασης';

  @override
  String get bookStatsSessions => 'Συνεδρίες';

  @override
  String get bookStatsFirst => 'Πρώτη ακρόαση';

  @override
  String get bookStatsLast => 'Τελευταία ακρόαση';

  @override
  String get bookStatsListeners => 'Άτομα που το ξεκίνησαν';

  @override
  String get bookStatsFinishedCount => 'Άτομα που το ολοκλήρωσαν';

  @override
  String get bookStatsTotalTime => 'Χρόνος ακρόασης από όλους';

  @override
  String get bookStatsNobody => 'Κανείς δεν το έχει ξεκινήσει ακόμη';

  @override
  String get bookStatsScanning =>
      'Σάρωση των συνεδριών, ίσως πάρει λίγο χρόνο...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return 'Σάρωση των συνεδριών, $done από $total άτομα...';
  }

  @override
  String bookStatsLastChecked(String when) {
    return 'Έλεγχος $when';
  }

  @override
  String get activityYourReading => 'Η ανάγνωσή σας';

  @override
  String get activityYourListening => 'Η ακρόασή σας';

  @override
  String activityLastRead(String when) {
    return 'Τελευταία ανάγνωση $when';
  }

  @override
  String activityLastListened(String when) {
    return 'Τελευταία ακρόαση $when';
  }

  @override
  String get activityNotStarted => 'Δεν έχει ξεκινήσει';

  @override
  String get activityNoReading => 'Δεν υπάρχουν συνεδρίες ανάγνωσης ακόμη';

  @override
  String get activityTime => 'Χρόνος';

  @override
  String get activityAverage => 'Μέσος';

  @override
  String get activityProgress => 'Πρόοδος';

  @override
  String activityReached(String percent) {
    return 'Έφτασε στο $percent';
  }

  @override
  String get readingLogTitle => 'Ημερολόγιο ανάγνωσης';

  @override
  String get readingLogTotalTime => 'Συνολικός χρόνος';

  @override
  String get readingLogAverageSession => 'Μέση συνεδρία';

  @override
  String get readingLogActiveDays => 'Ενεργές ημέρες';

  @override
  String readingLogActiveDaysOf(int active, int total) {
    return '$active από $total';
  }

  @override
  String get readingLogPace => 'Ρυθμός';

  @override
  String readingLogPacePerHour(String percent) {
    return '$percent%/ώ';
  }

  @override
  String get readingLogLastRead => 'Τελευταία ανάγνωση';

  @override
  String get readingLogStarted => 'Ξεκίνησε';

  @override
  String get readingLogFinished => 'Ολοκληρώθηκε';

  @override
  String get readingLogNotSet => 'Δεν ορίστηκε';

  @override
  String readingLogLeftMinutes(int m) {
    return 'Περίπου $mλ για την ολοκλήρωση';
  }

  @override
  String readingLogLeftHours(int h) {
    return 'Περίπου $hώ για την ολοκλήρωση';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return 'Περίπου $hώ $mλ για την ολοκλήρωση';
  }

  @override
  String get readingLogLeftMax => 'Πάνω από 99ώ για την ολοκλήρωση';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return 'Αύξηση $percent% σε σχέση με την προηγούμενη εβδομάδα';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return 'Μείωση $percent% σε σχέση με την προηγούμενη εβδομάδα';
  }

  @override
  String get readingLogNewThisWeek => 'Νέο αυτή την εβδομάδα';

  @override
  String get readingLogSameAsLastWeek => 'Ίδιο με την προηγούμενη εβδομάδα';

  @override
  String get readingLogQuietTwoWeeks => 'Τίποτα τις τελευταίες δύο εβδομάδες';

  @override
  String get readingLogWhereYouRead => 'Πού το διαβάσατε';

  @override
  String get readingLogSourceIos => 'Εφαρμογή iOS';

  @override
  String get readingLogSourceAndroid => 'Εφαρμογή Android';

  @override
  String get readingLogChartTitle => 'Πρόοδος με την πάροδο του χρόνου';

  @override
  String get readingLogChartPosition => 'Θέση που επιτεύχθηκε';

  @override
  String get readingLogChartMinutes => 'Λεπτά';

  @override
  String get readingLogRecords => 'Ρεκόρ';

  @override
  String get readingLogLongestSession => 'Μεγαλύτερη συνεδρία';

  @override
  String get readingLogBestDay => 'Καλύτερη ημέρα';

  @override
  String get readingLogLongestStreak => 'Μεγαλύτερη σειρά';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ημέρες',
      one: '1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => 'Επιστροφές πίσω';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φορές',
      one: '1 φορά',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => 'Πρώτο άνοιγμα';

  @override
  String get readingLogAttempts => 'Προσπάθειες';

  @override
  String readingLogAttempt(int index) {
    return 'Προσπάθεια $index';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return 'Η προσπάθεια $index ξεκίνησε';
  }

  @override
  String get readingLogOutcomeCompleted => 'Ολοκληρώθηκε';

  @override
  String get readingLogOutcomeSkimmed => 'Ξεφυλλίστηκε';

  @override
  String get readingLogOutcomeAbandoned => 'Εγκαταλείφθηκε';

  @override
  String get readingLogOutcomeInProgress => 'Σε εξέλιξη';

  @override
  String readingLogSpanRange(String from, String to) {
    return '$from έως $to';
  }

  @override
  String readingLogSpanSince(String from) {
    return 'Από $from';
  }

  @override
  String readingLogSpanEnded(String to) {
    return 'Τελείωσε $to';
  }

  @override
  String get readingLogSpanUnknown => 'Δεν καταγράφηκαν ημερομηνίες';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count συνεδρίες',
      one: '1 συνεδρία',
    );
    return '$_temp0';
  }

  @override
  String readingLogShowing(int shown, int total) {
    return '$shown από $total';
  }

  @override
  String readingLogGapDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ημέρες χωρίς ανάγνωση',
      one: '1 ημέρα χωρίς ανάγνωση',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => 'Δεν έχουν καταγραφεί συνεδρίες ακόμη';

  @override
  String get readingLogEmptyHint =>
      'Οι συνεδρίες εμφανίζονται εδώ καθώς διαβάζετε ή ακούτε, από οποιαδήποτε εφαρμογή ή συσκευή που συγχρονίζεται με το BookOrbit.';

  @override
  String get readingLogNoMatches => 'Δεν υπάρχουν συνεδρίες σε αυτό το εύρος';

  @override
  String get readingLogAllTime => 'Συνολικά';

  @override
  String get readingLogLast30 => 'Τελευταίες 30 ημέρες';

  @override
  String get readingLogLast90 => 'Τελευταίες 90 ημέρες';

  @override
  String get readingLogThisYear => 'Φέτος';

  @override
  String get readingLogAllFormats => 'Όλες οι μορφές';

  @override
  String get readingLogSortBy => 'Ταξινόμηση κατά';

  @override
  String get readingLogSortDay => 'Ημέρα';

  @override
  String get readingLogSortLength => 'Διάρκεια';

  @override
  String get readingLogSortChange => 'Μεταβολή';

  @override
  String get readingLogSortReached => 'Επίτευξη';

  @override
  String get readingLogNewestFirst => 'Πρώτα τα νεότερα';

  @override
  String get readingLogOldestFirst => 'Πρώτα τα παλαιότερα';

  @override
  String get readingLogMostFirst => 'Πρώτα τα περισσότερα';

  @override
  String get readingLogLeastFirst => 'Πρώτα τα λιγότερα';

  @override
  String get readingLogDeleteTitle => 'Διαγραφή αυτής της συνεδρίας;';

  @override
  String get readingLogDeleteBody =>
      'Αφαιρείται από το ημερολόγιο ανάγνωσης του βιβλίου και από τα στατιστικά σας στο BookOrbit.';

  @override
  String get readingLogDeleteFailed =>
      'Δεν ήταν δυνατή η διαγραφή της συνεδρίας';

  @override
  String get readingLogLoadFailed =>
      'Δεν ήταν δυνατή η φόρτωση του ημερολογίου ανάγνωσης';

  @override
  String get navHoldServerScan => 'Σάρωση διακομιστή';

  @override
  String get navHoldScanAll => 'Σάρωση όλων των βιβλιοθηκών';

  @override
  String navHoldScanLibrary(String name) {
    return 'Σάρωση $name';
  }

  @override
  String get navHoldScanStarted => 'Η σάρωση ξεκίνησε';

  @override
  String get navHoldScanFailed => 'Δεν ήταν δυνατή η έναρξη της σάρωσης';

  @override
  String get navHoldAdminLogs => 'Αρχεία καταγραφής διακομιστή';

  @override
  String navHoldAdminPage(String page) {
    return 'Διαχείριση: $page';
  }

  @override
  String get navHoldNothingPlaying =>
      'Δεν υπάρχει τίποτα για αναπαραγωγή ακόμη';

  @override
  String get navHoldReadBook => 'Ανάγνωση τρέχοντος βιβλίου';

  @override
  String get navHoldBookDetails => 'Λεπτομέρειες τρέχοντος βιβλίου';

  @override
  String get syncSourceTitle => 'Ποιο αντίγραφο να κρατήσει ο συγχρονισμός;';

  @override
  String get syncSourceBody =>
      'Αυτό το αντίγραφο ασφαλείας ενεργοποίησε τον συγχρονισμό ρυθμίσεων. Να χρησιμοποιηθεί ο τελευταίος συγχρονισμός του διακομιστή ή να γίνει αυτό το αντίγραφο η πηγή αναφοράς; Αν επιλέξετε το αντίγραφο, αντικαθίσταται το αντίγραφο στον διακομιστή για όλες τις συγχρονισμένες συσκευές σας.';

  @override
  String get syncSourceUseServer => 'Τελευταίος συγχρονισμός διακομιστή';

  @override
  String get syncSourceUseBackup => 'Αυτό το αντίγραφο';

  @override
  String get syncSettingsWhatTravels =>
      'Οι προτιμήσεις σας, οι ταχύτητες ανά βιβλίο, η διάταξη της αρχικής, η σειρά του Absorbing, οι σημειώσεις και οι επισημάνσεις ηλεκτρονικών βιβλίων συγχρονίζονται. Τα στοιχεία σύνδεσης, οι φάκελοι λήψεων, οι διακόπτες αυτόματης λήψης, η εμφάνιση του αναγνώστη και ό,τι δεν έχει σταλεί ακόμη στον διακομιστή σας μένουν σε αυτή τη συσκευή.';

  @override
  String get syncSettingsDownloadWarnTitle =>
      'Αντικατάσταση των ρυθμίσεων αυτής της συσκευής;';

  @override
  String get syncSettingsDownloadWarnBody =>
      'Το συγχρονισμένο αντίγραφο θα αντικαταστήσει τις ρυθμίσεις αυτής της συσκευής.';

  @override
  String get syncSettingsDownloadWarnConfirm => 'Αντικατάσταση';

  @override
  String get readerCopied => 'Αντιγράφηκε στο πρόχειρο';

  @override
  String get dictionaryNotFound => 'Δεν βρέθηκε ορισμός για αυτή τη λέξη.';

  @override
  String get dictionaryError =>
      'Δεν ήταν δυνατή η επικοινωνία με το λεξικό. Ελέγξτε τη σύνδεσή σας.';

  @override
  String get dictionaryRetry => 'Επανάληψη';

  @override
  String get dictionarySearchWeb => 'Αναζήτηση στο web';

  @override
  String get readerTooltipCopy => 'Αντιγραφή';

  @override
  String get readerTooltipSearch => 'Αναζήτηση';

  @override
  String get readerTooltipDefine => 'Ορισμός';

  @override
  String get readerTooltipTranslate => 'Μετάφραση';

  @override
  String get readerSearchHint => 'Αναζήτηση σε αυτό το βιβλίο…';

  @override
  String readerSearchMatches(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αποτελέσματα για «$query»',
      one: '$count αποτέλεσμα για «$query»',
    );
    return '$_temp0';
  }

  @override
  String get readerSearchEmpty =>
      'Πληκτρολογήστε μια λέξη ή φράση και πατήστε αναζήτηση.';

  @override
  String readerSearchNoResults(String query) {
    return 'Κανένα αποτέλεσμα για «$query».';
  }

  @override
  String get transcriptionTitle => 'Απομαγνητοφώνηση';

  @override
  String get transcriptionAdvancedSubtitle =>
      'Για απομαγνητοφώνηση σελιδοδεικτών και εύρεση της θέσης σας ανάμεσα στο ηχητικό και το ηλεκτρονικό βιβλίο';

  @override
  String get transcriptionEnable => 'Ενεργοποίηση απομαγνητοφώνησης';

  @override
  String get transcriptionEnableSubtitle =>
      'Προσθέτει Απομαγνητοφώνηση στους σελιδοδείκτες, Εύρεση θέσης στο ηλεκτρονικό βιβλίο στο πρόγραμμα αναπαραγωγής και Εύρεση στο ηχητικό βιβλίο στον αναγνώστη';

  @override
  String get transcriptionDisclaimer =>
      'Εκτελείται εξ ολοκλήρου στη συσκευή σας, τίποτα δεν αποστέλλεται πουθενά. Καταναλώνει επιπλέον μπαταρία και επεξεργαστική ισχύ όσο λειτουργεί και μπορούν να απομαγνητοφωνηθούν μόνο βιβλία που έχουν ληφθεί.';

  @override
  String get transcriptionNeedModelHint =>
      'Κάντε λήψη ενός μοντέλου παρακάτω για να ξεκινήσετε την απομαγνητοφώνηση.';

  @override
  String get transcriptionModelSection => 'Μοντέλα';

  @override
  String get transcriptionModelTiny => 'Tiny';

  @override
  String get transcriptionModelTinyDesc =>
      'Το ταχύτερο, λιγότερο ακριβές. Περίπου 31 MB.';

  @override
  String get transcriptionModelBase => 'Base';

  @override
  String get transcriptionModelBaseDesc =>
      'Μια καλή ενδιάμεση λύση. Περίπου 57 MB.';

  @override
  String get transcriptionModelSmall => 'Small';

  @override
  String get transcriptionModelSmallDesc =>
      'Πιο αργό αλλά το πιο ακριβές - ιδανικό σε κορυφαίο κινητό. Περίπου 182 MB.';

  @override
  String get transcriptionAutoHint =>
      'Αν έχετε κάνει λήψη περισσότερων από ένα, κάθε εργασία επιλέγει ανάμεσά τους. Τα βιβλία με ηλεκτρονικό βιβλίο παίρνουν το ταχύτερο, αφού οι ακριβείς λέξεις προέρχονται ούτως ή άλλως από αυτό. Τα βιβλία χωρίς αυτό παίρνουν το πιο ακριβές - εκτός από την ανάγνωση με τον ήχο, που μένει κάτω από το Small ώστε να προλαβαίνει την αφήγηση.';

  @override
  String get transcriptionDownload => 'Λήψη';

  @override
  String get transcriptionDownloadFailed =>
      'Η λήψη απέτυχε. Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';

  @override
  String get transcribe => 'Απομαγνητοφώνηση';

  @override
  String get transcribing => 'Απομαγνητοφώνηση...';

  @override
  String get transcriptionResultTitle => 'Απομαγνητοφώνηση';

  @override
  String get transcriptionSaveToNote => 'Αποθήκευση στη σημείωση';

  @override
  String get transcriptionSavedToNote =>
      'Αποθηκεύτηκε στη σημείωση του σελιδοδείκτη';

  @override
  String get transcriptionDisabledHint =>
      'Ενεργοποιήστε την απομαγνητοφώνηση σελιδοδεικτών στις Ρυθμίσεις, στα Σύνθετα.';

  @override
  String get transcriptionNoModelDownloaded =>
      'Κάντε πρώτα λήψη ενός μοντέλου απομαγνητοφώνησης στις Ρυθμίσεις.';

  @override
  String get transcriptionNotDownloadedBook =>
      'Κάντε λήψη αυτού του βιβλίου ή συνδεθείτε στον διακομιστή σας για να το απομαγνητοφωνήσετε.';

  @override
  String get transcriptionNoMetadataMsg =>
      'Δεν είναι δυνατός ο εντοπισμός αυτού του σημείου στη λήψη. Δοκιμάστε να κάνετε ξανά λήψη του βιβλίου.';

  @override
  String get transcriptionBusyMsg =>
      'Γίνεται ήδη απομαγνητοφώνηση. Περιμένετε λίγο.';

  @override
  String get transcriptionEmptyMsg => 'Δεν βρέθηκε ομιλία σε αυτό το σημείο.';

  @override
  String get transcriptionFailedMsg =>
      'Δεν ήταν δυνατή η απομαγνητοφώνηση αυτού του σημείου. Δοκιμάστε ξανά.';

  @override
  String get transcriptionPlaySnippet => 'Ακρόαση';

  @override
  String get transcriptionPauseSnippet => 'Παύση';

  @override
  String get transcriptionIntroBody =>
      'Ακούει την επιλεγμένη διάρκεια ήχου, ξεκινώντας λίγο πριν από τον σελιδοδείκτη, και τη μετατρέπει σε κείμενο στη συσκευή σας. Τα μεγαλύτερα αποσπάσματα παίρνουν περισσότερο χρόνο και η απομαγνητοφώνηση δεν είναι 100% ακριβής. Το κείμενο αποθηκεύεται στη σημείωση του σελιδοδείκτη όταν τελειώσει, έτοιμο για διόρθωση ή κοινοποίηση.';

  @override
  String get transcriptionUseEbookText =>
      'Χρήση του ακριβούς κειμένου του ηλεκτρονικού βιβλίου όταν υπάρχει αντιστοίχιση';

  @override
  String get lyricsMode => 'Ζωντανή απομαγνητοφώνηση';

  @override
  String get lyricsListeningAhead => 'Ακρόαση εκ των προτέρων...';

  @override
  String get lyricsDisplaySection => 'Ζωντανή απομαγνητοφώνηση';

  @override
  String get lyricsFontSize => 'Μέγεθος γραμμής';

  @override
  String get lyricsMaxLines => 'Γραμμές που εμφανίζονται';

  @override
  String get lyricsFullCover => 'Χρήση ολόκληρου του εξώφυλλου';

  @override
  String get lyricsFullCoverHint =>
      'Εμφανίζει την απομαγνητοφώνηση στη θέση του εξώφυλλου όσο εκτελείται, χωρώντας όσες γραμμές επιτρέπει ο χώρος.';

  @override
  String get lyricsBatteryInfo =>
      'Η ζωντανή απομαγνητοφώνηση και η ανάγνωση με τον ήχο καταναλώνουν επιπλέον μπαταρία και επεξεργαστική ισχύ όσο λειτουργούν. Σε κινητά με πιο αργούς επεξεργαστές, οι γραμμές μπορεί να αργούν να εμφανιστούν.';

  @override
  String get lyricsClearCache =>
      'Εκκαθάριση προσωρινής μνήμης απομαγνητοφώνησης';

  @override
  String lyricsClearCacheHint(String size) {
    return '$size αποθηκευμένων γραμμών απομαγνητοφώνησης. Τα βιβλία και τα επεισόδια που θα εκκαθαριστούν απομαγνητοφωνούνται ξανά καθώς ακούτε.';
  }

  @override
  String get lyricsClearCacheConfirm =>
      'Να διαγραφούν οι αποθηκευμένες απομαγνητοφωνήσεις για κάθε βιβλίο και επεισόδιο; Δημιουργούνται ξανά αυτόματα καθώς ακούτε.';

  @override
  String get lyricsCacheCleared =>
      'Η προσωρινή μνήμη απομαγνητοφώνησης εκκαθαρίστηκε';

  @override
  String get lyricsIntroBody =>
      'Ακούει λίγο πριν από την αφήγηση και εμφανίζει κάθε γραμμή καθώς εκφωνείται, με απομαγνητοφώνηση στο κινητό σας - τίποτα δεν φεύγει από τη συσκευή. Αφού την ενεργοποιήσετε, περιμένετε λίγα δευτερόλεπτα πριν πατήσετε αναπαραγωγή ώστε να προπορευτεί. Η απομαγνητοφώνηση εμφανίζεται όταν είναι έτοιμη η προπορεία της και η έναρξη σε παύση δίνει την πιο ομαλή λειτουργία. Καταναλώνει επιπλέον μπαταρία και επεξεργαστική ισχύ όσο εκτελείται.';

  @override
  String lyricsBuildingLead(String percent) {
    return 'Προπορεία σε σχέση με την αφήγηση... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return 'Δεν είναι δυνατή η απομαγνητοφώνηση με την ταχύτητα που ακούτε στα $speed';
  }

  @override
  String get lyricsTurnOn => 'Ενεργοποίηση';

  @override
  String get readAlong => 'Ανάγνωση με τον ήχο';

  @override
  String get readAlongNeedsPlaying => 'Αναπαραγάγετε πρώτα το ηχητικό βιβλίο';

  @override
  String get narrationListen => 'Ακρόαση';

  @override
  String get narrationPlayFromHere => 'Αναπαραγωγή από εδώ';

  @override
  String get narrationPreparing => 'Προετοιμασία της αφήγησης';

  @override
  String get narrationNone =>
      'Αυτό το ηλεκτρονικό βιβλίο δεν έχει αφήγηση για αναπαραγωγή';

  @override
  String get narrationDownloadTitle => 'Λήψη για ακρόαση';

  @override
  String get narrationDownloadBody =>
      'Αυτό το βιβλίο είναι EPUB3 που διαβάζεται μόνο του φωναχτά. Το Audiobookshelf δεν μπορεί να μεταδώσει την αφήγησή του, οπότε ο ήχος πρέπει να ληφθεί πριν αναπαραχθεί.';

  @override
  String get narrationDownloadStarted =>
      'Λήψη της αφήγησης. Πατήστε Absorb όταν τελειώσει.';

  @override
  String get narrationTextBody =>
      'Το EPUB αυτού του βιβλίου έχει δικές του λέξεις για κάθε στιγμή του ήχου, οπότε το κείμενο αντιγράφεται απευθείας από το βιβλίο. Επιλέξτε πόσο να προστεθεί στη σημείωση του σελιδοδείκτη.';

  @override
  String get narrationTextLoading => 'Λήψη των λέξεων από το βιβλίο';

  @override
  String get downloadToAbsorb => 'Λήψη στο Absorb';

  @override
  String get narrationUpNextTitle => 'Λήψη του επόμενου';

  @override
  String narrationUpNextBody(String title) {
    return 'Το $title είναι το επόμενο στην ουρά σας. Είναι EPUB3 που διαβάζεται μόνο του φωναχτά, οπότε πρέπει να ληφθεί πριν αναπαραχθεί.';
  }

  @override
  String narrationQueueStopped(String title) {
    return 'Διακοπή πριν από το $title. Κάντε λήψη για να συνεχίσετε.';
  }

  @override
  String get transcriptionNeedsDownload =>
      'Χρειάζεται τον ήχο στο κινητό σας. Να γίνει λήψη τώρα;';

  @override
  String get transcriptionDownloadStarted =>
      'Λήψη σε εξέλιξη. Ενεργοποιήστε το ξανά όταν τελειώσει';

  @override
  String get readAlongFollow => 'Η ανάγνωση με τον ήχο ακολουθεί';

  @override
  String get syncReadingListening => 'Συγχρονισμός ανάγνωσης και ακρόασης';

  @override
  String get syncReadingListeningHint =>
      'Για βιβλία με ηχητικό και ηλεκτρονικό βιβλίο. Όταν σταματάτε την ακρόαση, το ηλεκτρονικό βιβλίο μετακινείται στο σημείο που σταματήσατε. Όταν φεύγετε από τον αναγνώστη, το ηχητικό βιβλίο μετακινείται στη σελίδα σας. Μετακινείται μόνο προς τα εμπρός.';

  @override
  String get syncEbookMoved =>
      'Το ηλεκτρονικό βιβλίο μετακινήθηκε στο σημείο που σταματήσατε την ακρόαση';

  @override
  String get syncAudioMoved =>
      'Το ηχητικό βιβλίο μετακινήθηκε στο σημείο που σταματήσατε την ανάγνωση';

  @override
  String get syncAudioOffer =>
      'Πατήστε για μετάβαση στο σημείο που σταματήσατε την ανάγνωση';

  @override
  String get syncFindingAudio => 'Εύρεση της σελίδας σας στο ηχητικό βιβλίο';

  @override
  String get syncFindingEbook => 'Εύρεση της θέσης σας στο ηλεκτρονικό βιβλίο';

  @override
  String get syncFailed => 'Δεν ήταν δυνατός ο συγχρονισμός της θέσης σας';

  @override
  String get syncAlreadyTogether => 'Ήδη συγχρονισμένα';

  @override
  String get syncPosition => 'Συγχρονισμός θέσης';

  @override
  String get readAlongFollowHint =>
      'Ο χρονισμός των λέξεων υπολογίζεται ανάμεσα στις χρονοσημάνσεις της απομαγνητοφώνησης, οπότε μπορεί να παρεκκλίνει ελαφρώς μέσα σε μια πρόταση.';

  @override
  String get readAlongFollowWord => 'Λέξη';

  @override
  String get readAlongFollowSentence => 'Πρόταση';

  @override
  String get readAlongColor => 'Χρώμα ανάγνωσης με τον ήχο';

  @override
  String get readAlongLost => 'Δεν βρέθηκε η αφήγηση στη σελίδα';

  @override
  String get readAlongBackToNarration => 'Επιστροφή στην αφήγηση';

  @override
  String get findInEbook => 'Εύρεση στο ηλεκτρονικό βιβλίο';

  @override
  String get findInEbookSearching =>
      'Εύρεση αυτού του σημείου στο ηλεκτρονικό βιβλίο...';

  @override
  String get findInEbookNotFound =>
      'Δεν βρέθηκε αυτό το σημείο στο ηλεκτρονικό βιβλίο.';

  @override
  String get findInEbookNeedsEpub =>
      'Η εύρεση στο ηλεκτρονικό βιβλίο απαιτεί ηλεκτρονικό βιβλίο EPUB.';

  @override
  String get findInEbookNoEbook => 'Αυτό το βιβλίο δεν έχει ηλεκτρονική μορφή.';

  @override
  String get findInAudiobook => 'Εύρεση στο ηχητικό βιβλίο';

  @override
  String get findInAudiobookSearching =>
      'Εύρεση αυτού του σημείου στο ηχητικό βιβλίο...';

  @override
  String get findInAudiobookStillSearching =>
      'Συνεχίζεται η αναζήτηση αυτού του σημείου στον ήχο...';

  @override
  String get findInAudiobookSearchingLong =>
      'Μεγάλο κεφάλαιο, η αναζήτηση συνεχίζεται. Μπορεί να πάρει ένα ή δύο λεπτά...';

  @override
  String get findInAudiobookNotFound =>
      'Δεν βρέθηκε αυτό το σημείο στο ηχητικό βιβλίο.';

  @override
  String get transcriptionWhisperInfo =>
      'Η απομαγνητοφώνηση βασίζεται στο Whisper, ένα ανοιχτό μοντέλο αναγνώρισης ομιλίας που ακούει την αφήγηση και γράφει τις λέξεις - όλα σε αυτή τη συσκευή.';

  @override
  String get transcriptionWhisperLearnMore =>
      'Μάθετε περισσότερα για το Whisper';

  @override
  String get findInAudiobookIntroBody =>
      'Ακούει το ηχητικό βιβλίο κοντά στο σημείο που διαβάζετε και το αντιστοιχίζει με αυτό το απόσπασμα, όλα στη συσκευή σας. Μπορεί να πάρει έως ένα λεπτό. Αν το σημείο δεν μπορεί να αντιστοιχιστεί με βεβαιότητα, δεν μετακινείται τίποτα.';

  @override
  String get findInAudiobookAfterLabel => 'Όταν βρεθεί το σημείο';

  @override
  String get findInAudiobookStay => 'Συνέχεια ανάγνωσης';

  @override
  String get findInAudiobookGoPlayer => 'Άνοιγμα του προγράμματος αναπαραγωγής';

  @override
  String get findInAudiobookPlaying =>
      'Αναπαραγωγή αυτού του αποσπάσματος στο ηχητικό βιβλίο';

  @override
  String get catchUpAudioAhead =>
      'Το ηχητικό βιβλίο είναι πιο μπροστά. Πατήστε για μετάβαση εκεί.';

  @override
  String get catchUpPageAhead =>
      'Αυτή η σελίδα είναι πιο μπροστά από το ηχητικό βιβλίο. Πατήστε για να μετακινηθεί εδώ το ηχητικό βιβλίο.';

  @override
  String get readerShortcutButton => 'Κουμπί συντόμευσης';

  @override
  String get keepScreenOn => 'Διατήρηση οθόνης αναμμένης';

  @override
  String get keepScreenOnActive => 'Η οθόνη μένει αναμμένη';

  @override
  String get keepScreenOnUntilClosed =>
      'Η οθόνη μένει αναμμένη μέχρι να κλείσετε την εφαρμογή';

  @override
  String get keepScreenOnOff => 'Η οθόνη μπορεί να σβήνει ξανά';

  @override
  String get keepScreenOnOffUntilRestart =>
      'Ανενεργό μέχρι την επανεκκίνηση της εφαρμογής. Ο διακόπτης στις Ρυθμίσεις παραμένει ενεργός';

  @override
  String get keepScreenOnPlayer =>
      'Διατήρηση της οθόνης αναμμένης στο πρόγραμμα αναπαραγωγής';

  @override
  String get keepScreenOnPlayerSubtitle =>
      'Η οθόνη μένει αναμμένη όσο είναι ανοιχτό το πρόγραμμα αναπαραγωγής';

  @override
  String get keepScreenOnCarMode =>
      'Διατήρηση της οθόνης αναμμένης στη λειτουργία αυτοκινήτου';

  @override
  String get keepScreenOnCarModeSubtitle =>
      'Η οθόνη μένει αναμμένη όσο είναι ανοιχτή η λειτουργία αυτοκινήτου';

  @override
  String get loginServerType => 'Τύπος διακομιστή';

  @override
  String get authBookOrbitDefaultPassword =>
      'Αυτός ο λογαριασμός έχει ακόμη τον προεπιλεγμένο κωδικό πρόσβασης. Αλλάξτε τον στο BookOrbit και συνδεθείτε ξανά.';

  @override
  String get authBookOrbitPasswordOff =>
      'Η σύνδεση με κωδικό πρόσβασης είναι απενεργοποιημένη σε αυτόν τον διακομιστή. Συνδεθείτε με magic link ή single sign-on.';

  @override
  String get authServerIsBookOrbit =>
      'Αυτός είναι διακομιστής BookOrbit. Επιλέξτε BookOrbit πάνω από τη διεύθυνση του διακομιστή.';

  @override
  String get authServerIsAudiobookshelf =>
      'Αυτός είναι διακομιστής Audiobookshelf. Επιλέξτε Audiobookshelf πάνω από τη διεύθυνση του διακομιστή.';

  @override
  String get castNotAvailableBookOrbit =>
      'Η μετάδοση δεν είναι διαθέσιμη με διακομιστές BookOrbit';

  @override
  String get loginMagicLink => 'Magic link';

  @override
  String get loginMagicLinkDescription =>
      'Συνδεθείτε με ένα magic link του BookOrbit ή επικολλήστε έναν σύνδεσμο κωδικού για να ορίσετε τον κωδικό πρόσβασής σας.';

  @override
  String get collectionPublicTitle => 'Δημόσια';

  @override
  String get collectionPublicSubtitle =>
      'Όλοι σε αυτόν τον διακομιστή μπορούν να δουν αυτή τη συλλογή';

  @override
  String loginSignInWithProvider(String provider) {
    return 'Σύνδεση με $provider';
  }

  @override
  String get loginSignInWithSso => 'Σύνδεση με SSO';

  @override
  String get loginChooseSsoProvider => 'Επιλέξτε τρόπο σύνδεσης';

  @override
  String get loginRedirectUriBookOrbit =>
      'URI ανακατεύθυνσης: bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => 'Κατάσταση ανάγνωσης';

  @override
  String get readStatusHint =>
      'Το BookOrbit κρατά την κατάσταση που επιλέγετε εδώ μέχρι να την αλλάξετε.';

  @override
  String get readStatusUnread => 'Μη αναγνωσμένο';

  @override
  String get readStatusWantToRead => 'Θέλω να το διαβάσω';

  @override
  String get readStatusReading => 'Διαβάζεται';

  @override
  String get readStatusOnHold => 'Σε αναμονή';

  @override
  String get readStatusRereading => 'Επανανάγνωση';

  @override
  String get readStatusRead => 'Αναγνωσμένο';

  @override
  String get readStatusSkimmed => 'Ξεφυλλισμένο';

  @override
  String get readStatusAbandoned => 'Εγκαταλειμμένο';

  @override
  String get personalNoteTitle => 'Η σημείωσή σας';

  @override
  String get personalNoteAdd => 'Προσθήκη ιδιωτικής σημείωσης';

  @override
  String get personalNoteHint => 'Μόνο εσείς βλέπετε αυτή τη σημείωση.';

  @override
  String get moreLikeThis => 'Περισσότερα σαν αυτό';

  @override
  String get coverSlotAudiobook => 'Εξώφυλλο ηχητικού βιβλίου';

  @override
  String get coverSlotBook => 'Εξώφυλλο βιβλίου';

  @override
  String get cardButtonFill => 'Φόντο κουμπιών';

  @override
  String get cardButtonFillSubtitle =>
      'Πώς γεμίζουν τα κουμπιά στην κάρτα του προγράμματος αναπαραγωγής';

  @override
  String get cardButtonFillClear => 'Διαφανές';

  @override
  String get cardButtonFillSubtle => 'Διακριτικό';

  @override
  String get cardButtonFillSolid => 'Συμπαγές';

  @override
  String get loginBookOrbitPreview =>
      'Η υποστήριξη BookOrbit είναι νέα. Η αναπαραγωγή, οι λήψεις και η περιήγηση λειτουργούν, αλλά ορισμένες οθόνες μπορεί να μοιάζουν ή να συμπεριφέρονται ακόμη σαν το Audiobookshelf. Παρακολουθήστε την πρόοδο στο GitHub και πείτε μας αν κάτι φαίνεται λάθος.';

  @override
  String get signedOutTapToSignIn =>
      'Αποσυνδεθήκατε. Πατήστε για να συνδεθείτε ξανά.';

  @override
  String get authSignedOutKeepListening =>
      'Έχετε αποσυνδεθεί. Οι λήψεις εξακολουθούν να αναπαράγονται. Πατήστε το κόκκινο σύννεφο για να συνδεθείτε ξανά.';

  @override
  String signedOutSyncNote(String username, String server) {
    return 'Ό,τι ακούτε ενώ είστε αποσυνδεδεμένοι μένει σε αυτό το κινητό και συγχρονίζεται όταν συνδεθείτε ξανά ως $username στο $server. Λειτουργεί οποιοσδήποτε τρόπος σύνδεσης σε αυτόν τον λογαριασμό.';
  }

  @override
  String get comicReadingDirection => 'Κατεύθυνση ανάγνωσης';

  @override
  String comicPageNumber(int page) {
    return 'Σελίδα $page';
  }

  @override
  String get comicBookmarkRemoveFailed =>
      'Δεν ήταν δυνατή η αφαίρεση του σελιδοδείκτη από τον διακομιστή. Δοκιμάστε ξανά όταν είστε συνδεδεμένοι.';

  @override
  String get comicLeftToRight => 'Από αριστερά προς δεξιά';

  @override
  String get comicRightToLeft => 'Από δεξιά προς αριστερά (manga)';

  @override
  String get comicNeedsConnection =>
      'Αυτό το κόμικ ανοίγει σελίδα σελίδα από τον διακομιστή σας, οπότε χρειάζεται σύνδεση.';

  @override
  String get comicNoPages => 'Δεν βρέθηκαν σελίδες σε αυτό το κόμικ.';

  @override
  String get boAdminTitle => 'Διαχείριση διακομιστή';

  @override
  String get boAdminSubtitle =>
      'Χρήστες και βιβλιοθήκες σε αυτόν τον διακομιστή BookOrbit';

  @override
  String get boAdminUsers => 'Χρήστες';

  @override
  String get boAdminLibraries => 'Βιβλιοθήκες';

  @override
  String boAdminUserCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count άτομα',
      one: '1 άτομο',
    );
    return '$_temp0';
  }

  @override
  String boAdminLibraryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλιοθήκες',
      one: '1 βιβλιοθήκη',
    );
    return '$_temp0';
  }

  @override
  String get boAdminSaved => 'Αποθηκεύτηκε';

  @override
  String get boAdminFailed => 'Δεν λειτούργησε. Δοκιμάστε ξανά.';

  @override
  String get boAdminOffline =>
      'Δεν ήταν δυνατή η επικοινωνία με τον διακομιστή.';

  @override
  String get boUsersSearch => 'Αναζήτηση χρηστών';

  @override
  String get boUsersNone => 'Δεν υπάρχουν χρήστες εδώ';

  @override
  String get boUsersFilterAll => 'Όλοι';

  @override
  String get boUsersFilterAdmins => 'Διαχειριστές';

  @override
  String get boUsersFilterActive => 'Ενεργοί';

  @override
  String get boUsersFilterInactive => 'Ανενεργοί';

  @override
  String get boUsersFilterAttention => 'Χρειάζονται προσοχή';

  @override
  String get boUserBadgeAdmin => 'Διαχειριστής';

  @override
  String get boUserBadgeInactive => 'Ανενεργός';

  @override
  String get boUserBadgeLocked => 'Κλειδωμένος';

  @override
  String get boUserBadgeNoPassword => 'Χωρίς κωδικό ακόμη';

  @override
  String boUserLastActive(String date) {
    return 'Τελευταία δραστηριότητα $date';
  }

  @override
  String get boUserNeverSignedIn => 'Δεν έχει συνδεθεί ποτέ';

  @override
  String get boUserNew => 'Νέος χρήστης';

  @override
  String get boUserCreate => 'Δημιουργία';

  @override
  String get boUserUsername => 'Όνομα χρήστη';

  @override
  String get boUserUsernameHint =>
      'Τουλάχιστον 3 χαρακτήρες. Δεν μπορεί να αλλάξει αργότερα.';

  @override
  String get boUserName => 'Όνομα';

  @override
  String get boUserEmail => 'Email';

  @override
  String get boUserEmailInvalid => 'Εισαγάγετε μια έγκυρη διεύθυνση email';

  @override
  String get boUserActive => 'Ενεργός';

  @override
  String get boUserActiveSubtitle =>
      'Οι ανενεργοί χρήστες δεν μπορούν να συνδεθούν';

  @override
  String get boUserAdmin => 'Διαχειριστής';

  @override
  String get boUserAdminSubtitle => 'Πλήρης πρόσβαση σε όλα στον διακομιστή';

  @override
  String get boUserAdminHasAll =>
      'Οι διαχειριστές έχουν όλα τα δικαιώματα και βλέπουν κάθε βιβλιοθήκη.';

  @override
  String get boUserPermissions => 'Δικαιώματα';

  @override
  String get boUserPresetNone => 'Κανένα';

  @override
  String get boUserPresetStandard => 'Στάνταρ';

  @override
  String get boUserPresetEverything => 'Όλα';

  @override
  String get boUserLibraries => 'Βιβλιοθήκες';

  @override
  String get boUserLibrariesHint =>
      'Οι βιβλιοθήκες που μπορεί να δει αυτό το άτομο.';

  @override
  String get boUserPasswordLink => 'Αποστολή συνδέσμου κωδικού';

  @override
  String get boUserPasswordLinkSubtitle =>
      'Ένας σύνδεσμος για τον ορισμό νέου κωδικού, ισχύει για 15 λεπτά';

  @override
  String get boUserExternal =>
      'Συνδέεται μέσω single sign-on, οπότε ο κωδικός πρόσβασης διαχειρίζεται εκεί.';

  @override
  String get boUserUnlock => 'Ξεκλείδωμα λογαριασμού';

  @override
  String get boUserUnlocked => 'Ο λογαριασμός ξεκλειδώθηκε';

  @override
  String get boUserDelete => 'Διαγραφή χρήστη';

  @override
  String boUserDeleteTitle(String name) {
    return 'Διαγραφή του $name;';
  }

  @override
  String get boUserDeleteBody =>
      'Ο λογαριασμός του και ό,τι έχει σε αυτόν τον διακομιστή αφαιρούνται. Αυτό δεν μπορεί να αναιρεθεί.';

  @override
  String get boUserDeleted => 'Ο χρήστης διαγράφηκε';

  @override
  String get boUserLinkTitle => 'Σύνδεσμος κωδικού';

  @override
  String boUserLinkBody(String name) {
    return 'Μοιραστείτε αυτόν τον σύνδεσμο με τον/την $name. Του επιτρέπει να ορίσει κωδικό πρόσβασης και ισχύει για 15 λεπτά.';
  }

  @override
  String get boPasswordRules =>
      'Τουλάχιστον 8 χαρακτήρες, με ένα κεφαλαίο γράμμα, ένα πεζό γράμμα και έναν αριθμό.';

  @override
  String get boSetPasswordTitle => 'Ορίστε τον κωδικό πρόσβασής σας';

  @override
  String get boSetPasswordSubmit => 'Ορισμός κωδικού και σύνδεση';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return 'Επιλέξτε έναν κωδικό πρόσβασης για τον/την $username στο $server.';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return 'Επιλέξτε έναν κωδικό πρόσβασης για τον λογαριασμό σας στο $server.';
  }

  @override
  String get boSetPasswordStartingBody =>
      'Αυτός ο λογαριασμός έχει ακόμη τον κωδικό με τον οποίο δημιουργήθηκε. Επιλέξτε νέο για να ολοκληρώσετε τη σύνδεση.';

  @override
  String get boSetPasswordTrust =>
      'Συνεχίστε μόνο αν εμπιστεύεστε αυτόν που έστειλε τον σύνδεσμο.';

  @override
  String get boPasswordLinkExpired =>
      'Αυτός ο σύνδεσμος έχει λήξει ή έχει ήδη χρησιμοποιηθεί. Ζητήστε νέο από τον διαχειριστή του διακομιστή σας.';

  @override
  String boPasswordSetSignInFailed(String error) {
    return 'Ο κωδικός πρόσβασής σας ορίστηκε, αλλά η σύνδεση απέτυχε: $error';
  }

  @override
  String get boChangePasswordSubtitle =>
      'Ενημέρωση του κωδικού πρόσβασης BookOrbit';

  @override
  String get boPasswordChangeEffect =>
      'Η αλλαγή του κωδικού πρόσβασης αποσυνδέει τις άλλες συνεδρίες σας στο BookOrbit. Αυτή η συσκευή παραμένει συνδεδεμένη.';

  @override
  String get boPasswordChanged =>
      'Ο κωδικός πρόσβασης άλλαξε. Οι άλλες συνδεδεμένες συσκευές αποσυνδέθηκαν.';

  @override
  String boPasswordShareDescription(String username) {
    return 'Στείλτε αυτόν τον σύνδεσμο ή ζητήστε από τον/την $username να σαρώσει τον κωδικό QR για να επιλέξει κωδικό πρόσβασης και να συνδεθεί στο Absorb. Ισχύει για 15 λεπτά.';
  }

  @override
  String boPasswordShareWarning(String username) {
    return 'Όποιος έχει αυτόν τον σύνδεσμο μπορεί να επιλέξει τον κωδικό πρόσβασης του/της $username μέχρι να χρησιμοποιηθεί ή να λήξει.';
  }

  @override
  String get setupLinkCopyWebLink => 'Αντιγραφή συνδέσμου web';

  @override
  String get boUserLinkCopy => 'Αντιγραφή συνδέσμου';

  @override
  String get boUserLinkCopied => 'Ο σύνδεσμος αντιγράφηκε';

  @override
  String get boUserLinkShare => 'Κοινοποίηση';

  @override
  String get boUserNoLink =>
      'Ο χρήστης προστέθηκε, αλλά ο διακομιστής δεν έστειλε σύνδεσμο κωδικού. Στείλτε έναν από τη σελίδα του.';

  @override
  String get boPermGroupLibrary => 'Βιβλιοθήκη και βιβλία';

  @override
  String get boPermGroupRequests => 'Αιτήματα βιβλίων';

  @override
  String get boPermGroupDevices => 'Συσκευές';

  @override
  String get boPermGroupIntegrations => 'Ενσωματώσεις ανάγνωσης';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => 'Email και ειδοποιήσεις';

  @override
  String get boPermGroupAdmin => 'Διαχείριση';

  @override
  String get boPermLibraryDownload => 'Λήψη βιβλίων';

  @override
  String get boPermLibraryUpload => 'Μεταφόρτωση βιβλίων';

  @override
  String get boPermLibraryEditMetadata => 'Επεξεργασία μεταδεδομένων';

  @override
  String get boPermLibraryDeleteBooks => 'Διαγραφή βιβλίων';

  @override
  String get boPermBookRequestAccess => 'Αίτηση βιβλίων';

  @override
  String get boPermBookRequestAutoApprove => 'Αυτόματη έγκριση αιτημάτων';

  @override
  String get boPermBookRequestSelfFulfill =>
      'Άμεση λήψη των βιβλίων που ζητήθηκαν';

  @override
  String get boPermManageBookRequests => 'Διαχείριση αιτημάτων βιβλίων';

  @override
  String get boPermKoboSync => 'Συγχρονισμός Kobo';

  @override
  String get boPermKoreaderSync => 'Συγχρονισμός KOReader';

  @override
  String get boPermOpdsAccess => 'Πρόσβαση OPDS';

  @override
  String get boPermHardcoverSync => 'Συγχρονισμός Hardcover';

  @override
  String get boPermReadwiseSync => 'Συγχρονισμός Readwise';

  @override
  String get boPermStorygraphSync => 'Συγχρονισμός StoryGraph';

  @override
  String get boPermBookDockAccess => 'Χρήση του Book Dock';

  @override
  String get boPermManageBookDock => 'Διαχείριση του Book Dock';

  @override
  String get boPermEmailSend => 'Αποστολή βιβλίων με email';

  @override
  String get boPermNotificationAccess => 'Ειδοποιήσεις';

  @override
  String get boPermManageEmail => 'Διαχείριση email';

  @override
  String get boPermManageLibraries => 'Διαχείριση βιβλιοθηκών';

  @override
  String get boPermManageMetadataConfig => 'Ρυθμίσεις μεταδεδομένων';

  @override
  String get boPermManageIcons => 'Διαχείριση εικονιδίων';

  @override
  String get boPermManageUsers => 'Διαχείριση χρηστών';

  @override
  String get boPermViewUserActivity => 'Προβολή δραστηριότητας χρηστών';

  @override
  String get boPermViewAuditLog => 'Προβολή αρχείου ελέγχου';

  @override
  String get boPermManageAppSettings => 'Ρυθμίσεις εφαρμογής';

  @override
  String get boLibsNone => 'Δεν υπάρχουν βιβλιοθήκες ακόμη';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία',
      one: '1 βιβλίο',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => 'Σάρωση τώρα';

  @override
  String get boLibScanStarted => 'Η σάρωση ξεκίνησε';

  @override
  String get boLibScanning => 'Σάρωση';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return 'Σάρωση $date: $added προστέθηκαν, $updated ενημερώθηκαν, $missing λείπουν';
  }

  @override
  String get boLibScanFailed => 'Η τελευταία σάρωση απέτυχε';

  @override
  String get boLibNeverScanned => 'Δεν έχει σαρωθεί ακόμη';

  @override
  String get boLibNew => 'Νέα βιβλιοθήκη';

  @override
  String get boLibName => 'Όνομα';

  @override
  String get boLibNeedName => 'Δώστε ένα όνομα στη βιβλιοθήκη';

  @override
  String get boLibIcon => 'Εικονίδιο';

  @override
  String get boLibFolders => 'Φάκελοι';

  @override
  String get boLibFoldersHint =>
      'Φάκελοι στον διακομιστή όπου βρίσκονται τα βιβλία αυτής της βιβλιοθήκης.';

  @override
  String get boLibNeedFolder => 'Προσθέστε τουλάχιστον έναν φάκελο';

  @override
  String get boLibAddFolder => 'Προσθήκη φακέλου';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία',
      one: '1 αρχείο',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return 'Ήδη στη βιβλιοθήκη $library';
  }

  @override
  String get boLibFolderUnreadable =>
      'Ο διακομιστής δεν μπορεί να διαβάσει αυτόν τον φάκελο';

  @override
  String get boLibFolderRescan =>
      'Η αλλαγή των φακέλων σαρώνει ξανά τη βιβλιοθήκη.';

  @override
  String get boLibOrganization => 'Τα βιβλία αποθηκεύονται ως';

  @override
  String get boLibPerFolder => 'Ένα βιβλίο ανά φάκελο';

  @override
  String get boLibPerFile => 'Ένα βιβλίο ανά αρχείο';

  @override
  String get boLibOrganizationFixed =>
      'Αυτό δεν μπορεί να αλλάξει μετά τη δημιουργία της βιβλιοθήκης.';

  @override
  String get boLibWatch => 'Παρακολούθηση αλλαγών';

  @override
  String get boLibWatchSubtitle =>
      'Εντοπισμός νέων και αλλαγμένων αρχείων μόλις εμφανιστούν';

  @override
  String get boLibSchedule => 'Προγραμματισμένη σάρωση';

  @override
  String get boLibScheduleOff => 'Ανενεργή';

  @override
  String get boLibScheduleDaily => 'Καθημερινά';

  @override
  String get boLibScheduleWeekly => 'Εβδομαδιαία';

  @override
  String boLibScheduleCustom(String cron) {
    return 'Προσαρμοσμένη ($cron)';
  }

  @override
  String get boLibScheduleHint => 'Εκτελείται στις 3 π.μ. ώρα διακομιστή.';

  @override
  String get boLibCovers => 'Σχήμα εξωφύλλου';

  @override
  String get boLibCoverBook => 'Βιβλίο (2:3)';

  @override
  String get boLibCoverSquare => 'Τετράγωνο (1:1)';

  @override
  String get boLibAccess => 'Ποιος μπορεί να τη δει';

  @override
  String get boLibAccessHint =>
      'Οι διαχειριστές βλέπουν κάθε βιβλιοθήκη. Οι υπόλοιποι χρειάζονται πρόσβαση εδώ.';

  @override
  String get boLibAccessNone => 'Μόνο διαχειριστές προς το παρόν';

  @override
  String get boLibAccessAdd => 'Προσθήκη ατόμου';

  @override
  String get boLibAccessEveryoneHas => 'Όλοι έχουν ήδη πρόσβαση';

  @override
  String get boLibLevelViewer => 'Θεατής';

  @override
  String get boLibLevelEditor => 'Επεξεργαστής';

  @override
  String get boLibLevelOwner => 'Ιδιοκτήτης';

  @override
  String get boLibAccessRemove => 'Αφαίρεση πρόσβασης';

  @override
  String get boLibDelete => 'Διαγραφή βιβλιοθήκης';

  @override
  String boLibDeleteTitle(String name) {
    return 'Διαγραφή του $name;';
  }

  @override
  String get boLibDeleteBody =>
      'Η βιβλιοθήκη αφαιρείται από το BookOrbit, μαζί με την πρόοδο και τις επισημάνσεις των βιβλίων της. Τα αρχεία στον διακομιστή παραμένουν στη θέση τους.';

  @override
  String get boLibDeleted => 'Η βιβλιοθήκη διαγράφηκε';

  @override
  String get boFolderPickTitle => 'Επιλογή φακέλου';

  @override
  String get boFolderUseThis => 'Χρήση αυτού του φακέλου';

  @override
  String get boFolderEmpty => 'Δεν υπάρχουν φάκελοι';

  @override
  String get statsTotalTime => 'ΣΥΝΟΛΙΚΟΣ ΧΡΟΝΟΣ';

  @override
  String get statsTotalReadingTime => 'ΣΥΝΟΛΙΚΟΣ ΧΡΟΝΟΣ ΑΝΑΓΝΩΣΗΣ';

  @override
  String statsDaysOfTime(String days) {
    return 'Αυτό είναι $days ημέρες';
  }

  @override
  String statsHoursOfTime(String hours) {
    return 'Αυτό είναι $hours ώρες';
  }

  @override
  String get statsMediaAll => 'Όλα';

  @override
  String get statsMediaListening => 'Ακρόαση';

  @override
  String get statsMediaReading => 'Ανάγνωση';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'Το BookOrbit μετρά τις ημέρες σας με ζώνη ώρας $server, αλλά αυτό το τηλέφωνο έχει ρυθμιστεί σε $phone. Ο χρόνος αργά μέσα στην ημέρα μπορεί να καταχωριστεί σε λάθος ημέρα.';
  }

  @override
  String statsZoneUse(String zone) {
    return 'Χρήση $zone';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'Το BookOrbit χρησιμοποιεί πλέον $zone. Οι παλαιότερες ημέρες μπορεί να χρειαστούν λίγα λεπτά για να ενημερωθούν.';
  }

  @override
  String get statsZoneFailed =>
      'Δεν ήταν δυνατή η αλλαγή της ζώνης ώρας στο BookOrbit';

  @override
  String get statsTimeOfDay => 'Ώρα της ημέρας';

  @override
  String statsBusiestAround(String time) {
    return 'Πιο πολυάσχολη περίπου στις $time';
  }

  @override
  String get statsFinishedByMonth => 'Βιβλία που ολοκληρώθηκαν ανά μήνα';

  @override
  String statsFinishedLast12(int count) {
    return '$count τους τελευταίους 12 μήνες';
  }

  @override
  String get statsWhereTitle => 'Πού ακούτε και διαβάζετε';

  @override
  String get statsLast12Months => 'Τελευταίοι 12 μήνες';

  @override
  String get statsHabits => 'Συνήθειες';

  @override
  String get statsTypicalSession => 'Τυπική συνεδρία';

  @override
  String get statsProgressPerSession => 'Πρόοδος ανά συνεδρία';

  @override
  String get statsTimeToFinish => 'Χρόνος ολοκλήρωσης';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ημέρες',
      one: '1 ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => 'Βιβλία που ξεκίνησαν';

  @override
  String get statsBooksInProgress => 'Σε εξέλιξη';

  @override
  String get statsAverageProgress => 'Μέση πρόοδος';

  @override
  String get statsTopBooks => 'Κορυφαία βιβλία';

  @override
  String get statsYearRead => 'Διαβάστηκαν';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count μη αναγνωσμένες',
      one: '1 μη αναγνωσμένη',
      zero: 'Τίποτα νέο',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => 'Σήμανση όλων ως αναγνωσμένων';

  @override
  String get boNotificationsClearAll => 'Εκκαθάριση όλων';

  @override
  String get boNotificationsClearTitle => 'Εκκαθάριση όλων των ειδοποιήσεων;';

  @override
  String get boNotificationsClearBody =>
      'Αυτό αφαιρεί κάθε ειδοποίηση από τον λογαριασμό σας στο BookOrbit.';

  @override
  String get boNotificationsEmpty => 'Δεν υπάρχουν ειδοποιήσεις ακόμη';

  @override
  String get boNotificationsLoadFailed =>
      'Δεν ήταν δυνατή η φόρτωση των ειδοποιήσεων';

  @override
  String get boNotificationsUpdateFailed =>
      'Δεν ήταν δυνατή η ενημέρωση των ειδοποιήσεων στο BookOrbit';

  @override
  String boNotificationsOccurrences(int count) {
    return 'Συνέβη $count φορές';
  }

  @override
  String get boNotificationsSettings => 'Ρυθμίσεις ειδοποιήσεων';

  @override
  String get boNotificationsSettingsIntro =>
      'Επιλέξτε ποιες ειδοποιήσεις διατηρεί το BookOrbit για εσάς.';

  @override
  String get boNotificationsProblemsHint =>
      'Το «Προβλήματα» σας ειδοποιεί μόνο όταν κάτι αποτυγχάνει ή χρειάζεται προσοχή.';

  @override
  String get boNotificationLevelOff => 'Ανενεργές';

  @override
  String get boNotificationLevelProblems => 'Προβλήματα';

  @override
  String get boNotificationLevelAll => 'Όλες';

  @override
  String get boNotificationsSaved => 'Οι ρυθμίσεις ειδοποιήσεων αποθηκεύτηκαν';

  @override
  String get boNotificationsSaveFailed =>
      'Δεν ήταν δυνατή η αποθήκευση των ρυθμίσεων ειδοποιήσεων';

  @override
  String get boNotificationGroupLibrary => 'Βιβλιοθήκη';

  @override
  String get boNotificationGroupFiles => 'Αρχεία';

  @override
  String get boNotificationGroupIntegrations => 'Ενσωματώσεις';

  @override
  String get boNotificationGroupPersonal => 'Προσωπικά';

  @override
  String get boNotifyScanning => 'Σάρωση βιβλιοθήκης';

  @override
  String get boNotifyScanningDesc =>
      'Όταν μια σάρωση βιβλιοθήκης ολοκληρώνεται, αποτυγχάνει ή εντοπίζει βιβλία που λείπουν.';

  @override
  String get boNotifyMetadata => 'Λήψη μεταδεδομένων';

  @override
  String get boNotifyMetadataDesc =>
      'Όταν οι αναζητήσεις μεταδεδομένων για τα βιβλία σας ολοκληρώνονται ή αποτυγχάνουν.';

  @override
  String get boNotifyAuthorEnrichment => 'Στοιχεία συγγραφέα';

  @override
  String get boNotifyAuthorEnrichmentDesc =>
      'Όταν ολοκληρώνεται η λήψη βιογραφικών και φωτογραφιών συγγραφέων.';

  @override
  String get boNotifyFileWriteBack => 'Αποθήκευση σε αρχεία';

  @override
  String get boNotifyFileWriteBackDesc =>
      'Όταν οι επεξεργασμένες λεπτομέρειες αποθηκεύονται στα αρχεία των βιβλίων στον δίσκο.';

  @override
  String get boNotifyFileRename => 'Μετονομασία αρχείων';

  @override
  String get boNotifyFileRenameDesc =>
      'Όταν ένα αρχείο βιβλίου μετονομάζεται ώστε να ταιριάζει με το πρότυπο ονομασίας σας.';

  @override
  String get boNotifyBulkRename => 'Μαζική μετονομασία';

  @override
  String get boNotifyBulkRenameDesc =>
      'Όταν η μετονομασία πολλών βιβλίων ή η μετακίνηση βιβλίων μεταξύ βιβλιοθηκών ολοκληρώνεται ή αποτυγχάνει.';

  @override
  String get boNotifyMigration => 'Εισαγωγές';

  @override
  String get boNotifyMigrationDesc =>
      'Όταν μια εισαγωγή από άλλη εφαρμογή βιβλιοθήκης ολοκληρώνεται ή αποτυγχάνει.';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc =>
      'Όταν το Book Dock ολοκληρώνει την προσθήκη βιβλίων ή αντιμετωπίζει προβλήματα.';

  @override
  String get boNotifyBookRequests => 'Αιτήματα βιβλίων';

  @override
  String get boNotifyBookRequestsDesc =>
      'Όταν ένα αίτημα βιβλίου υποβάλλεται ή εγκρίνεται/απορρίπτεται, ή το βιβλίο γίνεται διαθέσιμο.';

  @override
  String get boNotifyEmail => 'Παράδοση μέσω email';

  @override
  String get boNotifyEmailDesc =>
      'Όταν η αποστολή ενός βιβλίου μέσω email πετυχαίνει ή αποτυγχάνει.';

  @override
  String get boNotifyAchievements => 'Επιτεύγματα';

  @override
  String get boNotifyAchievementsDesc => 'Όταν ξεκλειδώνετε ένα νέο επίτευγμα.';

  @override
  String get achievementsTitle => 'Επιτεύγματα';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return '$earned από $total κερδισμένα';
  }

  @override
  String get achievementsFilterAll => 'Όλα';

  @override
  String get achievementsFilterEarned => 'Κερδισμένα';

  @override
  String get achievementsFilterInProgress => 'Σε εξέλιξη';

  @override
  String get achievementsFilterLocked => 'Κλειδωμένα';

  @override
  String get achievementsCategoryReading => 'Ανάγνωση';

  @override
  String get achievementsCategoryLibrary => 'Βιβλιοθήκη';

  @override
  String get achievementsCategoryExploration => 'Εξερεύνηση';

  @override
  String get achievementsCategoryDedication => 'Αφοσίωση';

  @override
  String get achievementsCategoryDevices => 'Συσκευές';

  @override
  String get achievementsRarityCommon => 'Κοινό';

  @override
  String get achievementsRarityRare => 'Σπάνιο';

  @override
  String get achievementsRarityEpic => 'Επικό';

  @override
  String get achievementsRarityLegendary => 'Θρυλικό';

  @override
  String get achievementsLoadFailed =>
      'Δεν ήταν δυνατή η φόρτωση των επιτευγμάτων';

  @override
  String get achievementsNoneMatch =>
      'Κανένα επίτευγμα δεν ταιριάζει με αυτό το φίλτρο';

  @override
  String get achievementsSecretName => 'Μυστικό επίτευγμα';

  @override
  String get achievementsSecretHint =>
      'Συνεχίστε να διαβάζετε για να το αποκαλύψετε.';

  @override
  String achievementsEarnedOn(String date) {
    return 'Κερδήθηκε $date';
  }

  @override
  String achievementsWhileReading(String title) {
    return 'Κατά την ανάγνωση του $title';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return 'Επίπεδο $earned από $total';
  }

  @override
  String get achievementsTiers => 'Επίπεδα';

  @override
  String get achievementsAllTiers => 'Όλα τα επίπεδα κερδήθηκαν';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold βιβλία';
  }

  @override
  String achievementsProgressPages(String current, String threshold) {
    return '$current / $threshold σελίδες';
  }

  @override
  String achievementsProgressHours(String current, String threshold) {
    return '$current / $threshold ώρες';
  }

  @override
  String achievementsProgressAnnotations(String current, String threshold) {
    return '$current / $threshold επισημάνσεις και σημειώσεις';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold βαθμολογίες';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $threshold είδη';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold γλώσσες';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold ημέρες';
  }

  @override
  String get achievementsHowToGetIt => 'Πώς να το αποκτήσετε';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Διαβάσατε $count ώρες τις τελευταίες $days ημέρες.',
      one: 'Διαβάσατε 1 ώρα τις τελευταίες $days ημέρες.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Περίπου $count ημέρες με αυτόν τον ρυθμό.',
      one: 'Περίπου 1 ημέρα με αυτόν τον ρυθμό.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Περίπου $count εβδομάδες με αυτόν τον ρυθμό.',
      one: 'Περίπου 1 εβδομάδα με αυτόν τον ρυθμό.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Περίπου $count μήνες με αυτόν τον ρυθμό.',
      one: 'Περίπου 1 μήνας με αυτόν τον ρυθμό.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count βιβλία από τη δεκαετία του $decade περιμένουν στα ράφια σας.',
      one: '1 βιβλίο από τη δεκαετία του $decade περιμένει στα ράφια σας.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία από τον αιώνα $century περιμένουν στα ράφια σας.',
      one: '1 βιβλίο από τον αιώνα $century περιμένει στα ράφια σας.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return 'Το $title έχει διαβαστεί κατά $percent και ξεκίνησε στις $date.';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return 'Το $title ξεκίνησε στις $date.';
  }

  @override
  String get achievementsHintUntitledBook => 'Ένα βιβλίο σε εξέλιξη';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία σε εξέλιξη έχουν ξεπεράσει το $percent.',
      one: '1 βιβλίο σε εξέλιξη έχει ξεπεράσει το $percent.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία που ολοκληρώσατε δεν έχουν ακόμη βαθμολογία.',
      one: '1 βιβλίο που ολοκληρώσατε δεν έχει ακόμη βαθμολογία.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία κάτω από $pages σελίδες περιμένουν στα ράφια σας.',
      one: '1 βιβλίο κάτω από $pages σελίδες περιμένει στα ράφια σας.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count είναι ήδη σε εξέλιξη.',
      one: '1 είναι ήδη σε εξέλιξη.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count βιβλία $pages σελίδων ή περισσότερων περιμένουν στα ράφια σας.',
      one: '1 βιβλίο $pages σελίδων ή περισσότερων περιμένει στα ράφια σας.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count βιβλία που εκδόθηκαν πριν από το $year περιμένουν στα ράφια σας.',
      one: '1 βιβλίο που εκδόθηκε πριν από το $year περιμένει στα ράφια σας.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author: $finished ολοκληρωμένα, $count ακόμη στα ράφια σας.';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βιβλία στα $language περιμένουν στα ράφια σας.',
      one: '1 βιβλίο στα $language περιμένει στα ράφια σας.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Έχετε διαβάσει σε $count μήνες του $year μέχρι στιγμής.',
      one: 'Έχετε διαβάσει σε 1 μήνα του $year μέχρι στιγμής.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Απομένουν: $months.',
      one: 'Απομένει: $months.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return 'Κανένα βιβλίο στα ράφια σας δεν έχει ακόμη $pages σελίδες ή περισσότερες.';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return 'Τίποτα στα ράφια σας δεν εκδόθηκε πριν από το $year.';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Τα ράφια σας καλύπτουν μόνο $count δεκαετίες μέχρι στιγμής.',
      one: 'Τα ράφια σας καλύπτουν μόνο 1 δεκαετία μέχρι στιγμής.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Τα ράφια σας καλύπτουν μόνο $count αιώνες μέχρι στιγμής.',
      one: 'Τα ράφια σας καλύπτουν μόνο 1 αιώνα μέχρι στιγμής.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return 'Δεν διαβάσατε τον μήνα $month, οπότε το $year είναι πλέον εκτός εμβέλειας. Η μέτρηση ξεκινά ξανά τον Ιανουάριο.';
  }

  @override
  String get achievementsSwitch => 'Επιτεύγματα';

  @override
  String get achievementsSwitchSubtitle =>
      'Παρακολούθηση επιτευγμάτων στο BookOrbit. Αν το απενεργοποιήσετε, κρύβονται εδώ και στον ιστό.';

  @override
  String get achievementsTurnedOn => 'Τα επιτεύγματα ενεργοποιήθηκαν';

  @override
  String get achievementsTurnedOff => 'Τα επιτεύγματα απενεργοποιήθηκαν';

  @override
  String get achievementsSwitchFailed =>
      'Δεν ήταν δυνατή η αλλαγή των επιτευγμάτων στο BookOrbit';

  @override
  String get boNotifyReadAlong => 'Αναγνώσεις με τον ήχο';

  @override
  String get boNotifyReadAlongDesc =>
      'Όταν μια ανάγνωση με τον ήχο που ξεκινήσατε είναι έτοιμη, χρειάζεται έλεγχο ή αποτυγχάνει.';

  @override
  String get readAlongCreate => 'Δημιουργία ανάγνωσης με τον ήχο';

  @override
  String get readAlongLoadFailed =>
      'Δεν ήταν δυνατός ο έλεγχος για το αν μπορεί να δημιουργηθεί ανάγνωση με τον ήχο για αυτό το βιβλίο.';

  @override
  String get readAlongCheckAgain => 'Έλεγχος ξανά';

  @override
  String get readAlongWhyWorkerOffline =>
      'Ο εργάτης ανάγνωσης με τον ήχο του BookOrbit είναι εκτός σύνδεσης αυτή τη στιγμή.';

  @override
  String get readAlongWhyWorkerOutdated =>
      'Ο εργάτης ανάγνωσης με τον ήχο του BookOrbit χρειάζεται ενημέρωση για να λειτουργεί με αυτόν τον διακομιστή.';

  @override
  String get readAlongWhyFilesMissing =>
      'Επαναφέρετε τα αρχεία που λείπουν από αυτό το βιβλίο για να δημιουργήσετε ανάγνωση με τον ήχο.';

  @override
  String get readAlongWhyNoEpub =>
      'Προσθέστε ένα απλό EPUB σε αυτό το βιβλίο για να δημιουργήσετε ανάγνωση με τον ήχο.';

  @override
  String get readAlongWhyNoEpubHasOne =>
      'Αυτό το βιβλίο έχει ήδη ανάγνωση με τον ήχο και δεν έχει απλό EPUB για να δημιουργηθεί άλλη.';

  @override
  String get readAlongWhyTooManyTracks =>
      'Αυτό το ηχητικό βιβλίο έχει περισσότερα αρχεία από όσα επιτρέπει η δημιουργία ανάγνωσης με τον ήχο.';

  @override
  String get readAlongWhyEpubNotAllowed =>
      'Αυτή η βιβλιοθήκη δεν δέχεται αρχεία EPUB, οπότε δεν μπορεί να προστεθεί ανάγνωση με τον ήχο.';

  @override
  String get readAlongWhyNotMounted =>
      'Ο εργάτης ανάγνωσης με τον ήχο του BookOrbit δεν έχει πρόσβαση στον φάκελο αυτής της βιβλιοθήκης.';

  @override
  String get readAlongWhyRunning =>
      'Δημιουργείται ήδη ανάγνωση με τον ήχο για αυτό το βιβλίο.';

  @override
  String get readAlongWhyUnknown =>
      'Δεν είναι δυνατή η δημιουργία ανάγνωσης με τον ήχο για αυτό το βιβλίο αυτή τη στιγμή.';

  @override
  String get readAlongSheetTitle => 'Δημιουργία ανάγνωσης με τον ήχο';

  @override
  String get readAlongSheetIntro =>
      'Το BookOrbit αντιστοιχίζει την αφήγηση με το κείμενο του ηλεκτρονικού βιβλίου και προσθέτει ένα EPUB που επισημαίνει το κείμενο ακολουθώντας τον ήχο.';

  @override
  String get readAlongEbook => 'Ηλεκτρονικό βιβλίο';

  @override
  String get readAlongEbookHint =>
      'Επιλέξτε το απλό EPUB που ταιριάζει με την αφήγηση.';

  @override
  String get readAlongAudio => 'Ηχητικό βιβλίο';

  @override
  String readAlongTracks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κομμάτια',
      one: '1 κομμάτι',
    );
    return '$_temp0';
  }

  @override
  String readAlongExistingTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Αυτό το βιβλίο έχει ήδη $count αναγνώσεις με τον ήχο',
      one: 'Αυτό το βιβλίο έχει ήδη ανάγνωση με τον ήχο',
    );
    return '$_temp0';
  }

  @override
  String readAlongReplace(String name) {
    return 'Αντικατάσταση του $name';
  }

  @override
  String readAlongKeepBoth(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Διατήρηση όλων',
      one: 'Διατήρηση και των δύο',
    );
    return '$_temp0';
  }

  @override
  String get readAlongKeepHint =>
      'Η νέα ανάγνωση με τον ήχο προστίθεται ως ξεχωριστό αρχείο.';

  @override
  String get readAlongReplaceHint =>
      'Το παλιό αρχείο αντικαθίσταται μόνο όταν το νέο περάσει τους ελέγχους του, και οι θέσεις ανάγνωσης μεταφέρονται.';

  @override
  String get readAlongReplaceNotAllowed =>
      'Η αντικατάσταση ανάγνωσης με τον ήχο απαιτεί άδεια διαγραφής βιβλίων, οπότε η νέα προστίθεται ως ξεχωριστό αρχείο.';

  @override
  String get readAlongMadeByBookOrbit => 'Δημιουργήθηκε από το BookOrbit';

  @override
  String get readAlongImported => 'Εισαγμένο';

  @override
  String get readAlongLanguage => 'Γλώσσα αφήγησης';

  @override
  String get readAlongPickLanguage => 'Επιλέξτε γλώσσα';

  @override
  String readAlongLanguageUnsupported(String language) {
    return 'Το μοντέλο ομιλίας δεν γνωρίζει τη γλώσσα αυτού του βιβλίου ($language).';
  }

  @override
  String get readAlongLanguageFromBook =>
      'Από τις λεπτομέρειες αυτού του βιβλίου.';

  @override
  String get readAlongLanguageIsDefault => 'Η προεπιλεγμένη γλώσσα σας.';

  @override
  String get readAlongLanguageSaved =>
      'Αποθηκεύτηκε ως η προεπιλεγμένη γλώσσα σας.';

  @override
  String get readAlongSetDefault => 'Ορισμός ως προεπιλογής';

  @override
  String get readAlongDefaultFailed =>
      'Δεν ήταν δυνατή η αποθήκευση της προεπιλεγμένης γλώσσας.';

  @override
  String get readAlongHighlighting => 'Επισήμανση';

  @override
  String get readAlongSentence => 'Πρόταση';

  @override
  String get readAlongSentenceHint =>
      'Επισημαίνει μία πρόταση τη φορά. Συνιστάται.';

  @override
  String get readAlongWord => 'Λέξη';

  @override
  String get readAlongWordHint =>
      'Επισημαίνει κάθε λέξη. Διαρκεί περισσότερο και δημιουργεί μεγαλύτερο αρχείο. Ακόμη πειραματικό.';

  @override
  String readAlongEstimatedSize(String size) {
    return 'Εκτιμώμενο μέγεθος: $size';
  }

  @override
  String get readAlongBackgroundNote =>
      'Εκτελείται στον διακομιστή, οπότε μπορείτε να το κλείσετε. Τα μεγάλα ηχητικά βιβλία μπορεί να χρειαστούν ώρες, και την πρώτη φορά για μια γλώσσα γίνεται λήψη του μοντέλου ομιλίας της.';

  @override
  String readAlongLowDisk(String needed, String free) {
    return 'Χαμηλός ελεύθερος χώρος: χρειάζονται περίπου $needed χώρου εργασίας στον εργάτη, που έχει $free ελεύθερα.';
  }

  @override
  String get readAlongStart => 'Έναρξη';

  @override
  String get readAlongStartFailed =>
      'Δεν ήταν δυνατή η έναρξη της ανάγνωσης με τον ήχο. Δοκιμάστε ξανά.';

  @override
  String get readAlongStartInvalid =>
      'Ορισμένα από τα επιλεγμένα αρχεία δεν βρίσκονται πια σε αυτό το βιβλίο. Ελέγξτε τα και δοκιμάστε ξανά.';

  @override
  String get readAlongStartOffline =>
      'Ο εργάτης ανάγνωσης με τον ήχο του BookOrbit είναι εκτός σύνδεσης. Δοκιμάστε ξανά αργότερα.';

  @override
  String get readAlongNotAllowed => 'Δεν έχετε άδεια για αυτή την ενέργεια.';

  @override
  String get readAlongGone =>
      'Αυτή η εργασία ανάγνωσης με τον ήχο δεν υπάρχει πια.';

  @override
  String get readAlongMovedOn =>
      'Αυτή η εργασία είχε ήδη προχωρήσει. Τώρα εμφανίζεται η τρέχουσα κατάστασή της.';

  @override
  String get readAlongActionFailed =>
      'Η ενέργεια δεν ολοκληρώθηκε. Δοκιμάστε ξανά.';

  @override
  String readAlongStartedBy(String name) {
    return 'Ξεκίνησε από τον/την $name';
  }

  @override
  String get readAlongStartedByOther => 'Ξεκίνησε από άλλον χρήστη';

  @override
  String get readAlongWaiting => 'Αναμονή έναρξης';

  @override
  String get readAlongNextInLine => 'Επόμενη στη σειρά';

  @override
  String readAlongJobsAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εργασίες μπροστά',
      one: '1 εργασία μπροστά',
    );
    return '$_temp0';
  }

  @override
  String get readAlongStopping => 'Διακοπή';

  @override
  String get readAlongStoppingHint =>
      'Ολοκληρώνεται το τρέχον βήμα και μετά σταματά. Τίποτα δεν θα προστεθεί σε αυτό το βιβλίο.';

  @override
  String get readAlongStagePreparingAudio => 'Προετοιμασία του ήχου';

  @override
  String get readAlongStageDownloadingModel => 'Λήψη του μοντέλου ομιλίας';

  @override
  String get readAlongStageListening => 'Ακρόαση της αφήγησης';

  @override
  String get readAlongStageMarkingUp =>
      'Σήμανση του κειμένου του ηλεκτρονικού βιβλίου';

  @override
  String get readAlongStageAligning =>
      'Αντιστοίχιση του κειμένου με την αφήγηση';

  @override
  String get readAlongStageChecking => 'Έλεγχος του αποτελέσματος';

  @override
  String get readAlongStagePublishing =>
      'Προσθήκη της ανάγνωσης με τον ήχο σε αυτό το βιβλίο';

  @override
  String get readAlongStageWorking => 'Σε εξέλιξη';

  @override
  String readAlongFileOf(int current, int total) {
    return 'Αρχείο $current από $total';
  }

  @override
  String readAlongTrackOf(int current, int total) {
    return 'Κομμάτι $current από $total';
  }

  @override
  String readAlongChapterOf(int current, int total) {
    return 'Κεφάλαιο $current από $total';
  }

  @override
  String readAlongStepOf(int current, int total) {
    return 'Βήμα $current από $total';
  }

  @override
  String get readAlongFirstRun => 'Πρώτη εκτέλεση για αυτή τη γλώσσα';

  @override
  String get readAlongJustStarted => 'Μόλις ξεκίνησε';

  @override
  String readAlongRunningFor(String duration) {
    return 'Εκτελείται εδώ και $duration';
  }

  @override
  String get readAlongStepAudio => 'Ήχος';

  @override
  String get readAlongStepSpeech => 'Ομιλία';

  @override
  String get readAlongStepText => 'Κείμενο';

  @override
  String get readAlongStepAlign => 'Αντιστοίχιση';

  @override
  String get readAlongStepCheck => 'Έλεγχος';

  @override
  String get readAlongStepAdd => 'Προσθήκη';

  @override
  String get readAlongReviewTitle => 'Έτοιμο για έλεγχο';

  @override
  String readAlongReviewMatched(String percent) {
    return 'Το $percent του κειμένου αντιστοιχίστηκε με την αφήγηση. Ελέγξτε το πριν το προσθέσετε στο βιβλίο.';
  }

  @override
  String get readAlongReviewPlain =>
      'Ελέγξτε το πριν το προσθέσετε στο βιβλίο.';

  @override
  String get readAlongReviewWeb =>
      'Για να εξαιρέσετε κεφάλαια και να κάνετε νέα αντιστοίχιση, ανοίξτε αυτό το βιβλίο στο BookOrbit στον ιστό.';

  @override
  String readAlongReviewExpires(String date) {
    return 'Θα απορριφθεί αυτόματα στις $date αν δεν το ελέγξετε.';
  }

  @override
  String get readAlongAddAnyway => 'Προσθήκη παρ\' όλα αυτά';

  @override
  String get readAlongDiscard => 'Απόρριψη';

  @override
  String get readAlongDiscardPrompt =>
      'Απόρριψη αυτής της ανάγνωσης με τον ήχο;';

  @override
  String get readAlongKeepIt => 'Διατήρηση';

  @override
  String get readAlongReady => 'Η ανάγνωση με τον ήχο είναι έτοιμη';

  @override
  String get readAlongReadyWarnings =>
      'Η ανάγνωση με τον ήχο είναι έτοιμη, με προειδοποιήσεις';

  @override
  String get readAlongAdded => 'Προστέθηκε σε αυτό το βιβλίο ως νέο EPUB.';

  @override
  String get readAlongReplaced =>
      'Αντικαταστάθηκε η παλιά ανάγνωση με τον ήχο. Οι θέσεις ανάγνωσης μεταφέρονται.';

  @override
  String readAlongMatchedSentences(String matched, String total) {
    return '$matched από $total προτάσεις αντιστοιχίστηκαν με την αφήγηση';
  }

  @override
  String readAlongAudioUsed(String percent) {
    return 'Χρησιμοποιήθηκε το $percent του ήχου';
  }

  @override
  String readAlongOutside(String chapters) {
    return 'Δεν υπάρχουν στην αφήγηση, οπότε μένουν χωρίς ήχο: $chapters.';
  }

  @override
  String readAlongOutsideMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ακόμη κεφάλαια',
      one: '1 ακόμη κεφάλαιο',
    );
    return '$_temp0';
  }

  @override
  String get readAlongWarnUnaligned =>
      'Ένα ή περισσότερα κομμάτια ήχου δεν μπόρεσαν να αντιστοιχιστούν.';

  @override
  String get readAlongWarnUnmatched =>
      'Σημαντικό μέρος του κειμένου του ηλεκτρονικού βιβλίου δεν αντιστοιχίστηκε με την αφήγηση.';

  @override
  String get readAlongWarnInterpolated =>
      'Ο χρονισμός ορισμένων τμημάτων του κειμένου εκτιμήθηκε ανάμεσα σε βέβαιες αντιστοιχίσεις.';

  @override
  String get readAlongWarnDropped =>
      'Ορισμένο κείμενο του ηλεκτρονικού βιβλίου παραλείφθηκε από την επισήμανση.';

  @override
  String get readAlongFailed => 'Η ανάγνωση με τον ήχο απέτυχε';

  @override
  String get readAlongCancelled => 'Η ανάγνωση με τον ήχο ακυρώθηκε';

  @override
  String get readAlongDiscarded => 'Η ανάγνωση με τον ήχο απορρίφθηκε';

  @override
  String get readAlongNothingAdded =>
      'Τίποτα δεν προστέθηκε σε αυτό το βιβλίο.';

  @override
  String get readAlongExpired =>
      'Δεν ελέγχθηκε μέσα σε 14 ημέρες, οπότε τίποτα δεν προστέθηκε σε αυτό το βιβλίο.';

  @override
  String readAlongRetryUntil(String date) {
    return 'Η επανάληψη συνεχίζει από το τελευταίο ολοκληρωμένο βήμα έως τις $date.';
  }

  @override
  String get readAlongStartOver => 'Έναρξη από την αρχή';

  @override
  String get readAlongCancel => 'Ακύρωση ανάγνωσης με τον ήχο';

  @override
  String get readAlongCancelPrompt => 'Ακύρωση αυτής της ανάγνωσης με τον ήχο;';

  @override
  String get readAlongKeepRunning => 'Συνέχιση εκτέλεσης';

  @override
  String get readAlongErrorWorkerOffline =>
      'Το BookOrbit δεν κατάφερε να επικοινωνήσει με τον εργάτη ανάγνωσης με τον ήχο.';

  @override
  String get readAlongErrorWorkerCrashed =>
      'Ο εργάτης ανάγνωσης με τον ήχο σταμάτησε απροσδόκητα.';

  @override
  String get readAlongErrorSourceMissing =>
      'Ένα επιλεγμένο αρχείο δεν υπάρχει πια.';

  @override
  String get readAlongErrorSourceChanged =>
      'Ένα επιλεγμένο αρχείο άλλαξε μετά την έναρξη της εργασίας.';

  @override
  String get readAlongErrorInvalidSource =>
      'Το EPUB ή το ηχητικό βιβλίο δεν μπόρεσε να διαβαστεί.';

  @override
  String get readAlongErrorLanguage =>
      'Το μοντέλο ομιλίας δεν γνωρίζει την επιλεγμένη γλώσσα.';

  @override
  String get readAlongErrorStorage =>
      'Δεν υπάρχει αρκετός ελεύθερος χώρος στον δίσκο του εργάτη για να ολοκληρωθεί.';

  @override
  String get readAlongErrorAudio =>
      'Το ηχητικό βιβλίο δεν μπόρεσε να προετοιμαστεί.';

  @override
  String get readAlongErrorModel => 'Το μοντέλο ομιλίας δεν μπόρεσε να ληφθεί.';

  @override
  String get readAlongErrorListening =>
      'Η αναγνώριση ομιλίας απέτυχε κατά την ακρόαση της αφήγησης.';

  @override
  String get readAlongErrorMarkup =>
      'Το κείμενο του ηλεκτρονικού βιβλίου δεν μπόρεσε να προετοιμαστεί για αντιστοίχιση.';

  @override
  String get readAlongErrorAlignment =>
      'Το κείμενο δεν μπόρεσε να αντιστοιχιστεί με την αφήγηση.';

  @override
  String get readAlongErrorOutput => 'Το νέο EPUB απέτυχε στους ελέγχους.';

  @override
  String get readAlongErrorPublish =>
      'Το νέο EPUB δεν μπόρεσε να προστεθεί σε αυτό το βιβλίο.';

  @override
  String get readAlongErrorDiscarded => 'Απορρίφθηκε κατά τον έλεγχο.';

  @override
  String get readAlongErrorCancelled => 'Ακυρώθηκε.';

  @override
  String get readAlongErrorUnknown =>
      'Κάτι πήγε στραβά κατά τη δημιουργία της ανάγνωσης με τον ήχο.';

  @override
  String get fileInfoNoAudiobook => 'Δεν υπάρχει ακόμη ηχητικό βιβλίο';

  @override
  String get fileInfoNoEbook => 'Δεν υπάρχει ακόμη ηλεκτρονικό βιβλίο';

  @override
  String get fileInfoRequestedBySomeone => 'Ζητήθηκε από κάποιον άλλον';

  @override
  String get fileInfoOwnedSeparately =>
      'Στη βιβλιοθήκη σας ως ξεχωριστό βιβλίο';

  @override
  String get fileInfoCopyPath => 'Αντιγραφή διαδρομής';

  @override
  String get fileInfoDeleteTitle => 'Διαγραφή αρχείου;';

  @override
  String fileInfoDeletePrompt(String name) {
    return 'Το \"$name\" θα διαγραφεί από τον διακομιστή. Αυτή η ενέργεια δεν αναιρείται.';
  }

  @override
  String get fileInfoDeleteLast =>
      'Είναι το τελευταίο αρχείο ήχου ή ηλεκτρονικού βιβλίου, οπότε το βιβλίο θα εμφανίζεται ως ελλιπές.';

  @override
  String get fileInfoDeleteNotAllowed => 'Δεν έχετε άδεια διαγραφής αρχείων';

  @override
  String get chapterSourceEmbedded => 'Ανάγνωση από τα αρχεία ήχου';

  @override
  String get chapterSourceTracks =>
      'Ένα κεφάλαιο ανά αρχείο ήχου, χωρίς αποθήκευση';

  @override
  String get chapterSourceProvider => 'Από ληφθέντα μεταδεδομένα';

  @override
  String get chapterSourceMigration => 'Εισαγωγή από το Audiobookshelf';

  @override
  String get chapterSourceManual => 'Επεξεργασία στο BookOrbit';

  @override
  String chapterSourceManualBy(String name) {
    return 'Επεξεργασία από τον/την $name';
  }

  @override
  String get chapterSourceNone => 'Δεν υπάρχουν ακόμη κεφάλαια';

  @override
  String get chapterProtected => 'Προστατευμένα από νέες σαρώσεις';

  @override
  String get chapterNotProtected =>
      'Μια νέα σάρωση μπορεί να τα αντικαταστήσει';

  @override
  String get chapterProtectOnSave => 'Προστασία από νέες σαρώσεις';

  @override
  String get chapterGetFrom => 'Λήψη κεφαλαίων από';

  @override
  String get chapterFromFiles => 'Τα αρχεία ήχου';

  @override
  String get chapterFromEbookToc => 'Τα περιεχόμενα του ηλεκτρονικού βιβλίου';

  @override
  String get chapterFromReadAlong => 'Την ανάγνωση με τον ήχο';

  @override
  String get chapterFromHistory => 'Προηγούμενες εκδόσεις';

  @override
  String get chapterHistoryTitle => 'Προηγούμενες εκδόσεις';

  @override
  String get chapterHistoryEmpty =>
      'Οι αποθηκευμένες εκδόσεις εμφανίζονται εδώ.';

  @override
  String chapterHistoryBy(String source, String name) {
    return '$source από τον/την $name';
  }

  @override
  String get chapterReadingFiles => 'Ανάγνωση των αρχείων ήχου...';

  @override
  String get chapterRevertToFiles => 'Επαναφορά από τα αρχεία';

  @override
  String get chapterRevertTitle => 'Επιστροφή στα κεφάλαια των αρχείων;';

  @override
  String get chapterRevertMessage =>
      'Το BookOrbit διαβάζει ξανά τα κεφάλαια από τα αρχεία ήχου και σταματά να τα προστατεύει από νέες σαρώσεις. Οι μη αποθηκευμένες αλλαγές χάνονται. Η τρέχουσα λίστα παραμένει στις προηγούμενες εκδόσεις.';

  @override
  String get chapterReverted => 'Τα κεφάλαια επανήλθαν στα αρχεία ήχου';

  @override
  String get chapterWriteFiles => 'Εγγραφή στα αρχεία';

  @override
  String get chapterWriteTitle => 'Εγγραφή των κεφαλαίων στα αρχεία ήχου;';

  @override
  String chapterWriteMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Αυτό ξαναγράφει τα $count αρχεία ήχου του βιβλίου με αυτά τα κεφάλαια.',
      one: 'Αυτό ξαναγράφει το αρχείο ήχου του βιβλίου με αυτά τα κεφάλαια.',
    );
    return '$_temp0 Ο ίδιος ο ήχος αντιγράφεται αναλλοίωτος. Τα τηλέφωνα που έχουν ήδη κατεβάσει το βιβλίο κρατούν το αντίγραφό τους μέχρι να γίνει νέα λήψη.';
  }

  @override
  String get chapterWriteConfirm => 'Εγγραφή';

  @override
  String get chapterWriting => 'Εγγραφή των κεφαλαίων στα αρχεία ήχου...';

  @override
  String chapterWritten(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Τα κεφάλαια γράφτηκαν και στα $count αρχεία ήχου',
      one: 'Τα κεφάλαια γράφτηκαν στο αρχείο ήχου',
    );
    return '$_temp0';
  }

  @override
  String chapterWrittenPartly(int written, int total) {
    return 'Τα κεφάλαια γράφτηκαν σε $written από $total αρχεία. Τα υπόλοιπα έμειναν όπως ήταν.';
  }

  @override
  String get chapterStaleTitle => 'Αυτά τα κεφάλαια άλλαξαν';

  @override
  String get chapterStaleMessage =>
      'Κάποιος άλλος αποθήκευσε αυτά τα κεφάλαια αφού τα ανοίξατε. Φορτώστε ξανά για να δείτε την έκδοσή του. Οι αλλαγές σας διατηρούνται μέχρι τότε.';

  @override
  String get chapterReload => 'Επαναφόρτωση';

  @override
  String get chapterKeepEditing => 'Συνέχιση επεξεργασίας';

  @override
  String get matchExplicitYes => 'Επισημασμένο ως ακατάλληλο';

  @override
  String get matchExplicitNo => 'Όχι ακατάλληλο';

  @override
  String get matchAbridgedYes => 'Συντομευμένο';

  @override
  String get matchAbridgedNo => 'Πλήρες';

  @override
  String boQuickMatchBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'αυτά τα $count βιβλία',
      one: 'αυτό το βιβλίο',
    );
    return 'Το BookOrbit αναζητά $_temp0 και συμπληρώνει ό,τι βρει, σύμφωνα με τις ρυθμίσεις μεταδεδομένων του.';
  }

  @override
  String get boQuickMatchIgnoreCache => 'Νέα ερώτηση σε κάθε πηγή';

  @override
  String get boQuickMatchIgnoreCacheHint =>
      'Παραλείπει τις αποθηκευμένες απαντήσεις. Πιο αργό, και χρησιμοποιεί περισσότερο από το όριο αιτημάτων κάθε πηγής.';

  @override
  String boAdminServerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count διακομιστές αλληλογραφίας',
      one: '1 διακομιστής αλληλογραφίας',
      zero: 'Κανένας ακόμη',
    );
    return '$_temp0';
  }

  @override
  String get boEmailTitle => 'Αποστολή με email';

  @override
  String get boEmailSubtitle =>
      'Συσκευές, διακομιστές αλληλογραφίας και πρότυπα για την αποστολή βιβλίων';

  @override
  String get boEmailTabDevices => 'Συσκευές';

  @override
  String get boEmailTabServers => 'Διακομιστές αλληλογραφίας';

  @override
  String get boEmailTabTemplates => 'Πρότυπα';

  @override
  String get boEmailTabHistory => 'Ιστορικό';

  @override
  String get boEmailName => 'Όνομα';

  @override
  String boEmailDeleteTitle(String name) {
    return 'Διαγραφή του $name;';
  }

  @override
  String get boEmailMakeDefault => 'Ορισμός ως προεπιλογής';

  @override
  String get boEmailBadgeDefault => 'Προεπιλογή';

  @override
  String get boEmailBadgeShared => 'Κοινόχρηστο';

  @override
  String get boEmailBadgeSystem => 'Επαναφορές κωδικού';

  @override
  String get boEmailBadgeBuiltIn => 'Ενσωματωμένο';

  @override
  String get boEmailDevicesEmpty =>
      'Δεν υπάρχουν συσκευές ακόμη. Προσθέστε τη διεύθυνση email του e-reader σας για να του στέλνετε βιβλία.';

  @override
  String get boEmailAddDevice => 'Προσθήκη συσκευής';

  @override
  String get boEmailNewDevice => 'Νέα συσκευή';

  @override
  String get boEmailDeviceNameHint => 'Το Kindle μου';

  @override
  String get boEmailDeviceAddress => 'Διεύθυνση email';

  @override
  String get boEmailDeviceType => 'Συσκευή';

  @override
  String get boEmailDeviceNone => 'Άτομο ή γραμματοκιβώτιο';

  @override
  String get boEmailDeviceKindle => 'Kindle';

  @override
  String get boEmailDeviceKobo => 'Kobo';

  @override
  String get boEmailDeviceOther => 'Άλλο e-reader';

  @override
  String get boEmailKindleHint =>
      'Το Kindle λαμβάνει το θέμα \"convert\" και δέχεται μέσω email μόνο EPUB και PDF.';

  @override
  String boEmailKindleApprove(String address) {
    return 'Το Kindle απορρίπτει αλληλογραφία από διευθύνσεις που δεν γνωρίζει. Στις Ρυθμίσεις προσωπικών εγγράφων της Amazon, προσθέστε το $address στη λίστα εγκεκριμένων.';
  }

  @override
  String get boEmailKindleApproveNoServer =>
      'Προσθέστε πρώτα έναν διακομιστή αλληλογραφίας για να δείτε τη διεύθυνση που πρέπει να εγκρίνει το Kindle.';

  @override
  String get boEmailFormat => 'Μορφή';

  @override
  String get boEmailFormatPrimary => 'Κύριο αρχείο του βιβλίου';

  @override
  String get boEmailFormatHint =>
      'Ένα βιβλίο χωρίς αυτή τη μορφή αποστέλλεται με το κύριο αρχείο του.';

  @override
  String get boEmailReadAlong => 'Βιβλία με ανάγνωση με τον ήχο';

  @override
  String get boEmailReadAlongAuto => 'Αυτόματα';

  @override
  String get boEmailReadAlongAutoHint =>
      'Μόνο κείμενο όταν μπορεί να γίνει αντίγραφο, αλλιώς το πρωτότυπο.';

  @override
  String get boEmailReadAlongText => 'Μόνο κείμενο';

  @override
  String get boEmailReadAlongTextHint =>
      'Χωρίς αφήγηση. Αρκετά μικρό για email.';

  @override
  String get boEmailReadAlongOriginal => 'Με αφήγηση';

  @override
  String get boEmailReadAlongOriginalHint =>
      'Διατηρεί την αφήγηση. Συχνά 100 MB ή περισσότερο, πάνω από τα όρια των περισσότερων διακομιστών αλληλογραφίας.';

  @override
  String get boEmailTemplate => 'Πρότυπο';

  @override
  String get boEmailTemplateYourDefault => 'Η προεπιλογή σας';

  @override
  String get boEmailTemplateKindleHint =>
      'Το Kindle δεν εμφανίζει ποτέ το μήνυμα, οπότε παραλείπει το πρότυπο.';

  @override
  String get boEmailDefaultDevice => 'Προεπιλεγμένη συσκευή';

  @override
  String get boEmailDefaultDeviceHint =>
      'Επιλέγεται πρώτη όταν στέλνετε ένα βιβλίο.';

  @override
  String get boEmailSendTest => 'Αποστολή δοκιμαστικού email';

  @override
  String get boEmailTestSubject => 'Δοκιμαστικό email από το Absorb';

  @override
  String boEmailTestBody(String name) {
    return 'Αυτό είναι μια δοκιμή από το Absorb. Αν μπορείτε να το διαβάσετε, τα βιβλία που στέλνονται στο $name θα φτάνουν κι εδώ.';
  }

  @override
  String boEmailTestSent(String name) {
    return 'Το δοκιμαστικό email στάλθηκε στο $name';
  }

  @override
  String boEmailTestFailed(String error) {
    return 'Το δοκιμαστικό email δεν στάλθηκε: $error';
  }

  @override
  String get boEmailDeleteDevice => 'Διαγραφή συσκευής';

  @override
  String get boEmailDeleteDeviceBody => 'Το ιστορικό αποστολών της παραμένει.';

  @override
  String get boEmailDeviceRequired => 'Εισαγάγετε όνομα και διεύθυνση email';

  @override
  String get boEmailLastSendFailed => 'Η τελευταία αποστολή απέτυχε';

  @override
  String get boEmailGroups => 'Ομάδες';

  @override
  String get boEmailGroupsHint => 'Αποστολή σε πολλές συσκευές ταυτόχρονα.';

  @override
  String get boEmailNewGroup => 'Νέα ομάδα';

  @override
  String get boEmailGroupNameHint => 'Λέσχη ανάγνωσης';

  @override
  String get boEmailGroupMembers => 'Συσκευές σε αυτή την ομάδα';

  @override
  String get boEmailGroupMembersEmpty => 'Προσθέστε πρώτα μια συσκευή.';

  @override
  String boEmailGroupMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count συσκευές',
      one: '1 συσκευή',
      zero: 'Καμία συσκευή',
    );
    return '$_temp0';
  }

  @override
  String get boEmailDeleteGroup => 'Διαγραφή ομάδας';

  @override
  String get boEmailDeleteGroupBody => 'Οι συσκευές της παραμένουν.';

  @override
  String get boEmailGroupRequired => 'Εισαγάγετε όνομα ομάδας';

  @override
  String get boEmailServersEmptyManage =>
      'Δεν υπάρχουν ακόμη διακομιστές αλληλογραφίας. Προσθέστε έναν για να ξεκινήσετε την αποστολή βιβλίων.';

  @override
  String get boEmailServersEmpty =>
      'Δεν υπάρχουν ακόμη διακομιστές αλληλογραφίας. Ζητήστε από έναν διαχειριστή να προσθέσει έναν.';

  @override
  String get boEmailAddServer => 'Προσθήκη διακομιστή αλληλογραφίας';

  @override
  String get boEmailNewServer => 'Νέος διακομιστής αλληλογραφίας';

  @override
  String get boEmailServerPresetOther => 'Άλλο';

  @override
  String get boEmailServerPresetHint =>
      'Μια προεπιλογή συμπληρώνει τον κεντρικό υπολογιστή, τη θύρα και την ασφάλεια. Μπορείτε να τα αλλάξετε.';

  @override
  String get boEmailServerHost => 'Κεντρικός υπολογιστής';

  @override
  String get boEmailServerPort => 'Θύρα';

  @override
  String get boEmailServerSecurity => 'Ασφάλεια';

  @override
  String get boEmailServerSecurityNone => 'Καμία';

  @override
  String get boEmailServerSecurityHint =>
      'STARTTLS στη θύρα 587, SSL/TLS στη 465.';

  @override
  String get boEmailServerNeedsPassword => 'Σύνδεση με κωδικό πρόσβασης';

  @override
  String get boEmailServerUsername => 'Όνομα χρήστη';

  @override
  String get boEmailServerPassword => 'Κωδικός πρόσβασης';

  @override
  String get boEmailServerAppPassword => 'Κωδικός εφαρμογής';

  @override
  String get boEmailServerPasswordKeep =>
      'Αποθηκευμένος. Πληκτρολογήστε για αντικατάσταση';

  @override
  String get boEmailServerAppPasswordHint =>
      'Το Gmail και το iCloud απαιτούν κωδικό εφαρμογής, όχι τον κωδικό του λογαριασμού σας.';

  @override
  String get boEmailServerFromName => 'Όνομα αποστολέα';

  @override
  String get boEmailServerFromAddress => 'Διεύθυνση αποστολέα';

  @override
  String get boEmailServerFromAddressHint =>
      'Οι κάτοχοι Kindle πρέπει να εγκρίνουν αυτή τη διεύθυνση.';

  @override
  String get boEmailServerShare => 'Κοινή χρήση με όλους';

  @override
  String get boEmailServerShareHint =>
      'Άλλα άτομα μπορούν να στέλνουν βιβλία μέσω αυτού του διακομιστή χωρίς να βλέπουν τον κωδικό πρόσβασης.';

  @override
  String get boEmailServerSystem =>
      'Αποστολή επαναφορών κωδικού και συνδέσμων σύνδεσης';

  @override
  String get boEmailServerSystemHint =>
      'Ο διακομιστής που χρησιμοποιεί το BookOrbit για τη δική του αλληλογραφία.';

  @override
  String get boEmailServerVerifyTls =>
      'Έλεγχος του πιστοποιητικού του διακομιστή';

  @override
  String get boEmailServerVerifyTlsHint =>
      'Απενεργοποιήστε το μόνο για διακομιστή στο δικό σας δίκτυο με αυτο-υπογεγραμμένο πιστοποιητικό.';

  @override
  String get boEmailServerTest => 'Δοκιμή σύνδεσης';

  @override
  String get boEmailServerTestSaveFirst =>
      'Αποθηκεύστε πρώτα και μετά δοκιμάστε';

  @override
  String get boEmailServerTestOk => 'Συνδέθηκε';

  @override
  String boEmailServerTestFailed(String error) {
    return 'Αδυναμία σύνδεσης: $error';
  }

  @override
  String get boEmailServerDelete => 'Διαγραφή διακομιστή αλληλογραφίας';

  @override
  String get boEmailServerDeleteBody => 'Όσοι τον μοιράζονται θα τον χάσουν.';

  @override
  String get boEmailServerSystemFirst =>
      'Απενεργοποιήστε τις επαναφορές κωδικού σε αυτόν τον διακομιστή πριν τον διαγράψετε.';

  @override
  String get boEmailServerRequired =>
      'Εισαγάγετε όνομα και κεντρικό υπολογιστή';

  @override
  String get boEmailServerNotYours =>
      'Αυτόν τον διακομιστή τον πρόσθεσε κάποιος άλλος. Μόνο αυτός μπορεί να τον αλλάξει.';

  @override
  String get boEmailTemplatesEmpty => 'Δεν υπάρχουν ακόμη πρότυπα.';

  @override
  String get boEmailNewTemplate => 'Νέο πρότυπο';

  @override
  String get boEmailTemplateSubject => 'Θέμα';

  @override
  String get boEmailTemplateMessage => 'Μήνυμα';

  @override
  String get boEmailTemplateInsert => 'Εισαγωγή';

  @override
  String get boEmailTemplateInsertHint =>
      'Μπαίνει στη θέση του δρομέα. Στοιχεία που δεν έχει ένα βιβλίο δεν εμφανίζουν τίποτα.';

  @override
  String get boEmailVarBook => 'Βιβλίο';

  @override
  String get boEmailVarFile => 'Αρχείο';

  @override
  String get boEmailVarOther => 'Άλλο';

  @override
  String get boEmailTemplatePreview => 'Προεπισκόπηση';

  @override
  String get boEmailTemplatePreviewNone =>
      'Στείλτε ένα βιβλίο μία φορά για να δείτε την προεπισκόπηση του προτύπου με αυτό.';

  @override
  String boEmailTemplateAttached(String name) {
    return 'Συνημμένο: $name';
  }

  @override
  String get boEmailTemplateBuiltIn =>
      'Ενσωματωμένο. Μόνο ένας διαχειριστής μπορεί να το αλλάξει.';

  @override
  String get boEmailTemplateKindleNote =>
      'Το Kindle δεν εμφανίζει ποτέ πρότυπο. Λαμβάνει πάντα το θέμα \"convert\".';

  @override
  String get boEmailTemplateDelete => 'Διαγραφή προτύπου';

  @override
  String get boEmailTemplateDeleteBody =>
      'Οι συσκευές που το χρησιμοποιούν επιστρέφουν στο προεπιλεγμένο πρότυπό σας.';

  @override
  String get boEmailTemplateRequired => 'Εισαγάγετε όνομα και θέμα';

  @override
  String get boEmailHistoryEmpty => 'Δεν έχει σταλεί τίποτα ακόμη.';

  @override
  String get boEmailHistoryAll => 'Όλα';

  @override
  String get boEmailHistoryEveryone => 'Όλοι';

  @override
  String get boEmailStatusSent => 'Στάλθηκε';

  @override
  String get boEmailStatusSending => 'Αποστολή';

  @override
  String boEmailStatusRetrying(int attempt) {
    return 'Νέα προσπάθεια ($attempt)';
  }

  @override
  String get boEmailStatusFailed => 'Απέτυχε';

  @override
  String boEmailTo(String name) {
    return 'Προς $name';
  }

  @override
  String get boEmailResend => 'Αποστολή ξανά';

  @override
  String get boEmailResent => 'Γίνεται νέα αποστολή';

  @override
  String get boEmailForget => 'Αφαίρεση από το ιστορικό';

  @override
  String get boEmailLoadMore => 'Φόρτωση περισσότερων';

  @override
  String get boEmailUnknownBook => 'Διαγραμμένο βιβλίο';

  @override
  String get boEmailSendNoServer =>
      'Δεν έχει ρυθμιστεί ακόμη διακομιστής αλληλογραφίας σε αυτόν τον διακομιστή.';

  @override
  String get boEmailSendAskAdmin =>
      'Ζητήστε από έναν διαχειριστή να προσθέσει έναν.';

  @override
  String get boEmailSendNoDevices =>
      'Προσθέστε μια συσκευή για να στείλετε αυτό το βιβλίο.';

  @override
  String get boEmailSendOptions => 'Επιλογές';

  @override
  String get boEmailSendFormatEach => 'Η μορφή κάθε συσκευής';

  @override
  String get boEmailSendServer => 'Διακομιστής αλληλογραφίας';

  @override
  String get boEmailSendButton => 'Αποστολή';

  @override
  String boEmailSendGets(String format, String size) {
    return 'Λαμβάνει $format · $size';
  }

  @override
  String boEmailSendMissing(String format, String got) {
    return 'Δεν υπάρχει $format, λαμβάνει $got';
  }

  @override
  String boEmailSendKindleRejects(String format) {
    return 'Το Kindle δεν δέχεται $format μέσω email';
  }

  @override
  String boEmailSendOverKindle(String size) {
    return '$size, πάνω από το όριο των 50 MB του Kindle';
  }

  @override
  String boEmailSendOverGmail(String size) {
    return '$size, πάνω από το όριο των 25 MB του Gmail';
  }

  @override
  String boEmailSendNarrated(String size) {
    return 'Λαμβάνει το αντίγραφο με αφήγηση · $size';
  }

  @override
  String boEmailSendHanding(String server) {
    return 'Αποστολή μέσω $server';
  }

  @override
  String boEmailSendAccepted(String server) {
    return 'Στάλθηκε μέσω $server';
  }

  @override
  String boEmailSendFailedLine(String error) {
    return 'Δεν στάλθηκε: $error';
  }

  @override
  String get boEmailSendStillGoing =>
      'Η αποστολή συνεχίζεται. Θα λάβετε ειδοποίηση όταν ολοκληρωθεί.';

  @override
  String get boEmailKindleOriginal =>
      'Το Kindle δεν δέχεται το αντίγραφο με αφήγηση. Ορίστε το σε μόνο κείμενο.';

  @override
  String get boEmailNoCopy =>
      'Δεν ήταν δυνατή η δημιουργία αντιγράφου χωρίς την αφήγηση.';

  @override
  String get recentSearchesTitle => 'Πρόσφατες αναζητήσεις';

  @override
  String get recentSearchesClear => 'Εκκαθάριση';

  @override
  String get recentSearchesRemove => 'Αφαίρεση';

  @override
  String get removedSeriesTapToUndo =>
      'Αφαιρέθηκε από τη Συνέχεια σειράς. Πατήστε για αναίρεση.';

  @override
  String get seriesBackOnContinueSeries => 'Ξανά στη Συνέχεια σειράς';

  @override
  String get desktopShortcutPlayPause => 'Αναπαραγωγή / παύση';

  @override
  String get desktopShortcutRewind => 'Επαναφορά πίσω';

  @override
  String get desktopShortcutForward => 'Γρήγορη προώθηση';

  @override
  String get desktopShortcutSlower => 'Μείωση ταχύτητας αναπαραγωγής';

  @override
  String get desktopShortcutFaster => 'Αύξηση ταχύτητας αναπαραγωγής';

  @override
  String get desktopShortcutNormalSpeed => 'Επαναφορά ταχύτητας αναπαραγωγής';

  @override
  String get desktopShortcutSearch => 'Άνοιγμα αναζήτησης';

  @override
  String get desktopShortcutLibrary => 'Άνοιγμα βιβλιοθήκης';

  @override
  String get desktopShortcutNowPlaying => 'Άνοιγμα τρέχουσας αναπαραγωγής';

  @override
  String get desktopShortcutFullScreen => 'Πλήρης οθόνη';

  @override
  String get desktopShortcutClosePlayer =>
      'Κλείσιμο του προγράμματος αναπαραγωγής πλήρους οθόνης';

  @override
  String get desktopShortcutBack =>
      'Πίσω (κλείσιμο της επάνω σελίδας ή καρτέλας)';

  @override
  String get desktopShortcutRefresh => 'Ανανέωση της λίστας στην οθόνη';

  @override
  String get desktopShortcutPreviousCard => 'Προηγούμενη κάρτα Absorbing';

  @override
  String get desktopShortcutNextCard => 'Επόμενη κάρτα Absorbing';

  @override
  String get desktopShortcutContextMenu =>
      'Άνοιγμα του μενού παρατεταμένου πατήματος';

  @override
  String get desktopShortcutMouseBack => 'Κουμπί «Πίσω» του ποντικιού';

  @override
  String get desktopShortcutRightClick => 'Δεξί κλικ';

  @override
  String get desktopShortcutDragShelves => 'Σύρετε ράφια και κάρτες οριζόντια';

  @override
  String get desktopShortcutMouseDrag => 'Κλικ και σύρσιμο';

  @override
  String get fileHealthAction => 'Έλεγχος αρχείων';

  @override
  String get fileHealthTitle => 'Έλεγχος αρχείων';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Και τα $count αρχεία φαίνονται εντάξει',
      one: 'Το αρχείο φαίνεται εντάξει',
      zero: 'Δεν φαίνεται κάτι λάθος',
    );
    return '$_temp0';
  }

  @override
  String fileHealthProblems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Βρέθηκαν $count προβλήματα',
      one: 'Βρέθηκε 1 πρόβλημα',
    );
    return '$_temp0';
  }

  @override
  String get fileHealthReadOnlyNote =>
      'Διαβάζονται μόνο όσα αναφέρει ήδη ο διακομιστής. Δεν αλλάζει τίποτα.';

  @override
  String get fileHealthLocalChecked =>
      'Ελέγχθηκαν και τα ληφθέντα αρχεία σε αυτή τη συσκευή.';

  @override
  String get fileHealthItemMissing => 'Λείπει ο φάκελος του βιβλίου';

  @override
  String get fileHealthItemMissingInfo =>
      'Ο διακομιστής δεν βρίσκει πια τον φάκελο αυτού του βιβλίου. Ίσως μετακινήθηκε, μετονομάστηκε ή διαγράφηκε, ή ο δίσκος του είναι εκτός σύνδεσης. Μια σάρωση βιβλιοθήκης στον διακομιστή μπορεί να τον βρει ξανά.';

  @override
  String get fileHealthItemInvalid => 'Το βιβλίο επισημάνθηκε ως μη έγκυρο';

  @override
  String get fileHealthItemInvalidInfo =>
      'Ο διακομιστής δεν βρήκε αρχεία ήχου ή ηλεκτρονικού βιβλίου που να μπορούν να χρησιμοποιηθούν για αυτό το βιβλίο.';

  @override
  String get fileHealthInvalidFiles => 'Μη αναγνώσιμα αρχεία';

  @override
  String get fileHealthInvalidFilesInfo =>
      'Ο διακομιστής δεν μπόρεσε να διαβάσει αυτά τα αρχεία. Μπορεί να είναι κατεστραμμένα ή σε μορφή που δεν υποστηρίζει, και η αναπαραγωγή μπορεί να σταματήσει ή να τα προσπεράσει.';

  @override
  String get fileHealthEmptyFiles => 'Αρχεία χωρίς διάρκεια';

  @override
  String get fileHealthEmptyFilesInfo =>
      'Αυτά τα αρχεία αναφέρουν μηδενική διάρκεια, επομένως δεν υπάρχει τίποτα να αναπαραχθεί. Συχνά είναι κενά ή κομμένα.';

  @override
  String get fileHealthTrackGaps => 'Κενά μεταξύ αρχείων';

  @override
  String get fileHealthTrackGapsInfo =>
      'Η χρονολογική σειρά του βιβλίου προχωρά μπροστά ανάμεσα σε αυτά τα αρχεία, αφήνοντας ένα τμήμα όπου δεν παίζει τίποτα.';

  @override
  String get fileHealthTrackOverlaps => 'Αρχεία που επικαλύπτονται';

  @override
  String get fileHealthTrackOverlapsInfo =>
      'Αυτά τα αρχεία επικαλύπτονται στη χρονολογική σειρά του βιβλίου, οπότε ένα τμήμα μπορεί να παραλειφθεί ή η θέση να μεταπηδήσει.';

  @override
  String get fileHealthDurationMismatch => 'Η διάρκεια δεν συμφωνεί';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return 'Τα αρχεία αθροίζουν σε $actual, αλλά το βιβλίο δηλώνει διάρκεια $expected. Η πρόοδος και τα κεφάλαια μπορεί να είναι λανθασμένα. Μια νέα σάρωση στον διακομιστή συνήθως το διορθώνει.';
  }

  @override
  String get fileHealthLowBitrate => 'Ήχος χαμηλής ποιότητας';

  @override
  String get fileHealthLowBitrateInfo =>
      'Αυτά τα αρχεία είναι κωδικοποιημένα κάτω από 32 kbps και μπορεί να ακούγονται πνιχτά.';

  @override
  String get fileHealthMixedSampleRates => 'Ανάμεικτοι ρυθμοί δειγματοληψίας';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      'Τα αρχεία ηχογραφήθηκαν με διαφορετικούς ρυθμούς δειγματοληψίας. Τα περισσότερα προγράμματα αναπαραγωγής το αντιμετωπίζουν, αλλά ορισμένα μπορεί να κάνουν κλικ ή να αλλάξουν ταχύτητα εκεί που τελειώνει ένα αρχείο και ξεκινά το επόμενο.';

  @override
  String get fileHealthMixedChannels => 'Ανάμεικτα μονοφωνικά και στερεοφωνικά';

  @override
  String get fileHealthMixedChannelsInfo =>
      'Ορισμένα αρχεία έχουν διαφορετικό αριθμό καναλιών από άλλα, οπότε ο ήχος μπορεί να αλλάζει μεταξύ των αρχείων.';

  @override
  String get fileHealthChaptersPastEnd => 'Κεφάλαια μετά το τέλος';

  @override
  String get fileHealthChaptersPastEndInfo =>
      'Αυτά τα κεφάλαια ξεκινούν ή τελειώνουν μετά το τέλος του ήχου, οπότε η μετάβαση σε αυτά μπορεί να μην οδηγεί πουθενά.';

  @override
  String get fileHealthLocalMissing => 'Λείπουν ληφθέντα αρχεία';

  @override
  String get fileHealthLocalMissingInfo =>
      'Αυτά τα ληφθέντα αρχεία δεν υπάρχουν πια σε αυτή τη συσκευή. Η αναπαραγωγή εκτός σύνδεσης θα αποτύχει εκεί που θα έπρεπε να βρίσκονται.';

  @override
  String get fileHealthLocalSizeMismatch => 'Τα ληφθέντα αρχεία διαφέρουν';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      'Αυτά τα ληφθέντα αρχεία δεν έχουν το ίδιο μέγεθος με τα αντίγραφα του διακομιστή, οπότε μπορεί να είναι ελλιπή ή κατεστραμμένα.';

  @override
  String fileHealthStartsAt(String time) {
    return 'ξεκινά στο $time';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return '$local εδώ, $server στον διακομιστή';
  }

  @override
  String fileHealthSampleRate(String value) {
    return '$value kHz';
  }

  @override
  String get fileHealthMono => 'Μονοφωνικό';

  @override
  String get fileHealthStereo => 'Στερεοφωνικό';

  @override
  String get fileHealthRedownload => 'Νέα λήψη αυτού του βιβλίου';

  @override
  String get fileHealthRedownloadQuestion => 'Νέα λήψη αυτού του βιβλίου;';

  @override
  String get fileHealthRedownloadInfo =>
      'Το αντίγραφο σε αυτή τη συσκευή αφαιρείται και λαμβάνεται ξανά από τον διακομιστή. Αν το βιβλίο παίζει, θα σταματήσει. Στον διακομιστή δεν αλλάζει τίποτα.';

  @override
  String get fileHealthNotAvailableOffline =>
      'Συνδεθείτε στον διακομιστή σας για νέα λήψη';

  @override
  String get playerReconnecting => 'Η σύνδεση χάθηκε, γίνεται επανασύνδεση…';

  @override
  String get playerReconnectFailed =>
      'Δεν ήταν δυνατή η επανασύνδεση με τον διακομιστή, οπότε η αναπαραγωγή σταμάτησε.';

  @override
  String get downloadsFailed => 'Αποτυχημένες λήψεις';

  @override
  String get absorbingReorderQueue => 'Αναδιάταξη ουράς';

  @override
  String get playAction => 'Αναπαραγωγή';

  @override
  String get pauseAction => 'Παύση';

  @override
  String get rmabImportBooks => 'Εισαγωγή βιβλίων';

  @override
  String get rmabImportBooksSubtitle =>
      'Αναζητήστε στο ReadMeABook και επιλέξτε βιβλία για αίτημα';

  @override
  String get rmabImportBooksConnectSubtitle =>
      'Συνδέστε πρώτα το ReadMeABook με διεύθυνση URL και διακριτικό';

  @override
  String get windowsSettingsTitle => 'Ρυθμίσεις Windows';

  @override
  String get updateCheckFrequency => 'Αυτόματος έλεγχος ενημερώσεων';

  @override
  String get updateCheckFrequencySubtitle =>
      'Ελέγχει μόνο για ενημερώσεις· η εγκατάσταση γίνεται πάντα χειροκίνητα.';

  @override
  String get updateCheckOnStartup => 'Κατά την εκκίνηση (μία φορά ανά 12 ώρες)';

  @override
  String get updateCheckEverySixHours => 'Κάθε 6 ώρες';

  @override
  String get updateCheckEveryTwelveHours => 'Κάθε 12 ώρες';

  @override
  String get updateCheckDaily => 'Καθημερινά';

  @override
  String get updateCheckNever => 'Ποτέ αυτόματα';

  @override
  String onLatestVersionDetail(String version) {
    return 'Έχετε την τελευταία έκδοση ($version)';
  }

  @override
  String get updateCheckFailed =>
      'Δεν ήταν δυνατή η σύνδεση με το GitHub για έλεγχο ενημερώσεων. Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';

  @override
  String get playlistDetailAddBooks =>
      'Προσθήκη βιβλίων στη λίστα αναπαραγωγής';

  @override
  String get playlistDetailSwitchToList => 'Εναλλαγή σε προβολή λίστας';

  @override
  String get playlistDetailSwitchToGrid => 'Εναλλαγή σε προβολή πλέγματος';

  @override
  String get adminUploadIndexing =>
      'Η μεταφόρτωση ολοκληρώθηκε· αναμονή για ευρετηρίαση από το Audiobookshelf...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return 'Μεταφορτώθηκε το «$title»· το Audiobookshelf το ευρετηριάζει ακόμη';
  }

  @override
  String get adminUploadPermissionDenied =>
      'Ο λογαριασμός σας στο Audiobookshelf δεν έχει δικαίωμα μεταφόρτωσης. Ζητήστε από έναν διαχειριστή του διακομιστή να ενεργοποιήσει την πρόσβαση μεταφόρτωσης για τον λογαριασμό σας.';

  @override
  String get uiThemeLabel => 'Θέμα διεπαφής';

  @override
  String get uiThemePickerTitle => 'Επιλέξτε εμφάνιση';

  @override
  String get uiThemePickerIntro =>
      'Μπορείτε να το αλλάξετε οποιαδήποτε στιγμή στις Ρυθμίσεις > Εμφάνιση > Θέμα διεπαφής.';

  @override
  String get uiThemePlusName => 'Στάνταρ';

  @override
  String get uiThemePlusDescription =>
      'Η συνηθισμένη εμφάνιση του Absorb Plus, με γεμάτα πάνελ και απαλή λάμψη από τα χρώματα των εξωφύλλων σας.';

  @override
  String get uiThemeMidnightName => 'Μεσάνυχτα';

  @override
  String get uiThemeMidnightDescription =>
      'Καθαρό μαύρο με λεπτά περιγράμματα και χωρίς λάμψη, φτιαγμένο για οθόνες OLED.';

  @override
  String get uiThemeContinue => 'Συνέχεια';

  @override
  String get uiThemeFrostedName => 'Παγωμένο';

  @override
  String get uiThemeFrostedDescription =>
      'Απαλά πάνελ από παγωμένο γυαλί με τα χρώματα των εξωφύλλων σας να λάμπουν μέσα από αυτά.';

  @override
  String get uiThemeColorTitle => 'Επιλέξτε χρώμα';

  @override
  String get uiThemeColorIntro =>
      'Είναι η ίδια ρύθμιση με το Ρυθμίσεις > Εμφάνιση > Πηγή χρώματος.';

  @override
  String get uiThemeColorFromCover => 'Από το εξώφυλλο';

  @override
  String get uiThemeBack => 'Πίσω';

  @override
  String get uiThemeTryIt => 'Δοκιμή';

  @override
  String uiThemePreviewing(String name) {
    return 'Προεπισκόπηση: $name';
  }

  @override
  String get uiThemeKeep => 'Διατήρηση';

  @override
  String get uiThemeGoBack => 'Επιστροφή';

  @override
  String get uiThemeGlass => 'Γυαλί';

  @override
  String get uiThemeGlassLight => 'Ελαφρύ';

  @override
  String get uiThemeGlassMedium => 'Μέτριο';

  @override
  String get uiThemeGlassStrong => 'Έντονο';

  @override
  String get uiThemeDetails => 'Λεπτομέρειες εμφάνισης';

  @override
  String get uiThemeFullCovers => 'Εξώφυλλα πλήρους ποιότητας';

  @override
  String get uiThemeFullCoversSubtitle =>
      'Πιο καθαρά εξώφυλλα που χρησιμοποιούν περισσότερη μνήμη';

  @override
  String get uiThemeExtraBadges => 'Επιπλέον σήματα εξωφύλλου';

  @override
  String get uiThemeExtraBadgesSubtitle =>
      'Σήμα ηλεκτρονικού βιβλίου και η λωρίδα «αποθηκευμένο» στη Συνέχεια ακρόασης';

  @override
  String get uiThemeReadingShelf => 'Συνέχεια ανάγνωσης ως ράφι';

  @override
  String get uiThemeReadingShelfSubtitle =>
      'Ένα κανονικό ράφι στην Αρχική αντί για μεγάλες κάρτες';

  @override
  String get uiThemeCompactHeader => 'Συμπαγή κουμπιά κεφαλίδας';

  @override
  String get uiThemeCompactHeaderSubtitle =>
      'Τα κουμπιά στην κεφαλίδα της σελίδας διατηρούν το μικρό τους μέγεθος';

  @override
  String get uiThemePlainWording => 'Απλή διατύπωση';

  @override
  String get uiThemePlainWordingOnSubtitle =>
      'Χρήση των «Αναπαραγωγή», «Αναπαράγεται τώρα», «Ολοκληρώθηκε»';

  @override
  String get uiThemePlainWordingOffSubtitle =>
      'Χρήση των «Absorb», «Absorbing», «Fully Absorbed»';

  @override
  String get uiThemeSearchClassic => 'Κλασικό';

  @override
  String whatsNewSheetTitle(String name) {
    return 'Τι νέο υπάρχει στο $name';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return 'Ενημερώθηκε από το $name';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return 'έκδοση $number';
  }

  @override
  String get whatsNewFullNotes => 'Πλήρεις σημειώσεις στο GitHub';

  @override
  String get whatsNewLoading => 'Φόρτωση των νέων';

  @override
  String get whatsNewLoadFailed => 'Δεν ήταν δυνατή η φόρτωση των σημειώσεων';

  @override
  String get whatsNewLoadFailedHint =>
      'Ελέγξτε τη σύνδεσή σας ή διαβάστε τες στο GitHub.';

  @override
  String get whatsNewOpenGitHub => 'Άνοιγμα στο GitHub';

  @override
  String get settingsSeeWhatsNew => 'Δείτε τι νέο υπάρχει';

  @override
  String get settingsSeeWhatsNewSubtitle =>
      'Οι σημειώσεις έκδοσης για αυτήν την έκδοση';

  @override
  String get windowsCloseToTray => 'Κλείσιμο στην περιοχή ειδοποιήσεων';

  @override
  String get windowsCloseToTraySubtitle =>
      'Το κλείσιμο του παραθύρου διατηρεί το Absorb Plus σε λειτουργία στην περιοχή ειδοποιήσεων. Έξοδος από το εικονίδιο της περιοχής.';

  @override
  String get windowsStartWithWindows => 'Εκκίνηση με τα Windows';

  @override
  String get windowsStartWithWindowsSubtitle =>
      'Άνοιγμα του Absorb Plus όταν συνδέεστε στα Windows';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return 'Εκκινεί: $command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return 'Άλλο αντίγραφο έχει οριστεί να εκκινεί: $command. Ενεργοποιήστε για να χρησιμοποιηθεί αυτό το αντίγραφο.';
  }

  @override
  String get windowsStartupDisabledBySystem =>
      'Απενεργοποιήθηκε στις Εφαρμογές εκκίνησης του Task Manager. Ενεργοποιήστε το ξανά εκεί.';

  @override
  String get windowsStartMinimized => 'Εκκίνηση ελαχιστοποιημένο';

  @override
  String get windowsStartMinimizedSubtitle =>
      'Όταν εκκινείται με τα Windows, παραμένει στην περιοχή ειδοποιήσεων (ή ελαχιστοποιημένο αν το Κλείσιμο στην περιοχή ειδοποιήσεων είναι ανενεργό)';

  @override
  String get windowsAlwaysOnTop => 'Πάντα στο προσκήνιο';

  @override
  String get windowsAlwaysOnTopSubtitle =>
      'Κρατά το παράθυρο πάνω από τα άλλα παράθυρα';

  @override
  String get windowsKeepAwake =>
      'Διατήρηση του υπολογιστή ενεργού κατά την αναπαραγωγή ή λήψη';

  @override
  String get windowsKeepAwakeSubtitle =>
      'Εμποδίζει τον υπολογιστή να κοιμηθεί. Η οθόνη μπορεί και πάλι να σβήσει.';

  @override
  String get windowsSettingFailed =>
      'Τα Windows δεν αποδέχτηκαν αυτή την αλλαγή';

  @override
  String get windowsGlobalHotkeys => 'Καθολικές συντομεύσεις';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Λειτουργούν όταν το Absorb Plus είναι στο παρασκήνιο: Ctrl+Alt+Space αναπαραγωγή/παύση, Ctrl+Alt+Left/Right μετακίνηση πίσω/μπροστά, Ctrl+Alt+Up/Down ένταση, Ctrl+Alt+B προσθήκη σελιδοδείκτη';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return 'Χρησιμοποιούνται από άλλη εφαρμογή, μη διαθέσιμες: $keys';
  }

  @override
  String get windowsTrayShow => 'Εμφάνιση του Absorb Plus';

  @override
  String get windowsTrayQuit => 'Έξοδος από το Absorb Plus';

  @override
  String get windowsTaskbarPlay => 'Αναπαραγωγή';

  @override
  String get windowsTaskbarPause => 'Παύση';

  @override
  String get windowsTaskbarRewind => 'Επαναφορά πίσω';

  @override
  String get windowsTaskbarForward => 'Γρήγορη προώθηση';

  @override
  String windowsJumpListResume(String title) {
    return 'Συνέχεια: $title';
  }

  @override
  String get githubProjectTitle => 'Το Absorb Plus στο GitHub';

  @override
  String get precacheTitle => 'Προφόρτωση εξωφύλλων και σελίδων βιβλίων';

  @override
  String get precacheSubtitle =>
      'Τα φορτώνει στο παρασκήνιο σε Wi-Fi ή ενσύρματη σύνδεση, ώστε οι οθόνες να ανοίγουν αμέσως. Χρησιμοποιεί λίγο χώρο στον δίσκο, όχι μνήμη.';

  @override
  String get githubProjectSubtitle =>
      'Εκδόσεις, πηγαίος κώδικας και νέα του έργου';

  @override
  String get supportSaveLogsSubtitle =>
      'Αποθηκεύστε το αρχείο καταγραφής για να το επισυνάψετε σε ένα ζήτημα στο GitHub';

  @override
  String get supportSaveLogsDialogTitle =>
      'Αποθήκευση καταγραφών του Absorb Plus';

  @override
  String supportLogsSaved(String path) {
    return 'Οι καταγραφές αποθηκεύτηκαν στο $path';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return 'Δεν ήταν δυνατή η αποθήκευση των καταγραφών: $error';
  }

  @override
  String get supportOpenLogsFolder => 'Άνοιγμα φακέλου καταγραφών';

  @override
  String get supportOpenLogsFolderSubtitle =>
      'Εμφάνιση του αρχείου καταγραφής στον διαχειριστή αρχείων';

  @override
  String get supportOpenLogsFolderFailed =>
      'Δεν ήταν δυνατό το άνοιγμα του φακέλου καταγραφών';

  @override
  String get desktopDownloadFolderOpen => 'Άνοιγμα στην Εξερεύνηση';

  @override
  String get desktopDownloadFolderOpenLinux => 'Άνοιγμα φακέλου';

  @override
  String get desktopDownloadFolderOpenFailed =>
      'Δεν ήταν δυνατό το άνοιγμα του φακέλου';

  @override
  String get desktopDownloadFolderNotWritable =>
      'Το Absorb δεν μπορεί να αποθηκεύσει αρχεία σε αυτόν τον φάκελο. Επιλέξτε άλλον.';

  @override
  String get desktopDownloadFolderPickFailed =>
      'Δεν ήταν δυνατή η εμφάνιση του επιλογέα φακέλων';

  @override
  String get desktopDownloadFolderNetworkPath =>
      'Οι φάκελοι δικτύου (\\\\server\\share) δεν μπορούν να φιλοξενήσουν λήψεις. Αντιστοιχίστε το κοινόχρηστο σε γράμμα μονάδας στην Εξερεύνηση αρχείων, όπως Z:, και επιλέξτε αυτό.';

  @override
  String get desktopDownloadFolderDefault => 'Προεπιλεγμένος φάκελος';

  @override
  String get bookSettingsTitle => 'Ρυθμίσεις βιβλίου';

  @override
  String bookSettingsSeries(String name) {
    return 'Σειρά: $name';
  }

  @override
  String get bookSettingsSpeed => 'Ταχύτητα';

  @override
  String get bookSettingsSpeedFromSeries =>
      'Από το τελευταίο βιβλίο που παίξατε σε αυτή τη σειρά';

  @override
  String get bookSettingsSkipIntro => 'Παράλειψη εισαγωγής';

  @override
  String get bookSettingsSkipIntroHint =>
      'Μόνο όταν το βιβλίο ξεκινά από την αρχή';

  @override
  String get bookSettingsSkipOutro => 'Παράλειψη επιλόγου';

  @override
  String get bookSettingsSkipOutroHint =>
      'Τελειώνει το βιβλίο νωρίτερα και το σημειώνει ως ολοκληρωμένο';

  @override
  String get bookSettingsSkipOff => 'Ανενεργή';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds δ';
  }

  @override
  String get bookSettingsWholeSeries => 'Χρήση για ολόκληρη τη σειρά';

  @override
  String get bookSettingsWholeSeriesHint =>
      'Η εισαγωγή και ο επίλογος ισχύουν για κάθε βιβλίο αυτής της σειράς';

  @override
  String get bookSettingsReset => 'Επαναφορά';

  @override
  String get bookSettingsResetDone => 'Οι ρυθμίσεις βιβλίου επαναφέρθηκαν';

  @override
  String get adminDashTitle => 'Πίνακας ελέγχου';

  @override
  String get adminDashSubtitle =>
      'Ποιος ακούει, βιβλιοθήκες, χρήστες και προειδοποιήσεις διακομιστή με μια ματιά';

  @override
  String get adminDashNobodyListening => 'Κανείς δεν ακούει αυτή τη στιγμή';

  @override
  String adminDashOnlineNames(String names) {
    return 'Συνδεδεμένοι: $names';
  }

  @override
  String get adminDashListeningHistory => 'Ιστορικό ακρόασης';

  @override
  String get adminDashCouldNotLoad =>
      'Δεν ήταν δυνατή η φόρτωση από τον διακομιστή';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count στοιχεία',
      one: '1 στοιχείο',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => 'Σάρωση όλων';

  @override
  String get adminDashScanAllTitle => 'Σάρωση όλων των βιβλιοθηκών;';

  @override
  String get adminDashScanAllContent =>
      'Το Audiobookshelf θα αναζητήσει νέα, αλλαγμένα και ελλείποντα αρχεία σε κάθε βιβλιοθήκη. Σε μεγάλες βιβλιοθήκες μπορεί να πάρει λίγη ώρα.';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Η σάρωση ξεκίνησε για $count βιβλιοθήκες',
      one: 'Η σάρωση ξεκίνησε για 1 βιβλιοθήκη',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return '$failed από $total σαρώσεις δεν μπόρεσαν να ξεκινήσουν';
  }

  @override
  String get adminDashNoLibraries => 'Δεν υπάρχουν βιβλιοθήκες ακόμη';

  @override
  String get adminDashBackUpNow => 'Δημιουργία αντιγράφου τώρα';

  @override
  String adminDashLastBackup(String time) {
    return 'Τελευταίο αντίγραφο $time';
  }

  @override
  String get adminDashNoBackups => 'Δεν υπάρχουν αντίγραφα ασφαλείας ακόμη';

  @override
  String get adminDashManageUsers => 'Διαχείριση χρηστών';

  @override
  String get adminDashNeverSeen => 'Δεν έχει συνδεθεί ποτέ';

  @override
  String get adminDashDisabled => 'Απενεργοποιημένος';

  @override
  String get adminDashLocked => 'Κλειδωμένος';

  @override
  String get adminDashServerWarnings => 'Προειδοποιήσεις διακομιστή';

  @override
  String get adminDashNoProblems =>
      'Καμία προειδοποίηση ή σφάλμα στην καταγραφή της σημερινής ημέρας';

  @override
  String get adminDashAllLogs => 'Όλες οι καταγραφές διακομιστή';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale (ενσωματωμένο)';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => 'Συντομεύσεις πληκτρολογίου';

  @override
  String get desktopShortcutsSubtitle =>
      'Έλεγχοι αναπαραγωγής, ταχύτητας, αναζήτησης και πλοήγησης';

  @override
  String get desktopShortcutsClose => 'Κλείσιμο';

  @override
  String get tailscaleConnect => 'Σύνδεση με Tailscale';

  @override
  String get tailscaleConnectHint =>
      'Ανοίγει τη σύνδεση Tailscale στο πρόγραμμα περιήγησής σας';

  @override
  String get tailscaleTurnOff => 'Απενεργοποίηση';

  @override
  String get tailscaleCardPitch =>
      'Φτάστε στον διακομιστή σας μέσα από το tailnet σας χωρίς να ενεργοποιήσετε το VPN του Tailscale';

  @override
  String get tailscaleIntro =>
      'Φτάστε σε έναν διακομιστή στο tailnet σας χωρίς να ενεργοποιήσετε το VPN της εφαρμογής Tailscale. Το Absorb προστίθεται στο tailnet σας ως ξεχωριστή συσκευή, μόνο για τις δικές του συνδέσεις. Δοκιμαστική λειτουργία, ανενεργή από προεπιλογή.';

  @override
  String get tailscaleUseSwitch => 'Χρήση ενσωματωμένου Tailscale';

  @override
  String get tailscaleStatusOff => 'Ανενεργό';

  @override
  String get tailscaleStatusStarting => 'Σύνδεση…';

  @override
  String get tailscaleStatusNeedsLogin =>
      'Συνδεθείτε για να προσθέσετε αυτή τη συσκευή στο tailnet σας';

  @override
  String get tailscaleStatusNeedsApproval =>
      'Αναμονή για έγκριση αυτής της συσκευής από διαχειριστή';

  @override
  String tailscaleStatusConnected(String user) {
    return 'Συνδεδεμένο ως $user';
  }

  @override
  String get tailscaleStatusConnectedNoUser => 'Συνδεδεμένο';

  @override
  String tailscaleStatusError(String error) {
    return 'Πρόβλημα: $error';
  }

  @override
  String get tailscaleNotIncluded => 'Δεν περιλαμβάνεται σε αυτή την έκδοση';

  @override
  String get tailscaleSignIn => 'Σύνδεση με Tailscale';

  @override
  String get tailscaleSignInNoLink =>
      'Δεν υπάρχει ακόμη σύνδεσμος σύνδεσης. Δοκιμάστε ξανά σε λίγο.';

  @override
  String get tailscaleToggleFailed =>
      'Δεν ήταν δυνατή η ενεργοποίηση ή απενεργοποίηση του ενσωματωμένου Tailscale. Δοκιμάστε ξανά.';

  @override
  String get tailscaleSignOut => 'Αποσύνδεση από το Tailscale';

  @override
  String tailscaleDeviceAddress(String address) {
    return 'Αυτή η συσκευή: $address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return 'Ο διακομιστής σας ($server) προσεγγίζεται μέσω Tailscale.';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return 'Ο διακομιστής σας ($server) δεν είναι διεύθυνση tailnet, οπότε προσεγγίζεται κανονικά. Αν βρίσκεται στο tailnet σας, προσθέστε το όνομα κεντρικού υπολογιστή του παρακάτω.';
  }

  @override
  String get tailscaleExtraHostsLabel =>
      'Άλλα ονόματα κεντρικών υπολογιστών tailnet';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      'Οι διευθύνσεις στο 100.64.0.0/10 και τα ονόματα που τελειώνουν σε .ts.net ή στο όνομα MagicDNS του tailnet σας περνούν πάντα μέσω Tailscale. Χωρίστε τα ονόματα με κόμματα.';

  @override
  String playerChapterEndsAt(String time) {
    return 'Το κεφάλαιο τελειώνει στις $time';
  }

  @override
  String playerEndsAt(String time) {
    return 'Τελειώνει στις $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return 'Τελευταία αναπαραγωγή στο $device · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return 'Τελευταία αναπαραγωγή σε άλλη συσκευή · $ago';
  }

  @override
  String get opmlExportAction => 'Εξαγωγή OPML';

  @override
  String get opmlExportDialogTitle => 'Αποθήκευση ροών podcast ως OPML';

  @override
  String opmlExportSaved(String path) {
    return 'Το OPML αποθηκεύτηκε στο $path';
  }

  @override
  String get opmlExportDownloaded => 'Το OPML λήφθηκε';

  @override
  String get opmlExportFailed => 'Δεν ήταν δυνατή η εξαγωγή του αρχείου OPML';

  @override
  String get bookCopySaveAction => 'Αποθήκευση αντιγράφου…';

  @override
  String get bookCopyDialogTitle => 'Αποθήκευση αντιγράφου αυτού του βιβλίου';

  @override
  String get bookCopySaving => 'Αποθήκευση αντιγράφου…';

  @override
  String bookCopySaved(String path) {
    return 'Το αντίγραφο αποθηκεύτηκε στο $path';
  }

  @override
  String get bookCopyFailed =>
      'Δεν ήταν δυνατή η αποθήκευση αντιγράφου αυτού του βιβλίου';

  @override
  String get exclusiveAudioTitle => 'Αποκλειστικός ήχος';

  @override
  String get exclusiveAudioSubtitle =>
      'Διορθώνει τους κρότους ή τις ασταθείς εντάσεις παρακάμπτοντας τα ηχητικά εφέ των Windows. Οι άλλες εφαρμογές σιγάζουν όσο παίζει το Absorb. Επανεκκινήστε το Absorb για εφαρμογή.';

  @override
  String get exclusiveAudioFallback =>
      'Η συσκευή ήχου σας απέρριψε τον αποκλειστικό ήχο, οπότε το Absorb παίζει σε κανονική λειτουργία';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return '$count νέα';
  }

  @override
  String seekUndoBackTo(String time) {
    return 'Πίσω στο $time';
  }

  @override
  String get goToTime => 'Μετάβαση σε χρόνο';

  @override
  String get goToTimeLabel => 'Χρόνος';

  @override
  String get goToTimeHint => 'ω:λλ:δδ, λλ:δδ ή λεπτά';

  @override
  String get goToTimeGo => 'Μετάβαση';

  @override
  String goToTimeLength(String time) {
    return 'Διάρκεια $time';
  }

  @override
  String get goToTimeInvalid => 'Πληκτρολογήστε χρόνο όπως 1:23:45, 23:45 ή 90';

  @override
  String goToTimePastEnd(String time) {
    return 'Ξεπερνά το τέλος ($time)';
  }

  @override
  String get desktopShortcutGoToTime =>
      'Μετάβαση σε χρόνο στο ανοιχτό πρόγραμμα αναπαραγωγής';

  @override
  String fellAsleepJumpBack(String time) {
    return 'Αποκοιμηθήκατε γύρω στις $time · Επιστροφή';
  }

  @override
  String get surpriseMe => 'Έκπληξη';

  @override
  String get surpriseMeNoneLeft =>
      'Έχετε ολοκληρώσει όλα τα βιβλία αυτής της βιβλιοθήκης';

  @override
  String get surpriseMeFailed =>
      'Δεν ήταν δυνατή η επιλογή βιβλίου. Δοκιμάστε ξανά.';

  @override
  String get surpriseMeOffline =>
      'Η Έκπληξη χρειάζεται σύνδεση με τον διακομιστή';

  @override
  String get surpriseMeBooksOnly =>
      'Η Έκπληξη επιλέγει βιβλία. Μεταβείτε σε βιβλιοθήκη βιβλίων.';

  @override
  String get autoDownloadNextInSeries =>
      'Αυτόματη λήψη του επόμενου βιβλίου της σειράς';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      'Όταν το βιβλίο που ακούτε έχει ολοκληρωθεί κατά 80% ή απομένει λιγότερο από μία ώρα. Ακολουθεί τη ρύθμιση «Μόνο Wi-Fi».';

  @override
  String get emptyStateBrowseLibrary => 'Περιήγηση στη βιβλιοθήκη';

  @override
  String get emptyStateClearSearch => 'Διαγραφή αναζήτησης';

  @override
  String get statsNoListeningYet => 'Καμία ακρόαση ακόμη';

  @override
  String get desktopShortcutQuickSwitcher =>
      'Γρήγορη εναλλαγή: βρείτε βιβλία ή μεταβείτε οπουδήποτε';

  @override
  String get desktopShortcutHelp => 'Εμφάνιση συντομεύσεων πληκτρολογίου';

  @override
  String get quickSwitcherTooltip => 'Γρήγορη εναλλαγή (Ctrl+K)';

  @override
  String get quickSwitcherHint =>
      'Αναζητήστε σε αυτή τη βιβλιοθήκη ή πληκτρολογήστε μια εντολή';

  @override
  String get quickSwitcherNoResults => 'Κανένα αποτέλεσμα';

  @override
  String get quickSwitcherGoHome => 'Μετάβαση στην Αρχική';

  @override
  String get quickSwitcherGoLibrary => 'Μετάβαση στη Βιβλιοθήκη';

  @override
  String get quickSwitcherGoAbsorbing => 'Μετάβαση στο Absorbing';

  @override
  String get quickSwitcherGoStats => 'Μετάβαση στα Στατιστικά';

  @override
  String get quickSwitcherGoSettings => 'Μετάβαση στις Ρυθμίσεις';

  @override
  String get quickSwitcherGoDownloads => 'Μετάβαση στις Λήψεις';

  @override
  String get quickSwitcherPlayPause => 'Αναπαραγωγή / παύση';

  @override
  String get quickSwitcherSleepTimer => 'Χρονοδιακόπτης ύπνου';

  @override
  String get quickSwitcherKeywordsAbsorbing =>
      'now playing player αναπαραγωγή ακρόαση τώρα αναπαράγεται';

  @override
  String get quickSwitcherKeywordsSettings =>
      'preferences options ρυθμίσεις προτιμήσεις επιλογές';

  @override
  String get quickSwitcherKeywordsDownloads =>
      'offline λήψεις ληφθέντα εκτός σύνδεσης';

  @override
  String get quickSwitcherKeywordsPlayPause =>
      'resume pause αναπαραγωγή παύση συνέχιση';

  @override
  String get quickSwitcherKeywordsSleepTimer =>
      'timer χρονοδιακόπτης ύπνος ύπνου';

  @override
  String get quickSwitcherKeywordsShortcuts =>
      'keys help hotkeys keyboard συντομεύσεις πλήκτρα βοήθεια πληκτρολόγιο';

  @override
  String get quickSwitcherKindAction => 'Ενέργεια';

  @override
  String get quickSwitcherKindBook => 'Βιβλίο';

  @override
  String get quickSwitcherKindPodcast => 'Podcast';

  @override
  String get quickSwitcherKindSeries => 'Σειρά';

  @override
  String get quickSwitcherKindAuthor => 'Συγγραφέας';

  @override
  String get alphabetScrollerLabel => 'Μετάβαση σε γράμμα';

  @override
  String get stepperDecrease => 'Μείωση';

  @override
  String get stepperIncrease => 'Αύξηση';

  @override
  String get statsStreakKeepGoing => 'Ακούστε 5 λεπτά σήμερα για να συνεχιστεί';

  @override
  String get statsStreakHowTo =>
      'Ακούστε 5 λεπτά την ημέρα για να χτίσετε σερί';

  @override
  String get statsDailyGoalSheetTitle => 'Ημερήσιος στόχος ακρόασης';

  @override
  String get statsDailyGoalSheetBody =>
      'Ένας δακτύλιος στην κάρτα σερί γεμίζει καθώς ακούτε σήμερα.';

  @override
  String get statsDailyGoalSet => 'Ορισμός ημερήσιου στόχου';

  @override
  String get statsMonthListened => 'Ακροάσεις';

  @override
  String get statsMonthTime => 'Χρόνος';

  @override
  String get statsMonthTopBook => 'Κορυφαίο βιβλίο';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αποτελέσματα',
      one: '1 αποτέλεσμα',
      zero: 'Κανένα αποτέλεσμα',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => 'Ταξινόμηση και ομαδοποίηση';

  @override
  String get bookmarksViewByBook => 'Ανά βιβλίο';

  @override
  String get bookmarksViewNewest => 'Πρώτα τα νεότερα';

  @override
  String get bookmarksViewPosition => 'Ανά θέση';

  @override
  String get bookmarksExportAction => 'Εξαγωγή σελιδοδεικτών';

  @override
  String get bookmarksExportDialogTitle =>
      'Αποθήκευση σελιδοδεικτών ως Markdown';

  @override
  String bookmarksExportSaved(String path) {
    return 'Οι σελιδοδείκτες αποθηκεύτηκαν στο $path';
  }

  @override
  String get bookmarksExportDownloaded => 'Οι σελιδοδείκτες λήφθηκαν';

  @override
  String get bookmarksExportFailed =>
      'Δεν ήταν δυνατή η εξαγωγή των σελιδοδεικτών';

  @override
  String get chapterSearchHint =>
      'Αναζήτηση κεφαλαίων ή πληκτρολόγηση χρόνου (1:23:00)';

  @override
  String get chapterSearchNoResults => 'Κανένα κεφάλαιο δεν ταιριάζει';

  @override
  String get dropUploadNotAllowed =>
      'Ο λογαριασμός σας δεν μπορεί να ανεβάζει αρχεία σε αυτόν τον διακομιστή';

  @override
  String get dropUploadNothingUsable =>
      'Κανένα από τα αρχεία που αφέθηκαν δεν μπορεί να ανέβει';

  @override
  String get dropUploadAlreadyOpen =>
      'Ολοκληρώστε ή κλείστε πρώτα την ανοιχτή μεταφόρτωση';

  @override
  String get remoteHostTitle => 'Έλεγχος από το τηλέφωνό σας';

  @override
  String get remoteHostSubtitleOff =>
      'Χρησιμοποιήστε το τηλέφωνό σας ως τηλεχειριστήριο για το Absorb σε αυτόν τον υπολογιστή';

  @override
  String remoteHostSubtitleOn(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count συνδεδεμένα τηλέφωνα',
      one: '1 συνδεδεμένο τηλέφωνο',
      zero: 'κανένα συνδεδεμένο τηλέφωνο',
    );
    return 'Ενεργό · $_temp0';
  }

  @override
  String get remoteHostSheetBody =>
      'Χρησιμοποιήστε το τηλέφωνό σας ως τηλεχειριστήριο για αυτόν τον υπολογιστή. Ο ήχος συνεχίζει να παίζει εδώ στον υπολογιστή και το τηλέφωνό σας δείχνει τι παίζει, με τα κουμπιά ελέγχου. Το τηλέφωνο και ο υπολογιστής πρέπει να είναι στο ίδιο Wi-Fi.';

  @override
  String get remoteHostSwitch => 'Ενεργοποίηση';

  @override
  String get remoteHostSwitchSubtitle =>
      'Τα Windows ίσως ζητήσουν να επιτρέψετε το Absorb Plus στο τείχος προστασίας την πρώτη φορά. Επιτρέψτε το.';

  @override
  String get remoteHostKeepOn => 'Να μένει ενεργό όταν ξεκινά το Absorb';

  @override
  String get remoteHostKeepOnSubtitle =>
      'Όταν είναι ανενεργό, απενεργοποιείται κάθε φορά που κλείνετε το Absorb.';

  @override
  String remoteHostPortsBusy(int first, int last) {
    return 'Δεν ήταν δυνατή η εκκίνηση: οι θύρες $first έως $last χρησιμοποιούνται όλες.';
  }

  @override
  String get remoteHostPairTitle => 'Σύζευξη του τηλεφώνου σας';

  @override
  String get remoteHostStep1 => '1. Ενεργοποιήστε το εδώ.';

  @override
  String get remoteHostStep2 =>
      '2. Σαρώστε τον κωδικό με την κάμερα του τηλεφώνου σας ή ανοίξτε το Absorb στο τηλέφωνο και μεταβείτε στις Ρυθμίσεις > Έλεγχος του υπολογιστή σας.';

  @override
  String get remoteHostStep3 =>
      '3. Εισαγάγετε τον κωδικό στο τηλέφωνο και μετά επιλέξτε Να επιτρέπεται εδώ.';

  @override
  String get remoteHostCodeLabel => 'Κωδικός';

  @override
  String remoteHostCodeExpires(String time) {
    return 'Ισχύει για $time';
  }

  @override
  String get remoteHostPairFirst => 'Σύζευξη τηλεφώνου';

  @override
  String get remoteHostPairAnother => 'Σύζευξη άλλης συσκευής';

  @override
  String get remoteHostPairingClosed =>
      'Η σύζευξη είναι κλειστή. Πατήστε το κουμπί για νέο κωδικό· ισχύει για 2 λεπτά και για μία συσκευή.';

  @override
  String get remoteHostFull =>
      'Έχουν συζευχθεί 5 συσκευές, το μέγιστο επιτρεπτό. Αφαιρέστε μία για να συζεύξετε άλλη.';

  @override
  String remoteHostAddresses(String addresses) {
    return 'Διεύθυνση αυτού του υπολογιστή: $addresses';
  }

  @override
  String get remoteHostNoAddress =>
      'Αυτός ο υπολογιστής δεν έχει διεύθυνση δικτύου αυτή τη στιγμή.';

  @override
  String get remoteHostNoDiscovery =>
      'Το τηλέφωνό σας ίσως δεν βρει αυτόν τον υπολογιστή μόνο του· πληκτρολογήστε τη διεύθυνση του υπολογιστή στο τηλέφωνο.';

  @override
  String get remoteHostConnectedTitle => 'Συνδεδεμένες τώρα';

  @override
  String get remoteHostPairedTitle => 'Συζευγμένες συσκευές';

  @override
  String get remoteHostNoDevices => 'Δεν υπάρχουν ακόμη συζευγμένες συσκευές';

  @override
  String get remoteHostUnusedNote =>
      'Μια συσκευή που δεν χρησιμοποιείται για 90 ημέρες αφαιρείται.';

  @override
  String remoteHostLastUsed(String date) {
    return 'Τελευταία χρήση $date';
  }

  @override
  String remoteHostConnectedFrom(String address, String time) {
    return '$address, συνδεδεμένη από $time';
  }

  @override
  String get remoteHostForget => 'Αφαίρεση';

  @override
  String get remoteHostForgetAll => 'Αφαίρεση όλων';

  @override
  String get remoteHostForgetAllConfirm =>
      'Αφαίρεση όλων των συζευγμένων συσκευών; Καθεμία πρέπει να συζευχθεί ξανά για να ελέγχει αυτόν τον υπολογιστή.';

  @override
  String get remoteHostDisconnect => 'Αποσύνδεση';

  @override
  String remoteHostAllowTitle(String name) {
    return 'Να επιτραπεί στη συσκευή ‘$name’ να ελέγχει το Absorb σε αυτόν τον υπολογιστή;';
  }

  @override
  String get remoteHostAllowBody =>
      'Επιτρέψτε μόνο συσκευή που γνωρίζετε. Μπορεί να παίξει, να κάνει παύση και να αλλάξει τι παίζει εδώ. Η μη απάντηση σημαίνει όχι.';

  @override
  String get remoteHostAllow => 'Να επιτρέπεται';

  @override
  String get remoteHostDeny => 'Άρνηση';

  @override
  String get remoteControlAnother => 'Έλεγχος του υπολογιστή σας';

  @override
  String get remoteControlAnotherSubtitle =>
      'Χρησιμοποιήστε αυτό το τηλέφωνο ως τηλεχειριστήριο για το Absorb στον υπολογιστή σας';

  @override
  String get remoteConnectIntro =>
      'Χρησιμοποιήστε αυτό το τηλέφωνο ως τηλεχειριστήριο για το Absorb στον υπολογιστή σας. Ο ήχος συνεχίζει να παίζει στον υπολογιστή. Το τηλέφωνο και ο υπολογιστής πρέπει να είναι στο ίδιο Wi-Fi. Στον υπολογιστή, ανοίξτε Ρυθμίσεις > Έλεγχος από το τηλέφωνό σας και ενεργοποιήστε το.';

  @override
  String get remoteConnectSearching => 'Αναζήτηση υπολογιστών στο Wi-Fi σας…';

  @override
  String get remoteConnectNoneFound =>
      'Δεν βρέθηκαν υπολογιστές. Στον υπολογιστή, ανοίξτε Ρυθμίσεις > Έλεγχος από το τηλέφωνό σας και ενεργοποιήστε το, ή εισαγάγετε τη διεύθυνσή του.';

  @override
  String get remoteConnectSearchAgain => 'Αναζήτηση ξανά';

  @override
  String get remoteConnectPaired => 'Συζευγμένος';

  @override
  String get remoteConnectFound => 'Στο Wi-Fi σας';

  @override
  String get remoteConnectEnterAddress => 'Εισαγωγή διεύθυνσης';

  @override
  String get remoteConnectAddressHint => '192.168.1.20:47390';

  @override
  String get remoteConnectAddressInvalid =>
      'Εισαγάγετε διεύθυνση όπως 192.168.1.20 ή 192.168.1.20:47390';

  @override
  String get remoteConnectNext => 'Επόμενο';

  @override
  String remoteConnectCodeTitle(String name) {
    return 'Σύζευξη με $name';
  }

  @override
  String get remoteConnectCodeHelp =>
      'Εισαγάγετε τον 6ψήφιο κωδικό που εμφανίζεται στον υπολογιστή στο Έλεγχος από το τηλέφωνό σας.';

  @override
  String get remoteConnectWaiting =>
      'Τώρα επιλέξτε Να επιτρέπεται στον υπολογιστή…';

  @override
  String get remoteConnectPair => 'Σύζευξη';

  @override
  String get remoteConnectForget => 'Αφαίρεση αυτού του υπολογιστή';

  @override
  String get remotePairBadCode =>
      'Ο κωδικός δεν είναι σωστός. Ελέγξτε τον υπολογιστή και δοκιμάστε ξανά.';

  @override
  String get remotePairExpired =>
      'Ο κωδικός έληξε. Λάβετε νέο στον υπολογιστή με το Σύζευξη άλλης συσκευής.';

  @override
  String get remotePairClosed =>
      'Η σύζευξη δεν είναι ανοιχτή στον υπολογιστή. Στον υπολογιστή, πατήστε Σύζευξη άλλης συσκευής για νέο κωδικό.';

  @override
  String get remotePairDenied =>
      'Ο υπολογιστής δεν επέτρεψε αυτό το τηλέφωνο. Δοκιμάστε ξανά και επιλέξτε Να επιτρέπεται στον υπολογιστή.';

  @override
  String get remotePairTooManyDevices =>
      'Αυτός ο υπολογιστής έχει ήδη 5 συζευγμένες συσκευές. Αφαιρέστε πρώτα μία στον υπολογιστή.';

  @override
  String get remotePairTooMany =>
      'Πάρα πολλές προσπάθειες. Περιμένετε ένα λεπτό και δοκιμάστε ξανά.';

  @override
  String get remotePairUnreachable =>
      'Το τηλέφωνο και ο υπολογιστής δεν είναι στο ίδιο Wi-Fi, ή ο υπολογιστής δεν το έχει ενεργοποιήσει. Ελέγξτε και τα δύο και δοκιμάστε ξανά.';

  @override
  String get remotePairFailed => 'Η σύζευξη δεν λειτούργησε. Δοκιμάστε ξανά.';

  @override
  String get remoteVersionMismatch =>
      'Ενημερώστε το Absorb Plus και στις δύο συσκευές για να χρησιμοποιήσετε το τηλεχειριστήριο.';

  @override
  String get remoteConnecting => 'Σύνδεση…';

  @override
  String get remoteReconnecting => 'Επανασύνδεση…';

  @override
  String get remoteUnreachableHint =>
      'Δεν είναι δυνατή η επικοινωνία με τον υπολογιστή. Ελέγξτε ότι είναι ενεργός, ότι το Absorb είναι ανοιχτό και ότι και οι δύο συσκευές είναι στο ίδιο Wi-Fi.';

  @override
  String remoteNothingPlaying(String name) {
    return 'Δεν παίζει τίποτα στο $name';
  }

  @override
  String get remoteNothingLoaded => 'Ξεκινήστε πρώτα κάτι στον υπολογιστή.';

  @override
  String get remoteCommandFailed => 'Ο υπολογιστής δεν μπόρεσε να το κάνει.';

  @override
  String get remoteNotOnList =>
      'Αυτό το βιβλίο δεν υπάρχει πια στη λίστα του υπολογιστή.';

  @override
  String get remoteDisconnectedByHost =>
      'Ο υπολογιστής αποσύνδεσε αυτή τη συσκευή.';

  @override
  String get remoteUnauthorized =>
      'Ο υπολογιστής δεν αναγνωρίζει πια αυτή τη συσκευή. Συζεύξτε την ξανά.';

  @override
  String get remotePairAgain => 'Νέα σύζευξη';

  @override
  String get remoteConnectAgain => 'Σύνδεση ξανά';

  @override
  String get remotePlay => 'Αναπαραγωγή';

  @override
  String get remotePause => 'Παύση';

  @override
  String get remoteStop => 'Διακοπή';

  @override
  String get remotePreviousChapter => 'Προηγούμενο κεφάλαιο';

  @override
  String get remoteNextChapter => 'Επόμενο κεφάλαιο';

  @override
  String remoteSkipBack(int seconds) {
    return 'Πίσω $seconds δευτερόλεπτα';
  }

  @override
  String remoteSkipForward(int seconds) {
    return 'Εμπρός $seconds δευτερόλεπτα';
  }

  @override
  String get remoteSpeed => 'Ταχύτητα';

  @override
  String get remoteSpeedSlower => 'Πιο αργά';

  @override
  String get remoteSpeedFaster => 'Πιο γρήγορα';

  @override
  String get remoteSleepTimer => 'Χρονοδιακόπτης ύπνου';

  @override
  String remoteSleepMinutes(int minutes) {
    return '$minutes λεπτά';
  }

  @override
  String get remoteSleepEndOfChapter => 'Τέλος κεφαλαίου';

  @override
  String get remoteSleepEndOfEpisode => 'Τέλος επεισοδίου';

  @override
  String remoteSleepChapters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count κεφάλαια',
      one: '1 κεφάλαιο',
    );
    return '$_temp0';
  }

  @override
  String get remoteSleepCancel => 'Απενεργοποίηση χρονοδιακόπτη ύπνου';

  @override
  String get remoteVolume => 'Ένταση';

  @override
  String get remoteMute => 'Σίγαση';

  @override
  String get remoteUnmute => 'Κατάργηση σίγασης';

  @override
  String get remoteChapters => 'Κεφάλαια';

  @override
  String get remoteBookmark => 'Σελιδοδείκτης';

  @override
  String get remoteBookmarkTitle => 'Προσθήκη σελιδοδείκτη εδώ';

  @override
  String get remoteBookmarkNoteHint => 'Σημείωση (προαιρετική)';

  @override
  String get remoteBookmarkAdd => 'Προσθήκη';

  @override
  String get remoteBookmarkAdded =>
      'Ο σελιδοδείκτης προστέθηκε στον υπολογιστή';

  @override
  String get remoteContinueListening => 'Συνέχεια ακρόασης';

  @override
  String get remoteContinueEmpty =>
      'Δεν υπάρχει τίποτα σε εξέλιξη στον υπολογιστή.';

  @override
  String remoteTimeLeft(String time) {
    return 'απομένουν $time';
  }

  @override
  String remoteChapterTimeLeft(String time) {
    return 'απομένουν $time στο κεφάλαιο';
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
  String get remoteCustomize => 'Προσαρμογή';

  @override
  String get remoteCustomizeTitle => 'Προσαρμογή του τηλεχειριστηρίου';

  @override
  String get remoteCustomizeHintPortrait =>
      'Επεξεργασία της κατακόρυφης διάταξης. Σύρετε ένα μπλοκ από τη λαβή του, ή κρατήστε το πατημένο, για να το μετακινήσετε. Γυρίστε το τηλέφωνο για επεξεργασία της οριζόντιας.';

  @override
  String get remoteCustomizeHintLandscape =>
      'Επεξεργασία της οριζόντιας διάταξης. Σύρετε μπλοκ μέσα σε μία ή ανάμεσα στις δύο στήλες. Γυρίστε το τηλέφωνο για επεξεργασία της κατακόρυφης.';

  @override
  String get remoteCustomizeReset => 'Επαναφορά προεπιλογής';

  @override
  String get remoteCustomizePresets => 'Προεπιλογές';

  @override
  String get remoteCustomizeAddTitle => 'Προσθήκη στην οθόνη';

  @override
  String get remoteCustomizeDropHere => 'Αφήστε μπλοκ εδώ';

  @override
  String get remoteCustomizeMove => 'Σύρετε για μετακίνηση';

  @override
  String get remoteCustomizeEmpty =>
      'Δεν υπάρχει τίποτα σε αυτή την οθόνη. Πατήστε Προσαρμογή για να προσθέσετε χειριστήρια.';

  @override
  String get remotePresetDefault => 'Προεπιλογή';

  @override
  String get remotePresetMinimal => 'Ελάχιστη';

  @override
  String get remotePresetNightstand => 'Κομοδίνο';

  @override
  String get remotePresetFull => 'Πλήρης';

  @override
  String get remoteBlockCover => 'Εξώφυλλο';

  @override
  String get remoteBlockTitle => 'Τίτλος και συγγραφέας';

  @override
  String get remoteBlockChapterTitle => 'Τίτλος κεφαλαίου';

  @override
  String get remoteBlockProgress => 'Γραμμή προόδου';

  @override
  String get remoteBlockTimeLeft => 'Χρόνος που απομένει';

  @override
  String get remoteBlockTransport => 'Κουμπιά αναπαραγωγής';

  @override
  String get remoteBlockClock => 'Ρολόι';

  @override
  String get remoteBlockSpacer => 'Κενό';

  @override
  String get remoteSizeSmall => 'Μικρό';

  @override
  String get remoteSizeMedium => 'Μεσαίο';

  @override
  String get remoteSizeLarge => 'Μεγάλο';

  @override
  String get remoteSizeCompact => 'Συμπαγές';

  @override
  String get remoteSizeNormal => 'Κανονικό';

  @override
  String get remoteDisplayBackground => 'Φόντο';

  @override
  String get remoteDisplayBackgroundTheme => 'Θέμα';

  @override
  String get remoteDisplayBackgroundCover => 'Θολωμένο εξώφυλλο';

  @override
  String get remoteDisplayBackgroundBlack => 'Μαύρο';

  @override
  String get remoteDisplayTextSize => 'Μέγεθος κειμένου';

  @override
  String get remoteDisplayTextHuge => 'Τεράστιο';

  @override
  String get remoteDisplay24Hour => 'Ρολόι 24 ωρών';

  @override
  String get remoteDisplayDim => 'Μείωση φωτεινότητας οθόνης μετά από';

  @override
  String get remoteDisplayDimNever => 'Ποτέ';

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
      'remote phone control pc link pair τηλεχειριστήριο τηλέφωνο έλεγχος υπολογιστής σύζευξη';

  @override
  String get quickSwitcherKeywordsSurprise =>
      'random pick shuffle τυχαίο επιλογή έκπληξη';

  @override
  String get developerModeOn => 'Η λειτουργία προγραμματιστή είναι ενεργή';

  @override
  String get developerModeAlreadyOn =>
      'Η λειτουργία προγραμματιστή είναι ήδη ενεργή';

  @override
  String get developerTitle => 'Προγραμματιστής';

  @override
  String get developerSubtitle =>
      'Δοκιμαστικές εκδόσεις και εργαλεία ανάπτυξης';

  @override
  String get developerModeSwitch => 'Λειτουργία προγραμματιστή';

  @override
  String get developerModeSwitchSubtitle =>
      'Η απενεργοποίηση κρύβει αυτή τη σελίδα. Πατήστε 7 φορές την έκδοση για να επανέλθει.';

  @override
  String get testChannelTitle => 'Δοκιμαστικό κανάλι';

  @override
  String get testChannelSubtitle =>
      'Εγκατάσταση της νεότερης δοκιμαστικής έκδοσης';

  @override
  String get testChannelUnavailable =>
      'Οι δοκιμαστικές εκδόσεις αφορούν μόνο την έκδοση GitHub για Android.';

  @override
  String get testChannelCodeLabel => 'Κωδικός δοκιμαστικού καναλιού';

  @override
  String get testChannelUnlock => 'Ξεκλείδωμα';

  @override
  String get testChannelUnlocked => 'Το δοκιμαστικό κανάλι ξεκλειδώθηκε';

  @override
  String get testChannelWrongCode => 'Ο κωδικός δεν είναι σωστός';

  @override
  String get testChannelLaunchCheck =>
      'Έλεγχος για δοκιμαστικές εκδόσεις κατά την εκκίνηση';

  @override
  String get testChannelLaunchCheckSubtitle =>
      'Ζητά εγκατάσταση νεότερης δοκιμαστικής έκδοσης όταν ξεκινά η εφαρμογή';

  @override
  String get testChannelWarning =>
      'Οι δοκιμαστικές εκδόσεις είναι ημιτελείς και μπορεί να προκαλέσουν προβλήματα. Αντικαθιστούν την εγκατεστημένη εφαρμογή και διατηρούν τα δεδομένα σας.';

  @override
  String testChannelInstalled(String version) {
    return 'Εγκατεστημένη: $version';
  }

  @override
  String testChannelNewest(String version) {
    return 'Νεότερη δοκιμαστική έκδοση: $version';
  }

  @override
  String get testChannelNone => 'Δεν υπάρχει ακόμη δοκιμαστική έκδοση';

  @override
  String get testChannelUpToDate => 'Ενημερωμένη';

  @override
  String get testChannelInstall => 'Εγκατάσταση';

  @override
  String get testChannelCheckNow => 'Έλεγχος τώρα';

  @override
  String get testChannelNotes => 'Τι περιλαμβάνει';

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
  String get testBuildAvailable => 'Διαθέσιμη δοκιμαστική έκδοση';

  @override
  String testBuildDialogContent(String latest, String current) {
    return 'Κυκλοφόρησε η δοκιμαστική έκδοση $latest.\n\nΕίστε στην $current.';
  }

  @override
  String testBuildPackageLabel(int build) {
    return 'Δοκιμαστική έκδοση $build';
  }

  @override
  String get githubSignIn => 'Σύνδεση με GitHub';

  @override
  String get githubSignInSubtitle =>
      'Οι δοκιμαστικές εκδόσεις είναι ιδιωτικές: συνδεθείτε για να τις λάβετε';

  @override
  String get githubSignInNotSetUp =>
      'Η σύνδεση με GitHub δεν έχει ρυθμιστεί ακόμη σε αυτή την έκδοση';

  @override
  String get githubSignInAgain => 'Σύνδεση ξανά';

  @override
  String get githubSignInExpired => 'Η σύνδεσή σας στο GitHub έληξε';

  @override
  String githubSignedInAs(String login) {
    return 'Συνδεθήκατε στο GitHub ως $login';
  }

  @override
  String get githubSignedIn => 'Συνδεθήκατε στο GitHub';

  @override
  String get githubSignOut => 'Αποσύνδεση';

  @override
  String get githubSignInEnterCode => 'Εισαγάγετε αυτόν τον κωδικό στο GitHub:';

  @override
  String get githubSignInOpen => 'Άνοιγμα github.com/login/device';

  @override
  String get githubSignInCopyCode => 'Αντιγραφή κωδικού';

  @override
  String get githubSignInCodeCopied => 'Ο κωδικός αντιγράφηκε';

  @override
  String get githubSignInWaiting => 'Αναμονή για την έγκρισή σας στο GitHub...';

  @override
  String get githubSignInDenied => 'Η σύνδεση ακυρώθηκε στο GitHub.';

  @override
  String get githubSignInCodeExpired => 'Ο κωδικός έληξε. Δοκιμάστε ξανά.';

  @override
  String get githubSignInFailed =>
      'Δεν ήταν δυνατή η σύνδεση στο GitHub. Δοκιμάστε ξανά.';

  @override
  String get githubSignInTryAgain => 'Δοκιμάστε ξανά';

  @override
  String get testChannelSignInNeeded =>
      'Συνδεθείτε με GitHub για να λάβετε δοκιμαστικές εκδόσεις';

  @override
  String get downloadEtaUnderMinute => 'απομένει <1 λεπτό';

  @override
  String downloadEtaMinutes(int minutes) {
    return 'απομένουν $minutes λεπτά';
  }

  @override
  String downloadEtaHours(int hours) {
    return 'απομένουν $hours ώρες';
  }

  @override
  String downloadEtaHoursMinutes(int hours, int minutes) {
    return 'απομένουν $hours ώρ. $minutes λεπτά';
  }

  @override
  String get sameSpeedAllBooksTitle => 'Ίδια ταχύτητα για κάθε βιβλίο';

  @override
  String get sameSpeedAllBooksSubtitle =>
      'Κάθε βιβλίο παίζει με την προεπιλεγμένη ταχύτητα και η αλλαγή ταχύτητας στο πρόγραμμα αναπαραγωγής την αλλάζει για όλα τα βιβλία. Ανενεργό: κάθε βιβλίο (ή η σειρά του) κρατά τη δική του ταχύτητα.';

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
