// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'A B O R B';

  @override
  String get online => 'En línea';

  @override
  String get offline => 'Sin conexión';

  @override
  String get stillOffline => 'Aún sin conexión. Toca para intentarlo de nuevo.';

  @override
  String get retry => 'Reintentar';

  @override
  String get listsNone => 'No hay colecciones ni listas de reproducción';

  @override
  String get listsNoneHint =>
      'Las colecciones y listas de reproducción se crean en tu servidor Audiobookshelf y aparecen aquí.';

  @override
  String get listsLoadFailed => 'No se pudieron cargar tus listas';

  @override
  String get listsLoadFailedHint =>
      'Absorb no pudo conectar con tu servidor para obtener las colecciones y listas de reproducción.';

  @override
  String get listsNoneBookOrbit => 'No hay colecciones ni Smart Scopes';

  @override
  String get listsNoneHintBookOrbit =>
      'Las colecciones y los Smart Scopes se crean en tu servidor BookOrbit y aparecen aquí.';

  @override
  String get listsLoadFailedHintBookOrbit =>
      'Absorb no pudo conectar con tu servidor para obtener las colecciones y los Smart Scopes.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Borrar';

  @override
  String get remove => 'Eliminar';

  @override
  String get save => 'Guardar';

  @override
  String get done => 'Completado';

  @override
  String get edit => 'Editar';

  @override
  String get search => 'Buscar';

  @override
  String get apply => 'Aplicar';

  @override
  String get enable => 'Activar';

  @override
  String get clear => 'Limpiar';

  @override
  String get off => 'Apagado';

  @override
  String get disabled => 'Desactivado';

  @override
  String get later => 'Después';

  @override
  String get whatsNewTitle => 'Absorb se ha actualizado';

  @override
  String whatsNewContent(String version) {
    return 'Ahora tienes la versión $version.';
  }

  @override
  String get whatsNewButton => 'Ver las novedades';

  @override
  String get whatsNewKeepShowing => 'Mostrar esto tras cada actualización';

  @override
  String get whatsNewKeepShowingHint => 'Puedes volver a activarlo en Ajustes';

  @override
  String get settingsWhatsNew => 'Mostrar las novedades tras actualizar';

  @override
  String get settingsWhatsNewSubtitle =>
      'Tras una actualización, muestra las novedades en la app';

  @override
  String get gotIt => 'Entendido';

  @override
  String get betaLoggingTitle => 'Los registros están activados';

  @override
  String get betaLoggingContent =>
      'Como esta es una versión beta, Absorb ahora guarda registros para ayudar a localizar problemas. Permanecen en este dispositivo a menos que los compartas.\n\nPuedes enviarlos o desactivarlos en Ajustes, en Problemas y soporte. Si los desactivas, las próximas betas los mantendrán desactivados.';

  @override
  String get preview => 'Vista previa';

  @override
  String get or => 'o';

  @override
  String get file => 'Archivo';

  @override
  String get more => 'Más';

  @override
  String get unknown => 'Desconocido';

  @override
  String get untitled => 'Sin título';

  @override
  String get noThanks => 'No, gracias';

  @override
  String get stay => 'Permanecer';

  @override
  String get homeTitle => 'Inicio';

  @override
  String get continueListening => 'Continuar escuchando';

  @override
  String get continueReading => 'Continuar leyendo';

  @override
  String get continueSeries => 'Continuar Serie';

  @override
  String get recentlyAdded => 'Agregado recientemente';

  @override
  String get listenAgain => 'Volver a escuchar';

  @override
  String get discover => 'Descubrir';

  @override
  String get newEpisodes => 'Nuevos Episodios';

  @override
  String get downloads => 'Descargas';

  @override
  String get noDownloadedBooks => 'No hay libros descargados';

  @override
  String get yourLibraryIsEmpty => 'Tu biblioteca está vacía';

  @override
  String get downloadBooksWhileOnline =>
      'Descargar libros mientras estás conectado para escuchar sin conexión';

  @override
  String get customizeHome => 'Personalizar inicio';

  @override
  String get dragToReorderTapEye =>
      'Arrastra para reordenar, toca el ojo para mostrar/ocultar';

  @override
  String get loginTagline => 'Empieza a absorber';

  @override
  String get loginConnectToServer => 'Conectar a tu servidor';

  @override
  String get loginServerAddress => 'Dirección del servidor';

  @override
  String get loginServerHint => 'mi.servidor.com';

  @override
  String get loginServerHelper =>
      'IP con un puerto funciona también (por ejemplo, 192.168.1.5:13378)';

  @override
  String get loginCouldNotReachServer => 'No se pudo acceder al servidor';

  @override
  String get loginAdvanced => 'Avanzado';

  @override
  String get loginCustomHttpHeaders => 'Encabezados HTTP personalizados';

  @override
  String get loginCustomHeadersDescription =>
      'Para túneles de Cloudflare o proxies inversos que requieren encabezados extra. Agrega encabezados antes de ingresar la URL de su servidor.';

  @override
  String get loginHeaderName => 'Nombre del encabezado';

  @override
  String get loginHeaderValue => 'Valor';

  @override
  String get loginAddHeader => 'Añadir encabezado';

  @override
  String get loginSelfSignedCertificates => 'Certificados autofirmados';

  @override
  String get loginTrustAllCertificates =>
      'Confiar en todos los certificados (para configuraciones autofirmadas o con CA propia)';

  @override
  String get loginApiKey => 'Clave de API';

  @override
  String get loginApiKeyDescription =>
      'Usa una clave de API generada por un administrador en lugar de usuario y contraseña. Útil cuando falla la renovación del token de tu cuenta.';

  @override
  String get loginWaitingForSso => 'Esperando SSO...';

  @override
  String get loginRedirectUri => 'URI de redirección: absorb://oauth';

  @override
  String get loginOrSignInManually => 'o inicia sesión manualmente';

  @override
  String get loginUsername => 'Usuario';

  @override
  String get loginUsernameRequired => 'Introduce tu usuario';

  @override
  String get loginPassword => 'Contraseña';

  @override
  String get loginSignIn => 'Iniciar sesión';

  @override
  String loginSignInAs(String username) {
    return '¿Iniciar sesión como $username?';
  }

  @override
  String get loginSignInToServer => '¿Iniciar sesión en este servidor?';

  @override
  String loginSignedInAs(String username) {
    return 'Sesión iniciada como $username';
  }

  @override
  String get adminCreateSetupFile => 'Compartir inicio de sesión';

  @override
  String adminSetupFileDescription(String username) {
    return 'Crea un enlace de inicio de sesión privado para $username que solo funciona en la app Absorb.';
  }

  @override
  String get adminSetupFileServerUrl =>
      'URL del servidor que usará el nuevo usuario';

  @override
  String get adminSetupFileNoteWithHeaders =>
      'Se incluirán una clave de API exclusiva y tus encabezados personalizados para que pueda llegar al servidor. Trata el enlace como una contraseña.';

  @override
  String get adminSetupFileNote =>
      'Se incluirá una clave de API exclusiva. Trata el enlace como una contraseña.';

  @override
  String get adminSetupFileCreate => 'Crear enlace';

  @override
  String get adminSetupFileSaveTitle => 'Guardar archivo de configuración';

  @override
  String get adminSetupFileKeyError =>
      'No se pudo crear una clave de API para este usuario';

  @override
  String adminSetupFileSaved(String username) {
    return 'Archivo de configuración de $username guardado';
  }

  @override
  String adminSetupFileFailed(String error) {
    return 'No se pudo crear el inicio de sesión: $error';
  }

  @override
  String get setupLinkShareTitle => 'Compartir inicio de sesión';

  @override
  String setupLinkShareDescription(String username) {
    return 'Envía este enlace privado o pídele que escanee el código QR para iniciar sesión como $username.';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return 'Cualquiera con este enlace puede iniciar sesión como $username. Trátalo como una contraseña.';
  }

  @override
  String get setupLinkShare => 'Compartir enlace';

  @override
  String get setupLinkCopy => 'Copiar enlace';

  @override
  String get setupLinkCopied => 'Enlace de inicio de sesión copiado';

  @override
  String get setupLinkSaveFile => 'Guardar archivo de configuración';

  @override
  String get setupLinkQrError =>
      'Este enlace de configuración es demasiado grande para un código QR. Comparte el enlace en su lugar.';

  @override
  String setupLinkShareSubject(String username) {
    return 'Inicio de sesión de Absorb para $username';
  }

  @override
  String get setupLinkConfirmTitle => '¿Iniciar sesión con este enlace?';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return '¿Iniciar sesión en $server como $username? Continúa solo si confías en quien te envió este enlace.';
  }

  @override
  String get setupLinkInvalid =>
      'Este enlace de inicio de sesión no es válido o está incompleto';

  @override
  String get setupLinkSigningIn =>
      'Comprobando el enlace de inicio de sesión...';

  @override
  String get loginPlayDownloads => 'Reproducir tus descargas';

  @override
  String signedOutDownloadsNote(String username) {
    return 'Has cerrado sesión. Todo lo que escuches aquí se sincronizará con $username cuando vuelvas a iniciar sesión.';
  }

  @override
  String get loginPasteLink => 'Pegar enlace de inicio de sesión';

  @override
  String get loginPasteLinkHelp =>
      'Pega el enlace de inicio de sesión completo que recibiste. Trátalo como una contraseña.';

  @override
  String get loginFailed => 'Error al iniciar sesión';

  @override
  String get loginSsoFailed => 'El inicio de sesión con SSO falló o se canceló';

  @override
  String get loginSsoAuthFailed =>
      'Falló la autenticación SSO. Inténtalo de nuevo.';

  @override
  String get loginRestoreFromBackup => 'Importar';

  @override
  String get loginInvalidBackupFile =>
      'Archivo de copia de seguridad no válido';

  @override
  String get loginRestoreBackupTitle => '¿Restaurar copia de seguridad?';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return 'Se restaurarán todos los ajustes y $count cuenta(s) guardada(s). Iniciarás sesión automáticamente.';
  }

  @override
  String get loginRestoreBackupNoAccounts =>
      'Se restaurarán todos los ajustes. Esta copia de seguridad no incluye cuentas.';

  @override
  String get loginRestore => 'Restaurar';

  @override
  String loginRestoredAndSignedIn(String username) {
    return 'Ajustes restaurados y sesión iniciada como $username';
  }

  @override
  String get loginSessionExpired =>
      'Ajustes restaurados. La sesión ha caducado: inicia sesión para continuar.';

  @override
  String get loginSettingsRestored => 'Ajustes restaurados';

  @override
  String loginRestoreFailed(String error) {
    return 'Error al restaurar: $error';
  }

  @override
  String get loginSavedAccounts => 'cuentas guardadas';

  @override
  String get libraryTitle => 'Biblioteca';

  @override
  String get librarySearchBooksHint =>
      'Buscar libros, series, autores, narradores...';

  @override
  String get librarySearchShowsHint => 'Buscar programas y episodios...';

  @override
  String get libraryTabLibrary => 'Biblioteca';

  @override
  String get libraryTabSeries => 'Series';

  @override
  String get libraryTabAuthors => 'Autores';

  @override
  String get libraryTabNarrators => 'Narradores';

  @override
  String get libraryNoBooks => 'No se encontraron libros';

  @override
  String get libraryNoUnfinishedBooks => 'No hay libros sin terminar';

  @override
  String get libraryNoBooksInProgress => 'No hay libros en curso';

  @override
  String get libraryNoFinishedBooks => 'No hay libros terminados';

  @override
  String get libraryAllBooksStarted => 'Todos los libros se han empezado';

  @override
  String get libraryNoDownloadedBooks => 'No hay libros descargados';

  @override
  String get libraryNoSeriesFound => 'No se encontraron series';

  @override
  String get libraryNoBooksWithEbooks => 'No hay libros con libro electrónico';

  @override
  String get libraryNoBooksMissingMetadata =>
      'Ningún libro carece de estos metadatos';

  @override
  String get libraryNoItemsMatchingFilter =>
      'Ningún elemento coincide con este filtro';

  @override
  String libraryNoBooksInGenre(String genre) {
    return 'No hay libros en \"$genre\"';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return 'No hay libros con la etiqueta \"$tag\"';
  }

  @override
  String get libraryClearFilter => 'Borrar filtro';

  @override
  String get libraryNoAuthorsFound => 'No se encontraron autores';

  @override
  String get libraryNoNarratorsFound => 'No se encontraron narradores';

  @override
  String get libraryNoResults => 'No se encontraron resultados';

  @override
  String get librarySearchBooks => 'Libros';

  @override
  String get librarySearchShows => 'Programas';

  @override
  String get librarySearchEpisodes => 'Episodios';

  @override
  String get librarySearchSeries => 'Series';

  @override
  String get librarySearchAuthors => 'Autores';

  @override
  String get librarySearchTags => 'Etiquetas';

  @override
  String get librarySearchGenres => 'Géneros';

  @override
  String librarySeriesCount(int count) {
    return '$count series';
  }

  @override
  String libraryAuthorsCount(int count) {
    return '$count autores';
  }

  @override
  String libraryNarratorsCount(int count) {
    return '$count narradores';
  }

  @override
  String libraryBooksCount(int loaded, int total) {
    return '$loaded/$total libros';
  }

  @override
  String get sort => 'Ordenar';

  @override
  String get filter => 'Filtrar';

  @override
  String get filterActive => 'Filtro ●';

  @override
  String get name => 'Nombre';

  @override
  String get title => 'Título';

  @override
  String get author => 'Autor';

  @override
  String get dateAdded => 'Fecha de incorporación';

  @override
  String get numberOfBooks => 'Número de libros';

  @override
  String get sortTotalDuration => 'Duración total';

  @override
  String get sortLastBookAdded => 'Último libro añadido';

  @override
  String get sortLastBookUpdated => 'Último libro actualizado';

  @override
  String get publishedYear => 'Año de publicación';

  @override
  String get duration => 'Duración';

  @override
  String get random => 'Aleatorio';

  @override
  String get collapseSeries => 'Agrupar series';

  @override
  String get notFinished => 'Sin terminar';

  @override
  String get inProgress => 'En curso';

  @override
  String get filterFinished => 'Terminado';

  @override
  String get notStarted => 'Sin empezar';

  @override
  String get downloaded => 'Descargado';

  @override
  String get hasEbook => 'Con libro electrónico';

  @override
  String get noEbook => 'Sin libro electrónico';

  @override
  String get hasSupplementaryEbook => 'Con libro electrónico complementario';

  @override
  String get noSupplementaryEbook => 'Sin libro electrónico complementario';

  @override
  String get noSeries => 'Sin serie';

  @override
  String get publishedDecade => 'Década de publicación';

  @override
  String get tracks => 'Pistas';

  @override
  String get noTracks => 'Sin pistas';

  @override
  String get singleTrack => 'Una sola pista';

  @override
  String get multipleTracks => 'Varias pistas';

  @override
  String get abridged => 'Abreviado';

  @override
  String get issues => 'Problemas';

  @override
  String get rssFeedOpen => 'Feed RSS abierto';

  @override
  String get explicitContent => 'Explícito';

  @override
  String get missingMetadata => 'Metadatos ausentes';

  @override
  String get genre => 'Género';

  @override
  String get tag => 'Etiqueta';

  @override
  String get clearFilter => 'Borrar filtro';

  @override
  String get noGenresFound => 'No se encontraron géneros';

  @override
  String get noTagsFound => 'No se encontraron etiquetas';

  @override
  String get asc => 'ASC';

  @override
  String get desc => 'DESC';

  @override
  String get fileSize => 'Tamaño del archivo';

  @override
  String get lastUpdated => 'Última actualización';

  @override
  String get fileCreated => 'Archivo creado';

  @override
  String get lastModified => 'Última modificación';

  @override
  String get authorFirstLast => 'Autor (Nombre Apellido)';

  @override
  String get authorLastFirst => 'Autor (Apellido, Nombre)';

  @override
  String get progressSort => 'Progreso';

  @override
  String get dateStarted => 'Fecha de inicio';

  @override
  String get dateFinished => 'Fecha de finalización';

  @override
  String get episodeCount => 'Número de episodios';

  @override
  String get sequence => 'Orden en la serie';

  @override
  String get absorbingTitle => 'Absorbing';

  @override
  String get absorbingStop => 'Detener';

  @override
  String get absorbingManageQueue => 'Gestionar cola';

  @override
  String get absorbingDone => 'Completado';

  @override
  String get absorbingNoDownloadedEpisodes => 'No hay episodios descargados';

  @override
  String get absorbingNoDownloadedBooks => 'No hay libros descargados';

  @override
  String get absorbingNothingPlayingYet => 'Aún no se reproduce nada';

  @override
  String get absorbingNothingAbsorbingYet => 'Aún no hay nada en Absorbing';

  @override
  String get absorbingDownloadEpisodesToListen =>
      'Descarga episodios para escuchar sin conexión';

  @override
  String get absorbingDownloadBooksToListen =>
      'Descarga libros para escuchar sin conexión';

  @override
  String get absorbingStartEpisodeFromShows =>
      'Empieza un episodio desde la pestaña Programas';

  @override
  String get absorbingStartBookFromLibrary =>
      'Empieza un libro desde la pestaña Biblioteca';

  @override
  String get carModeTitle => 'Modo coche';

  @override
  String get carModeNoBookLoaded => 'Ningún libro cargado';

  @override
  String get carModeBookLabel => 'Libro';

  @override
  String get carModeChapterLabel => 'Capítulo';

  @override
  String get carModeBookmarkDefault => 'Marcador';

  @override
  String get carModeBookmarkAdded => 'Marcador añadido';

  @override
  String get downloadsTitle => 'Descargas';

  @override
  String get downloadsCancelSelection => 'Cancelar selección';

  @override
  String get downloadsSelect => 'Seleccionar';

  @override
  String get downloadsNoDownloads => 'No hay descargas';

  @override
  String get downloadsDownloading => 'Descargando';

  @override
  String get downloadsQueued => 'En cola';

  @override
  String get downloadsCompleted => 'Completadas';

  @override
  String get downloadsEbooks => 'Libros electrónicos';

  @override
  String get downloadsWaiting => 'Esperando...';

  @override
  String get downloadsCancel => 'Cancelar';

  @override
  String get downloadsDelete => 'Borrar';

  @override
  String downloadsDeleteCount(int count) {
    return '¿Borrar $count descarga(s)?';
  }

  @override
  String get downloadsDeleteContent =>
      'Los archivos descargados se eliminarán de este dispositivo.';

  @override
  String downloadsDeletedCount(int count) {
    return '$count descarga(s) borrada(s)';
  }

  @override
  String get downloadsRemoveTitle => '¿Eliminar descarga?';

  @override
  String downloadsRemoveContent(String title) {
    return '¿Borrar \"$title\" de este dispositivo?';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return '\"$title\" eliminado';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return 'No se pudo descargar \"$title\": uno de sus archivos no está en el servidor. Un análisis de la biblioteca puede solucionarlo.';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return 'No se pudo descargar \"$title\": no hay suficiente espacio de almacenamiento';
  }

  @override
  String downloadFailedPermission(String title) {
    return 'No se pudo descargar \"$title\": revisa la ubicación de descarga en Ajustes';
  }

  @override
  String downloadFailedGeneric(String title) {
    return 'No se pudo descargar \"$title\"';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '$count seleccionada(s)';
  }

  @override
  String get bookmarksTitle => 'Todos los marcadores';

  @override
  String get bookmarksTabBookmarks => 'Marcadores';

  @override
  String get bookmarksTabHighlights => 'Destacados';

  @override
  String get highlightOpenInBook => 'Abrir en el libro';

  @override
  String get highlightDeleteAction => 'Borrar destacado';

  @override
  String get highlightDeleted => 'Destacado borrado';

  @override
  String highlightsDeleteCount(int count) {
    return '¿Borrar $count destacado(s)?';
  }

  @override
  String highlightsDeletedCount(int count) {
    return '$count destacado(s) borrado(s)';
  }

  @override
  String get quoteShareTitle => 'Compartir cita';

  @override
  String get quoteShareAction => 'Compartir';

  @override
  String get quoteShareFailed => 'No se pudo crear la imagen de la cita';

  @override
  String get quoteShapePortrait => 'Vertical';

  @override
  String get quoteShapeSquare => 'Cuadrado';

  @override
  String get quoteShapeStory => 'Historia';

  @override
  String get quoteStyleBlur => 'Desenfocado';

  @override
  String get quoteStyleDim => 'Atenuado';

  @override
  String get quoteStyleNone => 'Portada sin efectos';

  @override
  String get quoteTextLight => 'Texto claro';

  @override
  String get quoteTextDark => 'Texto oscuro';

  @override
  String get quoteFieldTitle => 'Título';

  @override
  String get quoteFieldDetail => 'Detalles';

  @override
  String get quoteFieldDetailHint => 'Autor, capítulo, página, quién lo dijo';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => 'Cancelar selección';

  @override
  String get bookmarksSortedByNewest => 'Ordenados por más recientes';

  @override
  String get bookmarksSortedByPosition => 'Ordenados por posición';

  @override
  String get bookmarksSelect => 'Seleccionar';

  @override
  String get bookmarksNoBookmarks => 'Aún no hay marcadores';

  @override
  String get bookmarksSearchHint => 'Buscar marcadores';

  @override
  String get bookmarksNoMatches => 'Ningún marcador coincide con tu búsqueda';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Descargando $count libros',
      one: 'Descargando 1 libro',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => 'Ya descargado';

  @override
  String bookmarksDeleteCount(int count) {
    return '¿Borrar $count marcador(es)?';
  }

  @override
  String get bookmarksDeleteContent => 'Esta acción no se puede deshacer.';

  @override
  String bookmarksDeletedCount(int count) {
    return '$count marcador(es) borrado(s)';
  }

  @override
  String get bookmarksJumpTitle => '¿Ir al marcador?';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '\"$title\" en $position\nen $bookTitle';
  }

  @override
  String get bookmarksJump => 'Ir';

  @override
  String get bookmarksNotConnected => 'Sin conexión con el servidor';

  @override
  String get bookmarksCouldNotLoad => 'No se pudo cargar el libro';

  @override
  String bookmarksSelectedCount(int count) {
    return '$count seleccionado(s)';
  }

  @override
  String get statsTitle => 'Tus estadísticas';

  @override
  String get statsCouldNotLoad => 'No se pudieron cargar las estadísticas';

  @override
  String get statsTotalListeningTime => 'TIEMPO TOTAL DE ESCUCHA';

  @override
  String get statsHoursUnit => 'h';

  @override
  String get statsMinutesUnit => 'min';

  @override
  String get statsSecondsUnit => 's';

  @override
  String statsDaysOfAudio(String days) {
    return 'Son $days días de audio';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return 'Son $hours horas de audio';
  }

  @override
  String get statsToday => 'Hoy';

  @override
  String get statsThisWeek => 'Esta semana';

  @override
  String get statsThisMonth => 'Este mes';

  @override
  String get statsActivity => 'Actividad';

  @override
  String get statsCurrentStreak => 'Racha actual';

  @override
  String get statsBestStreak => 'Mejor racha';

  @override
  String get statsFinished => 'Terminado';

  @override
  String get statsBooksFinished => 'Libros';

  @override
  String get statsEpisodesFinished => 'Episodios';

  @override
  String get statsBooksThisYear => 'Libros este año';

  @override
  String get statsEpisodesThisYear => 'Episodios este año';

  @override
  String get statsRemoveFromYearTitle => 'Quitar de este año';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return 'La fecha de finalización seguirá siendo $date en el servidor. Esto solo quita \"$title\" de tu lista de libros del año de Absorb.';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return 'La fecha de finalización se mantiene en el servidor. Esto solo quita \"$title\" de tu lista de libros del año de Absorb.';
  }

  @override
  String get statsRemovedFromYear => 'Quitado de este año';

  @override
  String get statsAddBackToYearTitle => 'Volver a añadir a este año';

  @override
  String statsAddBackToYearBody(String title) {
    return '¿Volver a añadir \"$title\" a tu lista de libros del año de Absorb?';
  }

  @override
  String get statsAddBack => 'Volver a añadir';

  @override
  String get statsAddedBackToYear => 'Añadido de nuevo a este año';

  @override
  String get statsHiddenFromYear => 'Oculto de este año';

  @override
  String get statsNothingHidden => 'No hay nada oculto';

  @override
  String get settingsCustomizeStats => 'Personalizar estadísticas';

  @override
  String get statsGoalTitle => 'Meta de escucha';

  @override
  String get statsGoalOff => 'Apagado';

  @override
  String get statsGoalDaily => 'Diaria';

  @override
  String get statsGoalWeekly => 'Semanal';

  @override
  String get statsGoalMonthly => 'Mensual';

  @override
  String get statsGoalTarget => 'Objetivo';

  @override
  String get statsGoalEnterTitle => 'Fijar objetivo';

  @override
  String get statsGoalEnterTimeHint => 'Minutos o h:mm';

  @override
  String statsBooksShort(int count) {
    return '$count libros';
  }

  @override
  String get statsBookChallengeTitle => 'Reto de lectura';

  @override
  String get statsBookChallengeDesc => 'Libros por terminar este año';

  @override
  String get statsDailyGoal => 'Meta diaria';

  @override
  String get statsWeeklyGoal => 'Meta semanal';

  @override
  String get statsMonthlyGoal => 'Meta mensual';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$done de $target libros';
  }

  @override
  String get statsGoalReached => 'Meta alcanzada';

  @override
  String get statsChartTitle => 'Gráfico de escucha';

  @override
  String get statsChartBar => 'Barras';

  @override
  String get statsChartLine => 'Líneas';

  @override
  String get statsChartHeatmap => 'Mapa de calor';

  @override
  String get statsChartDays7 => '7 días';

  @override
  String get statsChartDays30 => '30 días';

  @override
  String get statsLast30Days => 'Últimos 30 días';

  @override
  String get statsThisYearTitle => 'Este año';

  @override
  String get statsSectionsTitle => 'Secciones';

  @override
  String get statsSectionTimePeriods => 'Periodos de tiempo';

  @override
  String get statsHeatmapLess => 'Menos';

  @override
  String get statsHeatmapMore => 'Más';

  @override
  String get statsDayOfWeek => 'Promedio por día de la semana';

  @override
  String get statsTimeSavedLabel => 'Ahorrado por velocidad';

  @override
  String statsTimeSavedSince(String date) {
    return 'desde el $date';
  }

  @override
  String get statsTimeSavedReset => 'Reiniciar tiempo ahorrado';

  @override
  String get statsTimeSavedResetConfirm =>
      'El tiempo ahorrado volverá a contarse desde hoy.';

  @override
  String get statsTimeSavedResetDone => 'Tiempo ahorrado reiniciado';

  @override
  String statsOnPaceFor(int count) {
    return 'A este ritmo: $count libros';
  }

  @override
  String get statsDaysActive => 'Días activos';

  @override
  String get statsDailyAverage => 'Promedio diario';

  @override
  String get statsLast7Days => 'Últimos 7 días';

  @override
  String get statsMostListened => 'Más escuchados';

  @override
  String get statsRecentSessions => 'Sesiones recientes';

  @override
  String get appShellHomeTab => 'Inicio';

  @override
  String get appShellLibraryTab => 'Biblioteca';

  @override
  String get appShellAbsorbingTab => 'Absorbing';

  @override
  String get appShellStatsTab => 'Estadísticas';

  @override
  String get appShellSettingsTab => 'Ajustes';

  @override
  String get appShellDiscoverTab => 'Descubrir';

  @override
  String get appShellShowsTab => 'Programas';

  @override
  String get appShellPodcastsTab => 'Podcasts';

  @override
  String get libraryTabEpisodes => 'Episodios';

  @override
  String get filterAllEpisodes => 'Todos';

  @override
  String get filterUnplayed => 'Sin reproducir';

  @override
  String get episodeFeedEmpty => 'Ningún episodio coincide con este filtro';

  @override
  String get podcastFilterUpNext => 'A continuación';

  @override
  String get podcastFilterNew => 'Nuevos';

  @override
  String get settingsPodcastTab => 'Pestaña Podcasts';

  @override
  String get settingsPodcastTabDesc =>
      'Da a una biblioteca de podcasts su propia pestaña en la barra inferior';

  @override
  String get settingsPodcastTabLibrary => 'Biblioteca de la pestaña Podcasts';

  @override
  String get settingsMergeImpliedByPodcastTab =>
      'Siempre activo mientras la pestaña Podcasts esté habilitada';

  @override
  String get settingsEpisodeNotifs => 'Ajustes de notificaciones';

  @override
  String get settingsEpisodeNotifsDesc =>
      'Nuevos episodios de podcasts y próximos lanzamientos de libros, comprobados en segundo plano';

  @override
  String get notifIntervalOff => 'Apagado';

  @override
  String notifIntervalMinutes(int n) {
    return 'Cada $n minutos';
  }

  @override
  String get notifIntervalHour => 'Cada hora';

  @override
  String notifIntervalHours(int n) {
    return 'Cada $n horas';
  }

  @override
  String get settingsBatteryUnrestricted =>
      'Permitir uso de batería sin restricciones';

  @override
  String get settingsBatteryUnrestrictedDesc =>
      'Evita que el sistema pause las comprobaciones en segundo plano en algunos teléfonos';

  @override
  String get appShellPressBackToExit => 'Pulsa atrás otra vez para salir';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get sectionAppearance => 'Apariencia';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get languageSystemDefault => 'Predeterminado del sistema';

  @override
  String get languageHelpTranslateInvite =>
      '¿Quieres ayudar a traducir Absorb a tu idioma?';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeAuto => 'Automático';

  @override
  String get colorSourceLabel => 'Origen del color';

  @override
  String get colorSourceCoverDescription =>
      'Los colores de la app siguen la portada del libro en reproducción';

  @override
  String get colorSourceWallpaperDescription =>
      'Los colores de la app siguen el fondo de pantalla del sistema';

  @override
  String get colorSourceWallpaper => 'Fondo de pantalla';

  @override
  String get colorSourceNowPlaying => 'En reproducción';

  @override
  String get colorSourceDynamic => 'Dinámico';

  @override
  String get colorSourceManual => 'Manual';

  @override
  String get colorSourceManualDescription =>
      'Usa un color fijo de la app que elijas abajo';

  @override
  String get colorSourceCustom => 'Personalizado';

  @override
  String get useColorEverywhereLabel => 'Usar este color en todas partes';

  @override
  String get useColorEverywhereSubtitle =>
      'También colorea las páginas de detalles del libro y la tarjeta del reproductor con tu color en lugar de la portada de cada libro';

  @override
  String get flatBackgroundLabel => 'Fondo plano';

  @override
  String get flatBackgroundSubtitle =>
      'Quita el degradado del fondo. Negro puro en modo oscuro para pantallas OLED.';

  @override
  String get einkModeLabel => 'Modo e-ink';

  @override
  String get einkModeSubtitle =>
      'Blanco y negro de alto contraste y sin animaciones, pensado para pantallas e-ink';

  @override
  String get einkModeIntroBody =>
      'Pensado para pantallas e-ink. La app cambia a un aspecto plano en blanco y negro con alto contraste, se desactivan las animaciones, la tarjeta de reproducción pierde su fondo y la conexión en vivo con el servidor se mantiene apagada para ahorrar batería. La reproducción y el progreso se siguen sincronizando con normalidad. Tus ajustes de apariencia se conservan y vuelven al desactivar este modo.';

  @override
  String get einkModeIntroConfirm => 'Activar';

  @override
  String get backgroundIntensityLabel => 'Intensidad del fondo';

  @override
  String get startScreenLabel => 'Pantalla de inicio';

  @override
  String get startScreenSubtitle => 'Qué pestaña se abre al iniciar la app';

  @override
  String get startScreenHome => 'Inicio';

  @override
  String get startScreenLibrary => 'Biblioteca';

  @override
  String get startScreenAbsorb => 'Absorb';

  @override
  String get startScreenStats => 'Estadísticas';

  @override
  String get disablePageFade => 'Desactivar desvanecimiento de página';

  @override
  String get disablePageFadeOnSubtitle => 'Las páginas cambian al instante';

  @override
  String get disablePageFadeOffSubtitle =>
      'Las páginas se desvanecen al cambiar de pestaña';

  @override
  String get rectangleBookCovers => 'Portadas rectangulares';

  @override
  String get progressTextSize => 'Tamaño del texto de progreso';

  @override
  String get rectangleBookCoversOnSubtitle =>
      'Las portadas se muestran en proporción de libro 2:3';

  @override
  String get rectangleBookCoversOffSubtitle => 'Las portadas son cuadradas';

  @override
  String get coverSize => 'Tamaño de portada';

  @override
  String get coverSizeSubtitle =>
      'Cuántas portadas caben a lo ancho de la cuadrícula de la biblioteca';

  @override
  String get coverSizeSmall => 'Pequeño';

  @override
  String get coverSizeMedium => 'Mediano';

  @override
  String get coverSizeLarge => 'Grande';

  @override
  String get sectionAbsorbingCards => 'Tarjetas de Absorbing';

  @override
  String get fullScreenPlayer => 'Reproductor a pantalla completa';

  @override
  String get fullScreenPlayerOnSubtitle =>
      'Activado: los libros se abren a pantalla completa al reproducir';

  @override
  String get fullScreenPlayerOffSubtitle =>
      'Desactivado: reproducir dentro de la vista de tarjeta';

  @override
  String get fullBookScrubber => 'Barra de todo el libro';

  @override
  String get fullBookScrubberOnSubtitle =>
      'Activado: control deslizante para moverse por todo el libro';

  @override
  String get fullBookScrubberOffSubtitle =>
      'Desactivado: solo barra de progreso';

  @override
  String get cardScrubbers => 'Barras de la tarjeta';

  @override
  String get cardScrubbersBoth => 'Ambas';

  @override
  String get cardScrubbersChapter => 'Capítulo';

  @override
  String get cardScrubbersLocked => 'Bloqueadas';

  @override
  String get cardScrubbersBothSubtitle =>
      'Las barras del libro completo y del capítulo permiten avanzar y retroceder';

  @override
  String get cardScrubbersChapterSubtitle =>
      'Solo la barra del capítulo permite avanzar y retroceder';

  @override
  String get cardScrubbersLockedSubtitle =>
      'El progreso se muestra sin poder moverse';

  @override
  String get speedAdjustedTime => 'Tiempo ajustado a la velocidad';

  @override
  String get speedAdjustedTimeOnSubtitle =>
      'Activado: todos los tiempos reflejan tu velocidad de reproducción';

  @override
  String get speedAdjustedTimeOffSubtitle =>
      'Desactivado: se muestra la duración original del audio';

  @override
  String get buttonLayout => 'Disposición de botones';

  @override
  String get buttonLayoutSubtitle =>
      'Cómo se organizan los botones de acción en la tarjeta';

  @override
  String get whenAbsorbed => 'Al terminar';

  @override
  String get whenAbsorbedInfoTitle => 'Al terminar';

  @override
  String get whenAbsorbedInfoContent =>
      'Controla qué ocurre con una tarjeta de Absorbing cuando terminas un libro o episodio.\n\nLas tarjetas terminadas se quitan automáticamente de tu pantalla de Absorbing.';

  @override
  String get whenAbsorbedSubtitle =>
      'Qué ocurre con la tarjeta de Absorbing cuando termina un libro o episodio';

  @override
  String get whenAbsorbedShowOverlay => 'Mostrar superposición';

  @override
  String get whenAbsorbedAutoRelease => 'Liberar automáticamente';

  @override
  String get mergeLibraries => 'Página Absorbing unificada';

  @override
  String get mergeLibrariesInfoTitle => 'Página Absorbing unificada';

  @override
  String get mergeLibrariesInfoContent =>
      'Si está activada, la pantalla Absorbing muestra en una sola vista todos tus libros y podcasts en curso de todas las bibliotecas. Si está desactivada, solo se muestran los elementos de la biblioteca seleccionada.';

  @override
  String get mergeLibrariesOnSubtitle =>
      'La página Absorbing muestra elementos de todas las bibliotecas';

  @override
  String get mergeLibrariesOffSubtitle =>
      'La página Absorbing muestra solo la biblioteca actual';

  @override
  String get queueMode => 'Modo de cola';

  @override
  String get queueModeInfoTitle => 'Modo de cola';

  @override
  String get queueModeInfoOff => 'Apagado';

  @override
  String get queueModeInfoOffDesc =>
      'La reproducción se detiene cuando termina el libro o episodio actual.';

  @override
  String get queueModeInfoManual => 'Cola manual';

  @override
  String get queueModeInfoManualDesc =>
      'Tus tarjetas de Absorbing funcionan como una lista de reproducción. Cuando una termina, la siguiente tarjeta sin terminar se reproduce automáticamente. Añade elementos con el botón \"Añadir a Absorbing\" de un libro o episodio y reordénalos desde la pantalla Absorbing.';

  @override
  String get queueModeOff => 'Apagado';

  @override
  String get queueModeManual => 'Manual';

  @override
  String get queueModeAuto => 'Automático';

  @override
  String get queueModePlaylist => 'Lista de reproducción';

  @override
  String get queueModeCollection => 'Colección';

  @override
  String get queueModeInfoPlaylist => 'Cola de lista de reproducción';

  @override
  String get queueModeInfoPlaylistDesc =>
      'Reproduce los elementos en orden de una lista de reproducción elegida, saltando lo que ya esté terminado. Se detiene al final de la lista.';

  @override
  String get queuePlaylistPickerTitle => 'Elige una lista de reproducción';

  @override
  String get queuePlaylistNone => 'Ninguna lista de reproducción seleccionada';

  @override
  String queuePlaylistActiveLabel(String name) {
    return 'Lista de reproducción: $name';
  }

  @override
  String get queueModePlaylistHint =>
      'Inicia una cola de lista de reproducción abriendo una lista en la página de inicio.';

  @override
  String get exit => 'Salir';

  @override
  String upNext(String label) {
    return 'A continuación: $label';
  }

  @override
  String get nothingUpNext => 'Nada a continuación';

  @override
  String get showUpNextLabel =>
      'Mostrar \"A continuación\" en la página Absorbing';

  @override
  String get openSeries => 'Abrir serie';

  @override
  String get openPlaylist => 'Abrir lista de reproducción';

  @override
  String get openCollection => 'Abrir colección';

  @override
  String get playlistPlayAction => 'Reproducir lista de reproducción';

  @override
  String get playlistAllFinished => 'Todo terminado';

  @override
  String get queueModeBooks => 'Libros';

  @override
  String get queueModePodcasts => 'Podcasts';

  @override
  String get autoDownloadQueue => 'Descargar la cola automáticamente';

  @override
  String get autoDownloadThisSeriesLabel =>
      'Descargar esta serie automáticamente';

  @override
  String get autoDownloadThisShowLabel =>
      'Descargar este podcast automáticamente';

  @override
  String get autoDownloadThisPlaylistLabel =>
      'Descargar esta lista de reproducción automáticamente';

  @override
  String get autoDownloadThisCollectionLabel =>
      'Descargar esta colección automáticamente';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return 'Mantiene descargados los siguientes $count elementos';
  }

  @override
  String get autoDownloadQueueOffSubtitle =>
      'Desactivado: solo descargas manuales';

  @override
  String get sectionPlayback => 'Reproducción';

  @override
  String get sectionMediaControls => 'Controles multimedia';

  @override
  String get defaultSpeed => 'Velocidad predeterminada';

  @override
  String get defaultSpeedSubtitle =>
      'Los libros nuevos empiezan a esta velocidad; cada libro recuerda la suya';

  @override
  String get skipBack => 'Retroceder';

  @override
  String get skipForward => 'Avanzar';

  @override
  String get iosLockScreenSkipHint =>
      'La pantalla de bloqueo solo dibuja los números para los que iOS tiene iconos (5, 10, 15, 30, 45, 60, 75, 90). Otras cantidades muestran + en el botón pero siguen saltando según tu ajuste.';

  @override
  String get longSkipButtons => 'Botones de salto largo';

  @override
  String get longSkipButtonsOnSubtitle =>
      'Activado: el reproductor muestra un segundo par de saltos, más grande';

  @override
  String get longSkipButtonsOffSubtitle =>
      'Desactivado: solo los botones de salto normales';

  @override
  String get longSkipBack => 'Retroceso largo';

  @override
  String get longSkipForward => 'Avance largo';

  @override
  String get coverShapeDefault => 'Predeterminada';

  @override
  String get coverShapeSquare => 'Cuadrada';

  @override
  String get coverShapeRectangle => 'Rectangular';

  @override
  String get coverShapeLabel => 'Forma de la portada';

  @override
  String get showSubtitles => 'Mostrar subtítulos';

  @override
  String get showSubtitlesOnSubtitle =>
      'Los subtítulos se muestran bajo los títulos de los libros en la biblioteca y en el inicio';

  @override
  String get showSubtitlesOffSubtitle =>
      'Desactivado: subtítulos solo en la hoja de detalles del libro';

  @override
  String get subtitleVisibilityLabel => 'Subtítulos';

  @override
  String get subtitleVisibilityDefault => 'Predeterminado';

  @override
  String get subtitleVisibilityShow => 'Mostrar';

  @override
  String get subtitleVisibilityHide => 'Ocultar';

  @override
  String currentLibrarySettingsTitle(String name) {
    return 'Biblioteca actual: $name';
  }

  @override
  String get currentLibrarySkipOverride => 'Saltos personalizados';

  @override
  String get currentLibrarySkipOverrideOnSubtitle =>
      'Activado: esta biblioteca usa sus propios saltos';

  @override
  String get currentLibrarySkipOverrideOffSubtitle =>
      'Desactivado: esta biblioteca usa los saltos globales';

  @override
  String get currentLibrarySkipBack => 'Retroceder';

  @override
  String get currentLibrarySkipForward => 'Avanzar';

  @override
  String get chapterProgressInNotification =>
      'Progreso del capítulo en la notificación y Android Auto';

  @override
  String get chapterProgressOnSubtitle =>
      'Activado: la notificación y Android Auto muestran el progreso del capítulo';

  @override
  String get chapterProgressOffSubtitle =>
      'Desactivado: muestran el progreso de todo el libro';

  @override
  String get chapterProgressInNotificationIos =>
      'Progreso del capítulo en la pantalla de bloqueo y CarPlay';

  @override
  String get chapterProgressOnSubtitleIos =>
      'Activado: la pantalla de bloqueo y CarPlay muestran el progreso del capítulo';

  @override
  String get nowPlayingText => 'Texto de reproducción actual';

  @override
  String get nowPlayingTextSubtitle =>
      'Elige qué muestran los controles multimedia en cada línea';

  @override
  String get nowPlayingTopLine => 'Línea superior';

  @override
  String get nowPlayingSecondLine => 'Segunda línea';

  @override
  String get nowPlayingNotShown => 'No se muestra';

  @override
  String get nowPlayingTopLineRequired =>
      'La línea superior necesita al menos un elemento';

  @override
  String get nowPlayingPieceChapter => 'Capítulo';

  @override
  String get nowPlayingPieceTitle => 'Título del libro';

  @override
  String get nowPlayingPieceNarrator => 'Narrador';

  @override
  String get nowPlayingPieceSeries => 'Serie';

  @override
  String get nowPlayingPiecePercent => 'Porcentaje del libro';

  @override
  String get nowPlayingPieceChapterNumber => 'Número de capítulo';

  @override
  String get nowPlayingPieceTimeLeft => 'Tiempo restante';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return 'Cap. $number/$total';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return 'Quedan $time';
  }

  @override
  String get bookDockBadgePending => 'Pendiente';

  @override
  String get bookDockBadgeExtracting => 'Leyendo archivo';

  @override
  String get bookDockBadgeFetching => 'Buscando';

  @override
  String get bookDockBadgeError => 'Error';

  @override
  String get bookDockNeedsReview => 'Requiere revisión';

  @override
  String get bookDockNoMatch => 'Sin coincidencia';

  @override
  String get bookDockApplied => 'Aplicado';

  @override
  String get bookDockNotApplied => 'Datos encontrados sin usar';

  @override
  String get bookDockNoDestination => 'Sin destino definido';

  @override
  String get bookDockNoAuthor => 'Aún sin autor';

  @override
  String get bookDockLookUpAgain => 'Buscar de nuevo';

  @override
  String get bookDockLookingUp => 'Buscando los datos de nuevo';

  @override
  String get bookDockLookUpFailed => 'No se pudieron buscar los datos';

  @override
  String get bookDockProposedChanges => 'Cambios propuestos';

  @override
  String get bookDockNoChanges => 'Aún no se han encontrado datos en línea';

  @override
  String get bookDockStillReading => 'El servidor sigue leyendo este archivo';

  @override
  String get bookDockRoleBook => 'Libro';

  @override
  String get bookDockRoleCover => 'Portada';

  @override
  String get bookDockRoleMetadata => 'Metadatos';

  @override
  String get bookDockRoleExtra => 'Extra';

  @override
  String get bookDockFieldTitle => 'Título';

  @override
  String get bookDockFieldSubtitle => 'Subtítulo';

  @override
  String get bookDockFieldAuthors => 'Autores';

  @override
  String get bookDockFieldSeries => 'Serie';

  @override
  String get bookDockFieldPublisher => 'Editorial';

  @override
  String get bookDockFieldYear => 'Año';

  @override
  String get bookDockFieldLanguage => 'Idioma';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return '$percent% de coincidencia';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '1 archivo',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return 'Va a $library';
  }

  @override
  String bookDockChangedFields(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count campos',
      one: '1 campo',
    );
    return '$_temp0';
  }

  @override
  String bookDockFilesInEntry(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos en esta entrada',
      one: 'Archivo en esta entrada',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return 'Añadido el $date';
  }

  @override
  String get bookDockAddToLibrary => 'Añadir a la biblioteca';

  @override
  String get bookDockUseFound => 'Usar datos encontrados';

  @override
  String get bookDockRemoveTitle => '¿Eliminar de Book Dock?';

  @override
  String get bookDockRemoveFailed => 'No se pudo eliminar este archivo';

  @override
  String get bookDockPickLibrary => '¿A qué biblioteca añadirlo?';

  @override
  String get bookDockNoLibraries =>
      'Tu cuenta no puede añadir libros a una biblioteca';

  @override
  String get bookDockFileFailed =>
      'No se pudo añadir este archivo a la biblioteca';

  @override
  String get bookDockDuplicateBody =>
      'Ya hay un archivo con este nombre en esa biblioteca. ¿Eliminarlo de Book Dock?';

  @override
  String get bookDockDetailsUpdated => 'Datos actualizados';

  @override
  String get bookDockUseFoundFailed => 'No hay datos encontrados para usar';

  @override
  String bookDockRemoveBody(String title) {
    return 'Esto borra $title del servidor.';
  }

  @override
  String bookDockRemoved(String title) {
    return '$title eliminado de Book Dock';
  }

  @override
  String bookDockFiled(String title, String library) {
    return '$title añadido a $library';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return 'No se pudo añadir este archivo: $reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return 'Ya está en $library';
  }

  @override
  String get bomatchSearchAll => 'Buscar en todas las fuentes';

  @override
  String get bomatchSearching => 'Buscando...';

  @override
  String get bomatchSearchFailed =>
      'No se pudieron buscar coincidencias. Comprueba tu conexión e inténtalo de nuevo.';

  @override
  String get bomatchNoResults => 'No se encontraron coincidencias';

  @override
  String get bomatchStrong => 'Coincidencias fuertes';

  @override
  String get bomatchPossible => 'Posibles coincidencias';

  @override
  String get bomatchSourceTimeout => 'tiempo agotado';

  @override
  String get bomatchSourceBusy => 'ocupada';

  @override
  String get bomatchSourceFailed => 'falló';

  @override
  String get bomatchLinked => 'Vinculado';

  @override
  String get bomatchSameIsbn => 'Mismo ISBN';

  @override
  String get bomatchFewDetails => 'Pocos datos';

  @override
  String get bomatchBack => 'Todos los resultados';

  @override
  String get bomatchFillEmpty => 'Rellenar vacíos';

  @override
  String get bomatchTakeAll => 'Tomar todo';

  @override
  String get bomatchOnlyDifferences => 'Solo diferencias';

  @override
  String get bomatchNow => 'Ahora';

  @override
  String get bomatchEmpty => 'Vacío';

  @override
  String get bomatchKindNew => 'Nuevo';

  @override
  String get bomatchKindChange => 'Cambio';

  @override
  String get bomatchKindSmall => 'Cambio pequeño';

  @override
  String get bomatchKindSame => 'Igual';

  @override
  String get bomatchKindNone => 'No está en el resultado';

  @override
  String get bomatchKeep => 'Conservar';

  @override
  String get bomatchUse => 'Usar';

  @override
  String get bomatchMerge => 'Combinar';

  @override
  String get bomatchReplace => 'Reemplazar';

  @override
  String get bomatchUseThis => 'Usar este';

  @override
  String get bomatchChosen => 'Elegido';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros más',
      one: '1 libro más',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cambios',
      one: '1 cambio',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nuevos',
      one: '1 nuevo',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aplicar $count cambios',
      one: 'Aplicar 1 cambio',
      zero: 'Aplicar',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fuentes más',
      one: '1 fuente más',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return 'De $source';
  }

  @override
  String get breqTitle => 'Solicitudes de libros';

  @override
  String get breqTabRequest => 'Solicitar un libro';

  @override
  String get breqTabMine => 'Mis solicitudes';

  @override
  String get breqTabAll => 'Todas las solicitudes';

  @override
  String get breqNoAccess =>
      'Tu cuenta no puede solicitar libros en este servidor.';

  @override
  String get breqTitleHint => 'Título del libro';

  @override
  String get breqAuthorHint => 'Autor';

  @override
  String get breqKindAudiobook => 'Audiolibro';

  @override
  String get breqKindEbook => 'Libro electrónico';

  @override
  String get breqKindComic => 'Cómic';

  @override
  String get breqSearch => 'Buscar';

  @override
  String get breqSearching => 'Buscando...';

  @override
  String get breqSearchFailed =>
      'No se pudo buscar. Comprueba tu conexión e inténtalo de nuevo.';

  @override
  String get breqSearchPrompt =>
      'Busca un libro que la biblioteca aún no tenga para solicitarlo.';

  @override
  String get breqNoResults => 'No se encontraron libros coincidentes';

  @override
  String get breqInLibrary => 'En tu biblioteca';

  @override
  String get breqYouAsked => 'Lo solicitaste tú';

  @override
  String get breqSomeoneAsked => 'Ya solicitado por otra persona';

  @override
  String get breqView => 'Ver';

  @override
  String get breqRequest => 'Solicitar';

  @override
  String get breqRequested => 'Solicitado';

  @override
  String get breqAddMeToo => 'Añadirme también';

  @override
  String get breqLibrary => 'Biblioteca';

  @override
  String get breqLibraryApprover => 'Que decida quien aprueba';

  @override
  String get breqLibraryChoose => 'Elige una biblioteca';

  @override
  String get breqNote => 'Nota para quien aprueba';

  @override
  String get breqNoteHint => 'Cualquier dato útil sobre esta solicitud';

  @override
  String get breqAutoApproved => 'Tus solicitudes se aprueban de inmediato.';

  @override
  String get breqSubmitted => 'Solicitud enviada';

  @override
  String get breqJoined => 'Te hemos añadido a la solicitud existente';

  @override
  String get breqFailed => 'No se pudo enviar la solicitud';

  @override
  String get breqStatusPending => 'Pendiente';

  @override
  String get breqStatusApproved => 'Aprobada';

  @override
  String get breqStatusRejected => 'Rechazada';

  @override
  String get breqStatusCancelled => 'Cancelada';

  @override
  String get breqStatusSearching => 'Buscando';

  @override
  String get breqStatusGrabbed => 'Versión encontrada';

  @override
  String get breqStatusDownloading => 'Descargando';

  @override
  String get breqStatusImporting => 'Importando';

  @override
  String get breqStatusNeedsReview => 'Requiere revisión';

  @override
  String get breqStatusAvailable => 'Disponible';

  @override
  String get breqStatusFailed => 'Fallida';

  @override
  String get breqWaitingApproval => 'Esperando aprobación';

  @override
  String get breqWaitingRelease => 'Esperando a que se elija una versión';

  @override
  String get breqLookingForRelease => 'Buscando una versión';

  @override
  String get breqStartingDownload => 'Iniciando la descarga';

  @override
  String get breqAddingToLibrary => 'Añadiendo a la biblioteca';

  @override
  String get breqWaitingCheck => 'Esperando una revisión manual';

  @override
  String get breqReady => 'Listo en tu biblioteca';

  @override
  String get breqSomethingWrong => 'Algo salió mal';

  @override
  String get breqShowHidden => 'Mostrar ocultas';

  @override
  String get breqHidden => 'Oculta';

  @override
  String get breqMineEmpty => 'Aún no has solicitado ningún libro.';

  @override
  String get breqAllEmpty => 'Aún no hay solicitudes.';

  @override
  String get breqLoadFailed => 'No se pudieron cargar las solicitudes.';

  @override
  String get breqLoadMore => 'Cargar más';

  @override
  String get breqApprove => 'Aprobar';

  @override
  String get breqReject => 'Rechazar';

  @override
  String get breqCancel => 'Cancelar solicitud';

  @override
  String get breqHide => 'Ocultar de mi lista';

  @override
  String get breqUnhide => 'Mostrar en mi lista';

  @override
  String get breqLeave => 'Salir de la solicitud';

  @override
  String get breqDelete => 'Borrar solicitud';

  @override
  String get breqOpenBook => 'Abrir libro';

  @override
  String get breqCancelConfirm =>
      '¿Cancelar esta solicitud? Una descarga en curso también se detendrá.';

  @override
  String get breqDeleteConfirm =>
      '¿Borrar esta solicitud? Esta acción no se puede deshacer.';

  @override
  String get breqRejectTitle => 'Rechazar solicitud';

  @override
  String get breqRejectReason => 'Motivo (opcional)';

  @override
  String get breqApproveTitle => 'Aprobar solicitud';

  @override
  String get breqApproveLibraryNeeded =>
      'Elige la biblioteca a la que irá este libro.';

  @override
  String get breqApprovedToast => 'Solicitud aprobada';

  @override
  String get breqRejectedToast => 'Solicitud rechazada';

  @override
  String get breqCancelledToast => 'Solicitud cancelada';

  @override
  String get breqHiddenToast => 'Oculta de tu lista';

  @override
  String get breqRestoredToast => 'De nuevo en tu lista';

  @override
  String get breqDeletedToast => 'Solicitud borrada';

  @override
  String get breqLeftToast => 'Saliste de esta solicitud';

  @override
  String get breqActionFailed => 'No se pudo actualizar la solicitud';

  @override
  String get breqFactRequestedBy => 'Solicitado por';

  @override
  String get breqFactRequestedOn => 'Solicitado el';

  @override
  String get breqFactLibrary => 'Biblioteca';

  @override
  String get breqFactDecidedBy => 'Decidido por';

  @override
  String get breqFactNote => 'Nota de quien solicita';

  @override
  String get breqFactDecisionNote => 'Nota de la decisión';

  @override
  String get breqFactAlsoWanted => 'También lo quieren';

  @override
  String get breqLibraryCta => 'Solicitar un libro';

  @override
  String get breqSettingsSubtitle =>
      'Pide libros que la biblioteca aún no tiene';

  @override
  String get navHoldBookRequests => 'Solicitudes de libros';

  @override
  String breqLibraryDefault(String library) {
    return 'Predeterminada ($library)';
  }

  @override
  String breqFailedReason(String reason) {
    return 'No se pudo enviar la solicitud: $reason';
  }

  @override
  String breqBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String breqDownloadingPercent(int percent) {
    return 'Descargando, $percent%';
  }

  @override
  String breqAddedTo(String library) {
    return 'Añadido a $library';
  }

  @override
  String breqRejectedWithNote(String note) {
    return 'Rechazada: $note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return 'Fallida: $reason';
  }

  @override
  String breqRequestedBy(String name) {
    return 'Solicitado por $name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return 'No se pudo actualizar la solicitud: $reason';
  }

  @override
  String breqFooterCta(String query) {
    return 'Solicitar \"$query\"';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitudes',
      one: '1 solicitud',
      zero: 'Sin solicitudes',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => 'Buscar una versión';

  @override
  String get breqTryAnotherRelease => 'Probar otra versión';

  @override
  String get breqApproveAndFind => 'Aprobar y buscar una versión';

  @override
  String get breqReviewButton => 'Revisar descarga';

  @override
  String get breqStopDownload => 'Detener descarga';

  @override
  String get breqStopDownloadConfirm =>
      '¿Detener esta descarga? La solicitud vuelve a aprobada para poder elegir otra versión.';

  @override
  String get breqDiscardImport => 'Descartar descarga';

  @override
  String get breqDiscardConfirm =>
      '¿Descartar esta descarga? La solicitud se marca como fallida y se puede intentar de nuevo con otra versión.';

  @override
  String get breqFileAnyway => 'Añadir a la biblioteca';

  @override
  String get breqFiledToast => 'Añadido a la biblioteca';

  @override
  String get breqDiscardedToast => 'Descarga descartada';

  @override
  String get breqStoppedToast => 'Descarga detenida';

  @override
  String get breqGrabTitle => '¿Descargar esta versión?';

  @override
  String get breqGrab => 'Descargar';

  @override
  String get breqGrabbed => 'Descarga iniciada';

  @override
  String get breqGrabFailed => 'No se pudo iniciar esa descarga';

  @override
  String get breqReleaseVipWarning =>
      'Este tracker solo permite descargarlo a cuentas VIP.';

  @override
  String get breqReleaseNoBookFile =>
      'Esta versión no tiene ningún archivo de libro que BookOrbit pueda añadir a una biblioteca.';

  @override
  String get breqReleaseCheckFailed =>
      'No se pudo comprobar el contenido de esta versión. Inténtalo de nuevo o elige otra.';

  @override
  String get breqCheckingRelease => 'Comprobando los archivos...';

  @override
  String get breqSearchAgain => 'Buscar de nuevo';

  @override
  String get breqSearchTerms => 'Términos de búsqueda';

  @override
  String get breqIsbnHint => 'Déjalo vacío para buscar por título y autor';

  @override
  String get breqSearchingIndexers =>
      'Buscando en tus indexadores. Puede tardar hasta un minuto.';

  @override
  String get breqReleasesFailed => 'No se pudieron buscar versiones.';

  @override
  String get breqNoSourcesSetUp =>
      'No hay fuentes de búsqueda configuradas en BookOrbit.';

  @override
  String get breqNoSourcesOn =>
      'Todas las fuentes de búsqueda están desactivadas en BookOrbit.';

  @override
  String get breqNoSourceCarries =>
      'Ninguna de tus fuentes de búsqueda ofrece este tipo de libro.';

  @override
  String get breqNoReleases =>
      'No se encontraron versiones. Prueba con otros términos de búsqueda.';

  @override
  String get breqFromCache => 'de una búsqueda reciente';

  @override
  String get breqIndexerUnauthorized => 'falló el inicio de sesión';

  @override
  String get breqIndexerThrottled => 'ocupado';

  @override
  String get breqIndexerTimeout => 'tiempo agotado';

  @override
  String get breqIndexerUnreachable => 'inaccesible';

  @override
  String get breqIndexerNoMedium => 'no lo ofrece';

  @override
  String get breqIndexerError => 'falló';

  @override
  String get breqSortBest => 'Mejor coincidencia';

  @override
  String get breqSortSeeders => 'Semillas';

  @override
  String get breqSortSize => 'Tamaño';

  @override
  String get breqSortNewest => 'Más recientes';

  @override
  String get breqFreeleech => 'Freeleech';

  @override
  String get breqVipOnly => 'Solo VIP';

  @override
  String get breqAlreadyGrabbed => 'Descargado antes';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => 'Título';

  @override
  String get breqReasonAuthor => 'Autor';

  @override
  String get breqReasonUnknownFormat => 'Formato desconocido';

  @override
  String get breqReasonExpectedSize => 'Tamaño';

  @override
  String get breqReasonSuspiciousSize => 'Tamaño inusual';

  @override
  String get breqReasonFreeleech => 'Freeleech';

  @override
  String get breqReasonSeveralBooks => 'Varios libros';

  @override
  String get breqReviewTitle => 'Descarga a la espera de revisión';

  @override
  String get breqReviewFailed =>
      'No se pudieron cargar los detalles de la descarga.';

  @override
  String get breqReviewDockGone =>
      'Los archivos descargados ya no están en Book Dock.';

  @override
  String get breqReviewNoLibrary =>
      'Esta solicitud no tiene una biblioteca a la que añadir el libro.';

  @override
  String breqGrabFailedReason(String reason) {
    return 'No se pudo iniciar esa descarga: $reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return 'No se pudo comprobar el contenido de esta versión: $reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return 'No se pudieron buscar versiones: $reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return 'No se pudieron cargar los detalles de la descarga: $reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count versiones',
      one: '1 versión',
      zero: 'Sin versiones',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '1 archivo',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '1 archivo',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return '$seeders semillas, $leechers leechers';
  }

  @override
  String breqScore(int score) {
    return 'Puntuación $score';
  }

  @override
  String breqReasonPreferredFormat(String format) {
    return '$format preferido';
  }

  @override
  String breqReasonFormat(String format) {
    return '$format';
  }

  @override
  String breqReasonSeeders(String count) {
    return '$count semillas';
  }

  @override
  String breqReviewScore(int score, int threshold) {
    return 'Puntuación de coincidencia $score. Las descargas con $threshold o más se añaden solas.';
  }

  @override
  String breqReviewRequested(String value) {
    return 'Solicitado: $value';
  }

  @override
  String breqReviewImported(String value) {
    return 'Descargado: $value';
  }

  @override
  String get breqKindBoth => 'Ambos';

  @override
  String get breqEbookLibrary => 'Biblioteca de libros electrónicos';

  @override
  String get breqAudiobookLibrary => 'Biblioteca de audiolibros';

  @override
  String get breqRequestBoth => 'Solicitar ambos';

  @override
  String get breqAddMeToBoth => 'Añadirme a ambos';

  @override
  String get breqRequestEbook => 'Solicitar libro electrónico';

  @override
  String get breqRequestAudiobook => 'Solicitar audiolibro';

  @override
  String get breqAddMeEbook => 'Añadirme a la solicitud del libro electrónico';

  @override
  String get breqAddMeAudiobook => 'Añadirme a la solicitud del audiolibro';

  @override
  String get breqPairSubmitted => 'Libro electrónico y audiolibro solicitados';

  @override
  String get breqPairOneJoined =>
      'Se solicitaron ambos. Uno ya estaba en camino, así que te añadimos a esa solicitud';

  @override
  String get breqJoinedBoth => 'Te hemos añadido a ambas solicitudes';

  @override
  String get breqJoinsOwned =>
      'Solicitado. Se unirá a la copia que ya tienes en tu biblioteca';

  @override
  String get speedBookmarkInControls =>
      'Velocidad y marcador en los controles multimedia';

  @override
  String get speedBookmarkOnSubtitle =>
      'Activado: la notificación muestra velocidad y marcador; el salto de capítulo se queda en Android Auto';

  @override
  String get speedBookmarkOffSubtitle =>
      'Desactivado: la notificación muestra el salto de capítulo; velocidad y marcador se quedan en Android Auto';

  @override
  String get lockSeekBar => 'Bloquear la barra de búsqueda';

  @override
  String get lockSeekBarOnSubtitle =>
      'Activado: la barra de la notificación, la pantalla de bloqueo y el coche muestra el progreso pero no se puede arrastrar';

  @override
  String get lockSeekBarOffSubtitle =>
      'Desactivado: arrastra la barra de la notificación, la pantalla de bloqueo y el coche para saltar';

  @override
  String get autoRewindOnResume => 'Retroceso automático al reanudar';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return 'Activado: de $min s a $max s según la duración de la pausa';
  }

  @override
  String get autoRewindOffSubtitle => 'Apagado';

  @override
  String get rewindRange => 'Rango de retroceso';

  @override
  String get rewindAfterPausedFor => 'Retroceder tras una pausa de';

  @override
  String get rewindAnyPause => 'Cualquier pausa';

  @override
  String get rewindAlwaysLabel => 'Siempre';

  @override
  String get rewindAlwaysDescription =>
      'Retrocede cada vez que reanudas, incluso tras interrupciones breves';

  @override
  String rewindAfterDescription(String seconds) {
    return 'Solo retrocede si la pausa dura $seconds s o más';
  }

  @override
  String get chapterBarrier => 'Límite de capítulo';

  @override
  String get chapterBarrierSubtitle =>
      'No retroceder automáticamente más allá del inicio del capítulo actual';

  @override
  String get rewindInstant => 'Al instante';

  @override
  String rewindPause(String duration) {
    return 'Pausa de $duration';
  }

  @override
  String get rewindNoRewind => 'sin retroceso';

  @override
  String rewindSeconds(String seconds) {
    return 'Retroceso de $seconds s';
  }

  @override
  String get sectionSleepTimer => 'Temporizador de apagado';

  @override
  String get sleep => 'Dormir';

  @override
  String get sleepTimer => 'Temporizador de apagado';

  @override
  String get shakeDuringSleepTimer =>
      'Agitar durante el temporizador de apagado';

  @override
  String get shakeOff => 'Apagado';

  @override
  String get shakeAddTime => 'Añadir tiempo';

  @override
  String get shakeReset => 'Reiniciar';

  @override
  String get shakeAdds => 'Al agitar se añade';

  @override
  String get sleepAddAmount => 'Cantidad de tiempo a añadir';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes min';
  }

  @override
  String get shakeSensitivity => 'Sensibilidad al agitar';

  @override
  String get shakeSensitivityVeryLow => 'Muy baja';

  @override
  String get shakeSensitivityLow => 'Baja';

  @override
  String get shakeSensitivityMedium => 'Media';

  @override
  String get shakeSensitivityHigh => 'Alta';

  @override
  String get shakeSensitivityVeryHigh => 'Muy alta';

  @override
  String get buttonDuringSleepTimer =>
      'Botón de los auriculares al final del temporizador';

  @override
  String get buttonDuringSleepTimerHint =>
      'En los últimos instantes antes de apagarse, una pulsación reinicia el temporizador en lugar de pausar. La doble pulsación sigue saltando.';

  @override
  String get resetTimerOnPause => 'Reiniciar temporizador al pausar';

  @override
  String get resetTimerOnPauseOnSubtitle =>
      'El temporizador vuelve a empezar con la duración completa al reanudar';

  @override
  String get resetTimerOnPauseOffSubtitle =>
      'El temporizador continúa desde donde se quedó';

  @override
  String get fadeVolumeBeforeSleep =>
      'Bajar el volumen gradualmente antes de dormir';

  @override
  String get fadeVolumeOnSubtitle =>
      'Baja el volumen poco a poco durante los últimos 30 segundos';

  @override
  String get fadeVolumeOffSubtitle =>
      'La reproducción se detiene de inmediato al terminar el temporizador';

  @override
  String get autoSleepTimer => 'Temporizador de apagado automático';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration min';
  }

  @override
  String get autoSleepTimerOffSubtitle =>
      'Inicia un temporizador de apagado automáticamente en un horario';

  @override
  String get windowStart => 'Inicio del horario';

  @override
  String get windowEnd => 'Fin del horario';

  @override
  String get timerDuration => 'Duración del temporizador';

  @override
  String get timer => 'Temporizador';

  @override
  String get endOfChapter => 'Fin del capítulo';

  @override
  String startMinTimer(int minutes) {
    return 'Iniciar temporizador de $minutes min';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return 'Dormir tras $count $label';
  }

  @override
  String get addMoreTime => 'Añadir más tiempo';

  @override
  String get cancelTimer => 'Cancelar temporizador';

  @override
  String chaptersLeftCount(int count) {
    return 'Quedan $count cap.';
  }

  @override
  String get sectionDownloadsAndStorage => 'Descargas y almacenamiento';

  @override
  String get downloadOverWifiOnly => 'Red de descarga';

  @override
  String get downloadOverWifiOnSubtitle => 'Solo Wi-Fi';

  @override
  String get downloadOverWifiOffSubtitle => 'Cualquier conexión';

  @override
  String get autoDownloadOnWifi =>
      'Descargar automáticamente los libros que empiezas';

  @override
  String get autoDownloadOnWifiInfoTitle =>
      'Descarga automática de libros que empiezas';

  @override
  String get autoDownloadOnWifiInfoContent =>
      'Cuando empiezas a reproducir un libro en streaming, el libro completo se descarga en segundo plano para que lo tengas sin conexión sin iniciar la descarga tú. Estas descargas siguen tu ajuste de Red de descarga, así que elige Cualquier conexión si quieres que también se hagan con datos móviles.';

  @override
  String get autoDownloadOnWifiOnSubtitle =>
      'Los libros en streaming se descargan automáticamente en segundo plano';

  @override
  String get autoDownloadOnWifiOffSubtitle => 'Apagado';

  @override
  String get concurrentDownloads => 'Descargas simultáneas';

  @override
  String get autoDownload => 'Descarga automática';

  @override
  String get autoDownloadSubtitle =>
      'Actívala por serie, podcast, lista de reproducción o colección desde sus páginas de detalles';

  @override
  String get autoDownloadEnabledFor => 'Activada para';

  @override
  String get autoDownloadEnabledForNone => 'Aún nada';

  @override
  String get autoDownloadSourceUnnamed => 'Aún no cargado';

  @override
  String get keepNext => 'Conservar siguientes';

  @override
  String get keepNextInfoTitle => 'Conservar siguientes';

  @override
  String get keepNextInfoContent =>
      'El número de elementos que se mantienen descargados, incluido el que estás escuchando. Por ejemplo, \"Conservar siguientes 3\" significa que el libro actual más los 2 siguientes de esa serie, podcast, lista de reproducción o colección seguirán descargados. Se aplica a todas las descargas automáticas que actives.';

  @override
  String get deleteAbsorbedDownloads => 'Borrar descargas terminadas';

  @override
  String get deleteAbsorbedDownloadsInfoTitle => 'Borrar descargas terminadas';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      'Si está activado, los libros o episodios descargados se borran automáticamente de este dispositivo cuando los terminas en Absorb. Terminar un elemento en la web o en otro dispositivo no borrará su descarga aquí.';

  @override
  String get deleteAbsorbedOnSubtitle =>
      'Los elementos terminados se eliminan para ahorrar espacio';

  @override
  String get deleteAbsorbedOffSubtitle =>
      'Desactivado: se conservan las descargas terminadas';

  @override
  String get downloadLocation => 'Ubicación de descarga';

  @override
  String get storageUsed => 'Almacenamiento usado';

  @override
  String storageUsedByDownloads(String size) {
    return '$size usados por las descargas';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return '$free libres de $total';
  }

  @override
  String get manageDownloads => 'Gestionar descargas';

  @override
  String get streamingCache => 'Caché de streaming';

  @override
  String get streamingCacheInfoTitle => 'Caché de streaming';

  @override
  String get streamingCacheInfoContent =>
      'Guarda en disco el audio en streaming para no tener que descargarlo de nuevo si retrocedes o vuelves a escuchar partes. La caché se gestiona automáticamente: al alcanzar el límite de tamaño se eliminan los archivos más antiguos. Es independiente de los libros descargados por completo.';

  @override
  String get streamingCacheOff => 'Apagado';

  @override
  String get streamingCacheOffSubtitle =>
      'Desactivado: el audio se reproduce en streaming sin caché';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size MB: el audio reproducido recientemente se guarda en disco';
  }

  @override
  String get clearCache => 'Borrar caché';

  @override
  String get streamingCacheCleared => 'Caché de streaming borrada';

  @override
  String get sectionLibrary => 'Biblioteca';

  @override
  String get hideEbookOnlyTitles => 'Ocultar títulos solo de libro electrónico';

  @override
  String get hideEbookOnlyOnSubtitle =>
      'Se ocultan los libros sin archivos de audio';

  @override
  String get hideEbookOnlyOffSubtitle =>
      'Desactivado: se muestran todos los elementos de la biblioteca';

  @override
  String get homeCardsOpenDetails => 'Abrir detalles desde Inicio';

  @override
  String get homeCardsOpenDetailsOnSubtitle =>
      'Al tocar una tarjeta de Continuar escuchando o Continuar leyendo se abren sus detalles';

  @override
  String get homeCardsOpenDetailsOffSubtitle =>
      'Al tocar una tarjeta de Continuar escuchando o Continuar leyendo se retoma donde lo dejaste';

  @override
  String get showGoodreadsButton => 'Mostrar botón de Goodreads';

  @override
  String get showGoodreadsOnSubtitle =>
      'La hoja de detalles del libro muestra un enlace a Goodreads';

  @override
  String get showGoodreadsOffSubtitle =>
      'Desactivado: botón de Goodreads oculto';

  @override
  String get sectionPermissions => 'Permisos';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get notificationsSubtitle =>
      'Para el progreso de descargas y los controles de reproducción';

  @override
  String get notificationsAlreadyEnabled =>
      'Las notificaciones ya están activadas';

  @override
  String get unrestrictedBattery => 'Batería sin restricciones';

  @override
  String get unrestrictedBatterySubtitle =>
      'Evita que Android cierre la reproducción en segundo plano';

  @override
  String get batteryAlreadyUnrestricted =>
      'La batería ya no tiene restricciones';

  @override
  String get sectionIssuesAndSupport => 'Problemas y soporte';

  @override
  String get bugsAndFeatureRequests => 'Errores y sugerencias de funciones';

  @override
  String get bugsAndFeatureRequestsSubtitle => 'Abre una incidencia en GitHub';

  @override
  String get joinDiscord => 'Unirse a Discord';

  @override
  String get joinDiscordSubtitle => 'Comunidad, soporte y novedades';

  @override
  String get contact => 'Contacto';

  @override
  String get contactSubtitle => 'Enviar información del dispositivo por correo';

  @override
  String get enableLogging => 'Activar registros';

  @override
  String get enableLoggingOnSubtitle =>
      'Activado: registros guardados en un archivo (reinicia para aplicar)';

  @override
  String get enableLoggingOffSubtitle => 'Desactivado: no se guardan registros';

  @override
  String get loggingEnabledSnackbar =>
      'Registros activados: reinicia la app para empezar a guardarlos';

  @override
  String get loggingDisabledSnackbar =>
      'Registros desactivados: reinicia la app para dejar de guardarlos';

  @override
  String get sendLogs => 'Enviar registros';

  @override
  String get sendLogsSubtitle =>
      'Compartir el archivo de registros como adjunto';

  @override
  String failedToShare(String error) {
    return 'No se pudo compartir: $error';
  }

  @override
  String get clearLogs => 'Borrar registros';

  @override
  String get logsCleared => 'Registros borrados';

  @override
  String get clearLogsQuestion => '¿Borrar registros?';

  @override
  String get clearLogsContent =>
      'Esta acción no se puede deshacer. Envíalos antes si puede que los necesites.';

  @override
  String get sectionAdvanced => 'Avanzado';

  @override
  String get localServer => 'Servidor local';

  @override
  String get localServerInfoTitle => 'Servidor local';

  @override
  String get localServerInfoContent =>
      'Si ejecutas tu servidor Audiobookshelf en casa, puedes indicar aquí una URL local o de red local. Absorb cambiará automáticamente a la conexión local, más rápida, cuando detecte que estás en tu red doméstica, y volverá a tu URL remota cuando estés fuera.';

  @override
  String get localServerOnConnectedSubtitle =>
      'Conectado mediante servidor local';

  @override
  String get localServerOnRemoteSubtitle =>
      'Activado: usando el servidor remoto';

  @override
  String get localServerOffSubtitle =>
      'Cambia automáticamente a un servidor de red local con el WiFi de tu casa';

  @override
  String get localServerUrlLabel => 'URL del servidor local';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar =>
      'URL del servidor local guardada: se conectará automáticamente cuando estés en tu red doméstica';

  @override
  String get disableAudioFocus => 'Desactivar el foco de audio';

  @override
  String get disableAudioFocusInfoTitle => 'Foco de audio';

  @override
  String get disableAudioFocusInfoContent =>
      'De forma predeterminada, Android da el \"foco\" de audio a una sola app a la vez: cuando Absorb reproduce, el resto del audio (música, vídeos) se pausa. Al desactivar el foco de audio, Absorb puede reproducirse junto con otras apps. Las llamadas telefónicas seguirán pausando la reproducción con este ajuste.';

  @override
  String get disableAudioFocusOnSubtitle =>
      'Activado: se reproduce junto con otro audio (sigue pausándose con las llamadas)';

  @override
  String get disableAudioFocusOffSubtitle =>
      'Desactivado: el otro audio se pausa cuando Absorb reproduce';

  @override
  String get restartRequired => 'Reinicio necesario';

  @override
  String get restartRequiredContent =>
      'El cambio del foco de audio requiere un reinicio completo para aplicarse. ¿Cerrar la app ahora?';

  @override
  String get closeApp => 'Cerrar app';

  @override
  String get trustAllCertificates => 'Confiar en todos los certificados';

  @override
  String get trustAllCertificatesInfoTitle => 'Certificados autofirmados';

  @override
  String get mp3IndexSeeking => 'Búsqueda por índice en MP3';

  @override
  String get mp3IndexSeekingInfoTitle => 'Búsqueda por índice en MP3';

  @override
  String get mp3IndexSeekingInfoContent =>
      'Actívalo solo si tienes archivos MP3 que no se posicionan correctamente. La búsqueda imprecisa suele venir de MP3 con tasa de bits variable (VBR). La búsqueda por índice crea un mapa de tiempos exacto mientras se lee el archivo, por lo que saltar cerca del final de un MP3 grande puede tardar un momento, sobre todo en streaming, ya que hay que leer el archivo hasta ese punto. Se aplica la próxima vez que empiece un libro o episodio de podcast.';

  @override
  String get mp3IndexSeekingOnSubtitle =>
      'Activado: búsqueda exacta para archivos MP3 VBR';

  @override
  String get mp3IndexSeekingOffSubtitle => 'Desactivado: búsqueda normal';

  @override
  String get trustAllCertificatesInfoContent =>
      'Actívalo si tu servidor Audiobookshelf usa un certificado autofirmado o una CA raíz propia. Al activarlo, Absorb omitirá la verificación de certificados TLS en todas las conexiones. Actívalo solo si confías en tu red.';

  @override
  String get trustAllCertificatesOnSubtitle =>
      'Activado: se aceptan todos los certificados';

  @override
  String get trustAllCertificatesOffSubtitle =>
      'Desactivado: solo se aceptan certificados de confianza';

  @override
  String get supportTheDev => 'Apoya al desarrollador';

  @override
  String get buyMeACoffee => 'Invítame a un café';

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
    return 'Absorb v$version  -  Servidor $serverVersion';
  }

  @override
  String get backupAndRestore => 'Copia de seguridad y restauración';

  @override
  String get backupAndRestoreSubtitle =>
      'Guarda o restaura todos tus ajustes en un archivo';

  @override
  String get backUp => 'Hacer copia';

  @override
  String get restore => 'Restaurar';

  @override
  String get allBookmarks => 'Todos los marcadores';

  @override
  String get allBookmarksSubtitle => 'Ver los marcadores de todos los libros';

  @override
  String get switchAccount => 'Cambiar de cuenta';

  @override
  String get addAccount => 'Añadir cuenta';

  @override
  String get logOut => 'Cerrar sesión';

  @override
  String get includeLoginInfoTitle => '¿Incluir datos de inicio de sesión?';

  @override
  String get includeLoginInfoContent =>
      '¿Quieres incluir en la copia las credenciales de todas tus cuentas guardadas?\n\nAsí es más fácil restaurar en un dispositivo nuevo, pero el archivo contendrá tus tokens de autenticación.';

  @override
  String get noSettingsOnly => 'No, solo ajustes';

  @override
  String get yesIncludeAccounts => 'Sí, incluir cuentas';

  @override
  String get backupSavedWithAccounts => 'Copia guardada (con cuentas)';

  @override
  String get backupSavedSettingsOnly => 'Copia guardada (solo ajustes)';

  @override
  String backupFailed(String error) {
    return 'Error en la copia de seguridad: $error';
  }

  @override
  String get restoreBackupTitle => '¿Restaurar copia de seguridad?';

  @override
  String get restoreBackupContent =>
      'Esto reemplazará todos tus ajustes actuales por los valores de la copia.';

  @override
  String fromAbsorbVersion(String version) {
    return 'De Absorb v$version';
  }

  @override
  String restoreAccountsChip(int count) {
    return '$count cuenta(s)';
  }

  @override
  String restoreBookmarksChip(int count) {
    return 'Marcadores de $count libro(s)';
  }

  @override
  String get restoreCustomHeadersChip => 'Encabezados personalizados';

  @override
  String get invalidBackupFile => 'Archivo de copia de seguridad no válido';

  @override
  String get settingsRestoredSuccessfully =>
      'Ajustes restaurados correctamente';

  @override
  String restoreFailed(String error) {
    return 'Error al restaurar: $error';
  }

  @override
  String get logOutTitle => '¿Cerrar sesión?';

  @override
  String get logOutContent =>
      'Se cerrará tu sesión. Tus descargas permanecerán en este dispositivo.';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get changePasswordTitle => 'Cambiar contraseña';

  @override
  String get changePasswordSubtitle =>
      'Actualiza tu contraseña de Audiobookshelf de forma segura';

  @override
  String get currentPassword => 'Contraseña actual';

  @override
  String get newPassword => 'Contraseña nueva';

  @override
  String get confirmNewPassword => 'Confirmar contraseña nueva';

  @override
  String get passwordChangeEffect =>
      'Al cambiar tu contraseña se cierran tus otras sesiones de Audiobookshelf. Este dispositivo sigue con la sesión iniciada.';

  @override
  String get passwordFieldsRequired => 'Rellena todos los campos de contraseña';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas nuevas no coinciden';

  @override
  String get passwordChanged =>
      'Contraseña cambiada. Se desconectaron los demás dispositivos con sesión iniciada.';

  @override
  String get passwordInvalid => 'La contraseña actual es incorrecta';

  @override
  String get passwordChangeUnsupported =>
      'Esta versión del servidor no admite cambios de contraseña seguros en Absorb';

  @override
  String get passwordChangeFailed => 'No se pudo cambiar tu contraseña';

  @override
  String get otherUserPasswordResetWarning =>
      'Al cambiar esta contraseña se cierra la sesión del usuario en todos sus dispositivos.';

  @override
  String get manageSessionsTitle => 'Dispositivos con sesión iniciada';

  @override
  String get manageSessionsSubtitle =>
      'Revisa y elimina sesiones de Audiobookshelf';

  @override
  String get sessionsCurrent => 'Dispositivo actual';

  @override
  String get sessionsUnknownDevice => 'Dispositivo desconocido';

  @override
  String sessionsLastActive(String date) {
    return 'Última actividad: $date';
  }

  @override
  String get sessionsNone => 'No hay sesiones activas';

  @override
  String get sessionsLoadMore => 'Cargar más';

  @override
  String get sessionsUnsupported =>
      'La gestión de sesiones requiere Audiobookshelf 2.36 o posterior.';

  @override
  String get sessionsLoadFailed =>
      'No se pudieron cargar los dispositivos con sesión iniciada';

  @override
  String get sessionsLegacyNotice =>
      'Este inicio de sesión no tiene una sesión de renovación, así que Absorb no puede identificar este dispositivo en la lista.';

  @override
  String get sessionsRemove => 'Cerrar sesión del dispositivo';

  @override
  String get sessionsRemoveTitle => '¿Cerrar la sesión de este dispositivo?';

  @override
  String get sessionsRemoveContent =>
      'Esto elimina su sesión de renovación. Su acceso actual puede seguir funcionando hasta que caduque ese token de corta duración.';

  @override
  String get sessionsRemoved => 'Sesión del dispositivo cerrada';

  @override
  String get sessionsRemoveFailed =>
      'No se pudo cerrar la sesión de ese dispositivo';

  @override
  String get sessionsSignOutAll => 'Cerrar sesión en todos los dispositivos';

  @override
  String get sessionsSignOutAllTitle => '¿Cerrar sesión en todas partes?';

  @override
  String get sessionsSignOutAllContent =>
      'Esto elimina todas las sesiones de renovación, incluida la de este dispositivo. Los tokens de acceso existentes pueden funcionar hasta que caduquen.';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return 'El horario usa la hora del servidor ($timeZone)';
  }

  @override
  String get podcastScheduleServerTimeUnknown =>
      'El horario usa la hora del servidor';

  @override
  String get editServerAddressTitle => 'Editar dirección del servidor';

  @override
  String editServerAddressSubtitle(String username) {
    return 'Actualiza la dirección de $username. Úsalo si la dirección de tu servidor cambió: sigue siendo el mismo servidor, solo con una URL nueva. Se conservan tus estadísticas y descargas.';
  }

  @override
  String get editServerAddressField => 'Dirección del servidor';

  @override
  String get editServerAddressUpdated => 'Dirección del servidor actualizada';

  @override
  String get editServerAddressFailed =>
      'No se pudo actualizar la dirección del servidor';

  @override
  String get editServerAddressAction => 'Editar dirección del servidor';

  @override
  String get editServerConnectionTitle => 'Editar conexión del servidor';

  @override
  String editServerConnectionSubtitle(String username) {
    return 'Actualiza la dirección del servidor y los encabezados personalizados de $username. Se conservan tus estadísticas y descargas.';
  }

  @override
  String get editServerConnectionAction => 'Editar conexión del servidor';

  @override
  String get editServerConnectionUpdated => 'Conexión del servidor actualizada';

  @override
  String get editServerConnectionFailed =>
      'No se pudo actualizar la conexión del servidor';

  @override
  String get editCustomHeadersDescription =>
      'Se usan con túneles de Cloudflare o proxies inversos. Estos encabezados solo se aplican a esta cuenta guardada.';

  @override
  String get removeAccountAction => 'Eliminar cuenta';

  @override
  String get removeAccountTitle => '¿Eliminar cuenta?';

  @override
  String removeAccountContent(String username, String server) {
    return '¿Eliminar a $username en $server de las cuentas guardadas?\n\nSiempre puedes volver a añadirla iniciando sesión de nuevo.';
  }

  @override
  String get switchAccountTitle => '¿Cambiar de cuenta?';

  @override
  String switchAccountContent(String username, String server) {
    return '¿Cambiar a $username en $server?\n\nSe detendrá la reproducción actual y la app se recargará con los datos de la otra cuenta.';
  }

  @override
  String get switchButton => 'Cambiar';

  @override
  String get downloadLocationSheetTitle => 'Ubicación de descarga';

  @override
  String get downloadLocationSheetSubtitle =>
      'Elige dónde se guardan los audiolibros';

  @override
  String get currentLocation => 'Ubicación actual';

  @override
  String get existingDownloadsWarning =>
      'Las descargas existentes permanecen en su ubicación actual. Solo las descargas nuevas usan la nueva ruta.';

  @override
  String get chooseFolder => 'Elegir carpeta';

  @override
  String get chooseDownloadFolder => 'Elegir carpeta de descarga';

  @override
  String get storagePermissionDenied =>
      'Permiso de almacenamiento denegado permanentemente: actívalo en los ajustes de la app';

  @override
  String get openSettings => 'Abrir Ajustes';

  @override
  String get storagePermissionRequired =>
      'Se necesita el permiso de almacenamiento para ubicaciones de descarga personalizadas';

  @override
  String get cannotWriteToFolder =>
      'No se puede escribir en esa carpeta: elige otra ubicación o concede acceso a archivos en los ajustes del sistema';

  @override
  String downloadLocationSetTo(String label) {
    return 'Ubicación de descarga establecida en $label';
  }

  @override
  String get resetToDefault => 'Restablecer valores predeterminados';

  @override
  String get resetToDefaultStorage =>
      'Restablecer almacenamiento predeterminado';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count descargas están en una carpeta personalizada antigua que ya no se puede abrir. Vuelve a descargarlas o descarta este aviso.',
      one:
          '1 descarga está en una carpeta personalizada antigua que ya no se puede abrir. Vuelve a descargarla o descarta este aviso.',
    );
    return '$_temp0';
  }

  @override
  String get redownload => 'Volver a descargar';

  @override
  String get redownloadStarted => 'Descargando de nuevo';

  @override
  String get dismiss => 'Descartar';

  @override
  String get tipsAndHiddenFeatures => 'Consejos y funciones ocultas';

  @override
  String get tipsSubtitle => 'Aprovecha Absorb al máximo';

  @override
  String get adminTitle => 'Administración del servidor';

  @override
  String get adminTasksTitle => 'Actividad del servidor';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tareas en ejecución',
      one: '1 tarea en ejecución',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => 'Actividad reciente del servidor';

  @override
  String get adminTasksEmpty => 'No hay tareas del servidor en ejecución';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return '$added añadidos - $updated actualizados - $missing ausentes';
  }

  @override
  String get adminServer => 'Servidor';

  @override
  String get adminVersion => 'Versión';

  @override
  String get adminUsers => 'Usuarios';

  @override
  String get adminOnline => 'En línea';

  @override
  String get adminBackup => 'Copia de seguridad';

  @override
  String get adminPurgeCache => 'Vaciar caché';

  @override
  String get adminManage => 'Gestionar';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return '$userCount cuentas - $onlineCount en línea';
  }

  @override
  String get adminPodcasts => 'Podcasts';

  @override
  String get adminPodcastsSubtitle => 'Busca, añade y gestiona programas';

  @override
  String get adminScan => 'Analizar';

  @override
  String get adminScanning => 'Analizando...';

  @override
  String get adminMatchAll => 'Buscar coincidencias en todo';

  @override
  String get adminMatching => 'Buscando coincidencias...';

  @override
  String get adminMatchAllTitle =>
      '¿Buscar coincidencias en todos los elementos?';

  @override
  String adminMatchAllContent(String name) {
    return '¿Buscar coincidencias de metadatos para todos los elementos de $name? Puede tardar un rato.';
  }

  @override
  String adminScanStarted(String name) {
    return 'Análisis iniciado para $name';
  }

  @override
  String get adminBackupCreated => 'Copia de seguridad creada';

  @override
  String get adminBackupFailed => 'Error en la copia de seguridad';

  @override
  String get adminCachePurged => 'Caché vaciada';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => 'Abrir en la app';

  @override
  String get adminRmabAdd => 'Añadir integración de ReadMeABook';

  @override
  String get adminRmabUrlTitle => 'URL de ReadMeABook';

  @override
  String get adminRmabUrlHelp =>
      'Pega tu URL con el token de acceso. Genera uno en RMAB, Admin, Users.';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => 'Introduce una URL http(s) válida';

  @override
  String get adminRmabSaved => 'ReadMeABook guardado';

  @override
  String get adminRmabRemoved => 'ReadMeABook eliminado';

  @override
  String get adminRmabReload => 'Recargar';

  @override
  String get adminRmabLoadFailed =>
      'No se pudo cargar ReadMeABook. Revisa tu URL.';

  @override
  String get adminRmabConnected => 'Conectado';

  @override
  String get adminRmabAskAdmin =>
      'Pide una URL de acceso al administrador de tu servidor';

  @override
  String get adminRmabUrlHelpUser =>
      'Pide una URL de acceso al administrador de tu servidor. La genera en RMAB > Admin > Users.';

  @override
  String get adminRmabSettingsInfo =>
      'ReadMeABook es un servicio autoalojado para solicitar y descargar audiolibros. Debe instalarlo y configurarlo el administrador de tu servidor.';

  @override
  String get rmabConfigTitle => 'Conectar ReadMeABook';

  @override
  String get rmabConfigExplainerAdmin =>
      'ReadMeABook es un servicio autoalojado para solicitar audiolibros. Genera un token de API en RMAB, en Admin Dashboard > Settings > API, y pega abajo la URL del servidor y el token. Absorb no aloja ni descarga contenido, solo envía solicitudes a tu servidor.';

  @override
  String get rmabConfigExplainerUser =>
      'ReadMeABook es un servicio autoalojado para solicitar audiolibros. Pide al administrador de tu servidor la URL de RMAB y un token de API. Absorb no aloja ni descarga contenido, solo envía solicitudes a tu servidor.';

  @override
  String get rmabConfigLearnMore => 'Más información sobre ReadMeABook';

  @override
  String get rmabConfigBaseUrlLabel => 'URL del servidor RMAB';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.example.com';

  @override
  String get rmabConfigTokenLabel => 'Token de API';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel =>
      'URL de acceso a la interfaz web (opcional)';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      'Pega tu URL de inicio de sesión automático para que \'Abrir en vista de navegador\' te lleve con la sesión iniciada. Déjalo en blanco para usar un inicio de sesión normal.';

  @override
  String get rmabConfigHeadersHelp =>
      'Encabezados adicionales enviados con cada solicitud a ReadMeABook, para proxies inversos como Cloudflare Access.';

  @override
  String get rmabConfigConnect => 'Conectar';

  @override
  String get rmabConfigDisconnect => 'Desconectar';

  @override
  String get rmabConfigOpenWebView => 'Abrir en vista de navegador';

  @override
  String rmabConfigConnectedAs(String name) {
    return 'Conectado como $name';
  }

  @override
  String get rmabConfigErrorInvalidUrl => 'Introduce una URL http(s) válida';

  @override
  String get rmabConfigErrorMissingToken => 'Introduce tu token de API';

  @override
  String get rmabConfigErrorUnauthorized => 'El servidor rechazó el token';

  @override
  String get rmabConfigErrorForbidden =>
      'Este token no tiene permiso para esa acción';

  @override
  String get rmabConfigErrorNetwork =>
      'No se pudo conectar con RMAB. Revisa la URL.';

  @override
  String get rmabConfigErrorGeneric => 'No se pudo conectar';

  @override
  String get rmabConfigSavedSnackbar => 'ReadMeABook conectado';

  @override
  String get rmabConfigDisconnectedSnackbar => 'ReadMeABook desconectado';

  @override
  String get rmabRequestCta => 'Solicitar con ReadMeABook';

  @override
  String get rmabSearchHeader => 'Solicitar con ReadMeABook';

  @override
  String get rmabSearchHint => 'Buscar por título o autor';

  @override
  String get rmabSearchEmpty => 'Sin coincidencias en tu servidor ReadMeABook';

  @override
  String get rmabSearchError => 'No se pudo buscar en ReadMeABook';

  @override
  String get rmabSearchPrompt => 'Escribe un título o autor para buscar';

  @override
  String get rmabSearchFooterPrompt => '¿Buscas otra cosa?';

  @override
  String rmabSearchFooterCta(String query) {
    return 'Buscar \"$query\" en ReadMeABook';
  }

  @override
  String get rmabBookDetailExplainer =>
      'Esta solicitud se enviará a través de tu servidor ReadMeABook. El administrador la revisará y la procesará. Puedes seguirla en Mis solicitudes, en el recuadro de ReadMeABook.';

  @override
  String get rmabBookAlreadyAvailable => 'Ya está en tu biblioteca';

  @override
  String get rmabBookAlreadyRequested => 'Ya solicitado';

  @override
  String get rmabRequestSubmitting => 'Enviando…';

  @override
  String get rmabRequestSent => 'Solicitud enviada';

  @override
  String get rmabRequestErrorAlreadyAvailable => 'Ya está en tu biblioteca';

  @override
  String get rmabRequestErrorBeingProcessed => 'Ya se está procesando';

  @override
  String get rmabRequestErrorDuplicate => 'Ya has solicitado esto';

  @override
  String get rmabRequestErrorValidation => 'No se pudo enviar la solicitud';

  @override
  String get rmabRequestErrorUserNotFound =>
      'El usuario del token ya no existe. Vuelve a conectar ReadMeABook.';

  @override
  String get rmabRequestErrorIgnored =>
      'Este libro está en tu lista de ignorados';

  @override
  String get rmabRequestErrorGeneric => 'No se pudo enviar la solicitud';

  @override
  String get rmabRequestErrorTokenRejected =>
      'El servidor rechazó el token. Vuelve a conectar ReadMeABook.';

  @override
  String get rmabMyRequestsTab => 'Mis solicitudes';

  @override
  String get rmabSetupTab => 'Configuración';

  @override
  String get rmabMyRequestsEmpty => 'Aún no has solicitado ningún libro';

  @override
  String get rmabMyRequestsError => 'No se pudieron cargar las solicitudes';

  @override
  String get rmabMyRequestsRefresh => 'Actualizar';

  @override
  String get rmabRequestDetailTitle => 'Detalles de la solicitud';

  @override
  String get rmabRequestDetailStatus => 'Estado';

  @override
  String get rmabRequestDetailRequestedOn => 'Solicitado el';

  @override
  String get rmabRequestDetailCompletedOn => 'Completado el';

  @override
  String get rmabRequestDetailProgress => 'Progreso';

  @override
  String get rmabStatusActive => 'En curso';

  @override
  String get rmabStatusWaiting => 'En espera';

  @override
  String get rmabStatusAvailable => 'Disponible';

  @override
  String get rmabStatusDownloaded => 'Descargado';

  @override
  String get rmabStatusFailed => 'Fallida';

  @override
  String get rmabStatusCancelled => 'Cancelada';

  @override
  String get rmabStatusDenied => 'Denegada';

  @override
  String get rmabStatusUnknown => 'Desconocido';

  @override
  String narratedBy(String narrator) {
    return 'Narrado por $narrator';
  }

  @override
  String get onAudible => 'en Audible';

  @override
  String percentComplete(String percent) {
    return '$percent% completado';
  }

  @override
  String get absorbing => 'Absorbiendo...';

  @override
  String get absorbAgain => 'Absorber de nuevo';

  @override
  String get absorb => 'Absorber';

  @override
  String get ebookOnlyNoAudio => 'Solo libro electrónico - sin audio';

  @override
  String get absorbAudioNotDownloaded => 'Audio no descargado';

  @override
  String get absorbAudioNotDownloadedEbookOnly =>
      'Audio no descargado, solo libro electrónico';

  @override
  String get fullyAbsorbed => 'Absorbido por completo';

  @override
  String get fullyAbsorbAction => 'Absorber por completo';

  @override
  String get removeFromAbsorbing => 'Quitar de Absorbing';

  @override
  String get addToAbsorbing => 'Añadir a Absorbing';

  @override
  String get absorbNext => 'Absorber a continuación';

  @override
  String get absorbNextAdded => 'A continuación en Absorbing';

  @override
  String get absorbLast => 'Absorber al final';

  @override
  String get absorbNextHint => 'Justo después de lo que suena ahora';

  @override
  String get absorbLastHint => 'Al final de la lista';

  @override
  String get removedFromAbsorbing => 'Quitado de Absorbing';

  @override
  String get addedToAbsorbing => 'Añadido a Absorbing';

  @override
  String get removeFromContinueListening => 'Quitar de Continuar escuchando';

  @override
  String get removedFromContinueListening => 'Quitado de Continuar escuchando';

  @override
  String get removeFromContinueReading => 'Quitar de Continuar leyendo';

  @override
  String get removedFromContinueReading => 'Quitado de Continuar leyendo';

  @override
  String get sessionAdd => 'Añadir sesión';

  @override
  String get sessionStartLabel => 'Inicio a las';

  @override
  String get sessionAdded => 'Sesión añadida';

  @override
  String get sessionAddFailed => 'No se pudo añadir la sesión';

  @override
  String get removeSeriesFromContinueSeries => 'Quitar de Continuar serie';

  @override
  String get removedSeriesFromContinueSeries => 'Quitado de Continuar serie';

  @override
  String get couldNotUpdate => 'No se pudo actualizar, inténtalo de nuevo';

  @override
  String get addToPlaylist => 'Añadir a lista de reproducción';

  @override
  String get addToCollection => 'Añadir a colección';

  @override
  String get downloadEbook => 'Descargar libro electrónico';

  @override
  String get downloadEbookAgain => 'Descargar libro electrónico de nuevo';

  @override
  String get resetProgress => 'Restablecer progreso';

  @override
  String get lookupLocalMetadata => 'Buscar metadatos locales';

  @override
  String get reLookupLocalMetadata => 'Buscar metadatos locales de nuevo';

  @override
  String get clearLocalMetadata => 'Borrar metadatos locales';

  @override
  String get searchOnGoodreads => 'Buscar en Goodreads';

  @override
  String get editServerDetails => 'Editar datos del servidor';

  @override
  String get encodeTab => 'Codificar';

  @override
  String get codec => 'Códec';

  @override
  String get bitrate => 'Tasa de bits';

  @override
  String get channels => 'Canales';

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Estéreo';

  @override
  String get startM4bEncode => 'Iniciar codificación M4B';

  @override
  String get encodeStarted => 'Codificación M4B iniciada';

  @override
  String get encodeFailed => 'No se pudo iniciar la codificación';

  @override
  String get encodeFinished => 'Codificación M4B terminada';

  @override
  String get currentlyLabel => 'Actualmente:';

  @override
  String encodeOutputPathNote(String path) {
    return 'El M4B terminado se guardará en la carpeta de tu audiolibro en: $path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return 'Se guardará una copia de tus archivos de audio originales en: /metadata/cache/items/$itemId/. Acuérdate de vaciar la caché de elementos periódicamente.';
  }

  @override
  String get encodeTimeNote => 'La codificación puede tardar hasta 30 minutos.';

  @override
  String get encodeRescanNote =>
      'Si tienes el observador desactivado, tendrás que volver a analizar este audiolibro después.';

  @override
  String get aboutSection => 'Acerca de';

  @override
  String chaptersCount(int count) {
    return 'Capítulos ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return 'Pistas de audio ($count)';
  }

  @override
  String libraryFilesCount(int count) {
    return 'Archivos de la biblioteca ($count)';
  }

  @override
  String get chapters => 'Capítulos';

  @override
  String get noChaptersBook => 'Este libro no tiene capítulos';

  @override
  String get noChaptersPodcast => 'Este podcast no tiene capítulos';

  @override
  String get failedToLoad => 'Error al cargar';

  @override
  String startedDate(String date) {
    return 'Empezado el $date';
  }

  @override
  String finishedDate(String date) {
    return 'Terminado el $date';
  }

  @override
  String andCountMore(int count) {
    return 'y $count más';
  }

  @override
  String get markAsFullyAbsorbedQuestion =>
      '¿Marcar como absorbido por completo?';

  @override
  String get markAsFullyAbsorbedContent =>
      'Esto pondrá tu progreso al 100% y detendrá la reproducción si este libro está sonando.';

  @override
  String get markedAsFinishedNiceWork =>
      'Marcado como terminado. ¡Buen trabajo!';

  @override
  String get failedToUpdateCheckConnection =>
      'No se pudo actualizar: comprueba tu conexión';

  @override
  String get markAsNotFinishedQuestion => '¿Marcar como sin terminar?';

  @override
  String get markAsNotFinishedContent =>
      'Esto borrará el estado de terminado y devolverá tu posición al principio.';

  @override
  String get unmark => 'Desmarcar';

  @override
  String get markedAsNotFinishedBackAtIt =>
      'Marcado como sin terminar. ¡A seguir!';

  @override
  String get resetProgressQuestion => '¿Restablecer progreso?';

  @override
  String get resetProgressListeningAndReading =>
      'Tu progreso de escucha y de lectura volverá al 0%.';

  @override
  String get resetProgressListening => 'Tu progreso de escucha volverá al 0%.';

  @override
  String get resetProgressReading => 'Tu progreso de lectura volverá al 0%.';

  @override
  String get resetProgressMarksUnread =>
      'El libro también se marcará como no leído.';

  @override
  String get resetProgressCantUndo => 'Esta acción no se puede deshacer.';

  @override
  String get progressResetFreshStart =>
      'Progreso restablecido. ¡Nuevo comienzo!';

  @override
  String get clearLocalMetadataQuestion => '¿Borrar metadatos locales?';

  @override
  String get clearLocalMetadataContent =>
      'Esto eliminará los metadatos guardados localmente y volverá a los que tenga el servidor.';

  @override
  String get localMetadataCleared => 'Metadatos locales borrados';

  @override
  String get saveEbook => 'Guardar libro electrónico';

  @override
  String get noEbookFileFound =>
      'No se encontró ningún archivo de libro electrónico';

  @override
  String get bookmark => 'Marcador';

  @override
  String get bookmarks => 'Marcadores';

  @override
  String bookmarksWithCount(int count) {
    return 'Marcadores ($count)';
  }

  @override
  String get playbackSpeed => 'Velocidad de reproducción';

  @override
  String get noBookmarksYet => 'Aún no hay marcadores';

  @override
  String get longPressBookmarkHint =>
      'Mantén pulsado el botón de marcador para guardar rápido';

  @override
  String get addBookmark => 'Añadir marcador';

  @override
  String get editBookmark => 'Editar marcador';

  @override
  String get titleLabel => 'Título';

  @override
  String get noteOptionalLabel => 'Nota (opcional)';

  @override
  String get editLayout => 'Editar diseño';

  @override
  String get inMenu => 'En el menú';

  @override
  String get bookmarkAdded => 'Marcador añadido';

  @override
  String get startPlayingSomethingFirst => 'Primero empieza a reproducir algo';

  @override
  String get playbackHistory => 'Historial de reproducción';

  @override
  String get historyLocalTab => 'Historial';

  @override
  String get historyServerTab => 'Sesiones';

  @override
  String get historyNoServerSessions =>
      'Aún no hay sesiones del servidor para este elemento';

  @override
  String get historyServerLoadFailed =>
      'No se pudieron cargar las sesiones del servidor';

  @override
  String get clearHistoryTooltip => 'Borrar historial';

  @override
  String get tapEventToJump => 'Toca un evento para saltar a esa posición';

  @override
  String get noHistoryYet => 'Aún no hay historial';

  @override
  String jumpedToPosition(String position) {
    return 'Salto a $position';
  }

  @override
  String booksInSeriesCount(int count) {
    return '$count libros en esta serie';
  }

  @override
  String bookNumber(String number) {
    return 'Libro $number';
  }

  @override
  String downloadRemainingCount(int count) {
    return 'Descargar los restantes ($count)';
  }

  @override
  String get downloadAll => 'Descargar todo';

  @override
  String get markAllNotFinished => 'Marcar todo como sin terminar';

  @override
  String get markAllFinished => 'Marcar todo como terminado';

  @override
  String get markAllNotFinishedQuestion => '¿Marcar todo como sin terminar?';

  @override
  String get fullyAbsorbSeries => '¿Absorber la serie por completo?';

  @override
  String get turnAutoDownloadOff => 'Desactivar descarga automática';

  @override
  String get turnAutoDownloadOn => 'Activar descarga automática';

  @override
  String get autoDownloadThisSeries => '¿Descargar esta serie automáticamente?';

  @override
  String get autoDownloadSeriesContent =>
      'Descarga automáticamente los siguientes libros a medida que escuchas.';

  @override
  String get standalone => 'Independientes';

  @override
  String get episodes => 'Episodios';

  @override
  String get noEpisodesFound => 'No se encontraron episodios';

  @override
  String get markFinished => 'Marcar como terminado';

  @override
  String get markUnfinished => 'Marcar como sin terminar';

  @override
  String get allEpisodes => 'Todos los episodios';

  @override
  String get aboutThisEpisode => 'Acerca de este episodio';

  @override
  String get reversePlayOrder => 'Invertir orden de reproducción';

  @override
  String selectedCount(int count) {
    return '$count seleccionado(s)';
  }

  @override
  String get selectAll => 'Seleccionar todo';

  @override
  String get deselectAll => 'Deseleccionar todo';

  @override
  String get autoDownloadThisPodcast =>
      '¿Descargar este podcast automáticamente?';

  @override
  String get autoDownloadPodcastContent =>
      'Descarga automáticamente los siguientes episodios a medida que escuchas.';

  @override
  String get download => 'Descargar';

  @override
  String get deleteDownload => 'Borrar descarga';

  @override
  String get casting => 'Transmitiendo';

  @override
  String get castingTo => 'Transmitiendo a';

  @override
  String get editDetails => 'Editar detalles';

  @override
  String get quickMatch => 'Coincidencia rápida';

  @override
  String get quickMatchNoUpdates => 'No hace falta actualizar nada';

  @override
  String get custom => 'Personalizado';

  @override
  String get authorOptionalLabel => 'Autor (opcional)';

  @override
  String get noResultsFound =>
      'No se encontraron resultados.\nPrueba a ajustar tu búsqueda o el proveedor.';

  @override
  String get searchForMetadataAbove => 'Busca metadatos arriba';

  @override
  String get applyThisMatch => '¿Aplicar esta coincidencia?';

  @override
  String get metadataUpdated => 'Metadatos actualizados';

  @override
  String get failedToUpdateMetadata =>
      'No se pudieron actualizar los metadatos';

  @override
  String get subtitleLabel => 'Subtítulo';

  @override
  String get authorLabel => 'Autor';

  @override
  String get narratorLabel => 'Narrador';

  @override
  String get seriesLabel => 'Serie';

  @override
  String get addSeries => 'Añadir serie';

  @override
  String get removeSeries => 'Quitar serie';

  @override
  String get descriptionLabel => 'Descripción';

  @override
  String get publisherLabel => 'Editorial';

  @override
  String get yearLabel => 'Año';

  @override
  String get genresLabel => 'Géneros';

  @override
  String get tagsLabel => 'Etiquetas';

  @override
  String get commaSeparated => 'Separados por comas';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => 'Imagen de portada';

  @override
  String get coverRemove => 'Quitar portada';

  @override
  String get coverRemoveConfirm =>
      '¿Quitar la portada de este libro? Se mostrará la tarjeta de título generada en su lugar.';

  @override
  String get coverRemoved => 'Portada quitada';

  @override
  String get coverRemoveFailed => 'No se pudo quitar la portada';

  @override
  String get coverUrlLabel => 'URL de la portada';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => 'Metadatos locales';

  @override
  String get overrideLocalDisplay => 'Reemplazar la visualización local';

  @override
  String get metadataSavedLocally => 'Metadatos guardados localmente';

  @override
  String get notes => 'Notas';

  @override
  String get newNote => 'Nota nueva';

  @override
  String get editNote => 'Editar nota';

  @override
  String get noNotesYet => 'Aún no hay notas';

  @override
  String get markdownIsSupported => 'Se admite Markdown';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => 'Conserva el formato';

  @override
  String get plainTextTxt => 'Texto sin formato (.txt)';

  @override
  String get simpleTextNoFormatting => 'Texto simple, sin formato';

  @override
  String get untitledNote => 'Nota sin título';

  @override
  String get titleHint => 'Título';

  @override
  String get noteBodyHint => 'Escribe tu nota... (admite Markdown)';

  @override
  String get nothingToPreview => 'Nada que previsualizar';

  @override
  String get audioEnhancements => 'Mejoras de audio';

  @override
  String get presets => 'PREAJUSTES';

  @override
  String get equalizer => 'ECUALIZADOR';

  @override
  String get effects => 'EFECTOS';

  @override
  String get bassBoost => 'Refuerzo de graves';

  @override
  String get surround => 'Envolvente';

  @override
  String get loudness => 'Sonoridad';

  @override
  String get monoAudio => 'Audio mono';

  @override
  String get skipSilence => 'Saltar silencios';

  @override
  String get resetAll => 'Restablecer todo';

  @override
  String get collectionNotFound => 'Colección no encontrada';

  @override
  String get deleteCollection => 'Borrar colección';

  @override
  String get deleteCollectionContent =>
      '¿Seguro que quieres borrar esta colección?';

  @override
  String get deleteCollectionFailed => 'No se pudo borrar la colección';

  @override
  String get deletePermissionRequired =>
      'Se necesita permiso para borrar. Pide al administrador root que te lo conceda.';

  @override
  String get deleteFilesCheckbox => 'Borrar también los archivos del servidor';

  @override
  String get deleteFilesCheckedHint =>
      'Los archivos se borran del servidor definitivamente.';

  @override
  String get deleteFilesUncheckedHint =>
      'Los archivos permanecen en el servidor, así que el próximo análisis de la biblioteca puede volver a añadirlo.';

  @override
  String get deleteFromServerAction => 'Borrar del servidor';

  @override
  String get deleteFromServerTitle => 'Borrar del servidor';

  @override
  String deleteFromServerContent(String title) {
    return '¿Borrar \"$title\" de Audiobookshelf?';
  }

  @override
  String deletedFromServer(String title) {
    return '\"$title\" borrado';
  }

  @override
  String get deleteFromServerFailed =>
      'No se pudo borrar. Revisa los registros del servidor.';

  @override
  String get playlistNotFound => 'Lista de reproducción no encontrada';

  @override
  String get deletePlaylist => 'Borrar lista de reproducción';

  @override
  String get deletePlaylistContent =>
      '¿Seguro que quieres borrar esta lista de reproducción?';

  @override
  String get newPlaylist => 'Lista de reproducción nueva';

  @override
  String get playlistNameHint => 'Nombre de la lista de reproducción';

  @override
  String addedToName(String name) {
    return 'Añadido a \"$name\"';
  }

  @override
  String get failedToAdd => 'No se pudo añadir';

  @override
  String get newCollection => 'Colección nueva';

  @override
  String get collectionNameHint => 'Nombre de la colección';

  @override
  String get listsNewCollectionSubtitle =>
      'Agrupa libros en una lista que conservas';

  @override
  String get listsNewCollectionNeedsBookSubtitle =>
      'Empiézala con al menos un libro';

  @override
  String get listsNewPlaylistSubtitle =>
      'Ordena libros para escucharlos en secuencia';

  @override
  String get listsAddBooksNow => 'Añadir libros ahora';

  @override
  String get listsPickBooksNext =>
      'A continuación elegirás libros. Una colección en este servidor necesita al menos uno.';

  @override
  String get listsCreate => 'Crear';

  @override
  String get listsCollectionNeedsBook =>
      'Una colección necesita al menos un libro, así que no se creó nada.';

  @override
  String get listsCreateFailed => 'No se pudo crear';

  @override
  String get castToDevice => 'Transmitir a un dispositivo';

  @override
  String get searchingForCastDevices => 'Buscando dispositivos Cast...';

  @override
  String get castDevice => 'Dispositivo Cast';

  @override
  String get stopCasting => 'Detener transmisión';

  @override
  String get disconnect => 'Desconectar';

  @override
  String get audioOutput => 'Salida de audio';

  @override
  String get noOutputDevicesFound => 'No se encontraron dispositivos de salida';

  @override
  String get welcomeToAbsorb => 'Te damos la bienvenida a Absorb Plus';

  @override
  String get welcomeTagline => 'Un cliente de Audiobookshelf.';

  @override
  String get welcomeAbsorbingTitle => 'Absorbing';

  @override
  String get welcomeAbsorbingIntro =>
      'Usamos \"absorber\" en lugar de \"reproducir\" y \"escuchar\". ¿Prefieres la redacción clásica? Cámbiala en Ajustes.';

  @override
  String get welcomeAbsorbingTabBullet =>
      'Pestaña Absorbing: lo que estás escuchando ahora';

  @override
  String get welcomeAbsorbButtonBullet =>
      'Botón Absorber: iniciar la reproducción';

  @override
  String get welcomeFullyAbsorbBullet =>
      'Absorber por completo: marcar como terminado';

  @override
  String get welcomeGettingAroundTitle => 'Cómo moverte';

  @override
  String get welcomeGettingAroundBody =>
      'Toca cualquier portada para abrir sus detalles. Las tarjetas de Continuar escuchando son distintas: toca para reproducir al instante y mantén pulsado para abrir los detalles.';

  @override
  String get welcomeMakeItYoursTitle => 'Hazla tuya';

  @override
  String get welcomeMakeItYoursBody =>
      'Explora los Ajustes para adaptar Absorb a tu gusto. Merece la pena echar un vistazo a la sección Consejos y funciones ocultas.';

  @override
  String get getStarted => 'Empezar';

  @override
  String get showMore => 'Mostrar más';

  @override
  String get showLess => 'Mostrar menos';

  @override
  String get readMore => 'Leer más';

  @override
  String get removeDownloadQuestion => '¿Eliminar descarga?';

  @override
  String get removeDownloadContent => 'Se eliminará de tu dispositivo.';

  @override
  String get removeWhichDownload =>
      'El audiolibro y el libro electrónico están en este dispositivo. Elige qué eliminar.';

  @override
  String get downloadRemoved => 'Descarga eliminada';

  @override
  String get finished => 'Terminado';

  @override
  String get saved => 'Descargado';

  @override
  String get selectLibrary => 'Seleccionar biblioteca';

  @override
  String get switchLibraryTooltip => 'Cambiar de biblioteca';

  @override
  String get refreshTooltip => 'Actualizar';

  @override
  String get noBooksFound => 'No se encontraron libros';

  @override
  String get userFallback => 'Usuario';

  @override
  String get rootAdmin => 'Administrador root';

  @override
  String get admin => 'Administrador';

  @override
  String get serverAdmin => 'Administración del servidor';

  @override
  String get serverAdminSubtitle =>
      'Gestiona usuarios, bibliotecas y ajustes del servidor';

  @override
  String serverUpdateAvailable(String version) {
    return 'Actualización del servidor $version disponible';
  }

  @override
  String get justNow => 'Ahora mismo';

  @override
  String minutesAgo(int count) {
    return 'hace $count min';
  }

  @override
  String hoursAgo(int count) {
    return 'hace $count h';
  }

  @override
  String daysAgo(int count) {
    return 'hace $count d';
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
  String get coverPlayPause => 'Reproducir/pausar con la portada';

  @override
  String get coverPlayPauseOnSubtitle =>
      'Activado: toca la portada para reproducir/pausar';

  @override
  String get coverPlayPauseOffSubtitle =>
      'Desactivado: botón de reproducir/pausar en los controles';

  @override
  String get cardBackground => 'Fondo de la tarjeta';

  @override
  String get cardBackgroundBlurred => 'Desenfocado';

  @override
  String get cardBackgroundGradient => 'Degradado';

  @override
  String get queueModeMergedSubtitle =>
      'La reproducción se detiene, cola manual o reproduce automáticamente el siguiente elemento';

  @override
  String get queueModeSeriesLabel => 'Serie';

  @override
  String get queueModeShowLabel => 'Programa';

  @override
  String get queueModeInfoSeries => 'Serie';

  @override
  String get queueModeInfoSeriesDesc =>
      'Reproduce automáticamente el siguiente libro de una serie o el siguiente episodio de un programa de podcast.';

  @override
  String get resetButtonGridQuestion =>
      '¿Restablecer la cuadrícula de botones?';

  @override
  String get resetButtonGridContent =>
      'Esto restaurará la disposición, el orden y los interruptores predeterminados de los botones.';

  @override
  String get reset => 'Restablecer';

  @override
  String get buttonGridReset => 'Cuadrícula de botones restablecida';

  @override
  String get resetButtonGrid => 'Restablecer cuadrícula de botones';

  @override
  String get chapterBarrierOnRewind => 'Límite de capítulo al retroceder';

  @override
  String get chapterBarrierInfoTitle => 'Límite de capítulo';

  @override
  String get chapterBarrierInfoContent =>
      'Al retroceder, la reproducción se detiene al inicio del capítulo actual en lugar de pasar al anterior.\n\nPulsa dos veces el botón de retroceso en menos de 2 segundos para superar el límite.';

  @override
  String get chapterBarrierOnRewindOnSubtitle =>
      'Activado: el retroceso se detiene al inicio del capítulo';

  @override
  String get chapterBarrierOnRewindOffSubtitle =>
      'Desactivado: el retroceso cruza los límites de capítulo';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return 'Activado: de $min s a $max s según la duración de la pausa';
  }

  @override
  String get rewindOnSessionStart =>
      'Retroceder al iniciar sesión de reproducción';

  @override
  String get rewindOnSessionStartInfoContent =>
      'El retroceso automático normal se activa al reanudar tras una pausa dentro de una sesión activa. Este ajuste añade un retroceso al iniciar una sesión completamente nueva, por ejemplo tras cerrar la app, detener la reproducción o abrir la app desde cero.\n\nSi está activado, la reproducción retrocede la cantidad máxima completa al inicio de cada sesión nueva para que vuelvas a oír por dónde ibas.';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return 'Activado: retrocede $seconds s al iniciar una sesión nueva';
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
    return 'Pausa de $seconds s';
  }

  @override
  String rewindMinPause(String minutes) {
    return 'Pausa de $minutes min';
  }

  @override
  String rewindHrPause(String hours) {
    return 'Pausa de $hours h';
  }

  @override
  String get rewindOneHrPause => 'Pausa de 1 h';

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
  String get chimeBeforeSleep => 'Campanilla antes de dormir';

  @override
  String get chimeBeforeSleepOnSubtitle =>
      'Suena una campana suave cuando el temporizador está a punto de terminar';

  @override
  String get chimeBeforeSleepOffSubtitle => 'Sin aviso sonoro antes de dormir';

  @override
  String get windDownDuration => 'Duración del apagado gradual';

  @override
  String windDownDurationSubtitle(int seconds) {
    return 'El fundido y la campanilla empiezan $seconds s antes de dormir';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return 'Baja el volumen poco a poco durante los últimos $seconds s';
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
  String get endOfChapterShort => 'Fin del capítulo';

  @override
  String get endOfChapterOnSubtitle => 'Detener al final del capítulo actual';

  @override
  String get endOfChapterOffSubtitle =>
      'Usar un temporizador de apagado por tiempo';

  @override
  String get showExplicitBadge => 'Mostrar distintivo de explícito';

  @override
  String get showExplicitBadgeOnSubtitle =>
      'Los elementos explícitos muestran un distintivo \"E\"';

  @override
  String get showExplicitBadgeOffSubtitle =>
      'Desactivado: distintivo de explícito oculto';

  @override
  String get showEbookBadge => 'Mostrar distintivo de libro electrónico';

  @override
  String get showEbookBadgeOnSubtitle =>
      'Los libros con libro electrónico muestran un icono de libro en la portada';

  @override
  String get showEbookBadgeOffSubtitle =>
      'Desactivado: distintivo de libro electrónico oculto';

  @override
  String get libraryFallback => 'Biblioteca';

  @override
  String get preReleaseUpdatesInfoTitle => 'Actualizaciones preliminares';

  @override
  String get preReleaseUpdatesInfoContent =>
      'Si está activado, el buscador de actualizaciones también te avisará de versiones alfa y preliminares de GitHub. Pueden ser menos estables, pero incluyen las últimas funciones y correcciones.';

  @override
  String get includePreReleases => 'Incluir versiones preliminares';

  @override
  String get includePreReleasesOnSubtitle =>
      'Activado: se buscan versiones alfa y preliminares';

  @override
  String get includePreReleasesOffSubtitle =>
      'Desactivado: solo versiones estables';

  @override
  String get setTooltip => 'Fijar';

  @override
  String get saveAbsorbBackup => 'Guardar copia de seguridad de Absorb';

  @override
  String get checkForUpdate => 'Buscar actualización';

  @override
  String get onLatestVersion => 'Tienes la última versión';

  @override
  String get updateAvailable => 'Actualización disponible';

  @override
  String get preReleaseAvailable => 'Versión preliminar disponible';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'Hay $kind nueva de Absorb disponible: $latest\n\nTienes la $current.';
  }

  @override
  String get updateKindPreRelease => 'una versión preliminar';

  @override
  String get updateKindVersion => 'una versión';

  @override
  String get downloadButton => 'Descargar';

  @override
  String get updateDownloading => 'Descargando actualización...';

  @override
  String get updateInstallPermissionDenied =>
      'Permiso de instalación denegado. Activa \"Instalar apps desconocidas\" para Absorb en los ajustes del sistema.';

  @override
  String get updateOpeningInBrowser =>
      'Falló la actualización en la app, abriendo el navegador';

  @override
  String get sendToEreader => 'Enviar al lector electrónico';

  @override
  String sendingToEreader(String device) {
    return 'Enviando a $device...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return 'Enviado a $device';
  }

  @override
  String get sendToEreaderFailed => 'No se pudo enviar el libro electrónico';

  @override
  String get pickEreaderDevice => 'Elige un dispositivo';

  @override
  String get adminEmail => 'Correo';

  @override
  String get adminEmailSubtitle => 'SMTP y lectores electrónicos';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => 'Guía de configuración';

  @override
  String get smtpHost => 'Host';

  @override
  String get smtpPort => 'Puerto';

  @override
  String get smtpSecure => 'Seguro';

  @override
  String get smtpRejectUnauthorized => 'Rechazar TLS no autorizado';

  @override
  String get smtpUser => 'Usuario';

  @override
  String get smtpPass => 'Contraseña';

  @override
  String get smtpFromAddress => 'Dirección del remitente';

  @override
  String get smtpTestAddress => 'Dirección de prueba';

  @override
  String get smtpSendTest => 'Enviar prueba';

  @override
  String get smtpSaveSettings => 'Guardar';

  @override
  String get smtpSaved => 'Ajustes de correo guardados';

  @override
  String get smtpSaveFailed => 'No se pudieron guardar los ajustes de correo';

  @override
  String get smtpTestSent => 'Correo de prueba enviado';

  @override
  String get smtpTestFailed => 'Falló el correo de prueba';

  @override
  String get ereaderDevicesTitle => 'Lectores electrónicos';

  @override
  String get ereaderDevicesEmpty => 'Aún no hay dispositivos. Añade uno abajo.';

  @override
  String get addEreaderDevice => 'Añadir dispositivo';

  @override
  String get editEreaderDevice => 'Editar dispositivo';

  @override
  String get deleteEreaderDevice => 'Borrar';

  @override
  String get ereaderDeviceName => 'Nombre';

  @override
  String get ereaderDeviceEmail => 'Correo';

  @override
  String get ereaderAvailability => 'Quién puede usar este dispositivo';

  @override
  String get ereaderAvailAdminOrUp => 'Solo administradores';

  @override
  String get ereaderAvailUserOrUp => 'Todos los usuarios';

  @override
  String get ereaderAvailGuestOrUp => 'Todo el mundo';

  @override
  String get ereaderAvailSpecificUsers => 'Usuarios concretos';

  @override
  String ereaderSpecificUsersN(int count) {
    return 'Usuarios concretos ($count)';
  }

  @override
  String get ereaderDevicesSaved => 'Dispositivos guardados';

  @override
  String get ereaderDevicesSaveFailed =>
      'No se pudieron guardar los dispositivos';

  @override
  String libraryCountOne(int count) {
    return '$count biblioteca';
  }

  @override
  String libraryCountOther(int count) {
    return '$count bibliotecas';
  }

  @override
  String serverVersionLabel(String version) {
    return 'Servidor $version';
  }

  @override
  String appVersionServerSuffix(String version) {
    return '  ·  Servidor $version';
  }

  @override
  String backupDateFormat(int month, int day, int year) {
    return '$day/$month/$year';
  }

  @override
  String get backupDetailsSeparator => ' · ';

  @override
  String get bookmarksSortedByPositionReversed =>
      'Ordenados por posición (invertido)';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '\"$title\" en $position';
  }

  @override
  String get deleteBookmarkQuestion => '¿Borrar marcador?';

  @override
  String get cardIconsOnlyChip => 'Solo iconos';

  @override
  String get cardMoreInGridChip => '\"Más\" en la cuadrícula';

  @override
  String get cardLayoutHidden => 'Oculto';

  @override
  String get speed => 'Velocidad';

  @override
  String get details => 'Detalles';

  @override
  String get episodeDetailsLabel => 'Detalles del episodio';

  @override
  String get bookDetailsLabel => 'Detalles del libro';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => 'Ecualizador';

  @override
  String get cast => 'Enviar';

  @override
  String castingToDevice(String device) {
    return 'Enviando a $device';
  }

  @override
  String castToDeviceNamed(String device) {
    return 'Enviar a $device';
  }

  @override
  String get historyShort => 'Historial';

  @override
  String atPosition(String position) {
    return 'en $position';
  }

  @override
  String chaptersChip(int count) {
    return '$count capítulos';
  }

  @override
  String chapterNumber(int number) {
    return 'Capítulo $number';
  }

  @override
  String kbpsValue(int value) {
    return '$value kbps';
  }

  @override
  String get fileInfoTitle => 'Información del archivo';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '1 archivo',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => 'Este libro no tiene detalles de archivos.';

  @override
  String get fileInfoAudio => 'Audio';

  @override
  String get fileInfoEbook => 'Libro electrónico';

  @override
  String get fileInfoOther => 'Otros archivos';

  @override
  String get fileInfoBookOrbitNote =>
      'BookOrbit no informa del códec ni de la tasa de bits.';

  @override
  String fileInfoChannels(int count) {
    return '$count canales';
  }

  @override
  String get fileInfoCover => 'Portada';

  @override
  String get fileInfoMetadata => 'Metadatos';

  @override
  String get fileInfoSupplement => 'Extra';

  @override
  String get fileInfoPathCopied => 'Ruta copiada';

  @override
  String get resetMayNotHaveSynced =>
      'Puede que el restablecimiento no se haya sincronizado: revisa tu servidor';

  @override
  String failedToDownloadEbook(int code) {
    return 'No se pudo descargar el libro electrónico ($code)';
  }

  @override
  String get serverReturnedErrorPage =>
      'El servidor devolvió una página de error en lugar del archivo del libro electrónico';

  @override
  String ebookSaved(String filename) {
    return 'Guardado: $filename';
  }

  @override
  String errorSavingEbook(String error) {
    return 'Error al guardar el libro electrónico: $error';
  }

  @override
  String failedToSaveError(String error) {
    return 'No se pudo guardar: $error';
  }

  @override
  String get adminBackupsLabel => 'Copias de seguridad';

  @override
  String get adminListeningNow => 'Escuchando ahora';

  @override
  String get adminLibraries => 'Bibliotecas';

  @override
  String get adminLibraryShows => 'programas';

  @override
  String get adminLibraryBooks => 'libros';

  @override
  String get adminLibraryFolders => 'carpetas';

  @override
  String get adminLibrarySize => 'tamaño';

  @override
  String get adminLibraryDuration => 'duración';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos faltantes o no válidos',
      one: '1 elemento faltante o no válido',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => 'Revisar';

  @override
  String get adminMissingTitle => 'Elementos faltantes';

  @override
  String adminMissingSubtitle(String library) {
    return 'Entradas de $library cuyos archivos faltan o no se pueden leer';
  }

  @override
  String get adminMissingNone => 'No hay elementos faltantes ni no válidos';

  @override
  String get adminMissingBadge => 'Faltante';

  @override
  String get adminInvalidBadge => 'No válido';

  @override
  String get adminMissingDeleteTitle => 'Eliminar entrada';

  @override
  String adminMissingDeleteOneContent(String title) {
    return '¿Eliminar \"$title\" de Audiobookshelf?';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return '¿Eliminar $count entradas de Audiobookshelf?';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return 'Borrar $count';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return 'Se eliminó $title';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se eliminaron $count entradas',
      one: 'Se eliminó 1 entrada',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => 'No se pudo borrar la entrada';

  @override
  String get adminMatchAction => 'Emparejar';

  @override
  String adminMatchingStarted(String name) {
    return 'Emparejamiento iniciado para $name';
  }

  @override
  String get adminMatchFailed => 'Error';

  @override
  String adminScanFailed(String name) {
    return 'No se pudo escanear $name';
  }

  @override
  String get adminPurgeCacheFailed => 'Error';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => 'admin';

  @override
  String get adminUsersDisabledBadge => 'desactivado';

  @override
  String get adminUsersEditUserTooltip => 'Editar usuario';

  @override
  String get adminUsersOnlineNow => 'En línea ahora';

  @override
  String adminUsersLastSeen(String time) {
    return 'Visto por última vez $time';
  }

  @override
  String get adminUsersNever => 'Nunca';

  @override
  String get adminUsersTotal => 'Total';

  @override
  String get adminUsersNoReadingActivity => 'Sin actividad de lectura';

  @override
  String get adminUsersLoadingDots => 'Cargando...';

  @override
  String get adminUsersLoadMoreSessions => 'Cargar más sesiones';

  @override
  String get adminUsersNoRecentSessions => 'No hay sesiones recientes';

  @override
  String get adminUsersLibraryProgress => 'Progreso de la biblioteca';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return 'Cargar más ($count restantes)';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return 'hace $count m';
  }

  @override
  String get adminUsersNewUser => 'Nuevo usuario';

  @override
  String get adminUsersEditUser => 'Editar usuario';

  @override
  String get adminUsersUsername => 'Usuario';

  @override
  String get adminUsersEnterUsername => 'Introduce el usuario';

  @override
  String get adminUsersPassword => 'Contraseña';

  @override
  String get adminUsersNewPassword => 'Nueva contraseña';

  @override
  String get adminUsersEnterPassword => 'Introduce la contraseña';

  @override
  String get adminUsersLeaveBlankToKeep =>
      'Déjalo en blanco para conservar la actual';

  @override
  String get adminUsersAccountType => 'Tipo de cuenta';

  @override
  String get adminUsersTypeGuest => 'Invitado';

  @override
  String get adminUsersTypeUser => 'Usuario';

  @override
  String get adminUsersTypeAdmin => 'Admin';

  @override
  String get adminUsersStatus => 'Estado';

  @override
  String get adminUsersAccountActive => 'Cuenta activa';

  @override
  String get adminUsersAccountActiveSub =>
      'Las cuentas desactivadas no pueden iniciar sesión';

  @override
  String get adminUsersLocked => 'Bloqueada';

  @override
  String get adminUsersLockedSub => 'Impide cambiar la contraseña';

  @override
  String get adminUsersPermissions => 'Permisos';

  @override
  String get adminUsersPermDownload => 'Descargar';

  @override
  String get adminUsersPermUpdate => 'Actualizar';

  @override
  String get adminUsersPermUpdateSub =>
      'Editar metadatos y elementos de la biblioteca';

  @override
  String get adminUsersPermDelete => 'Borrar';

  @override
  String get adminUsersPermUpload => 'Subir';

  @override
  String get adminUsersPermExplicit => 'Contenido explícito';

  @override
  String get adminUsersLibraryAccess => 'Acceso a bibliotecas';

  @override
  String get adminUsersAccessAllLibraries => 'Acceso a todas las bibliotecas';

  @override
  String get adminUsersCreateUser => 'Crear usuario';

  @override
  String get adminUsersSaveChanges => 'Guardar cambios';

  @override
  String get adminUsersUsernameRequired => 'El usuario es obligatorio';

  @override
  String get adminUsersPasswordRequired => 'La contraseña es obligatoria';

  @override
  String get adminUsersUserCreated => 'Usuario creado';

  @override
  String get adminUsersUserUpdated => 'Usuario actualizado';

  @override
  String get adminUsersFailedCreate => 'No se pudo crear el usuario';

  @override
  String get adminUsersFailedUpdate => 'No se pudo actualizar el usuario';

  @override
  String get adminUsersThisUser => 'este usuario';

  @override
  String get adminUsersDeleteUserTitle => '¿Borrar usuario?';

  @override
  String adminUsersDeleteUserContent(String name) {
    return '¿Borrar $name de forma permanente?';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return '$name borrado';
  }

  @override
  String get adminUsersFailedDelete => 'No se pudo borrar el usuario';

  @override
  String get adminUsersUnlinkOpenId => 'Desvincular OpenID';

  @override
  String get adminUsersUnlinkOpenIdTitle => '¿Desvincular OpenID?';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return '¿Eliminar la conexión OpenID de $name? Tendrá que iniciar sesión con OpenID de nuevo para volver a vincularla.';
  }

  @override
  String get adminUsersOpenIdUnlinked => 'OpenID desvinculado';

  @override
  String get adminUsersFailedUnlinkOpenId => 'No se pudo desvincular OpenID';

  @override
  String adminUsersByAuthor(String author) {
    return 'de $author';
  }

  @override
  String get adminUsersListened => 'Escuchado';

  @override
  String get adminUsersStartedAtPosition => 'Empezó en la posición';

  @override
  String get adminUsersEndedAtPosition => 'Terminó en la posición';

  @override
  String get adminUsersTotalDuration => 'Duración total';

  @override
  String get adminUsersStarted => 'Inicio';

  @override
  String get adminUsersUpdated => 'Actualizado';

  @override
  String get adminUsersClient => 'Cliente';

  @override
  String get adminUsersDevice => 'Dispositivo';

  @override
  String get adminUsersOs => 'SO';

  @override
  String get adminUsersPlayMethod => 'Método de reproducción';

  @override
  String get adminUsersPlayDirect => 'Reproducción directa';

  @override
  String get adminUsersPlayDirectStream => 'Flujo directo';

  @override
  String get adminUsersPlayTranscode => 'Transcodificar';

  @override
  String get adminUsersPlayLocal => 'Local';

  @override
  String get adminPodcastsCheckNewEpisodesTitle => 'Buscar episodios nuevos';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      'Esto revisará los feeds RSS de todos los podcasts y descargará los episodios nuevos que encuentre (si la descarga automática está activada).';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle =>
      'Escanear el feed RSS y descargar episodios nuevos';

  @override
  String get adminPodcastsCheck => 'Buscar';

  @override
  String get adminPodcastsCheckingForNew => 'Buscando episodios nuevos…';

  @override
  String get adminPodcastsCheckingForNewDots => 'Buscando episodios nuevos...';

  @override
  String get adminPodcastsFailedCheckEpisodes =>
      'No se pudieron revisar los episodios';

  @override
  String get adminPodcastsCheckFeedsTooltip =>
      'Buscar episodios nuevos en los feeds';

  @override
  String get adminPodcastsNoPodcastsYet => 'Aún no hay podcasts';

  @override
  String get adminPodcastsTapPlusHint =>
      'Toca + para buscar y añadir programas';

  @override
  String adminPodcastsEpisodesCount(int count) {
    return '$count episodios';
  }

  @override
  String get adminPodcastsAddPodcast => 'Añadir podcast';

  @override
  String get adminPodcastsCouldNotFindFeed =>
      'No se encontró el feed del podcast';

  @override
  String get adminPodcastsSearchHint => 'Buscar podcasts…';

  @override
  String get adminPodcastsSearchItunesHint => 'Buscar en iTunes...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return 'Buscar \"$query\" en iTunes';
  }

  @override
  String get adminPodcastsNoPodcastsFound => 'No se encontraron podcasts';

  @override
  String get adminPodcastsRelToday => 'Hoy';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return 'hace $count sem';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return 'hace $count m';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return 'hace $count a';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return 'Actualizado $when';
  }

  @override
  String get adminPodcastsGenreAll => 'Todos';

  @override
  String get adminPodcastsGenreArts => 'Arte';

  @override
  String get adminPodcastsGenreComedy => 'Comedia';

  @override
  String get adminPodcastsGenreEducation => 'Educación';

  @override
  String get adminPodcastsGenreTvFilm => 'TV y cine';

  @override
  String get adminPodcastsGenreMusic => 'Música';

  @override
  String get adminPodcastsGenreNews => 'Noticias';

  @override
  String get adminPodcastsGenreReligion => 'Religión';

  @override
  String get adminPodcastsGenreScience => 'Ciencia';

  @override
  String get adminPodcastsGenreSports => 'Deportes';

  @override
  String get adminPodcastsGenreTechnology => 'Tecnología';

  @override
  String get adminPodcastsGenreBusiness => 'Negocios';

  @override
  String get adminPodcastsGenreFiction => 'Ficción';

  @override
  String get adminPodcastsGenreSocietyCulture => 'Sociedad y cultura';

  @override
  String get adminPodcastsGenreHealthFitness => 'Salud y bienestar';

  @override
  String get adminPodcastsGenreTrueCrime => 'Crimen real';

  @override
  String get adminPodcastsGenreHistory => 'Historia';

  @override
  String get adminPodcastsGenreKidsFamily => 'Niños y familia';

  @override
  String get adminPodcastsPodcastFallback => 'Podcast';

  @override
  String get adminPodcastsEpisodeFallback => 'Episodio';

  @override
  String get adminPodcastsNoFeedFound => 'No se encontró la URL del feed';

  @override
  String get adminPodcastsNoFeedAvailable => 'No hay URL de feed disponible';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return '$title añadido a la biblioteca';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return 'No se pudo añadir $title';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    return '$count episodios en el feed';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    return '+ $count episodios más';
  }

  @override
  String get adminPodcastsAdding => 'Añadiendo…';

  @override
  String get adminPodcastsAddToLibrary => 'Añadir a la biblioteca';

  @override
  String get adminPodcastsRemoveShowTitle => '¿Eliminar programa?';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return '¿Eliminar \"$title\" y todos sus episodios del servidor? Esta acción no se puede deshacer.';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return 'Se eliminó \"$title\"';
  }

  @override
  String get adminPodcastsFailedRemoveShow => 'No se pudo eliminar el programa';

  @override
  String get adminPodcastsRemoveShowTooltip => 'Eliminar programa';

  @override
  String get adminPodcastsSelectMultipleTooltip => 'Seleccionar varios';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return '$count descargados';
  }

  @override
  String get adminPodcastsTabDownloaded => 'Descargados';

  @override
  String get adminPodcastsTabFeed => 'Feed';

  @override
  String get adminPodcastsTabSettings => 'Ajustes';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return 'Descargando \"$title\"';
  }

  @override
  String get adminPodcastsFailedDownload => 'No se pudo descargar';

  @override
  String get adminPodcastsDeleteEpisodeTitle => '¿Borrar episodio?';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return '¿Borrar \"$title\"?';
  }

  @override
  String get adminPodcastsDeleted => 'Borrado';

  @override
  String get adminPodcastsFailed => 'Error';

  @override
  String get adminPodcastsDeleteEpisodesTitle => '¿Borrar episodios?';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return '¿Borrar $count episodio(s) del servidor?';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return 'Se borraron $count episodio(s)';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload =>
      'Explorar el feed para descargar';

  @override
  String get adminPodcastsDownloadingDots => 'Descargando...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return 'Borrar $count episodio(s)';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return 'Descargando $count episodio(s)';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return 'Descargar $count episodio(s)';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter =>
      'Buscar episodios posteriores a';

  @override
  String get adminPodcastsSelectDate => 'Seleccionar fecha';

  @override
  String get adminPodcastsMaxEpisodes => 'Máximo de episodios a descargar';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return 'No se encontraron episodios nuevos después del $date';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return 'Se encontraron $count episodio(s) nuevo(s): descargando';
  }

  @override
  String get adminPodcastsFailedToCheckNew =>
      'No se pudo buscar episodios nuevos';

  @override
  String get adminPodcastsCheckAndDownload => 'Buscar y descargar';

  @override
  String get adminPodcastsMatchPodcast => 'Emparejar podcast';

  @override
  String get adminPodcastsMatchPodcastSubtitle =>
      'Busca en iTunes para actualizar la portada y los metadatos';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes =>
      'Descargar episodios nuevos automáticamente';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle =>
      'El servidor descarga los episodios nuevos automáticamente';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle =>
      'Los episodios nuevos no se descargan automáticamente';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate =>
      'No se pudo actualizar el ajuste de descarga automática';

  @override
  String get adminPodcastsMaxEpisodesToKeep =>
      'Máximo de episodios a conservar';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      '0 conserva todos los episodios. Cuando se descarga automáticamente un episodio nuevo, Audiobookshelf elimina el más antiguo si el programa supera este límite.';

  @override
  String get adminPodcastsNoEpisodeLimit => 'Sin límite';

  @override
  String get adminPodcastsEpisodeLimitInvalid =>
      'Introduce 0 o un número entero';

  @override
  String get adminPodcastsCheckSchedule => 'Programación de búsqueda';

  @override
  String get adminPodcastsFrequency => 'Frecuencia';

  @override
  String get adminPodcastsFreqHourly => 'Cada hora';

  @override
  String get adminPodcastsFreqDaily => 'Diaria';

  @override
  String get adminPodcastsFreqWeekly => 'Semanal';

  @override
  String get adminPodcastsDay => 'Día';

  @override
  String get adminPodcastsTime => 'Hora';

  @override
  String get adminPodcastsDaySun => 'Dom';

  @override
  String get adminPodcastsDayMon => 'Lun';

  @override
  String get adminPodcastsDayTue => 'Mar';

  @override
  String get adminPodcastsDayWed => 'Mié';

  @override
  String get adminPodcastsDayThu => 'Jue';

  @override
  String get adminPodcastsDayFri => 'Vie';

  @override
  String get adminPodcastsDaySat => 'Sáb';

  @override
  String get adminPodcastsFeedUrl => 'URL del feed';

  @override
  String get adminPodcastsBack => 'Atrás';

  @override
  String get adminPodcastsRootOnly => 'Solo root';

  @override
  String get adminPodcastsDeleting => 'Borrando...';

  @override
  String get adminPodcastsDeleteEpisode => 'Borrar episodio';

  @override
  String adminPodcastsSeasonChip(String season) {
    return 'Temporada $season';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return 'Ep. $number';
  }

  @override
  String get adminPodcastsApplyingMatch => 'Aplicando coincidencia...';

  @override
  String get adminPodcastsNoResults => 'Sin resultados';

  @override
  String get adminPodcastsPodcastMatched => 'Podcast emparejado y actualizado';

  @override
  String get adminPodcastsFailedMatch => 'No se pudo emparejar el podcast';

  @override
  String get adminPodcastsSelectAll => 'Seleccionar todo';

  @override
  String get adminPodcastsSelectAllNew => 'Solo nuevos';

  @override
  String get adminPodcastsSortNewestFirst => 'Más recientes primero';

  @override
  String get adminPodcastsSortOldestFirst => 'Más antiguos primero';

  @override
  String get adminPodcastsEditInfo => 'Editar información';

  @override
  String get adminPodcastsEditInfoSubtitle =>
      'Cambia el título, la descripción, la portada y más';

  @override
  String get adminPodcastsEditTitle => 'Editar podcast';

  @override
  String get adminPodcastsReleaseDate => 'Fecha de publicación';

  @override
  String get adminPodcastsExplicit => 'Explícito';

  @override
  String get adminPodcastsExplicitSubtitle =>
      'Marcar este podcast como explícito';

  @override
  String get episodeListEpisodeFallback => 'Episodio';

  @override
  String get episodeListUnknownPodcast => 'Podcast desconocido';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodios marcados como terminados',
      one: '1 episodio marcado como terminado',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodios marcados como no terminados',
      one: '1 episodio marcado como no terminado',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes =>
      'Cancelar suscripción a episodios nuevos';

  @override
  String get episodeListSubscribeToNewEpisodes =>
      'Suscribirse a episodios nuevos';

  @override
  String get episodeListSubscribeTitle => '¿Suscribirte a este podcast?';

  @override
  String get episodeListSubscribeContent =>
      'Los episodios nuevos se descargarán automáticamente y se añadirán a tu cola de Absorbing cuando aparezcan en el servidor.';

  @override
  String get episodeListSubscribe => 'Suscribirse';

  @override
  String get episodeListShowFinishedEpisodes => 'Mostrar episodios terminados';

  @override
  String get episodeListHideFinishedEpisodes => 'Ocultar episodios terminados';

  @override
  String get episodeListShowSettings => 'Ajustes del programa';

  @override
  String get episodeListPlaysNewerToOlder =>
      'Reproduce de los episodios más nuevos a los más antiguos';

  @override
  String get episodeListPlaysOlderToNewer =>
      'Reproduce de los episodios más antiguos a los más nuevos';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodios',
      one: '1 episodio',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sin terminar',
      one: '1 sin terminar',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => 'Descarga automática';

  @override
  String get episodeListSubscribedChip => 'Suscrito';

  @override
  String get episodeListExplicitChip => 'Explícito';

  @override
  String get episodeListSortNewest => 'Más recientes';

  @override
  String get episodeListSortOldest => 'Más antiguos';

  @override
  String get episodeListSortBy => 'Ordenar episodios';

  @override
  String get episodeListSortPubDate => 'Fecha de publicación';

  @override
  String get episodeListSortTitle => 'Título';

  @override
  String get episodeListSortSeason => 'Temporada';

  @override
  String get episodeListSortEpisode => 'Número de episodio';

  @override
  String get episodeListSortFileName => 'Nombre de archivo';

  @override
  String get episodeListSortReverseHint =>
      'Toca de nuevo para invertir el orden';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return '\"$title\" añadido a Absorbing';
  }

  @override
  String get episodeDetailEpisodeFallback => 'Episodio';

  @override
  String get episodeDetailMarkedNotFinished => 'Marcado como no terminado';

  @override
  String get episodeDetailMarkedFinishedNice =>
      'Marcado como terminado: ¡genial!';

  @override
  String get episodeDetailMarkAbsorbedContent =>
      'Esto establecerá tu progreso al 100% en este episodio.';

  @override
  String get episodeDetailResetProgressContent =>
      'Esto borrará todo el progreso de este episodio y lo volverá a poner al principio. No se puede deshacer.';

  @override
  String get episodeDetailToday => 'Hoy';

  @override
  String get episodeDetailYesterday => 'Ayer';

  @override
  String episodeDetailDaysAgo(int count) {
    return 'hace $count d';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return 'hace $count sem';
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
  String get episodeDetailResume => 'Reanudar';

  @override
  String get episodeDetailPlayEpisode => 'Reproducir episodio';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return 'Episodio $number';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return 'Temporada $number';
  }

  @override
  String get editMetadataUpdatedFromMatch =>
      'Metadatos actualizados a partir de la coincidencia';

  @override
  String editMetadataConfirmMatch(String title) {
    return 'Esto actualizará los metadatos de este libro en el servidor usando:\n\n\"$title\"\n\nTodos los campos y la portada se sobrescribirán en el servidor.';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return 'Esto actualizará los metadatos de este libro en el servidor usando:\n\n\"$title\" de $author\n\nTodos los campos y la portada se sobrescribirán en el servidor.';
  }

  @override
  String get seriesBooksFindMissingTitle => 'Buscar libros faltantes';

  @override
  String get seriesBooksFindMissingContent =>
      'Esto busca en Audible los libros de esta serie que puedan faltar en tu biblioteca.\n\nLos libros se emparejan primero por ASIN (según si tu servidor tiene ASIN para sus libros) y, si no, por el título. Los resultados pueden no ser del todo exactos.';

  @override
  String get seriesBooksCouldNotFindOnAudible =>
      'No se encontró esta serie en Audible';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Esto quitará el estado de terminado de los $count libros de esta serie.',
      one: 'Esto quitará el estado de terminado del único libro de esta serie.',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Esto marcará como terminados los $count libros de esta serie.',
      one: 'Esto marcará como terminado el único libro de esta serie.',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => 'Desmarcar todo';

  @override
  String get seriesBooksShowAllBooks => 'Mostrar todos los libros';

  @override
  String get seriesBooksGroupBySubSeries => 'Agrupar por subseries';

  @override
  String get seriesBooksLoadingSubSeries => 'Cargando subseries...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => 'Completado';

  @override
  String get seriesBooksExplicitBadge => 'E';

  @override
  String get expandedCardStreaming => 'Streaming';

  @override
  String get expandedCardDeviceFallback => 'Dispositivo';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$position en $bookTitle';
  }

  @override
  String get bookmarksScreenClose => 'Cerrar';

  @override
  String get bookmarksScreenSortNewest => 'Más recientes';

  @override
  String get bookmarksScreenSortPosition => 'Posición';

  @override
  String statsScreenStreakDays(int count) {
    return '$count d';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count sesión';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count sesiones';
  }

  @override
  String get statsScreenDayMon => 'Lun';

  @override
  String get statsScreenDayTue => 'Mar';

  @override
  String get statsScreenDayWed => 'Mié';

  @override
  String get statsScreenDayThu => 'Jue';

  @override
  String get statsScreenDayFri => 'Vie';

  @override
  String get statsScreenDaySat => 'Sáb';

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
  String get statsScreenCouldNotLoadItem => 'No se pudo cargar el elemento';

  @override
  String get statsScreenCouldNotFindEpisode => 'No se encontró el episodio';

  @override
  String statsScreenByAuthor(String author) {
    return 'de $author';
  }

  @override
  String get statsScreenListened => 'Escuchado';

  @override
  String get sessionEditTitle => 'Editar sesión';

  @override
  String get sessionDayLabel => 'Día';

  @override
  String get sessionEndPosition => 'Posición final';

  @override
  String get sessionEndPositionHint =>
      'Cambiar esto también puede actualizar tu progreso actual.';

  @override
  String get statsViewSessions => 'Ver sesiones';

  @override
  String statsSessionsForDate(String date) {
    return 'Sesiones del $date';
  }

  @override
  String get statsNoSessionsForDate =>
      'No se encontraron sesiones de escucha de este día';

  @override
  String get statsSearchSessions => 'Buscar sesiones';

  @override
  String get statsNoSessionSearchResults =>
      'Ninguna sesión coincide con tu búsqueda';

  @override
  String get statsSessionsLoadFailed =>
      'No se pudieron cargar las sesiones de este día';

  @override
  String get sessionDeleteConfirmTitle => '¿Borrar sesión?';

  @override
  String get sessionDeleteConfirmBody =>
      'Esto elimina la sesión y reduce tus totales de escucha según su duración. No se puede deshacer.';

  @override
  String get sessionSaved => 'Sesión actualizada';

  @override
  String get sessionDeleted => 'Sesión borrada';

  @override
  String get sessionSaveFailed => 'No se pudieron guardar los cambios';

  @override
  String get sessionDeleteFailed => 'No se pudo borrar esta sesión';

  @override
  String get statsScreenStartedAtPosition => 'Empezó en la posición';

  @override
  String get statsScreenEndedAtPosition => 'Terminó en la posición';

  @override
  String get statsScreenTotalDuration => 'Duración total';

  @override
  String get statsScreenStarted => 'Inicio';

  @override
  String get statsScreenUpdated => 'Actualizado';

  @override
  String get statsScreenClient => 'Cliente';

  @override
  String get statsScreenDevice => 'Dispositivo';

  @override
  String get statsScreenOs => 'SO';

  @override
  String get statsScreenPlayMethod => 'Método de reproducción';

  @override
  String get statsScreenLoading => 'Cargando...';

  @override
  String get statsScreenJumpToStart => 'Ir al inicio';

  @override
  String get statsScreenJumpToEnd => 'Ir al final';

  @override
  String get statsScreenPlayMethodDirect => 'Reproducción directa';

  @override
  String get statsScreenPlayMethodDirectStream => 'Flujo directo';

  @override
  String get statsScreenPlayMethodTranscode => 'Transcodificar';

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
  String get statsScreenMonthJan => 'ene';

  @override
  String get statsScreenMonthFeb => 'feb';

  @override
  String get statsScreenMonthMar => 'mar';

  @override
  String get statsScreenMonthApr => 'abr';

  @override
  String get statsScreenMonthMay => 'may';

  @override
  String get statsScreenMonthJun => 'jun';

  @override
  String get statsScreenMonthJul => 'jul';

  @override
  String get statsScreenMonthAug => 'ago';

  @override
  String get statsScreenMonthSep => 'sep';

  @override
  String get statsScreenMonthOct => 'oct';

  @override
  String get statsScreenMonthNov => 'nov';

  @override
  String get statsScreenMonthDec => 'dic';

  @override
  String get upcomingReleasesTitle => 'Próximos lanzamientos';

  @override
  String get upcomingReleasesRescanTitle => '¿Volver a escanear?';

  @override
  String upcomingReleasesRescanContent(int days) {
    return 'Estos resultados tienen $days días. Las fechas de lanzamiento pueden haber cambiado. ¿Quieres volver a escanear?';
  }

  @override
  String get upcomingReleasesNotNow => 'Ahora no';

  @override
  String get upcomingReleasesRescan => 'Volver a escanear';

  @override
  String get upcomingReleasesRescanReleaseDate =>
      'Volver a escanear la fecha de lanzamiento';

  @override
  String get upcomingReleasesRescanning => 'Escaneando de nuevo...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return 'Actualizado: $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound =>
      'No se encontró la fecha de lanzamiento';

  @override
  String get upcomingReleasesRescanFailed => 'Error al volver a escanear';

  @override
  String get upcomingReleasesRemoveFromList => 'Quitar de la lista';

  @override
  String get upcomingReleasesRemovedFromList => 'Quitado de la lista';

  @override
  String get upcomingReleasesDateChip => 'Fecha';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return 'Revisando $name... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => 'Cargando series...';

  @override
  String get upcomingReleasesScannedToday => '(escaneado hoy)';

  @override
  String get upcomingReleasesScannedYesterday => '(escaneado ayer)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '(escaneado hace $days días)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return '$count próximos';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return '$count recientes';
  }

  @override
  String get upcomingReleasesNoneFound =>
      'No se encontraron lanzamientos próximos ni recientes';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$summary en $count series';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return 'Se revisaron $count series en Audible';
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
  String get upcomingReleasesBadgeUpcoming => 'PRÓXIMO';

  @override
  String get upcomingReleasesBadgeAdded => 'AÑADIDO';

  @override
  String get upcomingReleasesBadgeMissing => 'FALTANTE';

  @override
  String get upcomingReleasesScanSettingsTitle => 'Ajustes de escaneo';

  @override
  String get upcomingReleasesFinishedAfterTitle =>
      'Considerar una serie terminada después de';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      'Las series cuyo último libro es más antiguo que esto se omiten en los escaneos y solo se vuelven a revisar cada uno o dos meses.';

  @override
  String upcomingReleasesFinishedAfterYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count años',
      one: '1 año',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesFinishedAfterNever => 'Nunca';

  @override
  String get upcomingReleasesSkippedTitle => 'Series omitidas';

  @override
  String get upcomingReleasesSkippedNone => 'Aún no se ha omitido nada';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count omitidas',
      one: '1 omitida',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Último libro hace $count años',
      one: 'Último libro hace 1 año',
      zero: 'Último libro hace menos de un año',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched =>
      'No se pudo emparejar esta serie en Audible';

  @override
  String get upcomingReleasesSkippedScanNow => 'Escanear ahora';

  @override
  String get upcomingReleasesSkippedAlwaysScan => 'Escanear siempre';

  @override
  String get upcomingReleasesSkippedNeverScan => 'No escanear nunca';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return 'Se encontraron lanzamientos nuevos en $name';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return 'Nada nuevo en $name';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary =>
      'Esta lista es de otra biblioteca. Vuelve a escanear para actualizarla.';

  @override
  String get upcomingReleasesChipUpcoming => 'Próximos';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count faltantes',
      one: '1 faltante',
      zero: 'Faltantes',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => 'No se encontraron libros faltantes';

  @override
  String get upcomingReleasesScanSeries => 'Escanear series';

  @override
  String get upcomingReleasesScanUpcomingOption => 'Próximos lanzamientos';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc =>
      'Escaneo rápido de libros nuevos y próximos';

  @override
  String get upcomingReleasesScanDeepOption => 'Escaneo profundo';

  @override
  String get upcomingReleasesScanDeepOptionDesc =>
      'También encuentra libros faltantes en todas las series: tarda más';

  @override
  String get upcomingReleasesFirstScanNote =>
      'El primer escaneo revisa todas las series en Audible y puede tardar unos minutos. Los siguientes serán mucho más rápidos una vez ordenadas tus series.';

  @override
  String get upcomingReleasesLastScanReport => 'Informe del último escaneo';

  @override
  String upcomingReleasesReportChecked(int count) {
    return 'Revisadas en Audible: $count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return 'Omitidas: $count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return 'Sin coincidencia en Audible: $count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return 'No se pudieron revisar: $count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return 'Se encontraron $upcoming próximos, $recent recientes';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return 'Se encontraron $upcoming próximos, $recent recientes, $missing faltantes';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return '+$count más';
  }

  @override
  String get upcomingReleasesBadgeNew => 'NUEVO';

  @override
  String get upcomingReleasesOpenLibrarySeries =>
      'Abrir serie en la biblioteca';

  @override
  String get upcomingReleasesAsinCopied => 'ASIN de la serie copiado';

  @override
  String get upcomingReleasesSetSeriesAsin => 'Establecer ASIN de la serie';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      'Busca la serie en audible.com y copia el enlace de la página: el ASIN es el código de 10 caracteres que empieza por B0 (como B08S2YN3YS). También funciona pegar el enlace completo.';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… o enlace de audible.com';

  @override
  String get upcomingReleasesSetAsinSave => 'Guardar';

  @override
  String get upcomingReleasesSetAsinInvalid =>
      'No se encontró ningún ASIN en ese texto';

  @override
  String get upcomingReleasesSetAsinSaved =>
      'Serie vinculada: escaneando ahora';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Quitar $count libros',
      one: 'Quitar libro',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => 'Quitar de este escaneo';

  @override
  String get upcomingReleasesRemoveThisScanDesc =>
      'Puede volver en un escaneo futuro';

  @override
  String get upcomingReleasesRemoveForever =>
      'Quitar de este escaneo y de los futuros';

  @override
  String get upcomingReleasesRemoveForeverDesc =>
      'Pasa a la lista de quitados; puedes restaurarlo cuando quieras';

  @override
  String get upcomingReleasesRemovedForeverToast =>
      'Quitado: no aparecerá en escaneos futuros';

  @override
  String get upcomingReleasesRemovedBooksTitle => 'Libros quitados';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => 'No hay libros quitados';

  @override
  String get upcomingReleasesRestore => 'Restaurar';

  @override
  String get upcomingReleasesRestoredToast => 'Restaurado';

  @override
  String get upcomingReleasesRestoredNextScan =>
      'Restaurado: aparecerá tras el próximo escaneo';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seleccionados',
      one: '1 seleccionado',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => 'Solicitar';

  @override
  String get upcomingReleasesBulkRemove => 'Quitar';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count quitados',
      one: '1 quitado',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitudes enviadas',
      one: '1 solicitud enviada',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return '$count omitidos';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count series escaneadas de nuevo',
      one: '1 serie escaneada de nuevo',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return '$count con libros nuevos';
  }

  @override
  String get seriesExcludeFromScan => 'Excluir del escaneo de series';

  @override
  String get seriesIncludeInScan => 'Incluir en el escaneo de series';

  @override
  String get homeScreenEpisodeFallback => 'Episodio';

  @override
  String get libraryScreenUnknownTitle => 'Título desconocido';

  @override
  String get playlistDetailDefaultName => 'Lista de reproducción';

  @override
  String playlistDetailItemCount(int count) {
    return '$count elementos';
  }

  @override
  String get playlistDetailUnfinished => 'Sin terminar';

  @override
  String get playlistDetailRemoveFromPlaylist =>
      'Quitar de la lista de reproducción';

  @override
  String get playlistDetailDone => 'Completado';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return '$count elementos marcados como terminados';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return '$count elementos marcados como sin terminar';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return '$count elementos quitados';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return '\"$title\" añadido a Absorbing';
  }

  @override
  String get collectionDetailDefaultName => 'Colección';

  @override
  String smartScopeBookCount(int count) {
    return 'Ámbito inteligente · $count libros';
  }

  @override
  String get smartScopeNew => 'Nuevo ámbito inteligente';

  @override
  String get smartScopeNewSubtitle =>
      'Guarda un conjunto de filtros como una lista que se mantiene actualizada sola';

  @override
  String get smartScopeEditTitle => 'Editar ámbito inteligente';

  @override
  String get smartScopeIcon => 'Icono';

  @override
  String get smartScopePublic => 'Visible para todos los usuarios';

  @override
  String get smartScopeKobo => 'Sincronizar con Kobo';

  @override
  String get smartScopeRules => 'Reglas';

  @override
  String get smartScopeMatchAll => 'Cumplir todas';

  @override
  String get smartScopeMatchAny => 'Cumplir cualquiera';

  @override
  String get smartScopeAddRule => 'Añadir regla';

  @override
  String get smartScopeAddGroup => 'Añadir grupo';

  @override
  String get smartScopeGroup => 'Grupo';

  @override
  String get smartScopeStartFrom => 'Empezar desde';

  @override
  String get smartScopeFromScratch => 'Crear desde cero';

  @override
  String get smartScopeTplHasSeries => 'Tiene una serie';

  @override
  String get smartScopeTplRecent => 'Añadidos recientemente';

  @override
  String get smartScopeTplPdf => 'Solo PDF';

  @override
  String get smartScopeTplNoGenres => 'Sin géneros';

  @override
  String get smartScopeTplEpub => 'Solo EPUB';

  @override
  String get smartScopeCounting => 'Contando...';

  @override
  String get smartScopeSort => 'Orden predeterminado';

  @override
  String get smartScopeAddSort => 'Añadir nivel de orden';

  @override
  String get smartScopeSortNone =>
      'Sin orden definido, así que los libros se ordenan por título.';

  @override
  String get smartScopeAscending => 'Ascendente';

  @override
  String get smartScopeDescending => 'Descendente';

  @override
  String get smartScopeDelete => 'Borrar ámbito inteligente';

  @override
  String get smartScopeSaveFailed => 'No se pudo guardar el ámbito inteligente';

  @override
  String get smartScopeDeleteFailed =>
      'No se pudo borrar el ámbito inteligente';

  @override
  String get smartScopeLoadFailed => 'No se pudo cargar el ámbito inteligente';

  @override
  String get smartScopeUnsupportedRule =>
      'Esta regla solo se puede cambiar en la web de BookOrbit. Se conserva tal cual.';

  @override
  String get smartScopeAnd => 'y';

  @override
  String get smartScopeDays => 'días';

  @override
  String get smartScopeWeeks => 'semanas';

  @override
  String get smartScopeMonths => 'meses';

  @override
  String get smartScopePickDate => 'Elige una fecha';

  @override
  String get smartScopeAddValue => 'Añadir un valor';

  @override
  String get smartScopeValue => 'Valor';

  @override
  String get smartScopeCustomFields => 'Campos personalizados';

  @override
  String get smartScopeAnyProvider => 'Cualquier proveedor';

  @override
  String get smartScopeScoreOutstanding => 'Sobresaliente';

  @override
  String get smartScopeScoreGood => 'Buena';

  @override
  String get smartScopeScoreFair => 'Aceptable';

  @override
  String get smartScopeScorePoor => 'Baja';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => 'Hasta 20 valores';

  @override
  String get scopeFieldTitle => 'Título';

  @override
  String get scopeFieldAuthor => 'Autor';

  @override
  String get scopeFieldSeries => 'Serie';

  @override
  String get scopeFieldSeriesIndex => 'Número de serie';

  @override
  String get scopeFieldGenre => 'Género';

  @override
  String get scopeFieldTag => 'Etiqueta';

  @override
  String get scopeFieldReadStatus => 'Estado de lectura';

  @override
  String get scopeFieldReadProgress => 'Progreso de lectura';

  @override
  String get scopeFieldRating => 'Tu valoración';

  @override
  String get scopeFieldFormat => 'Formato';

  @override
  String get scopeFieldLibrary => 'Biblioteca';

  @override
  String get scopeFieldCollection => 'Colección';

  @override
  String get scopeFieldPublisher => 'Editorial';

  @override
  String get scopeFieldLanguage => 'Idioma';

  @override
  String get scopeFieldPublishedDate => 'Fecha de publicación';

  @override
  String get scopeFieldPublishedYear => 'Año de publicación';

  @override
  String get scopeFieldAddedAt => 'Fecha de adición';

  @override
  String get scopeFieldStartedAt => 'Fecha de inicio';

  @override
  String get scopeFieldFinishedAt => 'Fecha de finalización';

  @override
  String get scopeFieldPageCount => 'Número de páginas';

  @override
  String get scopeFieldFileSize => 'Tamaño del archivo';

  @override
  String get scopeFieldCommunityRating => 'Valoración de la comunidad';

  @override
  String get scopeFieldCommunityRatingCount =>
      'Número de reseñas de la comunidad';

  @override
  String get scopeFieldMetadataScore => 'Puntuación de metadatos';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => 'Descripción';

  @override
  String get scopeFieldCover => 'Portada';

  @override
  String get scopeFieldAudioCover => 'Portada del audiolibro';

  @override
  String get scopeFieldFileAvailability => 'Disponibilidad del archivo';

  @override
  String get scopeFieldLockStatus => 'Estado de bloqueo';

  @override
  String get scopeFieldSeriesStatus => 'Estado de la serie';

  @override
  String get scopeSortUpdatedAt => 'Fecha de actualización';

  @override
  String get scopeSortLastReadAt => 'Última lectura';

  @override
  String get scopeSortRandom => 'Aleatorio';

  @override
  String get scopeOpContains => 'contiene';

  @override
  String get scopeOpNotContains => 'no contiene';

  @override
  String get scopeOpStartsWith => 'empieza por';

  @override
  String get scopeOpEndsWith => 'termina en';

  @override
  String get scopeOpEq => 'es';

  @override
  String get scopeOpNotEq => 'no es';

  @override
  String get scopeOpIsEmpty => 'está vacío';

  @override
  String get scopeOpIsNotEmpty => 'no está vacío';

  @override
  String get scopeOpGt => 'mayor que';

  @override
  String get scopeOpGte => 'al menos';

  @override
  String get scopeOpLt => 'menor que';

  @override
  String get scopeOpLte => 'como máximo';

  @override
  String get scopeOpBetween => 'entre';

  @override
  String get scopeOpIncludesAny => 'incluye alguno de';

  @override
  String get scopeOpIncludesAll => 'incluye todos los de';

  @override
  String get scopeOpExcludesAll => 'excluye todos los de';

  @override
  String get scopeOpBefore => 'antes de';

  @override
  String get scopeOpAfter => 'después de';

  @override
  String get scopeOpWithinLast => 'en los últimos';

  @override
  String get scopeOpIsMissing => 'falta';

  @override
  String get scopeOpIsPresent => 'está presente';

  @override
  String get scopeOpIsUnread => 'no está leído';

  @override
  String get scopeOpIsInProgress => 'está en curso';

  @override
  String get scopeOpIsFinished => 'está terminado';

  @override
  String get scopeOpIsLocked => 'está bloqueado';

  @override
  String get scopeOpIsUnlocked => 'está desbloqueado';

  @override
  String get scopeOpIsUpNext => 'es el siguiente';

  @override
  String get scopeOpIsTrue => 'es sí';

  @override
  String get scopeOpIsFalse => 'es no';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros coinciden',
      one: '1 libro coincide',
      zero: 'Ningún libro coincide',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return '¿Borrar \"$name\"? Esta acción no se puede deshacer.';
  }

  @override
  String collectionDetailBookCount(int count) {
    return '$count libros';
  }

  @override
  String get collectionDetailDone => 'Completado';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return '\"$title\" añadido a Absorbing';
  }

  @override
  String get audibleSeriesNoBooksFound => 'No se encontraron libros en Audible';

  @override
  String get audibleSeriesFailedToLoad =>
      'No se pudo cargar la serie desde Audible';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return '$total en Audible · $missing faltantes';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return '$total en Audible · $missing faltantes · $upcoming próximos';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return 'Faltantes ($count)';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return 'Próximos ($count)';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return 'Todos ($count)';
  }

  @override
  String get audibleSeriesSearching => 'Buscando en Audible...';

  @override
  String get audibleSeriesCompleteSeries => '¡Tienes la serie completa!';

  @override
  String get audibleSeriesNoUpcoming =>
      'No se encontraron próximos lanzamientos';

  @override
  String get audibleSeriesUpcomingBadge => 'PRÓXIMO';

  @override
  String get audibleSeriesAbridged => 'Abreviado';

  @override
  String get audibleSeriesRegionTitle => 'Región de Audible';

  @override
  String get audibleSeriesOpenOnAudible => 'Abrir en Audible';

  @override
  String get audibleSeriesAddToCalendar => 'Añadir al calendario';

  @override
  String get audibleSeriesAddToUpcoming => 'Añadir a próximos lanzamientos';

  @override
  String get audibleSeriesAddedToUpcoming => 'Añadido a próximos lanzamientos';

  @override
  String get audibleSeriesAlreadyInUpcoming =>
      'Ya está en la página de próximos lanzamientos';

  @override
  String get audibleSeriesCouldNotOpenAudible => 'No se pudo abrir Audible';

  @override
  String get audibleSeriesCouldNotOpenCalendar =>
      'No se pudo abrir el calendario';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return 'Nuevo lanzamiento de audiolibro de la serie $seriesName';
  }

  @override
  String get authorBooksGroupBySeries => 'Agrupar por serie';

  @override
  String get authorBooksList => 'Lista';

  @override
  String get authorBooksGrid => 'Cuadrícula';

  @override
  String authorBooksBookCount(int count) {
    return '$count libros';
  }

  @override
  String get metadataLookupCover => 'Portada';

  @override
  String get metadataLookupChooseFields => 'Elige los campos que aplicar';

  @override
  String metadataLookupApplyFields(int count) {
    return 'Aplicar $count campos';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return '$count campos guardados localmente';
  }

  @override
  String get metadataLookupOverrideLocalDisplay =>
      'Reemplazar la visualización local';

  @override
  String get equalizerPresetFlat => 'Plano';

  @override
  String get equalizerPresetVoiceBoost => 'Realce de voz';

  @override
  String get equalizerPresetBassBoost => 'Realce de graves';

  @override
  String get equalizerPresetTrebleBoost => 'Realce de agudos';

  @override
  String get equalizerPresetPodcast => 'Podcast';

  @override
  String get equalizerPresetAudiobook => 'Audiolibro';

  @override
  String get equalizerPresetReduceNoise => 'Reducir ruido';

  @override
  String get equalizerPresetLoudness => 'Sonoridad';

  @override
  String equalizerEditingSavedNamed(String title) {
    return 'Editando el EQ guardado de \"$title\"';
  }

  @override
  String get equalizerEditingSavedGeneric => 'Editando el EQ guardado';

  @override
  String get equalizerPerBookEq => 'EQ por libro';

  @override
  String get notesDeleteNoteQuestion => '¿Borrar nota?';

  @override
  String notesDeleteNoteContent(String title) {
    return '¿Borrar \"$title\"?';
  }

  @override
  String get notesExport => 'Exportar';

  @override
  String get notesNewNote => 'Nueva nota';

  @override
  String get librarySortFilterUpcomingReleases => 'Escanear series';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle =>
      'Obtener una foto y una biografía de cada autor del proveedor de metadatos';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle =>
      'Buscar en Audible libros próximos y faltantes de tus series';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Quedan $count capítulos',
      one: 'Queda 1 capítulo',
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
      other: '$count capítulos',
      one: '1 capítulo',
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
      other: 'Dormir tras $count capítulos',
      one: 'Dormir tras 1 capítulo',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => 'Retroceder al dormir';

  @override
  String get sleepTimerSheetShake => 'Agitar';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return 'Añade $minutes min';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => 'Añade 1 capítulo';

  @override
  String get sleepTimerSheetResetsToFull => 'Restablece la duración completa';

  @override
  String get sleepTimerSheetTabSpecificChapter => 'Capítulo';

  @override
  String get sleepTimerSheetSpecificNoChapters =>
      'No hay capítulos disponibles';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return 'Capítulo $number';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => 'superado';

  @override
  String get sleepTimerSheetSpecificStart => 'Inicio del capítulo';

  @override
  String get sleepTimerSheetSpecificEnd => 'Fin del capítulo';

  @override
  String get sleepTimerSheetSpecificEndsAt =>
      'El temporizador de apagado terminará en';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return 'en $countdown';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed => 'Este punto ya ha pasado';

  @override
  String get sleepTimerSheetSpecificStartButton => 'Iniciar temporizador';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => 'Ya ha pasado';

  @override
  String get timeAm => 'AM';

  @override
  String get timePm => 'PM';

  @override
  String get collectionPickerCollectionFallback => 'Colección';

  @override
  String collectionPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get playlistPickerPlaylistFallback => 'Lista de reproducción';

  @override
  String playlistPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get cardChaptersPlayFromChapterTitle =>
      '¿Reproducir desde el capítulo?';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return '¿Empezar a reproducir desde \"$title\"?';
  }

  @override
  String get cardChaptersPlay => 'Reproducir';

  @override
  String get absorbingSharedToday => 'Hoy';

  @override
  String get absorbingSharedYesterday => 'Ayer';

  @override
  String get absorbingSharedMonday => 'Lunes';

  @override
  String get absorbingSharedTuesday => 'Martes';

  @override
  String get absorbingSharedWednesday => 'Miércoles';

  @override
  String get absorbingSharedThursday => 'Jueves';

  @override
  String get absorbingSharedFriday => 'Viernes';

  @override
  String get absorbingSharedSaturday => 'Sábado';

  @override
  String get absorbingSharedSunday => 'Domingo';

  @override
  String get absorbingSharedAm => 'AM';

  @override
  String get absorbingSharedPm => 'PM';

  @override
  String sectionDetailAddedToAbsorbing(String title) {
    return '\"$title\" añadido a Absorbing';
  }

  @override
  String get sectionDetailDoneBadge => 'Completado';

  @override
  String get homeCustomizeAddGenreTitle => 'Añadir sección de género';

  @override
  String get homeCustomizeAddGenreSubtitle =>
      'Elige un género para mostrar en tu pantalla de inicio';

  @override
  String get homeSectionDoneBadge => 'Completado';

  @override
  String get tipsSheetQuickBookmarksTitle => 'Marcadores rápidos';

  @override
  String get tipsSheetQuickBookmarksDesc =>
      'Mantén pulsado el botón de marcador de cualquier tarjeta para colocar al instante un marcador en tu posición actual sin abrir la hoja de marcadores.';

  @override
  String get tipsSheetCoverPlayPauseTitle => 'Reproducir/pausar con la portada';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      'Toca la portada de cualquier tarjeta para reproducir o pausar. Actívalo o desactívalo en Ajustes, en Tarjetas de Absorbing. Un icono de pausa tenue aparece al reproducir para que sepas que se puede tocar.';

  @override
  String get tipsSheetFullScreenPlayerTitle =>
      'Reproductor a pantalla completa';

  @override
  String get tipsSheetFullScreenPlayerDesc =>
      'Desliza hacia arriba en cualquier tarjeta de Absorbing para abrir el reproductor a pantalla completa. Desliza hacia abajo para cerrarlo.';

  @override
  String get tipsSheetQuickAddAbsorbingTitle => 'Añadir rápido a Absorbing';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      'Desliza a la derecha cualquier libro de una lista (serie, autor, resultados de búsqueda) para añadirlo al instante a tu cola de Absorbing.';

  @override
  String get tipsSheetShakeExtendSleepTitle =>
      'Agitar para ampliar el temporizador';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      'Si tienes un temporizador de apagado en marcha y agitas el teléfono, añadirá minutos extra. Configura la cantidad en Ajustes, en Temporizador de apagado.';

  @override
  String get tipsSheetSeriesNavigationTitle => 'Navegación por series';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      'Toca el nombre de la serie en la ventana de detalles de cualquier libro para ver todos los libros de la serie, ordenados en orden de lectura y con insignias de número en cada portada.';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => 'Deslizar entre libros';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      'Desliza a izquierda y derecha en la pantalla Absorbing para cambiar entre tus libros en curso. Con el modo de cola manual activado, las tarjetas también funcionan como tu cola, así que la siguiente se reproduce sola cuando termina la actual.';

  @override
  String get tipsSheetTapToSeekTitle => 'Tocar para saltar';

  @override
  String get tipsSheetTapToSeekDesc =>
      'Toca en cualquier punto de la barra de progreso del capítulo o del libro para ir directamente a esa posición. También puedes arrastrar las barras para un control más fino.';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle =>
      'Tiempo ajustado a la velocidad';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      'Todos los tiempos mostrados (posición, restante, capítulos, marcadores) se ajustan a tu velocidad de reproducción. ¿Escuchas a 1.5x? Los tiempos reflejan lo que realmente te va a llevar.';

  @override
  String get tipsSheetPlaybackHistoryTitle => 'Historial de reproducción';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      'Toca el botón Historial de cualquier tarjeta para ver una línea de tiempo de cada reproducción, pausa, salto y cambio de velocidad. Toca cualquier evento para volver a esa posición.';

  @override
  String get tipsSheetAutoRewindTitle => 'Retroceso automático';

  @override
  String get tipsSheetAutoRewindDesc =>
      'Cuando reanudas tras una pausa, Absorb retrocede automáticamente unos segundos para que no pierdas el hilo. La cantidad depende de cuánto tiempo estuviste fuera. Configúralo en Ajustes.';

  @override
  String get tipsSheetSeriesQueueModeTitle => 'Modo de cola de series';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      'Cuando terminas un libro que forma parte de una serie, Absorb puede reproducir automáticamente el siguiente. Establece el modo de cola en \"Serie\" en Ajustes.';

  @override
  String get tipsSheetOfflineModeTitle => 'Modo sin conexión';

  @override
  String get tipsSheetOfflineModeDesc =>
      'Toca el botón del avión en la pantalla Absorbing para entrar en el modo sin conexión. Esto detiene la sincronización, ahorra datos y solo muestra tus libros descargados. Ideal para vuelos o zonas con poca señal.';

  @override
  String get tipsSheetUpcomingReleasesTitle => 'Próximos lanzamientos';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      'En la pestaña Series, toca la pestaña de nuevo para abrir su hoja de orden y filtros, y elige Escanear series para ver libros nuevos y próximos de tus series, ordenados por fecha de lanzamiento.';

  @override
  String get tipsSheetPerBookEqTitle => 'Ecualizador por libro';

  @override
  String get tipsSheetPerBookEqDesc =>
      'Cada libro recuerda sus propios ajustes del ecualizador. Ajusta el EQ una vez para una épica de ciencia ficción y la próxima vez que la reproduzcas sonará igual.';

  @override
  String get tipsSheetPerBookSpeedTitle => 'Velocidad por libro';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      'La velocidad de reproducción se guarda por libro. Escucha no ficción a 1.5x y ficción dramática a 1.0x sin tener que ajustarlo cada vez.';

  @override
  String get tipsSheetAutoSleepWindowTitle => 'Franja de apagado automático';

  @override
  String get tipsSheetAutoSleepWindowDesc =>
      'Elige las horas a las que sueles quedarte dormido y el temporizador de apagado se iniciará solo cuando empieces a escuchar en esa franja.';

  @override
  String get tipsSheetSleepFadeChimeTitle =>
      'Desvanecimiento y aviso al dormir';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      'Cuando termina el temporizador de apagado, el audio se desvanece poco a poco y puede sonar un aviso opcional para que no se corte a mitad de frase.';

  @override
  String get tipsSheetCarModeTitle => 'Modo coche';

  @override
  String get tipsSheetCarModeDesc =>
      'Toca el icono del coche para cambiar al modo de botones gigantes, pensado para un uso más seguro al conducir.';

  @override
  String get tipsSheetAudibleSeriesTitle => 'Descubrir series de Audible';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      'Abre una serie y usa el menú de opciones (los tres puntos) para traer la lista completa de la serie desde Audible, con las entradas faltantes y los libros que aún no has empezado.';

  @override
  String get tipsSheetTranscribeBookmarkTitle => 'Transcribir marcadores';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      'Convierte en texto el audio de cualquier marcador, todo en tu dispositivo. Actívalo en Ajustes, en Avanzado > Transcripción, y descarga un modelo; luego toca Transcribir en un marcador: el texto se guarda en su nota, listo para corregir o compartir.';

  @override
  String get tipsSheetFindBetweenFormatsTitle =>
      'Saltar entre audiolibro y libro electrónico';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      'Con la transcripción activada y el libro descargado, pausa y toca Buscar posición en el libro electrónico en el reproductor para abrirlo en el pasaje que acabas de oír. En el lector, selecciona texto y toca los auriculares para iniciar el audiolibro justo ahí.';

  @override
  String get tipsSheetShareQuoteTitle => 'Compartir citas';

  @override
  String get tipsSheetShareQuoteDesc =>
      'Comparte un subrayado de un libro electrónico o la nota de un marcador como una imagen con la cita sobre la portada del libro. Busca la opción de compartir en los subrayados y en la hoja de marcadores.';

  @override
  String get tipsSheetClipExportTitle => 'Exportar clips de audio';

  @override
  String get tipsSheetClipExportDesc =>
      'Abre un marcador y toca Exportar clip para recortar y guardar un breve fragmento de audio del libro, con la portada incluida: ideal para compartir una escena favorita.';

  @override
  String get tipsSheetAllHighlightsTitle =>
      'Todos los subrayados en un solo lugar';

  @override
  String get tipsSheetAllHighlightsDesc =>
      'La página Todos los marcadores tiene una pestaña Subrayados que reúne todos los subrayados de libros electrónicos de todos tus libros. Toca uno para compartirlo o volver al libro.';

  @override
  String get tipsSheetVolumeKeyPagesTitle =>
      'Pasar página con las teclas de volumen';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      'Pasa las páginas del libro electrónico con las teclas de volumen. Actívalo en los ajustes del lector (dirección normal o invertida); puede seguir activo incluso mientras suena el audio.';

  @override
  String get tipsSheetSettingsSyncTitle => 'Sincronización de ajustes';

  @override
  String get tipsSheetSettingsSyncDesc =>
      'Mantén tus ajustes, velocidades por libro y el orden de Absorbing al día en todos tus dispositivos mediante tu propio servidor WebDAV. Configúralo en Ajustes, en Copia de seguridad y sincronización.';

  @override
  String get tipsSheetNavLongPressTitle =>
      'Pulsación larga en las pestañas inferiores';

  @override
  String get tipsSheetNavLongPressDesc =>
      'Mantén pulsada la pestaña Inicio para cambiar de biblioteca desde cualquier página. Mantén pulsada la pestaña Biblioteca para ir directamente a la búsqueda.';

  @override
  String get bookCardUnknownTitle => 'Título desconocido';

  @override
  String get bookCardExplicitBadge => 'E';

  @override
  String get bookCardDone => 'Completado';

  @override
  String get bookCardSaved => 'Guardado';

  @override
  String get episodeRowEpisode => 'Episodio';

  @override
  String get episodeRowToday => 'Hoy';

  @override
  String get episodeRowYesterday => 'Ayer';

  @override
  String episodeRowDaysAgo(int count) {
    return 'hace $count d';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return 'hace $count sem';
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
    return 'T$number';
  }

  @override
  String episodeRowEpisodeShort(String number) {
    return 'E$number';
  }

  @override
  String get librarySearchResultsExplicitBadge => 'E';

  @override
  String get librarySearchResultsDone => 'Completado';

  @override
  String get librarySearchResultsSaved => 'Guardado';

  @override
  String librarySearchResultsSequence(String number) {
    return '#$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => 'Serie desconocida';

  @override
  String get librarySearchResultsUnknownEpisode => 'Episodio desconocido';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => 'E';

  @override
  String get libraryGridTilesDone => 'Completado';

  @override
  String get libraryGridTilesSaved => 'Guardado';

  @override
  String libraryGridTilesSequence(String number) {
    return '#$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => 'Serie desconocida';

  @override
  String get seriesCardUnknownSeries => 'Serie desconocida';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => 'Desplazamiento fino';

  @override
  String get cardProgressQuarterSpeed => 'Un cuarto de velocidad';

  @override
  String get cardProgressHalfSpeed => 'Media velocidad';

  @override
  String cardProgressChapterPrefix(String number) {
    return 'Capítulo $number';
  }

  @override
  String get cardEdgeProgressFineScrubbing => 'Desplazamiento fino';

  @override
  String get cardEdgeProgressQuarterSpeed => 'Un cuarto de velocidad';

  @override
  String get cardEdgeProgressHalfSpeed => 'Media velocidad';

  @override
  String get authSessionExpired =>
      'La sesión ha caducado. Inicia sesión de nuevo.';

  @override
  String authCannotReachServer(String url) {
    return 'No se puede conectar con el servidor en $url';
  }

  @override
  String get authInvalidUsernameOrPassword =>
      'Usuario o contraseña incorrectos';

  @override
  String get authInvalidApiKey => 'Clave de API no válida';

  @override
  String get authLoginFailedDetail =>
      'Error al iniciar sesión: revisa la dirección del servidor y tus credenciales';

  @override
  String get authUnexpectedServerResponse =>
      'Respuesta inesperada del servidor';

  @override
  String get authSsoUnexpectedResponse =>
      'El SSO devolvió una respuesta inesperada';

  @override
  String get authSwitchedToLocalServer => 'Cambiado al servidor local';

  @override
  String get authSwitchedToRemoteServer => 'Cambiado al servidor remoto';

  @override
  String get lpDeletedFinishedDownload => 'Descarga terminada borrada';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'descargando $count episodios nuevos',
      one: 'descargando 1 episodio nuevo',
    );
    return '$showTitle: $_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return '$showTitle añadido al principio de tu cola';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return '$showTitle añadido en 2.º lugar de tu cola';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return '$showTitle añadido al final de tu cola';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return 'Nuevo episodio de $showTitle descargado';
  }

  @override
  String get statsWeekStartsOn => 'La semana empieza el';

  @override
  String get episodeListNewEpisodePosition => 'Posición del episodio nuevo';

  @override
  String get episodeListPositionTop => 'Principio de la cola';

  @override
  String get episodeListPositionSecond => 'Segundo en la cola';

  @override
  String get episodeListPositionEnd => 'Final de la cola';

  @override
  String get episodeListPositionNone => 'No añadir a la cola';

  @override
  String get episodeListPositionNoneDesc =>
      'Se sigue notificando y descargando';

  @override
  String sleepRewindUndoNote(int minutes) {
    return 'Si pulsas reproducir en $minutes minutos, el retroceso se deshace';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cola: descargando $count elementos',
      one: 'Cola: descargando 1 elemento',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Descargando $count libros',
      one: 'Descargando 1 libro',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Descargando $count episodios',
      one: 'Descargando 1 episodio',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName => 'Progreso de descargas';

  @override
  String get downloadNotifProgressChannelDesc =>
      'Muestra el progreso durante las descargas de audiolibros';

  @override
  String get downloadNotifAlertChannelName => 'Avisos de descargas';

  @override
  String get downloadNotifAlertChannelDesc =>
      'Notificaciones cuando las descargas terminan o fallan';

  @override
  String get downloadNotifDownloadingTitle => 'Descargando…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count descargas activas',
      one: '1 descarga activa',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return 'Descargando: $title';
  }

  @override
  String get downloadNotifStartingLabel => 'Iniciando…';

  @override
  String get downloadNotifCompleteTitle => 'Descarga completada';

  @override
  String downloadNotifCompleteBody(String title) {
    return '$title está listo para escuchar sin conexión';
  }

  @override
  String get downloadNotifFailedTitle => 'Error de descarga';

  @override
  String get upcomingNotifChannelName => 'Escaneo de próximos lanzamientos';

  @override
  String get upcomingNotifChannelDesc =>
      'Muestra el progreso al buscar próximos lanzamientos';

  @override
  String get upcomingNotifScanTitle => 'Buscando próximos lanzamientos';

  @override
  String get upcomingNotifStartingScan => 'Iniciando escaneo…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return 'Revisando $seriesName… ($current/$total)';
  }

  @override
  String get upcomingNotifFoundTitle =>
      '¡Se encontraron próximos lanzamientos!';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$series series',
      one: '1 serie',
    );
    return '$books próximos en $_temp0';
  }

  @override
  String get androidAutoTabContinue => 'Continuar';

  @override
  String get androidAutoTabLibrary => 'Biblioteca';

  @override
  String get androidAutoTabDownloads => 'Descargas';

  @override
  String get settingsSearchHint => 'Buscar ajustes...';

  @override
  String get settingsSearchNoResults => 'No hay ajustes que coincidan';

  @override
  String get carConnectAutoplay =>
      'Iniciar la reproducción cuando se conecte Android Auto';

  @override
  String get carConnectAutoplayIos =>
      'Iniciar la reproducción cuando se conecte CarPlay';

  @override
  String get carConnectAutoplayOnSubtitle =>
      'El último libro que estabas escuchando empieza solo cuando se conecta el coche';

  @override
  String get carConnectAutoplayOffSubtitle =>
      'La reproducción espera a que pulses reproducir';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => 'Usar con Siri';

  @override
  String get siriStatusOn =>
      'Activado. Siri puede encontrar y reproducir tus libros y podcasts por nombre.';

  @override
  String get siriStatusAsk =>
      'Permite que Siri encuentre y reproduzca tus libros y podcasts por nombre.';

  @override
  String get siriStatusOff =>
      'Siri está desactivado para Absorb. Actívalo en los Ajustes de iOS.';

  @override
  String get siriAllow => 'Permitir';

  @override
  String get siriOpenSettings => 'Abrir Ajustes';

  @override
  String get siriThingsToSay => 'Cosas que puedes decir';

  @override
  String get siriExamples =>
      '\"Reproduce [título del libro] en Absorb\"\n\"Reproduce [nombre de la serie] en Absorb\"\n\"Reproduce algo de [autor] en Absorb\"\n\"Reproduce el último episodio de [podcast] en Absorb\"\n\"Reanuda Absorb\"\n\"Retrocede en Absorb\"\n\"Siguiente capítulo en Absorb\"\n\"Pon un temporizador de apagado en Absorb\"\n\"Añade un marcador en Absorb\"\n\"¿Qué estoy escuchando en Absorb?\"';

  @override
  String get siriShortcutsNote =>
      'Reanudar, pausar, saltos, capítulos, el temporizador de apagado, los marcadores y lo que se está reproduciendo funcionan incluso sin este permiso. También están en la app Atajos para automatizaciones y el botón de acción.';

  @override
  String get carBookOrder => 'Orden de libros en el coche';

  @override
  String get carBookOrderReverse => 'Invertir el orden de libros';

  @override
  String get carBookOrderReverseSubtitle =>
      'De la Z a la A, o los añadidos primero más antiguos';

  @override
  String get carPodcastOrder => 'Orden de podcasts en el coche';

  @override
  String get carEpisodesOldestFirst => 'Episodios más antiguos primero';

  @override
  String get carEpisodesOldestFirstSubtitle =>
      'Para programas que escuchas desde el principio';

  @override
  String get androidAutoCatBooks => 'Libros';

  @override
  String get androidAutoCatSeries => 'Series';

  @override
  String get androidAutoCatAuthors => 'Autores';

  @override
  String get androidAutoCatCollections => 'Colecciones';

  @override
  String get androidAutoCatPlaylists => 'Listas de reproducción';

  @override
  String get showTipsAgain => 'Mostrar consejos de nuevo';

  @override
  String get showTipsAgainSubtitle =>
      'Recupera los consejos de funciones que has descartado';

  @override
  String get tipsRestored => 'Consejos restaurados';

  @override
  String get resetSpeedPresets => 'Restablecer velocidades predefinidas';

  @override
  String get resetSpeedPresetsSubtitle =>
      'Restaura los botones de velocidad de reproducción predeterminados';

  @override
  String get speedPresetsReset => 'Velocidades predefinidas restablecidas';

  @override
  String get editAuthor => 'Editar autor';

  @override
  String get authorName => 'Nombre';

  @override
  String get authorImage => 'Imagen del autor';

  @override
  String get authorRemoveImage => 'Quitar imagen';

  @override
  String get authorRemoveImageTitle => '¿Quitar la imagen del autor?';

  @override
  String get authorRemoveImageConfirm => 'Esto borra la imagen en el servidor.';

  @override
  String get authorImageRemoved => 'Imagen quitada';

  @override
  String get authorImageFailed => 'No se pudo actualizar la imagen del autor';

  @override
  String get authorUpdated => 'Autor actualizado';

  @override
  String get authorUpdateFailed => 'No se pudo actualizar el autor';

  @override
  String get authorMatched => 'Autor actualizado a partir de la coincidencia';

  @override
  String get authorNoMatchFound => 'No se encontró ninguna coincidencia';

  @override
  String authorMergedInto(String name) {
    return 'Combinado con $name';
  }

  @override
  String get authorQuickMatchHint =>
      'Obtiene el nombre, el ASIN, la descripción y la imagen de Audible para la región elegida.';

  @override
  String get region => 'Región';

  @override
  String get editTabDetails => 'Detalles';

  @override
  String get editTabCover => 'Portada';

  @override
  String get editTabMatch => 'Emparejar';

  @override
  String get editTabEmbed => 'Incrustar';

  @override
  String get chapterEditorTitle => 'Editar capítulos';

  @override
  String get chapterNotConnected => 'Sin conexión con un servidor';

  @override
  String get chapterErrorFirstNotZero =>
      'El primer capítulo debe empezar en 0:00';

  @override
  String get chapterErrorStartAfterPrevious =>
      'El inicio debe ser posterior al del capítulo anterior';

  @override
  String get chapterErrorStartBeforeEnd =>
      'El inicio debe ser anterior al final del libro';

  @override
  String get chapterErrorTitleRequired => 'Falta el título';

  @override
  String get chapterEditStartTitle => 'Editar hora de inicio';

  @override
  String get chapterTimeHintSeconds => 'Segundos';

  @override
  String get chapterTimeHintFull => 'HH:MM:SS o segundos';

  @override
  String get chapterInvalidTime => 'Hora no válida';

  @override
  String get chapterLocked => 'El capítulo está bloqueado';

  @override
  String get chapterAllLocked => 'Todos los capítulos están bloqueados';

  @override
  String chapterTrackTitle(int number) {
    return 'Pista $number';
  }

  @override
  String get chapterNoAudioForPosition => 'No hay audio para esta posición';

  @override
  String get chapterCouldNotPlayPreview =>
      'No se pudo reproducir la vista previa';

  @override
  String chapterStartSetTo(String time) {
    return 'Inicio establecido en $time';
  }

  @override
  String get chapterAddNumberedTitle => 'Añadir capítulos numerados';

  @override
  String chapterNextPreview(String first, String second) {
    return 'Siguientes: \"$first\", \"$second\", ...';
  }

  @override
  String get chapterHowMany => 'Cuántos capítulos';

  @override
  String get add => 'Añadir';

  @override
  String get chapterCountRange => 'Introduce un número entre 1 y 150';

  @override
  String get chapterTitlesUpdated => 'Títulos de capítulos actualizados';

  @override
  String get chaptersApplied => 'Capítulos aplicados';

  @override
  String get chapterDiscardTitle => '¿Descartar cambios?';

  @override
  String get chapterDiscardMessage => 'Volver a los capítulos guardados.';

  @override
  String get chapterRemoveAllTitle => '¿Eliminar todos los capítulos?';

  @override
  String get chapterRemoveAllMessage =>
      'Esto elimina todos los capítulos de este libro.';

  @override
  String get chapterAllRemoved => 'Todos los capítulos eliminados';

  @override
  String get chapterFixHighlighted =>
      'Corrige primero los capítulos resaltados';

  @override
  String get chaptersUpdated => 'Capítulos actualizados';

  @override
  String get ok => 'OK';

  @override
  String get chapterSaveButton => 'Guardar capítulos';

  @override
  String get chapterAddHint => 'Añadir capítulo (p. ej. \"Capítulo 01\")';

  @override
  String get chapterAddTooltip => 'Añadir capítulo(s)';

  @override
  String get chapterRemoveAll => 'Eliminar todos';

  @override
  String get chapterShiftTimes => 'Desplazar tiempos';

  @override
  String get chapterFromTracks => 'Desde pistas';

  @override
  String get chapterLookup => 'Buscar';

  @override
  String get chapterShowSeconds => 'Mostrar segundos';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get chapterLoopCut => 'Repetir el corte';

  @override
  String get chapterFindStart => 'Encontrar el inicio';

  @override
  String get chapterFindStartListening => 'Escuchando alrededor del marcador';

  @override
  String get chapterFindStartNone => 'Nada de aquí suena a inicio de capítulo';

  @override
  String get chapterFindStartWider => 'Buscar más lejos';

  @override
  String get chapterFindStartCeiling =>
      'Se buscó media hora alrededor del marcador. El inicio está más lejos o no hay ningún anuncio de capítulo que oír.';

  @override
  String get chapterFindStartStrong => 'Suena a este capítulo';

  @override
  String get chapterFindStartMaybe => 'Palabras de capítulo';

  @override
  String chapterFindStartGap(String seconds) {
    return 'pausa de $seconds s';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return 'Se buscó de $from a $to';
  }

  @override
  String get chapterFindStartNeedsModel =>
      'Activa la transcripción en Ajustes y descarga un modelo primero';

  @override
  String get chapterFindStartUseThis => 'Usar este';

  @override
  String chapterFindStartTitle(String title) {
    return 'Título: $title';
  }

  @override
  String get chapterShiftBySeconds => 'Desplazar por (segundos)';

  @override
  String get chapterShiftHint =>
      'Desplaza todos los capítulos desbloqueados. Usa un valor negativo para adelantarlos.';

  @override
  String get chapterTitleHint => 'Título del capítulo';

  @override
  String get chapterStopPreview => 'Detener vista previa';

  @override
  String get chapterPreviewFromHere => 'Vista previa desde aquí';

  @override
  String get chapterScrubHint => 'Arrastra o ajusta para mover el inicio';

  @override
  String chapterStartAt(String time) {
    return 'Empieza en $time';
  }

  @override
  String get chapterUnlock => 'Desbloquear';

  @override
  String get chapterLock => 'Bloquear';

  @override
  String get chapterInsertBelow => 'Insertar debajo';

  @override
  String get chapterFindTitle => 'Buscar capítulos';

  @override
  String get chapterFindSubtitle =>
      'Busca los capítulos en Audible/Audnexus por ASIN.';

  @override
  String get chapterEnterAsin => 'Introduce un ASIN';

  @override
  String get chapterLookupFailed => 'Error en la búsqueda: revisa el ASIN';

  @override
  String get chapterNoChaptersFound =>
      'No se encontraron capítulos para ese ASIN';

  @override
  String get chapterRemoveBranding =>
      'Quitar la marca de Audible (intro/outro)';

  @override
  String chapterFoundCount(int count) {
    return '$count capítulos encontrados';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  Libro $book';
  }

  @override
  String get chapterAudibleLonger =>
      'La versión de Audible es más larga que tu archivo: los últimos capítulos pueden no coincidir.';

  @override
  String get chapterAudibleShorter =>
      'La versión de Audible es más corta que tu archivo: los capítulos pueden no coincidir.';

  @override
  String get chapterTitlesOnly => 'Solo títulos';

  @override
  String get chapterApplyChapters => 'Aplicar capítulos';

  @override
  String get coverSearchTitle => 'Buscar una portada';

  @override
  String get coverSearchRefineHint =>
      'Ajusta el título/autor para depurar los resultados; esto no cambia el libro.';

  @override
  String get coverNoneFound => 'No se encontraron portadas';

  @override
  String get coverEnterTitleFirst => 'Introduce primero un título';

  @override
  String get coverUpdated => 'Portada actualizada';

  @override
  String get coverCouldNotUpdate => 'No se pudo actualizar la portada';

  @override
  String get coverApply => 'Aplicar portada';

  @override
  String get coverUnknownResolution => 'Resolución desconocida';

  @override
  String get embedIntro =>
      'Incrusta metadatos en los archivos de audio, incluidos la portada y los capítulos.';

  @override
  String get embedBackupOption =>
      'Hacer primero una copia de los archivos de audio';

  @override
  String get embedNoteInFolder =>
      'Los metadatos se incrustarán en las pistas de audio dentro de la carpeta de tu audiolibro.';

  @override
  String get embedNoteMultiTrack =>
      'Los capítulos no se incrustan en audiolibros de varias pistas.';

  @override
  String get embedNoteNavigateAway =>
      'Una vez iniciada la tarea, puedes salir de esta página.';

  @override
  String get embedStartButton => 'Iniciar incrustación de metadatos';

  @override
  String embedProgress(String percent) {
    return 'Incrustando $percent%';
  }

  @override
  String get embedProgressIndeterminate => 'Incrustando...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent%: sigue en marcha si sales de esta página';
  }

  @override
  String get taskStarting => 'Iniciando...';

  @override
  String get embedBackupNoteIntro =>
      'Se guardará una copia de tus archivos de audio originales en el servidor, en ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro =>
      '. Recuerda vaciar la caché de elementos de forma periódica.';

  @override
  String get embedDialogTitle => 'Incrustar metadatos';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# archivos de audio',
      one: '# archivo de audio',
    );
    return '¿Incrustar metadatos en $_temp0? Tus archivos de audio se reescribirán$backup.';
  }

  @override
  String get embedConfirmBackupClause =>
      ' (se hace antes una copia de los originales)';

  @override
  String get embedConfirmAction => 'Incrustar';

  @override
  String get embedCouldNotStart => 'No se pudo iniciar la incrustación';

  @override
  String get embedStarted => 'Incrustación iniciada';

  @override
  String get embedComplete => 'Incrustación completada';

  @override
  String get embedFailed => 'Error de incrustación';

  @override
  String get encodeComplete => 'Codificación completada';

  @override
  String get encodeFailedTask => 'Error de codificación';

  @override
  String encodeProgress(String percent) {
    return 'Codificando $percent%';
  }

  @override
  String get encodeProgressIndeterminate => 'Codificando...';

  @override
  String get adminApiKeys => 'Claves de API';

  @override
  String get adminApiKeysSubtitle => 'Tokens de acceso programático';

  @override
  String get adminApiKeysNewTitle => 'Nueva clave de API';

  @override
  String get adminApiKeysName => 'Nombre';

  @override
  String get adminApiKeysNameHint => 'p. ej. Home Assistant';

  @override
  String get adminApiKeysOwner => 'Usuario';

  @override
  String get adminApiKeysExpiration => 'Caducidad';

  @override
  String get adminApiKeysActive => 'Activa';

  @override
  String get adminApiKeysActiveSub => 'La clave funciona en cuanto se crea';

  @override
  String get adminApiKeysInactive => 'Inactiva';

  @override
  String get adminApiKeysExpired => 'Caducada';

  @override
  String get adminApiKeysCreate => 'Crear clave';

  @override
  String get adminApiKeysCreated => 'Clave de API creada';

  @override
  String get adminApiKeysTokenLabel => 'Tu nueva clave de API';

  @override
  String get adminApiKeysCopyWarning =>
      'Copia esta clave ahora. Por seguridad no se volverá a mostrar.';

  @override
  String get adminApiKeysCopy => 'Copiar';

  @override
  String get adminApiKeysCopied => 'Copiado al portapapeles';

  @override
  String get adminApiKeysDone => 'Completado';

  @override
  String get adminApiKeysDeleteTitle => '¿Revocar la clave de API?';

  @override
  String get adminApiKeysDeleted => 'Clave de API revocada';

  @override
  String get adminApiKeysRevoke => 'Revocar';

  @override
  String get adminApiKeysSetActive => 'Activar';

  @override
  String get adminApiKeysSetInactive => 'Desactivar';

  @override
  String get adminApiKeysFailedCreate => 'No se pudo crear la clave de API';

  @override
  String get adminApiKeysFailedDelete => 'No se pudo revocar la clave de API';

  @override
  String get adminApiKeysFailedUpdate =>
      'No se pudo actualizar la clave de API';

  @override
  String get adminApiKeysEmpty => 'Aún no hay claves de API';

  @override
  String get adminApiKeysEmptySub =>
      'Crea una para que apps y scripts puedan acceder a tu servidor';

  @override
  String get adminApiKeysNeverUsed => 'Nunca usada';

  @override
  String get adminApiKeysNeverExpires => 'Sin caducidad';

  @override
  String get adminApiKeysNameRequired => 'Introduce un nombre';

  @override
  String get adminApiKeysUserRequired => 'Elige un usuario';

  @override
  String get adminApiKeysExpNever => 'Nunca';

  @override
  String get adminApiKeysExp7d => '7 días';

  @override
  String get adminApiKeysExp30d => '30 días';

  @override
  String get adminApiKeysExp90d => '90 días';

  @override
  String get adminApiKeysExp1y => '1 año';

  @override
  String adminApiKeysLastUsed(String time) {
    return 'Último uso $time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return 'Caduca el $date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return '¿Revocar \"$name\"? Las apps que usen esta clave perderán el acceso de inmediato.';
  }

  @override
  String get endOfEpisode => 'Fin del episodio';

  @override
  String get sleepTimerSheetEpisodeSleepStart => 'Dormir al final del episodio';

  @override
  String get bookmarkListen => 'Escuchar';

  @override
  String get bookmarkPause => 'Pausar';

  @override
  String get bookmarkPreviewFailed => 'No se pudo reproducir este punto.';

  @override
  String get clipExport => 'Exportar clip';

  @override
  String get clipJumpToStart => 'Ir al inicio';

  @override
  String get clipJumpToEnd => 'Ir al final';

  @override
  String get clipSetStart => 'Fijar inicio';

  @override
  String get clipSetEnd => 'Fijar fin';

  @override
  String get clipInLabel => 'Entrada';

  @override
  String get clipOutLabel => 'Salida';

  @override
  String get clipSave => 'Guardar clip';

  @override
  String clipExportSaved(String filename) {
    return 'Guardado $filename';
  }

  @override
  String get clipExportClamped =>
      'Clip guardado, acortado hasta el final de esta pista';

  @override
  String get clipExportFailed => 'No se pudo exportar el clip.';

  @override
  String get clipDownloadToExport =>
      'Descarga primero este libro para exportar un clip en iPhone.';

  @override
  String get fsPickerTitle => 'Seleccionar carpeta';

  @override
  String get fsServerRoot => 'Raíz del servidor';

  @override
  String get fsEmptyFolder => 'No hay subcarpetas aquí';

  @override
  String get fsUseThisFolder => 'Usar esta carpeta';

  @override
  String get adminLibrariesManage => 'Bibliotecas';

  @override
  String get adminLibrariesManageSubtitle => 'Crear, editar y reordenar';

  @override
  String get adminUploadTitle => 'Subir contenido';

  @override
  String get adminUploadSubtitle => 'Añade libros y podcasts desde archivos';

  @override
  String get adminUploadNoLibraries =>
      'Crea una biblioteca antes de subir contenido.';

  @override
  String get adminUploadDestination => 'Destino';

  @override
  String get adminUploadFolder => 'Carpeta de la biblioteca';

  @override
  String get adminUploadDetails => 'Detalles del elemento';

  @override
  String get adminUploadOptional => 'Opcional';

  @override
  String get adminUploadAutoMetadata => 'Obtener metadatos automáticamente';

  @override
  String get adminUploadAutoMetadataSubtitle =>
      'Rellena título, autor y serie con la mejor coincidencia';

  @override
  String get adminUploadMetadataProvider => 'Proveedor de metadatos';

  @override
  String get adminUploadMetadataSearching => 'Buscando metadatos...';

  @override
  String get adminUploadMetadataNoResults =>
      'No se encontró ninguna coincidencia de metadatos. Aún puedes subir este elemento.';

  @override
  String get adminUploadMetadataFailed =>
      'No se pudieron buscar los metadatos. Aún puedes subir este elemento.';

  @override
  String get adminUploadDestinationPreview => 'Destino en el servidor';

  @override
  String get adminUploadFiles => 'Archivos';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '1 archivo',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => 'Elegir archivos';

  @override
  String get adminUploadAddFiles => 'Añadir archivos';

  @override
  String get adminUploadBookFilesHint =>
      'Elige archivos de audio o de libro electrónico. También puedes incluir portadas y archivos de metadatos.';

  @override
  String get adminUploadPodcastFilesHint =>
      'Elige uno o más archivos de audio. También puedes incluir portadas y archivos de metadatos.';

  @override
  String get adminUploadUnsupportedFiles =>
      'Audiobookshelf no admite algunos de los archivos seleccionados.';

  @override
  String get adminUploadFilePickerFailed =>
      'No se pudieron abrir los archivos seleccionados.';

  @override
  String get adminUploadTitleRequired => 'Introduce un título';

  @override
  String get adminUploadLibraryRequired => 'Elige una biblioteca';

  @override
  String get adminUploadFolderRequired => 'Elige una carpeta de la biblioteca';

  @override
  String get adminUploadFilesRequired => 'Elige al menos un archivo';

  @override
  String get adminUploadPodcastFileRequired =>
      'Elige al menos un archivo de audio para este podcast.';

  @override
  String get adminUploadBookFileRequired =>
      'Elige al menos un archivo de audio o libro electrónico para este libro.';

  @override
  String get adminUploadPathCheckFailed =>
      'No se pudo comprobar la carpeta de destino. No se subió nada.';

  @override
  String get adminUploadDestinationExists =>
      'Esa carpeta de destino ya existe en el servidor.';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return 'Ese destino ya lo usa \"$title\".';
  }

  @override
  String get adminUploadAddToExistingTitle => 'La carpeta ya existe';

  @override
  String adminUploadAddToExisting(String title) {
    return 'Esa carpeta pertenece a \"$title\". ¿Añadir los archivos? El servidor los detectará en su próximo análisis.';
  }

  @override
  String get adminUploadAddToExistingNoItem =>
      'Esa carpeta ya existe en el servidor. ¿Añadir los archivos?';

  @override
  String get adminUploadAddToBook => 'Añadir a un libro existente';

  @override
  String get adminUploadAddToBookHint => 'Buscar en esta biblioteca';

  @override
  String get adminUploadNoBooksFound => 'No se encontraron libros';

  @override
  String adminUploadAddingTo(String title) {
    return 'Añadiendo archivos a \"$title\"';
  }

  @override
  String adminUploadAddedTo(String title) {
    return 'Archivos añadidos a \"$title\"';
  }

  @override
  String get adminUploadTargetNoFolder =>
      'No se encontró la carpeta de ese libro en el servidor.';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return 'El servidor pondría estos archivos en \"$preview\", no en la carpeta del libro \"$folder\". No se subió nada.';
  }

  @override
  String get adminUploadUploading => 'Subiendo...';

  @override
  String adminUploadProgress(int percent) {
    return 'Subiendo $percent%';
  }

  @override
  String get adminUploadButton => 'Subir';

  @override
  String adminUploadComplete(String title) {
    return '\"$title\" subido';
  }

  @override
  String get adminUploadFailed => 'Error al subir';

  @override
  String adminUploadFailedReason(String error) {
    return 'Error al subir: $error';
  }

  @override
  String get adminUploadReselectFiles =>
      'Elige los archivos de nuevo antes de reintentar.';

  @override
  String get adminServerSettings => 'Ajustes del servidor';

  @override
  String get adminServerSettingsSubtitle =>
      'Análisis, almacenamiento y ordenación';

  @override
  String get adminAuthentication => 'Autenticación';

  @override
  String get adminAuthenticationSubtitle =>
      'Inicio de sesión con contraseña y OpenID Connect';

  @override
  String get adminStats => 'Estadísticas';

  @override
  String get adminStatsSubtitle => 'Totales de la biblioteca y de escucha';

  @override
  String get adminAllSessions => 'Todas las sesiones';

  @override
  String get adminAllSessionsSubtitle =>
      'Ver y gestionar todas las sesiones de escucha';

  @override
  String get adminSessionsAllUsers => 'Todos los usuarios';

  @override
  String get adminSessionsEmpty => 'Sin sesiones';

  @override
  String get statsLibraryTotals => 'Totales de la biblioteca';

  @override
  String get statsTotalItems => 'Elementos';

  @override
  String get statsAudioFiles => 'Archivos de audio';

  @override
  String get statsTotalSize => 'Tamaño total';

  @override
  String get statsBooks => 'Libros';

  @override
  String get statsPodcasts => 'Podcasts';

  @override
  String get statsBooksSize => 'Tamaño de los libros';

  @override
  String get statsYearReview => 'Resumen del año';

  @override
  String get statsNoYearData => 'Sin datos de este año';

  @override
  String get statsListeningTime => 'Tiempo de escucha';

  @override
  String get statsSessions => 'Sesiones';

  @override
  String get statsBooksAdded => 'Libros añadidos';

  @override
  String get statsAuthorsAdded => 'Autores añadidos';

  @override
  String get statsTopAuthors => 'Autores principales';

  @override
  String get statsTopNarrators => 'Narradores principales';

  @override
  String get statsTopGenres => 'Géneros principales';

  @override
  String get srvScannerSection => 'Análisis';

  @override
  String get srvFindCovers => 'Buscar portadas';

  @override
  String get srvCoverProvider => 'Proveedor de portadas';

  @override
  String get srvParseSubtitles => 'Extraer subtítulos del nombre de archivo';

  @override
  String get srvPreferMatched => 'Preferir metadatos coincidentes';

  @override
  String get srvDisableWatcher => 'Desactivar el vigilante de carpetas';

  @override
  String get srvStorageSection => 'Almacenamiento';

  @override
  String get srvStoreCover => 'Guardar la portada con el elemento';

  @override
  String get srvStoreMetadata => 'Guardar los metadatos con el elemento';

  @override
  String get srvMetadataFormat => 'Formato del archivo de metadatos';

  @override
  String get srvFormatSection => 'Pantalla y formato';

  @override
  String get srvDateFormat => 'Formato de fecha';

  @override
  String get srvTimeFormat => 'Formato de hora';

  @override
  String get srvLanguage => 'Idioma del servidor';

  @override
  String get srvChromecast => 'Compatibilidad con Chromecast';

  @override
  String get srvAllowIframe => 'Permitir incrustar en iframe';

  @override
  String get srvSortingSection => 'Ordenación';

  @override
  String get srvIgnorePrefixes => 'Ignorar prefijos al ordenar';

  @override
  String get srvSortingPrefixes => 'Prefijos de ordenación';

  @override
  String get srvAddPrefix => 'Añadir prefijo';

  @override
  String get srvSave => 'Guardar ajustes';

  @override
  String get srvSavePrefixes => 'Guardar prefijos';

  @override
  String get srvSaved => 'Ajustes guardados';

  @override
  String get srvSaveFailed => 'No se pudieron guardar los ajustes';

  @override
  String get srvPrefixesSaved => 'Prefijos de ordenación actualizados';

  @override
  String get authSetLoadFailed =>
      'No se pudieron cargar los ajustes de autenticación';

  @override
  String get authSetCustomMessage => 'Mensaje personalizado al iniciar sesión';

  @override
  String get authSetMessage => 'Mensaje';

  @override
  String get authSetPasswordAuth => 'Autenticación con contraseña';

  @override
  String get authSetOpenId => 'Autenticación con OpenID Connect';

  @override
  String get authSetGuide => 'Guía de configuración';

  @override
  String get authSetIssuerUrl => 'URL del emisor';

  @override
  String get authSetAutoPopulate => 'Rellenar automáticamente';

  @override
  String get authSetAuthorizeUrl => 'URL de autorización';

  @override
  String get authSetTokenUrl => 'URL del token';

  @override
  String get authSetUserinfoUrl => 'URL de Userinfo';

  @override
  String get authSetJwksUrl => 'URL de JWKS';

  @override
  String get authSetLogoutUrl => 'URL de cierre de sesión';

  @override
  String get authSetClientId => 'ID de cliente';

  @override
  String get authSetClientSecret => 'Secreto de cliente';

  @override
  String get authSetSigningAlgorithm => 'Algoritmo de firma';

  @override
  String get authSetRedirectUris => 'URI de redirección móvil permitidas';

  @override
  String get authSetRedirectUrisInfo =>
      'Tras iniciar sesión, las apps solo pueden volver a estas direcciones. Absorb usa absorb://oauth. Un asterisco (*) como única entrada permite cualquier dirección.';

  @override
  String get authSetAddRedirectUri => 'Añadir URI';

  @override
  String get authSetAddAbsorbRedirect => 'Añadir absorb://oauth';

  @override
  String get authSetSubfolder => 'Subcarpeta para las URL de redirección';

  @override
  String get authSetSubfolderNone => 'Ninguna';

  @override
  String get authSetWebRedirectInfo =>
      'Permite estas URL en tu proveedor de OAuth para que el inicio de sesión pueda volver a la app web:';

  @override
  String get authSetButtonText => 'Texto del botón';

  @override
  String get authSetMatchExisting => 'Vincular usuarios existentes por';

  @override
  String get authSetMatchNone => 'No vincular';

  @override
  String get authSetMatchEmail => 'Correo electrónico';

  @override
  String get authSetMatchUsername => 'Usuario';

  @override
  String get authSetMatchExistingInfo =>
      'Se usa para vincular usuarios existentes. Una vez vinculados, los usuarios se identifican por su ID único del proveedor.';

  @override
  String get authSetAutoLaunch => 'Inicio automático';

  @override
  String get authSetAutoLaunchInfo =>
      'Abre el proveedor automáticamente desde la página de inicio de sesión web. /login?autoLaunch=0 lo omite.';

  @override
  String get authSetAutoRegister => 'Registro automático';

  @override
  String get authSetAutoRegisterInfo =>
      'Crear usuarios nuevos automáticamente cuando inicien sesión';

  @override
  String get authSetClaimsInfo =>
      'Déjalos vacíos para desactivar la asignación de grupos y permisos. Los usuarios nuevos tendrán el rol de Usuario.';

  @override
  String get authSetGroupClaim => 'Claim de grupos';

  @override
  String get authSetGroupClaimInfo =>
      'Claim que lista los grupos del usuario, normalmente groups. Los grupos llamados admin, user o guest definen el rol, y gana el más alto. Si ningún grupo coincide, se rechaza el inicio de sesión.';

  @override
  String get authSetPermsClaim => 'Claim de permisos avanzados';

  @override
  String get authSetPermsClaimInfo =>
      'Claim con los permisos de los usuarios no administradores. Si falta el claim, se rechaza el inicio de sesión, y una opción ausente cuenta como desactivada. Formato esperado:';

  @override
  String get authSetRestartNote =>
      'Reinicia el servidor después de guardar para aplicar los cambios de OpenID Connect.';

  @override
  String get authSetNoChanges => 'No hay cambios que guardar';

  @override
  String get authSetNeedOneMethod =>
      'Activa al menos un método de inicio de sesión';

  @override
  String authSetFieldRequired(String field) {
    return '$field es obligatorio';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return 'URI de redirección no válida: $uri';
  }

  @override
  String get authSetAsteriskAlone =>
      'Un asterisco (*) debe ser la única URI de redirección';

  @override
  String authSetInvalidClaim(String field) {
    return '$field no es un nombre de claim válido';
  }

  @override
  String authSetIssuerFailed(String error) {
    return 'No se pudo leer el emisor: $error';
  }

  @override
  String get libNoneYet => 'Aún no hay bibliotecas';

  @override
  String get libReorderFailed => 'No se pudo guardar el nuevo orden';

  @override
  String get libDeleteTitle => '¿Borrar la biblioteca?';

  @override
  String get libDeleteBody =>
      'Esto elimina de forma permanente la biblioteca y todos sus elementos del servidor.';

  @override
  String get libDeleted => 'Biblioteca borrada';

  @override
  String get libDeleteFailed => 'No se pudo borrar la biblioteca';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count carpetas',
      one: '1 carpeta',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => 'Nueva biblioteca';

  @override
  String get libEditTitle => 'Editar biblioteca';

  @override
  String get libName => 'Nombre de la biblioteca';

  @override
  String get libMediaType => 'Tipo de contenido';

  @override
  String get libMediaBook => 'Libros';

  @override
  String get libMediaPodcast => 'Podcasts';

  @override
  String get libProvider => 'Proveedor de metadatos';

  @override
  String get libIcon => 'Icono';

  @override
  String get libFolders => 'Carpetas';

  @override
  String get libAddFolder => 'Añadir carpeta';

  @override
  String get libNoFolders => 'Añade al menos una carpeta';

  @override
  String get libAdvanced => 'Ajustes avanzados';

  @override
  String get libCoverShape => 'Forma de la portada';

  @override
  String get libCoverSquare => 'Cuadrada';

  @override
  String get libCoverStandard => 'Estándar';

  @override
  String get libDisableWatcher => 'Desactivar el vigilante de carpetas';

  @override
  String get libSkipAsin =>
      'Omitir la búsqueda de coincidencias en libros con ASIN';

  @override
  String get libSkipIsbn =>
      'Omitir la búsqueda de coincidencias en libros con ISBN';

  @override
  String get libHideSingleSeries => 'Ocultar series de un solo libro';

  @override
  String get libAudiobooksOnly => 'Solo audiolibros';

  @override
  String get libEpubScripted => 'Permitir contenido ePub con scripts';

  @override
  String get libLaterBooksOnly =>
      'Mostrar solo libros posteriores en Continuar Serie';

  @override
  String get libPodcastRegion => 'Región de búsqueda de podcasts';

  @override
  String get libMarkPercent => 'Terminado al % completado';

  @override
  String get libMarkTime => 'Terminado con segundos restantes';

  @override
  String get libAutoScan => 'Programación de análisis automático (cron)';

  @override
  String get libCreate => 'Crear biblioteca';

  @override
  String get libUpdate => 'Guardar cambios';

  @override
  String get libNameRequired => 'Escribe un nombre para la biblioteca';

  @override
  String get libCreated => 'Biblioteca creada';

  @override
  String get libCreateFailed => 'No se pudo crear la biblioteca';

  @override
  String get libUpdated => 'Biblioteca actualizada';

  @override
  String get libUpdateFailed => 'No se pudo actualizar la biblioteca';

  @override
  String get libRemoveFoldersTitle => '¿Eliminar carpetas?';

  @override
  String get libRemoveFoldersBody =>
      'Al eliminar una carpeta se borran sus elementos de la biblioteca. No se puede deshacer.';

  @override
  String get readEbook => 'Leer';

  @override
  String get ebookDownload => 'Descargar';

  @override
  String get ebookDownloaded => 'Descargado';

  @override
  String get ebookSavedOffline => 'Guardado para leer sin conexión';

  @override
  String get ebookRemovedOffline => 'Eliminado del modo sin conexión';

  @override
  String get ebookOfflineFailed => 'No se pudo descargar el libro electrónico';

  @override
  String get ebookSaveToDevice => 'Guardar en el dispositivo';

  @override
  String get ebookSaveToDeviceTitle => '¿Guardar en el dispositivo?';

  @override
  String get ebookSaveToDeviceBody =>
      'Esto guarda una copia del archivo del libro electrónico en tu dispositivo (tú eliges dónde). No hará que el libro esté disponible sin conexión en el lector; para eso usa Descargar.';

  @override
  String get readerFormatUnsupported =>
      'Este formato de libro electrónico aún no se puede abrir en el lector';

  @override
  String get readerCouldNotOpen =>
      'No se pudo abrir este libro electrónico. Puede que el archivo esté dañado.';

  @override
  String get moreActions => 'Más';

  @override
  String get readerChapters => 'Capítulos';

  @override
  String get readerSettings => 'Ajustes del lector';

  @override
  String get readerFontSize => 'Tamaño de fuente';

  @override
  String get readerLineSpacing => 'Interlineado';

  @override
  String get readerTextAlignment => 'Alineación';

  @override
  String get readerAlignJustified => 'Justificado';

  @override
  String get readerAlignLeft => 'Izquierda';

  @override
  String get readerSideMargins => 'Márgenes laterales';

  @override
  String get readerTopBottom => 'Superior e inferior';

  @override
  String get readerPageLayout => 'Diseño de página';

  @override
  String get readerPinTopBar =>
      'Mantener el título y la barra de progreso en pantalla';

  @override
  String get readerPinTopBarHint =>
      'Los fija sobre la página en lugar de mostrarlos al tocar. La página queda un poco más corta para no tapar texto.';

  @override
  String get readerTopBarProgress => 'Progreso de la barra superior';

  @override
  String get readerTopBarProgressBook => 'Libro';

  @override
  String get readerTopBarProgressChapter => 'Capítulo';

  @override
  String get readerTopBarProgressBoth => 'Ambos';

  @override
  String get readerSectionText => 'Texto';

  @override
  String get readerSectionPage => 'Página';

  @override
  String get readerSectionTopBar => 'Barra superior y pantalla';

  @override
  String get readerSectionControls => 'Controles';

  @override
  String get readerSectionStats => 'Estadísticas';

  @override
  String get readerParagraphSpacing => 'Espaciado de párrafos';

  @override
  String get readerParagraphSpacingBook => 'El del libro';

  @override
  String get readerTapZones => 'Zonas de toque';

  @override
  String get readerTapZonesHint =>
      'Arrastra las líneas para cambiar el tamaño de los cuadrados. Toca un cuadrado para cambiar su acción, o parte de un diseño predefinido.';

  @override
  String get readerTapPrev => 'Página anterior';

  @override
  String get readerTapNext => 'Página siguiente';

  @override
  String get readerTapMenu => 'Mostrar controles';

  @override
  String get readerTapNothing => 'Nada';

  @override
  String get readerTapKeepMenu => 'Un cuadrado debe mostrar los controles';

  @override
  String get readerHideControls => 'Ocultar controles tras';

  @override
  String get readerHideControlsNever => 'Nunca';

  @override
  String get readerBarNotes => 'Notas y resaltados';

  @override
  String readerHideControlsAfter(int seconds) {
    return '$seconds s';
  }

  @override
  String get playerDownloadStreamingInstead =>
      'No se pudo reproducir esta descarga, así que se reproduce desde el servidor. Descargarla de nuevo puede solucionarlo.';

  @override
  String get readerPageTurn => 'Cambio de página';

  @override
  String get readerPageTurnNone => 'Ninguno';

  @override
  String get readerPageTurnSlide => 'Deslizar';

  @override
  String get readerPageTurnCurl => 'Pliegue';

  @override
  String get readerPageTurnRipple => 'Ondulación';

  @override
  String get readerScrollMode => 'Modo de desplazamiento';

  @override
  String get readerScrollModeHint =>
      'Desplázate hacia abajo por el libro en lugar de pasar páginas. Se aplica a todos los libros.';

  @override
  String get readerKeepAwake => 'Mantener la pantalla encendida';

  @override
  String get readerKeepAwakeHint =>
      'Evita que la pantalla se apague mientras lees a tu ritmo. El desplazamiento automático y leer junto al audio siempre la mantienen encendida.';

  @override
  String get readerLayoutAuto => 'Automático';

  @override
  String get readerLayoutSingle => 'Una página';

  @override
  String get readerLayoutTwoPage => 'Dos páginas';

  @override
  String get readerTheme => 'Tema';

  @override
  String get readerFont => 'Fuente';

  @override
  String get readerVolumeNav => 'Las teclas de volumen pasan página';

  @override
  String get readerVolumeNavOff => 'Apagado';

  @override
  String get readerVolumeNavNormal => 'Normal';

  @override
  String get readerVolumeNavMirrored => 'Invertido';

  @override
  String get readerAutoScroll => 'Desplazamiento automático';

  @override
  String get readerAutoScrollSubtitle =>
      'La página siguiente se dibuja sobre esta de arriba abajo; arrastra el centro de la pantalla para cambiar la velocidad y toca para detener';

  @override
  String get readerAutoScrollStarted => 'Desplazamiento automático iniciado';

  @override
  String get readerAutoScrollPaused => 'En pausa; mantén pulsado para detener';

  @override
  String get readerAutoScrollResumed => 'Desplazamiento automático reanudado';

  @override
  String get readerAutoScrollStopped => 'Desplazamiento automático apagado';

  @override
  String get readerAutoScrollEndOfBook =>
      'Fin del libro; desplazamiento automático apagado';

  @override
  String readerAutoScrollSpeed(int percent) {
    return 'Velocidad $percent%';
  }

  @override
  String get readerMoreControls => 'Más controles';

  @override
  String get readerAutoScrollSleep =>
      'Temporizador de apagado del desplazamiento automático';

  @override
  String get readerAutoScrollSleepHint =>
      'Detiene el desplazamiento pasado un rato y deja que la pantalla se apague.';

  @override
  String readerAutoScrollSleepMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String readerAutoScrollSleepLeft(int minutes) {
    return 'Quedan $minutes min';
  }

  @override
  String readerAutoScrollSleepIn(int minutes) {
    return 'El desplazamiento automático se detiene en $minutes min';
  }

  @override
  String get readerAutoScrollSleepOff =>
      'Temporizador del desplazamiento automático apagado';

  @override
  String get readerAutoScrollSleepEnded =>
      'Temporizador de apagado; desplazamiento automático apagado';

  @override
  String get readerDownloadStarted => 'Descarga iniciada';

  @override
  String get detailChaptersJumpTitle => '¿Saltar a este capítulo?';

  @override
  String detailChaptersJumpContent(String title) {
    return 'La reproducción pasa a \"$title\".';
  }

  @override
  String get detailChaptersJump => 'Saltar';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capítulos terminados',
      one: '1 capítulo terminado',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count otros oyentes',
      one: '1 otro oyente',
      zero: 'Ningún otro oyente',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => 'A continuación';

  @override
  String get seriesJumpToUpNext => 'Saltar a lo siguiente';

  @override
  String get seriesStatsFinished => 'Terminados';

  @override
  String get seriesStatsListened => 'Escuchados';

  @override
  String get seriesStatsLeft => 'Restantes';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done de $total';
  }

  @override
  String get detailSessionsNone => 'Aún no hay sesiones de escucha';

  @override
  String detailSessionsAll(int count) {
    return 'Las $count sesiones';
  }

  @override
  String get readerVolumeNavWhilePlaying => 'Incluso mientras suena el audio';

  @override
  String get readerTranslateWith => 'Traducir con';

  @override
  String get readerTranslateApp => 'App de este dispositivo';

  @override
  String get readerTranslateApple => 'Integrado en iOS';

  @override
  String get readerTranslateWeb => 'Se abre en tu navegador';

  @override
  String get readerTranslateHint =>
      'El texto seleccionado se envía al traductor que elijas.';

  @override
  String get readerMoreFonts => 'Descargar más fuentes';

  @override
  String get readerFontRemove => 'Eliminar descarga';

  @override
  String readerFontDownloadFailed(String font) {
    return 'No se pudo descargar $font';
  }

  @override
  String get readerAnnotations => 'Anotaciones';

  @override
  String readerHighlights(int count) {
    return 'Resaltados ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return 'Marcadores ($count)';
  }

  @override
  String get readerNoHighlights => 'Aún no hay resaltados';

  @override
  String get readerHistory => 'Historial';

  @override
  String get sessionReading => 'Lectura';

  @override
  String get readerHistoryEmpty =>
      'Las páginas que dejas se listan aquí, para que siempre puedas volver a ellas.';

  @override
  String get readerHistoryClosed => 'Libro cerrado';

  @override
  String get readerHistoryBeforeJump => 'Antes de un salto';

  @override
  String get readerHistoryBeforeSync => 'Antes de sincronizar con el audio';

  @override
  String get readerLogReading =>
      'Contar el tiempo de lectura en las estadísticas';

  @override
  String get readerLogReadingHint =>
      'Registra tu tiempo en el lector como una sesión para que aparezca en tus estadísticas. En Audiobookshelf cuenta como tiempo de escucha.';

  @override
  String get readerNoBookmarks => 'Aún no hay marcadores';

  @override
  String get readerBookmarkDefault => 'Marcador';

  @override
  String get readerNoteTitle => 'Nota';

  @override
  String get readerNoteHint => 'Añade una nota...';

  @override
  String get backupAndSync => 'Copia de seguridad y sincronización';

  @override
  String get backupAndSyncSubtitle =>
      'Guarda un archivo de copia de seguridad o mantén los ajustes al día entre dispositivos';

  @override
  String get syncSettingsExperimental => 'Experimental';

  @override
  String get syncSettingsExperimentalBody =>
      'La sincronización es nueva y aún se está trabajando en ella. Si dos dispositivos cambian cosas mientras están separados, uno puede perder sus cambios. Conserva un archivo de copia de seguridad como copia segura.';

  @override
  String get syncSettingsNeedServer => '¿Necesitas un servidor?';

  @override
  String get syncSettingsNeedServerSub =>
      'Sirve cualquier servidor WebDAV. Nextcloud es uno gratuito que puedes alojar tú mismo.';

  @override
  String get syncSettingsConnection => 'Conexión';

  @override
  String get syncSettingsConnectionNotSet => 'Aún sin configurar';

  @override
  String get syncSettingsBackupFile => 'Archivo de copia de seguridad';

  @override
  String get syncSettingsBackupFilePlain =>
      'Guarda todo en un archivo que conservas.';

  @override
  String get syncSettingsBackupFileWithSync =>
      'Guarda todo en un archivo que conservas. Incluye los datos de inicio de sesión, y al restaurarlo en otro teléfono también se activa la sincronización allí.';

  @override
  String get syncSettingsStatusOff => 'Sin sincronizar';

  @override
  String get syncSettingsStatusProblem => 'No se pudo acceder a tu servidor';

  @override
  String get syncSettings => 'Sincronizar ajustes entre dispositivos';

  @override
  String get syncSettingsExtras => 'Sincronizar también';

  @override
  String get syncSettingsIncludeRmab => 'Ajustes de ReadMeABook';

  @override
  String get syncSettingsIncludeRmabSub =>
      'Incluye tu token de API de ReadMeABook en el archivo sincronizado';

  @override
  String get syncSettingsSubtitle =>
      'Mantén tus ajustes al día mediante tu propio servidor WebDAV';

  @override
  String get syncSettingsEnable => 'Sincronizar ajustes';

  @override
  String get syncSettingsServerUrl => 'URL de la carpeta WebDAV';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => 'Usuario';

  @override
  String get syncSettingsPassword => 'Contraseña';

  @override
  String get syncSettingsHeaders => 'Encabezados personalizados (opcional)';

  @override
  String get syncSettingsHeadersHint =>
      'Uno por línea, como CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => 'Probar conexión';

  @override
  String get syncSettingsHoldToUpload => 'Mantén pulsado para subir ahora';

  @override
  String get syncSettingsUploadNow => 'Subir ahora';

  @override
  String get syncSettingsDownloadNow => 'Descargar ahora';

  @override
  String get syncSettingsOk => 'Conectado';

  @override
  String get syncSettingsNoRemote =>
      'Conectado; aún no se ha sincronizado nada';

  @override
  String get syncSettingsAuthFailed => 'Usuario o contraseña incorrectos';

  @override
  String get syncSettingsNetworkError => 'No se pudo acceder a esa dirección';

  @override
  String get syncSettingsNotConfigured =>
      'Rellena primero la dirección, el usuario y la contraseña';

  @override
  String get syncSettingsTooLarge =>
      'Tus ajustes son demasiado grandes para sincronizarlos';

  @override
  String get syncSettingsUploaded => 'Ajustes subidos';

  @override
  String get syncSettingsApplied =>
      'Ajustes actualizados desde tu otro dispositivo';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ajustes actualizados desde tu otro dispositivo',
      one: '1 ajuste actualizado desde tu otro dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => 'Ya está al día';

  @override
  String syncSettingsLastSynced(String when) {
    return 'Última sincronización: $when';
  }

  @override
  String get syncSettingsNever => 'Aún sin sincronizar';

  @override
  String navHoldPickTitle(String tab) {
    return 'Mantener pulsado $tab hará...';
  }

  @override
  String get navHoldPickBody =>
      'Elige qué hace una pulsación larga en esta pestaña. Puedes cambiarlo más tarde en Ajustes.';

  @override
  String get navHoldSettingTitle => 'Atajos al mantener pulsada una pestaña';

  @override
  String get navHoldSettingSubtitle => 'Qué hace mantener pulsada cada pestaña';

  @override
  String get navHoldAskNextTime => 'Preguntar la próxima vez';

  @override
  String get navHoldNothing => 'Nada';

  @override
  String get navHoldPlayPause => 'Reproducir / pausar';

  @override
  String get navHoldOfflineMode => 'Modo sin conexión';

  @override
  String get navHoldOfflineOn => 'Modo sin conexión activado';

  @override
  String get navHoldOfflineOff => 'Modo sin conexión desactivado';

  @override
  String get navHoldMenu => 'Mostrar siempre el menú';

  @override
  String get navHoldStop => 'Detener la reproducción';

  @override
  String get navHoldRmabSearch => 'Búsqueda en ReadMeABook';

  @override
  String get navHoldRmabRequests => 'Mis solicitudes de libros';

  @override
  String get navHoldRmabWeb => 'Sitio de ReadMeABook';

  @override
  String get navHoldAdd => 'Añadir';

  @override
  String get navHoldMoveLeft => 'Mover a la izquierda';

  @override
  String get navHoldMoveRight => 'Mover a la derecha';

  @override
  String get navHoldRemoveFromMenu => 'Quitar del menú';

  @override
  String get navHoldEditHint =>
      'Mantén pulsado un elemento para moverlo o quitarlo';

  @override
  String get navHoldResetMenu => 'Restablecer los elementos del menú';

  @override
  String get navHoldMenuReset => 'Elementos del menú restablecidos';

  @override
  String get bookStatsAction => 'Estadísticas de escucha';

  @override
  String get bookStatsYou => 'Tú';

  @override
  String get bookStatsEveryone => 'Todos';

  @override
  String get bookStatsListened => 'Tiempo escuchado';

  @override
  String get bookStatsSessions => 'Sesiones';

  @override
  String get bookStatsFirst => 'Primera escucha';

  @override
  String get bookStatsLast => 'Última escucha';

  @override
  String get bookStatsListeners => 'Personas que lo empezaron';

  @override
  String get bookStatsFinishedCount => 'Personas que lo terminaron';

  @override
  String get bookStatsTotalTime => 'Tiempo escuchado entre todos';

  @override
  String get bookStatsNobody => 'Nadie ha empezado esto aún';

  @override
  String get bookStatsScanning =>
      'Revisando las sesiones, esto puede tardar un poco...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return 'Revisando las sesiones, $done de $total personas...';
  }

  @override
  String bookStatsLastChecked(String when) {
    return 'Comprobado $when';
  }

  @override
  String get activityYourReading => 'Tu lectura';

  @override
  String get activityYourListening => 'Tu escucha';

  @override
  String activityLastRead(String when) {
    return 'Última lectura $when';
  }

  @override
  String activityLastListened(String when) {
    return 'Última escucha $when';
  }

  @override
  String get activityNotStarted => 'Sin empezar';

  @override
  String get activityNoReading => 'Aún no hay sesiones de lectura';

  @override
  String get activityTime => 'Tiempo';

  @override
  String get activityAverage => 'Prom.';

  @override
  String get activityProgress => 'Progreso';

  @override
  String activityReached(String percent) {
    return '$percent alcanzado';
  }

  @override
  String get readingLogTitle => 'Registro de lectura';

  @override
  String get readingLogTotalTime => 'Tiempo total';

  @override
  String get readingLogAverageSession => 'Sesión media';

  @override
  String get readingLogActiveDays => 'Días activos';

  @override
  String readingLogActiveDaysOf(int active, int total) {
    return '$active de $total';
  }

  @override
  String get readingLogPace => 'Ritmo';

  @override
  String readingLogPacePerHour(String percent) {
    return '$percent%/h';
  }

  @override
  String get readingLogLastRead => 'Última lectura';

  @override
  String get readingLogStarted => 'Empezado';

  @override
  String get readingLogFinished => 'Terminado';

  @override
  String get readingLogNotSet => 'Sin definir';

  @override
  String readingLogLeftMinutes(int m) {
    return 'Unos $m min para terminar';
  }

  @override
  String readingLogLeftHours(int h) {
    return 'Unas $h h para terminar';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return 'Unas $h h $m min para terminar';
  }

  @override
  String get readingLogLeftMax => 'Más de 99 h para terminar';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return '$percent% más que la semana anterior';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return '$percent% menos que la semana anterior';
  }

  @override
  String get readingLogNewThisWeek => 'Nuevo esta semana';

  @override
  String get readingLogSameAsLastWeek => 'Igual que la semana anterior';

  @override
  String get readingLogQuietTwoWeeks => 'Nada en las últimas dos semanas';

  @override
  String get readingLogWhereYouRead => 'Dónde lo leíste';

  @override
  String get readingLogSourceIos => 'App de iOS';

  @override
  String get readingLogSourceAndroid => 'App de Android';

  @override
  String get readingLogChartTitle => 'Progreso a lo largo del tiempo';

  @override
  String get readingLogChartPosition => 'Posición alcanzada';

  @override
  String get readingLogChartMinutes => 'Minutos';

  @override
  String get readingLogRecords => 'Récords';

  @override
  String get readingLogLongestSession => 'Sesión más larga';

  @override
  String get readingLogBestDay => 'Mejor día';

  @override
  String get readingLogLongestStreak => 'Racha más larga';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días',
      one: '1 día',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => 'Retrocesos';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count veces',
      one: '1 vez',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => 'Abierto por primera vez';

  @override
  String get readingLogAttempts => 'Intentos';

  @override
  String readingLogAttempt(int index) {
    return 'Intento $index';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return 'Empezó el intento $index';
  }

  @override
  String get readingLogOutcomeCompleted => 'Completado';

  @override
  String get readingLogOutcomeSkimmed => 'Hojeado';

  @override
  String get readingLogOutcomeAbandoned => 'Abandonado';

  @override
  String get readingLogOutcomeInProgress => 'En curso';

  @override
  String readingLogSpanRange(String from, String to) {
    return '$from a $to';
  }

  @override
  String readingLogSpanSince(String from) {
    return 'Desde $from';
  }

  @override
  String readingLogSpanEnded(String to) {
    return 'Terminó $to';
  }

  @override
  String get readingLogSpanUnknown => 'Sin fechas registradas';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sesiones',
      one: '1 sesión',
    );
    return '$_temp0';
  }

  @override
  String readingLogShowing(int shown, int total) {
    return '$shown de $total';
  }

  @override
  String readingLogGapDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días sin leer',
      one: '1 día sin leer',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => 'Aún no hay sesiones registradas';

  @override
  String get readingLogEmptyHint =>
      'Las sesiones aparecen aquí a medida que lees o escuchas, desde cualquier app o dispositivo que se sincronice con BookOrbit.';

  @override
  String get readingLogNoMatches => 'No hay sesiones en este intervalo';

  @override
  String get readingLogAllTime => 'Todo el tiempo';

  @override
  String get readingLogLast30 => 'Últimos 30 días';

  @override
  String get readingLogLast90 => 'Últimos 90 días';

  @override
  String get readingLogThisYear => 'Este año';

  @override
  String get readingLogAllFormats => 'Todos los formatos';

  @override
  String get readingLogSortBy => 'Ordenar por';

  @override
  String get readingLogSortDay => 'Día';

  @override
  String get readingLogSortLength => 'Duración';

  @override
  String get readingLogSortChange => 'Cambio';

  @override
  String get readingLogSortReached => 'Alcanzado';

  @override
  String get readingLogNewestFirst => 'Más recientes primero';

  @override
  String get readingLogOldestFirst => 'Más antiguos primero';

  @override
  String get readingLogMostFirst => 'Más primero';

  @override
  String get readingLogLeastFirst => 'Menos primero';

  @override
  String get readingLogDeleteTitle => '¿Borrar esta sesión?';

  @override
  String get readingLogDeleteBody =>
      'Se quita del registro de lectura del libro y de tus estadísticas en BookOrbit.';

  @override
  String get readingLogDeleteFailed => 'No se pudo borrar la sesión';

  @override
  String get readingLogLoadFailed => 'No se pudo cargar el registro de lectura';

  @override
  String get navHoldServerScan => 'Análisis del servidor';

  @override
  String get navHoldScanAll => 'Analizar todas las bibliotecas';

  @override
  String navHoldScanLibrary(String name) {
    return 'Analizar $name';
  }

  @override
  String get navHoldScanStarted => 'Análisis iniciado';

  @override
  String get navHoldScanFailed => 'No se pudo iniciar el análisis';

  @override
  String get navHoldAdminLogs => 'Registros del servidor';

  @override
  String navHoldAdminPage(String page) {
    return 'Administración: $page';
  }

  @override
  String get navHoldNothingPlaying => 'Aún no hay nada que reproducir';

  @override
  String get navHoldReadBook => 'Leer el libro actual';

  @override
  String get navHoldBookDetails => 'Detalles del libro actual';

  @override
  String get syncSourceTitle => '¿Qué copia debe conservar la sincronización?';

  @override
  String get syncSourceBody =>
      'Esta copia de seguridad activó la sincronización de ajustes. ¿Usar la última sincronización del servidor o convertir esta copia en la fuente de referencia? Si eliges la copia, se reemplaza la copia del servidor para todos tus dispositivos sincronizados.';

  @override
  String get syncSourceUseServer => 'Última sincronización del servidor';

  @override
  String get syncSourceUseBackup => 'Esta copia de seguridad';

  @override
  String get syncSettingsWhatTravels =>
      'Se sincronizan tus preferencias, las velocidades por libro, el diseño de inicio, el orden de Absorbing, las notas y los resaltados de libros electrónicos. Las sesiones, las carpetas de descarga, los interruptores de descarga automática, el aspecto del lector y todo lo que aún no se ha enviado a tu servidor se quedan en este dispositivo.';

  @override
  String get syncSettingsDownloadWarnTitle =>
      '¿Reemplazar los ajustes de este dispositivo?';

  @override
  String get syncSettingsDownloadWarnBody =>
      'La copia sincronizada sobrescribirá los ajustes de este dispositivo.';

  @override
  String get syncSettingsDownloadWarnConfirm => 'Reemplazar';

  @override
  String get readerCopied => 'Copiado al portapapeles';

  @override
  String get dictionaryNotFound =>
      'No se encontró ninguna definición de esta palabra.';

  @override
  String get dictionaryError =>
      'No se pudo acceder al diccionario. Revisa tu conexión.';

  @override
  String get dictionaryRetry => 'Reintentar';

  @override
  String get dictionarySearchWeb => 'Buscar en la web';

  @override
  String get readerTooltipCopy => 'Copiar';

  @override
  String get readerTooltipSearch => 'Buscar';

  @override
  String get readerTooltipDefine => 'Definir';

  @override
  String get readerTooltipTranslate => 'Traducir';

  @override
  String get readerSearchHint => 'Buscar en este libro…';

  @override
  String readerSearchMatches(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados para \"$query\"',
      one: '$count resultado para \"$query\"',
    );
    return '$_temp0';
  }

  @override
  String get readerSearchEmpty => 'Escribe una palabra o frase y toca buscar.';

  @override
  String readerSearchNoResults(String query) {
    return 'Sin resultados para \"$query\".';
  }

  @override
  String get transcriptionTitle => 'Transcripción';

  @override
  String get transcriptionAdvancedSubtitle =>
      'Para transcribir marcadores y encontrar tu posición entre el audiolibro y el libro electrónico';

  @override
  String get transcriptionEnable => 'Activar la transcripción';

  @override
  String get transcriptionEnableSubtitle =>
      'Añade Transcribir a los marcadores, Buscar posición en el libro electrónico al reproductor y Buscar en el audiolibro al lector';

  @override
  String get transcriptionDisclaimer =>
      'Se ejecuta por completo en tu dispositivo y no se envía nada a ningún sitio. Usa batería y procesamiento extra mientras trabaja, y solo se pueden transcribir libros descargados.';

  @override
  String get transcriptionNeedModelHint =>
      'Descarga un modelo abajo para empezar a transcribir.';

  @override
  String get transcriptionModelSection => 'Modelos';

  @override
  String get transcriptionModelTiny => 'Mínimo';

  @override
  String get transcriptionModelTinyDesc =>
      'El más rápido, pero menos preciso. Unos 31 MB.';

  @override
  String get transcriptionModelBase => 'Base';

  @override
  String get transcriptionModelBaseDesc => 'Un buen punto medio. Unos 57 MB.';

  @override
  String get transcriptionModelSmall => 'Pequeño';

  @override
  String get transcriptionModelSmallDesc =>
      'Más lento pero el más preciso; mejor en un teléfono de gama alta. Unos 182 MB.';

  @override
  String get transcriptionAutoHint =>
      'Si hay más de uno descargado, cada tarea elige entre ellos. Los libros con libro electrónico usan el más rápido, ya que las palabras exactas salen del libro electrónico de todos modos. Los libros sin él usan el más preciso, salvo leer junto al audio, que se queda por debajo de Pequeño para poder seguir el ritmo de la narración.';

  @override
  String get transcriptionDownload => 'Descargar';

  @override
  String get transcriptionDownloadFailed =>
      'Error al descargar. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get transcribe => 'Transcribir';

  @override
  String get transcribing => 'Transcribiendo...';

  @override
  String get transcriptionResultTitle => 'Transcripción';

  @override
  String get transcriptionSaveToNote => 'Guardar en la nota';

  @override
  String get transcriptionSavedToNote => 'Guardado en la nota del marcador';

  @override
  String get transcriptionDisabledHint =>
      'Activa la transcripción de marcadores en Ajustes, en Avanzado.';

  @override
  String get transcriptionNoModelDownloaded =>
      'Primero descarga un modelo de transcripción en Ajustes.';

  @override
  String get transcriptionNotDownloadedBook =>
      'Descarga este libro o conéctate a tu servidor para transcribirlo.';

  @override
  String get transcriptionNoMetadataMsg =>
      'No se puede ubicar este punto en la descarga. Prueba a descargar el libro de nuevo.';

  @override
  String get transcriptionBusyMsg =>
      'Ya se está transcribiendo algo. Espera un momento.';

  @override
  String get transcriptionEmptyMsg => 'No se encontró voz en este punto.';

  @override
  String get transcriptionFailedMsg =>
      'No se pudo transcribir este punto. Inténtalo de nuevo.';

  @override
  String get transcriptionPlaySnippet => 'Escuchar';

  @override
  String get transcriptionPauseSnippet => 'Pausar';

  @override
  String get transcriptionIntroBody =>
      'Esto escucha la cantidad de audio elegida, empezando justo antes del marcador, y la convierte en texto en tu dispositivo. Los fragmentos más largos tardan más, y la transcripción no es 100% precisa. Al terminar, el texto se guarda en la nota del marcador, listo para corregirlo o compartirlo.';

  @override
  String get transcriptionUseEbookText =>
      'Usar el texto exacto del libro electrónico cuando se pueda emparejar';

  @override
  String get lyricsMode => 'Transcripción en vivo';

  @override
  String get lyricsListeningAhead => 'Escuchando por adelantado...';

  @override
  String get lyricsDisplaySection => 'Transcripción en vivo';

  @override
  String get lyricsFontSize => 'Tamaño de línea';

  @override
  String get lyricsMaxLines => 'Líneas mostradas';

  @override
  String get lyricsFullCover => 'Usar toda la portada';

  @override
  String get lyricsFullCoverHint =>
      'Muestra la transcripción en lugar de la imagen mientras funciona, con tantas líneas como quepan.';

  @override
  String get lyricsBatteryInfo =>
      'La transcripción en vivo y leer junto al audio usan batería y procesamiento extra mientras funcionan. En teléfonos con procesadores más lentos, las líneas pueden tardar más en aparecer.';

  @override
  String get lyricsClearCache => 'Borrar la caché de transcripciones';

  @override
  String lyricsClearCacheHint(String size) {
    return '$size de líneas de transcripción guardadas. Los libros y episodios borrados se vuelven a transcribir mientras escuchas.';
  }

  @override
  String get lyricsClearCacheConfirm =>
      '¿Borrar las transcripciones guardadas de todos los libros y episodios? Se reconstruyen automáticamente mientras escuchas.';

  @override
  String get lyricsCacheCleared => 'Caché de transcripciones borrada';

  @override
  String get lyricsIntroBody =>
      'Esto escucha un poco por delante de la narración y muestra cada línea a medida que se dice, transcrita en tu teléfono; nada sale del dispositivo. Después de activarlo, espera unos segundos antes de pulsar reproducir mientras se adelanta. La transcripción aparece cuando su ventaja está lista, y empezar en pausa le da el funcionamiento más fluido. Usa batería y procesamiento extra mientras funciona.';

  @override
  String lyricsBuildingLead(String percent) {
    return 'Adelantándose a la narración... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return 'No se puede transcribir tan rápido como escuchas a $speed';
  }

  @override
  String get lyricsTurnOn => 'Activar';

  @override
  String get readAlong => 'Leer junto al audio';

  @override
  String get readAlongNeedsPlaying =>
      'Primero reproduce el audiolibro de este libro';

  @override
  String get narrationListen => 'Escuchar';

  @override
  String get narrationPlayFromHere => 'Reproducir desde aquí';

  @override
  String get narrationPreparing => 'Preparando la narración';

  @override
  String get narrationNone =>
      'Este libro electrónico no tiene narración que reproducir';

  @override
  String get narrationDownloadTitle => 'Descargar para escuchar';

  @override
  String get narrationDownloadBody =>
      'Este libro es un EPUB3 que se lee en voz alta. Audiobookshelf no puede transmitir su narración, así que el audio se debe descargar antes de reproducirlo.';

  @override
  String get narrationDownloadStarted =>
      'Descargando la narración. Toca Absorb cuando termine.';

  @override
  String get narrationTextBody =>
      'El EPUB de este libro tiene sus propias palabras para cada momento del audio, así que el texto se copia directamente del libro. Elige cuánto añadir a la nota del marcador.';

  @override
  String get narrationTextLoading => 'Obteniendo las palabras del libro';

  @override
  String get downloadToAbsorb => 'Descargar en Absorb';

  @override
  String get narrationUpNextTitle => 'Descargar lo siguiente';

  @override
  String narrationUpNextBody(String title) {
    return '$title es el siguiente en tu cola. Es un EPUB3 que se lee en voz alta, así que se debe descargar antes de poder reproducirlo.';
  }

  @override
  String narrationQueueStopped(String title) {
    return 'Detenido antes de $title. Descárgalo para continuar.';
  }

  @override
  String get transcriptionNeedsDownload =>
      'Esto necesita el audio en tu teléfono. ¿Descargarlo ahora?';

  @override
  String get transcriptionDownloadStarted =>
      'Descargando. Vuelve a activarlo cuando termine';

  @override
  String get readAlongFollow => 'Leer junto al audio sigue';

  @override
  String get syncReadingListening =>
      'Mantener sincronizadas la lectura y la escucha';

  @override
  String get syncReadingListeningHint =>
      'Para libros con audiolibro y libro electrónico. Al dejar de escuchar, el libro electrónico pasa al punto donde paraste. Al salir del lector, el audiolibro pasa a tu página. Solo avanza.';

  @override
  String get syncEbookMoved =>
      'El libro electrónico pasó al punto donde dejaste de escuchar';

  @override
  String get syncAudioMoved =>
      'El audiolibro pasó al punto donde dejaste de leer';

  @override
  String get syncAudioOffer =>
      'Toca para saltar al punto donde dejaste de leer';

  @override
  String get syncFindingAudio => 'Buscando tu página en el audiolibro';

  @override
  String get syncFindingEbook => 'Buscando tu punto en el libro electrónico';

  @override
  String get syncFailed => 'No se pudo sincronizar tu posición';

  @override
  String get syncAlreadyTogether => 'Ya está sincronizado';

  @override
  String get syncPosition => 'Sincronizar posición';

  @override
  String get readAlongFollowHint =>
      'El momento de cada palabra se calcula entre las marcas de tiempo de la transcripción, así que puede desviarse un poco dentro de una frase.';

  @override
  String get readAlongFollowWord => 'Palabra';

  @override
  String get readAlongFollowSentence => 'Frase';

  @override
  String get readAlongColor => 'Color de leer junto al audio';

  @override
  String get readAlongLost => 'No se encuentra la narración en la página';

  @override
  String get readAlongBackToNarration => 'Volver a la narración';

  @override
  String get findInEbook => 'Buscar en el libro electrónico';

  @override
  String get findInEbookSearching =>
      'Buscando este punto en el libro electrónico...';

  @override
  String get findInEbookNotFound =>
      'No se encontró este punto en el libro electrónico.';

  @override
  String get findInEbookNeedsEpub =>
      'Buscar en el libro electrónico requiere un libro electrónico EPUB.';

  @override
  String get findInEbookNoEbook => 'Este libro no tiene libro electrónico.';

  @override
  String get findInAudiobook => 'Buscar en el audiolibro';

  @override
  String get findInAudiobookSearching =>
      'Buscando este punto en el audiolibro...';

  @override
  String get findInAudiobookStillSearching =>
      'Aún se busca este punto en el audio...';

  @override
  String get findInAudiobookSearchingLong =>
      'Capítulo largo, sigue buscando. Puede tardar un minuto o dos...';

  @override
  String get findInAudiobookNotFound =>
      'No se encontró este punto en el audiolibro.';

  @override
  String get transcriptionWhisperInfo =>
      'La transcripción funciona con Whisper, un modelo abierto de reconocimiento de voz que escucha la narración y escribe las palabras, todo en este dispositivo.';

  @override
  String get transcriptionWhisperLearnMore => 'Más información sobre Whisper';

  @override
  String get findInAudiobookIntroBody =>
      'Esto escucha el audiolibro cerca de donde estás leyendo y lo empareja con este pasaje, todo en tu dispositivo. Puede tardar hasta un minuto. Si el punto no se puede emparejar con seguridad, no se mueve nada.';

  @override
  String get findInAudiobookAfterLabel => 'Cuando se encuentre el punto';

  @override
  String get findInAudiobookStay => 'Seguir leyendo';

  @override
  String get findInAudiobookGoPlayer => 'Abrir el reproductor';

  @override
  String get findInAudiobookPlaying =>
      'Reproduciendo este pasaje en el audiolibro';

  @override
  String get catchUpAudioAhead =>
      'El audiolibro va más adelantado. Toca para ir allí.';

  @override
  String get catchUpPageAhead =>
      'Esta página va por delante del audiolibro. Toca para mover el audiolibro aquí.';

  @override
  String get readerShortcutButton => 'Botón de acceso directo';

  @override
  String get keepScreenOn => 'Mantener la pantalla encendida';

  @override
  String get keepScreenOnActive => 'La pantalla sigue encendida';

  @override
  String get keepScreenOnUntilClosed =>
      'La pantalla sigue encendida hasta que cierres la app';

  @override
  String get keepScreenOnOff => 'La pantalla se puede volver a apagar';

  @override
  String get keepScreenOnOffUntilRestart =>
      'Apagado hasta que se reinicie la app. El interruptor de Ajustes sigue activado';

  @override
  String get keepScreenOnPlayer =>
      'Mantener la pantalla encendida en el reproductor';

  @override
  String get keepScreenOnPlayerSubtitle =>
      'La pantalla sigue encendida mientras el reproductor está abierto';

  @override
  String get keepScreenOnCarMode =>
      'Mantener la pantalla encendida en el modo coche';

  @override
  String get keepScreenOnCarModeSubtitle =>
      'La pantalla sigue encendida mientras el modo coche está abierto';

  @override
  String get loginServerType => 'Tipo de servidor';

  @override
  String get authBookOrbitDefaultPassword =>
      'Esta cuenta aún tiene su contraseña predeterminada. Cámbiala en BookOrbit y vuelve a iniciar sesión.';

  @override
  String get authBookOrbitPasswordOff =>
      'El inicio de sesión con contraseña está desactivado en este servidor. Inicia sesión con un enlace mágico o con inicio de sesión único.';

  @override
  String get authServerIsBookOrbit =>
      'Este es un servidor BookOrbit. Elige BookOrbit sobre la dirección del servidor.';

  @override
  String get authServerIsAudiobookshelf =>
      'Este es un servidor Audiobookshelf. Elige Audiobookshelf sobre la dirección del servidor.';

  @override
  String get castNotAvailableBookOrbit =>
      'La transmisión no está disponible con servidores BookOrbit';

  @override
  String get loginMagicLink => 'Enlace mágico';

  @override
  String get loginMagicLinkDescription =>
      'Inicia sesión con un enlace mágico de BookOrbit, o pega un enlace de contraseña para establecer tu contraseña.';

  @override
  String get collectionPublicTitle => 'Pública';

  @override
  String get collectionPublicSubtitle =>
      'Todos en este servidor pueden ver esta colección';

  @override
  String loginSignInWithProvider(String provider) {
    return 'Iniciar sesión con $provider';
  }

  @override
  String get loginSignInWithSso => 'Iniciar sesión con SSO';

  @override
  String get loginChooseSsoProvider => 'Elige cómo iniciar sesión';

  @override
  String get loginRedirectUriBookOrbit =>
      'URI de redirección: bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => 'Estado de lectura';

  @override
  String get readStatusHint =>
      'BookOrbit conserva el estado que elijas aquí hasta que lo cambies.';

  @override
  String get readStatusUnread => 'Sin leer';

  @override
  String get readStatusWantToRead => 'Quiero leerlo';

  @override
  String get readStatusReading => 'Leyendo';

  @override
  String get readStatusOnHold => 'En espera';

  @override
  String get readStatusRereading => 'Releyendo';

  @override
  String get readStatusRead => 'Leído';

  @override
  String get readStatusSkimmed => 'Hojeado';

  @override
  String get readStatusAbandoned => 'Abandonado';

  @override
  String get personalNoteTitle => 'Tu nota';

  @override
  String get personalNoteAdd => 'Añadir una nota privada';

  @override
  String get personalNoteHint => 'Solo tú puedes ver esta nota.';

  @override
  String get moreLikeThis => 'Más como este';

  @override
  String get coverSlotAudiobook => 'Portada del audiolibro';

  @override
  String get coverSlotBook => 'Portada del libro';

  @override
  String get cardButtonFill => 'Fondo de los botones';

  @override
  String get cardButtonFillSubtitle =>
      'Cómo se rellenan los botones de la tarjeta del reproductor';

  @override
  String get cardButtonFillClear => 'Transparente';

  @override
  String get cardButtonFillSubtle => 'Sutil';

  @override
  String get cardButtonFillSolid => 'Sólido';

  @override
  String get loginBookOrbitPreview =>
      'La compatibilidad con BookOrbit es nueva. La reproducción, las descargas y la navegación funcionan, pero algunas pantallas aún pueden verse o comportarse como Audiobookshelf. Sigue el progreso en GitHub y avísanos si algo parece raro.';

  @override
  String get signedOutTapToSignIn =>
      'Sesión cerrada. Toca para iniciar sesión de nuevo.';

  @override
  String get authSignedOutKeepListening =>
      'Se cerró tu sesión. Las descargas siguen funcionando. Toca la nube roja para iniciar sesión de nuevo.';

  @override
  String signedOutSyncNote(String username, String server) {
    return 'Lo que escuches con la sesión cerrada se guarda en este teléfono y se sincroniza cuando vuelvas a iniciar sesión como $username en $server. Sirve cualquier forma de iniciar sesión en esa cuenta.';
  }

  @override
  String get comicReadingDirection => 'Dirección de lectura';

  @override
  String comicPageNumber(int page) {
    return 'Página $page';
  }

  @override
  String get comicBookmarkRemoveFailed =>
      'No se pudo eliminar el marcador del servidor. Inténtalo de nuevo cuando tengas conexión.';

  @override
  String get comicLeftToRight => 'De izquierda a derecha';

  @override
  String get comicRightToLeft => 'De derecha a izquierda (manga)';

  @override
  String get comicNeedsConnection =>
      'Este cómic se abre página a página desde tu servidor, así que necesita conexión.';

  @override
  String get comicNoPages => 'No se encontraron páginas en este cómic.';

  @override
  String get boAdminTitle => 'Administración del servidor';

  @override
  String get boAdminSubtitle =>
      'Usuarios y bibliotecas de este servidor BookOrbit';

  @override
  String get boAdminUsers => 'Usuarios';

  @override
  String get boAdminLibraries => 'Bibliotecas';

  @override
  String boAdminUserCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personas',
      one: '1 persona',
    );
    return '$_temp0';
  }

  @override
  String boAdminLibraryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bibliotecas',
      one: '1 biblioteca',
    );
    return '$_temp0';
  }

  @override
  String get boAdminSaved => 'Guardado';

  @override
  String get boAdminFailed => 'No funcionó. Inténtalo de nuevo.';

  @override
  String get boAdminOffline => 'No se pudo acceder al servidor.';

  @override
  String get boUsersSearch => 'Buscar usuarios';

  @override
  String get boUsersNone => 'No hay usuarios aquí';

  @override
  String get boUsersFilterAll => 'Todos';

  @override
  String get boUsersFilterAdmins => 'Administradores';

  @override
  String get boUsersFilterActive => 'Activos';

  @override
  String get boUsersFilterInactive => 'Inactivos';

  @override
  String get boUsersFilterAttention => 'Requieren atención';

  @override
  String get boUserBadgeAdmin => 'Admin';

  @override
  String get boUserBadgeInactive => 'Inactivo';

  @override
  String get boUserBadgeLocked => 'Bloqueado';

  @override
  String get boUserBadgeNoPassword => 'Sin contraseña aún';

  @override
  String boUserLastActive(String date) {
    return 'Última actividad $date';
  }

  @override
  String get boUserNeverSignedIn => 'Nunca ha iniciado sesión';

  @override
  String get boUserNew => 'Nuevo usuario';

  @override
  String get boUserCreate => 'Crear';

  @override
  String get boUserUsername => 'Usuario';

  @override
  String get boUserUsernameHint =>
      'Al menos 3 caracteres. No se puede cambiar después.';

  @override
  String get boUserName => 'Nombre';

  @override
  String get boUserEmail => 'Correo electrónico';

  @override
  String get boUserEmailInvalid => 'Escribe una dirección de correo válida';

  @override
  String get boUserActive => 'Activo';

  @override
  String get boUserActiveSubtitle =>
      'Los usuarios inactivos no pueden iniciar sesión';

  @override
  String get boUserAdmin => 'Administrador';

  @override
  String get boUserAdminSubtitle => 'Acceso total a todo en el servidor';

  @override
  String get boUserAdminHasAll =>
      'Los administradores tienen todos los permisos y ven todas las bibliotecas.';

  @override
  String get boUserPermissions => 'Permisos';

  @override
  String get boUserPresetNone => 'Ninguno';

  @override
  String get boUserPresetStandard => 'Estándar';

  @override
  String get boUserPresetEverything => 'Todo';

  @override
  String get boUserLibraries => 'Bibliotecas';

  @override
  String get boUserLibrariesHint =>
      'Las bibliotecas que esta persona puede ver.';

  @override
  String get boUserPasswordLink => 'Enviar enlace de contraseña';

  @override
  String get boUserPasswordLinkSubtitle =>
      'Un enlace para establecer una nueva contraseña, válido durante 15 minutos';

  @override
  String get boUserExternal =>
      'Inicia sesión mediante inicio de sesión único, así que la contraseña se gestiona allí.';

  @override
  String get boUserUnlock => 'Desbloquear cuenta';

  @override
  String get boUserUnlocked => 'Cuenta desbloqueada';

  @override
  String get boUserDelete => 'Borrar usuario';

  @override
  String boUserDeleteTitle(String name) {
    return '¿Borrar a $name?';
  }

  @override
  String get boUserDeleteBody =>
      'Se eliminan su cuenta y todo lo que tiene en este servidor. No se puede deshacer.';

  @override
  String get boUserDeleted => 'Usuario borrado';

  @override
  String get boUserLinkTitle => 'Enlace de contraseña';

  @override
  String boUserLinkBody(String name) {
    return 'Comparte este enlace con $name. Le permite establecer una contraseña y funciona durante 15 minutos.';
  }

  @override
  String get boPasswordRules =>
      'Al menos 8 caracteres, con una letra mayúscula, una minúscula y un número.';

  @override
  String get boSetPasswordTitle => 'Establece tu contraseña';

  @override
  String get boSetPasswordSubmit => 'Establecer contraseña e iniciar sesión';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return 'Elige una contraseña para $username en $server.';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return 'Elige una contraseña para tu cuenta en $server.';
  }

  @override
  String get boSetPasswordStartingBody =>
      'Esta cuenta aún tiene la contraseña con la que se creó. Elige una nueva para terminar de iniciar sesión.';

  @override
  String get boSetPasswordTrust =>
      'Continúa solo si confías en quien te envió este enlace.';

  @override
  String get boPasswordLinkExpired =>
      'Este enlace ha caducado o ya se usó. Pide uno nuevo al administrador del servidor.';

  @override
  String boPasswordSetSignInFailed(String error) {
    return 'Tu contraseña está establecida, pero falló el inicio de sesión: $error';
  }

  @override
  String get boChangePasswordSubtitle => 'Actualiza tu contraseña de BookOrbit';

  @override
  String get boPasswordChangeEffect =>
      'Al cambiar tu contraseña se cierran tus otras sesiones de BookOrbit. Este dispositivo sigue con la sesión iniciada.';

  @override
  String get boPasswordChanged =>
      'Contraseña cambiada. Se cerró la sesión en los otros dispositivos.';

  @override
  String boPasswordShareDescription(String username) {
    return 'Envía este enlace o haz que $username escanee el código QR para elegir una contraseña e iniciar sesión en Absorb. Funciona durante 15 minutos.';
  }

  @override
  String boPasswordShareWarning(String username) {
    return 'Cualquiera que tenga este enlace puede elegir la contraseña de $username hasta que se use o caduque.';
  }

  @override
  String get setupLinkCopyWebLink => 'Copiar enlace web';

  @override
  String get boUserLinkCopy => 'Copiar enlace';

  @override
  String get boUserLinkCopied => 'Enlace copiado';

  @override
  String get boUserLinkShare => 'Compartir';

  @override
  String get boUserNoLink =>
      'Se añadió al usuario, pero el servidor no envió ningún enlace de contraseña. Envía uno desde su página.';

  @override
  String get boPermGroupLibrary => 'Biblioteca y libros';

  @override
  String get boPermGroupRequests => 'Solicitudes de libros';

  @override
  String get boPermGroupDevices => 'Dispositivos';

  @override
  String get boPermGroupIntegrations => 'Integraciones de lectura';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => 'Correo y notificaciones';

  @override
  String get boPermGroupAdmin => 'Administración';

  @override
  String get boPermLibraryDownload => 'Descargar libros';

  @override
  String get boPermLibraryUpload => 'Subir libros';

  @override
  String get boPermLibraryEditMetadata => 'Editar metadatos';

  @override
  String get boPermLibraryDeleteBooks => 'Borrar libros';

  @override
  String get boPermBookRequestAccess => 'Solicitar libros';

  @override
  String get boPermBookRequestAutoApprove =>
      'Solicitudes aprobadas automáticamente';

  @override
  String get boPermBookRequestSelfFulfill =>
      'Descargar directamente los libros solicitados';

  @override
  String get boPermManageBookRequests => 'Gestionar solicitudes de libros';

  @override
  String get boPermKoboSync => 'Sincronización con Kobo';

  @override
  String get boPermKoreaderSync => 'Sincronización con KOReader';

  @override
  String get boPermOpdsAccess => 'Acceso a OPDS';

  @override
  String get boPermHardcoverSync => 'Sincronización con Hardcover';

  @override
  String get boPermReadwiseSync => 'Sincronización con Readwise';

  @override
  String get boPermStorygraphSync => 'Sincronización con StoryGraph';

  @override
  String get boPermBookDockAccess => 'Usar el Book Dock';

  @override
  String get boPermManageBookDock => 'Gestionar el Book Dock';

  @override
  String get boPermEmailSend => 'Enviar libros por correo';

  @override
  String get boPermNotificationAccess => 'Notificaciones';

  @override
  String get boPermManageEmail => 'Gestionar el correo';

  @override
  String get boPermManageLibraries => 'Gestionar bibliotecas';

  @override
  String get boPermManageMetadataConfig => 'Ajustes de metadatos';

  @override
  String get boPermManageIcons => 'Gestionar iconos';

  @override
  String get boPermManageUsers => 'Gestionar usuarios';

  @override
  String get boPermViewUserActivity => 'Ver la actividad de los usuarios';

  @override
  String get boPermViewAuditLog => 'Ver el registro de auditoría';

  @override
  String get boPermManageAppSettings => 'Ajustes de la app';

  @override
  String get boLibsNone => 'Aún no hay bibliotecas';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => 'Analizar ahora';

  @override
  String get boLibScanStarted => 'Análisis iniciado';

  @override
  String get boLibScanning => 'Analizando';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return 'Analizado $date: $added añadidos, $updated actualizados, $missing faltantes';
  }

  @override
  String get boLibScanFailed => 'El último análisis falló';

  @override
  String get boLibNeverScanned => 'Aún sin analizar';

  @override
  String get boLibNew => 'Nueva biblioteca';

  @override
  String get boLibName => 'Nombre';

  @override
  String get boLibNeedName => 'Ponle un nombre a la biblioteca';

  @override
  String get boLibIcon => 'Icono';

  @override
  String get boLibFolders => 'Carpetas';

  @override
  String get boLibFoldersHint =>
      'Carpetas del servidor donde están los libros de esta biblioteca.';

  @override
  String get boLibNeedFolder => 'Añade al menos una carpeta';

  @override
  String get boLibAddFolder => 'Añadir carpeta';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '1 archivo',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return 'Ya está en $library';
  }

  @override
  String get boLibFolderUnreadable => 'El servidor no puede leer esta carpeta';

  @override
  String get boLibFolderRescan =>
      'Al cambiar las carpetas se vuelve a analizar la biblioteca.';

  @override
  String get boLibOrganization => 'Los libros se guardan como';

  @override
  String get boLibPerFolder => 'Un libro por carpeta';

  @override
  String get boLibPerFile => 'Un libro por archivo';

  @override
  String get boLibOrganizationFixed =>
      'No se puede cambiar después de crear la biblioteca.';

  @override
  String get boLibWatch => 'Vigilar cambios';

  @override
  String get boLibWatchSubtitle =>
      'Detecta archivos nuevos y modificados en cuanto aparecen';

  @override
  String get boLibSchedule => 'Análisis programado';

  @override
  String get boLibScheduleOff => 'Apagado';

  @override
  String get boLibScheduleDaily => 'Diario';

  @override
  String get boLibScheduleWeekly => 'Semanal';

  @override
  String boLibScheduleCustom(String cron) {
    return 'Personalizado ($cron)';
  }

  @override
  String get boLibScheduleHint =>
      'Se ejecuta a las 3:00 a. m., hora del servidor.';

  @override
  String get boLibCovers => 'Forma de la portada';

  @override
  String get boLibCoverBook => 'Libro (2:3)';

  @override
  String get boLibCoverSquare => 'Cuadrada (1:1)';

  @override
  String get boLibAccess => 'Quién puede verla';

  @override
  String get boLibAccessHint =>
      'Los administradores ven todas las bibliotecas. Los demás necesitan acceso aquí.';

  @override
  String get boLibAccessNone => 'Por ahora solo los administradores';

  @override
  String get boLibAccessAdd => 'Añadir persona';

  @override
  String get boLibAccessEveryoneHas => 'Todos ya tienen acceso';

  @override
  String get boLibLevelViewer => 'Lector';

  @override
  String get boLibLevelEditor => 'Editor';

  @override
  String get boLibLevelOwner => 'Propietario';

  @override
  String get boLibAccessRemove => 'Quitar acceso';

  @override
  String get boLibDelete => 'Borrar biblioteca';

  @override
  String boLibDeleteTitle(String name) {
    return '¿Borrar $name?';
  }

  @override
  String get boLibDeleteBody =>
      'La biblioteca se elimina de BookOrbit, junto con el progreso y los resaltados de sus libros. Los archivos del servidor se quedan donde están.';

  @override
  String get boLibDeleted => 'Biblioteca borrada';

  @override
  String get boFolderPickTitle => 'Elige una carpeta';

  @override
  String get boFolderUseThis => 'Usar esta carpeta';

  @override
  String get boFolderEmpty => 'No hay carpetas dentro';

  @override
  String get statsTotalTime => 'TIEMPO TOTAL';

  @override
  String get statsTotalReadingTime => 'TIEMPO TOTAL DE LECTURA';

  @override
  String statsDaysOfTime(String days) {
    return 'Son $days días';
  }

  @override
  String statsHoursOfTime(String hours) {
    return 'Son $hours horas';
  }

  @override
  String get statsMediaAll => 'Todo';

  @override
  String get statsMediaListening => 'Escucha';

  @override
  String get statsMediaReading => 'Lectura';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'BookOrbit cuenta tus días en $server, pero este teléfono está en $phone. El tiempo de última hora del día puede caer en el día equivocado.';
  }

  @override
  String statsZoneUse(String zone) {
    return 'Usar $zone';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'BookOrbit ahora usa $zone. Los días anteriores pueden tardar unos minutos en actualizarse.';
  }

  @override
  String get statsZoneFailed =>
      'No se pudo cambiar la zona horaria en BookOrbit';

  @override
  String get statsTimeOfDay => 'Hora del día';

  @override
  String statsBusiestAround(String time) {
    return 'Más actividad hacia las $time';
  }

  @override
  String get statsFinishedByMonth => 'Libros terminados por mes';

  @override
  String statsFinishedLast12(int count) {
    return '$count en los últimos 12 meses';
  }

  @override
  String get statsWhereTitle => 'Dónde escuchas y lees';

  @override
  String get statsLast12Months => 'Últimos 12 meses';

  @override
  String get statsHabits => 'Hábitos';

  @override
  String get statsTypicalSession => 'Sesión típica';

  @override
  String get statsProgressPerSession => 'Progreso por sesión';

  @override
  String get statsTimeToFinish => 'Tiempo para terminar';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días',
      one: '1 día',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => 'Libros empezados';

  @override
  String get statsBooksInProgress => 'En curso';

  @override
  String get statsAverageProgress => 'Progreso medio';

  @override
  String get statsTopBooks => 'Libros principales';

  @override
  String get statsYearRead => 'Leídos';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sin leer',
      one: '1 sin leer',
      zero: 'Nada nuevo',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => 'Marcar todo como leído';

  @override
  String get boNotificationsClearAll => 'Borrar todo';

  @override
  String get boNotificationsClearTitle => '¿Borrar todas las notificaciones?';

  @override
  String get boNotificationsClearBody =>
      'Esto elimina todas las notificaciones de tu cuenta de BookOrbit.';

  @override
  String get boNotificationsEmpty => 'Aún no hay notificaciones';

  @override
  String get boNotificationsLoadFailed =>
      'No se pudieron cargar las notificaciones';

  @override
  String get boNotificationsUpdateFailed =>
      'No se pudieron actualizar las notificaciones en BookOrbit';

  @override
  String boNotificationsOccurrences(int count) {
    return 'Ocurrió $count veces';
  }

  @override
  String get boNotificationsSettings => 'Ajustes de notificaciones';

  @override
  String get boNotificationsSettingsIntro =>
      'Elige qué notificaciones conserva BookOrbit para ti.';

  @override
  String get boNotificationsProblemsHint =>
      'Problemas solo te avisa cuando algo falla o necesita atención.';

  @override
  String get boNotificationLevelOff => 'Apagado';

  @override
  String get boNotificationLevelProblems => 'Problemas';

  @override
  String get boNotificationLevelAll => 'Todo';

  @override
  String get boNotificationsSaved => 'Ajustes de notificaciones guardados';

  @override
  String get boNotificationsSaveFailed =>
      'No se pudieron guardar los ajustes de notificaciones';

  @override
  String get boNotificationGroupLibrary => 'Biblioteca';

  @override
  String get boNotificationGroupFiles => 'Archivos';

  @override
  String get boNotificationGroupIntegrations => 'Integraciones';

  @override
  String get boNotificationGroupPersonal => 'Personal';

  @override
  String get boNotifyScanning => 'Análisis de bibliotecas';

  @override
  String get boNotifyScanningDesc =>
      'Cuando termina o falla el análisis de una biblioteca, o encuentra libros que faltan.';

  @override
  String get boNotifyMetadata => 'Obtención de metadatos';

  @override
  String get boNotifyMetadataDesc =>
      'Cuando terminan o fallan las búsquedas de metadatos de tus libros.';

  @override
  String get boNotifyAuthorEnrichment => 'Detalles de autores';

  @override
  String get boNotifyAuthorEnrichmentDesc =>
      'Cuando termina la descarga de biografías y fotos de autores.';

  @override
  String get boNotifyFileWriteBack => 'Guardado en archivos';

  @override
  String get boNotifyFileWriteBackDesc =>
      'Cuando los detalles editados se guardan en los archivos de los libros en el disco.';

  @override
  String get boNotifyFileRename => 'Cambio de nombre de archivos';

  @override
  String get boNotifyFileRenameDesc =>
      'Cuando se renombra un archivo de libro para ajustarse a tu patrón de nombres.';

  @override
  String get boNotifyBulkRename => 'Cambio de nombre masivo';

  @override
  String get boNotifyBulkRenameDesc =>
      'Cuando termina o falla el renombrado de muchos libros, o el traslado de libros entre bibliotecas.';

  @override
  String get boNotifyMigration => 'Importaciones';

  @override
  String get boNotifyMigrationDesc =>
      'Cuando termina o falla una importación desde otra app de bibliotecas.';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc =>
      'Cuando Book Dock termina de añadir libros o encuentra problemas.';

  @override
  String get boNotifyBookRequests => 'Solicitudes de libros';

  @override
  String get boNotifyBookRequestsDesc =>
      'Cuando se envía o se resuelve una solicitud de libro, o el libro pasa a estar disponible.';

  @override
  String get boNotifyEmail => 'Entrega de correo';

  @override
  String get boNotifyEmailDesc =>
      'Cuando el envío de un libro por correo funciona o falla.';

  @override
  String get boNotifyAchievements => 'Logros';

  @override
  String get boNotifyAchievementsDesc => 'Cuando desbloqueas un logro nuevo.';

  @override
  String get achievementsTitle => 'Logros';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return '$earned de $total conseguidos';
  }

  @override
  String get achievementsFilterAll => 'Todos';

  @override
  String get achievementsFilterEarned => 'Conseguidos';

  @override
  String get achievementsFilterInProgress => 'En curso';

  @override
  String get achievementsFilterLocked => 'Bloqueados';

  @override
  String get achievementsCategoryReading => 'Lectura';

  @override
  String get achievementsCategoryLibrary => 'Biblioteca';

  @override
  String get achievementsCategoryExploration => 'Exploración';

  @override
  String get achievementsCategoryDedication => 'Dedicación';

  @override
  String get achievementsCategoryDevices => 'Dispositivos';

  @override
  String get achievementsRarityCommon => 'Común';

  @override
  String get achievementsRarityRare => 'Raro';

  @override
  String get achievementsRarityEpic => 'Épico';

  @override
  String get achievementsRarityLegendary => 'Legendario';

  @override
  String get achievementsLoadFailed => 'No se pudieron cargar los logros';

  @override
  String get achievementsNoneMatch => 'Ningún logro coincide con este filtro';

  @override
  String get achievementsSecretName => 'Logro secreto';

  @override
  String get achievementsSecretHint => 'Sigue leyendo para descubrir este.';

  @override
  String achievementsEarnedOn(String date) {
    return 'Conseguido el $date';
  }

  @override
  String achievementsWhileReading(String title) {
    return 'Mientras leías $title';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return 'Nivel $earned de $total';
  }

  @override
  String get achievementsTiers => 'Niveles';

  @override
  String get achievementsAllTiers => 'Todos los niveles conseguidos';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold libros';
  }

  @override
  String achievementsProgressPages(String current, String threshold) {
    return '$current / $threshold páginas';
  }

  @override
  String achievementsProgressHours(String current, String threshold) {
    return '$current / $threshold horas';
  }

  @override
  String achievementsProgressAnnotations(String current, String threshold) {
    return '$current / $threshold resaltados y notas';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold valoraciones';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $threshold géneros';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold idiomas';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold días';
  }

  @override
  String get achievementsHowToGetIt => 'Cómo conseguirlo';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Leíste $count horas en los últimos $days días.',
      one: 'Leíste 1 hora en los últimos $days días.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca de $count días a este ritmo.',
      one: 'Cerca de 1 día a este ritmo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca de $count semanas a este ritmo.',
      one: 'Cerca de 1 semana a este ritmo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca de $count meses a este ritmo.',
      one: 'Cerca de 1 mes a este ritmo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros de los años $decade esperan en tus estantes.',
      one: '1 libro de los años $decade espera en tus estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros del siglo $century esperan en tus estantes.',
      one: '1 libro del siglo $century espera en tus estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return '$title está leído al $percent y se empezó el $date.';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return '$title se empezó el $date.';
  }

  @override
  String get achievementsHintUntitledBook => 'Un libro en curso';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros en curso superan el $percent.',
      one: '1 libro en curso supera el $percent.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros que terminaste aún no tienen valoración.',
      one: '1 libro que terminaste aún no tiene valoración.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count libros de menos de $pages páginas esperan en tus estantes.',
      one: '1 libro de menos de $pages páginas espera en tus estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ya están en curso.',
      one: '1 ya está en curso.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros de $pages páginas o más esperan en tus estantes.',
      one: '1 libro de $pages páginas o más espera en tus estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros publicados antes de $year esperan en tus estantes.',
      one: '1 libro publicado antes de $year espera en tus estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author: $finished terminados, $count más en tus estantes.';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros en $language esperan en tus estantes.',
      one: '1 libro en $language espera en tus estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Has leído en $count meses de $year hasta ahora.',
      one: 'Has leído en 1 mes de $year hasta ahora.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Quedan $months.',
      one: 'Queda $months.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return 'Ningún libro de tus estantes tiene $pages páginas o más todavía.';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return 'Nada en tus estantes se publicó antes de $year.';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tus estantes abarcan solo $count décadas por ahora.',
      one: 'Tus estantes abarcan solo 1 década por ahora.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tus estantes abarcan solo $count siglos por ahora.',
      one: 'Tus estantes abarcan solo 1 siglo por ahora.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return 'No leíste en $month, así que $year queda fuera de alcance. La cuenta empieza de nuevo en enero.';
  }

  @override
  String get achievementsSwitch => 'Logros';

  @override
  String get achievementsSwitchSubtitle =>
      'Sigue los logros en BookOrbit. Al desactivarlos se ocultan aquí y en la web.';

  @override
  String get achievementsTurnedOn => 'Logros activados';

  @override
  String get achievementsTurnedOff => 'Logros desactivados';

  @override
  String get achievementsSwitchFailed =>
      'No se pudieron cambiar los logros en BookOrbit';

  @override
  String get boNotifyReadAlong => 'Leer junto al audio';

  @override
  String get boNotifyReadAlongDesc =>
      'Cuando un «leer junto al audio» que iniciaste está listo, necesita revisión o falla.';

  @override
  String get readAlongCreate => 'Crear «leer junto al audio»';

  @override
  String get readAlongLoadFailed =>
      'No se pudo comprobar si se puede crear un «leer junto al audio» para este libro.';

  @override
  String get readAlongCheckAgain => 'Comprobar de nuevo';

  @override
  String get readAlongWhyWorkerOffline =>
      'El trabajador de «leer junto al audio» de BookOrbit está sin conexión ahora mismo.';

  @override
  String get readAlongWhyWorkerOutdated =>
      'El trabajador de «leer junto al audio» de BookOrbit necesita una actualización para funcionar con este servidor.';

  @override
  String get readAlongWhyFilesMissing =>
      'Restaura los archivos que faltan de este libro para crear un «leer junto al audio».';

  @override
  String get readAlongWhyNoEpub =>
      'Añade un EPUB simple a este libro para crear un «leer junto al audio».';

  @override
  String get readAlongWhyNoEpubHasOne =>
      'Este libro ya tiene un «leer junto al audio» y no tiene un EPUB simple para crear otro.';

  @override
  String get readAlongWhyTooManyTracks =>
      'Este audiolibro tiene más archivos de los que admite un «leer junto al audio».';

  @override
  String get readAlongWhyEpubNotAllowed =>
      'Esta biblioteca no admite archivos EPUB, así que no se puede añadir un «leer junto al audio».';

  @override
  String get readAlongWhyNotMounted =>
      'El trabajador de «leer junto al audio» de BookOrbit no puede acceder a la carpeta de esta biblioteca.';

  @override
  String get readAlongWhyRunning =>
      'Ya se está creando un «leer junto al audio» para este libro.';

  @override
  String get readAlongWhyUnknown =>
      'Ahora mismo no se puede crear un «leer junto al audio» para este libro.';

  @override
  String get readAlongSheetTitle => 'Crear un «leer junto al audio»';

  @override
  String get readAlongSheetIntro =>
      'BookOrbit hace coincidir la narración con el texto del libro electrónico y añade un EPUB que resalta el texto al ritmo del audio.';

  @override
  String get readAlongEbook => 'Libro electrónico';

  @override
  String get readAlongEbookHint =>
      'Elige el EPUB simple que corresponde a la narración.';

  @override
  String get readAlongAudio => 'Audiolibro';

  @override
  String readAlongTracks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pistas',
      one: '1 pista',
    );
    return '$_temp0';
  }

  @override
  String readAlongExistingTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Este libro ya tiene $count «leer junto al audio»',
      one: 'Este libro ya tiene un «leer junto al audio»',
    );
    return '$_temp0';
  }

  @override
  String readAlongReplace(String name) {
    return 'Reemplazar $name';
  }

  @override
  String readAlongKeepBoth(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Conservarlos todos',
      one: 'Conservar ambos',
    );
    return '$_temp0';
  }

  @override
  String get readAlongKeepHint =>
      'El nuevo «leer junto al audio» se añade como otro archivo.';

  @override
  String get readAlongReplaceHint =>
      'El archivo antiguo solo se reemplaza cuando el nuevo supera sus comprobaciones, y los puntos de lectura se conservan.';

  @override
  String get readAlongReplaceNotAllowed =>
      'Reemplazar un «leer junto al audio» requiere permiso para borrar libros, así que el nuevo se añade como otro archivo.';

  @override
  String get readAlongMadeByBookOrbit => 'Creado por BookOrbit';

  @override
  String get readAlongImported => 'Importado';

  @override
  String get readAlongLanguage => 'Idioma de la narración';

  @override
  String get readAlongPickLanguage => 'Elige un idioma';

  @override
  String readAlongLanguageUnsupported(String language) {
    return 'El modelo de voz no conoce el idioma de este libro ($language).';
  }

  @override
  String get readAlongLanguageFromBook => 'Según los detalles de este libro.';

  @override
  String get readAlongLanguageIsDefault => 'Tu idioma predeterminado.';

  @override
  String get readAlongLanguageSaved =>
      'Guardado como tu idioma predeterminado.';

  @override
  String get readAlongSetDefault => 'Usar como predeterminado';

  @override
  String get readAlongDefaultFailed =>
      'No se pudo guardar tu idioma predeterminado.';

  @override
  String get readAlongHighlighting => 'Resaltado';

  @override
  String get readAlongSentence => 'Frase';

  @override
  String get readAlongSentenceHint =>
      'Resalta una frase a la vez. Recomendado.';

  @override
  String get readAlongWord => 'Palabra';

  @override
  String get readAlongWordHint =>
      'Resalta cada palabra. Tarda más y genera un archivo más grande. Aún es experimental.';

  @override
  String readAlongEstimatedSize(String size) {
    return 'Tamaño estimado: $size';
  }

  @override
  String get readAlongBackgroundNote =>
      'Se ejecuta en el servidor, así que puedes cerrar esto. Los audiolibros largos pueden tardar horas, y la primera vez con un idioma se descarga su modelo de voz.';

  @override
  String readAlongLowDisk(String needed, String free) {
    return 'Poco espacio en disco: esto necesita unos $needed de espacio de trabajo en el trabajador, que tiene $free libres.';
  }

  @override
  String get readAlongStart => 'Iniciar';

  @override
  String get readAlongStartFailed =>
      'No se pudo iniciar el «leer junto al audio». Inténtalo de nuevo.';

  @override
  String get readAlongStartInvalid =>
      'Algunos de los archivos elegidos ya no están en este libro. Revísalos e inténtalo de nuevo.';

  @override
  String get readAlongStartOffline =>
      'El trabajador de «leer junto al audio» de BookOrbit está sin conexión. Inténtalo más tarde.';

  @override
  String get readAlongNotAllowed => 'No tienes permiso para hacer eso.';

  @override
  String get readAlongGone =>
      'Este trabajo de «leer junto al audio» ya no existe.';

  @override
  String get readAlongMovedOn =>
      'Este trabajo ya había avanzado. Ahora muestra su estado actual.';

  @override
  String get readAlongActionFailed =>
      'No se pudo completar. Inténtalo de nuevo.';

  @override
  String readAlongStartedBy(String name) {
    return 'Iniciado por $name';
  }

  @override
  String get readAlongStartedByOther => 'Iniciado por otro usuario';

  @override
  String get readAlongWaiting => 'Esperando para empezar';

  @override
  String get readAlongNextInLine => 'El siguiente en la cola';

  @override
  String readAlongJobsAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trabajos por delante',
      one: '1 trabajo por delante',
    );
    return '$_temp0';
  }

  @override
  String get readAlongStopping => 'Deteniendo';

  @override
  String get readAlongStoppingHint =>
      'Termina el paso actual y se detiene. No se añadirá nada a este libro.';

  @override
  String get readAlongStagePreparingAudio => 'Preparando el audio';

  @override
  String get readAlongStageDownloadingModel => 'Descargando el modelo de voz';

  @override
  String get readAlongStageListening => 'Escuchando la narración';

  @override
  String get readAlongStageMarkingUp =>
      'Marcando el texto del libro electrónico';

  @override
  String get readAlongStageAligning =>
      'Haciendo coincidir el texto con la narración';

  @override
  String get readAlongStageChecking => 'Comprobando el resultado';

  @override
  String get readAlongStagePublishing =>
      'Añadiendo el «leer junto al audio» a este libro';

  @override
  String get readAlongStageWorking => 'Trabajando';

  @override
  String readAlongFileOf(int current, int total) {
    return 'Archivo $current de $total';
  }

  @override
  String readAlongTrackOf(int current, int total) {
    return 'Pista $current de $total';
  }

  @override
  String readAlongChapterOf(int current, int total) {
    return 'Capítulo $current de $total';
  }

  @override
  String readAlongStepOf(int current, int total) {
    return 'Paso $current de $total';
  }

  @override
  String get readAlongFirstRun => 'Primera vez con este idioma';

  @override
  String get readAlongJustStarted => 'Recién iniciado';

  @override
  String readAlongRunningFor(String duration) {
    return 'En marcha desde hace $duration';
  }

  @override
  String get readAlongStepAudio => 'Audio';

  @override
  String get readAlongStepSpeech => 'Voz';

  @override
  String get readAlongStepText => 'Texto';

  @override
  String get readAlongStepAlign => 'Alinear';

  @override
  String get readAlongStepCheck => 'Comprobar';

  @override
  String get readAlongStepAdd => 'Añadir';

  @override
  String get readAlongReviewTitle => 'Listo para revisar';

  @override
  String readAlongReviewMatched(String percent) {
    return 'El $percent del texto coincidió con la narración. Revísalo antes de añadirlo al libro.';
  }

  @override
  String get readAlongReviewPlain => 'Revísalo antes de añadirlo al libro.';

  @override
  String get readAlongReviewWeb =>
      'Para dejar capítulos fuera y volver a hacer la coincidencia, abre este libro en BookOrbit en la web.';

  @override
  String readAlongReviewExpires(String date) {
    return 'Se descartará automáticamente el $date si no lo revisas.';
  }

  @override
  String get readAlongAddAnyway => 'Añadirlo de todos modos';

  @override
  String get readAlongDiscard => 'Descartar';

  @override
  String get readAlongDiscardPrompt => '¿Descartar este «leer junto al audio»?';

  @override
  String get readAlongKeepIt => 'Conservarlo';

  @override
  String get readAlongReady => '«Leer junto al audio» listo';

  @override
  String get readAlongReadyWarnings =>
      '«Leer junto al audio» listo, con advertencias';

  @override
  String get readAlongAdded => 'Añadido a este libro como un nuevo EPUB.';

  @override
  String get readAlongReplaced =>
      'Se reemplazó el «leer junto al audio» anterior. Los puntos de lectura se conservan.';

  @override
  String readAlongMatchedSentences(String matched, String total) {
    return '$matched de $total frases coincidieron con la narración';
  }

  @override
  String readAlongAudioUsed(String percent) {
    return '$percent del audio utilizado';
  }

  @override
  String readAlongOutside(String chapters) {
    return 'No están en la narración, así que se quedan sin audio: $chapters.';
  }

  @override
  String readAlongOutsideMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capítulos más',
      one: '1 capítulo más',
    );
    return '$_temp0';
  }

  @override
  String get readAlongWarnUnaligned =>
      'No se pudieron hacer coincidir una o más pistas de audio.';

  @override
  String get readAlongWarnUnmatched =>
      'Una parte notable del texto del libro no coincidió con la narración.';

  @override
  String get readAlongWarnInterpolated =>
      'Algunos tiempos del texto se estimaron entre coincidencias fiables.';

  @override
  String get readAlongWarnDropped =>
      'Parte del texto del libro se dejó fuera del resaltado.';

  @override
  String get readAlongFailed => 'Falló el «leer junto al audio»';

  @override
  String get readAlongCancelled => '«Leer junto al audio» cancelado';

  @override
  String get readAlongDiscarded => '«Leer junto al audio» descartado';

  @override
  String get readAlongNothingAdded => 'No se añadió nada a este libro.';

  @override
  String get readAlongExpired =>
      'No se revisó en 14 días, así que no se añadió nada a este libro.';

  @override
  String readAlongRetryUntil(String date) {
    return 'Reintentar continúa desde el último paso terminado hasta el $date.';
  }

  @override
  String get readAlongStartOver => 'Empezar de nuevo';

  @override
  String get readAlongCancel => 'Cancelar «leer junto al audio»';

  @override
  String get readAlongCancelPrompt => '¿Cancelar este «leer junto al audio»?';

  @override
  String get readAlongKeepRunning => 'Seguir en marcha';

  @override
  String get readAlongErrorWorkerOffline =>
      'BookOrbit no pudo conectar con su trabajador de «leer junto al audio».';

  @override
  String get readAlongErrorWorkerCrashed =>
      'El trabajador de «leer junto al audio» se detuvo de forma inesperada.';

  @override
  String get readAlongErrorSourceMissing => 'Un archivo elegido ya no está.';

  @override
  String get readAlongErrorSourceChanged =>
      'Un archivo elegido cambió después de iniciar el trabajo.';

  @override
  String get readAlongErrorInvalidSource =>
      'No se pudo leer el EPUB o el audiolibro.';

  @override
  String get readAlongErrorLanguage =>
      'El modelo de voz no conoce el idioma elegido.';

  @override
  String get readAlongErrorStorage =>
      'No hay suficiente espacio libre en disco en el trabajador para terminar.';

  @override
  String get readAlongErrorAudio => 'No se pudo preparar el audiolibro.';

  @override
  String get readAlongErrorModel => 'No se pudo descargar el modelo de voz.';

  @override
  String get readAlongErrorListening =>
      'Falló el reconocimiento de voz al escuchar la narración.';

  @override
  String get readAlongErrorMarkup =>
      'No se pudo preparar el texto del libro electrónico para la coincidencia.';

  @override
  String get readAlongErrorAlignment =>
      'No se pudo hacer coincidir el texto con la narración.';

  @override
  String get readAlongErrorOutput =>
      'El nuevo EPUB no superó las comprobaciones.';

  @override
  String get readAlongErrorPublish =>
      'No se pudo añadir el nuevo EPUB a este libro.';

  @override
  String get readAlongErrorDiscarded => 'Se descartó durante la revisión.';

  @override
  String get readAlongErrorCancelled => 'Se canceló.';

  @override
  String get readAlongErrorUnknown =>
      'Algo salió mal al crear el «leer junto al audio».';

  @override
  String get fileInfoNoAudiobook => 'Aún no hay audiolibro';

  @override
  String get fileInfoNoEbook => 'Aún no hay libro electrónico';

  @override
  String get fileInfoRequestedBySomeone => 'Solicitado por otra persona';

  @override
  String get fileInfoOwnedSeparately => 'En tu biblioteca como libro aparte';

  @override
  String get fileInfoCopyPath => 'Copiar ruta';

  @override
  String get fileInfoDeleteTitle => '¿Borrar el archivo?';

  @override
  String fileInfoDeletePrompt(String name) {
    return '\"$name\" se borrará del servidor. Esta acción no se puede deshacer.';
  }

  @override
  String get fileInfoDeleteLast =>
      'Es el último archivo de audio o de libro electrónico del libro, así que el libro aparecerá como faltante.';

  @override
  String get fileInfoDeleteNotAllowed =>
      'No tienes permiso para borrar archivos';

  @override
  String get chapterSourceEmbedded => 'Leídos de los archivos de audio';

  @override
  String get chapterSourceTracks =>
      'Un capítulo por archivo de audio, sin guardar';

  @override
  String get chapterSourceProvider => 'De los metadatos obtenidos';

  @override
  String get chapterSourceMigration => 'Importados de Audiobookshelf';

  @override
  String get chapterSourceManual => 'Editados en BookOrbit';

  @override
  String chapterSourceManualBy(String name) {
    return 'Editados por $name';
  }

  @override
  String get chapterSourceNone => 'Aún no hay capítulos';

  @override
  String get chapterProtected => 'Protegidos de los reescaneos';

  @override
  String get chapterNotProtected => 'Un reescaneo puede reemplazarlos';

  @override
  String get chapterProtectOnSave => 'Proteger de los reescaneos';

  @override
  String get chapterGetFrom => 'Obtener capítulos de';

  @override
  String get chapterFromFiles => 'Los archivos de audio';

  @override
  String get chapterFromEbookToc => 'El índice del libro electrónico';

  @override
  String get chapterFromReadAlong => 'El «leer junto al audio»';

  @override
  String get chapterFromHistory => 'Versiones anteriores';

  @override
  String get chapterHistoryTitle => 'Versiones anteriores';

  @override
  String get chapterHistoryEmpty => 'Las versiones guardadas aparecen aquí.';

  @override
  String chapterHistoryBy(String source, String name) {
    return '$source por $name';
  }

  @override
  String get chapterReadingFiles => 'Leyendo los archivos de audio...';

  @override
  String get chapterRevertToFiles => 'Volver a los archivos';

  @override
  String get chapterRevertTitle => '¿Volver a los capítulos de los archivos?';

  @override
  String get chapterRevertMessage =>
      'BookOrbit vuelve a leer los capítulos de los archivos de audio y deja de protegerlos de los reescaneos. Se pierden los cambios sin guardar. La lista actual se conserva en las versiones anteriores.';

  @override
  String get chapterReverted =>
      'Capítulos restablecidos a los de los archivos de audio';

  @override
  String get chapterWriteFiles => 'Escribir en los archivos';

  @override
  String get chapterWriteTitle =>
      '¿Escribir los capítulos en los archivos de audio?';

  @override
  String chapterWriteMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Esto reescribe los $count archivos de audio del libro con estos capítulos.',
      one: 'Esto reescribe el archivo de audio del libro con estos capítulos.',
    );
    return '$_temp0 El audio en sí se copia sin cambios. Los teléfonos que ya descargaron el libro conservan su copia hasta que se vuelva a descargar.';
  }

  @override
  String get chapterWriteConfirm => 'Escribir';

  @override
  String get chapterWriting =>
      'Escribiendo los capítulos en los archivos de audio...';

  @override
  String chapterWritten(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Capítulos escritos en los $count archivos de audio',
      one: 'Capítulos escritos en el archivo de audio',
    );
    return '$_temp0';
  }

  @override
  String chapterWrittenPartly(int written, int total) {
    return 'Capítulos escritos en $written de $total archivos. El resto se dejó como estaba.';
  }

  @override
  String get chapterStaleTitle => 'Estos capítulos cambiaron';

  @override
  String get chapterStaleMessage =>
      'Otra persona guardó estos capítulos después de que los abrieras. Recarga para ver su versión. Tus cambios se mantienen hasta entonces.';

  @override
  String get chapterReload => 'Recargar';

  @override
  String get chapterKeepEditing => 'Seguir editando';

  @override
  String get matchExplicitYes => 'Marcado como explícito';

  @override
  String get matchExplicitNo => 'No explícito';

  @override
  String get matchAbridgedYes => 'Abreviado';

  @override
  String get matchAbridgedNo => 'Íntegro';

  @override
  String boQuickMatchBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'estos $count libros',
      one: 'este libro',
    );
    return 'BookOrbit busca $_temp0 y completa lo que encuentre, según sus ajustes de metadatos.';
  }

  @override
  String get boQuickMatchIgnoreCache => 'Consultar de nuevo todas las fuentes';

  @override
  String get boQuickMatchIgnoreCacheHint =>
      'Omite las respuestas guardadas. Es más lento y usa más del límite de solicitudes de cada fuente.';

  @override
  String boAdminServerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count servidores de correo',
      one: '1 servidor de correo',
      zero: 'Ninguno aún',
    );
    return '$_temp0';
  }

  @override
  String get boEmailTitle => 'Enviar por correo';

  @override
  String get boEmailSubtitle =>
      'Dispositivos, servidores de correo y plantillas para enviar libros';

  @override
  String get boEmailTabDevices => 'Dispositivos';

  @override
  String get boEmailTabServers => 'Servidores de correo';

  @override
  String get boEmailTabTemplates => 'Plantillas';

  @override
  String get boEmailTabHistory => 'Historial';

  @override
  String get boEmailName => 'Nombre';

  @override
  String boEmailDeleteTitle(String name) {
    return '¿Borrar $name?';
  }

  @override
  String get boEmailMakeDefault => 'Predeterminar';

  @override
  String get boEmailBadgeDefault => 'Predeterminado';

  @override
  String get boEmailBadgeShared => 'Compartido';

  @override
  String get boEmailBadgeSystem => 'Restablecer contraseñas';

  @override
  String get boEmailBadgeBuiltIn => 'Integrada';

  @override
  String get boEmailDevicesEmpty =>
      'Aún no hay dispositivos. Añade el correo de tu lector electrónico para enviarle libros.';

  @override
  String get boEmailAddDevice => 'Añadir dispositivo';

  @override
  String get boEmailNewDevice => 'Nuevo dispositivo';

  @override
  String get boEmailDeviceNameHint => 'Mi Kindle';

  @override
  String get boEmailDeviceAddress => 'Correo electrónico';

  @override
  String get boEmailDeviceType => 'Dispositivo';

  @override
  String get boEmailDeviceNone => 'Persona o buzón';

  @override
  String get boEmailDeviceKindle => 'Kindle';

  @override
  String get boEmailDeviceKobo => 'Kobo';

  @override
  String get boEmailDeviceOther => 'Otro lector electrónico';

  @override
  String get boEmailKindleHint =>
      'Kindle recibe el asunto \"convert\" y solo acepta EPUB y PDF por correo.';

  @override
  String boEmailKindleApprove(String address) {
    return 'Kindle descarta el correo de direcciones que no conoce. En los ajustes de documentos personales de Amazon, añade $address a la lista de aprobados.';
  }

  @override
  String get boEmailKindleApproveNoServer =>
      'Primero añade un servidor de correo para ver la dirección que Kindle debe aprobar.';

  @override
  String get boEmailFormat => 'Formato';

  @override
  String get boEmailFormatPrimary => 'Archivo principal del libro';

  @override
  String get boEmailFormatHint =>
      'Un libro sin este formato recibe su archivo principal.';

  @override
  String get boEmailReadAlong => 'Libros con «leer junto al audio»';

  @override
  String get boEmailReadAlongAuto => 'Automático';

  @override
  String get boEmailReadAlongAutoHint =>
      'Solo texto cuando se puede hacer una copia; si no, el original.';

  @override
  String get boEmailReadAlongText => 'Solo texto';

  @override
  String get boEmailReadAlongTextHint =>
      'Sin narración. Lo bastante pequeño para el correo.';

  @override
  String get boEmailReadAlongOriginal => 'Con narración';

  @override
  String get boEmailReadAlongOriginalHint =>
      'Conserva la narración. A menudo pesa 100 MB o más, por encima del límite de la mayoría de los servidores de correo.';

  @override
  String get boEmailTemplate => 'Plantilla';

  @override
  String get boEmailTemplateYourDefault => 'Tu predeterminada';

  @override
  String get boEmailTemplateKindleHint =>
      'Kindle nunca muestra el mensaje, así que omite la plantilla.';

  @override
  String get boEmailDefaultDevice => 'Dispositivo predeterminado';

  @override
  String get boEmailDefaultDeviceHint => 'Se elige primero al enviar un libro.';

  @override
  String get boEmailSendTest => 'Enviar un correo de prueba';

  @override
  String get boEmailTestSubject => 'Correo de prueba de Absorb';

  @override
  String boEmailTestBody(String name) {
    return 'Esto es una prueba de Absorb. Si puedes leerlo, los libros enviados a $name también llegarán aquí.';
  }

  @override
  String boEmailTestSent(String name) {
    return 'Correo de prueba enviado a $name';
  }

  @override
  String boEmailTestFailed(String error) {
    return 'No se envió el correo de prueba: $error';
  }

  @override
  String get boEmailDeleteDevice => 'Borrar dispositivo';

  @override
  String get boEmailDeleteDeviceBody => 'Su historial de envíos se conserva.';

  @override
  String get boEmailDeviceRequired =>
      'Introduce un nombre y un correo electrónico';

  @override
  String get boEmailLastSendFailed => 'Falló el último envío';

  @override
  String get boEmailGroups => 'Grupos';

  @override
  String get boEmailGroupsHint => 'Envía a varios dispositivos a la vez.';

  @override
  String get boEmailNewGroup => 'Nuevo grupo';

  @override
  String get boEmailGroupNameHint => 'Club de lectura';

  @override
  String get boEmailGroupMembers => 'Dispositivos de este grupo';

  @override
  String get boEmailGroupMembersEmpty => 'Primero añade un dispositivo.';

  @override
  String boEmailGroupMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dispositivos',
      one: '1 dispositivo',
      zero: 'Sin dispositivos',
    );
    return '$_temp0';
  }

  @override
  String get boEmailDeleteGroup => 'Borrar grupo';

  @override
  String get boEmailDeleteGroupBody =>
      'Los dispositivos que contiene se conservan.';

  @override
  String get boEmailGroupRequired => 'Introduce un nombre de grupo';

  @override
  String get boEmailServersEmptyManage =>
      'Aún no hay servidores de correo. Añade uno para empezar a enviar libros.';

  @override
  String get boEmailServersEmpty =>
      'Aún no hay servidores de correo. Pide a un administrador que añada uno.';

  @override
  String get boEmailAddServer => 'Añadir servidor de correo';

  @override
  String get boEmailNewServer => 'Nuevo servidor de correo';

  @override
  String get boEmailServerPresetOther => 'Otro';

  @override
  String get boEmailServerPresetHint =>
      'Un preajuste rellena el host, el puerto y la seguridad. Aún puedes cambiarlos.';

  @override
  String get boEmailServerHost => 'Host';

  @override
  String get boEmailServerPort => 'Puerto';

  @override
  String get boEmailServerSecurity => 'Seguridad';

  @override
  String get boEmailServerSecurityNone => 'Ninguna';

  @override
  String get boEmailServerSecurityHint =>
      'STARTTLS en el puerto 587, SSL/TLS en el 465.';

  @override
  String get boEmailServerNeedsPassword => 'Inicia sesión con contraseña';

  @override
  String get boEmailServerUsername => 'Usuario';

  @override
  String get boEmailServerPassword => 'Contraseña';

  @override
  String get boEmailServerAppPassword => 'Contraseña de aplicación';

  @override
  String get boEmailServerPasswordKeep => 'Guardada. Escribe para reemplazarla';

  @override
  String get boEmailServerAppPasswordHint =>
      'Gmail e iCloud necesitan una contraseña de aplicación, no la de tu cuenta.';

  @override
  String get boEmailServerFromName => 'Nombre del remitente';

  @override
  String get boEmailServerFromAddress => 'Dirección del remitente';

  @override
  String get boEmailServerFromAddressHint =>
      'Quienes usan Kindle deben aprobar esta dirección.';

  @override
  String get boEmailServerShare => 'Compartir con todos';

  @override
  String get boEmailServerShareHint =>
      'Otras personas pueden enviar libros con este servidor sin ver la contraseña.';

  @override
  String get boEmailServerSystem =>
      'Enviar restablecimientos de contraseña y enlaces de inicio de sesión';

  @override
  String get boEmailServerSystemHint =>
      'El servidor que BookOrbit usa para su propio correo.';

  @override
  String get boEmailServerVerifyTls => 'Comprobar el certificado del servidor';

  @override
  String get boEmailServerVerifyTlsHint =>
      'Desactívalo solo para un servidor de tu propia red con un certificado autofirmado.';

  @override
  String get boEmailServerTest => 'Probar conexión';

  @override
  String get boEmailServerTestSaveFirst => 'Guarda primero y luego prueba';

  @override
  String get boEmailServerTestOk => 'Conectado';

  @override
  String boEmailServerTestFailed(String error) {
    return 'No se puede conectar: $error';
  }

  @override
  String get boEmailServerDelete => 'Borrar servidor de correo';

  @override
  String get boEmailServerDeleteBody =>
      'Todos con quienes se comparte lo perderán.';

  @override
  String get boEmailServerSystemFirst =>
      'Desactiva los restablecimientos de contraseña en este servidor antes de borrarlo.';

  @override
  String get boEmailServerRequired => 'Introduce un nombre y un host';

  @override
  String get boEmailServerNotYours =>
      'Otra persona añadió este servidor. Solo ella puede cambiarlo.';

  @override
  String get boEmailTemplatesEmpty => 'Aún no hay plantillas.';

  @override
  String get boEmailNewTemplate => 'Nueva plantilla';

  @override
  String get boEmailTemplateSubject => 'Asunto';

  @override
  String get boEmailTemplateMessage => 'Mensaje';

  @override
  String get boEmailTemplateInsert => 'Insertar';

  @override
  String get boEmailTemplateInsertHint =>
      'Se inserta donde está el cursor. Los datos que un libro no tiene no imprimen nada.';

  @override
  String get boEmailVarBook => 'Libro';

  @override
  String get boEmailVarFile => 'Archivo';

  @override
  String get boEmailVarOther => 'Otro';

  @override
  String get boEmailTemplatePreview => 'Vista previa';

  @override
  String get boEmailTemplatePreviewNone =>
      'Envía un libro una vez para previsualizar una plantilla con él.';

  @override
  String boEmailTemplateAttached(String name) {
    return 'Adjunto: $name';
  }

  @override
  String get boEmailTemplateBuiltIn =>
      'Integrada. Solo un administrador puede cambiarla.';

  @override
  String get boEmailTemplateKindleNote =>
      'Kindle nunca muestra una plantilla. Siempre recibe el asunto \"convert\".';

  @override
  String get boEmailTemplateDelete => 'Borrar plantilla';

  @override
  String get boEmailTemplateDeleteBody =>
      'Los dispositivos que la usan vuelven a tu plantilla predeterminada.';

  @override
  String get boEmailTemplateRequired => 'Introduce un nombre y un asunto';

  @override
  String get boEmailHistoryEmpty => 'Aún no se ha enviado nada.';

  @override
  String get boEmailHistoryAll => 'Todos';

  @override
  String get boEmailHistoryEveryone => 'Todo el mundo';

  @override
  String get boEmailStatusSent => 'Enviado';

  @override
  String get boEmailStatusSending => 'Enviando';

  @override
  String boEmailStatusRetrying(int attempt) {
    return 'Reintentando ($attempt)';
  }

  @override
  String get boEmailStatusFailed => 'Fallido';

  @override
  String boEmailTo(String name) {
    return 'A $name';
  }

  @override
  String get boEmailResend => 'Enviar de nuevo';

  @override
  String get boEmailResent => 'Enviando de nuevo';

  @override
  String get boEmailForget => 'Quitar del historial';

  @override
  String get boEmailLoadMore => 'Cargar más';

  @override
  String get boEmailUnknownBook => 'Libro borrado';

  @override
  String get boEmailSendNoServer =>
      'Aún no hay ningún servidor de correo configurado en este servidor.';

  @override
  String get boEmailSendAskAdmin => 'Pide a un administrador que añada uno.';

  @override
  String get boEmailSendNoDevices =>
      'Añade un dispositivo al que enviar este libro.';

  @override
  String get boEmailSendOptions => 'Opciones';

  @override
  String get boEmailSendFormatEach => 'El propio de cada dispositivo';

  @override
  String get boEmailSendServer => 'Servidor de correo';

  @override
  String get boEmailSendButton => 'Enviar';

  @override
  String boEmailSendGets(String format, String size) {
    return 'Recibe $format · $size';
  }

  @override
  String boEmailSendMissing(String format, String got) {
    return 'Sin $format, recibe $got';
  }

  @override
  String boEmailSendKindleRejects(String format) {
    return 'Kindle no acepta $format por correo';
  }

  @override
  String boEmailSendOverKindle(String size) {
    return '$size, por encima del límite de 50 MB de Kindle';
  }

  @override
  String boEmailSendOverGmail(String size) {
    return '$size, por encima del límite de 25 MB de Gmail';
  }

  @override
  String boEmailSendNarrated(String size) {
    return 'Recibe la copia con narración · $size';
  }

  @override
  String boEmailSendHanding(String server) {
    return 'Enviando mediante $server';
  }

  @override
  String boEmailSendAccepted(String server) {
    return 'Enviado mediante $server';
  }

  @override
  String boEmailSendFailedLine(String error) {
    return 'No se envió: $error';
  }

  @override
  String get boEmailSendStillGoing =>
      'Aún se está enviando. Recibirás una notificación cuando termine.';

  @override
  String get boEmailKindleOriginal =>
      'Un Kindle no puede recibir la copia con narración. Ajústalo a solo texto.';

  @override
  String get boEmailNoCopy => 'No se pudo crear una copia sin la narración.';

  @override
  String get recentSearchesTitle => 'Búsquedas recientes';

  @override
  String get recentSearchesClear => 'Borrar';

  @override
  String get recentSearchesRemove => 'Eliminar';

  @override
  String get removedSeriesTapToUndo =>
      'Quitado de Continuar serie. Toca para deshacer.';

  @override
  String get seriesBackOnContinueSeries => 'De nuevo en Continuar serie';

  @override
  String get desktopShortcutPlayPause => 'Reproducir / pausar';

  @override
  String get desktopShortcutRewind => 'Retroceder';

  @override
  String get desktopShortcutForward => 'Avanzar';

  @override
  String get desktopShortcutSlower => 'Reducir la velocidad de reproducción';

  @override
  String get desktopShortcutFaster => 'Aumentar la velocidad de reproducción';

  @override
  String get desktopShortcutNormalSpeed =>
      'Restablecer la velocidad de reproducción';

  @override
  String get desktopShortcutSearch => 'Abrir la búsqueda';

  @override
  String get desktopShortcutLibrary => 'Abrir la biblioteca';

  @override
  String get desktopShortcutNowPlaying => 'Abrir la reproducción actual';

  @override
  String get desktopShortcutFullScreen => 'Pantalla completa';

  @override
  String get desktopShortcutClosePlayer =>
      'Cerrar el reproductor a pantalla completa';

  @override
  String get desktopShortcutBack => 'Volver (cierra la página u hoja superior)';

  @override
  String get desktopShortcutRefresh => 'Actualizar la lista en pantalla';

  @override
  String get desktopShortcutPreviousCard => 'Tarjeta anterior de Absorbing';

  @override
  String get desktopShortcutNextCard => 'Tarjeta siguiente de Absorbing';

  @override
  String get desktopShortcutContextMenu => 'Abrir el menú de pulsación larga';

  @override
  String get desktopShortcutMouseBack => 'Botón Atrás del ratón';

  @override
  String get desktopShortcutRightClick => 'Clic derecho';

  @override
  String get desktopShortcutDragShelves =>
      'Arrastrar estantes y tarjetas hacia los lados';

  @override
  String get desktopShortcutMouseDrag => 'Hacer clic y arrastrar';

  @override
  String get fileHealthAction => 'Revisar archivos';

  @override
  String get fileHealthTitle => 'Revisar archivos';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Los $count archivos parecen estar bien',
      one: 'El archivo parece estar bien',
      zero: 'No se ve nada raro',
    );
    return '$_temp0';
  }

  @override
  String fileHealthProblems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count problemas encontrados',
      one: '1 problema encontrado',
    );
    return '$_temp0';
  }

  @override
  String get fileHealthReadOnlyNote =>
      'Esto solo lee lo que el servidor ya informa. No se cambia nada.';

  @override
  String get fileHealthLocalChecked =>
      'También se revisaron los archivos descargados en este dispositivo.';

  @override
  String get fileHealthItemMissing => 'Falta la carpeta del libro';

  @override
  String get fileHealthItemMissingInfo =>
      'El servidor ya no encuentra la carpeta de este libro. Puede que se haya movido, renombrado o borrado, o que su unidad esté sin conexión. Un escaneo de la biblioteca en el servidor puede volver a encontrarla.';

  @override
  String get fileHealthItemInvalid => 'Libro marcado como no válido';

  @override
  String get fileHealthItemInvalidInfo =>
      'El servidor no encontró archivos de audio ni de libro electrónico utilizables para este libro.';

  @override
  String get fileHealthInvalidFiles => 'Archivos ilegibles';

  @override
  String get fileHealthInvalidFilesInfo =>
      'El servidor no pudo leer estos archivos. Pueden estar dañados o tener un formato no compatible, y la reproducción puede detenerse u omitirlos.';

  @override
  String get fileHealthEmptyFiles => 'Archivos sin duración';

  @override
  String get fileHealthEmptyFilesInfo =>
      'Estos archivos indican una duración de cero, así que no hay nada que reproducir en ellos. A menudo están vacíos o cortados.';

  @override
  String get fileHealthTrackGaps => 'Huecos entre archivos';

  @override
  String get fileHealthTrackGapsInfo =>
      'La línea de tiempo del libro salta hacia delante entre estos archivos y deja un tramo en el que no suena nada.';

  @override
  String get fileHealthTrackOverlaps => 'Archivos solapados';

  @override
  String get fileHealthTrackOverlapsInfo =>
      'Estos archivos se solapan en la línea de tiempo del libro, así que parte de uno puede omitirse o la posición puede saltar.';

  @override
  String get fileHealthDurationMismatch => 'La duración no cuadra';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return 'Los archivos suman $actual, pero el libro indica que dura $expected. El progreso y los capítulos pueden estar desajustados. Un nuevo escaneo en el servidor suele solucionarlo.';
  }

  @override
  String get fileHealthLowBitrate => 'Audio de baja calidad';

  @override
  String get fileHealthLowBitrateInfo =>
      'Estos archivos están codificados por debajo de 32 kbps y pueden sonar apagados.';

  @override
  String get fileHealthMixedSampleRates => 'Frecuencias de muestreo distintas';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      'Los archivos se grabaron con frecuencias de muestreo distintas. La mayoría de los reproductores lo toleran, pero algunos pueden producir chasquidos o cambiar la velocidad donde termina un archivo y empieza el siguiente.';

  @override
  String get fileHealthMixedChannels => 'Mono y estéreo mezclados';

  @override
  String get fileHealthMixedChannelsInfo =>
      'Algunos archivos tienen un número de canales distinto al de otros, así que el sonido puede cambiar entre archivos.';

  @override
  String get fileHealthChaptersPastEnd => 'Capítulos más allá del final';

  @override
  String get fileHealthChaptersPastEndInfo =>
      'Estos capítulos empiezan o terminan después de que acabe el audio, así que saltar a ellos puede no llevar a ninguna parte.';

  @override
  String get fileHealthLocalMissing => 'Faltan archivos descargados';

  @override
  String get fileHealthLocalMissingInfo =>
      'Estos archivos descargados ya no están en este dispositivo. La reproducción sin conexión fallará donde deberían estar.';

  @override
  String get fileHealthLocalSizeMismatch => 'Archivos descargados distintos';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      'Estos archivos descargados no tienen el mismo tamaño que las copias del servidor, así que pueden estar incompletos o dañados.';

  @override
  String fileHealthStartsAt(String time) {
    return 'empieza en $time';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return '$local aquí, $server en el servidor';
  }

  @override
  String fileHealthSampleRate(String value) {
    return '$value kHz';
  }

  @override
  String get fileHealthMono => 'Mono';

  @override
  String get fileHealthStereo => 'Estéreo';

  @override
  String get fileHealthRedownload => 'Volver a descargar este libro';

  @override
  String get fileHealthRedownloadQuestion => '¿Volver a descargar este libro?';

  @override
  String get fileHealthRedownloadInfo =>
      'La copia de este dispositivo se elimina y se descarga de nuevo desde el servidor. Si el libro se está reproduciendo, se detiene. No cambia nada en el servidor.';

  @override
  String get fileHealthNotAvailableOffline =>
      'Conéctate a tu servidor para volver a descargar';

  @override
  String get playerReconnecting => 'Conexión perdida, reconectando…';

  @override
  String get playerReconnectFailed =>
      'No se pudo reconectar con el servidor, así que se detuvo la reproducción.';

  @override
  String get downloadsFailed => 'Descargas fallidas';

  @override
  String get absorbingReorderQueue => 'Reordenar la cola';

  @override
  String get playAction => 'Reproducir';

  @override
  String get pauseAction => 'Pausar';

  @override
  String get rmabImportBooks => 'Importar libros';

  @override
  String get rmabImportBooksSubtitle =>
      'Busca en ReadMeABook y elige libros para solicitar';

  @override
  String get rmabImportBooksConnectSubtitle =>
      'Primero conecta ReadMeABook con una URL y un token';

  @override
  String get windowsSettingsTitle => 'Ajustes de Windows';

  @override
  String get updateCheckFrequency =>
      'Comprobación automática de actualizaciones';

  @override
  String get updateCheckFrequencySubtitle =>
      'Solo busca actualizaciones; la instalación siempre es manual.';

  @override
  String get updateCheckOnStartup => 'Al iniciar (una vez cada 12 horas)';

  @override
  String get updateCheckEverySixHours => 'Cada 6 horas';

  @override
  String get updateCheckEveryTwelveHours => 'Cada 12 horas';

  @override
  String get updateCheckDaily => 'Diariamente';

  @override
  String get updateCheckNever => 'Nunca automáticamente';

  @override
  String onLatestVersionDetail(String version) {
    return 'Tienes la última versión ($version)';
  }

  @override
  String get updateCheckFailed =>
      'No se pudo acceder a GitHub para buscar actualizaciones. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get playlistDetailAddBooks =>
      'Añadir libros a la lista de reproducción';

  @override
  String get playlistDetailSwitchToList => 'Cambiar a vista de lista';

  @override
  String get playlistDetailSwitchToGrid => 'Cambiar a vista de cuadrícula';

  @override
  String get adminUploadIndexing =>
      'Subida completa; esperando a que Audiobookshelf lo indexe...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return '\"$title\" subido; Audiobookshelf aún lo está indexando';
  }

  @override
  String get adminUploadPermissionDenied =>
      'Tu cuenta de Audiobookshelf no tiene permiso para subir. Pide a un administrador del servidor que active el acceso de subida para tu cuenta.';

  @override
  String get uiThemeLabel => 'Tema de la interfaz';

  @override
  String get uiThemePickerTitle => 'Elige un aspecto';

  @override
  String get uiThemePickerIntro =>
      'Puedes cambiarlo cuando quieras en Ajustes > Apariencia > Tema de la interfaz.';

  @override
  String get uiThemePlusName => 'Estándar';

  @override
  String get uiThemePlusDescription =>
      'El aspecto habitual de Absorb Plus, con paneles rellenos y un suave resplandor con los colores de tu portada.';

  @override
  String get uiThemeMidnightName => 'Medianoche';

  @override
  String get uiThemeMidnightDescription =>
      'Negro puro con contornos finos y sin resplandor, pensado para pantallas OLED.';

  @override
  String get uiThemeContinue => 'Continuar';

  @override
  String get uiThemeFrostedName => 'Escarchado';

  @override
  String get uiThemeFrostedDescription =>
      'Paneles suaves de cristal esmerilado con los colores de tu portada brillando a través.';

  @override
  String get uiThemeColorTitle => 'Elige un color';

  @override
  String get uiThemeColorIntro =>
      'Es el mismo ajuste que Ajustes > Apariencia > Origen del color.';

  @override
  String get uiThemeColorFromCover => 'De la portada';

  @override
  String get uiThemeBack => 'Atrás';

  @override
  String get uiThemeTryIt => 'Probar';

  @override
  String uiThemePreviewing(String name) {
    return 'Vista previa de $name';
  }

  @override
  String get uiThemeKeep => 'Conservar';

  @override
  String get uiThemeGoBack => 'Volver';

  @override
  String get uiThemeGlass => 'Cristal';

  @override
  String get uiThemeGlassLight => 'Ligero';

  @override
  String get uiThemeGlassMedium => 'Medio';

  @override
  String get uiThemeGlassStrong => 'Fuerte';

  @override
  String get uiThemeDetails => 'Detalles del aspecto';

  @override
  String get uiThemeFullCovers => 'Portadas en calidad completa';

  @override
  String get uiThemeFullCoversSubtitle =>
      'Portadas más nítidas que usan más memoria';

  @override
  String get uiThemeExtraBadges => 'Insignias extra en las portadas';

  @override
  String get uiThemeExtraBadgesSubtitle =>
      'Insignia de libro electrónico y la franja de guardado en Continuar escuchando';

  @override
  String get uiThemeReadingShelf => 'Continuar leyendo como estante';

  @override
  String get uiThemeReadingShelfSubtitle =>
      'Un estante normal de Inicio en lugar de tarjetas grandes';

  @override
  String get uiThemeCompactHeader => 'Botones compactos en la cabecera';

  @override
  String get uiThemeCompactHeaderSubtitle =>
      'Los botones de la cabecera de página mantienen su tamaño pequeño';

  @override
  String get uiThemePlainWording => 'Redacción sencilla';

  @override
  String get uiThemePlainWordingOnSubtitle =>
      'Usando \"Reproducir\", \"Reproduciendo\", \"Terminado\"';

  @override
  String get uiThemePlainWordingOffSubtitle =>
      'Usando \"Absorb\", \"Absorbing\", \"Fully Absorbed\"';

  @override
  String get uiThemeSearchClassic => 'Clásico';

  @override
  String whatsNewSheetTitle(String name) {
    return 'Novedades de $name';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return 'Actualizado desde $name';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return 'compilación $number';
  }

  @override
  String get whatsNewFullNotes => 'Notas completas en GitHub';

  @override
  String get whatsNewLoading => 'Cargando las novedades';

  @override
  String get whatsNewLoadFailed => 'No se pudieron cargar las notas';

  @override
  String get whatsNewLoadFailedHint => 'Revisa tu conexión o léelas en GitHub.';

  @override
  String get whatsNewOpenGitHub => 'Abrir en GitHub';

  @override
  String get settingsSeeWhatsNew => 'Ver las novedades';

  @override
  String get settingsSeeWhatsNewSubtitle => 'Las notas de la versión actual';

  @override
  String get windowsCloseToTray => 'Cerrar a la bandeja';

  @override
  String get windowsCloseToTraySubtitle =>
      'Al cerrar la ventana, Absorb Plus sigue funcionando en el área de notificaciones. Sal desde el icono de la bandeja.';

  @override
  String get windowsStartWithWindows => 'Iniciar con Windows';

  @override
  String get windowsStartWithWindowsSubtitle =>
      'Abrir Absorb Plus al iniciar sesión en Windows';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return 'Se inicia: $command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return 'Hay otra copia configurada para iniciarse: $command. Actívalo para usar esta copia en su lugar.';
  }

  @override
  String get windowsStartupDisabledBySystem =>
      'Desactivado en las apps de inicio del Administrador de tareas. Vuelve a activarlo allí.';

  @override
  String get windowsStartMinimized => 'Iniciar minimizado';

  @override
  String get windowsStartMinimizedSubtitle =>
      'Cuando se inicia con Windows, se mantiene en la bandeja (o minimizado si Cerrar a la bandeja está desactivado)';

  @override
  String get windowsAlwaysOnTop => 'Siempre visible';

  @override
  String get windowsAlwaysOnTopSubtitle =>
      'Mantiene la ventana por encima de las demás';

  @override
  String get windowsKeepAwake =>
      'Mantener el PC activo al reproducir o descargar';

  @override
  String get windowsKeepAwakeSubtitle =>
      'Evita que el PC se suspenda. La pantalla aún puede apagarse.';

  @override
  String get windowsSettingFailed => 'Windows no aceptó ese cambio';

  @override
  String get windowsGlobalHotkeys => 'Atajos globales';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Funcionan con Absorb Plus en segundo plano: Ctrl+Alt+Space reproducir/pausar, Ctrl+Alt+Left/Right retroceder/avanzar, Ctrl+Alt+Up/Down volumen, Ctrl+Alt+B añadir marcador';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return 'Ocupados por otra app, no disponibles: $keys';
  }

  @override
  String get windowsTrayShow => 'Mostrar Absorb Plus';

  @override
  String get windowsTrayQuit => 'Salir de Absorb Plus';

  @override
  String get windowsTaskbarPlay => 'Reproducir';

  @override
  String get windowsTaskbarPause => 'Pausar';

  @override
  String get windowsTaskbarRewind => 'Retroceder';

  @override
  String get windowsTaskbarForward => 'Avanzar';

  @override
  String windowsJumpListResume(String title) {
    return 'Reanudar $title';
  }

  @override
  String get githubProjectTitle => 'Absorb Plus en GitHub';

  @override
  String get precacheTitle => 'Precargar portadas y páginas de libros';

  @override
  String get precacheSubtitle =>
      'Las obtiene en segundo plano con Wi-Fi o conexión por cable, para que las pantallas se abran al instante. Usa un poco de espacio en disco, no memoria.';

  @override
  String get githubProjectSubtitle =>
      'Versiones, código fuente y novedades del proyecto';

  @override
  String get supportSaveLogsSubtitle =>
      'Guarda el archivo de registro para adjuntarlo a una incidencia de GitHub';

  @override
  String get supportSaveLogsDialogTitle =>
      'Guardar los registros de Absorb Plus';

  @override
  String supportLogsSaved(String path) {
    return 'Registros guardados en $path';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return 'No se pudieron guardar los registros: $error';
  }

  @override
  String get supportOpenLogsFolder => 'Abrir la carpeta de registros';

  @override
  String get supportOpenLogsFolderSubtitle =>
      'Muestra el archivo de registro en tu explorador de archivos';

  @override
  String get supportOpenLogsFolderFailed =>
      'No se pudo abrir la carpeta de registros';

  @override
  String get desktopDownloadFolderOpen => 'Abrir en el Explorador';

  @override
  String get desktopDownloadFolderOpenLinux => 'Abrir carpeta';

  @override
  String get desktopDownloadFolderOpenFailed => 'No se pudo abrir la carpeta';

  @override
  String get desktopDownloadFolderNotWritable =>
      'Absorb no puede guardar archivos en esa carpeta. Elige otra.';

  @override
  String get desktopDownloadFolderPickFailed =>
      'No se pudo mostrar el selector de carpetas';

  @override
  String get desktopDownloadFolderNetworkPath =>
      'Las carpetas de red (\\\\server\\share) no pueden contener descargas. Asigna el recurso compartido a una letra de unidad en el Explorador de archivos, como Z:, y elige esa.';

  @override
  String get desktopDownloadFolderDefault => 'Carpeta predeterminada';

  @override
  String get bookSettingsTitle => 'Ajustes del libro';

  @override
  String bookSettingsSeries(String name) {
    return 'Serie: $name';
  }

  @override
  String get bookSettingsSpeed => 'Velocidad';

  @override
  String get bookSettingsSpeedFromSeries =>
      'Del último libro que reprodujiste de esta serie';

  @override
  String get bookSettingsSkipIntro => 'Omitir intro';

  @override
  String get bookSettingsSkipIntroHint =>
      'Solo cuando el libro empieza desde el principio';

  @override
  String get bookSettingsSkipOutro => 'Omitir final';

  @override
  String get bookSettingsSkipOutroHint =>
      'Termina el libro antes y lo marca como terminado';

  @override
  String get bookSettingsSkipOff => 'Apagado';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get bookSettingsWholeSeries => 'Usar en toda la serie';

  @override
  String get bookSettingsWholeSeriesHint =>
      'La intro y el final se aplican a todos los libros de esta serie';

  @override
  String get bookSettingsReset => 'Restablecer';

  @override
  String get bookSettingsResetDone => 'Ajustes del libro restablecidos';

  @override
  String get adminDashTitle => 'Panel';

  @override
  String get adminDashSubtitle =>
      'Quién escucha, bibliotecas, usuarios y avisos del servidor de un vistazo';

  @override
  String get adminDashNobodyListening => 'Nadie está escuchando ahora mismo';

  @override
  String adminDashOnlineNames(String names) {
    return 'En línea: $names';
  }

  @override
  String get adminDashListeningHistory => 'Historial de escucha';

  @override
  String get adminDashCouldNotLoad =>
      'No se pudo cargar esto desde el servidor';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => 'Analizar todo';

  @override
  String get adminDashScanAllTitle => '¿Analizar todas las bibliotecas?';

  @override
  String get adminDashScanAllContent =>
      'Audiobookshelf buscará archivos nuevos, modificados y faltantes en todas las bibliotecas. Puede tardar en bibliotecas grandes.';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Análisis iniciado para $count bibliotecas',
      one: 'Análisis iniciado para 1 biblioteca',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return '$failed de $total análisis no pudieron iniciarse';
  }

  @override
  String get adminDashNoLibraries => 'Aún no hay bibliotecas';

  @override
  String get adminDashBackUpNow => 'Hacer copia ahora';

  @override
  String adminDashLastBackup(String time) {
    return 'Última copia $time';
  }

  @override
  String get adminDashNoBackups => 'Aún no hay copias de seguridad';

  @override
  String get adminDashManageUsers => 'Gestionar usuarios';

  @override
  String get adminDashNeverSeen => 'Nunca ha iniciado sesión';

  @override
  String get adminDashDisabled => 'Desactivado';

  @override
  String get adminDashLocked => 'Bloqueado';

  @override
  String get adminDashServerWarnings => 'Avisos del servidor';

  @override
  String get adminDashNoProblems =>
      'Sin avisos ni errores en el registro de hoy';

  @override
  String get adminDashAllLogs => 'Todos los registros del servidor';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale (integrado)';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => 'Atajos de teclado';

  @override
  String get desktopShortcutsSubtitle =>
      'Controles de reproducción, velocidad, búsqueda y navegación';

  @override
  String get desktopShortcutsClose => 'Cerrar';

  @override
  String get tailscaleConnect => 'Conectar con Tailscale';

  @override
  String get tailscaleConnectHint =>
      'Abre el inicio de sesión de Tailscale en tu navegador';

  @override
  String get tailscaleTurnOff => 'Apagar';

  @override
  String get tailscaleCardPitch =>
      'Accede a tu servidor en tu tailnet sin activar la VPN de Tailscale';

  @override
  String get tailscaleIntro =>
      'Accede a un servidor de tu tailnet sin activar la VPN de la app de Tailscale. Absorb se une a tu tailnet como un dispositivo propio, solo para sus propias conexiones. Función de prueba, desactivada por defecto.';

  @override
  String get tailscaleUseSwitch => 'Usar Tailscale integrado';

  @override
  String get tailscaleStatusOff => 'Apagado';

  @override
  String get tailscaleStatusStarting => 'Conectando…';

  @override
  String get tailscaleStatusNeedsLogin =>
      'Inicia sesión para añadir este dispositivo a tu tailnet';

  @override
  String get tailscaleStatusNeedsApproval =>
      'Esperando a que un administrador apruebe este dispositivo';

  @override
  String tailscaleStatusConnected(String user) {
    return 'Conectado como $user';
  }

  @override
  String get tailscaleStatusConnectedNoUser => 'Conectado';

  @override
  String tailscaleStatusError(String error) {
    return 'Problema: $error';
  }

  @override
  String get tailscaleNotIncluded => 'No incluido en esta compilación';

  @override
  String get tailscaleSignIn => 'Iniciar sesión con Tailscale';

  @override
  String get tailscaleSignInNoLink =>
      'Aún no hay enlace de inicio de sesión. Inténtalo de nuevo en un momento.';

  @override
  String get tailscaleToggleFailed =>
      'No se pudo activar o desactivar Tailscale integrado. Inténtalo de nuevo.';

  @override
  String get tailscaleSignOut => 'Cerrar sesión de Tailscale';

  @override
  String tailscaleDeviceAddress(String address) {
    return 'Este dispositivo: $address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return 'Se accede a tu servidor ($server) a través de Tailscale.';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return 'Tu servidor ($server) no es una dirección de tailnet, así que se accede como de costumbre. Si está en tu tailnet, añade su nombre de host abajo.';
  }

  @override
  String get tailscaleExtraHostsLabel => 'Otros nombres de host de la tailnet';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      'Las direcciones de 100.64.0.0/10 y los nombres que terminan en .ts.net o en el nombre MagicDNS de tu tailnet siempre pasan por Tailscale. Separa los nombres con comas.';

  @override
  String playerChapterEndsAt(String time) {
    return 'El capítulo termina a las $time';
  }

  @override
  String playerEndsAt(String time) {
    return 'Termina a las $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return 'Última reproducción en $device · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return 'Última reproducción en otro dispositivo · $ago';
  }

  @override
  String get opmlExportAction => 'Exportar OPML';

  @override
  String get opmlExportDialogTitle => 'Guardar los feeds de podcasts como OPML';

  @override
  String opmlExportSaved(String path) {
    return 'OPML guardado en $path';
  }

  @override
  String get opmlExportDownloaded => 'OPML descargado';

  @override
  String get opmlExportFailed => 'No se pudo exportar el archivo OPML';

  @override
  String get bookCopySaveAction => 'Guardar una copia…';

  @override
  String get bookCopyDialogTitle => 'Guardar una copia de este libro';

  @override
  String get bookCopySaving => 'Guardando una copia…';

  @override
  String bookCopySaved(String path) {
    return 'Copia guardada en $path';
  }

  @override
  String get bookCopyFailed => 'No se pudo guardar una copia de este libro';

  @override
  String get exclusiveAudioTitle => 'Audio exclusivo';

  @override
  String get exclusiveAudioSubtitle =>
      'Corrige chasquidos o saltos de volumen omitiendo los efectos de sonido de Windows. Las demás apps se silencian mientras Absorb reproduce. Reinicia Absorb para aplicarlo.';

  @override
  String get exclusiveAudioFallback =>
      'Tu dispositivo de sonido rechazó el audio exclusivo, así que Absorb reproduce en modo normal';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return '$count nuevos';
  }

  @override
  String seekUndoBackTo(String time) {
    return 'Volver a $time';
  }

  @override
  String get goToTime => 'Ir a un momento';

  @override
  String get goToTimeLabel => 'Tiempo';

  @override
  String get goToTimeHint => 'h:mm:ss, mm:ss o minutos';

  @override
  String get goToTimeGo => 'Ir';

  @override
  String goToTimeLength(String time) {
    return 'Duración $time';
  }

  @override
  String get goToTimeInvalid => 'Escribe un tiempo como 1:23:45, 23:45 o 90';

  @override
  String goToTimePastEnd(String time) {
    return 'Eso supera el final ($time)';
  }

  @override
  String get desktopShortcutGoToTime =>
      'Ir a un momento del reproductor abierto';

  @override
  String fellAsleepJumpBack(String time) {
    return 'Te dormiste hacia las $time · Volver';
  }

  @override
  String get surpriseMe => 'Sorpréndeme';

  @override
  String get surpriseMeNoneLeft =>
      'Has terminado todos los libros de esta biblioteca';

  @override
  String get surpriseMeFailed =>
      'No se pudo elegir un libro. Inténtalo de nuevo.';

  @override
  String get surpriseMeOffline =>
      'Sorpréndeme necesita conexión con el servidor';

  @override
  String get surpriseMeBooksOnly =>
      'Sorpréndeme elige libros. Cambia a una biblioteca de libros.';

  @override
  String get autoDownloadNextInSeries =>
      'Descargar automáticamente el siguiente libro de la serie';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      'Cuando el libro que reproduces va al 80% o le queda menos de una hora. Respeta el ajuste de solo Wi-Fi.';

  @override
  String get emptyStateBrowseLibrary => 'Explorar la biblioteca';

  @override
  String get emptyStateClearSearch => 'Limpiar búsqueda';

  @override
  String get statsNoListeningYet => 'Aún sin escucha';

  @override
  String get desktopShortcutQuickSwitcher =>
      'Selector rápido: busca libros o ve a cualquier sitio';

  @override
  String get desktopShortcutHelp => 'Mostrar atajos de teclado';

  @override
  String get quickSwitcherTooltip => 'Selector rápido (Ctrl+K)';

  @override
  String get quickSwitcherHint =>
      'Busca en esta biblioteca o escribe un comando';

  @override
  String get quickSwitcherNoResults => 'Sin coincidencias';

  @override
  String get quickSwitcherGoHome => 'Ir a Inicio';

  @override
  String get quickSwitcherGoLibrary => 'Ir a Biblioteca';

  @override
  String get quickSwitcherGoAbsorbing => 'Ir a Absorbing';

  @override
  String get quickSwitcherGoStats => 'Ir a Estadísticas';

  @override
  String get quickSwitcherGoSettings => 'Ir a Ajustes';

  @override
  String get quickSwitcherGoDownloads => 'Ir a Descargas';

  @override
  String get quickSwitcherPlayPause => 'Reproducir / pausar';

  @override
  String get quickSwitcherSleepTimer => 'Temporizador de apagado';

  @override
  String get quickSwitcherKeywordsAbsorbing =>
      'reproduciendo ahora reproductor now playing player';

  @override
  String get quickSwitcherKeywordsSettings =>
      'preferencias opciones ajustes preferences options';

  @override
  String get quickSwitcherKeywordsDownloads => 'sin conexión descargas offline';

  @override
  String get quickSwitcherKeywordsPlayPause =>
      'reanudar pausa reproducir resume pause';

  @override
  String get quickSwitcherKeywordsSleepTimer =>
      'temporizador apagado dormir timer';

  @override
  String get quickSwitcherKeywordsShortcuts =>
      'atajos teclas ayuda teclado keys help hotkeys keyboard';

  @override
  String get quickSwitcherKindAction => 'Acción';

  @override
  String get quickSwitcherKindBook => 'Libro';

  @override
  String get quickSwitcherKindPodcast => 'Podcast';

  @override
  String get quickSwitcherKindSeries => 'Serie';

  @override
  String get quickSwitcherKindAuthor => 'Autor';

  @override
  String get alphabetScrollerLabel => 'Saltar a una letra';

  @override
  String get stepperDecrease => 'Disminuir';

  @override
  String get stepperIncrease => 'Aumentar';

  @override
  String get statsStreakKeepGoing =>
      'Escucha 5 minutos hoy para mantener la racha';

  @override
  String get statsStreakHowTo =>
      'Escucha 5 minutos al día para crear una racha';

  @override
  String get statsDailyGoalSheetTitle => 'Objetivo diario de escucha';

  @override
  String get statsDailyGoalSheetBody =>
      'Un anillo en la tarjeta de racha se llena a medida que escuchas hoy.';

  @override
  String get statsDailyGoalSet => 'Fijar un objetivo diario';

  @override
  String get statsMonthListened => 'Escuchado';

  @override
  String get statsMonthTime => 'Tiempo';

  @override
  String get statsMonthTopBook => 'Libro principal';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados',
      one: '1 resultado',
      zero: 'Sin resultados',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => 'Ordenar y agrupar';

  @override
  String get bookmarksViewByBook => 'Por libro';

  @override
  String get bookmarksViewNewest => 'Más recientes primero';

  @override
  String get bookmarksViewPosition => 'Por posición';

  @override
  String get bookmarksExportAction => 'Exportar marcadores';

  @override
  String get bookmarksExportDialogTitle =>
      'Guardar los marcadores como Markdown';

  @override
  String bookmarksExportSaved(String path) {
    return 'Marcadores guardados en $path';
  }

  @override
  String get bookmarksExportDownloaded => 'Marcadores descargados';

  @override
  String get bookmarksExportFailed => 'No se pudieron exportar los marcadores';

  @override
  String get chapterSearchHint =>
      'Busca capítulos o escribe un tiempo (1:23:00)';

  @override
  String get chapterSearchNoResults => 'Ningún capítulo coincide';

  @override
  String get dropUploadNotAllowed =>
      'Tu cuenta no puede subir archivos a este servidor';

  @override
  String get dropUploadNothingUsable =>
      'Ninguno de los archivos soltados se puede subir';

  @override
  String get dropUploadAlreadyOpen =>
      'Termina o cierra primero la subida abierta';

  @override
  String get remoteHostTitle => 'Controlar desde el teléfono';

  @override
  String get remoteHostSubtitleOff =>
      'Usa tu teléfono como mando a distancia de Absorb en este PC';

  @override
  String remoteHostSubtitleOn(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count teléfonos conectados',
      one: '1 teléfono conectado',
      zero: 'ningún teléfono conectado',
    );
    return 'Activado · $_temp0';
  }

  @override
  String get remoteHostSheetBody =>
      'Usa tu teléfono como mando a distancia de este PC. El audio sigue sonando aquí en el PC, y tu teléfono muestra lo que suena con los botones. El teléfono y este PC deben estar en la misma red Wi-Fi.';

  @override
  String get remoteHostSwitch => 'Activar';

  @override
  String get remoteHostSwitchSubtitle =>
      'Windows puede pedir que permitas a Absorb Plus a través del firewall la primera vez. Permítelo.';

  @override
  String get remoteHostKeepOn => 'Mantener activado al iniciar Absorb';

  @override
  String get remoteHostKeepOnSubtitle =>
      'Si está desactivado, se apaga cada vez que cierras Absorb.';

  @override
  String remoteHostPortsBusy(int first, int last) {
    return 'No se pudo iniciar: los puertos $first a $last están todos en uso.';
  }

  @override
  String get remoteHostPairTitle => 'Vincular tu teléfono';

  @override
  String get remoteHostStep1 => '1. Actívalo aquí.';

  @override
  String get remoteHostStep2 =>
      '2. Escanea el código con la cámara del teléfono, o abre Absorb en el teléfono y ve a Ajustes > Controlar tu ordenador.';

  @override
  String get remoteHostStep3 =>
      '3. Introduce el código en el teléfono y luego elige Permitir aquí.';

  @override
  String get remoteHostCodeLabel => 'Código';

  @override
  String remoteHostCodeExpires(String time) {
    return 'Válido durante $time';
  }

  @override
  String get remoteHostPairFirst => 'Vincular un teléfono';

  @override
  String get remoteHostPairAnother => 'Vincular otro dispositivo';

  @override
  String get remoteHostPairingClosed =>
      'La vinculación está cerrada. Toca el botón para obtener un código nuevo; es válido 2 minutos y para un solo dispositivo.';

  @override
  String get remoteHostFull =>
      'Hay 5 dispositivos vinculados, el máximo permitido. Olvida uno para vincular otro.';

  @override
  String remoteHostAddresses(String addresses) {
    return 'Dirección de este PC: $addresses';
  }

  @override
  String get remoteHostNoAddress =>
      'Este PC no tiene dirección de red ahora mismo.';

  @override
  String get remoteHostNoDiscovery =>
      'Puede que tu teléfono no encuentre este PC por sí solo; escribe en el teléfono la dirección de este PC.';

  @override
  String get remoteHostConnectedTitle => 'Conectados ahora';

  @override
  String get remoteHostPairedTitle => 'Dispositivos vinculados';

  @override
  String get remoteHostNoDevices => 'Aún no hay dispositivos vinculados';

  @override
  String get remoteHostUnusedNote =>
      'Un dispositivo sin usar durante 90 días se olvida.';

  @override
  String remoteHostLastUsed(String date) {
    return 'Último uso: $date';
  }

  @override
  String remoteHostConnectedFrom(String address, String time) {
    return '$address, conectado desde $time';
  }

  @override
  String get remoteHostForget => 'Olvidar';

  @override
  String get remoteHostForgetAll => 'Olvidar todos';

  @override
  String get remoteHostForgetAllConfirm =>
      '¿Olvidar todos los dispositivos vinculados? Cada uno tendrá que vincularse de nuevo para controlar este PC.';

  @override
  String get remoteHostDisconnect => 'Desconectar';

  @override
  String remoteHostAllowTitle(String name) {
    return '¿Permitir que ‘$name’ controle Absorb en este PC?';
  }

  @override
  String get remoteHostAllowBody =>
      'Permite solo un dispositivo que conozcas. Puede reproducir, pausar y cambiar lo que suena aquí. Sin respuesta significa no.';

  @override
  String get remoteHostAllow => 'Permitir';

  @override
  String get remoteHostDeny => 'Denegar';

  @override
  String get remoteControlAnother => 'Controlar tu ordenador';

  @override
  String get remoteControlAnotherSubtitle =>
      'Usa este teléfono como mando a distancia de Absorb en tu PC';

  @override
  String get remoteConnectIntro =>
      'Usa este teléfono como mando a distancia de Absorb en tu PC. El audio sigue sonando en el PC. El teléfono y el PC deben estar en la misma red Wi-Fi. En el PC, abre Ajustes > Controlar desde el teléfono y actívalo.';

  @override
  String get remoteConnectSearching => 'Buscando ordenadores en tu red Wi-Fi…';

  @override
  String get remoteConnectNoneFound =>
      'No se encontraron ordenadores. En el PC, abre Ajustes > Controlar desde el teléfono y actívalo, o introduce su dirección.';

  @override
  String get remoteConnectSearchAgain => 'Buscar de nuevo';

  @override
  String get remoteConnectPaired => 'Vinculado';

  @override
  String get remoteConnectFound => 'En tu red Wi-Fi';

  @override
  String get remoteConnectEnterAddress => 'Introducir una dirección';

  @override
  String get remoteConnectAddressHint => '192.168.1.20:47390';

  @override
  String get remoteConnectAddressInvalid =>
      'Introduce una dirección como 192.168.1.20 o 192.168.1.20:47390';

  @override
  String get remoteConnectNext => 'Siguiente';

  @override
  String remoteConnectCodeTitle(String name) {
    return 'Vincular con $name';
  }

  @override
  String get remoteConnectCodeHelp =>
      'Introduce el código de 6 dígitos que aparece en el PC en Controlar desde el teléfono.';

  @override
  String get remoteConnectWaiting => 'Ahora elige Permitir en el PC…';

  @override
  String get remoteConnectPair => 'Vincular';

  @override
  String get remoteConnectForget => 'Olvidar este ordenador';

  @override
  String get remotePairBadCode =>
      'Ese código no es correcto. Revisa el PC e inténtalo de nuevo.';

  @override
  String get remotePairExpired =>
      'El código caducó. Obtén uno nuevo en el PC con Vincular otro dispositivo.';

  @override
  String get remotePairClosed =>
      'La vinculación no está abierta en el PC. En el PC, toca Vincular otro dispositivo para obtener un código nuevo.';

  @override
  String get remotePairDenied =>
      'El PC no permitió este teléfono. Inténtalo de nuevo y elige Permitir en el PC.';

  @override
  String get remotePairTooManyDevices =>
      'Ese PC ya tiene 5 dispositivos vinculados. Primero olvida uno en el PC.';

  @override
  String get remotePairTooMany =>
      'Demasiados intentos. Espera un minuto e inténtalo de nuevo.';

  @override
  String get remotePairUnreachable =>
      'Tu teléfono y el PC no están en la misma red Wi-Fi, o el PC no lo ha activado. Revisa ambos e inténtalo de nuevo.';

  @override
  String get remotePairFailed =>
      'La vinculación no funcionó. Inténtalo de nuevo.';

  @override
  String get remoteVersionMismatch =>
      'Actualiza Absorb Plus en ambos dispositivos para usar el mando.';

  @override
  String get remoteConnecting => 'Conectando…';

  @override
  String get remoteReconnecting => 'Reconectando…';

  @override
  String get remoteUnreachableHint =>
      'No se puede conectar con el PC. Comprueba que no esté suspendido, que Absorb esté abierto y que ambos estén en la misma red Wi-Fi.';

  @override
  String remoteNothingPlaying(String name) {
    return 'No se está reproduciendo nada en $name';
  }

  @override
  String get remoteNothingLoaded => 'Primero inicia algo en el PC.';

  @override
  String get remoteCommandFailed => 'El PC no pudo hacerlo.';

  @override
  String get remoteNotOnList => 'Ese libro ya no está en la lista del PC.';

  @override
  String get remoteDisconnectedByHost => 'El PC desconectó este dispositivo.';

  @override
  String get remoteUnauthorized =>
      'El PC ya no reconoce este dispositivo. Vincúlalo de nuevo.';

  @override
  String get remotePairAgain => 'Vincular de nuevo';

  @override
  String get remoteConnectAgain => 'Conectar de nuevo';

  @override
  String get remotePlay => 'Reproducir';

  @override
  String get remotePause => 'Pausa';

  @override
  String get remoteStop => 'Detener';

  @override
  String get remotePreviousChapter => 'Capítulo anterior';

  @override
  String get remoteNextChapter => 'Capítulo siguiente';

  @override
  String remoteSkipBack(int seconds) {
    return 'Retroceder $seconds segundos';
  }

  @override
  String remoteSkipForward(int seconds) {
    return 'Avanzar $seconds segundos';
  }

  @override
  String get remoteSpeed => 'Velocidad';

  @override
  String get remoteSpeedSlower => 'Más lento';

  @override
  String get remoteSpeedFaster => 'Más rápido';

  @override
  String get remoteSleepTimer => 'Temporizador de apagado';

  @override
  String remoteSleepMinutes(int minutes) {
    return '$minutes minutos';
  }

  @override
  String get remoteSleepEndOfChapter => 'Fin del capítulo';

  @override
  String get remoteSleepEndOfEpisode => 'Fin del episodio';

  @override
  String remoteSleepChapters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capítulos',
      one: '1 capítulo',
    );
    return '$_temp0';
  }

  @override
  String get remoteSleepCancel => 'Desactivar el temporizador de apagado';

  @override
  String get remoteVolume => 'Volumen';

  @override
  String get remoteMute => 'Silenciar';

  @override
  String get remoteUnmute => 'Activar sonido';

  @override
  String get remoteChapters => 'Capítulos';

  @override
  String get remoteBookmark => 'Marcador';

  @override
  String get remoteBookmarkTitle => 'Añadir un marcador aquí';

  @override
  String get remoteBookmarkNoteHint => 'Nota (opcional)';

  @override
  String get remoteBookmarkAdd => 'Añadir';

  @override
  String get remoteBookmarkAdded => 'Marcador añadido en el PC';

  @override
  String get remoteContinueListening => 'Continuar escuchando';

  @override
  String get remoteContinueEmpty => 'No hay nada en curso en el PC.';

  @override
  String remoteTimeLeft(String time) {
    return 'Quedan $time';
  }

  @override
  String remoteChapterTimeLeft(String time) {
    return 'Quedan $time del capítulo';
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
  String get remoteCustomize => 'Personalizar';

  @override
  String get remoteCustomizeTitle => 'Personalizar el mando';

  @override
  String get remoteCustomizeHintPortrait =>
      'Editando el diseño vertical. Arrastra un bloque por su asa, o mantenlo pulsado, para moverlo. Gira el teléfono para editar el horizontal.';

  @override
  String get remoteCustomizeHintLandscape =>
      'Editando el diseño horizontal. Arrastra bloques dentro de las dos columnas o entre ellas. Gira el teléfono para editar el vertical.';

  @override
  String get remoteCustomizeReset => 'Restablecer valores predeterminados';

  @override
  String get remoteCustomizePresets => 'Preajustes';

  @override
  String get remoteCustomizeAddTitle => 'Añadir a la pantalla';

  @override
  String get remoteCustomizeDropHere => 'Suelta bloques aquí';

  @override
  String get remoteCustomizeMove => 'Arrastrar para mover';

  @override
  String get remoteCustomizeEmpty =>
      'No hay nada en esta pantalla. Toca Personalizar para añadir controles.';

  @override
  String get remotePresetDefault => 'Predeterminado';

  @override
  String get remotePresetMinimal => 'Mínimo';

  @override
  String get remotePresetNightstand => 'Mesita de noche';

  @override
  String get remotePresetFull => 'Completo';

  @override
  String get remoteBlockCover => 'Portada';

  @override
  String get remoteBlockTitle => 'Título y autor';

  @override
  String get remoteBlockChapterTitle => 'Título del capítulo';

  @override
  String get remoteBlockProgress => 'Barra de progreso';

  @override
  String get remoteBlockTimeLeft => 'Tiempo restante';

  @override
  String get remoteBlockTransport => 'Botones de reproducción';

  @override
  String get remoteBlockClock => 'Reloj';

  @override
  String get remoteBlockSpacer => 'Espacio';

  @override
  String get remoteSizeSmall => 'Pequeño';

  @override
  String get remoteSizeMedium => 'Mediano';

  @override
  String get remoteSizeLarge => 'Grande';

  @override
  String get remoteSizeCompact => 'Compacto';

  @override
  String get remoteSizeNormal => 'Normal';

  @override
  String get remoteDisplayBackground => 'Fondo';

  @override
  String get remoteDisplayBackgroundTheme => 'Tema';

  @override
  String get remoteDisplayBackgroundCover => 'Portada difuminada';

  @override
  String get remoteDisplayBackgroundBlack => 'Negro';

  @override
  String get remoteDisplayTextSize => 'Tamaño del texto';

  @override
  String get remoteDisplayTextHuge => 'Enorme';

  @override
  String get remoteDisplay24Hour => 'Reloj de 24 horas';

  @override
  String get remoteDisplayDim => 'Atenuar la pantalla después de';

  @override
  String get remoteDisplayDimNever => 'Nunca';

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
      'mando remoto control teléfono pc vincular remote phone control link pair';

  @override
  String get quickSwitcherKeywordsSurprise =>
      'aleatorio azar sorpresa random pick shuffle';

  @override
  String get developerModeOn => 'Modo de desarrollador activado';

  @override
  String get developerModeAlreadyOn =>
      'El modo de desarrollador ya está activado';

  @override
  String get developerTitle => 'Desarrollador';

  @override
  String get developerSubtitle =>
      'Compilaciones de prueba y herramientas de desarrollo';

  @override
  String get developerModeSwitch => 'Modo de desarrollador';

  @override
  String get developerModeSwitchSubtitle =>
      'Al desactivarlo se oculta esta página. Toca la versión 7 veces para recuperarla.';

  @override
  String get testChannelTitle => 'Canal de pruebas';

  @override
  String get testChannelSubtitle =>
      'Instala la compilación de prueba más reciente';

  @override
  String get testChannelUnavailable =>
      'Las compilaciones de prueba solo están disponibles en la versión de GitHub para Android.';

  @override
  String get testChannelCodeLabel => 'Código del canal de pruebas';

  @override
  String get testChannelUnlock => 'Desbloquear';

  @override
  String get testChannelUnlocked => 'Canal de pruebas desbloqueado';

  @override
  String get testChannelWrongCode => 'Ese código no es correcto';

  @override
  String get testChannelLaunchCheck =>
      'Buscar compilaciones de prueba al iniciar';

  @override
  String get testChannelLaunchCheckSubtitle =>
      'Pregunta si instalar una compilación de prueba más reciente al abrir la app';

  @override
  String get testChannelWarning =>
      'Las compilaciones de prueba están sin terminar y pueden fallar. Reemplazan la app instalada y conservan tus datos.';

  @override
  String testChannelInstalled(String version) {
    return 'Instalada: $version';
  }

  @override
  String testChannelNewest(String version) {
    return 'Compilación de prueba más reciente: $version';
  }

  @override
  String get testChannelNone => 'Aún no hay ninguna compilación de prueba';

  @override
  String get testChannelUpToDate => 'Al día';

  @override
  String get testChannelInstall => 'Instalar';

  @override
  String get testChannelCheckNow => 'Comprobar ahora';

  @override
  String get testChannelNotes => 'Qué incluye';

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
  String get testBuildAvailable => 'Compilación de prueba disponible';

  @override
  String testBuildDialogContent(String latest, String current) {
    return 'Ya está disponible la compilación de prueba $latest.\n\nTienes la $current.';
  }

  @override
  String testBuildPackageLabel(int build) {
    return 'Compilación de prueba $build';
  }

  @override
  String get githubSignIn => 'Iniciar sesión con GitHub';

  @override
  String get githubSignInSubtitle =>
      'Las compilaciones de prueba son privadas: inicia sesión para obtenerlas';

  @override
  String get githubSignInNotSetUp =>
      'El inicio de sesión con GitHub aún no está configurado en esta compilación';

  @override
  String get githubSignInAgain => 'Iniciar sesión de nuevo';

  @override
  String get githubSignInExpired => 'Tu sesión de GitHub caducó';

  @override
  String githubSignedInAs(String login) {
    return 'Sesión iniciada en GitHub como $login';
  }

  @override
  String get githubSignedIn => 'Sesión iniciada en GitHub';

  @override
  String get githubSignOut => 'Cerrar sesión';

  @override
  String get githubSignInEnterCode => 'Introduce este código en GitHub:';

  @override
  String get githubSignInOpen => 'Abrir github.com/login/device';

  @override
  String get githubSignInCopyCode => 'Copiar código';

  @override
  String get githubSignInCodeCopied => 'Código copiado';

  @override
  String get githubSignInWaiting => 'Esperando a que lo apruebes en GitHub...';

  @override
  String get githubSignInDenied => 'Se canceló el inicio de sesión en GitHub.';

  @override
  String get githubSignInCodeExpired => 'El código caducó. Inténtalo de nuevo.';

  @override
  String get githubSignInFailed =>
      'No se pudo iniciar sesión en GitHub. Inténtalo de nuevo.';

  @override
  String get githubSignInTryAgain => 'Reintentar';

  @override
  String get testChannelSignInNeeded =>
      'Inicia sesión con GitHub para obtener compilaciones de prueba';

  @override
  String get downloadEtaUnderMinute => 'Queda <1 min';

  @override
  String downloadEtaMinutes(int minutes) {
    return 'Quedan $minutes min';
  }

  @override
  String downloadEtaHours(int hours) {
    return 'Quedan $hours h';
  }

  @override
  String downloadEtaHoursMinutes(int hours, int minutes) {
    return 'Quedan $hours h $minutes min';
  }

  @override
  String get sameSpeedAllBooksTitle => 'Misma velocidad para todos los libros';

  @override
  String get sameSpeedAllBooksSubtitle =>
      'Todos los libros se reproducen a la velocidad predeterminada, y cambiar la velocidad en el reproductor la cambia para todos. Desactivado: cada libro (o su serie) conserva su propia velocidad.';
}
