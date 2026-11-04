// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'A B S O R B';

  @override
  String get online => 'Connecté';

  @override
  String get offline => 'Déconnecté';

  @override
  String get stillOffline =>
      'Toujours déconnecté. Touchez pour essayer encore.';

  @override
  String get retry => 'Réessayer';

  @override
  String get listsNone => 'Pas de collection ni de liste de lecture';

  @override
  String get listsNoneHint =>
      'Les collections et les listes de lecture sont faites sur votre serveur Audiobookshelf et apparaissent ici.';

  @override
  String get listsLoadFailed => 'Impossible de charger vos listes';

  @override
  String get listsLoadFailedHint =>
      'Absorb n\'a pas pu accéder à votre serveur pour les collections et les playlists.';

  @override
  String get listsNoneBookOrbit => 'Aucune collection ni Smart Scope';

  @override
  String get listsNoneHintBookOrbit =>
      'Les collections et les Smart Scopes sont créés sur votre serveur BookOrbit et apparaissent ici.';

  @override
  String get listsLoadFailedHintBookOrbit =>
      'Absorb n\'a pas pu joindre votre serveur pour les collections et les Smart Scopes.';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Effacer';

  @override
  String get remove => 'Retirer';

  @override
  String get save => 'Enregistrer';

  @override
  String get done => 'Fait';

  @override
  String get edit => 'Modifier';

  @override
  String get search => 'Rechercher';

  @override
  String get apply => 'Appliquer';

  @override
  String get enable => 'Activé';

  @override
  String get clear => 'Effacer';

  @override
  String get off => 'Arrêt';

  @override
  String get disabled => 'Désactivé';

  @override
  String get later => 'Plus tard';

  @override
  String get whatsNewTitle => 'Absorb a été mis à jour';

  @override
  String whatsNewContent(String version) {
    return 'Vous êtes maintenant sur la version $version.';
  }

  @override
  String get whatsNewButton => 'Voir les nouveautés';

  @override
  String get whatsNewKeepShowing => 'Afficher après chaque mise à jour';

  @override
  String get whatsNewKeepShowingHint =>
      'Vous pouvez le réactiver dans les Paramètres';

  @override
  String get settingsWhatsNew =>
      'Afficher les nouveautés après les mises à jour';

  @override
  String get settingsWhatsNewSubtitle =>
      'Après une mise à jour, afficher les nouveautés dans l\'app';

  @override
  String get gotIt => 'Ok';

  @override
  String get betaLoggingTitle => 'Les journaux sont activés';

  @override
  String get betaLoggingContent =>
      'Comme il s\'agit d\'une bêta, Absorb conserve désormais des journaux pour aider à repérer les problèmes. Ils restent sur cet appareil sauf si vous les partagez.\n\nVous pouvez les envoyer ou les désactiver dans les Paramètres, sous Problèmes et assistance. Si vous les désactivez, les prochaines bêtas les laisseront désactivés.';

  @override
  String get preview => 'Aperçu';

  @override
  String get or => 'ou';

  @override
  String get file => 'Fichier';

  @override
  String get more => 'Plus';

  @override
  String get unknown => 'Inconnu';

  @override
  String get untitled => 'Sans titre';

  @override
  String get noThanks => 'Non merci';

  @override
  String get stay => 'Rester';

  @override
  String get homeTitle => 'Accueil';

  @override
  String get continueListening => 'Continuer l\'écoute';

  @override
  String get continueReading => 'Continuer la lecture';

  @override
  String get continueSeries => 'Continuer les séries';

  @override
  String get recentlyAdded => 'Ajouté récemment';

  @override
  String get listenAgain => 'Écouter à nouveau';

  @override
  String get discover => 'Découvrir';

  @override
  String get newEpisodes => 'Nouveaux épisodes';

  @override
  String get downloads => 'Téléchargements';

  @override
  String get noDownloadedBooks => 'Aucun livre téléchargé';

  @override
  String get yourLibraryIsEmpty => 'Votre bibliothèque est vide';

  @override
  String get downloadBooksWhileOnline =>
      'Télécharger des livres en ligne pour écouter hors ligne';

  @override
  String get customizeHome => 'Personnaliser l\'accueil';

  @override
  String get dragToReorderTapEye =>
      'Faites glisser pour réorganiser, appuyez sur l\'œil pour afficher/masquer';

  @override
  String get loginTagline => 'Commencer à Absorber';

  @override
  String get loginConnectToServer => 'Se connecter au serveur';

  @override
  String get loginServerAddress => 'Adresse du serveur';

  @override
  String get loginServerHint => 'mon.serveur.fr';

  @override
  String get loginServerHelper => 'IP + port (ex : 192.168.1.5:13378)';

  @override
  String get loginCouldNotReachServer =>
      'Impossible de se connecter au serveur';

  @override
  String get loginAdvanced => 'Avancé';

  @override
  String get loginCustomHttpHeaders => 'Entêtes HTTP personnalisés';

  @override
  String get loginCustomHeadersDescription =>
      'Pour les tunnels Cloudflare ou les reverse proxies qui nécessitent des en-têtes supplémentaires. Ajoutez les en-têtes avant d’entrer l’URL de votre serveur.';

  @override
  String get loginHeaderName => 'Nom de l\'en-tête';

  @override
  String get loginHeaderValue => 'Valeur';

  @override
  String get loginAddHeader => 'Ajouter un en-tête';

  @override
  String get loginSelfSignedCertificates => 'Certificat auto-signé';

  @override
  String get loginTrustAllCertificates =>
      'Faire confiance à tous les certificats (pour les configurations autosignées ou avec CA personnalisé)';

  @override
  String get loginApiKey => 'Clé API';

  @override
  String get loginApiKeyDescription =>
      'Utiliser une clé API générée par l’administrateur plutôt qu’un nom d’utilisateur et un mot de passe. Utile lorsque le rafraîchissement du jeton échoue pour votre compte.';

  @override
  String get loginWaitingForSso => 'En attente du SSO...';

  @override
  String get loginRedirectUri => 'URI de redirection : audiobookshelf://oauth';

  @override
  String get loginOrSignInManually => 'ou se connecter manuellement';

  @override
  String get loginUsername => 'Utilisateur';

  @override
  String get loginUsernameRequired => 'Entrez votre nom d\'utilisateur';

  @override
  String get loginPassword => 'Mot de passe';

  @override
  String get loginSignIn => 'Se connecter';

  @override
  String loginSignInAs(String username) {
    return 'Se connecter en tant que $username ?';
  }

  @override
  String get loginSignInToServer => 'Se connecter à ce serveur ?';

  @override
  String loginSignedInAs(String username) {
    return 'Connecté en tant que $username';
  }

  @override
  String get adminCreateSetupFile => 'Partager la connexion';

  @override
  String adminSetupFileDescription(String username) {
    return 'Crée un lien de connexion privé pour $username qui ne fonctionne que dans l\'application Absorb.';
  }

  @override
  String get adminSetupFileServerUrl =>
      'URL du serveur que le nouvel utilisateur va utiliser';

  @override
  String get adminSetupFileNoteWithHeaders =>
      'Une clé API dédiée et vos en-têtes personnalisés seront inclus afin qu\'ils puissent atteindre le serveur. Traitez le lien comme un mot de passe.';

  @override
  String get adminSetupFileNote =>
      'Une clé API dédiée sera incluse. Traitez le lien comme un mot de passe.';

  @override
  String get adminSetupFileCreate => 'Créer un lien';

  @override
  String get adminSetupFileSaveTitle =>
      'Enregistrer le fichier de configuration';

  @override
  String get adminSetupFileKeyError =>
      'Impossible de créer une clé API pour cet utilisateur';

  @override
  String adminSetupFileSaved(String username) {
    return 'Fichier de configuration enregistré pour $username';
  }

  @override
  String adminSetupFileFailed(String error) {
    return 'Impossible de créer la connexion : $error';
  }

  @override
  String get setupLinkShareTitle => 'Partager la connexion';

  @override
  String setupLinkShareDescription(String username) {
    return 'Envoyez ce lien privé ou demandez-leur de scanner le code QR pour se connecter en tant que $username.';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return 'N\'importe qui avec ce lien peut se connecter en tant que $username. Traitez-le comme un mot de passe.';
  }

  @override
  String get setupLinkShare => 'Partager le lien';

  @override
  String get setupLinkCopy => 'Copier le lien';

  @override
  String get setupLinkCopied => 'Lien de connexion copié';

  @override
  String get setupLinkSaveFile => 'Enregistrer le fichier de configuration';

  @override
  String get setupLinkQrError =>
      'Ce lien de configuration est trop volumineux pour un code QR. Partagez le lien à la place.';

  @override
  String setupLinkShareSubject(String username) {
    return 'Connexion à Absorb pour $username';
  }

  @override
  String get setupLinkConfirmTitle => 'Se connecter avec ce lien ?';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return 'Se Connecter à $server en tant que $username ? Ne continuez que si vous faites confiance à celui qui vous a envoyé ce lien.';
  }

  @override
  String get setupLinkInvalid =>
      'Ce lien de connexion est invalide ou incomplet';

  @override
  String get setupLinkSigningIn => 'Vérification du lien de connexion...';

  @override
  String get loginPlayDownloads => 'Lire vos téléchargements';

  @override
  String signedOutDownloadsNote(String username) {
    return 'Vous êtes déconnecté. Tout ce que vous écoutez ici est synchronisé avec $username à votre prochaine connexion.';
  }

  @override
  String get loginPasteLink => 'Coller le lien de connexion';

  @override
  String get loginPasteLinkHelp =>
      'Collez le lien complet de connexion que vous avez reçu. Traitez-le comme un mot de passe.';

  @override
  String get loginFailed => 'Échec de connexion';

  @override
  String get loginSsoFailed => 'La connexion SSO a échoué ou a été annulée';

  @override
  String get loginSsoAuthFailed =>
      'Échec de l\'authentification SSO. Veuillez réessayer.';

  @override
  String get loginRestoreFromBackup => 'Importer';

  @override
  String get loginInvalidBackupFile => 'Fichier de sauvegarde invalide';

  @override
  String get loginRestoreBackupTitle => 'Restaurer la sauvegarde ?';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return 'Tous les paramètres ainsi que $count compte(s) sauvegardé(s) seront restaurés. Vous serez connecté automatiquement.';
  }

  @override
  String get loginRestoreBackupNoAccounts =>
      'Tous les paramètres seront restaurés. Aucun compte n\'était inclus dans cette sauvegarde.';

  @override
  String get loginRestore => 'Restaurer';

  @override
  String loginRestoredAndSignedIn(String username) {
    return 'Paramètres restaurés, connecté en tant que $username';
  }

  @override
  String get loginSessionExpired =>
      'Paramètres restaurés. Session expirée - se connecter pour continuer.';

  @override
  String get loginSettingsRestored => 'Paramètres restaurés';

  @override
  String loginRestoreFailed(String error) {
    return 'Échec de la restauration : $error';
  }

  @override
  String get loginSavedAccounts => 'comptes enregistrés';

  @override
  String get libraryTitle => 'Bibliothèque';

  @override
  String get librarySearchBooksHint =>
      'Rechercher par livres, séries, auteurs, narrateurs ...';

  @override
  String get librarySearchShowsHint =>
      'Rechercher des séries et des épisodes...';

  @override
  String get libraryTabLibrary => 'Bibliothèque';

  @override
  String get libraryTabSeries => 'Séries';

  @override
  String get libraryTabAuthors => 'Auteurs';

  @override
  String get libraryTabNarrators => 'Narrateurs';

  @override
  String get libraryNoBooks => 'Aucun livre trouvé';

  @override
  String get libraryNoUnfinishedBooks => 'Aucun livre inachevé';

  @override
  String get libraryNoBooksInProgress => 'Aucun livre en cours de lecture';

  @override
  String get libraryNoFinishedBooks => 'Aucun livre achevé';

  @override
  String get libraryAllBooksStarted => 'Tous les livres ont été commencés';

  @override
  String get libraryNoDownloadedBooks => 'Aucun livre téléchargé';

  @override
  String get libraryNoSeriesFound => 'Aucune série trouvée';

  @override
  String get libraryNoBooksWithEbooks => 'Aucun livre avec eBooks';

  @override
  String get libraryNoBooksMissingMetadata =>
      'Cette métadonnée n\'est absente d\'aucun livre';

  @override
  String get libraryNoItemsMatchingFilter =>
      'Aucun élément ne correspond à ce filtre';

  @override
  String libraryNoBooksInGenre(String genre) {
    return 'Aucun livre du genre \"$genre\"';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return 'Aucun livre étiqueté « $tag »';
  }

  @override
  String get libraryClearFilter => 'Effacer le filtre';

  @override
  String get libraryNoAuthorsFound => 'Aucun auteur trouvé';

  @override
  String get libraryNoNarratorsFound => 'Aucun narrateur trouvé';

  @override
  String get libraryNoResults => 'Aucun résultat';

  @override
  String get librarySearchBooks => 'Livres';

  @override
  String get librarySearchShows => 'Séries';

  @override
  String get librarySearchEpisodes => 'Épisodes';

  @override
  String get librarySearchSeries => 'Séries';

  @override
  String get librarySearchAuthors => 'Auteurs';

  @override
  String get librarySearchTags => 'Tags';

  @override
  String get librarySearchGenres => 'Genres';

  @override
  String librarySeriesCount(int count) {
    return '$count séries';
  }

  @override
  String libraryAuthorsCount(int count) {
    return '$count auteurs';
  }

  @override
  String libraryNarratorsCount(int count) {
    return '$count narrateurs';
  }

  @override
  String libraryBooksCount(int loaded, int total) {
    return '$loaded/$total livres';
  }

  @override
  String get sort => 'Trier';

  @override
  String get filter => 'Filtrer';

  @override
  String get filterActive => 'Filtrer';

  @override
  String get name => 'Nom';

  @override
  String get title => 'Titre';

  @override
  String get author => 'Auteur';

  @override
  String get dateAdded => 'Date d\'ajout';

  @override
  String get numberOfBooks => 'Nombre de livres';

  @override
  String get sortTotalDuration => 'Durée totale';

  @override
  String get sortLastBookAdded => 'Dernier livre ajouté';

  @override
  String get sortLastBookUpdated => 'Dernier livre mis à jour';

  @override
  String get publishedYear => 'Année de publication';

  @override
  String get duration => 'Durée';

  @override
  String get random => 'Aléatoire';

  @override
  String get collapseSeries => 'Replier les séries';

  @override
  String get notFinished => 'Non terminé';

  @override
  String get inProgress => 'En cours';

  @override
  String get filterFinished => 'Fini';

  @override
  String get notStarted => 'Non commencé';

  @override
  String get downloaded => 'Téléchargé';

  @override
  String get hasEbook => 'A un eBook';

  @override
  String get noEbook => 'Aucun eBook';

  @override
  String get hasSupplementaryEbook => 'A un eBook supplémentaire';

  @override
  String get noSupplementaryEbook => 'Pas de eBook supplémentaire';

  @override
  String get noSeries => 'Pas de série';

  @override
  String get publishedDecade => 'Décennie de publication';

  @override
  String get tracks => 'Pistes';

  @override
  String get noTracks => 'Aucune piste';

  @override
  String get singleTrack => 'Piste unique';

  @override
  String get multipleTracks => 'Multiples pistes';

  @override
  String get abridged => 'Abrégé';

  @override
  String get issues => 'Problèmes';

  @override
  String get rssFeedOpen => 'Flux RSS ouvert';

  @override
  String get explicitContent => 'Explicite';

  @override
  String get missingMetadata => 'Métadonnées manquantes';

  @override
  String get genre => 'Genre';

  @override
  String get tag => 'Mot-clé';

  @override
  String get clearFilter => 'Supprimer le filtre';

  @override
  String get noGenresFound => 'Aucun genre trouvé';

  @override
  String get noTagsFound => 'Aucun mot-clé trouvé';

  @override
  String get asc => 'Croissant';

  @override
  String get desc => 'Décroissant';

  @override
  String get fileSize => 'Taille du fichier';

  @override
  String get lastUpdated => 'Dernière mise à jour';

  @override
  String get fileCreated => 'Fichier créé';

  @override
  String get lastModified => 'Dernière modification';

  @override
  String get authorFirstLast => 'Auteur (Prénom Nom)';

  @override
  String get authorLastFirst => 'Auteur (Nom, Prénom)';

  @override
  String get progressSort => 'Progression';

  @override
  String get dateStarted => 'Date de démarrage';

  @override
  String get dateFinished => 'Date de complétion';

  @override
  String get episodeCount => 'Nombre d\'épisodes';

  @override
  String get sequence => 'Séquence de séries';

  @override
  String get absorbingTitle => 'Lecture';

  @override
  String get absorbingStop => 'Stop';

  @override
  String get absorbingManageQueue => 'Gérer la file d\'attente';

  @override
  String get absorbingDone => 'Fait';

  @override
  String get absorbingNoDownloadedEpisodes => 'Aucun épisode téléchargé';

  @override
  String get absorbingNoDownloadedBooks => 'Aucun livre téléchargé';

  @override
  String get absorbingNothingPlayingYet => 'Rien en cours de lecture';

  @override
  String get absorbingNothingAbsorbingYet => 'Rien d\'absorbé pour le moment';

  @override
  String get absorbingDownloadEpisodesToListen =>
      'Télécharger les épisodes pour les écouter hors ligne';

  @override
  String get absorbingDownloadBooksToListen =>
      'Télécharger les livres pour les écouter hors ligne';

  @override
  String get absorbingStartEpisodeFromShows =>
      'Démarrer un épisode depuis l\'onglet Séries';

  @override
  String get absorbingStartBookFromLibrary =>
      'Démarrer un livre depuis l\'onglet Bibliothèque';

  @override
  String get carModeTitle => 'Mode Auto';

  @override
  String get carModeNoBookLoaded => 'Aucun livre chargé';

  @override
  String get carModeBookLabel => 'Livre';

  @override
  String get carModeChapterLabel => 'Chapitre';

  @override
  String get carModeBookmarkDefault => 'Signet';

  @override
  String get carModeBookmarkAdded => 'Signet ajouté';

  @override
  String get downloadsTitle => 'Téléchargements';

  @override
  String get downloadsCancelSelection => 'Annuler la sélection';

  @override
  String get downloadsSelect => 'Sélectionner';

  @override
  String get downloadsNoDownloads => 'Aucun téléchargement';

  @override
  String get downloadsDownloading => 'Téléchargement';

  @override
  String get downloadsQueued => 'En file d\'attente';

  @override
  String get downloadsCompleted => 'Terminé';

  @override
  String get downloadsEbooks => 'Ebooks';

  @override
  String get downloadsWaiting => 'En attente...';

  @override
  String get downloadsCancel => 'Annuler';

  @override
  String get downloadsDelete => 'Supprimer';

  @override
  String downloadsDeleteCount(int count) {
    return 'Supprimer $count téléchargement(s) ?';
  }

  @override
  String get downloadsDeleteContent =>
      'Les fichiers téléchargés seront supprimés de cet appareil.';

  @override
  String downloadsDeletedCount(int count) {
    return '$count téléchargement(s) supprimés';
  }

  @override
  String get downloadsRemoveTitle => 'Retirer le téléchargement ?';

  @override
  String downloadsRemoveContent(String title) {
    return 'Supprimer \"$title\" de cet appareil ?';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return '\"$title\" supprimé';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return 'Impossible de télécharger « $title » - l\'un de ses fichiers n\'est pas sur le serveur. Une analyse de la bibliothèque peut régler le problème.';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return 'Impossible de télécharger « $title » - espace de stockage insuffisant';
  }

  @override
  String downloadFailedPermission(String title) {
    return 'Impossible de télécharger « $title » - vérifiez l\'emplacement des téléchargements dans les Paramètres';
  }

  @override
  String downloadFailedGeneric(String title) {
    return 'Impossible de télécharger « $title »';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '$count sélectionné(s)';
  }

  @override
  String get bookmarksTitle => 'Tous les signets';

  @override
  String get bookmarksTabBookmarks => 'Signets';

  @override
  String get bookmarksTabHighlights => 'Temps forts';

  @override
  String get highlightOpenInBook => 'Ouvrir dans le livre';

  @override
  String get highlightDeleteAction => 'Supprimer le temps fort';

  @override
  String get highlightDeleted => 'Temps fort supprimé';

  @override
  String highlightsDeleteCount(int count) {
    return 'Supprimer les $count temps fort(s) ?';
  }

  @override
  String highlightsDeletedCount(int count) {
    return 'Supprimer les $count temps fort(s)';
  }

  @override
  String get quoteShareTitle => 'Partager la citation';

  @override
  String get quoteShareAction => 'Partager';

  @override
  String get quoteShareFailed => 'Impossible de créer l\'image de la citation';

  @override
  String get quoteShapePortrait => 'Portrait';

  @override
  String get quoteShapeSquare => 'Carré';

  @override
  String get quoteShapeStory => 'Histoire';

  @override
  String get quoteStyleBlur => 'Flouté';

  @override
  String get quoteStyleDim => 'Estompé';

  @override
  String get quoteStyleNone => 'Couverture simple';

  @override
  String get quoteTextLight => 'Texte clair';

  @override
  String get quoteTextDark => 'Texte foncé';

  @override
  String get quoteFieldTitle => 'Titre';

  @override
  String get quoteFieldDetail => 'Détails';

  @override
  String get quoteFieldDetailHint => 'Auteur, chapitre, page, qui l\'a dit';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => 'Annuler la sélection';

  @override
  String get bookmarksSortedByNewest => 'Plus récents d\'abord';

  @override
  String get bookmarksSortedByPosition => 'Triés par position';

  @override
  String get bookmarksSelect => 'Sélectionner';

  @override
  String get bookmarksNoBookmarks => 'Aucun signet pour l\'instant';

  @override
  String get bookmarksSearchHint => 'Rechercher dans les signets';

  @override
  String get bookmarksNoMatches =>
      'Aucun signet ne correspond à votre recherche';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Téléchargement de $count livres',
      one: 'Téléchargement d\'1 livre',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => 'Déjà téléchargé';

  @override
  String bookmarksDeleteCount(int count) {
    return 'Supprimer $count signet(s) ?';
  }

  @override
  String get bookmarksDeleteContent => 'Cette opération est irréversible.';

  @override
  String bookmarksDeletedCount(int count) {
    return '$count signet(s) supprimé(s)';
  }

  @override
  String get bookmarksJumpTitle => 'Aller au signet ?';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '\"$title\" à $position\ndans $bookTitle';
  }

  @override
  String get bookmarksJump => 'Allez à';

  @override
  String get bookmarksNotConnected => 'Non connecté au serveur';

  @override
  String get bookmarksCouldNotLoad => 'Impossible de charger le livre';

  @override
  String bookmarksSelectedCount(int count) {
    return '$count sélectionné(s)';
  }

  @override
  String get statsTitle => 'Vos statistiques';

  @override
  String get statsCouldNotLoad => 'Échec du chargement des statistiques';

  @override
  String get statsTotalListeningTime => 'TEMPS TOTAL D\'ÉCOUTE';

  @override
  String get statsHoursUnit => 'h';

  @override
  String get statsMinutesUnit => 'm';

  @override
  String get statsSecondsUnit => 's';

  @override
  String statsDaysOfAudio(String days) {
    return 'C\'est $days jours d\'audio';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return 'C\'est $hours d\'audio';
  }

  @override
  String get statsToday => 'Aujourd\'hui';

  @override
  String get statsThisWeek => 'Cette semaine';

  @override
  String get statsThisMonth => 'Ce mois-ci';

  @override
  String get statsActivity => 'Activité';

  @override
  String get statsCurrentStreak => 'Série actuelle';

  @override
  String get statsBestStreak => 'Meilleure série';

  @override
  String get statsFinished => 'Terminé';

  @override
  String get statsBooksFinished => 'Livres';

  @override
  String get statsEpisodesFinished => 'Épisodes';

  @override
  String get statsBooksThisYear => 'Livres cette année';

  @override
  String get statsEpisodesThisYear => 'Épisodes cette année';

  @override
  String get statsRemoveFromYearTitle => 'Retirer de cette année';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return 'La date de fin sera toujours $date sur le serveur. Cela ne supprime que \"$title\" de votre liste des livres Absorb cette année.';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return 'La date de fin reste sur le serveur. Cela retire seulement « $title » de votre liste Absorb des livres lus cette année.';
  }

  @override
  String get statsRemovedFromYear => 'Retiré de cette année';

  @override
  String get statsAddBackToYearTitle => 'Ajouter de nouveau à cette année';

  @override
  String statsAddBackToYearBody(String title) {
    return 'Ajouter «$title» à votre liste des livres Absorb de cette année?';
  }

  @override
  String get statsAddBack => 'Ajouter à nouveau';

  @override
  String get statsAddedBackToYear => 'Ajouté de nouveau à cette année';

  @override
  String get statsHiddenFromYear => 'Masqué dans cette année';

  @override
  String get statsNothingHidden => 'Rien de masqué';

  @override
  String get settingsCustomizeStats => 'Personnaliser les statistiques';

  @override
  String get statsGoalTitle => 'Objectif d\'écoute';

  @override
  String get statsGoalOff => 'Désactivé';

  @override
  String get statsGoalDaily => 'Quotidien';

  @override
  String get statsGoalWeekly => 'Hebdomadaire';

  @override
  String get statsGoalMonthly => 'Mensuel';

  @override
  String get statsGoalTarget => 'Objectif';

  @override
  String get statsGoalEnterTitle => 'Définir l\'objectif';

  @override
  String get statsGoalEnterTimeHint => 'Minutes ou h:mm';

  @override
  String statsBooksShort(int count) {
    return '$count livres';
  }

  @override
  String get statsBookChallengeTitle => 'Défi de lecture';

  @override
  String get statsBookChallengeDesc => 'Livres à terminer cette année';

  @override
  String get statsDailyGoal => 'Objectif quotidien';

  @override
  String get statsWeeklyGoal => 'Objectif hebdomadaire';

  @override
  String get statsMonthlyGoal => 'Objectif mensuel';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$done de $target livres';
  }

  @override
  String get statsGoalReached => 'Objectif atteint';

  @override
  String get statsChartTitle => 'Graphique d\'écoute';

  @override
  String get statsChartBar => 'Histogrammes';

  @override
  String get statsChartLine => 'Ligne';

  @override
  String get statsChartHeatmap => 'Heatmap';

  @override
  String get statsChartDays7 => '7 jours';

  @override
  String get statsChartDays30 => '30 jours';

  @override
  String get statsLast30Days => '30 derniers jours';

  @override
  String get statsThisYearTitle => 'Cette année';

  @override
  String get statsSectionsTitle => 'Sections';

  @override
  String get statsSectionTimePeriods => 'Périodes';

  @override
  String get statsHeatmapLess => 'Moins';

  @override
  String get statsHeatmapMore => 'Plus';

  @override
  String get statsDayOfWeek => 'Moyenne par jour de la semaine';

  @override
  String get statsTimeSavedLabel => 'Enregistré par vitesse';

  @override
  String statsTimeSavedSince(String date) {
    return 'depuis le $date';
  }

  @override
  String get statsTimeSavedReset => 'Remise à zéro du temps gagné';

  @override
  String get statsTimeSavedResetConfirm =>
      'Le temps gagné commencera à compter de nouveau à partir d\'aujourd\'hui.';

  @override
  String get statsTimeSavedResetDone => 'Remise à zéro du temps gagné';

  @override
  String statsOnPaceFor(int count) {
    return 'Bon rythme pour $count livres';
  }

  @override
  String get statsDaysActive => 'Nombre de jours actifs';

  @override
  String get statsDailyAverage => 'Moyenne quotidienne';

  @override
  String get statsLast7Days => '7 derniers jours';

  @override
  String get statsMostListened => 'Les plus écoutées';

  @override
  String get statsRecentSessions => 'Sessions récentes';

  @override
  String get appShellHomeTab => 'Accueil';

  @override
  String get appShellLibraryTab => 'Bibliothèque';

  @override
  String get appShellAbsorbingTab => 'Absorption';

  @override
  String get appShellStatsTab => 'Stats';

  @override
  String get appShellSettingsTab => 'Paramètres';

  @override
  String get appShellDiscoverTab => 'Découvrir';

  @override
  String get appShellShowsTab => 'Séries';

  @override
  String get appShellPodcastsTab => 'Podcasts';

  @override
  String get libraryTabEpisodes => 'Épisodes';

  @override
  String get filterAllEpisodes => 'Tous';

  @override
  String get filterUnplayed => 'Non lus';

  @override
  String get episodeFeedEmpty => 'Aucun épisode ne correspond à ce filtre';

  @override
  String get podcastFilterUpNext => 'Suivant';

  @override
  String get podcastFilterNew => 'Nouveau';

  @override
  String get settingsPodcastTab => 'Onglet Podcasts';

  @override
  String get settingsPodcastTabDesc =>
      'Donner à une bibliothèque de podcast son propre onglet dans la barre du bas';

  @override
  String get settingsPodcastTabLibrary =>
      'Bibliothèque pour l\'onglet podcasts';

  @override
  String get settingsMergeImpliedByPodcastTab =>
      'Toujours allumé lorsque l\'onglet Podcasts est activé';

  @override
  String get settingsEpisodeNotifs => 'Paramètres des notifications';

  @override
  String get settingsEpisodeNotifsDesc =>
      'Nouveaux épisodes de podcast et versions à venir de livres, vérifiés en arrière-plan';

  @override
  String get notifIntervalOff => 'Désactivé';

  @override
  String notifIntervalMinutes(int n) {
    return 'Toutes les $n minutes';
  }

  @override
  String get notifIntervalHour => 'Toutes les heures';

  @override
  String notifIntervalHours(int n) {
    return 'Toutes les $n heures';
  }

  @override
  String get settingsBatteryUnrestricted =>
      'Autoriser l\'utilisation sans restriction de la batterie';

  @override
  String get settingsBatteryUnrestrictedDesc =>
      'Empêche le système de mettre en pause les vérifications d\'arrière-plan sur certains téléphones';

  @override
  String get appShellPressBackToExit => 'Appuyez à nouveau pour quitter';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get sectionAppearance => 'Apparence';

  @override
  String get languageLabel => 'Langage';

  @override
  String get languageSystemDefault => 'Valeurs par défaut du système';

  @override
  String get languageHelpTranslateInvite =>
      'Vous souhaitez aider à traduire Absorb ?';

  @override
  String get themeLabel => 'Thème';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeAuto => 'Auto';

  @override
  String get colorSourceLabel => 'Source de couleur';

  @override
  String get colorSourceCoverDescription =>
      'Les couleurs de l\'application suivent la couverture du livre en cours de lecture';

  @override
  String get colorSourceWallpaperDescription =>
      'Les couleurs de l\'application suivent votre fond d\'écran système';

  @override
  String get colorSourceWallpaper => 'Fond d\'écran';

  @override
  String get colorSourceNowPlaying => 'Lecture en cours';

  @override
  String get colorSourceDynamic => 'Dynamique';

  @override
  String get colorSourceManual => 'Manuel';

  @override
  String get colorSourceManualDescription =>
      'Utilisez une couleur fixe de l\'application que vous choisissez ci-dessous';

  @override
  String get colorSourceCustom => 'Personnalisée';

  @override
  String get useColorEverywhereLabel => 'Utiliser cette couleur partout';

  @override
  String get useColorEverywhereSubtitle =>
      'Colorer aussi les pages de détail des livres et la carte du lecteur avec ta couleur définie plutôt qu’avec la couverture de chaque livre';

  @override
  String get flatBackgroundLabel => 'Arrière-plan plat';

  @override
  String get flatBackgroundSubtitle =>
      'Supprime le dégradé d’arrière‑plan. Noir pur en mode sombre pour les écrans OLED.';

  @override
  String get einkModeLabel => 'Mode encre électronique';

  @override
  String get einkModeSubtitle =>
      'Noir et blanc avec contraste élevé, sans animation, fait pour les écrans à encre électronique';

  @override
  String get einkModeIntroBody =>
      'Fait pour les écrans d\'encre électronique. L\'application passe à un aspect noir et blanc plat avec un contraste élevé, les animations sont désactivées, la carte de lecture perd son arrière-plan et la connexion au serveur en direct reste désactivée pour économiser la batterie. La lecture et la progression continuent de se synchroniser normalement. Vos paramètres d\'apparence sont conservés et sont réactivés lorsque vous désactivez cette fonction.';

  @override
  String get einkModeIntroConfirm => 'Activer';

  @override
  String get backgroundIntensityLabel => 'Intensité de l\'arrière-plan';

  @override
  String get startScreenLabel => 'Écran d\'accueil';

  @override
  String get startScreenSubtitle =>
      'Quel onglet ouvrir au lancement de l\'application';

  @override
  String get startScreenHome => 'Accueil';

  @override
  String get startScreenLibrary => 'Bibliothèque';

  @override
  String get startScreenAbsorb => 'Absorb';

  @override
  String get startScreenStats => 'Stats';

  @override
  String get disablePageFade => 'Désactiver le fondu de page';

  @override
  String get disablePageFadeOnSubtitle =>
      'Le changement de page est instantané';

  @override
  String get disablePageFadeOffSubtitle =>
      'Les pages s\'estompent lors du changement d\'onglets';

  @override
  String get rectangleBookCovers => 'Couvertures de livres rectangulaires';

  @override
  String get progressTextSize => 'Taille du texte de la progression';

  @override
  String get rectangleBookCoversOnSubtitle =>
      'Les couvertures s\'affichent au format 2:3';

  @override
  String get rectangleBookCoversOffSubtitle => 'Les couvertures sont carrées';

  @override
  String get coverSize => 'Taille de la couverture';

  @override
  String get coverSizeSubtitle =>
      'Nombre de couvertures rentrant dans la grille de la bibliothèque';

  @override
  String get coverSizeSmall => 'Petit';

  @override
  String get coverSizeMedium => 'Moyen';

  @override
  String get coverSizeLarge => 'Grand';

  @override
  String get sectionAbsorbingCards => 'Cartes d\'absorption';

  @override
  String get fullScreenPlayer => 'Lecteur plein écran';

  @override
  String get fullScreenPlayerOnSubtitle =>
      'Activé - livres ouverts en plein écran lors de la lecture';

  @override
  String get fullScreenPlayerOffSubtitle => 'Stop - jouer dans la vue carte';

  @override
  String get fullBookScrubber => 'Barre de progression pour le livre complet';

  @override
  String get fullBookScrubberOnSubtitle =>
      'Activé - curseur de recherche sur tout le livre';

  @override
  String get fullBookScrubberOffSubtitle =>
      'Désactivé - barre de progression uniquement';

  @override
  String get cardScrubbers => 'Barres de lecture pour les cartes';

  @override
  String get cardScrubbersBoth => 'Les deux';

  @override
  String get cardScrubbersChapter => 'Chapitre';

  @override
  String get cardScrubbersLocked => 'Verrouillé';

  @override
  String get cardScrubbersBothSubtitle =>
      'Les barres de livre et de chapitre peuvent positionner la lecture';

  @override
  String get cardScrubbersChapterSubtitle =>
      'Seul la barre de chapitre peut positionner la lecture';

  @override
  String get cardScrubbersLockedSubtitle =>
      'La progression est affichée sans positionnement possible';

  @override
  String get speedAdjustedTime => 'Temps ajusté à la vitesse';

  @override
  String get speedAdjustedTimeOnSubtitle =>
      'Activé - tous les temps reflètent votre vitesse de lecture';

  @override
  String get speedAdjustedTimeOffSubtitle =>
      'Désactivé - affichage de la durée audio brute';

  @override
  String get buttonLayout => 'Disposition des boutons';

  @override
  String get buttonLayoutSubtitle =>
      'Comment les boutons d\'action sont disposés sur la carte';

  @override
  String get whenAbsorbed => 'Quand absorbé';

  @override
  String get whenAbsorbedInfoTitle => 'Quand absorbé';

  @override
  String get whenAbsorbedInfoContent =>
      'Contrôle ce qu’il arrive à une carte « en cours d’absorption » quand tu termines un livre ou un épisode.\n\nLes cartes terminées sont automatiquement retirées de ton écran Absorbing.';

  @override
  String get whenAbsorbedSubtitle =>
      'Ce qui arrive à la carte d’absorption quand un livre ou un épisode se termine';

  @override
  String get whenAbsorbedShowOverlay => 'Afficher la superposition';

  @override
  String get whenAbsorbedAutoRelease => 'Libération auto';

  @override
  String get mergeLibraries => 'Page d\'Absorption unifiée';

  @override
  String get mergeLibrariesInfoTitle => 'Page d\'Absorption unifiée';

  @override
  String get mergeLibrariesInfoContent =>
      'Quand activé, l’écran Absorbing affiche tous vos livres et podcasts en cours, provenant de toutes vos bibliothèques, dans une seule vue. Quand désactivé, il n’affiche que les éléments de la bibliothèque que vous avez actuellement sélectionnée.';

  @override
  String get mergeLibrariesOnSubtitle =>
      'La page d\'absorption affiche les éléments de toutes les bibliothèques';

  @override
  String get mergeLibrariesOffSubtitle =>
      'La page d\'Absorption ne montre que la bibliothèque actuelle';

  @override
  String get queueMode => 'Mode file d\'attente';

  @override
  String get queueModeInfoTitle => 'Mode file d\'attente';

  @override
  String get queueModeInfoOff => 'Désactivé';

  @override
  String get queueModeInfoOffDesc =>
      'La lecture s\'arrête à la fin du livre ou de l\'épisode en cours.';

  @override
  String get queueModeInfoManual => 'File d\'attente manuelle';

  @override
  String get queueModeInfoManualDesc =>
      'Vos cartes d\'absorption agissent comme une liste de lecture. Quand l\'une se termine, la prochaine carte non terminée se lance automatiquement. Ajoutez des éléments avec le bouton \"Ajouter à l\'Absorbation\" sur un livre ou un épisode et réorganisez à partir de l\'écran d\'absorption.';

  @override
  String get queueModeOff => 'Désactivé';

  @override
  String get queueModeManual => 'Manuel';

  @override
  String get queueModeAuto => 'Auto';

  @override
  String get queueModePlaylist => 'Liste de lecture';

  @override
  String get queueModeCollection => 'Collection';

  @override
  String get queueModeInfoPlaylist => 'File d\'attente de la playlist';

  @override
  String get queueModeInfoPlaylistDesc =>
      'Lit les éléments dans l’ordre depuis une playlist choisie, en sautant tout ce qui est déjà terminé. S’arrête à la fin de la liste.';

  @override
  String get queuePlaylistPickerTitle => 'Choisir une playlist';

  @override
  String get queuePlaylistNone => 'Aucune playlist sélectionnée';

  @override
  String queuePlaylistActiveLabel(String name) {
    return 'Playlist : $name';
  }

  @override
  String get queueModePlaylistHint =>
      'Démarrez une file de lecture en ouvrant une playlist depuis la page d’accueil.';

  @override
  String get exit => 'Quitter';

  @override
  String upNext(String label) {
    return 'Suivant : $label';
  }

  @override
  String get nothingUpNext => 'Rien à venir';

  @override
  String get showUpNextLabel => 'Afficher le suivant sur la page d\'absorption';

  @override
  String get openSeries => 'Ouvrir la série';

  @override
  String get openPlaylist => 'Ouvrir une liste de lecture';

  @override
  String get openCollection => 'Ouvrir la collection';

  @override
  String get playlistPlayAction => 'Lire la playlist';

  @override
  String get playlistAllFinished => 'Tous les terminés';

  @override
  String get queueModeBooks => 'Livres';

  @override
  String get queueModePodcasts => 'Podcasts';

  @override
  String get autoDownloadQueue => 'File de téléchargement automatique';

  @override
  String get autoDownloadThisSeriesLabel =>
      'Télécharger automatiquement cette série';

  @override
  String get autoDownloadThisShowLabel =>
      'Télécharger automatiquement ce podcast';

  @override
  String get autoDownloadThisPlaylistLabel =>
      'Télécharger automatiquement cette playlist';

  @override
  String get autoDownloadThisCollectionLabel =>
      'Télécharger automatiquement cette collection';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return 'Garder les $count prochains éléments téléchargés';
  }

  @override
  String get autoDownloadQueueOffSubtitle =>
      'Désactivé - téléchargements manuels uniquement';

  @override
  String get sectionPlayback => 'Lecture';

  @override
  String get sectionMediaControls => 'Contrôles multimédia';

  @override
  String get defaultSpeed => 'Vitesse par défaut';

  @override
  String get defaultSpeedSubtitle =>
      'Les nouveaux livres commencent à cette vitesse — chacun mémorise ensuite sa propre vitesse';

  @override
  String get skipBack => 'Reculer';

  @override
  String get skipForward => 'Avancer';

  @override
  String get iosLockScreenSkipHint =>
      'L\'écran de verrouillage n\'affiche que les nombres pour lesquels iOS a des icônes (5, 10, 15, 30, 45, 60, 75, 90). Les autres valeurs affichent + sur le bouton mais avancent quand même selon votre réglage.';

  @override
  String get longSkipButtons => 'Boutons de saut long';

  @override
  String get longSkipButtonsOnSubtitle =>
      'Activé - le lecteur affiche une seconde paire de sauts plus grands';

  @override
  String get longSkipButtonsOffSubtitle =>
      'Désactivé - juste les boutons de saut normaux';

  @override
  String get longSkipBack => 'Retour en arrière long';

  @override
  String get longSkipForward => 'Saut vers l\'avant long';

  @override
  String get coverShapeDefault => 'Défaut';

  @override
  String get coverShapeSquare => 'Carré';

  @override
  String get coverShapeRectangle => 'Rectangle';

  @override
  String get coverShapeLabel => 'Forme de couverture';

  @override
  String get showSubtitles => 'Afficher les sous-titres';

  @override
  String get showSubtitlesOnSubtitle =>
      'Les sous-titres s\'affichent sous les titres des livres dans la bibliothèque et sur l\'accueil';

  @override
  String get showSubtitlesOffSubtitle =>
      'Désactivé - sous-titres uniquement dans la fiche détaillée du livre';

  @override
  String get subtitleVisibilityLabel => 'Sous-titres';

  @override
  String get subtitleVisibilityDefault => 'Par défaut';

  @override
  String get subtitleVisibilityShow => 'Afficher';

  @override
  String get subtitleVisibilityHide => 'Masquer';

  @override
  String currentLibrarySettingsTitle(String name) {
    return 'Bibliothèque actuelle : $name';
  }

  @override
  String get currentLibrarySkipOverride => 'Longueurs de saut personnalisées';

  @override
  String get currentLibrarySkipOverrideOnSubtitle =>
      'Activé - cette bibliothèque utilise ses propres longueurs de saut';

  @override
  String get currentLibrarySkipOverrideOffSubtitle =>
      'Désactivé - cette bibliothèque utilise les longueurs de saut globales';

  @override
  String get currentLibrarySkipBack => 'Reculer';

  @override
  String get currentLibrarySkipForward => 'Avancer';

  @override
  String get chapterProgressInNotification =>
      'Progression du chapitre dans les notifications & Android Auto';

  @override
  String get chapterProgressOnSubtitle =>
      'Activé - notification & Android Auto montrent la progression du chapitre';

  @override
  String get chapterProgressOffSubtitle =>
      'Désactivé - ils montrent la progression du livre complet';

  @override
  String get chapterProgressInNotificationIos =>
      'Progression du chapitre sur l\'écran de verrouillage & CarPlay';

  @override
  String get chapterProgressOnSubtitleIos =>
      'Activé - l\'écran de verrouillage & CarPlay montrent la progression du chapitre';

  @override
  String get nowPlayingText => 'Texte de lecture en cours';

  @override
  String get nowPlayingTextSubtitle =>
      'Choisissez ce que les commandes multimédia affichent sur chaque ligne';

  @override
  String get nowPlayingTopLine => 'Ligne du haut';

  @override
  String get nowPlayingSecondLine => 'Deuxième ligne';

  @override
  String get nowPlayingNotShown => 'Non affiché';

  @override
  String get nowPlayingTopLineRequired =>
      'La ligne du haut doit contenir au moins un élément';

  @override
  String get nowPlayingPieceChapter => 'Chapitre';

  @override
  String get nowPlayingPieceTitle => 'Titre du livre';

  @override
  String get nowPlayingPieceNarrator => 'Narrateur';

  @override
  String get nowPlayingPieceSeries => 'Séries';

  @override
  String get nowPlayingPiecePercent => 'Pourcentage du livre';

  @override
  String get nowPlayingPieceChapterNumber => 'Numéro du chapitre';

  @override
  String get nowPlayingPieceTimeLeft => 'Temps restant';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return 'Chap. $number/$total';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return '$time restant';
  }

  @override
  String get bookDockBadgePending => 'En attente';

  @override
  String get bookDockBadgeExtracting => 'Lecture du fichier';

  @override
  String get bookDockBadgeFetching => 'Recherche';

  @override
  String get bookDockBadgeError => 'Erreur';

  @override
  String get bookDockNeedsReview => 'À vérifier';

  @override
  String get bookDockNoMatch => 'Aucune correspondance';

  @override
  String get bookDockApplied => 'Appliqué';

  @override
  String get bookDockNotApplied => 'Détails trouvés non utilisés';

  @override
  String get bookDockNoDestination => 'Aucune destination définie';

  @override
  String get bookDockNoAuthor => 'Pas encore d\'auteur';

  @override
  String get bookDockLookUpAgain => 'Rechercher à nouveau';

  @override
  String get bookDockLookingUp => 'Nouvelle recherche des détails';

  @override
  String get bookDockLookUpFailed => 'Impossible de rechercher les détails';

  @override
  String get bookDockProposedChanges => 'Modifications proposées';

  @override
  String get bookDockNoChanges => 'Aucun détail trouvé en ligne pour le moment';

  @override
  String get bookDockStillReading => 'Le serveur lit encore ce fichier';

  @override
  String get bookDockRoleBook => 'Livre';

  @override
  String get bookDockRoleCover => 'Couverture';

  @override
  String get bookDockRoleMetadata => 'Métadonnées';

  @override
  String get bookDockRoleExtra => 'Supplément';

  @override
  String get bookDockFieldTitle => 'Titre';

  @override
  String get bookDockFieldSubtitle => 'Sous-titre';

  @override
  String get bookDockFieldAuthors => 'Auteurs';

  @override
  String get bookDockFieldSeries => 'Séries';

  @override
  String get bookDockFieldPublisher => 'Éditeur';

  @override
  String get bookDockFieldYear => 'Année';

  @override
  String get bookDockFieldLanguage => 'Langage';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return '$percent % de correspondance';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '1 fichier',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return 'Va dans $library';
  }

  @override
  String bookDockChangedFields(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count champs',
      one: '1 champ',
    );
    return '$_temp0';
  }

  @override
  String bookDockFilesInEntry(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers dans cette entrée',
      one: 'Fichier dans cette entrée',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return 'Ajouté le $date';
  }

  @override
  String get bookDockAddToLibrary => 'Ajouter à la bibliothèque';

  @override
  String get bookDockUseFound => 'Utiliser les détails trouvés';

  @override
  String get bookDockRemoveTitle => 'Retirer de Book Dock ?';

  @override
  String get bookDockRemoveFailed => 'Impossible de retirer ce fichier';

  @override
  String get bookDockPickLibrary => 'Ajouter à quelle bibliothèque ?';

  @override
  String get bookDockNoLibraries =>
      'Votre compte ne peut pas ajouter de livres à une bibliothèque';

  @override
  String get bookDockFileFailed =>
      'Impossible d\'ajouter ce fichier à la bibliothèque';

  @override
  String get bookDockDuplicateBody =>
      'Un fichier portant ce nom existe déjà dans cette bibliothèque. Le retirer de Book Dock ?';

  @override
  String get bookDockDetailsUpdated => 'Détails mis à jour';

  @override
  String get bookDockUseFoundFailed => 'Aucun détail trouvé à utiliser';

  @override
  String bookDockRemoveBody(String title) {
    return 'Cela efface $title du serveur.';
  }

  @override
  String bookDockRemoved(String title) {
    return '$title retiré de Book Dock';
  }

  @override
  String bookDockFiled(String title, String library) {
    return '$title ajouté à $library';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return 'Impossible d\'ajouter ce fichier : $reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return 'Déjà dans $library';
  }

  @override
  String get bomatchSearchAll => 'Rechercher dans toutes les sources';

  @override
  String get bomatchSearching => 'Recherche...';

  @override
  String get bomatchSearchFailed =>
      'Impossible de rechercher des correspondances. Vérifiez votre connexion et réessayez.';

  @override
  String get bomatchNoResults => 'Aucune correspondance trouvée';

  @override
  String get bomatchStrong => 'Correspondances fortes';

  @override
  String get bomatchPossible => 'Correspondances possibles';

  @override
  String get bomatchSourceTimeout => 'délai dépassé';

  @override
  String get bomatchSourceBusy => 'occupé';

  @override
  String get bomatchSourceFailed => 'échec';

  @override
  String get bomatchLinked => 'Lié';

  @override
  String get bomatchSameIsbn => 'Même ISBN';

  @override
  String get bomatchFewDetails => 'Peu de détails';

  @override
  String get bomatchBack => 'Tous les résultats';

  @override
  String get bomatchFillEmpty => 'Remplir les vides';

  @override
  String get bomatchTakeAll => 'Tout prendre';

  @override
  String get bomatchOnlyDifferences => 'Différences uniquement';

  @override
  String get bomatchNow => 'Actuel';

  @override
  String get bomatchEmpty => 'Vide';

  @override
  String get bomatchKindNew => 'Nouveau';

  @override
  String get bomatchKindChange => 'Modification';

  @override
  String get bomatchKindSmall => 'Petite modification';

  @override
  String get bomatchKindSame => 'Identique';

  @override
  String get bomatchKindNone => 'Absent du résultat';

  @override
  String get bomatchKeep => 'Conserver';

  @override
  String get bomatchUse => 'Utiliser';

  @override
  String get bomatchMerge => 'Fusionner';

  @override
  String get bomatchReplace => 'Remplacer';

  @override
  String get bomatchUseThis => 'Utiliser celui-ci';

  @override
  String get bomatchChosen => 'Choisi';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autres livres',
      one: '1 autre livre',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count modifications',
      one: '1 modification',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nouveaux',
      one: '1 nouveau',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Appliquer $count modifications',
      one: 'Appliquer 1 modification',
      zero: 'Appliquer',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autres sources',
      one: '1 autre source',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return 'De $source';
  }

  @override
  String get breqTitle => 'Demandes de livres';

  @override
  String get breqTabRequest => 'Demander un livre';

  @override
  String get breqTabMine => 'Mes demandes';

  @override
  String get breqTabAll => 'Toutes les demandes';

  @override
  String get breqNoAccess =>
      'Votre compte ne peut pas demander de livres sur ce serveur.';

  @override
  String get breqTitleHint => 'Titre du livre';

  @override
  String get breqAuthorHint => 'Auteur';

  @override
  String get breqKindAudiobook => 'Livre audio';

  @override
  String get breqKindEbook => 'Ebook';

  @override
  String get breqKindComic => 'BD';

  @override
  String get breqSearch => 'Rechercher';

  @override
  String get breqSearching => 'Recherche...';

  @override
  String get breqSearchFailed =>
      'Recherche impossible. Vérifiez votre connexion et réessayez.';

  @override
  String get breqSearchPrompt =>
      'Recherchez un livre que la bibliothèque n\'a pas encore pour le demander.';

  @override
  String get breqNoResults => 'Aucun livre correspondant trouvé';

  @override
  String get breqInLibrary => 'Dans votre bibliothèque';

  @override
  String get breqYouAsked => 'Vous avez demandé ceci';

  @override
  String get breqSomeoneAsked => 'Déjà demandé par quelqu\'un d\'autre';

  @override
  String get breqView => 'Voir';

  @override
  String get breqRequest => 'Demander';

  @override
  String get breqRequested => 'Demandé';

  @override
  String get breqAddMeToo => 'M\'ajouter aussi';

  @override
  String get breqLibrary => 'Bibliothèque';

  @override
  String get breqLibraryApprover => 'Laisser l\'approbateur décider';

  @override
  String get breqLibraryChoose => 'Choisir une bibliothèque';

  @override
  String get breqNote => 'Note pour l\'approbateur';

  @override
  String get breqNoteHint => 'Tout ce qui mérite d\'être su sur cette demande';

  @override
  String get breqAutoApproved => 'Vos demandes sont approuvées immédiatement.';

  @override
  String get breqSubmitted => 'Demande envoyée';

  @override
  String get breqJoined => 'Vous avez été ajouté à la demande existante';

  @override
  String get breqFailed => 'Impossible d\'envoyer la demande';

  @override
  String get breqStatusPending => 'En attente';

  @override
  String get breqStatusApproved => 'Approuvée';

  @override
  String get breqStatusRejected => 'Rejetée';

  @override
  String get breqStatusCancelled => 'Annulée';

  @override
  String get breqStatusSearching => 'Recherche';

  @override
  String get breqStatusGrabbed => 'Version trouvée';

  @override
  String get breqStatusDownloading => 'Téléchargement';

  @override
  String get breqStatusImporting => 'Importation';

  @override
  String get breqStatusNeedsReview => 'À vérifier';

  @override
  String get breqStatusAvailable => 'Disponible';

  @override
  String get breqStatusFailed => 'Échec';

  @override
  String get breqWaitingApproval => 'En attente d\'approbation';

  @override
  String get breqWaitingRelease => 'En attente du choix d\'une version';

  @override
  String get breqLookingForRelease => 'Recherche d\'une version';

  @override
  String get breqStartingDownload => 'Démarrage du téléchargement';

  @override
  String get breqAddingToLibrary => 'Ajout à la bibliothèque';

  @override
  String get breqWaitingCheck => 'En attente d\'une vérification manuelle';

  @override
  String get breqReady => 'Prêt dans votre bibliothèque';

  @override
  String get breqSomethingWrong => 'Un problème est survenu';

  @override
  String get breqShowHidden => 'Afficher les masquées';

  @override
  String get breqHidden => 'Masquée';

  @override
  String get breqMineEmpty => 'Vous n\'avez encore demandé aucun livre.';

  @override
  String get breqAllEmpty => 'Aucune demande pour le moment.';

  @override
  String get breqLoadFailed => 'Impossible de charger les demandes.';

  @override
  String get breqLoadMore => 'Charger plus';

  @override
  String get breqApprove => 'Approuver';

  @override
  String get breqReject => 'Rejeter';

  @override
  String get breqCancel => 'Annuler la demande';

  @override
  String get breqHide => 'Masquer de ma liste';

  @override
  String get breqUnhide => 'Afficher dans ma liste';

  @override
  String get breqLeave => 'Quitter la demande';

  @override
  String get breqDelete => 'Effacer la demande';

  @override
  String get breqOpenBook => 'Ouvrir le livre';

  @override
  String get breqCancelConfirm =>
      'Annuler cette demande ? Un téléchargement en cours s\'arrête aussi.';

  @override
  String get breqDeleteConfirm =>
      'Effacer cette demande ? Cette action est irréversible.';

  @override
  String get breqRejectTitle => 'Rejeter la demande';

  @override
  String get breqRejectReason => 'Motif (facultatif)';

  @override
  String get breqApproveTitle => 'Approuver la demande';

  @override
  String get breqApproveLibraryNeeded =>
      'Choisissez la bibliothèque où ce livre sera ajouté.';

  @override
  String get breqApprovedToast => 'Demande approuvée';

  @override
  String get breqRejectedToast => 'Demande rejetée';

  @override
  String get breqCancelledToast => 'Demande annulée';

  @override
  String get breqHiddenToast => 'Masquée de votre liste';

  @override
  String get breqRestoredToast => 'De retour dans votre liste';

  @override
  String get breqDeletedToast => 'Demande effacée';

  @override
  String get breqLeftToast => 'Vous avez quitté cette demande';

  @override
  String get breqActionFailed => 'Impossible de mettre à jour la demande';

  @override
  String get breqFactRequestedBy => 'Demandé par';

  @override
  String get breqFactRequestedOn => 'Demandé le';

  @override
  String get breqFactLibrary => 'Bibliothèque';

  @override
  String get breqFactDecidedBy => 'Décidé par';

  @override
  String get breqFactNote => 'Note du demandeur';

  @override
  String get breqFactDecisionNote => 'Note de décision';

  @override
  String get breqFactAlsoWanted => 'Aussi souhaité par';

  @override
  String get breqLibraryCta => 'Demander un livre';

  @override
  String get breqSettingsSubtitle =>
      'Demandez des livres que la bibliothèque n\'a pas encore';

  @override
  String get navHoldBookRequests => 'Demandes de livres';

  @override
  String breqLibraryDefault(String library) {
    return 'Par défaut ($library)';
  }

  @override
  String breqFailedReason(String reason) {
    return 'Impossible d\'envoyer la demande : $reason';
  }

  @override
  String breqBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres',
      one: '1 livre',
    );
    return '$_temp0';
  }

  @override
  String breqDownloadingPercent(int percent) {
    return 'Téléchargement, $percent %';
  }

  @override
  String breqAddedTo(String library) {
    return 'Ajouté à $library';
  }

  @override
  String breqRejectedWithNote(String note) {
    return 'Rejetée : $note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return 'Échec : $reason';
  }

  @override
  String breqRequestedBy(String name) {
    return 'Demandé par $name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return 'Impossible de mettre à jour la demande : $reason';
  }

  @override
  String breqFooterCta(String query) {
    return 'Demander « $query »';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count demandes',
      one: '1 demande',
      zero: 'Aucune demande',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => 'Trouver une version';

  @override
  String get breqTryAnotherRelease => 'Essayer une autre version';

  @override
  String get breqApproveAndFind => 'Approuver et trouver une version';

  @override
  String get breqReviewButton => 'Vérifier le téléchargement';

  @override
  String get breqStopDownload => 'Arrêter le téléchargement';

  @override
  String get breqStopDownloadConfirm =>
      'Arrêter ce téléchargement ? La demande repasse à approuvée pour qu\'une autre version puisse être choisie.';

  @override
  String get breqDiscardImport => 'Abandonner le téléchargement';

  @override
  String get breqDiscardConfirm =>
      'Abandonner ce téléchargement ? La demande est marquée comme échouée et peut être retentée avec une autre version.';

  @override
  String get breqFileAnyway => 'Ajouter à la bibliothèque';

  @override
  String get breqFiledToast => 'Ajouté à la bibliothèque';

  @override
  String get breqDiscardedToast => 'Téléchargement abandonné';

  @override
  String get breqStoppedToast => 'Téléchargement arrêté';

  @override
  String get breqGrabTitle => 'Télécharger cette version ?';

  @override
  String get breqGrab => 'Télécharger';

  @override
  String get breqGrabbed => 'Téléchargement démarré';

  @override
  String get breqGrabFailed => 'Impossible de démarrer ce téléchargement';

  @override
  String get breqReleaseVipWarning =>
      'Ce tracker n\'autorise le téléchargement qu\'aux comptes VIP.';

  @override
  String get breqReleaseNoBookFile =>
      'Cette version ne contient aucun fichier de livre que BookOrbit puisse ajouter à une bibliothèque.';

  @override
  String get breqReleaseCheckFailed =>
      'Impossible de vérifier le contenu de cette version. Réessayez ou choisissez-en une autre.';

  @override
  String get breqCheckingRelease => 'Vérification des fichiers...';

  @override
  String get breqSearchAgain => 'Rechercher à nouveau';

  @override
  String get breqSearchTerms => 'Termes de recherche';

  @override
  String get breqIsbnHint => 'Laissez vide pour rechercher par titre et auteur';

  @override
  String get breqSearchingIndexers =>
      'Recherche dans vos indexeurs. Cela peut prendre jusqu\'à une minute.';

  @override
  String get breqReleasesFailed => 'Impossible de rechercher des versions.';

  @override
  String get breqNoSourcesSetUp =>
      'Aucune source de recherche n\'est configurée dans BookOrbit.';

  @override
  String get breqNoSourcesOn =>
      'Toutes les sources de recherche sont désactivées dans BookOrbit.';

  @override
  String get breqNoSourceCarries =>
      'Aucune de vos sources de recherche ne propose ce type de livre.';

  @override
  String get breqNoReleases =>
      'Aucune version trouvée. Essayez d\'autres termes de recherche.';

  @override
  String get breqFromCache => 'd\'une recherche récente';

  @override
  String get breqIndexerUnauthorized => 'échec de connexion';

  @override
  String get breqIndexerThrottled => 'occupé';

  @override
  String get breqIndexerTimeout => 'délai dépassé';

  @override
  String get breqIndexerUnreachable => 'injoignable';

  @override
  String get breqIndexerNoMedium => 'ne propose pas ceci';

  @override
  String get breqIndexerError => 'échec';

  @override
  String get breqSortBest => 'Meilleure correspondance';

  @override
  String get breqSortSeeders => 'Seeders';

  @override
  String get breqSortSize => 'Taille';

  @override
  String get breqSortNewest => 'Plus récent';

  @override
  String get breqFreeleech => 'Freeleech';

  @override
  String get breqVipOnly => 'VIP uniquement';

  @override
  String get breqAlreadyGrabbed => 'Déjà téléchargé';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => 'Titre';

  @override
  String get breqReasonAuthor => 'Auteur';

  @override
  String get breqReasonUnknownFormat => 'Format inconnu';

  @override
  String get breqReasonExpectedSize => 'Taille';

  @override
  String get breqReasonSuspiciousSize => 'Taille inhabituelle';

  @override
  String get breqReasonFreeleech => 'Freeleech';

  @override
  String get breqReasonSeveralBooks => 'Plusieurs livres';

  @override
  String get breqReviewTitle => 'Téléchargement en attente de vérification';

  @override
  String get breqReviewFailed =>
      'Impossible de charger les détails du téléchargement.';

  @override
  String get breqReviewDockGone =>
      'Les fichiers téléchargés ne sont plus dans Book Dock.';

  @override
  String get breqReviewNoLibrary =>
      'Cette demande n\'a aucune bibliothèque où ajouter le livre.';

  @override
  String breqGrabFailedReason(String reason) {
    return 'Impossible de démarrer ce téléchargement : $reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return 'Impossible de vérifier le contenu de cette version : $reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return 'Impossible de rechercher des versions : $reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return 'Impossible de charger les détails du téléchargement : $reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count versions',
      one: '1 version',
      zero: 'Aucune version',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '1 fichier',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '1 fichier',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return '$seeders seeders, $leechers leechers';
  }

  @override
  String breqScore(int score) {
    return 'Score $score';
  }

  @override
  String breqReasonPreferredFormat(String format) {
    return '$format préféré';
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
    return 'Score de correspondance $score. Les téléchargements avec un score de $threshold ou plus sont ajoutés automatiquement.';
  }

  @override
  String breqReviewRequested(String value) {
    return 'Demandé : $value';
  }

  @override
  String breqReviewImported(String value) {
    return 'Téléchargé : $value';
  }

  @override
  String get breqKindBoth => 'Les deux';

  @override
  String get breqEbookLibrary => 'Bibliothèque d\'ebooks';

  @override
  String get breqAudiobookLibrary => 'Bibliothèque de livres audio';

  @override
  String get breqRequestBoth => 'Demander les deux';

  @override
  String get breqAddMeToBoth => 'M\'ajouter aux deux';

  @override
  String get breqRequestEbook => 'Demander l\'ebook';

  @override
  String get breqRequestAudiobook => 'Demander le livre audio';

  @override
  String get breqAddMeEbook => 'M\'ajouter à la demande d\'ebook';

  @override
  String get breqAddMeAudiobook => 'M\'ajouter à la demande de livre audio';

  @override
  String get breqPairSubmitted => 'Ebook et livre audio demandés';

  @override
  String get breqPairOneJoined =>
      'Les deux sont demandés. L\'un était déjà en cours, vous avez donc été ajouté à cette demande';

  @override
  String get breqJoinedBoth => 'Vous avez été ajouté aux deux demandes';

  @override
  String get breqJoinsOwned =>
      'Demandé. Il rejoindra la copie déjà dans votre bibliothèque';

  @override
  String get speedBookmarkInControls =>
      'Vitesse et signet dans les contrôles des médias';

  @override
  String get speedBookmarkOnSubtitle =>
      'Activé - la notification affiche la vitesse et le signet ; le saut de chapitre reste dans Android Auto';

  @override
  String get speedBookmarkOffSubtitle =>
      'Désactivé - la notification montre le saut de chapitre, la vitesse et le signet restent dans Android Auto';

  @override
  String get lockSeekBar => 'Verrouiller la barre de lecture';

  @override
  String get lockSeekBarOnSubtitle =>
      'Activé - la barre dans la notification, l\'écran de verrouillage et le mode voiture montre la progression mais ne peut pas être déplacée';

  @override
  String get lockSeekBarOffSubtitle =>
      'Désactivé - faites glisser le curseur dans la notification, l\'écran de verrouillage et le mode voiture pour vous déplacer ';

  @override
  String get autoRewindOnResume => 'Rembobiner lors de la reprise';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return 'Activé - ${min}s à ${max}s en fonction de la longueur de la pause';
  }

  @override
  String get autoRewindOffSubtitle => 'Désactivé';

  @override
  String get rewindRange => 'Plage de rembobinage';

  @override
  String get rewindAfterPausedFor => 'Rembobiner après une pause de';

  @override
  String get rewindAnyPause => 'N\'importe quelle durée';

  @override
  String get rewindAlwaysLabel => 'Toujours';

  @override
  String get rewindAlwaysDescription =>
      'Rembobine chaque fois que vous reprenez la lecture, même après de courtes interruptions';

  @override
  String rewindAfterDescription(String seconds) {
    return 'Rembobiner seulement après une pause de plus de $seconds seconde(s)';
  }

  @override
  String get chapterBarrier => 'Barrière de chapitre';

  @override
  String get chapterBarrierSubtitle =>
      'Ne pas rembobiner automatiquement après le début du chapitre en cours';

  @override
  String get rewindInstant => 'Instantané';

  @override
  String rewindPause(String duration) {
    return 'Pause de $duration';
  }

  @override
  String get rewindNoRewind => 'aucun rembobinage';

  @override
  String rewindSeconds(String seconds) {
    return 'Rembobinage de ${seconds}s';
  }

  @override
  String get sectionSleepTimer => 'Minuteur de veille';

  @override
  String get sleep => 'Veille';

  @override
  String get sleepTimer => 'Minuteur de veille';

  @override
  String get shakeDuringSleepTimer => 'Secouer pendant la mise en veille';

  @override
  String get shakeOff => 'Désactivé';

  @override
  String get shakeAddTime => 'Ajouter du temps';

  @override
  String get shakeReset => 'Réinitialiser';

  @override
  String get shakeAdds => 'Secouer ajoute';

  @override
  String get sleepAddAmount => 'Durée à ajouter';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes min';
  }

  @override
  String get shakeSensitivity => 'Intensité des vibrations';

  @override
  String get shakeSensitivityVeryLow => 'Très basse';

  @override
  String get shakeSensitivityLow => 'Basse';

  @override
  String get shakeSensitivityMedium => 'Moyenne';

  @override
  String get shakeSensitivityHigh => 'Haute';

  @override
  String get shakeSensitivityVeryHigh => 'Très haute';

  @override
  String get buttonDuringSleepTimer =>
      'Bouton du casque pendant l\'extinction progressive';

  @override
  String get buttonDuringSleepTimerHint =>
      'Dans les derniers instants de l\'extinction progressive, un appui réinitialise le minuteur au lieu de mettre en pause. Un double appui passe toujours au suivant.';

  @override
  String get resetTimerOnPause => 'Réinitialiser le minuteur en cas de pause';

  @override
  String get resetTimerOnPauseOnSubtitle =>
      'Le minuteur redémarre à partir de la durée complète lorsque vous reprenez';

  @override
  String get resetTimerOnPauseOffSubtitle =>
      'Le minuteur se poursuit à partir de l\'endroit où il s\'est arrêté';

  @override
  String get fadeVolumeBeforeSleep => 'Fondu du volume avant la mise en veille';

  @override
  String get fadeVolumeOnSubtitle =>
      'Diminue progressivement le volume au cours des 30 dernières secondes';

  @override
  String get fadeVolumeOffSubtitle =>
      'La lecture s\'arrête immédiatement à la fin du minuteur';

  @override
  String get autoSleepTimer => 'Minuteur de mise en veille automatique';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration min';
  }

  @override
  String get autoSleepTimerOffSubtitle =>
      'Démarrer automatiquement un minuteur de veille pendant une fenêtre de temps';

  @override
  String get windowStart => 'Début de la fenêtre';

  @override
  String get windowEnd => 'Fin de la fenêtre';

  @override
  String get timerDuration => 'Durée du minuteur';

  @override
  String get timer => 'Minuteur';

  @override
  String get endOfChapter => 'Fin du chapitre';

  @override
  String startMinTimer(int minutes) {
    return 'Démarrer le minuteur de $minutes min';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return 'Mise en veille après $count $label';
  }

  @override
  String get addMoreTime => 'Ajouter plus de temps';

  @override
  String get cancelTimer => 'Annuler le minuteur';

  @override
  String chaptersLeftCount(int count) {
    return '$count ch restants';
  }

  @override
  String get sectionDownloadsAndStorage => 'Téléchargements et stockage';

  @override
  String get downloadOverWifiOnly => 'Réseau de téléchargement';

  @override
  String get downloadOverWifiOnSubtitle => 'Wi-Fi uniquement';

  @override
  String get downloadOverWifiOffSubtitle => 'N\'importe quelle connexion';

  @override
  String get autoDownloadOnWifi =>
      'Télécharger automatiquement les livres que vous démarrez';

  @override
  String get autoDownloadOnWifiInfoTitle =>
      'Télécharger automatiquement les livres que vous démarrez';

  @override
  String get autoDownloadOnWifiInfoContent =>
      'Lorsque vous commencez à lire un livre, ce dernier se télécharge en arrière‑plan afin que vous l’ayez hors ligne sans lancer le téléchargement vous‑même. Ces téléchargements suivent votre réglage Réseau de téléchargement ci‑dessous, donc réglez‑le sur Toute connexion si vous voulez qu’ils s’exécutent aussi en données mobiles.';

  @override
  String get autoDownloadOnWifiOnSubtitle =>
      'Téléchargement automatique des livres en arrière-plan';

  @override
  String get autoDownloadOnWifiOffSubtitle => 'Désactivé';

  @override
  String get concurrentDownloads => 'Téléchargements simultanés';

  @override
  String get autoDownload => 'Téléchargement automatique';

  @override
  String get autoDownloadSubtitle =>
      'Activer par série, podcast, playlist ou collection à partir de leurs pages de détails';

  @override
  String get autoDownloadEnabledFor => 'Activé pour';

  @override
  String get autoDownloadEnabledForNone => 'Rien pour l\'instant';

  @override
  String get autoDownloadSourceUnnamed => 'Pas encore chargées';

  @override
  String get keepNext => 'Garder le suivant';

  @override
  String get keepNextInfoTitle => 'Garder le suivant';

  @override
  String get keepNextInfoContent =>
      'Le nombre d\'éléments à garder téléchargés, y compris celui que vous écoutez actuellement. Par exemple, « Garder les 3 prochains » signifie que le livre actuel plus les 2 suivants de cette série, le podcast, la playlist ou la collection resteront téléchargés. Ceci s\'applique à chaque téléchargement automatique activé.';

  @override
  String get deleteAbsorbedDownloads =>
      'Supprimer les téléchargements absorbés';

  @override
  String get deleteAbsorbedDownloadsInfoTitle =>
      'Supprimer les téléchargements absorbés';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      'Lorsque cette option est activée, les livres téléchargés ou les épisodes sont automatiquement supprimés de cet appareil une fois que vous les avez terminés dans Absorb. Terminer un élément sur le web ou un autre appareil ne supprimera pas son téléchargement ici.';

  @override
  String get deleteAbsorbedOnSubtitle =>
      'Les éléments achevés sont supprimés pour libérer de l\'espace';

  @override
  String get deleteAbsorbedOffSubtitle =>
      'Désactivé - les téléchargements terminés sont conservés';

  @override
  String get downloadLocation => 'Emplacement de téléchargement';

  @override
  String get storageUsed => 'Stockage utilisé';

  @override
  String storageUsedByDownloads(String size) {
    return '$size utilisé(s) par les téléchargements';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return '$free libre(s) sur $total';
  }

  @override
  String get manageDownloads => 'Gérer les téléchargements';

  @override
  String get streamingCache => 'Cache de diffusion en continu';

  @override
  String get streamingCacheInfoTitle => 'Cache de diffusion en continu';

  @override
  String get streamingCacheInfoContent =>
      'Cache le flux audio vers le disque afin qu\'il ne soit pas téléchargé à nouveau si vous revenez en arrière ou réécoutez des sections. Le cache est géré automatiquement - les fichiers les plus anciens sont supprimés lorsque la taille limite est atteinte. Ceci est séparé des livres téléchargés complètement.';

  @override
  String get streamingCacheOff => 'Désactivé';

  @override
  String get streamingCacheOffSubtitle =>
      'Désactivé - l\'audio est diffusé sans mise en cache';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size Mo - l\'audio diffusé récemment est mis en cache sur le disque';
  }

  @override
  String get clearCache => 'Effacer le cache';

  @override
  String get streamingCacheCleared => 'Cache de diffusion vidé';

  @override
  String get sectionLibrary => 'Bibliothèque';

  @override
  String get hideEbookOnlyTitles => 'Masquer les titres des ebooks seuls';

  @override
  String get hideEbookOnlyOnSubtitle =>
      'Les livres sans fichiers audio sont cachés';

  @override
  String get hideEbookOnlyOffSubtitle =>
      'Désactivé - tous les éléments de la bibliothèque sont affichés';

  @override
  String get homeCardsOpenDetails => 'Ouvrir les détails depuis l\'accueil';

  @override
  String get homeCardsOpenDetailsOnSubtitle =>
      'Appuyer sur une carte Continuer l\'écoute ou Continuer la lecture ouvre ses détails';

  @override
  String get homeCardsOpenDetailsOffSubtitle =>
      'Appuyer sur une carte Continuer l\'écoute ou Continuer la lecture reprend là où vous vous étiez arrêté';

  @override
  String get showGoodreadsButton => 'Afficher le bouton Goodreads';

  @override
  String get showGoodreadsOnSubtitle =>
      'La fiche de détail du livre affiche un lien vers Goodreads';

  @override
  String get showGoodreadsOffSubtitle =>
      'Désactivé - Bouton « Goodreads» masqué';

  @override
  String get sectionPermissions => 'Permissions';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsSubtitle =>
      'Pour l\'avancement des téléchargements et le contrôle de lecture';

  @override
  String get notificationsAlreadyEnabled => 'Notifications déjà activées';

  @override
  String get unrestrictedBattery => 'Ne pas limiter l\'usage de la batterie';

  @override
  String get unrestrictedBatterySubtitle =>
      'Évite qu\'Android arrête la lecture en arrière-plan';

  @override
  String get batteryAlreadyUnrestricted =>
      'L\'usage de la batterie n\'est pas limité';

  @override
  String get sectionIssuesAndSupport => 'Problèmes et assistance';

  @override
  String get bugsAndFeatureRequests => 'Bugs et demandes de fonctionnalités';

  @override
  String get bugsAndFeatureRequestsSubtitle => 'Ouvrir un ticket sur GitHub';

  @override
  String get joinDiscord => 'Rejoindre le serveur Discord';

  @override
  String get joinDiscordSubtitle => 'Communauté, assistance et mises à jour';

  @override
  String get contact => 'Contact';

  @override
  String get contactSubtitle =>
      'Envoyer les informations de l\'appareil par e-mail';

  @override
  String get enableLogging => 'Activer la journalisation';

  @override
  String get enableLoggingOnSubtitle =>
      'Activé - journaux enregistrés dans un fichier (redémarrez pour appliquer)';

  @override
  String get enableLoggingOffSubtitle => 'Désactivé - pas de logs capturés';

  @override
  String get loggingEnabledSnackbar =>
      'Journalisation activée - redémarrez l\'application pour démarrer l\'enregistrement';

  @override
  String get loggingDisabledSnackbar =>
      'Journalisation désactivée - redémarrez l\'application pour arrêter l\'enregistrement';

  @override
  String get sendLogs => 'Envoyer les journaux';

  @override
  String get sendLogsSubtitle =>
      'Partager le fichier de journalisation en pièce jointe';

  @override
  String failedToShare(String error) {
    return 'Échec du partage : $error';
  }

  @override
  String get clearLogs => 'Vider les journaux';

  @override
  String get logsCleared => 'Journaux effacés';

  @override
  String get clearLogsQuestion => 'Vider les journaux ?';

  @override
  String get clearLogsContent =>
      'Cette action est irréversible. Envoyez-les d\'abord si vous pensez en avoir besoin.';

  @override
  String get sectionAdvanced => 'Avancé';

  @override
  String get localServer => 'Serveur local';

  @override
  String get localServerInfoTitle => 'Serveur local';

  @override
  String get localServerInfoContent =>
      'Si vous faites tourner votre serveur Audiobookshelf chez vous, vous pouvez définir ici une URL locale/LAN. Absorb basculera automatiquement sur cette connexion locale, plus rapide, lorsqu’il détecte que vous êtes sur votre réseau domestique, et reviendra à votre URL distante quand vous êtes ailleurs.';

  @override
  String get localServerOnConnectedSubtitle => 'Connecté via le serveur local';

  @override
  String get localServerOnRemoteSubtitle =>
      'Activé - utilise le serveur distant';

  @override
  String get localServerOffSubtitle =>
      'Basculement automatique vers un serveur LAN lorsque vous êtes sur votre Wi‑Fi domestique';

  @override
  String get localServerUrlLabel => 'URL locale du serveur';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar =>
      'URL du serveur local définie - la connexion se fera automatiquement lorsque vous serez sur votre réseau domestique';

  @override
  String get disableAudioFocus => 'Désactiver le focus audio';

  @override
  String get disableAudioFocusInfoTitle => 'Focus audio';

  @override
  String get disableAudioFocusInfoContent =>
      'Par défaut, Android donne le « focus » audio à une application à la fois - quand Absorb joue, d\'autres audio (musique, vidéos) seront mis en pause. La désactivation du focus audio permet à Absorb de jouer en même temps que les autres applications. Les appels téléphoniques mettront toujours en pause la lecture quel que soit la valeur de ce paramètre.';

  @override
  String get disableAudioFocusOnSubtitle =>
      'Activé - lit en même temps que les autres sons (se met quand même en pause pour les appels)';

  @override
  String get disableAudioFocusOffSubtitle =>
      'Désactivé - les autres sons se mettent en pause quand Absorb lit';

  @override
  String get restartRequired => 'Redémarrage requis';

  @override
  String get restartRequiredContent =>
      'Le changement sur le focus audio nécessite un redémarrage complet pour prendre effet. Fermer l\'application maintenant ?';

  @override
  String get closeApp => 'Fermer l\'application';

  @override
  String get trustAllCertificates => 'Faire confiance à tous les certificats';

  @override
  String get trustAllCertificatesInfoTitle => 'Certificats auto-signés';

  @override
  String get mp3IndexSeeking => 'Recherche d\'index MP3';

  @override
  String get mp3IndexSeekingInfoTitle => 'Recherche par index MP3';

  @override
  String get mp3IndexSeekingInfoContent =>
      'Activez cette option uniquement si vous avez des fichiers MP3 qui ne se positionnent pas à la bonne position. Le positionnement inexact provient généralement de MP3 à débit variable (VBR). L\'index cherchant à construire une carte temporelle exacte lorsque le fichier est lu, sauter près de la fin d\'un grand MP3 peut prendre un moment - surtout en streaming, car le fichier doit être lu jusqu\'à ce point. Prend effet la prochaine fois qu\'un livre ou un podcast commence.';

  @override
  String get mp3IndexSeekingOnSubtitle =>
      'Activé - recherche précise pour les fichiers MP3 VBR';

  @override
  String get mp3IndexSeekingOffSubtitle => 'Désactivé - recherche normale';

  @override
  String get trustAllCertificatesInfoContent =>
      'Activez cette option si votre serveur Audiobookshelf utilise un certificat auto-signé ou une AC racine personnalisée. Lorsque cette option est activée, Absorb ignorera la vérification du certificat TLS pour toutes les connexions. N\'activez cette option que si vous faites confiance à votre réseau.';

  @override
  String get trustAllCertificatesOnSubtitle =>
      'Activé - accepter tous les certificats';

  @override
  String get trustAllCertificatesOffSubtitle =>
      'Désactivé - seuls les certificats de confiance sont acceptés';

  @override
  String get supportTheDev => 'Soutenir le développeur';

  @override
  String get buyMeACoffee => 'Offrez moi un café';

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
    return 'Absorb v$version - Serveur $serverVersion';
  }

  @override
  String get backupAndRestore => 'Sauvegarder & Restaurer';

  @override
  String get backupAndRestoreSubtitle =>
      'Sauvegarder ou restaurer tous vos paramètres dans un fichier';

  @override
  String get backUp => 'Sauvegarder';

  @override
  String get restore => 'Restaurer';

  @override
  String get allBookmarks => 'Tous les signets';

  @override
  String get allBookmarksSubtitle => 'Voir les signets de tous les livres';

  @override
  String get switchAccount => 'Changer de compte';

  @override
  String get addAccount => 'Ajouter un compte';

  @override
  String get logOut => 'Se déconnecter';

  @override
  String get includeLoginInfoTitle => 'Inclure les informations de connexion ?';

  @override
  String get includeLoginInfoContent =>
      'Souhaitez‑vous inclure les identifiants de connexion de tous vos comptes enregistrés dans la sauvegarde ?\n\nCela facilite la restauration sur un nouvel appareil, mais le fichier contiendra vos jetons d’authentification.';

  @override
  String get noSettingsOnly => 'Non, paramètres uniquement';

  @override
  String get yesIncludeAccounts => 'Oui, inclure les comptes';

  @override
  String get backupSavedWithAccounts =>
      'Sauvegarde enregistrée (avec les comptes)';

  @override
  String get backupSavedSettingsOnly =>
      'Sauvegarde enregistrée (paramètres seulement)';

  @override
  String backupFailed(String error) {
    return 'Échec de la sauvegarde : $error';
  }

  @override
  String get restoreBackupTitle => 'Restaurer la sauvegarde ?';

  @override
  String get restoreBackupContent =>
      'Tous vos paramètres actuels seront remplacés par ceux de la sauvegarde.';

  @override
  String fromAbsorbVersion(String version) {
    return 'Depuis Absorb v$version';
  }

  @override
  String restoreAccountsChip(int count) {
    return '$count compte(s)';
  }

  @override
  String restoreBookmarksChip(int count) {
    return 'Signets pour $count livre(s)';
  }

  @override
  String get restoreCustomHeadersChip => 'En-têtes personnalisés';

  @override
  String get invalidBackupFile => 'Fichier de sauvegarde invalide';

  @override
  String get settingsRestoredSuccessfully =>
      'Les paramètres ont été restaurés avec succès';

  @override
  String restoreFailed(String error) {
    return 'Échec de la restauration : $error';
  }

  @override
  String get logOutTitle => 'Se déconnecter ?';

  @override
  String get logOutContent =>
      'Cela vous déconnectera. Vos téléchargements resteront sur cet appareil.';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get changePasswordTitle => 'Modifier le mot de passe';

  @override
  String get changePasswordSubtitle =>
      'Mettre à jour votre mot de passe de lecture audio en toute sécurité';

  @override
  String get currentPassword => 'Mot de passe actuel';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get confirmNewPassword => 'Confirmez le nouveau mot de passe';

  @override
  String get passwordChangeEffect =>
      'La modification de votre mot de passe déconnecte vos autres sessions d\'Audiobookshelf. Cet appareil reste connecté.';

  @override
  String get passwordFieldsRequired =>
      'Remplir tous les champs de mot de passe';

  @override
  String get passwordsDoNotMatch =>
      'Les nouveaux mots de passe ne correspondent pas';

  @override
  String get passwordChanged =>
      'Mot de passe modifié. Les autres appareils connectés ont été déconnectés.';

  @override
  String get passwordInvalid => 'Le mot de passe actuel est incorrect';

  @override
  String get passwordChangeUnsupported =>
      'Cette version du serveur ne prend pas en charge les changements de mot de passe sécurisés dans Absorb';

  @override
  String get passwordChangeFailed => 'Impossible de changer votre mot de passe';

  @override
  String get otherUserPasswordResetWarning =>
      'La modification de ce mot de passe déconnecte l\'utilisateur sur tous les autres appareils.';

  @override
  String get manageSessionsTitle => 'Appareils connectés';

  @override
  String get manageSessionsSubtitle =>
      'Examiner et supprimer les sessions Audiobookshelf';

  @override
  String get sessionsCurrent => 'Appareil actuel';

  @override
  String get sessionsUnknownDevice => 'Appareil inconnu';

  @override
  String sessionsLastActive(String date) {
    return 'Dernière activité le $date';
  }

  @override
  String get sessionsNone => 'Aucune session active';

  @override
  String get sessionsLoadMore => 'Charger plus';

  @override
  String get sessionsUnsupported =>
      'La gestion des sessions nécessite Audiobookshelf 2.36 ou plus récentes.';

  @override
  String get sessionsLoadFailed =>
      'Impossible de charger les appareils connectés';

  @override
  String get sessionsLegacyNotice =>
      'Cette connexion n\'a pas de session d\'actualisation, donc Absorb ne peut pas identifier cet appareil dans la liste.';

  @override
  String get sessionsRemove => 'Déconnecter l\'appareil';

  @override
  String get sessionsRemoveTitle => 'Déconnecter cet appareil ?';

  @override
  String get sessionsRemoveContent =>
      'Cela supprime sa session de rafraîchissement. Son accès actuel peut continuer à fonctionner jusqu\'à l\'expiration de ce jeton de courte durée.';

  @override
  String get sessionsRemoved => 'Appareil déconnecté';

  @override
  String get sessionsRemoveFailed => 'Impossible de déconnecter cet appareil';

  @override
  String get sessionsSignOutAll => 'Déconnecter tous les appareils';

  @override
  String get sessionsSignOutAllTitle => 'Déconnexion partout ?';

  @override
  String get sessionsSignOutAllContent =>
      'Cela supprime toutes les sessions de rafraîchissement, y compris cet appareil. Les jetons d\'accès existants peuvent fonctionner jusqu\'à ce qu\'ils expirent.';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return 'Le calendrier utilise l\'heure du serveur ($timeZone)';
  }

  @override
  String get podcastScheduleServerTimeUnknown =>
      'Le calendrier utilise l\'heure du serveur';

  @override
  String get editServerAddressTitle => 'Modifier l\'adresse du serveur';

  @override
  String editServerAddressSubtitle(String username) {
    return 'Mettre à jour l\'adresse de $username. Utilisez ceci si l\'adresse de votre serveur a changé - c\'est toujours le même serveur, juste une nouvelle URL. Vos statistiques et vos téléchargements sont conservés.';
  }

  @override
  String get editServerAddressField => 'Adresse du serveur';

  @override
  String get editServerAddressUpdated => 'Adresse du serveur mise à jour';

  @override
  String get editServerAddressFailed =>
      'Impossible de mettre à jour l\'adresse du serveur';

  @override
  String get editServerAddressAction => 'Modifier l\'adresse du serveur';

  @override
  String get editServerConnectionTitle => 'Modifier la connexion au serveur';

  @override
  String editServerConnectionSubtitle(String username) {
    return 'Mettre à jour l\'adresse du serveur et les en-têtes personnalisés pour $username. Vos statistiques et vos téléchargements sont conservés.';
  }

  @override
  String get editServerConnectionAction => 'Modifier la connexion au serveur';

  @override
  String get editServerConnectionUpdated => 'Connexion au serveur mise à jour';

  @override
  String get editServerConnectionFailed =>
      'Impossible de mettre à jour la connexion au serveur';

  @override
  String get editCustomHeadersDescription =>
      'Utilisé pour les tunnels Cloudflare ou les proxy inversés. Ces en-têtes ne s\'appliquent qu\'à ce compte enregistré.';

  @override
  String get removeAccountAction => 'Supprimer le compte';

  @override
  String get removeAccountTitle => 'Supprimer le compte ?';

  @override
  String removeAccountContent(String username, String server) {
    return 'Supprimer $username sur $server des comptes enregistrés ?\n\nVous pouvez toujours l\'ajouter plus tard en vous connectant à nouveau.';
  }

  @override
  String get switchAccountTitle => 'Changer de compte ?';

  @override
  String switchAccountContent(String username, String server) {
    return 'Passer à $username sur $server?\n\nVotre lecture actuelle sera arrêtée et l\'application se rechargera avec les données de l\'autre compte.';
  }

  @override
  String get switchButton => 'Changer';

  @override
  String get downloadLocationSheetTitle => 'Emplacement des téléchargements';

  @override
  String get downloadLocationSheetSubtitle =>
      'Choisir où les livres audio sont enregistrés';

  @override
  String get currentLocation => 'Emplacement actuel';

  @override
  String get existingDownloadsWarning =>
      'Les téléchargements existants restent à leur emplacement actuel. Seuls les nouveaux téléchargements utilisent le nouveau chemin.';

  @override
  String get chooseFolder => 'Choisir un dossier';

  @override
  String get chooseDownloadFolder => 'Choisir le dossier de téléchargement';

  @override
  String get storagePermissionDenied =>
      'Autorisation d\'accès au stockage définitivement refusée - activez-la dans les paramètres de l\'application';

  @override
  String get openSettings => 'Ouvrir les paramètres';

  @override
  String get storagePermissionRequired =>
      'L\'autorisation de stockage est requise pour les emplacements de téléchargement personnalisés';

  @override
  String get cannotWriteToFolder =>
      'Impossible d\'écrire dans ce dossier - choisissez un autre emplacement ou accordez l\'accès aux fichiers dans les paramètres système';

  @override
  String downloadLocationSetTo(String label) {
    return 'Emplacement de téléchargement défini à $label';
  }

  @override
  String get resetToDefault => 'Réinitialiser aux valeurs par défaut';

  @override
  String get resetToDefaultStorage => 'Rétablir le stockage par défaut';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count téléchargements se trouvent dans un ancien dossier personnalisé qui ne peut plus être ouvert. Téléchargez-les à nouveau ou ignorez cette notification.',
      one:
          '1 téléchargement se trouve dans un ancien dossier personnalisé qui ne peut plus être ouvert. Téléchargez-le à nouveau ou ignorez cette notification.',
    );
    return '$_temp0';
  }

  @override
  String get redownload => 'Re-télécharger';

  @override
  String get redownloadStarted => 'Re-téléchargement';

  @override
  String get dismiss => 'Ignorer';

  @override
  String get tipsAndHiddenFeatures => 'Astuces & fonctionnalités cachées';

  @override
  String get tipsSubtitle => 'Tirez le maximum de Absorb';

  @override
  String get adminTitle => 'Administrateur du serveur';

  @override
  String get adminTasksTitle => 'Activité du serveur';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tâches en cours',
      one: '1 tâche en cours',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => 'Activité récente du serveur';

  @override
  String get adminTasksEmpty =>
      'Aucune tâche n\'est en cours d\'exécution sur le serveur';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return '$added ajouté - $updated mis à jour - $missing manquant';
  }

  @override
  String get adminServer => 'Serveur';

  @override
  String get adminVersion => 'Version';

  @override
  String get adminUsers => 'Utilisateurs';

  @override
  String get adminOnline => 'En ligne';

  @override
  String get adminBackup => 'Sauvegarder';

  @override
  String get adminPurgeCache => 'Purger le cache';

  @override
  String get adminManage => 'Gérer';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return '$userCount comptes - $onlineCount en ligne';
  }

  @override
  String get adminPodcasts => 'Podcasts';

  @override
  String get adminPodcastsSubtitle => 'Recherche, ajout et gestion des séries';

  @override
  String get adminScan => 'Scanner';

  @override
  String get adminScanning => 'Analyse...';

  @override
  String get adminMatchAll => 'Tout faire correspondre';

  @override
  String get adminMatching => 'Correspondance...';

  @override
  String get adminMatchAllTitle => 'Tout faire correspondre ?';

  @override
  String adminMatchAllContent(String name) {
    return 'Faire correspondre les métadonnées de tous les éléments dans $name ? Cela peut prendre un certain temps.';
  }

  @override
  String adminScanStarted(String name) {
    return 'Analyse lancée pour $name';
  }

  @override
  String get adminBackupCreated => 'Sauvegarde créée';

  @override
  String get adminBackupFailed => 'Échec de la sauvegarde';

  @override
  String get adminCachePurged => 'Cache purgé';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => 'Ouvrir dans l\'app';

  @override
  String get adminRmabAdd => 'Ajouter l\'intégration ReadMeABook';

  @override
  String get adminRmabUrlTitle => 'URL ReadMeABook';

  @override
  String get adminRmabUrlHelp =>
      'Collez votre URL avec jeton de connexion. Générez-en un dans RMAB, Admin, Utilisateurs.';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => 'Saisissez une URL http(s) valide';

  @override
  String get adminRmabSaved => 'ReadMeABook enregistré';

  @override
  String get adminRmabRemoved => 'ReadMeABook retiré';

  @override
  String get adminRmabReload => 'Recharger';

  @override
  String get adminRmabLoadFailed =>
      'Impossible de charger ReadMeABook. Vérifiez votre URL.';

  @override
  String get adminRmabConnected => 'Connecté';

  @override
  String get adminRmabAskAdmin =>
      'Demandez une URL de connexion à l\'administrateur de votre serveur';

  @override
  String get adminRmabUrlHelpUser =>
      'Obtenir une URL de connexion depuis l\'administrateur de votre serveur. Ils en génèrent une dans RMAB > Admin > Utilisateurs.';

  @override
  String get adminRmabSettingsInfo =>
      'ReadMeABook est un service auto-hébergé pour demander et télécharger des livres audio. Il doit être installé et configuré par l\'administrateur de votre serveur.';

  @override
  String get rmabConfigTitle => 'Connecter ReadMeABook';

  @override
  String get rmabConfigExplainerAdmin =>
      'ReadMeABook est un service auto-hébergé pour demander des livres audio. Générez un jeton d\'API dans RMAB sous Tableau de bord Admin > Paramètres > API, puis collez l\'URL du serveur et le jeton ci-dessous. Absorb n\'héberge ni ne télécharge aucun contenu, il envoie simplement des requêtes à votre serveur.';

  @override
  String get rmabConfigExplainerUser =>
      'ReadMeABook est un service auto-hébergé pour demander des livres audio. Demandez à l\'administrateur de votre serveur l\'URL RMAB et un jeton d\'API. Absorb n\'héberge ni ne télécharge aucun contenu, il envoie simplement des requêtes à votre serveur.';

  @override
  String get rmabConfigLearnMore => 'En savoir plus sur ReadMeABook';

  @override
  String get rmabConfigBaseUrlLabel => 'URL du serveur RMAB';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.exemple.com';

  @override
  String get rmabConfigTokenLabel => 'Jeton d\'API';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel =>
      'URL de connexion à l\'interface Web (facultatif)';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.exemple.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      'Collez votre URL de connexion automatique pour que vous soyez connecté dans \"Ouvrir dans la vue du navigateur\". Laissez vide pour utiliser une connexion normale.';

  @override
  String get rmabConfigHeadersHelp =>
      'En-têtes supplémentaires envoyés avec chaque requête ReadMeABook pour les proxy inversés comme Cloudflare Access.';

  @override
  String get rmabConfigConnect => 'Connecter';

  @override
  String get rmabConfigDisconnect => 'Déconnecter';

  @override
  String get rmabConfigOpenWebView => 'Ouvrir dans la vue du navigateur';

  @override
  String rmabConfigConnectedAs(String name) {
    return 'Connecté en tant que $name';
  }

  @override
  String get rmabConfigErrorInvalidUrl => 'Entrez une URL http(s) valide';

  @override
  String get rmabConfigErrorMissingToken => 'Entrez votre jeton API';

  @override
  String get rmabConfigErrorUnauthorized => 'Jeton rejeté par le serveur';

  @override
  String get rmabConfigErrorForbidden =>
      'Ce jeton n\'est pas autorisé pour cette action';

  @override
  String get rmabConfigErrorNetwork =>
      'Impossible d\'accéder à RMAB. Vérifiez l\'URL.';

  @override
  String get rmabConfigErrorGeneric => 'Connexion impossible';

  @override
  String get rmabConfigSavedSnackbar => 'ReadMeABook connecté';

  @override
  String get rmabConfigDisconnectedSnackbar => 'ReadMeABook déconnecté';

  @override
  String get rmabRequestCta => 'Demander via ReadMeABook';

  @override
  String get rmabSearchHeader => 'Demander via ReadMeABook';

  @override
  String get rmabSearchHint => 'Rechercher par titre ou auteur';

  @override
  String get rmabSearchEmpty =>
      'Aucune correspondance sur votre serveur ReadMeABook';

  @override
  String get rmabSearchError => 'Impossible de rechercher dans ReadMeABook';

  @override
  String get rmabSearchPrompt => 'Tapez un titre ou un auteur à rechercher';

  @override
  String get rmabSearchFooterPrompt => 'Vous cherchez autre chose ?';

  @override
  String rmabSearchFooterCta(String query) {
    return 'Rechercher \"$query\" sur ReadMeABook';
  }

  @override
  String get rmabBookDetailExplainer =>
      'Cette demande sera envoyée via votre serveur ReadMeABook. L\'administrateur l\'examinera et la traitera. Vous pouvez suivre son évolution dans « Mes demandes » dans la section ReadMeABook.';

  @override
  String get rmabBookAlreadyAvailable => 'Déjà dans votre bibliothèque';

  @override
  String get rmabBookAlreadyRequested => 'Déjà demandé';

  @override
  String get rmabRequestSubmitting => 'Soumission…';

  @override
  String get rmabRequestSent => 'Demande envoyée';

  @override
  String get rmabRequestErrorAlreadyAvailable => 'Déjà dans votre bibliothèque';

  @override
  String get rmabRequestErrorBeingProcessed => 'Déjà traitée';

  @override
  String get rmabRequestErrorDuplicate => 'Vous avez déjà demandé ceci';

  @override
  String get rmabRequestErrorValidation => 'Impossible d\'envoyer la requête';

  @override
  String get rmabRequestErrorUserNotFound =>
      'Le jeton utilisateur n\'existe plus. Reconnectez ReadMeABook.';

  @override
  String get rmabRequestErrorIgnored =>
      'Ce livre est dans votre liste d\'exclusion';

  @override
  String get rmabRequestErrorGeneric => 'Impossible d\'envoyer la demande';

  @override
  String get rmabRequestErrorTokenRejected =>
      'Jeton rejeté par le serveur. Reconnectez ReadMeABook.';

  @override
  String get rmabMyRequestsTab => 'Mes demandes';

  @override
  String get rmabSetupTab => 'Configuration';

  @override
  String get rmabMyRequestsEmpty => 'Vous n\'avez encore demandé aucun livre';

  @override
  String get rmabMyRequestsError => 'Impossible de charger les demandes';

  @override
  String get rmabMyRequestsRefresh => 'Actualiser';

  @override
  String get rmabRequestDetailTitle => 'Détails de la requête';

  @override
  String get rmabRequestDetailStatus => 'Statut';

  @override
  String get rmabRequestDetailRequestedOn => 'Demandé le';

  @override
  String get rmabRequestDetailCompletedOn => 'Complétée le';

  @override
  String get rmabRequestDetailProgress => 'Progression';

  @override
  String get rmabStatusActive => 'En cours';

  @override
  String get rmabStatusWaiting => 'En attente';

  @override
  String get rmabStatusAvailable => 'Disponible';

  @override
  String get rmabStatusDownloaded => 'Téléchargé';

  @override
  String get rmabStatusFailed => 'Échec';

  @override
  String get rmabStatusCancelled => 'Annulé';

  @override
  String get rmabStatusDenied => 'Refusé';

  @override
  String get rmabStatusUnknown => 'Inconnu';

  @override
  String narratedBy(String narrator) {
    return 'Narré par $narrator';
  }

  @override
  String get onAudible => 'sur Audible';

  @override
  String percentComplete(String percent) {
    return '$percent % terminé';
  }

  @override
  String get absorbing => 'Absorption ...';

  @override
  String get absorbAgain => 'Absorber à nouveau';

  @override
  String get absorb => 'Absorb';

  @override
  String get ebookOnlyNoAudio => 'Ebook uniquement - sans audio';

  @override
  String get absorbAudioNotDownloaded => 'Audio non téléchargé';

  @override
  String get absorbAudioNotDownloadedEbookOnly =>
      'Audio non téléchargé, ebook uniquement';

  @override
  String get fullyAbsorbed => 'Entièrement absorbé';

  @override
  String get fullyAbsorbAction => 'Absorber entièrement';

  @override
  String get removeFromAbsorbing => 'Retirer de Lecture';

  @override
  String get addToAbsorbing => 'Ajouter à l\'Absorption';

  @override
  String get absorbNext => 'Absorber ensuite';

  @override
  String get absorbNextAdded => 'Ensuite dans Lecture';

  @override
  String get absorbLast => 'Absorber en dernier';

  @override
  String get absorbNextHint => 'Juste après ce qui est en cours de lecture';

  @override
  String get absorbLastHint => 'À la fin de la liste';

  @override
  String get removedFromAbsorbing => 'Retiré de Lecture';

  @override
  String get addedToAbsorbing => 'Ajouté à Lecture';

  @override
  String get removeFromContinueListening => 'Retirer de Continuer l\'écoute';

  @override
  String get removedFromContinueListening => 'Retiré de Continuer l\'écoute';

  @override
  String get removeFromContinueReading => 'Retirer de Continuer la lecture';

  @override
  String get removedFromContinueReading => 'Retiré de Continuer la lecture';

  @override
  String get sessionAdd => 'Ajouter une session';

  @override
  String get sessionStartLabel => 'Début à';

  @override
  String get sessionAdded => 'Session ajoutée';

  @override
  String get sessionAddFailed => 'Impossible d\'ajouter la session';

  @override
  String get removeSeriesFromContinueSeries => 'Retirer de Continuer la série';

  @override
  String get removedSeriesFromContinueSeries => 'Retiré de Continuer la série';

  @override
  String get couldNotUpdate => 'Mise à jour impossible, réessayez';

  @override
  String get addToPlaylist => 'Ajouter à la liste de lecture';

  @override
  String get addToCollection => 'Ajouter à la collection';

  @override
  String get downloadEbook => 'Télécharger l\'eBook';

  @override
  String get downloadEbookAgain => 'Télécharger à nouveau l\'ebook';

  @override
  String get resetProgress => 'Réinitialiser la progression';

  @override
  String get lookupLocalMetadata => 'Rechercher les métadonnées locales';

  @override
  String get reLookupLocalMetadata =>
      'Rechercher à nouveau les métadonnées locales';

  @override
  String get clearLocalMetadata => 'Effacer les métadonnées locales';

  @override
  String get searchOnGoodreads => 'Rechercher sur Goodreads';

  @override
  String get editServerDetails => 'Modifier les détails du serveur';

  @override
  String get encodeTab => 'Encodage';

  @override
  String get codec => 'Codec';

  @override
  String get bitrate => 'Débit';

  @override
  String get channels => 'Canaux';

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stéréo';

  @override
  String get startM4bEncode => 'Commencer l\'encodage M4B';

  @override
  String get encodeStarted => 'Encodage M4B démarré';

  @override
  String get encodeFailed => 'Impossible de démarrer l\'encodage';

  @override
  String get encodeFinished => 'Encodage M4B terminé';

  @override
  String get currentlyLabel => 'Actuellement :';

  @override
  String encodeOutputPathNote(String path) {
    return 'Le M4B terminé sera mis dans votre dossier de livre audio à: $path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return 'Une sauvegarde de vos fichiers audio d\'origine sera stockée dans : /metadata/cache/items/$itemId/. Assurez-vous de purger périodiquement le cache des éléments.';
  }

  @override
  String get encodeTimeNote => 'L\'encodage peut prendre jusqu\'à 30 minutes.';

  @override
  String get encodeRescanNote =>
      'Si vous avez désactivé l\'observateur, vous devrez scanner à nouveau ce livre audio.';

  @override
  String get aboutSection => 'À propos';

  @override
  String chaptersCount(int count) {
    return 'Chapitres ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return 'Pistes audio ($count)';
  }

  @override
  String libraryFilesCount(int count) {
    return 'Fichiers de la bibliothèque ($count)';
  }

  @override
  String get chapters => 'Chapitres';

  @override
  String get noChaptersBook => 'Ce livre n\'a pas de chapitres';

  @override
  String get noChaptersPodcast => 'Ce podcast n\'a pas de chapitres';

  @override
  String get failedToLoad => 'Échec du chargement';

  @override
  String startedDate(String date) {
    return 'Commencé le $date';
  }

  @override
  String finishedDate(String date) {
    return 'Achevé le $date';
  }

  @override
  String andCountMore(int count) {
    return 'et $count de plus';
  }

  @override
  String get markAsFullyAbsorbedQuestion =>
      'Marquer comme entièrement absorbé ?';

  @override
  String get markAsFullyAbsorbedContent =>
      'Cela définira votre progression à 100% et arrêtera la lecture si ce livre est en cours de lecture.';

  @override
  String get markedAsFinishedNiceWork => 'Marqué comme fini - bravo !';

  @override
  String get failedToUpdateCheckConnection =>
      'Échec de la mise à jour - vérifiez votre connexion';

  @override
  String get markAsNotFinishedQuestion => 'Marquer comme non fini ?';

  @override
  String get markAsNotFinishedContent =>
      'Ceci effacera le statut fini mais conservera votre position actuelle.';

  @override
  String get unmark => 'Désélectionner';

  @override
  String get markedAsNotFinishedBackAtIt =>
      'Marqué comme non fini - on s\'y remet !';

  @override
  String get resetProgressQuestion => 'Réinitialiser la progression ?';

  @override
  String get resetProgressListeningAndReading =>
      'Votre progression d\'écoute et de lecture repassera à 0 %.';

  @override
  String get resetProgressListening =>
      'Votre progression d\'écoute repassera à 0 %.';

  @override
  String get resetProgressReading =>
      'Votre progression de lecture repassera à 0 %.';

  @override
  String get resetProgressMarksUnread =>
      'Le livre sera aussi marqué comme non lu.';

  @override
  String get resetProgressCantUndo => 'Cette action est irréversible.';

  @override
  String get progressResetFreshStart =>
      'Progression réinitialisée - nouveau départ !';

  @override
  String get clearLocalMetadataQuestion => 'Effacer les métadonnées locales ?';

  @override
  String get clearLocalMetadataContent =>
      'Cela supprimera les métadonnées stockées localement et réutilisera ce que le serveur possède.';

  @override
  String get localMetadataCleared => 'Métadonnées locales effacées';

  @override
  String get saveEbook => 'Enregistrer l\'eBook';

  @override
  String get noEbookFileFound => 'Aucun fichier ebook trouvé';

  @override
  String get bookmark => 'Signet';

  @override
  String get bookmarks => 'Signets';

  @override
  String bookmarksWithCount(int count) {
    return 'Signets ($count)';
  }

  @override
  String get playbackSpeed => 'Vitesse de lecture';

  @override
  String get noBookmarksYet => 'Aucun signet pour l\'instant';

  @override
  String get longPressBookmarkHint =>
      'Appuyez longuement sur le bouton de signet pour enregistrer rapidement';

  @override
  String get addBookmark => 'Ajouter un signet';

  @override
  String get editBookmark => 'Modifier le signet';

  @override
  String get titleLabel => 'Titre';

  @override
  String get noteOptionalLabel => 'Note (facultatif)';

  @override
  String get editLayout => 'Modifier la disposition';

  @override
  String get inMenu => 'Dans le menu';

  @override
  String get bookmarkAdded => 'Signet ajouté';

  @override
  String get startPlayingSomethingFirst => 'Lancez d\'abord une lecture';

  @override
  String get playbackHistory => 'Historique de lecture';

  @override
  String get historyLocalTab => 'Historique';

  @override
  String get historyServerTab => 'Sessions';

  @override
  String get historyNoServerSessions =>
      'Aucune session serveur pour cet élément pour le moment';

  @override
  String get historyServerLoadFailed =>
      'Impossible de charger les sessions du serveur';

  @override
  String get clearHistoryTooltip => 'Effacer l\'historique';

  @override
  String get tapEventToJump =>
      'Appuyez sur un événement pour aller à cette position';

  @override
  String get noHistoryYet => 'L\'historique est vide pour l\'instant';

  @override
  String jumpedToPosition(String position) {
    return 'Déplacé à $position';
  }

  @override
  String booksInSeriesCount(int count) {
    return '$count livres dans cette série';
  }

  @override
  String bookNumber(String number) {
    return 'Livre $number';
  }

  @override
  String downloadRemainingCount(int count) {
    return 'Télécharger le reste ($count)';
  }

  @override
  String get downloadAll => 'Tout télécharger';

  @override
  String get markAllNotFinished => 'Tout marquer comme non fini';

  @override
  String get markAllFinished => 'Tout marquer comme fini';

  @override
  String get markAllNotFinishedQuestion => 'Tout marquer comme non fini ?';

  @override
  String get fullyAbsorbSeries => 'Absorber entièrement la série ?';

  @override
  String get turnAutoDownloadOff => 'Désactiver le téléchargement auto';

  @override
  String get turnAutoDownloadOn => 'Activer le téléchargement auto';

  @override
  String get autoDownloadThisSeries => 'Téléchargement auto de cette série ?';

  @override
  String get autoDownloadSeriesContent =>
      'Télécharge automatiquement les livres suivants pendant que vous écoutez.';

  @override
  String get standalone => 'Autonome';

  @override
  String get episodes => 'Épisodes';

  @override
  String get noEpisodesFound => 'Aucun épisode trouvé';

  @override
  String get markFinished => 'Marqué comme terminé';

  @override
  String get markUnfinished => 'Marquer comme inachevé';

  @override
  String get allEpisodes => 'Tous les épisodes';

  @override
  String get aboutThisEpisode => 'À propos de cet épisode';

  @override
  String get reversePlayOrder => 'Inverser l\'ordre de lecture';

  @override
  String selectedCount(int count) {
    return '$count sélectionné(s)';
  }

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String get deselectAll => 'Tout désélectionner';

  @override
  String get autoDownloadThisPodcast => 'Téléchargement auto de ce podcast ?';

  @override
  String get autoDownloadPodcastContent =>
      'Télécharger automatiquement les prochains épisodes au fur et à mesure de votre écoute.';

  @override
  String get download => 'Télécharger';

  @override
  String get deleteDownload => 'Supprimer le téléchargement';

  @override
  String get casting => 'Diffusion';

  @override
  String get castingTo => 'Diffusion vers';

  @override
  String get editDetails => 'Modifier les détails';

  @override
  String get quickMatch => 'Correspondance rapide';

  @override
  String get quickMatchNoUpdates => 'Aucune mise à jour nécessaire';

  @override
  String get custom => 'Personnalisé';

  @override
  String get authorOptionalLabel => 'Auteur (facultatif)';

  @override
  String get noResultsFound =>
      'Aucun résultat.\nEssayez de modifier votre recherche ou le fournisseur.';

  @override
  String get searchForMetadataAbove => 'Recherchez des métadonnées ci-dessus';

  @override
  String get applyThisMatch => 'Appliquer cette correspondance ?';

  @override
  String get metadataUpdated => 'Métadonnées mises à jour';

  @override
  String get failedToUpdateMetadata =>
      'Échec de la mise à jour des métadonnées';

  @override
  String get subtitleLabel => 'Sous-titre';

  @override
  String get authorLabel => 'Auteur';

  @override
  String get narratorLabel => 'Narrateur';

  @override
  String get seriesLabel => 'Séries';

  @override
  String get addSeries => 'Ajouter une série';

  @override
  String get removeSeries => 'Supprimer les séries';

  @override
  String get descriptionLabel => 'Description';

  @override
  String get publisherLabel => 'Éditeur';

  @override
  String get yearLabel => 'Année';

  @override
  String get genresLabel => 'Genres';

  @override
  String get tagsLabel => 'Tags';

  @override
  String get commaSeparated => 'Séparé par des virgules';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => 'Image de couverture';

  @override
  String get coverRemove => 'Retirer la couverture';

  @override
  String get coverRemoveConfirm =>
      'Supprimer la couverture de ce livre ? La carte de titre générée sera visible à la place.';

  @override
  String get coverRemoved => 'Couverture retirée';

  @override
  String get coverRemoveFailed => 'Impossible de retirer la couverture';

  @override
  String get coverUrlLabel => 'URL de la couverture';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => 'Métadonnées locales';

  @override
  String get overrideLocalDisplay => 'Remplacer l\'affichage local';

  @override
  String get metadataSavedLocally => 'Métadonnées enregistrées localement';

  @override
  String get notes => 'Notes';

  @override
  String get newNote => 'Nouvelle note';

  @override
  String get editNote => 'Éditer la note';

  @override
  String get noNotesYet => 'Aucune note pour le moment';

  @override
  String get markdownIsSupported => 'Markdown est pris en charge';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => 'Conserve la mise en forme';

  @override
  String get plainTextTxt => 'Texte brut (.txt)';

  @override
  String get simpleTextNoFormatting => 'Texte simple, sans mise en forme';

  @override
  String get untitledNote => 'Note sans titre';

  @override
  String get titleHint => 'Titre';

  @override
  String get noteBodyHint => 'Écrivez votre note... (Markdown pris en charge)';

  @override
  String get nothingToPreview => 'Rien à prévisualiser';

  @override
  String get audioEnhancements => 'Améliorations audio';

  @override
  String get presets => 'PRÉRÉGLAGES';

  @override
  String get equalizer => 'ÉGALISEUR';

  @override
  String get effects => 'EFFETS';

  @override
  String get bassBoost => 'Amplification des basses';

  @override
  String get surround => 'Surround';

  @override
  String get loudness => 'Volume';

  @override
  String get monoAudio => 'Audio mono';

  @override
  String get skipSilence => 'Sauter les silences';

  @override
  String get resetAll => 'Tout réinitialiser';

  @override
  String get collectionNotFound => 'Collection introuvable';

  @override
  String get deleteCollection => 'Supprimer la collection';

  @override
  String get deleteCollectionContent =>
      'Voulez-vous vraiment effacer cette collection ?';

  @override
  String get deleteCollectionFailed => 'Impossible d\'effacer la collection';

  @override
  String get deletePermissionRequired =>
      'La permission de suppression est requise. Demandez à l\'administrateur root de vous accorder la permission de suppression.';

  @override
  String get deleteFilesCheckbox => 'Effacer aussi les fichiers sur le serveur';

  @override
  String get deleteFilesCheckedHint =>
      'Les fichiers sont effacés définitivement du serveur.';

  @override
  String get deleteFilesUncheckedHint =>
      'Les fichiers restent sur le serveur, la prochaine analyse de la bibliothèque peut le rajouter.';

  @override
  String get deleteFromServerAction => 'Effacer du serveur';

  @override
  String get deleteFromServerTitle => 'Effacer du serveur';

  @override
  String deleteFromServerContent(String title) {
    return 'Effacer « $title » d\'Audiobookshelf ?';
  }

  @override
  String deletedFromServer(String title) {
    return '« $title » effacé';
  }

  @override
  String get deleteFromServerFailed =>
      'Impossible de l\'effacer. Consultez les journaux du serveur.';

  @override
  String get playlistNotFound => 'Liste de lecture introuvable';

  @override
  String get deletePlaylist => 'Supprimer la liste de lecture';

  @override
  String get deletePlaylistContent =>
      'Voulez-vous vraiment effacer cette liste de lecture ?';

  @override
  String get newPlaylist => 'Nouvelle liste de lecture';

  @override
  String get playlistNameHint => 'Nom de la liste de lecture';

  @override
  String addedToName(String name) {
    return 'Ajouté à \"$name\"';
  }

  @override
  String get failedToAdd => 'Échec de l\'ajout';

  @override
  String get newCollection => 'Nouvelle collection';

  @override
  String get collectionNameHint => 'Nom de la collection';

  @override
  String get listsNewCollectionSubtitle =>
      'Regroupez des livres dans une liste que vous conservez';

  @override
  String get listsNewCollectionNeedsBookSubtitle =>
      'Commencez-la avec au moins un livre';

  @override
  String get listsNewPlaylistSubtitle =>
      'Alignez des livres à écouter dans l\'ordre';

  @override
  String get listsAddBooksNow => 'Ajouter des livres maintenant';

  @override
  String get listsPickBooksNext =>
      'Vous choisirez des livres ensuite. Une collection sur ce serveur en nécessite au moins un.';

  @override
  String get listsCreate => 'Créer';

  @override
  String get listsCollectionNeedsBook =>
      'Une collection nécessite au moins un livre, rien n\'a donc été créé.';

  @override
  String get listsCreateFailed => 'Impossible de la créer';

  @override
  String get castToDevice => 'Diffuser sur un appareil';

  @override
  String get searchingForCastDevices => 'Recherche d\'appareils Cast...';

  @override
  String get castDevice => 'Appareil Cast';

  @override
  String get stopCasting => 'Arrêter la diffusion';

  @override
  String get disconnect => 'Déconnecter';

  @override
  String get audioOutput => 'Sortie audio';

  @override
  String get noOutputDevicesFound => 'Aucun périphérique de sortie trouvé';

  @override
  String get welcomeToAbsorb => 'Bienvenue dans Absorb';

  @override
  String get welcomeTagline => 'Un client Audiobookshelf.';

  @override
  String get welcomeAbsorbingTitle => 'Absorption';

  @override
  String get welcomeAbsorbingIntro =>
      'Nous utilisons \"absorber\" à la place de \"jouer\" et \"écouter\". Vous préférez le libellé classique ? Changez-le dans les paramètres.';

  @override
  String get welcomeAbsorbingTabBullet =>
      'Onglet Lecture - ce que vous écoutez en ce moment';

  @override
  String get welcomeAbsorbButtonBullet => 'Bouton Absorber - lancer la lecture';

  @override
  String get welcomeFullyAbsorbBullet =>
      'Absorber entièrement - marquer comme fini';

  @override
  String get welcomeGettingAroundTitle => 'Se repérer';

  @override
  String get welcomeGettingAroundBody =>
      'Appuyez sur n\'importe quelle couverture pour ouvrir ses détails. Les cartes de poursuite d\'écoute sont différentes - touchez pour jouer immédiatement, appuyez et maintenez pour ouvrir les détails.';

  @override
  String get welcomeMakeItYoursTitle => 'Personnalisez-le';

  @override
  String get welcomeMakeItYoursBody =>
      'Explorez les paramètres pour ajuster Absorb à votre goût. La section Astuce & Fonctionnalités cachées qui s\'y trouve vaut la peine d\'être regardée.';

  @override
  String get getStarted => 'Commencer';

  @override
  String get showMore => 'Afficher plus';

  @override
  String get showLess => 'Afficher moins';

  @override
  String get readMore => 'Lire plus';

  @override
  String get removeDownloadQuestion => 'Supprimer le téléchargement ?';

  @override
  String get removeDownloadContent => 'Ceci sera retiré de votre appareil.';

  @override
  String get removeWhichDownload =>
      'Le livre audio et l\'ebook sont tous deux sur cet appareil. Choisissez ce qu\'il faut retirer.';

  @override
  String get downloadRemoved => 'Téléchargement supprimé';

  @override
  String get finished => 'Terminé';

  @override
  String get saved => 'Téléchargé';

  @override
  String get selectLibrary => 'Choisir la bibliothèque';

  @override
  String get switchLibraryTooltip => 'Changer de bibliothèque';

  @override
  String get refreshTooltip => 'Actualiser';

  @override
  String get noBooksFound => 'Aucun livre trouvé';

  @override
  String get userFallback => 'Utilisateur';

  @override
  String get rootAdmin => 'Administrateur Root';

  @override
  String get admin => 'Admin';

  @override
  String get serverAdmin => 'Administrateur du serveur';

  @override
  String get serverAdminSubtitle =>
      'Gérer les utilisateurs, les bibliothèques et les paramètres du serveur';

  @override
  String serverUpdateAvailable(String version) {
    return 'Mise à jour du serveur $version disponible';
  }

  @override
  String get justNow => 'À l\'instant';

  @override
  String minutesAgo(int count) {
    return 'Il y a $count min';
  }

  @override
  String hoursAgo(int count) {
    return 'Il y a $count h';
  }

  @override
  String daysAgo(int count) {
    return 'Il y a $count j';
  }

  @override
  String get audible => 'Audible';

  @override
  String get iTunes => 'iTunes';

  @override
  String get openLibrary => 'Ouvrir la bibliothèque';

  @override
  String get root => 'Racine';

  @override
  String get coverPlayPause => 'Lecture/pause sur la couverture';

  @override
  String get coverPlayPauseOnSubtitle =>
      'Activé - appuyez sur la couverture pour lire/mettre en pause';

  @override
  String get coverPlayPauseOffSubtitle =>
      'Désactivé - bouton lecture/pause dédié dans les commandes';

  @override
  String get cardBackground => 'Arrière-plan de la carte';

  @override
  String get cardBackgroundBlurred => 'Flou';

  @override
  String get cardBackgroundGradient => 'Dégradé';

  @override
  String get queueModeMergedSubtitle =>
      'Arrêts de lecture, file d\'attente manuelle ou lecture automatique de l\'élément suivant';

  @override
  String get queueModeSeriesLabel => 'Séries';

  @override
  String get queueModeShowLabel => 'Afficher';

  @override
  String get queueModeInfoSeries => 'Séries';

  @override
  String get queueModeInfoSeriesDesc =>
      'Joue automatiquement le livre suivant dans une série ou le prochain épisode dans une série de podcasts.';

  @override
  String get resetButtonGridQuestion => 'Réinitialiser la grille de boutons ?';

  @override
  String get resetButtonGridContent =>
      'Cela restaurera la disposition, l\'ordre et les paramètres par défaut des boutons.';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get buttonGridReset => 'Réinitialiser la grille de boutons';

  @override
  String get resetButtonGrid => 'Réinitialiser la grille de boutons';

  @override
  String get chapterBarrierOnRewind => 'Barrière de chapitre au retour arrière';

  @override
  String get chapterBarrierInfoTitle => 'Barrière de chapitre';

  @override
  String get chapterBarrierInfoContent =>
      'Lorsque vous sautez en arrière, la lecture s\'accroche au début du chapitre actuel au lieu de passer au précédent.\n\nAppuyez deux fois sur le bouton retour en arrière en 2 secondes pour franchir la barrière.';

  @override
  String get chapterBarrierOnRewindOnSubtitle =>
      'Activé - le retour arrière s\'arrête au début du chapitre';

  @override
  String get chapterBarrierOnRewindOffSubtitle =>
      'Désactivé - le retour arrière franchit les limites de chapitre';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return 'Activé - de $min s à $max s selon la durée de la pause';
  }

  @override
  String get rewindOnSessionStart => 'Retour arrière au début de session';

  @override
  String get rewindOnSessionStartInfoContent =>
      'Le retour automatique normal se déclenche lorsque vous redémarrez après une pause dans une session active. Ce paramètre ajoute un retour en arrière lors du démarrage d\'une nouvelle session - par exemple après la fermeture de l\'application, lorsque la lecture a été arrêtée, ou si vous ouvrez l\'application à nouveau.\n\nQuand activé, la lecture redémarre par la quantité maximum de rembobinage au début de chaque nouvelle session afin que vous puissiez réentendre là où vous vous êtiez arrêté.';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return 'Activé - recule de $seconds s au début d\'une nouvelle session';
  }

  @override
  String rewindActivationDelayValue(String seconds) {
    return '$seconds s+';
  }

  @override
  String rewindRangeValue(String min, String max) {
    return '${min}s – ${max}s';
  }

  @override
  String rewindSecondsPause(String seconds) {
    return 'Pause de ${seconds}s';
  }

  @override
  String rewindMinPause(String minutes) {
    return 'Pause de $minutes min';
  }

  @override
  String rewindHrPause(String hours) {
    return 'Pause de $hours h';
  }

  @override
  String get rewindOneHrPause => '1 heure de pause';

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
  String get chimeBeforeSleep => 'Carillon avant la veille';

  @override
  String get chimeBeforeSleepOnSubtitle =>
      'Joue une cloche douce quand le minuteur est sur le point de se terminer';

  @override
  String get chimeBeforeSleepOffSubtitle =>
      'Aucun avertissement sonore avant la veille';

  @override
  String get windDownDuration => 'Durée de l\'extinction progressive';

  @override
  String windDownDurationSubtitle(int seconds) {
    return 'Le fondu et le carillon commencent $seconds s avant la veille';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return 'Baisse progressivement le volume pendant les $seconds dernières s';
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
  String get endOfChapterShort => 'Fin de chapitre';

  @override
  String get endOfChapterOnSubtitle => 'Arrêter à la fin du chapitre en cours';

  @override
  String get endOfChapterOffSubtitle =>
      'Utiliser un minuteur de veille chronométré';

  @override
  String get showExplicitBadge => 'Afficher le badge explicite';

  @override
  String get showExplicitBadgeOnSubtitle =>
      'Les éléments explicites affichent un badge « E »';

  @override
  String get showExplicitBadgeOffSubtitle =>
      'Désactivé - badge explicite masqué';

  @override
  String get showEbookBadge => 'Afficher le badge ebook';

  @override
  String get showEbookBadgeOnSubtitle =>
      'Les livres avec un ebook affichent une icône de livre sur la couverture';

  @override
  String get showEbookBadgeOffSubtitle => 'Désactivé - badge ebook masqué';

  @override
  String get libraryFallback => 'Bibliothèque';

  @override
  String get preReleaseUpdatesInfoTitle => 'Mises à jour préliminaires';

  @override
  String get preReleaseUpdatesInfoContent =>
      'Lorsque cette option est activée, le vérificateur de mise à jour vous informera également des versions alpha et pré-versions de GitHub. Elles peuvent être moins stables mais incluent les dernières fonctionnalités et correctifs.';

  @override
  String get includePreReleases => 'Inclure les préversions';

  @override
  String get includePreReleasesOnSubtitle =>
      'Activé - recherche des versions alpha et préversions';

  @override
  String get includePreReleasesOffSubtitle =>
      'Désactivé - versions stables uniquement';

  @override
  String get setTooltip => 'Définir';

  @override
  String get saveAbsorbBackup => 'Enregistrer la sauvegarde d\'Absorb';

  @override
  String get checkForUpdate => 'Rechercher les mises à jour';

  @override
  String get onLatestVersion => 'Vous avez la dernière version';

  @override
  String get updateAvailable => 'Mise à jour disponible';

  @override
  String get preReleaseAvailable => 'Préversion disponible';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'Une nouvelle $kind d\'Absorb est disponible : $latest\n\nVous êtes sur $current.';
  }

  @override
  String get updateKindPreRelease => 'préversion';

  @override
  String get updateKindVersion => 'version';

  @override
  String get downloadButton => 'Télécharger';

  @override
  String get updateDownloading => 'Téléchargement de la mise à jour...';

  @override
  String get updateInstallPermissionDenied =>
      'Autorisation d\'installation refusée. Activez \"Installer des applications inconnues\" pour Absorb dans les paramètres du système.';

  @override
  String get updateOpeningInBrowser =>
      'Échec de la mise à jour dans l\'app, ouverture du navigateur';

  @override
  String get sendToEreader => 'Envoyer vers l\'E-Reader';

  @override
  String sendingToEreader(String device) {
    return 'Envoi à $device...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return 'Envoyé à $device';
  }

  @override
  String get sendToEreaderFailed => 'Impossible d\'envoyer l\'ebook';

  @override
  String get pickEreaderDevice => 'Choisissez un appareil';

  @override
  String get adminEmail => 'Courriel';

  @override
  String get adminEmailSubtitle => 'SMTP et liseuses';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => 'Guide de configuration';

  @override
  String get smtpHost => 'Hôte';

  @override
  String get smtpPort => 'Port';

  @override
  String get smtpSecure => 'Sécurisé';

  @override
  String get smtpRejectUnauthorized => 'Rejeter le TLS non autorisé';

  @override
  String get smtpUser => 'Utilisateur';

  @override
  String get smtpPass => 'Mot de passe';

  @override
  String get smtpFromAddress => 'Adresse de l\'expéditeur';

  @override
  String get smtpTestAddress => 'Adresse de test';

  @override
  String get smtpSendTest => 'Envoyer un test';

  @override
  String get smtpSaveSettings => 'Enregistrer';

  @override
  String get smtpSaved => 'Paramètres e-mail enregistrés';

  @override
  String get smtpSaveFailed =>
      'Impossible d\'enregistrer les paramètres e-mail';

  @override
  String get smtpTestSent => 'Email de test envoyé';

  @override
  String get smtpTestFailed => 'L\'email de test a échoué';

  @override
  String get ereaderDevicesTitle => 'Appareils de lecture électronique';

  @override
  String get ereaderDevicesEmpty =>
      'Aucun appareil pour le moment. Ajoutez-en un ci-dessous.';

  @override
  String get addEreaderDevice => 'Ajouter un appareil';

  @override
  String get editEreaderDevice => 'Modifier l\'appareil';

  @override
  String get deleteEreaderDevice => 'Supprimer';

  @override
  String get ereaderDeviceName => 'Nom';

  @override
  String get ereaderDeviceEmail => 'Courriel';

  @override
  String get ereaderAvailability => 'Qui peut utiliser cet appareil';

  @override
  String get ereaderAvailAdminOrUp => 'Admins uniquement';

  @override
  String get ereaderAvailUserOrUp => 'Tous les utilisateurs';

  @override
  String get ereaderAvailGuestOrUp => 'Tout le monde';

  @override
  String get ereaderAvailSpecificUsers => 'Utilisateurs spécifiques';

  @override
  String ereaderSpecificUsersN(int count) {
    return 'Utilisateurs spécifiques ($count)';
  }

  @override
  String get ereaderDevicesSaved => 'Appareils enregistrés';

  @override
  String get ereaderDevicesSaveFailed =>
      'Impossible d\'enregistrer les appareils';

  @override
  String libraryCountOne(int count) {
    return '$count bibliothèque';
  }

  @override
  String libraryCountOther(int count) {
    return '$count bibliothèques';
  }

  @override
  String serverVersionLabel(String version) {
    return 'Serveur $version';
  }

  @override
  String appVersionServerSuffix(String version) {
    return '  ·  Serveur $version';
  }

  @override
  String backupDateFormat(int month, int day, int year) {
    return '$day/$month/$year';
  }

  @override
  String get backupDetailsSeparator => ' · ';

  @override
  String get bookmarksSortedByPositionReversed => 'Trié par position (inversé)';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '« $title » à $position';
  }

  @override
  String get deleteBookmarkQuestion => 'Supprimer le signet ?';

  @override
  String get cardIconsOnlyChip => 'Icônes uniquement';

  @override
  String get cardMoreInGridChip => '« Plus » dans la grille';

  @override
  String get cardLayoutHidden => 'Masqué';

  @override
  String get speed => 'Vitesse';

  @override
  String get details => 'Détails';

  @override
  String get episodeDetailsLabel => 'Détails de l\'épisode';

  @override
  String get bookDetailsLabel => 'Détails du livre';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => 'Égaliseur';

  @override
  String get cast => 'Cast';

  @override
  String castingToDevice(String device) {
    return 'Diffusion vers $device';
  }

  @override
  String castToDeviceNamed(String device) {
    return 'Diffuser vers $device';
  }

  @override
  String get historyShort => 'Historique';

  @override
  String atPosition(String position) {
    return 'à $position';
  }

  @override
  String chaptersChip(int count) {
    return '$count chapitres';
  }

  @override
  String chapterNumber(int number) {
    return 'Chapitre $number';
  }

  @override
  String kbpsValue(int value) {
    return '$value kbps';
  }

  @override
  String get fileInfoTitle => 'Infos sur les fichiers';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '1 fichier',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => 'Ce livre n\'a aucun détail de fichier.';

  @override
  String get fileInfoAudio => 'Audio';

  @override
  String get fileInfoEbook => 'Ebook';

  @override
  String get fileInfoOther => 'Autres fichiers';

  @override
  String get fileInfoBookOrbitNote =>
      'BookOrbit n\'indique ni le codec ni le débit.';

  @override
  String fileInfoChannels(int count) {
    return '$count canaux';
  }

  @override
  String get fileInfoCover => 'Couverture';

  @override
  String get fileInfoMetadata => 'Métadonnées';

  @override
  String get fileInfoSupplement => 'Supplément';

  @override
  String get fileInfoPathCopied => 'Chemin copié';

  @override
  String get resetMayNotHaveSynced =>
      'La réinitialisation n\'a peut-être pas été synchronisée - vérifiez votre serveur';

  @override
  String failedToDownloadEbook(int code) {
    return 'Échec du téléchargement de l\'ebook ($code)';
  }

  @override
  String get serverReturnedErrorPage =>
      'Le serveur a renvoyé une page d\'erreur au lieu du fichier ebook';

  @override
  String ebookSaved(String filename) {
    return '$filename enregistré';
  }

  @override
  String errorSavingEbook(String error) {
    return 'Erreur lors de l\'enregistrement de l\'ebook : $error';
  }

  @override
  String failedToSaveError(String error) {
    return 'Échec de l\'enregistrement : $error';
  }

  @override
  String get adminBackupsLabel => 'Sauvegardes';

  @override
  String get adminListeningNow => 'À l\'écoute en ce moment';

  @override
  String get adminLibraries => 'Bibliothèques';

  @override
  String get adminLibraryShows => 'séries';

  @override
  String get adminLibraryBooks => 'livres';

  @override
  String get adminLibraryFolders => 'dossiers';

  @override
  String get adminLibrarySize => 'taille';

  @override
  String get adminLibraryDuration => 'durée';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments manquants ou invalides',
      one: '1 élément manquant ou invalide',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => 'Vérification';

  @override
  String get adminMissingTitle => 'Éléments manquants';

  @override
  String adminMissingSubtitle(String library) {
    return 'Entrées de $library dont les fichiers sont manquants ou illisibles';
  }

  @override
  String get adminMissingNone => 'Aucun élément manquant ou invalide';

  @override
  String get adminMissingBadge => 'Manquant';

  @override
  String get adminInvalidBadge => 'Invalide';

  @override
  String get adminMissingDeleteTitle => 'Supprimer l\'élément';

  @override
  String adminMissingDeleteOneContent(String title) {
    return 'Retirer « $title » d\'Audiobookshelf ?';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return 'Retirer $count entrées d\'Audiobookshelf ?';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return 'Effacer $count';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return '$title supprimé';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entrées retirées',
      one: '1 entrée retirée',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => 'Impossible d\'effacer l\'entrée';

  @override
  String get adminMatchAction => 'Faire correspondre';

  @override
  String adminMatchingStarted(String name) {
    return 'Correspondance lancée pour $name';
  }

  @override
  String get adminMatchFailed => 'Échec';

  @override
  String adminScanFailed(String name) {
    return 'Échec de l\'analyse de $name';
  }

  @override
  String get adminPurgeCacheFailed => 'Échec';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => 'admin';

  @override
  String get adminUsersDisabledBadge => 'désactivé';

  @override
  String get adminUsersEditUserTooltip => 'Modifier l’utilisateur';

  @override
  String get adminUsersOnlineNow => 'En ligne actuellement';

  @override
  String adminUsersLastSeen(String time) {
    return 'Vu pour la dernière fois $time';
  }

  @override
  String get adminUsersNever => 'Jamais';

  @override
  String get adminUsersTotal => 'Total';

  @override
  String get adminUsersNoReadingActivity => 'Aucune activité de lecture';

  @override
  String get adminUsersLoadingDots => 'Chargement...';

  @override
  String get adminUsersLoadMoreSessions => 'Charger plus de sessions';

  @override
  String get adminUsersNoRecentSessions => 'Aucune session récente';

  @override
  String get adminUsersLibraryProgress => 'Progression de la bibliothèque';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return 'Charger plus ($count restants)';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return 'il y a $count mois';
  }

  @override
  String get adminUsersNewUser => 'Nouvel utilisateur';

  @override
  String get adminUsersEditUser => 'Modifier l’utilisateur';

  @override
  String get adminUsersUsername => 'Utilisateur';

  @override
  String get adminUsersEnterUsername => 'Saisissez le nom d\'utilisateur';

  @override
  String get adminUsersPassword => 'Mot de passe';

  @override
  String get adminUsersNewPassword => 'Nouveau mot de passe';

  @override
  String get adminUsersEnterPassword => 'Saisissez le mot de passe';

  @override
  String get adminUsersLeaveBlankToKeep =>
      'Laissez vide pour conserver l\'actuel';

  @override
  String get adminUsersAccountType => 'Type de compte';

  @override
  String get adminUsersTypeGuest => 'Invité';

  @override
  String get adminUsersTypeUser => 'Utilisateur';

  @override
  String get adminUsersTypeAdmin => 'Admin';

  @override
  String get adminUsersStatus => 'Statut';

  @override
  String get adminUsersAccountActive => 'Compte actif';

  @override
  String get adminUsersAccountActiveSub =>
      'Les comptes désactivés ne peuvent pas se connecter';

  @override
  String get adminUsersLocked => 'Verrouillé';

  @override
  String get adminUsersLockedSub => 'Empêche les changements de mot de passe';

  @override
  String get adminUsersPermissions => 'Permissions';

  @override
  String get adminUsersPermDownload => 'Télécharger';

  @override
  String get adminUsersPermUpdate => 'Mise à jour';

  @override
  String get adminUsersPermUpdateSub =>
      'Modifier les métadonnées et les éléments de la bibliothèque';

  @override
  String get adminUsersPermDelete => 'Supprimer';

  @override
  String get adminUsersPermUpload => 'Téléverser';

  @override
  String get adminUsersPermExplicit => 'Contenu explicite';

  @override
  String get adminUsersLibraryAccess => 'Accès aux bibliothèques';

  @override
  String get adminUsersAccessAllLibraries => 'Accès à toutes les bibliothèques';

  @override
  String get adminUsersCreateUser => 'Créer un utilisateur';

  @override
  String get adminUsersSaveChanges => 'Enregistrer les modifications';

  @override
  String get adminUsersUsernameRequired =>
      'Le nom d\'utilisateur est obligatoire';

  @override
  String get adminUsersPasswordRequired => 'Le mot de passe est obligatoire';

  @override
  String get adminUsersUserCreated => 'Utilisateur créé';

  @override
  String get adminUsersUserUpdated => 'Utilisateur mis à jour';

  @override
  String get adminUsersFailedCreate => 'Impossible de créer l\'utilisateur';

  @override
  String get adminUsersFailedUpdate =>
      'Impossible de mettre à jour l\'utilisateur';

  @override
  String get adminUsersThisUser => 'cet utilisateur';

  @override
  String get adminUsersDeleteUserTitle => 'Supprimer l\'utilisateur ?';

  @override
  String adminUsersDeleteUserContent(String name) {
    return 'Effacer $name définitivement ?';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return '$name supprimé';
  }

  @override
  String get adminUsersFailedDelete => 'Impossible d\'effacer l\'utilisateur';

  @override
  String get adminUsersUnlinkOpenId => 'Dissocier OpenID';

  @override
  String get adminUsersUnlinkOpenIdTitle => 'Dissocier OpenID ?';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return 'Supprimer la connexion OpenID pour $name? Il devra se connecter à nouveau avec OpenID pour ré-associer.';
  }

  @override
  String get adminUsersOpenIdUnlinked => 'OpenID dissocié';

  @override
  String get adminUsersFailedUnlinkOpenId => 'Impossible de dissocier OpenID';

  @override
  String adminUsersByAuthor(String author) {
    return 'par $author';
  }

  @override
  String get adminUsersListened => 'Écouté';

  @override
  String get adminUsersStartedAtPosition => 'Commencé à la position';

  @override
  String get adminUsersEndedAtPosition => 'Terminé à la position';

  @override
  String get adminUsersTotalDuration => 'Durée totale';

  @override
  String get adminUsersStarted => 'Commencé';

  @override
  String get adminUsersUpdated => 'Mis à jour';

  @override
  String get adminUsersClient => 'Client';

  @override
  String get adminUsersDevice => 'Appareil';

  @override
  String get adminUsersOs => 'OS';

  @override
  String get adminUsersPlayMethod => 'Méthode de lecture';

  @override
  String get adminUsersPlayDirect => 'Lecture directe';

  @override
  String get adminUsersPlayDirectStream => 'Flux direct';

  @override
  String get adminUsersPlayTranscode => 'Transcoder';

  @override
  String get adminUsersPlayLocal => 'Local';

  @override
  String get adminPodcastsCheckNewEpisodesTitle =>
      'Rechercher de nouveaux épisodes';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      'Cela vérifiera les flux RSS de toutes les podcasts et téléchargera les nouveaux épisodes trouvés (si le téléchargement automatique est activé).';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle =>
      'Analyser le flux RSS et télécharger les nouveaux épisodes';

  @override
  String get adminPodcastsCheck => 'Vérifier';

  @override
  String get adminPodcastsCheckingForNew => 'Recherche de nouveaux épisodes…';

  @override
  String get adminPodcastsCheckingForNewDots =>
      'Recherche de nouveaux épisodes...';

  @override
  String get adminPodcastsFailedCheckEpisodes =>
      'Impossible de vérifier les épisodes';

  @override
  String get adminPodcastsCheckFeedsTooltip =>
      'Rechercher de nouveaux épisodes dans les flux';

  @override
  String get adminPodcastsNoPodcastsYet => 'Pas encore de podcasts';

  @override
  String get adminPodcastsTapPlusHint =>
      'Appuyez sur + pour rechercher et ajouter des émissions';

  @override
  String adminPodcastsEpisodesCount(int count) {
    return '$count épisodes';
  }

  @override
  String get adminPodcastsAddPodcast => 'Ajouter un podcast';

  @override
  String get adminPodcastsCouldNotFindFeed => 'Flux du podcast introuvable';

  @override
  String get adminPodcastsSearchHint => 'Rechercher des podcasts…';

  @override
  String get adminPodcastsSearchItunesHint => 'Rechercher dans iTunes...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return 'Rechercher « $query » sur iTunes';
  }

  @override
  String get adminPodcastsNoPodcastsFound => 'Aucun podcast trouvé';

  @override
  String get adminPodcastsRelToday => 'Aujourd\'hui';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return 'Il y a $count sem';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return 'Il y a $count mois';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return 'Il y a $count a';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return 'Mis à jour $when';
  }

  @override
  String get adminPodcastsGenreAll => 'Tous';

  @override
  String get adminPodcastsGenreArts => 'Arts';

  @override
  String get adminPodcastsGenreComedy => 'Comédie';

  @override
  String get adminPodcastsGenreEducation => 'Éducation';

  @override
  String get adminPodcastsGenreTvFilm => 'TV & Film';

  @override
  String get adminPodcastsGenreMusic => 'Musique';

  @override
  String get adminPodcastsGenreNews => 'Actualités';

  @override
  String get adminPodcastsGenreReligion => 'Religion';

  @override
  String get adminPodcastsGenreScience => 'Science';

  @override
  String get adminPodcastsGenreSports => 'Sports';

  @override
  String get adminPodcastsGenreTechnology => 'Technologie';

  @override
  String get adminPodcastsGenreBusiness => 'Affaires';

  @override
  String get adminPodcastsGenreFiction => 'Fiction';

  @override
  String get adminPodcastsGenreSocietyCulture => 'Société & Culture';

  @override
  String get adminPodcastsGenreHealthFitness => 'Santé & Fitness';

  @override
  String get adminPodcastsGenreTrueCrime => 'Documentaire criminel';

  @override
  String get adminPodcastsGenreHistory => 'Historique';

  @override
  String get adminPodcastsGenreKidsFamily => 'Enfants & Famille';

  @override
  String get adminPodcastsPodcastFallback => 'Podcast';

  @override
  String get adminPodcastsEpisodeFallback => 'Épisode';

  @override
  String get adminPodcastsNoFeedFound => 'Aucune URL de flux trouvée';

  @override
  String get adminPodcastsNoFeedAvailable => 'Aucune URL de flux disponible';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return '$title ajouté à la bibliothèque';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return 'Impossible d\'ajouter $title';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    return '$count épisodes dans le flux';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    return '+ $count épisodes de plus';
  }

  @override
  String get adminPodcastsAdding => 'Ajout en cours…';

  @override
  String get adminPodcastsAddToLibrary => 'Ajouter à la bibliothèque';

  @override
  String get adminPodcastsRemoveShowTitle => 'Retirer l\'émission ?';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return 'Supprimer «$title» et tous ses épisodes du serveur? Cette action est irréversible.';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return '« $title » retiré';
  }

  @override
  String get adminPodcastsFailedRemoveShow =>
      'Impossible de retirer l\'émission';

  @override
  String get adminPodcastsRemoveShowTooltip => 'Retirer l\'émission';

  @override
  String get adminPodcastsSelectMultipleTooltip => 'Sélection multiple';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return '$count téléchargés';
  }

  @override
  String get adminPodcastsTabDownloaded => 'Téléchargé';

  @override
  String get adminPodcastsTabFeed => 'Flux';

  @override
  String get adminPodcastsTabSettings => 'Paramètres';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return 'Téléchargement de « $title »';
  }

  @override
  String get adminPodcastsFailedDownload => 'Échec du téléchargement';

  @override
  String get adminPodcastsDeleteEpisodeTitle => 'Supprimer l\'épisode ?';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return 'Supprimer \"$title\" ?';
  }

  @override
  String get adminPodcastsDeleted => 'Supprimé';

  @override
  String get adminPodcastsFailed => 'Échec';

  @override
  String get adminPodcastsDeleteEpisodesTitle => 'Supprimer les épisodes ?';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return 'Supprimer $count épisode(s) du serveur ?';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return '$count épisode(s) effacé(s)';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload =>
      'Parcourir le flux pour télécharger';

  @override
  String get adminPodcastsDownloadingDots => 'Téléchargement...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return 'Supprimer $count épisode(s)';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return 'Téléchargement de $count épisode(s)';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return 'Télécharger $count épisode(s)';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter =>
      'Chercher les épisodes après le';

  @override
  String get adminPodcastsSelectDate => 'Choisir une date';

  @override
  String get adminPodcastsMaxEpisodes => 'Nombre max d\'épisodes à télécharger';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return 'Aucun nouvel épisode trouvé après le $date';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return '$count nouvel(aux) épisode(s) trouvé(s) - téléchargement';
  }

  @override
  String get adminPodcastsFailedToCheckNew =>
      'Impossible de rechercher de nouveaux épisodes';

  @override
  String get adminPodcastsCheckAndDownload => 'Vérifier & Télécharger';

  @override
  String get adminPodcastsMatchPodcast => 'Faire correspondre le podcast';

  @override
  String get adminPodcastsMatchPodcastSubtitle =>
      'Rechercher sur iTunes pour mettre à jour la couverture et les métadonnées';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes =>
      'Téléchargement auto des nouveaux épisodes';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle =>
      'Le serveur télécharge automatiquement les nouveaux épisodes';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle =>
      'Les nouveaux épisodes ne sont pas téléchargés automatiquement';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate =>
      'Impossible de mettre à jour le réglage de téléchargement auto';

  @override
  String get adminPodcastsMaxEpisodesToKeep =>
      'Nombre max d\'épisodes à conserver';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      '0 conserve tous les épisodes. Après le téléchargement automatique d\'un nouvel épisode, Audiobookshelf supprime l\'épisode le plus ancien lorsque la série dépasse cette limite.';

  @override
  String get adminPodcastsNoEpisodeLimit => 'Aucune limite';

  @override
  String get adminPodcastsEpisodeLimitInvalid =>
      'Saisissez 0 ou un nombre entier';

  @override
  String get adminPodcastsCheckSchedule => 'Planning de vérification';

  @override
  String get adminPodcastsFrequency => 'Fréquence';

  @override
  String get adminPodcastsFreqHourly => 'Toutes les heures';

  @override
  String get adminPodcastsFreqDaily => 'Quotidiennement';

  @override
  String get adminPodcastsFreqWeekly => 'Hebdomadaire';

  @override
  String get adminPodcastsDay => 'Jour';

  @override
  String get adminPodcastsTime => 'Heure';

  @override
  String get adminPodcastsDaySun => 'Dim';

  @override
  String get adminPodcastsDayMon => 'Lun';

  @override
  String get adminPodcastsDayTue => 'Mar';

  @override
  String get adminPodcastsDayWed => 'Mer';

  @override
  String get adminPodcastsDayThu => 'Jeu';

  @override
  String get adminPodcastsDayFri => 'Ven';

  @override
  String get adminPodcastsDaySat => 'Sam';

  @override
  String get adminPodcastsFeedUrl => 'URL du flux';

  @override
  String get adminPodcastsBack => 'Retour';

  @override
  String get adminPodcastsRootOnly => 'Root uniquement';

  @override
  String get adminPodcastsDeleting => 'Effacement...';

  @override
  String get adminPodcastsDeleteEpisode => 'Effacer l\'épisode';

  @override
  String adminPodcastsSeasonChip(String season) {
    return 'Saison $season';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return 'Ép. $number';
  }

  @override
  String get adminPodcastsApplyingMatch =>
      'Application de la correspondance...';

  @override
  String get adminPodcastsNoResults => 'Aucun résultat';

  @override
  String get adminPodcastsPodcastMatched =>
      'Podcast mis en correspondance et mis à jour';

  @override
  String get adminPodcastsFailedMatch =>
      'Impossible de faire correspondre le podcast';

  @override
  String get adminPodcastsSelectAll => 'Tout sélectionner';

  @override
  String get adminPodcastsSelectAllNew => 'Nouveaux uniquement';

  @override
  String get adminPodcastsSortNewestFirst => 'Les plus récents en premier';

  @override
  String get adminPodcastsSortOldestFirst => 'Les plus anciens en premier';

  @override
  String get adminPodcastsEditInfo => 'Modifier les informations';

  @override
  String get adminPodcastsEditInfoSubtitle =>
      'Modifier le titre, la description, la couverture et plus';

  @override
  String get adminPodcastsEditTitle => 'Modifier le podcast';

  @override
  String get adminPodcastsReleaseDate => 'Date de parution';

  @override
  String get adminPodcastsExplicit => 'Explicite';

  @override
  String get adminPodcastsExplicitSubtitle =>
      'Marquer ce podcast comme explicite';

  @override
  String get episodeListEpisodeFallback => 'Épisode';

  @override
  String get episodeListUnknownPodcast => 'Podcast inconnu';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count épisodes marqués comme finis',
      one: '1 épisode marqué comme fini',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count épisodes marqués comme inachevés',
      one: '1 épisode marqué comme inachevé',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes =>
      'Se désabonner des nouveaux épisodes';

  @override
  String get episodeListSubscribeToNewEpisodes =>
      'S\'abonner aux nouveaux épisodes';

  @override
  String get episodeListSubscribeTitle => 'S\'abonner à ce podcast ?';

  @override
  String get episodeListSubscribeContent =>
      'Les nouveaux épisodes seront automatiquement téléchargés et ajoutés à votre file d’attente d’absorption lorsqu’ils apparaîtront sur le serveur.';

  @override
  String get episodeListSubscribe => 'S\'abonner';

  @override
  String get episodeListShowFinishedEpisodes => 'Afficher les épisodes achevés';

  @override
  String get episodeListHideFinishedEpisodes => 'Cacher les épisodes achevés';

  @override
  String get episodeListShowSettings => 'Paramètres de l\'émission';

  @override
  String get episodeListPlaysNewerToOlder =>
      'Lit les épisodes du plus récent au plus ancien';

  @override
  String get episodeListPlaysOlderToNewer =>
      'Lit les épisodes du plus ancien au plus récent';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count épisodes',
      one: '1 épisode',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count non finis',
      one: '1 non fini',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => 'Téléchargement automatique';

  @override
  String get episodeListSubscribedChip => 'Abonné';

  @override
  String get episodeListExplicitChip => 'Explicite';

  @override
  String get episodeListSortNewest => 'Les plus récents';

  @override
  String get episodeListSortOldest => 'Les plus anciens';

  @override
  String get episodeListSortBy => 'Trier les épisodes';

  @override
  String get episodeListSortPubDate => 'Date de publication';

  @override
  String get episodeListSortTitle => 'Titre';

  @override
  String get episodeListSortSeason => 'Saison';

  @override
  String get episodeListSortEpisode => 'Numéro d\'épisode';

  @override
  String get episodeListSortFileName => 'Nom du fichier';

  @override
  String get episodeListSortReverseHint =>
      'Appuyez à nouveau pour inverser l\'ordre';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return '« $title » ajouté à Lecture';
  }

  @override
  String get episodeDetailEpisodeFallback => 'Épisode';

  @override
  String get episodeDetailMarkedNotFinished => 'Marqué comme non fini';

  @override
  String get episodeDetailMarkedFinishedNice => 'Marqué comme fini - super !';

  @override
  String get episodeDetailMarkAbsorbedContent =>
      'Votre progression sera définie à 100% pour cet épisode.';

  @override
  String get episodeDetailResetProgressContent =>
      'Ceci effacera toute la progression de cet épisode et le réinitialisera au début. Cela ne peut pas être annulé.';

  @override
  String get episodeDetailToday => 'Aujourd\'hui';

  @override
  String get episodeDetailYesterday => 'Hier';

  @override
  String episodeDetailDaysAgo(int count) {
    return 'Il y a $count j';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return 'Il y a $count sem';
  }

  @override
  String episodeDetailDurationHm(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String episodeDetailDurationM(int minutes) {
    return '${minutes}m';
  }

  @override
  String get episodeDetailResume => 'Reprendre';

  @override
  String get episodeDetailPlayEpisode => 'Lire l\'épisode';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return 'Épisode $number';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return 'Saison $number';
  }

  @override
  String get editMetadataUpdatedFromMatch =>
      'Métadonnées mises à jour depuis la correspondance';

  @override
  String editMetadataConfirmMatch(String title) {
    return 'Cela mettra à jour les métadonnées du serveur pour ce livre en utilisant :\n\n\"$title\"\n\nTous les champs et la couverture seront remplacés sur le serveur.';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return 'Ceci mettra à jour les métadonnées du serveur pour ce livre en utilisant :\n\n\"$title\" par $author\n\nTous les champs et la couverture seront remplacés sur le serveur.';
  }

  @override
  String get seriesBooksFindMissingTitle => 'Trouver les livres manquants';

  @override
  String get seriesBooksFindMissingContent =>
      'Ceci cherche sur Audible pour trouver dans cette série des livres qui peuvent être manquants dans votre bibliothèque.\n\nLes livres sont trouvés d\'abord par ASIN (selon que votre serveur a des ASINs pour ses livres), sinon fait une correspondance de titre. Il se peut que les résultats ne soient pas parfaitement exacts.';

  @override
  String get seriesBooksCouldNotFindOnAudible =>
      'Impossible de trouver cette série sur Audible';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Cela va effacer le statut fini pour les $count livres de cette série.',
      one: 'Cela effacera le statut fini du livre de cette série.',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cela marquera les $count livres de cette série comme terminé.',
      one: 'Cela marquera le livre de cette série comme terminé.',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => 'Décocher tout';

  @override
  String get seriesBooksShowAllBooks => 'Afficher tous les livres';

  @override
  String get seriesBooksGroupBySubSeries => 'Grouper par sous-série';

  @override
  String get seriesBooksLoadingSubSeries => 'Chargement des sous-séries...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres',
      one: '1 livre',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => 'Terminé';

  @override
  String get seriesBooksExplicitBadge => 'E';

  @override
  String get expandedCardStreaming => 'Diffusion';

  @override
  String get expandedCardDeviceFallback => 'Appareil';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$position dans $bookTitle';
  }

  @override
  String get bookmarksScreenClose => 'Fermer';

  @override
  String get bookmarksScreenSortNewest => 'Plus récent';

  @override
  String get bookmarksScreenSortPosition => 'Position';

  @override
  String statsScreenStreakDays(int count) {
    return '${count}j';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count session';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count sessions';
  }

  @override
  String get statsScreenDayMon => 'Lun';

  @override
  String get statsScreenDayTue => 'Mar';

  @override
  String get statsScreenDayWed => 'Mer';

  @override
  String get statsScreenDayThu => 'Jeu';

  @override
  String get statsScreenDayFri => 'Ven';

  @override
  String get statsScreenDaySat => 'Sam';

  @override
  String get statsScreenDaySun => 'Dim';

  @override
  String statsScreenDurationHm(int h, int m) {
    return '${h}h ${m}m';
  }

  @override
  String statsScreenDurationM(int m) {
    return '${m}m';
  }

  @override
  String get statsScreenDurationLessThanMin => '<1m';

  @override
  String get statsScreenDurationZero => '0m';

  @override
  String statsScreenDurationShortH(int h) {
    return '${h}h';
  }

  @override
  String statsScreenDurationShortM(int m) {
    return '${m}m';
  }

  @override
  String get statsScreenCouldNotLoadItem => 'Impossible de charger l\'élément';

  @override
  String get statsScreenCouldNotFindEpisode => 'Épisode introuvable';

  @override
  String statsScreenByAuthor(String author) {
    return 'par $author';
  }

  @override
  String get statsScreenListened => 'Écouté';

  @override
  String get sessionEditTitle => 'Modifier la session';

  @override
  String get sessionDayLabel => 'Jour';

  @override
  String get sessionEndPosition => 'Position de fin';

  @override
  String get sessionEndPositionHint =>
      'Modifier ceci peut aussi mettre à jour votre progression actuelle.';

  @override
  String get statsViewSessions => 'Voir les sessions';

  @override
  String statsSessionsForDate(String date) {
    return 'Sessions du $date';
  }

  @override
  String get statsNoSessionsForDate =>
      'Aucune session d\'écoute trouvée pour ce jour';

  @override
  String get statsSearchSessions => 'Sessions de recherche';

  @override
  String get statsNoSessionSearchResults =>
      'Aucune session ne correspond à votre recherche';

  @override
  String get statsSessionsLoadFailed =>
      'Impossible de charger les sessions de ce jour';

  @override
  String get sessionDeleteConfirmTitle => 'Supprimer la session ?';

  @override
  String get sessionDeleteConfirmBody =>
      'Cela supprime la session et réduit vos totaux d\'écoute de sa durée. Cela ne peut pas être annulé.';

  @override
  String get sessionSaved => 'Session mise à jour';

  @override
  String get sessionDeleted => 'Session supprimée';

  @override
  String get sessionSaveFailed => 'Impossible d\'enregistrer les modifications';

  @override
  String get sessionDeleteFailed => 'Impossible d\'effacer cette session';

  @override
  String get statsScreenStartedAtPosition => 'Commencé à la position';

  @override
  String get statsScreenEndedAtPosition => 'Terminé à la position';

  @override
  String get statsScreenTotalDuration => 'Durée totale';

  @override
  String get statsScreenStarted => 'Commencé';

  @override
  String get statsScreenUpdated => 'Mis à jour';

  @override
  String get statsScreenClient => 'Client';

  @override
  String get statsScreenDevice => 'Appareil';

  @override
  String get statsScreenOs => 'OS';

  @override
  String get statsScreenPlayMethod => 'Méthode de lecture';

  @override
  String get statsScreenLoading => 'Chargement...';

  @override
  String get statsScreenJumpToStart => 'Aller au début';

  @override
  String get statsScreenJumpToEnd => 'Aller à la fin';

  @override
  String get statsScreenPlayMethodDirect => 'Lecture directe';

  @override
  String get statsScreenPlayMethodDirectStream => 'Flux direct';

  @override
  String get statsScreenPlayMethodTranscode => 'Transcodage';

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
    return '$day $month $year à $hour:$minute $ampm';
  }

  @override
  String get statsScreenMonthJan => 'Jan';

  @override
  String get statsScreenMonthFeb => 'Fév';

  @override
  String get statsScreenMonthMar => 'Mar';

  @override
  String get statsScreenMonthApr => 'Avr';

  @override
  String get statsScreenMonthMay => 'Mai';

  @override
  String get statsScreenMonthJun => 'Jui';

  @override
  String get statsScreenMonthJul => 'Juil';

  @override
  String get statsScreenMonthAug => 'Aoû';

  @override
  String get statsScreenMonthSep => 'Sep';

  @override
  String get statsScreenMonthOct => 'Oct';

  @override
  String get statsScreenMonthNov => 'Nov';

  @override
  String get statsScreenMonthDec => 'Déc';

  @override
  String get upcomingReleasesTitle => 'Sorties à venir';

  @override
  String get upcomingReleasesRescanTitle => 'Rescanner ?';

  @override
  String upcomingReleasesRescanContent(int days) {
    return 'Ces résultats sont vieux de $days jours. Les dates de parution ont pu changer - voulez-vous scanner de nouveau ?';
  }

  @override
  String get upcomingReleasesNotNow => 'Plus tard';

  @override
  String get upcomingReleasesRescan => 'Réanalyser';

  @override
  String get upcomingReleasesRescanReleaseDate =>
      'Réanalyser la date de sortie';

  @override
  String get upcomingReleasesRescanning => 'Nouvelle analyse...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return 'Mis à jour - $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound =>
      'Aucune date de sortie trouvée';

  @override
  String get upcomingReleasesRescanFailed => 'Échec du nouveau scan';

  @override
  String get upcomingReleasesRemoveFromList => 'Supprimer de la liste';

  @override
  String get upcomingReleasesRemovedFromList => 'Retiré de la liste';

  @override
  String get upcomingReleasesDateChip => 'Date';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return 'Vérification de $name... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => 'Chargement des séries...';

  @override
  String get upcomingReleasesScannedToday => '(scanné aujourd\'hui)';

  @override
  String get upcomingReleasesScannedYesterday => '(analysé hier)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '(analysé il y a $days jours)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return '$count à venir';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return '$count récents';
  }

  @override
  String get upcomingReleasesNoneFound =>
      'Aucune sortie à venir ou récente trouvée';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$summary dans $count séries';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return '$count séries vérifiées sur Audible';
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
  String get upcomingReleasesBadgeUpcoming => 'À VENIR';

  @override
  String get upcomingReleasesBadgeAdded => 'AJOUTÉ';

  @override
  String get upcomingReleasesBadgeMissing => 'MANQUANT';

  @override
  String get upcomingReleasesScanSettingsTitle => 'Paramètres d\'analyse';

  @override
  String get upcomingReleasesFinishedAfterTitle =>
      'Considérer une série comme terminée après';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      'Séries dont le dernier livre est plus vieux que ceci sont ignorés lors des scans et seulement revérifiés tous les un ou deux mois.';

  @override
  String upcomingReleasesFinishedAfterYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ans',
      one: '1 an',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesFinishedAfterNever => 'Jamais';

  @override
  String get upcomingReleasesSkippedTitle => 'Séries ignorées';

  @override
  String get upcomingReleasesSkippedNone => 'Rien d\'ignoré pour le moment';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ignorées',
      one: '1 ignorée',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dernier livre il y a $count ans',
      one: 'Dernier livre il y a 1 an',
      zero: 'Dernier livre il y a moins d\'un an',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched =>
      'Impossible de trouver cette série sur Audible';

  @override
  String get upcomingReleasesSkippedScanNow => 'Analyser maintenant';

  @override
  String get upcomingReleasesSkippedAlwaysScan => 'Toujours analyser';

  @override
  String get upcomingReleasesSkippedNeverScan => 'Ne jamais analyser';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return 'Nouvelles sorties trouvées dans $name';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return 'Rien de nouveau dans $name';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary =>
      'Cette liste provient d\'une bibliothèque différente. Exécutez un rescan pour l\'actualiser.';

  @override
  String get upcomingReleasesChipUpcoming => 'À venir';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count manquants',
      one: '1 manquant',
      zero: 'Manquants',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => 'Aucun livre manquant trouvé';

  @override
  String get upcomingReleasesScanSeries => 'Analyser les séries';

  @override
  String get upcomingReleasesScanUpcomingOption => 'Sorties à venir';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc =>
      'Analyse rapide des livres nouveaux et à venir';

  @override
  String get upcomingReleasesScanDeepOption => 'Analyse approfondie';

  @override
  String get upcomingReleasesScanDeepOptionDesc =>
      'Trouve également des livres manquants dans chaque série - prend plus de temps';

  @override
  String get upcomingReleasesFirstScanNote =>
      'Le premier scan vérifie chaque série sur Audible et peut prendre quelques minutes. Les scans suivants sont plus rapides une fois que vos séries sont triées.';

  @override
  String get upcomingReleasesLastScanReport => 'Rapport de la dernière analyse';

  @override
  String upcomingReleasesReportChecked(int count) {
    return 'Vérifiées sur Audible : $count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return 'Ignorées : $count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return 'Introuvables sur Audible : $count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return 'Échec de la vérification : $count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return '$upcoming à venir, $recent récents trouvés';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return '$upcoming à venir, $recent récents, $missing manquants trouvés';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return '+$count de plus';
  }

  @override
  String get upcomingReleasesBadgeNew => 'NOUVEAU';

  @override
  String get upcomingReleasesOpenLibrarySeries =>
      'Ouvrir la série dans la bibliothèque';

  @override
  String get upcomingReleasesAsinCopied => 'ASIN de la série copié';

  @override
  String get upcomingReleasesSetSeriesAsin => 'Définir l\'ASIN de la série';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      'Trouvez la série sur audible.com et copiez le lien de la page - l\'ASIN est le code à 10 caractères commençant par B0 (comme B08S2YN3YS). Coller l\'ensemble du lien fonctionne aussi.';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… ou lien audible.com';

  @override
  String get upcomingReleasesSetAsinSave => 'Enregistrer';

  @override
  String get upcomingReleasesSetAsinInvalid =>
      'Aucun ASIN trouvé dans ce texte';

  @override
  String get upcomingReleasesSetAsinSaved => 'Série liée - analyse en cours';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Retirer $count livres',
      one: 'Retirer le livre',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => 'Retirer de cette analyse';

  @override
  String get upcomingReleasesRemoveThisScanDesc =>
      'Peut revenir lors d\'une prochaine analyse';

  @override
  String get upcomingReleasesRemoveForever =>
      'Retirer de cette analyse et des suivantes';

  @override
  String get upcomingReleasesRemoveForeverDesc =>
      'Va dans la liste des retirés, restaurable à tout moment';

  @override
  String get upcomingReleasesRemovedForeverToast =>
      'Retiré - n\'apparaîtra plus aux prochaines analyses';

  @override
  String get upcomingReleasesRemovedBooksTitle => 'Livres retirés';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres',
      one: '1 livre',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => 'Aucun livre retiré';

  @override
  String get upcomingReleasesRestore => 'Restaurer';

  @override
  String get upcomingReleasesRestoredToast => 'Restauré';

  @override
  String get upcomingReleasesRestoredNextScan =>
      'Restauré - il apparaîtra après la prochaine analyse';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sélectionnés',
      one: '1 sélectionné',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => 'Demander';

  @override
  String get upcomingReleasesBulkRemove => 'Retirer';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count retirés',
      one: '1 retiré',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count demandes envoyées',
      one: '1 demande envoyée',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return '$count ignorés';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count séries réanalysées',
      one: '1 série réanalysée',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return '$count avec de nouveaux livres';
  }

  @override
  String get seriesExcludeFromScan => 'Exclure de l\'analyse des séries';

  @override
  String get seriesIncludeInScan => 'Inclure dans l\'analyse des séries';

  @override
  String get homeScreenEpisodeFallback => 'Épisode';

  @override
  String get libraryScreenUnknownTitle => 'Titre inconnu';

  @override
  String get playlistDetailDefaultName => 'Liste de lecture';

  @override
  String playlistDetailItemCount(int count) {
    return '$count éléments';
  }

  @override
  String get playlistDetailUnfinished => 'Non terminé';

  @override
  String get playlistDetailRemoveFromPlaylist =>
      'Retirer de la liste de lecture';

  @override
  String get playlistDetailDone => 'Terminé';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return '$count éléments marqués comme finis';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return '$count éléments marqués comme non finis';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return '$count éléments retirés';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return '« $title » ajouté à Lecture';
  }

  @override
  String get collectionDetailDefaultName => 'Collection';

  @override
  String smartScopeBookCount(int count) {
    return 'Smart Scope · $count livres';
  }

  @override
  String get smartScopeNew => 'Nouveau Smart Scope';

  @override
  String get smartScopeNewSubtitle =>
      'Enregistrez un ensemble de filtres comme une liste qui se tient à jour toute seule';

  @override
  String get smartScopeEditTitle => 'Modifier le Smart Scope';

  @override
  String get smartScopeIcon => 'Icône';

  @override
  String get smartScopePublic => 'Visible par tous les utilisateurs';

  @override
  String get smartScopeKobo => 'Synchroniser avec Kobo';

  @override
  String get smartScopeRules => 'Règles';

  @override
  String get smartScopeMatchAll => 'Toutes correspondent';

  @override
  String get smartScopeMatchAny => 'Une correspond';

  @override
  String get smartScopeAddRule => 'Ajouter une règle';

  @override
  String get smartScopeAddGroup => 'Ajouter un groupe';

  @override
  String get smartScopeGroup => 'Groupe';

  @override
  String get smartScopeStartFrom => 'Partir de';

  @override
  String get smartScopeFromScratch => 'Créer de zéro';

  @override
  String get smartScopeTplHasSeries => 'A une série';

  @override
  String get smartScopeTplRecent => 'Ajoutés récemment';

  @override
  String get smartScopeTplPdf => 'PDF uniquement';

  @override
  String get smartScopeTplNoGenres => 'Sans genre';

  @override
  String get smartScopeTplEpub => 'EPUB uniquement';

  @override
  String get smartScopeCounting => 'Comptage...';

  @override
  String get smartScopeSort => 'Tri par défaut';

  @override
  String get smartScopeAddSort => 'Ajouter un niveau de tri';

  @override
  String get smartScopeSortNone =>
      'Aucun tri défini, les livres sont donc triés par titre.';

  @override
  String get smartScopeAscending => 'Croissant';

  @override
  String get smartScopeDescending => 'Décroissant';

  @override
  String get smartScopeDelete => 'Effacer le Smart Scope';

  @override
  String get smartScopeSaveFailed => 'Impossible d\'enregistrer le Smart Scope';

  @override
  String get smartScopeDeleteFailed => 'Impossible d\'effacer le Smart Scope';

  @override
  String get smartScopeLoadFailed => 'Impossible de charger le Smart Scope';

  @override
  String get smartScopeUnsupportedRule =>
      'Cette règle ne peut être modifiée que sur le web de BookOrbit. Elle est conservée telle quelle.';

  @override
  String get smartScopeAnd => 'et';

  @override
  String get smartScopeDays => 'jours';

  @override
  String get smartScopeWeeks => 'semaines';

  @override
  String get smartScopeMonths => 'mois';

  @override
  String get smartScopePickDate => 'Choisir une date';

  @override
  String get smartScopeAddValue => 'Ajouter une valeur';

  @override
  String get smartScopeValue => 'Valeur';

  @override
  String get smartScopeCustomFields => 'Champs personnalisés';

  @override
  String get smartScopeAnyProvider => 'N\'importe quel fournisseur';

  @override
  String get smartScopeScoreOutstanding => 'Exceptionnel';

  @override
  String get smartScopeScoreGood => 'Bon';

  @override
  String get smartScopeScoreFair => 'Correct';

  @override
  String get smartScopeScorePoor => 'Faible';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => 'Jusqu\'à 20 valeurs';

  @override
  String get scopeFieldTitle => 'Titre';

  @override
  String get scopeFieldAuthor => 'Auteur';

  @override
  String get scopeFieldSeries => 'Séries';

  @override
  String get scopeFieldSeriesIndex => 'Numéro dans la série';

  @override
  String get scopeFieldGenre => 'Genre';

  @override
  String get scopeFieldTag => 'Tag';

  @override
  String get scopeFieldReadStatus => 'Statut de lecture';

  @override
  String get scopeFieldReadProgress => 'Progression de lecture';

  @override
  String get scopeFieldRating => 'Votre note';

  @override
  String get scopeFieldFormat => 'Format';

  @override
  String get scopeFieldLibrary => 'Bibliothèque';

  @override
  String get scopeFieldCollection => 'Collection';

  @override
  String get scopeFieldPublisher => 'Éditeur';

  @override
  String get scopeFieldLanguage => 'Langage';

  @override
  String get scopeFieldPublishedDate => 'Date de publication';

  @override
  String get scopeFieldPublishedYear => 'Année de publication';

  @override
  String get scopeFieldAddedAt => 'Date d\'ajout';

  @override
  String get scopeFieldStartedAt => 'Date de début';

  @override
  String get scopeFieldFinishedAt => 'Date de fin';

  @override
  String get scopeFieldPageCount => 'Nombre de pages';

  @override
  String get scopeFieldFileSize => 'Taille du fichier';

  @override
  String get scopeFieldCommunityRating => 'Note de la communauté';

  @override
  String get scopeFieldCommunityRatingCount =>
      'Nombre d\'avis de la communauté';

  @override
  String get scopeFieldMetadataScore => 'Score des métadonnées';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => 'Description';

  @override
  String get scopeFieldCover => 'Couverture';

  @override
  String get scopeFieldAudioCover => 'Couverture du livre audio';

  @override
  String get scopeFieldFileAvailability => 'Disponibilité des fichiers';

  @override
  String get scopeFieldLockStatus => 'Statut de verrouillage';

  @override
  String get scopeFieldSeriesStatus => 'Statut de la série';

  @override
  String get scopeSortUpdatedAt => 'Date de mise à jour';

  @override
  String get scopeSortLastReadAt => 'Dernière lecture';

  @override
  String get scopeSortRandom => 'Aléatoire';

  @override
  String get scopeOpContains => 'contient';

  @override
  String get scopeOpNotContains => 'ne contient pas';

  @override
  String get scopeOpStartsWith => 'commence par';

  @override
  String get scopeOpEndsWith => 'finit par';

  @override
  String get scopeOpEq => 'est';

  @override
  String get scopeOpNotEq => 'n\'est pas';

  @override
  String get scopeOpIsEmpty => 'est vide';

  @override
  String get scopeOpIsNotEmpty => 'n\'est pas vide';

  @override
  String get scopeOpGt => 'supérieur à';

  @override
  String get scopeOpGte => 'au moins';

  @override
  String get scopeOpLt => 'inférieur à';

  @override
  String get scopeOpLte => 'au plus';

  @override
  String get scopeOpBetween => 'entre';

  @override
  String get scopeOpIncludesAny => 'inclut l\'un de';

  @override
  String get scopeOpIncludesAll => 'inclut tous';

  @override
  String get scopeOpExcludesAll => 'exclut tous';

  @override
  String get scopeOpBefore => 'avant';

  @override
  String get scopeOpAfter => 'après';

  @override
  String get scopeOpWithinLast => 'dans les derniers';

  @override
  String get scopeOpIsMissing => 'est manquant';

  @override
  String get scopeOpIsPresent => 'est présent';

  @override
  String get scopeOpIsUnread => 'est non lu';

  @override
  String get scopeOpIsInProgress => 'est en cours';

  @override
  String get scopeOpIsFinished => 'est fini';

  @override
  String get scopeOpIsLocked => 'est verrouillé';

  @override
  String get scopeOpIsUnlocked => 'est déverrouillé';

  @override
  String get scopeOpIsUpNext => 'est le suivant';

  @override
  String get scopeOpIsTrue => 'est oui';

  @override
  String get scopeOpIsFalse => 'est non';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres correspondent',
      one: '1 livre correspond',
      zero: 'Aucun livre ne correspond',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return 'Effacer « $name » ? Cette action est irréversible.';
  }

  @override
  String collectionDetailBookCount(int count) {
    return '$count livres';
  }

  @override
  String get collectionDetailDone => 'Terminé';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return '« $title » ajouté à Lecture';
  }

  @override
  String get audibleSeriesNoBooksFound => 'Aucun livre trouvé sur Audible';

  @override
  String get audibleSeriesFailedToLoad =>
      'Impossible de charger la série depuis Audible';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return '$total sur Audible · $missing manquants';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return '$total sur Audible · $missing manquants · $upcoming à venir';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return 'Manquants ($count)';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return 'À venir ($count)';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return 'Tous ($count)';
  }

  @override
  String get audibleSeriesSearching => 'Recherche sur Audible...';

  @override
  String get audibleSeriesCompleteSeries => 'Vous avez la série complète !';

  @override
  String get audibleSeriesNoUpcoming => 'Aucune sortie à venir trouvée';

  @override
  String get audibleSeriesUpcomingBadge => 'À VENIR';

  @override
  String get audibleSeriesAbridged => 'Abrégé';

  @override
  String get audibleSeriesRegionTitle => 'Région Audible';

  @override
  String get audibleSeriesOpenOnAudible => 'Ouvrir sur Audible';

  @override
  String get audibleSeriesAddToCalendar => 'Ajouter au calendrier';

  @override
  String get audibleSeriesAddToUpcoming => 'Ajouter aux sorties à venir';

  @override
  String get audibleSeriesAddedToUpcoming => 'Ajouté aux sorties à venir';

  @override
  String get audibleSeriesAlreadyInUpcoming =>
      'Déjà sur la page des sorties à venir';

  @override
  String get audibleSeriesCouldNotOpenAudible => 'Impossible d\'ouvrir Audible';

  @override
  String get audibleSeriesCouldNotOpenCalendar =>
      'Impossible d\'ouvrir le calendrier';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return 'Nouvelle sortie de livre audio dans la série $seriesName';
  }

  @override
  String get authorBooksGroupBySeries => 'Regrouper par série';

  @override
  String get authorBooksList => 'Liste';

  @override
  String get authorBooksGrid => 'Grille';

  @override
  String authorBooksBookCount(int count) {
    return '$count livres';
  }

  @override
  String get metadataLookupCover => 'Couverture';

  @override
  String get metadataLookupChooseFields => 'Choisir les champs à appliquer';

  @override
  String metadataLookupApplyFields(int count) {
    return 'Appliquer $count champs';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return '$count champs enregistrés localement';
  }

  @override
  String get metadataLookupOverrideLocalDisplay =>
      'Remplacer l\'affichage local';

  @override
  String get equalizerPresetFlat => 'Plat';

  @override
  String get equalizerPresetVoiceBoost => 'Renfort de voix';

  @override
  String get equalizerPresetBassBoost => 'Amplification des basses';

  @override
  String get equalizerPresetTrebleBoost => 'Amplification des aigus';

  @override
  String get equalizerPresetPodcast => 'Podcast';

  @override
  String get equalizerPresetAudiobook => 'Livre audio';

  @override
  String get equalizerPresetReduceNoise => 'Réduction du bruit';

  @override
  String get equalizerPresetLoudness => 'Volume';

  @override
  String equalizerEditingSavedNamed(String title) {
    return 'Modification de l\'égaliseur enregistré pour « $title »';
  }

  @override
  String get equalizerEditingSavedGeneric => 'Édition de l\'EQ enregistré';

  @override
  String get equalizerPerBookEq => 'Égaliseur par livre';

  @override
  String get notesDeleteNoteQuestion => 'Supprimer la note ?';

  @override
  String notesDeleteNoteContent(String title) {
    return 'Effacer « $title » ?';
  }

  @override
  String get notesExport => 'Exporter';

  @override
  String get notesNewNote => 'Nouvelle note';

  @override
  String get librarySortFilterUpcomingReleases => 'Analyser les séries';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle =>
      'Récupérer une photo et une bio de chaque auteur auprès du fournisseur de métadonnées';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle =>
      'Vérifier sur Audible les livres à venir et manquants de vos séries';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapitres restants',
      one: '1 chapitre restant',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetAddMinutesChip(int minutes) {
    return '+${minutes}m';
  }

  @override
  String sleepTimerSheetAddChaptersChip(int count) {
    return '+$count ch';
  }

  @override
  String sleepTimerSheetMinShort(int minutes) {
    return '${minutes}m';
  }

  @override
  String sleepTimerSheetSecondsShort(int seconds) {
    return '${seconds}s';
  }

  @override
  String sleepTimerSheetMinSecShort(int minutes, int seconds) {
    return '${minutes}m ${seconds}s';
  }

  @override
  String sleepTimerSheetChaptersValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapitres',
      one: '1 chapitre',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetChaptersChip(int count) {
    return '$count ch';
  }

  @override
  String sleepTimerSheetStartChapterSleep(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Veille après $count chapitres',
      one: 'Veille après 1 chapitre',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => 'Retour après endormissement';

  @override
  String get sleepTimerSheetShake => 'Secouer';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return 'Ajoute $minutes min';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => 'Ajoute 1 chapitre';

  @override
  String get sleepTimerSheetResetsToFull => 'Revient à la durée complète';

  @override
  String get sleepTimerSheetTabSpecificChapter => 'Chapitre';

  @override
  String get sleepTimerSheetSpecificNoChapters => 'Aucun chapitre disponible';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return 'Chapitre $number';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => 'passé';

  @override
  String get sleepTimerSheetSpecificStart => 'Début du chapitre';

  @override
  String get sleepTimerSheetSpecificEnd => 'Fin du chapitre';

  @override
  String get sleepTimerSheetSpecificEndsAt =>
      'Le minuteur de veille se terminera à';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return 'dans $countdown';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed => 'Ce point est déjà passé';

  @override
  String get sleepTimerSheetSpecificStartButton => 'Démarrer le minuteur';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => 'Déjà passé';

  @override
  String get timeAm => 'AM';

  @override
  String get timePm => 'PM';

  @override
  String get collectionPickerCollectionFallback => 'Collection';

  @override
  String collectionPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get playlistPickerPlaylistFallback => 'Liste de lecture';

  @override
  String playlistPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get cardChaptersPlayFromChapterTitle => 'Jouer à partir du chapitre ?';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return 'Lancer la lecture depuis « $title » ?';
  }

  @override
  String get cardChaptersPlay => 'Lire';

  @override
  String get absorbingSharedToday => 'Aujourd\'hui';

  @override
  String get absorbingSharedYesterday => 'Hier';

  @override
  String get absorbingSharedMonday => 'Lundi';

  @override
  String get absorbingSharedTuesday => 'Mardi';

  @override
  String get absorbingSharedWednesday => 'Mercredi';

  @override
  String get absorbingSharedThursday => 'Jeudi';

  @override
  String get absorbingSharedFriday => 'Vendredi';

  @override
  String get absorbingSharedSaturday => 'Samedi';

  @override
  String get absorbingSharedSunday => 'Dimanche';

  @override
  String get absorbingSharedAm => 'AM';

  @override
  String get absorbingSharedPm => 'PM';

  @override
  String sectionDetailAddedToAbsorbing(String title) {
    return '« $title » ajouté à Lecture';
  }

  @override
  String get sectionDetailDoneBadge => 'Terminé';

  @override
  String get homeCustomizeAddGenreTitle => 'Ajouter une section de genre';

  @override
  String get homeCustomizeAddGenreSubtitle =>
      'Choisissez un genre à afficher sur votre écran d\'accueil';

  @override
  String get homeSectionDoneBadge => 'Terminé';

  @override
  String get tipsSheetQuickBookmarksTitle => 'Signets rapides';

  @override
  String get tipsSheetQuickBookmarksDesc =>
      'Appuyez longuement sur le bouton de signet de n\'importe quelle carte pour déposer instantanément un signet à votre position actuelle sans ouvrir la feuille de signets.';

  @override
  String get tipsSheetCoverPlayPauseTitle => 'Lecture/pause sur la couverture';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      'Appuyez sur la pochette de n\'importe quelle carte pour jouer ou mettre en pause. Activez ceci dans Réglages sous Cartes d\'Absorption. Une icône de pause pâle apparaît lors de la lecture pour que vous sachiez qu\'elle est tappable.';

  @override
  String get tipsSheetFullScreenPlayerTitle => 'Lecteur plein écran';

  @override
  String get tipsSheetFullScreenPlayerDesc =>
      'Glissez vers le haut sur n\'importe quelle carte d\'absorption pour ouvrir le lecteur en plein écran. Glissez vers le bas pour le refermer.';

  @override
  String get tipsSheetQuickAddAbsorbingTitle => 'Ajout rapide à Lecture';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      'Glissez à droite sur n\'importe quel livre dans une page de liste (séries, auteur, résultats de recherche) pour l\'ajouter instantanément à votre file d\'attente.';

  @override
  String get tipsSheetShakeExtendSleepTitle =>
      'Secouer pour prolonger la veille';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      'Si vous avez un minuteur de sommeil en cours et que vous secouez votre téléphone, cela ajoutera des minutes supplémentaires. Configurez la quantité dans les paramètres sous Minuterie de sommeil.';

  @override
  String get tipsSheetSeriesNavigationTitle => 'Navigation dans les séries';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      'Appuyez sur le nom de la série dans la popup de détails de n\'importe quel livre pour voir tous les livres de la série, trié en ordre de lecture avec des badges séquentiels sur chaque couverture.';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => 'Balayer entre les livres';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      'Glissez vers la gauche et la droite sur l\'écran Absorbing pour basculer entre vos livres en cours. Avec le mode file d\'attente manuelle activée, les cartes agissent également comme une file d\'attente, de sorte que la prochaine jouera automatiquement lorsque la carte actuelle se terminera.';

  @override
  String get tipsSheetTapToSeekTitle => 'Appuyer pour se déplacer';

  @override
  String get tipsSheetTapToSeekDesc =>
      'Tapotez n\'importe où sur la barre de progression du chapitre ou du livre pour passer directement à cette position. Vous pouvez également faire glisser les barres pour un contrôle précis.';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle => 'Temps ajusté à la vitesse';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      'Toutes les durées affichées - position, chapitres, signets - s\'ajustent à votre vitesse de lecture. Vous écoutez à 1,5x ? Les durées montrées reflètent combien de temps ils vous prendront effectivement.';

  @override
  String get tipsSheetPlaybackHistoryTitle => 'Historique de lecture';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      'Appuyez sur le bouton Historique de n\'importe quelle carte pour voir une chronologie de chaque lecture, pause, recherche et changement de vitesse. Appuyez sur n\'importe quel événement pour revenir à cette position.';

  @override
  String get tipsSheetAutoRewindTitle => 'Retour arrière auto';

  @override
  String get tipsSheetAutoRewindDesc =>
      'Lorsque vous redémarrez après une pause, Absorb revient en arrière automatiquement de quelques secondes pour ne pas perdre votre place. La durée du retour varie avec le temps d\'absence. Configurez-le dans les paramètres.';

  @override
  String get tipsSheetSeriesQueueModeTitle => 'Mode file de séries';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      'Quand vous avez terminé un livre qui fait partie d\'une série, Absorb peut automatiquement lire le livre suivant. Réglez le mode file d\'attente sur \"Séries\" dans les paramètres.';

  @override
  String get tipsSheetOfflineModeTitle => 'Mode hors-ligne';

  @override
  String get tipsSheetOfflineModeDesc =>
      'Appuyez sur le bouton Avion de l\'écran Absorption pour passer en mode hors ligne. Ceci arrête la synchronisation, enregistre les données et affiche uniquement les livres téléchargés. Idéal pour les vols ou les zones de faible signal.';

  @override
  String get tipsSheetUpcomingReleasesTitle => 'Sorties à venir';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      'Dans l\'onglet Série, appuyez à nouveau sur l\'onglet pour ouvrir sa page de tri et de filtre, puis choisissez Sorties à venir pour voir les nouveaux livres et ceux à venir de votre série, triés par date de publication.';

  @override
  String get tipsSheetPerBookEqTitle => 'Égaliseur par livre';

  @override
  String get tipsSheetPerBookEqDesc =>
      'Chaque livre se souvient de ses propres paramètres d\'égaliseur. Ajuster l\'EQ une fois pour une épopée de science-fiction et la prochaine fois que vous la jouerez, il sonnera pareil.';

  @override
  String get tipsSheetPerBookSpeedTitle => 'Vitesse par livre';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      'La vitesse de lecture est enregistrée par livre. Écoutez une non-fiction à 1,5x et une fiction dramatique à 1,0x sans le définir à chaque fois.';

  @override
  String get tipsSheetAutoSleepWindowTitle => 'Plage de veille automatique';

  @override
  String get tipsSheetAutoSleepWindowDesc =>
      'Choisissez les heures où vous vous endormez habituellement et le minuteur de sommeil se déclenchera quand vous commencerez à écouter dans cette plage.';

  @override
  String get tipsSheetSleepFadeChimeTitle => 'Fondu et carillon de veille';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      'Quand le minuteur de sommeil se termine, l\'audio s\'estompe graduellement et une cloche optionnelle joue pour qu\'il ne coupe pas au milieu d\'une phrase.';

  @override
  String get tipsSheetCarModeTitle => 'Mode voiture';

  @override
  String get tipsSheetCarModeDesc =>
      'Appuyez sur l\'icône de la voiture pour passer en mode bouton géant conçu pour une utilisation plus sûre pendant la conduite.';

  @override
  String get tipsSheetAudibleSeriesTitle => 'Découverte de séries Audible';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      'Ouvrez une série et utilisez le menu de débordement (les trois points) pour récupérer la liste complète des séries d\'Audible, y compris les entrées manquantes et les livres que vous n\'avez pas commencés.';

  @override
  String get tipsSheetTranscribeBookmarkTitle => 'Transcrire les signets';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      'Transformez l\'audio de n\'importe quel signet en texte, entièrement sur votre appareil. Activez-le dans Paramètres sous Avancé > Transcription et téléchargez un modèle, puis appuyez sur Transcrire un signet - le texte se retrouve dans sa note, prêt à être corrigé ou partagé.';

  @override
  String get tipsSheetFindBetweenFormatsTitle =>
      'Passer du livre audio à l\'ebook';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      'Avec la transcription activée et le livre téléchargé, mettre en pause et appuyer sur Rechercher la position dans l\'ebook sur le lecteur pour ouvrir l\'ebook au passage que vous venez d\'entendre. Dans le lecteur, sélectionnez du texte et touchez les écouteurs pour démarrer le livre audionumérique à cette position.';

  @override
  String get tipsSheetShareQuoteTitle => 'Partager des citations';

  @override
  String get tipsSheetShareQuoteDesc =>
      'Partagez un surlignage d\'ebook ou une note de signets comme image avec la citation sur la couverture du livre. Recherchez l\'option partage sur les points forts et dans la page de signets.';

  @override
  String get tipsSheetClipExportTitle => 'Exporter des extraits audio';

  @override
  String get tipsSheetClipExportDesc =>
      'Ouvrez un signet et appuyez sur Exporter l\'extrait pour découper et enregistrer un court extrait audio du livre, pochette comprise - idéal pour partager une scène préférée.';

  @override
  String get tipsSheetAllHighlightsTitle =>
      'Tous les passages surlignés au même endroit';

  @override
  String get tipsSheetAllHighlightsDesc =>
      'La page Tous les signets a un onglet Passages surlignés qui rassemble tous les passages surlignés de tous vos ebooks. Appuyez sur l\'un d\'eux pour le partager ou retourner dans le livre.';

  @override
  String get tipsSheetVolumeKeyPagesTitle =>
      'Pages tournées avec les touches de volume';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      'Tournez les pages des ebooks avec les touches de volume. Activez-le dans les paramètres du lecteur - sens normal ou inversé, et il peut rester actif même pendant la lecture audio.';

  @override
  String get tipsSheetSettingsSyncTitle => 'Synchronisation des paramètres';

  @override
  String get tipsSheetSettingsSyncDesc =>
      'Gardez vos paramètres, vos vitesses par livre et l\'ordre de Lecture synchronisés entre vos appareils via votre propre serveur WebDAV. Configurez-le dans les Paramètres, sous Sauvegarde et synchronisation.';

  @override
  String get tipsSheetNavLongPressTitle => 'Appui long sur les onglets du bas';

  @override
  String get tipsSheetNavLongPressDesc =>
      'Maintenez l\'onglet Accueil pour changer de bibliothèque depuis n\'importe quelle page. Maintenez l\'onglet Bibliothèque pour aller directement à la recherche.';

  @override
  String get bookCardUnknownTitle => 'Titre inconnu';

  @override
  String get bookCardExplicitBadge => 'E';

  @override
  String get bookCardDone => 'Terminé';

  @override
  String get bookCardSaved => 'Enregistré';

  @override
  String get episodeRowEpisode => 'Épisode';

  @override
  String get episodeRowToday => 'Aujourd\'hui';

  @override
  String get episodeRowYesterday => 'Hier';

  @override
  String episodeRowDaysAgo(int count) {
    return 'Il y a $count j';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return 'Il y a $count sem';
  }

  @override
  String episodeRowDurationHm(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String episodeRowDurationM(int minutes) {
    return '${minutes}m';
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
  String get librarySearchResultsDone => 'Terminé';

  @override
  String get librarySearchResultsSaved => 'Enregistré';

  @override
  String librarySearchResultsSequence(String number) {
    return '#$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => 'Série inconnue';

  @override
  String get librarySearchResultsUnknownEpisode => 'Épisode inconnu';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres',
      one: '1 livre',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => 'E';

  @override
  String get libraryGridTilesDone => 'Terminé';

  @override
  String get libraryGridTilesSaved => 'Enregistré';

  @override
  String libraryGridTilesSequence(String number) {
    return '#$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => 'Série inconnue';

  @override
  String get seriesCardUnknownSeries => 'Série inconnue';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres',
      one: '1 livre',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => 'Défilement précis';

  @override
  String get cardProgressQuarterSpeed => 'Vitesse /4';

  @override
  String get cardProgressHalfSpeed => 'Vitesse /2';

  @override
  String cardProgressChapterPrefix(String number) {
    return 'Chapitre $number';
  }

  @override
  String get cardEdgeProgressFineScrubbing => 'Défilement précis';

  @override
  String get cardEdgeProgressQuarterSpeed => 'Vitesse /4';

  @override
  String get cardEdgeProgressHalfSpeed => 'Vitesse /2';

  @override
  String get authSessionExpired =>
      'Session expirée. Veuillez vous reconnecter.';

  @override
  String authCannotReachServer(String url) {
    return 'Impossible de joindre le serveur à $url';
  }

  @override
  String get authInvalidUsernameOrPassword =>
      'Nom d\'utilisateur ou mot de passe incorrect';

  @override
  String get authInvalidApiKey => 'Clé API invalide';

  @override
  String get authLoginFailedDetail =>
      'Échec de la connexion - vérifiez l\'adresse du serveur et vos identifiants';

  @override
  String get authUnexpectedServerResponse => 'Réponse inattendue du serveur';

  @override
  String get authSsoUnexpectedResponse =>
      'Le SSO a renvoyé une réponse inattendue';

  @override
  String get authSwitchedToLocalServer => 'Passage au serveur local';

  @override
  String get authSwitchedToRemoteServer => 'Passage au serveur distant';

  @override
  String get lpDeletedFinishedDownload => 'Téléchargement achevé supprimé';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nouveaux épisodes en cours de téléchargement',
      one: '1 nouvel épisode en cours de téléchargement',
    );
    return '$showTitle: $_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return '$showTitle ajouté en tête de votre file';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return '$showTitle ajouté en 2e position de votre file';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return '$showTitle ajouté à la fin de votre file';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return 'Nouvel épisode de $showTitle téléchargé';
  }

  @override
  String get statsWeekStartsOn => 'La semaine commence le';

  @override
  String get episodeListNewEpisodePosition => 'Position des nouveaux épisodes';

  @override
  String get episodeListPositionTop => 'En haut de la file d\'attente';

  @override
  String get episodeListPositionSecond => 'Deuxième dans la file d\'attente';

  @override
  String get episodeListPositionEnd => 'Fin de la file d\'attente';

  @override
  String get episodeListPositionNone => 'Ne pas ajouter à la file';

  @override
  String get episodeListPositionNoneDesc => 'Toujours notifié et téléchargé';

  @override
  String sleepRewindUndoNote(int minutes) {
    return 'Appuyez sur lecture dans les $minutes minutes et le retour arrière est annulé';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'File : téléchargement de $count éléments',
      one: 'File : téléchargement de 1 élément',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Téléchargement de $count livres',
      one: 'Téléchargement d\'1 livre',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Téléchargement de $count épisodes',
      one: 'Téléchargement d\'1 épisode',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName =>
      'Progression des téléchargements';

  @override
  String get downloadNotifProgressChannelDesc =>
      'Affiche la progression pendant les téléchargements de livres audio';

  @override
  String get downloadNotifAlertChannelName => 'Alertes de téléchargement';

  @override
  String get downloadNotifAlertChannelDesc =>
      'Notifications quand les téléchargements se terminent ou échouent';

  @override
  String get downloadNotifDownloadingTitle => 'Téléchargement…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count téléchargements actifs',
      one: '1 téléchargement actif',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return 'Téléchargement : $title';
  }

  @override
  String get downloadNotifStartingLabel => 'Démarrage…';

  @override
  String get downloadNotifCompleteTitle => 'Téléchargement terminé';

  @override
  String downloadNotifCompleteBody(String title) {
    return '$title est prêt à être écouté hors ligne';
  }

  @override
  String get downloadNotifFailedTitle => 'Téléchargement échoué';

  @override
  String get upcomingNotifChannelName => 'Analyse des sorties à venir';

  @override
  String get upcomingNotifChannelDesc =>
      'Affiche la progression pendant l\'analyse des sorties à venir';

  @override
  String get upcomingNotifScanTitle => 'Analyse des sorties à venir';

  @override
  String get upcomingNotifStartingScan => 'Démarrage de l\'analyse…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return 'Vérification de $seriesName… ($current/$total)';
  }

  @override
  String get upcomingNotifFoundTitle => 'Sorties à venir trouvées !';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$series séries',
      one: '1 série',
    );
    return '$books à venir dans $_temp0';
  }

  @override
  String get androidAutoTabContinue => 'Continuer';

  @override
  String get androidAutoTabLibrary => 'Bibliothèque';

  @override
  String get androidAutoTabDownloads => 'Téléchargements';

  @override
  String get settingsSearchHint => 'Rechercher dans les paramètres...';

  @override
  String get settingsSearchNoResults => 'Aucun paramètre correspondant';

  @override
  String get carConnectAutoplay =>
      'Lancer la lecture à la connexion d\'Android Auto';

  @override
  String get carConnectAutoplayIos =>
      'Lancer la lecture à la connexion de CarPlay';

  @override
  String get carConnectAutoplayOnSubtitle =>
      'Le dernier livre que vous écoutiez démarre tout seul quand la voiture se connecte';

  @override
  String get carConnectAutoplayOffSubtitle =>
      'La lecture attend que vous appuyiez sur lecture';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => 'Utiliser avec Siri';

  @override
  String get siriStatusOn =>
      'Activé. Siri peut trouver et lire vos livres et podcasts par leur nom.';

  @override
  String get siriStatusAsk =>
      'Laissez Siri trouver et lire vos livres et podcasts par leur nom.';

  @override
  String get siriStatusOff =>
      'Siri est désactivé pour Absorb. Activez-le dans les Réglages iOS.';

  @override
  String get siriAllow => 'Autoriser';

  @override
  String get siriOpenSettings => 'Ouvrir les Réglages';

  @override
  String get siriThingsToSay => 'Phrases à dire';

  @override
  String get siriExamples =>
      '« Lis [titre du livre] sur Absorb »\n« Lis [nom de la série] sur Absorb »\n« Lis quelque chose de [auteur] sur Absorb »\n« Lis le dernier épisode de [podcast] sur Absorb »\n« Reprends Absorb »\n« Recule dans Absorb »\n« Chapitre suivant dans Absorb »\n« Mets un minuteur de veille dans Absorb »\n« Ajoute un signet dans Absorb »\n« Qu\'est-ce que j\'écoute dans Absorb »';

  @override
  String get siriShortcutsNote =>
      'Reprendre, pause, sauts, chapitres, minuteur de veille, signets et lecture en cours fonctionnent même sans cette autorisation. Ils sont aussi dans l\'app Raccourcis pour les automatisations et le bouton Action.';

  @override
  String get carBookOrder => 'Ordre des livres dans la voiture';

  @override
  String get carBookOrderReverse => 'Inverser l\'ordre des livres';

  @override
  String get carBookOrderReverseSubtitle =>
      'De Z à A, ou les plus anciens ajoutés en premier';

  @override
  String get carPodcastOrder => 'Ordre des podcasts dans la voiture';

  @override
  String get carEpisodesOldestFirst => 'Épisodes les plus anciens d\'abord';

  @override
  String get carEpisodesOldestFirstSubtitle =>
      'Pour les émissions que vous écoutez depuis le début';

  @override
  String get androidAutoCatBooks => 'Livres';

  @override
  String get androidAutoCatSeries => 'Séries';

  @override
  String get androidAutoCatAuthors => 'Auteurs';

  @override
  String get androidAutoCatCollections => 'Collections';

  @override
  String get androidAutoCatPlaylists => 'Listes de lecture';

  @override
  String get showTipsAgain => 'Afficher les conseils à nouveau';

  @override
  String get showTipsAgainSubtitle =>
      'Rétablir les astuces que vous avez fermées';

  @override
  String get tipsRestored => 'Conseils rétablis';

  @override
  String get resetSpeedPresets => 'Réinitialiser les préréglages de vitesse';

  @override
  String get resetSpeedPresetsSubtitle =>
      'Rétablir les puces de vitesse de lecture par défaut';

  @override
  String get speedPresetsReset => 'Préréglages de vitesse réinitialisés';

  @override
  String get editAuthor => 'Modifier l\'auteur';

  @override
  String get authorName => 'Nom';

  @override
  String get authorImage => 'Image de l\'auteur';

  @override
  String get authorRemoveImage => 'Supprimer l’image';

  @override
  String get authorRemoveImageTitle => 'Retirer l\'image de l\'auteur ?';

  @override
  String get authorRemoveImageConfirm => 'Ceci efface l\'image sur le serveur.';

  @override
  String get authorImageRemoved => 'Image supprimée';

  @override
  String get authorImageFailed =>
      'Impossible de mettre à jour l\'image de l\'auteur';

  @override
  String get authorUpdated => 'Auteur mis à jour';

  @override
  String get authorUpdateFailed => 'Impossible de mettre à jour l\'auteur';

  @override
  String get authorMatched => 'Auteur mis à jour depuis la correspondance';

  @override
  String get authorNoMatchFound => 'Aucune correspondance trouvée';

  @override
  String authorMergedInto(String name) {
    return 'Fusionné dans $name';
  }

  @override
  String get authorQuickMatchHint =>
      'Récupérer le nom, l\'ASIN, la description et l\'image de Audible pour la région choisie.';

  @override
  String get region => 'Région';

  @override
  String get editTabDetails => 'Détails';

  @override
  String get editTabCover => 'Couverture';

  @override
  String get editTabMatch => 'Correspondance';

  @override
  String get editTabEmbed => 'Intégré';

  @override
  String get chapterEditorTitle => 'Modifier les chapitres';

  @override
  String get chapterNotConnected => 'Non connecté à un serveur';

  @override
  String get chapterErrorFirstNotZero =>
      'Le premier chapitre doit commencer à 0:00';

  @override
  String get chapterErrorStartAfterPrevious =>
      'Le début doit venir après le chapitre précédent';

  @override
  String get chapterErrorStartBeforeEnd =>
      'Le début doit être avant la fin du livre';

  @override
  String get chapterErrorTitleRequired => 'Titre obligatoire';

  @override
  String get chapterEditStartTitle => 'Modifier l\'heure de début';

  @override
  String get chapterTimeHintSeconds => 'Secondes';

  @override
  String get chapterTimeHintFull => 'HH:MM:SS ou secondes';

  @override
  String get chapterInvalidTime => 'Heure non valide';

  @override
  String get chapterLocked => 'Le chapitre est verrouillé';

  @override
  String get chapterAllLocked => 'Tous les chapitres sont verrouillés';

  @override
  String chapterTrackTitle(int number) {
    return 'Piste $number';
  }

  @override
  String get chapterNoAudioForPosition => 'Aucun audio pour cette position';

  @override
  String get chapterCouldNotPlayPreview => 'Impossible de lire l\'aperçu';

  @override
  String chapterStartSetTo(String time) {
    return 'Début défini à $time';
  }

  @override
  String get chapterAddNumberedTitle => 'Ajouter des chapitres numérotés';

  @override
  String chapterNextPreview(String first, String second) {
    return 'Ensuite : « $first », « $second », ...';
  }

  @override
  String get chapterHowMany => 'Combien de chapitres';

  @override
  String get add => 'Ajouter';

  @override
  String get chapterCountRange => 'Saisissez un nombre entre 1 et 150';

  @override
  String get chapterTitlesUpdated => 'Titres des chapitres mis à jour';

  @override
  String get chaptersApplied => 'Chapitres appliqués';

  @override
  String get chapterDiscardTitle => 'Abandonner les changements ?';

  @override
  String get chapterDiscardMessage => 'Revenir aux chapitres enregistrés.';

  @override
  String get chapterRemoveAllTitle => 'Retirer tous les chapitres ?';

  @override
  String get chapterRemoveAllMessage =>
      'Cela retire tous les chapitres de ce livre.';

  @override
  String get chapterAllRemoved => 'Tous les chapitres ont été retirés';

  @override
  String get chapterFixHighlighted =>
      'Corrigez d\'abord les chapitres en surbrillance';

  @override
  String get chaptersUpdated => 'Chapitres mis à jour';

  @override
  String get ok => 'OK';

  @override
  String get chapterSaveButton => 'Enregistrer les chapitres';

  @override
  String get chapterAddHint => 'Ajouter un chapitre (p. ex. « Chapitre 01 »)';

  @override
  String get chapterAddTooltip => 'Ajouter des chapitres';

  @override
  String get chapterRemoveAll => 'Tout supprimer';

  @override
  String get chapterShiftTimes => 'Décaler les temps';

  @override
  String get chapterFromTracks => 'À partir des pistes';

  @override
  String get chapterLookup => 'Rechercher';

  @override
  String get chapterShowSeconds => 'Afficher les secondes';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get chapterLoopCut => 'Répéter la coupure';

  @override
  String get chapterFindStart => 'Trouver le début';

  @override
  String get chapterFindStartListening => 'Écoute autour du repère';

  @override
  String get chapterFindStartNone =>
      'Rien ici ne ressemble à un début de chapitre';

  @override
  String get chapterFindStartWider => 'Chercher plus large';

  @override
  String get chapterFindStartCeiling =>
      'Recherche sur une demi-heure autour du repère. Le début est plus loin, ou aucune annonce de chapitre n\'est audible.';

  @override
  String get chapterFindStartStrong => 'Ressemble à ce chapitre';

  @override
  String get chapterFindStartMaybe => 'Mots évoquant un chapitre';

  @override
  String chapterFindStartGap(String seconds) {
    return 'Silence de $seconds s';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return 'Recherche de $from à $to';
  }

  @override
  String get chapterFindStartNeedsModel =>
      'Activez d\'abord la transcription dans les Paramètres et téléchargez un modèle';

  @override
  String get chapterFindStartUseThis => 'Utiliser celui-ci';

  @override
  String chapterFindStartTitle(String title) {
    return 'Titre : $title';
  }

  @override
  String get chapterShiftBySeconds => 'Décaler de (secondes)';

  @override
  String get chapterShiftHint =>
      'Décale tous les chapitres non verrouillés. Utilisez une valeur négative pour les avancer.';

  @override
  String get chapterTitleHint => 'Titre du chapitre';

  @override
  String get chapterStopPreview => 'Arrêt de l\'aperçu';

  @override
  String get chapterPreviewFromHere => 'Écouter à partir d\'ici';

  @override
  String get chapterScrubHint =>
      'Faites glisser ou ajustez pour déplacer le début';

  @override
  String chapterStartAt(String time) {
    return 'Commencer à $time';
  }

  @override
  String get chapterUnlock => 'Déverrouiller';

  @override
  String get chapterLock => 'Verrouiller';

  @override
  String get chapterInsertBelow => 'Insérer en dessous';

  @override
  String get chapterFindTitle => 'Rechercher les chapitres';

  @override
  String get chapterFindSubtitle =>
      'Recherche les chapitres sur Audible/Audnexus par ASIN.';

  @override
  String get chapterEnterAsin => 'Entrez un ASIN';

  @override
  String get chapterLookupFailed => 'Échec de la recherche - vérifiez l\'ASIN';

  @override
  String get chapterNoChaptersFound => 'Aucun chapitre trouvé pour cet ASIN';

  @override
  String get chapterRemoveBranding => 'Retirer la marque Audible (intro/outro)';

  @override
  String chapterFoundCount(int count) {
    return '$count chapitres trouvés';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  Livre $book';
  }

  @override
  String get chapterAudibleLonger =>
      'La version Audible est plus longue que votre fichier - les chapitres suivants peuvent ne pas s\'aligner.';

  @override
  String get chapterAudibleShorter =>
      'La version Audible est plus courte que votre fichier - les chapitres peuvent ne pas s\'aligner.';

  @override
  String get chapterTitlesOnly => 'Titres seulement';

  @override
  String get chapterApplyChapters => 'Appliquer les chapitres';

  @override
  String get coverSearchTitle => 'Rechercher une couverture';

  @override
  String get coverSearchRefineHint =>
      'Affinez le titre/auteur pour nettoyer les résultats - cela ne change pas le livre.';

  @override
  String get coverNoneFound => 'Aucune couverture trouvée';

  @override
  String get coverEnterTitleFirst => 'Saisissez d\'abord un titre';

  @override
  String get coverUpdated => 'Couverture mise à jour';

  @override
  String get coverCouldNotUpdate => 'Impossible de mettre à jour la couverture';

  @override
  String get coverApply => 'Appliquer la couverture';

  @override
  String get coverUnknownResolution => 'Résolution inconnue';

  @override
  String get embedIntro =>
      'Intègre les métadonnées aux fichiers audio, y compris la couverture et les chapitres.';

  @override
  String get embedBackupOption => 'Sauvegarder d\'abord les fichiers audio';

  @override
  String get embedNoteInFolder =>
      'Les métadonnées seront intégrées dans les pistes audio dans le dossier de votre livre audio.';

  @override
  String get embedNoteMultiTrack =>
      'Les chapitres ne sont pas intégrés aux livres audio multipistes.';

  @override
  String get embedNoteNavigateAway =>
      'Une fois la tâche lancée, vous pouvez quitter cette page.';

  @override
  String get embedStartButton => 'Lancer l\'intégration des métadonnées';

  @override
  String embedProgress(String percent) {
    return 'Intégration $percent %';
  }

  @override
  String get embedProgressIndeterminate => 'Intégration...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent % - continue si vous quittez cette page';
  }

  @override
  String get taskStarting => 'Démarrage...';

  @override
  String get embedBackupNoteIntro =>
      'Une sauvegarde de vos fichiers audio d\'origine sera stockée sur le serveur dans ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro =>
      '. Pensez à purger régulièrement le cache des éléments.';

  @override
  String get embedDialogTitle => 'Intégrer les métadonnées';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# fichiers audio',
      one: '# fichier audio',
    );
    return 'Intégrez les métadonnées dans $_temp0? Vos fichiers audio seront réécrits$backup.';
  }

  @override
  String get embedConfirmBackupClause => ' (originaux sauvegardés d\'abord)';

  @override
  String get embedConfirmAction => 'Intégrer';

  @override
  String get embedCouldNotStart => 'Impossible de lancer l\'intégration';

  @override
  String get embedStarted => 'Intégration démarrée';

  @override
  String get embedComplete => 'Intégration terminée';

  @override
  String get embedFailed => 'Échec de l\'intégration';

  @override
  String get encodeComplete => 'Encodage terminé';

  @override
  String get encodeFailedTask => 'L\'encodage a échoué';

  @override
  String encodeProgress(String percent) {
    return 'Encodage $percent %';
  }

  @override
  String get encodeProgressIndeterminate => 'Encodage...';

  @override
  String get adminApiKeys => 'Clés API';

  @override
  String get adminApiKeysSubtitle => 'Jetons d\'accès programmatique';

  @override
  String get adminApiKeysNewTitle => 'Nouvelle clé API';

  @override
  String get adminApiKeysName => 'Nom';

  @override
  String get adminApiKeysNameHint => 'p. ex. Home Assistant';

  @override
  String get adminApiKeysOwner => 'Utilisateur';

  @override
  String get adminApiKeysExpiration => 'Expiration';

  @override
  String get adminApiKeysActive => 'Active';

  @override
  String get adminApiKeysActiveSub => 'La clé fonctionne dès sa création';

  @override
  String get adminApiKeysInactive => 'Inactive';

  @override
  String get adminApiKeysExpired => 'Expirée';

  @override
  String get adminApiKeysCreate => 'Créer une clé';

  @override
  String get adminApiKeysCreated => 'Clé API créée';

  @override
  String get adminApiKeysTokenLabel => 'Votre nouvelle clé API';

  @override
  String get adminApiKeysCopyWarning =>
      'Copiez cette clé maintenant. Par sécurité, elle ne sera pas affichée à nouveau.';

  @override
  String get adminApiKeysCopy => 'Copier';

  @override
  String get adminApiKeysCopied => 'Copiée dans le presse-papiers';

  @override
  String get adminApiKeysDone => 'Terminé';

  @override
  String get adminApiKeysDeleteTitle => 'Révoquer la clé API ?';

  @override
  String get adminApiKeysDeleted => 'Clé API révoquée';

  @override
  String get adminApiKeysRevoke => 'Révoquer';

  @override
  String get adminApiKeysSetActive => 'Activer';

  @override
  String get adminApiKeysSetInactive => 'Désactiver';

  @override
  String get adminApiKeysFailedCreate => 'Impossible de créer la clé API';

  @override
  String get adminApiKeysFailedDelete => 'Impossible de révoquer la clé API';

  @override
  String get adminApiKeysFailedUpdate =>
      'Impossible de mettre à jour la clé API';

  @override
  String get adminApiKeysEmpty => 'Aucune clé API pour le moment';

  @override
  String get adminApiKeysEmptySub =>
      'Créez-en une pour permettre aux applications et scripts d\'accéder à votre serveur';

  @override
  String get adminApiKeysNeverUsed => 'Jamais utilisée';

  @override
  String get adminApiKeysNeverExpires => 'Pas d\'expiration';

  @override
  String get adminApiKeysNameRequired => 'Entrez un nom';

  @override
  String get adminApiKeysUserRequired => 'Sélectionner un utilisateur';

  @override
  String get adminApiKeysExpNever => 'Jamais';

  @override
  String get adminApiKeysExp7d => '7 jours';

  @override
  String get adminApiKeysExp30d => '30 jours';

  @override
  String get adminApiKeysExp90d => '90 jours';

  @override
  String get adminApiKeysExp1y => '1 an';

  @override
  String adminApiKeysLastUsed(String time) {
    return 'Dernière utilisation $time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return 'Expire le $date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return 'Révoquer \"$name\" ? Les applications utilisant cette clé perdront accès immédiatement.';
  }

  @override
  String get endOfEpisode => 'Fin de l\'épisode';

  @override
  String get sleepTimerSheetEpisodeSleepStart =>
      'Veille à la fin de l\'épisode';

  @override
  String get bookmarkListen => 'Écouter';

  @override
  String get bookmarkPause => 'Pause';

  @override
  String get bookmarkPreviewFailed => 'Impossible de lire cet endroit.';

  @override
  String get clipExport => 'Exporter le clip';

  @override
  String get clipJumpToStart => 'Se déplacer au début';

  @override
  String get clipJumpToEnd => 'Sauter à la fin';

  @override
  String get clipSetStart => 'Définir le début';

  @override
  String get clipSetEnd => 'Définir la fin';

  @override
  String get clipInLabel => 'Début';

  @override
  String get clipOutLabel => 'Fin';

  @override
  String get clipSave => 'Enregistrer le clip';

  @override
  String clipExportSaved(String filename) {
    return '$filename sauvegardé';
  }

  @override
  String get clipExportClamped =>
      'Extrait enregistré, raccourci jusqu\'à la fin de cette piste';

  @override
  String get clipExportFailed => 'Impossible d\'exporter l\'extrait.';

  @override
  String get clipDownloadToExport =>
      'Téléchargez d\'abord ce livre pour exporter un extrait sur iPhone.';

  @override
  String get fsPickerTitle => 'Sélectionner un dossier';

  @override
  String get fsServerRoot => 'Racine du serveur';

  @override
  String get fsEmptyFolder => 'Aucun sous-dossier ici';

  @override
  String get fsUseThisFolder => 'Utiliser ce dossier';

  @override
  String get adminLibrariesManage => 'Bibliothèques';

  @override
  String get adminLibrariesManageSubtitle => 'Créer, modifier et réorganiser';

  @override
  String get adminUploadTitle => 'Téléverser un média';

  @override
  String get adminUploadSubtitle =>
      'Ajouter des livres et podcasts depuis des fichiers';

  @override
  String get adminUploadNoLibraries =>
      'Créez une bibliothèque avant de téléverser des médias.';

  @override
  String get adminUploadDestination => 'Destination';

  @override
  String get adminUploadFolder => 'Dossier de la bibliothèque';

  @override
  String get adminUploadDetails => 'Détails de l\'élément';

  @override
  String get adminUploadOptional => 'Facultatif';

  @override
  String get adminUploadAutoMetadata =>
      'Récupérer les métadonnées automatiquement';

  @override
  String get adminUploadAutoMetadataSubtitle =>
      'Remplir titre, auteur et série d\'après la meilleure correspondance';

  @override
  String get adminUploadMetadataProvider => 'Fournisseur de métadonnées';

  @override
  String get adminUploadMetadataSearching => 'Recherche des métadonnées...';

  @override
  String get adminUploadMetadataNoResults =>
      'Aucune métadonnée trouvée. Vous pouvez toujours envoyer cet élément.';

  @override
  String get adminUploadMetadataFailed =>
      'Impossible de rechercher les métadonnées. Vous pouvez quand même téléverser cet élément.';

  @override
  String get adminUploadDestinationPreview => 'Serveur destinataire';

  @override
  String get adminUploadFiles => 'Fichiers';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '1 fichier',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => 'Choisir les fichiers';

  @override
  String get adminUploadAddFiles => 'Ajouter des fichiers';

  @override
  String get adminUploadBookFilesHint =>
      'Choisissez des fichiers audio ou ebook. Vous pouvez également inclure des fichiers de couvertures et de métadonnées.';

  @override
  String get adminUploadPodcastFilesHint =>
      'Choisissez un ou plusieurs fichiers audio. Vous pouvez également inclure des pochettes et des fichiers de métadonnées.';

  @override
  String get adminUploadUnsupportedFiles =>
      'Certains fichiers sélectionnés ne sont pas pris en charge par Audiobookshelf.';

  @override
  String get adminUploadFilePickerFailed =>
      'Impossible d\'ouvrir les fichiers sélectionnés.';

  @override
  String get adminUploadTitleRequired => 'Entrez un titre';

  @override
  String get adminUploadLibraryRequired => 'Choisir une bibliothèque';

  @override
  String get adminUploadFolderRequired =>
      'Choisissez un dossier de bibliothèque';

  @override
  String get adminUploadFilesRequired => 'Choisissez au moins un fichier';

  @override
  String get adminUploadPodcastFileRequired =>
      'Choisissez au moins un fichier audio pour ce podcast.';

  @override
  String get adminUploadBookFileRequired =>
      'Choisissez au moins un fichier audio ou ebook pour ce livre.';

  @override
  String get adminUploadPathCheckFailed =>
      'Impossible de vérifier le dossier de destination. Rien n\'a été téléversé.';

  @override
  String get adminUploadDestinationExists =>
      'Ce dossier de destination existe déjà sur le serveur.';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return 'Cette destination est déjà utilisée par « $title ».';
  }

  @override
  String get adminUploadAddToExistingTitle => 'Le dossier existe déjà';

  @override
  String adminUploadAddToExisting(String title) {
    return 'Ce dossier appartient à « $title ». Y ajouter les fichiers ? Le serveur les prendra en compte à sa prochaine analyse.';
  }

  @override
  String get adminUploadAddToExistingNoItem =>
      'Ce dossier existe déjà sur le serveur. Y ajouter les fichiers ?';

  @override
  String get adminUploadAddToBook => 'Ajouter à un livre existant';

  @override
  String get adminUploadAddToBookHint => 'Rechercher dans cette bibliothèque';

  @override
  String get adminUploadNoBooksFound => 'Aucun livre trouvé';

  @override
  String adminUploadAddingTo(String title) {
    return 'Ajout de fichiers à « $title »';
  }

  @override
  String adminUploadAddedTo(String title) {
    return 'Fichiers ajoutés à « $title »';
  }

  @override
  String get adminUploadTargetNoFolder =>
      'Dossier de ce livre introuvable sur le serveur.';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return 'Le serveur placerait ces fichiers dans « $preview », et non dans le dossier du livre « $folder ». Rien n\'a été téléversé.';
  }

  @override
  String get adminUploadUploading => 'Envoi...';

  @override
  String adminUploadProgress(int percent) {
    return 'Téléversement $percent %';
  }

  @override
  String get adminUploadButton => 'Téléverser';

  @override
  String adminUploadComplete(String title) {
    return 'Envoyé \"$title\"';
  }

  @override
  String get adminUploadFailed => 'Échec de l’envoi';

  @override
  String adminUploadFailedReason(String error) {
    return 'Échec du téléversement : $error';
  }

  @override
  String get adminUploadReselectFiles =>
      'Choisissez à nouveau les fichiers avant de réessayer.';

  @override
  String get adminServerSettings => 'Paramètres du serveur';

  @override
  String get adminServerSettingsSubtitle => 'Analyse, stockage et tri';

  @override
  String get adminAuthentication => 'Authentification';

  @override
  String get adminAuthenticationSubtitle =>
      'Connexion par mot de passe et OpenID Connect';

  @override
  String get adminStats => 'Statistiques';

  @override
  String get adminStatsSubtitle => 'Totaux de la bibliothèque et de l\'écoute';

  @override
  String get adminAllSessions => 'Toutes les sessions';

  @override
  String get adminAllSessionsSubtitle =>
      'Afficher et gérer toutes les sessions d\'écoute';

  @override
  String get adminSessionsAllUsers => 'Tous les utilisateurs';

  @override
  String get adminSessionsEmpty => 'Aucune session';

  @override
  String get statsLibraryTotals => 'Totaux de la bibliothèque';

  @override
  String get statsTotalItems => 'Éléments';

  @override
  String get statsAudioFiles => 'Fichiers audio';

  @override
  String get statsTotalSize => 'Taille totale';

  @override
  String get statsBooks => 'Livres';

  @override
  String get statsPodcasts => 'Podcasts';

  @override
  String get statsBooksSize => 'Taille des livres';

  @override
  String get statsYearReview => 'Bilan de l\'année';

  @override
  String get statsNoYearData => 'Aucune donnée pour cette année';

  @override
  String get statsListeningTime => 'Temps d\'écoute';

  @override
  String get statsSessions => 'Sessions';

  @override
  String get statsBooksAdded => 'Livres ajoutés';

  @override
  String get statsAuthorsAdded => 'Auteurs ajoutés';

  @override
  String get statsTopAuthors => 'Meilleurs auteurs';

  @override
  String get statsTopNarrators => 'Les meilleurs narrateurs';

  @override
  String get statsTopGenres => 'Genres Principaux';

  @override
  String get srvScannerSection => 'Scanneur';

  @override
  String get srvFindCovers => 'Trouver des couvertures';

  @override
  String get srvCoverProvider => 'Fournisseur de couverture';

  @override
  String get srvParseSubtitles => 'Extraire les sous-titres du nom de fichier';

  @override
  String get srvPreferMatched => 'Privilégier les métadonnées associées';

  @override
  String get srvDisableWatcher => 'Désactiver la surveillance des dossiers';

  @override
  String get srvStorageSection => 'Stockage';

  @override
  String get srvStoreCover => 'Stocker la couverture avec l\'élément';

  @override
  String get srvStoreMetadata => 'Stocker les métadonnées avec l\'élément';

  @override
  String get srvMetadataFormat => 'Format de fichier de métadonnées';

  @override
  String get srvFormatSection => 'Affichage et format';

  @override
  String get srvDateFormat => 'Format de date';

  @override
  String get srvTimeFormat => 'Format de l\'heure';

  @override
  String get srvLanguage => 'Langage du serveur';

  @override
  String get srvChromecast => 'Support Chromecast';

  @override
  String get srvAllowIframe => 'Autoriser l\'intégration par iframe';

  @override
  String get srvSortingSection => 'Tri';

  @override
  String get srvIgnorePrefixes => 'Ignorer les préfixes lors du tri';

  @override
  String get srvSortingPrefixes => 'Préfixes de tri';

  @override
  String get srvAddPrefix => 'Ajouter un préfixe';

  @override
  String get srvSave => 'Enregistrer les paramètres';

  @override
  String get srvSavePrefixes => 'Enregistrer les préfixes';

  @override
  String get srvSaved => 'Paramètres sauvegardés';

  @override
  String get srvSaveFailed => 'Impossible d\'enregistrer les paramètres';

  @override
  String get srvPrefixesSaved => 'Préfixes de tri mis à jour';

  @override
  String get authSetLoadFailed =>
      'Impossible de charger les paramètres d\'authentification';

  @override
  String get authSetCustomMessage => 'Message personnalisé à la connexion';

  @override
  String get authSetMessage => 'Message';

  @override
  String get authSetPasswordAuth => 'Authentification par mot de passe';

  @override
  String get authSetOpenId => 'Authentification OpenID Connect';

  @override
  String get authSetGuide => 'Guide de configuration';

  @override
  String get authSetIssuerUrl => 'URL de l\'émetteur';

  @override
  String get authSetAutoPopulate => 'Remplir automatiquement';

  @override
  String get authSetAuthorizeUrl => 'URL d\'autorisation';

  @override
  String get authSetTokenUrl => 'URL du jeton';

  @override
  String get authSetUserinfoUrl => 'URL Userinfo';

  @override
  String get authSetJwksUrl => 'URL JWKS';

  @override
  String get authSetLogoutUrl => 'URL de déconnexion';

  @override
  String get authSetClientId => 'ID client';

  @override
  String get authSetClientSecret => 'Secret client';

  @override
  String get authSetSigningAlgorithm => 'Algorithme de signature';

  @override
  String get authSetRedirectUris => 'URI de redirection mobiles autorisées';

  @override
  String get authSetRedirectUrisInfo =>
      'Les applications ne peuvent revenir qu\'à ces adresses après la connexion. Absorb utilise absorb://oauth. Un astérisque (*) comme seule entrée autorise toute adresse.';

  @override
  String get authSetAddRedirectUri => 'Ajouter une URI';

  @override
  String get authSetAddAbsorbRedirect => 'Ajouter absorb://oauth';

  @override
  String get authSetSubfolder => 'Sous-dossier pour les URL de redirection';

  @override
  String get authSetSubfolderNone => 'Aucun';

  @override
  String get authSetWebRedirectInfo =>
      'Autorisez ces URL dans votre fournisseur OAuth pour que la connexion puisse revenir à l\'application web :';

  @override
  String get authSetButtonText => 'Texte du bouton';

  @override
  String get authSetMatchExisting => 'Associer les utilisateurs existants par';

  @override
  String get authSetMatchNone => 'Ne pas associer';

  @override
  String get authSetMatchEmail => 'E-mail';

  @override
  String get authSetMatchUsername => 'Utilisateur';

  @override
  String get authSetMatchExistingInfo =>
      'Sert à lier les utilisateurs existants. Une fois liés, les utilisateurs sont associés par leur identifiant unique chez le fournisseur.';

  @override
  String get authSetAutoLaunch => 'Lancement automatique';

  @override
  String get authSetAutoLaunchInfo =>
      'Ouvre automatiquement le fournisseur depuis la page de connexion web. /login?autoLaunch=0 l\'ignore.';

  @override
  String get authSetAutoRegister => 'Inscription automatique';

  @override
  String get authSetAutoRegisterInfo =>
      'Créer automatiquement les nouveaux utilisateurs après leur connexion';

  @override
  String get authSetClaimsInfo =>
      'Laissez ces champs vides pour désactiver l\'attribution des groupes et permissions. Les nouveaux utilisateurs reçoivent alors le rôle Utilisateur.';

  @override
  String get authSetGroupClaim => 'Claim de groupe';

  @override
  String get authSetGroupClaimInfo =>
      'Claim qui liste les groupes de l\'utilisateur, généralement groups. Les groupes nommés admin, user ou guest définissent le rôle, et le plus élevé l\'emporte. Si aucun groupe ne correspond, la connexion est refusée.';

  @override
  String get authSetPermsClaim => 'Claim de permissions avancées';

  @override
  String get authSetPermsClaimInfo =>
      'Claim contenant les permissions des utilisateurs non admin. Si le claim est absent, la connexion est refusée, et une option manquante compte comme désactivée. Format attendu :';

  @override
  String get authSetRestartNote =>
      'Redémarrez le serveur après l\'enregistrement pour appliquer les changements OpenID Connect.';

  @override
  String get authSetNoChanges => 'Aucune modification à enregistrer';

  @override
  String get authSetNeedOneMethod =>
      'Activez au moins une méthode de connexion';

  @override
  String authSetFieldRequired(String field) {
    return '$field est obligatoire';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return 'URI de redirection non valide : $uri';
  }

  @override
  String get authSetAsteriskAlone =>
      'Un astérisque (*) doit être la seule URI de redirection';

  @override
  String authSetInvalidClaim(String field) {
    return '$field n\'est pas un nom de claim valide';
  }

  @override
  String authSetIssuerFailed(String error) {
    return 'Impossible de lire l\'émetteur : $error';
  }

  @override
  String get libNoneYet => 'Pas encore de bibliothèques';

  @override
  String get libReorderFailed => 'Impossible d\'enregistrer le nouvel ordre';

  @override
  String get libDeleteTitle => 'Supprimer la bibliothèque ?';

  @override
  String get libDeleteBody =>
      'Cela supprime définitivement la bibliothèque et tous ses éléments du serveur.';

  @override
  String get libDeleted => 'Bibliothèque supprimée';

  @override
  String get libDeleteFailed => 'Impossible d\'effacer la bibliothèque';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dossiers',
      one: '1 dossier',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => 'Nouvelle bibliothèque';

  @override
  String get libEditTitle => 'Modifier la bibliothèque';

  @override
  String get libName => 'Nom de la bibliothèque';

  @override
  String get libMediaType => 'Type de média';

  @override
  String get libMediaBook => 'Livres audio';

  @override
  String get libMediaPodcast => 'Podcasts';

  @override
  String get libProvider => 'Fournisseur de métadonnées';

  @override
  String get libIcon => 'Icône';

  @override
  String get libFolders => 'Dossiers';

  @override
  String get libAddFolder => 'Ajouter un dossier';

  @override
  String get libNoFolders => 'Ajoutez au moins un dossier';

  @override
  String get libAdvanced => 'Paramètres avancés';

  @override
  String get libCoverShape => 'Forme de couverture';

  @override
  String get libCoverSquare => 'Carré';

  @override
  String get libCoverStandard => 'Standard';

  @override
  String get libDisableWatcher => 'Désactiver la surveillance des dossiers';

  @override
  String get libSkipAsin => 'Ne pas associer les livres ayant un ASIN';

  @override
  String get libSkipIsbn => 'Ne pas associer les livres ayant un ISBN';

  @override
  String get libHideSingleSeries => 'Masquer les séries d\'un seul livre';

  @override
  String get libAudiobooksOnly => 'Livres audio uniquement';

  @override
  String get libEpubScripted => 'Autoriser le contenu ePub avec scripts';

  @override
  String get libLaterBooksOnly =>
      'Afficher seulement les livres suivants dans Continuer la série';

  @override
  String get libPodcastRegion => 'Région de recherche de podcasts';

  @override
  String get libMarkPercent => 'Fini à % d\'avancement';

  @override
  String get libMarkTime => 'Fini avec ce nombre de secondes restantes';

  @override
  String get libAutoScan => 'Planification d\'analyse auto (cron)';

  @override
  String get libCreate => 'Créer une bibliothèque';

  @override
  String get libUpdate => 'Enregistrer les modifications';

  @override
  String get libNameRequired => 'Saisissez un nom de bibliothèque';

  @override
  String get libCreated => 'Bibliothèque créée';

  @override
  String get libCreateFailed => 'Impossible de créer la bibliothèque';

  @override
  String get libUpdated => 'Bibliothèque mise à jour';

  @override
  String get libUpdateFailed => 'Impossible de mettre à jour la bibliothèque';

  @override
  String get libRemoveFoldersTitle => 'Supprimer les dossiers ?';

  @override
  String get libRemoveFoldersBody =>
      'La suppression d\'un dossier supprime ses éléments de la bibliothèque. Cette action est irréversible.';

  @override
  String get readEbook => 'Lu';

  @override
  String get ebookDownload => 'Télécharger';

  @override
  String get ebookDownloaded => 'Téléchargé';

  @override
  String get ebookSavedOffline => 'Enregistré pour la lecture hors ligne';

  @override
  String get ebookRemovedOffline => 'Retiré du hors ligne';

  @override
  String get ebookOfflineFailed => 'Impossible de télécharger l\'ebook';

  @override
  String get ebookSaveToDevice => 'Enregistrer sur l’appareil';

  @override
  String get ebookSaveToDeviceTitle => 'Enregistrer sur l\'appareil ?';

  @override
  String get ebookSaveToDeviceBody =>
      'Cela enregistre une copie du fichier ebook quelque part sur votre appareil (vous choisissez où). Il ne rendra pas le livre disponible hors ligne dans le lecteur - utilisez Download pour cela.';

  @override
  String get readerFormatUnsupported =>
      'Ce format d\'ebook ne peut pas encore être ouvert dans le lecteur';

  @override
  String get readerCouldNotOpen =>
      'Impossible d\'ouvrir cet ebook. Le fichier est peut-être endommagé.';

  @override
  String get moreActions => 'Plus';

  @override
  String get readerChapters => 'Chapitres';

  @override
  String get readerSettings => 'Paramètres du lecteur';

  @override
  String get readerFontSize => 'Taille de la police';

  @override
  String get readerLineSpacing => 'Interligne';

  @override
  String get readerTextAlignment => 'Alignement';

  @override
  String get readerAlignJustified => 'Justifié';

  @override
  String get readerAlignLeft => 'À gauche';

  @override
  String get readerSideMargins => 'Marges latérales';

  @override
  String get readerTopBottom => 'Haut et bas';

  @override
  String get readerPageLayout => 'Mise en page';

  @override
  String get readerPinTopBar =>
      'Garder le titre et la barre de progression à l\'écran';

  @override
  String get readerPinTopBarHint =>
      'Les épingle au-dessus de la page au lieu de les afficher d\'un toucher. La page est un peu plus courte pour qu\'aucun texte ne soit masqué.';

  @override
  String get readerTopBarProgress => 'Progression de la barre du haut';

  @override
  String get readerTopBarProgressBook => 'Livre';

  @override
  String get readerTopBarProgressChapter => 'Chapitre';

  @override
  String get readerTopBarProgressBoth => 'Les deux';

  @override
  String get readerSectionText => 'Texte';

  @override
  String get readerSectionPage => 'Page';

  @override
  String get readerSectionTopBar => 'Barre du haut et écran';

  @override
  String get readerSectionControls => 'Commandes';

  @override
  String get readerSectionStats => 'Stats';

  @override
  String get readerParagraphSpacing => 'Espacement des paragraphes';

  @override
  String get readerParagraphSpacingBook => 'Celui du livre';

  @override
  String get readerTapZones => 'Zones tactiles';

  @override
  String get readerTapZonesHint =>
      'Faites glisser les lignes pour redimensionner les carrés. Touchez un carré pour changer son action, ou partez d\'une disposition.';

  @override
  String get readerTapPrev => 'Page précédente';

  @override
  String get readerTapNext => 'Page suivante';

  @override
  String get readerTapMenu => 'Afficher les commandes';

  @override
  String get readerTapNothing => 'Rien';

  @override
  String get readerTapKeepMenu => 'Un carré doit afficher les commandes';

  @override
  String get readerHideControls => 'Masquer les commandes après';

  @override
  String get readerHideControlsNever => 'Jamais';

  @override
  String get readerBarNotes => 'Notes et surlignages';

  @override
  String readerHideControlsAfter(int seconds) {
    return '$seconds s';
  }

  @override
  String get playerDownloadStreamingInstead =>
      'Ce téléchargement n\'a pas pu être lu, la lecture se fait donc en streaming depuis le serveur. Le télécharger à nouveau peut résoudre le problème.';

  @override
  String get readerPageTurn => 'Tourner la page';

  @override
  String get readerPageTurnNone => 'Aucun';

  @override
  String get readerPageTurnSlide => 'Glissement';

  @override
  String get readerPageTurnCurl => 'Page cornée';

  @override
  String get readerPageTurnRipple => 'Ondulation';

  @override
  String get readerScrollMode => 'Mode défilement';

  @override
  String get readerScrollModeHint =>
      'Faire défiler le livre vers le bas au lieu de tourner les pages. S\'applique à tous les livres.';

  @override
  String get readerKeepAwake => 'Garder l\'écran allumé';

  @override
  String get readerKeepAwakeHint =>
      'Empêche l\'écran de s\'éteindre pendant que vous lisez à votre rythme. Le défilement auto et la lecture suivie le gardent toujours allumé.';

  @override
  String get readerLayoutAuto => 'Auto';

  @override
  String get readerLayoutSingle => 'Simple';

  @override
  String get readerLayoutTwoPage => 'Double page';

  @override
  String get readerTheme => 'Thème';

  @override
  String get readerFont => 'Police';

  @override
  String get readerVolumeNav => 'Les boutons de volume tournent les pages';

  @override
  String get readerVolumeNavOff => 'Désactivé';

  @override
  String get readerVolumeNavNormal => 'Normal';

  @override
  String get readerVolumeNavMirrored => 'Inversé';

  @override
  String get readerAutoScroll => 'Défilement auto';

  @override
  String get readerAutoScrollSubtitle =>
      'La page suivante se dessine sur celle-ci de haut en bas - faites glisser le milieu de l\'écran pour changer la vitesse, touchez pour arrêter';

  @override
  String get readerAutoScrollStarted => 'Défilement auto démarré';

  @override
  String get readerAutoScrollPaused =>
      'En pause - maintenez appuyé pour arrêter';

  @override
  String get readerAutoScrollResumed => 'Défilement auto repris';

  @override
  String get readerAutoScrollStopped => 'Défilement auto désactivé';

  @override
  String get readerAutoScrollEndOfBook =>
      'Fin du livre - défilement auto désactivé';

  @override
  String readerAutoScrollSpeed(int percent) {
    return 'Vitesse $percent %';
  }

  @override
  String get readerMoreControls => 'Plus de commandes';

  @override
  String get readerAutoScrollSleep => 'Minuteur de veille du défilement auto';

  @override
  String get readerAutoScrollSleepHint =>
      'Arrête le défilement après un moment et laisse l\'écran s\'éteindre.';

  @override
  String readerAutoScrollSleepMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String readerAutoScrollSleepLeft(int minutes) {
    return '$minutes min restantes';
  }

  @override
  String readerAutoScrollSleepIn(int minutes) {
    return 'Le défilement auto s\'arrête dans $minutes min';
  }

  @override
  String get readerAutoScrollSleepOff =>
      'Minuteur de veille du défilement auto désactivé';

  @override
  String get readerAutoScrollSleepEnded =>
      'Minuteur de veille - défilement auto désactivé';

  @override
  String get readerDownloadStarted => 'Téléchargement démarré';

  @override
  String get detailChaptersJumpTitle => 'Aller à ce chapitre ?';

  @override
  String detailChaptersJumpContent(String title) {
    return 'La lecture passe à « $title ».';
  }

  @override
  String get detailChaptersJump => 'Aller';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapitres finis',
      one: '1 chapitre fini',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autres auditeurs',
      one: '1 autre auditeur',
      zero: 'Aucun autre auditeur',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => 'À suivre';

  @override
  String get seriesJumpToUpNext => 'Aller au suivant';

  @override
  String get seriesStatsFinished => 'Fini';

  @override
  String get seriesStatsListened => 'Écouté';

  @override
  String get seriesStatsLeft => 'Restant';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done sur $total';
  }

  @override
  String get detailSessionsNone => 'Aucune session d\'écoute pour l\'instant';

  @override
  String detailSessionsAll(int count) {
    return 'Les $count sessions';
  }

  @override
  String get readerVolumeNavWhilePlaying =>
      'Même lorsque l\'audio est en cours de lecture';

  @override
  String get readerTranslateWith => 'Traduire avec';

  @override
  String get readerTranslateApp => 'Application sur cet appareil';

  @override
  String get readerTranslateApple => 'Intégré à iOS';

  @override
  String get readerTranslateWeb => 'S\'ouvre dans votre navigateur';

  @override
  String get readerTranslateHint =>
      'Le texte sélectionné est envoyé au traducteur que vous choisissez.';

  @override
  String get readerMoreFonts => 'Télécharger plus de polices';

  @override
  String get readerFontRemove => 'Retirer le téléchargement';

  @override
  String readerFontDownloadFailed(String font) {
    return 'Échec du téléchargement de $font';
  }

  @override
  String get readerAnnotations => 'Notes';

  @override
  String readerHighlights(int count) {
    return 'Surlignages ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return 'Signets ($count)';
  }

  @override
  String get readerNoHighlights => 'Aucun surlignage pour l\'instant';

  @override
  String get readerHistory => 'Historique';

  @override
  String get sessionReading => 'Lecture';

  @override
  String get readerHistoryEmpty =>
      'Les pages que vous quittez sont listées ici, pour pouvoir toujours y revenir.';

  @override
  String get readerHistoryClosed => 'Livre fermé';

  @override
  String get readerHistoryBeforeJump => 'Avant un saut';

  @override
  String get readerHistoryBeforeSync =>
      'Avant la synchronisation avec l\'audio';

  @override
  String get readerLogReading => 'Compter le temps de lecture dans les stats';

  @override
  String get readerLogReadingHint =>
      'Enregistre votre temps dans le lecteur comme une session pour qu\'il apparaisse dans vos stats. Sur Audiobookshelf, il compte comme temps d\'écoute.';

  @override
  String get readerNoBookmarks => 'Aucun signet pour l\'instant';

  @override
  String get readerBookmarkDefault => 'Signet';

  @override
  String get readerNoteTitle => 'Note';

  @override
  String get readerNoteHint => 'Ajouter une note...';

  @override
  String get backupAndSync => 'Sauvegarde et synchronisation';

  @override
  String get backupAndSyncSubtitle =>
      'Enregistrez un fichier de sauvegarde ou gardez vos paramètres synchronisés entre appareils';

  @override
  String get syncSettingsExperimental => 'Expérimental';

  @override
  String get syncSettingsExperimentalBody =>
      'La synchronisation est nouvelle et est toujours en cours de développement. Si deux appareils changent les choses pendant qu\'ils sont séparés, un côté peut perdre ses changements. Conservez un fichier de sauvegarde comme une copie sécurisée.';

  @override
  String get syncSettingsNeedServer => 'Besoin d\'un serveur ?';

  @override
  String get syncSettingsNeedServerSub =>
      'N\'importe quel serveur WebDAV fonctionne. Nextcloud est un serveur gratuit auto-hébergé.';

  @override
  String get syncSettingsConnection => 'Connexion';

  @override
  String get syncSettingsConnectionNotSet => 'Pas encore configurée';

  @override
  String get syncSettingsBackupFile => 'Fichier de sauvegarde';

  @override
  String get syncSettingsBackupFilePlain =>
      'Enregistre tout dans un fichier que vous conservez.';

  @override
  String get syncSettingsBackupFileWithSync =>
      'Enregistre tout dans un fichier que vous conservez. Incluez les infos de connexion : le restaurer sur un autre téléphone y active aussi la synchronisation.';

  @override
  String get syncSettingsStatusOff => 'Pas de synchronisation';

  @override
  String get syncSettingsStatusProblem => 'Impossible de joindre votre serveur';

  @override
  String get syncSettings => 'Synchroniser les paramètres entre appareils';

  @override
  String get syncSettingsExtras => 'Synchroniser aussi';

  @override
  String get syncSettingsIncludeRmab => 'Paramètres ReadMeABook';

  @override
  String get syncSettingsIncludeRmabSub =>
      'Place votre jeton API ReadMeABook dans le fichier synchronisé';

  @override
  String get syncSettingsSubtitle =>
      'Gardez vos paramètres synchronisés via votre propre serveur WebDAV';

  @override
  String get syncSettingsEnable => 'Synchroniser les paramètres';

  @override
  String get syncSettingsServerUrl => 'URL du dossier WebDAV';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => 'Utilisateur';

  @override
  String get syncSettingsPassword => 'Mot de passe';

  @override
  String get syncSettingsHeaders => 'En-têtes personnalisés (facultatif)';

  @override
  String get syncSettingsHeadersHint =>
      'Un par ligne, comme CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => 'Tester la connexion';

  @override
  String get syncSettingsHoldToUpload => 'Maintenir pour téléverser maintenant';

  @override
  String get syncSettingsUploadNow => 'Téléverser maintenant';

  @override
  String get syncSettingsDownloadNow => 'Télécharger maintenant';

  @override
  String get syncSettingsOk => 'Connecté';

  @override
  String get syncSettingsNoRemote =>
      'Connecté - rien de synchronisé pour l\'instant';

  @override
  String get syncSettingsAuthFailed => 'Utilisateur ou mot de passe incorrect';

  @override
  String get syncSettingsNetworkError => 'Impossible de joindre cette adresse';

  @override
  String get syncSettingsNotConfigured =>
      'Renseignez d\'abord l\'adresse, l\'utilisateur et le mot de passe';

  @override
  String get syncSettingsTooLarge =>
      'Vos paramètres sont trop volumineux pour être synchronisés';

  @override
  String get syncSettingsUploaded => 'Paramètres téléversés';

  @override
  String get syncSettingsApplied =>
      'Paramètres mis à jour depuis votre autre appareil';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paramètres mis à jour depuis votre autre appareil',
      one: '1 paramètre mis à jour depuis votre autre appareil',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => 'Déjà à jour';

  @override
  String syncSettingsLastSynced(String when) {
    return 'Dernière synchronisation $when';
  }

  @override
  String get syncSettingsNever => 'Pas encore synchronisé';

  @override
  String navHoldPickTitle(String tab) {
    return 'Maintenir $tab va...';
  }

  @override
  String get navHoldPickBody =>
      'Choisissez ce que fait un appui long sur cet onglet. Vous pourrez le changer plus tard dans les Paramètres.';

  @override
  String get navHoldSettingTitle => 'Raccourcis d\'appui long sur les onglets';

  @override
  String get navHoldSettingSubtitle =>
      'Ce que fait l\'appui long sur chaque onglet';

  @override
  String get navHoldAskNextTime => 'Demander la prochaine fois';

  @override
  String get navHoldNothing => 'Rien';

  @override
  String get navHoldPlayPause => 'Lecture / pause';

  @override
  String get navHoldOfflineMode => 'Mode hors ligne';

  @override
  String get navHoldOfflineOn => 'Mode hors ligne activé';

  @override
  String get navHoldOfflineOff => 'Mode hors ligne désactivé';

  @override
  String get navHoldMenu => 'Toujours afficher le menu';

  @override
  String get navHoldStop => 'Arrêter la lecture';

  @override
  String get navHoldRmabSearch => 'Recherche ReadMeABook';

  @override
  String get navHoldRmabRequests => 'Mes demandes de livres';

  @override
  String get navHoldRmabWeb => 'Site ReadMeABook';

  @override
  String get navHoldAdd => 'Ajouter';

  @override
  String get navHoldMoveLeft => 'Déplacer à gauche';

  @override
  String get navHoldMoveRight => 'Déplacer à droite';

  @override
  String get navHoldRemoveFromMenu => 'Retirer du menu';

  @override
  String get navHoldEditHint =>
      'Maintenez un élément pour le déplacer ou le retirer';

  @override
  String get navHoldResetMenu =>
      'Réinitialiser les éléments du menu d\'appui long';

  @override
  String get navHoldMenuReset => 'Éléments du menu réinitialisés';

  @override
  String get bookStatsAction => 'Stats d\'écoute';

  @override
  String get bookStatsYou => 'Vous';

  @override
  String get bookStatsEveryone => 'Tout le monde';

  @override
  String get bookStatsListened => 'Temps écouté';

  @override
  String get bookStatsSessions => 'Sessions';

  @override
  String get bookStatsFirst => 'Première écoute';

  @override
  String get bookStatsLast => 'Dernière écoute';

  @override
  String get bookStatsListeners => 'Personnes l\'ayant commencé';

  @override
  String get bookStatsFinishedCount => 'Personnes l\'ayant fini';

  @override
  String get bookStatsTotalTime => 'Temps écouté par tout le monde';

  @override
  String get bookStatsNobody => 'Personne ne l\'a encore commencé';

  @override
  String get bookStatsScanning =>
      'Analyse des sessions, cela peut prendre un moment...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return 'Analyse des sessions, $done personnes sur $total...';
  }

  @override
  String bookStatsLastChecked(String when) {
    return 'Vérifié $when';
  }

  @override
  String get activityYourReading => 'Votre lecture';

  @override
  String get activityYourListening => 'Votre écoute';

  @override
  String activityLastRead(String when) {
    return 'Dernière lecture $when';
  }

  @override
  String activityLastListened(String when) {
    return 'Dernière écoute $when';
  }

  @override
  String get activityNotStarted => 'Pas commencé';

  @override
  String get activityNoReading => 'Aucune session de lecture pour l\'instant';

  @override
  String get activityTime => 'Temps';

  @override
  String get activityAverage => 'Moy.';

  @override
  String get activityProgress => 'Progression';

  @override
  String activityReached(String percent) {
    return '$percent atteint';
  }

  @override
  String get readingLogTitle => 'Journal de lecture';

  @override
  String get readingLogTotalTime => 'Temps total';

  @override
  String get readingLogAverageSession => 'Session moyenne';

  @override
  String get readingLogActiveDays => 'Jours actifs';

  @override
  String readingLogActiveDaysOf(int active, int total) {
    return '$active sur $total';
  }

  @override
  String get readingLogPace => 'Rythme';

  @override
  String readingLogPacePerHour(String percent) {
    return '$percent %/h';
  }

  @override
  String get readingLogLastRead => 'Dernière lecture';

  @override
  String get readingLogStarted => 'Commencé';

  @override
  String get readingLogFinished => 'Fini';

  @override
  String get readingLogNotSet => 'Non défini';

  @override
  String readingLogLeftMinutes(int m) {
    return 'Environ $m min pour finir';
  }

  @override
  String readingLogLeftHours(int h) {
    return 'Environ $h h pour finir';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return 'Environ $h h $m min pour finir';
  }

  @override
  String get readingLogLeftMax => 'Plus de 99 h pour finir';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return 'En hausse de $percent % sur la semaine précédente';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return 'En baisse de $percent % sur la semaine précédente';
  }

  @override
  String get readingLogNewThisWeek => 'Nouveau cette semaine';

  @override
  String get readingLogSameAsLastWeek => 'Identique à la semaine précédente';

  @override
  String get readingLogQuietTwoWeeks => 'Rien ces deux dernières semaines';

  @override
  String get readingLogWhereYouRead => 'Où vous l\'avez lu';

  @override
  String get readingLogSourceIos => 'Application iOS';

  @override
  String get readingLogSourceAndroid => 'Application Android';

  @override
  String get readingLogChartTitle => 'Progression dans le temps';

  @override
  String get readingLogChartPosition => 'Position atteinte';

  @override
  String get readingLogChartMinutes => 'Minutes';

  @override
  String get readingLogRecords => 'Records';

  @override
  String get readingLogLongestSession => 'Plus longue session';

  @override
  String get readingLogBestDay => 'Meilleur jour';

  @override
  String get readingLogLongestStreak => 'Plus longue série';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours',
      one: '1 jour',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => 'Retours en arrière';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fois',
      one: '1 fois',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => 'Première ouverture';

  @override
  String get readingLogAttempts => 'Tentatives';

  @override
  String readingLogAttempt(int index) {
    return 'Tentative $index';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return 'La tentative $index a commencé';
  }

  @override
  String get readingLogOutcomeCompleted => 'Terminé';

  @override
  String get readingLogOutcomeSkimmed => 'Parcouru';

  @override
  String get readingLogOutcomeAbandoned => 'Abandonné';

  @override
  String get readingLogOutcomeInProgress => 'En cours';

  @override
  String readingLogSpanRange(String from, String to) {
    return '$from à $to';
  }

  @override
  String readingLogSpanSince(String from) {
    return 'Depuis $from';
  }

  @override
  String readingLogSpanEnded(String to) {
    return 'Terminé $to';
  }

  @override
  String get readingLogSpanUnknown => 'Aucune date enregistrée';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sessions',
      one: '1 session',
    );
    return '$_temp0';
  }

  @override
  String readingLogShowing(int shown, int total) {
    return '$shown sur $total';
  }

  @override
  String readingLogGapDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours sans lecture',
      one: '1 jour sans lecture',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => 'Aucune session enregistrée pour l\'instant';

  @override
  String get readingLogEmptyHint =>
      'Les sessions apparaissent ici au fil de vos lectures ou écoutes, depuis toute application ou tout appareil synchronisé avec BookOrbit.';

  @override
  String get readingLogNoMatches => 'Aucune session sur cette période';

  @override
  String get readingLogAllTime => 'Depuis toujours';

  @override
  String get readingLogLast30 => '30 derniers jours';

  @override
  String get readingLogLast90 => '90 derniers jours';

  @override
  String get readingLogThisYear => 'Cette année';

  @override
  String get readingLogAllFormats => 'Tous les formats';

  @override
  String get readingLogSortBy => 'Trier par';

  @override
  String get readingLogSortDay => 'Jour';

  @override
  String get readingLogSortLength => 'Durée';

  @override
  String get readingLogSortChange => 'Variation';

  @override
  String get readingLogSortReached => 'Atteint';

  @override
  String get readingLogNewestFirst => 'Plus récents d\'abord';

  @override
  String get readingLogOldestFirst => 'Plus anciens d\'abord';

  @override
  String get readingLogMostFirst => 'Plus élevés d\'abord';

  @override
  String get readingLogLeastFirst => 'Moins élevés d\'abord';

  @override
  String get readingLogDeleteTitle => 'Effacer cette session ?';

  @override
  String get readingLogDeleteBody =>
      'Elle sera retirée du journal de lecture du livre et de vos stats sur BookOrbit.';

  @override
  String get readingLogDeleteFailed => 'Impossible d\'effacer la session';

  @override
  String get readingLogLoadFailed =>
      'Impossible de charger le journal de lecture';

  @override
  String get navHoldServerScan => 'Analyse du serveur';

  @override
  String get navHoldScanAll => 'Analyser toutes les bibliothèques';

  @override
  String navHoldScanLibrary(String name) {
    return 'Analyser $name';
  }

  @override
  String get navHoldScanStarted => 'Analyse démarrée';

  @override
  String get navHoldScanFailed => 'Impossible de lancer l\'analyse';

  @override
  String get navHoldAdminLogs => 'Journaux du serveur';

  @override
  String navHoldAdminPage(String page) {
    return 'Admin : $page';
  }

  @override
  String get navHoldNothingPlaying => 'Rien à lire pour l\'instant';

  @override
  String get navHoldReadBook => 'Lire le livre en cours';

  @override
  String get navHoldBookDetails => 'Détails du livre en cours';

  @override
  String get syncSourceTitle =>
      'Quelle copie la synchronisation doit-elle garder ?';

  @override
  String get syncSourceBody =>
      'Cette sauvegarde a activé la synchronisation des paramètres. Utiliser la dernière synchronisation du serveur, ou faire de cette sauvegarde la source de vérité ? Choisir la sauvegarde remplace la copie sur le serveur pour tous vos périphériques synchronisés.';

  @override
  String get syncSourceUseServer => 'Dernière synchro du serveur';

  @override
  String get syncSourceUseBackup => 'Cette sauvegarde';

  @override
  String get syncSettingsWhatTravels =>
      'Vos préférences, vitesses par livre, disposition de l\'accueil, ordre de Lecture, notes et surlignages d\'ebooks sont synchronisés. Les identifiants, dossiers de téléchargement, options de téléchargement auto, apparence du lecteur et tout ce qui n\'a pas encore été envoyé à votre serveur restent sur cet appareil.';

  @override
  String get syncSettingsDownloadWarnTitle =>
      'Remplacer les paramètres de cet appareil ?';

  @override
  String get syncSettingsDownloadWarnBody =>
      'La copie synchronisée écrasera les paramètres de cet appareil.';

  @override
  String get syncSettingsDownloadWarnConfirm => 'Remplacer';

  @override
  String get readerCopied => 'Copié dans le presse-papiers';

  @override
  String get dictionaryNotFound => 'Aucune définition trouvée pour ce mot.';

  @override
  String get dictionaryError =>
      'Impossible de joindre le dictionnaire. Vérifiez votre connexion.';

  @override
  String get dictionaryRetry => 'Réessayer';

  @override
  String get dictionarySearchWeb => 'Rechercher sur le web';

  @override
  String get readerTooltipCopy => 'Copier';

  @override
  String get readerTooltipSearch => 'Rechercher';

  @override
  String get readerTooltipDefine => 'Définir';

  @override
  String get readerTooltipTranslate => 'Traduire';

  @override
  String get readerSearchHint => 'Rechercher dans ce livre…';

  @override
  String readerSearchMatches(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count résultats pour « $query »',
      one: '$count résultat pour « $query »',
    );
    return '$_temp0';
  }

  @override
  String get readerSearchEmpty =>
      'Entrez un mot ou une phrase puis recherchez.';

  @override
  String readerSearchNoResults(String query) {
    return 'Aucun résultat pour « $query ».';
  }

  @override
  String get transcriptionTitle => 'Transcription';

  @override
  String get transcriptionAdvancedSubtitle =>
      'Pour transcrire les signets et retrouver votre position entre livre audio et ebook';

  @override
  String get transcriptionEnable => 'Activer la transcription';

  @override
  String get transcriptionEnableSubtitle =>
      'Ajoute Transcrire aux signets, Trouver la position dans l\'ebook au lecteur audio, et Trouver dans le livre audio au lecteur d\'ebook';

  @override
  String get transcriptionDisclaimer =>
      'Fonctionne entièrement sur votre appareil, rien n\'est envoyé nulle part. Cela utilise de la batterie supplémentaire et de la puissance de calcul pendant que cela fonctionne, et seuls les livres téléchargés peuvent être transcrits.';

  @override
  String get transcriptionNeedModelHint =>
      'Téléchargez un modèle ci-dessous pour commencer à transcrire.';

  @override
  String get transcriptionModelSection => 'Modèles';

  @override
  String get transcriptionModelTiny => 'Minuscule';

  @override
  String get transcriptionModelTinyDesc =>
      'Le plus rapide, moins précis. Environ 31 Mo.';

  @override
  String get transcriptionModelBase => 'Base';

  @override
  String get transcriptionModelBaseDesc => 'Un bon compromis. Environ 57 Mo.';

  @override
  String get transcriptionModelSmall => 'Petit';

  @override
  String get transcriptionModelSmallDesc =>
      'Plus lent mais le plus précis - idéal sur un téléphone haut de gamme. Environ 182 Mo.';

  @override
  String get transcriptionAutoHint =>
      'Avec plus d\'un téléchargement, chaque tâche choisit entre eux. Les livres avec un ebook sont les plus rapides, car les mots exacts viennent de toute façon de l\'ebook. Les signets sur les livres sans ebook ont le plus précis possible.';

  @override
  String get transcriptionDownload => 'Télécharger';

  @override
  String get transcriptionDownloadFailed =>
      'Échec du téléchargement. Vérifiez votre connexion et réessayez.';

  @override
  String get transcribe => 'Transcrire';

  @override
  String get transcribing => 'Transcription...';

  @override
  String get transcriptionResultTitle => 'Transcription';

  @override
  String get transcriptionSaveToNote => 'Enregistrer dans la note';

  @override
  String get transcriptionSavedToNote => 'Enregistré dans la note du signet';

  @override
  String get transcriptionDisabledHint =>
      'Activez la transcription des signets dans les Paramètres, sous Avancé.';

  @override
  String get transcriptionNoModelDownloaded =>
      'Téléchargez d\'abord un modèle de transcription dans les Paramètres.';

  @override
  String get transcriptionNotDownloadedBook =>
      'Téléchargez ce livre ou connectez-vous à votre serveur pour le transcrire.';

  @override
  String get transcriptionNoMetadataMsg =>
      'Impossible de localiser cet endroit dans le téléchargement. Essayez de retélécharger le livre.';

  @override
  String get transcriptionBusyMsg =>
      'Une transcription est déjà en cours. Patientez un instant.';

  @override
  String get transcriptionEmptyMsg => 'Aucune voix détectée à cet endroit.';

  @override
  String get transcriptionFailedMsg =>
      'Impossible de transcrire cet endroit. Veuillez réessayer.';

  @override
  String get transcriptionPlaySnippet => 'Écouter';

  @override
  String get transcriptionPauseSnippet => 'Pause';

  @override
  String get transcriptionIntroBody =>
      'Cela permet d\'écouter la quantité d\'audio choisie, en commençant juste avant le signet, et en la transformant en texte sur votre appareil. Les clips plus longs prennent plus de temps, et la transcription n\'est pas précise à 100%. Le texte est sauvegardé dans la note du favori une fois terminé, prêt à être corrigé ou partagé.';

  @override
  String get transcriptionUseEbookText =>
      'Utiliser le texte exact de l\'ebook quand il peut être associé';

  @override
  String get lyricsMode => 'Transcription en direct';

  @override
  String get lyricsListeningAhead => 'Écoute en avance...';

  @override
  String get lyricsDisplaySection => 'Transcription en direct';

  @override
  String get lyricsFontSize => 'Taille des lignes';

  @override
  String get lyricsMaxLines => 'Lignes affichées';

  @override
  String get lyricsFullCover => 'Utiliser toute la couverture';

  @override
  String get lyricsFullCoverHint =>
      'Affiche la transcription à la place de l\'illustration pendant son exécution, avec autant de lignes que la place le permet.';

  @override
  String get lyricsBatteryInfo =>
      'La transcription en direct et la lecture suivie consomment plus de batterie et de ressources pendant leur exécution. Sur les téléphones à processeur plus lent, les lignes peuvent mettre plus de temps à apparaître.';

  @override
  String get lyricsClearCache => 'Vider le cache des transcriptions';

  @override
  String lyricsClearCacheHint(String size) {
    return '$size de lignes de transcription enregistrées. Les livres et épisodes effacés sont retranscrits pendant l\'écoute.';
  }

  @override
  String get lyricsClearCacheConfirm =>
      'Effacer les transcriptions enregistrées de tous les livres et épisodes ? Elles se reconstruisent automatiquement pendant l\'écoute.';

  @override
  String get lyricsCacheCleared => 'Cache des transcriptions vidé';

  @override
  String get lyricsIntroBody =>
      'Cette fonction écoute un peu en avance sur la narration et affiche chaque ligne au moment où elle est prononcée, transcrite sur votre téléphone - rien ne quitte l\'appareil. Après l\'avoir activée, attendez quelques secondes avant de lancer la lecture, le temps qu\'elle prenne de l\'avance. La transcription apparaît une fois cette avance prête, et démarrer en pause assure le meilleur fonctionnement. Elle consomme plus de batterie et de ressources pendant son exécution.';

  @override
  String lyricsBuildingLead(String percent) {
    return 'Prise d\'avance sur la narration... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return 'Transcription trop lente pour suivre votre écoute à $speed';
  }

  @override
  String get lyricsTurnOn => 'Activer';

  @override
  String get readAlong => 'Lecture suivie';

  @override
  String get readAlongNeedsPlaying =>
      'Lancez d\'abord le livre audio de ce livre';

  @override
  String get narrationListen => 'Écouter';

  @override
  String get narrationPlayFromHere => 'Lire à partir d\'ici';

  @override
  String get narrationPreparing => 'Préparation de la narration';

  @override
  String get narrationNone => 'Cet ebook n\'a pas de narration à lire';

  @override
  String get narrationDownloadTitle => 'Télécharger pour écouter';

  @override
  String get narrationDownloadBody =>
      'Ce livre est un EPUB3 qui se lit à voix haute. Audiobookshelf ne peut pas diffuser sa narration en streaming, l\'audio doit donc être téléchargé avant la lecture.';

  @override
  String get narrationDownloadStarted =>
      'Téléchargement de la narration. Touchez Absorb quand il est terminé.';

  @override
  String get narrationTextBody =>
      'L\'EPUB de ce livre contient son propre texte pour chaque moment de l\'audio, le texte est donc copié directement du livre. Choisissez la quantité à ajouter à la note du signet.';

  @override
  String get narrationTextLoading => 'Récupération du texte depuis le livre';

  @override
  String get downloadToAbsorb => 'Télécharger dans Absorb';

  @override
  String get narrationUpNextTitle => 'Télécharger le suivant';

  @override
  String narrationUpNextBody(String title) {
    return '$title est le suivant dans votre file d\'attente. C\'est un EPUB3 qui se lit à voix haute, il doit donc être téléchargé avant de pouvoir être lu.';
  }

  @override
  String narrationQueueStopped(String title) {
    return 'Arrêt avant $title. Téléchargez-le pour continuer.';
  }

  @override
  String get transcriptionNeedsDownload =>
      'Cela nécessite l\'audio sur votre téléphone. Le télécharger maintenant ?';

  @override
  String get transcriptionDownloadStarted =>
      'Téléchargement en cours. Réactivez-le une fois terminé';

  @override
  String get readAlongFollow => 'La lecture suivie suit';

  @override
  String get syncReadingListening => 'Garder lecture et écoute synchronisées';

  @override
  String get syncReadingListeningHint =>
      'Pour les livres ayant un livre audio et un ebook. Quand vous arrêtez d\'écouter, l\'ebook se place là où vous vous êtes arrêté. Quand vous quittez le lecteur, le livre audio se place à votre page. Avance uniquement.';

  @override
  String get syncEbookMoved => 'Ebook placé là où vous avez arrêté d\'écouter';

  @override
  String get syncAudioMoved =>
      'Livre audio placé là où vous avez arrêté de lire';

  @override
  String get syncAudioOffer =>
      'Touchez pour aller là où vous avez arrêté de lire';

  @override
  String get syncFindingAudio => 'Recherche de votre page dans le livre audio';

  @override
  String get syncFindingEbook => 'Recherche de votre position dans l\'ebook';

  @override
  String get syncFailed => 'Impossible de synchroniser votre position';

  @override
  String get syncAlreadyTogether => 'Déjà synchronisés';

  @override
  String get syncPosition => 'Synchroniser la position';

  @override
  String get readAlongFollowHint =>
      'Le minutage des mots est calculé entre les repères de temps de la transcription, il peut donc dériver légèrement au sein d\'une phrase.';

  @override
  String get readAlongFollowWord => 'Mot';

  @override
  String get readAlongFollowSentence => 'Phrase';

  @override
  String get readAlongColor => 'Couleur de la lecture suivie';

  @override
  String get readAlongLost => 'Narration introuvable sur la page';

  @override
  String get readAlongBackToNarration => 'Retour à la narration';

  @override
  String get findInEbook => 'Trouver dans l\'ebook';

  @override
  String get findInEbookSearching =>
      'Recherche de cet endroit dans l\'ebook...';

  @override
  String get findInEbookNotFound =>
      'Impossible de trouver cet endroit dans l\'ebook.';

  @override
  String get findInEbookNeedsEpub =>
      'Trouver dans l\'ebook nécessite un ebook EPUB.';

  @override
  String get findInEbookNoEbook => 'Ce livre n\'a pas d\'ebook.';

  @override
  String get findInAudiobook => 'Trouver dans le livre audio';

  @override
  String get findInAudiobookSearching =>
      'Recherche de cet endroit dans le livre audio...';

  @override
  String get findInAudiobookStillSearching =>
      'Recherche toujours en cours dans l\'audio...';

  @override
  String get findInAudiobookSearchingLong =>
      'Chapitre long, recherche toujours en cours. Cela peut prendre une minute ou deux...';

  @override
  String get findInAudiobookNotFound =>
      'Impossible de trouver cet endroit dans le livre audio.';

  @override
  String get transcriptionWhisperInfo =>
      'La transcription est alimentée par Whisper, un modèle ouvert de reconnaissance vocale qui écoute la narration et écrit les mots - le tout sur cet appareil.';

  @override
  String get transcriptionWhisperLearnMore => 'En savoir plus sur Whisper';

  @override
  String get findInAudiobookIntroBody =>
      'Cela permet d\'écouter le livre audio près de l\'endroit où vous lisez et de le faire correspondre à ce passage, le tout sur votre appareil. Cela peut prendre jusqu\'à une minute. Si l\'emplacement ne peut pas être associé en toute confiance, rien ne bouge.';

  @override
  String get findInAudiobookAfterLabel => 'Quand l\'endroit est trouvé';

  @override
  String get findInAudiobookStay => 'Continuer à lire';

  @override
  String get findInAudiobookGoPlayer => 'Ouvrir le lecteur';

  @override
  String get findInAudiobookPlaying =>
      'Lecture de ce passage dans le livre audio';

  @override
  String get catchUpAudioAhead =>
      'Le livre audio est plus avancé. Touchez pour y aller.';

  @override
  String get catchUpPageAhead =>
      'Cette page est en avance sur le livre audio. Touchez pour y amener le livre audio.';

  @override
  String get readerShortcutButton => 'Bouton de raccourci';

  @override
  String get keepScreenOn => 'Garder l\'écran allumé';

  @override
  String get keepScreenOnActive => 'L\'écran reste allumé';

  @override
  String get keepScreenOnUntilClosed =>
      'L\'écran reste allumé jusqu\'à la fermeture de l\'application';

  @override
  String get keepScreenOnOff => 'L\'écran peut de nouveau s\'éteindre';

  @override
  String get keepScreenOnOffUntilRestart =>
      'Désactivé jusqu\'au redémarrage de l\'application. Le réglage dans les Paramètres reste activé';

  @override
  String get keepScreenOnPlayer => 'Garder l\'écran allumé dans le lecteur';

  @override
  String get keepScreenOnPlayerSubtitle =>
      'L\'écran reste allumé tant que le lecteur est ouvert';

  @override
  String get keepScreenOnCarMode => 'Garder l\'écran allumé en mode voiture';

  @override
  String get keepScreenOnCarModeSubtitle =>
      'L\'écran reste allumé tant que le mode voiture est ouvert';

  @override
  String get loginServerType => 'Type de serveur';

  @override
  String get authBookOrbitDefaultPassword =>
      'Ce compte a encore son mot de passe par défaut. Changez-le dans BookOrbit, puis reconnectez-vous.';

  @override
  String get authBookOrbitPasswordOff =>
      'La connexion par mot de passe est désactivée sur ce serveur. Connectez-vous avec un lien magique ou une authentification unique.';

  @override
  String get authServerIsBookOrbit =>
      'C\'est un serveur BookOrbit. Choisissez BookOrbit au-dessus de l\'adresse du serveur.';

  @override
  String get authServerIsAudiobookshelf =>
      'C\'est un serveur Audiobookshelf. Choisissez Audiobookshelf au-dessus de l\'adresse du serveur.';

  @override
  String get castNotAvailableBookOrbit =>
      'La diffusion n\'est pas disponible avec les serveurs BookOrbit';

  @override
  String get loginMagicLink => 'Lien magique';

  @override
  String get loginMagicLinkDescription =>
      'Connectez-vous avec un lien magique BookOrbit, ou collez un lien de mot de passe pour définir le vôtre.';

  @override
  String get collectionPublicTitle => 'Public';

  @override
  String get collectionPublicSubtitle =>
      'Tout le monde sur ce serveur peut voir cette collection';

  @override
  String loginSignInWithProvider(String provider) {
    return 'Se connecter avec $provider';
  }

  @override
  String get loginSignInWithSso => 'Se connecter avec SSO';

  @override
  String get loginChooseSsoProvider => 'Choisissez comment vous connecter';

  @override
  String get loginRedirectUriBookOrbit =>
      'URI de redirection : bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => 'Statut de lecture';

  @override
  String get readStatusHint =>
      'BookOrbit conserve le statut que vous choisissez ici jusqu\'à ce que vous le changiez.';

  @override
  String get readStatusUnread => 'Non lu';

  @override
  String get readStatusWantToRead => 'À lire';

  @override
  String get readStatusReading => 'En cours de lecture';

  @override
  String get readStatusOnHold => 'En attente';

  @override
  String get readStatusRereading => 'Relecture';

  @override
  String get readStatusRead => 'Lu';

  @override
  String get readStatusSkimmed => 'Parcouru';

  @override
  String get readStatusAbandoned => 'Abandonné';

  @override
  String get personalNoteTitle => 'Votre note';

  @override
  String get personalNoteAdd => 'Ajouter une note privée';

  @override
  String get personalNoteHint => 'Vous seul pouvez voir cette note.';

  @override
  String get moreLikeThis => 'Dans le même genre';

  @override
  String get coverSlotAudiobook => 'Couverture du livre audio';

  @override
  String get coverSlotBook => 'Couverture du livre';

  @override
  String get cardButtonFill => 'Fond des boutons';

  @override
  String get cardButtonFillSubtitle =>
      'Remplissage des boutons de la carte du lecteur';

  @override
  String get cardButtonFillClear => 'Transparent';

  @override
  String get cardButtonFillSubtle => 'Discret';

  @override
  String get cardButtonFillSolid => 'Plein';

  @override
  String get loginBookOrbitPreview =>
      'La prise en charge de BookOrbit est récente. La lecture, les téléchargements et la navigation fonctionnent, mais certains écrans peuvent encore ressembler ou se comporter comme ceux d\'Audiobookshelf. Suivez l\'avancement sur GitHub et signalez-nous tout comportement anormal.';

  @override
  String get signedOutTapToSignIn =>
      'Déconnecté. Touchez pour vous reconnecter.';

  @override
  String get authSignedOutKeepListening =>
      'Vous avez été déconnecté. Les téléchargements restent lisibles. Touchez le nuage rouge pour vous reconnecter.';

  @override
  String signedOutSyncNote(String username, String server) {
    return 'Ce que vous écoutez hors connexion est conservé sur ce téléphone et se synchronise quand vous vous reconnectez en tant que $username sur $server. Toute méthode de connexion à ce compte convient.';
  }

  @override
  String get comicReadingDirection => 'Sens de lecture';

  @override
  String comicPageNumber(int page) {
    return 'Page $page';
  }

  @override
  String get comicBookmarkRemoveFailed =>
      'Impossible de retirer le signet du serveur. Réessayez une fois en ligne.';

  @override
  String get comicLeftToRight => 'De gauche à droite';

  @override
  String get comicRightToLeft => 'De droite à gauche (manga)';

  @override
  String get comicNeedsConnection =>
      'Cette bande dessinée s\'ouvre page par page depuis votre serveur, une connexion est donc nécessaire.';

  @override
  String get comicNoPages => 'Aucune page trouvée dans cette bande dessinée.';

  @override
  String get boAdminTitle => 'Administration du serveur';

  @override
  String get boAdminSubtitle =>
      'Utilisateurs et bibliothèques de ce serveur BookOrbit';

  @override
  String get boAdminUsers => 'Utilisateurs';

  @override
  String get boAdminLibraries => 'Bibliothèques';

  @override
  String boAdminUserCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personnes',
      one: '1 personne',
    );
    return '$_temp0';
  }

  @override
  String boAdminLibraryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bibliothèques',
      one: '1 bibliothèque',
    );
    return '$_temp0';
  }

  @override
  String get boAdminSaved => 'Enregistré';

  @override
  String get boAdminFailed => 'Ça n\'a pas marché. Réessayez.';

  @override
  String get boAdminOffline => 'Impossible de joindre le serveur.';

  @override
  String get boUsersSearch => 'Rechercher des utilisateurs';

  @override
  String get boUsersNone => 'Aucun utilisateur ici';

  @override
  String get boUsersFilterAll => 'Tous';

  @override
  String get boUsersFilterAdmins => 'Admins';

  @override
  String get boUsersFilterActive => 'Actifs';

  @override
  String get boUsersFilterInactive => 'Inactifs';

  @override
  String get boUsersFilterAttention => 'À surveiller';

  @override
  String get boUserBadgeAdmin => 'Admin';

  @override
  String get boUserBadgeInactive => 'Inactif';

  @override
  String get boUserBadgeLocked => 'Verrouillé';

  @override
  String get boUserBadgeNoPassword => 'Pas encore de mot de passe';

  @override
  String boUserLastActive(String date) {
    return 'Dernière activité $date';
  }

  @override
  String get boUserNeverSignedIn => 'Jamais connecté';

  @override
  String get boUserNew => 'Nouvel utilisateur';

  @override
  String get boUserCreate => 'Créer';

  @override
  String get boUserUsername => 'Utilisateur';

  @override
  String get boUserUsernameHint =>
      '3 caractères minimum. Ne peut pas être modifié ensuite.';

  @override
  String get boUserName => 'Nom';

  @override
  String get boUserEmail => 'E-mail';

  @override
  String get boUserEmailInvalid => 'Saisissez une adresse e-mail valide';

  @override
  String get boUserActive => 'Actif';

  @override
  String get boUserActiveSubtitle =>
      'Les utilisateurs inactifs ne peuvent pas se connecter';

  @override
  String get boUserAdmin => 'Administrateur';

  @override
  String get boUserAdminSubtitle => 'Accès complet à tout sur le serveur';

  @override
  String get boUserAdminHasAll =>
      'Les administrateurs ont toutes les permissions et voient toutes les bibliothèques.';

  @override
  String get boUserPermissions => 'Permissions';

  @override
  String get boUserPresetNone => 'Aucune';

  @override
  String get boUserPresetStandard => 'Standard';

  @override
  String get boUserPresetEverything => 'Toutes';

  @override
  String get boUserLibraries => 'Bibliothèques';

  @override
  String get boUserLibrariesHint =>
      'Les bibliothèques que cette personne peut voir.';

  @override
  String get boUserPasswordLink => 'Envoyer un lien de mot de passe';

  @override
  String get boUserPasswordLinkSubtitle =>
      'Un lien pour définir un nouveau mot de passe, valable 15 minutes';

  @override
  String get boUserExternal =>
      'Se connecte par authentification unique, le mot de passe y est donc géré.';

  @override
  String get boUserUnlock => 'Déverrouiller le compte';

  @override
  String get boUserUnlocked => 'Compte déverrouillé';

  @override
  String get boUserDelete => 'Effacer l\'utilisateur';

  @override
  String boUserDeleteTitle(String name) {
    return 'Effacer $name ?';
  }

  @override
  String get boUserDeleteBody =>
      'Son compte et tout ce qu\'il possède sur ce serveur sont retirés. Cette action est irréversible.';

  @override
  String get boUserDeleted => 'Utilisateur effacé';

  @override
  String get boUserLinkTitle => 'Lien de mot de passe';

  @override
  String boUserLinkBody(String name) {
    return 'Partagez ce lien avec $name. Il lui permet de définir un mot de passe et reste valable 15 minutes.';
  }

  @override
  String get boPasswordRules =>
      '8 caractères minimum, avec une majuscule, une minuscule et un chiffre.';

  @override
  String get boSetPasswordTitle => 'Définissez votre mot de passe';

  @override
  String get boSetPasswordSubmit => 'Définir le mot de passe et se connecter';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return 'Choisissez un mot de passe pour $username sur $server.';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return 'Choisissez un mot de passe pour votre compte sur $server.';
  }

  @override
  String get boSetPasswordStartingBody =>
      'Ce compte a encore le mot de passe avec lequel il a été créé. Choisissez-en un nouveau pour terminer la connexion.';

  @override
  String get boSetPasswordTrust =>
      'Ne continuez que si vous faites confiance à l\'expéditeur de ce lien.';

  @override
  String get boPasswordLinkExpired =>
      'Ce lien a expiré ou a déjà été utilisé. Demandez-en un nouveau à l\'administrateur de votre serveur.';

  @override
  String boPasswordSetSignInFailed(String error) {
    return 'Votre mot de passe est défini, mais la connexion a échoué : $error';
  }

  @override
  String get boChangePasswordSubtitle =>
      'Mettre à jour votre mot de passe BookOrbit';

  @override
  String get boPasswordChangeEffect =>
      'Changer votre mot de passe déconnecte vos autres sessions BookOrbit. Cet appareil reste connecté.';

  @override
  String get boPasswordChanged =>
      'Mot de passe modifié. Les autres appareils connectés ont été déconnectés.';

  @override
  String boPasswordShareDescription(String username) {
    return 'Envoyez ce lien ou faites scanner le code QR à $username pour choisir un mot de passe et se connecter à Absorb. Il est valable 15 minutes.';
  }

  @override
  String boPasswordShareWarning(String username) {
    return 'Toute personne ayant ce lien peut choisir le mot de passe de $username jusqu\'à son utilisation ou son expiration.';
  }

  @override
  String get setupLinkCopyWebLink => 'Copier le lien web';

  @override
  String get boUserLinkCopy => 'Copier le lien';

  @override
  String get boUserLinkCopied => 'Lien copié';

  @override
  String get boUserLinkShare => 'Partager';

  @override
  String get boUserNoLink =>
      'L\'utilisateur a été ajouté, mais le serveur n\'a envoyé aucun lien de mot de passe. Envoyez-en un depuis sa page.';

  @override
  String get boPermGroupLibrary => 'Bibliothèque et livres';

  @override
  String get boPermGroupRequests => 'Demandes de livres';

  @override
  String get boPermGroupDevices => 'Appareils';

  @override
  String get boPermGroupIntegrations => 'Intégrations de lecture';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => 'E-mail et notifications';

  @override
  String get boPermGroupAdmin => 'Administration';

  @override
  String get boPermLibraryDownload => 'Télécharger des livres';

  @override
  String get boPermLibraryUpload => 'Téléverser des livres';

  @override
  String get boPermLibraryEditMetadata => 'Modifier les métadonnées';

  @override
  String get boPermLibraryDeleteBooks => 'Effacer des livres';

  @override
  String get boPermBookRequestAccess => 'Demander des livres';

  @override
  String get boPermBookRequestAutoApprove =>
      'Demandes approuvées automatiquement';

  @override
  String get boPermBookRequestSelfFulfill =>
      'Télécharger directement les livres demandés';

  @override
  String get boPermManageBookRequests => 'Gérer les demandes de livres';

  @override
  String get boPermKoboSync => 'Synchro Kobo';

  @override
  String get boPermKoreaderSync => 'Synchro KOReader';

  @override
  String get boPermOpdsAccess => 'Accès OPDS';

  @override
  String get boPermHardcoverSync => 'Synchro Hardcover';

  @override
  String get boPermReadwiseSync => 'Synchro Readwise';

  @override
  String get boPermStorygraphSync => 'Synchro StoryGraph';

  @override
  String get boPermBookDockAccess => 'Utiliser le Book Dock';

  @override
  String get boPermManageBookDock => 'Gérer le Book Dock';

  @override
  String get boPermEmailSend => 'Envoyer des livres par e-mail';

  @override
  String get boPermNotificationAccess => 'Notifications';

  @override
  String get boPermManageEmail => 'Gérer l\'e-mail';

  @override
  String get boPermManageLibraries => 'Gérer les bibliothèques';

  @override
  String get boPermManageMetadataConfig => 'Paramètres de métadonnées';

  @override
  String get boPermManageIcons => 'Gérer les icônes';

  @override
  String get boPermManageUsers => 'Gérer les utilisateurs';

  @override
  String get boPermViewUserActivity => 'Voir l\'activité des utilisateurs';

  @override
  String get boPermViewAuditLog => 'Voir le journal d\'audit';

  @override
  String get boPermManageAppSettings => 'Paramètres de l\'application';

  @override
  String get boLibsNone => 'Aucune bibliothèque pour l\'instant';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres',
      one: '1 livre',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => 'Analyser maintenant';

  @override
  String get boLibScanStarted => 'Analyse démarrée';

  @override
  String get boLibScanning => 'Analyse en cours';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return 'Analysée $date : $added ajoutés, $updated mis à jour, $missing manquants';
  }

  @override
  String get boLibScanFailed => 'La dernière analyse a échoué';

  @override
  String get boLibNeverScanned => 'Pas encore analysée';

  @override
  String get boLibNew => 'Nouvelle bibliothèque';

  @override
  String get boLibName => 'Nom';

  @override
  String get boLibNeedName => 'Donnez un nom à la bibliothèque';

  @override
  String get boLibIcon => 'Icône';

  @override
  String get boLibFolders => 'Dossiers';

  @override
  String get boLibFoldersHint =>
      'Dossiers du serveur où se trouvent les livres de cette bibliothèque.';

  @override
  String get boLibNeedFolder => 'Ajoutez au moins un dossier';

  @override
  String get boLibAddFolder => 'Ajouter un dossier';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '1 fichier',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return 'Déjà dans $library';
  }

  @override
  String get boLibFolderUnreadable => 'Le serveur ne peut pas lire ce dossier';

  @override
  String get boLibFolderRescan =>
      'Modifier les dossiers relance l\'analyse de la bibliothèque.';

  @override
  String get boLibOrganization => 'Les livres sont stockés comme';

  @override
  String get boLibPerFolder => 'Un livre par dossier';

  @override
  String get boLibPerFile => 'Un livre par fichier';

  @override
  String get boLibOrganizationFixed =>
      'Impossible de changer ceci après la création de la bibliothèque.';

  @override
  String get boLibWatch => 'Surveiller les changements';

  @override
  String get boLibWatchSubtitle =>
      'Prendre en compte les fichiers nouveaux et modifiés dès leur apparition';

  @override
  String get boLibSchedule => 'Analyse planifiée';

  @override
  String get boLibScheduleOff => 'Désactivée';

  @override
  String get boLibScheduleDaily => 'Quotidienne';

  @override
  String get boLibScheduleWeekly => 'Hebdomadaire';

  @override
  String boLibScheduleCustom(String cron) {
    return 'Personnalisée ($cron)';
  }

  @override
  String get boLibScheduleHint => 'S\'exécute à 3 h, heure du serveur.';

  @override
  String get boLibCovers => 'Forme des couvertures';

  @override
  String get boLibCoverBook => 'Livre (2:3)';

  @override
  String get boLibCoverSquare => 'Carrée (1:1)';

  @override
  String get boLibAccess => 'Qui peut la voir';

  @override
  String get boLibAccessHint =>
      'Les administrateurs voient toutes les bibliothèques. Les autres ont besoin d\'un accès ici.';

  @override
  String get boLibAccessNone => 'Seulement les administrateurs pour l\'instant';

  @override
  String get boLibAccessAdd => 'Ajouter une personne';

  @override
  String get boLibAccessEveryoneHas => 'Tout le monde y a déjà accès';

  @override
  String get boLibLevelViewer => 'Lecteur';

  @override
  String get boLibLevelEditor => 'Éditeur';

  @override
  String get boLibLevelOwner => 'Propriétaire';

  @override
  String get boLibAccessRemove => 'Retirer l\'accès';

  @override
  String get boLibDelete => 'Effacer la bibliothèque';

  @override
  String boLibDeleteTitle(String name) {
    return 'Effacer $name ?';
  }

  @override
  String get boLibDeleteBody =>
      'La bibliothèque est retirée de BookOrbit, avec la progression et les surlignages de ses livres. Les fichiers sur le serveur restent où ils sont.';

  @override
  String get boLibDeleted => 'Bibliothèque effacée';

  @override
  String get boFolderPickTitle => 'Choisir un dossier';

  @override
  String get boFolderUseThis => 'Utiliser ce dossier';

  @override
  String get boFolderEmpty => 'Aucun dossier à l\'intérieur';

  @override
  String get statsTotalTime => 'TEMPS TOTAL';

  @override
  String get statsTotalReadingTime => 'TEMPS TOTAL DE LECTURE';

  @override
  String statsDaysOfTime(String days) {
    return 'Soit $days jours';
  }

  @override
  String statsHoursOfTime(String hours) {
    return 'Soit $hours heures';
  }

  @override
  String get statsMediaAll => 'Tout';

  @override
  String get statsMediaListening => 'Écoute';

  @override
  String get statsMediaReading => 'Lecture';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'BookOrbit compte vos jours dans le fuseau $server, mais ce téléphone est réglé sur $phone. Le temps tard dans la journée peut tomber sur le mauvais jour.';
  }

  @override
  String statsZoneUse(String zone) {
    return 'Utiliser $zone';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'BookOrbit utilise désormais $zone. Les jours précédents peuvent mettre quelques minutes à se mettre à jour.';
  }

  @override
  String get statsZoneFailed =>
      'Impossible de changer le fuseau horaire sur BookOrbit';

  @override
  String get statsTimeOfDay => 'Moment de la journée';

  @override
  String statsBusiestAround(String time) {
    return 'Pic d\'activité vers $time';
  }

  @override
  String get statsFinishedByMonth => 'Livres finis par mois';

  @override
  String statsFinishedLast12(int count) {
    return '$count sur les 12 derniers mois';
  }

  @override
  String get statsWhereTitle => 'Où vous écoutez et lisez';

  @override
  String get statsLast12Months => '12 derniers mois';

  @override
  String get statsHabits => 'Habitudes';

  @override
  String get statsTypicalSession => 'Session type';

  @override
  String get statsProgressPerSession => 'Progression par session';

  @override
  String get statsTimeToFinish => 'Temps pour finir';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours',
      one: '1 jour',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => 'Livres commencés';

  @override
  String get statsBooksInProgress => 'En cours';

  @override
  String get statsAverageProgress => 'Progression moyenne';

  @override
  String get statsTopBooks => 'Meilleurs livres';

  @override
  String get statsYearRead => 'Lu';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count non lues',
      one: '1 non lue',
      zero: 'Rien de nouveau',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => 'Tout marquer comme lu';

  @override
  String get boNotificationsClearAll => 'Tout effacer';

  @override
  String get boNotificationsClearTitle => 'Effacer toutes les notifications ?';

  @override
  String get boNotificationsClearBody =>
      'Cela retire toutes les notifications de votre compte BookOrbit.';

  @override
  String get boNotificationsEmpty => 'Aucune notification pour l\'instant';

  @override
  String get boNotificationsLoadFailed =>
      'Impossible de charger les notifications';

  @override
  String get boNotificationsUpdateFailed =>
      'Impossible de mettre à jour les notifications sur BookOrbit';

  @override
  String boNotificationsOccurrences(int count) {
    return 'Survenu $count fois';
  }

  @override
  String get boNotificationsSettings => 'Paramètres de notification';

  @override
  String get boNotificationsSettingsIntro =>
      'Choisissez les notifications que BookOrbit conserve pour vous.';

  @override
  String get boNotificationsProblemsHint =>
      'Problèmes ne vous notifie que lorsqu\'un élément échoue ou demande votre attention.';

  @override
  String get boNotificationLevelOff => 'Désactivé';

  @override
  String get boNotificationLevelProblems => 'Problèmes';

  @override
  String get boNotificationLevelAll => 'Toutes';

  @override
  String get boNotificationsSaved => 'Paramètres de notification enregistrés';

  @override
  String get boNotificationsSaveFailed =>
      'Impossible d\'enregistrer les paramètres de notification';

  @override
  String get boNotificationGroupLibrary => 'Bibliothèque';

  @override
  String get boNotificationGroupFiles => 'Fichiers';

  @override
  String get boNotificationGroupIntegrations => 'Intégrations';

  @override
  String get boNotificationGroupPersonal => 'Personnel';

  @override
  String get boNotifyScanning => 'Analyse de la bibliothèque';

  @override
  String get boNotifyScanningDesc =>
      'Quand une analyse de bibliothèque se termine, échoue ou trouve des livres manquants.';

  @override
  String get boNotifyMetadata => 'Récupération des métadonnées';

  @override
  String get boNotifyMetadataDesc =>
      'Quand la recherche de métadonnées pour vos livres se termine ou échoue.';

  @override
  String get boNotifyAuthorEnrichment => 'Détails sur les auteurs';

  @override
  String get boNotifyAuthorEnrichmentDesc =>
      'Quand les biographies et photos d\'auteurs ont fini de se télécharger.';

  @override
  String get boNotifyFileWriteBack => 'Enregistrement dans les fichiers';

  @override
  String get boNotifyFileWriteBackDesc =>
      'Quand les détails modifiés sont enregistrés dans les fichiers du livre sur le disque.';

  @override
  String get boNotifyFileRename => 'Renommage de fichiers';

  @override
  String get boNotifyFileRenameDesc =>
      'Quand un fichier de livre est renommé selon votre modèle de nommage.';

  @override
  String get boNotifyBulkRename => 'Renommage en masse';

  @override
  String get boNotifyBulkRenameDesc =>
      'Quand le renommage de nombreux livres, ou leur déplacement entre bibliothèques, se termine ou échoue.';

  @override
  String get boNotifyMigration => 'Imports';

  @override
  String get boNotifyMigrationDesc =>
      'Quand un import depuis une autre application de bibliothèque se termine ou échoue.';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc =>
      'Quand Book Dock a fini d\'ajouter des livres ou rencontre des problèmes.';

  @override
  String get boNotifyBookRequests => 'Demandes de livres';

  @override
  String get boNotifyBookRequestsDesc =>
      'Quand une demande de livre est soumise ou tranchée, ou que le livre devient disponible.';

  @override
  String get boNotifyEmail => 'Envoi par e-mail';

  @override
  String get boNotifyEmailDesc =>
      'Quand l\'envoi d\'un livre par e-mail réussit ou échoue.';

  @override
  String get boNotifyAchievements => 'Succès';

  @override
  String get boNotifyAchievementsDesc =>
      'Quand vous débloquez un nouveau succès.';

  @override
  String get achievementsTitle => 'Succès';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return '$earned sur $total obtenus';
  }

  @override
  String get achievementsFilterAll => 'Tous';

  @override
  String get achievementsFilterEarned => 'Obtenus';

  @override
  String get achievementsFilterInProgress => 'En cours';

  @override
  String get achievementsFilterLocked => 'Verrouillés';

  @override
  String get achievementsCategoryReading => 'Lecture';

  @override
  String get achievementsCategoryLibrary => 'Bibliothèque';

  @override
  String get achievementsCategoryExploration => 'Exploration';

  @override
  String get achievementsCategoryDedication => 'Assiduité';

  @override
  String get achievementsCategoryDevices => 'Appareils';

  @override
  String get achievementsRarityCommon => 'Commun';

  @override
  String get achievementsRarityRare => 'Rare';

  @override
  String get achievementsRarityEpic => 'Épique';

  @override
  String get achievementsRarityLegendary => 'Légendaire';

  @override
  String get achievementsLoadFailed => 'Impossible de charger les succès';

  @override
  String get achievementsNoneMatch => 'Aucun succès ne correspond à ce filtre';

  @override
  String get achievementsSecretName => 'Succès secret';

  @override
  String get achievementsSecretHint => 'Continuez à lire pour le révéler.';

  @override
  String achievementsEarnedOn(String date) {
    return 'Obtenu $date';
  }

  @override
  String achievementsWhileReading(String title) {
    return 'En lisant $title';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return 'Palier $earned sur $total';
  }

  @override
  String get achievementsTiers => 'Paliers';

  @override
  String get achievementsAllTiers => 'Tous les paliers obtenus';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold livres';
  }

  @override
  String achievementsProgressPages(String current, String threshold) {
    return '$current / $threshold pages';
  }

  @override
  String achievementsProgressHours(String current, String threshold) {
    return '$current / $threshold heures';
  }

  @override
  String achievementsProgressAnnotations(String current, String threshold) {
    return '$current / $threshold surlignages et notes';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold notes';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $threshold genres';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold langues';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold jours';
  }

  @override
  String get achievementsHowToGetIt => 'Comment l\'obtenir';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vous avez lu $count heures ces $days derniers jours.',
      one: 'Vous avez lu 1 heure ces $days derniers jours.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Environ $count jours à ce rythme.',
      one: 'Environ 1 jour à ce rythme.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Environ $count semaines à ce rythme.',
      one: 'Environ 1 semaine à ce rythme.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Environ $count mois à ce rythme.',
      one: 'Environ 1 mois à ce rythme.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres des années $decade attendent sur vos étagères.',
      one: '1 livre des années $decade attend sur vos étagères.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres du ${century}e siècle attendent sur vos étagères.',
      one: '1 livre du ${century}e siècle attend sur vos étagères.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return '$title est lu à $percent et a été commencé le $date.';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return '$title a été commencé le $date.';
  }

  @override
  String get achievementsHintUntitledBook => 'Un livre en cours';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres en cours ont dépassé $percent.',
      one: '1 livre en cours a dépassé $percent.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres que vous avez finis n\'ont pas encore de note.',
      one: '1 livre que vous avez fini n\'a pas encore de note.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count livres de moins de $pages pages attendent sur vos étagères.',
      one: '1 livre de moins de $pages pages attend sur vos étagères.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sont déjà en cours.',
      one: '1 est déjà en cours.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count livres de $pages pages ou plus attendent sur vos étagères.',
      one: '1 livre de $pages pages ou plus attend sur vos étagères.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres publiés avant $year attendent sur vos étagères.',
      one: '1 livre publié avant $year attend sur vos étagères.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author : $finished finis, $count de plus sur vos étagères.';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres en $language attendent sur vos étagères.',
      one: '1 livre en $language attend sur vos étagères.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vous avez lu pendant $count mois de $year jusqu\'ici.',
      one: 'Vous avez lu pendant 1 mois de $year jusqu\'ici.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Il reste $months.',
      one: 'Il reste $months.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return 'Aucun livre sur vos étagères n\'a encore $pages pages ou plus.';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return 'Rien sur vos étagères n\'a été publié avant $year.';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vos étagères ne couvrent encore que $count décennies.',
      one: 'Vos étagères ne couvrent encore qu\'1 décennie.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vos étagères ne couvrent encore que $count siècles.',
      one: 'Vos étagères ne couvrent encore qu\'1 siècle.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return 'Vous n\'avez pas lu en $month, donc $year est hors de portée. Le compte repart en janvier.';
  }

  @override
  String get achievementsSwitch => 'Succès';

  @override
  String get achievementsSwitchSubtitle =>
      'Suivre les succès sur BookOrbit. Les désactiver les masque ici et sur le web.';

  @override
  String get achievementsTurnedOn => 'Succès activés';

  @override
  String get achievementsTurnedOff => 'Succès désactivés';

  @override
  String get achievementsSwitchFailed =>
      'Impossible de modifier les succès sur BookOrbit';

  @override
  String get boNotifyReadAlong => 'Lectures suivies';

  @override
  String get boNotifyReadAlongDesc =>
      'Quand une lecture suivie que vous avez lancée est prête, demande votre attention ou échoue.';

  @override
  String get readAlongCreate => 'Créer une lecture suivie';

  @override
  String get readAlongLoadFailed =>
      'Impossible de vérifier si une lecture suivie peut être créée pour ce livre.';

  @override
  String get readAlongCheckAgain => 'Vérifier à nouveau';

  @override
  String get readAlongWhyWorkerOffline =>
      'Le worker de lecture suivie de BookOrbit est actuellement hors ligne.';

  @override
  String get readAlongWhyWorkerOutdated =>
      'Le worker de lecture suivie de BookOrbit doit être mis à jour pour fonctionner avec ce serveur.';

  @override
  String get readAlongWhyFilesMissing =>
      'Restaurez les fichiers manquants de ce livre pour créer une lecture suivie.';

  @override
  String get readAlongWhyNoEpub =>
      'Ajoutez un EPUB simple à ce livre pour créer une lecture suivie.';

  @override
  String get readAlongWhyNoEpubHasOne =>
      'Ce livre a déjà une lecture suivie et aucun EPUB simple pour en créer une autre.';

  @override
  String get readAlongWhyTooManyTracks =>
      'Ce livre audio compte trop de fichiers pour créer une lecture suivie.';

  @override
  String get readAlongWhyEpubNotAllowed =>
      'Cette bibliothèque n\'accepte pas les fichiers EPUB, impossible d\'ajouter une lecture suivie.';

  @override
  String get readAlongWhyNotMounted =>
      'Le worker de lecture suivie de BookOrbit n\'a pas accès au dossier de cette bibliothèque.';

  @override
  String get readAlongWhyRunning =>
      'Une lecture suivie est déjà en cours de création pour ce livre.';

  @override
  String get readAlongWhyUnknown =>
      'Impossible de créer une lecture suivie pour ce livre pour le moment.';

  @override
  String get readAlongSheetTitle => 'Créer une lecture suivie';

  @override
  String get readAlongSheetIntro =>
      'BookOrbit fait correspondre la narration au texte de l\'ebook et ajoute un EPUB dont le texte est surligné en suivant l\'audio.';

  @override
  String get readAlongEbook => 'Ebook';

  @override
  String get readAlongEbookHint =>
      'Choisissez l\'EPUB simple qui correspond à la narration.';

  @override
  String get readAlongAudio => 'Livre audio';

  @override
  String readAlongTracks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pistes',
      one: '1 piste',
    );
    return '$_temp0';
  }

  @override
  String readAlongExistingTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ce livre a déjà $count lectures suivies',
      one: 'Ce livre a déjà une lecture suivie',
    );
    return '$_temp0';
  }

  @override
  String readAlongReplace(String name) {
    return 'Remplacer $name';
  }

  @override
  String readAlongKeepBoth(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tout garder',
      one: 'Garder les deux',
    );
    return '$_temp0';
  }

  @override
  String get readAlongKeepHint =>
      'La nouvelle lecture suivie est ajoutée comme fichier supplémentaire.';

  @override
  String get readAlongReplaceHint =>
      'L\'ancien fichier n\'est remplacé qu\'une fois que le nouveau a passé ses vérifications, et les positions de lecture sont conservées.';

  @override
  String get readAlongReplaceNotAllowed =>
      'Remplacer une lecture suivie nécessite l\'autorisation de supprimer des livres ; la nouvelle est donc ajoutée comme fichier supplémentaire.';

  @override
  String get readAlongMadeByBookOrbit => 'Créée par BookOrbit';

  @override
  String get readAlongImported => 'Importée';

  @override
  String get readAlongLanguage => 'Langue de la narration';

  @override
  String get readAlongPickLanguage => 'Choisir une langue';

  @override
  String readAlongLanguageUnsupported(String language) {
    return 'Le modèle vocal ne connaît pas la langue de ce livre ($language).';
  }

  @override
  String get readAlongLanguageFromBook => 'D\'après les détails de ce livre.';

  @override
  String get readAlongLanguageIsDefault => 'Votre langue par défaut.';

  @override
  String get readAlongLanguageSaved => 'Enregistrée comme langue par défaut.';

  @override
  String get readAlongSetDefault => 'Définir par défaut';

  @override
  String get readAlongDefaultFailed =>
      'Impossible d\'enregistrer votre langue par défaut.';

  @override
  String get readAlongHighlighting => 'Surlignage';

  @override
  String get readAlongSentence => 'Phrase';

  @override
  String get readAlongSentenceHint =>
      'Surligne une phrase à la fois. Recommandé.';

  @override
  String get readAlongWord => 'Mot';

  @override
  String get readAlongWordHint =>
      'Surligne chaque mot. Plus long et fichier plus volumineux. Encore expérimental.';

  @override
  String readAlongEstimatedSize(String size) {
    return 'Taille estimée : $size';
  }

  @override
  String get readAlongBackgroundNote =>
      'S\'exécute sur le serveur, vous pouvez donc fermer cet écran. Les livres audio longs peuvent prendre des heures, et la première exécution pour une langue télécharge son modèle vocal.';

  @override
  String readAlongLowDisk(String needed, String free) {
    return 'Espace disque faible : il faut environ $needed d\'espace de travail sur le worker, qui n\'a que $free de libre.';
  }

  @override
  String get readAlongStart => 'Démarrer';

  @override
  String get readAlongStartFailed =>
      'Impossible de démarrer la lecture suivie. Réessayez.';

  @override
  String get readAlongStartInvalid =>
      'Certains fichiers choisis ne font plus partie de ce livre. Vérifiez-les et réessayez.';

  @override
  String get readAlongStartOffline =>
      'Le worker de lecture suivie de BookOrbit est hors ligne. Réessayez plus tard.';

  @override
  String get readAlongNotAllowed =>
      'Vous n\'avez pas l\'autorisation de faire cela.';

  @override
  String get readAlongGone => 'Cette tâche de lecture suivie n\'existe plus.';

  @override
  String get readAlongMovedOn =>
      'Cette tâche a déjà évolué. Elle affiche maintenant son état actuel.';

  @override
  String get readAlongActionFailed => 'L\'action a échoué. Réessayez.';

  @override
  String readAlongStartedBy(String name) {
    return 'Lancée par $name';
  }

  @override
  String get readAlongStartedByOther => 'Lancée par un autre utilisateur';

  @override
  String get readAlongWaiting => 'En attente de démarrage';

  @override
  String get readAlongNextInLine => 'Prochaine en file';

  @override
  String readAlongJobsAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tâches devant',
      one: '1 tâche devant',
    );
    return '$_temp0';
  }

  @override
  String get readAlongStopping => 'Arrêt en cours';

  @override
  String get readAlongStoppingHint =>
      'Termine l\'étape en cours, puis s\'arrête. Rien ne sera ajouté à ce livre.';

  @override
  String get readAlongStagePreparingAudio => 'Préparation de l\'audio';

  @override
  String get readAlongStageDownloadingModel => 'Téléchargement du modèle vocal';

  @override
  String get readAlongStageListening => 'Écoute de la narration';

  @override
  String get readAlongStageMarkingUp => 'Balisage du texte de l\'ebook';

  @override
  String get readAlongStageAligning =>
      'Mise en correspondance du texte et de la narration';

  @override
  String get readAlongStageChecking => 'Vérification du résultat';

  @override
  String get readAlongStagePublishing =>
      'Ajout de la lecture suivie à ce livre';

  @override
  String get readAlongStageWorking => 'En cours';

  @override
  String readAlongFileOf(int current, int total) {
    return 'Fichier $current sur $total';
  }

  @override
  String readAlongTrackOf(int current, int total) {
    return 'Piste $current sur $total';
  }

  @override
  String readAlongChapterOf(int current, int total) {
    return 'Chapitre $current sur $total';
  }

  @override
  String readAlongStepOf(int current, int total) {
    return 'Étape $current sur $total';
  }

  @override
  String get readAlongFirstRun => 'Première exécution pour cette langue';

  @override
  String get readAlongJustStarted => 'Vient de démarrer';

  @override
  String readAlongRunningFor(String duration) {
    return 'En cours depuis $duration';
  }

  @override
  String get readAlongStepAudio => 'Audio';

  @override
  String get readAlongStepSpeech => 'Voix';

  @override
  String get readAlongStepText => 'Texte';

  @override
  String get readAlongStepAlign => 'Alignement';

  @override
  String get readAlongStepCheck => 'Vérification';

  @override
  String get readAlongStepAdd => 'Ajout';

  @override
  String get readAlongReviewTitle => 'Prête pour relecture';

  @override
  String readAlongReviewMatched(String percent) {
    return '$percent du texte correspond à la narration. Vérifiez-la avant de l\'ajouter au livre.';
  }

  @override
  String get readAlongReviewPlain =>
      'Vérifiez-la avant de l\'ajouter au livre.';

  @override
  String get readAlongReviewWeb =>
      'Pour exclure des chapitres et refaire la correspondance, ouvrez ce livre dans BookOrbit sur le web.';

  @override
  String readAlongReviewExpires(String date) {
    return 'Supprimée automatiquement le $date si vous ne la relisez pas.';
  }

  @override
  String get readAlongAddAnyway => 'Ajouter quand même';

  @override
  String get readAlongDiscard => 'Abandonner';

  @override
  String get readAlongDiscardPrompt => 'Abandonner cette lecture suivie ?';

  @override
  String get readAlongKeepIt => 'La garder';

  @override
  String get readAlongReady => 'Lecture suivie prête';

  @override
  String get readAlongReadyWarnings =>
      'Lecture suivie prête, avec des avertissements';

  @override
  String get readAlongAdded => 'Ajoutée à ce livre comme nouvel EPUB.';

  @override
  String get readAlongReplaced =>
      'Ancienne lecture suivie remplacée. Les positions de lecture sont conservées.';

  @override
  String readAlongMatchedSentences(String matched, String total) {
    return '$matched phrases sur $total correspondent à la narration';
  }

  @override
  String readAlongAudioUsed(String percent) {
    return '$percent de l\'audio utilisé';
  }

  @override
  String readAlongOutside(String chapters) {
    return 'Absents de la narration, donc sans audio : $chapters.';
  }

  @override
  String readAlongOutsideMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapitres de plus',
      one: '1 chapitre de plus',
    );
    return '$_temp0';
  }

  @override
  String get readAlongWarnUnaligned =>
      'Une ou plusieurs pistes audio n\'ont pas pu être mises en correspondance.';

  @override
  String get readAlongWarnUnmatched =>
      'Une part notable du texte de l\'ebook ne correspond pas à la narration.';

  @override
  String get readAlongWarnInterpolated =>
      'Le minutage de certains passages a été estimé entre des correspondances fiables.';

  @override
  String get readAlongWarnDropped =>
      'Une partie du texte de l\'ebook a été exclue du surlignage.';

  @override
  String get readAlongFailed => 'Échec de la lecture suivie';

  @override
  String get readAlongCancelled => 'Lecture suivie annulée';

  @override
  String get readAlongDiscarded => 'Lecture suivie abandonnée';

  @override
  String get readAlongNothingAdded => 'Rien n\'a été ajouté à ce livre.';

  @override
  String get readAlongExpired =>
      'Elle n\'a pas été relue dans les 14 jours, donc rien n\'a été ajouté à ce livre.';

  @override
  String readAlongRetryUntil(String date) {
    return 'Réessayer reprend à la dernière étape terminée, jusqu\'au $date.';
  }

  @override
  String get readAlongStartOver => 'Recommencer';

  @override
  String get readAlongCancel => 'Annuler la lecture suivie';

  @override
  String get readAlongCancelPrompt => 'Annuler cette lecture suivie ?';

  @override
  String get readAlongKeepRunning => 'Laisser continuer';

  @override
  String get readAlongErrorWorkerOffline =>
      'BookOrbit n\'a pas pu joindre son worker de lecture suivie.';

  @override
  String get readAlongErrorWorkerCrashed =>
      'Le worker de lecture suivie s\'est arrêté de façon inattendue.';

  @override
  String get readAlongErrorSourceMissing => 'Un fichier choisi n\'existe plus.';

  @override
  String get readAlongErrorSourceChanged =>
      'Un fichier choisi a changé après le démarrage de la tâche.';

  @override
  String get readAlongErrorInvalidSource =>
      'L\'EPUB ou le livre audio n\'a pas pu être lu.';

  @override
  String get readAlongErrorLanguage =>
      'Le modèle vocal ne connaît pas la langue choisie.';

  @override
  String get readAlongErrorStorage =>
      'Il n\'y a pas assez d\'espace disque libre sur le worker pour terminer.';

  @override
  String get readAlongErrorAudio => 'Le livre audio n\'a pas pu être préparé.';

  @override
  String get readAlongErrorModel =>
      'Le modèle vocal n\'a pas pu être téléchargé.';

  @override
  String get readAlongErrorListening =>
      'La reconnaissance vocale a échoué pendant l\'écoute de la narration.';

  @override
  String get readAlongErrorMarkup =>
      'Le texte de l\'ebook n\'a pas pu être préparé pour la mise en correspondance.';

  @override
  String get readAlongErrorAlignment =>
      'Le texte n\'a pas pu être mis en correspondance avec la narration.';

  @override
  String get readAlongErrorOutput =>
      'Le nouvel EPUB n\'a pas passé ses vérifications.';

  @override
  String get readAlongErrorPublish =>
      'Le nouvel EPUB n\'a pas pu être ajouté à ce livre.';

  @override
  String get readAlongErrorDiscarded =>
      'Elle a été abandonnée lors de la relecture.';

  @override
  String get readAlongErrorCancelled => 'Elle a été annulée.';

  @override
  String get readAlongErrorUnknown =>
      'Une erreur s\'est produite pendant la création de la lecture suivie.';

  @override
  String get fileInfoNoAudiobook => 'Pas encore de livre audio';

  @override
  String get fileInfoNoEbook => 'Pas encore d\'ebook';

  @override
  String get fileInfoRequestedBySomeone => 'Demandé par quelqu\'un d\'autre';

  @override
  String get fileInfoOwnedSeparately =>
      'Dans votre bibliothèque comme livre distinct';

  @override
  String get fileInfoCopyPath => 'Copier le chemin';

  @override
  String get fileInfoDeleteTitle => 'Effacer le fichier ?';

  @override
  String fileInfoDeletePrompt(String name) {
    return '« $name » sera effacé du serveur. Cette action est irréversible.';
  }

  @override
  String get fileInfoDeleteLast =>
      'C\'est le dernier fichier audio ou ebook du livre, qui apparaîtra donc comme manquant.';

  @override
  String get fileInfoDeleteNotAllowed =>
      'Vous n\'avez pas l\'autorisation d\'effacer des fichiers';

  @override
  String get chapterSourceEmbedded => 'Lus depuis les fichiers audio';

  @override
  String get chapterSourceTracks =>
      'Un chapitre par fichier audio, non enregistré';

  @override
  String get chapterSourceProvider => 'Issus des métadonnées récupérées';

  @override
  String get chapterSourceMigration => 'Importés depuis Audiobookshelf';

  @override
  String get chapterSourceManual => 'Modifiés dans BookOrbit';

  @override
  String chapterSourceManualBy(String name) {
    return 'Modifiés par $name';
  }

  @override
  String get chapterSourceNone => 'Pas encore de chapitres';

  @override
  String get chapterProtected => 'Protégés contre les réanalyses';

  @override
  String get chapterNotProtected => 'Une réanalyse peut les remplacer';

  @override
  String get chapterProtectOnSave => 'Protéger contre les réanalyses';

  @override
  String get chapterGetFrom => 'Récupérer les chapitres depuis';

  @override
  String get chapterFromFiles => 'Les fichiers audio';

  @override
  String get chapterFromEbookToc => 'Le sommaire de l\'ebook';

  @override
  String get chapterFromReadAlong => 'La lecture suivie';

  @override
  String get chapterFromHistory => 'Versions précédentes';

  @override
  String get chapterHistoryTitle => 'Versions précédentes';

  @override
  String get chapterHistoryEmpty =>
      'Les versions enregistrées apparaissent ici.';

  @override
  String chapterHistoryBy(String source, String name) {
    return '$source par $name';
  }

  @override
  String get chapterReadingFiles => 'Lecture des fichiers audio...';

  @override
  String get chapterRevertToFiles => 'Revenir aux fichiers';

  @override
  String get chapterRevertTitle => 'Revenir aux chapitres des fichiers ?';

  @override
  String get chapterRevertMessage =>
      'BookOrbit relit les chapitres des fichiers audio et ne les protège plus contre les réanalyses. Les modifications non enregistrées sont perdues. La liste actuelle reste dans les versions précédentes.';

  @override
  String get chapterReverted => 'Chapitres remis comme dans les fichiers audio';

  @override
  String get chapterWriteFiles => 'Écrire dans les fichiers';

  @override
  String get chapterWriteTitle =>
      'Écrire les chapitres dans les fichiers audio ?';

  @override
  String chapterWriteMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Les $count fichiers audio du livre seront réécrits avec ces chapitres.',
      one: 'Le fichier audio du livre sera réécrit avec ces chapitres.',
    );
    return '$_temp0 L\'audio lui-même est copié sans modification. Les téléphones qui ont déjà téléchargé le livre gardent leur copie jusqu\'à un nouveau téléchargement.';
  }

  @override
  String get chapterWriteConfirm => 'Écrire';

  @override
  String get chapterWriting =>
      'Écriture des chapitres dans les fichiers audio...';

  @override
  String chapterWritten(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chapitres écrits dans les $count fichiers audio',
      one: 'Chapitres écrits dans le fichier audio',
    );
    return '$_temp0';
  }

  @override
  String chapterWrittenPartly(int written, int total) {
    return 'Chapitres écrits dans $written fichiers sur $total. Les autres sont restés inchangés.';
  }

  @override
  String get chapterStaleTitle => 'Ces chapitres ont changé';

  @override
  String get chapterStaleMessage =>
      'Quelqu\'un d\'autre a enregistré ces chapitres après votre ouverture. Rechargez pour voir sa version. Vos modifications sont conservées jusque-là.';

  @override
  String get chapterReload => 'Recharger';

  @override
  String get chapterKeepEditing => 'Continuer à modifier';

  @override
  String get matchExplicitYes => 'Marqué explicite';

  @override
  String get matchExplicitNo => 'Non explicite';

  @override
  String get matchAbridgedYes => 'Abrégé';

  @override
  String get matchAbridgedNo => 'Intégral';

  @override
  String boQuickMatchBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ces $count livres',
      one: 'ce livre',
    );
    return 'BookOrbit recherche $_temp0 et complète ce qu\'il trouve, selon ses paramètres de métadonnées.';
  }

  @override
  String get boQuickMatchIgnoreCache => 'Interroger à nouveau chaque source';

  @override
  String get boQuickMatchIgnoreCacheHint =>
      'Ignore les réponses enregistrées. Plus lent, et consomme davantage de la limite de requêtes de chaque source.';

  @override
  String boAdminServerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count serveurs de messagerie',
      one: '1 serveur de messagerie',
      zero: 'Aucun pour l\'instant',
    );
    return '$_temp0';
  }

  @override
  String get boEmailTitle => 'Envoyer par e-mail';

  @override
  String get boEmailSubtitle =>
      'Appareils, serveurs de messagerie et modèles pour envoyer des livres';

  @override
  String get boEmailTabDevices => 'Appareils';

  @override
  String get boEmailTabServers => 'Serveurs de messagerie';

  @override
  String get boEmailTabTemplates => 'Modèles';

  @override
  String get boEmailTabHistory => 'Historique';

  @override
  String get boEmailName => 'Nom';

  @override
  String boEmailDeleteTitle(String name) {
    return 'Effacer $name ?';
  }

  @override
  String get boEmailMakeDefault => 'Définir par défaut';

  @override
  String get boEmailBadgeDefault => 'Par défaut';

  @override
  String get boEmailBadgeShared => 'Partagé';

  @override
  String get boEmailBadgeSystem => 'Réinitialisations de mot de passe';

  @override
  String get boEmailBadgeBuiltIn => 'Intégré';

  @override
  String get boEmailDevicesEmpty =>
      'Aucun appareil pour l\'instant. Ajoutez l\'adresse e-mail de votre liseuse pour lui envoyer des livres.';

  @override
  String get boEmailAddDevice => 'Ajouter un appareil';

  @override
  String get boEmailNewDevice => 'Nouvel appareil';

  @override
  String get boEmailDeviceNameHint => 'Ma Kindle';

  @override
  String get boEmailDeviceAddress => 'Adresse e-mail';

  @override
  String get boEmailDeviceType => 'Appareil';

  @override
  String get boEmailDeviceNone => 'Personne ou boîte de réception';

  @override
  String get boEmailDeviceKindle => 'Kindle';

  @override
  String get boEmailDeviceKobo => 'Kobo';

  @override
  String get boEmailDeviceOther => 'Autre liseuse';

  @override
  String get boEmailKindleHint =>
      'Kindle reçoit l\'objet « convert » et n\'accepte que l\'EPUB et le PDF par e-mail.';

  @override
  String boEmailKindleApprove(String address) {
    return 'Kindle ignore les e-mails d\'adresses inconnues. Dans les paramètres des documents personnels d\'Amazon, ajoutez $address à la liste des adresses approuvées.';
  }

  @override
  String get boEmailKindleApproveNoServer =>
      'Ajoutez d\'abord un serveur de messagerie pour voir l\'adresse que Kindle doit approuver.';

  @override
  String get boEmailFormat => 'Format';

  @override
  String get boEmailFormatPrimary => 'Fichier principal du livre';

  @override
  String get boEmailFormatHint =>
      'Un livre sans ce format reçoit son fichier principal.';

  @override
  String get boEmailReadAlong => 'Livres en lecture suivie';

  @override
  String get boEmailReadAlongAuto => 'Automatique';

  @override
  String get boEmailReadAlongAutoHint =>
      'Texte seul si une copie peut être créée, sinon l\'original.';

  @override
  String get boEmailReadAlongText => 'Texte seul';

  @override
  String get boEmailReadAlongTextHint =>
      'Narration retirée. Assez léger pour un e-mail.';

  @override
  String get boEmailReadAlongOriginal => 'Avec narration';

  @override
  String get boEmailReadAlongOriginalHint =>
      'Conserve la narration. Souvent 100 Mo ou plus, au-delà de la limite de la plupart des serveurs de messagerie.';

  @override
  String get boEmailTemplate => 'Modèle';

  @override
  String get boEmailTemplateYourDefault => 'Votre modèle par défaut';

  @override
  String get boEmailTemplateKindleHint =>
      'Kindle n\'affiche jamais le message, donc le modèle est ignoré.';

  @override
  String get boEmailDefaultDevice => 'Appareil par défaut';

  @override
  String get boEmailDefaultDeviceHint =>
      'Sélectionné en premier quand vous envoyez un livre.';

  @override
  String get boEmailSendTest => 'Envoyer un e-mail de test';

  @override
  String get boEmailTestSubject => 'E-mail de test d\'Absorb';

  @override
  String boEmailTestBody(String name) {
    return 'Ceci est un test d\'Absorb. Si vous pouvez le lire, les livres envoyés à $name arriveront aussi ici.';
  }

  @override
  String boEmailTestSent(String name) {
    return 'E-mail de test envoyé à $name';
  }

  @override
  String boEmailTestFailed(String error) {
    return 'L\'e-mail de test n\'est pas parti : $error';
  }

  @override
  String get boEmailDeleteDevice => 'Effacer l\'appareil';

  @override
  String get boEmailDeleteDeviceBody =>
      'Son historique d\'envois est conservé.';

  @override
  String get boEmailDeviceRequired => 'Saisissez un nom et une adresse e-mail';

  @override
  String get boEmailLastSendFailed => 'Le dernier envoi a échoué';

  @override
  String get boEmailGroups => 'Groupes';

  @override
  String get boEmailGroupsHint => 'Envoyer à plusieurs appareils à la fois.';

  @override
  String get boEmailNewGroup => 'Nouveau groupe';

  @override
  String get boEmailGroupNameHint => 'Club de lecture';

  @override
  String get boEmailGroupMembers => 'Appareils de ce groupe';

  @override
  String get boEmailGroupMembersEmpty => 'Ajoutez d\'abord un appareil.';

  @override
  String boEmailGroupMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count appareils',
      one: '1 appareil',
      zero: 'Aucun appareil',
    );
    return '$_temp0';
  }

  @override
  String get boEmailDeleteGroup => 'Effacer le groupe';

  @override
  String get boEmailDeleteGroupBody =>
      'Les appareils qu\'il contient sont conservés.';

  @override
  String get boEmailGroupRequired => 'Saisissez un nom de groupe';

  @override
  String get boEmailServersEmptyManage =>
      'Aucun serveur de messagerie pour l\'instant. Ajoutez-en un pour commencer à envoyer des livres.';

  @override
  String get boEmailServersEmpty =>
      'Aucun serveur de messagerie pour l\'instant. Demandez à un admin d\'en ajouter un.';

  @override
  String get boEmailAddServer => 'Ajouter un serveur de messagerie';

  @override
  String get boEmailNewServer => 'Nouveau serveur de messagerie';

  @override
  String get boEmailServerPresetOther => 'Autre';

  @override
  String get boEmailServerPresetHint =>
      'Un préréglage remplit l\'hôte, le port et la sécurité. Vous pouvez encore les modifier.';

  @override
  String get boEmailServerHost => 'Hôte';

  @override
  String get boEmailServerPort => 'Port';

  @override
  String get boEmailServerSecurity => 'Sécurité';

  @override
  String get boEmailServerSecurityNone => 'Aucune';

  @override
  String get boEmailServerSecurityHint =>
      'STARTTLS sur le port 587, SSL/TLS sur le 465.';

  @override
  String get boEmailServerNeedsPassword => 'Connexion avec un mot de passe';

  @override
  String get boEmailServerUsername => 'Utilisateur';

  @override
  String get boEmailServerPassword => 'Mot de passe';

  @override
  String get boEmailServerAppPassword => 'Mot de passe d\'application';

  @override
  String get boEmailServerPasswordKeep =>
      'Enregistré. Saisissez pour le remplacer';

  @override
  String get boEmailServerAppPasswordHint =>
      'Gmail et iCloud demandent un mot de passe d\'application, pas celui de votre compte.';

  @override
  String get boEmailServerFromName => 'Nom de l\'expéditeur';

  @override
  String get boEmailServerFromAddress => 'Adresse de l\'expéditeur';

  @override
  String get boEmailServerFromAddressHint =>
      'Les propriétaires de Kindle doivent approuver cette adresse.';

  @override
  String get boEmailServerShare => 'Partager avec tout le monde';

  @override
  String get boEmailServerShareHint =>
      'Les autres peuvent envoyer des livres via ce serveur sans voir le mot de passe.';

  @override
  String get boEmailServerSystem =>
      'Envoyer les réinitialisations de mot de passe et les liens de connexion';

  @override
  String get boEmailServerSystemHint =>
      'Le serveur que BookOrbit utilise pour ses propres e-mails.';

  @override
  String get boEmailServerVerifyTls => 'Vérifier le certificat du serveur';

  @override
  String get boEmailServerVerifyTlsHint =>
      'Désactivez uniquement pour un serveur de votre réseau avec un certificat auto-signé.';

  @override
  String get boEmailServerTest => 'Tester la connexion';

  @override
  String get boEmailServerTestSaveFirst => 'Enregistrez d\'abord, puis testez';

  @override
  String get boEmailServerTestOk => 'Connecté';

  @override
  String boEmailServerTestFailed(String error) {
    return 'Connexion impossible : $error';
  }

  @override
  String get boEmailServerDelete => 'Effacer le serveur de messagerie';

  @override
  String get boEmailServerDeleteBody =>
      'Toutes les personnes avec qui il est partagé le perdent.';

  @override
  String get boEmailServerSystemFirst =>
      'Désactivez les réinitialisations de mot de passe sur ce serveur avant de l\'effacer.';

  @override
  String get boEmailServerRequired => 'Saisissez un nom et un hôte';

  @override
  String get boEmailServerNotYours =>
      'Quelqu\'un d\'autre a ajouté ce serveur. Lui seul peut le modifier.';

  @override
  String get boEmailTemplatesEmpty => 'Aucun modèle pour l\'instant.';

  @override
  String get boEmailNewTemplate => 'Nouveau modèle';

  @override
  String get boEmailTemplateSubject => 'Objet';

  @override
  String get boEmailTemplateMessage => 'Message';

  @override
  String get boEmailTemplateInsert => 'Insérer';

  @override
  String get boEmailTemplateInsertHint =>
      'S\'insère à l\'emplacement du curseur. Les détails absents d\'un livre n\'affichent rien.';

  @override
  String get boEmailVarBook => 'Livre';

  @override
  String get boEmailVarFile => 'Fichier';

  @override
  String get boEmailVarOther => 'Autre';

  @override
  String get boEmailTemplatePreview => 'Aperçu';

  @override
  String get boEmailTemplatePreviewNone =>
      'Envoyez un livre une fois pour voir l\'aperçu d\'un modèle avec lui.';

  @override
  String boEmailTemplateAttached(String name) {
    return 'Joint : $name';
  }

  @override
  String get boEmailTemplateBuiltIn =>
      'Intégré. Seul un admin peut le modifier.';

  @override
  String get boEmailTemplateKindleNote =>
      'Kindle n\'affiche jamais de modèle. Il reçoit toujours l\'objet « convert ».';

  @override
  String get boEmailTemplateDelete => 'Effacer le modèle';

  @override
  String get boEmailTemplateDeleteBody =>
      'Les appareils qui l\'utilisent reviennent à votre modèle par défaut.';

  @override
  String get boEmailTemplateRequired => 'Saisissez un nom et un objet';

  @override
  String get boEmailHistoryEmpty => 'Rien d\'envoyé pour l\'instant.';

  @override
  String get boEmailHistoryAll => 'Tout';

  @override
  String get boEmailHistoryEveryone => 'Tout le monde';

  @override
  String get boEmailStatusSent => 'Envoyé';

  @override
  String get boEmailStatusSending => 'Envoi en cours';

  @override
  String boEmailStatusRetrying(int attempt) {
    return 'Nouvelle tentative ($attempt)';
  }

  @override
  String get boEmailStatusFailed => 'Échec';

  @override
  String boEmailTo(String name) {
    return 'À $name';
  }

  @override
  String get boEmailResend => 'Renvoyer';

  @override
  String get boEmailResent => 'Renvoi en cours';

  @override
  String get boEmailForget => 'Retirer de l\'historique';

  @override
  String get boEmailLoadMore => 'Charger plus';

  @override
  String get boEmailUnknownBook => 'Livre effacé';

  @override
  String get boEmailSendNoServer =>
      'Aucun serveur de messagerie n\'est encore configuré sur ce serveur.';

  @override
  String get boEmailSendAskAdmin => 'Demandez à un admin d\'en ajouter un.';

  @override
  String get boEmailSendNoDevices =>
      'Ajoutez un appareil pour lui envoyer ce livre.';

  @override
  String get boEmailSendOptions => 'Options';

  @override
  String get boEmailSendFormatEach => 'Celui de chaque appareil';

  @override
  String get boEmailSendServer => 'Serveur de messagerie';

  @override
  String get boEmailSendButton => 'Envoyer';

  @override
  String boEmailSendGets(String format, String size) {
    return 'Reçoit $format · $size';
  }

  @override
  String boEmailSendMissing(String format, String got) {
    return 'Pas de $format, reçoit le $got';
  }

  @override
  String boEmailSendKindleRejects(String format) {
    return 'Kindle n\'accepte pas le $format par e-mail';
  }

  @override
  String boEmailSendOverKindle(String size) {
    return '$size, au-delà de la limite de 50 Mo de Kindle';
  }

  @override
  String boEmailSendOverGmail(String size) {
    return '$size, au-delà de la limite de 25 Mo de Gmail';
  }

  @override
  String boEmailSendNarrated(String size) {
    return 'Reçoit la copie narrée · $size';
  }

  @override
  String boEmailSendHanding(String server) {
    return 'Envoi via $server';
  }

  @override
  String boEmailSendAccepted(String server) {
    return 'Envoyé via $server';
  }

  @override
  String boEmailSendFailedLine(String error) {
    return 'Non envoyé : $error';
  }

  @override
  String get boEmailSendStillGoing =>
      'Envoi en cours. Vous recevrez une notification à la fin.';

  @override
  String get boEmailKindleOriginal =>
      'Un Kindle ne peut pas recevoir la copie narrée. Réglez-le sur texte seul.';

  @override
  String get boEmailNoCopy =>
      'Impossible de créer une copie sans la narration.';

  @override
  String get recentSearchesTitle => 'Recherches récentes';

  @override
  String get recentSearchesClear => 'Effacer';

  @override
  String get recentSearchesRemove => 'Retirer';

  @override
  String get removedSeriesTapToUndo =>
      'Retiré de Continuer la série. Appuyez pour annuler.';

  @override
  String get seriesBackOnContinueSeries => 'De retour dans Continuer la série';

  @override
  String get desktopShortcutPlayPause => 'Lecture / pause';

  @override
  String get desktopShortcutRewind => 'Reculer';

  @override
  String get desktopShortcutForward => 'Avance rapide';

  @override
  String get desktopShortcutSlower => 'Diminuer la vitesse de lecture';

  @override
  String get desktopShortcutFaster => 'Augmenter la vitesse de lecture';

  @override
  String get desktopShortcutNormalSpeed =>
      'Réinitialiser la vitesse de lecture';

  @override
  String get desktopShortcutSearch => 'Ouvrir la recherche';

  @override
  String get desktopShortcutLibrary => 'Ouvrir la bibliothèque';

  @override
  String get desktopShortcutNowPlaying => 'Ouvrir la lecture en cours';

  @override
  String get desktopShortcutFullScreen => 'Plein écran';

  @override
  String get desktopShortcutClosePlayer => 'Fermer le lecteur plein écran';

  @override
  String get desktopShortcutBack =>
      'Retour (ferme la page ou la feuille du dessus)';

  @override
  String get desktopShortcutRefresh => 'Actualiser la liste à l\'écran';

  @override
  String get desktopShortcutPreviousCard => 'Carte Lecture précédente';

  @override
  String get desktopShortcutNextCard => 'Carte Lecture suivante';

  @override
  String get desktopShortcutContextMenu => 'Ouvrir le menu d\'appui long';

  @override
  String get desktopShortcutMouseBack => 'Bouton retour de la souris';

  @override
  String get desktopShortcutRightClick => 'Clic droit';

  @override
  String get desktopShortcutDragShelves =>
      'Faire glisser les étagères et les cartes latéralement';

  @override
  String get desktopShortcutMouseDrag => 'Cliquer et faire glisser';

  @override
  String get fileHealthAction => 'Vérifier les fichiers';

  @override
  String get fileHealthTitle => 'Vérifier les fichiers';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Les $count fichiers semblent corrects',
      one: 'Le fichier semble correct',
      zero: 'Rien d\'anormal',
    );
    return '$_temp0';
  }

  @override
  String fileHealthProblems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count problèmes trouvés',
      one: '1 problème trouvé',
    );
    return '$_temp0';
  }

  @override
  String get fileHealthReadOnlyNote =>
      'Ceci lit uniquement ce que le serveur indique déjà. Rien n\'est modifié.';

  @override
  String get fileHealthLocalChecked =>
      'Les fichiers téléchargés sur cet appareil ont aussi été vérifiés.';

  @override
  String get fileHealthItemMissing => 'Dossier du livre manquant';

  @override
  String get fileHealthItemMissingInfo =>
      'Le serveur ne trouve plus le dossier de ce livre. Il a peut-être été déplacé, renommé ou effacé, ou son disque est hors ligne. Une analyse de la bibliothèque sur le serveur peut le retrouver.';

  @override
  String get fileHealthItemInvalid => 'Livre marqué comme invalide';

  @override
  String get fileHealthItemInvalidInfo =>
      'Le serveur n\'a trouvé aucun fichier audio ou ebook utilisable pour ce livre.';

  @override
  String get fileHealthInvalidFiles => 'Fichiers illisibles';

  @override
  String get fileHealthInvalidFilesInfo =>
      'Le serveur n\'a pas pu lire ces fichiers. Ils sont peut-être endommagés ou dans un format non pris en charge, et la lecture peut s\'arrêter ou les sauter.';

  @override
  String get fileHealthEmptyFiles => 'Fichiers sans durée';

  @override
  String get fileHealthEmptyFilesInfo =>
      'Ces fichiers indiquent une durée de zéro, il n\'y a donc rien à lire. Ils sont souvent vides ou tronqués.';

  @override
  String get fileHealthTrackGaps => 'Trous entre les fichiers';

  @override
  String get fileHealthTrackGapsInfo =>
      'La chronologie du livre saute en avant entre ces fichiers, laissant un passage où rien ne se lit.';

  @override
  String get fileHealthTrackOverlaps => 'Fichiers qui se chevauchent';

  @override
  String get fileHealthTrackOverlapsInfo =>
      'Ces fichiers se chevauchent dans la chronologie du livre, une partie de l\'un peut donc être sautée ou la position peut sauter.';

  @override
  String get fileHealthDurationMismatch => 'La durée ne concorde pas';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return 'Les fichiers totalisent $actual, mais le livre indique une durée de $expected. La progression et les chapitres peuvent être décalés. Une nouvelle analyse sur le serveur règle généralement le problème.';
  }

  @override
  String get fileHealthLowBitrate => 'Audio de faible qualité';

  @override
  String get fileHealthLowBitrateInfo =>
      'Ces fichiers sont encodés en dessous de 32 kbps et peuvent sonner étouffés.';

  @override
  String get fileHealthMixedSampleRates =>
      'Fréquences d\'échantillonnage mixtes';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      'Les fichiers ont été enregistrés à des fréquences d\'échantillonnage différentes. La plupart des lecteurs s\'en accommodent, mais certains peuvent faire des clics ou changer de vitesse à la jonction de deux fichiers.';

  @override
  String get fileHealthMixedChannels => 'Mono et stéréo mélangés';

  @override
  String get fileHealthMixedChannelsInfo =>
      'Certains fichiers n\'ont pas le même nombre de canaux que les autres, le son peut donc changer d\'un fichier à l\'autre.';

  @override
  String get fileHealthChaptersPastEnd => 'Chapitres après la fin';

  @override
  String get fileHealthChaptersPastEndInfo =>
      'Ces chapitres commencent ou finissent après la fin de l\'audio, y aller peut donc ne mener nulle part.';

  @override
  String get fileHealthLocalMissing => 'Fichiers téléchargés manquants';

  @override
  String get fileHealthLocalMissingInfo =>
      'Ces fichiers téléchargés ont disparu de cet appareil. La lecture hors ligne échouera à leur place.';

  @override
  String get fileHealthLocalSizeMismatch => 'Fichiers téléchargés différents';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      'Ces fichiers téléchargés n\'ont pas la même taille que les copies du serveur, ils sont peut-être incomplets ou endommagés.';

  @override
  String fileHealthStartsAt(String time) {
    return 'commence à $time';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return '$local ici, $server sur le serveur';
  }

  @override
  String fileHealthSampleRate(String value) {
    return '$value kHz';
  }

  @override
  String get fileHealthMono => 'Mono';

  @override
  String get fileHealthStereo => 'Stéréo';

  @override
  String get fileHealthRedownload => 'Retélécharger ce livre';

  @override
  String get fileHealthRedownloadQuestion => 'Retélécharger ce livre ?';

  @override
  String get fileHealthRedownloadInfo =>
      'La copie sur cet appareil est retirée puis téléchargée à nouveau depuis le serveur. Si le livre est en cours de lecture, il s\'arrête. Rien ne change sur le serveur.';

  @override
  String get fileHealthNotAvailableOffline =>
      'Connectez-vous à votre serveur pour retélécharger';

  @override
  String get playerReconnecting => 'Connexion perdue, reconnexion…';

  @override
  String get playerReconnectFailed =>
      'Impossible de se reconnecter au serveur, la lecture s\'est arrêtée.';

  @override
  String get downloadsFailed => 'Téléchargements échoués';

  @override
  String get absorbingReorderQueue => 'Réorganiser la file d\'attente';

  @override
  String get playAction => 'Lire';

  @override
  String get pauseAction => 'Pause';

  @override
  String get rmabImportBooks => 'Importer des livres';

  @override
  String get rmabImportBooksSubtitle =>
      'Rechercher dans ReadMeABook et choisir les livres à demander';

  @override
  String get rmabImportBooksConnectSubtitle =>
      'Connectez d\'abord ReadMeABook avec une URL et un jeton';

  @override
  String get windowsSettingsTitle => 'Paramètres Windows';

  @override
  String get updateCheckFrequency =>
      'Vérification automatique des mises à jour';

  @override
  String get updateCheckFrequencySubtitle =>
      'Ne fait que vérifier ; l\'installation reste toujours manuelle.';

  @override
  String get updateCheckOnStartup =>
      'Au démarrage (une fois toutes les 12 heures)';

  @override
  String get updateCheckEverySixHours => 'Toutes les 6 heures';

  @override
  String get updateCheckEveryTwelveHours => 'Toutes les 12 heures';

  @override
  String get updateCheckDaily => 'Tous les jours';

  @override
  String get updateCheckNever => 'Jamais automatiquement';

  @override
  String onLatestVersionDetail(String version) {
    return 'Vous avez la dernière version ($version)';
  }

  @override
  String get updateCheckFailed =>
      'Impossible de joindre GitHub pour vérifier les mises à jour. Vérifiez votre connexion et réessayez.';

  @override
  String get playlistDetailAddBooks =>
      'Ajouter des livres à la liste de lecture';

  @override
  String get playlistDetailSwitchToList => 'Passer à l\'affichage en liste';

  @override
  String get playlistDetailSwitchToGrid => 'Passer à l\'affichage en grille';

  @override
  String get adminUploadIndexing =>
      'Téléversement terminé ; en attente de l\'indexation par Audiobookshelf...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return '« $title » téléversé ; Audiobookshelf l\'indexe encore';
  }

  @override
  String get adminUploadPermissionDenied =>
      'Votre compte Audiobookshelf n\'a pas la permission de téléverser. Demandez à un administrateur du serveur d\'activer l\'accès au téléversement pour votre compte.';

  @override
  String get uiThemeLabel => 'Thème de l\'interface';

  @override
  String get uiThemePickerTitle => 'Choisissez un style';

  @override
  String get uiThemePickerIntro =>
      'Vous pouvez le changer à tout moment dans Paramètres > Apparence > Thème de l\'interface.';

  @override
  String get uiThemePlusName => 'Standard';

  @override
  String get uiThemePlusDescription =>
      'L\'apparence habituelle d\'Absorb Plus, avec des panneaux pleins et une douce lueur tirée des couleurs de vos couvertures.';

  @override
  String get uiThemeMidnightName => 'Minuit';

  @override
  String get uiThemeMidnightDescription =>
      'Noir pur avec de fins contours et sans lueur, conçu pour les écrans OLED.';

  @override
  String get uiThemeContinue => 'Continuer';

  @override
  String get uiThemeFrostedName => 'Givré';

  @override
  String get uiThemeFrostedDescription =>
      'Panneaux doux en verre dépoli, traversés par les couleurs de vos couvertures.';

  @override
  String get uiThemeColorTitle => 'Choisissez une couleur';

  @override
  String get uiThemeColorIntro =>
      'C\'est le même réglage que Paramètres > Apparence > Source des couleurs.';

  @override
  String get uiThemeColorFromCover => 'D\'après la couverture';

  @override
  String get uiThemeBack => 'Retour';

  @override
  String get uiThemeTryIt => 'Essayer';

  @override
  String uiThemePreviewing(String name) {
    return 'Aperçu de $name';
  }

  @override
  String get uiThemeKeep => 'Garder';

  @override
  String get uiThemeGoBack => 'Revenir';

  @override
  String get uiThemeGlass => 'Verre';

  @override
  String get uiThemeGlassLight => 'Léger';

  @override
  String get uiThemeGlassMedium => 'Moyen';

  @override
  String get uiThemeGlassStrong => 'Fort';

  @override
  String get uiThemeDetails => 'Détails du style';

  @override
  String get uiThemeFullCovers => 'Couvertures pleine qualité';

  @override
  String get uiThemeFullCoversSubtitle =>
      'Couvertures plus nettes qui utilisent plus de mémoire';

  @override
  String get uiThemeExtraBadges => 'Badges de couverture supplémentaires';

  @override
  String get uiThemeExtraBadgesSubtitle =>
      'Badge ebook et bandeau d\'enregistrement dans Continuer l\'écoute';

  @override
  String get uiThemeReadingShelf => 'Continuer la lecture en étagère';

  @override
  String get uiThemeReadingShelfSubtitle =>
      'Une étagère d\'accueil normale au lieu de grandes cartes';

  @override
  String get uiThemeCompactHeader => 'Boutons d\'en-tête compacts';

  @override
  String get uiThemeCompactHeaderSubtitle =>
      'Les boutons d\'en-tête de page gardent leur petite taille';

  @override
  String get uiThemePlainWording => 'Termes simples';

  @override
  String get uiThemePlainWordingOnSubtitle =>
      'Utilise « Lire », « En cours de lecture », « Fini »';

  @override
  String get uiThemePlainWordingOffSubtitle =>
      'Utilise « Absorb », « Lecture », « Entièrement absorbé »';

  @override
  String get uiThemeSearchClassic => 'Classique';

  @override
  String whatsNewSheetTitle(String name) {
    return 'Nouveautés de $name';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return 'Mis à jour depuis $name';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return 'build $number';
  }

  @override
  String get whatsNewFullNotes => 'Notes complètes sur GitHub';

  @override
  String get whatsNewLoading => 'Chargement des nouveautés';

  @override
  String get whatsNewLoadFailed => 'Impossible de charger les notes';

  @override
  String get whatsNewLoadFailedHint =>
      'Vérifiez votre connexion, ou lisez-les sur GitHub.';

  @override
  String get whatsNewOpenGitHub => 'Ouvrir sur GitHub';

  @override
  String get settingsSeeWhatsNew => 'Voir les nouveautés';

  @override
  String get settingsSeeWhatsNewSubtitle =>
      'Les notes de version de cette version';

  @override
  String get windowsCloseToTray => 'Fermer dans la zone de notification';

  @override
  String get windowsCloseToTraySubtitle =>
      'Fermer la fenêtre laisse Absorb Plus actif dans la zone de notification. Quittez depuis l\'icône.';

  @override
  String get windowsStartWithWindows => 'Démarrer avec Windows';

  @override
  String get windowsStartWithWindowsSubtitle =>
      'Ouvrir Absorb Plus à l\'ouverture de session Windows';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return 'Démarre : $command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return 'Une autre copie est réglée pour démarrer : $command. Activez pour utiliser cette copie à la place.';
  }

  @override
  String get windowsStartupDisabledBySystem =>
      'Désactivé dans les applications de démarrage du Gestionnaire des tâches. Réactivez-le là-bas.';

  @override
  String get windowsStartMinimized => 'Démarrer réduit';

  @override
  String get windowsStartMinimizedSubtitle =>
      'Au démarrage avec Windows, le garder dans la zone de notification (ou réduit si Fermer dans la zone de notification est désactivé)';

  @override
  String get windowsAlwaysOnTop => 'Toujours au premier plan';

  @override
  String get windowsAlwaysOnTopSubtitle =>
      'Garder la fenêtre au-dessus des autres';

  @override
  String get windowsKeepAwake =>
      'Garder le PC éveillé pendant la lecture ou le téléchargement';

  @override
  String get windowsKeepAwakeSubtitle =>
      'Empêche le PC de se mettre en veille. L\'écran peut quand même s\'éteindre.';

  @override
  String get windowsSettingFailed => 'Windows n\'a pas accepté ce changement';

  @override
  String get windowsGlobalHotkeys => 'Raccourcis globaux';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Fonctionnent quand Absorb Plus est en arrière-plan : Ctrl+Alt+Space lecture/pause, Ctrl+Alt+Left/Right reculer/avancer, Ctrl+Alt+Up/Down volume, Ctrl+Alt+B ajouter un signet';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return 'Pris par une autre application, indisponible : $keys';
  }

  @override
  String get windowsTrayShow => 'Afficher Absorb Plus';

  @override
  String get windowsTrayQuit => 'Quitter Absorb Plus';

  @override
  String get windowsTaskbarPlay => 'Lire';

  @override
  String get windowsTaskbarPause => 'Pause';

  @override
  String get windowsTaskbarRewind => 'Reculer';

  @override
  String get windowsTaskbarForward => 'Avancer';

  @override
  String windowsJumpListResume(String title) {
    return 'Reprendre $title';
  }

  @override
  String get githubProjectTitle => 'Absorb Plus sur GitHub';

  @override
  String get precacheTitle => 'Précharger les couvertures et pages de livres';

  @override
  String get precacheSubtitle =>
      'Les récupère en arrière-plan en Wi-Fi ou en réseau filaire, pour que les écrans s\'ouvrent instantanément. Utilise un peu d\'espace disque, pas de mémoire.';

  @override
  String get githubProjectSubtitle =>
      'Versions, code source et actualités du projet';

  @override
  String get supportSaveLogsSubtitle =>
      'Enregistrer le fichier journal à joindre à un ticket GitHub';

  @override
  String get supportSaveLogsDialogTitle =>
      'Enregistrer les journaux d\'Absorb Plus';

  @override
  String supportLogsSaved(String path) {
    return 'Journaux enregistrés dans $path';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return 'Impossible d\'enregistrer les journaux : $error';
  }

  @override
  String get supportOpenLogsFolder => 'Ouvrir le dossier des journaux';

  @override
  String get supportOpenLogsFolderSubtitle =>
      'Afficher le fichier journal dans votre gestionnaire de fichiers';

  @override
  String get supportOpenLogsFolderFailed =>
      'Impossible d\'ouvrir le dossier des journaux';

  @override
  String get desktopDownloadFolderOpen => 'Ouvrir dans l\'Explorateur';

  @override
  String get desktopDownloadFolderOpenLinux => 'Ouvrir le dossier';

  @override
  String get desktopDownloadFolderOpenFailed =>
      'Impossible d\'ouvrir le dossier';

  @override
  String get desktopDownloadFolderNotWritable =>
      'Absorb ne peut pas enregistrer de fichiers dans ce dossier. Choisissez-en un autre.';

  @override
  String get desktopDownloadFolderPickFailed =>
      'Impossible d\'afficher le sélecteur de dossier';

  @override
  String get desktopDownloadFolderNetworkPath =>
      'Les dossiers réseau (\\\\server\\share) ne peuvent pas contenir de téléchargements. Associez le partage à une lettre de lecteur dans l\'Explorateur de fichiers, comme Z:, et choisissez-la à la place.';

  @override
  String get desktopDownloadFolderDefault => 'Dossier par défaut';

  @override
  String get bookSettingsTitle => 'Paramètres du livre';

  @override
  String bookSettingsSeries(String name) {
    return 'Série : $name';
  }

  @override
  String get bookSettingsSpeed => 'Vitesse';

  @override
  String get bookSettingsSpeedFromSeries =>
      'Celle du dernier livre lu de cette série';

  @override
  String get bookSettingsSkipIntro => 'Passer l\'intro';

  @override
  String get bookSettingsSkipIntroHint =>
      'Seulement quand le livre démarre depuis le début';

  @override
  String get bookSettingsSkipOutro => 'Passer l\'outro';

  @override
  String get bookSettingsSkipOutroHint =>
      'Termine le livre plus tôt et le marque comme fini';

  @override
  String get bookSettingsSkipOff => 'Désactivé';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get bookSettingsWholeSeries => 'Appliquer à toute la série';

  @override
  String get bookSettingsWholeSeriesHint =>
      'L\'intro et l\'outro s\'appliquent à chaque livre de cette série';

  @override
  String get bookSettingsReset => 'Réinitialiser';

  @override
  String get bookSettingsResetDone => 'Paramètres du livre réinitialisés';

  @override
  String get adminDashTitle => 'Tableau de bord';

  @override
  String get adminDashSubtitle =>
      'Qui écoute, bibliothèques, utilisateurs et alertes du serveur d\'un coup d\'œil';

  @override
  String get adminDashNobodyListening => 'Personne n\'écoute en ce moment';

  @override
  String adminDashOnlineNames(String names) {
    return 'En ligne : $names';
  }

  @override
  String get adminDashListeningHistory => 'Historique d\'écoute';

  @override
  String get adminDashCouldNotLoad =>
      'Impossible de charger ceci depuis le serveur';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments',
      one: '1 élément',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => 'Tout analyser';

  @override
  String get adminDashScanAllTitle => 'Analyser toutes les bibliothèques ?';

  @override
  String get adminDashScanAllContent =>
      'Audiobookshelf recherchera les fichiers nouveaux, modifiés et manquants dans chaque bibliothèque. Cela peut prendre du temps pour les grandes bibliothèques.';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Analyse lancée pour $count bibliothèques',
      one: 'Analyse lancée pour 1 bibliothèque',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return '$failed analyses sur $total n\'ont pas pu démarrer';
  }

  @override
  String get adminDashNoLibraries => 'Aucune bibliothèque pour l\'instant';

  @override
  String get adminDashBackUpNow => 'Sauvegarder maintenant';

  @override
  String adminDashLastBackup(String time) {
    return 'Dernière sauvegarde $time';
  }

  @override
  String get adminDashNoBackups => 'Aucune sauvegarde pour l\'instant';

  @override
  String get adminDashManageUsers => 'Gérer les utilisateurs';

  @override
  String get adminDashNeverSeen => 'Jamais connecté';

  @override
  String get adminDashDisabled => 'Désactivé';

  @override
  String get adminDashLocked => 'Verrouillé';

  @override
  String get adminDashServerWarnings => 'Alertes du serveur';

  @override
  String get adminDashNoProblems =>
      'Aucun avertissement ni erreur dans le journal du jour';

  @override
  String get adminDashAllLogs => 'Tous les journaux du serveur';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale (intégré)';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => 'Raccourcis clavier';

  @override
  String get desktopShortcutsSubtitle =>
      'Commandes de lecture, de vitesse, de recherche et de navigation';

  @override
  String get desktopShortcutsClose => 'Fermer';

  @override
  String get tailscaleConnect => 'Se connecter avec Tailscale';

  @override
  String get tailscaleConnectHint =>
      'Ouvre la connexion Tailscale dans votre navigateur';

  @override
  String get tailscaleTurnOff => 'Désactiver';

  @override
  String get tailscaleCardPitch =>
      'Accédez à votre serveur sur votre tailnet sans activer le VPN Tailscale';

  @override
  String get tailscaleIntro =>
      'Accédez à un serveur de votre tailnet sans activer le VPN de l\'application Tailscale. Absorb rejoint votre tailnet comme appareil à part entière, pour ses propres connexions uniquement. Fonction de test, désactivée par défaut.';

  @override
  String get tailscaleUseSwitch => 'Utiliser Tailscale intégré';

  @override
  String get tailscaleStatusOff => 'Désactivé';

  @override
  String get tailscaleStatusStarting => 'Connexion…';

  @override
  String get tailscaleStatusNeedsLogin =>
      'Connectez-vous pour ajouter cet appareil à votre tailnet';

  @override
  String get tailscaleStatusNeedsApproval =>
      'En attente de l\'approbation de cet appareil par un administrateur';

  @override
  String tailscaleStatusConnected(String user) {
    return 'Connecté en tant que $user';
  }

  @override
  String get tailscaleStatusConnectedNoUser => 'Connecté';

  @override
  String tailscaleStatusError(String error) {
    return 'Problème : $error';
  }

  @override
  String get tailscaleNotIncluded => 'Non inclus dans cette version';

  @override
  String get tailscaleSignIn => 'Se connecter avec Tailscale';

  @override
  String get tailscaleSignInNoLink =>
      'Pas encore de lien de connexion. Réessayez dans un instant.';

  @override
  String get tailscaleToggleFailed =>
      'Impossible d\'activer ou de désactiver Tailscale intégré. Réessayez.';

  @override
  String get tailscaleSignOut => 'Se déconnecter de Tailscale';

  @override
  String tailscaleDeviceAddress(String address) {
    return 'Cet appareil : $address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return 'Votre serveur ($server) est joint via Tailscale.';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return 'Votre serveur ($server) n\'est pas une adresse de tailnet, il est donc joint comme d\'habitude. S\'il est sur votre tailnet, ajoutez son nom d\'hôte ci-dessous.';
  }

  @override
  String get tailscaleExtraHostsLabel => 'Autres noms d\'hôte du tailnet';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      'Les adresses en 100.64.0.0/10 et les noms se terminant par .ts.net ou par le nom MagicDNS de votre tailnet passent toujours par Tailscale. Séparez les noms par des virgules.';

  @override
  String playerChapterEndsAt(String time) {
    return 'Le chapitre se termine à $time';
  }

  @override
  String playerEndsAt(String time) {
    return 'Se termine à $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return 'Dernière lecture sur $device · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return 'Dernière lecture sur un autre appareil · $ago';
  }

  @override
  String get opmlExportAction => 'Exporter l\'OPML';

  @override
  String get opmlExportDialogTitle =>
      'Enregistrer les flux de podcasts en OPML';

  @override
  String opmlExportSaved(String path) {
    return 'OPML enregistré dans $path';
  }

  @override
  String get opmlExportDownloaded => 'OPML téléchargé';

  @override
  String get opmlExportFailed => 'Impossible d\'exporter le fichier OPML';

  @override
  String get bookCopySaveAction => 'Enregistrer une copie…';

  @override
  String get bookCopyDialogTitle => 'Enregistrer une copie de ce livre';

  @override
  String get bookCopySaving => 'Enregistrement d\'une copie…';

  @override
  String bookCopySaved(String path) {
    return 'Copie enregistrée dans $path';
  }

  @override
  String get bookCopyFailed =>
      'Impossible d\'enregistrer une copie de ce livre';

  @override
  String get exclusiveAudioTitle => 'Audio exclusif';

  @override
  String get exclusiveAudioSubtitle =>
      'Corrige les craquements ou les variations de volume en ignorant les effets sonores de Windows. Les autres applications sont coupées pendant la lecture d\'Absorb. Redémarrez Absorb pour appliquer.';

  @override
  String get exclusiveAudioFallback =>
      'Votre périphérique audio a refusé l\'audio exclusif, Absorb lit donc en mode normal';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return '$count nouveaux';
  }

  @override
  String seekUndoBackTo(String time) {
    return 'Retour à $time';
  }

  @override
  String get goToTime => 'Aller à un instant';

  @override
  String get goToTimeLabel => 'Durée';

  @override
  String get goToTimeHint => 'h:mm:ss, mm:ss ou minutes';

  @override
  String get goToTimeGo => 'Aller';

  @override
  String goToTimeLength(String time) {
    return 'Durée totale $time';
  }

  @override
  String get goToTimeInvalid => 'Saisissez un temps comme 1:23:45, 23:45 ou 90';

  @override
  String goToTimePastEnd(String time) {
    return 'C\'est après la fin ($time)';
  }

  @override
  String get desktopShortcutGoToTime =>
      'Aller à un instant dans le lecteur ouvert';

  @override
  String fellAsleepJumpBack(String time) {
    return 'Endormi vers $time · Revenir en arrière';
  }

  @override
  String get surpriseMe => 'Surprenez-moi';

  @override
  String get surpriseMeNoneLeft =>
      'Vous avez fini tous les livres de cette bibliothèque';

  @override
  String get surpriseMeFailed => 'Impossible de choisir un livre. Réessayez.';

  @override
  String get surpriseMeOffline =>
      'Surprenez-moi nécessite une connexion au serveur';

  @override
  String get surpriseMeBooksOnly =>
      'Surprenez-moi choisit des livres. Passez à une bibliothèque de livres.';

  @override
  String get autoDownloadNextInSeries =>
      'Télécharger automatiquement le livre suivant de la série';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      'Quand le livre en cours est lu à 80 % ou qu\'il reste moins d\'une heure. Respecte le réglage Wi-Fi uniquement.';

  @override
  String get emptyStateBrowseLibrary => 'Parcourir la bibliothèque';

  @override
  String get emptyStateClearSearch => 'Effacer la recherche';

  @override
  String get statsNoListeningYet => 'Aucune écoute pour l\'instant';

  @override
  String get desktopShortcutQuickSwitcher =>
      'Sélecteur rapide : trouver des livres ou aller n\'importe où';

  @override
  String get desktopShortcutHelp => 'Afficher les raccourcis clavier';

  @override
  String get quickSwitcherTooltip => 'Sélecteur rapide (Ctrl+K)';

  @override
  String get quickSwitcherHint =>
      'Rechercher dans cette bibliothèque ou saisir une commande';

  @override
  String get quickSwitcherNoResults => 'Aucun résultat';

  @override
  String get quickSwitcherGoHome => 'Aller à l\'Accueil';

  @override
  String get quickSwitcherGoLibrary => 'Aller à la Bibliothèque';

  @override
  String get quickSwitcherGoAbsorbing => 'Aller à Lecture';

  @override
  String get quickSwitcherGoStats => 'Aller aux Stats';

  @override
  String get quickSwitcherGoSettings => 'Aller aux Paramètres';

  @override
  String get quickSwitcherGoDownloads => 'Aller aux Téléchargements';

  @override
  String get quickSwitcherPlayPause => 'Lecture / pause';

  @override
  String get quickSwitcherSleepTimer => 'Minuteur de veille';

  @override
  String get quickSwitcherKeywordsAbsorbing =>
      'lecture en cours lecteur now playing player';

  @override
  String get quickSwitcherKeywordsSettings =>
      'préférences options paramètres preferences';

  @override
  String get quickSwitcherKeywordsDownloads =>
      'téléchargements hors ligne offline';

  @override
  String get quickSwitcherKeywordsPlayPause => 'lecture reprendre pause resume';

  @override
  String get quickSwitcherKeywordsSleepTimer => 'minuteur veille sommeil timer';

  @override
  String get quickSwitcherKeywordsShortcuts =>
      'raccourcis clavier touches aide keys help hotkeys keyboard';

  @override
  String get quickSwitcherKindAction => 'Action';

  @override
  String get quickSwitcherKindBook => 'Livre';

  @override
  String get quickSwitcherKindPodcast => 'Podcast';

  @override
  String get quickSwitcherKindSeries => 'Séries';

  @override
  String get quickSwitcherKindAuthor => 'Auteur';

  @override
  String get alphabetScrollerLabel => 'Aller à une lettre';

  @override
  String get stepperDecrease => 'Diminuer';

  @override
  String get stepperIncrease => 'Augmenter';

  @override
  String get statsStreakKeepGoing =>
      'Écoutez 5 minutes aujourd\'hui pour continuer sur votre lancée';

  @override
  String get statsStreakHowTo =>
      'Écoutez 5 minutes par jour pour construire une série';

  @override
  String get statsDailyGoalSheetTitle => 'Objectif d\'écoute quotidien';

  @override
  String get statsDailyGoalSheetBody =>
      'Un anneau sur la carte de série se remplit au fil de votre écoute aujourd\'hui.';

  @override
  String get statsDailyGoalSet => 'Définir un objectif quotidien';

  @override
  String get statsMonthListened => 'Écouté';

  @override
  String get statsMonthTime => 'Temps';

  @override
  String get statsMonthTopBook => 'Meilleur livre';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count résultats',
      one: '1 résultat',
      zero: 'Aucun résultat',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => 'Trier et grouper';

  @override
  String get bookmarksViewByBook => 'Par livre';

  @override
  String get bookmarksViewNewest => 'Plus récents d\'abord';

  @override
  String get bookmarksViewPosition => 'Par position';

  @override
  String get bookmarksExportAction => 'Exporter les signets';

  @override
  String get bookmarksExportDialogTitle =>
      'Enregistrer les signets en Markdown';

  @override
  String bookmarksExportSaved(String path) {
    return 'Signets enregistrés dans $path';
  }

  @override
  String get bookmarksExportDownloaded => 'Signets téléchargés';

  @override
  String get bookmarksExportFailed => 'Impossible d\'exporter les signets';

  @override
  String get chapterSearchHint =>
      'Rechercher un chapitre ou saisir un temps (1:23:00)';

  @override
  String get chapterSearchNoResults => 'Aucun chapitre correspondant';

  @override
  String get dropUploadNotAllowed =>
      'Votre compte ne peut pas téléverser vers ce serveur';

  @override
  String get dropUploadNothingUsable =>
      'Aucun des fichiers déposés ne peut être téléversé';

  @override
  String get dropUploadAlreadyOpen =>
      'Terminez ou fermez d\'abord le téléversement ouvert';

  @override
  String get remoteHostTitle => 'Contrôler depuis votre téléphone';

  @override
  String get remoteHostSubtitleOff =>
      'Utilisez votre téléphone comme télécommande d\'Absorb sur ce PC';

  @override
  String remoteHostSubtitleOn(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count téléphones connectés',
      one: '1 téléphone connecté',
      zero: 'aucun téléphone connecté',
    );
    return 'Activé · $_temp0';
  }

  @override
  String get remoteHostSheetBody =>
      'Utilisez votre téléphone comme télécommande de ce PC. L\'audio continue de jouer sur le PC, et votre téléphone affiche la lecture en cours avec les boutons. Votre téléphone et ce PC doivent être sur le même Wi-Fi.';

  @override
  String get remoteHostSwitch => 'Activer';

  @override
  String get remoteHostSwitchSubtitle =>
      'Windows peut demander d\'autoriser Absorb Plus dans le pare-feu la première fois. Autorisez-le.';

  @override
  String get remoteHostKeepOn => 'Garder activé au démarrage d\'Absorb';

  @override
  String get remoteHostKeepOnSubtitle =>
      'Si désactivé, il s\'éteint chaque fois que vous fermez Absorb.';

  @override
  String remoteHostPortsBusy(int first, int last) {
    return 'Démarrage impossible : les ports $first à $last sont tous utilisés.';
  }

  @override
  String get remoteHostPairTitle => 'Associer votre téléphone';

  @override
  String get remoteHostStep1 => '1. Activez-le ici.';

  @override
  String get remoteHostStep2 =>
      '2. Scannez le code avec l\'appareil photo de votre téléphone, ou ouvrez Absorb sur le téléphone et allez dans Paramètres > Contrôler votre ordinateur.';

  @override
  String get remoteHostStep3 =>
      '3. Saisissez le code sur le téléphone, puis choisissez Autoriser ici.';

  @override
  String get remoteHostCodeLabel => 'Code';

  @override
  String remoteHostCodeExpires(String time) {
    return 'Valable $time';
  }

  @override
  String get remoteHostPairFirst => 'Associer un téléphone';

  @override
  String get remoteHostPairAnother => 'Associer un autre appareil';

  @override
  String get remoteHostPairingClosed =>
      'L\'association est fermée. Touchez le bouton pour un nouveau code ; il est valable 2 minutes et pour un seul appareil.';

  @override
  String get remoteHostFull =>
      '5 appareils sont associés, le maximum autorisé. Oubliez-en un pour en associer un autre.';

  @override
  String remoteHostAddresses(String addresses) {
    return 'Adresse de ce PC : $addresses';
  }

  @override
  String get remoteHostNoAddress =>
      'Ce PC n\'a pas d\'adresse réseau pour le moment.';

  @override
  String get remoteHostNoDiscovery =>
      'Votre téléphone ne trouvera peut-être pas ce PC tout seul ; saisissez plutôt l\'adresse de ce PC sur le téléphone.';

  @override
  String get remoteHostConnectedTitle => 'Connectés actuellement';

  @override
  String get remoteHostPairedTitle => 'Appareils associés';

  @override
  String get remoteHostNoDevices => 'Aucun appareil associé pour l\'instant';

  @override
  String get remoteHostUnusedNote =>
      'Un appareil inutilisé pendant 90 jours est oublié.';

  @override
  String remoteHostLastUsed(String date) {
    return 'Dernière utilisation : $date';
  }

  @override
  String remoteHostConnectedFrom(String address, String time) {
    return '$address, connecté depuis $time';
  }

  @override
  String get remoteHostForget => 'Oublier';

  @override
  String get remoteHostForgetAll => 'Tout oublier';

  @override
  String get remoteHostForgetAllConfirm =>
      'Oublier tous les appareils associés ? Chacun devra être associé à nouveau pour contrôler ce PC.';

  @override
  String get remoteHostDisconnect => 'Déconnecter';

  @override
  String remoteHostAllowTitle(String name) {
    return 'Autoriser « $name » à contrôler Absorb sur ce PC ?';
  }

  @override
  String get remoteHostAllowBody =>
      'N\'autorisez qu\'un appareil que vous connaissez. Il peut lire, mettre en pause et changer ce qui est lu ici. Sans réponse, c\'est non.';

  @override
  String get remoteHostAllow => 'Autoriser';

  @override
  String get remoteHostDeny => 'Refuser';

  @override
  String get remoteControlAnother => 'Contrôler votre ordinateur';

  @override
  String get remoteControlAnotherSubtitle =>
      'Utilisez ce téléphone comme télécommande d\'Absorb sur votre PC';

  @override
  String get remoteConnectIntro =>
      'Utilisez ce téléphone comme télécommande d\'Absorb sur votre PC. L\'audio continue de jouer sur le PC. Votre téléphone et votre PC doivent être sur le même Wi-Fi. Sur le PC, ouvrez Paramètres > Contrôler depuis votre téléphone et activez-le.';

  @override
  String get remoteConnectSearching =>
      'Recherche d\'ordinateurs sur votre Wi-Fi…';

  @override
  String get remoteConnectNoneFound =>
      'Aucun ordinateur trouvé. Sur le PC, ouvrez Paramètres > Contrôler depuis votre téléphone et activez-le, ou saisissez son adresse.';

  @override
  String get remoteConnectSearchAgain => 'Rechercher à nouveau';

  @override
  String get remoteConnectPaired => 'Associé';

  @override
  String get remoteConnectFound => 'Sur votre Wi-Fi';

  @override
  String get remoteConnectEnterAddress => 'Saisir une adresse';

  @override
  String get remoteConnectAddressHint => '192.168.1.20:47390';

  @override
  String get remoteConnectAddressInvalid =>
      'Saisissez une adresse comme 192.168.1.20 ou 192.168.1.20:47390';

  @override
  String get remoteConnectNext => 'Suivant';

  @override
  String remoteConnectCodeTitle(String name) {
    return 'Association avec $name';
  }

  @override
  String get remoteConnectCodeHelp =>
      'Saisissez le code à 6 chiffres affiché sur le PC sous Contrôler depuis votre téléphone.';

  @override
  String get remoteConnectWaiting =>
      'Choisissez maintenant Autoriser sur le PC…';

  @override
  String get remoteConnectPair => 'Associer';

  @override
  String get remoteConnectForget => 'Oublier cet ordinateur';

  @override
  String get remotePairBadCode =>
      'Ce code est incorrect. Vérifiez sur le PC et réessayez.';

  @override
  String get remotePairExpired =>
      'Le code a expiré. Obtenez-en un nouveau sur le PC avec Associer un autre appareil.';

  @override
  String get remotePairClosed =>
      'L\'association n\'est pas ouverte sur le PC. Sur le PC, touchez Associer un autre appareil pour un nouveau code.';

  @override
  String get remotePairDenied =>
      'Le PC n\'a pas autorisé ce téléphone. Réessayez et choisissez Autoriser sur le PC.';

  @override
  String get remotePairTooManyDevices =>
      'Ce PC a déjà 5 appareils associés. Oubliez-en un sur le PC d\'abord.';

  @override
  String get remotePairTooMany =>
      'Trop de tentatives. Attendez une minute et réessayez.';

  @override
  String get remotePairUnreachable =>
      'Votre téléphone et votre PC ne sont pas sur le même Wi-Fi, ou le PC n\'a pas activé la fonction. Vérifiez les deux et réessayez.';

  @override
  String get remotePairFailed => 'L\'association a échoué. Réessayez.';

  @override
  String get remoteVersionMismatch =>
      'Mettez à jour Absorb Plus sur les deux appareils pour utiliser la télécommande.';

  @override
  String get remoteConnecting => 'Connexion…';

  @override
  String get remoteReconnecting => 'Reconnexion…';

  @override
  String get remoteUnreachableHint =>
      'Impossible de joindre le PC. Vérifiez qu\'il est allumé, qu\'Absorb est ouvert et que les deux sont sur le même Wi-Fi.';

  @override
  String remoteNothingPlaying(String name) {
    return 'Rien n\'est en lecture sur $name';
  }

  @override
  String get remoteNothingLoaded => 'Lancez d\'abord une lecture sur le PC.';

  @override
  String get remoteCommandFailed => 'Le PC n\'a pas pu faire cela.';

  @override
  String get remoteNotOnList => 'Ce livre ne figure plus dans la liste du PC.';

  @override
  String get remoteDisconnectedByHost => 'Le PC a déconnecté cet appareil.';

  @override
  String get remoteUnauthorized =>
      'Le PC ne reconnaît plus cet appareil. Associez-le à nouveau.';

  @override
  String get remotePairAgain => 'Associer à nouveau';

  @override
  String get remoteConnectAgain => 'Se reconnecter';

  @override
  String get remoteDisplayMode => 'Mode affichage';

  @override
  String get remoteDisplayExit => 'Touchez pour quitter le mode affichage';

  @override
  String get remotePlay => 'Lire';

  @override
  String get remotePause => 'Pause';

  @override
  String get remoteStop => 'Stop';

  @override
  String get remotePreviousChapter => 'Chapitre précédent';

  @override
  String get remoteNextChapter => 'Chapitre suivant';

  @override
  String remoteSkipBack(int seconds) {
    return 'Reculer de $seconds secondes';
  }

  @override
  String remoteSkipForward(int seconds) {
    return 'Avancer de $seconds secondes';
  }

  @override
  String get remoteSpeed => 'Vitesse';

  @override
  String get remoteSpeedSlower => 'Plus lent';

  @override
  String get remoteSpeedFaster => 'Plus rapide';

  @override
  String get remoteSleepTimer => 'Minuteur de veille';

  @override
  String remoteSleepMinutes(int minutes) {
    return '$minutes minutes';
  }

  @override
  String get remoteSleepEndOfChapter => 'Fin du chapitre';

  @override
  String get remoteSleepEndOfEpisode => 'Fin de l\'épisode';

  @override
  String remoteSleepChapters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapitres',
      one: '1 chapitre',
    );
    return '$_temp0';
  }

  @override
  String get remoteSleepCancel => 'Désactiver le minuteur de veille';

  @override
  String get remoteVolume => 'Volume';

  @override
  String get remoteMute => 'Couper le son';

  @override
  String get remoteUnmute => 'Rétablir le son';

  @override
  String get remoteChapters => 'Chapitres';

  @override
  String get remoteBookmark => 'Signet';

  @override
  String get remoteBookmarkTitle => 'Ajouter un signet ici';

  @override
  String get remoteBookmarkNoteHint => 'Note (facultatif)';

  @override
  String get remoteBookmarkAdd => 'Ajouter';

  @override
  String get remoteBookmarkAdded => 'Signet ajouté sur le PC';

  @override
  String get remoteContinueListening => 'Continuer l\'écoute';

  @override
  String get remoteContinueEmpty => 'Rien en cours sur le PC.';

  @override
  String remoteTimeLeft(String time) {
    return '$time restant';
  }

  @override
  String remoteChapterTimeLeft(String time) {
    return '$time restant dans le chapitre';
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
  String get remoteCustomize => 'Personnaliser';

  @override
  String get remoteCustomizeTitle => 'Personnaliser la télécommande';

  @override
  String get remoteCustomizeHintPortrait =>
      'Modification de la disposition portrait. Faites glisser un bloc par sa poignée, ou maintenez-le, pour le déplacer. Tournez le téléphone pour modifier le paysage.';

  @override
  String get remoteCustomizeHintLandscape =>
      'Modification de la disposition paysage. Faites glisser les blocs dans une colonne ou d\'une colonne à l\'autre. Tournez le téléphone pour modifier le portrait.';

  @override
  String get remoteCustomizeReset => 'Rétablir par défaut';

  @override
  String get remoteCustomizePresets => 'Préréglages';

  @override
  String get remoteCustomizeAddTitle => 'Ajouter à l\'écran';

  @override
  String get remoteCustomizeDropHere => 'Déposez les blocs ici';

  @override
  String get remoteCustomizeMove => 'Faire glisser pour déplacer';

  @override
  String get remoteCustomizeEmpty =>
      'Rien sur cet écran. Touchez Personnaliser pour ajouter des commandes.';

  @override
  String get remotePresetDefault => 'Par défaut';

  @override
  String get remotePresetMinimal => 'Minimal';

  @override
  String get remotePresetNightstand => 'Table de chevet';

  @override
  String get remotePresetFull => 'Complet';

  @override
  String get remoteBlockCover => 'Couverture';

  @override
  String get remoteBlockTitle => 'Titre et auteur';

  @override
  String get remoteBlockChapterTitle => 'Titre du chapitre';

  @override
  String get remoteBlockProgress => 'Barre de progression';

  @override
  String get remoteBlockTimeLeft => 'Temps restant';

  @override
  String get remoteBlockTransport => 'Boutons de lecture';

  @override
  String get remoteBlockClock => 'Horloge';

  @override
  String get remoteBlockSpacer => 'Espace';

  @override
  String get remoteSizeSmall => 'Petit';

  @override
  String get remoteSizeMedium => 'Moyen';

  @override
  String get remoteSizeLarge => 'Grand';

  @override
  String get remoteSizeCompact => 'Compact';

  @override
  String get remoteSizeNormal => 'Normal';

  @override
  String get remoteDisplayBackground => 'Arrière-plan';

  @override
  String get remoteDisplayBackgroundTheme => 'Thème';

  @override
  String get remoteDisplayBackgroundCover => 'Couverture floutée';

  @override
  String get remoteDisplayBackgroundBlack => 'Noir';

  @override
  String get remoteDisplayTextSize => 'Taille du texte';

  @override
  String get remoteDisplayTextHuge => 'Énorme';

  @override
  String get remoteDisplayShowClock => 'Afficher l\'horloge';

  @override
  String get remoteDisplay24Hour => 'Horloge 24 heures';

  @override
  String get remoteDisplayDim => 'Assombrir l\'écran après';

  @override
  String get remoteDisplayDimNever => 'Jamais';

  @override
  String get quickSwitcherKeywordsRemote =>
      'télécommande téléphone contrôle pc associer remote phone control pair link';

  @override
  String get quickSwitcherKeywordsSurprise =>
      'aléatoire hasard surprise random pick shuffle';

  @override
  String get developerModeOn => 'Mode développeur activé';

  @override
  String get developerModeAlreadyOn => 'Le mode développeur est déjà activé';

  @override
  String get developerTitle => 'Développeur';

  @override
  String get developerSubtitle => 'Versions de test et outils de développement';

  @override
  String get developerModeSwitch => 'Mode développeur';

  @override
  String get developerModeSwitchSubtitle =>
      'Le désactiver masque cette page. Touchez 7 fois la version pour la faire revenir.';

  @override
  String get testChannelTitle => 'Canal de test';

  @override
  String get testChannelSubtitle => 'Installer la dernière version de test';

  @override
  String get testChannelUnavailable =>
      'Les versions de test ne concernent que la version Android de GitHub.';

  @override
  String get testChannelCodeLabel => 'Code du canal de test';

  @override
  String get testChannelUnlock => 'Déverrouiller';

  @override
  String get testChannelUnlocked => 'Canal de test déverrouillé';

  @override
  String get testChannelWrongCode => 'Ce code est incorrect';

  @override
  String get testChannelLaunchCheck =>
      'Rechercher des versions de test au lancement';

  @override
  String get testChannelLaunchCheckSubtitle =>
      'Propose d\'installer une version de test plus récente au démarrage de l\'app';

  @override
  String get testChannelWarning =>
      'Les versions de test sont inachevées et peuvent poser problème. Elles remplacent l\'app installée et conservent vos données.';

  @override
  String testChannelInstalled(String version) {
    return 'Installée : $version';
  }

  @override
  String testChannelNewest(String version) {
    return 'Dernière version de test : $version';
  }

  @override
  String get testChannelNone => 'Aucune version de test disponible';

  @override
  String get testChannelUpToDate => 'À jour';

  @override
  String get testChannelInstall => 'Installer';

  @override
  String get testChannelCheckNow => 'Vérifier maintenant';

  @override
  String get testChannelNotes => 'Contenu';

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
  String get testBuildAvailable => 'Version de test disponible';

  @override
  String testBuildDialogContent(String latest, String current) {
    return 'La version de test $latest est disponible.\n\nVous utilisez la $current.';
  }

  @override
  String testBuildPackageLabel(int build) {
    return 'Version de test $build';
  }

  @override
  String get githubSignIn => 'Se connecter avec GitHub';

  @override
  String get githubSignInSubtitle =>
      'Les versions de test sont privées : connectez-vous pour les obtenir';

  @override
  String get githubSignInNotSetUp =>
      'La connexion GitHub n\'est pas encore configurée dans cette version';

  @override
  String get githubSignInAgain => 'Se reconnecter';

  @override
  String get githubSignInExpired => 'Votre connexion GitHub a expiré';

  @override
  String githubSignedInAs(String login) {
    return 'Connecté à GitHub en tant que $login';
  }

  @override
  String get githubSignedIn => 'Connecté à GitHub';

  @override
  String get githubSignOut => 'Se déconnecter';

  @override
  String get githubSignInEnterCode => 'Saisissez ce code sur GitHub :';

  @override
  String get githubSignInOpen => 'Ouvrir github.com/login/device';

  @override
  String get githubSignInCopyCode => 'Copier le code';

  @override
  String get githubSignInCodeCopied => 'Code copié';

  @override
  String get githubSignInWaiting =>
      'En attente de votre approbation sur GitHub...';

  @override
  String get githubSignInDenied => 'La connexion a été annulée sur GitHub.';

  @override
  String get githubSignInCodeExpired => 'Le code a expiré. Réessayez.';

  @override
  String get githubSignInFailed =>
      'Impossible de se connecter à GitHub. Réessayez.';

  @override
  String get githubSignInTryAgain => 'Réessayer';

  @override
  String get testChannelSignInNeeded =>
      'Connectez-vous avec GitHub pour obtenir les versions de test';

  @override
  String get downloadEtaUnderMinute => '< 1 min restante';

  @override
  String downloadEtaMinutes(int minutes) {
    return '$minutes min restantes';
  }

  @override
  String downloadEtaHours(int hours) {
    return '$hours h restantes';
  }

  @override
  String downloadEtaHoursMinutes(int hours, int minutes) {
    return '$hours h $minutes min restantes';
  }

  @override
  String get sameSpeedAllBooksTitle => 'Même vitesse pour tous les livres';

  @override
  String get sameSpeedAllBooksSubtitle =>
      'Tous les livres sont lus à la vitesse par défaut, et changer la vitesse dans le lecteur la change pour tous. Désactivé : chaque livre (ou sa série) garde sa propre vitesse.';
}
