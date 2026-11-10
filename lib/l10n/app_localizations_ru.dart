// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'A B S O R B';

  @override
  String get online => 'Подключен';

  @override
  String get offline => 'Не в сети';

  @override
  String get stillOffline =>
      'Не удается подключиться. Нажмите, чтобы попробовать еще раз.';

  @override
  String get retry => 'Повторить';

  @override
  String get listsNone => 'Нет коллекций и плейлистов';

  @override
  String get listsNoneHint =>
      'Коллекции и плейлисты создаются на вашем сервере Audiobookshelf и появляются здесь.';

  @override
  String get listsLoadFailed => 'Не удалось загрузить списки';

  @override
  String get listsLoadFailedHint =>
      'Absorb не удалось подключиться к серверу за коллекциями и плейлистами.';

  @override
  String get listsNoneBookOrbit => 'Нет коллекций и Smart Scopes';

  @override
  String get listsNoneHintBookOrbit =>
      'Коллекции и Smart Scopes создаются на вашем сервере BookOrbit и появляются здесь.';

  @override
  String get listsLoadFailedHintBookOrbit =>
      'Absorb не удалось подключиться к серверу за коллекциями и Smart Scopes.';

  @override
  String get cancel => 'Отменить';

  @override
  String get delete => 'Удалить';

  @override
  String get remove => 'Убрать';

  @override
  String get save => 'Сохранить';

  @override
  String get done => 'Выполнено';

  @override
  String get edit => 'Править';

  @override
  String get search => 'Поиск';

  @override
  String get apply => 'Применить';

  @override
  String get enable => 'Включить';

  @override
  String get clear => 'Очистить';

  @override
  String get off => 'Выкл';

  @override
  String get disabled => 'Отключено';

  @override
  String get later => 'Позже';

  @override
  String get whatsNewTitle => 'Absorb обновлён';

  @override
  String whatsNewContent(String version) {
    return 'Теперь у вас версия $version.';
  }

  @override
  String get whatsNewButton => 'Что нового';

  @override
  String get whatsNewKeepShowing => 'Показывать после каждого обновления';

  @override
  String get whatsNewKeepShowingHint => 'Это можно снова включить в настройках';

  @override
  String get settingsWhatsNew => 'Показывать, что нового, после обновлений';

  @override
  String get settingsWhatsNewSubtitle =>
      'После обновления показывать список изменений в приложении';

  @override
  String get gotIt => 'Понятно';

  @override
  String get betaLoggingTitle => 'Журналы включены';

  @override
  String get betaLoggingContent =>
      'Это бета-версия, поэтому Absorb ведёт журналы, чтобы помочь найти проблемы. Они остаются на этом устройстве, пока вы ими не поделитесь.\n\nОтправить их или отключить можно в настройках, в разделе «Проблемы и поддержка». Если вы их отключите, в следующих бета-версиях они останутся выключенными.';

  @override
  String get preview => 'Предпросмотр';

  @override
  String get or => 'или';

  @override
  String get file => 'Файл';

  @override
  String get more => 'Ещё';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get untitled => 'Без названия';

  @override
  String get noThanks => 'Нет, спасибо';

  @override
  String get stay => 'Остаться';

  @override
  String get homeTitle => 'Главная';

  @override
  String get continueListening => 'Продолжить слушать';

  @override
  String get continueReading => 'Продолжить чтение';

  @override
  String get continueSeries => 'Продолжить серию';

  @override
  String get recentlyAdded => 'Недавно добавленные';

  @override
  String get listenAgain => 'Слушать снова';

  @override
  String get discover => 'Открыть для себя';

  @override
  String get newEpisodes => 'Новые эпизоды';

  @override
  String get downloads => 'Сохраненные';

  @override
  String get noDownloadedBooks => 'Нет загруженных книг';

  @override
  String get yourLibraryIsEmpty => 'Ваша библиотека пуста';

  @override
  String get downloadBooksWhileOnline =>
      'Скачивайте книги, пока вы в сети, чтобы слушать без интернета';

  @override
  String get customizeHome => 'Настроить главную';

  @override
  String get dragToReorderTapEye =>
      'Перетащите, чтобы изменить порядок; нажмите на глаз, чтобы показать или скрыть';

  @override
  String get loginTagline => 'Начните Absorbing';

  @override
  String get loginConnectToServer => 'Подключитесь к серверу';

  @override
  String get loginServerAddress => 'Адрес сервера';

  @override
  String get loginServerHint => 'my.server.com';

  @override
  String get loginServerHelper =>
      'IP:порт тоже подойдёт (например, 192.168.1.5:13378)';

  @override
  String get loginCouldNotReachServer => 'Не удалось подключиться к серверу';

  @override
  String get loginAdvanced => 'Дополнительно';

  @override
  String get loginCustomHttpHeaders => 'Свои HTTP-заголовки';

  @override
  String get loginCustomHeadersDescription =>
      'Для туннелей Cloudflare и обратных прокси, которым нужны дополнительные заголовки. Добавьте заголовки до ввода адреса сервера.';

  @override
  String get loginHeaderName => 'Имя заголовка';

  @override
  String get loginHeaderValue => 'Значение';

  @override
  String get loginAddHeader => 'Добавить заголовок';

  @override
  String get loginSelfSignedCertificates => 'Самоподписанные сертификаты';

  @override
  String get loginTrustAllCertificates =>
      'Доверять всем сертификатам (для самоподписанных и своих центров сертификации)';

  @override
  String get loginApiKey => 'Ключ API';

  @override
  String get loginApiKeyDescription =>
      'Используйте ключ API, созданный администратором, вместо имени пользователя и пароля. Полезно, если для вашей учётной записи не обновляется токен.';

  @override
  String get loginWaitingForSso => 'Ожидание SSO...';

  @override
  String get loginRedirectUri => 'URI перенаправления: absorb://oauth';

  @override
  String get loginOrSignInManually => 'или войдите вручную';

  @override
  String get loginUsername => 'Имя пользователя';

  @override
  String get loginUsernameRequired => 'Введите имя пользователя';

  @override
  String get loginPassword => 'Пароль';

  @override
  String get loginSignIn => 'Войти';

  @override
  String loginSignInAs(String username) {
    return 'Войти как $username?';
  }

  @override
  String get loginSignInToServer => 'Войти на этот сервер?';

  @override
  String loginSignedInAs(String username) {
    return 'Вход выполнен как $username';
  }

  @override
  String get adminCreateSetupFile => 'Поделиться входом';

  @override
  String adminSetupFileDescription(String username) {
    return 'Создаёт закрытую ссылку для входа для $username, которая работает только в приложении Absorb.';
  }

  @override
  String get adminSetupFileServerUrl =>
      'Адрес сервера, который будет использовать новый пользователь';

  @override
  String get adminSetupFileNoteWithHeaders =>
      'Будут включены отдельный ключ API и ваши заголовки, чтобы получить доступ к серверу. Относитесь к ссылке как к паролю.';

  @override
  String get adminSetupFileNote =>
      'Будет включён отдельный ключ API. Относитесь к ссылке как к паролю.';

  @override
  String get adminSetupFileCreate => 'Создать ссылку';

  @override
  String get adminSetupFileSaveTitle => 'Сохранить файл настройки';

  @override
  String get adminSetupFileKeyError =>
      'Не удалось создать ключ API для этого пользователя';

  @override
  String adminSetupFileSaved(String username) {
    return 'Файл настройки для $username сохранён';
  }

  @override
  String adminSetupFileFailed(String error) {
    return 'Не удалось создать вход: $error';
  }

  @override
  String get setupLinkShareTitle => 'Поделиться входом';

  @override
  String setupLinkShareDescription(String username) {
    return 'Отправьте эту закрытую ссылку или попросите отсканировать QR-код, чтобы войти как $username.';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return 'Любой, у кого есть эта ссылка, может войти как $username. Относитесь к ней как к паролю.';
  }

  @override
  String get setupLinkShare => 'Поделиться ссылкой';

  @override
  String get setupLinkCopy => 'Копировать ссылку';

  @override
  String get setupLinkCopied => 'Ссылка для входа скопирована';

  @override
  String get setupLinkSaveFile => 'Сохранить файл настройки';

  @override
  String get setupLinkQrError =>
      'Эта ссылка слишком велика для QR-кода. Поделитесь самой ссылкой.';

  @override
  String setupLinkShareSubject(String username) {
    return 'Вход в Absorb для $username';
  }

  @override
  String get setupLinkConfirmTitle => 'Войти по этой ссылке?';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return 'Войти на $server как $username? Продолжайте, только если доверяете отправителю ссылки.';
  }

  @override
  String get setupLinkInvalid =>
      'Эта ссылка для входа недействительна или неполная';

  @override
  String get setupLinkSigningIn => 'Проверка ссылки для входа...';

  @override
  String get loginPlayDownloads => 'Слушать сохранённое';

  @override
  String signedOutDownloadsNote(String username) {
    return 'Вы вышли из аккаунта. Всё, что вы слушаете здесь, синхронизируется с $username, когда вы снова войдёте.';
  }

  @override
  String get loginPasteLink => 'Вставить ссылку для входа';

  @override
  String get loginPasteLinkHelp =>
      'Вставьте полную ссылку для входа, которую вы получили. Относитесь к ней как к паролю.';

  @override
  String get loginFailed => 'Не удалось войти';

  @override
  String get loginSsoFailed => 'Вход через SSO не удался или был отменён';

  @override
  String get loginSsoAuthFailed =>
      'Аутентификация SSO не удалась. Попробуйте ещё раз.';

  @override
  String get loginRestoreFromBackup => 'Импорт';

  @override
  String get loginInvalidBackupFile => 'Недопустимый файл резервной копии';

  @override
  String get loginRestoreBackupTitle => 'Восстановить из копии?';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return 'Будут восстановлены все настройки и сохранённые аккаунты (всего: $count). Вход выполнится автоматически.';
  }

  @override
  String get loginRestoreBackupNoAccounts =>
      'Будут восстановлены все настройки. В этой копии нет аккаунтов.';

  @override
  String get loginRestore => 'Восстановить';

  @override
  String loginRestoredAndSignedIn(String username) {
    return 'Настройки восстановлены, вход выполнен как $username';
  }

  @override
  String get loginSessionExpired =>
      'Настройки восстановлены. Сеанс истёк - войдите, чтобы продолжить.';

  @override
  String get loginSettingsRestored => 'Настройки восстановлены';

  @override
  String loginRestoreFailed(String error) {
    return 'Не удалось восстановить: $error';
  }

  @override
  String get loginSavedAccounts => 'сохранённые аккаунты';

  @override
  String get libraryTitle => 'Библиотека';

  @override
  String get librarySearchBooksHint => 'Поиск книг, серий, авторов, чтецов...';

  @override
  String get librarySearchShowsHint => 'Поиск подкастов и эпизодов...';

  @override
  String get libraryTabLibrary => 'Библиотека';

  @override
  String get libraryTabSeries => 'Серии';

  @override
  String get libraryTabAuthors => 'Авторы';

  @override
  String get libraryTabNarrators => 'Чтецы';

  @override
  String get libraryNoBooks => 'Книги не найдены';

  @override
  String get libraryNoUnfinishedBooks => 'Нет непрослушанных книг';

  @override
  String get libraryNoBooksInProgress => 'Нет книг в процессе';

  @override
  String get libraryNoFinishedBooks => 'Нет прослушанных книг';

  @override
  String get libraryAllBooksStarted => 'Все книги начаты';

  @override
  String get libraryNoDownloadedBooks => 'Нет скачанных книг';

  @override
  String get libraryNoSeriesFound => 'Серии не найдены';

  @override
  String get libraryNoBooksWithEbooks => 'Нет книг с электронными версиями';

  @override
  String get libraryNoBooksMissingMetadata => 'Нет книг без этих метаданных';

  @override
  String get libraryNoItemsMatchingFilter =>
      'Нет элементов, подходящих под фильтр';

  @override
  String libraryNoBooksInGenre(String genre) {
    return 'Нет книг в жанре «$genre»';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return 'Нет книг с тегом «$tag»';
  }

  @override
  String get libraryClearFilter => 'Сбросить фильтр';

  @override
  String get libraryNoAuthorsFound => 'Авторы не найдены';

  @override
  String get libraryNoNarratorsFound => 'Чтецы не найдены';

  @override
  String get libraryNoResults => 'Ничего не найдено';

  @override
  String get librarySearchBooks => 'Книги';

  @override
  String get librarySearchShows => 'Подкасты';

  @override
  String get librarySearchEpisodes => 'Серии';

  @override
  String get librarySearchSeries => 'Серии';

  @override
  String get librarySearchAuthors => 'Авторы';

  @override
  String get librarySearchTags => 'Теги';

  @override
  String get librarySearchGenres => 'Жанры';

  @override
  String librarySeriesCount(int count) {
    return '$count серии';
  }

  @override
  String libraryAuthorsCount(int count) {
    return '$count авторы';
  }

  @override
  String libraryNarratorsCount(int count) {
    return '$count чтецы';
  }

  @override
  String libraryBooksCount(int loaded, int total) {
    return '$loaded/$total книги';
  }

  @override
  String get sort => 'Сортировка';

  @override
  String get filter => 'Фильтр';

  @override
  String get filterActive => 'Фильтр ●';

  @override
  String get name => 'Имя';

  @override
  String get title => 'Название';

  @override
  String get author => 'Автор';

  @override
  String get dateAdded => 'Дата добавления';

  @override
  String get numberOfBooks => 'Количество книг';

  @override
  String get sortTotalDuration => 'Общая длительность';

  @override
  String get sortLastBookAdded => 'Последняя добавленная книга';

  @override
  String get sortLastBookUpdated => 'Последняя обновлённая книга';

  @override
  String get publishedYear => 'Год издания';

  @override
  String get duration => 'Длительность';

  @override
  String get random => 'Случайно';

  @override
  String get collapseSeries => 'Свернуть серии';

  @override
  String get notFinished => 'Не прослушано';

  @override
  String get inProgress => 'В процессе';

  @override
  String get filterFinished => 'Прослушано';

  @override
  String get notStarted => 'Не начато';

  @override
  String get downloaded => 'Скачано';

  @override
  String get hasEbook => 'Есть электронная книга';

  @override
  String get noEbook => 'Нет электронной книги';

  @override
  String get hasSupplementaryEbook => 'Есть дополнительная электронная книга';

  @override
  String get noSupplementaryEbook => 'Нет дополнительной электронной книги';

  @override
  String get noSeries => 'Без серии';

  @override
  String get publishedDecade => 'Десятилетие издания';

  @override
  String get tracks => 'Треки';

  @override
  String get noTracks => 'Нет треков';

  @override
  String get singleTrack => 'Один трек';

  @override
  String get multipleTracks => 'Несколько треков';

  @override
  String get abridged => 'Сокращённая';

  @override
  String get issues => 'Проблемы';

  @override
  String get rssFeedOpen => 'RSS-лента открыта';

  @override
  String get explicitContent => 'С ограничением 18+';

  @override
  String get missingMetadata => 'Нет метаданных';

  @override
  String get genre => 'Жанр';

  @override
  String get tag => 'Тег';

  @override
  String get clearFilter => 'Сбросить фильтр';

  @override
  String get noGenresFound => 'Жанры не найдены';

  @override
  String get noTagsFound => 'Теги не найдены';

  @override
  String get asc => 'ПО ВОЗР.';

  @override
  String get desc => 'ПО УБЫВ.';

  @override
  String get fileSize => 'Размер файла';

  @override
  String get lastUpdated => 'Последнее обновление';

  @override
  String get fileCreated => 'Файл создан';

  @override
  String get lastModified => 'Последнее изменение';

  @override
  String get authorFirstLast => 'Автор (Имя Фамилия)';

  @override
  String get authorLastFirst => 'Автор (Фамилия, Имя)';

  @override
  String get progressSort => 'Прогресс';

  @override
  String get dateStarted => 'Дата начала';

  @override
  String get dateFinished => 'Дата окончания';

  @override
  String get episodeCount => 'Количество эпизодов';

  @override
  String get sequence => 'Номер в серии';

  @override
  String get absorbingTitle => 'Absorbing';

  @override
  String get absorbingStop => 'Стоп';

  @override
  String get absorbingManageQueue => 'Управление очередью';

  @override
  String get desktopAbsorbingQueueHint =>
      'Use Add to Absorbing on a book or episode to put it here. Items play in this order.';

  @override
  String get absorbingDone => 'Выполнено';

  @override
  String get absorbingNoDownloadedEpisodes => 'Нет скачанных эпизодов';

  @override
  String get absorbingNoDownloadedBooks => 'Нет скачанных книг';

  @override
  String get absorbingNothingPlayingYet => 'Пока ничего не играет';

  @override
  String get absorbingNothingAbsorbingYet => 'Пока ничего нет в Absorbing';

  @override
  String get absorbingDownloadEpisodesToListen =>
      'Скачайте эпизоды, чтобы слушать без интернета';

  @override
  String get absorbingDownloadBooksToListen =>
      'Скачайте книги, чтобы слушать без интернета';

  @override
  String get absorbingStartEpisodeFromShows =>
      'Запустите эпизод на вкладке «Подкасты»';

  @override
  String get absorbingStartBookFromLibrary =>
      'Запустите книгу на вкладке «Библиотека»';

  @override
  String get carModeTitle => 'Режим автомобиля';

  @override
  String get carModeNoBookLoaded => 'Книга не загружена';

  @override
  String get carModeBookLabel => 'Книга';

  @override
  String get carModeChapterLabel => 'Глава';

  @override
  String get carModeBookmarkDefault => 'Закладка';

  @override
  String get carModeBookmarkAdded => 'Закладка добавлена';

  @override
  String get downloadsTitle => 'Сохраненные';

  @override
  String get downloadsCancelSelection => 'Отменить загрузку';

  @override
  String get downloadsSelect => 'Выберите';

  @override
  String get downloadsNoDownloads => 'Нет загрузок';

  @override
  String get downloadsDownloading => 'Идёт загрузка';

  @override
  String get downloadsQueued => 'Очередь';

  @override
  String get downloadsCompleted => 'Завершено';

  @override
  String get downloadsEbooks => 'Электронные книги';

  @override
  String get downloadsWaiting => 'Подождите...';

  @override
  String get downloadsCancel => 'Отменить';

  @override
  String get downloadsDelete => 'Удалить';

  @override
  String downloadsDeleteCount(int count) {
    return 'Удалить $count загрузку(ок)?';
  }

  @override
  String get downloadsDeleteContent => 'Загруженные файлы будут удалены.';

  @override
  String downloadsDeletedCount(int count) {
    return 'Удалено $count загрузка(ок)';
  }

  @override
  String get downloadsRemoveTitle => 'Удалить из загруженных?';

  @override
  String downloadsRemoveContent(String title) {
    return 'Удалить \"$title\" из памяти?';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return '\"$title\" удалено';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return 'Не удалось скачать «$title»: одного из файлов нет на сервере. Возможно, поможет сканирование библиотеки.';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return 'Не удалось скачать «$title»: недостаточно места в хранилище';
  }

  @override
  String downloadFailedPermission(String title) {
    return 'Не удалось скачать «$title»: проверьте место загрузки в настройках';
  }

  @override
  String downloadFailedGeneric(String title) {
    return 'Не удалось скачать «$title»';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '$count выбрано';
  }

  @override
  String get bookmarksTitle => 'Все закладки';

  @override
  String get bookmarksTabBookmarks => 'Закладки';

  @override
  String get bookmarksTabHighlights => 'Выделения';

  @override
  String get highlightOpenInBook => 'Открыть в книге';

  @override
  String get highlightDeleteAction => 'Удалить выделение';

  @override
  String get highlightDeleted => 'Выделение удалено';

  @override
  String highlightsDeleteCount(int count) {
    return 'Удалить выбранные выделения: $count?';
  }

  @override
  String highlightsDeletedCount(int count) {
    return 'Удалено выделений: $count';
  }

  @override
  String get quoteShareTitle => 'Поделиться цитатой';

  @override
  String get quoteShareAction => 'Поделиться';

  @override
  String get quoteShareFailed => 'Не удалось создать изображение цитаты';

  @override
  String get quoteShapePortrait => 'Портрет';

  @override
  String get quoteShapeSquare => 'Квадрат';

  @override
  String get quoteShapeStory => 'История';

  @override
  String get quoteStyleBlur => 'Размытый';

  @override
  String get quoteStyleDim => 'Затемнённый';

  @override
  String get quoteStyleNone => 'Обычная обложка';

  @override
  String get quoteTextLight => 'Светлый текст';

  @override
  String get quoteTextDark => 'Тёмный текст';

  @override
  String get quoteFieldTitle => 'Название';

  @override
  String get quoteFieldDetail => 'Подробности';

  @override
  String get quoteFieldDetailHint => 'Автор, глава, страница, кто сказал';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => 'Отменить выбранное';

  @override
  String get bookmarksSortedByNewest => 'Сортировка по последним';

  @override
  String get bookmarksSortedByPosition => 'Сортировка по позиции';

  @override
  String get bookmarksSelect => 'Выберите закладку';

  @override
  String get bookmarksNoBookmarks => 'Закладок пока нет';

  @override
  String get bookmarksSearchHint => 'Поиск закладок';

  @override
  String get bookmarksNoMatches => 'Нет закладок, подходящих под запрос';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Скачивается $count книги',
      many: 'Скачивается $count книг',
      few: 'Скачивается $count книги',
      one: 'Скачивается $count книга',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => 'Уже скачано';

  @override
  String bookmarksDeleteCount(int count) {
    return 'Удалить $count закладку(ок)?';
  }

  @override
  String get bookmarksDeleteContent => 'Это невозможно отменить.';

  @override
  String bookmarksDeletedCount(int count) {
    return 'Удалено $count закладка(ок)';
  }

  @override
  String get bookmarksJumpTitle => 'Перейти к закладкам?';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '\"$title\" на $position\nв $bookTitle';
  }

  @override
  String get bookmarksJump => 'Перейти';

  @override
  String get bookmarksNotConnected => 'Нет подключения к серверу';

  @override
  String get bookmarksCouldNotLoad => 'Не удается загрузить книгу';

  @override
  String bookmarksSelectedCount(int count) {
    return '$count выбрано';
  }

  @override
  String get statsTitle => 'Ваша Статистика';

  @override
  String get statsCouldNotLoad => 'Не удается загрузить статистику';

  @override
  String get statsTotalListeningTime => 'ОБЩЕЕ ВРЕМЯ ПРОСЛУШИВАНИЯ';

  @override
  String get statsHoursUnit => 'ч';

  @override
  String get statsMinutesUnit => 'м';

  @override
  String get statsSecondsUnit => 'с';

  @override
  String statsDaysOfAudio(String days) {
    return 'Это $days дней звучания';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return 'Это $hours часов звучания';
  }

  @override
  String get statsToday => 'Сегодня';

  @override
  String get statsThisWeek => 'За эту неделю';

  @override
  String get statsThisMonth => 'За этот месяц';

  @override
  String get statsActivity => 'Действия';

  @override
  String get statsCurrentStreak => 'Текущая Серия';

  @override
  String get statsBestStreak => 'Лучшая Серия';

  @override
  String get statsFinished => 'Прослушано';

  @override
  String get statsBooksFinished => 'Книги';

  @override
  String get statsEpisodesFinished => 'Серии';

  @override
  String get statsBooksThisYear => 'Книги в этом году';

  @override
  String get statsEpisodesThisYear => 'Серии в этом году';

  @override
  String get statsRemoveFromYearTitle => 'Удалить за этот год';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return 'Завершенная дата $date останется на сервере. Это только удаляет \"$title\" из вашего Absorb списка книг за этот год.';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return 'Дата прослушивания останется на сервере. Это лишь уберёт «$title» из списка книг этого года в Absorb.';
  }

  @override
  String get statsRemovedFromYear => 'Убрано из этого года';

  @override
  String get statsAddBackToYearTitle => 'Вернуть в этот год';

  @override
  String statsAddBackToYearBody(String title) {
    return 'Вернуть «$title» в список книг этого года в Absorb?';
  }

  @override
  String get statsAddBack => 'Вернуть';

  @override
  String get statsAddedBackToYear => 'Возвращено в этот год';

  @override
  String get statsHiddenFromYear => 'Скрыто из этого года';

  @override
  String get statsNothingHidden => 'Ничего не скрыто';

  @override
  String get settingsCustomizeStats => 'Настроить статистику';

  @override
  String get statsGoalTitle => 'Цель прослушивания';

  @override
  String get statsGoalOff => 'Выкл';

  @override
  String get statsGoalDaily => 'В день';

  @override
  String get statsGoalWeekly => 'В неделю';

  @override
  String get statsGoalMonthly => 'В месяц';

  @override
  String get statsGoalTarget => 'Цель';

  @override
  String get statsGoalEnterTitle => 'Задать цель';

  @override
  String get statsGoalEnterTimeHint => 'Минуты или ч:мм';

  @override
  String statsBooksShort(int count) {
    return 'Книг: $count';
  }

  @override
  String get statsBookChallengeTitle => 'Читательский вызов';

  @override
  String get statsBookChallengeDesc =>
      'Книги, которые нужно прослушать в этом году';

  @override
  String get statsDailyGoal => 'Цель на день';

  @override
  String get statsWeeklyGoal => 'Цель на неделю';

  @override
  String get statsMonthlyGoal => 'Цель на месяц';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$done из $target книг';
  }

  @override
  String get statsGoalReached => 'Цель достигнута';

  @override
  String get statsChartTitle => 'График прослушивания';

  @override
  String get statsChartBar => 'Столбцы';

  @override
  String get statsChartLine => 'Линия';

  @override
  String get statsChartHeatmap => 'Тепловая карта';

  @override
  String get statsChartDays7 => '7 дней';

  @override
  String get statsChartDays30 => '30 дней';

  @override
  String get statsLast30Days => 'Последние 30 дней';

  @override
  String get statsThisYearTitle => 'В этом году';

  @override
  String get statsSectionsTitle => 'Разделы';

  @override
  String get statsSectionTimePeriods => 'Периоды времени';

  @override
  String get statsHeatmapLess => 'Меньше';

  @override
  String get statsHeatmapMore => 'Больше';

  @override
  String get statsDayOfWeek => 'В среднем по дням недели';

  @override
  String get statsTimeSavedLabel => 'Сэкономлено за счёт скорости';

  @override
  String statsTimeSavedSince(String date) {
    return 'с $date';
  }

  @override
  String get statsTimeSavedReset => 'Сбросить сэкономленное время';

  @override
  String get statsTimeSavedResetConfirm =>
      'Сэкономленное время снова будет считаться с сегодняшнего дня.';

  @override
  String get statsTimeSavedResetDone => 'Сэкономленное время сброшено';

  @override
  String statsOnPaceFor(int count) {
    return 'В темпе на книг: $count';
  }

  @override
  String get statsDaysActive => 'Активных дней';

  @override
  String get statsDailyAverage => 'В среднем в день';

  @override
  String get statsLast7Days => 'Последние 7 дней';

  @override
  String get statsMostListened => 'Больше всего слушали';

  @override
  String get statsRecentSessions => 'Недавние сеансы';

  @override
  String get appShellHomeTab => 'Главная';

  @override
  String get appShellLibraryTab => 'Библиотека';

  @override
  String get appShellAbsorbingTab => 'Absorbing';

  @override
  String get appShellStatsTab => 'Статистика';

  @override
  String get appShellSettingsTab => 'Настройки';

  @override
  String get appShellDiscoverTab => 'Обзор';

  @override
  String get appShellShowsTab => 'Подкасты';

  @override
  String get appShellPodcastsTab => 'Подкасты';

  @override
  String get libraryTabEpisodes => 'Серии';

  @override
  String get filterAllEpisodes => 'Все';

  @override
  String get filterUnplayed => 'Не прослушано';

  @override
  String get episodeFeedEmpty => 'Нет эпизодов, подходящих под этот фильтр';

  @override
  String get podcastFilterUpNext => 'Далее';

  @override
  String get podcastFilterNew => 'Новые';

  @override
  String get settingsPodcastTab => 'Вкладка «Подкасты»';

  @override
  String get settingsPodcastTabDesc =>
      'Вынести одну библиотеку подкастов на отдельную вкладку в нижней панели';

  @override
  String get settingsPodcastTabLibrary => 'Библиотека вкладки «Подкасты»';

  @override
  String get settingsMergeImpliedByPodcastTab =>
      'Всегда включено, пока включена вкладка «Подкасты»';

  @override
  String get settingsEpisodeNotifs => 'Настройки уведомлений';

  @override
  String get settingsEpisodeNotifsDesc =>
      'Новые эпизоды подкастов и скорые выходы книг проверяются в фоновом режиме';

  @override
  String get notifIntervalOff => 'Выкл';

  @override
  String notifIntervalMinutes(int n) {
    return 'Каждые $n мин.';
  }

  @override
  String get notifIntervalHour => 'Каждый час';

  @override
  String notifIntervalHours(int n) {
    return 'Каждые $n ч.';
  }

  @override
  String get settingsBatteryUnrestricted =>
      'Разрешить неограниченное использование батареи';

  @override
  String get settingsBatteryUnrestrictedDesc =>
      'Не даёт системе приостанавливать фоновые проверки на некоторых телефонах';

  @override
  String get appShellPressBackToExit => 'Нажмите «Назад» ещё раз, чтобы выйти';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get sectionAppearance => 'Внешний вид';

  @override
  String get languageLabel => 'Язык';

  @override
  String get languageSystemDefault => 'По умолчанию системы';

  @override
  String get languageHelpTranslateInvite =>
      'Хотите помочь перевести Absorb на ваш язык?';

  @override
  String get themeLabel => 'Тема';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeAuto => 'Авто';

  @override
  String get colorSourceLabel => 'Источник цвета';

  @override
  String get colorSourceCoverDescription =>
      'Цвета приложения следуют за обложкой текущей книги';

  @override
  String get colorSourceWallpaperDescription =>
      'Цвета приложения следуют за обоями системы';

  @override
  String get colorSourceWallpaper => 'Обои';

  @override
  String get colorSourceNowPlaying => 'Сейчас играет';

  @override
  String get colorSourceDynamic => 'Динамический';

  @override
  String get colorSourceManual => 'Вручную';

  @override
  String get colorSourceManualDescription =>
      'Использовать постоянный цвет приложения, который вы выберете ниже';

  @override
  String get colorSourceCustom => 'Свой';

  @override
  String get useColorEverywhereLabel => 'Использовать этот цвет везде';

  @override
  String get useColorEverywhereSubtitle =>
      'Также окрашивать страницы книг и карточку плеера в выбранный цвет вместо цвета обложки';

  @override
  String get flatBackgroundLabel => 'Плоский фон';

  @override
  String get flatBackgroundSubtitle =>
      'Убрать градиент фона. Чисто чёрный в тёмной теме для OLED-экранов.';

  @override
  String get einkModeLabel => 'Режим E-ink';

  @override
  String get einkModeSubtitle =>
      'Контрастный чёрно-белый вид без анимаций, для экранов E-ink';

  @override
  String get einkModeIntroBody =>
      'Создан для экранов E-ink. Приложение переключается на плоский контрастный чёрно-белый вид, анимации отключаются, у карточки воспроизведения пропадает фон, а постоянное соединение с сервером выключается для экономии батареи. Воспроизведение и прогресс по-прежнему синхронизируются. Настройки внешнего вида сохраняются и вернутся, когда вы выключите режим.';

  @override
  String get einkModeIntroConfirm => 'Включить';

  @override
  String get backgroundIntensityLabel => 'Интенсивность фона';

  @override
  String get startScreenLabel => 'Начальный экран';

  @override
  String get startScreenSubtitle =>
      'Какая вкладка открывается при запуске приложения';

  @override
  String get startScreenHome => 'Главная';

  @override
  String get startScreenLibrary => 'Библиотека';

  @override
  String get startScreenAbsorb => 'Absorb';

  @override
  String get startScreenStats => 'Статистика';

  @override
  String get disablePageFade => 'Отключить затухание страницы';

  @override
  String get disablePageFadeOnSubtitle => 'Страницы переключаются мгновенно';

  @override
  String get disablePageFadeOffSubtitle =>
      'Страницы затухают при смене вкладок';

  @override
  String get rectangleBookCovers => 'Прямоугольные обложки книг';

  @override
  String get progressTextSize => 'Размер текста прогресса';

  @override
  String get rectangleBookCoversOnSubtitle =>
      'Обложки показываются в пропорции книги 2:3';

  @override
  String get rectangleBookCoversOffSubtitle => 'Обложки квадратные';

  @override
  String get coverSize => 'Размер обложек';

  @override
  String get coverSizeSubtitle =>
      'Сколько обложек помещается в ряду сетки библиотеки';

  @override
  String get coverSizeSmall => 'Маленький';

  @override
  String get coverSizeMedium => 'Средний';

  @override
  String get coverSizeLarge => 'Большой';

  @override
  String get sectionAbsorbingCards => 'Карточки Absorbing';

  @override
  String get fullScreenPlayer => 'Полноэкранный плеер';

  @override
  String get fullScreenPlayerOnSubtitle =>
      'Вкл. - книги открываются на весь экран при воспроизведении';

  @override
  String get fullScreenPlayerOffSubtitle =>
      'Выкл. - воспроизведение в карточке';

  @override
  String get fullBookScrubber => 'Ползунок всей книги';

  @override
  String get fullBookScrubberOnSubtitle =>
      'Вкл. - ползунок перемотки по всей книге';

  @override
  String get fullBookScrubberOffSubtitle => 'Выкл. - только полоса прогресса';

  @override
  String get cardScrubbers => 'Ползунки карточки';

  @override
  String get cardScrubbersBoth => 'Оба';

  @override
  String get cardScrubbersChapter => 'Глава';

  @override
  String get cardScrubbersLocked => 'Заблокированы';

  @override
  String get cardScrubbersBothSubtitle =>
      'Перематывать можно по всей книге и по главе';

  @override
  String get cardScrubbersChapterSubtitle =>
      'Перематывать можно только по главе';

  @override
  String get cardScrubbersLockedSubtitle =>
      'Прогресс виден, перемотка недоступна';

  @override
  String get speedAdjustedTime => 'Время с учётом скорости';

  @override
  String get speedAdjustedTimeOnSubtitle =>
      'Вкл. - всё время учитывает скорость воспроизведения';

  @override
  String get speedAdjustedTimeOffSubtitle =>
      'Выкл. - показана исходная длительность аудио';

  @override
  String get buttonLayout => 'Расположение кнопок';

  @override
  String get buttonLayoutSubtitle =>
      'Как кнопки действий расположены на карточке';

  @override
  String get whenAbsorbed => 'Когда прослушано';

  @override
  String get whenAbsorbedInfoTitle => 'Когда прослушано';

  @override
  String get whenAbsorbedInfoContent =>
      'Определяет, что происходит с карточкой Absorbing, когда вы заканчиваете книгу или эпизод.\n\nПрослушанные карточки автоматически убираются с экрана Absorbing.';

  @override
  String get whenAbsorbedSubtitle =>
      'Что происходит с карточкой Absorbing, когда книга или эпизод закончились';

  @override
  String get whenAbsorbedShowOverlay => 'Показать окно';

  @override
  String get whenAbsorbedAutoRelease => 'Убирать автоматически';

  @override
  String get mergeLibraries => 'Единая страница Поглощения';

  @override
  String get mergeLibrariesInfoTitle => 'Главная Поглощающая Страница';

  @override
  String get mergeLibrariesInfoContent =>
      'Если включено, в одном окне отображаются все ваши текущие книги и подкасты из каждой библиотеки. Когда отключено, отображаются только элементы из выбранной вами библиотеки.';

  @override
  String get mergeLibrariesOnSubtitle =>
      'Показывать элементы из всех библиотек';

  @override
  String get mergeLibrariesOffSubtitle =>
      'Показывать элементы из текущей библиотеки';

  @override
  String get queueMode => 'Режим очереди';

  @override
  String get queueModeInfoTitle => 'Режим Очереди';

  @override
  String get queueModeInfoOff => 'Выкл';

  @override
  String get queueModeInfoOffDesc =>
      'Плеер остановится после текущей книги или серии.';

  @override
  String get queueModeInfoManual => 'Очередь Вручную';

  @override
  String get queueModeInfoManualDesc =>
      'Ваши поглощающие карты действуют в качестве плейлиста. По завершении одной следующая незавершённая карта запуститься автоматически. Добавьте элементы нажав на кнопку «Добавить в абсорбцию» на книге или серии и измените порядок с экрана поглощения.';

  @override
  String get queueModeOff => 'Выкл';

  @override
  String get queueModeManual => 'Вручную';

  @override
  String get queueModeAuto => 'Авто';

  @override
  String get queueModePlaylist => 'Плейлист';

  @override
  String get queueModeCollection => 'Коллекция';

  @override
  String get queueModeInfoPlaylist => 'Плейлист очереди';

  @override
  String get queueModeInfoPlaylistDesc =>
      'Воспроизведение элементов плейлиста, кроме прослушанных книг или серий. Остановка в конце списка.';

  @override
  String get queuePlaylistPickerTitle => 'Выберите плейлист';

  @override
  String get queuePlaylistNone => 'Не выбран плейлист';

  @override
  String queuePlaylistActiveLabel(String name) {
    return 'Плейлист: $name';
  }

  @override
  String get queueModePlaylistHint =>
      'Запустите плейлист очереди, открыв плейлист на главной странице.';

  @override
  String get exit => 'Выход';

  @override
  String upNext(String label) {
    return 'Далее: $label';
  }

  @override
  String get nothingUpNext => 'Далее ничего нет';

  @override
  String get showUpNextLabel => 'Показывать следующую на странице поглощения';

  @override
  String get openSeries => 'Открыть серию';

  @override
  String get openPlaylist => 'Открыть плейлист';

  @override
  String get openCollection => 'Открыть коллекцию';

  @override
  String get playlistPlayAction => 'Играть плейлист';

  @override
  String get playlistAllFinished => 'Все завершено';

  @override
  String get queueModeBooks => 'Книги';

  @override
  String get queueModePodcasts => 'Подкасты';

  @override
  String get autoDownloadQueue => 'Автозагрузка очереди';

  @override
  String get autoDownloadThisSeriesLabel => 'Автоматически скачивать эту серию';

  @override
  String get autoDownloadThisShowLabel =>
      'Автоматически скачивать этот подкаст';

  @override
  String get autoDownloadThisPlaylistLabel =>
      'Автоматически скачивать этот плейлист';

  @override
  String get autoDownloadThisCollectionLabel =>
      'Автоматически скачивать эту коллекцию';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return 'Оставить следующие $count загруженных элементов';
  }

  @override
  String get autoDownloadQueueOffSubtitle => 'Выкл. - загрузки вручную';

  @override
  String get sectionPlayback => 'Воспроизведение';

  @override
  String get sectionMediaControls => 'Управление медиа';

  @override
  String get defaultSpeed => 'Стандартная скорость';

  @override
  String get defaultSpeedSubtitle =>
      'Новые книги начинаются с этой скоростью - каждая книга сохранит эту настройку';

  @override
  String get skipBack => 'Перейти назад';

  @override
  String get skipForward => 'Перейти вперед';

  @override
  String get iosLockScreenSkipHint =>
      'На экране блокировки отображаются только числа, для которых в iOS есть значки (5, 10, 15, 30, 45, 60, 75, 90). Для других значений на кнопке показан +, но перемотка идёт по вашей настройке.';

  @override
  String get longSkipButtons => 'Кнопки длинной перемотки';

  @override
  String get longSkipButtonsOnSubtitle =>
      'Вкл. - в плеере есть вторая, большая пара кнопок перемотки';

  @override
  String get longSkipButtonsOffSubtitle =>
      'Выкл. - только обычные кнопки перемотки';

  @override
  String get longSkipBack => 'Длинная перемотка назад';

  @override
  String get longSkipForward => 'Длинная перемотка вперёд';

  @override
  String get coverShapeDefault => 'По умолчанию';

  @override
  String get coverShapeSquare => 'Квадрат';

  @override
  String get coverShapeRectangle => 'Прямоугольник';

  @override
  String get coverShapeLabel => 'Форма обложки';

  @override
  String get showSubtitles => 'Показывать подзаголовки';

  @override
  String get showSubtitlesOnSubtitle =>
      'Подзаголовки показываются под названиями книг в библиотеке и на главной';

  @override
  String get showSubtitlesOffSubtitle =>
      'Выкл. - подзаголовки только на листе сведений о книге';

  @override
  String get subtitleVisibilityLabel => 'Подзаголовки';

  @override
  String get subtitleVisibilityDefault => 'По умолчанию';

  @override
  String get subtitleVisibilityShow => 'Показывать';

  @override
  String get subtitleVisibilityHide => 'Скрывать';

  @override
  String currentLibrarySettingsTitle(String name) {
    return 'Текущая библиотека: $name';
  }

  @override
  String get currentLibrarySkipOverride => 'Свои значения перемотки';

  @override
  String get currentLibrarySkipOverrideOnSubtitle =>
      'Вкл. - эта библиотека использует свои значения перемотки';

  @override
  String get currentLibrarySkipOverrideOffSubtitle =>
      'Выкл. - эта библиотека использует общие значения перемотки';

  @override
  String get currentLibrarySpeedOverride => 'Custom default speed';

  @override
  String get currentLibrarySpeedOverrideOnSubtitle =>
      'On - new items in this library start at their own speed';

  @override
  String get currentLibrarySpeedOverrideOffSubtitle =>
      'Off - new items in this library start at the global default speed';

  @override
  String get currentLibrarySpeed => 'Default speed';

  @override
  String get currentLibrarySkipBack => 'Перемотка назад';

  @override
  String get currentLibrarySkipForward => 'Перемотка вперёд';

  @override
  String get chapterProgressInNotification =>
      'Прогресс главы в уведомлении и в Android Auto';

  @override
  String get chapterProgressOnSubtitle =>
      'Вкл. - уведомление и Android Auto покажут прогресс главы';

  @override
  String get chapterProgressOffSubtitle =>
      'Выкл. - они покажут прогресс всей книги';

  @override
  String get chapterProgressInNotificationIos =>
      'Прогресс главы на экране блокировки и CarPlay';

  @override
  String get chapterProgressOnSubtitleIos =>
      'Вкл. - блокировка экрана и CarPlay покажут прогресс главы';

  @override
  String get chapterProgressInNowPlayingBar =>
      'Chapter progress in now playing bar';

  @override
  String get chapterProgressInNowPlayingBarOnSubtitle =>
      'On - the bottom player shows current chapter progress';

  @override
  String get chapterProgressInNowPlayingBarOffSubtitle =>
      'Off - the bottom player shows full book progress';

  @override
  String get nowPlayingText => 'Текст «Сейчас играет»';

  @override
  String get nowPlayingTextSubtitle =>
      'Выберите, что элементы управления медиа показывают в каждой строке';

  @override
  String get nowPlayingTopLine => 'Верхняя строка';

  @override
  String get nowPlayingSecondLine => 'Вторая строка';

  @override
  String get nowPlayingNotShown => 'Не показывать';

  @override
  String get nowPlayingTopLineRequired =>
      'В верхней строке должен быть хотя бы один элемент';

  @override
  String get nowPlayingPieceChapter => 'Глава';

  @override
  String get nowPlayingPieceTitle => 'Название книги';

  @override
  String get nowPlayingPieceNarrator => 'Чтец';

  @override
  String get nowPlayingPieceSeries => 'Серия';

  @override
  String get nowPlayingPiecePercent => 'Процент книги';

  @override
  String get nowPlayingPieceChapterNumber => 'Номер главы';

  @override
  String get nowPlayingPieceTimeLeft => 'Осталось времени';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return 'Гл. $number/$total';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return 'Осталось $time';
  }

  @override
  String get bookDockBadgePending => 'Ожидает';

  @override
  String get bookDockBadgeExtracting => 'Чтение файла';

  @override
  String get bookDockBadgeFetching => 'Поиск данных';

  @override
  String get bookDockBadgeError => 'Ошибка';

  @override
  String get bookDockNeedsReview => 'Нужна проверка';

  @override
  String get bookDockNoMatch => 'Нет совпадений';

  @override
  String get bookDockApplied => 'Применено';

  @override
  String get bookDockNotApplied => 'Найденные данные не использованы';

  @override
  String get bookDockNoDestination => 'Место назначения не задано';

  @override
  String get bookDockNoAuthor => 'Автор пока не указан';

  @override
  String get bookDockLookUpAgain => 'Найти снова';

  @override
  String get bookDockLookingUp => 'Повторный поиск данных';

  @override
  String get bookDockLookUpFailed => 'Не удалось найти данные';

  @override
  String get bookDockProposedChanges => 'Предлагаемые изменения';

  @override
  String get bookDockNoChanges => 'Данные в интернете пока не найдены';

  @override
  String get bookDockStillReading => 'Сервер ещё читает этот файл';

  @override
  String get bookDockRoleBook => 'Книга';

  @override
  String get bookDockRoleCover => 'Обложка';

  @override
  String get bookDockRoleMetadata => 'Метаданные';

  @override
  String get bookDockRoleExtra => 'Дополнительно';

  @override
  String get bookDockFieldTitle => 'Название';

  @override
  String get bookDockFieldSubtitle => 'Подзаголовок';

  @override
  String get bookDockFieldAuthors => 'Авторы';

  @override
  String get bookDockFieldSeries => 'Серия';

  @override
  String get bookDockFieldPublisher => 'Издатель';

  @override
  String get bookDockFieldYear => 'Год';

  @override
  String get bookDockFieldLanguage => 'Язык';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return 'Совпадение $percent%';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return 'Попадёт в $library';
  }

  @override
  String bookDockChangedFields(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count поля',
      many: '$count полей',
      few: '$count поля',
      one: '$count поле',
    );
    return '$_temp0';
  }

  @override
  String bookDockFilesInEntry(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла в этой записи',
      many: '$count файлов в этой записи',
      few: '$count файла в этой записи',
      one: '$count файл в этой записи',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return 'Добавлено $date';
  }

  @override
  String get bookDockAddToLibrary => 'Добавить в библиотеку';

  @override
  String get bookDockUseFound => 'Использовать найденные данные';

  @override
  String get bookDockRemoveTitle => 'Удалить из Book Dock?';

  @override
  String get bookDockRemoveFailed => 'Не удалось удалить этот файл';

  @override
  String get bookDockPickLibrary => 'В какую библиотеку добавить?';

  @override
  String get bookDockNoLibraries =>
      'Ваша учётная запись не может добавлять книги в библиотеку';

  @override
  String get bookDockFileFailed => 'Не удалось добавить этот файл в библиотеку';

  @override
  String get bookDockDuplicateBody =>
      'Файл с таким именем уже есть в этой библиотеке. Удалить его из Book Dock?';

  @override
  String get bookDockDetailsUpdated => 'Данные обновлены';

  @override
  String get bookDockUseFoundFailed => 'Нет найденных данных для использования';

  @override
  String bookDockRemoveBody(String title) {
    return '«$title» будет удалено с сервера.';
  }

  @override
  String bookDockRemoved(String title) {
    return '«$title» удалено из Book Dock';
  }

  @override
  String bookDockFiled(String title, String library) {
    return '«$title» добавлено в $library';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return 'Не удалось добавить этот файл: $reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return 'Уже есть в $library';
  }

  @override
  String get bomatchSearchAll => 'Искать во всех источниках';

  @override
  String get bomatchSearching => 'Поиск...';

  @override
  String get bomatchSearchFailed =>
      'Не удалось выполнить поиск совпадений. Проверьте соединение и попробуйте снова.';

  @override
  String get bomatchNoResults => 'Совпадений не найдено';

  @override
  String get bomatchStrong => 'Точные совпадения';

  @override
  String get bomatchPossible => 'Возможные совпадения';

  @override
  String get bomatchSourceTimeout => 'время вышло';

  @override
  String get bomatchSourceBusy => 'занят';

  @override
  String get bomatchSourceFailed => 'сбой';

  @override
  String get bomatchLinked => 'Связано';

  @override
  String get bomatchSameIsbn => 'Тот же ISBN';

  @override
  String get bomatchFewDetails => 'Мало данных';

  @override
  String get bomatchBack => 'Все результаты';

  @override
  String get bomatchFillEmpty => 'Заполнить пустые';

  @override
  String get bomatchTakeAll => 'Взять все';

  @override
  String get bomatchOnlyDifferences => 'Только отличия';

  @override
  String get bomatchNow => 'Сейчас';

  @override
  String get bomatchEmpty => 'Пусто';

  @override
  String get bomatchKindNew => 'Новое';

  @override
  String get bomatchKindChange => 'Изменение';

  @override
  String get bomatchKindSmall => 'Небольшое изменение';

  @override
  String get bomatchKindSame => 'Без изменений';

  @override
  String get bomatchKindNone => 'Нет в результате';

  @override
  String get bomatchKeep => 'Оставить';

  @override
  String get bomatchUse => 'Использовать';

  @override
  String get bomatchMerge => 'Объединить';

  @override
  String get bomatchReplace => 'Заменить';

  @override
  String get bomatchUseThis => 'Выбрать это';

  @override
  String get bomatchChosen => 'Выбрано';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count другой книги',
      many: '$count других книг',
      few: '$count другие книги',
      one: '$count другая книга',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изменения',
      many: '$count изменений',
      few: '$count изменения',
      one: '$count изменение',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count новых',
      many: '$count новых',
      few: '$count новых',
      one: '$count новое',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Применить $count изменения',
      many: 'Применить $count изменений',
      few: 'Применить $count изменения',
      one: 'Применить $count изменение',
      zero: 'Применить',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count другого источника',
      many: '$count других источников',
      few: '$count других источника',
      one: '$count другой источник',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return 'Из источника: $source';
  }

  @override
  String get breqTitle => 'Запросы книг';

  @override
  String get breqTabRequest => 'Запросить книгу';

  @override
  String get breqTabMine => 'Мои запросы';

  @override
  String get breqTabAll => 'Все запросы';

  @override
  String get breqNoAccess =>
      'Ваша учётная запись не может запрашивать книги на этом сервере.';

  @override
  String get breqTitleHint => 'Название книги';

  @override
  String get breqAuthorHint => 'Автор';

  @override
  String get breqKindAudiobook => 'Аудиокнига';

  @override
  String get breqKindEbook => 'Электронная книга';

  @override
  String get breqKindComic => 'Комикс';

  @override
  String get breqSearch => 'Поиск';

  @override
  String get breqSearching => 'Поиск...';

  @override
  String get breqSearchFailed =>
      'Не удалось выполнить поиск. Проверьте соединение и попробуйте снова.';

  @override
  String get breqSearchPrompt =>
      'Найдите книгу, которой ещё нет в библиотеке, чтобы запросить её.';

  @override
  String get breqNoResults => 'Подходящих книг не найдено';

  @override
  String get breqInLibrary => 'В вашей библиотеке';

  @override
  String get breqYouAsked => 'Вы запросили это';

  @override
  String get breqSomeoneAsked => 'Уже запрошено кем-то другим';

  @override
  String get breqView => 'Открыть';

  @override
  String get breqRequest => 'Запросить';

  @override
  String get breqRequested => 'Запрошено';

  @override
  String get breqAddMeToo => 'Добавить и меня';

  @override
  String get breqLibrary => 'Библиотека';

  @override
  String get breqLibraryApprover => 'Пусть решит одобряющий';

  @override
  String get breqLibraryChoose => 'Выберите библиотеку';

  @override
  String get breqNote => 'Заметка для одобряющего';

  @override
  String get breqNoteHint => 'Всё, что стоит знать об этом запросе';

  @override
  String get breqAutoApproved => 'Ваши запросы одобряются сразу.';

  @override
  String get breqSubmitted => 'Запрос отправлен';

  @override
  String get breqJoined => 'Вы добавлены в существующий запрос';

  @override
  String get breqFailed => 'Не удалось отправить запрос';

  @override
  String get breqStatusPending => 'Ожидает';

  @override
  String get breqStatusApproved => 'Одобрено';

  @override
  String get breqStatusRejected => 'Отклонено';

  @override
  String get breqStatusCancelled => 'Отменено';

  @override
  String get breqStatusSearching => 'Поиск';

  @override
  String get breqStatusGrabbed => 'Релиз найден';

  @override
  String get breqStatusDownloading => 'Скачивается';

  @override
  String get breqStatusImporting => 'Импорт';

  @override
  String get breqStatusNeedsReview => 'Нужна проверка';

  @override
  String get breqStatusAvailable => 'Доступно';

  @override
  String get breqStatusFailed => 'Сбой';

  @override
  String get breqWaitingApproval => 'Ожидает одобрения';

  @override
  String get breqWaitingRelease => 'Ожидает выбора релиза';

  @override
  String get breqLookingForRelease => 'Поиск релиза';

  @override
  String get breqStartingDownload => 'Запуск загрузки';

  @override
  String get breqAddingToLibrary => 'Добавление в библиотеку';

  @override
  String get breqWaitingCheck => 'Ожидает ручной проверки';

  @override
  String get breqReady => 'Готово в вашей библиотеке';

  @override
  String get breqSomethingWrong => 'Что-то пошло не так';

  @override
  String get breqShowHidden => 'Показать скрытые';

  @override
  String get breqHidden => 'Скрыто';

  @override
  String get breqMineEmpty => 'Вы ещё не запрашивали книги.';

  @override
  String get breqAllEmpty => 'Запросов пока нет.';

  @override
  String get breqLoadFailed => 'Не удалось загрузить запросы.';

  @override
  String get breqLoadMore => 'Загрузить ещё';

  @override
  String get breqApprove => 'Одобрить';

  @override
  String get breqReject => 'Отклонить';

  @override
  String get breqCancel => 'Отменить запрос';

  @override
  String get breqHide => 'Скрыть из моего списка';

  @override
  String get breqUnhide => 'Показать в моём списке';

  @override
  String get breqLeave => 'Выйти из запроса';

  @override
  String get breqDelete => 'Удалить запрос';

  @override
  String get breqOpenBook => 'Открыть книгу';

  @override
  String get breqCancelConfirm =>
      'Отменить этот запрос? Идущая загрузка тоже остановится.';

  @override
  String get breqDeleteConfirm => 'Удалить этот запрос? Это нельзя отменить.';

  @override
  String get breqRejectTitle => 'Отклонить запрос';

  @override
  String get breqRejectReason => 'Причина (необязательно)';

  @override
  String get breqApproveTitle => 'Одобрить запрос';

  @override
  String get breqApproveLibraryNeeded =>
      'Выберите библиотеку, в которую попадёт эта книга.';

  @override
  String get breqApprovedToast => 'Запрос одобрен';

  @override
  String get breqRejectedToast => 'Запрос отклонён';

  @override
  String get breqCancelledToast => 'Запрос отменён';

  @override
  String get breqHiddenToast => 'Скрыто из вашего списка';

  @override
  String get breqRestoredToast => 'Снова в вашем списке';

  @override
  String get breqDeletedToast => 'Запрос удалён';

  @override
  String get breqLeftToast => 'Вы вышли из этого запроса';

  @override
  String get breqActionFailed => 'Не удалось обновить запрос';

  @override
  String get breqFactRequestedBy => 'Запросил';

  @override
  String get breqFactRequestedOn => 'Дата запроса';

  @override
  String get breqFactLibrary => 'Библиотека';

  @override
  String get breqFactDecidedBy => 'Решение принял';

  @override
  String get breqFactNote => 'Заметка запросившего';

  @override
  String get breqFactDecisionNote => 'Заметка к решению';

  @override
  String get breqFactAlsoWanted => 'Также хотят';

  @override
  String get breqLibraryCta => 'Запросить книгу';

  @override
  String get breqSettingsSubtitle =>
      'Запрашивайте книги, которых ещё нет в библиотеке';

  @override
  String get navHoldBookRequests => 'Запросы книг';

  @override
  String breqLibraryDefault(String library) {
    return 'По умолчанию ($library)';
  }

  @override
  String breqFailedReason(String reason) {
    return 'Не удалось отправить запрос: $reason';
  }

  @override
  String breqBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      many: '$count книг',
      few: '$count книги',
      one: '$count книга',
    );
    return '$_temp0';
  }

  @override
  String breqDownloadingPercent(int percent) {
    return 'Скачивается, $percent%';
  }

  @override
  String breqAddedTo(String library) {
    return 'Добавлено в $library';
  }

  @override
  String breqRejectedWithNote(String note) {
    return 'Отклонено: $note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return 'Сбой: $reason';
  }

  @override
  String breqRequestedBy(String name) {
    return 'Запросил $name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return 'Не удалось обновить запрос: $reason';
  }

  @override
  String breqFooterCta(String query) {
    return 'Запросить «$query»';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count запроса',
      many: '$count запросов',
      few: '$count запроса',
      one: '$count запрос',
      zero: 'Нет запросов',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => 'Найти релиз';

  @override
  String get breqTryAnotherRelease => 'Попробовать другой релиз';

  @override
  String get breqApproveAndFind => 'Одобрить и найти релиз';

  @override
  String get breqReviewButton => 'Проверить загрузку';

  @override
  String get breqStopDownload => 'Остановить загрузку';

  @override
  String get breqStopDownloadConfirm =>
      'Остановить эту загрузку? Запрос вернётся в статус «Одобрено», и можно будет выбрать другой релиз.';

  @override
  String get breqDiscardImport => 'Отбросить загрузку';

  @override
  String get breqDiscardConfirm =>
      'Отбросить эту загрузку? Запрос будет помечен как неудавшийся, и его можно повторить с другим релизом.';

  @override
  String get breqFileAnyway => 'Добавить в библиотеку';

  @override
  String get breqFiledToast => 'Добавлено в библиотеку';

  @override
  String get breqDiscardedToast => 'Загрузка отброшена';

  @override
  String get breqStoppedToast => 'Загрузка остановлена';

  @override
  String get breqGrabTitle => 'Скачать этот релиз?';

  @override
  String get breqGrab => 'Скачать';

  @override
  String get breqGrabbed => 'Загрузка начата';

  @override
  String get breqGrabFailed => 'Не удалось начать эту загрузку';

  @override
  String get breqReleaseVipWarning =>
      'Этот трекер разрешает скачивание только VIP-аккаунтам.';

  @override
  String get breqReleaseNoBookFile =>
      'В этом релизе нет файла книги, который BookOrbit мог бы добавить в библиотеку.';

  @override
  String get breqReleaseCheckFailed =>
      'Не удалось проверить содержимое релиза. Попробуйте снова или выберите другой.';

  @override
  String get breqCheckingRelease => 'Проверка файлов...';

  @override
  String get breqSearchAgain => 'Искать снова';

  @override
  String get breqSearchTerms => 'Условия поиска';

  @override
  String get breqIsbnHint =>
      'Оставьте пустым, чтобы искать по названию и автору';

  @override
  String get breqSearchingIndexers =>
      'Поиск по вашим индексаторам. Это может занять до минуты.';

  @override
  String get breqReleasesFailed => 'Не удалось выполнить поиск релизов.';

  @override
  String get breqNoSourcesSetUp => 'В BookOrbit не настроены источники поиска.';

  @override
  String get breqNoSourcesOn => 'В BookOrbit все источники поиска отключены.';

  @override
  String get breqNoSourceCarries =>
      'Ни один из ваших источников поиска не содержит книг такого типа.';

  @override
  String get breqNoReleases =>
      'Релизов не найдено. Попробуйте другие условия поиска.';

  @override
  String get breqFromCache => 'из недавнего поиска';

  @override
  String get breqIndexerUnauthorized => 'вход не удался';

  @override
  String get breqIndexerThrottled => 'занят';

  @override
  String get breqIndexerTimeout => 'время вышло';

  @override
  String get breqIndexerUnreachable => 'недоступен';

  @override
  String get breqIndexerNoMedium => 'не содержит такого';

  @override
  String get breqIndexerError => 'сбой';

  @override
  String get breqSortBest => 'Лучшее совпадение';

  @override
  String get breqSortSeeders => 'Сиды';

  @override
  String get breqSortSize => 'Размер';

  @override
  String get breqSortNewest => 'Сначала новые';

  @override
  String get breqFreeleech => 'Freeleech';

  @override
  String get breqVipOnly => 'Только VIP';

  @override
  String get breqAlreadyGrabbed => 'Скачивалось раньше';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => 'Название';

  @override
  String get breqReasonAuthor => 'Автор';

  @override
  String get breqReasonUnknownFormat => 'Неизвестный формат';

  @override
  String get breqReasonExpectedSize => 'Размер';

  @override
  String get breqReasonSuspiciousSize => 'Необычный размер';

  @override
  String get breqReasonFreeleech => 'Freeleech';

  @override
  String get breqReasonSeveralBooks => 'Несколько книг';

  @override
  String get breqReviewTitle => 'Загрузка ожидает проверки';

  @override
  String get breqReviewFailed => 'Не удалось загрузить сведения о загрузке.';

  @override
  String get breqReviewDockGone => 'Скачанных файлов больше нет в Book Dock.';

  @override
  String get breqReviewNoLibrary =>
      'У этого запроса нет библиотеки, куда можно добавить книгу.';

  @override
  String breqGrabFailedReason(String reason) {
    return 'Не удалось начать эту загрузку: $reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return 'Не удалось проверить содержимое релиза: $reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return 'Не удалось выполнить поиск релизов: $reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return 'Не удалось загрузить сведения о загрузке: $reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count релиза',
      many: '$count релизов',
      few: '$count релиза',
      one: '$count релиз',
      zero: 'Нет релизов',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return 'Сидов: $seeders, личей: $leechers';
  }

  @override
  String breqScore(int score) {
    return 'Оценка $score';
  }

  @override
  String breqReasonPreferredFormat(String format) {
    return 'Предпочтительный формат: $format';
  }

  @override
  String breqReasonFormat(String format) {
    return '$format';
  }

  @override
  String breqReasonSeeders(String count) {
    return 'Сидов: $count';
  }

  @override
  String breqReviewScore(int score, int threshold) {
    return 'Оценка совпадения: $score. Загрузки с оценкой $threshold и выше добавляются автоматически.';
  }

  @override
  String breqReviewRequested(String value) {
    return 'Запрошено: $value';
  }

  @override
  String breqReviewImported(String value) {
    return 'Скачано: $value';
  }

  @override
  String get breqKindBoth => 'Обе';

  @override
  String get breqEbookLibrary => 'Библиотека электронных книг';

  @override
  String get breqAudiobookLibrary => 'Библиотека аудиокниг';

  @override
  String get breqRequestBoth => 'Запросить обе';

  @override
  String get breqAddMeToBoth => 'Добавить меня в оба';

  @override
  String get breqRequestEbook => 'Запросить электронную книгу';

  @override
  String get breqRequestAudiobook => 'Запросить аудиокнигу';

  @override
  String get breqAddMeEbook => 'Добавить меня в запрос электронной книги';

  @override
  String get breqAddMeAudiobook => 'Добавить меня в запрос аудиокниги';

  @override
  String get breqPairSubmitted => 'Запрошены электронная книга и аудиокнига';

  @override
  String get breqPairOneJoined =>
      'Запрошены обе. Один из запросов уже выполнялся, поэтому вы добавлены в него';

  @override
  String get breqJoinedBoth => 'Вы добавлены в оба запроса';

  @override
  String get breqJoinsOwned =>
      'Запрошено. Присоединится к копии, которая уже есть в вашей библиотеке';

  @override
  String get speedBookmarkInControls =>
      'Скорость и закладки в панели управления медиа';

  @override
  String get speedBookmarkOnSubtitle =>
      'Вкл. - уведомление покажет скорость и закладку; в Android Auto переключатели глав';

  @override
  String get speedBookmarkOffSubtitle =>
      'Выкл. - в уведомлении переключатели глав; в Android Auto скорость и закладка';

  @override
  String get lockSeekBar => 'Заблокировать ползунок на панели';

  @override
  String get lockSeekBarOnSubtitle =>
      'Вкл. - уведомление покажет прогресс, на экране блокировки и Android Auto, но ползунок переместить невозможно';

  @override
  String get lockSeekBarOffSubtitle =>
      'Выкл. - ползунок прогресса перемещается в уведомлении, на экране блокировки и Android Auto';

  @override
  String get autoRewindOnResume => 'Автоперемотка при возобновлении';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return 'Вкл. - от $min до $max с в зависимости от длины паузы';
  }

  @override
  String get autoRewindOffSubtitle => 'Выкл';

  @override
  String get rewindRange => 'Диапазон перемотки';

  @override
  String get rewindAfterPausedFor => 'Перематывать после паузы';

  @override
  String get rewindAnyPause => 'Любая пауза';

  @override
  String get rewindAlwaysLabel => 'Всегда';

  @override
  String get rewindAlwaysDescription =>
      'Перематывает при каждом возобновлении, даже после коротких перерывов';

  @override
  String rewindAfterDescription(String seconds) {
    return 'Перематывает, только если пауза длилась $seconds+ с';
  }

  @override
  String get chapterBarrier => 'Граница главы';

  @override
  String get chapterBarrierSubtitle =>
      'Не перематывать автоматически за начало текущей главы';

  @override
  String get rewindInstant => 'Сразу';

  @override
  String rewindPause(String duration) {
    return 'Пауза $duration';
  }

  @override
  String get rewindNoRewind => 'без перемотки';

  @override
  String rewindSeconds(String seconds) {
    return 'перемотка $seconds с';
  }

  @override
  String get sectionSleepTimer => 'Таймер сна';

  @override
  String get sleep => 'Сон';

  @override
  String get sleepTimer => 'Таймер сна';

  @override
  String get shakeDuringSleepTimer => 'Встряхивание при таймере сна';

  @override
  String get shakeOff => 'Выкл';

  @override
  String get shakeAddTime => 'Добавить время';

  @override
  String get shakeReset => 'Сбросить';

  @override
  String get shakeAdds => 'Встряхивание добавляет';

  @override
  String get sleepAddAmount => 'Сколько времени добавлять';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes мин';
  }

  @override
  String get shakeSensitivity => 'Чувствительность встряхивания';

  @override
  String get shakeSensitivityVeryLow => 'Очень низкая';

  @override
  String get shakeSensitivityLow => 'Низкая';

  @override
  String get shakeSensitivityMedium => 'Средняя';

  @override
  String get shakeSensitivityHigh => 'Высокая';

  @override
  String get shakeSensitivityVeryHigh => 'Очень высокая';

  @override
  String get buttonDuringSleepTimer => 'Кнопка наушников при затухании';

  @override
  String get buttonDuringSleepTimerHint =>
      'В последние моменты затухания одно нажатие сбрасывает таймер вместо паузы. Двойное нажатие по-прежнему пропускает.';

  @override
  String get resetTimerOnPause => 'Сбрасывать таймер при паузе';

  @override
  String get resetTimerOnPauseOnSubtitle =>
      'Таймер начнётся заново с полной длительности при возобновлении';

  @override
  String get resetTimerOnPauseOffSubtitle =>
      'Таймер продолжит с того места, где остановился';

  @override
  String get fadeVolumeBeforeSleep => 'Затухание громкости перед сном';

  @override
  String get fadeVolumeOnSubtitle =>
      'Плавно снижает громкость в последние 30 секунд';

  @override
  String get fadeVolumeOffSubtitle =>
      'Воспроизведение останавливается сразу, когда таймер заканчивается';

  @override
  String get autoSleepTimer => 'Автотаймер сна';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration мин';
  }

  @override
  String get autoSleepTimerOffSubtitle =>
      'Автоматически запускать таймер сна в заданный промежуток времени';

  @override
  String get windowStart => 'Начало промежутка';

  @override
  String get windowEnd => 'Конец промежутка';

  @override
  String get timerDuration => 'Длительность таймера';

  @override
  String get timer => 'Таймер';

  @override
  String get endOfChapter => 'Конец главы';

  @override
  String startMinTimer(int minutes) {
    return 'Запустить таймер на $minutes мин';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return 'Остановить через $count $label';
  }

  @override
  String get addMoreTime => 'Добавить времени';

  @override
  String get cancelTimer => 'Отменить таймер';

  @override
  String chaptersLeftCount(int count) {
    return 'Осталось глав: $count';
  }

  @override
  String get sectionDownloadsAndStorage => 'Загрузки и хранилище';

  @override
  String get downloadOverWifiOnly => 'Сеть для загрузки';

  @override
  String get downloadOverWifiOnSubtitle => 'Только Wi-Fi';

  @override
  String get downloadOverWifiOffSubtitle => 'Любое соединение';

  @override
  String get autoDownloadOnWifi => 'Автоматически скачивать начатые книги';

  @override
  String get autoDownloadOnWifiInfoTitle =>
      'Автоматическая загрузка начатых книг';

  @override
  String get autoDownloadOnWifiInfoContent =>
      'Когда вы начинаете слушать книгу в потоке, вся книга скачивается в фоновом режиме, и вам не нужно запускать загрузку самим, чтобы слушать без интернета. Эти загрузки учитывают настройку «Сеть для загрузки» выше, поэтому выберите «Любое соединение», если хотите, чтобы они шли и по мобильным данным.';

  @override
  String get autoDownloadOnWifiOnSubtitle =>
      'Книги из потока автоматически скачиваются в фоновом режиме';

  @override
  String get autoDownloadOnWifiOffSubtitle => 'Выкл';

  @override
  String get concurrentDownloads => 'Одновременные загрузки';

  @override
  String get autoDownload => 'Автозагрузка';

  @override
  String get autoDownloadSubtitle =>
      'Включается для серии, подкаста, плейлиста или коллекции на их страницах';

  @override
  String get autoDownloadEnabledFor => 'Включено для';

  @override
  String get autoDownloadEnabledForNone => 'Пока ничего';

  @override
  String get autoDownloadSourceUnnamed => 'Ещё не загружено';

  @override
  String get keepNext => 'Хранить следующие';

  @override
  String get keepNextInfoTitle => 'Хранить следующие';

  @override
  String get keepNextInfoContent =>
      'Количество элементов, которые остаются скачанными, включая тот, который вы слушаете сейчас. Например, «Хранить следующие 3» означает, что текущая книга и ещё 2 следующие в этой серии, подкасте, плейлисте или коллекции останутся скачанными. Это относится ко всем включённым автозагрузкам.';

  @override
  String get deleteAbsorbedDownloads => 'Удалять прослушанные загрузки';

  @override
  String get deleteAbsorbedDownloadsInfoTitle =>
      'Удалять прослушанные загрузки';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      'Когда включено, скачанные книги и эпизоды автоматически удаляются с этого устройства после того, как вы дослушали их в Absorb. Если вы дослушали элемент в вебе или на другом устройстве, его загрузка здесь не удаляется.';

  @override
  String get deleteAbsorbedOnSubtitle =>
      'Прослушанное удаляется, чтобы освободить место';

  @override
  String get deleteAbsorbedOffSubtitle =>
      'Выкл. - прослушанные загрузки сохраняются';

  @override
  String get downloadLocation => 'Место загрузки';

  @override
  String get storageUsed => 'Занято в хранилище';

  @override
  String storageUsedByDownloads(String size) {
    return 'Загрузки занимают $size';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return 'Свободно $free из $total';
  }

  @override
  String get manageDownloads => 'Управление загрузками';

  @override
  String get streamingCache => 'Кэш потока';

  @override
  String get streamingCacheInfoTitle => 'Кэш потока';

  @override
  String get streamingCacheInfoContent =>
      'Сохраняет аудио из потока на диск, чтобы не загружать его заново, если вы перемотаете назад или послушаете фрагменты ещё раз. Кэшем управляет приложение: когда достигнут лимит размера, самые старые файлы удаляются. Он не связан с полностью скачанными книгами.';

  @override
  String get streamingCacheOff => 'Выкл';

  @override
  String get streamingCacheOffSubtitle =>
      'Выкл. - аудио воспроизводится без кэширования';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size MB - недавно прослушанное аудио из потока кэшируется на диск';
  }

  @override
  String get clearCache => 'Очистить кэш';

  @override
  String get streamingCacheCleared => 'Кэш потока очищен';

  @override
  String get sectionLibrary => 'Библиотека';

  @override
  String get hideEbookOnlyTitles => 'Скрывать только электронные книги';

  @override
  String get hideEbookOnlyOnSubtitle => 'Книги без аудиофайлов скрыты';

  @override
  String get hideEbookOnlyOffSubtitle =>
      'Выкл. - показаны все элементы библиотеки';

  @override
  String get audibleRatings => 'Audible ratings';

  @override
  String get audibleRatingsOnSubtitle =>
      'On - book details show the Audible rating';

  @override
  String get audibleRatingsOffSubtitle => 'Off - no Audible lookup or stars';

  @override
  String get homeCardsOpenDetails => 'Открывать сведения с главной';

  @override
  String get homeCardsOpenDetailsOnSubtitle =>
      'Нажатие на карточку «Продолжить слушать» или «Продолжить чтение» открывает сведения';

  @override
  String get homeCardsOpenDetailsOffSubtitle =>
      'Нажатие на карточку «Продолжить слушать» или «Продолжить чтение» продолжает с того места, где вы остановились';

  @override
  String get showGoodreadsButton => 'Показывать кнопку Goodreads';

  @override
  String get showGoodreadsOnSubtitle =>
      'На листе сведений о книге есть ссылка на Goodreads';

  @override
  String get showGoodreadsOffSubtitle => 'Выкл. - кнопка Goodreads скрыта';

  @override
  String get sectionPermissions => 'Разрешения';

  @override
  String get notifications => 'Уведомления';

  @override
  String get notificationsSubtitle =>
      'Для хода загрузки и управления воспроизведением';

  @override
  String get notificationsAlreadyEnabled => 'Уведомления уже включены';

  @override
  String get unrestrictedBattery => 'Без ограничений батареи';

  @override
  String get unrestrictedBatterySubtitle =>
      'Не даёт Android закрывать фоновое воспроизведение';

  @override
  String get batteryAlreadyUnrestricted => 'Ограничения батареи уже сняты';

  @override
  String get sectionIssuesAndSupport => 'Проблемы и поддержка';

  @override
  String get bugsAndFeatureRequests => 'Ошибки и пожелания';

  @override
  String get bugsAndFeatureRequestsSubtitle => 'Создать обращение на GitHub';

  @override
  String get joinDiscord => 'Присоединиться к Discord';

  @override
  String get joinDiscordSubtitle => 'Сообщество, поддержка и новости';

  @override
  String get contact => 'Связаться';

  @override
  String get contactSubtitle => 'Отправить сведения об устройстве по почте';

  @override
  String get enableLogging => 'Вести журнал';

  @override
  String get enableLoggingOnSubtitle =>
      'Вкл. - журналы сохраняются в файл (требуется перезапуск)';

  @override
  String get enableLoggingOffSubtitle => 'Выкл. - журналы не ведутся';

  @override
  String get loggingEnabledSnackbar =>
      'Журнал включён - перезапустите приложение, чтобы начать запись';

  @override
  String get loggingDisabledSnackbar =>
      'Журнал отключён - перезапустите приложение, чтобы остановить запись';

  @override
  String get sendLogs => 'Отправить журналы';

  @override
  String get sendLogsSubtitle => 'Поделиться файлом журнала как вложением';

  @override
  String failedToShare(String error) {
    return 'Не удалось поделиться: $error';
  }

  @override
  String get clearLogs => 'Очистить журналы';

  @override
  String get logsCleared => 'Журналы очищены';

  @override
  String get clearLogsQuestion => 'Очистить журналы?';

  @override
  String get clearLogsContent =>
      'Это нельзя отменить. Сначала отправьте их, если они могут понадобиться.';

  @override
  String get sectionAdvanced => 'Расширенные';

  @override
  String get localServer => 'Локальный сервер';

  @override
  String get localServerInfoTitle => 'Локальный сервер';

  @override
  String get localServerInfoContent =>
      'Если вы запускаете сервер Audiobookshelf дома, здесь можно задать локальный адрес (LAN). Absorb автоматически переключится на более быстрое локальное подключение, когда определит, что вы в домашней сети, и вернётся к удалённому адресу, когда вы уйдёте.';

  @override
  String get localServerOnConnectedSubtitle =>
      'Подключено через локальный сервер';

  @override
  String get localServerOnRemoteSubtitle =>
      'Включено - используется удалённый сервер';

  @override
  String get localServerOffSubtitle =>
      'Автоматически переключаться на сервер в локальной сети в домашнем Wi-Fi';

  @override
  String get localServerUrlLabel => 'Адрес локального сервера';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar =>
      'Адрес локального сервера задан - подключение будет происходить автоматически в вашей домашней сети';

  @override
  String get disableAudioFocus => 'Отключить аудиофокус';

  @override
  String get disableAudioFocusInfoTitle => 'Аудиофокус';

  @override
  String get disableAudioFocusInfoContent =>
      'По умолчанию Android даёт «фокус» звука одному приложению за раз: когда играет Absorb, другое аудио (музыка, видео) ставится на паузу. Если отключить аудиофокус, Absorb сможет играть одновременно с другими приложениями. Телефонные звонки в любом случае приостановят воспроизведение.';

  @override
  String get disableAudioFocusOnSubtitle =>
      'Вкл. - играет вместе с другим аудио (на звонки по-прежнему ставится пауза)';

  @override
  String get disableAudioFocusOffSubtitle =>
      'Выкл. - другое аудио ставится на паузу, когда играет Absorb';

  @override
  String get restartRequired => 'Требуется перезапуск';

  @override
  String get restartRequiredContent =>
      'Чтобы изменение аудиофокуса вступило в силу, нужен полный перезапуск. Закрыть приложение сейчас?';

  @override
  String get closeApp => 'Закрыть приложение';

  @override
  String get trustAllCertificates => 'Доверять всем сертификатам';

  @override
  String get trustAllCertificatesInfoTitle => 'Самоподписанные сертификаты';

  @override
  String get mp3IndexSeeking => 'Перемотка MP3 по индексу';

  @override
  String get mp3IndexSeekingInfoTitle => 'Перемотка MP3 по индексу';

  @override
  String get mp3IndexSeekingInfoContent =>
      'Включайте, только если в ваших MP3-файлах перемотка попадает не в то место. Неточная перемотка обычно бывает у MP3 с переменным битрейтом (VBR). Перемотка по индексу строит точную карту времени по мере чтения файла, поэтому переход ближе к концу большого MP3 может занять время, особенно при потоковом воспроизведении, ведь файл нужно прочитать до этого места. Вступает в силу при следующем запуске книги или эпизода подкаста.';

  @override
  String get mp3IndexSeekingOnSubtitle =>
      'Вкл. - точная перемотка для MP3 с VBR';

  @override
  String get mp3IndexSeekingOffSubtitle => 'Выкл. - обычная перемотка';

  @override
  String get trustAllCertificatesInfoContent =>
      'Включите, если ваш сервер Audiobookshelf использует самоподписанный сертификат или собственный корневой центр сертификации. Когда включено, Absorb пропускает проверку TLS-сертификатов для всех подключений. Включайте, только если доверяете своей сети.';

  @override
  String get trustAllCertificatesOnSubtitle =>
      'Вкл. - принимаются все сертификаты';

  @override
  String get trustAllCertificatesOffSubtitle =>
      'Выкл. - принимаются только доверенные сертификаты';

  @override
  String get supportTheDev => 'Поддержать разработчика';

  @override
  String get buyMeACoffee => 'Угостить автора кофе';

  @override
  String appVersionFormat(String version) {
    return 'Absorb v$version';
  }

  @override
  String betaLabel(int number) {
    return 'Бета $number';
  }

  @override
  String appVersionWithServerFormat(String version, String serverVersion) {
    return 'Absorb v$version  -  Сервер $serverVersion';
  }

  @override
  String get backupAndRestore => 'Резервная копия';

  @override
  String get backupAndRestoreSubtitle =>
      'Сохранить все настройки в файл или восстановить из него';

  @override
  String get backUp => 'Создать копию';

  @override
  String get restore => 'Восстановить';

  @override
  String get allBookmarks => 'Все закладки';

  @override
  String get allBookmarksSubtitle => 'Закладки по всем книгам';

  @override
  String get switchAccount => 'Сменить аккаунт';

  @override
  String get addAccount => 'Добавить аккаунт';

  @override
  String get logOut => 'Выйти';

  @override
  String get includeLoginInfoTitle => 'Добавить данные для входа?';

  @override
  String get includeLoginInfoContent =>
      'Добавить в резервную копию данные для входа во все сохранённые аккаунты?\n\nТак проще восстановить всё на новом устройстве, но файл будет содержать ваши токены авторизации.';

  @override
  String get noSettingsOnly => 'Нет, только настройки';

  @override
  String get yesIncludeAccounts => 'Да, с аккаунтами';

  @override
  String get backupSavedWithAccounts => 'Копия сохранена (с аккаунтами)';

  @override
  String get backupSavedSettingsOnly => 'Копия сохранена (только настройки)';

  @override
  String backupFailed(String error) {
    return 'Не удалось создать копию: $error';
  }

  @override
  String get restoreBackupTitle => 'Восстановить из копии?';

  @override
  String get restoreBackupContent =>
      'Все текущие настройки будут заменены значениями из копии.';

  @override
  String fromAbsorbVersion(String version) {
    return 'Из Absorb v$version';
  }

  @override
  String restoreAccountsChip(int count) {
    return 'Аккаунтов: $count';
  }

  @override
  String restoreBookmarksChip(int count) {
    return 'Закладки для книг: $count';
  }

  @override
  String get restoreCustomHeadersChip => 'Свои заголовки';

  @override
  String get invalidBackupFile => 'Недопустимый файл резервной копии';

  @override
  String get settingsRestoredSuccessfully => 'Настройки восстановлены';

  @override
  String restoreFailed(String error) {
    return 'Не удалось восстановить: $error';
  }

  @override
  String get logOutTitle => 'Выйти?';

  @override
  String get logOutContent =>
      'Вы выйдете из аккаунта. Ваши загрузки останутся на этом устройстве.';

  @override
  String get signOut => 'Выйти';

  @override
  String get changePasswordTitle => 'Смена пароля';

  @override
  String get changePasswordSubtitle =>
      'Безопасно обновите пароль Audiobookshelf';

  @override
  String get currentPassword => 'Текущий пароль';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get confirmNewPassword => 'Повторите новый пароль';

  @override
  String get passwordChangeEffect =>
      'При смене пароля вы выйдете из других сеансов Audiobookshelf. Это устройство останется в аккаунте.';

  @override
  String get passwordFieldsRequired => 'Заполните все поля пароля';

  @override
  String get passwordsDoNotMatch => 'Новые пароли не совпадают';

  @override
  String get passwordChanged => 'Пароль изменён. Другие устройства отключены.';

  @override
  String get passwordInvalid => 'Текущий пароль неверен';

  @override
  String get passwordChangeUnsupported =>
      'Эта версия сервера не поддерживает безопасную смену пароля в Absorb';

  @override
  String get passwordChangeFailed => 'Не удалось изменить пароль';

  @override
  String get otherUserPasswordResetWarning =>
      'При смене этого пароля пользователь выйдет из аккаунта на всех устройствах.';

  @override
  String get manageSessionsTitle => 'Устройства с выполненным входом';

  @override
  String get manageSessionsSubtitle =>
      'Просмотр и удаление сеансов Audiobookshelf';

  @override
  String get sessionsCurrent => 'Это устройство';

  @override
  String get sessionsUnknownDevice => 'Неизвестное устройство';

  @override
  String sessionsLastActive(String date) {
    return 'Последняя активность: $date';
  }

  @override
  String get sessionsNone => 'Нет активных сеансов';

  @override
  String get sessionsLoadMore => 'Загрузить ещё';

  @override
  String get sessionsUnsupported =>
      'Для управления сеансами нужен Audiobookshelf 2.36 или новее.';

  @override
  String get sessionsLoadFailed => 'Не удалось загрузить список устройств';

  @override
  String get sessionsLegacyNotice =>
      'У этого входа нет сеанса обновления, поэтому Absorb не может определить это устройство в списке.';

  @override
  String get sessionsRemove => 'Выйти на устройстве';

  @override
  String get sessionsRemoveTitle => 'Выйти на этом устройстве?';

  @override
  String get sessionsRemoveContent =>
      'Его сеанс обновления будет удалён. Текущий доступ может работать, пока не истечёт срок короткоживущего токена.';

  @override
  String get sessionsRemoved => 'Выход на устройстве выполнен';

  @override
  String get sessionsRemoveFailed => 'Не удалось выйти на этом устройстве';

  @override
  String get sessionsSignOutAll => 'Выйти на всех устройствах';

  @override
  String get sessionsSignOutAllTitle => 'Выйти везде?';

  @override
  String get sessionsSignOutAllContent =>
      'Будут удалены все сеансы обновления, включая это устройство. Действующие токены доступа могут работать, пока не истекут.';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return 'Расписание использует время сервера ($timeZone)';
  }

  @override
  String get podcastScheduleServerTimeUnknown =>
      'Расписание использует время сервера';

  @override
  String get editServerAddressTitle => 'Изменить адрес сервера';

  @override
  String editServerAddressSubtitle(String username) {
    return 'Обновите адрес для $username. Используйте это, если адрес вашего сервера изменился: это тот же сервер, просто новый URL. Статистика и загрузки сохранятся.';
  }

  @override
  String get editServerAddressField => 'Адрес сервера';

  @override
  String get editServerAddressUpdated => 'Адрес сервера обновлён';

  @override
  String get editServerAddressFailed => 'Не удалось обновить адрес сервера';

  @override
  String get editServerAddressAction => 'Изменить адрес сервера';

  @override
  String get editServerConnectionTitle => 'Изменить подключение к серверу';

  @override
  String editServerConnectionSubtitle(String username) {
    return 'Обновите адрес сервера и свои заголовки для $username. Статистика и загрузки сохранятся.';
  }

  @override
  String get editServerConnectionAction => 'Изменить подключение к серверу';

  @override
  String get editServerConnectionUpdated => 'Подключение к серверу обновлено';

  @override
  String get editServerConnectionFailed =>
      'Не удалось обновить подключение к серверу';

  @override
  String get editCustomHeadersDescription =>
      'Для туннелей Cloudflare и обратных прокси. Эти заголовки действуют только для этого сохранённого аккаунта.';

  @override
  String get removeAccountAction => 'Убрать аккаунт';

  @override
  String get removeAccountTitle => 'Убрать аккаунт?';

  @override
  String removeAccountContent(String username, String server) {
    return 'Убрать $username на $server из сохранённых аккаунтов?\n\nВы всегда сможете добавить его снова, войдя заново.';
  }

  @override
  String get switchAccountTitle => 'Сменить аккаунт?';

  @override
  String switchAccountContent(String username, String server) {
    return 'Переключиться на $username на $server?\n\nТекущее воспроизведение будет остановлено, а приложение перезагрузится с данными другого аккаунта.';
  }

  @override
  String get switchButton => 'Переключить';

  @override
  String get downloadLocationSheetTitle => 'Место загрузки';

  @override
  String get downloadLocationSheetSubtitle =>
      'Выберите, куда сохранять аудиокниги';

  @override
  String get currentLocation => 'Текущее место';

  @override
  String get existingDownloadsWarning =>
      'Уже скачанные файлы остаются на прежнем месте. Новый путь используется только для новых загрузок.';

  @override
  String get chooseFolder => 'Выбрать папку';

  @override
  String get chooseDownloadFolder => 'Выберите папку для загрузок';

  @override
  String get storagePermissionDenied =>
      'Доступ к хранилищу отклонён навсегда - включите его в настройках приложения';

  @override
  String get openSettings => 'Открыть настройки';

  @override
  String get storagePermissionRequired =>
      'Для своего места загрузки нужен доступ к хранилищу';

  @override
  String get cannotWriteToFolder =>
      'Не удаётся записать в эту папку - выберите другое место или предоставьте доступ к файлам в настройках системы';

  @override
  String downloadLocationSetTo(String label) {
    return 'Место загрузки: $label';
  }

  @override
  String get resetToDefault => 'Сбросить по умолчанию';

  @override
  String get resetToDefaultStorage => 'Вернуть стандартное хранилище';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count загрузки находятся в старой пользовательской папке, которую больше нельзя открыть. Скачайте их заново или закройте это уведомление.',
      many:
          '$count загрузок находятся в старой пользовательской папке, которую больше нельзя открыть. Скачайте их заново или закройте это уведомление.',
      few:
          '$count загрузки находятся в старой пользовательской папке, которую больше нельзя открыть. Скачайте их заново или закройте это уведомление.',
      one:
          '$count загрузка находится в старой пользовательской папке, которую больше нельзя открыть. Скачайте её заново или закройте это уведомление.',
    );
    return '$_temp0';
  }

  @override
  String get redownload => 'Скачать заново';

  @override
  String get redownloadStarted => 'Скачивается заново';

  @override
  String get dismiss => 'Закрыть';

  @override
  String get tipsAndHiddenFeatures => 'Советы и скрытые возможности';

  @override
  String get tipsSubtitle => 'Получите от Absorb максимум';

  @override
  String get adminTitle => 'Администрирование сервера';

  @override
  String get adminTasksTitle => 'Активность сервера';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выполняются $count задачи',
      many: 'Выполняются $count задач',
      few: 'Выполняются $count задачи',
      one: 'Выполняется $count задача',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => 'Недавняя активность сервера';

  @override
  String get adminTasksEmpty => 'На сервере нет выполняемых задач';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return 'Добавлено: $added - обновлено: $updated - не найдено: $missing';
  }

  @override
  String get adminServer => 'Сервер';

  @override
  String get adminVersion => 'Версия';

  @override
  String get adminUsers => 'Пользователи';

  @override
  String get adminOnline => 'В сети';

  @override
  String get adminBackup => 'Резервная копия';

  @override
  String get adminPurgeCache => 'Очистить кэш';

  @override
  String get adminManage => 'Управление';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return 'Аккаунтов: $userCount - в сети: $onlineCount';
  }

  @override
  String get adminPodcasts => 'Подкасты';

  @override
  String get adminPodcastsSubtitle =>
      'Поиск, добавление и управление подкастами';

  @override
  String get adminScan => 'Сканировать';

  @override
  String get adminScanning => 'Сканирование...';

  @override
  String get adminMatchAll => 'Сопоставить все';

  @override
  String get adminMatching => 'Сопоставление...';

  @override
  String get adminMatchAllTitle => 'Сопоставить все элементы?';

  @override
  String adminMatchAllContent(String name) {
    return 'Сопоставить метаданные для всех элементов в «$name»? Это может занять время.';
  }

  @override
  String adminScanStarted(String name) {
    return 'Сканирование запущено для «$name»';
  }

  @override
  String get adminBackupCreated => 'Копия создана';

  @override
  String get adminBackupFailed => 'Не удалось создать копию';

  @override
  String get adminCachePurged => 'Кэш очищен';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => 'Открыть в приложении';

  @override
  String get adminRmabAdd => 'Добавить интеграцию ReadMeABook';

  @override
  String get adminRmabUrlTitle => 'Адрес ReadMeABook';

  @override
  String get adminRmabUrlHelp =>
      'Вставьте свой адрес с токеном входа. Создайте его в RMAB: Admin, Users.';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => 'Введите корректный http(s)-адрес';

  @override
  String get adminRmabSaved => 'ReadMeABook сохранён';

  @override
  String get adminRmabRemoved => 'ReadMeABook удалён';

  @override
  String get adminRmabReload => 'Перезагрузить';

  @override
  String get adminRmabLoadFailed =>
      'Не удалось загрузить ReadMeABook. Проверьте адрес.';

  @override
  String get adminRmabConnected => 'Подключено';

  @override
  String get adminRmabAskAdmin =>
      'Попросите у администратора сервера адрес для входа';

  @override
  String get adminRmabUrlHelpUser =>
      'Попросите у администратора сервера адрес для входа. Он создаётся в RMAB > Admin > Users.';

  @override
  String get adminRmabSettingsInfo =>
      'ReadMeABook - это самостоятельно размещаемый сервис для запроса и скачивания аудиокниг. Его должен установить и настроить администратор вашего сервера.';

  @override
  String get rmabConfigTitle => 'Подключение ReadMeABook';

  @override
  String get rmabConfigExplainerAdmin =>
      'ReadMeABook - это самостоятельно размещаемый сервис для запроса аудиокниг. Создайте токен API в RMAB: Admin Dashboard > Settings > API, затем вставьте ниже адрес сервера и токен. Absorb ничего не хранит и не скачивает, он только отправляет запросы на ваш сервер.';

  @override
  String get rmabConfigExplainerUser =>
      'ReadMeABook - это самостоятельно размещаемый сервис для запроса аудиокниг. Попросите у администратора сервера адрес RMAB и токен API. Absorb ничего не хранит и не скачивает, он только отправляет запросы на ваш сервер.';

  @override
  String get rmabConfigLearnMore => 'Подробнее о ReadMeABook';

  @override
  String get rmabConfigBaseUrlLabel => 'Адрес сервера RMAB';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.example.com';

  @override
  String get rmabConfigTokenLabel => 'Токен API';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel =>
      'Адрес входа в веб-интерфейс (необязательно)';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      'Вставьте адрес автоматического входа, чтобы «Открыть в браузерном окне» сразу заходило в аккаунт. Оставьте пустым для обычного входа.';

  @override
  String get rmabConfigHeadersHelp =>
      'Дополнительные заголовки, отправляемые с каждым запросом к ReadMeABook, для обратных прокси вроде Cloudflare Access.';

  @override
  String get rmabConfigConnect => 'Подключить';

  @override
  String get rmabConfigDisconnect => 'Отключить';

  @override
  String get rmabConfigOpenWebView => 'Открыть в браузерном окне';

  @override
  String rmabConfigConnectedAs(String name) {
    return 'Подключено как $name';
  }

  @override
  String get rmabConfigErrorInvalidUrl => 'Введите корректный http(s)-адрес';

  @override
  String get rmabConfigErrorMissingToken => 'Введите токен API';

  @override
  String get rmabConfigErrorUnauthorized => 'Сервер отклонил токен';

  @override
  String get rmabConfigErrorForbidden =>
      'Этому токену не разрешено это действие';

  @override
  String get rmabConfigErrorNetwork =>
      'Не удалось подключиться к RMAB. Проверьте адрес.';

  @override
  String get rmabConfigErrorGeneric => 'Не удалось подключиться';

  @override
  String get rmabConfigSavedSnackbar => 'ReadMeABook подключён';

  @override
  String get rmabConfigDisconnectedSnackbar => 'ReadMeABook отключён';

  @override
  String get rmabRequestCta => 'Запросить через ReadMeABook';

  @override
  String get rmabSearchHeader => 'Запрос через ReadMeABook';

  @override
  String get rmabSearchHint => 'Поиск по названию или автору';

  @override
  String get rmabSearchEmpty => 'На вашем сервере ReadMeABook нет совпадений';

  @override
  String get rmabSearchError => 'Не удалось выполнить поиск в ReadMeABook';

  @override
  String get rmabSearchPrompt => 'Введите название или автора для поиска';

  @override
  String get rmabSearchFooterPrompt => 'Ищете что-то другое?';

  @override
  String rmabSearchFooterCta(String query) {
    return 'Искать «$query» в ReadMeABook';
  }

  @override
  String get rmabBookDetailExplainer =>
      'Этот запрос будет отправлен через ваш сервер ReadMeABook. Администратор рассмотрит и обработает его. Следить за ним можно в разделе «Мои запросы» на плитке ReadMeABook.';

  @override
  String get rmabBookAlreadyAvailable => 'Уже в вашей библиотеке';

  @override
  String get rmabBookAlreadyRequested => 'Уже запрошено';

  @override
  String get rmabRequestSubmitting => 'Отправка…';

  @override
  String get rmabRequestSent => 'Запрос отправлен';

  @override
  String get rmabRequestErrorAlreadyAvailable => 'Уже в вашей библиотеке';

  @override
  String get rmabRequestErrorBeingProcessed => 'Уже обрабатывается';

  @override
  String get rmabRequestErrorDuplicate => 'Вы уже запрашивали это';

  @override
  String get rmabRequestErrorValidation => 'Не удалось отправить запрос';

  @override
  String get rmabRequestErrorUserNotFound =>
      'Пользователя токена больше не существует. Подключите ReadMeABook заново.';

  @override
  String get rmabRequestErrorIgnored => 'Эта книга в вашем списке игнорируемых';

  @override
  String get rmabRequestErrorGeneric => 'Не удалось отправить запрос';

  @override
  String get rmabRequestErrorTokenRejected =>
      'Сервер отклонил токен. Подключите ReadMeABook заново.';

  @override
  String get rmabMyRequestsTab => 'Мои запросы';

  @override
  String get rmabSetupTab => 'Настройка';

  @override
  String get rmabMyRequestsEmpty => 'Вы ещё не запрашивали книги';

  @override
  String get rmabMyRequestsError => 'Не удалось загрузить запросы';

  @override
  String get rmabMyRequestsRefresh => 'Обновить';

  @override
  String get rmabRequestDetailTitle => 'Сведения о запросе';

  @override
  String get rmabRequestDetailStatus => 'Статус';

  @override
  String get rmabRequestDetailRequestedOn => 'Дата запроса';

  @override
  String get rmabRequestDetailCompletedOn => 'Дата завершения';

  @override
  String get rmabRequestDetailProgress => 'Прогресс';

  @override
  String get rmabStatusActive => 'В процессе';

  @override
  String get rmabStatusWaiting => 'Ожидает';

  @override
  String get rmabStatusAvailable => 'Доступно';

  @override
  String get rmabStatusDownloaded => 'Скачано';

  @override
  String get rmabStatusFailed => 'Сбой';

  @override
  String get rmabStatusCancelled => 'Отменено';

  @override
  String get rmabStatusDenied => 'Отклонено';

  @override
  String get rmabStatusUnknown => 'Неизвестно';

  @override
  String narratedBy(String narrator) {
    return 'Читает $narrator';
  }

  @override
  String get onAudible => 'на Audible';

  @override
  String percentComplete(String percent) {
    return 'Выполнено: $percent%';
  }

  @override
  String get absorbing => 'Absorbing...';

  @override
  String get absorbAgain => 'Absorb снова';

  @override
  String get absorb => 'Absorb';

  @override
  String get ebookOnlyNoAudio => 'Только электронная книга, без аудио';

  @override
  String get absorbAudioNotDownloaded => 'Аудио не скачано';

  @override
  String get absorbAudioNotDownloadedEbookOnly =>
      'Аудио не скачано, только электронная книга';

  @override
  String get fullyAbsorbed => 'Полностью прослушано';

  @override
  String get fullyAbsorbAction => 'Отметить прослушанным';

  @override
  String get removeFromAbsorbing => 'Убрать из Absorbing';

  @override
  String get addToAbsorbing => 'Добавить в Absorbing';

  @override
  String get absorbNext => 'Absorb следующим';

  @override
  String get absorbNextAdded => 'Следующая в Absorbing';

  @override
  String get absorbLast => 'Absorb последним';

  @override
  String get absorbNextHint => 'Сразу после того, что играет сейчас';

  @override
  String get absorbLastHint => 'В конец списка';

  @override
  String get removedFromAbsorbing => 'Убрано из Absorbing';

  @override
  String get addedToAbsorbing => 'Добавлено в Absorbing';

  @override
  String get removeFromContinueListening => 'Убрать из «Продолжить слушать»';

  @override
  String get removedFromContinueListening => 'Убрано из «Продолжить слушать»';

  @override
  String get removeFromContinueReading => 'Убрать из «Продолжить чтение»';

  @override
  String get removedFromContinueReading => 'Убрано из «Продолжить чтение»';

  @override
  String get sessionAdd => 'Добавить сеанс';

  @override
  String get sessionStartLabel => 'Начало в';

  @override
  String get sessionAdded => 'Сеанс добавлен';

  @override
  String get sessionAddFailed => 'Не удалось добавить сеанс';

  @override
  String get removeSeriesFromContinueSeries => 'Убрать из «Продолжить серию»';

  @override
  String get removedSeriesFromContinueSeries => 'Убрано из «Продолжить серию»';

  @override
  String get couldNotUpdate => 'Не удалось обновить, повторите попытку';

  @override
  String get addToPlaylist => 'Добавить в плейлист';

  @override
  String get addToCollection => 'Добавить в коллекцию';

  @override
  String get downloadEbook => 'Скачать электронную книгу';

  @override
  String get downloadEbookAgain => 'Скачать электронную книгу заново';

  @override
  String get resetProgress => 'Сбросить прогресс';

  @override
  String get lookupLocalMetadata => 'Найти локальные метаданные';

  @override
  String get reLookupLocalMetadata => 'Найти локальные метаданные заново';

  @override
  String get clearLocalMetadata => 'Очистить локальные метаданные';

  @override
  String get searchOnGoodreads => 'Искать на Goodreads';

  @override
  String get editServerDetails => 'Изменить данные сервера';

  @override
  String get encodeTab => 'Кодирование';

  @override
  String get codec => 'Кодек';

  @override
  String get bitrate => 'Битрейт';

  @override
  String get channels => 'Каналы';

  @override
  String get mono => 'Моно';

  @override
  String get stereo => 'Стерео';

  @override
  String get startM4bEncode => 'Начать кодирование в M4B';

  @override
  String get encodeStarted => 'Кодирование в M4B начато';

  @override
  String get encodeFailed => 'Не удалось начать кодирование';

  @override
  String get encodeFinished => 'Кодирование в M4B завершено';

  @override
  String get currentlyLabel => 'Сейчас:';

  @override
  String encodeOutputPathNote(String path) {
    return 'Готовый M4B будет помещён в папку ваших аудиокниг: $path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return 'Резервная копия исходных аудиофайлов будет храниться в: /metadata/cache/items/$itemId/. Не забывайте периодически очищать кэш элементов.';
  }

  @override
  String get encodeTimeNote => 'Кодирование может занять до 30 минут.';

  @override
  String get encodeRescanNote =>
      'Если наблюдатель отключён, после этого нужно заново просканировать эту аудиокнигу.';

  @override
  String get aboutSection => 'О книге';

  @override
  String chaptersCount(int count) {
    return 'Главы ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return 'Аудиотреки ($count)';
  }

  @override
  String libraryFilesCount(int count) {
    return 'Файлы библиотеки ($count)';
  }

  @override
  String get chapters => 'Главы';

  @override
  String get noChaptersBook => 'В этой книге нет глав';

  @override
  String get noChaptersPodcast => 'В этом подкасте нет глав';

  @override
  String get failedToLoad => 'Не удалось загрузить';

  @override
  String startedDate(String date) {
    return 'Начато $date';
  }

  @override
  String finishedDate(String date) {
    return 'Закончено $date';
  }

  @override
  String andCountMore(int count) {
    return 'и ещё $count';
  }

  @override
  String get markAsFullyAbsorbedQuestion =>
      'Отметить как полностью прослушанное?';

  @override
  String get markAsFullyAbsorbedContent =>
      'Прогресс будет установлен на 100%, а воспроизведение остановится, если эта книга играет.';

  @override
  String get markedAsFinishedNiceWork =>
      'Отмечено как прослушанное - отличная работа!';

  @override
  String get failedToUpdateCheckConnection =>
      'Не удалось обновить - проверьте соединение';

  @override
  String get markedFinishedWillSync =>
      'Marked as finished - will sync when you\'re back online';

  @override
  String get markAsNotFinishedQuestion => 'Отметить как непрослушанное?';

  @override
  String get markAsNotFinishedContent =>
      'Статус «прослушано» будет сброшен, а позиция вернётся в начало.';

  @override
  String get unmark => 'Снять отметку';

  @override
  String get markedAsNotFinishedBackAtIt =>
      'Отмечено как непрослушанное - за дело!';

  @override
  String get resetProgressQuestion => 'Сбросить прогресс?';

  @override
  String get resetProgressListeningAndReading =>
      'Прогресс прослушивания и чтения будет сброшен до 0%.';

  @override
  String get resetProgressListening =>
      'Прогресс прослушивания будет сброшен до 0%.';

  @override
  String get resetProgressReading => 'Прогресс чтения будет сброшен до 0%.';

  @override
  String get resetProgressMarksUnread =>
      'Книга также будет отмечена как непрочитанная.';

  @override
  String get resetProgressCantUndo => 'Это нельзя отменить.';

  @override
  String get progressResetFreshStart =>
      'Прогресс сброшен - начинаем с чистого листа!';

  @override
  String get clearLocalMetadataQuestion => 'Очистить локальные метаданные?';

  @override
  String get clearLocalMetadataContent =>
      'Локально сохранённые метаданные будут удалены, и вернутся данные с сервера.';

  @override
  String get localMetadataCleared => 'Локальные метаданные очищены';

  @override
  String get saveEbook => 'Сохранить электронную книгу';

  @override
  String get noEbookFileFound => 'Файл электронной книги не найден';

  @override
  String get bookmark => 'Закладка';

  @override
  String get bookmarks => 'Закладки';

  @override
  String bookmarksWithCount(int count) {
    return 'Закладки ($count)';
  }

  @override
  String get playbackSpeed => 'Скорость воспроизведения';

  @override
  String get noBookmarksYet => 'Закладок пока нет';

  @override
  String get longPressBookmarkHint =>
      'Удерживайте кнопку закладки для быстрого сохранения';

  @override
  String get addBookmark => 'Добавить закладку';

  @override
  String get editBookmark => 'Изменить закладку';

  @override
  String get titleLabel => 'Название';

  @override
  String get noteOptionalLabel => 'Заметка (необязательно)';

  @override
  String get editLayout => 'Изменить расположение';

  @override
  String get inMenu => 'В меню';

  @override
  String get bookmarkAdded => 'Закладка добавлена';

  @override
  String get startPlayingSomethingFirst => 'Сначала запустите воспроизведение';

  @override
  String get playbackHistory => 'История воспроизведения';

  @override
  String get historyLocalTab => 'История';

  @override
  String get historyServerTab => 'Сеансы';

  @override
  String get historyNoServerSessions =>
      'Для этого элемента пока нет сеансов на сервере';

  @override
  String get historyServerLoadFailed => 'Не удалось загрузить сеансы сервера';

  @override
  String get clearHistoryTooltip => 'Очистить историю';

  @override
  String get tapEventToJump =>
      'Нажмите на событие, чтобы перейти к этой позиции';

  @override
  String get noHistoryYet => 'Истории пока нет';

  @override
  String jumpedToPosition(String position) {
    return 'Переход к $position';
  }

  @override
  String booksInSeriesCount(int count) {
    return 'Книг в этой серии: $count';
  }

  @override
  String bookNumber(String number) {
    return 'Книга $number';
  }

  @override
  String downloadRemainingCount(int count) {
    return 'Скачать оставшиеся ($count)';
  }

  @override
  String get downloadAll => 'Скачать все';

  @override
  String get markAllNotFinished => 'Отметить все непрослушанными';

  @override
  String get markAllFinished => 'Отметить все прослушанными';

  @override
  String get markAllNotFinishedQuestion => 'Отметить все как непрослушанные?';

  @override
  String get fullyAbsorbSeries => 'Отметить серию как полностью прослушанную?';

  @override
  String get turnAutoDownloadOff => 'Выключить автозагрузку';

  @override
  String get turnAutoDownloadOn => 'Включить автозагрузку';

  @override
  String get autoDownloadThisSeries => 'Автоматически скачивать эту серию?';

  @override
  String get autoDownloadSeriesContent =>
      'Следующие книги будут скачиваться автоматически по мере прослушивания.';

  @override
  String get standalone => 'Отдельные книги';

  @override
  String get episodes => 'Эпизоды';

  @override
  String get noEpisodesFound => 'Эпизоды не найдены';

  @override
  String get markFinished => 'Отметить прослушанным';

  @override
  String get markUnfinished => 'Отметить непрослушанным';

  @override
  String get allEpisodes => 'Все эпизоды';

  @override
  String get aboutThisEpisode => 'Об этом эпизоде';

  @override
  String get reversePlayOrder => 'Обратный порядок воспроизведения';

  @override
  String selectedCount(int count) {
    return 'Выбрано: $count';
  }

  @override
  String get selectAll => 'Выбрать все';

  @override
  String get deselectAll => 'Снять выбор';

  @override
  String get autoDownloadThisPodcast => 'Автоматически скачивать этот подкаст?';

  @override
  String get autoDownloadPodcastContent =>
      'Следующие эпизоды будут скачиваться автоматически по мере прослушивания.';

  @override
  String get download => 'Скачать';

  @override
  String get deleteDownload => 'Удалить загрузку';

  @override
  String get casting => 'Трансляция';

  @override
  String get castingTo => 'Трансляция на';

  @override
  String get editDetails => 'Изменить сведения';

  @override
  String get quickMatch => 'Быстрое сопоставление';

  @override
  String get quickMatchNoUpdates => 'Обновления не требуются';

  @override
  String get custom => 'Свой вариант';

  @override
  String get authorOptionalLabel => 'Автор (необязательно)';

  @override
  String get noResultsFound =>
      'Ничего не найдено.\nИзмените запрос или источник.';

  @override
  String get searchForMetadataAbove => 'Найдите метаданные выше';

  @override
  String get applyThisMatch => 'Применить это совпадение?';

  @override
  String get metadataUpdated => 'Метаданные обновлены';

  @override
  String get failedToUpdateMetadata => 'Не удалось обновить метаданные';

  @override
  String get subtitleLabel => 'Подзаголовок';

  @override
  String get authorLabel => 'Автор';

  @override
  String get narratorLabel => 'Чтец';

  @override
  String get seriesLabel => 'Серия';

  @override
  String get addSeries => 'Добавить серию';

  @override
  String get removeSeries => 'Убрать серию';

  @override
  String get descriptionLabel => 'Описание';

  @override
  String get publisherLabel => 'Издатель';

  @override
  String get yearLabel => 'Год';

  @override
  String get genresLabel => 'Жанры';

  @override
  String get tagsLabel => 'Теги';

  @override
  String get commaSeparated => 'Через запятую';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => 'Обложка';

  @override
  String get coverRemove => 'Убрать обложку';

  @override
  String get coverRemoveConfirm =>
      'Убрать обложку этой книги? Вместо неё будет показана созданная карточка с названием.';

  @override
  String get coverRemoved => 'Обложка убрана';

  @override
  String get coverRemoveFailed => 'Не удалось убрать обложку';

  @override
  String get coverUrlLabel => 'Адрес обложки';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => 'Локальные метаданные';

  @override
  String get overrideLocalDisplay => 'Переопределить локальное отображение';

  @override
  String get metadataSavedLocally => 'Метаданные сохранены локально';

  @override
  String get notes => 'Заметки';

  @override
  String get newNote => 'Новая заметка';

  @override
  String get editNote => 'Изменить заметку';

  @override
  String get noNotesYet => 'Заметок пока нет';

  @override
  String get markdownIsSupported => 'Поддерживается Markdown';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => 'Сохраняет форматирование';

  @override
  String get plainTextTxt => 'Простой текст (.txt)';

  @override
  String get simpleTextNoFormatting => 'Простой текст без форматирования';

  @override
  String get untitledNote => 'Заметка без названия';

  @override
  String get titleHint => 'Название';

  @override
  String get noteBodyHint => 'Напишите заметку... (поддерживается Markdown)';

  @override
  String get nothingToPreview => 'Нечего просматривать';

  @override
  String get audioEnhancements => 'Улучшение звука';

  @override
  String get presets => 'ПРЕСЕТЫ';

  @override
  String get equalizer => 'ЭКВАЛАЙЗЕР';

  @override
  String get effects => 'ЭФФЕКТЫ';

  @override
  String get bassBoost => 'Усиление басов';

  @override
  String get surround => 'Объёмный звук';

  @override
  String get loudness => 'Громкость';

  @override
  String get pitch => 'Pitch';

  @override
  String get monoAudio => 'Моно звук';

  @override
  String get skipSilence => 'Пропуск тишины';

  @override
  String get resetAll => 'Сбросить всё';

  @override
  String get collectionNotFound => 'Коллекция не найдена';

  @override
  String get deleteCollection => 'Удалить коллекцию';

  @override
  String get deleteCollectionContent =>
      'Вы уверены, что хотите удалить эту коллекцию?';

  @override
  String get deleteCollectionFailed => 'Не удалось удалить коллекцию';

  @override
  String get deletePermissionRequired =>
      'Нужно разрешение на удаление. Попросите главного администратора предоставить его.';

  @override
  String get deleteFilesCheckbox => 'Также удалить файлы на сервере';

  @override
  String get deleteFilesCheckedHint =>
      'Файлы будут удалены с сервера навсегда.';

  @override
  String get deleteFilesUncheckedHint =>
      'Файлы останутся на сервере, поэтому при следующем сканировании библиотеки это может вернуться.';

  @override
  String get deleteFromServerAction => 'Удалить с сервера';

  @override
  String get deleteFromServerTitle => 'Удалить с сервера';

  @override
  String deleteFromServerContent(String title) {
    return 'Удалить «$title» из Audiobookshelf?';
  }

  @override
  String deletedFromServer(String title) {
    return '«$title» удалено';
  }

  @override
  String get deleteFromServerFailed =>
      'Не удалось удалить. Проверьте журналы сервера.';

  @override
  String get playlistNotFound => 'Плейлист не найден';

  @override
  String get deletePlaylist => 'Удалить плейлист';

  @override
  String get deletePlaylistContent =>
      'Вы уверены, что хотите удалить этот плейлист?';

  @override
  String get newPlaylist => 'Новый плейлист';

  @override
  String get playlistNameHint => 'Название плейлиста';

  @override
  String addedToName(String name) {
    return 'Добавлено в «$name»';
  }

  @override
  String get failedToAdd => 'Не удалось добавить';

  @override
  String get newCollection => 'Новая коллекция';

  @override
  String get collectionNameHint => 'Название коллекции';

  @override
  String get listsNewCollectionSubtitle =>
      'Соберите книги в список, который останется у вас';

  @override
  String get listsNewCollectionNeedsBookSubtitle =>
      'Начните хотя бы с одной книги';

  @override
  String get listsNewPlaylistSubtitle =>
      'Выстройте книги для прослушивания по порядку';

  @override
  String get listsAddBooksNow => 'Добавить книги сейчас';

  @override
  String get listsPickBooksNext =>
      'Далее вы выберете книги. Для коллекции на этом сервере нужна хотя бы одна.';

  @override
  String get listsCreate => 'Создать';

  @override
  String get listsCollectionNeedsBook =>
      'Для коллекции нужна хотя бы одна книга, поэтому ничего не создано.';

  @override
  String get listsCreateFailed => 'Не удалось создать';

  @override
  String get castToDevice => 'Транслировать на устройство';

  @override
  String get searchingForCastDevices => 'Поиск устройств Cast...';

  @override
  String get castDevice => 'Устройство Cast';

  @override
  String get stopCasting => 'Остановить трансляцию';

  @override
  String get disconnect => 'Отключить';

  @override
  String get audioOutput => 'Вывод звука';

  @override
  String get noOutputDevicesFound => 'Устройства вывода не найдены';

  @override
  String get welcomeToAbsorb => 'Добро пожаловать в Absorb Plus';

  @override
  String get welcomeTagline => 'Клиент для Audiobookshelf.';

  @override
  String get welcomeAbsorbingTitle => 'Absorbing';

  @override
  String get welcomeAbsorbingIntro =>
      'Вместо «играть» и «слушать» мы говорим «absorb». Предпочитаете привычные слова? Переключите это в настройках.';

  @override
  String get welcomeAbsorbingTabBullet =>
      'Вкладка Absorbing - то, что вы слушаете сейчас';

  @override
  String get welcomeAbsorbButtonBullet =>
      'Кнопка Absorb - начать воспроизведение';

  @override
  String get welcomeFullyAbsorbBullet =>
      '«Отметить прослушанным» - пометить как законченное';

  @override
  String get welcomeGettingAroundTitle => 'Как ориентироваться';

  @override
  String get welcomeGettingAroundBody =>
      'Нажмите на любую обложку, чтобы открыть сведения. Карточки «Продолжить слушать» работают иначе: нажмите, чтобы сразу начать воспроизведение, или нажмите и удерживайте, чтобы открыть сведения.';

  @override
  String get welcomeMakeItYoursTitle => 'Настройте под себя';

  @override
  String get welcomeMakeItYoursBody =>
      'Поэкспериментируйте с настройками, чтобы подстроить Absorb под себя. Загляните в раздел «Советы и скрытые возможности».';

  @override
  String get getStarted => 'Начать';

  @override
  String get showMore => 'Показать больше';

  @override
  String get showLess => 'Показать меньше';

  @override
  String get readMore => 'Читать далее';

  @override
  String get removeDownloadQuestion => 'Удалить из загруженных?';

  @override
  String get removeDownloadContent => 'Это будет удалено с вашего устройства.';

  @override
  String get removeWhichDownload =>
      'На этом устройстве есть и аудиокнига, и электронная книга. Выберите, что удалить.';

  @override
  String get downloadRemoved => 'Загрузка удалена';

  @override
  String get finished => 'Прослушано';

  @override
  String get saved => 'Скачано';

  @override
  String get selectLibrary => 'Выберите библиотеку';

  @override
  String get switchLibraryTooltip => 'Сменить библиотеку';

  @override
  String get refreshTooltip => 'Обновить';

  @override
  String get openNowPlayingTooltip => 'Open Now Playing';

  @override
  String get previousChapterTooltip => 'Previous chapter';

  @override
  String get nextChapterTooltip => 'Next chapter';

  @override
  String get noBooksFound => 'Книги не найдены';

  @override
  String get userFallback => 'Пользователь';

  @override
  String get rootAdmin => 'Главный администратор';

  @override
  String get admin => 'Администратор';

  @override
  String get serverAdmin => 'Администрирование сервера';

  @override
  String get serverAdminSubtitle =>
      'Управление пользователями, библиотеками и настройками сервера';

  @override
  String serverUpdateAvailable(String version) {
    return 'Доступно обновление сервера $version';
  }

  @override
  String get justNow => 'Только что';

  @override
  String minutesAgo(int count) {
    return '$count мин назад';
  }

  @override
  String hoursAgo(int count) {
    return '$count ч назад';
  }

  @override
  String daysAgo(int count) {
    return '$count дн. назад';
  }

  @override
  String get audible => 'Audible';

  @override
  String get iTunes => 'iTunes';

  @override
  String get openLibrary => 'Open Library';

  @override
  String get root => 'Главный';

  @override
  String get coverPlayPause => 'Пуск и пауза по обложке';

  @override
  String get coverPlayPauseOnSubtitle =>
      'Вкл. - нажатие на обложку запускает и ставит на паузу';

  @override
  String get coverPlayPauseOffSubtitle =>
      'Выкл. - отдельная кнопка пуска и паузы в элементах управления';

  @override
  String get cardBackground => 'Фон карточки';

  @override
  String get cardBackgroundBlurred => 'Размытый';

  @override
  String get cardBackgroundGradient => 'Градиент';

  @override
  String get queueModeMergedSubtitle =>
      'Воспроизведение останавливается, ручная очередь или автоматический запуск следующего элемента';

  @override
  String get queueModeSeriesLabel => 'Серия';

  @override
  String get queueModeShowLabel => 'Подкаст';

  @override
  String get queueModeInfoSeries => 'Серия';

  @override
  String get queueModeInfoSeriesDesc =>
      'Автоматически запускает следующую книгу в серии или следующий эпизод в подкасте.';

  @override
  String get resetButtonGridQuestion => 'Сбросить сетку кнопок?';

  @override
  String get resetButtonGridContent =>
      'Будут восстановлены расположение, порядок и переключатели кнопок по умолчанию.';

  @override
  String get reset => 'Сбросить';

  @override
  String get buttonGridReset => 'Сетка кнопок сброшена';

  @override
  String get resetButtonGrid => 'Сбросить сетку кнопок';

  @override
  String get chapterBarrierOnRewind => 'Граница главы при перемотке';

  @override
  String get chapterBarrierInfoTitle => 'Граница главы';

  @override
  String get chapterBarrierInfoContent =>
      'При перемотке назад воспроизведение остановится на начале текущей главы и не перейдёт в предыдущую.\n\nНажмите кнопку перемотки назад дважды в течение 2 секунд, чтобы пройти границу.';

  @override
  String get chapterBarrierOnRewindOnSubtitle =>
      'Вкл. - перемотка останавливается на начале главы';

  @override
  String get chapterBarrierOnRewindOffSubtitle =>
      'Выкл. - перемотка пересекает границы глав';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return 'Вкл. - от $min до $max с в зависимости от длины паузы';
  }

  @override
  String get rewindOnSessionStart => 'Перемотка при начале сеанса';

  @override
  String get rewindOnSessionStartInfoContent =>
      'Обычная автоперемотка срабатывает, когда вы возобновляете воспроизведение после паузы в активном сеансе. Эта настройка добавляет перемотку при запуске совершенно нового сеанса, например после закрытия приложения, остановки воспроизведения или нового запуска приложения.\n\nКогда включено, в начале каждого нового сеанса воспроизведение перематывается назад на максимальное значение, чтобы вы заново услышали место, где остановились.';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return 'Вкл. - перемотка на $seconds с при начале нового сеанса';
  }

  @override
  String rewindActivationDelayValue(String seconds) {
    return '$seconds с+';
  }

  @override
  String rewindRangeValue(String min, String max) {
    return '$min с – $max с';
  }

  @override
  String rewindSecondsPause(String seconds) {
    return 'Пауза $seconds с';
  }

  @override
  String rewindMinPause(String minutes) {
    return 'Пауза $minutes мин';
  }

  @override
  String rewindHrPause(String hours) {
    return 'Пауза $hours ч';
  }

  @override
  String get rewindOneHrPause => 'Пауза 1 ч';

  @override
  String speedValue(String speed) {
    return '${speed}x';
  }

  @override
  String secondsValue(String seconds) {
    return '$seconds с';
  }

  @override
  String minutesValue(int minutes) {
    return '$minutes мин';
  }

  @override
  String get chimeBeforeSleep => 'Сигнал перед сном';

  @override
  String get chimeBeforeSleepOnSubtitle =>
      'Тихий звон колокольчика, когда таймер скоро закончится';

  @override
  String get chimeBeforeSleepOffSubtitle =>
      'Без звукового предупреждения перед сном';

  @override
  String get windDownDuration => 'Длительность затухания';

  @override
  String windDownDurationSubtitle(int seconds) {
    return 'Затухание и сигнал начинаются за $seconds с до сна';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return 'Плавно снижает громкость в последние $seconds с';
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
  String get endOfChapterShort => 'Конец главы';

  @override
  String get endOfChapterOnSubtitle => 'Остановить в конце текущей главы';

  @override
  String get endOfChapterOffSubtitle => 'Использовать таймер сна по времени';

  @override
  String get showExplicitBadge => 'Показывать значок 18+';

  @override
  String get showExplicitBadgeOnSubtitle =>
      'У элементов с ограничением 18+ показан значок «E»';

  @override
  String get showExplicitBadgeOffSubtitle => 'Выкл. - значок 18+ скрыт';

  @override
  String get showEbookBadge => 'Показывать значок электронной книги';

  @override
  String get showEbookBadgeOnSubtitle =>
      'У книг с электронной версией на обложке показан значок книги';

  @override
  String get showEbookBadgeOffSubtitle =>
      'Выкл. - значок электронной книги скрыт';

  @override
  String get libraryFallback => 'Библиотека';

  @override
  String get preReleaseUpdatesInfoTitle => 'Предварительные обновления';

  @override
  String get preReleaseUpdatesInfoContent =>
      'Когда включено, проверка обновлений будет уведомлять также об альфа- и предварительных сборках с GitHub. Они могут быть менее стабильными, но содержат новейшие функции и исправления.';

  @override
  String get includePreReleases => 'Включать предварительные версии';

  @override
  String get includePreReleasesOnSubtitle =>
      'Вкл. - проверка альфа- и предварительных сборок';

  @override
  String get includePreReleasesOffSubtitle =>
      'Выкл. - только стабильные выпуски';

  @override
  String get setTooltip => 'Задать';

  @override
  String get saveAbsorbBackup => 'Сохранить копию Absorb';

  @override
  String get checkForUpdate => 'Проверить наличие обновлений';

  @override
  String get onLatestVersion => 'У вас последняя версия';

  @override
  String get updateAvailable => 'Доступно обновление';

  @override
  String get preReleaseAvailable => 'Доступна предварительная версия';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'Доступна новая $kind Absorb: $latest\n\nУ вас $current.';
  }

  @override
  String get updateKindPreRelease => 'предварительная версия';

  @override
  String get updateKindVersion => 'версия';

  @override
  String get downloadButton => 'Скачать';

  @override
  String get updateDownloading => 'Скачивание обновления...';

  @override
  String get updateInstallPermissionDenied =>
      'Разрешение на установку не выдано. Включите для Absorb «Установку неизвестных приложений» в настройках системы.';

  @override
  String get updateOpeningInBrowser =>
      'Обновление в приложении не удалось, открывается браузер';

  @override
  String get sendToEreader => 'Отправить на электронную книгу';

  @override
  String sendingToEreader(String device) {
    return 'Отправка на $device...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return 'Отправлено на $device';
  }

  @override
  String get sendToEreaderFailed => 'Не удалось отправить электронную книгу';

  @override
  String get pickEreaderDevice => 'Выберите устройство';

  @override
  String get adminEmail => 'Почта';

  @override
  String get adminEmailSubtitle => 'SMTP и устройства для чтения';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => 'Руководство по настройке';

  @override
  String get smtpHost => 'Хост';

  @override
  String get smtpPort => 'Порт';

  @override
  String get smtpSecure => 'Защищённое соединение';

  @override
  String get smtpRejectUnauthorized => 'Отклонять недоверенные TLS-сертификаты';

  @override
  String get smtpUser => 'Имя пользователя';

  @override
  String get smtpPass => 'Пароль';

  @override
  String get smtpFromAddress => 'Адрес отправителя';

  @override
  String get smtpTestAddress => 'Тестовый адрес';

  @override
  String get smtpSendTest => 'Отправить тест';

  @override
  String get smtpSaveSettings => 'Сохранить';

  @override
  String get smtpSaved => 'Настройки почты сохранены';

  @override
  String get smtpSaveFailed => 'Не удалось сохранить настройки почты';

  @override
  String get smtpTestSent => 'Тестовое письмо отправлено';

  @override
  String get smtpTestFailed => 'Не удалось отправить тестовое письмо';

  @override
  String get ereaderDevicesTitle => 'Устройства для чтения';

  @override
  String get ereaderDevicesEmpty => 'Устройств пока нет. Добавьте одно ниже.';

  @override
  String get addEreaderDevice => 'Добавить устройство';

  @override
  String get editEreaderDevice => 'Изменить устройство';

  @override
  String get deleteEreaderDevice => 'Удалить';

  @override
  String get ereaderDeviceName => 'Имя';

  @override
  String get ereaderDeviceEmail => 'Электронная почта';

  @override
  String get ereaderAvailability => 'Кто может использовать это устройство';

  @override
  String get ereaderAvailAdminOrUp => 'Только администраторы';

  @override
  String get ereaderAvailUserOrUp => 'Все пользователи';

  @override
  String get ereaderAvailGuestOrUp => 'Все';

  @override
  String get ereaderAvailSpecificUsers => 'Выбранные пользователи';

  @override
  String ereaderSpecificUsersN(int count) {
    return 'Выбранные пользователи ($count)';
  }

  @override
  String get ereaderDevicesSaved => 'Устройства сохранены';

  @override
  String get ereaderDevicesSaveFailed => 'Не удалось сохранить устройства';

  @override
  String libraryCountOne(int count) {
    return '$count библиотека';
  }

  @override
  String libraryCountOther(int count) {
    return 'Библиотек: $count';
  }

  @override
  String serverVersionLabel(String version) {
    return 'Сервер $version';
  }

  @override
  String appVersionServerSuffix(String version) {
    return '  ·  Сервер $version';
  }

  @override
  String backupDateFormat(int month, int day, int year) {
    return '$day.$month.$year';
  }

  @override
  String get backupDetailsSeparator => ' · ';

  @override
  String get bookmarksSortedByPositionReversed =>
      'Сортировка по позиции (в обратном порядке)';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '«$title» на $position';
  }

  @override
  String get deleteBookmarkQuestion => 'Удалить закладку?';

  @override
  String get cardIconsOnlyChip => 'Только значки';

  @override
  String get cardMoreInGridChip => '«Ещё» в сетке';

  @override
  String get cardLayoutHidden => 'Скрыто';

  @override
  String get speed => 'Скорость';

  @override
  String get details => 'Сведения';

  @override
  String get episodeDetailsLabel => 'Сведения об эпизоде';

  @override
  String get bookDetailsLabel => 'Сведения о книге';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => 'Эквалайзер';

  @override
  String get cast => 'Cast';

  @override
  String castingToDevice(String device) {
    return 'Трансляция на $device';
  }

  @override
  String castToDeviceNamed(String device) {
    return 'Транслировать на $device';
  }

  @override
  String get historyShort => 'История';

  @override
  String atPosition(String position) {
    return 'на $position';
  }

  @override
  String chaptersChip(int count) {
    return 'Глав: $count';
  }

  @override
  String chapterNumber(int number) {
    return 'Глава $number';
  }

  @override
  String kbpsValue(int value) {
    return '$value kbps';
  }

  @override
  String get fileInfoTitle => 'О файлах';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => 'Для этой книги нет сведений о файлах.';

  @override
  String get fileInfoAudio => 'Аудио';

  @override
  String get fileInfoEbook => 'Электронная книга';

  @override
  String get fileInfoOther => 'Другие файлы';

  @override
  String get fileInfoBookOrbitNote => 'BookOrbit не сообщает кодек и битрейт.';

  @override
  String fileInfoChannels(int count) {
    return 'Каналов: $count';
  }

  @override
  String get fileInfoCover => 'Обложка';

  @override
  String get fileInfoMetadata => 'Метаданные';

  @override
  String get fileInfoSupplement => 'Дополнительно';

  @override
  String get fileInfoPathCopied => 'Путь скопирован';

  @override
  String get resetMayNotHaveSynced =>
      'Сброс мог не синхронизироваться - проверьте сервер';

  @override
  String failedToDownloadEbook(int code) {
    return 'Не удалось скачать электронную книгу ($code)';
  }

  @override
  String get serverReturnedErrorPage =>
      'Сервер вернул страницу с ошибкой вместо файла электронной книги';

  @override
  String ebookSaved(String filename) {
    return 'Сохранено: $filename';
  }

  @override
  String errorSavingEbook(String error) {
    return 'Ошибка сохранения электронной книги: $error';
  }

  @override
  String failedToSaveError(String error) {
    return 'Не удалось сохранить: $error';
  }

  @override
  String get adminBackupsLabel => 'Резервные копии';

  @override
  String get adminListeningNow => 'Слушают сейчас';

  @override
  String get adminLibraries => 'Библиотеки';

  @override
  String get adminLibraryShows => 'подкастов';

  @override
  String get adminLibraryBooks => 'книг';

  @override
  String get adminLibraryFolders => 'папок';

  @override
  String get adminLibrarySize => 'размер';

  @override
  String get adminLibraryDuration => 'длительность';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count отсутствующего или недопустимого элемента',
      many: '$count отсутствующих или недопустимых элементов',
      few: '$count отсутствующих или недопустимых элемента',
      one: '$count отсутствующий или недопустимый элемент',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => 'Проверить';

  @override
  String get adminMissingTitle => 'Отсутствующие элементы';

  @override
  String adminMissingSubtitle(String library) {
    return 'Записи в «$library», файлы которых отсутствуют или нечитаемы';
  }

  @override
  String get adminMissingNone => 'Нет отсутствующих или недопустимых элементов';

  @override
  String get adminMissingBadge => 'Отсутствует';

  @override
  String get adminInvalidBadge => 'Недопустимо';

  @override
  String get adminMissingDeleteTitle => 'Удалить запись';

  @override
  String adminMissingDeleteOneContent(String title) {
    return 'Удалить «$title» из Audiobookshelf?';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return 'Удалить записи ($count) из Audiobookshelf?';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return 'Удалить ($count)';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return 'Удалено: $title';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалено $count записи',
      many: 'Удалено $count записей',
      few: 'Удалено $count записи',
      one: 'Удалена $count запись',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => 'Не удалось удалить запись';

  @override
  String get adminMatchAction => 'Сопоставить';

  @override
  String adminMatchingStarted(String name) {
    return 'Сопоставление начато: $name';
  }

  @override
  String get adminMatchFailed => 'Не удалось';

  @override
  String adminScanFailed(String name) {
    return 'Не удалось просканировать: $name';
  }

  @override
  String get adminPurgeCacheFailed => 'Не удалось';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => 'админ';

  @override
  String get adminUsersDisabledBadge => 'отключён';

  @override
  String get adminUsersEditUserTooltip => 'Править пользователя';

  @override
  String get adminUsersOnlineNow => 'Сейчас в сети';

  @override
  String adminUsersLastSeen(String time) {
    return 'Был(а) в сети: $time';
  }

  @override
  String get adminUsersNever => 'Никогда';

  @override
  String get adminUsersTotal => 'Всего';

  @override
  String get adminUsersNoReadingActivity => 'Нет активности';

  @override
  String get adminUsersLoadingDots => 'Загрузка...';

  @override
  String get adminUsersLoadMoreSessions => 'Загрузить ещё сеансы';

  @override
  String get adminUsersNoRecentSessions => 'Нет недавних сеансов';

  @override
  String get adminUsersLibraryProgress => 'Прогресс по библиотеке';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return 'Загрузить ещё (осталось $count)';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return '$count мес. назад';
  }

  @override
  String get adminUsersNewUser => 'Новый пользователь';

  @override
  String get adminUsersEditUser => 'Правка пользователя';

  @override
  String get adminUsersUsername => 'Имя пользователя';

  @override
  String get adminUsersEnterUsername => 'Введите имя пользователя';

  @override
  String get adminUsersPassword => 'Пароль';

  @override
  String get adminUsersNewPassword => 'Новый пароль';

  @override
  String get adminUsersEnterPassword => 'Введите пароль';

  @override
  String get adminUsersLeaveBlankToKeep => 'Оставьте пустым, чтобы не менять';

  @override
  String get adminUsersAccountType => 'Тип учётной записи';

  @override
  String get adminUsersTypeGuest => 'Гость';

  @override
  String get adminUsersTypeUser => 'Пользователь';

  @override
  String get adminUsersTypeAdmin => 'Администратор';

  @override
  String get adminUsersStatus => 'Статус';

  @override
  String get adminUsersAccountActive => 'Учётная запись активна';

  @override
  String get adminUsersAccountActiveSub =>
      'Отключённые учётные записи не могут входить';

  @override
  String get adminUsersLocked => 'Заблокирована';

  @override
  String get adminUsersLockedSub => 'Запрещает смену пароля';

  @override
  String get adminUsersPermissions => 'Разрешения';

  @override
  String get adminUsersPermDownload => 'Скачивание';

  @override
  String get adminUsersPermUpdate => 'Обновление';

  @override
  String get adminUsersPermUpdateSub =>
      'Правка метаданных и элементов библиотеки';

  @override
  String get adminUsersPermDelete => 'Удаление';

  @override
  String get adminUsersPermUpload => 'Загрузка на сервер';

  @override
  String get adminUsersPermExplicit => 'Контент 18+';

  @override
  String get adminUsersLibraryAccess => 'Доступ к библиотекам';

  @override
  String get adminUsersAccessAllLibraries => 'Доступ ко всем библиотекам';

  @override
  String get adminUsersCreateUser => 'Создать пользователя';

  @override
  String get adminUsersSaveChanges => 'Сохранить изменения';

  @override
  String get adminUsersUsernameRequired => 'Укажите имя пользователя';

  @override
  String get adminUsersPasswordRequired => 'Укажите пароль';

  @override
  String get adminUsersUserCreated => 'Пользователь создан';

  @override
  String get adminUsersUserUpdated => 'Пользователь обновлён';

  @override
  String get adminUsersFailedCreate => 'Не удалось создать пользователя';

  @override
  String get adminUsersFailedUpdate => 'Не удалось обновить пользователя';

  @override
  String get adminUsersThisUser => 'этого пользователя';

  @override
  String get adminUsersDeleteUserTitle => 'Удалить пользователя?';

  @override
  String adminUsersDeleteUserContent(String name) {
    return 'Удалить $name без возможности восстановления?';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return '$name: удалено';
  }

  @override
  String get adminUsersFailedDelete => 'Не удалось удалить пользователя';

  @override
  String get adminUsersUnlinkOpenId => 'Отвязать OpenID';

  @override
  String get adminUsersUnlinkOpenIdTitle => 'Отвязать OpenID?';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return 'Удалить связь с OpenID для $name? Чтобы привязать снова, потребуется войти через OpenID ещё раз.';
  }

  @override
  String get adminUsersOpenIdUnlinked => 'OpenID отвязан';

  @override
  String get adminUsersFailedUnlinkOpenId => 'Не удалось отвязать OpenID';

  @override
  String adminUsersByAuthor(String author) {
    return 'автор: $author';
  }

  @override
  String get adminUsersListened => 'Прослушано';

  @override
  String get adminUsersStartedAtPosition => 'Начало с позиции';

  @override
  String get adminUsersEndedAtPosition => 'Конец на позиции';

  @override
  String get adminUsersTotalDuration => 'Общая длительность';

  @override
  String get adminUsersStarted => 'Начато';

  @override
  String get adminUsersUpdated => 'Обновлено';

  @override
  String get adminUsersClient => 'Клиент';

  @override
  String get adminUsersDevice => 'Устройство';

  @override
  String get adminUsersOs => 'ОС';

  @override
  String get adminUsersPlayMethod => 'Способ воспроизведения';

  @override
  String get adminUsersPlayDirect => 'Прямое воспроизведение';

  @override
  String get adminUsersPlayDirectStream => 'Прямая потоковая передача';

  @override
  String get adminUsersPlayTranscode => 'Транскодирование';

  @override
  String get adminUsersPlayLocal => 'Локально';

  @override
  String get adminPodcastsCheckNewEpisodesTitle => 'Проверить новые серии';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      'Будут проверены RSS-ленты всех подкастов, а найденные новые серии скачаны (если включена автозагрузка).';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle =>
      'Проверить RSS-ленту и скачать новые серии';

  @override
  String get adminPodcastsCheck => 'Проверить';

  @override
  String get adminPodcastsCheckingForNew => 'Поиск новых серий…';

  @override
  String get adminPodcastsCheckingForNewDots => 'Поиск новых серий...';

  @override
  String get adminPodcastsFailedCheckEpisodes => 'Не удалось проверить серии';

  @override
  String get adminPodcastsCheckFeedsTooltip => 'Проверить ленты на новые серии';

  @override
  String get adminPodcastsNoPodcastsYet => 'Подкастов пока нет';

  @override
  String get adminPodcastsTapPlusHint =>
      'Нажмите +, чтобы найти и добавить шоу';

  @override
  String adminPodcastsEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count серии',
      many: '$count серий',
      few: '$count серии',
      one: '$count серия',
    );
    return '$_temp0';
  }

  @override
  String get adminPodcastsAddPodcast => 'Добавить подкаст';

  @override
  String get adminPodcastsCouldNotFindFeed => 'Не удалось найти ленту подкаста';

  @override
  String get adminPodcastsSearchHint => 'Поиск подкастов…';

  @override
  String get adminPodcastsSearchItunesHint => 'Поиск в iTunes...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return 'Искать в iTunes: «$query»';
  }

  @override
  String get adminPodcastsNoPodcastsFound => 'Подкасты не найдены';

  @override
  String get adminPodcastsRelToday => 'Сегодня';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return '$count нед. назад';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return '$count мес. назад';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return '$count г. назад';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return 'Обновлено: $when';
  }

  @override
  String get adminPodcastsGenreAll => 'Все';

  @override
  String get adminPodcastsGenreArts => 'Искусство';

  @override
  String get adminPodcastsGenreComedy => 'Комедия';

  @override
  String get adminPodcastsGenreEducation => 'Образование';

  @override
  String get adminPodcastsGenreTvFilm => 'ТВ и кино';

  @override
  String get adminPodcastsGenreMusic => 'Музыка';

  @override
  String get adminPodcastsGenreNews => 'Новости';

  @override
  String get adminPodcastsGenreReligion => 'Религия';

  @override
  String get adminPodcastsGenreScience => 'Наука';

  @override
  String get adminPodcastsGenreSports => 'Спорт';

  @override
  String get adminPodcastsGenreTechnology => 'Технологии';

  @override
  String get adminPodcastsGenreBusiness => 'Бизнес';

  @override
  String get adminPodcastsGenreFiction => 'Художественная литература';

  @override
  String get adminPodcastsGenreSocietyCulture => 'Общество и культура';

  @override
  String get adminPodcastsGenreHealthFitness => 'Здоровье и фитнес';

  @override
  String get adminPodcastsGenreTrueCrime => 'Криминал';

  @override
  String get adminPodcastsGenreHistory => 'История';

  @override
  String get adminPodcastsGenreKidsFamily => 'Дети и семья';

  @override
  String get adminPodcastsPodcastFallback => 'Подкаст';

  @override
  String get adminPodcastsEpisodeFallback => 'Серия';

  @override
  String get adminPodcastsNoFeedFound => 'URL ленты не найден';

  @override
  String get adminPodcastsNoFeedAvailable => 'URL ленты недоступен';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return '$title: добавлено в библиотеку';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return 'Не удалось добавить: $title';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count серии в ленте',
      many: '$count серий в ленте',
      few: '$count серии в ленте',
      one: '$count серия в ленте',
    );
    return '$_temp0';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count серии',
      many: '$count серий',
      few: '$count серии',
      one: '$count серия',
    );
    return '+ ещё $_temp0';
  }

  @override
  String get adminPodcastsAdding => 'Добавление…';

  @override
  String get adminPodcastsAddToLibrary => 'Добавить в библиотеку';

  @override
  String get adminPodcastsRemoveShowTitle => 'Удалить шоу?';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return 'Удалить «$title» и все его серии с сервера? Это действие нельзя отменить.';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return 'Удалено: «$title»';
  }

  @override
  String get adminPodcastsFailedRemoveShow => 'Не удалось удалить шоу';

  @override
  String get adminPodcastsRemoveShowTooltip => 'Удалить шоу';

  @override
  String get adminPodcastsSelectMultipleTooltip => 'Выбрать несколько';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return 'Скачано: $count';
  }

  @override
  String get adminPodcastsTabDownloaded => 'Скачано';

  @override
  String get adminPodcastsTabFeed => 'Лента';

  @override
  String get adminPodcastsTabSettings => 'Настройки';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return 'Скачивание: «$title»';
  }

  @override
  String get adminPodcastsFailedDownload => 'Не удалось скачать';

  @override
  String get adminPodcastsDeleteEpisodeTitle => 'Удалить серию?';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return 'Удалить «$title»?';
  }

  @override
  String get adminPodcastsDeleted => 'Удалено';

  @override
  String get adminPodcastsFailed => 'Не удалось';

  @override
  String get adminPodcastsDeleteEpisodesTitle => 'Удалить серии?';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return 'Удалить серии с сервера (выбрано: $count)?';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return 'Удалено серий: $count';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload =>
      'Откройте ленту, чтобы скачать';

  @override
  String get adminPodcastsDownloadingDots => 'Скачивание...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return 'Удалить серии ($count)';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return 'Скачивание серий: $count';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return 'Скачать серии ($count)';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter => 'Искать серии после';

  @override
  String get adminPodcastsSelectDate => 'Выберите дату';

  @override
  String get adminPodcastsMaxEpisodes => 'Макс. серий для скачивания';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return 'Новых серий после $date не найдено';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return 'Найдено новых серий: $count, идёт скачивание';
  }

  @override
  String get adminPodcastsFailedToCheckNew =>
      'Не удалось проверить новые серии';

  @override
  String get adminPodcastsCheckAndDownload => 'Проверить и скачать';

  @override
  String get adminPodcastsMatchPodcast => 'Сопоставить подкаст';

  @override
  String get adminPodcastsMatchPodcastSubtitle =>
      'Поиск в iTunes для обновления обложки и метаданных';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes => 'Автозагрузка новых серий';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle =>
      'Сервер скачивает новые серии автоматически';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle =>
      'Новые серии не скачиваются автоматически';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate =>
      'Не удалось изменить настройку автозагрузки';

  @override
  String get adminPodcastsMaxEpisodesToKeep => 'Макс. серий для хранения';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      '0 — хранить все серии. После автозагрузки новой серии Audiobookshelf удаляет самую старую, если в шоу серий больше лимита.';

  @override
  String get adminPodcastsNoEpisodeLimit => 'Без ограничений';

  @override
  String get adminPodcastsEpisodeLimitInvalid => 'Введите 0 или целое число';

  @override
  String get adminPodcastsCheckSchedule => 'Расписание проверки';

  @override
  String get adminPodcastsFrequency => 'Частота';

  @override
  String get adminPodcastsFreqHourly => 'Каждый час';

  @override
  String get adminPodcastsFreqDaily => 'Каждый день';

  @override
  String get adminPodcastsFreqWeekly => 'Каждую неделю';

  @override
  String get adminPodcastsDay => 'День';

  @override
  String get adminPodcastsTime => 'Время';

  @override
  String get adminPodcastsDaySun => 'Вс';

  @override
  String get adminPodcastsDayMon => 'Пн';

  @override
  String get adminPodcastsDayTue => 'Вт';

  @override
  String get adminPodcastsDayWed => 'Ср';

  @override
  String get adminPodcastsDayThu => 'Чт';

  @override
  String get adminPodcastsDayFri => 'Пт';

  @override
  String get adminPodcastsDaySat => 'Сб';

  @override
  String get adminPodcastsFeedUrl => 'URL ленты';

  @override
  String get adminPodcastsBack => 'Назад';

  @override
  String get adminPodcastsRootOnly => 'Только root';

  @override
  String get adminPodcastsDeleting => 'Удаление...';

  @override
  String get adminPodcastsDeleteEpisode => 'Удалить серию';

  @override
  String adminPodcastsSeasonChip(String season) {
    return 'Сезон $season';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return 'Сер. $number';
  }

  @override
  String get adminPodcastsApplyingMatch => 'Применение сопоставления...';

  @override
  String get adminPodcastsNoResults => 'Нет результатов';

  @override
  String get adminPodcastsPodcastMatched => 'Подкаст сопоставлен и обновлён';

  @override
  String get adminPodcastsFailedMatch => 'Не удалось сопоставить подкаст';

  @override
  String get adminPodcastsSelectAll => 'Выбрать все';

  @override
  String get adminPodcastsSelectAllNew => 'Только новые';

  @override
  String get adminPodcastsSortNewestFirst => 'Сначала новые';

  @override
  String get adminPodcastsSortOldestFirst => 'Сначала старые';

  @override
  String get adminPodcastsEditInfo => 'Править сведения';

  @override
  String get adminPodcastsEditInfoSubtitle =>
      'Название, описание, обложка и другое';

  @override
  String get adminPodcastsEditTitle => 'Правка подкаста';

  @override
  String get adminPodcastsReleaseDate => 'Дата выхода';

  @override
  String get adminPodcastsExplicit => '18+';

  @override
  String get adminPodcastsExplicitSubtitle => 'Пометить подкаст как 18+';

  @override
  String get episodeListEpisodeFallback => 'Серия';

  @override
  String get episodeListUnknownPodcast => 'Неизвестный подкаст';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count серии отмечены как прослушанные',
      many: '$count серий отмечено как прослушанные',
      few: '$count серии отмечены как прослушанные',
      one: '$count серия отмечена как прослушанная',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count серии отмечены как непрослушанные',
      many: '$count серий отмечено как непрослушанные',
      few: '$count серии отмечены как непрослушанные',
      one: '$count серия отмечена как непрослушанная',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes =>
      'Отписаться от новых серий';

  @override
  String get episodeListSubscribeToNewEpisodes => 'Подписаться на новые серии';

  @override
  String get episodeListSubscribeTitle => 'Подписаться на этот подкаст?';

  @override
  String get episodeListSubscribeContent =>
      'Новые серии будут автоматически скачиваться и добавляться в вашу очередь «Absorbing», как только появятся на сервере.';

  @override
  String get episodeListSubscribe => 'Подписаться';

  @override
  String get episodeListShowFinishedEpisodes => 'Показать прослушанные серии';

  @override
  String get episodeListHideFinishedEpisodes => 'Скрыть прослушанные серии';

  @override
  String get episodeListShowSettings => 'Настройки шоу';

  @override
  String get episodeListPlaysNewerToOlder =>
      'Воспроизведение от новых серий к старым';

  @override
  String get episodeListPlaysOlderToNewer =>
      'Воспроизведение от старых серий к новым';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count серии',
      many: '$count серий',
      few: '$count серии',
      one: '$count серия',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count не прослушано',
      many: '$count не прослушано',
      few: '$count не прослушаны',
      one: '$count не прослушана',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => 'Автозагрузка';

  @override
  String get episodeListSubscribedChip => 'Подписка';

  @override
  String get episodeListExplicitChip => '18+';

  @override
  String get episodeListSortNewest => 'Новые';

  @override
  String get episodeListSortOldest => 'Старые';

  @override
  String get episodeListSortBy => 'Сортировка серий';

  @override
  String get episodeListSortPubDate => 'Дата публикации';

  @override
  String get episodeListSortTitle => 'Название';

  @override
  String get episodeListSortSeason => 'Сезон';

  @override
  String get episodeListSortEpisode => 'Номер серии';

  @override
  String get episodeListSortFileName => 'Имя файла';

  @override
  String get episodeListSortReverseHint =>
      'Нажмите ещё раз, чтобы изменить порядок';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return '«$title» добавлено в Absorbing';
  }

  @override
  String get episodeDetailEpisodeFallback => 'Серия';

  @override
  String get episodeDetailMarkedNotFinished => 'Отмечено как непрослушанное';

  @override
  String get episodeDetailMarkedFinishedNice =>
      'Отмечено как прослушанное — отлично!';

  @override
  String get episodeDetailMarkAbsorbedContent =>
      'Прогресс этой серии будет установлен на 100%.';

  @override
  String get episodeDetailResetProgressContent =>
      'Весь прогресс этой серии будет стёрт, она вернётся в начало. Это действие нельзя отменить.';

  @override
  String get episodeDetailToday => 'Сегодня';

  @override
  String get episodeDetailYesterday => 'Вчера';

  @override
  String episodeDetailDaysAgo(int count) {
    return '$count дн. назад';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return '$count нед. назад';
  }

  @override
  String episodeDetailDurationHm(int hours, int minutes) {
    return '$hours ч $minutes мин';
  }

  @override
  String episodeDetailDurationM(int minutes) {
    return '$minutes мин';
  }

  @override
  String get episodeDetailResume => 'Продолжить';

  @override
  String get episodeDetailPlayEpisode => 'Воспроизвести серию';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return 'Серия $number';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return 'Сезон $number';
  }

  @override
  String get editMetadataUpdatedFromMatch =>
      'Метаданные обновлены по результату сопоставления';

  @override
  String editMetadataConfirmMatch(String title) {
    return 'Метаданные этой книги на сервере будут обновлены по записи:\n\n«$title»\n\nВсе поля и обложка на сервере будут перезаписаны.';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return 'Метаданные этой книги на сервере будут обновлены по записи:\n\n«$title», автор: $author\n\nВсе поля и обложка на сервере будут перезаписаны.';
  }

  @override
  String get seriesBooksFindMissingTitle => 'Найти недостающие книги';

  @override
  String get seriesBooksFindMissingContent =>
      'Поиск в Audible книг этой серии, которых может не хватать в вашей библиотеке.\n\nКниги сопоставляются сначала по ASIN (если на вашем сервере у книг есть ASIN), затем по названию. Результаты могут быть не вполне точными.';

  @override
  String get seriesBooksCouldNotFindOnAudible =>
      'Не удалось найти эту серию в Audible';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Отметка «прослушано» будет снята со всех $count книг этой серии.',
      many: 'Отметка «прослушано» будет снята со всех $count книг этой серии.',
      few: 'Отметка «прослушано» будет снята со всех $count книг этой серии.',
      one: 'Отметка «прослушано» будет снята с $count книги этой серии.',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Все $count книги этой серии будут отмечены как прослушанные.',
      many: 'Все $count книг этой серии будут отмечены как прослушанные.',
      few: 'Все $count книги этой серии будут отмечены как прослушанные.',
      one: '$count книга этой серии будет отмечена как прослушанная.',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => 'Снять все отметки';

  @override
  String get seriesBooksShowAllBooks => 'Показать все книги';

  @override
  String get seriesBooksGroupBySubSeries => 'Группировать по подсериям';

  @override
  String get seriesBooksLoadingSubSeries => 'Загрузка подсерий...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      many: '$count книг',
      few: '$count книги',
      one: '$count книга',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => 'Выполнено';

  @override
  String get seriesBooksExplicitBadge => '18+';

  @override
  String get expandedCardStreaming => 'Потоковое воспроизведение';

  @override
  String get expandedCardDeviceFallback => 'Устройство';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$position в «$bookTitle»';
  }

  @override
  String get bookmarksScreenClose => 'Закрыть';

  @override
  String get bookmarksScreenSortNewest => 'Новые';

  @override
  String get bookmarksScreenSortPosition => 'Позиция';

  @override
  String statsScreenStreakDays(int count) {
    return '$count д';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count сеанс';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count сеанса';
  }

  @override
  String get statsScreenDayMon => 'Пн';

  @override
  String get statsScreenDayTue => 'Вт';

  @override
  String get statsScreenDayWed => 'Ср';

  @override
  String get statsScreenDayThu => 'Чт';

  @override
  String get statsScreenDayFri => 'Пт';

  @override
  String get statsScreenDaySat => 'Сб';

  @override
  String get statsScreenDaySun => 'Вс';

  @override
  String statsScreenDurationHm(int h, int m) {
    return '$h ч $m мин';
  }

  @override
  String statsScreenDurationM(int m) {
    return '$m мин';
  }

  @override
  String get statsScreenDurationLessThanMin => '<1 мин';

  @override
  String get statsScreenDurationZero => '0 мин';

  @override
  String statsScreenDurationShortH(int h) {
    return '$h ч';
  }

  @override
  String statsScreenDurationShortM(int m) {
    return '$m мин';
  }

  @override
  String get statsScreenCouldNotLoadItem => 'Не удалось загрузить элемент';

  @override
  String get statsScreenCouldNotFindEpisode => 'Не удалось найти серию';

  @override
  String statsScreenByAuthor(String author) {
    return 'автор: $author';
  }

  @override
  String get statsScreenListened => 'Прослушано';

  @override
  String get sessionEditTitle => 'Правка сеанса';

  @override
  String get sessionDayLabel => 'День';

  @override
  String get sessionEndPosition => 'Конечная позиция';

  @override
  String get sessionEndPositionHint =>
      'Изменение может также обновить ваш текущий прогресс.';

  @override
  String get statsViewSessions => 'Показать сеансы';

  @override
  String statsSessionsForDate(String date) {
    return 'Сеансы за $date';
  }

  @override
  String get statsNoSessionsForDate => 'За этот день сеансов прослушивания нет';

  @override
  String get statsSearchSessions => 'Поиск по сеансам';

  @override
  String get statsNoSessionSearchResults => 'Подходящих сеансов не найдено';

  @override
  String get statsSessionsLoadFailed =>
      'Не удалось загрузить сеансы за этот день';

  @override
  String get sessionDeleteConfirmTitle => 'Удалить сеанс?';

  @override
  String get sessionDeleteConfirmBody =>
      'Сеанс будет удалён, а общее время прослушивания уменьшится на его длительность. Это действие нельзя отменить.';

  @override
  String get sessionSaved => 'Сеанс обновлён';

  @override
  String get sessionDeleted => 'Сеанс удалён';

  @override
  String get sessionSaveFailed => 'Не удалось сохранить изменения';

  @override
  String get sessionDeleteFailed => 'Не удалось удалить этот сеанс';

  @override
  String get statsScreenStartedAtPosition => 'Начало с позиции';

  @override
  String get statsScreenEndedAtPosition => 'Конец на позиции';

  @override
  String get statsScreenTotalDuration => 'Общая длительность';

  @override
  String get statsScreenStarted => 'Начато';

  @override
  String get statsScreenUpdated => 'Обновлено';

  @override
  String get statsScreenClient => 'Клиент';

  @override
  String get statsScreenDevice => 'Устройство';

  @override
  String get statsScreenOs => 'ОС';

  @override
  String get statsScreenPlayMethod => 'Способ воспроизведения';

  @override
  String get statsScreenLoading => 'Загрузка...';

  @override
  String get statsScreenJumpToStart => 'Перейти к началу';

  @override
  String get statsScreenJumpToEnd => 'Перейти к концу';

  @override
  String get statsScreenPlayMethodDirect => 'Прямое воспроизведение';

  @override
  String get statsScreenPlayMethodDirectStream => 'Прямая потоковая передача';

  @override
  String get statsScreenPlayMethodTranscode => 'Транскодирование';

  @override
  String get statsScreenPlayMethodLocal => 'Локально';

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
    return '$day $month $year г., $hour:$minute $ampm';
  }

  @override
  String get statsScreenMonthJan => 'янв.';

  @override
  String get statsScreenMonthFeb => 'февр.';

  @override
  String get statsScreenMonthMar => 'мар.';

  @override
  String get statsScreenMonthApr => 'апр.';

  @override
  String get statsScreenMonthMay => 'мая';

  @override
  String get statsScreenMonthJun => 'июн.';

  @override
  String get statsScreenMonthJul => 'июл.';

  @override
  String get statsScreenMonthAug => 'авг.';

  @override
  String get statsScreenMonthSep => 'сент.';

  @override
  String get statsScreenMonthOct => 'окт.';

  @override
  String get statsScreenMonthNov => 'нояб.';

  @override
  String get statsScreenMonthDec => 'дек.';

  @override
  String get upcomingReleasesTitle => 'Скорые релизы';

  @override
  String get upcomingReleasesRescanTitle => 'Сканировать заново?';

  @override
  String upcomingReleasesRescanContent(int days) {
    return 'Этим результатам $days дн. Даты выхода могли измениться. Выполнить повторное сканирование?';
  }

  @override
  String get upcomingReleasesNotNow => 'Не сейчас';

  @override
  String get upcomingReleasesRescan => 'Сканировать заново';

  @override
  String get upcomingReleasesRescanReleaseDate => 'Обновить дату выхода';

  @override
  String get upcomingReleasesRescanning => 'Повторное сканирование...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return 'Обновлено — $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound => 'Дата выхода не найдена';

  @override
  String get upcomingReleasesRescanFailed =>
      'Не удалось выполнить повторное сканирование';

  @override
  String get upcomingReleasesRemoveFromList => 'Убрать из списка';

  @override
  String get upcomingReleasesRemovedFromList => 'Убрано из списка';

  @override
  String get upcomingReleasesDateChip => 'Дата';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return 'Проверка: $name... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => 'Загрузка серий...';

  @override
  String get upcomingReleasesScannedToday => '(сканировалось сегодня)';

  @override
  String get upcomingReleasesScannedYesterday => '(сканировалось вчера)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '(сканировалось $days дн. назад)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return 'Скоро: $count';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return 'Недавние: $count';
  }

  @override
  String get upcomingReleasesNoneFound =>
      'Скорых и недавних релизов не найдено';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$summary, серий: $count';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return 'Проверено серий в Audible: $count';
  }

  @override
  String upcomingReleasesDateFormat(String month, int day, int year) {
    return '$day $month $year';
  }

  @override
  String upcomingReleasesSequenceLabel(String sequence) {
    return '№$sequence';
  }

  @override
  String get upcomingReleasesBadgeUpcoming => 'СКОРО';

  @override
  String get upcomingReleasesBadgeAdded => 'ДОБАВЛЕНО';

  @override
  String get upcomingReleasesBadgeMissing => 'ОТСУТСТВУЕТ';

  @override
  String get upcomingReleasesScanSettingsTitle => 'Настройки сканирования';

  @override
  String get upcomingReleasesFinishedAfterTitle =>
      'Считать серию завершённой через';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      'Серии, у которых последняя книга старше этого срока, пропускаются при сканировании и перепроверяются лишь раз в месяц-два.';

  @override
  String upcomingReleasesFinishedAfterYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count года',
      many: '$count лет',
      few: '$count года',
      one: '$count год',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesFinishedAfterNever => 'Никогда';

  @override
  String get upcomingReleasesSkippedTitle => 'Пропущенные серии';

  @override
  String get upcomingReleasesSkippedNone => 'Пока ничего не пропущено';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Пропущено: $count',
      many: 'Пропущено: $count',
      few: 'Пропущено: $count',
      one: 'Пропущено: $count',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Последняя книга вышла $count года назад',
      many: 'Последняя книга вышла $count лет назад',
      few: 'Последняя книга вышла $count года назад',
      one: 'Последняя книга вышла $count год назад',
      zero: 'Последняя книга вышла меньше года назад',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched =>
      'Не удалось найти эту серию в Audible';

  @override
  String get upcomingReleasesSkippedScanNow => 'Сканировать сейчас';

  @override
  String get upcomingReleasesSkippedAlwaysScan => 'Всегда сканировать';

  @override
  String get upcomingReleasesSkippedNeverScan => 'Никогда не сканировать';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return 'Найдены новые релизы: $name';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return 'Нового нет: $name';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary =>
      'Этот список получен из другой библиотеки. Выполните повторное сканирование, чтобы обновить его.';

  @override
  String get upcomingReleasesChipUpcoming => 'Скоро';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count отсутствуют',
      many: '$count отсутствуют',
      few: '$count отсутствуют',
      one: '$count отсутствует',
      zero: 'Отсутствуют',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => 'Недостающих книг не найдено';

  @override
  String get upcomingReleasesScanSeries => 'Сканировать серии';

  @override
  String get upcomingReleasesScanUpcomingOption => 'Скорые релизы';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc =>
      'Быстрый поиск новых и скорых книг';

  @override
  String get upcomingReleasesScanDeepOption => 'Глубокое сканирование';

  @override
  String get upcomingReleasesScanDeepOptionDesc =>
      'Ищет также недостающие книги в каждой серии — занимает больше времени';

  @override
  String get upcomingReleasesFirstScanNote =>
      'Первое сканирование проверяет каждую серию в Audible и может занять несколько минут. Последующие будут намного быстрее, когда серии будут отсортированы.';

  @override
  String get upcomingReleasesLastScanReport => 'Отчёт о последнем сканировании';

  @override
  String upcomingReleasesReportChecked(int count) {
    return 'Проверено в Audible: $count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return 'Пропущено: $count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return 'Не найдено в Audible: $count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return 'Не удалось проверить: $count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return 'Найдено: скорых — $upcoming, недавних — $recent';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return 'Найдено: скорых — $upcoming, недавних — $recent, недостающих — $missing';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return '+ ещё $count';
  }

  @override
  String get upcomingReleasesBadgeNew => 'НОВОЕ';

  @override
  String get upcomingReleasesOpenSeries => 'Open series on Audible';

  @override
  String get upcomingReleasesOpenLibrarySeries => 'Открыть серию в библиотеке';

  @override
  String get upcomingReleasesAsinCopied => 'ASIN серии скопирован';

  @override
  String get upcomingReleasesSetSeriesAsin => 'Указать ASIN серии';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      'Найдите серию на audible.com и скопируйте ссылку на страницу. ASIN — это 10-значный код, начинающийся с B0 (например, B08S2YN3YS). Можно вставить и всю ссылку целиком.';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… или ссылка audible.com';

  @override
  String get upcomingReleasesSetAsinSave => 'Сохранить';

  @override
  String get upcomingReleasesSetAsinInvalid => 'В этом тексте ASIN не найден';

  @override
  String get upcomingReleasesSetAsinSaved =>
      'Серия привязана, идёт сканирование';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Убрать $count книги',
      many: 'Убрать $count книг',
      few: 'Убрать $count книги',
      one: 'Убрать $count книгу',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => 'Убрать из этого сканирования';

  @override
  String get upcomingReleasesRemoveThisScanDesc =>
      'Может вернуться при следующем сканировании';

  @override
  String get upcomingReleasesRemoveForever =>
      'Убрать из этого и будущих сканирований';

  @override
  String get upcomingReleasesRemoveForeverDesc =>
      'Попадёт в список убранных, можно восстановить в любое время';

  @override
  String get upcomingReleasesRemovedForeverToast =>
      'Убрано — в будущих сканированиях не появится';

  @override
  String get upcomingReleasesRemovedBooksTitle => 'Убранные книги';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      many: '$count книг',
      few: '$count книги',
      one: '$count книга',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => 'Убранных книг нет';

  @override
  String get upcomingReleasesRestore => 'Восстановить';

  @override
  String get upcomingReleasesRestoredToast => 'Восстановлено';

  @override
  String get upcomingReleasesRestoredNextScan =>
      'Восстановлено — появится после следующего сканирования';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выбрано: $count',
      many: 'Выбрано: $count',
      few: 'Выбрано: $count',
      one: 'Выбрано: $count',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => 'Запросить';

  @override
  String get upcomingReleasesBulkRemove => 'Убрать';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Убрано: $count',
      many: 'Убрано: $count',
      few: 'Убрано: $count',
      one: 'Убрано: $count',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Отправлено $count запроса',
      many: 'Отправлено $count запросов',
      few: 'Отправлено $count запроса',
      one: 'Отправлен $count запрос',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return 'Пропущено: $count';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Пересканировано $count серии',
      many: 'Пересканировано $count серий',
      few: 'Пересканировано $count серии',
      one: 'Пересканирована $count серия',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return 'С новыми книгами: $count';
  }

  @override
  String get seriesExcludeFromScan => 'Исключить из сканирования серий';

  @override
  String get seriesIncludeInScan => 'Включить в сканирование серий';

  @override
  String get homeScreenEpisodeFallback => 'Серия';

  @override
  String get libraryScreenUnknownTitle => 'Без названия';

  @override
  String get playlistDetailDefaultName => 'Плейлист';

  @override
  String playlistDetailItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента',
      many: '$count элементов',
      few: '$count элемента',
      one: '$count элемент',
    );
    return '$_temp0';
  }

  @override
  String get playlistDetailUnfinished => 'Не прослушано';

  @override
  String get playlistDetailRemoveFromPlaylist => 'Убрать из плейлиста';

  @override
  String get playlistDetailDone => 'Выполнено';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return 'Отмечено прослушанными: $count';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return 'Отмечено непрослушанными: $count';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return 'Убрано элементов: $count';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return '«$title» добавлено в Absorbing';
  }

  @override
  String get collectionDetailDefaultName => 'Коллекция';

  @override
  String smartScopeBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      many: '$count книг',
      few: '$count книги',
      one: '$count книга',
    );
    return 'Умная подборка · $_temp0';
  }

  @override
  String get smartScopeNew => 'Новая умная подборка';

  @override
  String get smartScopeNewSubtitle =>
      'Сохраните набор фильтров как список, который обновляется сам';

  @override
  String get smartScopeEditTitle => 'Правка умной подборки';

  @override
  String get smartScopeIcon => 'Значок';

  @override
  String get smartScopePublic => 'Видна всем пользователям';

  @override
  String get smartScopeKobo => 'Синхронизировать с Kobo';

  @override
  String get smartScopeRules => 'Правила';

  @override
  String get smartScopeMatchAll => 'Все условия';

  @override
  String get smartScopeMatchAny => 'Любое условие';

  @override
  String get smartScopeAddRule => 'Добавить правило';

  @override
  String get smartScopeAddGroup => 'Добавить группу';

  @override
  String get smartScopeGroup => 'Группа';

  @override
  String get smartScopeStartFrom => 'Начать с шаблона';

  @override
  String get smartScopeFromScratch => 'Создать с нуля';

  @override
  String get smartScopeTplHasSeries => 'Входит в серию';

  @override
  String get smartScopeTplRecent => 'Добавлено недавно';

  @override
  String get smartScopeTplPdf => 'Только PDF';

  @override
  String get smartScopeTplNoGenres => 'Без жанров';

  @override
  String get smartScopeTplEpub => 'Только EPUB';

  @override
  String get smartScopeCounting => 'Подсчёт...';

  @override
  String get smartScopeSort => 'Сортировка по умолчанию';

  @override
  String get smartScopeAddSort => 'Добавить уровень сортировки';

  @override
  String get smartScopeSortNone =>
      'Сортировка не задана, книги сортируются по названию.';

  @override
  String get smartScopeAscending => 'По возрастанию';

  @override
  String get smartScopeDescending => 'По убыванию';

  @override
  String get smartScopeDelete => 'Удалить умную подборку';

  @override
  String get smartScopeSaveFailed => 'Не удалось сохранить умную подборку';

  @override
  String get smartScopeDeleteFailed => 'Не удалось удалить умную подборку';

  @override
  String get smartScopeLoadFailed => 'Не удалось загрузить умную подборку';

  @override
  String get smartScopeUnsupportedRule =>
      'Это правило можно изменить только в веб-версии BookOrbit. Оно сохранено без изменений.';

  @override
  String get smartScopeAnd => 'и';

  @override
  String get smartScopeDays => 'дн.';

  @override
  String get smartScopeWeeks => 'нед.';

  @override
  String get smartScopeMonths => 'мес.';

  @override
  String get smartScopePickDate => 'Выберите дату';

  @override
  String get smartScopeAddValue => 'Добавить значение';

  @override
  String get smartScopeValue => 'Значение';

  @override
  String get smartScopeCustomFields => 'Пользовательские поля';

  @override
  String get smartScopeAnyProvider => 'Любой источник';

  @override
  String get smartScopeScoreOutstanding => 'Отлично';

  @override
  String get smartScopeScoreGood => 'Хорошо';

  @override
  String get smartScopeScoreFair => 'Средне';

  @override
  String get smartScopeScorePoor => 'Плохо';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => 'До 20 значений';

  @override
  String get scopeFieldTitle => 'Название';

  @override
  String get scopeFieldAuthor => 'Автор';

  @override
  String get scopeFieldSeries => 'Серия';

  @override
  String get scopeFieldSeriesIndex => 'Номер в серии';

  @override
  String get scopeFieldGenre => 'Жанр';

  @override
  String get scopeFieldTag => 'Тег';

  @override
  String get scopeFieldReadStatus => 'Статус чтения';

  @override
  String get scopeFieldReadProgress => 'Прогресс чтения';

  @override
  String get scopeFieldRating => 'Ваша оценка';

  @override
  String get scopeFieldFormat => 'Формат';

  @override
  String get scopeFieldLibrary => 'Библиотека';

  @override
  String get scopeFieldCollection => 'Коллекция';

  @override
  String get scopeFieldPublisher => 'Издатель';

  @override
  String get scopeFieldLanguage => 'Язык';

  @override
  String get scopeFieldPublishedDate => 'Дата публикации';

  @override
  String get scopeFieldPublishedYear => 'Год публикации';

  @override
  String get scopeFieldAddedAt => 'Дата добавления';

  @override
  String get scopeFieldStartedAt => 'Дата начала';

  @override
  String get scopeFieldFinishedAt => 'Дата завершения';

  @override
  String get scopeFieldPageCount => 'Число страниц';

  @override
  String get scopeFieldFileSize => 'Размер файла';

  @override
  String get scopeFieldCommunityRating => 'Рейтинг сообщества';

  @override
  String get scopeFieldCommunityRatingCount => 'Число отзывов сообщества';

  @override
  String get scopeFieldMetadataScore => 'Оценка метаданных';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => 'Описание';

  @override
  String get scopeFieldCover => 'Обложка';

  @override
  String get scopeFieldAudioCover => 'Обложка аудиокниги';

  @override
  String get scopeFieldFileAvailability => 'Наличие файла';

  @override
  String get scopeFieldLockStatus => 'Статус блокировки';

  @override
  String get scopeFieldSeriesStatus => 'Статус серии';

  @override
  String get scopeSortUpdatedAt => 'Дата обновления';

  @override
  String get scopeSortLastReadAt => 'Последнее чтение';

  @override
  String get scopeSortRandom => 'Случайно';

  @override
  String get scopeOpContains => 'содержит';

  @override
  String get scopeOpNotContains => 'не содержит';

  @override
  String get scopeOpStartsWith => 'начинается с';

  @override
  String get scopeOpEndsWith => 'заканчивается на';

  @override
  String get scopeOpEq => 'равно';

  @override
  String get scopeOpNotEq => 'не равно';

  @override
  String get scopeOpIsEmpty => 'пусто';

  @override
  String get scopeOpIsNotEmpty => 'не пусто';

  @override
  String get scopeOpGt => 'больше чем';

  @override
  String get scopeOpGte => 'не менее';

  @override
  String get scopeOpLt => 'меньше чем';

  @override
  String get scopeOpLte => 'не более';

  @override
  String get scopeOpBetween => 'между';

  @override
  String get scopeOpIncludesAny => 'включает любое из';

  @override
  String get scopeOpIncludesAll => 'включает все из';

  @override
  String get scopeOpExcludesAll => 'исключает все из';

  @override
  String get scopeOpBefore => 'до';

  @override
  String get scopeOpAfter => 'после';

  @override
  String get scopeOpWithinLast => 'за последние';

  @override
  String get scopeOpIsMissing => 'отсутствует';

  @override
  String get scopeOpIsPresent => 'имеется';

  @override
  String get scopeOpIsUnread => 'не начата';

  @override
  String get scopeOpIsInProgress => 'в процессе';

  @override
  String get scopeOpIsFinished => 'завершена';

  @override
  String get scopeOpIsLocked => 'заблокирована';

  @override
  String get scopeOpIsUnlocked => 'разблокирована';

  @override
  String get scopeOpIsUpNext => 'следующая в очереди';

  @override
  String get scopeOpIsTrue => 'да';

  @override
  String get scopeOpIsFalse => 'нет';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Подходят $count книги',
      many: 'Подходят $count книг',
      few: 'Подходят $count книги',
      one: 'Подходит $count книга',
      zero: 'Подходящих книг нет',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return 'Удалить «$name»? Это действие нельзя отменить.';
  }

  @override
  String collectionDetailBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      many: '$count книг',
      few: '$count книги',
      one: '$count книга',
    );
    return '$_temp0';
  }

  @override
  String get collectionDetailDone => 'Выполнено';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return '«$title» добавлено в Absorbing';
  }

  @override
  String get audibleSeriesNoBooksFound => 'В Audible книги не найдены';

  @override
  String get audibleSeriesFailedToLoad =>
      'Не удалось загрузить серию из Audible';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return 'В Audible: $total · не хватает: $missing';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return 'В Audible: $total · не хватает: $missing · скоро: $upcoming';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return 'Отсутствуют ($count)';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return 'Скоро ($count)';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return 'Все ($count)';
  }

  @override
  String get audibleSeriesSearching => 'Поиск в Audible...';

  @override
  String get audibleSeriesCompleteSeries => 'У вас есть вся серия!';

  @override
  String get audibleSeriesNoUpcoming => 'Скорых релизов не найдено';

  @override
  String get audibleSeriesUpcomingBadge => 'СКОРО';

  @override
  String get audibleSeriesAbridged => 'Сокращённая версия';

  @override
  String get audibleSeriesRegionTitle => 'Регион Audible';

  @override
  String get audibleSeriesOpenOnAudible => 'Открыть в Audible';

  @override
  String get audibleSeriesAddToCalendar => 'Добавить в календарь';

  @override
  String get audibleSeriesAddToUpcoming => 'Добавить в скорые релизы';

  @override
  String get audibleSeriesAddedToUpcoming => 'Добавлено в скорые релизы';

  @override
  String get audibleSeriesAlreadyInUpcoming =>
      'Уже есть на странице скорых релизов';

  @override
  String get audibleSeriesCouldNotOpenAudible => 'Не удалось открыть Audible';

  @override
  String get audibleSeriesCouldNotOpenCalendar =>
      'Не удалось открыть календарь';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return 'Новая аудиокнига в серии «$seriesName»';
  }

  @override
  String get authorBooksGroupBySeries => 'Группировать по сериям';

  @override
  String get authorBooksList => 'Список';

  @override
  String get authorBooksGrid => 'Сетка';

  @override
  String authorBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      many: '$count книг',
      few: '$count книги',
      one: '$count книга',
    );
    return '$_temp0';
  }

  @override
  String get metadataLookupCover => 'Обложка';

  @override
  String get metadataLookupChooseFields => 'Выберите поля для применения';

  @override
  String metadataLookupApplyFields(int count) {
    return 'Применить ($count)';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return 'Сохранено локально полей: $count';
  }

  @override
  String get metadataLookupOverrideLocalDisplay =>
      'Переопределить локальное отображение';

  @override
  String get equalizerPresetFlat => 'Ровный';

  @override
  String get equalizerPresetVoiceBoost => 'Усиление голоса';

  @override
  String get equalizerPresetBassBoost => 'Усиление басов';

  @override
  String get equalizerPresetTrebleBoost => 'Усиление высоких';

  @override
  String get equalizerPresetPodcast => 'Подкаст';

  @override
  String get equalizerPresetAudiobook => 'Аудиокнига';

  @override
  String get equalizerPresetReduceNoise => 'Шумоподавление';

  @override
  String get equalizerPresetLoudness => 'Громкость';

  @override
  String equalizerEditingSavedNamed(String title) {
    return 'Правка сохранённого эквалайзера для «$title»';
  }

  @override
  String get equalizerEditingSavedGeneric => 'Правка сохранённого эквалайзера';

  @override
  String get equalizerPerBookEq => 'Эквалайзер для книги';

  @override
  String get notesDeleteNoteQuestion => 'Удалить заметку?';

  @override
  String notesDeleteNoteContent(String title) {
    return 'Удалить «$title»?';
  }

  @override
  String get notesExport => 'Экспорт';

  @override
  String get notesNewNote => 'Новая заметка';

  @override
  String get librarySortFilterUpcomingReleases => 'Сканировать серии';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle =>
      'Загрузить фото и биографию каждого автора у поставщика метаданных';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle =>
      'Проверить в Audible скорые и недостающие книги ваших серий';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Осталось $count главы',
      many: 'Осталось $count глав',
      few: 'Осталось $count главы',
      one: 'Осталась $count глава',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetAddMinutesChip(int minutes) {
    return '+$minutes мин';
  }

  @override
  String sleepTimerSheetAddChaptersChip(int count) {
    return '+$count гл.';
  }

  @override
  String sleepTimerSheetMinShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String sleepTimerSheetSecondsShort(int seconds) {
    return '$seconds с';
  }

  @override
  String sleepTimerSheetMinSecShort(int minutes, int seconds) {
    return '$minutes мин $seconds с';
  }

  @override
  String sleepTimerSheetChaptersValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count главы',
      many: '$count глав',
      few: '$count главы',
      one: '$count глава',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetChaptersChip(int count) {
    return '$count гл.';
  }

  @override
  String sleepTimerSheetStartChapterSleep(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Сон после $count главы',
      many: 'Сон после $count глав',
      few: 'Сон после $count глав',
      one: 'Сон после $count главы',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => 'Перемотка назад при засыпании';

  @override
  String get sleepTimerSheetShake => 'Встряхивание';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return 'Добавляет $minutes мин';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => 'Добавляет 1 главу';

  @override
  String get sleepTimerSheetResetsToFull => 'Сбрасывает на полную длительность';

  @override
  String get sleepTimerSheetTabSpecificChapter => 'Глава';

  @override
  String get sleepTimerSheetSpecificNoChapters => 'Нет доступных глав';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return 'Глава $number';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => 'прошло';

  @override
  String get sleepTimerSheetSpecificStart => 'Начало главы';

  @override
  String get sleepTimerSheetSpecificEnd => 'Конец главы';

  @override
  String get sleepTimerSheetSpecificEndsAt => 'Таймер сна завершится в';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return 'через $countdown';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed => 'Этот момент уже прошёл';

  @override
  String get sleepTimerSheetSpecificStartButton => 'Запустить таймер';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => 'Уже прошло';

  @override
  String get timeAm => 'AM';

  @override
  String get timePm => 'PM';

  @override
  String get collectionPickerCollectionFallback => 'Коллекция';

  @override
  String collectionPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get playlistPickerPlaylistFallback => 'Плейлист';

  @override
  String playlistPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get cardChaptersPlayFromChapterTitle => 'Воспроизвести с этой главы?';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return 'Начать воспроизведение с «$title»?';
  }

  @override
  String get cardChaptersPlay => 'Воспроизвести';

  @override
  String get absorbingSharedToday => 'Сегодня';

  @override
  String get absorbingSharedYesterday => 'Вчера';

  @override
  String get absorbingSharedMonday => 'Понедельник';

  @override
  String get absorbingSharedTuesday => 'Вторник';

  @override
  String get absorbingSharedWednesday => 'Среда';

  @override
  String get absorbingSharedThursday => 'Четверг';

  @override
  String get absorbingSharedFriday => 'Пятница';

  @override
  String get absorbingSharedSaturday => 'Суббота';

  @override
  String get absorbingSharedSunday => 'Воскресенье';

  @override
  String get absorbingSharedAm => 'AM';

  @override
  String get absorbingSharedPm => 'PM';

  @override
  String sectionDetailAddedToAbsorbing(String title) {
    return '«$title» добавлено в Absorbing';
  }

  @override
  String get sectionDetailDoneBadge => 'Выполнено';

  @override
  String get homeCustomizeAddGenreTitle => 'Добавить раздел жанра';

  @override
  String get homeCustomizeAddGenreSubtitle =>
      'Выберите жанр для показа на главном экране';

  @override
  String get homeSectionDoneBadge => 'Выполнено';

  @override
  String get tipsSheetQuickBookmarksTitle => 'Быстрые закладки';

  @override
  String get tipsSheetQuickBookmarksDesc =>
      'Нажмите и удерживайте кнопку закладки на любой карточке, чтобы мгновенно поставить закладку на текущей позиции, не открывая список закладок.';

  @override
  String get tipsSheetCoverPlayPauseTitle =>
      'Пауза и воспроизведение по обложке';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      'Нажмите на обложку любой карточки, чтобы начать воспроизведение или поставить на паузу. Включается в «Настройки» → «Карточки Absorbing». Во время воспроизведения на обложке виден бледный значок паузы — так понятно, что её можно нажать.';

  @override
  String get tipsSheetFullScreenPlayerTitle => 'Полноэкранный плеер';

  @override
  String get tipsSheetFullScreenPlayerDesc =>
      'Проведите вверх по любой карточке Absorbing, чтобы открыть полноэкранный плеер. Проведите вниз, чтобы закрыть его.';

  @override
  String get tipsSheetQuickAddAbsorbingTitle =>
      'Быстрое добавление в Absorbing';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      'Проведите вправо по любой книге в списке (серия, автор, результаты поиска), чтобы мгновенно добавить её в очередь Absorbing.';

  @override
  String get tipsSheetShakeExtendSleepTitle => 'Встряхните, чтобы продлить сон';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      'Если таймер сна запущен, встряхните телефон — добавится несколько минут. Количество задаётся в «Настройки» → «Таймер сна».';

  @override
  String get tipsSheetSeriesNavigationTitle => 'Переход по серии';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      'Нажмите на название серии в окне сведений о книге, чтобы увидеть все книги серии в порядке чтения с номерами на обложках.';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => 'Переключение книг свайпом';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      'Проводите влево и вправо на экране Absorbing, чтобы переключаться между книгами в процессе. В режиме ручной очереди карточки работают как очередь: следующая начнёт играть автоматически, когда закончится текущая.';

  @override
  String get tipsSheetTapToSeekTitle => 'Перемотка касанием';

  @override
  String get tipsSheetTapToSeekDesc =>
      'Нажмите в любом месте полосы прогресса главы или книги, чтобы сразу перейти к этой позиции. Для точной перемотки можно также перетаскивать полосы.';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle => 'Время с учётом скорости';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      'Всё показываемое время — позиция, остаток, главы, закладки — пересчитывается с учётом скорости воспроизведения. Слушаете на 1.5x? Время показывает, сколько это займёт на самом деле.';

  @override
  String get tipsSheetPlaybackHistoryTitle => 'История воспроизведения';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      'Нажмите кнопку «История» на любой карточке, чтобы увидеть хронологию всех запусков, пауз, перемоток и смен скорости. Нажмите на событие, чтобы вернуться к этой позиции.';

  @override
  String get tipsSheetAutoRewindTitle => 'Автоперемотка';

  @override
  String get tipsSheetAutoRewindDesc =>
      'Когда вы продолжаете после паузы, Absorb автоматически перематывает на несколько секунд назад, чтобы вы не потеряли нить. Чем дольше вас не было, тем больше перемотка. Настраивается в «Настройках».';

  @override
  String get tipsSheetSeriesQueueModeTitle => 'Режим очереди «Серия»';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      'Когда вы заканчиваете книгу из серии, Absorb может автоматически включить следующую. Выберите режим очереди «Серия» в «Настройках».';

  @override
  String get tipsSheetOfflineModeTitle => 'Режим «Не в сети»';

  @override
  String get tipsSheetOfflineModeDesc =>
      'Нажмите кнопку с самолётом на экране Absorbing, чтобы перейти в режим «Не в сети». Синхронизация остановится, трафик будет экономиться, а в списке останутся только скачанные книги. Удобно в полёте и там, где слабый сигнал.';

  @override
  String get tipsSheetUpcomingReleasesTitle => 'Скорые релизы';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      'На вкладке «Серии» нажмите на вкладку ещё раз, чтобы открыть окно сортировки и фильтров, затем выберите «Скорые релизы» — новые и ожидаемые книги ваших серий, отсортированные по дате выхода.';

  @override
  String get tipsSheetPerBookEqTitle => 'Эквалайзер для каждой книги';

  @override
  String get tipsSheetPerBookEqDesc =>
      'Каждая книга помнит свои настройки эквалайзера. Настройте звук один раз для фантастической эпопеи — и в следующий раз она зазвучит так же.';

  @override
  String get tipsSheetPerBookSpeedTitle => 'Скорость для каждой книги';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      'Скорость воспроизведения сохраняется для каждой книги. Слушайте научно-популярное на 1.5x, а драму на 1.0x, не меняя её каждый раз.';

  @override
  String get tipsSheetAutoSleepWindowTitle => 'Автоматическое окно сна';

  @override
  String get tipsSheetAutoSleepWindowDesc =>
      'Укажите часы, когда вы обычно засыпаете, и таймер сна запустится сам, если вы начнёте слушать в это время.';

  @override
  String get tipsSheetSleepFadeChimeTitle => 'Затухание и сигнал сна';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      'Когда таймер сна заканчивается, звук плавно затихает, а по желанию звучит сигнал, чтобы воспроизведение не обрывалось на полуслове.';

  @override
  String get tipsSheetCarModeTitle => 'Режим «В машине»';

  @override
  String get tipsSheetCarModeDesc =>
      'Нажмите значок машины, чтобы перейти в режим с огромными кнопками, удобный и безопасный за рулём.';

  @override
  String get tipsSheetAudibleSeriesTitle => 'Поиск серий в Audible';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      'Откройте серию и в меню (три точки) загрузите полный список серии из Audible, включая недостающие книги и те, что вы ещё не начали.';

  @override
  String get tipsSheetTranscribeBookmarkTitle => 'Транскрибация закладок';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      'Превращайте аудио у любой закладки в текст прямо на устройстве. Включите это в «Настройки» → «Дополнительно» → «Транскрипция» и скачайте модель, затем нажмите «Транскрибировать» на закладке — текст попадёт в её заметку, его можно поправить или поделиться им.';

  @override
  String get tipsSheetFindBetweenFormatsTitle =>
      'Переход между аудиокнигой и электронной книгой';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      'Если транскрипция включена и книга скачана, поставьте на паузу и нажмите в плеере «Найти позицию в электронной книге» — она откроется на только что услышанном отрывке. В читалке выделите текст и нажмите значок наушников, чтобы запустить аудиокнигу с этого места.';

  @override
  String get tipsSheetShareQuoteTitle => 'Поделиться цитатой';

  @override
  String get tipsSheetShareQuoteDesc =>
      'Поделитесь выделенным фрагментом электронной книги или заметкой закладки в виде изображения с цитатой поверх обложки. Ищите пункт «Поделиться» у выделений и в окне закладок.';

  @override
  String get tipsSheetClipExportTitle => 'Экспорт аудиофрагментов';

  @override
  String get tipsSheetClipExportDesc =>
      'Откройте закладку и нажмите «Экспорт фрагмента», чтобы обрезать и сохранить короткий аудиофрагмент книги вместе с обложкой — отлично подходит, чтобы поделиться любимой сценой.';

  @override
  String get tipsSheetAllHighlightsTitle => 'Все выделения в одном месте';

  @override
  String get tipsSheetAllHighlightsDesc =>
      'На странице «Все закладки» есть вкладка «Выделения», где собраны все выделения из электронных книг. Нажмите на выделение, чтобы поделиться им или вернуться в книгу.';

  @override
  String get tipsSheetVolumeKeyPagesTitle => 'Листание клавишами громкости';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      'Листайте страницы электронной книги клавишами громкости. Включается в настройках читалки: обычное или зеркальное направление; можно оставить включённым, даже когда играет аудио.';

  @override
  String get tipsSheetSettingsSyncTitle => 'Синхронизация настроек';

  @override
  String get tipsSheetSettingsSyncDesc =>
      'Синхронизируйте настройки, скорости книг и порядок Absorbing между устройствами через собственный сервер WebDAV. Настраивается в «Настройки» → «Резервное копирование и синхронизация».';

  @override
  String get tipsSheetNavLongPressTitle => 'Долгое нажатие на нижние вкладки';

  @override
  String get tipsSheetNavLongPressDesc =>
      'Удерживайте вкладку «Главная», чтобы переключить библиотеку с любой страницы. Удерживайте вкладку «Библиотека», чтобы сразу перейти к поиску.';

  @override
  String get bookCardUnknownTitle => 'Без названия';

  @override
  String get bookCardExplicitBadge => '18+';

  @override
  String get bookCardDone => 'Выполнено';

  @override
  String get bookCardSaved => 'Сохранено';

  @override
  String get episodeRowEpisode => 'Серия';

  @override
  String get episodeRowToday => 'Сегодня';

  @override
  String get episodeRowYesterday => 'Вчера';

  @override
  String episodeRowDaysAgo(int count) {
    return '$count дн. назад';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return '$count нед. назад';
  }

  @override
  String episodeRowDurationHm(int hours, int minutes) {
    return '$hours ч $minutes мин';
  }

  @override
  String episodeRowDurationM(int minutes) {
    return '$minutes мин';
  }

  @override
  String episodeRowSeasonShort(String number) {
    return 'С$number';
  }

  @override
  String episodeRowEpisodeShort(String number) {
    return 'Э$number';
  }

  @override
  String get librarySearchResultsExplicitBadge => '18+';

  @override
  String get librarySearchResultsDone => 'Выполнено';

  @override
  String get librarySearchResultsSaved => 'Сохранено';

  @override
  String librarySearchResultsSequence(String number) {
    return '№$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => 'Неизвестная серия';

  @override
  String get librarySearchResultsUnknownEpisode => 'Неизвестная серия подкаста';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      many: '$count книг',
      few: '$count книги',
      one: '$count книга',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => '18+';

  @override
  String get libraryGridTilesDone => 'Выполнено';

  @override
  String get libraryGridTilesSaved => 'Сохранено';

  @override
  String libraryGridTilesSequence(String number) {
    return '№$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => 'Неизвестная серия';

  @override
  String get seriesCardUnknownSeries => 'Неизвестная серия';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      many: '$count книг',
      few: '$count книги',
      one: '$count книга',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => 'Точная перемотка';

  @override
  String get cardProgressQuarterSpeed => 'Четверть скорости';

  @override
  String get cardProgressHalfSpeed => 'Половина скорости';

  @override
  String cardProgressChapterPrefix(String number) {
    return 'Глава $number';
  }

  @override
  String get cardEdgeProgressFineScrubbing => 'Точная перемотка';

  @override
  String get cardEdgeProgressQuarterSpeed => 'Четверть скорости';

  @override
  String get cardEdgeProgressHalfSpeed => 'Половина скорости';

  @override
  String get authSessionExpired => 'Сеанс истёк. Войдите снова.';

  @override
  String authCannotReachServer(String url) {
    return 'Не удалось подключиться к серверу $url';
  }

  @override
  String get authInvalidUsernameOrPassword =>
      'Неверное имя пользователя или пароль';

  @override
  String get authInvalidApiKey => 'Неверный ключ API';

  @override
  String get authLoginFailedDetail =>
      'Не удалось войти — проверьте адрес сервера и учётные данные';

  @override
  String get authUnexpectedServerResponse => 'Неожиданный ответ сервера';

  @override
  String get authSsoUnexpectedResponse => 'SSO вернул неожиданный ответ';

  @override
  String get authSwitchedToLocalServer => 'Переключено на локальный сервер';

  @override
  String get authSwitchedToRemoteServer => 'Переключено на удалённый сервер';

  @override
  String get lpDeletedFinishedDownload => 'Прослушанная загрузка удалена';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'скачиваются $count новые серии',
      many: 'скачивается $count новых серий',
      few: 'скачиваются $count новые серии',
      one: 'скачивается $count новая серия',
    );
    return '$showTitle: $_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return '$showTitle: добавлено в начало очереди';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return '$showTitle: добавлено в очередь вторым';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return '$showTitle: добавлено в конец очереди';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return 'Скачана новая серия: $showTitle';
  }

  @override
  String get statsWeekStartsOn => 'Неделя начинается с';

  @override
  String get episodeListNewEpisodePosition => 'Место новой серии';

  @override
  String get episodeListPositionTop => 'Начало очереди';

  @override
  String get episodeListPositionSecond => 'Вторая в очереди';

  @override
  String get episodeListPositionEnd => 'Конец очереди';

  @override
  String get episodeListPositionNone => 'Не добавлять в очередь';

  @override
  String get episodeListPositionNoneDesc =>
      'Уведомление и загрузка сохраняются';

  @override
  String sleepRewindUndoNote(int minutes) {
    return 'Если нажать «Воспроизвести» в течение $minutes мин, перемотка отменится';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Очередь: скачивается $count элемента',
      many: 'Очередь: скачивается $count элементов',
      few: 'Очередь: скачивается $count элемента',
      one: 'Очередь: скачивается $count элемент',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Скачиваются $count книги',
      many: 'Скачивается $count книг',
      few: 'Скачиваются $count книги',
      one: 'Скачивается $count книга',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Скачиваются $count серии',
      many: 'Скачивается $count серий',
      few: 'Скачиваются $count серии',
      one: 'Скачивается $count серия',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName => 'Ход загрузки';

  @override
  String get downloadNotifProgressChannelDesc =>
      'Показывает ход загрузки аудиокниг';

  @override
  String get downloadNotifAlertChannelName => 'Оповещения о загрузке';

  @override
  String get downloadNotifAlertChannelDesc =>
      'Уведомления о завершении или сбое загрузки';

  @override
  String get downloadNotifDownloadingTitle => 'Загрузка…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Активны $count загрузки',
      many: 'Активно $count загрузок',
      few: 'Активны $count загрузки',
      one: 'Активна $count загрузка',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return 'Загрузка: $title';
  }

  @override
  String get downloadNotifStartingLabel => 'Запуск…';

  @override
  String get downloadNotifCompleteTitle => 'Загрузка завершена';

  @override
  String downloadNotifCompleteBody(String title) {
    return '$title можно слушать без сети';
  }

  @override
  String get downloadNotifFailedTitle => 'Сбой загрузки';

  @override
  String get upcomingNotifChannelName => 'Сканирование скорых релизов';

  @override
  String get upcomingNotifChannelDesc =>
      'Показывает ход сканирования скорых релизов';

  @override
  String get upcomingNotifScanTitle => 'Сканирование скорых релизов';

  @override
  String get upcomingNotifStartingScan => 'Запуск сканирования…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return 'Проверка: $seriesName… ($current/$total)';
  }

  @override
  String get upcomingNotifFoundTitle => 'Найдены скорые релизы!';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$series сериях',
      many: '$series сериях',
      few: '$series сериях',
      one: '$series серии',
    );
    return 'Скорых релизов: $books, в $_temp0';
  }

  @override
  String get androidAutoTabContinue => 'Продолжить';

  @override
  String get androidAutoTabLibrary => 'Библиотека';

  @override
  String get androidAutoTabDownloads => 'Сохраненные';

  @override
  String get settingsSearchHint => 'Поиск настроек...';

  @override
  String get settingsSearchNoResults => 'Подходящих настроек нет';

  @override
  String get carConnectAutoplay =>
      'Начинать воспроизведение при подключении Android Auto';

  @override
  String get carConnectAutoplayIos =>
      'Начинать воспроизведение при подключении CarPlay';

  @override
  String get carConnectAutoplayOnSubtitle =>
      'Последняя книга, которую вы слушали, включится сама при подключении к машине';

  @override
  String get carConnectAutoplayOffSubtitle =>
      'Воспроизведение ждёт, пока вы нажмёте «Воспроизвести»';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => 'Использовать с Siri';

  @override
  String get siriStatusOn =>
      'Включено. Siri может находить и включать ваши книги и подкасты по названию.';

  @override
  String get siriStatusAsk =>
      'Разрешите Siri находить и включать ваши книги и подкасты по названию.';

  @override
  String get siriStatusOff =>
      'Siri отключена для Absorb. Включите её в настройках iOS.';

  @override
  String get siriAllow => 'Разрешить';

  @override
  String get siriOpenSettings => 'Открыть настройки';

  @override
  String get siriThingsToSay => 'Что можно сказать';

  @override
  String get siriExamples =>
      '«Включи [название книги] в Absorb»\n«Включи [название серии] в Absorb»\n«Включи что-нибудь от [автор] в Absorb»\n«Включи последнюю серию [подкаст] в Absorb»\n«Продолжи Absorb»\n«Перемотай назад в Absorb»\n«Следующая глава в Absorb»\n«Поставь таймер сна в Absorb»\n«Добавь закладку в Absorb»\n«Что я слушаю в Absorb»';

  @override
  String get siriShortcutsNote =>
      'Продолжение, пауза, перемотка, главы, таймер сна, закладки и то, что сейчас играет, работают и без этого разрешения. Они также доступны в приложении «Быстрые команды» для автоматизаций и кнопки действий.';

  @override
  String get carBookOrder => 'Порядок книг в машине';

  @override
  String get carBookOrderReverse => 'Обратный порядок книг';

  @override
  String get carBookOrderReverseSubtitle =>
      'От Я к А или сначала самые старые добавленные';

  @override
  String get carPodcastOrder => 'Порядок подкастов в машине';

  @override
  String get carEpisodesOldestFirst => 'Сначала старые серии';

  @override
  String get carEpisodesOldestFirstSubtitle =>
      'Для шоу, которые слушают с самого начала';

  @override
  String get androidAutoCatBooks => 'Книги';

  @override
  String get androidAutoCatSeries => 'Серии';

  @override
  String get androidAutoCatAuthors => 'Авторы';

  @override
  String get androidAutoCatCollections => 'Коллекции';

  @override
  String get androidAutoCatPlaylists => 'Плейлисты';

  @override
  String get showTipsAgain => 'Показать советы снова';

  @override
  String get showTipsAgainSubtitle => 'Вернуть скрытые советы по функциям';

  @override
  String get tipsRestored => 'Советы восстановлены';

  @override
  String get resetSpeedPresets => 'Сбросить пресеты скорости';

  @override
  String get resetSpeedPresetsSubtitle =>
      'Вернуть стандартные значения скорости воспроизведения';

  @override
  String get speedPresetsReset => 'Пресеты скорости сброшены';

  @override
  String get editAuthor => 'Правка автора';

  @override
  String get authorName => 'Имя';

  @override
  String get authorImage => 'Изображение автора';

  @override
  String get authorRemoveImage => 'Убрать изображение';

  @override
  String get authorRemoveImageTitle => 'Убрать изображение автора?';

  @override
  String get authorRemoveImageConfirm =>
      'Изображение будет удалено на сервере.';

  @override
  String get authorImageRemoved => 'Изображение убрано';

  @override
  String get authorImageFailed => 'Не удалось обновить изображение автора';

  @override
  String get authorUpdated => 'Автор обновлён';

  @override
  String get authorUpdateFailed => 'Не удалось обновить автора';

  @override
  String get authorMatched => 'Автор обновлён по результату сопоставления';

  @override
  String get authorNoMatchFound => 'Совпадений не найдено';

  @override
  String authorMergedInto(String name) {
    return 'Объединено с $name';
  }

  @override
  String get authorQuickMatchHint =>
      'Подтянуть имя, ASIN, описание и изображение из Audible для выбранного региона.';

  @override
  String get region => 'Регион';

  @override
  String get editTabDetails => 'Сведения';

  @override
  String get editTabCover => 'Обложка';

  @override
  String get editTabMatch => 'Сопоставление';

  @override
  String get editTabEmbed => 'Встраивание';

  @override
  String get chapterEditorTitle => 'Правка глав';

  @override
  String get chapterNotConnected => 'Нет подключения к серверу';

  @override
  String get chapterErrorFirstNotZero =>
      'Первая глава должна начинаться с 0:00';

  @override
  String get chapterErrorStartAfterPrevious =>
      'Начало должно быть позже предыдущей главы';

  @override
  String get chapterErrorStartBeforeEnd =>
      'Начало должно быть раньше конца книги';

  @override
  String get chapterErrorTitleRequired => 'Укажите название';

  @override
  String get chapterEditStartTitle => 'Правка времени начала';

  @override
  String get chapterTimeHintSeconds => 'Секунды';

  @override
  String get chapterTimeHintFull => 'ЧЧ:ММ:СС или секунд';

  @override
  String get chapterInvalidTime => 'Неверное время';

  @override
  String get chapterLocked => 'Глава заблокирована';

  @override
  String get chapterAllLocked => 'Все главы заблокированы';

  @override
  String chapterTrackTitle(int number) {
    return 'Трек $number';
  }

  @override
  String get chapterNoAudioForPosition => 'Для этой позиции нет аудио';

  @override
  String get chapterCouldNotPlayPreview => 'Предпросмотр не удался';

  @override
  String chapterStartSetTo(String time) {
    return 'Начало установлено на $time';
  }

  @override
  String get chapterAddNumberedTitle => 'Добавить нумерацию глав';

  @override
  String chapterNextPreview(String first, String second) {
    return 'Далее: «$first», «$second», ...';
  }

  @override
  String get chapterHowMany => 'Сколько глав';

  @override
  String get add => 'Добавить';

  @override
  String get chapterCountRange => 'Введите число от 1 до 150';

  @override
  String get chapterTitlesUpdated => 'Названия глав обновлены';

  @override
  String get chaptersApplied => 'Главы применены';

  @override
  String get chapterDiscardTitle => 'Отменить изменения?';

  @override
  String get chapterDiscardMessage => 'Вернуться к сохранённым главам.';

  @override
  String get chapterRemoveAllTitle => 'Убрать все главы?';

  @override
  String get chapterRemoveAllMessage => 'Все главы этой книги будут убраны.';

  @override
  String get chapterAllRemoved => 'Все главы убраны';

  @override
  String get chapterFixHighlighted => 'Сначала исправьте выделенные главы';

  @override
  String get chaptersUpdated => 'Главы обновлены';

  @override
  String get ok => 'OK';

  @override
  String get chapterSaveButton => 'Сохранить главы';

  @override
  String get chapterAddHint => 'Добавить главу (например, «Глава 01»)';

  @override
  String get chapterAddTooltip => 'Добавить главы';

  @override
  String get chapterRemoveAll => 'Убрать все';

  @override
  String get chapterShiftTimes => 'Сдвинуть время';

  @override
  String get chapterFromTracks => 'По трекам';

  @override
  String get chapterLookup => 'Найти';

  @override
  String get chapterShowSeconds => 'Показывать секунды';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String get chapterLoopCut => 'Повторять фрагмент';

  @override
  String get chapterFindStart => 'Найти начало';

  @override
  String get chapterFindStartListening => 'Прослушивание вокруг метки';

  @override
  String get chapterFindStartNone => 'Ничто здесь не похоже на начало главы';

  @override
  String get chapterFindStartWider => 'Искать шире';

  @override
  String get chapterFindStartCeiling =>
      'Поиск шёл в пределах получаса от метки. Начало находится дальше или объявления главы в записи нет.';

  @override
  String get chapterFindStartStrong => 'Похоже на эту главу';

  @override
  String get chapterFindStartMaybe => 'Слова, похожие на главу';

  @override
  String chapterFindStartGap(String seconds) {
    return 'пауза $seconds с';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return 'Поиск: от $from до $to';
  }

  @override
  String get chapterFindStartNeedsModel =>
      'Сначала включите транскрипцию в «Настройках» и скачайте модель';

  @override
  String get chapterFindStartUseThis => 'Использовать';

  @override
  String chapterFindStartTitle(String title) {
    return 'Название: $title';
  }

  @override
  String get chapterShiftBySeconds => 'Сдвиг (секунды)';

  @override
  String get chapterShiftHint =>
      'Сдвигает все незаблокированные главы. Отрицательное значение сдвигает их раньше.';

  @override
  String get chapterTitleHint => 'Название главы';

  @override
  String get chapterStopPreview => 'Остановить прослушивание';

  @override
  String get chapterPreviewFromHere => 'Прослушать отсюда';

  @override
  String get chapterScrubHint =>
      'Перетащите или сдвиньте, чтобы переместить начало';

  @override
  String chapterStartAt(String time) {
    return 'Начало в $time';
  }

  @override
  String get chapterUnlock => 'Разблокировать';

  @override
  String get chapterLock => 'Заблокировать';

  @override
  String get chapterInsertBelow => 'Вставить ниже';

  @override
  String get chapterFindTitle => 'Найти главы';

  @override
  String get chapterFindSubtitle => 'Ищет главы в Audible/Audnexus по ASIN.';

  @override
  String get chapterEnterAsin => 'Введите ASIN';

  @override
  String get chapterLookupFailed => 'Поиск не удался — проверьте ASIN';

  @override
  String get chapterNoChaptersFound => 'Для этого ASIN главы не найдены';

  @override
  String get chapterRemoveBranding =>
      'Удалить брендинг Audible (вступление/заключение)';

  @override
  String chapterFoundCount(int count) {
    return '$count Глав найдено';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  Книга $book';
  }

  @override
  String get chapterAudibleLonger =>
      'Версия Audible длиннее вашего файла - более поздние главы могут не совпадать.';

  @override
  String get chapterAudibleShorter =>
      'Версия Audible короче, чем ваш файл - главы могут не совпадать.';

  @override
  String get chapterTitlesOnly => 'Только заголовки';

  @override
  String get chapterApplyChapters => 'Применить главы';

  @override
  String get coverSearchTitle => 'Поиск обложек';

  @override
  String get coverSearchRefineHint =>
      'Уточните название/автор для очистки результата - это не меняет книгу.';

  @override
  String get coverNoneFound => 'Обложки не найдены';

  @override
  String get coverEnterTitleFirst => 'Введите сначала название';

  @override
  String get coverUpdated => 'Обложка обновлена';

  @override
  String get coverCouldNotUpdate => 'Не удается обновить обложку';

  @override
  String get coverApply => 'Применить обложку';

  @override
  String get coverUnknownResolution => 'Неизвестное разрешение';

  @override
  String get embedIntro =>
      'Вставить метаданные в аудио файлы, включая обложку и главы.';

  @override
  String get embedBackupOption =>
      'Сначала сделайте резервную копию аудио файлов';

  @override
  String get embedNoteInFolder =>
      'Метаданные будут встроены в аудиофайлы в папку аудиокниг.';

  @override
  String get embedNoteMultiTrack =>
      'Главы не встроить в мульти-трековые аудиокниги.';

  @override
  String get embedNoteNavigateAway =>
      'После запуска задачи вы можете уйти с этой страницы.';

  @override
  String get embedStartButton => 'Запустить вставку метаданных';

  @override
  String embedProgress(String percent) {
    return 'Встраивание $percent%';
  }

  @override
  String get embedProgressIndeterminate => 'Встраивание...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent% - продолжит запуск, если вы покинете эту страницу';
  }

  @override
  String get taskStarting => 'Запуск...';

  @override
  String get embedBackupNoteIntro =>
      'Резервная копия ваших оригинальных аудиофайлов будет сохранена на сервере в ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro => '. Периодически очищайте кэш элементов.';

  @override
  String get embedDialogTitle => 'Встроенные метаданные';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# audio files',
      one: '# audio file',
    );
    return 'Встроить метаданные в $_temp0? Аудиофайлы будут перезаписаны$backup.';
  }

  @override
  String get embedConfirmBackupClause => ' (оригиналы резервных копий сначала)';

  @override
  String get embedConfirmAction => 'Встроить';

  @override
  String get embedCouldNotStart => 'Невозможно начать вставку';

  @override
  String get embedStarted => 'Встраивание начато';

  @override
  String get embedComplete => 'Встраивание завершено';

  @override
  String get embedFailed => 'Не удалось встроить';

  @override
  String get encodeComplete => 'Кодирование завершено';

  @override
  String get encodeFailedTask => 'Ошибка кодирования';

  @override
  String encodeProgress(String percent) {
    return 'Кодирование $percent%';
  }

  @override
  String get encodeProgressIndeterminate => 'Кодирование...';

  @override
  String get adminApiKeys => 'API-ключи';

  @override
  String get adminApiKeysSubtitle => 'Программные токены доступа';

  @override
  String get adminApiKeysNewTitle => 'Новый API-ключ';

  @override
  String get adminApiKeysName => 'Название';

  @override
  String get adminApiKeysNameHint => 'например Home Assistant';

  @override
  String get adminApiKeysOwner => 'Пользователь';

  @override
  String get adminApiKeysExpiration => 'Срок действия';

  @override
  String get adminApiKeysActive => 'Активный';

  @override
  String get adminApiKeysActiveSub => 'Ключ работает сразу же после создания';

  @override
  String get adminApiKeysInactive => 'Неактивен';

  @override
  String get adminApiKeysExpired => 'Истек срок';

  @override
  String get adminApiKeysCreate => 'Создать ключ';

  @override
  String get adminApiKeysCreated => 'API-ключ создан';

  @override
  String get adminApiKeysTokenLabel => 'Ваш новый API-ключ';

  @override
  String get adminApiKeysCopyWarning =>
      'Скопируйте этот ключ сейчас. Для безопасности он не будет показан снова.';

  @override
  String get adminApiKeysCopy => 'Копировать';

  @override
  String get adminApiKeysCopied => 'Скопирован в буфер обмена';

  @override
  String get adminApiKeysDone => 'Готово';

  @override
  String get adminApiKeysDeleteTitle => 'Отозвать API-ключ?';

  @override
  String get adminApiKeysDeleted => 'API-ключ отозван';

  @override
  String get adminApiKeysRevoke => 'Отозвать';

  @override
  String get adminApiKeysSetActive => 'Активировать';

  @override
  String get adminApiKeysSetInactive => 'Деактивировать';

  @override
  String get adminApiKeysFailedCreate => 'Не удалось создать API-ключ';

  @override
  String get adminApiKeysFailedDelete => 'Не удалось отозвать API ключ';

  @override
  String get adminApiKeysFailedUpdate => 'Не удалось обновить API-ключ';

  @override
  String get adminApiKeysEmpty => 'API-ключей еще нет';

  @override
  String get adminApiKeysEmptySub =>
      'Создайте, чтобы приложения и скрипты дошли до вашего сервера';

  @override
  String get adminApiKeysNeverUsed => 'Не использовался';

  @override
  String get adminApiKeysNeverExpires => 'Без срока действия';

  @override
  String get adminApiKeysNameRequired => 'Введите имя';

  @override
  String get adminApiKeysUserRequired => 'Выберите пользователя';

  @override
  String get adminApiKeysExpNever => 'Не ограничен';

  @override
  String get adminApiKeysExp7d => '7 дней';

  @override
  String get adminApiKeysExp30d => '30 дней';

  @override
  String get adminApiKeysExp90d => '90 дней';

  @override
  String get adminApiKeysExp1y => '1 год';

  @override
  String adminApiKeysLastUsed(String time) {
    return 'Последнее использование $time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return 'Истекает $date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return 'Отозвать \"$name\"? Приложения с этим ключом немедленно потеряют доступ.';
  }

  @override
  String get endOfEpisode => 'Окончание серии';

  @override
  String get sleepTimerSheetEpisodeSleepStart => 'Сон в конце серии';

  @override
  String get bookmarkListen => 'Прослушать';

  @override
  String get bookmarkPause => 'Пауза';

  @override
  String get bookmarkPreviewFailed => 'Не удалось воспроизвести это место.';

  @override
  String get clipExport => 'Экспорт фрагмента';

  @override
  String get clipJumpToStart => 'Перейти к началу';

  @override
  String get clipJumpToEnd => 'Перейти к концу';

  @override
  String get clipSetStart => 'Задать начало';

  @override
  String get clipSetEnd => 'Задать конец';

  @override
  String get clipInLabel => 'Начало';

  @override
  String get clipOutLabel => 'Конец';

  @override
  String get clipSave => 'Сохранить фрагмент';

  @override
  String clipExportSaved(String filename) {
    return 'Сохранено: $filename';
  }

  @override
  String get clipExportClamped =>
      'Фрагмент сохранён, укорочен до конца этого трека';

  @override
  String get clipExportFailed => 'Не удалось экспортировать фрагмент.';

  @override
  String get clipDownloadToExport =>
      'Чтобы экспортировать фрагмент на iPhone, сначала скачайте эту книгу.';

  @override
  String get fsPickerTitle => 'Выберите папку';

  @override
  String get fsServerRoot => 'Корень сервера';

  @override
  String get fsEmptyFolder => 'Вложенных папок нет';

  @override
  String get fsUseThisFolder => 'Использовать эту папку';

  @override
  String get adminLibrariesManage => 'Библиотеки';

  @override
  String get adminLibrariesManageSubtitle => 'Создание, правка и порядок';

  @override
  String get adminUploadTitle => 'Загрузка медиа на сервер';

  @override
  String get adminUploadSubtitle => 'Добавьте книги и подкасты из файлов';

  @override
  String get adminUploadNoLibraries =>
      'Создайте библиотеку, прежде чем загружать медиа.';

  @override
  String get adminUploadDestination => 'Назначение';

  @override
  String get adminUploadFolder => 'Папка библиотеки';

  @override
  String get adminUploadDetails => 'Сведения об элементе';

  @override
  String get adminUploadOptional => 'Необязательно';

  @override
  String get adminUploadAutoMetadata => 'Автоматически загружать метаданные';

  @override
  String get adminUploadAutoMetadataSubtitle =>
      'Заполнить название, автора и серию по лучшему совпадению';

  @override
  String get adminUploadMetadataProvider => 'Поставщик метаданных';

  @override
  String get adminUploadMetadataSearching => 'Поиск метаданных...';

  @override
  String get adminUploadMetadataNoResults =>
      'Совпадений метаданных не найдено. Элемент всё равно можно загрузить.';

  @override
  String get adminUploadMetadataFailed =>
      'Не удалось найти метаданные. Элемент всё равно можно загрузить.';

  @override
  String get adminUploadDestinationPreview => 'Папка назначения на сервере';

  @override
  String get adminUploadFiles => 'Файлы';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => 'Выбрать файлы';

  @override
  String get adminUploadAddFiles => 'Добавить файлы';

  @override
  String get adminUploadBookFilesHint =>
      'Выберите аудио- или электронные файлы. Можно также добавить обложки и файлы метаданных.';

  @override
  String get adminUploadPodcastFilesHint =>
      'Выберите один или несколько аудиофайлов. Можно также добавить обложки и файлы метаданных.';

  @override
  String get adminUploadUnsupportedFiles =>
      'Некоторые выбранные файлы не поддерживаются Audiobookshelf.';

  @override
  String get adminUploadFilePickerFailed =>
      'Не удалось открыть выбранные файлы.';

  @override
  String get adminUploadTitleRequired => 'Введите название';

  @override
  String get adminUploadLibraryRequired => 'Выберите библиотеку';

  @override
  String get adminUploadFolderRequired => 'Выберите папку библиотеки';

  @override
  String get adminUploadFilesRequired => 'Выберите хотя бы один файл';

  @override
  String get adminUploadPodcastFileRequired =>
      'Выберите хотя бы один аудиофайл для этого подкаста.';

  @override
  String get adminUploadBookFileRequired =>
      'Выберите хотя бы один аудиофайл или файл электронной книги для этой книги.';

  @override
  String get adminUploadPathCheckFailed =>
      'Не удалось проверить папку назначения. Ничего не загружено.';

  @override
  String get adminUploadDestinationExists =>
      'Такая папка назначения уже есть на сервере.';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return 'Это место назначения уже занято: «$title».';
  }

  @override
  String get adminUploadAddToExistingTitle => 'Папка уже существует';

  @override
  String adminUploadAddToExisting(String title) {
    return 'Эта папка принадлежит «$title». Добавить в неё файлы? Сервер подхватит их при следующем сканировании.';
  }

  @override
  String get adminUploadAddToExistingNoItem =>
      'Такая папка уже есть на сервере. Добавить в неё файлы?';

  @override
  String get adminUploadAddToBook => 'Добавить к существующей книге';

  @override
  String get adminUploadAddToBookHint => 'Поиск в этой библиотеке';

  @override
  String get adminUploadNoBooksFound => 'Книги не найдены';

  @override
  String adminUploadAddingTo(String title) {
    return 'Добавление файлов в «$title»';
  }

  @override
  String adminUploadAddedTo(String title) {
    return 'Файлы добавлены в «$title»';
  }

  @override
  String get adminUploadTargetNoFolder =>
      'Не удалось найти папку этой книги на сервере.';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return 'Сервер поместил бы эти файлы в «$preview», а не в папку этой книги «$folder». Ничего не загружено.';
  }

  @override
  String get adminUploadUploading => 'Отправка...';

  @override
  String adminUploadProgress(int percent) {
    return 'Отправка: $percent%';
  }

  @override
  String get adminUploadButton => 'Загрузить';

  @override
  String adminUploadComplete(String title) {
    return 'Загружено: «$title»';
  }

  @override
  String get adminUploadFailed => 'Не удалось загрузить';

  @override
  String adminUploadFailedReason(String error) {
    return 'Не удалось загрузить: $error';
  }

  @override
  String get adminUploadReselectFiles =>
      'Выберите файлы заново, прежде чем повторять.';

  @override
  String get adminServerSettings => 'Настройки сервера';

  @override
  String get adminServerSettingsSubtitle => 'Сканер, хранение и сортировка';

  @override
  String get adminAuthentication => 'Аутентификация';

  @override
  String get adminAuthenticationSubtitle =>
      'Вход по паролю и через OpenID Connect';

  @override
  String get adminStats => 'Статистика';

  @override
  String get adminStatsSubtitle => 'Итоги по библиотеке и прослушиванию';

  @override
  String get adminAllSessions => 'Все сеансы';

  @override
  String get adminAllSessionsSubtitle =>
      'Просмотр сеансов прослушивания и управление ими';

  @override
  String get adminSessionsAllUsers => 'Все пользователи';

  @override
  String get adminSessionsEmpty => 'Сеансов нет';

  @override
  String get statsLibraryTotals => 'Итоги по библиотеке';

  @override
  String get statsTotalItems => 'Элементы';

  @override
  String get statsAudioFiles => 'Аудиофайлы';

  @override
  String get statsTotalSize => 'Общий размер';

  @override
  String get statsBooks => 'Книги';

  @override
  String get statsPodcasts => 'Подкасты';

  @override
  String get statsBooksSize => 'Размер книг';

  @override
  String get statsYearReview => 'Итоги года';

  @override
  String get statsNoYearData => 'За этот год данных нет';

  @override
  String get statsListeningTime => 'Время прослушивания';

  @override
  String get statsSessions => 'Сеансы';

  @override
  String get statsBooksAdded => 'Добавлено книг';

  @override
  String get statsAuthorsAdded => 'Добавлено авторов';

  @override
  String get statsTopAuthors => 'Топ авторов';

  @override
  String get statsTopNarrators => 'Топ чтецов';

  @override
  String get statsTopGenres => 'Топ жанров';

  @override
  String get srvScannerSection => 'Сканер';

  @override
  String get srvFindCovers => 'Искать обложки';

  @override
  String get srvCoverProvider => 'Поставщик обложек';

  @override
  String get srvParseSubtitles => 'Извлекать подзаголовки из имени файла';

  @override
  String get srvPreferMatched => 'Предпочитать сопоставленные метаданные';

  @override
  String get srvDisableWatcher => 'Отключить наблюдение за папками';

  @override
  String get srvStorageSection => 'Хранение';

  @override
  String get srvStoreCover => 'Хранить обложку вместе с элементом';

  @override
  String get srvStoreMetadata => 'Хранить метаданные вместе с элементом';

  @override
  String get srvMetadataFormat => 'Формат файла метаданных';

  @override
  String get srvFormatSection => 'Отображение и форматы';

  @override
  String get srvDateFormat => 'Формат даты';

  @override
  String get srvTimeFormat => 'Формат времени';

  @override
  String get srvLanguage => 'Язык сервера';

  @override
  String get srvChromecast => 'Поддержка Chromecast';

  @override
  String get srvAllowIframe => 'Разрешить встраивание через iframe';

  @override
  String get srvSortingSection => 'Сортировка';

  @override
  String get srvIgnorePrefixes => 'Игнорировать префиксы при сортировке';

  @override
  String get srvSortingPrefixes => 'Префиксы сортировки';

  @override
  String get srvAddPrefix => 'Добавить префикс';

  @override
  String get srvSave => 'Сохранить настройки';

  @override
  String get srvSavePrefixes => 'Сохранить префиксы';

  @override
  String get srvSaved => 'Настройки сохранены';

  @override
  String get srvSaveFailed => 'Не удалось сохранить настройки';

  @override
  String get srvPrefixesSaved => 'Префиксы сортировки обновлены';

  @override
  String get authSetLoadFailed =>
      'Не удалось загрузить настройки аутентификации';

  @override
  String get authSetCustomMessage => 'Своё сообщение при входе';

  @override
  String get authSetMessage => 'Сообщение';

  @override
  String get authSetPasswordAuth => 'Аутентификация по паролю';

  @override
  String get authSetOpenId => 'Аутентификация OpenID Connect';

  @override
  String get authSetGuide => 'Руководство по настройке';

  @override
  String get authSetIssuerUrl => 'URL издателя';

  @override
  String get authSetAutoPopulate => 'Заполнить автоматически';

  @override
  String get authSetAuthorizeUrl => 'URL авторизации';

  @override
  String get authSetTokenUrl => 'URL токена';

  @override
  String get authSetUserinfoUrl => 'URL сведений о пользователе';

  @override
  String get authSetJwksUrl => 'URL JWKS';

  @override
  String get authSetLogoutUrl => 'URL выхода';

  @override
  String get authSetClientId => 'ID клиента';

  @override
  String get authSetClientSecret => 'Секрет клиента';

  @override
  String get authSetSigningAlgorithm => 'Алгоритм подписи';

  @override
  String get authSetRedirectUris =>
      'Разрешённые URI перенаправления для мобильных';

  @override
  String get authSetRedirectUrisInfo =>
      'После входа приложения могут возвращаться только по этим адресам. Absorb использует absorb://oauth. Единственная запись «*» (звёздочка) разрешает любой адрес.';

  @override
  String get authSetAddRedirectUri => 'Добавить URI';

  @override
  String get authSetAddAbsorbRedirect => 'Добавить absorb://oauth';

  @override
  String get authSetSubfolder => 'Подпапка для URL перенаправления';

  @override
  String get authSetSubfolderNone => 'Нет';

  @override
  String get authSetWebRedirectInfo =>
      'Разрешите эти URL у вашего провайдера OAuth, чтобы вход мог вернуться в веб-приложение:';

  @override
  String get authSetButtonText => 'Текст кнопки';

  @override
  String get authSetMatchExisting =>
      'Сопоставлять существующих пользователей по';

  @override
  String get authSetMatchNone => 'Не сопоставлять';

  @override
  String get authSetMatchEmail => 'Эл. почте';

  @override
  String get authSetMatchUsername => 'Имени пользователя';

  @override
  String get authSetMatchExistingInfo =>
      'Нужно для связи с существующими пользователями. После связи пользователи сопоставляются по уникальному ID от провайдера.';

  @override
  String get authSetAutoLaunch => 'Автозапуск';

  @override
  String get authSetAutoLaunchInfo =>
      'Автоматически открывать провайдера со страницы веб-входа. /login?autoLaunch=0 пропускает это.';

  @override
  String get authSetAutoRegister => 'Автоматическая регистрация';

  @override
  String get authSetAutoRegisterInfo =>
      'Автоматически создавать новых пользователей после входа';

  @override
  String get authSetClaimsInfo =>
      'Оставьте поля пустыми, чтобы отключить назначение групп и прав. Новые пользователи получат роль «Пользователь».';

  @override
  String get authSetGroupClaim => 'Claim групп';

  @override
  String get authSetGroupClaimInfo =>
      'Claim со списком групп пользователя, обычно groups. Группы admin, user или guest задают роль, побеждает высшая. Если ни одна группа не подходит, вход отклоняется.';

  @override
  String get authSetPermsClaim => 'Claim расширенных прав';

  @override
  String get authSetPermsClaimInfo =>
      'Claim с правами для не-администраторов. Если claim отсутствует, вход отклоняется, а отсутствующий параметр считается выключенным. Ожидаемый формат:';

  @override
  String get authSetRestartNote =>
      'Чтобы применить изменения OpenID Connect, перезапустите сервер после сохранения.';

  @override
  String get authSetNoChanges => 'Нет изменений для сохранения';

  @override
  String get authSetNeedOneMethod => 'Включите хотя бы один способ входа';

  @override
  String authSetFieldRequired(String field) {
    return 'Поле «$field» обязательно';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return 'Недопустимый URI перенаправления: $uri';
  }

  @override
  String get authSetAsteriskAlone =>
      'Звёздочка (*) должна быть единственным URI перенаправления';

  @override
  String authSetInvalidClaim(String field) {
    return '«$field» не является допустимым именем claim';
  }

  @override
  String authSetIssuerFailed(String error) {
    return 'Не удалось прочитать издателя: $error';
  }

  @override
  String get libNoneYet => 'Библиотек пока нет';

  @override
  String get libReorderFailed => 'Не удалось сохранить новый порядок';

  @override
  String get libDeleteTitle => 'Удалить библиотеку?';

  @override
  String get libDeleteBody =>
      'Библиотека и все её элементы будут навсегда удалены с сервера.';

  @override
  String get libDeleted => 'Библиотека удалена';

  @override
  String get libDeleteFailed => 'Не удалось удалить библиотеку';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count папки',
      many: '$count папок',
      few: '$count папки',
      one: '$count папка',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => 'Новая библиотека';

  @override
  String get libEditTitle => 'Изменить библиотеку';

  @override
  String get libName => 'Название библиотеки';

  @override
  String get libMediaType => 'Тип медиа';

  @override
  String get libMediaBook => 'Книги';

  @override
  String get libMediaPodcast => 'Подкасты';

  @override
  String get libProvider => 'Источник метаданных';

  @override
  String get libIcon => 'Значок';

  @override
  String get libFolders => 'Папки';

  @override
  String get libAddFolder => 'Добавить папку';

  @override
  String get libNoFolders => 'Добавьте хотя бы одну папку';

  @override
  String get libAdvanced => 'Расширенные настройки';

  @override
  String get libCoverShape => 'Форма обложки';

  @override
  String get libCoverSquare => 'Квадратная';

  @override
  String get libCoverStandard => 'Стандартная';

  @override
  String get libDisableWatcher => 'Отключить наблюдение за папками';

  @override
  String get libSkipAsin => 'Не сопоставлять книги с ASIN';

  @override
  String get libSkipIsbn => 'Не сопоставлять книги с ISBN';

  @override
  String get libHideSingleSeries => 'Скрывать серии из одной книги';

  @override
  String get libAudiobooksOnly => 'Только аудиокниги';

  @override
  String get libEpubScripted => 'Разрешить скрипты в ePub';

  @override
  String get libLaterBooksOnly =>
      'В «Продолжить серию» показывать только следующие книги';

  @override
  String get libPodcastRegion => 'Регион поиска подкастов';

  @override
  String get libMarkPercent => 'Прослушано при % завершения';

  @override
  String get libMarkTime => 'Прослушано, если осталось секунд';

  @override
  String get libAutoScan => 'Расписание автосканирования (cron)';

  @override
  String get libCreate => 'Создать библиотеку';

  @override
  String get libUpdate => 'Сохранить изменения';

  @override
  String get libNameRequired => 'Введите название библиотеки';

  @override
  String get libCreated => 'Библиотека создана';

  @override
  String get libCreateFailed => 'Не удалось создать библиотеку';

  @override
  String get libUpdated => 'Библиотека обновлена';

  @override
  String get libUpdateFailed => 'Не удалось обновить библиотеку';

  @override
  String get libRemoveFoldersTitle => 'Убрать папки?';

  @override
  String get libRemoveFoldersBody =>
      'При удалении папки её элементы удаляются из библиотеки. Это нельзя отменить.';

  @override
  String get readEbook => 'Читать';

  @override
  String get ebookDownload => 'Скачать';

  @override
  String get ebookDownloaded => 'Скачано';

  @override
  String get ebookSavedOffline => 'Сохранено для чтения без сети';

  @override
  String get ebookRemovedOffline => 'Удалено из офлайн-доступа';

  @override
  String get ebookOfflineFailed => 'Не удалось скачать электронную книгу';

  @override
  String get ebookSaveToDevice => 'Сохранить на устройство';

  @override
  String get ebookSaveToDeviceTitle => 'Сохранить на устройство?';

  @override
  String get ebookSaveToDeviceBody =>
      'Копия файла электронной книги будет сохранена на устройстве (место выбираете вы). Книга не станет доступна офлайн в читалке — для этого используйте «Скачать».';

  @override
  String get readerFormatUnsupported =>
      'Этот формат электронных книг пока нельзя открыть в читалке';

  @override
  String get readerCouldNotOpen =>
      'Не удалось открыть эту электронную книгу. Возможно, файл повреждён.';

  @override
  String get moreActions => 'Ещё';

  @override
  String get readerChapters => 'Главы';

  @override
  String get readerSettings => 'Настройки читалки';

  @override
  String get readerFontSize => 'Размер шрифта';

  @override
  String get readerLineSpacing => 'Межстрочный интервал';

  @override
  String get readerTextAlignment => 'Выравнивание';

  @override
  String get readerAlignJustified => 'По ширине';

  @override
  String get readerAlignLeft => 'По левому краю';

  @override
  String get readerSideMargins => 'Боковые поля';

  @override
  String get readerTopBottom => 'Верх и низ';

  @override
  String get readerPageLayout => 'Макет страницы';

  @override
  String get readerPinTopBar => 'Не скрывать заголовок и полосу прогресса';

  @override
  String get readerPinTopBarHint =>
      'Закрепляет их над страницей, а не показывает по касанию. Страница становится немного ниже, чтобы текст не перекрывался.';

  @override
  String get readerTopBarProgress => 'Прогресс в верхней панели';

  @override
  String get readerTopBarProgressBook => 'Книга';

  @override
  String get readerTopBarProgressChapter => 'Глава';

  @override
  String get readerTopBarProgressBoth => 'Оба';

  @override
  String get readerSectionText => 'Текст';

  @override
  String get readerSectionPage => 'Страница';

  @override
  String get readerSectionTopBar => 'Верхняя панель и экран';

  @override
  String get readerSectionControls => 'Управление';

  @override
  String get readerSectionStats => 'Статистика';

  @override
  String get readerParagraphSpacing => 'Интервал между абзацами';

  @override
  String get readerParagraphSpacingBook => 'Как в книге';

  @override
  String get readerTapZones => 'Зоны касания';

  @override
  String get readerTapZonesHint =>
      'Перетащите линии, чтобы изменить размер квадратов. Коснитесь квадрата, чтобы изменить его действие, или начните с готового макета.';

  @override
  String get readerTapPrev => 'Предыдущая страница';

  @override
  String get readerTapNext => 'Следующая страница';

  @override
  String get readerTapMenu => 'Показать элементы управления';

  @override
  String get readerTapNothing => 'Ничего';

  @override
  String get readerTapKeepMenu =>
      'Один из квадратов должен показывать элементы управления';

  @override
  String get readerHideControls => 'Скрывать элементы управления через';

  @override
  String get readerHideControlsNever => 'Никогда';

  @override
  String get readerBarNotes => 'Заметки и выделения';

  @override
  String readerHideControlsAfter(int seconds) {
    return '$seconds с';
  }

  @override
  String get playerDownloadStreamingInstead =>
      'Эту загрузку не удалось воспроизвести, поэтому идёт потоковое воспроизведение с сервера. Повторная загрузка может помочь.';

  @override
  String get readerPageTurn => 'Перелистывание';

  @override
  String get readerPageTurnNone => 'Нет';

  @override
  String get readerPageTurnSlide => 'Сдвиг';

  @override
  String get readerPageTurnCurl => 'Загиб';

  @override
  String get readerPageTurnRipple => 'Рябь';

  @override
  String get readerScrollMode => 'Режим прокрутки';

  @override
  String get readerScrollModeHint =>
      'Прокручивать книгу вниз вместо перелистывания страниц. Действует для всех книг.';

  @override
  String get readerKeepAwake => 'Не выключать экран';

  @override
  String get readerKeepAwakeHint =>
      'Экран не гаснет, пока вы читаете в своём темпе. Автопрокрутка и чтение вслед всегда держат его включённым.';

  @override
  String get readerLayoutAuto => 'Авто';

  @override
  String get readerLayoutSingle => 'Одна';

  @override
  String get readerLayoutTwoPage => 'Две страницы';

  @override
  String get readerTheme => 'Тема';

  @override
  String get readerFont => 'Шрифт';

  @override
  String get readerVolumeNav => 'Клавиши громкости листают страницы';

  @override
  String get readerVolumeNavOff => 'Выкл';

  @override
  String get readerVolumeNavNormal => 'Обычный';

  @override
  String get readerVolumeNavMirrored => 'Зеркальный';

  @override
  String get readerAutoScroll => 'Автопрокрутка';

  @override
  String get readerAutoScrollSubtitle =>
      'Следующая страница закрашивает текущую сверху вниз — проведите по центру экрана, чтобы изменить скорость, коснитесь, чтобы остановить';

  @override
  String get readerAutoScrollStarted => 'Автопрокрутка запущена';

  @override
  String get readerAutoScrollPaused =>
      'Пауза — нажмите и удерживайте, чтобы остановить';

  @override
  String get readerAutoScrollResumed => 'Автопрокрутка возобновлена';

  @override
  String get readerAutoScrollStopped => 'Автопрокрутка выключена';

  @override
  String get readerAutoScrollEndOfBook =>
      'Конец книги — автопрокрутка выключена';

  @override
  String readerAutoScrollSpeed(int percent) {
    return 'Скорость $percent%';
  }

  @override
  String get readerMoreControls => 'Ещё элементы управления';

  @override
  String get readerAutoScrollSleep => 'Таймер сна автопрокрутки';

  @override
  String get readerAutoScrollSleepHint =>
      'Через некоторое время останавливает прокрутку и позволяет экрану погаснуть.';

  @override
  String readerAutoScrollSleepMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String readerAutoScrollSleepLeft(int minutes) {
    return 'Осталось $minutes мин';
  }

  @override
  String readerAutoScrollSleepIn(int minutes) {
    return 'Автопрокрутка остановится через $minutes мин';
  }

  @override
  String get readerAutoScrollSleepOff => 'Таймер сна автопрокрутки выключен';

  @override
  String get readerAutoScrollSleepEnded =>
      'Таймер сна — автопрокрутка выключена';

  @override
  String get readerDownloadStarted => 'Загрузка начата';

  @override
  String get detailChaptersJumpTitle => 'Перейти к этой главе?';

  @override
  String detailChaptersJumpContent(String title) {
    return 'Воспроизведение перейдёт к «$title».';
  }

  @override
  String get detailChaptersJump => 'Перейти';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count главы прослушано',
      many: '$count глав прослушано',
      few: '$count главы прослушаны',
      one: '$count глава прослушана',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count других слушателей',
      many: '$count других слушателей',
      few: '$count других слушателя',
      one: '$count другой слушатель',
      zero: 'Других слушателей нет',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => 'Далее';

  @override
  String get seriesJumpToUpNext => 'Перейти к следующей';

  @override
  String get seriesStatsFinished => 'Прослушано';

  @override
  String get seriesStatsListened => 'Слушали';

  @override
  String get seriesStatsLeft => 'Осталось';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done из $total';
  }

  @override
  String get detailSessionsNone => 'Сеансов прослушивания пока нет';

  @override
  String detailSessionsAll(int count) {
    return 'Все сеансы: $count';
  }

  @override
  String get readerVolumeNavWhilePlaying => 'Даже во время воспроизведения';

  @override
  String get readerTranslateWith => 'Переводить через';

  @override
  String get readerTranslateApp => 'Приложение на этом устройстве';

  @override
  String get readerTranslateApple => 'Встроено в iOS';

  @override
  String get readerTranslateWeb => 'Откроется в браузере';

  @override
  String get readerTranslateHint =>
      'Выделенный текст отправляется выбранному переводчику.';

  @override
  String get readerMoreFonts => 'Скачать другие шрифты';

  @override
  String get readerFontRemove => 'Удалить загрузку';

  @override
  String readerFontDownloadFailed(String font) {
    return 'Не удалось скачать $font';
  }

  @override
  String get readerAnnotations => 'Аннотации';

  @override
  String readerHighlights(int count) {
    return 'Выделения ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return 'Закладки ($count)';
  }

  @override
  String get readerNoHighlights => 'Выделений пока нет';

  @override
  String get readerHistory => 'История';

  @override
  String get sessionReading => 'Чтение';

  @override
  String get readerHistoryEmpty =>
      'Страницы, которые вы покидаете, перечислены здесь, чтобы вы всегда могли к ним вернуться.';

  @override
  String get readerHistoryClosed => 'Книга закрыта';

  @override
  String get readerHistoryBeforeJump => 'Перед переходом';

  @override
  String get readerHistoryBeforeSync => 'Перед сопоставлением с аудио';

  @override
  String get readerLogReading => 'Учитывать время чтения в статистике';

  @override
  String get readerLogReadingHint =>
      'Записывает время в читалке как сеанс, чтобы оно отображалось в статистике. В Audiobookshelf оно считается временем прослушивания.';

  @override
  String get readerNoBookmarks => 'Закладок пока нет';

  @override
  String get readerBookmarkDefault => 'Закладка';

  @override
  String get readerNoteTitle => 'Заметка';

  @override
  String get readerNoteHint => 'Добавить заметку...';

  @override
  String get backupAndSync => 'Резервная копия и синхронизация';

  @override
  String get backupAndSyncSubtitle =>
      'Сохраните файл резервной копии или синхронизируйте настройки между устройствами';

  @override
  String get syncSettingsExperimental => 'Экспериментально';

  @override
  String get syncSettingsExperimentalBody =>
      'Синхронизация новая и ещё дорабатывается. Если два устройства изменят данные, пока они не связаны, одна сторона может потерять свои изменения. Держите файл резервной копии как надёжную копию.';

  @override
  String get syncSettingsNeedServer => 'Нужен сервер?';

  @override
  String get syncSettingsNeedServerSub =>
      'Подойдёт любой сервер WebDAV. Nextcloud — бесплатный вариант для самостоятельного размещения.';

  @override
  String get syncSettingsConnection => 'Подключение';

  @override
  String get syncSettingsConnectionNotSet => 'Ещё не настроено';

  @override
  String get syncSettingsBackupFile => 'Файл резервной копии';

  @override
  String get syncSettingsBackupFilePlain =>
      'Сохранить всё в файл, который вы храните у себя.';

  @override
  String get syncSettingsBackupFileWithSync =>
      'Сохранить всё в файл, который вы храните у себя. Данные входа включаются, а восстановление на другом телефоне включит там и синхронизацию.';

  @override
  String get syncSettingsStatusOff => 'Не синхронизируется';

  @override
  String get syncSettingsStatusProblem => 'Не удалось подключиться к серверу';

  @override
  String get syncSettings => 'Синхронизация настроек между устройствами';

  @override
  String get syncSettingsExtras => 'Также синхронизировать';

  @override
  String get syncSettingsIncludeRmab => 'Настройки ReadMeABook';

  @override
  String get syncSettingsIncludeRmabSub =>
      'Помещает ваш API-токен ReadMeABook в синхронизируемый файл';

  @override
  String get syncSettingsSubtitle =>
      'Синхронизируйте настройки через собственный сервер WebDAV';

  @override
  String get syncSettingsEnable => 'Синхронизировать настройки';

  @override
  String get syncSettingsServerUrl => 'URL папки WebDAV';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => 'Имя пользователя';

  @override
  String get syncSettingsPassword => 'Пароль';

  @override
  String get syncSettingsHeaders => 'Свои заголовки (необязательно)';

  @override
  String get syncSettingsHeadersHint =>
      'По одному в строке, например CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => 'Проверить подключение';

  @override
  String get syncSettingsHoldToUpload => 'Удерживайте, чтобы загрузить сейчас';

  @override
  String get syncSettingsUploadNow => 'Загрузить сейчас';

  @override
  String get syncSettingsDownloadNow => 'Скачать сейчас';

  @override
  String get syncSettingsOk => 'Подключено';

  @override
  String get syncSettingsNoRemote =>
      'Подключено — синхронизировать пока нечего';

  @override
  String get syncSettingsAuthFailed => 'Неверное имя пользователя или пароль';

  @override
  String get syncSettingsNetworkError =>
      'Не удалось подключиться по этому адресу';

  @override
  String get syncSettingsNotConfigured =>
      'Сначала укажите адрес, имя пользователя и пароль';

  @override
  String get syncSettingsTooLarge =>
      'Ваши настройки слишком велики для синхронизации';

  @override
  String get syncSettingsUploaded => 'Настройки загружены';

  @override
  String get syncSettingsApplied => 'Настройки обновлены с другого устройства';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count настройки обновлены с другого устройства',
      many: '$count настроек обновлено с другого устройства',
      few: '$count настройки обновлены с другого устройства',
      one: '$count настройка обновлена с другого устройства',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => 'Уже актуально';

  @override
  String syncSettingsLastSynced(String when) {
    return 'Последняя синхронизация: $when';
  }

  @override
  String get syncSettingsNever => 'Ещё не синхронизировано';

  @override
  String navHoldPickTitle(String tab) {
    return 'Удержание «$tab»…';
  }

  @override
  String get navHoldPickBody =>
      'Выберите, что делает долгое нажатие на эту вкладку. Позже это можно изменить в настройках.';

  @override
  String get navHoldSettingTitle => 'Быстрые действия по удержанию вкладок';

  @override
  String get navHoldSettingSubtitle => 'Что делает удержание каждой вкладки';

  @override
  String get navHoldAskNextTime => 'Спросить в следующий раз';

  @override
  String get navHoldNothing => 'Ничего';

  @override
  String get navHoldPlayPause => 'Воспроизведение / пауза';

  @override
  String get navHoldOfflineMode => 'Офлайн-режим';

  @override
  String get navHoldOfflineOn => 'Офлайн-режим включён';

  @override
  String get navHoldOfflineOff => 'Офлайн-режим выключен';

  @override
  String get navHoldMenu => 'Всегда показывать меню';

  @override
  String get navHoldStop => 'Остановить воспроизведение';

  @override
  String get navHoldRmabSearch => 'Поиск ReadMeABook';

  @override
  String get navHoldRmabRequests => 'Мои запросы книг';

  @override
  String get navHoldRmabWeb => 'Сайт ReadMeABook';

  @override
  String get navHoldAdd => 'Добавить';

  @override
  String get navHoldMoveLeft => 'Сдвинуть влево';

  @override
  String get navHoldMoveRight => 'Сдвинуть вправо';

  @override
  String get navHoldRemoveFromMenu => 'Убрать из меню';

  @override
  String get navHoldEditHint =>
      'Удерживайте элемент, чтобы переместить или убрать его';

  @override
  String get navHoldResetMenu => 'Сбросить элементы меню удержания';

  @override
  String get navHoldMenuReset => 'Элементы меню сброшены';

  @override
  String get bookStatsAction => 'Статистика прослушивания';

  @override
  String get bookStatsYou => 'Вы';

  @override
  String get bookStatsEveryone => 'Все';

  @override
  String get bookStatsListened => 'Время прослушивания';

  @override
  String get bookStatsSessions => 'Сеансы';

  @override
  String get bookStatsFirst => 'Первое прослушивание';

  @override
  String get bookStatsLast => 'Последнее прослушивание';

  @override
  String get bookStatsListeners => 'Начали слушать';

  @override
  String get bookStatsFinishedCount => 'Дослушали';

  @override
  String get bookStatsTotalTime => 'Общее время прослушивания всеми';

  @override
  String get bookStatsNobody => 'Эту книгу пока никто не начинал';

  @override
  String get bookStatsScanning =>
      'Просмотр сеансов, это может занять некоторое время...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return 'Просмотр сеансов, $done из $total человек...';
  }

  @override
  String bookStatsLastChecked(String when) {
    return 'Проверено $when';
  }

  @override
  String get activityYourReading => 'Ваше чтение';

  @override
  String get activityYourListening => 'Ваше прослушивание';

  @override
  String activityLastRead(String when) {
    return 'Последнее чтение: $when';
  }

  @override
  String activityLastListened(String when) {
    return 'Последнее прослушивание: $when';
  }

  @override
  String get activityNotStarted => 'Не начато';

  @override
  String get activityNoReading => 'Сеансов чтения пока нет';

  @override
  String get activityTime => 'Время';

  @override
  String get activityAverage => 'Сред.';

  @override
  String get activityProgress => 'Прогресс';

  @override
  String activityReached(String percent) {
    return 'Достигнуто: $percent';
  }

  @override
  String get readingLogTitle => 'Журнал чтения';

  @override
  String get readingLogTotalTime => 'Общее время';

  @override
  String get readingLogAverageSession => 'Средний сеанс';

  @override
  String get readingLogActiveDays => 'Активные дни';

  @override
  String readingLogActiveDaysOf(int active, int total) {
    return '$active из $total';
  }

  @override
  String get readingLogPace => 'Темп';

  @override
  String readingLogPacePerHour(String percent) {
    return '$percent%/ч';
  }

  @override
  String get readingLogLastRead => 'Последнее чтение';

  @override
  String get readingLogStarted => 'Начато';

  @override
  String get readingLogFinished => 'Прослушано';

  @override
  String get readingLogNotSet => 'Не задано';

  @override
  String readingLogLeftMinutes(int m) {
    return 'Ещё около $m мин до конца';
  }

  @override
  String readingLogLeftHours(int h) {
    return 'Ещё около $h ч до конца';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return 'Ещё около $h ч $m мин до конца';
  }

  @override
  String get readingLogLeftMax => 'Более 99 ч до конца';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return 'На $percent% больше, чем неделей ранее';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return 'На $percent% меньше, чем неделей ранее';
  }

  @override
  String get readingLogNewThisWeek => 'Новое на этой неделе';

  @override
  String get readingLogSameAsLastWeek => 'Столько же, сколько неделей ранее';

  @override
  String get readingLogQuietTwoWeeks => 'Ничего за последние две недели';

  @override
  String get readingLogWhereYouRead => 'Где вы это читали';

  @override
  String get readingLogSourceIos => 'Приложение для iOS';

  @override
  String get readingLogSourceAndroid => 'Приложение для Android';

  @override
  String get readingLogChartTitle => 'Прогресс со временем';

  @override
  String get readingLogChartPosition => 'Достигнутая позиция';

  @override
  String get readingLogChartMinutes => 'Минуты';

  @override
  String get readingLogRecords => 'Рекорды';

  @override
  String get readingLogLongestSession => 'Самый длинный сеанс';

  @override
  String get readingLogBestDay => 'Лучший день';

  @override
  String get readingLogLongestStreak => 'Самая длинная серия';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня',
      many: '$count дней',
      few: '$count дня',
      one: '$count день',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => 'Возвраты назад';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count раза',
      many: '$count раз',
      few: '$count раза',
      one: '$count раз',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => 'Первое открытие';

  @override
  String get readingLogAttempts => 'Попытки';

  @override
  String readingLogAttempt(int index) {
    return 'Попытка $index';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return 'Попытка $index началась';
  }

  @override
  String get readingLogOutcomeCompleted => 'Завершено';

  @override
  String get readingLogOutcomeSkimmed => 'Пролистано';

  @override
  String get readingLogOutcomeAbandoned => 'Заброшено';

  @override
  String get readingLogOutcomeInProgress => 'В процессе';

  @override
  String readingLogSpanRange(String from, String to) {
    return '$from — $to';
  }

  @override
  String readingLogSpanSince(String from) {
    return 'С $from';
  }

  @override
  String readingLogSpanEnded(String to) {
    return 'Закончено $to';
  }

  @override
  String get readingLogSpanUnknown => 'Даты не записаны';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сеанса',
      many: '$count сеансов',
      few: '$count сеанса',
      one: '$count сеанс',
    );
    return '$_temp0';
  }

  @override
  String readingLogShowing(int shown, int total) {
    return '$shown из $total';
  }

  @override
  String readingLogGapDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня без чтения',
      many: '$count дней без чтения',
      few: '$count дня без чтения',
      one: '$count день без чтения',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => 'Сеансов пока не записано';

  @override
  String get readingLogEmptyHint =>
      'Сеансы появляются здесь, когда вы читаете или слушаете в любом приложении или на устройстве, синхронизируемом с BookOrbit.';

  @override
  String get readingLogNoMatches => 'В этом диапазоне нет сеансов';

  @override
  String get readingLogAllTime => 'За всё время';

  @override
  String get readingLogLast30 => 'Последние 30 дней';

  @override
  String get readingLogLast90 => 'Последние 90 дней';

  @override
  String get readingLogThisYear => 'В этом году';

  @override
  String get readingLogAllFormats => 'Все форматы';

  @override
  String get readingLogSortBy => 'Сортировка';

  @override
  String get readingLogSortDay => 'День';

  @override
  String get readingLogSortLength => 'Длительность';

  @override
  String get readingLogSortChange => 'Изменение';

  @override
  String get readingLogSortReached => 'Достигнуто';

  @override
  String get readingLogNewestFirst => 'Сначала новые';

  @override
  String get readingLogOldestFirst => 'Сначала старые';

  @override
  String get readingLogMostFirst => 'Сначала больше';

  @override
  String get readingLogLeastFirst => 'Сначала меньше';

  @override
  String get readingLogDeleteTitle => 'Удалить этот сеанс?';

  @override
  String get readingLogDeleteBody =>
      'Он будет удалён из журнала чтения книги и из вашей статистики в BookOrbit.';

  @override
  String get readingLogDeleteFailed => 'Не удалось удалить сеанс';

  @override
  String get readingLogLoadFailed => 'Не удалось загрузить журнал чтения';

  @override
  String get navHoldServerScan => 'Сканирование сервера';

  @override
  String get navHoldScanAll => 'Сканировать все библиотеки';

  @override
  String navHoldScanLibrary(String name) {
    return 'Сканировать «$name»';
  }

  @override
  String get navHoldScanStarted => 'Сканирование начато';

  @override
  String get navHoldScanFailed => 'Не удалось начать сканирование';

  @override
  String get navHoldAdminLogs => 'Журналы сервера';

  @override
  String navHoldAdminPage(String page) {
    return 'Администрирование: $page';
  }

  @override
  String get navHoldNothingPlaying => 'Пока нечего воспроизводить';

  @override
  String get navHoldReadBook => 'Читать текущую книгу';

  @override
  String get navHoldBookDetails => 'Сведения о текущей книге';

  @override
  String get syncSourceTitle => 'Какую копию оставить при синхронизации?';

  @override
  String get syncSourceBody =>
      'Эта резервная копия включила синхронизацию настроек. Использовать последнюю синхронизацию с сервера или сделать эту копию основной? Выбор копии заменяет версию на сервере для всех ваших синхронизируемых устройств.';

  @override
  String get syncSourceUseServer => 'Последняя синхронизация с сервера';

  @override
  String get syncSourceUseBackup => 'Эта копия';

  @override
  String get syncSettingsWhatTravels =>
      'Синхронизируются ваши предпочтения, скорости для отдельных книг, макет главной, порядок «Absorbing», заметки и выделения в электронных книгах. Данные входа, папки загрузок, переключатели автозагрузки, вид читалки и всё, что ещё не отправлено на ваш сервер, остаются на этом устройстве.';

  @override
  String get syncSettingsDownloadWarnTitle =>
      'Заменить настройки этого устройства?';

  @override
  String get syncSettingsDownloadWarnBody =>
      'Синхронизированная копия перезапишет настройки на этом устройстве.';

  @override
  String get syncSettingsDownloadWarnConfirm => 'Заменить';

  @override
  String get readerCopied => 'Скопировано в буфер обмена';

  @override
  String get dictionaryNotFound => 'Для этого слова определение не найдено.';

  @override
  String get dictionaryError =>
      'Не удалось подключиться к словарю. Проверьте соединение.';

  @override
  String get dictionaryRetry => 'Повторить';

  @override
  String get dictionarySearchWeb => 'Искать в интернете';

  @override
  String get readerTooltipCopy => 'Копировать';

  @override
  String get readerTooltipSearch => 'Поиск';

  @override
  String get readerTooltipDefine => 'Определение';

  @override
  String get readerTooltipTranslate => 'Перевести';

  @override
  String get readerSearchHint => 'Искать в этой книге…';

  @override
  String readerSearchMatches(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count совпадения для \"$query\"',
      many: '$count совпадений для \"$query\"',
      few: '$count совпадения для \"$query\"',
      one: '$count совпадение для \"$query\"',
    );
    return '$_temp0';
  }

  @override
  String get readerSearchEmpty => 'Введите слово или фразу и нажмите «Поиск».';

  @override
  String readerSearchNoResults(String query) {
    return 'Нет совпадений для \"$query\".';
  }

  @override
  String get transcriptionTitle => 'Транскрипция';

  @override
  String get transcriptionAdvancedSubtitle =>
      'Для транскрипции закладок и поиска своего места между аудиокнигой и электронной книгой';

  @override
  String get transcriptionEnable => 'Включить транскрипцию';

  @override
  String get transcriptionEnableSubtitle =>
      'Добавляет «Транскрибировать» в закладки, «Найти позицию в электронной книге» в плеер и «Найти в аудиокниге» в читалку';

  @override
  String get transcriptionDisclaimer =>
      'Работает полностью на вашем устройстве, ничего никуда не отправляется. Во время работы расходуется больше заряда и ресурсов, а транскрибировать можно только скачанные книги.';

  @override
  String get transcriptionNeedModelHint =>
      'Скачайте модель ниже, чтобы начать транскрипцию.';

  @override
  String get transcriptionModelSection => 'Модели';

  @override
  String get transcriptionModelTiny => 'Tiny';

  @override
  String get transcriptionModelTinyDesc =>
      'Самая быстрая, менее точная. Около 31 МБ.';

  @override
  String get transcriptionModelBase => 'Base';

  @override
  String get transcriptionModelBaseDesc => 'Хороший компромисс. Около 57 МБ.';

  @override
  String get transcriptionModelSmall => 'Small';

  @override
  String get transcriptionModelSmallDesc =>
      'Медленнее, но самая точная — лучше всего на мощном телефоне. Около 182 МБ.';

  @override
  String get transcriptionAutoHint =>
      'Если скачано несколько моделей, для каждой задачи выбирается одна из них. Для книг с электронной версией берётся самая быстрая, так как точные слова всё равно берутся из электронной книги. Для книг без неё берётся самая точная, кроме чтения вслед: оно остаётся ниже Small, чтобы успевать за чтецом.';

  @override
  String get transcriptionDownload => 'Скачать';

  @override
  String get transcriptionDownloadFailed =>
      'Не удалось скачать. Проверьте соединение и повторите.';

  @override
  String get transcribe => 'Транскрибировать';

  @override
  String get transcribing => 'Идёт транскрибация...';

  @override
  String get transcriptionResultTitle => 'Транскрипция';

  @override
  String get transcriptionSaveToNote => 'Сохранить в заметку';

  @override
  String get transcriptionSavedToNote => 'Сохранено в заметке закладки';

  @override
  String get transcriptionDisabledHint =>
      'Включите транскрипцию закладок в настройках, в разделе «Дополнительно».';

  @override
  String get transcriptionNoModelDownloaded =>
      'Сначала скачайте модель транскрипции в настройках.';

  @override
  String get transcriptionNotDownloadedBook =>
      'Скачайте эту книгу или подключитесь к серверу, чтобы её транскрибировать.';

  @override
  String get transcriptionNoMetadataMsg =>
      'Не удаётся найти это место в загрузке. Попробуйте скачать книгу заново.';

  @override
  String get transcriptionBusyMsg =>
      'Уже идёт транскрибация. Подождите немного.';

  @override
  String get transcriptionEmptyMsg => 'В этом месте речь не найдена.';

  @override
  String get transcriptionFailedMsg =>
      'Не удалось транскрибировать это место. Повторите попытку.';

  @override
  String get transcriptionPlaySnippet => 'Слушать';

  @override
  String get transcriptionPauseSnippet => 'Пауза';

  @override
  String get transcriptionIntroBody =>
      'Приложение прослушает выбранный отрезок аудио, начиная чуть раньше закладки, и превратит его в текст на вашем устройстве. Чем длиннее отрезок, тем дольше работа, а транскрипция не точна на 100%. По готовности текст сохраняется в заметке закладки, его можно поправить или отправить.';

  @override
  String get transcriptionUseEbookText =>
      'Использовать точный текст электронной книги, если его удалось сопоставить';

  @override
  String get lyricsMode => 'Живая транскрипция';

  @override
  String get lyricsListeningAhead => 'Опережающее прослушивание...';

  @override
  String get lyricsDisplaySection => 'Живая транскрипция';

  @override
  String get lyricsFontSize => 'Размер строк';

  @override
  String get lyricsMaxLines => 'Показывать строк';

  @override
  String get lyricsFullCover => 'Использовать всю обложку';

  @override
  String get lyricsFullCoverHint =>
      'Показывает транскрипцию вместо обложки, пока она идёт, и вмещает столько строк, сколько есть места.';

  @override
  String get lyricsBatteryInfo =>
      'Живая транскрипция и чтение вслед расходуют больше заряда и ресурсов, пока работают. На телефонах с медленными процессорами строки могут появляться дольше.';

  @override
  String get lyricsClearCache => 'Очистить кэш транскрипции';

  @override
  String lyricsClearCacheHint(String size) {
    return 'Сохранённых строк транскрипции: $size. Очищенные книги и эпизоды будут транскрибироваться заново по мере прослушивания.';
  }

  @override
  String get lyricsClearCacheConfirm =>
      'Удалить сохранённые транскрипции для всех книг и эпизодов? Они автоматически восстановятся по мере прослушивания.';

  @override
  String get lyricsCacheCleared => 'Кэш транскрипции очищен';

  @override
  String get lyricsIntroBody =>
      'Приложение слушает чуть впереди чтеца и показывает каждую строку по мере её произнесения, транскрибируя на вашем телефоне — ничего не покидает устройство. После включения подождите несколько секунд с запуском воспроизведения, пока оно опережает чтеца. Транскрипция появится, когда запас будет готов; старт с паузы обеспечивает самую плавную работу. Во время работы расходуется больше заряда и ресурсов.';

  @override
  String lyricsBuildingLead(String percent) {
    return 'Опережаем чтеца... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return 'Не удаётся транскрибировать так же быстро, как вы слушаете на скорости $speed';
  }

  @override
  String get lyricsTurnOn => 'Включить';

  @override
  String get readAlong => 'Чтение вслед';

  @override
  String get readAlongNeedsPlaying => 'Сначала запустите аудиокнигу этой книги';

  @override
  String get narrationListen => 'Слушать';

  @override
  String get narrationPlayFromHere => 'Воспроизвести отсюда';

  @override
  String get narrationPreparing => 'Подготовка озвучки';

  @override
  String get narrationNone =>
      'У этой электронной книги нет озвучки для воспроизведения';

  @override
  String get narrationDownloadTitle => 'Скачайте, чтобы слушать';

  @override
  String get narrationDownloadBody =>
      'Эта книга — EPUB3, которая читает себя вслух. Audiobookshelf не может передавать её озвучку потоком, поэтому аудио нужно скачать перед воспроизведением.';

  @override
  String get narrationDownloadStarted =>
      'Озвучка скачивается. Нажмите Absorb, когда закончится.';

  @override
  String get narrationTextBody =>
      'В EPUB этой книги есть собственный текст для каждого момента аудио, поэтому текст копируется прямо из книги. Выберите, сколько добавить в заметку закладки.';

  @override
  String get narrationTextLoading => 'Получение текста из книги';

  @override
  String get downloadToAbsorb => 'Скачать в Absorb';

  @override
  String get narrationUpNextTitle => 'Скачать следующую книгу';

  @override
  String narrationUpNextBody(String title) {
    return '«$title» следующая в вашей очереди. Это EPUB3, которая читает себя вслух, поэтому её нужно скачать перед воспроизведением.';
  }

  @override
  String narrationQueueStopped(String title) {
    return 'Остановлено перед «$title». Скачайте её, чтобы продолжить.';
  }

  @override
  String get transcriptionNeedsDownload =>
      'Для этого нужно аудио на вашем телефоне. Скачать сейчас?';

  @override
  String get transcriptionDownloadStarted =>
      'Идёт загрузка. Включите это снова, когда она закончится';

  @override
  String get readAlongFollow => 'Чтение вслед следует за';

  @override
  String get syncReadingListening => 'Синхронизировать чтение и прослушивание';

  @override
  String get syncReadingListeningHint =>
      'Для книг с аудиокнигой и электронной версией. Когда вы перестаёте слушать, электронная книга переходит туда, где вы остановились. Когда вы выходите из читалки, аудиокнига переходит к вашей странице. Только вперёд.';

  @override
  String get syncEbookMoved =>
      'Электронная книга перешла туда, где вы остановили прослушивание';

  @override
  String get syncAudioMoved =>
      'Аудиокнига перешла туда, где вы остановили чтение';

  @override
  String get syncAudioOffer =>
      'Коснитесь, чтобы перейти туда, где вы остановили чтение';

  @override
  String get syncFindingAudio => 'Поиск вашей страницы в аудиокниге';

  @override
  String get syncFindingEbook => 'Поиск вашего места в электронной книге';

  @override
  String get syncFailed => 'Не удалось синхронизировать ваше место';

  @override
  String get syncAlreadyTogether => 'Уже синхронизировано';

  @override
  String get syncPosition => 'Синхронизировать позицию';

  @override
  String get readAlongFollowHint =>
      'Время слов вычисляется между метками времени транскрипции, поэтому внутри предложения возможен небольшой сдвиг.';

  @override
  String get readAlongFollowWord => 'Слово';

  @override
  String get readAlongFollowSentence => 'Предложение';

  @override
  String get readAlongColor => 'Цвет чтения вслед';

  @override
  String get readAlongLost => 'Не удаётся найти озвучку на странице';

  @override
  String get readAlongBackToNarration => 'Вернуться к озвучке';

  @override
  String get findInEbook => 'Найти в электронной книге';

  @override
  String get findInEbookSearching => 'Поиск этого места в электронной книге...';

  @override
  String get findInEbookNotFound =>
      'Не удалось найти это место в электронной книге.';

  @override
  String get findInEbookNeedsEpub =>
      'Для поиска в электронной книге нужен EPUB.';

  @override
  String get findInEbookNoEbook => 'У этой книги нет электронной версии.';

  @override
  String get findInAudiobook => 'Найти в аудиокниге';

  @override
  String get findInAudiobookSearching => 'Поиск этого места в аудиокниге...';

  @override
  String get findInAudiobookStillSearching =>
      'Всё ещё ищем это место в аудио...';

  @override
  String get findInAudiobookSearchingLong =>
      'Длинная глава, поиск продолжается. Это может занять минуту-две...';

  @override
  String get findInAudiobookNotFound =>
      'Не удалось найти это место в аудиокниге.';

  @override
  String get transcriptionWhisperInfo =>
      'Транскрипция работает на Whisper — открытой модели распознавания речи, которая слушает озвучку и записывает слова, и всё это на этом устройстве.';

  @override
  String get transcriptionWhisperLearnMore => 'Подробнее о Whisper';

  @override
  String get findInAudiobookIntroBody =>
      'Приложение прослушает аудиокнигу рядом с местом, где вы читаете, и сопоставит её с этим отрывком, всё на вашем устройстве. Это может занять до минуты. Если место не удаётся сопоставить уверенно, ничего не сдвигается.';

  @override
  String get findInAudiobookAfterLabel => 'Когда место найдено';

  @override
  String get findInAudiobookStay => 'Продолжить чтение';

  @override
  String get findInAudiobookGoPlayer => 'Открыть плеер';

  @override
  String get findInAudiobookPlaying =>
      'Воспроизводится этот отрывок в аудиокниге';

  @override
  String get catchUpAudioAhead =>
      'Аудиокнига продвинулась дальше. Коснитесь, чтобы перейти туда.';

  @override
  String get catchUpPageAhead =>
      'Эта страница впереди аудиокниги. Коснитесь, чтобы переместить аудиокнигу сюда.';

  @override
  String get readerShortcutButton => 'Кнопка быстрого действия';

  @override
  String get keepScreenOn => 'Не выключать экран';

  @override
  String get keepScreenOnActive => 'Экран остаётся включённым';

  @override
  String get keepScreenOnUntilClosed =>
      'Экран остаётся включённым, пока вы не закроете приложение';

  @override
  String get keepScreenOnOff => 'Экран снова может выключаться';

  @override
  String get keepScreenOnOffUntilRestart =>
      'Выключено до перезапуска приложения. Переключатель в настройках остаётся включённым';

  @override
  String get keepScreenOnPlayer => 'Не выключать экран в плеере';

  @override
  String get keepScreenOnPlayerSubtitle =>
      'Экран остаётся включённым, пока открыт плеер';

  @override
  String get keepScreenOnCarMode => 'Не выключать экран в режиме автомобиля';

  @override
  String get keepScreenOnCarModeSubtitle =>
      'Экран остаётся включённым, пока открыт режим автомобиля';

  @override
  String get loginServerType => 'Тип сервера';

  @override
  String get authBookOrbitDefaultPassword =>
      'У этой учётной записи всё ещё пароль по умолчанию. Смените его в BookOrbit и войдите снова.';

  @override
  String get authBookOrbitPasswordOff =>
      'Вход по паролю отключён на этом сервере. Войдите по волшебной ссылке или через единый вход.';

  @override
  String get authServerIsBookOrbit =>
      'Это сервер BookOrbit. Выберите BookOrbit над адресом сервера.';

  @override
  String get authServerIsAudiobookshelf =>
      'Это сервер Audiobookshelf. Выберите Audiobookshelf над адресом сервера.';

  @override
  String get castNotAvailableBookOrbit =>
      'Трансляция недоступна на серверах BookOrbit';

  @override
  String get loginMagicLink => 'Волшебная ссылка';

  @override
  String get loginMagicLinkDescription =>
      'Войдите по волшебной ссылке BookOrbit или вставьте ссылку для пароля, чтобы задать пароль.';

  @override
  String get collectionPublicTitle => 'Общедоступная';

  @override
  String get collectionPublicSubtitle =>
      'Все на этом сервере могут видеть эту коллекцию';

  @override
  String loginSignInWithProvider(String provider) {
    return 'Войти через $provider';
  }

  @override
  String get loginSignInWithSso => 'Войти через SSO';

  @override
  String get loginChooseSsoProvider => 'Выберите способ входа';

  @override
  String get loginRedirectUriBookOrbit =>
      'URI перенаправления: bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => 'Статус чтения';

  @override
  String get readStatusHint =>
      'BookOrbit хранит выбранный здесь статус, пока вы его не измените.';

  @override
  String get readStatusUnread => 'Не прочитано';

  @override
  String get readStatusWantToRead => 'Хочу прочитать';

  @override
  String get readStatusReading => 'Читаю';

  @override
  String get readStatusOnHold => 'Отложено';

  @override
  String get readStatusRereading => 'Перечитываю';

  @override
  String get readStatusRead => 'Прочитано';

  @override
  String get readStatusSkimmed => 'Пролистано';

  @override
  String get readStatusAbandoned => 'Заброшено';

  @override
  String get personalNoteTitle => 'Ваша заметка';

  @override
  String get personalNoteAdd => 'Добавить личную заметку';

  @override
  String get personalNoteHint => 'Эту заметку видите только вы.';

  @override
  String get moreLikeThis => 'Похожие';

  @override
  String get coverSlotAudiobook => 'Обложка аудиокниги';

  @override
  String get coverSlotBook => 'Обложка книги';

  @override
  String get cardButtonFill => 'Фон кнопок';

  @override
  String get cardButtonFillSubtitle =>
      'Как заполнены кнопки на карточке плеера';

  @override
  String get cardButtonFillClear => 'Прозрачный';

  @override
  String get cardButtonFillSubtle => 'Нейтральный';

  @override
  String get cardButtonFillSolid => 'Сплошной';

  @override
  String get loginBookOrbitPreview =>
      'Поддержка BookOrbit новая. Воспроизведение, загрузки и просмотр работают, но некоторые экраны могут выглядеть или вести себя как в Audiobookshelf. Следите за ходом работы на GitHub и сообщайте, если что-то кажется неправильным.';

  @override
  String get signedOutTapToSignIn => 'Вы вышли. Коснитесь, чтобы войти снова.';

  @override
  String get authSignedOutKeepListening =>
      'Вы вышли из системы. Загрузки по-прежнему воспроизводятся. Коснитесь красного облака, чтобы войти снова.';

  @override
  String signedOutSyncNote(String username, String server) {
    return 'То, что вы слушаете, пока вы не вошли, хранится на этом телефоне и синхронизируется, когда вы снова войдёте как $username на $server. Подойдёт любой способ входа в эту учётную запись.';
  }

  @override
  String get comicReadingDirection => 'Направление чтения';

  @override
  String comicPageNumber(int page) {
    return 'Страница $page';
  }

  @override
  String get comicBookmarkRemoveFailed =>
      'Не удалось убрать закладку с сервера. Повторите, когда будете в сети.';

  @override
  String get comicLeftToRight => 'Слева направо';

  @override
  String get comicRightToLeft => 'Справа налево (манга)';

  @override
  String get comicNeedsConnection =>
      'Этот комикс открывается постранично с вашего сервера, поэтому нужно подключение.';

  @override
  String get comicNoPages => 'В этом комиксе не найдено страниц.';

  @override
  String get boAdminTitle => 'Администрирование сервера';

  @override
  String get boAdminSubtitle =>
      'Пользователи и библиотеки на этом сервере BookOrbit';

  @override
  String get boAdminUsers => 'Пользователи';

  @override
  String get boAdminLibraries => 'Библиотеки';

  @override
  String boAdminUserCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count человека',
      many: '$count человек',
      few: '$count человека',
      one: '$count человек',
    );
    return '$_temp0';
  }

  @override
  String boAdminLibraryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count библиотеки',
      many: '$count библиотек',
      few: '$count библиотеки',
      one: '$count библиотека',
    );
    return '$_temp0';
  }

  @override
  String get boAdminSaved => 'Сохранено';

  @override
  String get boAdminFailed => 'Не получилось. Повторите попытку.';

  @override
  String get boAdminOffline => 'Не удалось подключиться к серверу.';

  @override
  String get boUsersSearch => 'Поиск пользователей';

  @override
  String get boUsersNone => 'Пользователей нет';

  @override
  String get boUsersFilterAll => 'Все';

  @override
  String get boUsersFilterAdmins => 'Администраторы';

  @override
  String get boUsersFilterActive => 'Активные';

  @override
  String get boUsersFilterInactive => 'Неактивные';

  @override
  String get boUsersFilterAttention => 'Требуют внимания';

  @override
  String get boUserBadgeAdmin => 'Админ';

  @override
  String get boUserBadgeInactive => 'Неактивен';

  @override
  String get boUserBadgeLocked => 'Заблокирован';

  @override
  String get boUserBadgeNoPassword => 'Пароля ещё нет';

  @override
  String boUserLastActive(String date) {
    return 'Последняя активность: $date';
  }

  @override
  String get boUserNeverSignedIn => 'Ни разу не входил';

  @override
  String get boUserNew => 'Новый пользователь';

  @override
  String get boUserCreate => 'Создать';

  @override
  String get boUserUsername => 'Имя пользователя';

  @override
  String get boUserUsernameHint =>
      'Не менее 3 символов. Позже изменить нельзя.';

  @override
  String get boUserName => 'Имя';

  @override
  String get boUserEmail => 'Эл. почта';

  @override
  String get boUserEmailInvalid => 'Введите действительный адрес эл. почты';

  @override
  String get boUserActive => 'Активен';

  @override
  String get boUserActiveSubtitle => 'Неактивные пользователи не могут войти';

  @override
  String get boUserAdmin => 'Администратор';

  @override
  String get boUserAdminSubtitle => 'Полный доступ ко всему на сервере';

  @override
  String get boUserAdminHasAll =>
      'Администраторы имеют все права и видят все библиотеки.';

  @override
  String get boUserPermissions => 'Права';

  @override
  String get boUserPresetNone => 'Нет';

  @override
  String get boUserPresetStandard => 'Стандартные';

  @override
  String get boUserPresetEverything => 'Все';

  @override
  String get boUserLibraries => 'Библиотеки';

  @override
  String get boUserLibrariesHint => 'Библиотеки, которые видит этот человек.';

  @override
  String get boUserPasswordLink => 'Отправить ссылку для пароля';

  @override
  String get boUserPasswordLinkSubtitle =>
      'Ссылка для установки нового пароля, действует 15 минут';

  @override
  String get boUserExternal =>
      'Входит через единый вход, поэтому пароль управляется там.';

  @override
  String get boUserUnlock => 'Разблокировать учётную запись';

  @override
  String get boUserUnlocked => 'Учётная запись разблокирована';

  @override
  String get boUserDelete => 'Удалить пользователя';

  @override
  String boUserDeleteTitle(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get boUserDeleteBody =>
      'Его учётная запись и всё, что у него есть на этом сервере, будут удалены. Это нельзя отменить.';

  @override
  String get boUserDeleted => 'Пользователь удалён';

  @override
  String get boUserLinkTitle => 'Ссылка для пароля';

  @override
  String boUserLinkBody(String name) {
    return 'Отправьте эту ссылку пользователю $name. Она позволяет задать пароль и действует 15 минут.';
  }

  @override
  String get boPasswordRules =>
      'Не менее 8 символов, с заглавной буквой, строчной буквой и цифрой.';

  @override
  String get boSetPasswordTitle => 'Задайте пароль';

  @override
  String get boSetPasswordSubmit => 'Задать пароль и войти';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return 'Выберите пароль для $username на $server.';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return 'Выберите пароль для своей учётной записи на $server.';
  }

  @override
  String get boSetPasswordStartingBody =>
      'У этой учётной записи всё ещё пароль, с которым она была создана. Выберите новый, чтобы завершить вход.';

  @override
  String get boSetPasswordTrust =>
      'Продолжайте, только если доверяете отправителю этой ссылки.';

  @override
  String get boPasswordLinkExpired =>
      'Срок действия ссылки истёк, или она уже использована. Попросите у администратора сервера новую.';

  @override
  String boPasswordSetSignInFailed(String error) {
    return 'Пароль задан, но войти не удалось: $error';
  }

  @override
  String get boChangePasswordSubtitle => 'Обновить пароль BookOrbit';

  @override
  String get boPasswordChangeEffect =>
      'Смена пароля завершит другие ваши сеансы BookOrbit. Это устройство останется в системе.';

  @override
  String get boPasswordChanged =>
      'Пароль изменён. На других устройствах выполнен выход.';

  @override
  String boPasswordShareDescription(String username) {
    return 'Отправьте эту ссылку или попросите $username отсканировать QR-код, чтобы выбрать пароль и войти в Absorb. Она действует 15 минут.';
  }

  @override
  String boPasswordShareWarning(String username) {
    return 'Любой, у кого есть эта ссылка, может выбрать пароль для $username, пока она не использована или не истекла.';
  }

  @override
  String get setupLinkCopyWebLink => 'Копировать веб-ссылку';

  @override
  String get boUserLinkCopy => 'Копировать ссылку';

  @override
  String get boUserLinkCopied => 'Ссылка скопирована';

  @override
  String get boUserLinkShare => 'Поделиться';

  @override
  String get boUserNoLink =>
      'Пользователь добавлен, но сервер не прислал ссылку для пароля. Отправьте её со страницы пользователя.';

  @override
  String get boPermGroupLibrary => 'Библиотека и книги';

  @override
  String get boPermGroupRequests => 'Запросы книг';

  @override
  String get boPermGroupDevices => 'Устройства';

  @override
  String get boPermGroupIntegrations => 'Интеграции для чтения';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => 'Почта и уведомления';

  @override
  String get boPermGroupAdmin => 'Администрирование';

  @override
  String get boPermLibraryDownload => 'Скачивать книги';

  @override
  String get boPermLibraryUpload => 'Загружать книги';

  @override
  String get boPermLibraryEditMetadata => 'Изменять метаданные';

  @override
  String get boPermLibraryDeleteBooks => 'Удалять книги';

  @override
  String get boPermBookRequestAccess => 'Запрашивать книги';

  @override
  String get boPermBookRequestAutoApprove => 'Запросы одобряются автоматически';

  @override
  String get boPermBookRequestSelfFulfill =>
      'Скачивать запрошенные книги напрямую';

  @override
  String get boPermManageBookRequests => 'Управлять запросами книг';

  @override
  String get boPermKoboSync => 'Синхронизация Kobo';

  @override
  String get boPermKoreaderSync => 'Синхронизация KOReader';

  @override
  String get boPermOpdsAccess => 'Доступ к OPDS';

  @override
  String get boPermHardcoverSync => 'Синхронизация Hardcover';

  @override
  String get boPermReadwiseSync => 'Синхронизация Readwise';

  @override
  String get boPermStorygraphSync => 'Синхронизация StoryGraph';

  @override
  String get boPermBookDockAccess => 'Использовать Book Dock';

  @override
  String get boPermManageBookDock => 'Управлять Book Dock';

  @override
  String get boPermEmailSend => 'Отправлять книги по почте';

  @override
  String get boPermNotificationAccess => 'Уведомления';

  @override
  String get boPermManageEmail => 'Управлять почтой';

  @override
  String get boPermManageLibraries => 'Управлять библиотеками';

  @override
  String get boPermManageMetadataConfig => 'Настройки метаданных';

  @override
  String get boPermManageIcons => 'Управлять значками';

  @override
  String get boPermManageUsers => 'Управлять пользователями';

  @override
  String get boPermViewUserActivity => 'Просматривать активность пользователей';

  @override
  String get boPermViewAuditLog => 'Просматривать журнал аудита';

  @override
  String get boPermManageAppSettings => 'Настройки приложения';

  @override
  String get boLibsNone => 'Библиотек пока нет';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      many: '$count книг',
      few: '$count книги',
      one: '$count книга',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => 'Сканировать сейчас';

  @override
  String get boLibScanStarted => 'Сканирование начато';

  @override
  String get boLibScanning => 'Сканирование';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return 'Сканирование $date: добавлено $added, обновлено $updated, отсутствует $missing';
  }

  @override
  String get boLibScanFailed => 'Последнее сканирование не удалось';

  @override
  String get boLibNeverScanned => 'Ещё не сканировалась';

  @override
  String get boLibNew => 'Новая библиотека';

  @override
  String get boLibName => 'Название';

  @override
  String get boLibNeedName => 'Дайте библиотеке название';

  @override
  String get boLibIcon => 'Значок';

  @override
  String get boLibFolders => 'Папки';

  @override
  String get boLibFoldersHint =>
      'Папки на сервере, где хранятся книги этой библиотеки.';

  @override
  String get boLibNeedFolder => 'Добавьте хотя бы одну папку';

  @override
  String get boLibAddFolder => 'Добавить папку';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return 'Уже в «$library»';
  }

  @override
  String get boLibFolderUnreadable => 'Сервер не может прочитать эту папку';

  @override
  String get boLibFolderRescan =>
      'Изменение папок запускает повторное сканирование библиотеки.';

  @override
  String get boLibOrganization => 'Книги хранятся как';

  @override
  String get boLibPerFolder => 'Одна книга на папку';

  @override
  String get boLibPerFile => 'Одна книга на файл';

  @override
  String get boLibOrganizationFixed =>
      'Это нельзя изменить после создания библиотеки.';

  @override
  String get boLibWatch => 'Следить за изменениями';

  @override
  String get boLibWatchSubtitle =>
      'Подхватывать новые и изменённые файлы по мере появления';

  @override
  String get boLibSchedule => 'Сканирование по расписанию';

  @override
  String get boLibScheduleOff => 'Выкл';

  @override
  String get boLibScheduleDaily => 'Ежедневно';

  @override
  String get boLibScheduleWeekly => 'Еженедельно';

  @override
  String boLibScheduleCustom(String cron) {
    return 'Своё ($cron)';
  }

  @override
  String get boLibScheduleHint => 'Запускается в 3:00 по времени сервера.';

  @override
  String get boLibCovers => 'Форма обложки';

  @override
  String get boLibCoverBook => 'Книжная (2:3)';

  @override
  String get boLibCoverSquare => 'Квадратная (1:1)';

  @override
  String get boLibAccess => 'Кто может видеть';

  @override
  String get boLibAccessHint =>
      'Администраторы видят все библиотеки. Остальным нужен доступ здесь.';

  @override
  String get boLibAccessNone => 'Пока только администраторы';

  @override
  String get boLibAccessAdd => 'Добавить человека';

  @override
  String get boLibAccessEveryoneHas => 'У всех уже есть доступ';

  @override
  String get boLibLevelViewer => 'Наблюдатель';

  @override
  String get boLibLevelEditor => 'Редактор';

  @override
  String get boLibLevelOwner => 'Владелец';

  @override
  String get boLibAccessRemove => 'Убрать доступ';

  @override
  String get boLibDelete => 'Удалить библиотеку';

  @override
  String boLibDeleteTitle(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get boLibDeleteBody =>
      'Библиотека удаляется из BookOrbit вместе с прогрессом и выделениями её книг. Файлы на сервере остаются на месте.';

  @override
  String get boLibDeleted => 'Библиотека удалена';

  @override
  String get boFolderPickTitle => 'Выберите папку';

  @override
  String get boFolderUseThis => 'Использовать эту папку';

  @override
  String get boFolderEmpty => 'Внутри нет папок';

  @override
  String get statsTotalTime => 'ОБЩЕЕ ВРЕМЯ';

  @override
  String get statsTotalReadingTime => 'ОБЩЕЕ ВРЕМЯ ЧТЕНИЯ';

  @override
  String statsDaysOfTime(String days) {
    return 'Это $days дн.';
  }

  @override
  String statsHoursOfTime(String hours) {
    return 'Это $hours ч';
  }

  @override
  String get statsMediaAll => 'Все';

  @override
  String get statsMediaListening => 'Прослушивание';

  @override
  String get statsMediaReading => 'Чтение';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'BookOrbit считает ваши дни по часовому поясу $server, а на этом телефоне стоит $phone. Время в конце дня может попасть не в тот день.';
  }

  @override
  String statsZoneUse(String zone) {
    return 'Использовать $zone';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'BookOrbit теперь использует $zone. Более старые дни могут обновиться через несколько минут.';
  }

  @override
  String get statsZoneFailed => 'Не удалось изменить часовой пояс в BookOrbit';

  @override
  String get statsTimeOfDay => 'Время суток';

  @override
  String statsBusiestAround(String time) {
    return 'Пик около $time';
  }

  @override
  String get statsFinishedByMonth => 'Прослушано книг по месяцам';

  @override
  String statsFinishedLast12(int count) {
    return '$count за последние 12 месяцев';
  }

  @override
  String get statsWhereTitle => 'Где вы слушаете и читаете';

  @override
  String get statsLast12Months => 'Последние 12 месяцев';

  @override
  String get statsHabits => 'Привычки';

  @override
  String get statsTypicalSession => 'Типичный сеанс';

  @override
  String get statsProgressPerSession => 'Прогресс за сеанс';

  @override
  String get statsTimeToFinish => 'Время до завершения';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня',
      many: '$count дней',
      few: '$count дня',
      one: '$count день',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => 'Начато книг';

  @override
  String get statsBooksInProgress => 'В процессе';

  @override
  String get statsAverageProgress => 'Средний прогресс';

  @override
  String get statsTopBooks => 'Лучшие книги';

  @override
  String get statsYearRead => 'Прочитано';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count непрочитанных',
      many: '$count непрочитанных',
      few: '$count непрочитанных',
      one: '$count непрочитанное',
      zero: 'Нового нет',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => 'Отметить все прочитанными';

  @override
  String get boNotificationsClearAll => 'Очистить все';

  @override
  String get boNotificationsClearTitle => 'Очистить все уведомления?';

  @override
  String get boNotificationsClearBody =>
      'Все уведомления будут удалены из вашей учётной записи BookOrbit.';

  @override
  String get boNotificationsEmpty => 'Уведомлений пока нет';

  @override
  String get boNotificationsLoadFailed => 'Не удалось загрузить уведомления';

  @override
  String get boNotificationsUpdateFailed =>
      'Не удалось обновить уведомления в BookOrbit';

  @override
  String boNotificationsOccurrences(int count) {
    return 'Произошло раз: $count';
  }

  @override
  String get boNotificationsSettings => 'Настройки уведомлений';

  @override
  String get boNotificationsSettingsIntro =>
      'Выберите, какие уведомления BookOrbit сохраняет для вас.';

  @override
  String get boNotificationsProblemsHint =>
      'Режим «Проблемы» уведомляет только о сбоях и о том, что требует внимания.';

  @override
  String get boNotificationLevelOff => 'Выкл';

  @override
  String get boNotificationLevelProblems => 'Проблемы';

  @override
  String get boNotificationLevelAll => 'Все';

  @override
  String get boNotificationsSaved => 'Настройки уведомлений сохранены';

  @override
  String get boNotificationsSaveFailed =>
      'Не удалось сохранить настройки уведомлений';

  @override
  String get boNotificationGroupLibrary => 'Библиотека';

  @override
  String get boNotificationGroupFiles => 'Файлы';

  @override
  String get boNotificationGroupIntegrations => 'Интеграции';

  @override
  String get boNotificationGroupPersonal => 'Личные';

  @override
  String get boNotifyScanning => 'Сканирование библиотеки';

  @override
  String get boNotifyScanningDesc =>
      'Когда сканирование библиотеки завершается, не удаётся или находит отсутствующие книги.';

  @override
  String get boNotifyMetadata => 'Получение метаданных';

  @override
  String get boNotifyMetadataDesc =>
      'Когда поиск метаданных для ваших книг завершается или не удаётся.';

  @override
  String get boNotifyAuthorEnrichment => 'Сведения об авторах';

  @override
  String get boNotifyAuthorEnrichmentDesc =>
      'Когда биографии и фотографии авторов закончили скачиваться.';

  @override
  String get boNotifyFileWriteBack => 'Сохранение в файлы';

  @override
  String get boNotifyFileWriteBackDesc =>
      'Когда изменённые сведения сохраняются в файлы книг на диске.';

  @override
  String get boNotifyFileRename => 'Переименование файлов';

  @override
  String get boNotifyFileRenameDesc =>
      'Когда файл книги переименовывается по вашему шаблону имён.';

  @override
  String get boNotifyBulkRename => 'Массовое переименование';

  @override
  String get boNotifyBulkRenameDesc =>
      'Когда переименование многих книг или перенос книг между библиотеками завершается или не удаётся.';

  @override
  String get boNotifyMigration => 'Импорт';

  @override
  String get boNotifyMigrationDesc =>
      'Когда импорт из другого приложения для библиотеки завершается или не удаётся.';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc =>
      'Когда Book Dock заканчивает добавлять книги или сталкивается с проблемами.';

  @override
  String get boNotifyBookRequests => 'Запросы книг';

  @override
  String get boNotifyBookRequestsDesc =>
      'Когда запрос книги отправлен или рассмотрен либо книга стала доступна.';

  @override
  String get boNotifyEmail => 'Доставка по почте';

  @override
  String get boNotifyEmailDesc =>
      'Когда отправка книги по почте удалась или не удалась.';

  @override
  String get boNotifyAchievements => 'Достижения';

  @override
  String get boNotifyAchievementsDesc => 'Когда вы получаете новое достижение.';

  @override
  String get achievementsTitle => 'Достижения';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return 'Получено $earned из $total';
  }

  @override
  String get achievementsFilterAll => 'Все';

  @override
  String get achievementsFilterEarned => 'Полученные';

  @override
  String get achievementsFilterInProgress => 'В процессе';

  @override
  String get achievementsFilterLocked => 'Закрытые';

  @override
  String get achievementsCategoryReading => 'Чтение';

  @override
  String get achievementsCategoryLibrary => 'Библиотека';

  @override
  String get achievementsCategoryExploration => 'Исследование';

  @override
  String get achievementsCategoryDedication => 'Преданность';

  @override
  String get achievementsCategoryDevices => 'Устройства';

  @override
  String get achievementsRarityCommon => 'Обычное';

  @override
  String get achievementsRarityRare => 'Редкое';

  @override
  String get achievementsRarityEpic => 'Эпическое';

  @override
  String get achievementsRarityLegendary => 'Легендарное';

  @override
  String get achievementsLoadFailed => 'Не удалось загрузить достижения';

  @override
  String get achievementsNoneMatch =>
      'Нет достижений, подходящих под этот фильтр';

  @override
  String get achievementsSecretName => 'Секретное достижение';

  @override
  String get achievementsSecretHint =>
      'Продолжайте читать, чтобы раскрыть его.';

  @override
  String achievementsEarnedOn(String date) {
    return 'Получено $date';
  }

  @override
  String achievementsWhileReading(String title) {
    return 'За чтением «$title»';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return 'Уровень $earned из $total';
  }

  @override
  String get achievementsTiers => 'Уровни';

  @override
  String get achievementsAllTiers => 'Все уровни получены';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold книг';
  }

  @override
  String achievementsProgressPages(String current, String threshold) {
    return '$current / $threshold страниц';
  }

  @override
  String achievementsProgressHours(String current, String threshold) {
    return '$current / $threshold часов';
  }

  @override
  String achievementsProgressAnnotations(String current, String threshold) {
    return '$current / $threshold выделений и заметок';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold оценок';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $threshold жанров';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold языков';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold дней';
  }

  @override
  String get achievementsHowToGetIt => 'Как получить';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'За последние дни ($days) вы читали $count часа.',
      many: 'За последние дни ($days) вы читали $count часов.',
      few: 'За последние дни ($days) вы читали $count часа.',
      one: 'За последние дни ($days) вы читали $count час.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Около $count дня при таком темпе.',
      many: 'Около $count дней при таком темпе.',
      few: 'Около $count дней при таком темпе.',
      one: 'Около $count дня при таком темпе.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Около $count недели при таком темпе.',
      many: 'Около $count недель при таком темпе.',
      few: 'Около $count недель при таком темпе.',
      one: 'Около $count недели при таком темпе.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Около $count месяца при таком темпе.',
      many: 'Около $count месяцев при таком темпе.',
      few: 'Около $count месяцев при таком темпе.',
      one: 'Около $count месяца при таком темпе.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги $decade-х годов ждут на ваших полках.',
      many: '$count книг $decade-х годов ждут на ваших полках.',
      few: '$count книги $decade-х годов ждут на ваших полках.',
      one: '$count книга $decade-х годов ждёт на ваших полках.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги $century-х годов ждут на ваших полках.',
      many: '$count книг $century-х годов ждут на ваших полках.',
      few: '$count книги $century-х годов ждут на ваших полках.',
      one: '$count книга $century-х годов ждёт на ваших полках.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return '«$title»: прочитано $percent, начато $date.';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return '«$title» начата $date.';
  }

  @override
  String get achievementsHintUntitledBook => 'Книга в процессе';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги в процессе прочитаны более чем на $percent.',
      many: '$count книг в процессе прочитано более чем на $percent.',
      few: '$count книги в процессе прочитаны более чем на $percent.',
      one: '$count книга в процессе прочитана более чем на $percent.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'У $count дочитанных книг ещё нет оценки.',
      many: 'У $count дочитанных книг ещё нет оценки.',
      few: 'У $count дочитанных книг ещё нет оценки.',
      one: 'У $count дочитанной книги ещё нет оценки.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги короче $pages страниц ждут на ваших полках.',
      many: '$count книг короче $pages страниц ждут на ваших полках.',
      few: '$count книги короче $pages страниц ждут на ваших полках.',
      one: '$count книга короче $pages страниц ждёт на ваших полках.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count уже в процессе.',
      many: '$count уже в процессе.',
      few: '$count уже в процессе.',
      one: '$count уже в процессе.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги от $pages страниц ждут на ваших полках.',
      many: '$count книг от $pages страниц ждут на ваших полках.',
      few: '$count книги от $pages страниц ждут на ваших полках.',
      one: '$count книга от $pages страниц ждёт на ваших полках.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги, изданные до $year года, ждут на ваших полках.',
      many: '$count книг, изданных до $year года, ждут на ваших полках.',
      few: '$count книги, изданные до $year года, ждут на ваших полках.',
      one: '$count книга, изданная до $year года, ждёт на ваших полках.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author: прочитано $finished, ещё $count на ваших полках.';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги на языке «$language» ждут на ваших полках.',
      many: '$count книг на языке «$language» ждут на ваших полках.',
      few: '$count книги на языке «$language» ждут на ваших полках.',
      one: '$count книга на языке «$language» ждёт на ваших полках.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В $year году вы читали пока в $count месяцах.',
      many: 'В $year году вы читали пока в $count месяцах.',
      few: 'В $year году вы читали пока в $count месяцах.',
      one: 'В $year году вы читали пока в $count месяце.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Осталось: $months.',
      many: 'Осталось: $months.',
      few: 'Осталось: $months.',
      one: 'Остался: $months.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return 'На ваших полках пока нет книг от $pages страниц.';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return 'На ваших полках нет ничего, изданного до $year года.';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ваши полки пока охватывают только $count десятилетия.',
      many: 'Ваши полки пока охватывают только $count десятилетий.',
      few: 'Ваши полки пока охватывают только $count десятилетия.',
      one: 'Ваши полки пока охватывают только $count десятилетие.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ваши полки пока охватывают только $count века.',
      many: 'Ваши полки пока охватывают только $count веков.',
      few: 'Ваши полки пока охватывают только $count века.',
      one: 'Ваши полки пока охватывают только $count век.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return 'Вы не читали в $month, поэтому $year год недостижим. Счёт начнётся заново в январе.';
  }

  @override
  String get achievementsSwitch => 'Достижения';

  @override
  String get achievementsSwitchSubtitle =>
      'Отслеживать достижения в BookOrbit. Если выключить, они скроются здесь и в веб-версии.';

  @override
  String get achievementsTurnedOn => 'Достижения включены';

  @override
  String get achievementsTurnedOff => 'Достижения выключены';

  @override
  String get achievementsSwitchFailed =>
      'Не удалось изменить достижения в BookOrbit';

  @override
  String get boNotifyReadAlong => 'Чтение с озвучкой';

  @override
  String get boNotifyReadAlongDesc =>
      'Когда запущенное вами чтение с озвучкой готово, требует проверки или завершилось ошибкой.';

  @override
  String get readAlongCreate => 'Создать чтение с озвучкой';

  @override
  String get readAlongLoadFailed =>
      'Не удалось проверить, можно ли создать чтение с озвучкой для этой книги.';

  @override
  String get readAlongCheckAgain => 'Проверить снова';

  @override
  String get readAlongWhyWorkerOffline =>
      'Обработчик чтения с озвучкой BookOrbit сейчас не в сети.';

  @override
  String get readAlongWhyWorkerOutdated =>
      'Обработчик чтения с озвучкой BookOrbit нужно обновить, чтобы он работал с этим сервером.';

  @override
  String get readAlongWhyFilesMissing =>
      'Восстановите недостающие файлы книги, чтобы создать чтение с озвучкой.';

  @override
  String get readAlongWhyNoEpub =>
      'Добавьте к книге обычный EPUB, чтобы создать чтение с озвучкой.';

  @override
  String get readAlongWhyNoEpubHasOne =>
      'У этой книги уже есть чтение с озвучкой, а обычного EPUB для создания ещё одного нет.';

  @override
  String get readAlongWhyTooManyTracks =>
      'В этой аудиокниге слишком много файлов для создания чтения с озвучкой.';

  @override
  String get readAlongWhyEpubNotAllowed =>
      'Эта библиотека не принимает файлы EPUB, поэтому чтение с озвучкой добавить нельзя.';

  @override
  String get readAlongWhyNotMounted =>
      'Обработчик чтения с озвучкой BookOrbit не имеет доступа к папке этой библиотеки.';

  @override
  String get readAlongWhyRunning =>
      'Чтение с озвучкой для этой книги уже создаётся.';

  @override
  String get readAlongWhyUnknown =>
      'Сейчас нельзя создать чтение с озвучкой для этой книги.';

  @override
  String get readAlongSheetTitle => 'Создать чтение с озвучкой';

  @override
  String get readAlongSheetIntro =>
      'BookOrbit сопоставляет озвучку с текстом электронной книги и добавляет EPUB, где текст подсвечивается вместе со звуком.';

  @override
  String get readAlongEbook => 'Электронная книга';

  @override
  String get readAlongEbookHint =>
      'Выберите обычный EPUB, соответствующий озвучке.';

  @override
  String get readAlongAudio => 'Аудиокнига';

  @override
  String readAlongTracks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count трека',
      many: '$count треков',
      few: '$count трека',
      one: '$count трек',
    );
    return '$_temp0';
  }

  @override
  String readAlongExistingTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'У этой книги уже есть $count чтения с озвучкой',
      many: 'У этой книги уже есть $count чтений с озвучкой',
      few: 'У этой книги уже есть $count чтения с озвучкой',
      one: 'У этой книги уже есть $count чтение с озвучкой',
    );
    return '$_temp0';
  }

  @override
  String readAlongReplace(String name) {
    return 'Заменить $name';
  }

  @override
  String readAlongKeepBoth(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Оставить все',
      one: 'Оставить оба',
    );
    return '$_temp0';
  }

  @override
  String get readAlongKeepHint =>
      'Новое чтение с озвучкой добавится отдельным файлом.';

  @override
  String get readAlongReplaceHint =>
      'Старый файл заменится, только когда новый пройдёт проверку; места чтения сохранятся.';

  @override
  String get readAlongReplaceNotAllowed =>
      'Для замены нужно право удалять книги, поэтому новое чтение с озвучкой добавится отдельным файлом.';

  @override
  String get readAlongMadeByBookOrbit => 'Создано BookOrbit';

  @override
  String get readAlongImported => 'Импортировано';

  @override
  String get readAlongLanguage => 'Язык озвучки';

  @override
  String get readAlongPickLanguage => 'Выберите язык';

  @override
  String readAlongLanguageUnsupported(String language) {
    return 'Модель распознавания речи не знает язык этой книги ($language).';
  }

  @override
  String get readAlongLanguageFromBook => 'Из данных книги.';

  @override
  String get readAlongLanguageIsDefault => 'Ваш язык по умолчанию.';

  @override
  String get readAlongLanguageSaved => 'Сохранён как ваш язык по умолчанию.';

  @override
  String get readAlongSetDefault => 'Сделать по умолчанию';

  @override
  String get readAlongDefaultFailed =>
      'Не удалось сохранить язык по умолчанию.';

  @override
  String get readAlongHighlighting => 'Подсветка';

  @override
  String get readAlongSentence => 'Предложение';

  @override
  String get readAlongSentenceHint =>
      'Подсвечивает по одному предложению. Рекомендуется.';

  @override
  String get readAlongWord => 'Слово';

  @override
  String get readAlongWordHint =>
      'Подсвечивает каждое слово. Дольше и файл больше. Пока экспериментально.';

  @override
  String readAlongEstimatedSize(String size) {
    return 'Примерный размер: $size';
  }

  @override
  String get readAlongBackgroundNote =>
      'Выполняется на сервере, поэтому окно можно закрыть. Длинные аудиокниги могут обрабатываться часами, а при первом запуске для языка скачивается его модель речи.';

  @override
  String readAlongLowDisk(String needed, String free) {
    return 'Мало места на диске: нужно около $needed рабочего пространства, а на обработчике свободно $free.';
  }

  @override
  String get readAlongStart => 'Начать';

  @override
  String get readAlongStartFailed =>
      'Не удалось запустить чтение с озвучкой. Попробуйте ещё раз.';

  @override
  String get readAlongStartInvalid =>
      'Некоторых выбранных файлов больше нет у этой книги. Проверьте их и повторите.';

  @override
  String get readAlongStartOffline =>
      'Обработчик чтения с озвучкой BookOrbit не в сети. Попробуйте позже.';

  @override
  String get readAlongNotAllowed => 'У вас нет прав на это действие.';

  @override
  String get readAlongGone =>
      'Эта задача чтения с озвучкой больше не существует.';

  @override
  String get readAlongMovedOn =>
      'Эта задача уже перешла дальше. Теперь показан её текущий этап.';

  @override
  String get readAlongActionFailed => 'Не получилось. Попробуйте ещё раз.';

  @override
  String readAlongStartedBy(String name) {
    return 'Запустил(а): $name';
  }

  @override
  String get readAlongStartedByOther => 'Запущено другим пользователем';

  @override
  String get readAlongWaiting => 'Ожидает запуска';

  @override
  String get readAlongNextInLine => 'Следующая в очереди';

  @override
  String readAlongJobsAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Впереди $count задачи',
      many: 'Впереди $count задач',
      few: 'Впереди $count задачи',
      one: 'Впереди $count задача',
    );
    return '$_temp0';
  }

  @override
  String get readAlongStopping => 'Остановка';

  @override
  String get readAlongStoppingHint =>
      'Завершается текущий шаг, затем задача остановится. В книгу ничего не добавится.';

  @override
  String get readAlongStagePreparingAudio => 'Подготовка аудио';

  @override
  String get readAlongStageDownloadingModel => 'Загрузка модели речи';

  @override
  String get readAlongStageListening => 'Распознавание озвучки';

  @override
  String get readAlongStageMarkingUp => 'Разметка текста электронной книги';

  @override
  String get readAlongStageAligning => 'Сопоставление текста с озвучкой';

  @override
  String get readAlongStageChecking => 'Проверка результата';

  @override
  String get readAlongStagePublishing => 'Добавление чтения с озвучкой в книгу';

  @override
  String get readAlongStageWorking => 'Работа';

  @override
  String readAlongFileOf(int current, int total) {
    return 'Файл $current из $total';
  }

  @override
  String readAlongTrackOf(int current, int total) {
    return 'Трек $current из $total';
  }

  @override
  String readAlongChapterOf(int current, int total) {
    return 'Глава $current из $total';
  }

  @override
  String readAlongStepOf(int current, int total) {
    return 'Шаг $current из $total';
  }

  @override
  String get readAlongFirstRun => 'Первый запуск для этого языка';

  @override
  String get readAlongJustStarted => 'Только началось';

  @override
  String readAlongRunningFor(String duration) {
    return 'Выполняется: $duration';
  }

  @override
  String get readAlongStepAudio => 'Аудио';

  @override
  String get readAlongStepSpeech => 'Речь';

  @override
  String get readAlongStepText => 'Текст';

  @override
  String get readAlongStepAlign => 'Сопоставление';

  @override
  String get readAlongStepCheck => 'Проверка';

  @override
  String get readAlongStepAdd => 'Добавление';

  @override
  String get readAlongReviewTitle => 'Готово к проверке';

  @override
  String readAlongReviewMatched(String percent) {
    return '$percent текста совпало с озвучкой. Проверьте результат, прежде чем добавлять его в книгу.';
  }

  @override
  String get readAlongReviewPlain =>
      'Проверьте результат, прежде чем добавлять его в книгу.';

  @override
  String get readAlongReviewWeb =>
      'Чтобы исключить главы и сопоставить заново, откройте эту книгу в веб-версии BookOrbit.';

  @override
  String readAlongReviewExpires(String date) {
    return 'Будет удалено автоматически $date, если вы его не проверите.';
  }

  @override
  String get readAlongAddAnyway => 'Всё равно добавить';

  @override
  String get readAlongDiscard => 'Отбросить';

  @override
  String get readAlongDiscardPrompt => 'Отбросить это чтение с озвучкой?';

  @override
  String get readAlongKeepIt => 'Оставить';

  @override
  String get readAlongReady => 'Чтение с озвучкой готово';

  @override
  String get readAlongReadyWarnings =>
      'Чтение с озвучкой готово, есть предупреждения';

  @override
  String get readAlongAdded => 'Добавлено в книгу как новый EPUB.';

  @override
  String get readAlongReplaced =>
      'Старое чтение с озвучкой заменено. Места чтения сохранены.';

  @override
  String readAlongMatchedSentences(String matched, String total) {
    return 'Совпало предложений с озвучкой: $matched из $total';
  }

  @override
  String readAlongAudioUsed(String percent) {
    return 'Использовано аудио: $percent';
  }

  @override
  String readAlongOutside(String chapters) {
    return 'Нет в озвучке, поэтому остались без звука: $chapters.';
  }

  @override
  String readAlongOutsideMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ещё $count главы',
      many: 'Ещё $count глав',
      few: 'Ещё $count главы',
      one: 'Ещё $count глава',
    );
    return '$_temp0';
  }

  @override
  String get readAlongWarnUnaligned =>
      'Не удалось сопоставить один или несколько аудиотреков.';

  @override
  String get readAlongWarnUnmatched =>
      'Заметная часть текста электронной книги не совпала с озвучкой.';

  @override
  String get readAlongWarnInterpolated =>
      'Время части текста вычислено приблизительно между точными совпадениями.';

  @override
  String get readAlongWarnDropped =>
      'Часть текста электронной книги исключена из подсветки.';

  @override
  String get readAlongFailed => 'Ошибка чтения с озвучкой';

  @override
  String get readAlongCancelled => 'Чтение с озвучкой отменено';

  @override
  String get readAlongDiscarded => 'Чтение с озвучкой отброшено';

  @override
  String get readAlongNothingAdded => 'В книгу ничего не добавлено.';

  @override
  String get readAlongExpired =>
      'Его не проверили в течение 14 дней, поэтому в книгу ничего не добавлено.';

  @override
  String readAlongRetryUntil(String date) {
    return 'Повтор продолжится с последнего завершённого шага до $date.';
  }

  @override
  String get readAlongStartOver => 'Начать заново';

  @override
  String get readAlongCancel => 'Отменить чтение с озвучкой';

  @override
  String get readAlongCancelPrompt => 'Отменить это чтение с озвучкой?';

  @override
  String get readAlongKeepRunning => 'Продолжить';

  @override
  String get readAlongErrorWorkerOffline =>
      'BookOrbit не удалось связаться с обработчиком чтения с озвучкой.';

  @override
  String get readAlongErrorWorkerCrashed =>
      'Обработчик чтения с озвучкой неожиданно остановился.';

  @override
  String get readAlongErrorSourceMissing => 'Выбранного файла больше нет.';

  @override
  String get readAlongErrorSourceChanged =>
      'Выбранный файл изменился после запуска задачи.';

  @override
  String get readAlongErrorInvalidSource =>
      'Не удалось прочитать EPUB или аудиокнигу.';

  @override
  String get readAlongErrorLanguage =>
      'Модель распознавания речи не знает выбранный язык.';

  @override
  String get readAlongErrorStorage =>
      'На обработчике недостаточно свободного места на диске для завершения.';

  @override
  String get readAlongErrorAudio => 'Не удалось подготовить аудиокнигу.';

  @override
  String get readAlongErrorModel => 'Не удалось скачать модель речи.';

  @override
  String get readAlongErrorListening =>
      'Сбой распознавания речи при обработке озвучки.';

  @override
  String get readAlongErrorMarkup =>
      'Не удалось подготовить текст электронной книги для сопоставления.';

  @override
  String get readAlongErrorAlignment =>
      'Не удалось сопоставить текст с озвучкой.';

  @override
  String get readAlongErrorOutput => 'Новый EPUB не прошёл проверку.';

  @override
  String get readAlongErrorPublish =>
      'Не удалось добавить новый EPUB в эту книгу.';

  @override
  String get readAlongErrorDiscarded => 'Отброшено при проверке.';

  @override
  String get readAlongErrorCancelled => 'Отменено.';

  @override
  String get readAlongErrorUnknown =>
      'Что-то пошло не так при создании чтения с озвучкой.';

  @override
  String get fileInfoNoAudiobook => 'Аудиокниги пока нет';

  @override
  String get fileInfoNoEbook => 'Электронной книги пока нет';

  @override
  String get fileInfoRequestedBySomeone => 'Запрошено другим пользователем';

  @override
  String get fileInfoOwnedSeparately =>
      'В вашей библиотеке как отдельная книга';

  @override
  String get fileInfoCopyPath => 'Копировать путь';

  @override
  String get fileInfoDeleteTitle => 'Удалить файл?';

  @override
  String fileInfoDeletePrompt(String name) {
    return '\"$name\" будет удалён с сервера. Это нельзя отменить.';
  }

  @override
  String get fileInfoDeleteLast =>
      'Это последний аудио- или электронный файл книги, поэтому книга будет показана как отсутствующая.';

  @override
  String get fileInfoDeleteNotAllowed => 'У вас нет прав на удаление файлов';

  @override
  String get chapterSourceEmbedded => 'Прочитано из аудиофайлов';

  @override
  String get chapterSourceTracks => 'Одна глава на аудиофайл, не сохранено';

  @override
  String get chapterSourceProvider => 'Из полученных метаданных';

  @override
  String get chapterSourceMigration => 'Импортировано из Audiobookshelf';

  @override
  String get chapterSourceManual => 'Изменено в BookOrbit';

  @override
  String chapterSourceManualBy(String name) {
    return 'Изменил(а): $name';
  }

  @override
  String get chapterSourceNone => 'Глав пока нет';

  @override
  String get chapterProtected => 'Защищены от пересканирования';

  @override
  String get chapterNotProtected => 'Пересканирование может их заменить';

  @override
  String get chapterProtectOnSave => 'Защитить от пересканирования';

  @override
  String get chapterGetFrom => 'Получить главы из';

  @override
  String get chapterFromFiles => 'Аудиофайлов';

  @override
  String get chapterFromEbookToc => 'Оглавления электронной книги';

  @override
  String get chapterFromReadAlong => 'Чтения с озвучкой';

  @override
  String get chapterFromHistory => 'Прежних версий';

  @override
  String get chapterHistoryTitle => 'Прежние версии';

  @override
  String get chapterHistoryEmpty => 'Здесь появятся сохранённые версии.';

  @override
  String chapterHistoryBy(String source, String name) {
    return '$source, $name';
  }

  @override
  String get chapterReadingFiles => 'Чтение аудиофайлов...';

  @override
  String get chapterRevertToFiles => 'Вернуть из файлов';

  @override
  String get chapterRevertTitle => 'Вернуться к главам из файлов?';

  @override
  String get chapterRevertMessage =>
      'BookOrbit заново прочитает главы из аудиофайлов и перестанет защищать их от пересканирования. Несохранённые правки будут потеряны. Текущий список останется в прежних версиях.';

  @override
  String get chapterReverted => 'Главы возвращены к аудиофайлам';

  @override
  String get chapterWriteFiles => 'Записать в файлы';

  @override
  String get chapterWriteTitle => 'Записать главы в аудиофайлы?';

  @override
  String chapterWriteMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аудиофайла книги будут перезаписаны с этими главами.',
      many: '$count аудиофайлов книги будут перезаписаны с этими главами.',
      few: '$count аудиофайла книги будут перезаписаны с этими главами.',
      one: 'Аудиофайл книги будет перезаписан с этими главами.',
    );
    return '$_temp0 Само аудио копируется без изменений. Телефоны, уже скачавшие книгу, сохранят свою копию, пока она не будет скачана заново.';
  }

  @override
  String get chapterWriteConfirm => 'Записать';

  @override
  String get chapterWriting => 'Запись глав в аудиофайлы...';

  @override
  String chapterWritten(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Главы записаны во все $count аудиофайла',
      many: 'Главы записаны во все $count аудиофайлов',
      few: 'Главы записаны во все $count аудиофайла',
      one: 'Главы записаны в аудиофайл',
    );
    return '$_temp0';
  }

  @override
  String chapterWrittenPartly(int written, int total) {
    return 'Главы записаны в файлов: $written из $total. Остальные остались без изменений.';
  }

  @override
  String get chapterStaleTitle => 'Эти главы изменились';

  @override
  String get chapterStaleMessage =>
      'Кто-то другой сохранил эти главы после того, как вы их открыли. Перезагрузите, чтобы увидеть его версию. Ваши правки сохранятся, пока вы этого не сделаете.';

  @override
  String get chapterReload => 'Перезагрузить';

  @override
  String get chapterKeepEditing => 'Продолжить правки';

  @override
  String get matchExplicitYes => 'Отмечено 18+';

  @override
  String get matchExplicitNo => 'Без ограничения 18+';

  @override
  String get matchAbridgedYes => 'Сокращённая';

  @override
  String get matchAbridgedNo => 'Полная';

  @override
  String boQuickMatchBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'об этих $count книгах',
      many: 'об этих $count книгах',
      few: 'об этих $count книгах',
      one: 'об этой книге',
    );
    return 'BookOrbit ищет данные $_temp0 и заполняет найденное согласно своим настройкам метаданных.';
  }

  @override
  String get boQuickMatchIgnoreCache => 'Опросить все источники заново';

  @override
  String get boQuickMatchIgnoreCacheHint =>
      'Пропускает сохранённые ответы. Медленнее и расходует больше лимита запросов каждого источника.';

  @override
  String boAdminServerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count почтового сервера',
      many: '$count почтовых серверов',
      few: '$count почтовых сервера',
      one: '$count почтовый сервер',
      zero: 'Пока нет',
    );
    return '$_temp0';
  }

  @override
  String get boEmailTitle => 'Отправка по почте';

  @override
  String get boEmailSubtitle =>
      'Устройства, почтовые серверы и шаблоны для отправки книг';

  @override
  String get boEmailTabDevices => 'Устройства';

  @override
  String get boEmailTabServers => 'Почтовые серверы';

  @override
  String get boEmailTabTemplates => 'Шаблоны';

  @override
  String get boEmailTabHistory => 'История';

  @override
  String get boEmailName => 'Название';

  @override
  String boEmailDeleteTitle(String name) {
    return 'Удалить $name?';
  }

  @override
  String get boEmailMakeDefault => 'Сделать основным';

  @override
  String get boEmailBadgeDefault => 'Основное';

  @override
  String get boEmailBadgeShared => 'Общий';

  @override
  String get boEmailBadgeSystem => 'Сброс паролей';

  @override
  String get boEmailBadgeBuiltIn => 'Встроенный';

  @override
  String get boEmailDevicesEmpty =>
      'Устройств пока нет. Добавьте адрес электронной почты вашей читалки, чтобы отправлять ей книги.';

  @override
  String get boEmailAddDevice => 'Добавить устройство';

  @override
  String get boEmailNewDevice => 'Новое устройство';

  @override
  String get boEmailDeviceNameHint => 'Мой Kindle';

  @override
  String get boEmailDeviceAddress => 'Адрес электронной почты';

  @override
  String get boEmailDeviceType => 'Устройство';

  @override
  String get boEmailDeviceNone => 'Человек или ящик';

  @override
  String get boEmailDeviceKindle => 'Kindle';

  @override
  String get boEmailDeviceKobo => 'Kobo';

  @override
  String get boEmailDeviceOther => 'Другая читалка';

  @override
  String get boEmailKindleHint =>
      'Kindle получает тему \"convert\" и принимает по почте только EPUB и PDF.';

  @override
  String boEmailKindleApprove(String address) {
    return 'Kindle отбрасывает письма с незнакомых адресов. В настройках персональных документов Amazon добавьте $address в список разрешённых.';
  }

  @override
  String get boEmailKindleApproveNoServer =>
      'Сначала добавьте почтовый сервер, чтобы увидеть адрес, который нужно разрешить в Kindle.';

  @override
  String get boEmailFormat => 'Формат';

  @override
  String get boEmailFormatPrimary => 'Основной файл книги';

  @override
  String get boEmailFormatHint =>
      'Если книги в этом формате нет, отправляется её основной файл.';

  @override
  String get boEmailReadAlong => 'Книги с озвучкой в тексте';

  @override
  String get boEmailReadAlongAuto => 'Автоматически';

  @override
  String get boEmailReadAlongAutoHint =>
      'Только текст, если можно сделать копию, иначе оригинал.';

  @override
  String get boEmailReadAlongText => 'Только текст';

  @override
  String get boEmailReadAlongTextHint =>
      'Озвучка убрана. Достаточно мал для отправки по почте.';

  @override
  String get boEmailReadAlongOriginal => 'С озвучкой';

  @override
  String get boEmailReadAlongOriginalHint =>
      'Озвучка сохраняется. Часто 100 МБ и больше, это выше лимита большинства почтовых серверов.';

  @override
  String get boEmailTemplate => 'Шаблон';

  @override
  String get boEmailTemplateYourDefault => 'Ваш основной';

  @override
  String get boEmailTemplateKindleHint =>
      'Kindle не показывает письмо, поэтому шаблон пропускается.';

  @override
  String get boEmailDefaultDevice => 'Основное устройство';

  @override
  String get boEmailDefaultDeviceHint =>
      'Выбирается первым при отправке книги.';

  @override
  String get boEmailSendTest => 'Отправить тестовое письмо';

  @override
  String get boEmailTestSubject => 'Тестовое письмо от Absorb';

  @override
  String boEmailTestBody(String name) {
    return 'Это тест от Absorb. Если вы можете это прочитать, книги, отправленные на $name, тоже дойдут сюда.';
  }

  @override
  String boEmailTestSent(String name) {
    return 'Тестовое письмо отправлено на $name';
  }

  @override
  String boEmailTestFailed(String error) {
    return 'Тестовое письмо не отправлено: $error';
  }

  @override
  String get boEmailDeleteDevice => 'Удалить устройство';

  @override
  String get boEmailDeleteDeviceBody => 'История отправок сохранится.';

  @override
  String get boEmailDeviceRequired =>
      'Введите название и адрес электронной почты';

  @override
  String get boEmailLastSendFailed => 'Последняя отправка не удалась';

  @override
  String get boEmailGroups => 'Группы';

  @override
  String get boEmailGroupsHint => 'Отправка сразу на несколько устройств.';

  @override
  String get boEmailNewGroup => 'Новая группа';

  @override
  String get boEmailGroupNameHint => 'Книжный клуб';

  @override
  String get boEmailGroupMembers => 'Устройства в этой группе';

  @override
  String get boEmailGroupMembersEmpty => 'Сначала добавьте устройство.';

  @override
  String boEmailGroupMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count устройства',
      many: '$count устройств',
      few: '$count устройства',
      one: '$count устройство',
      zero: 'Нет устройств',
    );
    return '$_temp0';
  }

  @override
  String get boEmailDeleteGroup => 'Удалить группу';

  @override
  String get boEmailDeleteGroupBody => 'Устройства в ней сохранятся.';

  @override
  String get boEmailGroupRequired => 'Введите название группы';

  @override
  String get boEmailServersEmptyManage =>
      'Почтовых серверов пока нет. Добавьте один, чтобы отправлять книги.';

  @override
  String get boEmailServersEmpty =>
      'Почтовых серверов пока нет. Попросите администратора добавить.';

  @override
  String get boEmailAddServer => 'Добавить почтовый сервер';

  @override
  String get boEmailNewServer => 'Новый почтовый сервер';

  @override
  String get boEmailServerPresetOther => 'Другой';

  @override
  String get boEmailServerPresetHint =>
      'Шаблон заполняет хост, порт и защиту. Их всё равно можно изменить.';

  @override
  String get boEmailServerHost => 'Хост';

  @override
  String get boEmailServerPort => 'Порт';

  @override
  String get boEmailServerSecurity => 'Защита';

  @override
  String get boEmailServerSecurityNone => 'Нет';

  @override
  String get boEmailServerSecurityHint =>
      'STARTTLS на порту 587, SSL/TLS на 465.';

  @override
  String get boEmailServerNeedsPassword => 'Вход по паролю';

  @override
  String get boEmailServerUsername => 'Имя пользователя';

  @override
  String get boEmailServerPassword => 'Пароль';

  @override
  String get boEmailServerAppPassword => 'Пароль приложения';

  @override
  String get boEmailServerPasswordKeep => 'Сохранён. Введите, чтобы заменить';

  @override
  String get boEmailServerAppPasswordHint =>
      'Для Gmail и iCloud нужен пароль приложения, а не пароль учётной записи.';

  @override
  String get boEmailServerFromName => 'Имя отправителя';

  @override
  String get boEmailServerFromAddress => 'Адрес отправителя';

  @override
  String get boEmailServerFromAddressHint =>
      'Владельцам Kindle нужно разрешить этот адрес.';

  @override
  String get boEmailServerShare => 'Открыть для всех';

  @override
  String get boEmailServerShareHint =>
      'Другие смогут отправлять книги через этот сервер, не видя пароль.';

  @override
  String get boEmailServerSystem =>
      'Отправлять сброс паролей и ссылки для входа';

  @override
  String get boEmailServerSystemHint =>
      'Сервер, который BookOrbit использует для собственной почты.';

  @override
  String get boEmailServerVerifyTls => 'Проверять сертификат сервера';

  @override
  String get boEmailServerVerifyTlsHint =>
      'Отключайте, только если сервер в вашей сети использует самоподписанный сертификат.';

  @override
  String get boEmailServerTest => 'Проверить подключение';

  @override
  String get boEmailServerTestSaveFirst => 'Сначала сохраните, затем проверьте';

  @override
  String get boEmailServerTestOk => 'Подключено';

  @override
  String boEmailServerTestFailed(String error) {
    return 'Не удаётся подключиться: $error';
  }

  @override
  String get boEmailServerDelete => 'Удалить почтовый сервер';

  @override
  String get boEmailServerDeleteBody =>
      'Все, кому он открыт, потеряют к нему доступ.';

  @override
  String get boEmailServerSystemFirst =>
      'Прежде чем удалять, отключите на этом сервере сброс паролей.';

  @override
  String get boEmailServerRequired => 'Введите название и хост';

  @override
  String get boEmailServerNotYours =>
      'Этот сервер добавил другой пользователь. Изменить его может только он.';

  @override
  String get boEmailTemplatesEmpty => 'Шаблонов пока нет.';

  @override
  String get boEmailNewTemplate => 'Новый шаблон';

  @override
  String get boEmailTemplateSubject => 'Тема';

  @override
  String get boEmailTemplateMessage => 'Сообщение';

  @override
  String get boEmailTemplateInsert => 'Вставить';

  @override
  String get boEmailTemplateInsertHint =>
      'Вставляется там, где стоит курсор. Если у книги нет какого-то сведения, ничего не выводится.';

  @override
  String get boEmailVarBook => 'Книга';

  @override
  String get boEmailVarFile => 'Файл';

  @override
  String get boEmailVarOther => 'Другое';

  @override
  String get boEmailTemplatePreview => 'Предпросмотр';

  @override
  String get boEmailTemplatePreviewNone =>
      'Отправьте книгу хотя бы раз, чтобы увидеть предпросмотр шаблона.';

  @override
  String boEmailTemplateAttached(String name) {
    return 'Вложение: $name';
  }

  @override
  String get boEmailTemplateBuiltIn =>
      'Встроенный. Изменить его может только администратор.';

  @override
  String get boEmailTemplateKindleNote =>
      'Kindle не показывает шаблон. Он всегда получает тему \"convert\".';

  @override
  String get boEmailTemplateDelete => 'Удалить шаблон';

  @override
  String get boEmailTemplateDeleteBody =>
      'Устройства, которые его используют, вернутся к вашему основному шаблону.';

  @override
  String get boEmailTemplateRequired => 'Введите название и тему';

  @override
  String get boEmailHistoryEmpty => 'Пока ничего не отправлено.';

  @override
  String get boEmailHistoryAll => 'Все';

  @override
  String get boEmailHistoryEveryone => 'Все пользователи';

  @override
  String get boEmailStatusSent => 'Отправлено';

  @override
  String get boEmailStatusSending => 'Отправка';

  @override
  String boEmailStatusRetrying(int attempt) {
    return 'Повтор ($attempt)';
  }

  @override
  String get boEmailStatusFailed => 'Ошибка';

  @override
  String boEmailTo(String name) {
    return 'Кому: $name';
  }

  @override
  String get boEmailResend => 'Отправить снова';

  @override
  String get boEmailResent => 'Отправляется снова';

  @override
  String get boEmailForget => 'Убрать из истории';

  @override
  String get boEmailLoadMore => 'Загрузить ещё';

  @override
  String get boEmailUnknownBook => 'Удалённая книга';

  @override
  String get boEmailSendNoServer =>
      'На этом сервере ещё не настроен почтовый сервер.';

  @override
  String get boEmailSendAskAdmin => 'Попросите администратора добавить его.';

  @override
  String get boEmailSendNoDevices =>
      'Добавьте устройство, на которое отправлять эту книгу.';

  @override
  String get boEmailSendOptions => 'Параметры';

  @override
  String get boEmailSendFormatEach => 'Свой у каждого устройства';

  @override
  String get boEmailSendServer => 'Почтовый сервер';

  @override
  String get boEmailSendButton => 'Отправить';

  @override
  String boEmailSendGets(String format, String size) {
    return 'Получит $format · $size';
  }

  @override
  String boEmailSendMissing(String format, String got) {
    return 'Нет $format, получит $got';
  }

  @override
  String boEmailSendKindleRejects(String format) {
    return 'Kindle не принимает $format по почте';
  }

  @override
  String boEmailSendOverKindle(String size) {
    return '$size, больше лимита Kindle в 50 МБ';
  }

  @override
  String boEmailSendOverGmail(String size) {
    return '$size, больше лимита Gmail в 25 МБ';
  }

  @override
  String boEmailSendNarrated(String size) {
    return 'Получит копию с озвучкой · $size';
  }

  @override
  String boEmailSendHanding(String server) {
    return 'Отправка через $server';
  }

  @override
  String boEmailSendAccepted(String server) {
    return 'Отправлено через $server';
  }

  @override
  String boEmailSendFailedLine(String error) {
    return 'Не отправлено: $error';
  }

  @override
  String get boEmailSendStillGoing =>
      'Всё ещё отправляется. Когда закончится, придёт уведомление.';

  @override
  String get boEmailKindleOriginal =>
      'Kindle не принимает копию с озвучкой. Выберите «Только текст».';

  @override
  String get boEmailNoCopy => 'Не удалось сделать копию без озвучки.';

  @override
  String get boForgotLink => 'Forgot password?';

  @override
  String get boForgotTitle => 'Reset your password';

  @override
  String get boForgotBody =>
      'Enter the email on your account and the server will send you a link to choose a new password.';

  @override
  String get boForgotSend => 'Send link';

  @override
  String get boForgotSent =>
      'If that email is on an account, a link is on its way. Open it to choose a new password, then sign in here.';

  @override
  String get boForgotNotSetUp =>
      'This server isn\'t set up to send email. Ask whoever runs it for a password link.';

  @override
  String get boForgotTooMany => 'Too many tries. Wait a while and try again.';

  @override
  String get boActivityTitle => 'Reading activity';

  @override
  String get boActivityPrivate => 'Keeps their reading activity private';

  @override
  String get boActivitySharesSummary =>
      'Shares a summary. They can see when you view it.';

  @override
  String get boActivitySharesDetails =>
      'Shares details, including books. They can see when you view it.';

  @override
  String get boActivityNotice => 'This person can see that you viewed this.';

  @override
  String get boActivityNowPrivate =>
      'This person isn\'t sharing their reading activity anymore.';

  @override
  String get boActivityLoadFailed => 'Couldn\'t load reading activity.';

  @override
  String get boActivityEmpty => 'No reading in this period';

  @override
  String get boActivityReadingTime => 'Reading time';

  @override
  String get boActivitySessions => 'Sessions';

  @override
  String get boActivityActiveDays => 'Active days';

  @override
  String get boActivityStarted => 'Books started';

  @override
  String get boActivityFinished => 'Books finished';

  @override
  String get boActivityTrend => 'Daily reading';

  @override
  String get boActivitySources => 'Read on';

  @override
  String get boActivityFormats => 'Formats';

  @override
  String get boActivityGenres => 'Genres';

  @override
  String get boActivityTopBooks => 'Most read';

  @override
  String get boActivityRecentBooks => 'Recently read';

  @override
  String get boActivityTopAuthors => 'Top authors';

  @override
  String get boActivityTopGenres => 'Top genres';

  @override
  String get boActivityTopSeries => 'Top series';

  @override
  String get boActivityTopNarrators => 'Top narrators';

  @override
  String get boActivityUntitled => 'Untitled book';

  @override
  String get boActivitySourceWeb => 'Web reader';

  @override
  String get boActivitySourceIos => 'iOS app';

  @override
  String get boActivitySourceWatch => 'Apple Watch';

  @override
  String get boActivitySourceAndroid => 'Android app';

  @override
  String get boActivitySourceManual => 'Manual';

  @override
  String get boActivitySourceUnknown => 'Unknown';

  @override
  String get boActivityGenreSciFi => 'Science fiction';

  @override
  String get boActivityGenreFantasy => 'Fantasy';

  @override
  String get boActivityGenreMystery => 'Mystery and thriller';

  @override
  String get boActivityGenreRomance => 'Romance';

  @override
  String get boActivityGenreHorror => 'Horror';

  @override
  String get boActivityGenreHistory => 'History and biography';

  @override
  String get boActivityGenreScience => 'Science and technology';

  @override
  String get boActivityGenreBusiness => 'Business and economics';

  @override
  String get boActivityGenreSelf => 'Self-development';

  @override
  String get boActivityGenreSociety => 'Society and culture';

  @override
  String get boActivityGenreChildren => 'Children and young adult';

  @override
  String get boActivityGenreComics => 'Comics and graphic novels';

  @override
  String get boActivityGenrePoetry => 'Poetry';

  @override
  String get boActivityGenreOther => 'Other';

  @override
  String boActivityDays(int count) {
    return '$count days';
  }

  @override
  String boActivityMinutes(int count) {
    return '$count min';
  }

  @override
  String boActivityHours(double count) {
    return '$count h';
  }

  @override
  String get recentSearchesTitle => 'Недавние запросы';

  @override
  String get recentSearchesClear => 'Очистить';

  @override
  String get recentSearchesRemove => 'Убрать';

  @override
  String get removedSeriesTapToUndo =>
      'Убрано из «Продолжить серию». Нажмите, чтобы отменить.';

  @override
  String get seriesBackOnContinueSeries => 'Снова в «Продолжить серию»';

  @override
  String get desktopShortcutPlayPause => 'Пуск / пауза';

  @override
  String get desktopShortcutRewind => 'Перемотка назад';

  @override
  String get desktopShortcutForward => 'Перемотка вперёд';

  @override
  String get desktopShortcutSlower => 'Уменьшить скорость воспроизведения';

  @override
  String get desktopShortcutFaster => 'Увеличить скорость воспроизведения';

  @override
  String get desktopShortcutNormalSpeed => 'Сбросить скорость воспроизведения';

  @override
  String get desktopShortcutSearch => 'Открыть поиск';

  @override
  String get desktopShortcutLibrary => 'Открыть библиотеку';

  @override
  String get desktopShortcutNowPlaying => 'Открыть «Сейчас играет»';

  @override
  String get desktopShortcutFullScreen => 'Полный экран';

  @override
  String get desktopShortcutClosePlayer => 'Закрыть полноэкранный плеер';

  @override
  String get desktopShortcutBack => 'Назад (закрыть верхнюю страницу или лист)';

  @override
  String get desktopShortcutRefresh => 'Обновить список на экране';

  @override
  String get desktopShortcutPreviousCard => 'Предыдущая карточка Absorbing';

  @override
  String get desktopShortcutNextCard => 'Следующая карточка Absorbing';

  @override
  String get desktopShortcutContextMenu => 'Открыть меню долгого нажатия';

  @override
  String get desktopShortcutMouseBack => 'Кнопка мыши «Назад»';

  @override
  String get desktopShortcutRightClick => 'Правый щелчок';

  @override
  String get desktopShortcutDragShelves =>
      'Перетащить полки и карточки в сторону';

  @override
  String get desktopShortcutMouseDrag => 'Нажать и перетащить';

  @override
  String get fileHealthAction => 'Проверить файлы';

  @override
  String get fileHealthTitle => 'Проверка файлов';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Все $count файла в порядке',
      many: 'Все $count файлов в порядке',
      few: 'Все $count файла в порядке',
      one: 'Все $count файл в порядке',
      zero: 'Ничего подозрительного',
    );
    return '$_temp0';
  }

  @override
  String fileHealthProblems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Найдено $count проблемы',
      many: 'Найдено $count проблем',
      few: 'Найдено $count проблемы',
      one: 'Найдена $count проблема',
    );
    return '$_temp0';
  }

  @override
  String get fileHealthReadOnlyNote =>
      'Проверка лишь читает то, что уже сообщает сервер. Ничего не меняется.';

  @override
  String get fileHealthLocalChecked =>
      'Скачанные файлы на этом устройстве тоже проверены.';

  @override
  String get fileHealthItemMissing => 'Папка книги отсутствует';

  @override
  String get fileHealthItemMissingInfo =>
      'Сервер больше не находит папку этой книги. Её могли переместить, переименовать или удалить, либо её диск отключён. Сканирование библиотеки на сервере может найти её снова.';

  @override
  String get fileHealthItemInvalid => 'Книга помечена как недопустимая';

  @override
  String get fileHealthItemInvalidInfo =>
      'Сервер не нашёл для этой книги пригодных аудио- или электронных файлов.';

  @override
  String get fileHealthInvalidFiles => 'Нечитаемые файлы';

  @override
  String get fileHealthInvalidFilesInfo =>
      'Сервер не смог прочитать эти файлы. Они могут быть повреждены или иметь неподдерживаемый формат, и воспроизведение может остановиться или пропустить их.';

  @override
  String get fileHealthEmptyFiles => 'Файлы без длительности';

  @override
  String get fileHealthEmptyFilesInfo =>
      'Эти файлы сообщают нулевую длительность, поэтому в них нечего воспроизводить. Часто они пустые или обрезаны.';

  @override
  String get fileHealthTrackGaps => 'Промежутки между файлами';

  @override
  String get fileHealthTrackGapsInfo =>
      'Временная шкала книги перескакивает вперёд между этими файлами, оставляя участок без звука.';

  @override
  String get fileHealthTrackOverlaps => 'Перекрывающиеся файлы';

  @override
  String get fileHealthTrackOverlapsInfo =>
      'Эти файлы перекрываются на временной шкале книги, поэтому часть одного может быть пропущена или позиция может скакнуть.';

  @override
  String get fileHealthDurationMismatch => 'Длительность не сходится';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return 'Файлы в сумме дают $actual, а в книге указано $expected. Прогресс и главы могут быть неточными. Обычно помогает повторное сканирование на сервере.';
  }

  @override
  String get fileHealthLowBitrate => 'Низкое качество звука';

  @override
  String get fileHealthLowBitrateInfo =>
      'Эти файлы закодированы с битрейтом ниже 32 kbps и могут звучать глухо.';

  @override
  String get fileHealthMixedSampleRates => 'Разные частоты дискретизации';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      'Файлы записаны с разной частотой дискретизации. Большинство плееров справляются, но некоторые могут щёлкать или менять скорость на стыке файлов.';

  @override
  String get fileHealthMixedChannels => 'Смесь моно и стерео';

  @override
  String get fileHealthMixedChannelsInfo =>
      'У некоторых файлов число каналов отличается от других, поэтому звук может меняться между файлами.';

  @override
  String get fileHealthChaptersPastEnd => 'Главы за концом записи';

  @override
  String get fileHealthChaptersPastEndInfo =>
      'Эти главы начинаются или заканчиваются после конца аудио, поэтому переход к ним может ни к чему не привести.';

  @override
  String get fileHealthLocalMissing => 'Скачанные файлы отсутствуют';

  @override
  String get fileHealthLocalMissingInfo =>
      'Этих скачанных файлов нет на устройстве. Воспроизведение без интернета не сработает там, где они должны быть.';

  @override
  String get fileHealthLocalSizeMismatch => 'Скачанные файлы отличаются';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      'Размер этих скачанных файлов не совпадает с копиями на сервере, поэтому они могут быть неполными или повреждёнными.';

  @override
  String fileHealthStartsAt(String time) {
    return 'начало: $time';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return '$local здесь, $server на сервере';
  }

  @override
  String fileHealthSampleRate(String value) {
    return '$value kHz';
  }

  @override
  String get fileHealthMono => 'Моно';

  @override
  String get fileHealthStereo => 'Стерео';

  @override
  String get fileHealthRedownload => 'Скачать эту книгу заново';

  @override
  String get fileHealthRedownloadQuestion => 'Скачать эту книгу заново?';

  @override
  String get fileHealthRedownloadInfo =>
      'Копия на этом устройстве будет удалена и скачана с сервера снова. Если книга играет, воспроизведение остановится. На сервере ничего не изменится.';

  @override
  String get fileHealthNotAvailableOffline =>
      'Подключитесь к серверу, чтобы скачать заново';

  @override
  String get playerReconnecting => 'Соединение потеряно, переподключение…';

  @override
  String get playerReconnectFailed =>
      'Не удалось переподключиться к серверу, воспроизведение остановлено.';

  @override
  String get downloadsFailed => 'Неудачные загрузки';

  @override
  String get absorbingReorderQueue => 'Изменить порядок очереди';

  @override
  String get playAction => 'Воспроизвести';

  @override
  String get pauseAction => 'Пауза';

  @override
  String get rmabImportBooks => 'Импорт книг';

  @override
  String get rmabImportBooksSubtitle =>
      'Поиск в ReadMeABook и выбор книг для запроса';

  @override
  String get rmabImportBooksConnectSubtitle =>
      'Сначала подключите ReadMeABook по URL и токену';

  @override
  String get windowsSettingsTitle => 'Настройки Windows';

  @override
  String get updateCheckFrequency => 'Автоматическая проверка обновлений';

  @override
  String get updateCheckFrequencySubtitle =>
      'Только проверка обновлений; установка всегда вручную.';

  @override
  String get updateCheckOnStartup => 'При запуске (раз в 12 часов)';

  @override
  String get updateCheckEverySixHours => 'Каждые 6 часов';

  @override
  String get updateCheckEveryTwelveHours => 'Каждые 12 часов';

  @override
  String get updateCheckDaily => 'Ежедневно';

  @override
  String get updateCheckNever => 'Не проверять автоматически';

  @override
  String onLatestVersionDetail(String version) {
    return 'У вас последняя версия ($version)';
  }

  @override
  String get updateCheckFailed =>
      'Не удалось подключиться к GitHub для проверки обновлений. Проверьте соединение и повторите.';

  @override
  String get playlistDetailAddBooks => 'Добавить книги в плейлист';

  @override
  String get playlistDetailSwitchToList => 'Переключить на список';

  @override
  String get playlistDetailSwitchToGrid => 'Переключить на сетку';

  @override
  String get adminUploadIndexing =>
      'Загрузка завершена; ожидание индексации в Audiobookshelf...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return '«$title» загружена; Audiobookshelf всё ещё индексирует её';
  }

  @override
  String get adminUploadPermissionDenied =>
      'У вашей учётной записи Audiobookshelf нет права загрузки. Попросите администратора сервера включить вам доступ к загрузке.';

  @override
  String get uiThemeLabel => 'Тема интерфейса';

  @override
  String get uiThemePickerTitle => 'Выберите оформление';

  @override
  String get uiThemePickerIntro =>
      'Это можно изменить в любое время: Настройки > Внешний вид > Тема интерфейса.';

  @override
  String get uiThemePlusName => 'Стандартная';

  @override
  String get uiThemePlusDescription =>
      'Обычный вид Absorb Plus: сплошные панели и мягкое свечение цветов обложки.';

  @override
  String get uiThemeMidnightName => 'Полночь';

  @override
  String get uiThemeMidnightDescription =>
      'Чисто чёрный фон с тонкими контурами и без свечения, для экранов OLED.';

  @override
  String get uiThemeContinue => 'Продолжить';

  @override
  String get uiThemeFrostedName => 'Матовое стекло';

  @override
  String get uiThemeFrostedDescription =>
      'Мягкие панели из матового стекла, сквозь которые светятся цвета обложки.';

  @override
  String get uiThemeColorTitle => 'Выберите цвет';

  @override
  String get uiThemeColorIntro =>
      'Это та же настройка, что и Настройки > Внешний вид > Источник цвета.';

  @override
  String get uiThemeColorFromCover => 'Из обложки';

  @override
  String get uiThemeBack => 'Назад';

  @override
  String get uiThemeTryIt => 'Попробовать';

  @override
  String uiThemePreviewing(String name) {
    return 'Просмотр: $name';
  }

  @override
  String get uiThemeKeep => 'Оставить';

  @override
  String get uiThemeGoBack => 'Вернуться';

  @override
  String get uiThemeGlass => 'Стекло';

  @override
  String get uiThemeGlassLight => 'Слабое';

  @override
  String get uiThemeGlassMedium => 'Среднее';

  @override
  String get uiThemeGlassStrong => 'Сильное';

  @override
  String get uiThemeDetails => 'Детали оформления';

  @override
  String get uiThemeFullCovers => 'Обложки в полном качестве';

  @override
  String get uiThemeFullCoversSubtitle =>
      'Более чёткие обложки, занимают больше памяти';

  @override
  String get uiThemeExtraBadges => 'Дополнительные значки на обложках';

  @override
  String get uiThemeExtraBadgesSubtitle =>
      'Значок электронной книги и полоса «скачано» в «Продолжить прослушивание»';

  @override
  String get uiThemeReadingShelf => '«Продолжить чтение» в виде полки';

  @override
  String get uiThemeReadingShelfSubtitle =>
      'Обычная полка на главной вместо больших карточек';

  @override
  String get uiThemeCompactHeader => 'Компактные кнопки в заголовке';

  @override
  String get uiThemeCompactHeaderSubtitle =>
      'Кнопки в заголовке страниц остаются маленькими';

  @override
  String get uiThemePlainWording => 'Простые названия';

  @override
  String get uiThemePlainWordingOnSubtitle =>
      'Используются «Воспроизвести», «Сейчас играет», «Прослушано»';

  @override
  String get uiThemePlainWordingOffSubtitle =>
      'Используются «Absorb», «Absorbing», «Fully Absorbed»';

  @override
  String get uiThemeSearchClassic => 'Классический';

  @override
  String whatsNewSheetTitle(String name) {
    return 'Что нового в $name';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return 'Обновлено с $name';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return 'сборка $number';
  }

  @override
  String get whatsNewFullNotes => 'Полные заметки на GitHub';

  @override
  String get whatsNewLoading => 'Загрузка списка изменений';

  @override
  String get whatsNewLoadFailed => 'Не удалось загрузить заметки';

  @override
  String get whatsNewLoadFailedHint =>
      'Проверьте соединение или прочитайте их на GitHub.';

  @override
  String get whatsNewOpenGitHub => 'Открыть на GitHub';

  @override
  String get settingsSeeWhatsNew => 'Что нового';

  @override
  String get settingsSeeWhatsNewSubtitle => 'Заметки о выпуске этой версии';

  @override
  String get windowsCloseToTray => 'Закрывать в трей';

  @override
  String get windowsCloseToTraySubtitle =>
      'При закрытии окна Absorb Plus продолжает работать в области уведомлений. Выход через значок в трее.';

  @override
  String get windowsStartWithWindows => 'Запускать вместе с Windows';

  @override
  String get windowsStartWithWindowsSubtitle =>
      'Открывать Absorb Plus при входе в Windows';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return 'Запускается: $command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return 'Запуск настроен для другой копии: $command. Включите, чтобы использовать эту копию.';
  }

  @override
  String get windowsStartupDisabledBySystem =>
      'Выключено в разделе «Автозагрузка» диспетчера задач. Включите там.';

  @override
  String get windowsStartMinimized => 'Запускать свёрнутым';

  @override
  String get windowsStartMinimizedSubtitle =>
      'При запуске вместе с Windows оставлять в трее (или свёрнутым, если «Закрывать в трей» выключено)';

  @override
  String get windowsAlwaysOnTop => 'Поверх всех окон';

  @override
  String get windowsAlwaysOnTopSubtitle => 'Держать окно над другими окнами';

  @override
  String get windowsKeepAwake =>
      'Не давать ПК засыпать при воспроизведении или загрузке';

  @override
  String get windowsKeepAwakeSubtitle =>
      'Не даёт ПК перейти в спящий режим. Экран всё равно может выключиться.';

  @override
  String get windowsSettingFailed => 'Windows не приняла это изменение';

  @override
  String get windowsGlobalHotkeys => 'Глобальные горячие клавиши';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Работают, пока Absorb Plus в фоне: Ctrl+Alt+Space — воспроизведение/пауза, Ctrl+Alt+Left/Right — назад/вперёд, Ctrl+Alt+Up/Down — громкость, Ctrl+Alt+B — добавить закладку';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return 'Заняты другим приложением, недоступны: $keys';
  }

  @override
  String get windowsTrayShow => 'Показать Absorb Plus';

  @override
  String get windowsTrayQuit => 'Выйти из Absorb Plus';

  @override
  String get windowsTaskbarPlay => 'Воспроизвести';

  @override
  String get windowsTaskbarPause => 'Пауза';

  @override
  String get windowsTaskbarRewind => 'Назад';

  @override
  String get windowsTaskbarForward => 'Вперёд';

  @override
  String windowsJumpListResume(String title) {
    return 'Продолжить «$title»';
  }

  @override
  String get githubProjectTitle => 'Absorb Plus на GitHub';

  @override
  String get precacheTitle => 'Предзагрузка обложек и страниц книг';

  @override
  String get precacheSubtitle =>
      'Загружает их в фоне по Wi-Fi или проводному соединению, чтобы экраны открывались мгновенно. Занимает немного места на диске, не памяти.';

  @override
  String get githubProjectSubtitle => 'Выпуски, исходный код и новости проекта';

  @override
  String get supportSaveLogsSubtitle =>
      'Сохранить файл журнала, чтобы приложить к issue на GitHub';

  @override
  String get supportSaveLogsDialogTitle => 'Сохранить журналы Absorb Plus';

  @override
  String supportLogsSaved(String path) {
    return 'Журналы сохранены в $path';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return 'Не удалось сохранить журналы: $error';
  }

  @override
  String get supportOpenLogsFolder => 'Открыть папку журналов';

  @override
  String get supportOpenLogsFolderSubtitle =>
      'Показать файл журнала в файловом менеджере';

  @override
  String get supportOpenLogsFolderFailed => 'Не удалось открыть папку журналов';

  @override
  String get desktopDownloadFolderOpen => 'Открыть в Проводнике';

  @override
  String get desktopDownloadFolderOpenLinux => 'Открыть папку';

  @override
  String get desktopDownloadFolderOpenFailed => 'Не удалось открыть папку';

  @override
  String get desktopDownloadFolderNotWritable =>
      'Absorb не может сохранять файлы в эту папку. Выберите другую.';

  @override
  String get desktopDownloadFolderPickFailed =>
      'Не удалось показать окно выбора папки';

  @override
  String get desktopDownloadFolderNetworkPath =>
      'Сетевые папки (\\\\server\\share) не подходят для загрузок. Сопоставьте общий ресурс с буквой диска в Проводнике, например Z:, и выберите её.';

  @override
  String get desktopDownloadFolderDefault => 'Папка по умолчанию';

  @override
  String get bookSettingsTitle => 'Настройки книги';

  @override
  String bookSettingsSeries(String name) {
    return 'Серия: $name';
  }

  @override
  String get bookSettingsSpeed => 'Скорость';

  @override
  String get bookSettingsSpeedFromSeries =>
      'Из последней книги этой серии, которую вы слушали';

  @override
  String get bookSettingsSkipIntro => 'Пропускать вступление';

  @override
  String get bookSettingsSkipIntroHint =>
      'Только когда книга начинается с начала';

  @override
  String get bookSettingsSkipOutro => 'Пропускать концовку';

  @override
  String get bookSettingsSkipOutroHint =>
      'Завершает книгу раньше и отмечает её прослушанной';

  @override
  String get bookSettingsSkipOff => 'Выкл';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds с';
  }

  @override
  String get bookSettingsWholeSeries => 'Применить ко всей серии';

  @override
  String get bookSettingsWholeSeriesHint =>
      'Вступление и концовка применяются ко всем книгам этой серии';

  @override
  String get bookSettingsReset => 'Сбросить';

  @override
  String get bookSettingsResetDone => 'Настройки книги сброшены';

  @override
  String get adminDashTitle => 'Панель';

  @override
  String get adminDashSubtitle =>
      'Кто слушает, библиотеки, пользователи и предупреждения сервера с первого взгляда';

  @override
  String get adminDashNobodyListening => 'Сейчас никто не слушает';

  @override
  String adminDashOnlineNames(String names) {
    return 'В сети: $names';
  }

  @override
  String get adminDashListeningHistory => 'История прослушивания';

  @override
  String get adminDashCouldNotLoad => 'Не удалось загрузить это с сервера';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента',
      many: '$count элементов',
      few: '$count элемента',
      one: '$count элемент',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => 'Сканировать все';

  @override
  String get adminDashScanAllTitle => 'Сканировать все библиотеки?';

  @override
  String get adminDashScanAllContent =>
      'Audiobookshelf будет искать новые, изменённые и отсутствующие файлы во всех библиотеках. В больших библиотеках это может занять время.';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Сканирование начато для $count библиотеки',
      many: 'Сканирование начато для $count библиотек',
      few: 'Сканирование начато для $count библиотек',
      one: 'Сканирование начато для $count библиотеки',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return 'Не удалось начать сканирование: $failed из $total';
  }

  @override
  String get adminDashNoLibraries => 'Библиотек пока нет';

  @override
  String get adminDashBackUpNow => 'Создать резервную копию';

  @override
  String adminDashLastBackup(String time) {
    return 'Последняя резервная копия: $time';
  }

  @override
  String get adminDashNoBackups => 'Резервных копий пока нет';

  @override
  String get adminDashManageUsers => 'Управление пользователями';

  @override
  String get adminDashNeverSeen => 'Ни разу не входил';

  @override
  String get adminDashDisabled => 'Отключён';

  @override
  String get adminDashLocked => 'Заблокирован';

  @override
  String get adminDashServerWarnings => 'Предупреждения сервера';

  @override
  String get adminDashNoProblems =>
      'В сегодняшнем журнале нет предупреждений и ошибок';

  @override
  String get adminDashAllLogs => 'Все журналы сервера';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale (встроенный)';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => 'Сочетания клавиш';

  @override
  String get desktopShortcutsSubtitle =>
      'Воспроизведение, скорость, поиск и навигация';

  @override
  String get desktopShortcutsClose => 'Закрыть';

  @override
  String get tailscaleConnect => 'Подключиться через Tailscale';

  @override
  String get tailscaleConnectHint => 'Открывает вход Tailscale в браузере';

  @override
  String get tailscaleTurnOff => 'Выключить';

  @override
  String get tailscaleCardPitch =>
      'Доступ к серверу в вашей tailnet без включения VPN Tailscale';

  @override
  String get tailscaleIntro =>
      'Доступ к серверу в вашей tailnet без включения VPN приложения Tailscale. Absorb подключается к tailnet как отдельное устройство и только для своих соединений. Тестовая функция, по умолчанию выключена.';

  @override
  String get tailscaleUseSwitch => 'Использовать встроенный Tailscale';

  @override
  String get tailscaleStatusOff => 'Выкл';

  @override
  String get tailscaleStatusStarting => 'Подключение…';

  @override
  String get tailscaleStatusNeedsLogin =>
      'Войдите, чтобы добавить это устройство в вашу tailnet';

  @override
  String get tailscaleStatusNeedsApproval =>
      'Ожидание подтверждения устройства администратором';

  @override
  String tailscaleStatusConnected(String user) {
    return 'Подключено как $user';
  }

  @override
  String get tailscaleStatusConnectedNoUser => 'Подключено';

  @override
  String tailscaleStatusError(String error) {
    return 'Проблема: $error';
  }

  @override
  String get tailscaleNotIncluded => 'Не включено в эту сборку';

  @override
  String get tailscaleSignIn => 'Войти через Tailscale';

  @override
  String get tailscaleSignInNoLink =>
      'Ссылки для входа пока нет. Повторите через мгновение.';

  @override
  String get tailscaleToggleFailed =>
      'Не удалось включить или выключить встроенный Tailscale. Повторите попытку.';

  @override
  String get tailscaleSignOut => 'Выйти из Tailscale';

  @override
  String tailscaleDeviceAddress(String address) {
    return 'Это устройство: $address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return 'Ваш сервер ($server) доступен через Tailscale.';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return 'Ваш сервер ($server) не имеет адреса tailnet, поэтому подключение идёт как обычно. Если он в вашей tailnet, добавьте его имя хоста ниже.';
  }

  @override
  String get tailscaleExtraHostsLabel => 'Другие имена хостов tailnet';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      'Адреса в 100.64.0.0/10 и имена, оканчивающиеся на .ts.net или на имя MagicDNS вашей tailnet, всегда идут через Tailscale. Разделяйте имена запятыми.';

  @override
  String playerChapterEndsAt(String time) {
    return 'Глава закончится в $time';
  }

  @override
  String playerEndsAt(String time) {
    return 'Закончится в $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return 'Последнее воспроизведение на $device · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return 'Последнее воспроизведение на другом устройстве · $ago';
  }

  @override
  String get opmlExportAction => 'Экспорт OPML';

  @override
  String get opmlExportDialogTitle => 'Сохранить ленты подкастов как OPML';

  @override
  String opmlExportSaved(String path) {
    return 'OPML сохранён в $path';
  }

  @override
  String get opmlExportDownloaded => 'OPML скачан';

  @override
  String get opmlExportFailed => 'Не удалось экспортировать файл OPML';

  @override
  String get bookCopySaveAction => 'Сохранить копию…';

  @override
  String get bookCopyDialogTitle => 'Сохранить копию этой книги';

  @override
  String get bookCopySaving => 'Сохранение копии…';

  @override
  String bookCopySaved(String path) {
    return 'Копия сохранена в $path';
  }

  @override
  String get bookCopyFailed => 'Не удалось сохранить копию этой книги';

  @override
  String get exclusiveAudioTitle => 'Монопольный звук';

  @override
  String get exclusiveAudioSubtitle =>
      'Устраняет треск и скачки громкости, обходя звуковые эффекты Windows. Остальные приложения заглушаются, пока играет Absorb. Перезапустите Absorb, чтобы применить.';

  @override
  String get exclusiveAudioFallback =>
      'Звуковое устройство отклонило монопольный режим, поэтому Absorb играет в обычном режиме';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return 'Новых: $count';
  }

  @override
  String seekUndoBackTo(String time) {
    return 'Вернуться к $time';
  }

  @override
  String get goToTime => 'Перейти ко времени';

  @override
  String get goToTimeLabel => 'Время';

  @override
  String get goToTimeHint => 'ч:мм:сс, мм:сс или минуты';

  @override
  String get goToTimeGo => 'Перейти';

  @override
  String goToTimeLength(String time) {
    return 'Длительность $time';
  }

  @override
  String get goToTimeInvalid => 'Введите время, например 1:23:45, 23:45 или 90';

  @override
  String goToTimePastEnd(String time) {
    return 'Это после конца ($time)';
  }

  @override
  String get desktopShortcutGoToTime => 'Перейти ко времени в открытом плеере';

  @override
  String fellAsleepJumpBack(String time) {
    return 'Вы уснули около $time · Вернуться';
  }

  @override
  String get surpriseMe => 'Удиви меня';

  @override
  String get surpriseMeNoneLeft => 'Вы прослушали все книги в этой библиотеке';

  @override
  String get surpriseMeFailed =>
      'Не удалось выбрать книгу. Попробуйте ещё раз.';

  @override
  String get surpriseMeOffline =>
      'Для «Удиви меня» нужно подключение к серверу';

  @override
  String get surpriseMeBooksOnly =>
      '«Удиви меня» выбирает книги. Перейдите в библиотеку книг.';

  @override
  String get autoDownloadNextInSeries =>
      'Автоматически скачивать следующую книгу серии';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      'Когда текущая книга прослушана на 80% или осталось меньше часа. Учитывает настройку «Только по Wi-Fi».';

  @override
  String get emptyStateBrowseLibrary => 'Открыть библиотеку';

  @override
  String get emptyStateClearSearch => 'Очистить поиск';

  @override
  String get statsNoListeningYet => 'Прослушиваний пока нет';

  @override
  String get desktopShortcutQuickSwitcher =>
      'Быстрый переход: найти книги или перейти куда угодно';

  @override
  String get desktopShortcutHelp => 'Показать сочетания клавиш';

  @override
  String get quickSwitcherTooltip => 'Быстрый переход (Ctrl+K)';

  @override
  String get quickSwitcherHint => 'Искать в этой библиотеке или ввести команду';

  @override
  String get quickSwitcherNoResults => 'Нет совпадений';

  @override
  String get quickSwitcherGoHome => 'Перейти на главную';

  @override
  String get quickSwitcherGoLibrary => 'Перейти в библиотеку';

  @override
  String get quickSwitcherGoAbsorbing => 'Перейти в Absorbing';

  @override
  String get quickSwitcherGoStats => 'Перейти к статистике';

  @override
  String get quickSwitcherGoSettings => 'Перейти в настройки';

  @override
  String get quickSwitcherGoDownloads => 'Перейти к загрузкам';

  @override
  String get quickSwitcherPlayPause => 'Воспроизведение / пауза';

  @override
  String get quickSwitcherSleepTimer => 'Таймер сна';

  @override
  String get quickSwitcherKeywordsAbsorbing =>
      'сейчас играет плеер воспроизведение now playing player';

  @override
  String get quickSwitcherKeywordsSettings =>
      'настройки параметры опции preferences options';

  @override
  String get quickSwitcherKeywordsDownloads =>
      'загрузки скачанные без сети offline';

  @override
  String get quickSwitcherKeywordsPlayPause =>
      'продолжить пауза играть воспроизведение resume pause';

  @override
  String get quickSwitcherKeywordsSleepTimer => 'таймер сон засыпание timer';

  @override
  String get quickSwitcherKeywordsShortcuts =>
      'горячие клавиши сочетания справка keys help hotkeys keyboard';

  @override
  String get quickSwitcherKindAction => 'Действие';

  @override
  String get quickSwitcherKindBook => 'Книга';

  @override
  String get quickSwitcherKindPodcast => 'Подкаст';

  @override
  String get quickSwitcherKindSeries => 'Серия';

  @override
  String get quickSwitcherKindAuthor => 'Автор';

  @override
  String get alphabetScrollerLabel => 'Перейти к букве';

  @override
  String get stepperDecrease => 'Уменьшить';

  @override
  String get stepperIncrease => 'Увеличить';

  @override
  String get statsStreakKeepGoing =>
      'Послушайте сегодня 5 минут, чтобы продолжить серию';

  @override
  String get statsStreakHowTo =>
      'Слушайте по 5 минут в день, чтобы набрать серию';

  @override
  String get statsDailyGoalSheetTitle => 'Ежедневная цель прослушивания';

  @override
  String get statsDailyGoalSheetBody =>
      'Кольцо на карточке серии заполняется по мере вашего прослушивания сегодня.';

  @override
  String get statsDailyGoalSet => 'Задать ежедневную цель';

  @override
  String get statsMonthListened => 'Слушали';

  @override
  String get statsMonthTime => 'Время';

  @override
  String get statsMonthTopBook => 'Лучшая книга';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count результата',
      many: '$count результатов',
      few: '$count результата',
      one: '$count результат',
      zero: 'Нет результатов',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => 'Сортировка и группировка';

  @override
  String get bookmarksViewByBook => 'По книгам';

  @override
  String get bookmarksViewNewest => 'Сначала новые';

  @override
  String get bookmarksViewPosition => 'По позиции';

  @override
  String get bookmarksExportAction => 'Экспорт закладок';

  @override
  String get bookmarksExportDialogTitle => 'Сохранить закладки как Markdown';

  @override
  String bookmarksExportSaved(String path) {
    return 'Закладки сохранены в $path';
  }

  @override
  String get bookmarksExportDownloaded => 'Закладки скачаны';

  @override
  String get bookmarksExportFailed => 'Не удалось экспортировать закладки';

  @override
  String get chapterSearchHint => 'Поиск глав или время (1:23:00)';

  @override
  String get chapterSearchNoResults => 'Глав не найдено';

  @override
  String get dropUploadNotAllowed =>
      'Ваша учётная запись не может загружать на этот сервер';

  @override
  String get dropUploadNothingUsable =>
      'Ни один из перетащенных файлов нельзя загрузить';

  @override
  String get dropUploadAlreadyOpen =>
      'Сначала завершите или закройте открытую загрузку';

  @override
  String get remoteHostTitle => 'Управление с телефона';

  @override
  String get remoteHostSubtitleOff =>
      'Используйте телефон как пульт для Absorb на этом ПК';

  @override
  String remoteHostSubtitleOn(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'подключено $count телефона',
      many: 'подключено $count телефонов',
      few: 'подключено $count телефона',
      one: 'подключён $count телефон',
      zero: 'телефоны не подключены',
    );
    return 'Вкл. · $_temp0';
  }

  @override
  String get remoteHostSheetBody =>
      'Используйте телефон как пульт для этого ПК. Звук продолжает играть на ПК, а телефон показывает, что играет, и даёт кнопки управления. Телефон и ПК должны быть в одной сети Wi-Fi.';

  @override
  String get remoteHostSwitch => 'Включить';

  @override
  String get remoteHostSwitchSubtitle =>
      'При первом запуске Windows может спросить, пропускать ли Absorb Plus через брандмауэр. Разрешите.';

  @override
  String get remoteHostKeepOn => 'Оставлять включённым при запуске Absorb';

  @override
  String get remoteHostKeepOnSubtitle =>
      'Если выключено, функция отключается каждый раз при закрытии Absorb.';

  @override
  String remoteHostPortsBusy(int first, int last) {
    return 'Не удалось запустить: все порты с $first по $last заняты.';
  }

  @override
  String get remoteHostPairTitle => 'Связать телефон';

  @override
  String get remoteHostStep1 => '1. Включите функцию здесь.';

  @override
  String get remoteHostStep2 =>
      '2. Отсканируйте код камерой телефона или откройте Absorb на телефоне и перейдите в Настройки > Управление компьютером.';

  @override
  String get remoteHostStep3 =>
      '3. Введите код на телефоне, затем нажмите «Разрешить» здесь.';

  @override
  String get remoteHostCodeLabel => 'Код';

  @override
  String remoteHostCodeExpires(String time) {
    return 'Действует $time';
  }

  @override
  String get remoteHostPairFirst => 'Связать телефон';

  @override
  String get remoteHostPairAnother => 'Связать другое устройство';

  @override
  String get remoteHostPairingClosed =>
      'Связывание закрыто. Нажмите кнопку, чтобы получить новый код; он действует 2 минуты и для одного устройства.';

  @override
  String get remoteHostFull =>
      'Связано 5 устройств, это максимум. Забудьте одно, чтобы связать другое.';

  @override
  String remoteHostAddresses(String addresses) {
    return 'Адрес этого ПК: $addresses';
  }

  @override
  String get remoteHostNoAddress => 'У этого ПК сейчас нет сетевого адреса.';

  @override
  String get remoteHostNoDiscovery =>
      'Телефон может не найти этот ПК сам; введите адрес ПК на телефоне вручную.';

  @override
  String get remoteHostConnectedTitle => 'Подключено сейчас';

  @override
  String get remoteHostPairedTitle => 'Связанные устройства';

  @override
  String get remoteHostNoDevices => 'Связанных устройств пока нет';

  @override
  String get remoteHostUnusedNote =>
      'Устройство, которым не пользовались 90 дней, забывается.';

  @override
  String remoteHostLastUsed(String date) {
    return 'Последнее использование: $date';
  }

  @override
  String remoteHostConnectedFrom(String address, String time) {
    return '$address, подключено с $time';
  }

  @override
  String get remoteHostForget => 'Забыть';

  @override
  String get remoteHostForgetAll => 'Забыть все';

  @override
  String get remoteHostForgetAllConfirm =>
      'Забыть все связанные устройства? Каждому придётся снова связываться, чтобы управлять этим ПК.';

  @override
  String get remoteHostDisconnect => 'Отключить';

  @override
  String remoteHostAllowTitle(String name) {
    return 'Разрешить ‘$name’ управлять Absorb на этом ПК?';
  }

  @override
  String get remoteHostAllowBody =>
      'Разрешайте только знакомое устройство. Оно сможет запускать, ставить на паузу и менять то, что играет здесь. Нет ответа - значит отказ.';

  @override
  String get remoteHostAllow => 'Разрешить';

  @override
  String get remoteHostDeny => 'Отклонить';

  @override
  String get remoteControlAnother => 'Управление компьютером';

  @override
  String get remoteControlAnotherSubtitle =>
      'Используйте этот телефон как пульт для Absorb на ПК';

  @override
  String get remoteConnectIntro =>
      'Используйте этот телефон как пульт для Absorb на ПК. Звук продолжает играть на ПК. Телефон и ПК должны быть в одной сети Wi-Fi. На ПК откройте Настройки > Управление с телефона и включите функцию.';

  @override
  String get remoteConnectSearching => 'Поиск компьютеров в вашей сети Wi-Fi…';

  @override
  String get remoteConnectNoneFound =>
      'Компьютеры не найдены. На ПК откройте Настройки > Управление с телефона и включите функцию или введите его адрес.';

  @override
  String get remoteConnectSearchAgain => 'Искать снова';

  @override
  String get remoteConnectPaired => 'Связан';

  @override
  String get remoteConnectFound => 'В вашей сети Wi-Fi';

  @override
  String get remoteConnectEnterAddress => 'Ввести адрес';

  @override
  String get remoteConnectAddressHint => '192.168.1.20:47390';

  @override
  String get remoteConnectAddressInvalid =>
      'Введите адрес вида 192.168.1.20 или 192.168.1.20:47390';

  @override
  String get remoteConnectNext => 'Далее';

  @override
  String remoteConnectCodeTitle(String name) {
    return 'Связь с $name';
  }

  @override
  String get remoteConnectCodeHelp =>
      'Введите 6-значный код, показанный на ПК в разделе «Управление с телефона».';

  @override
  String get remoteConnectWaiting => 'Теперь нажмите «Разрешить» на ПК…';

  @override
  String get remoteConnectPair => 'Связать';

  @override
  String get remoteConnectForget => 'Забыть этот компьютер';

  @override
  String get remotePairBadCode =>
      'Неверный код. Проверьте ПК и попробуйте ещё раз.';

  @override
  String get remotePairExpired =>
      'Код истёк. Получите новый на ПК через «Связать другое устройство».';

  @override
  String get remotePairClosed =>
      'Связывание на ПК не открыто. На ПК нажмите «Связать другое устройство», чтобы получить новый код.';

  @override
  String get remotePairDenied =>
      'ПК не разрешил этому телефону подключиться. Попробуйте снова и нажмите «Разрешить» на ПК.';

  @override
  String get remotePairTooManyDevices =>
      'У этого ПК уже 5 связанных устройств. Сначала забудьте одно на ПК.';

  @override
  String get remotePairTooMany =>
      'Слишком много попыток. Подождите минуту и повторите.';

  @override
  String get remotePairUnreachable =>
      'Телефон и ПК не в одной сети Wi-Fi, или на ПК функция не включена. Проверьте оба и повторите.';

  @override
  String get remotePairFailed => 'Связать не удалось. Попробуйте ещё раз.';

  @override
  String get remoteVersionMismatch =>
      'Чтобы использовать пульт, обновите Absorb Plus на обоих устройствах.';

  @override
  String get remoteConnecting => 'Подключение…';

  @override
  String get remoteReconnecting => 'Повторное подключение…';

  @override
  String get remoteUnreachableHint =>
      'Нет связи с ПК. Убедитесь, что он не спит, Absorb открыт и оба устройства в одной сети Wi-Fi.';

  @override
  String remoteNothingPlaying(String name) {
    return 'На $name ничего не играет';
  }

  @override
  String get remoteNothingLoaded => 'Сначала запустите что-нибудь на ПК.';

  @override
  String get remoteCommandFailed => 'ПК не смог это выполнить.';

  @override
  String get remoteNotOnList => 'Этой книги больше нет в списке на ПК.';

  @override
  String get remoteDisconnectedByHost => 'ПК отключил это устройство.';

  @override
  String get remoteUnauthorized =>
      'ПК больше не знает это устройство. Свяжите его снова.';

  @override
  String get remotePairAgain => 'Связать снова';

  @override
  String get remoteConnectAgain => 'Подключиться снова';

  @override
  String get remotePlay => 'Играть';

  @override
  String get remotePause => 'Пауза';

  @override
  String get remoteStop => 'Стоп';

  @override
  String get remotePreviousChapter => 'Предыдущая глава';

  @override
  String get remoteNextChapter => 'Следующая глава';

  @override
  String remoteSkipBack(int seconds) {
    return 'Назад на $seconds с';
  }

  @override
  String remoteSkipForward(int seconds) {
    return 'Вперёд на $seconds с';
  }

  @override
  String get remoteSpeed => 'Скорость';

  @override
  String get remoteSpeedSlower => 'Медленнее';

  @override
  String get remoteSpeedFaster => 'Быстрее';

  @override
  String get remoteSleepTimer => 'Таймер сна';

  @override
  String remoteSleepMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String get remoteSleepEndOfChapter => 'Конец главы';

  @override
  String get remoteSleepEndOfEpisode => 'Конец серии';

  @override
  String remoteSleepChapters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count главы',
      many: '$count глав',
      few: '$count главы',
      one: '$count глава',
    );
    return '$_temp0';
  }

  @override
  String get remoteSleepCancel => 'Выключить таймер сна';

  @override
  String get remoteVolume => 'Громкость';

  @override
  String get remoteMute => 'Выключить звук';

  @override
  String get remoteUnmute => 'Включить звук';

  @override
  String get remoteChapters => 'Главы';

  @override
  String get remoteBookmark => 'Закладка';

  @override
  String get remoteBookmarkTitle => 'Добавить закладку здесь';

  @override
  String get remoteBookmarkNoteHint => 'Заметка (необязательно)';

  @override
  String get remoteBookmarkAdd => 'Добавить';

  @override
  String get remoteBookmarkAdded => 'Закладка добавлена на ПК';

  @override
  String get remoteContinueListening => 'Продолжить прослушивание';

  @override
  String get remoteContinueEmpty => 'На ПК нет книг в процессе.';

  @override
  String remoteTimeLeft(String time) {
    return 'Осталось $time';
  }

  @override
  String remoteChapterTimeLeft(String time) {
    return 'До конца главы $time';
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
  String get remoteCustomize => 'Настроить';

  @override
  String get remoteCustomizeTitle => 'Настройка пульта';

  @override
  String get remoteCustomizeHintPortrait =>
      'Редактируется вертикальная раскладка. Перетащите блок за ручку или удерживайте его, чтобы переместить. Поверните телефон, чтобы править горизонтальную.';

  @override
  String get remoteCustomizeHintLandscape =>
      'Редактируется горизонтальная раскладка. Перетаскивайте блоки внутри колонки или между двумя колонками. Поверните телефон, чтобы править вертикальную.';

  @override
  String get remoteCustomizeReset => 'Сбросить по умолчанию';

  @override
  String get remoteCustomizePresets => 'Шаблоны';

  @override
  String get remoteCustomizeAddTitle => 'Добавить на экран';

  @override
  String get remoteCustomizeDropHere => 'Перетащите блоки сюда';

  @override
  String get remoteCustomizeMove => 'Перетащите, чтобы переместить';

  @override
  String get remoteCustomizeEmpty =>
      'На экране ничего нет. Нажмите «Настроить», чтобы добавить элементы управления.';

  @override
  String get remotePresetDefault => 'Стандартный';

  @override
  String get remotePresetMinimal => 'Минимальный';

  @override
  String get remotePresetNightstand => 'Прикроватный';

  @override
  String get remotePresetFull => 'Полный';

  @override
  String get remoteBlockCover => 'Обложка';

  @override
  String get remoteBlockTitle => 'Название и автор';

  @override
  String get remoteBlockChapterTitle => 'Название главы';

  @override
  String get remoteBlockProgress => 'Полоса прогресса';

  @override
  String get remoteBlockTimeLeft => 'Осталось времени';

  @override
  String get remoteBlockTransport => 'Кнопки воспроизведения';

  @override
  String get remoteBlockClock => 'Часы';

  @override
  String get remoteBlockSpacer => 'Пространство';

  @override
  String get remoteSizeSmall => 'Малый';

  @override
  String get remoteSizeMedium => 'Средний';

  @override
  String get remoteSizeLarge => 'Большой';

  @override
  String get remoteSizeCompact => 'Компактный';

  @override
  String get remoteSizeNormal => 'Обычный';

  @override
  String get remoteDisplayBackground => 'Фон';

  @override
  String get remoteDisplayBackgroundTheme => 'Тема';

  @override
  String get remoteDisplayBackgroundCover => 'Размытая обложка';

  @override
  String get remoteDisplayBackgroundBlack => 'Чёрный';

  @override
  String get remoteDisplayTextSize => 'Размер текста';

  @override
  String get remoteDisplayTextHuge => 'Огромный';

  @override
  String get remoteDisplay24Hour => '24-часовой формат';

  @override
  String get remoteDisplayDim => 'Затемнять экран через';

  @override
  String get remoteDisplayDimNever => 'Никогда';

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
      'пульт телефон управление пк связать remote phone control pc link pair';

  @override
  String get quickSwitcherKeywordsSurprise =>
      'случайная случайный выбор перемешать random pick shuffle';

  @override
  String get developerModeOn => 'Режим разработчика включён';

  @override
  String get developerModeAlreadyOn => 'Режим разработчика уже включён';

  @override
  String get developerTitle => 'Разработчик';

  @override
  String get developerSubtitle =>
      'Тестовые сборки и инструменты для разработки';

  @override
  String get developerModeSwitch => 'Режим разработчика';

  @override
  String get developerModeSwitchSubtitle =>
      'Если выключить, эта страница скроется. Чтобы вернуть её, нажмите на версию 7 раз.';

  @override
  String get testChannelTitle => 'Тестовый канал';

  @override
  String get testChannelSubtitle => 'Установить новейшую тестовую сборку';

  @override
  String get testChannelUnavailable =>
      'Тестовые сборки есть только для версии Android с GitHub.';

  @override
  String get testChannelCodeLabel => 'Код тестового канала';

  @override
  String get testChannelUnlock => 'Открыть';

  @override
  String get testChannelUnlocked => 'Тестовый канал открыт';

  @override
  String get testChannelWrongCode => 'Неверный код';

  @override
  String get testChannelLaunchCheck => 'Проверять тестовые сборки при запуске';

  @override
  String get testChannelLaunchCheckSubtitle =>
      'При запуске приложения предлагает установить более новую тестовую сборку';

  @override
  String get testChannelWarning =>
      'Тестовые сборки не завершены и могут вызывать сбои. Они заменяют установленное приложение, данные сохраняются.';

  @override
  String testChannelInstalled(String version) {
    return 'Установлено: $version';
  }

  @override
  String testChannelNewest(String version) {
    return 'Новейшая тестовая сборка: $version';
  }

  @override
  String get testChannelNone => 'Тестовых сборок пока нет';

  @override
  String get testChannelUpToDate => 'Установлена последняя версия';

  @override
  String get testChannelInstall => 'Установить';

  @override
  String get testChannelCheckNow => 'Проверить сейчас';

  @override
  String get testChannelNotes => 'Что нового';

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
  String get testBuildAvailable => 'Доступна тестовая сборка';

  @override
  String testBuildDialogContent(String latest, String current) {
    return 'Вышла тестовая сборка $latest.\n\nУ вас $current.';
  }

  @override
  String testBuildPackageLabel(int build) {
    return 'Тестовая сборка $build';
  }

  @override
  String get githubSignIn => 'Войти через GitHub';

  @override
  String get githubSignInSubtitle =>
      'Тестовые сборки закрытые: войдите, чтобы получить их';

  @override
  String get githubSignInNotSetUp =>
      'Вход через GitHub в этой сборке ещё не настроен';

  @override
  String get githubSignInAgain => 'Войти снова';

  @override
  String get githubSignInExpired => 'Срок действия входа через GitHub истёк';

  @override
  String githubSignedInAs(String login) {
    return 'Вы вошли в GitHub как $login';
  }

  @override
  String get githubSignedIn => 'Вы вошли в GitHub';

  @override
  String get githubSignOut => 'Выйти';

  @override
  String get githubSignInEnterCode => 'Введите этот код на GitHub:';

  @override
  String get githubSignInOpen => 'Открыть github.com/login/device';

  @override
  String get githubSignInCopyCode => 'Копировать код';

  @override
  String get githubSignInCodeCopied => 'Код скопирован';

  @override
  String get githubSignInWaiting => 'Ожидание подтверждения на GitHub...';

  @override
  String get githubSignInDenied => 'Вход отменён на GitHub.';

  @override
  String get githubSignInCodeExpired =>
      'Срок действия кода истёк. Попробуйте ещё раз.';

  @override
  String get githubSignInFailed =>
      'Не удалось войти в GitHub. Попробуйте ещё раз.';

  @override
  String get githubSignInTryAgain => 'Повторить';

  @override
  String get testChannelSignInNeeded =>
      'Войдите через GitHub, чтобы получать тестовые сборки';

  @override
  String get downloadEtaUnderMinute => 'Осталось <1 мин';

  @override
  String downloadEtaMinutes(int minutes) {
    return 'Осталось $minutes мин';
  }

  @override
  String downloadEtaHours(int hours) {
    return 'Осталось $hours ч';
  }

  @override
  String downloadEtaHoursMinutes(int hours, int minutes) {
    return 'Осталось $hours ч $minutes мин';
  }

  @override
  String get sameSpeedAllBooksTitle => 'Одинаковая скорость для всех книг';

  @override
  String get sameSpeedAllBooksSubtitle =>
      'Все книги играют с одной стандартной скоростью, а изменение скорости в плеере меняет её для всех книг. Выкл.: у каждой книги (или серии) своя скорость.';

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
  String get loginDesignSteps => 'B · Two steps';

  @override
  String get loginDesignStepsGlass => 'B2 · Glass steps';

  @override
  String get loginDesignStepsDesktop => 'B3 · Desktop steps';

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
  String get quickSwitcherKeywordsLoginDesign =>
      'login sign in screen design layout preview';

  @override
  String get appBackgroundLabel => 'Background';

  @override
  String get appBackgroundGlow => 'Soft glow';

  @override
  String get appBackgroundCover => 'Book colors';

  @override
  String get appBackgroundGradient => 'Gradient';

  @override
  String get appBackgroundPlain => 'Plain';

  @override
  String get appBackgroundCoverHint =>
      'Follows the cover of the book you\'re listening to. Soft glow while nothing is playing.';
}
