// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'A B S O R B';

  @override
  String get online => '在线';

  @override
  String get offline => '离线';

  @override
  String get stillOffline => '仍处于离线状态。点击重试。';

  @override
  String get retry => '重试';

  @override
  String get listsNone => '没有合集或播放列表';

  @override
  String get listsNoneHint => '合集和播放列表在你的 Audiobookshelf 服务器上创建，并会显示在这里。';

  @override
  String get listsLoadFailed => '无法加载你的列表';

  @override
  String get listsLoadFailedHint => 'Absorb 无法连接服务器获取合集和播放列表。';

  @override
  String get listsNoneBookOrbit => '没有合集或智能范围';

  @override
  String get listsNoneHintBookOrbit => '合集和智能范围在你的 BookOrbit 服务器上创建，并会显示在这里。';

  @override
  String get listsLoadFailedHintBookOrbit => 'Absorb 无法连接服务器获取合集和智能范围。';

  @override
  String get cancel => '取消';

  @override
  String get delete => '删除';

  @override
  String get remove => '移除';

  @override
  String get save => '保存';

  @override
  String get done => '完成';

  @override
  String get edit => '编辑';

  @override
  String get search => '搜索';

  @override
  String get apply => '应用';

  @override
  String get enable => '启用';

  @override
  String get clear => '清除';

  @override
  String get off => '关闭';

  @override
  String get disabled => '已禁用';

  @override
  String get later => '稍后';

  @override
  String get whatsNewTitle => 'Absorb 已更新';

  @override
  String whatsNewContent(String version) {
    return '你现在使用的是 $version。';
  }

  @override
  String get whatsNewButton => '查看更新内容';

  @override
  String get whatsNewKeepShowing => '每次更新后都显示';

  @override
  String get whatsNewKeepShowingHint => '你可以在设置中重新开启';

  @override
  String get settingsWhatsNew => '更新后显示更新内容';

  @override
  String get settingsWhatsNewSubtitle => '更新后在应用内显示更新内容';

  @override
  String get gotIt => '知道了';

  @override
  String get betaLoggingTitle => '日志已开启';

  @override
  String get betaLoggingContent =>
      '由于这是测试版，Absorb 现在会保存日志以帮助排查问题。除非你主动分享，日志只会保存在此设备上。\n\n你可以在设置的“问题与支持”中发送日志或将其关闭。如果你关闭了日志，之后的测试版也会保持关闭。';

  @override
  String get preview => '预览';

  @override
  String get or => '或';

  @override
  String get file => '文件';

  @override
  String get more => '更多';

  @override
  String get unknown => '未知';

  @override
  String get untitled => '无标题';

  @override
  String get noThanks => '不了，谢谢';

  @override
  String get stay => '保留';

  @override
  String get homeTitle => '首页';

  @override
  String get continueListening => '继续收听';

  @override
  String get continueReading => '继续阅读';

  @override
  String get continueSeries => '继续收听系列';

  @override
  String get recentlyAdded => '最近添加';

  @override
  String get listenAgain => '重新收听';

  @override
  String get discover => '发现';

  @override
  String get newEpisodes => '最新单集';

  @override
  String get downloads => '下载';

  @override
  String get noDownloadedBooks => '暂无已下载书籍';

  @override
  String get yourLibraryIsEmpty => '您的媒体库空空如也';

  @override
  String get downloadBooksWhileOnline => '在线时下载书籍以离线收听';

  @override
  String get customizeHome => '自定义首页';

  @override
  String get dragToReorderTapEye => '拖动排序，点击眼睛图标显示/隐藏';

  @override
  String get loginTagline => '开始收听之旅';

  @override
  String get loginConnectToServer => '连接到您的服务器';

  @override
  String get loginServerAddress => '服务器地址';

  @override
  String get loginServerHint => 'my.server.com';

  @override
  String get loginServerHelper => '也支持 IP:端口 格式（例如 192.168.1.5:13378）';

  @override
  String get loginCouldNotReachServer => '无法连接到服务器';

  @override
  String get loginAdvanced => '高级';

  @override
  String get loginCustomHttpHeaders => '自定义 HTTP 请求头';

  @override
  String get loginCustomHeadersDescription =>
      '用于需要额外请求头的 Cloudflare 隧道或反向代理。请在输入服务器 URL 之前添加请求头。';

  @override
  String get loginHeaderName => '请求头名称';

  @override
  String get loginHeaderValue => '值';

  @override
  String get loginAddHeader => '添加请求头';

  @override
  String get loginSelfSignedCertificates => '自签名证书';

  @override
  String get loginTrustAllCertificates => '信任所有证书（用于自签名/自定义 CA 配置）';

  @override
  String get loginApiKey => 'API 密钥';

  @override
  String get loginApiKeyDescription =>
      '使用管理员生成的 API 密钥代替用户名/密码。当账号的令牌刷新失败时很有用。';

  @override
  String get loginWaitingForSso => '正在等待单点登录(SSO)...';

  @override
  String get loginRedirectUri => '重定向 URI: audiobookshelf://oauth';

  @override
  String get loginOrSignInManually => '或手动登录';

  @override
  String get loginUsername => '用户名';

  @override
  String get loginUsernameRequired => '请输入用户名';

  @override
  String get loginPassword => '密码';

  @override
  String get loginSignIn => '登录';

  @override
  String loginSignInAs(String username) {
    return '以 $username 登录？';
  }

  @override
  String get loginSignInToServer => '登录到此服务器？';

  @override
  String loginSignedInAs(String username) {
    return '已登录为 $username';
  }

  @override
  String get adminCreateSetupFile => '共享登录';

  @override
  String adminSetupFileDescription(String username) {
    return '为 $username 创建私密登录链接，只能用于 Absorb。';
  }

  @override
  String get adminSetupFileServerUrl => '新用户将使用的服务器 URL';

  @override
  String get adminSetupFileNoteWithHeaders =>
      '链接中会包含专用 API 密钥和你的自定义请求头，以便对方连接到服务器。请像对待密码一样对待该链接。';

  @override
  String get adminSetupFileNote => '链接中会包含专用 API 密钥。请像对待密码一样对待该链接。';

  @override
  String get adminSetupFileCreate => '创建链接';

  @override
  String get adminSetupFileSaveTitle => '保存设置文件';

  @override
  String get adminSetupFileKeyError => '无法为该用户创建 API 密钥';

  @override
  String adminSetupFileSaved(String username) {
    return '已保存 $username 的设置文件';
  }

  @override
  String adminSetupFileFailed(String error) {
    return '创建登录信息失败：$error';
  }

  @override
  String get setupLinkShareTitle => '分享登录信息';

  @override
  String setupLinkShareDescription(String username) {
    return '发送此私密链接，或让对方扫描二维码，即可以 $username 的身份登录。';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return '任何拿到此链接的人都可以以 $username 的身份登录。请像对待密码一样对待它。';
  }

  @override
  String get setupLinkShare => '分享链接';

  @override
  String get setupLinkCopy => '复制链接';

  @override
  String get setupLinkCopied => '登录链接已复制';

  @override
  String get setupLinkSaveFile => '保存设置文件';

  @override
  String get setupLinkQrError => '此设置链接太长，无法生成二维码。请改为分享链接。';

  @override
  String setupLinkShareSubject(String username) {
    return '$username 的 Absorb 登录信息';
  }

  @override
  String get setupLinkConfirmTitle => '使用此链接登录？';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return '以 $username 的身份登录 $server？只有在你信任链接发送者时才继续。';
  }

  @override
  String get setupLinkInvalid => '此登录链接无效或不完整';

  @override
  String get setupLinkSigningIn => '正在检查登录链接...';

  @override
  String get loginPlayDownloads => '播放已下载内容';

  @override
  String signedOutDownloadsNote(String username) {
    return '你已退出登录。你在这里收听的内容会在你重新登录后同步到 $username。';
  }

  @override
  String get loginPasteLink => '粘贴登录链接';

  @override
  String get loginPasteLinkHelp => '粘贴你收到的完整登录链接。请像对待密码一样对待它。';

  @override
  String get loginFailed => '登录失败';

  @override
  String get loginSsoFailed => '单点登录失败或已取消';

  @override
  String get loginSsoAuthFailed => '单点登录认证失败，请重试。';

  @override
  String get loginRestoreFromBackup => '从备份恢复';

  @override
  String get loginInvalidBackupFile => '无效的备份文件';

  @override
  String get loginRestoreBackupTitle => '恢复备份？';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return '这将恢复所有设置和 $count 个已保存的账户。你将自动登录。';
  }

  @override
  String get loginRestoreBackupNoAccounts => '这将恢复所有设置。此备份中不包含任何账户。';

  @override
  String get loginRestore => '恢复';

  @override
  String loginRestoredAndSignedIn(String username) {
    return '已恢复设置并以 $username 身份登录';
  }

  @override
  String get loginSessionExpired => '设置已恢复。会话已过期 - 请登录以继续。';

  @override
  String get loginSettingsRestored => '设置已恢复';

  @override
  String loginRestoreFailed(String error) {
    return '恢复失败: $error';
  }

  @override
  String get loginSavedAccounts => '已保存账户';

  @override
  String get libraryTitle => '媒体库';

  @override
  String get librarySearchBooksHint => '搜索书籍、系列、作者、旁白...';

  @override
  String get librarySearchShowsHint => '搜索播客和单集...';

  @override
  String get libraryTabLibrary => '媒体库';

  @override
  String get libraryTabSeries => '系列';

  @override
  String get libraryTabAuthors => '作者';

  @override
  String get libraryTabNarrators => '旁白';

  @override
  String get libraryNoBooks => '未找到书籍';

  @override
  String get libraryNoUnfinishedBooks => '没有未听完的书籍';

  @override
  String get libraryNoBooksInProgress => '暂无进行中的书籍';

  @override
  String get libraryNoFinishedBooks => '暂无已完成书籍';

  @override
  String get libraryAllBooksStarted => '所有书籍均已开始';

  @override
  String get libraryNoDownloadedBooks => '暂无已下载书籍';

  @override
  String get libraryNoSeriesFound => '未找到系列';

  @override
  String get libraryNoBooksWithEbooks => '暂无包含电子书的书籍';

  @override
  String get libraryNoBooksMissingMetadata => '没有缺少此元数据的书籍';

  @override
  String get libraryNoItemsMatchingFilter => '没有符合此筛选条件的项目';

  @override
  String libraryNoBooksInGenre(String genre) {
    return '\"$genre\" 中没有找到书籍';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return '没有标记为“$tag”的书籍';
  }

  @override
  String get libraryClearFilter => '清除筛选';

  @override
  String get libraryNoAuthorsFound => '未找到作者';

  @override
  String get libraryNoNarratorsFound => '未找到旁白';

  @override
  String get libraryNoResults => '未找到结果';

  @override
  String get librarySearchBooks => '书籍';

  @override
  String get librarySearchShows => '播客';

  @override
  String get librarySearchEpisodes => '单集';

  @override
  String get librarySearchSeries => '系列';

  @override
  String get librarySearchAuthors => '作者';

  @override
  String get librarySearchTags => '标签';

  @override
  String get librarySearchGenres => '分类';

  @override
  String librarySeriesCount(int count) {
    return '$count 个系列';
  }

  @override
  String libraryAuthorsCount(int count) {
    return '$count 位作者';
  }

  @override
  String libraryNarratorsCount(int count) {
    return '$count 位旁白';
  }

  @override
  String libraryBooksCount(int loaded, int total) {
    return '已加载 $loaded/$total 本书';
  }

  @override
  String get sort => '排序';

  @override
  String get filter => '筛选';

  @override
  String get filterActive => '筛选 ●';

  @override
  String get name => '名称';

  @override
  String get title => '标题';

  @override
  String get author => '作者';

  @override
  String get dateAdded => '添加日期';

  @override
  String get numberOfBooks => '书籍数量';

  @override
  String get sortTotalDuration => '总时长';

  @override
  String get sortLastBookAdded => '最近添加的书籍';

  @override
  String get sortLastBookUpdated => '最近更新的书籍';

  @override
  String get publishedYear => '出版年份';

  @override
  String get duration => '时长';

  @override
  String get random => '随机';

  @override
  String get collapseSeries => '折叠系列';

  @override
  String get notFinished => '未听完';

  @override
  String get inProgress => '正在收听';

  @override
  String get filterFinished => '已听完';

  @override
  String get notStarted => '未开始';

  @override
  String get downloaded => '已下载';

  @override
  String get hasEbook => '含电子书';

  @override
  String get noEbook => '无电子书';

  @override
  String get hasSupplementaryEbook => '有附带电子书';

  @override
  String get noSupplementaryEbook => '无附带电子书';

  @override
  String get noSeries => '无系列';

  @override
  String get publishedDecade => '出版年代';

  @override
  String get tracks => '音轨';

  @override
  String get noTracks => '无音轨';

  @override
  String get singleTrack => '单音轨';

  @override
  String get multipleTracks => '多音轨';

  @override
  String get abridged => '删节版';

  @override
  String get issues => '问题';

  @override
  String get rssFeedOpen => 'RSS 源已开启';

  @override
  String get explicitContent => '含不宜内容';

  @override
  String get missingMetadata => '缺失元数据';

  @override
  String get genre => '分类';

  @override
  String get tag => '标签';

  @override
  String get clearFilter => '清除筛选';

  @override
  String get noGenresFound => '未找到分类';

  @override
  String get noTagsFound => '未找到标签';

  @override
  String get asc => '升序';

  @override
  String get desc => '降序';

  @override
  String get fileSize => '文件大小';

  @override
  String get lastUpdated => '最近更新';

  @override
  String get fileCreated => '文件创建时间';

  @override
  String get lastModified => '最后修改';

  @override
  String get authorFirstLast => '作者（名 姓）';

  @override
  String get authorLastFirst => '作者（姓, 名）';

  @override
  String get progressSort => '进度';

  @override
  String get dateStarted => '开始日期';

  @override
  String get dateFinished => '完成日期';

  @override
  String get episodeCount => '集数';

  @override
  String get sequence => '系列序号';

  @override
  String get absorbingTitle => '正在收听';

  @override
  String get absorbingStop => '停止';

  @override
  String get absorbingManageQueue => '管理队列';

  @override
  String get absorbingDone => '完成';

  @override
  String get absorbingNoDownloadedEpisodes => '暂无已下载剧集';

  @override
  String get absorbingNoDownloadedBooks => '暂无已下载书籍';

  @override
  String get absorbingNothingPlayingYet => '暂无正在播放的内容';

  @override
  String get absorbingNothingAbsorbingYet => '暂无收听中的内容';

  @override
  String get absorbingDownloadEpisodesToListen => '下载单集以离线收听';

  @override
  String get absorbingDownloadBooksToListen => '下载书籍以离线收听';

  @override
  String get absorbingStartEpisodeFromShows => '从播客标签页开始播放剧集';

  @override
  String get absorbingStartBookFromLibrary => '从媒体库标签页开始播放书籍';

  @override
  String get carModeTitle => '车载模式';

  @override
  String get carModeNoBookLoaded => '未加载书籍';

  @override
  String get carModeBookLabel => '书籍';

  @override
  String get carModeChapterLabel => '章节';

  @override
  String get carModeBookmarkDefault => '书签';

  @override
  String get carModeBookmarkAdded => '已添加书签';

  @override
  String get downloadsTitle => '下载';

  @override
  String get downloadsCancelSelection => '取消选择';

  @override
  String get downloadsSelect => '选择';

  @override
  String get downloadsNoDownloads => '暂无下载';

  @override
  String get downloadsDownloading => '下载中';

  @override
  String get downloadsQueued => '排队中';

  @override
  String get downloadsCompleted => '已完成';

  @override
  String get downloadsEbooks => '电子书';

  @override
  String get downloadsWaiting => '等待中...';

  @override
  String get downloadsCancel => '取消';

  @override
  String get downloadsDelete => '删除';

  @override
  String downloadsDeleteCount(int count) {
    return '删除 $count 个下载项？';
  }

  @override
  String get downloadsDeleteContent => '已下载的文件将从本设备中移除。';

  @override
  String downloadsDeletedCount(int count) {
    return '已删除 $count 个下载项';
  }

  @override
  String get downloadsRemoveTitle => '移除下载？';

  @override
  String downloadsRemoveContent(String title) {
    return '从本设备中删除 \"$title\"？';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return '\"$title\" 已移除';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return '无法下载“$title”：服务器上缺少它的一个文件。扫描媒体库可能会解决此问题。';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return '无法下载“$title”：存储空间不足';
  }

  @override
  String downloadFailedPermission(String title) {
    return '无法下载“$title”：请检查设置中的下载位置';
  }

  @override
  String downloadFailedGeneric(String title) {
    return '无法下载“$title”';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '已选择 $count 项';
  }

  @override
  String get bookmarksTitle => '全部书签';

  @override
  String get bookmarksTabBookmarks => '书签';

  @override
  String get bookmarksTabHighlights => '高亮';

  @override
  String get highlightOpenInBook => '在书中打开';

  @override
  String get highlightDeleteAction => '删除高亮';

  @override
  String get highlightDeleted => '高亮已删除';

  @override
  String highlightsDeleteCount(int count) {
    return '删除 $count 条高亮？';
  }

  @override
  String highlightsDeletedCount(int count) {
    return '已删除 $count 条高亮';
  }

  @override
  String get quoteShareTitle => '分享引文';

  @override
  String get quoteShareAction => '分享';

  @override
  String get quoteShareFailed => '无法生成引文图片';

  @override
  String get quoteShapePortrait => '竖版';

  @override
  String get quoteShapeSquare => '方形';

  @override
  String get quoteShapeStory => '快拍';

  @override
  String get quoteStyleBlur => '模糊';

  @override
  String get quoteStyleDim => '变暗';

  @override
  String get quoteStyleNone => '原始封面';

  @override
  String get quoteTextLight => '浅色文字';

  @override
  String get quoteTextDark => '深色文字';

  @override
  String get quoteFieldTitle => '标题';

  @override
  String get quoteFieldDetail => '详情';

  @override
  String get quoteFieldDetailHint => '作者、章节、页码、说话人';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => '取消选择';

  @override
  String get bookmarksSortedByNewest => '按最新排序';

  @override
  String get bookmarksSortedByPosition => '按位置排序';

  @override
  String get bookmarksSelect => '选择';

  @override
  String get bookmarksNoBookmarks => '暂无书签';

  @override
  String get bookmarksSearchHint => '搜索书签';

  @override
  String get bookmarksNoMatches => '没有符合搜索条件的书签';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '正在下载 $count 本书',
      one: '正在下载 1 本书',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => '已全部下载';

  @override
  String bookmarksDeleteCount(int count) {
    return '删除 $count 个书签？';
  }

  @override
  String get bookmarksDeleteContent => '此操作无法撤销。';

  @override
  String bookmarksDeletedCount(int count) {
    return '已删除 $count 个书签';
  }

  @override
  String get bookmarksJumpTitle => '跳转到书签？';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '\"$title\" 位于 $position\n在《$bookTitle》中';
  }

  @override
  String get bookmarksJump => '跳转';

  @override
  String get bookmarksNotConnected => '未连接到服务器';

  @override
  String get bookmarksCouldNotLoad => '无法加载书籍';

  @override
  String bookmarksSelectedCount(int count) {
    return '已选择 $count 项';
  }

  @override
  String get statsTitle => '你的统计';

  @override
  String get statsCouldNotLoad => '无法加载统计数据';

  @override
  String get statsTotalListeningTime => '总收听时长';

  @override
  String get statsHoursUnit => '小时';

  @override
  String get statsMinutesUnit => '分钟';

  @override
  String get statsSecondsUnit => '秒';

  @override
  String statsDaysOfAudio(String days) {
    return '相当于 $days 天的音频';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return '相当于 $hours 小时的音频';
  }

  @override
  String get statsToday => '今日';

  @override
  String get statsThisWeek => '本周';

  @override
  String get statsThisMonth => '本月';

  @override
  String get statsActivity => '活动';

  @override
  String get statsCurrentStreak => '当前连续天数';

  @override
  String get statsBestStreak => '最佳连续天数';

  @override
  String get statsFinished => '已完成';

  @override
  String get statsBooksFinished => '书籍';

  @override
  String get statsEpisodesFinished => '单集';

  @override
  String get statsBooksThisYear => '今年书籍';

  @override
  String get statsEpisodesThisYear => '今年单集';

  @override
  String get statsRemoveFromYearTitle => '从今年中移除';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return '服务器上的听完日期仍为 $date。这只会将“$title”从 Absorb 的今年听完书籍列表中移除。';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return '服务器上的听完日期保持不变。这只会将“$title”从 Absorb 的今年听完书籍列表中移除。';
  }

  @override
  String get statsRemovedFromYear => '已从今年中移除';

  @override
  String get statsAddBackToYearTitle => '重新加入今年';

  @override
  String statsAddBackToYearBody(String title) {
    return '将“$title”重新加入 Absorb 的今年听完书籍列表？';
  }

  @override
  String get statsAddBack => '重新加入';

  @override
  String get statsAddedBackToYear => '已重新加入今年';

  @override
  String get statsHiddenFromYear => '今年已隐藏';

  @override
  String get statsNothingHidden => '没有隐藏项';

  @override
  String get settingsCustomizeStats => '自定义统计';

  @override
  String get statsGoalTitle => '收听目标';

  @override
  String get statsGoalOff => '关闭';

  @override
  String get statsGoalDaily => '每日';

  @override
  String get statsGoalWeekly => '每周';

  @override
  String get statsGoalMonthly => '每月';

  @override
  String get statsGoalTarget => '目标';

  @override
  String get statsGoalEnterTitle => '设置目标';

  @override
  String get statsGoalEnterTimeHint => '分钟或 h:mm';

  @override
  String statsBooksShort(int count) {
    return '$count 本书';
  }

  @override
  String get statsBookChallengeTitle => '阅读挑战';

  @override
  String get statsBookChallengeDesc => '今年要听完的书籍';

  @override
  String get statsDailyGoal => '每日目标';

  @override
  String get statsWeeklyGoal => '每周目标';

  @override
  String get statsMonthlyGoal => '每月目标';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$done / $target 本书';
  }

  @override
  String get statsGoalReached => '目标已达成';

  @override
  String get statsChartTitle => '收听图表';

  @override
  String get statsChartBar => '柱状图';

  @override
  String get statsChartLine => '折线图';

  @override
  String get statsChartHeatmap => '热力图';

  @override
  String get statsChartDays7 => '7 天';

  @override
  String get statsChartDays30 => '30天';

  @override
  String get statsLast30Days => '过去 30 天';

  @override
  String get statsThisYearTitle => '今年';

  @override
  String get statsSectionsTitle => '板块';

  @override
  String get statsSectionTimePeriods => '时间段';

  @override
  String get statsHeatmapLess => '更少';

  @override
  String get statsHeatmapMore => '更多';

  @override
  String get statsDayOfWeek => '每周日均';

  @override
  String get statsTimeSavedLabel => '倍速节省的时间';

  @override
  String statsTimeSavedSince(String date) {
    return '自 $date 起';
  }

  @override
  String get statsTimeSavedReset => '重置节省的时间';

  @override
  String get statsTimeSavedResetConfirm => '节省的时间将从今天起重新计算。';

  @override
  String get statsTimeSavedResetDone => '节省的时间已重置';

  @override
  String statsOnPaceFor(int count) {
    return '按当前进度可听完 $count 本书';
  }

  @override
  String get statsDaysActive => '活跃天数';

  @override
  String get statsDailyAverage => '日均时长';

  @override
  String get statsLast7Days => '过去7天';

  @override
  String get statsMostListened => '收听最多';

  @override
  String get statsRecentSessions => '最近会话';

  @override
  String get appShellHomeTab => '首页';

  @override
  String get appShellLibraryTab => '媒体库';

  @override
  String get appShellAbsorbingTab => '正在收听';

  @override
  String get appShellStatsTab => '统计';

  @override
  String get appShellSettingsTab => '设置';

  @override
  String get appShellDiscoverTab => '发现';

  @override
  String get appShellShowsTab => '节目';

  @override
  String get appShellPodcastsTab => '播客';

  @override
  String get libraryTabEpisodes => '单集';

  @override
  String get filterAllEpisodes => '全部';

  @override
  String get filterUnplayed => '未播放';

  @override
  String get episodeFeedEmpty => '没有符合此筛选条件的单集';

  @override
  String get podcastFilterUpNext => '接下来';

  @override
  String get podcastFilterNew => '新';

  @override
  String get settingsPodcastTab => '播客标签页';

  @override
  String get settingsPodcastTabDesc => '为一个播客媒体库在底部栏设置专属标签页';

  @override
  String get settingsPodcastTabLibrary => '播客标签页媒体库';

  @override
  String get settingsMergeImpliedByPodcastTab => '启用播客标签页时始终开启';

  @override
  String get settingsEpisodeNotifs => '通知设置';

  @override
  String get settingsEpisodeNotifsDesc => '在后台检查新的播客单集和即将发布的书籍';

  @override
  String get notifIntervalOff => '关闭';

  @override
  String notifIntervalMinutes(int n) {
    return '每 $n 分钟';
  }

  @override
  String get notifIntervalHour => '每小时';

  @override
  String notifIntervalHours(int n) {
    return '每 $n 小时';
  }

  @override
  String get settingsBatteryUnrestricted => '允许不受限制地使用电池';

  @override
  String get settingsBatteryUnrestrictedDesc => '防止系统在某些手机上暂停后台检查';

  @override
  String get appShellPressBackToExit => '再按一次返回键退出';

  @override
  String get settingsTitle => '设置';

  @override
  String get sectionAppearance => '外观';

  @override
  String get languageLabel => '语言';

  @override
  String get languageSystemDefault => '跟随系统';

  @override
  String get languageHelpTranslateInvite => '想帮 Absorb 翻译成你的语言吗？';

  @override
  String get themeLabel => '主题';

  @override
  String get themeDark => '深色';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => '浅色';

  @override
  String get themeAuto => '自动';

  @override
  String get colorSourceLabel => '颜色来源';

  @override
  String get colorSourceCoverDescription => '应用颜色跟随当前播放书籍的封面';

  @override
  String get colorSourceWallpaperDescription => '应用颜色跟随系统壁纸';

  @override
  String get colorSourceWallpaper => '壁纸';

  @override
  String get colorSourceNowPlaying => '正在播放';

  @override
  String get colorSourceDynamic => '动态';

  @override
  String get colorSourceManual => '手动';

  @override
  String get colorSourceManualDescription => '使用你在下方选择的固定应用颜色';

  @override
  String get colorSourceCustom => '自定义';

  @override
  String get useColorEverywhereLabel => '处处使用此颜色';

  @override
  String get useColorEverywhereSubtitle => '书籍详情页和播放器卡片也使用你设置的颜色，而不是每本书的封面颜色';

  @override
  String get flatBackgroundLabel => '纯色背景';

  @override
  String get flatBackgroundSubtitle => '移除背景渐变。深色模式下为 OLED 屏幕使用纯黑。';

  @override
  String get einkModeLabel => '墨水屏模式';

  @override
  String get einkModeSubtitle => '高对比度黑白、无动画，专为墨水屏设计';

  @override
  String get einkModeIntroBody =>
      '专为墨水屏设计。应用将切换为高对比度的纯黑白外观，关闭动画，播放卡片不再显示背景，并保持与服务器的实时连接关闭以节省电量。播放和进度仍会正常同步。你的外观设置会被保留，关闭此模式后会恢复。';

  @override
  String get einkModeIntroConfirm => '开启';

  @override
  String get backgroundIntensityLabel => '背景强度';

  @override
  String get startScreenLabel => '启动画面';

  @override
  String get startScreenSubtitle => '应用启动时打开的标签页';

  @override
  String get startScreenHome => '首页';

  @override
  String get startScreenLibrary => '媒体库';

  @override
  String get startScreenAbsorb => '正在收听';

  @override
  String get startScreenStats => '统计';

  @override
  String get disablePageFade => '禁用页面淡入淡出';

  @override
  String get disablePageFadeOnSubtitle => '页面立即切换';

  @override
  String get disablePageFadeOffSubtitle => '切换标签页时页面淡入淡出';

  @override
  String get rectangleBookCovers => '矩形书籍封面';

  @override
  String get progressTextSize => '进度文字大小';

  @override
  String get rectangleBookCoversOnSubtitle => '封面以 2:3 的书籍比例显示';

  @override
  String get rectangleBookCoversOffSubtitle => '封面为正方形';

  @override
  String get coverSize => '封面大小';

  @override
  String get coverSizeSubtitle => '媒体库网格每行可容纳的封面数量';

  @override
  String get coverSizeSmall => '小';

  @override
  String get coverSizeMedium => '中';

  @override
  String get coverSizeLarge => '大';

  @override
  String get sectionAbsorbingCards => '收听卡片';

  @override
  String get fullScreenPlayer => '全屏播放器';

  @override
  String get fullScreenPlayerOnSubtitle => '开启 - 播放时以全屏方式打开书籍';

  @override
  String get fullScreenPlayerOffSubtitle => '关闭 - 在卡片视图内播放';

  @override
  String get fullBookScrubber => '全书进度条';

  @override
  String get fullBookScrubberOnSubtitle => '开启 - 可拖动滑块跳转至全书任意位置';

  @override
  String get fullBookScrubberOffSubtitle => '关闭 - 仅显示进度条';

  @override
  String get cardScrubbers => '卡片进度条';

  @override
  String get cardScrubbersBoth => '两者';

  @override
  String get cardScrubbersChapter => '章节';

  @override
  String get cardScrubbersLocked => '已锁定';

  @override
  String get cardScrubbersBothSubtitle => '整本书和章节进度条都可拖动跳转';

  @override
  String get cardScrubbersChapterSubtitle => '只有章节进度条可拖动跳转';

  @override
  String get cardScrubbersLockedSubtitle => '仅显示进度，不可拖动跳转';

  @override
  String get speedAdjustedTime => '变速后时间';

  @override
  String get speedAdjustedTimeOnSubtitle => '开启 - 剩余时间会根据播放速度变化';

  @override
  String get speedAdjustedTimeOffSubtitle => '关闭 - 显示原始音频时长';

  @override
  String get buttonLayout => '按钮布局';

  @override
  String get buttonLayoutSubtitle => '卡片上操作按钮的排列方式';

  @override
  String get whenAbsorbed => '当收听完成时';

  @override
  String get whenAbsorbedInfoTitle => '当收听完成时';

  @override
  String get whenAbsorbedInfoContent =>
      '控制当您完成一本书或一集后收听卡片的行为。\n\n已完成的卡片会自动从从您的“正在收听”屏幕中移除。';

  @override
  String get whenAbsorbedSubtitle => '听完一本书或或一集后收听卡片的处理方式';

  @override
  String get whenAbsorbedShowOverlay => '显示覆盖层';

  @override
  String get whenAbsorbedAutoRelease => '自动释放';

  @override
  String get mergeLibraries => '合并媒体库';

  @override
  String get mergeLibrariesInfoTitle => '合并媒体库';

  @override
  String get mergeLibrariesInfoContent =>
      '启用后，“正在收听”界面会将您所有媒体库中正在进行的书籍和播客集中显示在一个视图中。禁用时，仅显示您当前所选媒体库中的项目。';

  @override
  String get mergeLibrariesOnSubtitle => '正在收听页面显示来自所有媒体库的项目';

  @override
  String get mergeLibrariesOffSubtitle => '正在收听页面仅显示当前媒体库';

  @override
  String get queueMode => '队列模式';

  @override
  String get queueModeInfoTitle => '队列模式';

  @override
  String get queueModeInfoOff => '关闭';

  @override
  String get queueModeInfoOffDesc => '当前书籍或单集播放完成后停止播放。';

  @override
  String get queueModeInfoManual => '手动队列';

  @override
  String get queueModeInfoManualDesc =>
      '你的收听卡片将作为播放列表使用。当一个播放完成时，会自动播放下一个未完成的卡片。通过书籍或单集详情页的\"添加至正在收听\"按钮添加项目，并在收听界面重新排序。';

  @override
  String get queueModeOff => '关闭';

  @override
  String get queueModeManual => '手动';

  @override
  String get queueModeAuto => '自动';

  @override
  String get queueModePlaylist => '播放列表';

  @override
  String get queueModeCollection => '合集';

  @override
  String get queueModeInfoPlaylist => '播放队列';

  @override
  String get queueModeInfoPlaylistDesc => '按所选播放列表的顺序播放，跳过已完成的项目，并在列表结束时停止。';

  @override
  String get queuePlaylistPickerTitle => '选择一个播放列表';

  @override
  String get queuePlaylistNone => '没有选择播放列表';

  @override
  String queuePlaylistActiveLabel(String name) {
    return '播放列表：$name';
  }

  @override
  String get queueModePlaylistHint => '在首页打开播放列表即可开始播放列表队列。';

  @override
  String get exit => '退出';

  @override
  String upNext(String label) {
    return '接下来：$label';
  }

  @override
  String get nothingUpNext => '接下来没有内容';

  @override
  String get showUpNextLabel => '在正在收听页面显示“接下来”';

  @override
  String get openSeries => '打开系列';

  @override
  String get openPlaylist => '打开播放列表';

  @override
  String get openCollection => '打开合集';

  @override
  String get playlistPlayAction => '播放列表';

  @override
  String get playlistAllFinished => '已全部听完';

  @override
  String get queueModeBooks => '书籍';

  @override
  String get queueModePodcasts => '播客';

  @override
  String get autoDownloadQueue => '自动下载队列';

  @override
  String get autoDownloadThisSeriesLabel => '自动下载此系列';

  @override
  String get autoDownloadThisShowLabel => '自动下载此播客';

  @override
  String get autoDownloadThisPlaylistLabel => '自动下载此播放列表';

  @override
  String get autoDownloadThisCollectionLabel => '自动下载此合集';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return '保留接下来 $count 个项目的下载';
  }

  @override
  String get autoDownloadQueueOffSubtitle => '关闭 - 仅手动下载';

  @override
  String get sectionPlayback => '播放';

  @override
  String get sectionMediaControls => '媒体控制';

  @override
  String get defaultSpeed => '默认速度';

  @override
  String get defaultSpeedSubtitle => '新书以此速度开始播放 - 每本书会记住自己的速度';

  @override
  String get skipBack => '快退';

  @override
  String get skipForward => '快进';

  @override
  String get iosLockScreenSkipHint =>
      '锁屏界面只显示 iOS 有图标的数字（5、10、15、30、45、60、75、90）。其他数值在按钮上显示为 +，但仍按你的设置跳转。';

  @override
  String get longSkipButtons => '长跳转按钮';

  @override
  String get longSkipButtonsOnSubtitle => '开启：播放器会显示第二组更大的跳转按钮';

  @override
  String get longSkipButtonsOffSubtitle => '关闭：只显示常规跳转按钮';

  @override
  String get longSkipBack => '长跳转后退';

  @override
  String get longSkipForward => '长跳转前进';

  @override
  String get coverShapeDefault => '默认';

  @override
  String get coverShapeSquare => '方形';

  @override
  String get coverShapeRectangle => '矩形';

  @override
  String get coverShapeLabel => '封面形状';

  @override
  String get showSubtitles => '显示副标题';

  @override
  String get showSubtitlesOnSubtitle => '副标题显示在媒体库和首页的书名下方';

  @override
  String get showSubtitlesOffSubtitle => '关闭：副标题仅显示在书籍详情面板中';

  @override
  String get subtitleVisibilityLabel => '副标题';

  @override
  String get subtitleVisibilityDefault => '默认';

  @override
  String get subtitleVisibilityShow => '显示';

  @override
  String get subtitleVisibilityHide => '隐藏';

  @override
  String currentLibrarySettingsTitle(String name) {
    return '当前媒体库：$name';
  }

  @override
  String get currentLibrarySkipOverride => '自定义跳转时长';

  @override
  String get currentLibrarySkipOverrideOnSubtitle => '开启：此媒体库使用自己的跳转时长';

  @override
  String get currentLibrarySkipOverrideOffSubtitle => '关闭：此媒体库使用全局跳转时长';

  @override
  String get currentLibrarySkipBack => '后退';

  @override
  String get currentLibrarySkipForward => '前进';

  @override
  String get chapterProgressInNotification => '通知中显示章节进度';

  @override
  String get chapterProgressOnSubtitle => '开启 - 锁屏显示章节进度';

  @override
  String get chapterProgressOffSubtitle => '关闭 - 锁屏显示全书进度';

  @override
  String get chapterProgressInNotificationIos => '锁屏和 CarPlay 上的章节进度';

  @override
  String get chapterProgressOnSubtitleIos => '开启：锁屏和 CarPlay 显示章节进度';

  @override
  String get nowPlayingText => '正在播放文字';

  @override
  String get nowPlayingTextSubtitle => '选择媒体控制每一行显示的内容';

  @override
  String get nowPlayingTopLine => '第一行';

  @override
  String get nowPlayingSecondLine => '第二行';

  @override
  String get nowPlayingNotShown => '不显示';

  @override
  String get nowPlayingTopLineRequired => '第一行至少需要一项';

  @override
  String get nowPlayingPieceChapter => '章节';

  @override
  String get nowPlayingPieceTitle => '书名';

  @override
  String get nowPlayingPieceNarrator => '朗读者';

  @override
  String get nowPlayingPieceSeries => '系列';

  @override
  String get nowPlayingPiecePercent => '书籍百分比';

  @override
  String get nowPlayingPieceChapterNumber => '章节序号';

  @override
  String get nowPlayingPieceTimeLeft => '剩余时间';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return '第 $number/$total 章';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return '剩余 $time';
  }

  @override
  String get bookDockBadgePending => '待处理';

  @override
  String get bookDockBadgeExtracting => '正在读取文件';

  @override
  String get bookDockBadgeFetching => '正在查找';

  @override
  String get bookDockBadgeError => '错误';

  @override
  String get bookDockNeedsReview => '需要审核';

  @override
  String get bookDockNoMatch => '无匹配';

  @override
  String get bookDockApplied => '已应用';

  @override
  String get bookDockNotApplied => '找到的详情未使用';

  @override
  String get bookDockNoDestination => '未设置目标位置';

  @override
  String get bookDockNoAuthor => '暂无作者';

  @override
  String get bookDockLookUpAgain => '重新查找';

  @override
  String get bookDockLookingUp => '正在重新查找详情';

  @override
  String get bookDockLookUpFailed => '无法查找详情';

  @override
  String get bookDockProposedChanges => '建议的更改';

  @override
  String get bookDockNoChanges => '暂未在线找到详情';

  @override
  String get bookDockStillReading => '服务器仍在读取此文件';

  @override
  String get bookDockRoleBook => '书籍';

  @override
  String get bookDockRoleCover => '封面';

  @override
  String get bookDockRoleMetadata => '元数据';

  @override
  String get bookDockRoleExtra => '附加';

  @override
  String get bookDockFieldTitle => '标题';

  @override
  String get bookDockFieldSubtitle => '副标题';

  @override
  String get bookDockFieldAuthors => '作者';

  @override
  String get bookDockFieldSeries => '系列';

  @override
  String get bookDockFieldPublisher => '出版商';

  @override
  String get bookDockFieldYear => '年份';

  @override
  String get bookDockFieldLanguage => '语言';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return '匹配度 $percent%';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件',
      one: '1 个文件',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return '将放入 $library';
  }

  @override
  String bookDockChangedFields(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个字段',
      one: '1 个字段',
    );
    return '$_temp0';
  }

  @override
  String bookDockFilesInEntry(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '此条目中的 $count 个文件',
      one: '此条目中的文件',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return '添加于 $date';
  }

  @override
  String get bookDockAddToLibrary => '添加到媒体库';

  @override
  String get bookDockUseFound => '使用找到的详情';

  @override
  String get bookDockRemoveTitle => '从 Book Dock 中移除？';

  @override
  String get bookDockRemoveFailed => '无法移除此文件';

  @override
  String get bookDockPickLibrary => '添加到哪个媒体库？';

  @override
  String get bookDockNoLibraries => '你的账户无法向媒体库添加书籍';

  @override
  String get bookDockFileFailed => '无法将此文件添加到媒体库';

  @override
  String get bookDockDuplicateBody => '该媒体库中已有同名文件。要从 Book Dock 中移除它吗？';

  @override
  String get bookDockDetailsUpdated => '详情已更新';

  @override
  String get bookDockUseFoundFailed => '没有可使用的已找到详情';

  @override
  String bookDockRemoveBody(String title) {
    return '这将从服务器上删除 $title。';
  }

  @override
  String bookDockRemoved(String title) {
    return '已从 Book Dock 中移除 $title';
  }

  @override
  String bookDockFiled(String title, String library) {
    return '已将 $title 添加到 $library';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return '无法添加此文件：$reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return '已在 $library 中';
  }

  @override
  String get bomatchSearchAll => '搜索所有来源';

  @override
  String get bomatchSearching => '正在搜索...';

  @override
  String get bomatchSearchFailed => '无法搜索匹配项。请检查网络连接后重试。';

  @override
  String get bomatchNoResults => '未找到匹配项';

  @override
  String get bomatchStrong => '高度匹配';

  @override
  String get bomatchPossible => '可能的匹配';

  @override
  String get bomatchSourceTimeout => '已超时';

  @override
  String get bomatchSourceBusy => '繁忙';

  @override
  String get bomatchSourceFailed => '失败';

  @override
  String get bomatchLinked => '已关联';

  @override
  String get bomatchSameIsbn => 'ISBN 相同';

  @override
  String get bomatchFewDetails => '详情较少';

  @override
  String get bomatchBack => '所有结果';

  @override
  String get bomatchFillEmpty => '填充空白项';

  @override
  String get bomatchTakeAll => '全部采用';

  @override
  String get bomatchOnlyDifferences => '仅显示差异';

  @override
  String get bomatchNow => '当前';

  @override
  String get bomatchEmpty => '空';

  @override
  String get bomatchKindNew => '新增';

  @override
  String get bomatchKindChange => '更改';

  @override
  String get bomatchKindSmall => '小幅更改';

  @override
  String get bomatchKindSame => '相同';

  @override
  String get bomatchKindNone => '结果中没有';

  @override
  String get bomatchKeep => '保留';

  @override
  String get bomatchUse => '使用';

  @override
  String get bomatchMerge => '合并';

  @override
  String get bomatchReplace => '替换';

  @override
  String get bomatchUseThis => '使用此项';

  @override
  String get bomatchChosen => '已选择';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '另外 $count 本书',
      one: '另外 1 本书',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 处更改',
      one: '1 处更改',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项新增',
      one: '1 项新增',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '应用 $count 处更改',
      one: '应用 1 处更改',
      zero: '应用',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '另外 $count 个来源',
      one: '另外 1 个来源',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return '来自 $source';
  }

  @override
  String get breqTitle => '书籍请求';

  @override
  String get breqTabRequest => '请求书籍';

  @override
  String get breqTabMine => '我的请求';

  @override
  String get breqTabAll => '所有请求';

  @override
  String get breqNoAccess => '你的账户无法在此服务器上请求书籍。';

  @override
  String get breqTitleHint => '书名';

  @override
  String get breqAuthorHint => '作者';

  @override
  String get breqKindAudiobook => '有声书';

  @override
  String get breqKindEbook => '电子书';

  @override
  String get breqKindComic => '漫画';

  @override
  String get breqSearch => '搜索';

  @override
  String get breqSearching => '正在搜索...';

  @override
  String get breqSearchFailed => '无法搜索。请检查网络连接后重试。';

  @override
  String get breqSearchPrompt => '搜索媒体库中还没有的书籍来提出请求。';

  @override
  String get breqNoResults => '未找到匹配的书籍';

  @override
  String get breqInLibrary => '已在你的媒体库中';

  @override
  String get breqYouAsked => '你已请求此书';

  @override
  String get breqSomeoneAsked => '已有其他人请求';

  @override
  String get breqView => '查看';

  @override
  String get breqRequest => '请求';

  @override
  String get breqRequested => '已请求';

  @override
  String get breqAddMeToo => '我也要';

  @override
  String get breqLibrary => '媒体库';

  @override
  String get breqLibraryApprover => '由审批人决定';

  @override
  String get breqLibraryChoose => '选择媒体库';

  @override
  String get breqNote => '给审批人的备注';

  @override
  String get breqNoteHint => '关于此请求的任何需要说明的事项';

  @override
  String get breqAutoApproved => '你的请求会立即获批。';

  @override
  String get breqSubmitted => '请求已提交';

  @override
  String get breqJoined => '已将你加入现有请求';

  @override
  String get breqFailed => '无法发送请求';

  @override
  String get breqStatusPending => '待处理';

  @override
  String get breqStatusApproved => '已批准';

  @override
  String get breqStatusRejected => '已拒绝';

  @override
  String get breqStatusCancelled => '已取消';

  @override
  String get breqStatusSearching => '搜索中';

  @override
  String get breqStatusGrabbed => '已找到资源';

  @override
  String get breqStatusDownloading => '下载中';

  @override
  String get breqStatusImporting => '导入中';

  @override
  String get breqStatusNeedsReview => '需要审核';

  @override
  String get breqStatusAvailable => '可用';

  @override
  String get breqStatusFailed => '失败';

  @override
  String get breqWaitingApproval => '等待批准';

  @override
  String get breqWaitingRelease => '等待选择资源';

  @override
  String get breqLookingForRelease => '正在查找资源';

  @override
  String get breqStartingDownload => '正在开始下载';

  @override
  String get breqAddingToLibrary => '正在添加到媒体库';

  @override
  String get breqWaitingCheck => '等待人工检查';

  @override
  String get breqReady => '已可在你的媒体库中使用';

  @override
  String get breqSomethingWrong => '出了点问题';

  @override
  String get breqShowHidden => '显示已隐藏项';

  @override
  String get breqHidden => '已隐藏';

  @override
  String get breqMineEmpty => '你还没有请求过任何书籍。';

  @override
  String get breqAllEmpty => '暂无请求。';

  @override
  String get breqLoadFailed => '无法加载请求。';

  @override
  String get breqLoadMore => '加载更多';

  @override
  String get breqApprove => '批准';

  @override
  String get breqReject => '拒绝';

  @override
  String get breqCancel => '取消请求';

  @override
  String get breqHide => '从我的列表中隐藏';

  @override
  String get breqUnhide => '在我的列表中显示';

  @override
  String get breqLeave => '退出请求';

  @override
  String get breqDelete => '删除请求';

  @override
  String get breqOpenBook => '打开书籍';

  @override
  String get breqCancelConfirm => '取消此请求？正在进行的下载也会停止。';

  @override
  String get breqDeleteConfirm => '删除此请求？此操作无法撤销。';

  @override
  String get breqRejectTitle => '拒绝请求';

  @override
  String get breqRejectReason => '原因（可选）';

  @override
  String get breqApproveTitle => '批准请求';

  @override
  String get breqApproveLibraryNeeded => '请选择这本书要放入的媒体库。';

  @override
  String get breqApprovedToast => '请求已批准';

  @override
  String get breqRejectedToast => '请求已拒绝';

  @override
  String get breqCancelledToast => '请求已取消';

  @override
  String get breqHiddenToast => '已从你的列表中隐藏';

  @override
  String get breqRestoredToast => '已恢复到你的列表';

  @override
  String get breqDeletedToast => '请求已删除';

  @override
  String get breqLeftToast => '你已退出此请求';

  @override
  String get breqActionFailed => '无法更新请求';

  @override
  String get breqFactRequestedBy => '请求者';

  @override
  String get breqFactRequestedOn => '请求时间';

  @override
  String get breqFactLibrary => '媒体库';

  @override
  String get breqFactDecidedBy => '审批人';

  @override
  String get breqFactNote => '请求者的备注';

  @override
  String get breqFactDecisionNote => '审批备注';

  @override
  String get breqFactAlsoWanted => '其他想要的人';

  @override
  String get breqLibraryCta => '请求书籍';

  @override
  String get breqSettingsSubtitle => '请求媒体库中还没有的书籍';

  @override
  String get navHoldBookRequests => '书籍请求';

  @override
  String breqLibraryDefault(String library) {
    return '默认（$library）';
  }

  @override
  String breqFailedReason(String reason) {
    return '无法发送请求：$reason';
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
    return '下载中，$percent%';
  }

  @override
  String breqAddedTo(String library) {
    return '已添加到 $library';
  }

  @override
  String breqRejectedWithNote(String note) {
    return '已拒绝：$note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return '失败：$reason';
  }

  @override
  String breqRequestedBy(String name) {
    return '请求者：$name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return '无法更新请求：$reason';
  }

  @override
  String breqFooterCta(String query) {
    return '请求“$query”';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个请求',
      one: '1 个请求',
      zero: '没有请求',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => '查找资源';

  @override
  String get breqTryAnotherRelease => '尝试其他资源';

  @override
  String get breqApproveAndFind => '批准并查找资源';

  @override
  String get breqReviewButton => '检查下载';

  @override
  String get breqStopDownload => '停止下载';

  @override
  String get breqStopDownloadConfirm => '停止此下载？请求将回到已批准状态，以便选择其他资源。';

  @override
  String get breqDiscardImport => '丢弃下载';

  @override
  String get breqDiscardConfirm => '丢弃此下载？请求将标记为失败，之后可以用其他资源重试。';

  @override
  String get breqFileAnyway => '添加到媒体库';

  @override
  String get breqFiledToast => '已添加到媒体库';

  @override
  String get breqDiscardedToast => '下载已丢弃';

  @override
  String get breqStoppedToast => '下载已停止';

  @override
  String get breqGrabTitle => '下载此资源？';

  @override
  String get breqGrab => '下载';

  @override
  String get breqGrabbed => '下载已开始';

  @override
  String get breqGrabFailed => '无法开始下载';

  @override
  String get breqReleaseVipWarning => '此站点仅允许 VIP 账户下载。';

  @override
  String get breqReleaseNoBookFile => '此资源中没有 BookOrbit 可添加到媒体库的书籍文件。';

  @override
  String get breqReleaseCheckFailed => '无法检查此资源的内容。请重试或选择其他资源。';

  @override
  String get breqCheckingRelease => '正在检查文件...';

  @override
  String get breqSearchAgain => '重新搜索';

  @override
  String get breqSearchTerms => '搜索词';

  @override
  String get breqIsbnHint => '留空则按书名和作者搜索';

  @override
  String get breqSearchingIndexers => '正在搜索你的索引器。最长可能需要一分钟。';

  @override
  String get breqReleasesFailed => '无法搜索资源。';

  @override
  String get breqNoSourcesSetUp => 'BookOrbit 中尚未设置任何搜索来源。';

  @override
  String get breqNoSourcesOn => 'BookOrbit 中所有搜索来源都已关闭。';

  @override
  String get breqNoSourceCarries => '你的搜索来源都不提供这类书籍。';

  @override
  String get breqNoReleases => '未找到资源。请尝试其他搜索词。';

  @override
  String get breqFromCache => '来自最近的搜索';

  @override
  String get breqIndexerUnauthorized => '登录失败';

  @override
  String get breqIndexerThrottled => '繁忙';

  @override
  String get breqIndexerTimeout => '已超时';

  @override
  String get breqIndexerUnreachable => '无法连接';

  @override
  String get breqIndexerNoMedium => '不提供此类内容';

  @override
  String get breqIndexerError => '失败';

  @override
  String get breqSortBest => '最佳匹配';

  @override
  String get breqSortSeeders => '做种数';

  @override
  String get breqSortSize => '大小';

  @override
  String get breqSortNewest => '最新';

  @override
  String get breqFreeleech => '免流';

  @override
  String get breqVipOnly => '仅限 VIP';

  @override
  String get breqAlreadyGrabbed => '以前下载过';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => '标题';

  @override
  String get breqReasonAuthor => '作者';

  @override
  String get breqReasonUnknownFormat => '未知格式';

  @override
  String get breqReasonExpectedSize => '大小';

  @override
  String get breqReasonSuspiciousSize => '大小异常';

  @override
  String get breqReasonFreeleech => '免流';

  @override
  String get breqReasonSeveralBooks => '多本书';

  @override
  String get breqReviewTitle => '下载等待检查';

  @override
  String get breqReviewFailed => '无法加载下载详情。';

  @override
  String get breqReviewDockGone => '下载的文件已不在 Book Dock 中。';

  @override
  String get breqReviewNoLibrary => '此请求没有可添加书籍的媒体库。';

  @override
  String breqGrabFailedReason(String reason) {
    return '无法开始下载：$reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return '无法检查此资源的内容：$reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return '无法搜索资源：$reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return '无法加载下载详情：$reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个资源',
      one: '1 个资源',
      zero: '没有资源',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件',
      one: '1 个文件',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件',
      one: '1 个文件',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return '$seeders 个做种，$leechers 个下载';
  }

  @override
  String breqScore(int score) {
    return '得分 $score';
  }

  @override
  String breqReasonPreferredFormat(String format) {
    return '首选 $format';
  }

  @override
  String breqReasonFormat(String format) {
    return '$format';
  }

  @override
  String breqReasonSeeders(String count) {
    return '$count 个做种';
  }

  @override
  String breqReviewScore(int score, int threshold) {
    return '匹配得分 $score。得分达到 $threshold 或以上的下载会自动添加。';
  }

  @override
  String breqReviewRequested(String value) {
    return '请求的内容：$value';
  }

  @override
  String breqReviewImported(String value) {
    return '已下载的内容：$value';
  }

  @override
  String get breqKindBoth => '两者';

  @override
  String get breqEbookLibrary => '电子书媒体库';

  @override
  String get breqAudiobookLibrary => '有声书媒体库';

  @override
  String get breqRequestBoth => '两者都请求';

  @override
  String get breqAddMeToBoth => '两者都加入我';

  @override
  String get breqRequestEbook => '请求电子书';

  @override
  String get breqRequestAudiobook => '请求有声书';

  @override
  String get breqAddMeEbook => '加入电子书请求';

  @override
  String get breqAddMeAudiobook => '加入有声书请求';

  @override
  String get breqPairSubmitted => '已请求电子书和有声书';

  @override
  String get breqPairOneJoined => '两者都已请求。其中一个已在处理中，因此你已被加入该请求';

  @override
  String get breqJoinedBoth => '已将你加入两个请求';

  @override
  String get breqJoinsOwned => '已请求。它会与你媒体库中已有的副本合并';

  @override
  String get speedBookmarkInControls => '媒体控制中的速度和书签';

  @override
  String get speedBookmarkOnSubtitle => '开启：通知显示速度和书签；章节跳转保留在 Android Auto 中';

  @override
  String get speedBookmarkOffSubtitle => '关闭：通知显示章节跳转；速度和书签保留在 Android Auto 中';

  @override
  String get lockSeekBar => '锁定搜索栏';

  @override
  String get lockSeekBarOnSubtitle => '开启：通知、锁屏和车载中的进度条仅显示进度，不可拖动';

  @override
  String get lockSeekBarOffSubtitle => '关闭：可在通知、锁屏和车载中拖动进度条来跳转';

  @override
  String get autoRewindOnResume => '恢复播放时自动倒退';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return '开启 - 根据暂停时长倒回 $min 秒至 $max 秒';
  }

  @override
  String get autoRewindOffSubtitle => '关闭';

  @override
  String get rewindRange => '倒回范围';

  @override
  String get rewindAfterPausedFor => '暂停后倒回';

  @override
  String get rewindAnyPause => '任何暂停';

  @override
  String get rewindAlwaysLabel => '始终';

  @override
  String get rewindAlwaysDescription => '每次恢复播放都倒回，即使是短暂中断';

  @override
  String rewindAfterDescription(String seconds) {
    return '仅在暂停 $seconds 秒以上时倒回';
  }

  @override
  String get chapterBarrier => '章节边界';

  @override
  String get chapterBarrierSubtitle => '不回退到当前章节开头之前';

  @override
  String get rewindInstant => '立即';

  @override
  String rewindPause(String duration) {
    return '暂停 $duration';
  }

  @override
  String get rewindNoRewind => '不倒回';

  @override
  String rewindSeconds(String seconds) {
    return '倒回 $seconds 秒';
  }

  @override
  String get sectionSleepTimer => '睡眠定时器';

  @override
  String get sleep => '睡眠';

  @override
  String get sleepTimer => '睡眠定时器';

  @override
  String get shakeDuringSleepTimer => '睡眠定时器期间摇一摇';

  @override
  String get shakeOff => '关闭';

  @override
  String get shakeAddTime => '添加时间';

  @override
  String get shakeReset => '重置';

  @override
  String get shakeAdds => '摇一摇添加';

  @override
  String get sleepAddAmount => '增加时间量';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String get shakeSensitivity => '摇一摇灵敏度';

  @override
  String get shakeSensitivityVeryLow => '非常低';

  @override
  String get shakeSensitivityLow => '低';

  @override
  String get shakeSensitivityMedium => '中';

  @override
  String get shakeSensitivityHigh => '高';

  @override
  String get shakeSensitivityVeryHigh => '非常高';

  @override
  String get buttonDuringSleepTimer => '渐弱期间的耳机按键';

  @override
  String get buttonDuringSleepTimerHint => '在最后的渐弱阶段，按一次会重置定时器而不是暂停。双击仍然是跳转。';

  @override
  String get resetTimerOnPause => '暂停时重置定时器';

  @override
  String get resetTimerOnPauseOnSubtitle => '恢复播放时，定时器从完整时长重新开始';

  @override
  String get resetTimerOnPauseOffSubtitle => '定时器从上次停止的位置继续';

  @override
  String get fadeVolumeBeforeSleep => '睡前渐弱音量';

  @override
  String get fadeVolumeOnSubtitle => '在最后30秒逐渐降低音量';

  @override
  String get fadeVolumeOffSubtitle => '定时器结束时立即停止播放';

  @override
  String get autoSleepTimer => '自动睡眠定时器';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration 分钟';
  }

  @override
  String get autoSleepTimerOffSubtitle => '在指定时间段内自动启动睡眠定时器';

  @override
  String get windowStart => '开始时间';

  @override
  String get windowEnd => '结束时间';

  @override
  String get timerDuration => '定时器时长';

  @override
  String get timer => '定时器';

  @override
  String get endOfChapter => '章节结束';

  @override
  String startMinTimer(int minutes) {
    return '启动 $minutes 分钟定时器';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return '在 $count $label后睡眠';
  }

  @override
  String get addMoreTime => '添加时间';

  @override
  String get cancelTimer => '取消定时器';

  @override
  String chaptersLeftCount(int count) {
    return '剩余 $count 章';
  }

  @override
  String get sectionDownloadsAndStorage => '下载与存储';

  @override
  String get downloadOverWifiOnly => '仅在 Wi-Fi 下下载';

  @override
  String get downloadOverWifiOnSubtitle => '开启 - 禁止使用移动数据下载';

  @override
  String get downloadOverWifiOffSubtitle => '关闭 - 任何网络均可下载';

  @override
  String get autoDownloadOnWifi => 'Wi-Fi 下自动下载';

  @override
  String get autoDownloadOnWifiInfoTitle => 'Wi-Fi 下自动下载';

  @override
  String get autoDownloadOnWifiInfoContent =>
      '当您开始在线播放书籍时，系统会在后台同步下载完整内容，无需手动操作即可实现离线收听。后台下载将严格遵循上方的“下载网络设置”，若您希望在移动网络下也能自动下载，请将其设置为“任意网络”。';

  @override
  String get autoDownloadOnWifiOnSubtitle => '在 Wi-Fi 下开始流式播放时，书籍将在后台下载';

  @override
  String get autoDownloadOnWifiOffSubtitle => '关闭';

  @override
  String get concurrentDownloads => '同时下载数';

  @override
  String get autoDownload => '自动下载';

  @override
  String get autoDownloadSubtitle => '在系列或播客详情页单独启用';

  @override
  String get autoDownloadEnabledFor => '已为以下内容开启';

  @override
  String get autoDownloadEnabledForNone => '暂无';

  @override
  String get autoDownloadSourceUnnamed => '尚未加载';

  @override
  String get keepNext => '保留接下来';

  @override
  String get keepNextInfoTitle => '保留接下来';

  @override
  String get keepNextInfoContent =>
      '要保留下载的项目数量，包括你当前正在收听的项目。例如，\"保留接下来3个\"意味着当前书籍加上系列或播客中的下2本将保持下载状态。';

  @override
  String get deleteAbsorbedDownloads => '删除已完成的下载';

  @override
  String get deleteAbsorbedDownloadsInfoTitle => '删除已完成的下载';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      '启用后，在 Absorb 中听完的已下载书籍或剧集会自动从此设备删除。如果你在网页端或其他设备上听完，保存在此设备上的下载不会被删除。';

  @override
  String get deleteAbsorbedOnSubtitle => '已完成项目将被移除以节省空间';

  @override
  String get deleteAbsorbedOffSubtitle => '关闭 - 保留已完成的下载';

  @override
  String get downloadLocation => '下载位置';

  @override
  String get storageUsed => '已用存储';

  @override
  String storageUsedByDownloads(String size) {
    return '下载已使用 $size';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return '总计 $total，可用 $free';
  }

  @override
  String get manageDownloads => '管理下载';

  @override
  String get streamingCache => '流式缓存';

  @override
  String get streamingCacheInfoTitle => '流式缓存';

  @override
  String get streamingCacheInfoContent =>
      '将流式播放的音频缓存到磁盘，以便在快退或重复收听时无需重新下载。缓存会自动管理 - 达到大小限制时，最旧的文件会被移除。这与完全下载的书籍是分开的';

  @override
  String get streamingCacheOff => '关闭';

  @override
  String get streamingCacheOffSubtitle => '关闭 - 音频直接流式播放，不缓存';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size MB - 最近流式播放的音频将缓存到磁盘';
  }

  @override
  String get clearCache => '清除缓存';

  @override
  String get streamingCacheCleared => '流式缓存已清除';

  @override
  String get sectionLibrary => '媒体库';

  @override
  String get hideEbookOnlyTitles => '隐藏仅含电子书的标题';

  @override
  String get hideEbookOnlyOnSubtitle => '隐藏没有音频文件的书籍';

  @override
  String get hideEbookOnlyOffSubtitle => '关 - 显示所有媒体库项目';

  @override
  String get homeCardsOpenDetails => '从首页打开详情';

  @override
  String get homeCardsOpenDetailsOnSubtitle => '点按“继续收听”或“继续阅读”卡片会打开其详情';

  @override
  String get homeCardsOpenDetailsOffSubtitle => '点按“继续收听”或“继续阅读”卡片会从上次停止的位置继续';

  @override
  String get showGoodreadsButton => '显示 Goodreads 按钮';

  @override
  String get showGoodreadsOnSubtitle => '书籍详情页显示 Goodreads 的链接';

  @override
  String get showGoodreadsOffSubtitle => '关 - 隐藏 Goodreads 按钮';

  @override
  String get sectionPermissions => '权限';

  @override
  String get notifications => '通知';

  @override
  String get notificationsSubtitle => '用于下载进度和播放控制';

  @override
  String get notificationsAlreadyEnabled => '通知权限已启用';

  @override
  String get unrestrictedBattery => '无限制电池权限';

  @override
  String get unrestrictedBatterySubtitle => '防止 Android 终止后台播放';

  @override
  String get batteryAlreadyUnrestricted => '电池优化已关闭';

  @override
  String get sectionIssuesAndSupport => '问题与支持';

  @override
  String get bugsAndFeatureRequests => '错误报告与功能请求';

  @override
  String get bugsAndFeatureRequestsSubtitle => '在 GitHub 上提交问题';

  @override
  String get joinDiscord => '加入 Discord';

  @override
  String get joinDiscordSubtitle => '社区、支持与更新';

  @override
  String get contact => '联系我们';

  @override
  String get contactSubtitle => '通过邮件发送设备信息';

  @override
  String get enableLogging => '启用日志记录';

  @override
  String get enableLoggingOnSubtitle => '开启 - 日志保存到文件（重启生效）';

  @override
  String get enableLoggingOffSubtitle => '关闭 - 不捕获日志';

  @override
  String get loggingEnabledSnackbar => '日志记录已启用 - 重启应用以开始捕获';

  @override
  String get loggingDisabledSnackbar => '日志记录已禁用 - 重启应用以停止捕获';

  @override
  String get sendLogs => '发送日志';

  @override
  String get sendLogsSubtitle => '以附件形式分享日志文件';

  @override
  String failedToShare(String error) {
    return '分享失败: $error';
  }

  @override
  String get clearLogs => '清除日志';

  @override
  String get logsCleared => '日志已清除';

  @override
  String get clearLogsQuestion => '清除日志？';

  @override
  String get clearLogsContent => '此操作无法撤销。如果可能需要，请先发送日志。';

  @override
  String get sectionAdvanced => '高级';

  @override
  String get localServer => '本地服务器';

  @override
  String get localServerInfoTitle => '本地服务器';

  @override
  String get localServerInfoContent =>
      '如果你在家运行 Audiobookshelf 服务器，可以在此设置本地/局域网 URL。Absorb 在检测到您处于家庭网络时会自动切换到更快的本地连接，而在外出时则回退到远程 URL。';

  @override
  String get localServerOnConnectedSubtitle => '已通过本地服务器连接';

  @override
  String get localServerOnRemoteSubtitle => '已启用 - 正在使用远程服务器';

  @override
  String get localServerOffSubtitle => '在家庭 Wi-Fi 下自动切换到局域网服务器';

  @override
  String get localServerUrlLabel => '本地服务器 URL';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar => '本地服务器 URL 已设置 - 当处于家庭网络时将自动连接';

  @override
  String get disableAudioFocus => '禁用音频焦点';

  @override
  String get disableAudioFocusInfoTitle => '音频焦点';

  @override
  String get disableAudioFocusInfoContent =>
      '默认情况下，Android 一次只给一个应用音频“焦点” - 当 Absorb 播放时，其他音频（音乐、视频）会暂停。禁用音频焦点可让 Absorb 与其他应用同时播放。无论此设置如何，来电时始终会暂停播放。';

  @override
  String get disableAudioFocusOnSubtitle => '开启 - 与其他音频同时播放（来电时仍会暂停）';

  @override
  String get disableAudioFocusOffSubtitle => '关闭 - Absorb 播放时其他音频暂停';

  @override
  String get restartRequired => '需要重启';

  @override
  String get restartRequiredContent => '音频焦点更改需要完全重启应用才能生效。立即关闭应用？';

  @override
  String get closeApp => '关闭应用';

  @override
  String get trustAllCertificates => '信任所有证书';

  @override
  String get trustAllCertificatesInfoTitle => '自签名证书';

  @override
  String get mp3IndexSeeking => 'MP3 索引跳转';

  @override
  String get mp3IndexSeekingInfoTitle => 'MP3 索引跳转';

  @override
  String get mp3IndexSeekingInfoContent =>
      '仅当你的 MP3 文件无法跳转到正确位置时才开启。跳转不准通常来自可变比特率（VBR）的 MP3。索引跳转会在读取文件时建立精确的时间映射，因此跳转到大型 MP3 的末尾附近可能需要一点时间，在流式播放时尤其如此，因为必须先读取到该位置。将在下次开始播放书籍或播客单集时生效。';

  @override
  String get mp3IndexSeekingOnSubtitle => '开启：对 VBR MP3 文件精确跳转';

  @override
  String get mp3IndexSeekingOffSubtitle => '关闭：普通跳转';

  @override
  String get trustAllCertificatesInfoContent =>
      '如果你的 Audiobookshelf 服务器使用自签名证书或自定义根 CA，请启用此选项。启用后，Absorb 将跳过所有连接的 TLS 证书验证。仅在您信任当前网络环境时启用。';

  @override
  String get trustAllCertificatesOnSubtitle => '开启 - 接受所有证书';

  @override
  String get trustAllCertificatesOffSubtitle => '关闭 - 仅接受受信任的证书';

  @override
  String get supportTheDev => '支持开发者';

  @override
  String get buyMeACoffee => '请我喝杯咖啡';

  @override
  String appVersionFormat(String version) {
    return 'Absorb v$version';
  }

  @override
  String betaLabel(int number) {
    return '测试版 $number';
  }

  @override
  String appVersionWithServerFormat(String version, String serverVersion) {
    return 'Absorb v$version  -  服务器 $serverVersion';
  }

  @override
  String get backupAndRestore => '备份与恢复';

  @override
  String get backupAndRestoreSubtitle => '将所有设置保存到文件或从文件恢复';

  @override
  String get backUp => '备份';

  @override
  String get restore => '恢复';

  @override
  String get allBookmarks => '所有书签';

  @override
  String get allBookmarksSubtitle => '查看所有书籍的书签';

  @override
  String get switchAccount => '切换账户';

  @override
  String get addAccount => '添加账户';

  @override
  String get logOut => '退出登录';

  @override
  String get includeLoginInfoTitle => '包含登录信息？';

  @override
  String get includeLoginInfoContent =>
      '你是否希望在备份中包含所有已保存账号的登录凭据？\n\n这会让在新设备上恢复变得容易，但文件中将包含您的身份验证令牌。';

  @override
  String get noSettingsOnly => '否，仅设置';

  @override
  String get yesIncludeAccounts => '是，包含账户';

  @override
  String get backupSavedWithAccounts => '备份已保存（包含账户）';

  @override
  String get backupSavedSettingsOnly => '备份已保存（仅设置）';

  @override
  String backupFailed(String error) {
    return '备份失败: $error';
  }

  @override
  String get restoreBackupTitle => '恢复备份？';

  @override
  String get restoreBackupContent => '这将用备份中的值替换您当前的所有设置。';

  @override
  String fromAbsorbVersion(String version) {
    return '来自 Absorb v$version';
  }

  @override
  String restoreAccountsChip(int count) {
    return '$count 个账户';
  }

  @override
  String restoreBookmarksChip(int count) {
    return '$count 本书的书签';
  }

  @override
  String get restoreCustomHeadersChip => '自定义请求头';

  @override
  String get invalidBackupFile => '无效的备份文件';

  @override
  String get settingsRestoredSuccessfully => '设置恢复成功';

  @override
  String restoreFailed(String error) {
    return '恢复失败: $error';
  }

  @override
  String get logOutTitle => '退出登录？';

  @override
  String get logOutContent => '这将使你退出登录。你的下载内容将保留在本设备上。';

  @override
  String get signOut => '退出登录';

  @override
  String get changePasswordTitle => '修改密码';

  @override
  String get changePasswordSubtitle => '安全地更新你的 Audiobookshelf 密码';

  @override
  String get currentPassword => '当前密码';

  @override
  String get newPassword => '新密码';

  @override
  String get confirmNewPassword => '确认新密码';

  @override
  String get passwordChangeEffect =>
      '修改密码会让你在其他设备上的 Audiobookshelf 会话退出登录。此设备保持登录状态。';

  @override
  String get passwordFieldsRequired => '请填写所有密码字段';

  @override
  String get passwordsDoNotMatch => '两次输入的新密码不一致';

  @override
  String get passwordChanged => '密码已修改。其他已登录的设备已断开连接。';

  @override
  String get passwordInvalid => '当前密码不正确';

  @override
  String get passwordChangeUnsupported => '此服务器版本不支持在 Absorb 中安全修改密码';

  @override
  String get passwordChangeFailed => '无法修改密码';

  @override
  String get otherUserPasswordResetWarning => '修改此密码会让该用户在所有设备上退出登录。';

  @override
  String get manageSessionsTitle => '已登录的设备';

  @override
  String get manageSessionsSubtitle => '查看并移除 Audiobookshelf 会话';

  @override
  String get sessionsCurrent => '当前设备';

  @override
  String get sessionsUnknownDevice => '未知设备';

  @override
  String sessionsLastActive(String date) {
    return '最后活跃于 $date';
  }

  @override
  String get sessionsNone => '没有活跃的会话';

  @override
  String get sessionsLoadMore => '加载更多';

  @override
  String get sessionsUnsupported => '会话管理需要 Audiobookshelf 2.36 或更高版本。';

  @override
  String get sessionsLoadFailed => '无法加载已登录的设备';

  @override
  String get sessionsLegacyNotice => '此登录没有刷新会话，因此 Absorb 无法在列表中识别此设备。';

  @override
  String get sessionsRemove => '让设备退出登录';

  @override
  String get sessionsRemoveTitle => '让此设备退出登录？';

  @override
  String get sessionsRemoveContent => '这将移除它的刷新会话。在其短期令牌过期之前，它当前的访问权限可能仍然有效。';

  @override
  String get sessionsRemoved => '设备已退出登录';

  @override
  String get sessionsRemoveFailed => '无法让该设备退出登录';

  @override
  String get sessionsSignOutAll => '让所有设备退出登录';

  @override
  String get sessionsSignOutAllTitle => '在所有设备上退出登录？';

  @override
  String get sessionsSignOutAllContent => '这将移除所有刷新会话，包括此设备。现有的访问令牌在过期前可能仍然有效。';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return '计划使用服务器时间（$timeZone）';
  }

  @override
  String get podcastScheduleServerTimeUnknown => '计划使用服务器时间';

  @override
  String get editServerAddressTitle => '编辑服务器地址';

  @override
  String editServerAddressSubtitle(String username) {
    return '更新 $username 的地址。如果你的服务器地址变了，请使用此功能：它仍是同一台服务器，只是 URL 不同。你的统计和下载会保留。';
  }

  @override
  String get editServerAddressField => '服务器地址';

  @override
  String get editServerAddressUpdated => '服务器地址已更新';

  @override
  String get editServerAddressFailed => '无法更新服务器地址';

  @override
  String get editServerAddressAction => '编辑服务器地址';

  @override
  String get editServerConnectionTitle => '编辑服务器连接';

  @override
  String editServerConnectionSubtitle(String username) {
    return '更新 $username 的服务器地址和自定义请求头。你的统计和下载会保留。';
  }

  @override
  String get editServerConnectionAction => '编辑服务器连接';

  @override
  String get editServerConnectionUpdated => '服务器连接已更新';

  @override
  String get editServerConnectionFailed => '无法更新服务器连接';

  @override
  String get editCustomHeadersDescription =>
      '用于 Cloudflare 隧道或反向代理。这些请求头仅适用于此已保存的账户。';

  @override
  String get removeAccountAction => '移除账户';

  @override
  String get removeAccountTitle => '移除账户？';

  @override
  String removeAccountContent(String username, String server) {
    return '从已保存账户中移除 $server 上的 $username？\n\n您可以稍后通过重新登录来再次添加。';
  }

  @override
  String get switchAccountTitle => '切换账户？';

  @override
  String switchAccountContent(String username, String server) {
    return '切换到 $server 上的 $username？\n\n你当前的播放将停止，应用将重新加载另一个账户的数据。';
  }

  @override
  String get switchButton => '切换';

  @override
  String get downloadLocationSheetTitle => '下载位置';

  @override
  String get downloadLocationSheetSubtitle => '选择有声读物的保存位置';

  @override
  String get currentLocation => '当前位置';

  @override
  String get existingDownloadsWarning => '现有的下载内容会保留在其当前位置。只有新的下载内容才会使用新路径。';

  @override
  String get chooseFolder => '选择文件夹';

  @override
  String get chooseDownloadFolder => '选择下载文件夹';

  @override
  String get storagePermissionDenied => '存储权限已被永久拒绝 - 请在应用设置中启用';

  @override
  String get openSettings => '打开设置';

  @override
  String get storagePermissionRequired => '自定义下载位置需要存储权限';

  @override
  String get cannotWriteToFolder => '无法写入该文件夹 - 请选择其他位置或在系统设置中授予文件访问权限';

  @override
  String downloadLocationSetTo(String label) {
    return '下载位置已设置为 $label';
  }

  @override
  String get resetToDefault => '重置为默认';

  @override
  String get resetToDefaultStorage => '重置为默认存储';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 个下载位于已无法打开的旧自定义文件夹中。请重新下载，或关闭此提示。',
      one: '有 1 个下载位于已无法打开的旧自定义文件夹中。请重新下载，或关闭此提示。',
    );
    return '$_temp0';
  }

  @override
  String get redownload => '重新下载';

  @override
  String get redownloadStarted => '正在重新下载';

  @override
  String get dismiss => '关闭';

  @override
  String get tipsAndHiddenFeatures => '技巧与隐藏功能';

  @override
  String get tipsSubtitle => '充分利用 Absorb';

  @override
  String get adminTitle => '服务器管理';

  @override
  String get adminTasksTitle => '服务器活动';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个任务正在运行',
      one: '1 个任务正在运行',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => '最近的服务器活动';

  @override
  String get adminTasksEmpty => '没有正在运行的服务器任务';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return '新增 $added - 更新 $updated - 缺失 $missing';
  }

  @override
  String get adminServer => '服务器';

  @override
  String get adminVersion => '版本';

  @override
  String get adminUsers => '用户';

  @override
  String get adminOnline => '在线';

  @override
  String get adminBackup => '备份';

  @override
  String get adminPurgeCache => '清除缓存';

  @override
  String get adminManage => '管理';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return '$userCount 个账户 - $onlineCount 人在线';
  }

  @override
  String get adminPodcasts => '播客';

  @override
  String get adminPodcastsSubtitle => '搜索、添加和管理节目';

  @override
  String get adminScan => '扫描';

  @override
  String get adminScanning => '正在扫描...';

  @override
  String get adminMatchAll => '匹配全部';

  @override
  String get adminMatching => '正在匹配...';

  @override
  String get adminMatchAllTitle => '匹配所有项目？';

  @override
  String adminMatchAllContent(String name) {
    return '为 $name 中的所有项目匹配元数据？这可能需要一些时间。';
  }

  @override
  String adminScanStarted(String name) {
    return '已开始扫描 $name';
  }

  @override
  String get adminBackupCreated => '备份已创建';

  @override
  String get adminBackupFailed => '备份失败';

  @override
  String get adminCachePurged => '缓存已清除';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => '在应用中打开';

  @override
  String get adminRmabAdd => '添加 ReadMeABook 集成';

  @override
  String get adminRmabUrlTitle => 'ReadMeABook URL';

  @override
  String get adminRmabUrlHelp => '粘贴包含登录令牌的 URL。在 RMAB 的管理 -> 用户中生成。';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => '请输入有效的 http(s) URL';

  @override
  String get adminRmabSaved => '已保存 ReadMeABook';

  @override
  String get adminRmabRemoved => '已移除 ReadMeABook';

  @override
  String get adminRmabReload => '重新加载';

  @override
  String get adminRmabLoadFailed => '无法加载 ReadMeABook，请检查 URL。';

  @override
  String get adminRmabConnected => '已连接';

  @override
  String get adminRmabAskAdmin => '请向您的服务器管理员获取登录 URL';

  @override
  String get adminRmabUrlHelpUser =>
      '请向您的服务器管理员获取登录 URL，管理员可在 RMAB 的管理 -> 用户中生成。';

  @override
  String get adminRmabSettingsInfo =>
      'ReadMeABook 是一个用于请求和下载有声书的自托管服务，需要由您的服务器管理员安装和设置。';

  @override
  String get rmabConfigTitle => '连接 ReadMeABook';

  @override
  String get rmabConfigExplainerAdmin =>
      'ReadMeABook 是一项用于请求有声书的自托管服务。请在 RMAB 的“Admin Dashboard > Settings > API”下生成 API 令牌，然后在下方粘贴服务器 URL 和令牌。Absorb 不托管也不下载任何内容，只是向你的服务器发送请求。';

  @override
  String get rmabConfigExplainerUser =>
      'ReadMeABook 是一项用于请求有声书的自托管服务。请向服务器管理员索取 RMAB 的 URL 和 API 令牌。Absorb 不托管也不下载任何内容，只是向你的服务器发送请求。';

  @override
  String get rmabConfigLearnMore => '了解更多关于 ReadMeABook 的信息';

  @override
  String get rmabConfigBaseUrlLabel => 'RMAB 服务器 URL';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.example.com';

  @override
  String get rmabConfigTokenLabel => 'API 令牌';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel => '网页界面登录 URL（可选）';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      '粘贴你的自动登录 URL，这样“在浏览器视图中打开”时会直接处于已登录状态。留空则使用常规登录。';

  @override
  String get rmabConfigHeadersHelp =>
      '随每个 ReadMeABook 请求发送的额外请求头，适用于 Cloudflare Access 等反向代理。';

  @override
  String get rmabConfigConnect => '连接';

  @override
  String get rmabConfigDisconnect => '断开连接';

  @override
  String get rmabConfigOpenWebView => '在浏览器视图中打开';

  @override
  String rmabConfigConnectedAs(String name) {
    return '已连接为 $name';
  }

  @override
  String get rmabConfigErrorInvalidUrl => '请输入有效的 http(s) URL';

  @override
  String get rmabConfigErrorMissingToken => '请输入你的 API 令牌';

  @override
  String get rmabConfigErrorUnauthorized => '令牌被服务器拒绝';

  @override
  String get rmabConfigErrorForbidden => '此令牌无权执行该操作';

  @override
  String get rmabConfigErrorNetwork => '无法连接 RMAB。请检查 URL。';

  @override
  String get rmabConfigErrorGeneric => '无法连接';

  @override
  String get rmabConfigSavedSnackbar => 'ReadMeABook 已连接';

  @override
  String get rmabConfigDisconnectedSnackbar => 'ReadMeABook 已断开连接';

  @override
  String get rmabRequestCta => '通过 ReadMeABook 请求';

  @override
  String get rmabSearchHeader => '通过 ReadMeABook 请求';

  @override
  String get rmabSearchHint => '按书名或作者搜索';

  @override
  String get rmabSearchEmpty => '你的 ReadMeABook 服务器上没有匹配项';

  @override
  String get rmabSearchError => '无法搜索 ReadMeABook';

  @override
  String get rmabSearchPrompt => '输入书名或作者进行搜索';

  @override
  String get rmabSearchFooterPrompt => '在找别的内容？';

  @override
  String rmabSearchFooterCta(String query) {
    return '在 ReadMeABook 中搜索“$query”';
  }

  @override
  String get rmabBookDetailExplainer =>
      '此请求将通过你的 ReadMeABook 服务器发送，由管理员审核并处理。你可以在 ReadMeABook 磁贴的“我的请求”下跟踪它。';

  @override
  String get rmabBookAlreadyAvailable => '已在你的媒体库中';

  @override
  String get rmabBookAlreadyRequested => '已请求';

  @override
  String get rmabRequestSubmitting => '正在提交…';

  @override
  String get rmabRequestSent => '请求已发送';

  @override
  String get rmabRequestErrorAlreadyAvailable => '已在你的媒体库中';

  @override
  String get rmabRequestErrorBeingProcessed => '已在处理中';

  @override
  String get rmabRequestErrorDuplicate => '你已请求过此书';

  @override
  String get rmabRequestErrorValidation => '无法发送请求';

  @override
  String get rmabRequestErrorUserNotFound => '令牌对应的用户已不存在。请重新连接 ReadMeABook。';

  @override
  String get rmabRequestErrorIgnored => '此书在你的忽略列表中';

  @override
  String get rmabRequestErrorGeneric => '无法发送请求';

  @override
  String get rmabRequestErrorTokenRejected => '令牌被服务器拒绝。请重新连接 ReadMeABook。';

  @override
  String get rmabMyRequestsTab => '我的请求';

  @override
  String get rmabSetupTab => '设置';

  @override
  String get rmabMyRequestsEmpty => '你还没有请求过任何书籍';

  @override
  String get rmabMyRequestsError => '无法加载请求';

  @override
  String get rmabMyRequestsRefresh => '刷新';

  @override
  String get rmabRequestDetailTitle => '请求详情';

  @override
  String get rmabRequestDetailStatus => '状态';

  @override
  String get rmabRequestDetailRequestedOn => '请求时间';

  @override
  String get rmabRequestDetailCompletedOn => '完成时间';

  @override
  String get rmabRequestDetailProgress => '进度';

  @override
  String get rmabStatusActive => '进行中';

  @override
  String get rmabStatusWaiting => '等待中';

  @override
  String get rmabStatusAvailable => '可用';

  @override
  String get rmabStatusDownloaded => '已下载';

  @override
  String get rmabStatusFailed => '失败';

  @override
  String get rmabStatusCancelled => '已取消';

  @override
  String get rmabStatusDenied => '已拒绝';

  @override
  String get rmabStatusUnknown => '未知';

  @override
  String narratedBy(String narrator) {
    return '朗读者: $narrator';
  }

  @override
  String get onAudible => '在 Audible 上';

  @override
  String percentComplete(String percent) {
    return '已完成 $percent%';
  }

  @override
  String get absorbing => '收听中...';

  @override
  String get absorbAgain => '重新收听';

  @override
  String get absorb => '收听';

  @override
  String get ebookOnlyNoAudio => '仅电子书 - 无音频';

  @override
  String get absorbAudioNotDownloaded => '音频未下载';

  @override
  String get absorbAudioNotDownloadedEbookOnly => '音频未下载，仅电子书';

  @override
  String get fullyAbsorbed => '已完成';

  @override
  String get fullyAbsorbAction => '标记为已完成';

  @override
  String get removeFromAbsorbing => '从收听中移除';

  @override
  String get addToAbsorbing => '添加到收听中';

  @override
  String get absorbNext => '下一个收听';

  @override
  String get absorbNextAdded => '已加入“正在收听”的接下来';

  @override
  String get absorbLast => '最后收听';

  @override
  String get absorbNextHint => '紧接在当前播放的内容之后';

  @override
  String get absorbLastHint => '放在列表末尾';

  @override
  String get removedFromAbsorbing => '已从收听中移除';

  @override
  String get addedToAbsorbing => '已添加到收听中';

  @override
  String get removeFromContinueListening => '移出继续收听';

  @override
  String get removedFromContinueListening => '已从“继续收听”中移出';

  @override
  String get removeFromContinueReading => '从“继续阅读”中移除';

  @override
  String get removedFromContinueReading => '已从“继续阅读”中移除';

  @override
  String get sessionAdd => '添加会话';

  @override
  String get sessionStartLabel => '开始于';

  @override
  String get sessionAdded => '会话已添加';

  @override
  String get sessionAddFailed => '无法添加会话';

  @override
  String get removeSeriesFromContinueSeries => '从“继续系列”中移除';

  @override
  String get removedSeriesFromContinueSeries => '已从“继续系列”中移除';

  @override
  String get couldNotUpdate => '无法更新，请重试';

  @override
  String get addToPlaylist => '添加到播放列表';

  @override
  String get addToCollection => '添加到收藏集';

  @override
  String get downloadEbook => '下载电子书';

  @override
  String get downloadEbookAgain => '重新下载电子书';

  @override
  String get resetProgress => '重置进度';

  @override
  String get lookupLocalMetadata => '查找本地元数据';

  @override
  String get reLookupLocalMetadata => '重新查找本地元数据';

  @override
  String get clearLocalMetadata => '清除本地元数据';

  @override
  String get searchOnGoodreads => '在 Goodreads 上搜索';

  @override
  String get editServerDetails => '编辑服务器详情';

  @override
  String get encodeTab => '编码';

  @override
  String get codec => '编解码器';

  @override
  String get bitrate => '比特率';

  @override
  String get channels => '声道';

  @override
  String get mono => '单声道';

  @override
  String get stereo => '立体声';

  @override
  String get startM4bEncode => '开始 M4B 编码';

  @override
  String get encodeStarted => 'M4B 编码已开始';

  @override
  String get encodeFailed => '无法开始编码';

  @override
  String get encodeFinished => 'M4B 编码已完成';

  @override
  String get currentlyLabel => '当前：';

  @override
  String encodeOutputPathNote(String path) {
    return '完成的 M4B 将放入你的有声书文件夹：$path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return '原始音频文件的备份将存放在：/metadata/cache/items/$itemId/。请务必定期清理项目缓存。';
  }

  @override
  String get encodeTimeNote => '编码最长可能需要 30 分钟。';

  @override
  String get encodeRescanNote => '如果你关闭了监视器，之后需要重新扫描这本有声书。';

  @override
  String get aboutSection => '关于';

  @override
  String chaptersCount(int count) {
    return '章节 ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return '音轨（$count）';
  }

  @override
  String libraryFilesCount(int count) {
    return '媒体库文件（$count）';
  }

  @override
  String get chapters => '章节';

  @override
  String get noChaptersBook => '这本书没有章节';

  @override
  String get noChaptersPodcast => '这个播客没有章节';

  @override
  String get failedToLoad => '加载失败';

  @override
  String startedDate(String date) {
    return '开始于 $date';
  }

  @override
  String finishedDate(String date) {
    return '完成于 $date';
  }

  @override
  String andCountMore(int count) {
    return '还有 $count 个';
  }

  @override
  String get markAsFullyAbsorbedQuestion => '标记为已完成？';

  @override
  String get markAsFullyAbsorbedContent => '这将把你的进度设置为100%，如果这本书正在播放则停止播放。';

  @override
  String get markedAsFinishedNiceWork => '已标记为完成 - 干得漂亮！';

  @override
  String get failedToUpdateCheckConnection => '更新失败 - 请检查您的网络连接';

  @override
  String get markAsNotFinishedQuestion => '标记为未完成？';

  @override
  String get markAsNotFinishedContent => '这将清除完成状态，但保留你当前的位置。';

  @override
  String get unmark => '取消标记';

  @override
  String get markedAsNotFinishedBackAtIt => '已标记为未完成 - 继续加油！';

  @override
  String get resetProgressQuestion => '重置进度？';

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
  String get progressResetFreshStart => '进度已重置 - 全新开始！';

  @override
  String get clearLocalMetadataQuestion => '清除本地元数据？';

  @override
  String get clearLocalMetadataContent => '这将删除本地存储的元数据并恢复为服务器上的内容。';

  @override
  String get localMetadataCleared => '本地元数据已清除';

  @override
  String get saveEbook => '保存电子书';

  @override
  String get noEbookFileFound => '未找到电子书文件';

  @override
  String get bookmark => '书签';

  @override
  String get bookmarks => '书签';

  @override
  String bookmarksWithCount(int count) {
    return '书签 ($count)';
  }

  @override
  String get playbackSpeed => '播放速度';

  @override
  String get noBookmarksYet => '暂无书签';

  @override
  String get longPressBookmarkHint => '长按书签按钮快速保存';

  @override
  String get addBookmark => '添加书签';

  @override
  String get editBookmark => '编辑书签';

  @override
  String get titleLabel => '标题';

  @override
  String get noteOptionalLabel => '备注（可选）';

  @override
  String get editLayout => '编辑布局';

  @override
  String get inMenu => '在菜单中';

  @override
  String get bookmarkAdded => '已添加书签';

  @override
  String get startPlayingSomethingFirst => '请先开始播放内容';

  @override
  String get playbackHistory => '播放历史';

  @override
  String get historyLocalTab => '历史';

  @override
  String get historyServerTab => '会话';

  @override
  String get historyNoServerSessions => '此项目暂无服务器会话';

  @override
  String get historyServerLoadFailed => '无法加载服务器会话';

  @override
  String get clearHistoryTooltip => '清除历史';

  @override
  String get tapEventToJump => '点击事件跳转到对应位置';

  @override
  String get noHistoryYet => '暂无历史';

  @override
  String jumpedToPosition(String position) {
    return '已跳转到 $position';
  }

  @override
  String booksInSeriesCount(int count) {
    return '本系列共 $count 本书';
  }

  @override
  String bookNumber(String number) {
    return '第 $number 本';
  }

  @override
  String downloadRemainingCount(int count) {
    return '剩余下载 ($count)';
  }

  @override
  String get downloadAll => '全部下载';

  @override
  String get markAllNotFinished => '全部标记为未完成';

  @override
  String get markAllFinished => '全部标记为已完成';

  @override
  String get markAllNotFinishedQuestion => '全部标记为未完成？';

  @override
  String get fullyAbsorbSeries => '将系列全部标记为已完成？';

  @override
  String get turnAutoDownloadOff => '关闭自动下载';

  @override
  String get turnAutoDownloadOn => '开启自动下载';

  @override
  String get autoDownloadThisSeries => '自动下载此系列？';

  @override
  String get autoDownloadSeriesContent => '边听边自动下载后续书籍。';

  @override
  String get standalone => '独立';

  @override
  String get episodes => '剧集';

  @override
  String get noEpisodesFound => '未找到剧集';

  @override
  String get markFinished => '标记为完成';

  @override
  String get markUnfinished => '标记为未完成';

  @override
  String get allEpisodes => '全部剧集';

  @override
  String get aboutThisEpisode => '关于本集';

  @override
  String get reversePlayOrder => '倒序播放';

  @override
  String selectedCount(int count) {
    return '已选择 $count 项';
  }

  @override
  String get selectAll => '全选';

  @override
  String get deselectAll => '取消全选';

  @override
  String get autoDownloadThisPodcast => '自动下载此播客？';

  @override
  String get autoDownloadPodcastContent => '边听边自动下载后续剧集。';

  @override
  String get download => '下载';

  @override
  String get deleteDownload => '删除下载';

  @override
  String get casting => '投屏';

  @override
  String get castingTo => '正在投屏到';

  @override
  String get editDetails => '编辑详情';

  @override
  String get quickMatch => '快速匹配';

  @override
  String get quickMatchNoUpdates => '无需更新';

  @override
  String get custom => '自定义';

  @override
  String get authorOptionalLabel => '作者（可选）';

  @override
  String get noResultsFound => '未找到结果。\n请调整搜索条件或提供商。';

  @override
  String get searchForMetadataAbove => '搜索上方的元数据';

  @override
  String get applyThisMatch => '应用此匹配？';

  @override
  String get metadataUpdated => '元数据已更新';

  @override
  String get failedToUpdateMetadata => '元数据更新失败';

  @override
  String get subtitleLabel => '副标题';

  @override
  String get authorLabel => '作者';

  @override
  String get narratorLabel => '朗读者';

  @override
  String get seriesLabel => '系列';

  @override
  String get addSeries => 'Add series';

  @override
  String get removeSeries => 'Remove series';

  @override
  String get descriptionLabel => '描述';

  @override
  String get publisherLabel => '出版商';

  @override
  String get yearLabel => '年份';

  @override
  String get genresLabel => '分类';

  @override
  String get tagsLabel => '标签';

  @override
  String get commaSeparated => '逗号分隔';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => '封面图片';

  @override
  String get coverRemove => '移除封面';

  @override
  String get coverRemoveConfirm => '移除这本书的封面？将改为显示自动生成的标题卡片。';

  @override
  String get coverRemoved => '封面已移除';

  @override
  String get coverRemoveFailed => '无法移除封面';

  @override
  String get coverUrlLabel => '封面 URL';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => '本地元数据';

  @override
  String get overrideLocalDisplay => '覆盖本地显示';

  @override
  String get metadataSavedLocally => '元数据已本地保存';

  @override
  String get notes => '笔记';

  @override
  String get newNote => '新建笔记';

  @override
  String get editNote => '编辑笔记';

  @override
  String get noNotesYet => '暂无笔记';

  @override
  String get markdownIsSupported => '支持 Markdown';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => '保留完整格式';

  @override
  String get plainTextTxt => '纯文本 (.txt)';

  @override
  String get simpleTextNoFormatting => '简单文本，无格式';

  @override
  String get untitledNote => '无标题笔记';

  @override
  String get titleHint => '标题';

  @override
  String get noteBodyHint => '写下你的笔记...（支持 Markdown）';

  @override
  String get nothingToPreview => '暂无预览内容';

  @override
  String get audioEnhancements => '音频增强';

  @override
  String get presets => '预设';

  @override
  String get equalizer => '均衡器';

  @override
  String get effects => '效果';

  @override
  String get bassBoost => '低音增强';

  @override
  String get surround => '环绕声';

  @override
  String get loudness => '响度';

  @override
  String get monoAudio => '单声道音频';

  @override
  String get skipSilence => 'Skip Silence';

  @override
  String get resetAll => '全部重置';

  @override
  String get collectionNotFound => '未找到收藏集';

  @override
  String get deleteCollection => '删除收藏集';

  @override
  String get deleteCollectionContent => '你确定要删除此收藏集吗？';

  @override
  String get deleteCollectionFailed => '无法删除合集';

  @override
  String get deletePermissionRequired => '需要删除权限。请让 root 管理员授予你删除权限。';

  @override
  String get deleteFilesCheckbox => '同时删除服务器上的文件';

  @override
  String get deleteFilesCheckedHint => '文件将从服务器上永久删除。';

  @override
  String get deleteFilesUncheckedHint => '文件会保留在服务器上，因此下次扫描媒体库时可能会重新添加。';

  @override
  String get deleteFromServerAction => '从服务器删除';

  @override
  String get deleteFromServerTitle => '从服务器删除';

  @override
  String deleteFromServerContent(String title) {
    return '从 Audiobookshelf 中删除“$title”？';
  }

  @override
  String deletedFromServer(String title) {
    return '已删除“$title”';
  }

  @override
  String get deleteFromServerFailed => '无法删除。请查看服务器日志。';

  @override
  String get playlistNotFound => '未找到播放列表';

  @override
  String get deletePlaylist => '删除播放列表';

  @override
  String get deletePlaylistContent => '你确定要删除此播放列表吗？';

  @override
  String get newPlaylist => '新建播放列表';

  @override
  String get playlistNameHint => '播放列表名称';

  @override
  String addedToName(String name) {
    return '已添加到 \"$name\"';
  }

  @override
  String get failedToAdd => '添加失败';

  @override
  String get newCollection => '新建收藏集';

  @override
  String get collectionNameHint => '收藏集名称';

  @override
  String get listsNewCollectionSubtitle => '把书籍归入你保留的列表';

  @override
  String get listsNewCollectionNeedsBookSubtitle => '至少先放入一本书';

  @override
  String get listsNewPlaylistSubtitle => '排好书籍，按顺序收听';

  @override
  String get listsAddBooksNow => '立即添加书籍';

  @override
  String get listsPickBooksNext => '接下来你将选择书籍。此服务器上的合集至少需要一本书。';

  @override
  String get listsCreate => '创建';

  @override
  String get listsCollectionNeedsBook => '合集至少需要一本书，因此未创建任何内容。';

  @override
  String get listsCreateFailed => '无法创建';

  @override
  String get castToDevice => '投屏到设备';

  @override
  String get searchingForCastDevices => '正在搜索投屏设备...';

  @override
  String get castDevice => '投屏设备';

  @override
  String get stopCasting => '停止投屏';

  @override
  String get disconnect => '断开连接';

  @override
  String get audioOutput => '音频输出';

  @override
  String get noOutputDevicesFound => '未找到输出设备';

  @override
  String get welcomeToAbsorb => '欢迎使用 Absorb';

  @override
  String get welcomeTagline => '一个 Audiobookshelf 客户端。';

  @override
  String get welcomeAbsorbingTitle => '正在收听';

  @override
  String get welcomeAbsorbingIntro => '我们用 \"absorb\" 代替 \"播放\" 和 \"收听\"。';

  @override
  String get welcomeAbsorbingTabBullet => '正在收听标签页 - 你当前正在收听的内容';

  @override
  String get welcomeAbsorbButtonBullet => 'Absorb 按钮 - 开始播放';

  @override
  String get welcomeFullyAbsorbBullet => 'Fully Absorb - 标记为已完成';

  @override
  String get welcomeGettingAroundTitle => '界面操作';

  @override
  String get welcomeGettingAroundBody =>
      '点击任意封面打开详情。继续收听卡片不一样 - 点击立即播放，长按打开详情。';

  @override
  String get welcomeMakeItYoursTitle => '个性化设置';

  @override
  String get welcomeMakeItYoursBody =>
      '在设置中自定义 Absorb 以符合你的喜好。其中的「技巧与隐藏功能」区块值得一看。';

  @override
  String get getStarted => '开始使用';

  @override
  String get showMore => '显示更多';

  @override
  String get showLess => '显示更少';

  @override
  String get readMore => '阅读更多';

  @override
  String get removeDownloadQuestion => '移除下载？';

  @override
  String get removeDownloadContent => '这将从你的设备中移除。';

  @override
  String get removeWhichDownload => '有声书和电子书都在此设备上。请选择要移除的内容。';

  @override
  String get downloadRemoved => '下载已移除';

  @override
  String get finished => '已完成';

  @override
  String get saved => '已保存';

  @override
  String get selectLibrary => '选择媒体库';

  @override
  String get switchLibraryTooltip => '切换媒体库';

  @override
  String get refreshTooltip => '刷新';

  @override
  String get noBooksFound => '未找到书籍';

  @override
  String get userFallback => '用户';

  @override
  String get rootAdmin => '超级管理员';

  @override
  String get admin => '管理员';

  @override
  String get serverAdmin => '服务器管理员';

  @override
  String get serverAdminSubtitle => '管理用户、媒体库和服务器设置';

  @override
  String serverUpdateAvailable(String version) {
    return '服务器有可用更新 $version';
  }

  @override
  String get justNow => '刚刚';

  @override
  String minutesAgo(int count) {
    return '$count 分钟前';
  }

  @override
  String hoursAgo(int count) {
    return '$count 小时前';
  }

  @override
  String daysAgo(int count) {
    return '$count 天前';
  }

  @override
  String get audible => 'Audible';

  @override
  String get iTunes => 'iTunes';

  @override
  String get openLibrary => '打开媒体库';

  @override
  String get root => 'Root';

  @override
  String get coverPlayPause => '点击封面播放/暂停';

  @override
  String get coverPlayPauseOnSubtitle => '开启 - 点击封面播放/暂停';

  @override
  String get coverPlayPauseOffSubtitle => '关闭 - 使用控制栏中的播放/暂停按钮';

  @override
  String get cardBackground => '卡片背景';

  @override
  String get cardBackgroundBlurred => '模糊';

  @override
  String get cardBackgroundGradient => '渐变';

  @override
  String get queueModeMergedSubtitle => '可选择停止播放、手动队列，或自动播放下一项';

  @override
  String get queueModeSeriesLabel => '系列';

  @override
  String get queueModeShowLabel => '显示';

  @override
  String get queueModeInfoSeries => '系列';

  @override
  String get queueModeInfoSeriesDesc => '自动播放同系列的下一本书，或播客节目的下一集。';

  @override
  String get resetButtonGridQuestion => '确认重置按钮布局？';

  @override
  String get resetButtonGridContent => '这将恢复默认的按钮布局、顺序和开关设置。';

  @override
  String get reset => '重置';

  @override
  String get buttonGridReset => '按钮网格已重置';

  @override
  String get resetButtonGrid => '重置按钮布局';

  @override
  String get chapterBarrierOnRewind => '后退时的章节屏障';

  @override
  String get chapterBarrierInfoTitle => '章节屏障';

  @override
  String get chapterBarrierInfoContent =>
      '向后跳转时，播放会回到当前章节的开头，而不是跨入上一章。\n\n在 2 秒内双击后退按钮即可突破屏障。';

  @override
  String get chapterBarrierOnRewindOnSubtitle => '开启：后退会回到章节开头';

  @override
  String get chapterBarrierOnRewindOffSubtitle => '关闭：后退可跨越章节边界';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return '开启：根据暂停时长回退 $min 至 $max 秒';
  }

  @override
  String get rewindOnSessionStart => '会话开始时回退';

  @override
  String get rewindOnSessionStartInfoContent =>
      '普通的自动回退会在你于活跃会话中暂停后恢复播放时触发。此设置会在开始全新会话时额外回退，例如应用被关闭、播放被停止，或你重新打开应用之后。\n\n开启后，每次新会话开始时都会按最大回退量回退，让你可以重听上次停下的地方。';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return '开启：开始新会话时回退 $seconds 秒';
  }

  @override
  String rewindActivationDelayValue(String seconds) {
    return '$seconds 秒以上';
  }

  @override
  String rewindRangeValue(String min, String max) {
    return '$min 秒 – $max 秒';
  }

  @override
  String rewindSecondsPause(String seconds) {
    return '暂停 $seconds 秒';
  }

  @override
  String rewindMinPause(String minutes) {
    return '暂停 $minutes 分钟';
  }

  @override
  String rewindHrPause(String hours) {
    return '暂停 $hours 小时';
  }

  @override
  String get rewindOneHrPause => '暂停 1 小时';

  @override
  String speedValue(String speed) {
    return '${speed}x';
  }

  @override
  String secondsValue(String seconds) {
    return '$seconds 秒';
  }

  @override
  String minutesValue(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String get chimeBeforeSleep => '睡前提示音';

  @override
  String get chimeBeforeSleepOnSubtitle => '在定时器即将结束时播放轻柔的提示铃声';

  @override
  String get chimeBeforeSleepOffSubtitle => '睡前无提示音';

  @override
  String get windDownDuration => '渐弱时长';

  @override
  String windDownDurationSubtitle(int seconds) {
    return '定时结束$seconds 秒前开始淡出并提示';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return '在最后 $seconds 秒内逐渐降低音量';
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
  String get endOfChapterShort => '章节结束';

  @override
  String get endOfChapterOnSubtitle => '在当前章节结束时停止播放';

  @override
  String get endOfChapterOffSubtitle => '使用睡眠定时器';

  @override
  String get showExplicitBadge => '显示敏感内容标记';

  @override
  String get showExplicitBadgeOnSubtitle => '敏感内容会显示 “E” 标记';

  @override
  String get showExplicitBadgeOffSubtitle => '关闭 - 隐藏敏感内容标记';

  @override
  String get showEbookBadge => '显示电子书徽章';

  @override
  String get showEbookBadgeOnSubtitle => '带电子书的书籍会在封面上显示书本图标';

  @override
  String get showEbookBadgeOffSubtitle => '关闭：电子书徽章已隐藏';

  @override
  String get libraryFallback => '媒体库';

  @override
  String get preReleaseUpdatesInfoTitle => '预发布更新';

  @override
  String get preReleaseUpdatesInfoContent =>
      '开启后，更新检查器还会通知你 GitHub 上的 alpha 和预发布版本。这些版本可能不够稳定，但包含最新的功能和修复。';

  @override
  String get includePreReleases => '包含预发布版本';

  @override
  String get includePreReleasesOnSubtitle => '开启：正在检查 alpha 和预发布版本';

  @override
  String get includePreReleasesOffSubtitle => '关闭：仅限稳定版本';

  @override
  String get setTooltip => '设置';

  @override
  String get saveAbsorbBackup => '保存 Absorb 备份';

  @override
  String get checkForUpdate => '检查更新';

  @override
  String get onLatestVersion => '你使用的已是最新版本';

  @override
  String get updateAvailable => '有可用更新';

  @override
  String get preReleaseAvailable => '有可用的预发布版本';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'Absorb 有新的$kind可用：$latest\n\n你当前使用的是 $current。';
  }

  @override
  String get updateKindPreRelease => '预发布版';

  @override
  String get updateKindVersion => '版本';

  @override
  String get downloadButton => '下载';

  @override
  String get updateDownloading => '正在下载更新...';

  @override
  String get updateInstallPermissionDenied =>
      '安装权限被拒绝。请在系统设置中为 Absorb 启用“安装未知应用”。';

  @override
  String get updateOpeningInBrowser => '应用内更新失败，正在打开浏览器';

  @override
  String get sendToEreader => '发送到电子阅读器';

  @override
  String sendingToEreader(String device) {
    return '正在发送到 $device...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return '已发送到 $device';
  }

  @override
  String get sendToEreaderFailed => '无法发送电子书';

  @override
  String get pickEreaderDevice => '选择设备';

  @override
  String get adminEmail => '电子邮件';

  @override
  String get adminEmailSubtitle => 'SMTP 和电子阅读器设备';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => '设置指南';

  @override
  String get smtpHost => '主机';

  @override
  String get smtpPort => '端口';

  @override
  String get smtpSecure => '安全连接';

  @override
  String get smtpRejectUnauthorized => '拒绝未经授权的 TLS';

  @override
  String get smtpUser => '用户名';

  @override
  String get smtpPass => '密码';

  @override
  String get smtpFromAddress => '发件地址';

  @override
  String get smtpTestAddress => '测试地址';

  @override
  String get smtpSendTest => '发送测试';

  @override
  String get smtpSaveSettings => '保存';

  @override
  String get smtpSaved => '邮件设置已保存';

  @override
  String get smtpSaveFailed => '无法保存邮件设置';

  @override
  String get smtpTestSent => '测试邮件已发送';

  @override
  String get smtpTestFailed => '测试邮件发送失败';

  @override
  String get ereaderDevicesTitle => '电子阅读器设备';

  @override
  String get ereaderDevicesEmpty => '还没有设备。请在下方添加。';

  @override
  String get addEreaderDevice => '添加设备';

  @override
  String get editEreaderDevice => '编辑设备';

  @override
  String get deleteEreaderDevice => '删除';

  @override
  String get ereaderDeviceName => '名称';

  @override
  String get ereaderDeviceEmail => '电子邮件';

  @override
  String get ereaderAvailability => '谁可以使用此设备';

  @override
  String get ereaderAvailAdminOrUp => '仅管理员';

  @override
  String get ereaderAvailUserOrUp => '所有用户';

  @override
  String get ereaderAvailGuestOrUp => '所有人';

  @override
  String get ereaderAvailSpecificUsers => '指定用户';

  @override
  String ereaderSpecificUsersN(int count) {
    return '指定用户（$count）';
  }

  @override
  String get ereaderDevicesSaved => '设备已保存';

  @override
  String get ereaderDevicesSaveFailed => '无法保存设备';

  @override
  String libraryCountOne(int count) {
    return '$count 个媒体库';
  }

  @override
  String libraryCountOther(int count) {
    return '$count 个媒体库';
  }

  @override
  String serverVersionLabel(String version) {
    return '服务器 $version';
  }

  @override
  String appVersionServerSuffix(String version) {
    return '  ·  服务器 $version';
  }

  @override
  String backupDateFormat(int month, int day, int year) {
    return '$year/$month/$day';
  }

  @override
  String get backupDetailsSeparator => ' · ';

  @override
  String get bookmarksSortedByPositionReversed => '按位置排序（倒序）';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '“$title”，位于 $position';
  }

  @override
  String get deleteBookmarkQuestion => '删除书签？';

  @override
  String get cardIconsOnlyChip => '仅图标';

  @override
  String get cardMoreInGridChip => '更多';

  @override
  String get cardLayoutHidden => '已隐藏';

  @override
  String get speed => '速度';

  @override
  String get details => '详情';

  @override
  String get episodeDetailsLabel => '单集详情';

  @override
  String get bookDetailsLabel => '书籍详情';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => '音频增强';

  @override
  String get cast => '投放';

  @override
  String castingToDevice(String device) {
    return '正在投放到 $device';
  }

  @override
  String castToDeviceNamed(String device) {
    return '投放到 $device';
  }

  @override
  String get historyShort => '历史';

  @override
  String atPosition(String position) {
    return '位于 $position';
  }

  @override
  String chaptersChip(int count) {
    return '$count 个章节';
  }

  @override
  String chapterNumber(int number) {
    return '第 $number 章';
  }

  @override
  String kbpsValue(int value) {
    return '$value kbps';
  }

  @override
  String get fileInfoTitle => '文件信息';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件',
      one: '1 个文件',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => '这本书没有文件详情。';

  @override
  String get fileInfoAudio => '音频';

  @override
  String get fileInfoEbook => '电子书';

  @override
  String get fileInfoOther => '其他文件';

  @override
  String get fileInfoBookOrbitNote => 'BookOrbit 不报告编解码器或比特率。';

  @override
  String fileInfoChannels(int count) {
    return '$count 个声道';
  }

  @override
  String get fileInfoCover => '封面';

  @override
  String get fileInfoMetadata => '元数据';

  @override
  String get fileInfoSupplement => '附加';

  @override
  String get fileInfoPathCopied => '路径已复制';

  @override
  String get resetMayNotHaveSynced => '重置可能尚未同步，请检查你的服务器';

  @override
  String failedToDownloadEbook(int code) {
    return '电子书下载失败（$code）';
  }

  @override
  String get serverReturnedErrorPage => '服务器返回了错误页面，而不是电子书文件';

  @override
  String ebookSaved(String filename) {
    return '已保存：$filename';
  }

  @override
  String errorSavingEbook(String error) {
    return '保存电子书时出错：$error';
  }

  @override
  String failedToSaveError(String error) {
    return '保存失败：$error';
  }

  @override
  String get adminBackupsLabel => '备份';

  @override
  String get adminListeningNow => '正在收听';

  @override
  String get adminLibraries => '媒体库';

  @override
  String get adminLibraryShows => '节目';

  @override
  String get adminLibraryBooks => '书籍';

  @override
  String get adminLibraryFolders => '文件夹';

  @override
  String get adminLibrarySize => '大小';

  @override
  String get adminLibraryDuration => '时长';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个缺失或无效的项目',
      one: '1 个缺失或无效的项目',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => '查看';

  @override
  String get adminMissingTitle => '缺失的项目';

  @override
  String adminMissingSubtitle(String library) {
    return '$library 中文件缺失或无法读取的条目';
  }

  @override
  String get adminMissingNone => '没有缺失或无效的项目';

  @override
  String get adminMissingBadge => '缺失';

  @override
  String get adminInvalidBadge => '无效';

  @override
  String get adminMissingDeleteTitle => '移除条目';

  @override
  String adminMissingDeleteOneContent(String title) {
    return '从 Audiobookshelf 中移除“$title”？';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return '从 Audiobookshelf 中移除 $count 个条目？';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return '删除 $count 个';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return '已移除 $title';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已移除 $count 个条目',
      one: '已移除 1 个条目',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => '无法删除条目';

  @override
  String get adminMatchAction => '匹配';

  @override
  String adminMatchingStarted(String name) {
    return '已开始匹配 $name';
  }

  @override
  String get adminMatchFailed => '失败';

  @override
  String adminScanFailed(String name) {
    return '无法扫描 $name';
  }

  @override
  String get adminPurgeCacheFailed => '失败';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => '管理员';

  @override
  String get adminUsersDisabledBadge => '已禁用';

  @override
  String get adminUsersEditUserTooltip => '编辑用户';

  @override
  String get adminUsersOnlineNow => '当前在线';

  @override
  String adminUsersLastSeen(String time) {
    return '最后上线 $time';
  }

  @override
  String get adminUsersNever => '从未';

  @override
  String get adminUsersTotal => '总计';

  @override
  String get adminUsersNoReadingActivity => '没有阅读活动';

  @override
  String get adminUsersLoadingDots => '加载中...';

  @override
  String get adminUsersLoadMoreSessions => '加载更多会话';

  @override
  String get adminUsersNoRecentSessions => '没有最近的会话';

  @override
  String get adminUsersLibraryProgress => '媒体库进度';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return '加载更多（剩余 $count）';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return '$count 个月前';
  }

  @override
  String get adminUsersNewUser => '新用户';

  @override
  String get adminUsersEditUser => '编辑用户';

  @override
  String get adminUsersUsername => '用户名';

  @override
  String get adminUsersEnterUsername => '输入用户名';

  @override
  String get adminUsersPassword => '密码';

  @override
  String get adminUsersNewPassword => '新密码';

  @override
  String get adminUsersEnterPassword => '输入密码';

  @override
  String get adminUsersLeaveBlankToKeep => '留空则保持当前密码';

  @override
  String get adminUsersAccountType => '账户类型';

  @override
  String get adminUsersTypeGuest => '访客';

  @override
  String get adminUsersTypeUser => '用户';

  @override
  String get adminUsersTypeAdmin => '管理员';

  @override
  String get adminUsersStatus => '状态';

  @override
  String get adminUsersAccountActive => '账户已启用';

  @override
  String get adminUsersAccountActiveSub => '已禁用的账户无法登录';

  @override
  String get adminUsersLocked => '已锁定';

  @override
  String get adminUsersLockedSub => '禁止修改密码';

  @override
  String get adminUsersPermissions => '权限';

  @override
  String get adminUsersPermDownload => '下载';

  @override
  String get adminUsersPermUpdate => '更新';

  @override
  String get adminUsersPermUpdateSub => '编辑元数据和媒体库项目';

  @override
  String get adminUsersPermDelete => '删除';

  @override
  String get adminUsersPermUpload => '上传';

  @override
  String get adminUsersPermExplicit => '不宜内容';

  @override
  String get adminUsersLibraryAccess => '媒体库访问权限';

  @override
  String get adminUsersAccessAllLibraries => '访问所有媒体库';

  @override
  String get adminUsersCreateUser => '创建用户';

  @override
  String get adminUsersSaveChanges => '保存更改';

  @override
  String get adminUsersUsernameRequired => '必须填写用户名';

  @override
  String get adminUsersPasswordRequired => '必须填写密码';

  @override
  String get adminUsersUserCreated => '用户已创建';

  @override
  String get adminUsersUserUpdated => '用户已更新';

  @override
  String get adminUsersFailedCreate => '无法创建用户';

  @override
  String get adminUsersFailedUpdate => '无法更新用户';

  @override
  String get adminUsersThisUser => '此用户';

  @override
  String get adminUsersDeleteUserTitle => '删除用户？';

  @override
  String adminUsersDeleteUserContent(String name) {
    return '永久删除 $name？';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return '已删除 $name';
  }

  @override
  String get adminUsersFailedDelete => '无法删除用户';

  @override
  String get adminUsersUnlinkOpenId => '取消关联 OpenID';

  @override
  String get adminUsersUnlinkOpenIdTitle => '取消关联 OpenID？';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return '移除 $name 的 OpenID 关联？对方需要再次使用 OpenID 登录才能重新关联。';
  }

  @override
  String get adminUsersOpenIdUnlinked => '已取消关联 OpenID';

  @override
  String get adminUsersFailedUnlinkOpenId => '无法取消关联 OpenID';

  @override
  String adminUsersByAuthor(String author) {
    return '作者：$author';
  }

  @override
  String get adminUsersListened => '已收听';

  @override
  String get adminUsersStartedAtPosition => '开始位置';

  @override
  String get adminUsersEndedAtPosition => '结束位置';

  @override
  String get adminUsersTotalDuration => '总时长';

  @override
  String get adminUsersStarted => '开始时间';

  @override
  String get adminUsersUpdated => '更新时间';

  @override
  String get adminUsersClient => '客户端';

  @override
  String get adminUsersDevice => '设备';

  @override
  String get adminUsersOs => '操作系统';

  @override
  String get adminUsersPlayMethod => '播放方式';

  @override
  String get adminUsersPlayDirect => '直接播放';

  @override
  String get adminUsersPlayDirectStream => '直接串流';

  @override
  String get adminUsersPlayTranscode => '转码';

  @override
  String get adminUsersPlayLocal => '本地';

  @override
  String get adminPodcastsCheckNewEpisodesTitle => '检查新单集';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      '这将检查所有播客的 RSS 源，并下载找到的新单集（如果已启用自动下载）。';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle => '扫描 RSS 源并下载新单集';

  @override
  String get adminPodcastsCheck => '检查';

  @override
  String get adminPodcastsCheckingForNew => '正在检查新单集…';

  @override
  String get adminPodcastsCheckingForNewDots => '正在检查新单集...';

  @override
  String get adminPodcastsFailedCheckEpisodes => '无法检查单集';

  @override
  String get adminPodcastsCheckFeedsTooltip => '检查源中的新单集';

  @override
  String get adminPodcastsNoPodcastsYet => '还没有播客';

  @override
  String get adminPodcastsTapPlusHint => '点按 + 搜索并添加节目';

  @override
  String adminPodcastsEpisodesCount(int count) {
    return '$count 个单集';
  }

  @override
  String get adminPodcastsAddPodcast => '添加播客';

  @override
  String get adminPodcastsCouldNotFindFeed => '找不到播客源';

  @override
  String get adminPodcastsSearchHint => '搜索播客…';

  @override
  String get adminPodcastsSearchItunesHint => '搜索 iTunes...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return '在 iTunes 中搜索“$query”';
  }

  @override
  String get adminPodcastsNoPodcastsFound => '未找到播客';

  @override
  String get adminPodcastsRelToday => '今天';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return '$count 周前';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return '$count 个月前';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return '$count 年前';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return '更新于 $when';
  }

  @override
  String get adminPodcastsGenreAll => '全部';

  @override
  String get adminPodcastsGenreArts => '艺术';

  @override
  String get adminPodcastsGenreComedy => '喜剧';

  @override
  String get adminPodcastsGenreEducation => '教育';

  @override
  String get adminPodcastsGenreTvFilm => '电视和电影';

  @override
  String get adminPodcastsGenreMusic => '音乐';

  @override
  String get adminPodcastsGenreNews => '新闻';

  @override
  String get adminPodcastsGenreReligion => '宗教';

  @override
  String get adminPodcastsGenreScience => '科学';

  @override
  String get adminPodcastsGenreSports => '体育';

  @override
  String get adminPodcastsGenreTechnology => '科技';

  @override
  String get adminPodcastsGenreBusiness => '商业';

  @override
  String get adminPodcastsGenreFiction => '小说';

  @override
  String get adminPodcastsGenreSocietyCulture => '社会与文化';

  @override
  String get adminPodcastsGenreHealthFitness => '健康与健身';

  @override
  String get adminPodcastsGenreTrueCrime => '真实犯罪';

  @override
  String get adminPodcastsGenreHistory => '历史';

  @override
  String get adminPodcastsGenreKidsFamily => '儿童与家庭';

  @override
  String get adminPodcastsPodcastFallback => '播客';

  @override
  String get adminPodcastsEpisodeFallback => '单集';

  @override
  String get adminPodcastsNoFeedFound => '未找到源 URL';

  @override
  String get adminPodcastsNoFeedAvailable => '没有可用的源 URL';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return '$title 已添加到媒体库';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return '无法添加 $title';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    return '源中有 $count 个单集';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    return '另有 $count 个单集';
  }

  @override
  String get adminPodcastsAdding => '正在添加…';

  @override
  String get adminPodcastsAddToLibrary => '添加到媒体库';

  @override
  String get adminPodcastsRemoveShowTitle => '移除节目？';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return '从服务器移除“$title”及其所有单集？此操作无法撤销。';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return '已移除“$title”';
  }

  @override
  String get adminPodcastsFailedRemoveShow => '无法移除节目';

  @override
  String get adminPodcastsRemoveShowTooltip => '移除节目';

  @override
  String get adminPodcastsSelectMultipleTooltip => '多选';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return '已下载 $count 个';
  }

  @override
  String get adminPodcastsTabDownloaded => '已下载';

  @override
  String get adminPodcastsTabFeed => '源';

  @override
  String get adminPodcastsTabSettings => '设置';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return '正在下载“$title”';
  }

  @override
  String get adminPodcastsFailedDownload => '下载失败';

  @override
  String get adminPodcastsDeleteEpisodeTitle => '删除单集？';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return '删除“$title”？';
  }

  @override
  String get adminPodcastsDeleted => '已删除';

  @override
  String get adminPodcastsFailed => '失败';

  @override
  String get adminPodcastsDeleteEpisodesTitle => '删除单集？';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return '从服务器删除 $count 个单集？';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return '已删除 $count 个单集';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload => '浏览源以下载';

  @override
  String get adminPodcastsDownloadingDots => '下载中...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return '删除 $count 个单集';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return '正在下载 $count 个单集';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return '下载 $count 个单集';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter => '查找此日期之后的单集';

  @override
  String get adminPodcastsSelectDate => '选择日期';

  @override
  String get adminPodcastsMaxEpisodes => '最多下载的单集数';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return '在 $date 之后没有找到新单集';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return '找到 $count 个新单集，正在下载';
  }

  @override
  String get adminPodcastsFailedToCheckNew => '无法检查新单集';

  @override
  String get adminPodcastsCheckAndDownload => '检查并下载';

  @override
  String get adminPodcastsMatchPodcast => '匹配播客';

  @override
  String get adminPodcastsMatchPodcastSubtitle => '搜索 iTunes 以更新封面和元数据';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes => '自动下载新单集';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle => '服务器会自动下载新单集';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle => '新单集不会自动下载';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate => '无法更新自动下载设置';

  @override
  String get adminPodcastsMaxEpisodesToKeep => '最多保留的单集数';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      '0 表示保留所有单集。自动下载新单集后，如果节目超出此上限，Audiobookshelf 会移除最旧的单集。';

  @override
  String get adminPodcastsNoEpisodeLimit => '无限制';

  @override
  String get adminPodcastsEpisodeLimitInvalid => '请输入 0 或一个整数';

  @override
  String get adminPodcastsCheckSchedule => '检查计划';

  @override
  String get adminPodcastsFrequency => '频率';

  @override
  String get adminPodcastsFreqHourly => '每小时';

  @override
  String get adminPodcastsFreqDaily => '每天';

  @override
  String get adminPodcastsFreqWeekly => '每周';

  @override
  String get adminPodcastsDay => '日';

  @override
  String get adminPodcastsTime => '时间';

  @override
  String get adminPodcastsDaySun => '周日';

  @override
  String get adminPodcastsDayMon => '周一';

  @override
  String get adminPodcastsDayTue => '周二';

  @override
  String get adminPodcastsDayWed => '周三';

  @override
  String get adminPodcastsDayThu => '周四';

  @override
  String get adminPodcastsDayFri => '周五';

  @override
  String get adminPodcastsDaySat => '周六';

  @override
  String get adminPodcastsFeedUrl => '源 URL';

  @override
  String get adminPodcastsBack => '返回';

  @override
  String get adminPodcastsRootOnly => '仅限 Root';

  @override
  String get adminPodcastsDeleting => '正在删除...';

  @override
  String get adminPodcastsDeleteEpisode => '删除单集';

  @override
  String adminPodcastsSeasonChip(String season) {
    return '第 $season 季';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return '第 $number 集';
  }

  @override
  String get adminPodcastsApplyingMatch => '正在应用匹配...';

  @override
  String get adminPodcastsNoResults => '无结果';

  @override
  String get adminPodcastsPodcastMatched => '播客已匹配并更新';

  @override
  String get adminPodcastsFailedMatch => '无法匹配播客';

  @override
  String get adminPodcastsSelectAll => '全选';

  @override
  String get adminPodcastsSelectAllNew => '仅新增';

  @override
  String get adminPodcastsSortNewestFirst => '最新优先';

  @override
  String get adminPodcastsSortOldestFirst => '最早优先';

  @override
  String get adminPodcastsEditInfo => '编辑信息';

  @override
  String get adminPodcastsEditInfoSubtitle => '更改标题、描述、封面等';

  @override
  String get adminPodcastsEditTitle => '编辑播客';

  @override
  String get adminPodcastsReleaseDate => '发布日期';

  @override
  String get adminPodcastsExplicit => '含不宜内容';

  @override
  String get adminPodcastsExplicitSubtitle => '将此播客标记为含不宜内容';

  @override
  String get episodeListEpisodeFallback => '单集';

  @override
  String get episodeListUnknownPodcast => '未知播客';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个单集已标记为听完',
      one: '1 个单集已标记为听完',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个单集已标记为未听完',
      one: '1 个单集已标记为未听完',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes => '取消订阅新单集';

  @override
  String get episodeListSubscribeToNewEpisodes => '订阅新单集';

  @override
  String get episodeListSubscribeTitle => '订阅此播客？';

  @override
  String get episodeListSubscribeContent => '新单集出现在服务器上时，将自动下载并添加到你的收听队列。';

  @override
  String get episodeListSubscribe => '订阅';

  @override
  String get episodeListShowFinishedEpisodes => '显示已听完的单集';

  @override
  String get episodeListHideFinishedEpisodes => '隐藏已听完的单集';

  @override
  String get episodeListShowSettings => '节目设置';

  @override
  String get episodeListPlaysNewerToOlder => '按从新到旧的顺序播放单集';

  @override
  String get episodeListPlaysOlderToNewer => '按从旧到新的顺序播放单集';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个单集',
      one: '1 个单集',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个未听完',
      one: '1 个未听完',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => '自动下载';

  @override
  String get episodeListSubscribedChip => '已订阅';

  @override
  String get episodeListExplicitChip => '含不宜内容';

  @override
  String get episodeListSortNewest => '最新';

  @override
  String get episodeListSortOldest => '最早';

  @override
  String get episodeListSortBy => '单集排序';

  @override
  String get episodeListSortPubDate => '发布日期';

  @override
  String get episodeListSortTitle => '标题';

  @override
  String get episodeListSortSeason => '季';

  @override
  String get episodeListSortEpisode => '集数';

  @override
  String get episodeListSortFileName => '文件名';

  @override
  String get episodeListSortReverseHint => '再次点按可反转顺序';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return '已将“$title”添加到“正在收听”';
  }

  @override
  String get episodeDetailEpisodeFallback => '单集';

  @override
  String get episodeDetailMarkedNotFinished => '已标记为未听完';

  @override
  String get episodeDetailMarkedFinishedNice => '已标记为听完，不错！';

  @override
  String get episodeDetailMarkAbsorbedContent => '这会将此单集的进度设为 100%。';

  @override
  String get episodeDetailResetProgressContent => '这会清除此单集的所有进度并回到开头。此操作无法撤销。';

  @override
  String get episodeDetailToday => '今天';

  @override
  String get episodeDetailYesterday => '昨天';

  @override
  String episodeDetailDaysAgo(int count) {
    return '$count 天前';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return '$count 周前';
  }

  @override
  String episodeDetailDurationHm(int hours, int minutes) {
    return '$hours 小时 $minutes 分';
  }

  @override
  String episodeDetailDurationM(int minutes) {
    return '$minutes 分';
  }

  @override
  String get episodeDetailResume => '继续';

  @override
  String get episodeDetailPlayEpisode => '播放单集';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return '第 $number 集';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return '第 $number 季';
  }

  @override
  String get editMetadataUpdatedFromMatch => '已根据匹配结果更新元数据';

  @override
  String editMetadataConfirmMatch(String title) {
    return '这将使用以下内容更新这本书在服务器上的元数据：\n\n“$title”\n\n所有字段和封面都将在服务器上被覆盖。';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return '这将使用以下内容更新这本书在服务器上的元数据：\n\n“$title”，作者：$author\n\n所有字段和封面都将在服务器上被覆盖。';
  }

  @override
  String get seriesBooksFindMissingTitle => '扫描缺失书籍';

  @override
  String get seriesBooksFindMissingContent =>
      '此功能将检索 Audible以查找该系列中你的媒体库可能缺失的书籍。\n\n系统会优先通过 ASIN 进行匹配（取决于你的服务器中书籍是否包含 ASIN），若无则通过书名进行匹配。搜索结果可能不会完全准确。';

  @override
  String get seriesBooksCouldNotFindOnAudible => '在 Audible 上找不到此系列';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '这将清除此系列中全部 $count 本书的听完状态。',
      one: '这将清除此系列中这 1 本书的听完状态。',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '这会将此系列中的全部 $count 本书标记为听完。',
      one: '这会将此系列中的这 1 本书标记为听完。',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => '全部取消标记';

  @override
  String get seriesBooksShowAllBooks => '显示所有书籍';

  @override
  String get seriesBooksGroupBySubSeries => '按子系列分组';

  @override
  String get seriesBooksLoadingSubSeries => '正在加载子系列...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 本书',
      one: '1 本书',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => '完成';

  @override
  String get seriesBooksExplicitBadge => 'E';

  @override
  String get expandedCardStreaming => '串流播放';

  @override
  String get expandedCardDeviceFallback => '设备';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$bookTitle 中的 $position';
  }

  @override
  String get bookmarksScreenClose => '关闭';

  @override
  String get bookmarksScreenSortNewest => '最新';

  @override
  String get bookmarksScreenSortPosition => '位置';

  @override
  String statsScreenStreakDays(int count) {
    return '$count 天';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count 次会话';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count 次会话';
  }

  @override
  String get statsScreenDayMon => '周一';

  @override
  String get statsScreenDayTue => '周二';

  @override
  String get statsScreenDayWed => '周三';

  @override
  String get statsScreenDayThu => '周四';

  @override
  String get statsScreenDayFri => '周五';

  @override
  String get statsScreenDaySat => '周六';

  @override
  String get statsScreenDaySun => '周日';

  @override
  String statsScreenDurationHm(int h, int m) {
    return '$h 小时 $m 分';
  }

  @override
  String statsScreenDurationM(int m) {
    return '$m 分';
  }

  @override
  String get statsScreenDurationLessThanMin => '<1 分';

  @override
  String get statsScreenDurationZero => '0 分';

  @override
  String statsScreenDurationShortH(int h) {
    return '$h 小时';
  }

  @override
  String statsScreenDurationShortM(int m) {
    return '$m 分';
  }

  @override
  String get statsScreenCouldNotLoadItem => '无法加载项目';

  @override
  String get statsScreenCouldNotFindEpisode => '找不到单集';

  @override
  String statsScreenByAuthor(String author) {
    return '作者：$author';
  }

  @override
  String get statsScreenListened => '已收听';

  @override
  String get sessionEditTitle => '编辑会话';

  @override
  String get sessionDayLabel => '日期';

  @override
  String get sessionEndPosition => '结束位置';

  @override
  String get sessionEndPositionHint => '更改此项也可能会更新你当前的进度。';

  @override
  String get statsViewSessions => '查看会话';

  @override
  String statsSessionsForDate(String date) {
    return '$date 的会话';
  }

  @override
  String get statsNoSessionsForDate => '这一天没有找到收听会话';

  @override
  String get statsSearchSessions => '搜索会话';

  @override
  String get statsNoSessionSearchResults => '没有符合搜索条件的会话';

  @override
  String get statsSessionsLoadFailed => '无法加载这一天的会话';

  @override
  String get sessionDeleteConfirmTitle => '删除会话？';

  @override
  String get sessionDeleteConfirmBody => '这将移除该会话，并按其时长减少你的收听总时间。此操作无法撤销。';

  @override
  String get sessionSaved => '会话已更新';

  @override
  String get sessionDeleted => '会话已删除';

  @override
  String get sessionSaveFailed => '无法保存更改';

  @override
  String get sessionDeleteFailed => '无法删除此会话';

  @override
  String get statsScreenStartedAtPosition => '开始位置';

  @override
  String get statsScreenEndedAtPosition => '结束位置';

  @override
  String get statsScreenTotalDuration => '总时长';

  @override
  String get statsScreenStarted => '开始时间';

  @override
  String get statsScreenUpdated => '更新时间';

  @override
  String get statsScreenClient => '客户端';

  @override
  String get statsScreenDevice => '设备';

  @override
  String get statsScreenOs => '操作系统';

  @override
  String get statsScreenPlayMethod => '播放方式';

  @override
  String get statsScreenLoading => '加载中...';

  @override
  String get statsScreenJumpToStart => '跳到开始处';

  @override
  String get statsScreenJumpToEnd => '跳到结束处';

  @override
  String get statsScreenPlayMethodDirect => '直接播放';

  @override
  String get statsScreenPlayMethodDirectStream => '直接串流';

  @override
  String get statsScreenPlayMethodTranscode => '转码';

  @override
  String get statsScreenPlayMethodLocal => '本地';

  @override
  String get statsScreenAmLabel => '上午';

  @override
  String get statsScreenPmLabel => '下午';

  @override
  String statsScreenDateAtTime(
    String month,
    int day,
    int year,
    int hour,
    String minute,
    String ampm,
  ) {
    return '$year年$month$day日 $ampm$hour:$minute';
  }

  @override
  String get statsScreenMonthJan => '1月';

  @override
  String get statsScreenMonthFeb => '2月';

  @override
  String get statsScreenMonthMar => '3月';

  @override
  String get statsScreenMonthApr => '4月';

  @override
  String get statsScreenMonthMay => '5月';

  @override
  String get statsScreenMonthJun => '6月';

  @override
  String get statsScreenMonthJul => '7月';

  @override
  String get statsScreenMonthAug => '8月';

  @override
  String get statsScreenMonthSep => '9月';

  @override
  String get statsScreenMonthOct => '10月';

  @override
  String get statsScreenMonthNov => '11月';

  @override
  String get statsScreenMonthDec => '12月';

  @override
  String get upcomingReleasesTitle => '即将上架';

  @override
  String get upcomingReleasesRescanTitle => '重新扫描？';

  @override
  String upcomingReleasesRescanContent(int days) {
    return '这些结果是 $days 天前获取的。发布日期可能已发生变更——是否需要重新扫描？';
  }

  @override
  String get upcomingReleasesNotNow => '稍后再说';

  @override
  String get upcomingReleasesRescan => '重新扫描';

  @override
  String get upcomingReleasesRescanReleaseDate => '重新扫描发布日期';

  @override
  String get upcomingReleasesRescanning => '正在重新扫描...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return '更新于 $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound => '未找到发布日期';

  @override
  String get upcomingReleasesRescanFailed => '重新扫描失败';

  @override
  String get upcomingReleasesRemoveFromList => '从列表中移除';

  @override
  String get upcomingReleasesRemovedFromList => '已从列表中移除';

  @override
  String get upcomingReleasesDateChip => '发布日期';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return '正在获取 $name... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => '系列加载中...';

  @override
  String get upcomingReleasesScannedToday => '(今天已扫描)';

  @override
  String get upcomingReleasesScannedYesterday => '(昨天已扫描)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '(扫描于 $days 天前)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return '$count 个即将发布';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return '$count 个最近更新';
  }

  @override
  String get upcomingReleasesNoneFound => '未找到即将推出或最近更新的内容';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$summary共 $count 个系列';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return '已扫描 Audible 上的 $count 个系列';
  }

  @override
  String upcomingReleasesDateFormat(String month, int day, int year) {
    return '$year-$month-$day';
  }

  @override
  String upcomingReleasesSequenceLabel(String sequence) {
    return '#$sequence';
  }

  @override
  String get upcomingReleasesBadgeUpcoming => '即将发布';

  @override
  String get upcomingReleasesBadgeAdded => '已添加';

  @override
  String get upcomingReleasesBadgeMissing => '缺失';

  @override
  String get upcomingReleasesScanSettingsTitle => '扫描设置';

  @override
  String get upcomingReleasesFinishedAfterTitle => '超过多久视为系列已完结';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      '最后一本书早于此时间的系列会在扫描时被跳过，只每隔一两个月重新检查一次。';

  @override
  String upcomingReleasesFinishedAfterYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 年',
      one: '1 年',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesFinishedAfterNever => '从不';

  @override
  String get upcomingReleasesSkippedTitle => '已跳过的系列';

  @override
  String get upcomingReleasesSkippedNone => '暂无跳过的系列';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已跳过 $count 个',
      one: '已跳过 1 个',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '最后一本书出版于 $count 年前',
      one: '最后一本书出版于 1 年前',
      zero: '最后一本书出版不到一年',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched => '无法在 Audible 上匹配此系列';

  @override
  String get upcomingReleasesSkippedScanNow => '立即扫描';

  @override
  String get upcomingReleasesSkippedAlwaysScan => '始终扫描';

  @override
  String get upcomingReleasesSkippedNeverScan => '从不扫描';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return '在 $name 中发现了新作品';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return '$name 没有新内容';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary => '此列表来自另一个媒体库。请重新扫描以刷新。';

  @override
  String get upcomingReleasesChipUpcoming => '即将发布';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '缺失 $count 本',
      one: '缺失 1 本',
      zero: '缺失',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => '没有发现缺失的书籍';

  @override
  String get upcomingReleasesScanSeries => '扫描系列';

  @override
  String get upcomingReleasesScanUpcomingOption => '即将发布';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc => '快速扫描新书和即将发布的书籍';

  @override
  String get upcomingReleasesScanDeepOption => '深度扫描';

  @override
  String get upcomingReleasesScanDeepOptionDesc => '同时查找每个系列中缺失的书籍，耗时更长';

  @override
  String get upcomingReleasesFirstScanNote =>
      '首次扫描会在 Audible 上检查每个系列，可能需要几分钟。待你的系列整理好后，之后的扫描会快得多。';

  @override
  String get upcomingReleasesLastScanReport => '上次扫描报告';

  @override
  String upcomingReleasesReportChecked(int count) {
    return '已在 Audible 上检查：$count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return '已跳过：$count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return '无法在 Audible 上匹配：$count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return '检查失败：$count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return '发现 $upcoming 本即将发布，$recent 本近期发布';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return '发现 $upcoming 本即将发布，$recent 本近期发布，$missing 本缺失';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return '另有 $count 项';
  }

  @override
  String get upcomingReleasesBadgeNew => '新';

  @override
  String get upcomingReleasesOpenLibrarySeries => '在媒体库中打开系列';

  @override
  String get upcomingReleasesAsinCopied => '系列 ASIN 已复制';

  @override
  String get upcomingReleasesSetSeriesAsin => '设置系列 ASIN';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      '在 audible.com 上找到该系列并复制页面链接。ASIN 是以 B0 开头的 10 位代码（例如 B08S2YN3YS）。直接粘贴整个链接也可以。';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… 或 audible.com 链接';

  @override
  String get upcomingReleasesSetAsinSave => '保存';

  @override
  String get upcomingReleasesSetAsinInvalid => '在该文本中未找到 ASIN';

  @override
  String get upcomingReleasesSetAsinSaved => '系列已关联，正在扫描';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '移除 $count 本书',
      one: '移除书籍',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => '从本次扫描中移除';

  @override
  String get upcomingReleasesRemoveThisScanDesc => '之后的扫描可能会重新出现';

  @override
  String get upcomingReleasesRemoveForever => '从本次及之后的扫描中移除';

  @override
  String get upcomingReleasesRemoveForeverDesc => '移入已移除列表，随时可以恢复';

  @override
  String get upcomingReleasesRemovedForeverToast => '已移除，之后的扫描不会再显示';

  @override
  String get upcomingReleasesRemovedBooksTitle => '已移除的书籍';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 本书',
      one: '1 本书',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => '没有已移除的书籍';

  @override
  String get upcomingReleasesRestore => '恢复';

  @override
  String get upcomingReleasesRestoredToast => '已恢复';

  @override
  String get upcomingReleasesRestoredNextScan => '已恢复，下次扫描后会显示';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已选 $count 项',
      one: '已选 1 项',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => '请求';

  @override
  String get upcomingReleasesBulkRemove => '移除';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已移除 $count 项',
      one: '已移除 1 项',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已发送 $count 个请求',
      one: '已发送 1 个请求',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return '已跳过 $count 项';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已重新扫描 $count 个系列',
      one: '已重新扫描 1 个系列',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return '$count 个系列有新书';
  }

  @override
  String get seriesExcludeFromScan => '从系列扫描中排除';

  @override
  String get seriesIncludeInScan => '纳入系列扫描';

  @override
  String get homeScreenEpisodeFallback => '单集';

  @override
  String get libraryScreenUnknownTitle => '未知标题';

  @override
  String get playlistDetailDefaultName => '播放列表';

  @override
  String playlistDetailItemCount(int count) {
    return '$count 个项目';
  }

  @override
  String get playlistDetailUnfinished => '未听完';

  @override
  String get playlistDetailRemoveFromPlaylist => '从播放列表中移除';

  @override
  String get playlistDetailDone => '完成';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return '$count 个项目已标记为听完';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return '$count 个项目已标记为未听完';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return '已移除 $count 个项目';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return '已将“$title”添加到“正在收听”';
  }

  @override
  String get collectionDetailDefaultName => '合集';

  @override
  String smartScopeBookCount(int count) {
    return '智能范围 · $count 本书';
  }

  @override
  String get smartScopeNew => '新建智能范围';

  @override
  String get smartScopeNewSubtitle => '把一组筛选条件保存为会自动保持更新的列表';

  @override
  String get smartScopeEditTitle => '编辑智能范围';

  @override
  String get smartScopeIcon => '图标';

  @override
  String get smartScopePublic => '所有用户可见';

  @override
  String get smartScopeKobo => '同步到 Kobo';

  @override
  String get smartScopeRules => '规则';

  @override
  String get smartScopeMatchAll => '全部匹配';

  @override
  String get smartScopeMatchAny => '匹配任一';

  @override
  String get smartScopeAddRule => '添加规则';

  @override
  String get smartScopeAddGroup => '添加分组';

  @override
  String get smartScopeGroup => '分组';

  @override
  String get smartScopeStartFrom => '从以下开始';

  @override
  String get smartScopeFromScratch => '从头创建';

  @override
  String get smartScopeTplHasSeries => '属于某个系列';

  @override
  String get smartScopeTplRecent => '最近添加';

  @override
  String get smartScopeTplPdf => '仅 PDF';

  @override
  String get smartScopeTplNoGenres => '无分类';

  @override
  String get smartScopeTplEpub => '仅 EPUB';

  @override
  String get smartScopeCounting => '正在统计...';

  @override
  String get smartScopeSort => '默认排序';

  @override
  String get smartScopeAddSort => '添加排序级别';

  @override
  String get smartScopeSortNone => '未设置排序，因此书籍按标题排序。';

  @override
  String get smartScopeAscending => '升序';

  @override
  String get smartScopeDescending => '降序';

  @override
  String get smartScopeDelete => '删除智能范围';

  @override
  String get smartScopeSaveFailed => '无法保存智能范围';

  @override
  String get smartScopeDeleteFailed => '无法删除智能范围';

  @override
  String get smartScopeLoadFailed => '无法加载智能范围';

  @override
  String get smartScopeUnsupportedRule => '此规则只能在 BookOrbit 网页版中更改，目前保持原样。';

  @override
  String get smartScopeAnd => '和';

  @override
  String get smartScopeDays => '天';

  @override
  String get smartScopeWeeks => '周';

  @override
  String get smartScopeMonths => '个月';

  @override
  String get smartScopePickDate => '选择日期';

  @override
  String get smartScopeAddValue => '添加值';

  @override
  String get smartScopeValue => '值';

  @override
  String get smartScopeCustomFields => '自定义字段';

  @override
  String get smartScopeAnyProvider => '任意提供方';

  @override
  String get smartScopeScoreOutstanding => '优秀';

  @override
  String get smartScopeScoreGood => '良好';

  @override
  String get smartScopeScoreFair => '一般';

  @override
  String get smartScopeScorePoor => '较差';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => '最多 20 个值';

  @override
  String get scopeFieldTitle => '标题';

  @override
  String get scopeFieldAuthor => '作者';

  @override
  String get scopeFieldSeries => '系列';

  @override
  String get scopeFieldSeriesIndex => '系列序号';

  @override
  String get scopeFieldGenre => '分类';

  @override
  String get scopeFieldTag => '标签';

  @override
  String get scopeFieldReadStatus => '阅读状态';

  @override
  String get scopeFieldReadProgress => '阅读进度';

  @override
  String get scopeFieldRating => '你的评分';

  @override
  String get scopeFieldFormat => '格式';

  @override
  String get scopeFieldLibrary => '媒体库';

  @override
  String get scopeFieldCollection => '合集';

  @override
  String get scopeFieldPublisher => '出版商';

  @override
  String get scopeFieldLanguage => '语言';

  @override
  String get scopeFieldPublishedDate => '出版日期';

  @override
  String get scopeFieldPublishedYear => '出版年份';

  @override
  String get scopeFieldAddedAt => '添加日期';

  @override
  String get scopeFieldStartedAt => '开始日期';

  @override
  String get scopeFieldFinishedAt => '完成日期';

  @override
  String get scopeFieldPageCount => '页数';

  @override
  String get scopeFieldFileSize => '文件大小';

  @override
  String get scopeFieldCommunityRating => '社区评分';

  @override
  String get scopeFieldCommunityRatingCount => '社区评价数';

  @override
  String get scopeFieldMetadataScore => '元数据评分';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => '描述';

  @override
  String get scopeFieldCover => '封面';

  @override
  String get scopeFieldAudioCover => '有声书封面';

  @override
  String get scopeFieldFileAvailability => '文件可用性';

  @override
  String get scopeFieldLockStatus => '锁定状态';

  @override
  String get scopeFieldSeriesStatus => '系列状态';

  @override
  String get scopeSortUpdatedAt => '更新日期';

  @override
  String get scopeSortLastReadAt => '最近阅读';

  @override
  String get scopeSortRandom => '随机';

  @override
  String get scopeOpContains => '包含';

  @override
  String get scopeOpNotContains => '不包含';

  @override
  String get scopeOpStartsWith => '开头是';

  @override
  String get scopeOpEndsWith => '结尾是';

  @override
  String get scopeOpEq => '是';

  @override
  String get scopeOpNotEq => '不是';

  @override
  String get scopeOpIsEmpty => '为空';

  @override
  String get scopeOpIsNotEmpty => '不为空';

  @override
  String get scopeOpGt => '大于';

  @override
  String get scopeOpGte => '至少';

  @override
  String get scopeOpLt => '小于';

  @override
  String get scopeOpLte => '至多';

  @override
  String get scopeOpBetween => '介于';

  @override
  String get scopeOpIncludesAny => '包含任一';

  @override
  String get scopeOpIncludesAll => '包含全部';

  @override
  String get scopeOpExcludesAll => '不含全部';

  @override
  String get scopeOpBefore => '早于';

  @override
  String get scopeOpAfter => '晚于';

  @override
  String get scopeOpWithinLast => '最近';

  @override
  String get scopeOpIsMissing => '缺失';

  @override
  String get scopeOpIsPresent => '存在';

  @override
  String get scopeOpIsUnread => '未读';

  @override
  String get scopeOpIsInProgress => '进行中';

  @override
  String get scopeOpIsFinished => '已完成';

  @override
  String get scopeOpIsLocked => '已锁定';

  @override
  String get scopeOpIsUnlocked => '未锁定';

  @override
  String get scopeOpIsUpNext => '接下来';

  @override
  String get scopeOpIsTrue => '是';

  @override
  String get scopeOpIsFalse => '否';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 本书匹配',
      one: '1 本书匹配',
      zero: '没有匹配的书籍',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return '删除“$name”？此操作无法撤销。';
  }

  @override
  String collectionDetailBookCount(int count) {
    return '$count本书';
  }

  @override
  String get collectionDetailDone => '完成';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return '已将“$title”添加到“正在收听”';
  }

  @override
  String get audibleSeriesNoBooksFound => '在 Audible 上没有找到书籍';

  @override
  String get audibleSeriesFailedToLoad => '无法从 Audible 加载系列';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return 'Audible 上共 $total 本 · 缺失 $missing 本';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return 'Audible 上共 $total 本 · 缺失 $missing 本 · 即将发布 $upcoming 本';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return '缺失（$count）';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return '即将发布（$count）';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return '全部（$count）';
  }

  @override
  String get audibleSeriesSearching => '正在搜索 Audible...';

  @override
  String get audibleSeriesCompleteSeries => '你已集齐整个系列！';

  @override
  String get audibleSeriesNoUpcoming => '未找到即将上架的内容';

  @override
  String get audibleSeriesUpcomingBadge => '即将发布';

  @override
  String get audibleSeriesAbridged => '删节版';

  @override
  String get audibleSeriesRegionTitle => 'Audible 地区';

  @override
  String get audibleSeriesOpenOnAudible => '在 Audible 上打开';

  @override
  String get audibleSeriesAddToCalendar => '添加到日历';

  @override
  String get audibleSeriesAddToUpcoming => '添加到即将发布';

  @override
  String get audibleSeriesAddedToUpcoming => '已添加到即将发布';

  @override
  String get audibleSeriesAlreadyInUpcoming => '已在“即将发布”页面中';

  @override
  String get audibleSeriesCouldNotOpenAudible => '无法打开 Audible';

  @override
  String get audibleSeriesCouldNotOpenCalendar => '无法打开日历';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return '$seriesName 系列有新的有声书发布';
  }

  @override
  String get authorBooksGroupBySeries => '按系列分组';

  @override
  String get authorBooksList => '列表';

  @override
  String get authorBooksGrid => '网格';

  @override
  String authorBooksBookCount(int count) {
    return '$count 本书';
  }

  @override
  String get metadataLookupCover => '封面';

  @override
  String get metadataLookupChooseFields => '选择要应用的字段';

  @override
  String metadataLookupApplyFields(int count) {
    return '应用 $count 个字段';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return '$count 个字段已保存到本地';
  }

  @override
  String get metadataLookupOverrideLocalDisplay => '覆盖本地显示';

  @override
  String get equalizerPresetFlat => '原声';

  @override
  String get equalizerPresetVoiceBoost => '人声增强';

  @override
  String get equalizerPresetBassBoost => '低音增强';

  @override
  String get equalizerPresetTrebleBoost => '高音增强';

  @override
  String get equalizerPresetPodcast => '播客模式';

  @override
  String get equalizerPresetAudiobook => '有声书';

  @override
  String get equalizerPresetReduceNoise => '降噪模式';

  @override
  String get equalizerPresetLoudness => '响度';

  @override
  String equalizerEditingSavedNamed(String title) {
    return '正在编辑\"$title\"';
  }

  @override
  String get equalizerEditingSavedGeneric => '正在编辑已保存的 EQ';

  @override
  String get equalizerPerBookEq => '每本书单独配置';

  @override
  String get notesDeleteNoteQuestion => '删除笔记？';

  @override
  String notesDeleteNoteContent(String title) {
    return '删除“$title”？';
  }

  @override
  String get notesExport => '导出';

  @override
  String get notesNewNote => '新建笔记';

  @override
  String get librarySortFilterUpcomingReleases => '即将发布';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle => '从元数据提供方获取每位作者的照片和简介';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle => 'Audible 中检查系列新书';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '剩余 $count 章',
      one: '剩余 1 章',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetAddMinutesChip(int minutes) {
    return '+$minutes 分';
  }

  @override
  String sleepTimerSheetAddChaptersChip(int count) {
    return '+$count 章';
  }

  @override
  String sleepTimerSheetMinShort(int minutes) {
    return '$minutes 分';
  }

  @override
  String sleepTimerSheetSecondsShort(int seconds) {
    return '$seconds 秒';
  }

  @override
  String sleepTimerSheetMinSecShort(int minutes, int seconds) {
    return '$minutes 分 $seconds 秒';
  }

  @override
  String sleepTimerSheetChaptersValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 章',
      one: '1 章',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetChaptersChip(int count) {
    return '$count 章';
  }

  @override
  String sleepTimerSheetStartChapterSleep(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '听完 $count 章结束',
      one: '听完 1 章结束',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => '定时结束自动倒回';

  @override
  String get sleepTimerSheetShake => '摇一摇';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return '增加 $minutes 分钟';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => '增加 1 章';

  @override
  String get sleepTimerSheetResetsToFull => '重置为完整时长';

  @override
  String get sleepTimerSheetTabSpecificChapter => '章节';

  @override
  String get sleepTimerSheetSpecificNoChapters => '没有可用的章节';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return '第 $number 章';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => '已过';

  @override
  String get sleepTimerSheetSpecificStart => '章节开始';

  @override
  String get sleepTimerSheetSpecificEnd => '章节结束';

  @override
  String get sleepTimerSheetSpecificEndsAt => '睡眠定时器将于';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return '$countdown 后';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed => '此时间点已过';

  @override
  String get sleepTimerSheetSpecificStartButton => '启动定时器';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => '已过';

  @override
  String get timeAm => '上午';

  @override
  String get timePm => '下午';

  @override
  String get collectionPickerCollectionFallback => '合集';

  @override
  String collectionPickerNameWithCount(String name, int count) {
    return '$name（$count）';
  }

  @override
  String get playlistPickerPlaylistFallback => '播放列表';

  @override
  String playlistPickerNameWithCount(String name, int count) {
    return '$name（$count）';
  }

  @override
  String get cardChaptersPlayFromChapterTitle => '从该章节开始播放？';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return '从“$title”开始播放？';
  }

  @override
  String get cardChaptersPlay => '播放';

  @override
  String get absorbingSharedToday => '今天';

  @override
  String get absorbingSharedYesterday => '昨天';

  @override
  String get absorbingSharedMonday => '周一';

  @override
  String get absorbingSharedTuesday => '周二';

  @override
  String get absorbingSharedWednesday => '周三';

  @override
  String get absorbingSharedThursday => '星期四';

  @override
  String get absorbingSharedFriday => '星期五';

  @override
  String get absorbingSharedSaturday => '星期六';

  @override
  String get absorbingSharedSunday => '星期日';

  @override
  String get absorbingSharedAm => '上午';

  @override
  String get absorbingSharedPm => '下午';

  @override
  String sectionDetailAddedToAbsorbing(String title) {
    return '已将“$title”添加到正在收听';
  }

  @override
  String get sectionDetailDoneBadge => '完成';

  @override
  String get homeCustomizeAddGenreTitle => '新增类型分区';

  @override
  String get homeCustomizeAddGenreSubtitle => '选择一个类型显示在你的首页';

  @override
  String get homeSectionDoneBadge => '完成';

  @override
  String get tipsSheetQuickBookmarksTitle => '快速书签';

  @override
  String get tipsSheetQuickBookmarksDesc => '长按任意卡片上的书签按钮即可立即添加书签，无需打开书签页面。';

  @override
  String get tipsSheetCoverPlayPauseTitle => '点击封面播放/暂停';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      '点击任意卡片的封面即可播放或暂停。可在设置的“收听卡片”中切换此功能。播放时会显示淡淡的暂停图标，提示封面可点击。';

  @override
  String get tipsSheetFullScreenPlayerTitle => '全屏播放器';

  @override
  String get tipsSheetFullScreenPlayerDesc => '在任意沉浸卡片上向上滑动即可打开全屏播放器，向下滑动即可关闭。';

  @override
  String get tipsSheetQuickAddAbsorbingTitle => '快速加入收听卡片';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      '在列表页（系列、作者、搜索结果）中向右滑动任意书籍，即可将其立即加入收听队列。';

  @override
  String get tipsSheetShakeExtendSleepTitle => '摇一摇延长睡眠定时';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      '如果睡眠定时器正在运行，摇动手机即可延长时间。可在设置中的“睡眠定时器”调整延长的分钟数。';

  @override
  String get tipsSheetSeriesNavigationTitle => '系列导航';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      '在任意书籍的详情弹窗中点击系列名称，即可查看该系列的所有书籍，并按阅读顺序排序，每本书的封面都会显示序号徽章。';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => '滑动切换书籍';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      '在收听界面左右滑动即可切换你正在收听的书籍。开启手动队列模式后，卡片也会作为你的队列使用，因此当前书籍播放结束时会自动播放下一本。';

  @override
  String get tipsSheetTapToSeekTitle => '点击跳转';

  @override
  String get tipsSheetTapToSeekDesc =>
      '点击章节或书籍进度条的任意位置即可直接跳转到对应进度。你也可以拖动进度条以进行更精细的控制。';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle => '实际播放时长';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      '剩余时间和章节时长会根据你的播放速度自动调整。用 1.5×倍播放？界面显示的时间就是你实际需要的时长。';

  @override
  String get tipsSheetPlaybackHistoryTitle => '播放历史';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      '点击任意卡片上的历史按钮即可查看所有播放、暂停、跳转和倍速调整的时间线。点击任意事件即可跳回对应位置。';

  @override
  String get tipsSheetAutoRewindTitle => '自动回退';

  @override
  String get tipsSheetAutoRewindDesc =>
      '暂停后恢复播放时，Absorb 会自动回退几秒，确保你不会错过内容。回退时长会根据你离开的时间自动调整。你可以在设置中进行修改。';

  @override
  String get tipsSheetSeriesQueueModeTitle => '系列连播模式';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      '当你听完某个系列中的一本书时，Absorb 可以自动播放下一本书。请在“设置”中将队列模式更改为“系列”。';

  @override
  String get tipsSheetOfflineModeTitle => '离线模式';

  @override
  String get tipsSheetOfflineModeDesc =>
      '点击“正在收听”界面上的同步图标即可进入离线模式。这将暂停同步并节省流量，且仅显示你已下载的书籍。非常适合在飞机上或信号较弱的区域使用。';

  @override
  String get tipsSheetUpcomingReleasesTitle => '即将上架';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      '在“系列”标签页中，再次点击该标签即可打开其排序与筛选面板，然后选择“即将上架”，即可按出版日期查看当前系列中已推出和即将推出的新书。';

  @override
  String get tipsSheetPerBookEqTitle => '为每本书单独配置均衡器';

  @override
  String get tipsSheetPerBookEqDesc =>
      '每本书都会记住自己的音频增强设置。为一部科幻巨著调好一次音效，下次播放时听起来依然如故。';

  @override
  String get tipsSheetPerBookSpeedTitle => '针对单本有声书的语速设置';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      '播放速度支持书籍单独配置。非虚构内容 1.5x 效率拉满，有声剧 1.0x 原汁原味，省去频繁调整的麻烦。';

  @override
  String get tipsSheetAutoSleepWindowTitle => '自动睡眠时间段';

  @override
  String get tipsSheetAutoSleepWindowDesc => '设定您常睡的时间段，在此时间段内听书，睡眠定时器将自动启用。';

  @override
  String get tipsSheetSleepFadeChimeTitle => '睡眠淡出与提示音';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      '睡眠定时结束时，音频将逐渐淡出并伴有可选提示音，避免在听书时突然中断。';

  @override
  String get tipsSheetCarModeTitle => '车载模式';

  @override
  String get tipsSheetCarModeDesc => '轻点汽车图标，开启车载模式，让行车操作更安全舒适。';

  @override
  String get tipsSheetAudibleSeriesTitle => '获取 Audible 系列信息';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      '打开任意系列，点击右上角的“更多”图标（三个点），即可从 Audible 获取完整的系列清单，包含缺失以及您尚未开始阅读的书籍。';

  @override
  String get tipsSheetTranscribeBookmarkTitle => '转录书签';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      '在设备本地将任意书签处的音频转成文字。请先在“设置”的“高级 > 转录”中启用并下载模型，然后点击书签上的“转录”，文字会写入书签笔记，方便修改或分享。';

  @override
  String get tipsSheetFindBetweenFormatsTitle => '在有声书与电子书之间跳转';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      '开启转录并下载本书后，暂停并点击播放器上的“在电子书中定位”，即可在电子书中打开刚听到的段落。在阅读器中选中一段文字并点击耳机图标，就能从该处开始播放有声书。';

  @override
  String get tipsSheetShareQuoteTitle => '分享摘录';

  @override
  String get tipsSheetShareQuoteDesc =>
      '将电子书高亮或书签笔记生成图片分享，摘录文字叠加在书籍封面上。可在高亮和书签面板中找到分享选项。';

  @override
  String get tipsSheetClipExportTitle => '导出音频片段';

  @override
  String get tipsSheetClipExportDesc =>
      '打开书签并点击“导出片段”，即可裁剪并保存书中的一小段音频，并附带封面，非常适合分享你喜爱的场景。';

  @override
  String get tipsSheetAllHighlightsTitle => '所有高亮集中查看';

  @override
  String get tipsSheetAllHighlightsDesc =>
      '“全部书签”页面中的“高亮”标签页汇集了所有书籍的电子书高亮。点击任意一条即可分享，或跳回对应的书。';

  @override
  String get tipsSheetVolumeKeyPagesTitle => '音量键翻页';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      '用音量键翻阅电子书页面。可在阅读器设置中启用，支持正向或反向，播放音频时也能保持开启。';

  @override
  String get tipsSheetSettingsSyncTitle => '设置同步';

  @override
  String get tipsSheetSettingsSyncDesc =>
      '通过你自己的 WebDAV 服务器，在各设备间同步设置、每本书的播放速度和正在收听的顺序。请在“设置”的“备份与同步”中进行配置。';

  @override
  String get tipsSheetNavLongPressTitle => '长按底部标签';

  @override
  String get tipsSheetNavLongPressDesc =>
      '在任意页面长按“首页”标签即可切换媒体库，长按“媒体库”标签可直接进入搜索。';

  @override
  String get bookCardUnknownTitle => '未知标题';

  @override
  String get bookCardExplicitBadge => 'E';

  @override
  String get bookCardDone => '完成';

  @override
  String get bookCardSaved => '已保存';

  @override
  String get episodeRowEpisode => '单集';

  @override
  String get episodeRowToday => '今天';

  @override
  String get episodeRowYesterday => '昨天';

  @override
  String episodeRowDaysAgo(int count) {
    return '$count天前';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return '$count周前';
  }

  @override
  String episodeRowDurationHm(int hours, int minutes) {
    return '$hours小时$minutes分钟';
  }

  @override
  String episodeRowDurationM(int minutes) {
    return '$minutes分钟';
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
  String get librarySearchResultsDone => '完成';

  @override
  String get librarySearchResultsSaved => '已保存';

  @override
  String librarySearchResultsSequence(String number) {
    return '#$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => '未知系列';

  @override
  String get librarySearchResultsUnknownEpisode => '未知单集';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 本书',
      one: '1 本书',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => 'E';

  @override
  String get libraryGridTilesDone => '完成';

  @override
  String get libraryGridTilesSaved => '已保存';

  @override
  String libraryGridTilesSequence(String number) {
    return '#$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => '未知系列';

  @override
  String get seriesCardUnknownSeries => '未知系列';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 本书',
      one: '1 本书',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => '精细拖动';

  @override
  String get cardProgressQuarterSpeed => '四分之一速度';

  @override
  String get cardProgressHalfSpeed => '半速';

  @override
  String cardProgressChapterPrefix(String number) {
    return '第 $number 章';
  }

  @override
  String get cardEdgeProgressFineScrubbing => '精细拖动';

  @override
  String get cardEdgeProgressQuarterSpeed => '四分之一速度';

  @override
  String get cardEdgeProgressHalfSpeed => '半速';

  @override
  String get authSessionExpired => '会话已过期，请重新登录。';

  @override
  String authCannotReachServer(String url) {
    return '无法连接到服务器 $url';
  }

  @override
  String get authInvalidUsernameOrPassword => '用户名或密码无效';

  @override
  String get authInvalidApiKey => 'API 密钥无效';

  @override
  String get authLoginFailedDetail => '登录失败，请检查服务器地址和登录信息';

  @override
  String get authUnexpectedServerResponse => '服务器返回了意外的响应';

  @override
  String get authSsoUnexpectedResponse => 'SSO 返回了意外的响应';

  @override
  String get authSwitchedToLocalServer => '已切换到本地服务器';

  @override
  String get authSwitchedToRemoteServer => '已切换到远程服务器';

  @override
  String get lpDeletedFinishedDownload => '已删除听完的下载';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个新单集正在下载',
      one: '1 个新单集正在下载',
    );
    return '$showTitle：$_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return '$showTitle 已添加到队列顶部';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return '$showTitle 已添加到队列第 2 位';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return '$showTitle 已添加到队列末尾';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return '$showTitle 的新单集已下载';
  }

  @override
  String get statsWeekStartsOn => '每周起始日';

  @override
  String get episodeListNewEpisodePosition => '新单集位置';

  @override
  String get episodeListPositionTop => '队列顶部';

  @override
  String get episodeListPositionSecond => '队列第二位';

  @override
  String get episodeListPositionEnd => '队列末尾';

  @override
  String get episodeListPositionNone => '不添加到队列';

  @override
  String get episodeListPositionNoneDesc => '仍会通知并下载';

  @override
  String sleepRewindUndoNote(int minutes) {
    return '在 $minutes 分钟内点击播放，即可撤销回退';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '队列：正在下载 $count 项',
      one: '队列：正在下载 1 项',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '正在下载 $count 本书',
      one: '正在下载 1 本书',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '正在下载 $count 个单集',
      one: '正在下载 1 个单集',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName => '下载进度';

  @override
  String get downloadNotifProgressChannelDesc => '显示有声书下载期间的进度';

  @override
  String get downloadNotifAlertChannelName => '下载提醒';

  @override
  String get downloadNotifAlertChannelDesc => '下载完成或失败时发出通知';

  @override
  String get downloadNotifDownloadingTitle => '正在下载…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个下载进行中',
      one: '1 个下载进行中',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return '正在下载：$title';
  }

  @override
  String get downloadNotifStartingLabel => '正在开始…';

  @override
  String get downloadNotifCompleteTitle => '下载完成';

  @override
  String downloadNotifCompleteBody(String title) {
    return '《$title》已经下载好，随时随地开始听吧';
  }

  @override
  String get downloadNotifFailedTitle => '下载失败';

  @override
  String get upcomingNotifChannelName => '扫描即将发布内容';

  @override
  String get upcomingNotifChannelDesc => '显示即将发布扫描的进度';

  @override
  String get upcomingNotifScanTitle => '即将发布内容扫描中';

  @override
  String get upcomingNotifStartingScan => '正在开始扫描…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return '正在检查 $seriesName…（$current/$total）';
  }

  @override
  String get upcomingNotifFoundTitle => '查找到即将发布内容！';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$series 个系列',
      one: '1 个系列',
    );
    return '$_temp0中共有 $books 本即将发布';
  }

  @override
  String get androidAutoTabContinue => '继续';

  @override
  String get androidAutoTabLibrary => '媒体库';

  @override
  String get androidAutoTabDownloads => '下载';

  @override
  String get settingsSearchHint => '搜索设置...';

  @override
  String get settingsSearchNoResults => '没有匹配的设置';

  @override
  String get carConnectAutoplay => 'Android Auto 连接时开始播放';

  @override
  String get carConnectAutoplayIos => 'CarPlay 连接时开始播放';

  @override
  String get carConnectAutoplayOnSubtitle => '车辆连接时，会自动播放你上次收听的书';

  @override
  String get carConnectAutoplayOffSubtitle => '等你按下播放键才开始播放';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => '配合 Siri 使用';

  @override
  String get siriStatusOn => '已开启。Siri 可以按名称查找并播放你的书籍和播客。';

  @override
  String get siriStatusAsk => '让 Siri 按名称查找并播放你的书籍和播客。';

  @override
  String get siriStatusOff => 'Absorb 的 Siri 已关闭。请在 iOS 设置中开启。';

  @override
  String get siriAllow => '允许';

  @override
  String get siriOpenSettings => '打开设置';

  @override
  String get siriThingsToSay => '可以这样说';

  @override
  String get siriExamples =>
      '“在 Absorb 中播放 [书名]”\n“在 Absorb 中播放 [系列名称]”\n“在 Absorb 中播放 [作者] 的作品”\n“在 Absorb 中播放 [播客] 的最新一集”\n“继续播放 Absorb”\n“在 Absorb 中后退”\n“在 Absorb 中播放下一章”\n“在 Absorb 中设置睡眠定时器”\n“在 Absorb 中添加书签”\n“我在 Absorb 中正在听什么”';

  @override
  String get siriShortcutsNote =>
      '即使没有此权限，也可以继续、暂停、跳转、切换章节、使用睡眠定时器、添加书签和查看正在播放的内容。这些功能也出现在“快捷指令”App 中，可用于自动化和操作按钮。';

  @override
  String get carBookOrder => '车载书籍顺序';

  @override
  String get carBookOrderReverse => '倒序排列书籍';

  @override
  String get carBookOrderReverseSubtitle => '从 Z 到 A，或最早添加的在前';

  @override
  String get carPodcastOrder => '车载播客顺序';

  @override
  String get carEpisodesOldestFirst => '最早的单集优先';

  @override
  String get carEpisodesOldestFirstSubtitle => '适合从头开始收听的节目';

  @override
  String get androidAutoCatBooks => '书籍';

  @override
  String get androidAutoCatSeries => '系列';

  @override
  String get androidAutoCatAuthors => '作者';

  @override
  String get androidAutoCatCollections => '合集';

  @override
  String get androidAutoCatPlaylists => '播放列表';

  @override
  String get showTipsAgain => '再次显示提示';

  @override
  String get showTipsAgainSubtitle => '恢复你已关闭的功能提示';

  @override
  String get tipsRestored => '已恢复提示';

  @override
  String get resetSpeedPresets => '重置速度预设';

  @override
  String get resetSpeedPresetsSubtitle => '恢复默认的播放速度选项';

  @override
  String get speedPresetsReset => '速度预设已重置';

  @override
  String get editAuthor => '编辑作者';

  @override
  String get authorName => '姓名';

  @override
  String get authorImage => '作者图片';

  @override
  String get authorRemoveImage => '移除图片';

  @override
  String get authorRemoveImageTitle => '移除作者图片？';

  @override
  String get authorRemoveImageConfirm => '这会删除服务器上的图片。';

  @override
  String get authorImageRemoved => '图片已移除';

  @override
  String get authorImageFailed => '无法更新作者图片';

  @override
  String get authorUpdated => '作者已更新';

  @override
  String get authorUpdateFailed => '无法更新作者';

  @override
  String get authorMatched => '已根据匹配结果更新作者';

  @override
  String get authorNoMatchFound => '未找到匹配项';

  @override
  String authorMergedInto(String name) {
    return '已合并到 $name';
  }

  @override
  String get authorQuickMatchHint => '从 Audible 获取所选地区的姓名、ASIN、描述和图片。';

  @override
  String get region => '地区';

  @override
  String get editTabDetails => '详情';

  @override
  String get editTabCover => '封面';

  @override
  String get editTabMatch => '匹配';

  @override
  String get editTabEmbed => '嵌入';

  @override
  String get chapterEditorTitle => '编辑章节';

  @override
  String get chapterNotConnected => '未连接到服务器';

  @override
  String get chapterErrorFirstNotZero => '第一章必须从 0:00 开始';

  @override
  String get chapterErrorStartAfterPrevious => '起始时间必须晚于上一章';

  @override
  String get chapterErrorStartBeforeEnd => '起始时间必须早于书籍结束时间';

  @override
  String get chapterErrorTitleRequired => '必须填写标题';

  @override
  String get chapterEditStartTitle => '编辑起始时间';

  @override
  String get chapterTimeHintSeconds => '秒';

  @override
  String get chapterTimeHintFull => '时:分:秒 或秒数';

  @override
  String get chapterInvalidTime => '时间无效';

  @override
  String get chapterLocked => '章节已锁定';

  @override
  String get chapterAllLocked => '所有章节均已锁定';

  @override
  String chapterTrackTitle(int number) {
    return '音轨 $number';
  }

  @override
  String get chapterNoAudioForPosition => '此位置没有音频';

  @override
  String get chapterCouldNotPlayPreview => '无法播放预览';

  @override
  String chapterStartSetTo(String time) {
    return '起始时间已设为 $time';
  }

  @override
  String get chapterAddNumberedTitle => '添加编号章节';

  @override
  String chapterNextPreview(String first, String second) {
    return '接下来：“$first”、“$second”、...';
  }

  @override
  String get chapterHowMany => '章节数量';

  @override
  String get add => '添加';

  @override
  String get chapterCountRange => '请输入 1 到 150 之间的数量';

  @override
  String get chapterTitlesUpdated => '章节标题已更新';

  @override
  String get chaptersApplied => '章节已应用';

  @override
  String get chapterDiscardTitle => '放弃更改？';

  @override
  String get chapterDiscardMessage => '恢复为已保存的章节。';

  @override
  String get chapterRemoveAllTitle => '移除所有章节？';

  @override
  String get chapterRemoveAllMessage => '这会移除本书的所有章节。';

  @override
  String get chapterAllRemoved => '已移除所有章节';

  @override
  String get chapterFixHighlighted => '请先修正高亮显示的章节';

  @override
  String get chaptersUpdated => '章节已更新';

  @override
  String get ok => 'OK';

  @override
  String get chapterSaveButton => '保存章节';

  @override
  String get chapterAddHint => '添加章节（例如“第 01 章”）';

  @override
  String get chapterAddTooltip => '添加章节';

  @override
  String get chapterRemoveAll => '全部移除';

  @override
  String get chapterShiftTimes => '平移时间';

  @override
  String get chapterFromTracks => '按音轨生成';

  @override
  String get chapterLookup => '查询';

  @override
  String get chapterShowSeconds => '显示秒';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String get chapterLoopCut => '循环播放截取段';

  @override
  String get chapterFindStart => '查找起始位置';

  @override
  String get chapterFindStartListening => '正在聆听标记点附近';

  @override
  String get chapterFindStartNone => '这里没有听起来像章节开头的内容';

  @override
  String get chapterFindStartWider => '扩大搜索范围';

  @override
  String get chapterFindStartCeiling => '已搜索标记点前后半小时。起始位置比这更远，或者没有可听到的章节播报。';

  @override
  String get chapterFindStartStrong => '听起来像这一章';

  @override
  String get chapterFindStartMaybe => '类似章节的字词';

  @override
  String chapterFindStartGap(String seconds) {
    return '间隔 $seconds 秒';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return '已搜索 $from 到 $to';
  }

  @override
  String get chapterFindStartNeedsModel => '请先在设置中开启转录并下载模型';

  @override
  String get chapterFindStartUseThis => '使用此项';

  @override
  String chapterFindStartTitle(String title) {
    return '标题：$title';
  }

  @override
  String get chapterShiftBySeconds => '平移秒数';

  @override
  String get chapterShiftHint => '平移所有未锁定的章节。使用负值可使其提前。';

  @override
  String get chapterTitleHint => '章节标题';

  @override
  String get chapterStopPreview => '停止预览';

  @override
  String get chapterPreviewFromHere => '从这里开始预览';

  @override
  String get chapterScrubHint => '拖动或微调以移动起始位置';

  @override
  String chapterStartAt(String time) {
    return '从 $time 开始';
  }

  @override
  String get chapterUnlock => '解锁';

  @override
  String get chapterLock => '锁定';

  @override
  String get chapterInsertBelow => '在下方插入';

  @override
  String get chapterFindTitle => '查找章节';

  @override
  String get chapterFindSubtitle => '按 ASIN 从 Audible/Audnexus 查询章节。';

  @override
  String get chapterEnterAsin => '输入 ASIN';

  @override
  String get chapterLookupFailed => '查询失败，请检查 ASIN';

  @override
  String get chapterNoChaptersFound => '未找到该 ASIN 的章节';

  @override
  String get chapterRemoveBranding => '移除 Audible 品牌片段（片头/片尾）';

  @override
  String chapterFoundCount(int count) {
    return '找到 $count 个章节';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  本书 $book';
  }

  @override
  String get chapterAudibleLonger => 'Audible 版本比你的文件更长，后面的章节可能无法对齐。';

  @override
  String get chapterAudibleShorter => 'Audible 版本比你的文件更短，章节可能无法对齐。';

  @override
  String get chapterTitlesOnly => '仅标题';

  @override
  String get chapterApplyChapters => '应用章节';

  @override
  String get coverSearchTitle => '搜索封面';

  @override
  String get coverSearchRefineHint => '可修改标题/作者来精简结果，这不会更改书籍本身。';

  @override
  String get coverNoneFound => '未找到封面';

  @override
  String get coverEnterTitleFirst => '请先输入标题';

  @override
  String get coverUpdated => '封面已更新';

  @override
  String get coverCouldNotUpdate => '无法更新封面';

  @override
  String get coverApply => '应用封面';

  @override
  String get coverUnknownResolution => '分辨率未知';

  @override
  String get embedIntro => '将元数据（包括封面图片和章节）嵌入音频文件。';

  @override
  String get embedBackupOption => '先备份音频文件';

  @override
  String get embedNoteInFolder => '元数据将嵌入有声书文件夹内的音轨中。';

  @override
  String get embedNoteMultiTrack => '多音轨有声书不会嵌入章节。';

  @override
  String get embedNoteNavigateAway => '任务开始后，你可以离开此页面。';

  @override
  String get embedStartButton => '开始嵌入元数据';

  @override
  String embedProgress(String percent) {
    return '正在嵌入 $percent%';
  }

  @override
  String get embedProgressIndeterminate => '正在嵌入...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent% - 离开此页面后仍会继续运行';
  }

  @override
  String get taskStarting => '正在开始...';

  @override
  String get embedBackupNoteIntro => '原始音频文件的备份将存放在服务器的 ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro => '。请记得定期清理项目缓存。';

  @override
  String get embedDialogTitle => '嵌入元数据';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 个音频文件',
      one: '# 个音频文件',
    );
    return '要将元数据嵌入 $_temp0 吗？你的音频文件将被重写$backup。';
  }

  @override
  String get embedConfirmBackupClause => '（会先备份原始文件）';

  @override
  String get embedConfirmAction => '嵌入';

  @override
  String get embedCouldNotStart => '无法开始嵌入';

  @override
  String get embedStarted => '已开始嵌入';

  @override
  String get embedComplete => '嵌入完成';

  @override
  String get embedFailed => '嵌入失败';

  @override
  String get encodeComplete => '编码完成';

  @override
  String get encodeFailedTask => '编码失败';

  @override
  String encodeProgress(String percent) {
    return '正在编码 $percent%';
  }

  @override
  String get encodeProgressIndeterminate => '正在编码...';

  @override
  String get adminApiKeys => 'API 密钥';

  @override
  String get adminApiKeysSubtitle => '程序化访问令牌';

  @override
  String get adminApiKeysNewTitle => '新建 API 密钥';

  @override
  String get adminApiKeysName => '名称';

  @override
  String get adminApiKeysNameHint => '例如 Home Assistant';

  @override
  String get adminApiKeysOwner => '用户';

  @override
  String get adminApiKeysExpiration => '有效期';

  @override
  String get adminApiKeysActive => '启用';

  @override
  String get adminApiKeysActiveSub => '密钥创建后立即生效';

  @override
  String get adminApiKeysInactive => '未启用';

  @override
  String get adminApiKeysExpired => '已过期';

  @override
  String get adminApiKeysCreate => '创建密钥';

  @override
  String get adminApiKeysCreated => 'API 密钥已创建';

  @override
  String get adminApiKeysTokenLabel => '你的新 API 密钥';

  @override
  String get adminApiKeysCopyWarning => '请立即复制此密钥。出于安全考虑，它不会再次显示。';

  @override
  String get adminApiKeysCopy => '复制';

  @override
  String get adminApiKeysCopied => '已复制到剪贴板';

  @override
  String get adminApiKeysDone => '完成';

  @override
  String get adminApiKeysDeleteTitle => '撤销 API 密钥？';

  @override
  String get adminApiKeysDeleted => 'API 密钥已撤销';

  @override
  String get adminApiKeysRevoke => '撤销';

  @override
  String get adminApiKeysSetActive => '设为启用';

  @override
  String get adminApiKeysSetInactive => '设为未启用';

  @override
  String get adminApiKeysFailedCreate => '无法创建 API 密钥';

  @override
  String get adminApiKeysFailedDelete => '无法撤销 API 密钥';

  @override
  String get adminApiKeysFailedUpdate => '无法更新 API 密钥';

  @override
  String get adminApiKeysEmpty => '还没有 API 密钥';

  @override
  String get adminApiKeysEmptySub => '创建一个，让应用和脚本访问你的服务器';

  @override
  String get adminApiKeysNeverUsed => '从未使用';

  @override
  String get adminApiKeysNeverExpires => '永不过期';

  @override
  String get adminApiKeysNameRequired => '请输入名称';

  @override
  String get adminApiKeysUserRequired => '请选择用户';

  @override
  String get adminApiKeysExpNever => '永不';

  @override
  String get adminApiKeysExp7d => '7 天';

  @override
  String get adminApiKeysExp30d => '30 天';

  @override
  String get adminApiKeysExp90d => '90 天';

  @override
  String get adminApiKeysExp1y => '1 年';

  @override
  String adminApiKeysLastUsed(String time) {
    return '最后使用：$time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return '到期时间：$date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return '要撤销“$name”吗？使用此密钥的应用将立即失去访问权限。';
  }

  @override
  String get endOfEpisode => '单集结束';

  @override
  String get sleepTimerSheetEpisodeSleepStart => '在单集结束时睡眠';

  @override
  String get bookmarkListen => '收听';

  @override
  String get bookmarkPause => '暂停';

  @override
  String get bookmarkPreviewFailed => '无法播放此位置。';

  @override
  String get clipExport => '导出片段';

  @override
  String get clipJumpToStart => '跳到开头';

  @override
  String get clipJumpToEnd => '跳到结尾';

  @override
  String get clipSetStart => '设置开头';

  @override
  String get clipSetEnd => '设置结尾';

  @override
  String get clipInLabel => '入点';

  @override
  String get clipOutLabel => '出点';

  @override
  String get clipSave => '保存片段';

  @override
  String clipExportSaved(String filename) {
    return '已保存 $filename';
  }

  @override
  String get clipExportClamped => '片段已保存，并已缩短至此音轨末尾';

  @override
  String get clipExportFailed => '无法导出片段。';

  @override
  String get clipDownloadToExport => '请先下载本书，才能在 iPhone 上导出片段。';

  @override
  String get fsPickerTitle => '选择文件夹';

  @override
  String get fsServerRoot => '服务器根目录';

  @override
  String get fsEmptyFolder => '这里没有子文件夹';

  @override
  String get fsUseThisFolder => '使用此文件夹';

  @override
  String get adminLibrariesManage => '媒体库';

  @override
  String get adminLibrariesManageSubtitle => '创建、编辑和调整顺序';

  @override
  String get adminUploadTitle => '上传媒体';

  @override
  String get adminUploadSubtitle => '从文件添加书籍和播客';

  @override
  String get adminUploadNoLibraries => '上传媒体前请先创建媒体库。';

  @override
  String get adminUploadDestination => '目标位置';

  @override
  String get adminUploadFolder => '媒体库文件夹';

  @override
  String get adminUploadDetails => '项目详情';

  @override
  String get adminUploadOptional => '可选';

  @override
  String get adminUploadAutoMetadata => '自动获取元数据';

  @override
  String get adminUploadAutoMetadataSubtitle => '根据最佳匹配填写标题、作者和系列';

  @override
  String get adminUploadMetadataProvider => '元数据提供方';

  @override
  String get adminUploadMetadataSearching => '正在搜索元数据...';

  @override
  String get adminUploadMetadataNoResults => '未找到匹配的元数据。你仍可上传此项目。';

  @override
  String get adminUploadMetadataFailed => '无法搜索元数据。你仍可上传此项目。';

  @override
  String get adminUploadDestinationPreview => '服务器目标位置';

  @override
  String get adminUploadFiles => '文件';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件',
      one: '1 个文件',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => '选择文件';

  @override
  String get adminUploadAddFiles => '添加文件';

  @override
  String get adminUploadBookFilesHint => '请选择音频或电子书文件。也可以一并包含封面和元数据文件。';

  @override
  String get adminUploadPodcastFilesHint => '请选择一个或多个音频文件。也可以一并包含封面和元数据文件。';

  @override
  String get adminUploadUnsupportedFiles => '部分所选文件不受 Audiobookshelf 支持。';

  @override
  String get adminUploadFilePickerFailed => '无法打开所选文件。';

  @override
  String get adminUploadTitleRequired => '请输入标题';

  @override
  String get adminUploadLibraryRequired => '请选择媒体库';

  @override
  String get adminUploadFolderRequired => '请选择媒体库文件夹';

  @override
  String get adminUploadFilesRequired => '请至少选择一个文件';

  @override
  String get adminUploadPodcastFileRequired => '请至少为此播客选择一个音频文件。';

  @override
  String get adminUploadBookFileRequired => '请至少为此书选择一个音频或电子书文件。';

  @override
  String get adminUploadPathCheckFailed => '无法检查目标文件夹。未上传任何内容。';

  @override
  String get adminUploadDestinationExists => '该目标文件夹在服务器上已存在。';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return '该目标位置已被“$title”使用。';
  }

  @override
  String get adminUploadAddToExistingTitle => '文件夹已存在';

  @override
  String adminUploadAddToExisting(String title) {
    return '该文件夹属于“$title”。要将文件添加进去吗？服务器会在下次扫描时识别它们。';
  }

  @override
  String get adminUploadAddToExistingNoItem => '该文件夹在服务器上已存在。要将文件添加进去吗？';

  @override
  String get adminUploadAddToBook => '添加到现有书籍';

  @override
  String get adminUploadAddToBookHint => '搜索此媒体库';

  @override
  String get adminUploadNoBooksFound => '未找到书籍';

  @override
  String adminUploadAddingTo(String title) {
    return '正在向“$title”添加文件';
  }

  @override
  String adminUploadAddedTo(String title) {
    return '已向“$title”添加文件';
  }

  @override
  String get adminUploadTargetNoFolder => '在服务器上找不到该书的文件夹。';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return '服务器会把这些文件放到“$preview”，而不是该书的文件夹“$folder”。未上传任何内容。';
  }

  @override
  String get adminUploadUploading => '正在上传...';

  @override
  String adminUploadProgress(int percent) {
    return '正在上传 $percent%';
  }

  @override
  String get adminUploadButton => '上传';

  @override
  String adminUploadComplete(String title) {
    return '已上传“$title”';
  }

  @override
  String get adminUploadFailed => '上传失败';

  @override
  String adminUploadFailedReason(String error) {
    return '上传失败：$error';
  }

  @override
  String get adminUploadReselectFiles => '重试前请重新选择文件。';

  @override
  String get adminServerSettings => '服务器设置';

  @override
  String get adminServerSettingsSubtitle => '扫描器、存储和排序';

  @override
  String get adminAuthentication => '身份验证';

  @override
  String get adminAuthenticationSubtitle => '密码和 OpenID Connect 登录';

  @override
  String get adminStats => '统计';

  @override
  String get adminStatsSubtitle => '媒体库和收听总计';

  @override
  String get adminAllSessions => '所有会话';

  @override
  String get adminAllSessionsSubtitle => '查看和管理所有收听会话';

  @override
  String get adminSessionsAllUsers => '所有用户';

  @override
  String get adminSessionsEmpty => '没有会话';

  @override
  String get statsLibraryTotals => '媒体库总计';

  @override
  String get statsTotalItems => '项目';

  @override
  String get statsAudioFiles => '音频文件';

  @override
  String get statsTotalSize => '总大小';

  @override
  String get statsBooks => '书籍';

  @override
  String get statsPodcasts => '播客';

  @override
  String get statsBooksSize => '书籍大小';

  @override
  String get statsYearReview => '年度回顾';

  @override
  String get statsNoYearData => '今年没有数据';

  @override
  String get statsListeningTime => '收听时间';

  @override
  String get statsSessions => '会话';

  @override
  String get statsBooksAdded => '新增书籍';

  @override
  String get statsAuthorsAdded => '新增作者';

  @override
  String get statsTopAuthors => '热门作者';

  @override
  String get statsTopNarrators => '热门朗读者';

  @override
  String get statsTopGenres => '热门分类';

  @override
  String get srvScannerSection => '扫描器';

  @override
  String get srvFindCovers => '查找封面';

  @override
  String get srvCoverProvider => '封面提供方';

  @override
  String get srvParseSubtitles => '从文件名解析副标题';

  @override
  String get srvPreferMatched => '优先使用匹配的元数据';

  @override
  String get srvDisableWatcher => '禁用文件夹监视';

  @override
  String get srvStorageSection => '存储';

  @override
  String get srvStoreCover => '将封面与项目一起存储';

  @override
  String get srvStoreMetadata => '将元数据与项目一起存储';

  @override
  String get srvMetadataFormat => '元数据文件格式';

  @override
  String get srvFormatSection => '显示与格式';

  @override
  String get srvDateFormat => '日期格式';

  @override
  String get srvTimeFormat => '时间格式';

  @override
  String get srvLanguage => '服务器语言';

  @override
  String get srvChromecast => 'Chromecast 支持';

  @override
  String get srvAllowIframe => '允许 iframe 嵌入';

  @override
  String get srvSortingSection => '排序';

  @override
  String get srvIgnorePrefixes => '排序时忽略前缀';

  @override
  String get srvSortingPrefixes => '排序前缀';

  @override
  String get srvAddPrefix => '添加前缀';

  @override
  String get srvSave => '保存设置';

  @override
  String get srvSavePrefixes => '保存前缀';

  @override
  String get srvSaved => '设置已保存';

  @override
  String get srvSaveFailed => '无法保存设置';

  @override
  String get srvPrefixesSaved => '排序前缀已更新';

  @override
  String get authSetLoadFailed => '无法加载身份验证设置';

  @override
  String get authSetCustomMessage => '登录页自定义消息';

  @override
  String get authSetMessage => '消息';

  @override
  String get authSetPasswordAuth => '密码验证';

  @override
  String get authSetOpenId => 'OpenID Connect 验证';

  @override
  String get authSetGuide => '设置指南';

  @override
  String get authSetIssuerUrl => '颁发者 URL';

  @override
  String get authSetAutoPopulate => '自动填充';

  @override
  String get authSetAuthorizeUrl => '授权 URL';

  @override
  String get authSetTokenUrl => '令牌 URL';

  @override
  String get authSetUserinfoUrl => '用户信息 URL';

  @override
  String get authSetJwksUrl => 'JWKS URL';

  @override
  String get authSetLogoutUrl => '登出 URL';

  @override
  String get authSetClientId => '客户端 ID';

  @override
  String get authSetClientSecret => '客户端密钥';

  @override
  String get authSetSigningAlgorithm => '签名算法';

  @override
  String get authSetRedirectUris => '允许的移动端重定向 URI';

  @override
  String get authSetRedirectUrisInfo =>
      '登录后，应用只能返回到这些地址。Absorb 使用 absorb://oauth。仅填写一个星号 (*) 表示允许任意地址。';

  @override
  String get authSetAddRedirectUri => '添加 URI';

  @override
  String get authSetAddAbsorbRedirect => '添加 absorb://oauth';

  @override
  String get authSetSubfolder => '重定向 URL 的子文件夹';

  @override
  String get authSetSubfolderNone => '无';

  @override
  String get authSetWebRedirectInfo => '请在你的 OAuth 提供方中允许这些 URL，以便登录后能返回网页版应用：';

  @override
  String get authSetButtonText => '按钮文字';

  @override
  String get authSetMatchExisting => '匹配现有用户的依据';

  @override
  String get authSetMatchNone => '不匹配';

  @override
  String get authSetMatchEmail => '电子邮件';

  @override
  String get authSetMatchUsername => '用户名';

  @override
  String get authSetMatchExistingInfo => '用于关联现有用户。关联后，将通过提供方的唯一 ID 匹配用户。';

  @override
  String get authSetAutoLaunch => '自动启动';

  @override
  String get authSetAutoLaunchInfo =>
      '在网页登录页自动打开提供方。访问 /login?autoLaunch=0 可跳过。';

  @override
  String get authSetAutoRegister => '自动注册';

  @override
  String get authSetAutoRegisterInfo => '新用户登录后自动创建账户';

  @override
  String get authSetClaimsInfo => '留空则关闭群组和权限分配。新用户将获得“用户”角色。';

  @override
  String get authSetGroupClaim => '群组声明';

  @override
  String get authSetGroupClaimInfo =>
      '列出用户所属群组的声明，通常为 groups。名为 admin、user 或 guest 的群组决定角色，取最高者。若没有匹配的群组，则拒绝登录。';

  @override
  String get authSetPermsClaim => '高级权限声明';

  @override
  String get authSetPermsClaimInfo =>
      '包含非管理员用户权限的声明。若缺少该声明，则拒绝登录；缺少的选项视为关闭。预期格式：';

  @override
  String get authSetRestartNote => '保存后请重启服务器，以应用 OpenID Connect 的更改。';

  @override
  String get authSetNoChanges => '没有需要保存的更改';

  @override
  String get authSetNeedOneMethod => '请至少开启一种登录方式';

  @override
  String authSetFieldRequired(String field) {
    return '$field 为必填项';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return '重定向 URI 无效：$uri';
  }

  @override
  String get authSetAsteriskAlone => '星号 (*) 必须是唯一的重定向 URI';

  @override
  String authSetInvalidClaim(String field) {
    return '$field 不是有效的声明名称';
  }

  @override
  String authSetIssuerFailed(String error) {
    return '无法读取颁发者：$error';
  }

  @override
  String get libNoneYet => '还没有媒体库';

  @override
  String get libReorderFailed => '无法保存新的顺序';

  @override
  String get libDeleteTitle => '删除媒体库？';

  @override
  String get libDeleteBody => '这会从服务器上永久移除该媒体库及其所有项目。';

  @override
  String get libDeleted => '媒体库已删除';

  @override
  String get libDeleteFailed => '无法删除媒体库';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件夹',
      one: '1 个文件夹',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => '新建媒体库';

  @override
  String get libEditTitle => '编辑媒体库';

  @override
  String get libName => '媒体库名称';

  @override
  String get libMediaType => '媒体类型';

  @override
  String get libMediaBook => '书籍';

  @override
  String get libMediaPodcast => '播客';

  @override
  String get libProvider => '元数据提供方';

  @override
  String get libIcon => '图标';

  @override
  String get libFolders => '文件夹';

  @override
  String get libAddFolder => '添加文件夹';

  @override
  String get libNoFolders => '请至少添加一个文件夹';

  @override
  String get libAdvanced => '高级设置';

  @override
  String get libCoverShape => '封面形状';

  @override
  String get libCoverSquare => '方形';

  @override
  String get libCoverStandard => '标准';

  @override
  String get libDisableWatcher => '禁用文件夹监视';

  @override
  String get libSkipAsin => '跳过匹配已有 ASIN 的书籍';

  @override
  String get libSkipIsbn => '跳过匹配已有 ISBN 的书籍';

  @override
  String get libHideSingleSeries => '隐藏单本系列';

  @override
  String get libAudiobooksOnly => '仅有声书';

  @override
  String get libEpubScripted => '允许 ePub 脚本内容';

  @override
  String get libLaterBooksOnly => '“继续系列”中仅显示后续书籍';

  @override
  String get libPodcastRegion => '播客搜索地区';

  @override
  String get libMarkPercent => '完成百分比达到时视为听完';

  @override
  String get libMarkTime => '剩余秒数达到时视为听完';

  @override
  String get libAutoScan => '自动扫描计划 (cron)';

  @override
  String get libCreate => '创建媒体库';

  @override
  String get libUpdate => '保存更改';

  @override
  String get libNameRequired => '请输入媒体库名称';

  @override
  String get libCreated => '媒体库已创建';

  @override
  String get libCreateFailed => '无法创建媒体库';

  @override
  String get libUpdated => '媒体库已更新';

  @override
  String get libUpdateFailed => '无法更新媒体库';

  @override
  String get libRemoveFoldersTitle => '移除文件夹？';

  @override
  String get libRemoveFoldersBody => '移除文件夹会从媒体库中删除其中的项目，且无法撤销。';

  @override
  String get readEbook => '阅读';

  @override
  String get ebookDownload => '下载';

  @override
  String get ebookDownloaded => '已下载';

  @override
  String get ebookSavedOffline => '已保存供离线阅读';

  @override
  String get ebookRemovedOffline => '已从离线中移除';

  @override
  String get ebookOfflineFailed => '无法下载电子书';

  @override
  String get ebookSaveToDevice => '保存到设备';

  @override
  String get ebookSaveToDeviceTitle => '保存到设备？';

  @override
  String get ebookSaveToDeviceBody =>
      '这会将电子书文件的副本保存到设备上的某个位置（由你选择）。这不会让阅读器离线使用本书，如需离线请使用“下载”。';

  @override
  String get readerFormatUnsupported => '阅读器暂不支持打开此电子书格式';

  @override
  String get readerCouldNotOpen => '无法打开这本电子书，文件可能已损坏。';

  @override
  String get moreActions => '更多';

  @override
  String get readerChapters => '章节';

  @override
  String get readerSettings => '阅读器设置';

  @override
  String get readerFontSize => '字体大小';

  @override
  String get readerLineSpacing => '行距';

  @override
  String get readerTextAlignment => '对齐方式';

  @override
  String get readerAlignJustified => '两端对齐';

  @override
  String get readerAlignLeft => '左对齐';

  @override
  String get readerSideMargins => '左右边距';

  @override
  String get readerTopBottom => '上下边距';

  @override
  String get readerPageLayout => '页面布局';

  @override
  String get readerPinTopBar => '保持标题和进度条显示在屏幕上';

  @override
  String get readerPinTopBarHint => '将它们固定在页面上方，而不是点按后才显示。页面会稍微变矮，以免遮住文字。';

  @override
  String get readerTopBarProgress => '顶栏进度';

  @override
  String get readerTopBarProgressBook => '整本书';

  @override
  String get readerTopBarProgressChapter => '章节';

  @override
  String get readerTopBarProgressBoth => '两者';

  @override
  String get readerSectionText => '文字';

  @override
  String get readerSectionPage => '页面';

  @override
  String get readerSectionTopBar => '顶栏与屏幕';

  @override
  String get readerSectionControls => '控制';

  @override
  String get readerSectionStats => '统计';

  @override
  String get readerParagraphSpacing => '段落间距';

  @override
  String get readerParagraphSpacingBook => '书籍原样';

  @override
  String get readerTapZones => '点按区域';

  @override
  String get readerTapZonesHint => '拖动分隔线可调整方块大小。点按方块可更改其功能，也可以从现有布局开始。';

  @override
  String get readerTapPrev => '上一页';

  @override
  String get readerTapNext => '下一页';

  @override
  String get readerTapMenu => '显示控件';

  @override
  String get readerTapNothing => '无操作';

  @override
  String get readerTapKeepMenu => '必须有一个方块用于显示控件';

  @override
  String get readerHideControls => '自动隐藏控件';

  @override
  String get readerHideControlsNever => '从不';

  @override
  String get readerBarNotes => '笔记和高亮';

  @override
  String readerHideControlsAfter(int seconds) {
    return '$seconds秒';
  }

  @override
  String get playerDownloadStreamingInstead =>
      '此下载无法播放，因此改为从服务器流式播放。重新下载可能会解决问题。';

  @override
  String get readerPageTurn => '翻页效果';

  @override
  String get readerPageTurnNone => '无';

  @override
  String get readerPageTurnSlide => '滑动';

  @override
  String get readerPageTurnCurl => '卷页';

  @override
  String get readerPageTurnRipple => '涟漪';

  @override
  String get readerScrollMode => '滚动模式';

  @override
  String get readerScrollModeHint => '向下滚动浏览全书，而不是翻页。适用于所有书籍。';

  @override
  String get readerKeepAwake => '保持屏幕常亮';

  @override
  String get readerKeepAwakeHint => '按自己的节奏阅读时，屏幕不会自动熄灭。自动滚动和跟读始终保持常亮。';

  @override
  String get readerLayoutAuto => '自动';

  @override
  String get readerLayoutSingle => '单页';

  @override
  String get readerLayoutTwoPage => '双页';

  @override
  String get readerTheme => '主题';

  @override
  String get readerFont => '字体';

  @override
  String get readerVolumeNav => '音量键翻页';

  @override
  String get readerVolumeNavOff => '关闭';

  @override
  String get readerVolumeNavNormal => '正常';

  @override
  String get readerVolumeNavMirrored => '反向';

  @override
  String get readerAutoScroll => '自动滚动';

  @override
  String get readerAutoScrollSubtitle => '下一页会从上到下覆盖当前页。拖动屏幕中间可调节速度，点按可停止';

  @override
  String get readerAutoScrollStarted => '自动滚动已开始';

  @override
  String get readerAutoScrollPaused => '已暂停，长按可停止';

  @override
  String get readerAutoScrollResumed => '自动滚动已继续';

  @override
  String get readerAutoScrollStopped => '自动滚动已关闭';

  @override
  String get readerAutoScrollEndOfBook => '已到书末，自动滚动已关闭';

  @override
  String readerAutoScrollSpeed(int percent) {
    return '速度 $percent%';
  }

  @override
  String get readerMoreControls => '更多控制';

  @override
  String get readerAutoScrollSleep => '自动滚动睡眠定时器';

  @override
  String get readerAutoScrollSleepHint => '一段时间后停止滚动，并让屏幕熄灭。';

  @override
  String readerAutoScrollSleepMinutes(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String readerAutoScrollSleepLeft(int minutes) {
    return '剩余 $minutes 分钟';
  }

  @override
  String readerAutoScrollSleepIn(int minutes) {
    return '自动滚动将在 $minutes 分钟后停止';
  }

  @override
  String get readerAutoScrollSleepOff => '自动滚动睡眠定时器已关闭';

  @override
  String get readerAutoScrollSleepEnded => '睡眠定时器已触发，自动滚动已关闭';

  @override
  String get readerDownloadStarted => '已开始下载';

  @override
  String get detailChaptersJumpTitle => '跳转到此章节？';

  @override
  String detailChaptersJumpContent(String title) {
    return '播放将跳转到“$title”。';
  }

  @override
  String get detailChaptersJump => '跳转';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已听完 $count 章',
      one: '已听完 1 章',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位其他听众',
      one: '1 位其他听众',
      zero: '没有其他听众',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => '接下来';

  @override
  String get seriesJumpToUpNext => '跳到接下来的一本';

  @override
  String get seriesStatsFinished => '已听完';

  @override
  String get seriesStatsListened => '已听';

  @override
  String get seriesStatsLeft => '剩余';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done/$total';
  }

  @override
  String get detailSessionsNone => '还没有收听会话';

  @override
  String detailSessionsAll(int count) {
    return '全部 $count 个会话';
  }

  @override
  String get readerVolumeNavWhilePlaying => '播放音频时也生效';

  @override
  String get readerTranslateWith => '翻译方式';

  @override
  String get readerTranslateApp => '本设备上的应用';

  @override
  String get readerTranslateApple => 'iOS 内置';

  @override
  String get readerTranslateWeb => '在浏览器中打开';

  @override
  String get readerTranslateHint => '所选文字会发送给你选择的翻译服务。';

  @override
  String get readerMoreFonts => '下载更多字体';

  @override
  String get readerFontRemove => '移除下载';

  @override
  String readerFontDownloadFailed(String font) {
    return '无法下载 $font';
  }

  @override
  String get readerAnnotations => '批注';

  @override
  String readerHighlights(int count) {
    return '高亮 ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return '书签 ($count)';
  }

  @override
  String get readerNoHighlights => '还没有高亮';

  @override
  String get readerHistory => '历史记录';

  @override
  String get sessionReading => '阅读';

  @override
  String get readerHistoryEmpty => '你离开的页面会列在这里，方便随时回到那里。';

  @override
  String get readerHistoryClosed => '关闭了书籍';

  @override
  String get readerHistoryBeforeJump => '跳转之前';

  @override
  String get readerHistoryBeforeSync => '匹配音频之前';

  @override
  String get readerLogReading => '将阅读时间计入统计';

  @override
  String get readerLogReadingHint =>
      '把你在阅读器中的时间记录为一次会话，以便显示在统计中。在 Audiobookshelf 上会计为收听时间。';

  @override
  String get readerNoBookmarks => '还没有书签';

  @override
  String get readerBookmarkDefault => '书签';

  @override
  String get readerNoteTitle => '笔记';

  @override
  String get readerNoteHint => '添加笔记...';

  @override
  String get backupAndSync => '备份与同步';

  @override
  String get backupAndSyncSubtitle => '保存备份文件，或在各设备间保持设置同步';

  @override
  String get syncSettingsExperimental => '实验性功能';

  @override
  String get syncSettingsExperimentalBody =>
      '同步功能是新推出的，仍在完善中。如果两台设备在断开期间各自做了更改，其中一方的更改可能会丢失。请保留一份备份文件作为安全副本。';

  @override
  String get syncSettingsNeedServer => '需要服务器吗？';

  @override
  String get syncSettingsNeedServerSub =>
      '任何 WebDAV 服务器都可以。Nextcloud 是一款免费的自托管服务器。';

  @override
  String get syncSettingsConnection => '连接';

  @override
  String get syncSettingsConnectionNotSet => '尚未设置';

  @override
  String get syncSettingsBackupFile => '备份文件';

  @override
  String get syncSettingsBackupFilePlain => '将所有内容保存到一个由你保管的文件中。';

  @override
  String get syncSettingsBackupFileWithSync =>
      '将所有内容保存到一个由你保管的文件中。包含登录信息后，在另一部手机上恢复时也会同时开启同步。';

  @override
  String get syncSettingsStatusOff => '未同步';

  @override
  String get syncSettingsStatusProblem => '无法连接到你的服务器';

  @override
  String get syncSettings => '在设备间同步设置';

  @override
  String get syncSettingsExtras => '同时同步';

  @override
  String get syncSettingsIncludeRmab => 'ReadMeABook 设置';

  @override
  String get syncSettingsIncludeRmabSub => '会把你的 ReadMeABook API 令牌放入同步文件';

  @override
  String get syncSettingsSubtitle => '通过你自己的 WebDAV 服务器保持设置同步';

  @override
  String get syncSettingsEnable => '同步设置';

  @override
  String get syncSettingsServerUrl => 'WebDAV 文件夹 URL';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => '用户名';

  @override
  String get syncSettingsPassword => '密码';

  @override
  String get syncSettingsHeaders => '自定义请求头（可选）';

  @override
  String get syncSettingsHeadersHint => '每行一个，例如 CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => '测试连接';

  @override
  String get syncSettingsHoldToUpload => '长按立即上传';

  @override
  String get syncSettingsUploadNow => '立即上传';

  @override
  String get syncSettingsDownloadNow => '立即下载';

  @override
  String get syncSettingsOk => '已连接';

  @override
  String get syncSettingsNoRemote => '已连接，尚未同步任何内容';

  @override
  String get syncSettingsAuthFailed => '用户名或密码错误';

  @override
  String get syncSettingsNetworkError => '无法连接到该地址';

  @override
  String get syncSettingsNotConfigured => '请先填写地址、用户名和密码';

  @override
  String get syncSettingsTooLarge => '你的设置太大，无法同步';

  @override
  String get syncSettingsUploaded => '设置已上传';

  @override
  String get syncSettingsApplied => '已从你的另一台设备更新设置';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已从你的另一台设备更新 $count 项设置',
      one: '已从你的另一台设备更新 1 项设置',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => '已是最新';

  @override
  String syncSettingsLastSynced(String when) {
    return '上次同步：$when';
  }

  @override
  String get syncSettingsNever => '尚未同步';

  @override
  String navHoldPickTitle(String tab) {
    return '长按“$tab”将...';
  }

  @override
  String get navHoldPickBody => '选择长按此标签时执行的操作。你之后可以在“设置”中更改。';

  @override
  String get navHoldSettingTitle => '标签长按快捷操作';

  @override
  String get navHoldSettingSubtitle => '长按各个标签时的操作';

  @override
  String get navHoldAskNextTime => '下次再问';

  @override
  String get navHoldNothing => '无操作';

  @override
  String get navHoldPlayPause => '播放 / 暂停';

  @override
  String get navHoldOfflineMode => '离线模式';

  @override
  String get navHoldOfflineOn => '离线模式已开启';

  @override
  String get navHoldOfflineOff => '离线模式已关闭';

  @override
  String get navHoldMenu => '始终显示菜单';

  @override
  String get navHoldStop => '停止播放';

  @override
  String get navHoldRmabSearch => 'ReadMeABook 搜索';

  @override
  String get navHoldRmabRequests => '我的书籍请求';

  @override
  String get navHoldRmabWeb => 'ReadMeABook 网站';

  @override
  String get navHoldAdd => '添加';

  @override
  String get navHoldMoveLeft => '左移';

  @override
  String get navHoldMoveRight => '右移';

  @override
  String get navHoldRemoveFromMenu => '从菜单中移除';

  @override
  String get navHoldEditHint => '长按某一项可移动或移除';

  @override
  String get navHoldResetMenu => '重置长按菜单项';

  @override
  String get navHoldMenuReset => '菜单项已重置';

  @override
  String get bookStatsAction => '收听统计';

  @override
  String get bookStatsYou => '你';

  @override
  String get bookStatsEveryone => '所有人';

  @override
  String get bookStatsListened => '已收听时间';

  @override
  String get bookStatsSessions => '会话';

  @override
  String get bookStatsFirst => '首次收听';

  @override
  String get bookStatsLast => '最近收听';

  @override
  String get bookStatsListeners => '开始收听的人数';

  @override
  String get bookStatsFinishedCount => '听完的人数';

  @override
  String get bookStatsTotalTime => '所有人的收听时间';

  @override
  String get bookStatsNobody => '还没有人开始收听';

  @override
  String get bookStatsScanning => '正在扫描会话，这可能需要一些时间...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return '正在扫描会话，已完成 $done/$total 人...';
  }

  @override
  String bookStatsLastChecked(String when) {
    return '检查于 $when';
  }

  @override
  String get activityYourReading => '你的阅读';

  @override
  String get activityYourListening => '你的收听';

  @override
  String activityLastRead(String when) {
    return '上次阅读：$when';
  }

  @override
  String activityLastListened(String when) {
    return '上次收听：$when';
  }

  @override
  String get activityNotStarted => '未开始';

  @override
  String get activityNoReading => '还没有阅读会话';

  @override
  String get activityTime => '时间';

  @override
  String get activityAverage => '平均';

  @override
  String get activityProgress => '进度';

  @override
  String activityReached(String percent) {
    return '已达 $percent';
  }

  @override
  String get readingLogTitle => '阅读记录';

  @override
  String get readingLogTotalTime => '总时间';

  @override
  String get readingLogAverageSession => '平均每次时长';

  @override
  String get readingLogActiveDays => '活跃天数';

  @override
  String readingLogActiveDaysOf(int active, int total) {
    return '$active/$total';
  }

  @override
  String get readingLogPace => '速度';

  @override
  String readingLogPacePerHour(String percent) {
    return '$percent%/小时';
  }

  @override
  String get readingLogLastRead => '上次阅读';

  @override
  String get readingLogStarted => '开始于';

  @override
  String get readingLogFinished => '完成于';

  @override
  String get readingLogNotSet => '未设置';

  @override
  String readingLogLeftMinutes(int m) {
    return '约 $m 分钟读完';
  }

  @override
  String readingLogLeftHours(int h) {
    return '约 $h 小时读完';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return '约 $h 小时 $m 分钟读完';
  }

  @override
  String get readingLogLeftMax => '还需 99 小时以上读完';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return '比前一周增加 $percent%';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return '比前一周减少 $percent%';
  }

  @override
  String get readingLogNewThisWeek => '本周新增';

  @override
  String get readingLogSameAsLastWeek => '与前一周持平';

  @override
  String get readingLogQuietTwoWeeks => '最近两周没有记录';

  @override
  String get readingLogWhereYouRead => '你在哪里阅读';

  @override
  String get readingLogSourceIos => 'iOS 应用';

  @override
  String get readingLogSourceAndroid => 'Android 应用';

  @override
  String get readingLogChartTitle => '进度变化';

  @override
  String get readingLogChartPosition => '到达的位置';

  @override
  String get readingLogChartMinutes => '分钟';

  @override
  String get readingLogRecords => '记录';

  @override
  String get readingLogLongestSession => '最长一次';

  @override
  String get readingLogBestDay => '最佳一天';

  @override
  String get readingLogLongestStreak => '最长连续天数';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天',
      one: '1 天',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => '回跳';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 次',
      one: '1 次',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => '首次打开';

  @override
  String get readingLogAttempts => '阅读次数';

  @override
  String readingLogAttempt(int index) {
    return '第 $index 次';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return '第 $index 次开始';
  }

  @override
  String get readingLogOutcomeCompleted => '已读完';

  @override
  String get readingLogOutcomeSkimmed => '略读';

  @override
  String get readingLogOutcomeAbandoned => '已放弃';

  @override
  String get readingLogOutcomeInProgress => '进行中';

  @override
  String readingLogSpanRange(String from, String to) {
    return '$from 至 $to';
  }

  @override
  String readingLogSpanSince(String from) {
    return '自 $from 起';
  }

  @override
  String readingLogSpanEnded(String to) {
    return '结束于 $to';
  }

  @override
  String get readingLogSpanUnknown => '未记录日期';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 次会话',
      one: '1 次会话',
    );
    return '$_temp0';
  }

  @override
  String readingLogShowing(int shown, int total) {
    return '$shown/$total';
  }

  @override
  String readingLogGapDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天未阅读',
      one: '1 天未阅读',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => '还没有记录会话';

  @override
  String get readingLogEmptyHint =>
      '当你在任何与 BookOrbit 同步的应用或设备上阅读或收听时，会话会显示在这里。';

  @override
  String get readingLogNoMatches => '此范围内没有会话';

  @override
  String get readingLogAllTime => '全部时间';

  @override
  String get readingLogLast30 => '最近 30 天';

  @override
  String get readingLogLast90 => '最近 90 天';

  @override
  String get readingLogThisYear => '今年';

  @override
  String get readingLogAllFormats => '所有格式';

  @override
  String get readingLogSortBy => '排序方式';

  @override
  String get readingLogSortDay => '日期';

  @override
  String get readingLogSortLength => '时长';

  @override
  String get readingLogSortChange => '变化';

  @override
  String get readingLogSortReached => '到达位置';

  @override
  String get readingLogNewestFirst => '最新优先';

  @override
  String get readingLogOldestFirst => '最早优先';

  @override
  String get readingLogMostFirst => '从多到少';

  @override
  String get readingLogLeastFirst => '从少到多';

  @override
  String get readingLogDeleteTitle => '删除此会话？';

  @override
  String get readingLogDeleteBody => '它将从这本书的阅读记录和你在 BookOrbit 上的统计中移除。';

  @override
  String get readingLogDeleteFailed => '无法删除会话';

  @override
  String get readingLogLoadFailed => '无法加载阅读记录';

  @override
  String get navHoldServerScan => '服务器扫描';

  @override
  String get navHoldScanAll => '扫描所有媒体库';

  @override
  String navHoldScanLibrary(String name) {
    return '扫描 $name';
  }

  @override
  String get navHoldScanStarted => '扫描已开始';

  @override
  String get navHoldScanFailed => '无法开始扫描';

  @override
  String get navHoldAdminLogs => '服务器日志';

  @override
  String navHoldAdminPage(String page) {
    return '管理员：$page';
  }

  @override
  String get navHoldNothingPlaying => '还没有可播放的内容';

  @override
  String get navHoldReadBook => '阅读当前书籍';

  @override
  String get navHoldBookDetails => '当前书籍详情';

  @override
  String get syncSourceTitle => '同步应保留哪个副本？';

  @override
  String get syncSourceBody =>
      '此备份开启了设置同步。是使用服务器上次同步的内容，还是以此备份为准？选择备份会替换服务器上的副本，并影响你所有已同步的设备。';

  @override
  String get syncSourceUseServer => '服务器上次同步';

  @override
  String get syncSourceUseBackup => '此备份';

  @override
  String get syncSettingsWhatTravels =>
      '你的偏好设置、每本书的播放速度、首页布局、正在收听的顺序、笔记和电子书高亮会被同步。登录信息、下载文件夹、自动下载开关、阅读器外观，以及尚未发送到服务器的内容仅保留在此设备上。';

  @override
  String get syncSettingsDownloadWarnTitle => '替换此设备的设置？';

  @override
  String get syncSettingsDownloadWarnBody => '同步的副本将覆盖此设备上的设置。';

  @override
  String get syncSettingsDownloadWarnConfirm => '替换';

  @override
  String get readerCopied => '已复制到剪贴板';

  @override
  String get dictionaryNotFound => '未找到该词的释义。';

  @override
  String get dictionaryError => '无法连接到词典，请检查网络连接。';

  @override
  String get dictionaryRetry => '重试';

  @override
  String get dictionarySearchWeb => '在网上搜索';

  @override
  String get readerTooltipCopy => '复制';

  @override
  String get readerTooltipSearch => '搜索';

  @override
  String get readerTooltipDefine => '释义';

  @override
  String get readerTooltipTranslate => '翻译';

  @override
  String get readerSearchHint => '在本书中搜索…';

  @override
  String readerSearchMatches(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '找到 $count 处与“$query”匹配',
      one: '找到 $count 处与“$query”匹配',
    );
    return '$_temp0';
  }

  @override
  String get readerSearchEmpty => '输入单词或短语，然后点击搜索。';

  @override
  String readerSearchNoResults(String query) {
    return '没有与“$query”匹配的内容。';
  }

  @override
  String get transcriptionTitle => '转录';

  @override
  String get transcriptionAdvancedSubtitle => '用于转录书签，以及在有声书和电子书之间定位';

  @override
  String get transcriptionEnable => '启用转录';

  @override
  String get transcriptionEnableSubtitle =>
      '为书签添加“转录”，为播放器添加“在电子书中定位”，为阅读器添加“在有声书中定位”';

  @override
  String get transcriptionDisclaimer =>
      '完全在你的设备上运行，不会向任何地方发送数据。运行期间会额外消耗电量和处理资源，并且只能转录已下载的书籍。';

  @override
  String get transcriptionNeedModelHint => '请在下方下载模型以开始转录。';

  @override
  String get transcriptionModelSection => '模型';

  @override
  String get transcriptionModelTiny => '微型';

  @override
  String get transcriptionModelTinyDesc => '最快，准确度较低。约 31 MB。';

  @override
  String get transcriptionModelBase => '基础';

  @override
  String get transcriptionModelBaseDesc => '不错的折中之选。约 57 MB。';

  @override
  String get transcriptionModelSmall => '小型';

  @override
  String get transcriptionModelSmallDesc => '较慢但最准确，适合高端手机。约 182 MB。';

  @override
  String get transcriptionAutoHint =>
      '下载多个模型时，每项任务会自动择优选用。有电子书的书籍使用最快的模型，因为准确文字本来就来自电子书；没有电子书的书籍使用最准确的模型，但跟读例外，它不会超过“小型”，以便跟上朗读速度。';

  @override
  String get transcriptionDownload => '下载';

  @override
  String get transcriptionDownloadFailed => '下载失败。请检查网络连接后重试。';

  @override
  String get transcribe => '转录';

  @override
  String get transcribing => '正在转录...';

  @override
  String get transcriptionResultTitle => '转录文本';

  @override
  String get transcriptionSaveToNote => '保存到笔记';

  @override
  String get transcriptionSavedToNote => '已保存到书签笔记';

  @override
  String get transcriptionDisabledHint => '请在“设置”的“高级”中开启书签转录。';

  @override
  String get transcriptionNoModelDownloaded => '请先在设置中下载转录模型。';

  @override
  String get transcriptionNotDownloadedBook => '请下载本书或连接到服务器后再转录。';

  @override
  String get transcriptionNoMetadataMsg => '无法在下载内容中定位此位置。请尝试重新下载本书。';

  @override
  String get transcriptionBusyMsg => '正在转录其他内容，请稍候。';

  @override
  String get transcriptionEmptyMsg => '此位置没有检测到语音。';

  @override
  String get transcriptionFailedMsg => '无法转录此位置，请重试。';

  @override
  String get transcriptionPlaySnippet => '收听';

  @override
  String get transcriptionPauseSnippet => '暂停';

  @override
  String get transcriptionIntroBody =>
      '这会从书签前一点开始，收听所选长度的音频，并在你的设备上转成文字。片段越长耗时越久，转录也并非 100% 准确。完成后文字会保存到书签笔记中，方便修改或分享。';

  @override
  String get transcriptionUseEbookText => '能匹配时使用电子书的准确文字';

  @override
  String get lyricsMode => '实时转录';

  @override
  String get lyricsListeningAhead => '正在提前聆听...';

  @override
  String get lyricsDisplaySection => '实时转录';

  @override
  String get lyricsFontSize => '行大小';

  @override
  String get lyricsMaxLines => '显示行数';

  @override
  String get lyricsFullCover => '使用整个封面区域';

  @override
  String get lyricsFullCoverHint => '运行时用转录文本取代封面图，并尽可能多地容纳行数。';

  @override
  String get lyricsBatteryInfo =>
      '实时转录和跟读运行时会额外消耗电量和处理资源。在处理器较慢的手机上，文字行可能需要更久才会出现。';

  @override
  String get lyricsClearCache => '清除转录缓存';

  @override
  String lyricsClearCacheHint(String size) {
    return '已保存的转录行共 $size。清除后，相关书籍和单集会在你收听时重新转录。';
  }

  @override
  String get lyricsClearCacheConfirm => '要删除所有书籍和单集已保存的转录吗？它们会在你收听时自动重建。';

  @override
  String get lyricsCacheCleared => '转录缓存已清除';

  @override
  String get lyricsIntroBody =>
      '这会稍稍提前聆听朗读内容，并在朗读时逐行显示，转录在你的手机上完成，数据不会离开设备。开启后，请先等待几秒再按播放，让它提前一步。提前量准备好后转录才会出现，暂停状态下开始最为流畅。运行期间会额外消耗电量和处理资源。';

  @override
  String lyricsBuildingLead(String percent) {
    return '正在赶在朗读之前... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return '在 $speed 速度下，转录速度跟不上你的收听';
  }

  @override
  String get lyricsTurnOn => '开启';

  @override
  String get readAlong => '跟读';

  @override
  String get readAlongNeedsPlaying => '请先播放这本书的有声书';

  @override
  String get narrationListen => '收听';

  @override
  String get narrationPlayFromHere => '从这里播放';

  @override
  String get narrationPreparing => '正在准备朗读内容';

  @override
  String get narrationNone => '这本电子书没有可播放的朗读内容';

  @override
  String get narrationDownloadTitle => '下载后收听';

  @override
  String get narrationDownloadBody =>
      '这本书是可自动朗读的 EPUB3。Audiobookshelf 无法流式播放其朗读内容，因此需要先下载音频才能播放。';

  @override
  String get narrationDownloadStarted => '正在下载朗读内容。完成后请点按 Absorb。';

  @override
  String get narrationTextBody =>
      '这本书的 EPUB 为每一刻音频都附带了对应文字，因此文字直接取自书中。请选择要添加到书签笔记中的内容量。';

  @override
  String get narrationTextLoading => '正在从书中获取文字';

  @override
  String get downloadToAbsorb => '下载到 Absorb';

  @override
  String get narrationUpNextTitle => '下载接下来的内容';

  @override
  String narrationUpNextBody(String title) {
    return '$title 是队列中的下一项。它是可自动朗读的 EPUB3，需要先下载才能播放。';
  }

  @override
  String narrationQueueStopped(String title) {
    return '已在 $title 之前停止。下载后即可继续。';
  }

  @override
  String get transcriptionNeedsDownload => '这需要手机上有音频文件。现在下载吗？';

  @override
  String get transcriptionDownloadStarted => '正在下载。完成后请再次开启此项';

  @override
  String get readAlongFollow => '跟读跟随';

  @override
  String get syncReadingListening => '保持阅读与收听同步';

  @override
  String get syncReadingListeningHint =>
      '适用于同时有有声书和电子书的书籍。停止收听时，电子书会移到你停下的位置；离开阅读器时，有声书会移到你所在的页面。只会向前移动。';

  @override
  String get syncEbookMoved => '电子书已移到你停止收听的位置';

  @override
  String get syncAudioMoved => '有声书已移到你停止阅读的位置';

  @override
  String get syncAudioOffer => '点按以跳到你停止阅读的位置';

  @override
  String get syncFindingAudio => '正在有声书中查找你的页面';

  @override
  String get syncFindingEbook => '正在电子书中查找你的位置';

  @override
  String get syncFailed => '无法同步你的位置';

  @override
  String get syncAlreadyTogether => '已经同步';

  @override
  String get syncPosition => '同步位置';

  @override
  String get readAlongFollowHint => '逐词时间是根据转录时间戳推算的，因此在一句话内可能略有偏差。';

  @override
  String get readAlongFollowWord => '词';

  @override
  String get readAlongFollowSentence => '句';

  @override
  String get readAlongColor => '跟读颜色';

  @override
  String get readAlongLost => '在页面上找不到朗读内容';

  @override
  String get readAlongBackToNarration => '回到朗读位置';

  @override
  String get findInEbook => '在电子书中定位';

  @override
  String get findInEbookSearching => '正在电子书中查找此位置...';

  @override
  String get findInEbookNotFound => '在电子书中找不到此位置。';

  @override
  String get findInEbookNeedsEpub => '“在电子书中定位”需要 EPUB 电子书。';

  @override
  String get findInEbookNoEbook => '这本书没有电子书。';

  @override
  String get findInAudiobook => '在有声书中定位';

  @override
  String get findInAudiobookSearching => '正在有声书中查找此位置...';

  @override
  String get findInAudiobookStillSearching => '仍在音频中查找此位置...';

  @override
  String get findInAudiobookSearchingLong => '章节较长，仍在查找。这可能需要一两分钟...';

  @override
  String get findInAudiobookNotFound => '在有声书中找不到此位置。';

  @override
  String get transcriptionWhisperInfo =>
      '转录由 Whisper 提供支持，这是一个开源语音识别模型，会聆听朗读内容并写出文字，全部在此设备上完成。';

  @override
  String get transcriptionWhisperLearnMore => '详细了解 Whisper';

  @override
  String get findInAudiobookIntroBody =>
      '这会在你的设备上聆听你正在阅读位置附近的有声书，并与这段文字匹配。最多可能需要一分钟。如果无法确信地匹配到该位置，则不会移动。';

  @override
  String get findInAudiobookAfterLabel => '找到位置后';

  @override
  String get findInAudiobookStay => '继续阅读';

  @override
  String get findInAudiobookGoPlayer => '打开播放器';

  @override
  String get findInAudiobookPlaying => '正在播放有声书中的这段内容';

  @override
  String get catchUpAudioAhead => '有声书进度更靠前。点按前往。';

  @override
  String get catchUpPageAhead => '此页比有声书更靠前。点按将有声书移到这里。';

  @override
  String get readerShortcutButton => '快捷按钮';

  @override
  String get keepScreenOn => '保持屏幕常亮';

  @override
  String get keepScreenOnActive => '屏幕保持常亮';

  @override
  String get keepScreenOnUntilClosed => '屏幕保持常亮，直到你关闭应用';

  @override
  String get keepScreenOnOff => '屏幕可以再次熄灭';

  @override
  String get keepScreenOnOffUntilRestart => '在应用重启前保持关闭。设置中的开关仍为开启';

  @override
  String get keepScreenOnPlayer => '在播放器中保持屏幕常亮';

  @override
  String get keepScreenOnPlayerSubtitle => '播放器打开期间屏幕保持常亮';

  @override
  String get keepScreenOnCarMode => '在车载模式中保持屏幕常亮';

  @override
  String get keepScreenOnCarModeSubtitle => '车载模式打开期间屏幕保持常亮';

  @override
  String get loginServerType => '服务器类型';

  @override
  String get authBookOrbitDefaultPassword =>
      '此账户仍在使用默认密码。请在 BookOrbit 中更改后再重新登录。';

  @override
  String get authBookOrbitPasswordOff => '此服务器已关闭密码登录。请使用魔法链接或单点登录。';

  @override
  String get authServerIsBookOrbit => '这是 BookOrbit 服务器。请在服务器地址上方选择 BookOrbit。';

  @override
  String get authServerIsAudiobookshelf =>
      '这是 Audiobookshelf 服务器。请在服务器地址上方选择 Audiobookshelf。';

  @override
  String get castNotAvailableBookOrbit => 'BookOrbit 服务器不支持投屏';

  @override
  String get loginMagicLink => '魔法链接';

  @override
  String get loginMagicLinkDescription => '使用 BookOrbit 魔法链接登录，或粘贴密码链接来设置你的密码。';

  @override
  String get collectionPublicTitle => '公开';

  @override
  String get collectionPublicSubtitle => '此服务器上的所有人都能看到这个合集';

  @override
  String loginSignInWithProvider(String provider) {
    return '使用 $provider 登录';
  }

  @override
  String get loginSignInWithSso => '使用 SSO 登录';

  @override
  String get loginChooseSsoProvider => '选择登录方式';

  @override
  String get loginRedirectUriBookOrbit => '重定向 URI：bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => '阅读状态';

  @override
  String get readStatusHint => 'BookOrbit 会保留你在此选择的状态，直到你更改。';

  @override
  String get readStatusUnread => '未读';

  @override
  String get readStatusWantToRead => '想读';

  @override
  String get readStatusReading => '在读';

  @override
  String get readStatusOnHold => '搁置';

  @override
  String get readStatusRereading => '重读';

  @override
  String get readStatusRead => '已读';

  @override
  String get readStatusSkimmed => '略读';

  @override
  String get readStatusAbandoned => '已放弃';

  @override
  String get personalNoteTitle => '你的笔记';

  @override
  String get personalNoteAdd => '添加私人笔记';

  @override
  String get personalNoteHint => '只有你能看到这条笔记。';

  @override
  String get moreLikeThis => '类似推荐';

  @override
  String get coverSlotAudiobook => '有声书封面';

  @override
  String get coverSlotBook => '书籍封面';

  @override
  String get cardButtonFill => '按钮背景';

  @override
  String get cardButtonFillSubtitle => '播放器卡片上按钮的填充方式';

  @override
  String get cardButtonFillClear => '透明';

  @override
  String get cardButtonFillSubtle => '淡色';

  @override
  String get cardButtonFillSolid => '实色';

  @override
  String get loginBookOrbitPreview =>
      'BookOrbit 支持是新功能。播放、下载和浏览都可使用，但部分界面的外观或行为可能仍与 Audiobookshelf 相似。请在 GitHub 上关注进展，如发现异常欢迎告诉我们。';

  @override
  String get signedOutTapToSignIn => '已退出登录。点按重新登录。';

  @override
  String get authSignedOutKeepListening => '你已退出登录。已下载的内容仍可播放。点按红色云朵图标可重新登录。';

  @override
  String signedOutSyncNote(String username, String server) {
    return '退出登录期间的收听记录会保存在这部手机上，待你以 $username 重新登录 $server 后同步。任何登录该账户的方式都可以。';
  }

  @override
  String get comicReadingDirection => '阅读方向';

  @override
  String comicPageNumber(int page) {
    return '第 $page 页';
  }

  @override
  String get comicBookmarkRemoveFailed => '无法从服务器移除书签。请在联网后重试。';

  @override
  String get comicLeftToRight => '从左到右';

  @override
  String get comicRightToLeft => '从右到左（日漫）';

  @override
  String get comicNeedsConnection => '这本漫画需要从服务器逐页打开，因此需要联网。';

  @override
  String get comicNoPages => '这本漫画中没有找到页面。';

  @override
  String get boAdminTitle => '服务器管理';

  @override
  String get boAdminSubtitle => '此 BookOrbit 服务器上的用户和媒体库';

  @override
  String get boAdminUsers => '用户';

  @override
  String get boAdminLibraries => '媒体库';

  @override
  String boAdminUserCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 人',
      one: '1 人',
    );
    return '$_temp0';
  }

  @override
  String boAdminLibraryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个媒体库',
      one: '1 个媒体库',
    );
    return '$_temp0';
  }

  @override
  String get boAdminSaved => '已保存';

  @override
  String get boAdminFailed => '操作失败，请重试。';

  @override
  String get boAdminOffline => '无法连接到服务器。';

  @override
  String get boUsersSearch => '搜索用户';

  @override
  String get boUsersNone => '这里没有用户';

  @override
  String get boUsersFilterAll => '全部';

  @override
  String get boUsersFilterAdmins => '管理员';

  @override
  String get boUsersFilterActive => '已启用';

  @override
  String get boUsersFilterInactive => '已停用';

  @override
  String get boUsersFilterAttention => '需要关注';

  @override
  String get boUserBadgeAdmin => '管理员';

  @override
  String get boUserBadgeInactive => '已停用';

  @override
  String get boUserBadgeLocked => '已锁定';

  @override
  String get boUserBadgeNoPassword => '尚未设置密码';

  @override
  String boUserLastActive(String date) {
    return '最后活跃：$date';
  }

  @override
  String get boUserNeverSignedIn => '从未登录';

  @override
  String get boUserNew => '新用户';

  @override
  String get boUserCreate => '创建';

  @override
  String get boUserUsername => '用户名';

  @override
  String get boUserUsernameHint => '至少 3 个字符，之后无法更改。';

  @override
  String get boUserName => '姓名';

  @override
  String get boUserEmail => '电子邮件';

  @override
  String get boUserEmailInvalid => '请输入有效的电子邮件地址';

  @override
  String get boUserActive => '已启用';

  @override
  String get boUserActiveSubtitle => '已停用的用户无法登录';

  @override
  String get boUserAdmin => '管理员';

  @override
  String get boUserAdminSubtitle => '拥有服务器上所有内容的完全访问权限';

  @override
  String get boUserAdminHasAll => '管理员拥有所有权限，并能看到所有媒体库。';

  @override
  String get boUserPermissions => '权限';

  @override
  String get boUserPresetNone => '无';

  @override
  String get boUserPresetStandard => '标准';

  @override
  String get boUserPresetEverything => '全部';

  @override
  String get boUserLibraries => '媒体库';

  @override
  String get boUserLibrariesHint => '此人可以看到的媒体库。';

  @override
  String get boUserPasswordLink => '发送密码链接';

  @override
  String get boUserPasswordLinkSubtitle => '用于设置新密码的链接，15 分钟内有效';

  @override
  String get boUserExternal => '通过单点登录登录，因此密码在那里管理。';

  @override
  String get boUserUnlock => '解锁账户';

  @override
  String get boUserUnlocked => '账户已解锁';

  @override
  String get boUserDelete => '删除用户';

  @override
  String boUserDeleteTitle(String name) {
    return '删除 $name？';
  }

  @override
  String get boUserDeleteBody => '其账户以及在此服务器上的所有内容都会被移除，且无法撤销。';

  @override
  String get boUserDeleted => '用户已删除';

  @override
  String get boUserLinkTitle => '密码链接';

  @override
  String boUserLinkBody(String name) {
    return '请将此链接分享给 $name。他们可以用它设置密码，15 分钟内有效。';
  }

  @override
  String get boPasswordRules => '至少 8 个字符，包含大写字母、小写字母和数字。';

  @override
  String get boSetPasswordTitle => '设置你的密码';

  @override
  String get boSetPasswordSubmit => '设置密码并登录';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return '为 $server 上的 $username 选择一个密码。';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return '为你在 $server 上的账户选择一个密码。';
  }

  @override
  String get boSetPasswordStartingBody => '此账户仍在使用创建时的密码。请选择新密码以完成登录。';

  @override
  String get boSetPasswordTrust => '仅在你信任发送此链接的人时才继续。';

  @override
  String get boPasswordLinkExpired => '此链接已过期或已被使用。请向服务器管理员索取新的链接。';

  @override
  String boPasswordSetSignInFailed(String error) {
    return '密码已设置，但登录失败：$error';
  }

  @override
  String get boChangePasswordSubtitle => '更新你的 BookOrbit 密码';

  @override
  String get boPasswordChangeEffect => '更改密码会让你在 BookOrbit 上的其他会话退出登录。此设备保持登录。';

  @override
  String get boPasswordChanged => '密码已更改。其他已登录的设备已退出登录。';

  @override
  String boPasswordShareDescription(String username) {
    return '发送此链接，或让 $username 扫描二维码，以选择密码并登录 Absorb。15 分钟内有效。';
  }

  @override
  String boPasswordShareWarning(String username) {
    return '在使用或过期之前，任何拿到此链接的人都可以为 $username 选择密码。';
  }

  @override
  String get setupLinkCopyWebLink => '复制网页链接';

  @override
  String get boUserLinkCopy => '复制链接';

  @override
  String get boUserLinkCopied => '链接已复制';

  @override
  String get boUserLinkShare => '分享';

  @override
  String get boUserNoLink => '用户已添加，但服务器没有返回密码链接。请从其页面发送一个。';

  @override
  String get boPermGroupLibrary => '媒体库和书籍';

  @override
  String get boPermGroupRequests => '书籍请求';

  @override
  String get boPermGroupDevices => '设备';

  @override
  String get boPermGroupIntegrations => '阅读集成';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => '电子邮件和通知';

  @override
  String get boPermGroupAdmin => '管理';

  @override
  String get boPermLibraryDownload => '下载书籍';

  @override
  String get boPermLibraryUpload => '上传书籍';

  @override
  String get boPermLibraryEditMetadata => '编辑元数据';

  @override
  String get boPermLibraryDeleteBooks => '删除书籍';

  @override
  String get boPermBookRequestAccess => '请求书籍';

  @override
  String get boPermBookRequestAutoApprove => '请求自动获批';

  @override
  String get boPermBookRequestSelfFulfill => '直接下载所请求的书籍';

  @override
  String get boPermManageBookRequests => '管理书籍请求';

  @override
  String get boPermKoboSync => 'Kobo 同步';

  @override
  String get boPermKoreaderSync => 'KOReader 同步';

  @override
  String get boPermOpdsAccess => 'OPDS 访问';

  @override
  String get boPermHardcoverSync => 'Hardcover 同步';

  @override
  String get boPermReadwiseSync => 'Readwise 同步';

  @override
  String get boPermStorygraphSync => 'StoryGraph 同步';

  @override
  String get boPermBookDockAccess => '使用 Book Dock';

  @override
  String get boPermManageBookDock => '管理 Book Dock';

  @override
  String get boPermEmailSend => '通过电子邮件发送书籍';

  @override
  String get boPermNotificationAccess => '通知';

  @override
  String get boPermManageEmail => '管理电子邮件';

  @override
  String get boPermManageLibraries => '管理媒体库';

  @override
  String get boPermManageMetadataConfig => '元数据设置';

  @override
  String get boPermManageIcons => '管理图标';

  @override
  String get boPermManageUsers => '管理用户';

  @override
  String get boPermViewUserActivity => '查看用户活动';

  @override
  String get boPermViewAuditLog => '查看审计日志';

  @override
  String get boPermManageAppSettings => '应用设置';

  @override
  String get boLibsNone => '还没有媒体库';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 本书',
      one: '1 本书',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => '立即扫描';

  @override
  String get boLibScanStarted => '扫描已开始';

  @override
  String get boLibScanning => '正在扫描';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return '扫描于 $date：新增 $added，更新 $updated，缺失 $missing';
  }

  @override
  String get boLibScanFailed => '上次扫描失败';

  @override
  String get boLibNeverScanned => '尚未扫描';

  @override
  String get boLibNew => '新建媒体库';

  @override
  String get boLibName => '名称';

  @override
  String get boLibNeedName => '请为媒体库命名';

  @override
  String get boLibIcon => '图标';

  @override
  String get boLibFolders => '文件夹';

  @override
  String get boLibFoldersHint => '服务器上存放此媒体库书籍的文件夹。';

  @override
  String get boLibNeedFolder => '请至少添加一个文件夹';

  @override
  String get boLibAddFolder => '添加文件夹';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件',
      one: '1 个文件',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return '已在 $library 中使用';
  }

  @override
  String get boLibFolderUnreadable => '服务器无法读取此文件夹';

  @override
  String get boLibFolderRescan => '更改文件夹会重新扫描媒体库。';

  @override
  String get boLibOrganization => '书籍存储方式';

  @override
  String get boLibPerFolder => '每个文件夹一本书';

  @override
  String get boLibPerFile => '每个文件一本书';

  @override
  String get boLibOrganizationFixed => '媒体库创建后无法更改。';

  @override
  String get boLibWatch => '监视变化';

  @override
  String get boLibWatchSubtitle => '新增和更改的文件出现时自动识别';

  @override
  String get boLibSchedule => '定时扫描';

  @override
  String get boLibScheduleOff => '关闭';

  @override
  String get boLibScheduleDaily => '每天';

  @override
  String get boLibScheduleWeekly => '每周';

  @override
  String boLibScheduleCustom(String cron) {
    return '自定义（$cron）';
  }

  @override
  String get boLibScheduleHint => '在服务器时间凌晨 3 点运行。';

  @override
  String get boLibCovers => '封面形状';

  @override
  String get boLibCoverBook => '书籍 (2:3)';

  @override
  String get boLibCoverSquare => '方形 (1:1)';

  @override
  String get boLibAccess => '谁可以看到';

  @override
  String get boLibAccessHint => '管理员可看到所有媒体库，其他人需要在此获得访问权限。';

  @override
  String get boLibAccessNone => '目前仅限管理员';

  @override
  String get boLibAccessAdd => '添加用户';

  @override
  String get boLibAccessEveryoneHas => '所有人都已有访问权限';

  @override
  String get boLibLevelViewer => '查看者';

  @override
  String get boLibLevelEditor => '编辑者';

  @override
  String get boLibLevelOwner => '所有者';

  @override
  String get boLibAccessRemove => '移除访问权限';

  @override
  String get boLibDelete => '删除媒体库';

  @override
  String boLibDeleteTitle(String name) {
    return '删除 $name？';
  }

  @override
  String get boLibDeleteBody => '该媒体库及其书籍的进度和高亮会从 BookOrbit 中移除。服务器上的文件保持原样。';

  @override
  String get boLibDeleted => '媒体库已删除';

  @override
  String get boFolderPickTitle => '选择文件夹';

  @override
  String get boFolderUseThis => '使用此文件夹';

  @override
  String get boFolderEmpty => '里面没有文件夹';

  @override
  String get statsTotalTime => '总时间';

  @override
  String get statsTotalReadingTime => '总阅读时间';

  @override
  String statsDaysOfTime(String days) {
    return '相当于 $days 天';
  }

  @override
  String statsHoursOfTime(String hours) {
    return '相当于 $hours 小时';
  }

  @override
  String get statsMediaAll => '全部';

  @override
  String get statsMediaListening => '收听';

  @override
  String get statsMediaReading => '阅读';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'BookOrbit 按 $server 来计算你的天数，但这部手机设置为 $phone。一天中较晚的时间可能会被计入错误的日期。';
  }

  @override
  String statsZoneUse(String zone) {
    return '使用 $zone';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'BookOrbit 现在使用 $zone。较早的日期可能需要几分钟才能更新。';
  }

  @override
  String get statsZoneFailed => '无法更改 BookOrbit 上的时区';

  @override
  String get statsTimeOfDay => '一天中的时段';

  @override
  String statsBusiestAround(String time) {
    return '最活跃时段约在 $time';
  }

  @override
  String get statsFinishedByMonth => '每月听完的书籍';

  @override
  String statsFinishedLast12(int count) {
    return '最近 12 个月共 $count 本';
  }

  @override
  String get statsWhereTitle => '你在哪里收听和阅读';

  @override
  String get statsLast12Months => '最近 12 个月';

  @override
  String get statsHabits => '习惯';

  @override
  String get statsTypicalSession => '典型会话';

  @override
  String get statsProgressPerSession => '每次会话的进度';

  @override
  String get statsTimeToFinish => '读完所需时间';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天',
      one: '1 天',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => '已开始的书籍';

  @override
  String get statsBooksInProgress => '进行中';

  @override
  String get statsAverageProgress => '平均进度';

  @override
  String get statsTopBooks => '热门书籍';

  @override
  String get statsYearRead => '已读';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条未读',
      one: '1 条未读',
      zero: '没有新通知',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => '全部标为已读';

  @override
  String get boNotificationsClearAll => '全部清除';

  @override
  String get boNotificationsClearTitle => '清除所有通知？';

  @override
  String get boNotificationsClearBody => '这会移除你 BookOrbit 账户中的所有通知。';

  @override
  String get boNotificationsEmpty => '还没有通知';

  @override
  String get boNotificationsLoadFailed => '无法加载通知';

  @override
  String get boNotificationsUpdateFailed => '无法更新 BookOrbit 上的通知';

  @override
  String boNotificationsOccurrences(int count) {
    return '发生了 $count 次';
  }

  @override
  String get boNotificationsSettings => '通知设置';

  @override
  String get boNotificationsSettingsIntro => '选择 BookOrbit 为你保留哪些通知。';

  @override
  String get boNotificationsProblemsHint => '“问题”仅在出现失败或需要关注的情况时通知你。';

  @override
  String get boNotificationLevelOff => '关闭';

  @override
  String get boNotificationLevelProblems => '问题';

  @override
  String get boNotificationLevelAll => '全部';

  @override
  String get boNotificationsSaved => '通知设置已保存';

  @override
  String get boNotificationsSaveFailed => '无法保存通知设置';

  @override
  String get boNotificationGroupLibrary => '媒体库';

  @override
  String get boNotificationGroupFiles => '文件';

  @override
  String get boNotificationGroupIntegrations => '集成';

  @override
  String get boNotificationGroupPersonal => '个人';

  @override
  String get boNotifyScanning => '媒体库扫描';

  @override
  String get boNotifyScanningDesc => '媒体库扫描完成、失败或发现缺失书籍时。';

  @override
  String get boNotifyMetadata => '元数据获取';

  @override
  String get boNotifyMetadataDesc => '你的书籍的元数据查询完成或失败时。';

  @override
  String get boNotifyAuthorEnrichment => '作者详情';

  @override
  String get boNotifyAuthorEnrichmentDesc => '作者简介和照片下载完成时。';

  @override
  String get boNotifyFileWriteBack => '写入文件';

  @override
  String get boNotifyFileWriteBackDesc => '编辑后的详情保存到磁盘上的书籍文件时。';

  @override
  String get boNotifyFileRename => '文件重命名';

  @override
  String get boNotifyFileRenameDesc => '书籍文件按你的命名规则重命名时。';

  @override
  String get boNotifyBulkRename => '批量重命名';

  @override
  String get boNotifyBulkRenameDesc => '批量重命名多本书，或在媒体库之间移动书籍完成或失败时。';

  @override
  String get boNotifyMigration => '导入';

  @override
  String get boNotifyMigrationDesc => '从其他媒体库应用导入完成或失败时。';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc => 'Book Dock 添加书籍完成或遇到问题时。';

  @override
  String get boNotifyBookRequests => '书籍请求';

  @override
  String get boNotifyBookRequestsDesc => '书籍请求被提交或有结果，或书籍可用时。';

  @override
  String get boNotifyEmail => '邮件投递';

  @override
  String get boNotifyEmailDesc => '通过电子邮件发送书籍成功或失败时。';

  @override
  String get boNotifyAchievements => '成就';

  @override
  String get boNotifyAchievementsDesc => '你解锁新成就时。';

  @override
  String get achievementsTitle => '成就';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return '已获得 $earned/$total';
  }

  @override
  String get achievementsFilterAll => '全部';

  @override
  String get achievementsFilterEarned => '已获得';

  @override
  String get achievementsFilterInProgress => '进行中';

  @override
  String get achievementsFilterLocked => '未解锁';

  @override
  String get achievementsCategoryReading => '阅读';

  @override
  String get achievementsCategoryLibrary => '媒体库';

  @override
  String get achievementsCategoryExploration => '探索';

  @override
  String get achievementsCategoryDedication => '坚持';

  @override
  String get achievementsCategoryDevices => '设备';

  @override
  String get achievementsRarityCommon => '普通';

  @override
  String get achievementsRarityRare => '稀有';

  @override
  String get achievementsRarityEpic => '史诗';

  @override
  String get achievementsRarityLegendary => '传说';

  @override
  String get achievementsLoadFailed => '无法加载成就';

  @override
  String get achievementsNoneMatch => '没有符合此筛选条件的成就';

  @override
  String get achievementsSecretName => '隐藏成就';

  @override
  String get achievementsSecretHint => '继续阅读来揭晓这一项。';

  @override
  String achievementsEarnedOn(String date) {
    return '获得于 $date';
  }

  @override
  String achievementsWhileReading(String title) {
    return '阅读 $title 时';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return '第 $earned/$total 级';
  }

  @override
  String get achievementsTiers => '等级';

  @override
  String get achievementsAllTiers => '已获得所有等级';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold 本书';
  }

  @override
  String achievementsProgressPages(String current, String threshold) {
    return '$current / $threshold 页';
  }

  @override
  String achievementsProgressHours(String current, String threshold) {
    return '$current / $threshold 小时';
  }

  @override
  String achievementsProgressAnnotations(String current, String threshold) {
    return '$current / $threshold 条高亮和笔记';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold 个评分';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $threshold 个分类';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold 种语言';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold 天';
  }

  @override
  String get achievementsHowToGetIt => '获取方式';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '最近 $days 天你阅读了 $count 小时。',
      one: '最近 $days 天你阅读了 1 小时。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '按此节奏约需 $count 天。',
      one: '按此节奏约需 1 天。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '按此节奏约需 $count 周。',
      one: '按此节奏约需 1 周。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '按此节奏约需 $count 个月。',
      one: '按此节奏约需 1 个月。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你的书架上有 $count 本 $decade 年代的书等你来读。',
      one: '你的书架上有 1 本 $decade 年代的书等你来读。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你的书架上有 $count 本 $century 世纪的书等你来读。',
      one: '你的书架上有 1 本 $century 世纪的书等你来读。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return '$title 已读 $percent，开始于 $date。';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return '$title 开始于 $date。';
  }

  @override
  String get achievementsHintUntitledBook => '一本进行中的书';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 本进行中的书已超过 $percent。',
      one: '有 1 本进行中的书已超过 $percent。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你读完的书中有 $count 本还没有评分。',
      one: '你读完的书中有 1 本还没有评分。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你的书架上有 $count 本不足 $pages 页的书等你来读。',
      one: '你的书架上有 1 本不足 $pages 页的书等你来读。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '其中 $count 本已在进行中。',
      one: '其中 1 本已在进行中。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你的书架上有 $count 本 $pages 页或以上的书等你来读。',
      one: '你的书架上有 1 本 $pages 页或以上的书等你来读。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你的书架上有 $count 本出版于 $year 年之前的书等你来读。',
      one: '你的书架上有 1 本出版于 $year 年之前的书等你来读。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author：已读完 $finished 本，书架上还有 $count 本。';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你的书架上有 $count 本$language书籍等你来读。',
      one: '你的书架上有 1 本$language书籍等你来读。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$year 年至今你已有 $count 个月进行了阅读。',
      one: '$year 年至今你已有 1 个月进行了阅读。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '还剩 $months。',
      one: '还剩 $months。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return '你的书架上还没有 $pages 页或以上的书。';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return '你的书架上没有出版于 $year 年之前的书。';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你的书架目前仅跨越 $count 个年代。',
      one: '你的书架目前仅跨越 1 个年代。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你的书架目前仅跨越 $count 个世纪。',
      one: '你的书架目前仅跨越 1 个世纪。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return '你在 $month 没有阅读，因此 $year 年已无法达成。计数将在 1 月重新开始。';
  }

  @override
  String get achievementsSwitch => '成就';

  @override
  String get achievementsSwitchSubtitle =>
      '在 BookOrbit 上记录成就。关闭后，这里和网页上都会隐藏成就。';

  @override
  String get achievementsTurnedOn => '成就已开启';

  @override
  String get achievementsTurnedOff => '成就已关闭';

  @override
  String get achievementsSwitchFailed => '无法更改 BookOrbit 上的成就设置';

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
  String get recentSearchesTitle => '最近搜索';

  @override
  String get recentSearchesClear => '清除';

  @override
  String get recentSearchesRemove => '移除';

  @override
  String get removedSeriesTapToUndo => '已从“继续系列”中移除。点按可撤销。';

  @override
  String get seriesBackOnContinueSeries => '已恢复到“继续系列”';

  @override
  String get desktopShortcutPlayPause => '播放 / 暂停';

  @override
  String get desktopShortcutRewind => '后退';

  @override
  String get desktopShortcutForward => '快进';

  @override
  String get desktopShortcutSlower => '降低播放速度';

  @override
  String get desktopShortcutFaster => '提高播放速度';

  @override
  String get desktopShortcutNormalSpeed => '重置播放速度';

  @override
  String get desktopShortcutSearch => '打开搜索';

  @override
  String get desktopShortcutLibrary => '打开媒体库';

  @override
  String get desktopShortcutNowPlaying => '打开正在播放';

  @override
  String get desktopShortcutFullScreen => '全屏';

  @override
  String get desktopShortcutClosePlayer => '关闭全屏播放器';

  @override
  String get desktopShortcutBack => '返回（关闭最上层的页面或面板）';

  @override
  String get desktopShortcutRefresh => '刷新当前屏幕上的列表';

  @override
  String get desktopShortcutPreviousCard => '上一张“正在收听”卡片';

  @override
  String get desktopShortcutNextCard => '下一张“正在收听”卡片';

  @override
  String get desktopShortcutContextMenu => '打开长按菜单';

  @override
  String get desktopShortcutMouseBack => '鼠标后退键';

  @override
  String get desktopShortcutRightClick => '右键单击';

  @override
  String get desktopShortcutDragShelves => '横向拖动书架和卡片';

  @override
  String get desktopShortcutMouseDrag => '点击并拖动';

  @override
  String get fileHealthAction => '检查文件';

  @override
  String get fileHealthTitle => '检查文件';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '全部 $count 个文件看起来都正常',
      one: '文件看起来正常',
      zero: '看起来一切正常',
    );
    return '$_temp0';
  }

  @override
  String fileHealthProblems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '发现 $count 个问题',
      one: '发现 1 个问题',
    );
    return '$_temp0';
  }

  @override
  String get fileHealthReadOnlyNote => '这只会读取服务器已报告的信息，不会更改任何内容。';

  @override
  String get fileHealthLocalChecked => '也检查了此设备上已下载的文件。';

  @override
  String get fileHealthItemMissing => '书籍文件夹缺失';

  @override
  String get fileHealthItemMissingInfo =>
      '服务器再也找不到这本书的文件夹。它可能已被移动、重命名或删除，或者所在的驱动器已离线。在服务器上扫描媒体库可能会重新找到它。';

  @override
  String get fileHealthItemInvalid => '书籍被标记为无效';

  @override
  String get fileHealthItemInvalidInfo => '服务器没有为这本书找到可用的音频或电子书文件。';

  @override
  String get fileHealthInvalidFiles => '无法读取的文件';

  @override
  String get fileHealthInvalidFilesInfo =>
      '服务器无法读取这些文件。它们可能已损坏或格式不受支持，播放时可能会在此处停止或跳过。';

  @override
  String get fileHealthEmptyFiles => '没有时长的文件';

  @override
  String get fileHealthEmptyFilesInfo => '这些文件报告的时长为零，因此没有可播放的内容。它们通常是空文件或被截断。';

  @override
  String get fileHealthTrackGaps => '文件之间有间隔';

  @override
  String get fileHealthTrackGapsInfo => '这些文件之间，书籍的时间轴向前跳跃，留下一段没有任何声音的时间。';

  @override
  String get fileHealthTrackOverlaps => '文件重叠';

  @override
  String get fileHealthTrackOverlapsInfo =>
      '这些文件在书籍的时间轴上重叠，因此其中一部分可能被跳过，或者位置会发生跳变。';

  @override
  String get fileHealthDurationMismatch => '时长对不上';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return '这些文件加起来共 $actual，但书籍标明的时长为 $expected。进度和章节可能不准。通常在服务器上重新扫描即可解决。';
  }

  @override
  String get fileHealthLowBitrate => '低音质音频';

  @override
  String get fileHealthLowBitrateInfo => '这些文件的编码比特率低于 32 kbps，听起来可能比较沉闷。';

  @override
  String get fileHealthMixedSampleRates => '采样率不一致';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      '这些文件以不同的采样率录制。大多数播放器能够应对，但有些在一个文件结束、下一个文件开始的地方可能出现爆音或速度变化。';

  @override
  String get fileHealthMixedChannels => '单声道和立体声混用';

  @override
  String get fileHealthMixedChannelsInfo => '部分文件的声道数与其他文件不同，因此文件之间的声音可能会发生变化。';

  @override
  String get fileHealthChaptersPastEnd => '章节超出结尾';

  @override
  String get fileHealthChaptersPastEndInfo =>
      '这些章节的开始或结束时间晚于音频结束时间，因此跳转到它们可能没有任何效果。';

  @override
  String get fileHealthLocalMissing => '已下载的文件缺失';

  @override
  String get fileHealthLocalMissingInfo =>
      '这些已下载的文件已不在此设备上。离线播放时，本应播放它们的位置会失败。';

  @override
  String get fileHealthLocalSizeMismatch => '已下载的文件不一致';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      '这些已下载的文件与服务器上副本的大小不同，因此可能不完整或已损坏。';

  @override
  String fileHealthStartsAt(String time) {
    return '开始于 $time';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return '本地 $local，服务器 $server';
  }

  @override
  String fileHealthSampleRate(String value) {
    return '$value kHz';
  }

  @override
  String get fileHealthMono => '单声道';

  @override
  String get fileHealthStereo => '立体声';

  @override
  String get fileHealthRedownload => '重新下载这本书';

  @override
  String get fileHealthRedownloadQuestion => '重新下载这本书？';

  @override
  String get fileHealthRedownloadInfo =>
      '此设备上的副本将被移除，并从服务器重新下载。如果这本书正在播放，播放会停止。服务器上不会有任何更改。';

  @override
  String get fileHealthNotAvailableOffline => '请连接服务器以重新下载';

  @override
  String get playerReconnecting => '连接已断开，正在重新连接…';

  @override
  String get playerReconnectFailed => '无法重新连接到服务器，播放已停止。';

  @override
  String get downloadsFailed => '下载失败';

  @override
  String get absorbingReorderQueue => '调整队列顺序';

  @override
  String get playAction => '播放';

  @override
  String get pauseAction => '暂停';

  @override
  String get rmabImportBooks => '导入书籍';

  @override
  String get rmabImportBooksSubtitle => '搜索 ReadMeABook 并选择要请求的书籍';

  @override
  String get rmabImportBooksConnectSubtitle => '请先用 URL 和令牌连接 ReadMeABook';

  @override
  String get windowsSettingsTitle => 'Windows 设置';

  @override
  String get updateCheckFrequency => '自动检查更新';

  @override
  String get updateCheckFrequencySubtitle => '仅检查更新；安装始终需要手动操作。';

  @override
  String get updateCheckOnStartup => '启动时（每 12 小时一次）';

  @override
  String get updateCheckEverySixHours => '每 6 小时';

  @override
  String get updateCheckEveryTwelveHours => '每 12 小时';

  @override
  String get updateCheckDaily => '每天';

  @override
  String get updateCheckNever => '从不自动检查';

  @override
  String onLatestVersionDetail(String version) {
    return '你使用的已是最新版本 ($version)';
  }

  @override
  String get updateCheckFailed => '无法连接到 GitHub 检查更新。请检查网络连接后重试。';

  @override
  String get playlistDetailAddBooks => '添加书籍到播放列表';

  @override
  String get playlistDetailSwitchToList => '切换到列表视图';

  @override
  String get playlistDetailSwitchToGrid => '切换到网格视图';

  @override
  String get adminUploadIndexing => '上传完成，正在等待 Audiobookshelf 建立索引...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return '已上传“$title”，Audiobookshelf 仍在建立索引';
  }

  @override
  String get adminUploadPermissionDenied =>
      '你的 Audiobookshelf 账户没有上传权限。请让服务器管理员为你的账户启用上传权限。';

  @override
  String get uiThemeLabel => '界面主题';

  @override
  String get uiThemePickerTitle => '选择外观';

  @override
  String get uiThemePickerIntro => '你可以随时在“设置 > 外观 > 界面主题”中更改。';

  @override
  String get uiThemePlusName => '标准';

  @override
  String get uiThemePlusDescription =>
      '常见的 Absorb Plus 外观，面板为实色填充，并带有来自封面颜色的柔和光晕。';

  @override
  String get uiThemeMidnightName => '午夜';

  @override
  String get uiThemeMidnightDescription => '纯黑背景，细边框、无光晕，专为 OLED 屏幕设计。';

  @override
  String get uiThemeContinue => '继续';

  @override
  String get uiThemeFrostedName => '磨砂';

  @override
  String get uiThemeFrostedDescription => '柔和的磨砂玻璃面板，透出封面颜色的光彩。';

  @override
  String get uiThemeColorTitle => '选择颜色';

  @override
  String get uiThemeColorIntro => '这与“设置 > 外观 > 颜色来源”是同一项设置。';

  @override
  String get uiThemeColorFromCover => '来自封面';

  @override
  String get uiThemeBack => '返回';

  @override
  String get uiThemeTryIt => '试用';

  @override
  String uiThemePreviewing(String name) {
    return '正在预览 $name';
  }

  @override
  String get uiThemeKeep => '保留';

  @override
  String get uiThemeGoBack => '返回';

  @override
  String get uiThemeGlass => '玻璃效果';

  @override
  String get uiThemeGlassLight => '轻';

  @override
  String get uiThemeGlassMedium => '中';

  @override
  String get uiThemeGlassStrong => '强';

  @override
  String get uiThemeDetails => '外观细节';

  @override
  String get uiThemeFullCovers => '完整画质封面';

  @override
  String get uiThemeFullCoversSubtitle => '封面更清晰，但占用更多内存';

  @override
  String get uiThemeExtraBadges => '额外封面标记';

  @override
  String get uiThemeExtraBadgesSubtitle => '电子书标记，以及“继续收听”上的已保存标签';

  @override
  String get uiThemeReadingShelf => '将“继续阅读”显示为书架';

  @override
  String get uiThemeReadingShelfSubtitle => '使用普通的首页书架，而不是大卡片';

  @override
  String get uiThemeCompactHeader => '紧凑的标题栏按钮';

  @override
  String get uiThemeCompactHeaderSubtitle => '页面标题栏按钮保持小尺寸';

  @override
  String get uiThemePlainWording => '通俗用语';

  @override
  String get uiThemePlainWordingOnSubtitle => '使用“播放”“正在播放”“已听完”';

  @override
  String get uiThemePlainWordingOffSubtitle => '使用“Absorb”“正在收听”“完全吸收”';

  @override
  String get uiThemeSearchClassic => '经典';

  @override
  String whatsNewSheetTitle(String name) {
    return '$name 的新变化';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return '从 $name 更新';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return '构建 $number';
  }

  @override
  String get whatsNewFullNotes => '在 GitHub 上查看完整说明';

  @override
  String get whatsNewLoading => '正在加载更新内容';

  @override
  String get whatsNewLoadFailed => '无法加载更新说明';

  @override
  String get whatsNewLoadFailedHint => '请检查网络连接，或前往 GitHub 阅读。';

  @override
  String get whatsNewOpenGitHub => '在 GitHub 上打开';

  @override
  String get settingsSeeWhatsNew => '查看新变化';

  @override
  String get settingsSeeWhatsNewSubtitle => '此版本的发行说明';

  @override
  String get windowsCloseToTray => '关闭到托盘';

  @override
  String get windowsCloseToTraySubtitle =>
      '关闭窗口后，Absorb Plus 会继续在通知区域运行。请从托盘图标退出。';

  @override
  String get windowsStartWithWindows => '随 Windows 启动';

  @override
  String get windowsStartWithWindowsSubtitle => '登录 Windows 时打开 Absorb Plus';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return '启动：$command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return '已设置启动另一份副本：$command。开启后将改为使用此副本。';
  }

  @override
  String get windowsStartupDisabledBySystem => '已在任务管理器的“启动应用”中关闭。请在那里重新开启。';

  @override
  String get windowsStartMinimized => '启动时最小化';

  @override
  String get windowsStartMinimizedSubtitle =>
      '随 Windows 启动时保持在托盘中（若未开启“关闭到托盘”，则最小化）';

  @override
  String get windowsAlwaysOnTop => '始终置顶';

  @override
  String get windowsAlwaysOnTopSubtitle => '让窗口保持在其他窗口之上';

  @override
  String get windowsKeepAwake => '播放或下载时让电脑保持唤醒';

  @override
  String get windowsKeepAwakeSubtitle => '阻止电脑进入睡眠。屏幕仍可熄灭。';

  @override
  String get windowsSettingFailed => 'Windows 未接受该更改';

  @override
  String get windowsGlobalHotkeys => '全局热键';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Absorb Plus 在后台时也有效：Ctrl+Alt+Space 播放/暂停，Ctrl+Alt+Left/Right 后退/前进，Ctrl+Alt+Up/Down 音量，Ctrl+Alt+B 添加书签';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return '已被其他应用占用，不可用：$keys';
  }

  @override
  String get windowsTrayShow => '显示 Absorb Plus';

  @override
  String get windowsTrayQuit => '退出 Absorb Plus';

  @override
  String get windowsTaskbarPlay => '播放';

  @override
  String get windowsTaskbarPause => '暂停';

  @override
  String get windowsTaskbarRewind => '后退';

  @override
  String get windowsTaskbarForward => '快进';

  @override
  String windowsJumpListResume(String title) {
    return '继续 $title';
  }

  @override
  String get githubProjectTitle => 'GitHub 上的 Absorb Plus';

  @override
  String get precacheTitle => '预加载封面和书籍页面';

  @override
  String get precacheSubtitle => '在 Wi-Fi 或有线连接下于后台获取，让页面瞬间打开。只占用少量磁盘空间，不占用内存。';

  @override
  String get githubProjectSubtitle => '发行版、源代码和项目动态';

  @override
  String get supportSaveLogsSubtitle => '保存日志文件，以便附加到 GitHub issue';

  @override
  String get supportSaveLogsDialogTitle => '保存 Absorb Plus 日志';

  @override
  String supportLogsSaved(String path) {
    return '日志已保存到 $path';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return '无法保存日志：$error';
  }

  @override
  String get supportOpenLogsFolder => '打开日志文件夹';

  @override
  String get supportOpenLogsFolderSubtitle => '在文件管理器中显示日志文件';

  @override
  String get supportOpenLogsFolderFailed => '无法打开日志文件夹';

  @override
  String get desktopDownloadFolderOpen => '在资源管理器中打开';

  @override
  String get desktopDownloadFolderOpenLinux => '打开文件夹';

  @override
  String get desktopDownloadFolderOpenFailed => '无法打开该文件夹';

  @override
  String get desktopDownloadFolderNotWritable =>
      'Absorb 无法在该文件夹中保存文件，请选择其他文件夹。';

  @override
  String get desktopDownloadFolderPickFailed => '无法显示文件夹选择器';

  @override
  String get desktopDownloadFolderNetworkPath =>
      '网络文件夹 (\\\\server\\share) 无法存放下载内容。请在文件资源管理器中将该共享映射为盘符（例如 Z:），然后选择该盘符。';

  @override
  String get desktopDownloadFolderDefault => '默认文件夹';

  @override
  String get bookSettingsTitle => '书籍设置';

  @override
  String bookSettingsSeries(String name) {
    return '系列：$name';
  }

  @override
  String get bookSettingsSpeed => '速度';

  @override
  String get bookSettingsSpeedFromSeries => '沿用你在此系列中上一本播放的速度';

  @override
  String get bookSettingsSkipIntro => '跳过片头';

  @override
  String get bookSettingsSkipIntroHint => '仅在书籍从头开始播放时生效';

  @override
  String get bookSettingsSkipOutro => '跳过片尾';

  @override
  String get bookSettingsSkipOutroHint => '提前结束本书并标记为已听完';

  @override
  String get bookSettingsSkipOff => '关闭';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get bookSettingsWholeSeries => '用于整个系列';

  @override
  String get bookSettingsWholeSeriesHint => '片头和片尾设置适用于此系列中的每本书';

  @override
  String get bookSettingsReset => '重置';

  @override
  String get bookSettingsResetDone => '书籍设置已重置';

  @override
  String get adminDashTitle => '仪表盘';

  @override
  String get adminDashSubtitle => '一览谁在收听、媒体库、用户和服务器警告';

  @override
  String get adminDashNobodyListening => '目前没有人在收听';

  @override
  String adminDashOnlineNames(String names) {
    return '在线：$names';
  }

  @override
  String get adminDashListeningHistory => '收听历史';

  @override
  String get adminDashCouldNotLoad => '无法从服务器加载此内容';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个项目',
      one: '1 个项目',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => '全部扫描';

  @override
  String get adminDashScanAllTitle => '扫描所有媒体库？';

  @override
  String get adminDashScanAllContent =>
      'Audiobookshelf 会在每个媒体库中查找新增、更改和缺失的文件。媒体库较大时可能需要一段时间。';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已开始扫描 $count 个媒体库',
      one: '已开始扫描 1 个媒体库',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return '$total 个扫描中有 $failed 个无法启动';
  }

  @override
  String get adminDashNoLibraries => '还没有媒体库';

  @override
  String get adminDashBackUpNow => '立即备份';

  @override
  String adminDashLastBackup(String time) {
    return '上次备份：$time';
  }

  @override
  String get adminDashNoBackups => '还没有备份';

  @override
  String get adminDashManageUsers => '管理用户';

  @override
  String get adminDashNeverSeen => '从未登录';

  @override
  String get adminDashDisabled => '已禁用';

  @override
  String get adminDashLocked => '已锁定';

  @override
  String get adminDashServerWarnings => '服务器警告';

  @override
  String get adminDashNoProblems => '今天的日志中没有警告或错误';

  @override
  String get adminDashAllLogs => '所有服务器日志';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale（内置）';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => '键盘快捷键';

  @override
  String get desktopShortcutsSubtitle => '播放、速度、搜索和导航控制';

  @override
  String get desktopShortcutsClose => '关闭';

  @override
  String get tailscaleConnect => '使用 Tailscale 连接';

  @override
  String get tailscaleConnectHint => '在浏览器中打开 Tailscale 登录页面';

  @override
  String get tailscaleTurnOff => '关闭';

  @override
  String get tailscaleCardPitch => '无需开启 Tailscale VPN，即可在你的 tailnet 上访问服务器';

  @override
  String get tailscaleIntro =>
      '无需开启 Tailscale 应用的 VPN，即可访问你 tailnet 上的服务器。Absorb 会作为独立设备加入你的 tailnet，仅用于它自己的连接。测试功能，默认关闭。';

  @override
  String get tailscaleUseSwitch => '使用内置 Tailscale';

  @override
  String get tailscaleStatusOff => '关闭';

  @override
  String get tailscaleStatusStarting => '正在连接…';

  @override
  String get tailscaleStatusNeedsLogin => '请登录以将此设备添加到你的 tailnet';

  @override
  String get tailscaleStatusNeedsApproval => '正在等待管理员批准此设备';

  @override
  String tailscaleStatusConnected(String user) {
    return '已连接，用户 $user';
  }

  @override
  String get tailscaleStatusConnectedNoUser => '已连接';

  @override
  String tailscaleStatusError(String error) {
    return '问题：$error';
  }

  @override
  String get tailscaleNotIncluded => '此版本未包含';

  @override
  String get tailscaleSignIn => '使用 Tailscale 登录';

  @override
  String get tailscaleSignInNoLink => '暂时还没有登录链接，请稍后再试。';

  @override
  String get tailscaleToggleFailed => '无法开启或关闭内置 Tailscale，请重试。';

  @override
  String get tailscaleSignOut => '退出 Tailscale 登录';

  @override
  String tailscaleDeviceAddress(String address) {
    return '此设备：$address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return '你的服务器 ($server) 通过 Tailscale 访问。';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return '你的服务器 ($server) 不是 tailnet 地址，因此按常规方式访问。如果它在你的 tailnet 中，请在下方添加其主机名。';
  }

  @override
  String get tailscaleExtraHostsLabel => '其他 tailnet 主机名';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      '100.64.0.0/10 范围内的地址，以及以 .ts.net 或你的 tailnet MagicDNS 名称结尾的名称，始终通过 Tailscale 访问。多个名称请用逗号分隔。';

  @override
  String playerChapterEndsAt(String time) {
    return '本章结束于 $time';
  }

  @override
  String playerEndsAt(String time) {
    return '结束于 $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return '上次在 $device 播放 · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return '上次在其他设备播放 · $ago';
  }

  @override
  String get opmlExportAction => '导出 OPML';

  @override
  String get opmlExportDialogTitle => '将播客订阅源保存为 OPML';

  @override
  String opmlExportSaved(String path) {
    return 'OPML 已保存到 $path';
  }

  @override
  String get opmlExportDownloaded => 'OPML 已下载';

  @override
  String get opmlExportFailed => '无法导出 OPML 文件';

  @override
  String get bookCopySaveAction => '保存副本…';

  @override
  String get bookCopyDialogTitle => '保存这本书的副本';

  @override
  String get bookCopySaving => '正在保存副本…';

  @override
  String bookCopySaved(String path) {
    return '副本已保存到 $path';
  }

  @override
  String get bookCopyFailed => '无法保存这本书的副本';

  @override
  String get exclusiveAudioTitle => '独占音频';

  @override
  String get exclusiveAudioSubtitle =>
      '跳过 Windows 音效，可修复爆音或音量忽大忽小的问题。Absorb 播放时其他应用会被静音。重启 Absorb 后生效。';

  @override
  String get exclusiveAudioFallback =>
      'Your sound device refused exclusive audio, so Absorb is playing in normal mode';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return '$count 个新增';
  }

  @override
  String seekUndoBackTo(String time) {
    return '返回到 $time';
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
  String get autoDownloadNextInSeries => '自动下载系列中的下一本书';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      '当你正在播放的书听完 80% 或剩余不到一小时时。遵循“仅限 Wi-Fi”设置。';

  @override
  String get emptyStateBrowseLibrary => '浏览媒体库';

  @override
  String get emptyStateClearSearch => '清除搜索';

  @override
  String get statsNoListeningYet => '还没有收听记录';

  @override
  String get desktopShortcutQuickSwitcher => '快速切换：查找书籍或前往任意位置';

  @override
  String get desktopShortcutHelp => '显示键盘快捷键';

  @override
  String get quickSwitcherTooltip => '快速切换 (Ctrl+K)';

  @override
  String get quickSwitcherHint => '搜索此媒体库或输入命令';

  @override
  String get quickSwitcherNoResults => '没有匹配项';

  @override
  String get quickSwitcherGoHome => '前往首页';

  @override
  String get quickSwitcherGoLibrary => '前往媒体库';

  @override
  String get quickSwitcherGoAbsorbing => '前往正在收听';

  @override
  String get quickSwitcherGoStats => '前往统计';

  @override
  String get quickSwitcherGoSettings => '前往设置';

  @override
  String get quickSwitcherGoDownloads => '前往下载';

  @override
  String get quickSwitcherPlayPause => '播放 / 暂停';

  @override
  String get quickSwitcherSleepTimer => '睡眠定时器';

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
  String get quickSwitcherKindAction => '操作';

  @override
  String get quickSwitcherKindBook => '书籍';

  @override
  String get quickSwitcherKindPodcast => '播客';

  @override
  String get quickSwitcherKindSeries => '系列';

  @override
  String get quickSwitcherKindAuthor => '作者';

  @override
  String get alphabetScrollerLabel => '跳转到字母';

  @override
  String get stepperDecrease => '减少';

  @override
  String get stepperIncrease => '增加';

  @override
  String get statsStreakKeepGoing => '今天收听 5 分钟即可保持连续';

  @override
  String get statsStreakHowTo => '每天收听 5 分钟即可累积连续天数';

  @override
  String get statsDailyGoalSheetTitle => '每日收听目标';

  @override
  String get statsDailyGoalSheetBody => '你今天收听时，连续记录卡片上的圆环会逐渐填满。';

  @override
  String get statsDailyGoalSet => '设置每日目标';

  @override
  String get statsMonthListened => '已收听';

  @override
  String get statsMonthTime => '时间';

  @override
  String get statsMonthTopBook => '最热门书籍';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条结果',
      one: '1 条结果',
      zero: '没有结果',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => '排序和分组';

  @override
  String get bookmarksViewByBook => '按书籍';

  @override
  String get bookmarksViewNewest => '最新优先';

  @override
  String get bookmarksViewPosition => '按位置';

  @override
  String get bookmarksExportAction => '导出书签';

  @override
  String get bookmarksExportDialogTitle => '将书签保存为 Markdown';

  @override
  String bookmarksExportSaved(String path) {
    return '书签已保存到 $path';
  }

  @override
  String get bookmarksExportDownloaded => '书签已下载';

  @override
  String get bookmarksExportFailed => '无法导出书签';

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
  String get remoteHostTitle => 'Control from your phone';

  @override
  String get remoteHostSubtitleOff =>
      'Use your phone as a remote for Absorb on this PC';

  @override
  String remoteHostSubtitleOn(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count phones connected',
      one: '1 phone connected',
      zero: 'no phones connected',
    );
    return 'On · $_temp0';
  }

  @override
  String get remoteHostSheetBody =>
      'Use your phone as a remote for this PC. The audio keeps playing here on the PC, and your phone shows what\'s playing with the buttons. Your phone and this PC need to be on the same Wi-Fi.';

  @override
  String get remoteHostSwitch => 'Turn on';

  @override
  String get remoteHostSwitchSubtitle =>
      'Windows may ask to let Absorb Plus through the firewall the first time. Allow it.';

  @override
  String get remoteHostKeepOn => 'Keep on when Absorb starts';

  @override
  String get remoteHostKeepOnSubtitle =>
      'When this is off, it turns off each time you close Absorb.';

  @override
  String remoteHostPortsBusy(int first, int last) {
    return 'Couldn\'t start: ports $first to $last are all in use.';
  }

  @override
  String get remoteHostPairTitle => 'Pair your phone';

  @override
  String get remoteHostStep1 => '1. Turn it on here.';

  @override
  String get remoteHostStep2 =>
      '2. Scan the code with your phone\'s camera, or open Absorb on the phone and go to Settings > Control your computer.';

  @override
  String get remoteHostStep3 =>
      '3. Enter the code on the phone, then choose Allow here.';

  @override
  String get remoteHostCodeLabel => 'Code';

  @override
  String remoteHostCodeExpires(String time) {
    return 'Works for $time';
  }

  @override
  String get remoteHostPairFirst => 'Pair a phone';

  @override
  String get remoteHostPairAnother => 'Pair another device';

  @override
  String get remoteHostPairingClosed =>
      'Pairing is closed. Tap the button for a new code; it works for 2 minutes and for one device.';

  @override
  String get remoteHostFull =>
      '5 devices are paired, the most allowed. Forget one to pair another.';

  @override
  String remoteHostAddresses(String addresses) {
    return 'This PC\'s address: $addresses';
  }

  @override
  String get remoteHostNoAddress => 'This PC has no network address right now.';

  @override
  String get remoteHostNoDiscovery =>
      'Your phone may not find this PC by itself; type this PC\'s address on the phone instead.';

  @override
  String get remoteHostConnectedTitle => 'Connected now';

  @override
  String get remoteHostPairedTitle => 'Paired devices';

  @override
  String get remoteHostNoDevices => 'No paired devices yet';

  @override
  String get remoteHostUnusedNote =>
      'A device not used for 90 days is forgotten.';

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
  String get remoteHostForgetAll => 'Forget all';

  @override
  String get remoteHostForgetAllConfirm =>
      'Forget all paired devices? Each one has to pair again to control this PC.';

  @override
  String get remoteHostDisconnect => 'Disconnect';

  @override
  String remoteHostAllowTitle(String name) {
    return 'Allow ‘$name’ to control Absorb on this PC?';
  }

  @override
  String get remoteHostAllowBody =>
      'Only allow a device you know. It can play, pause and change what plays here. No answer means no.';

  @override
  String get remoteHostAllow => 'Allow';

  @override
  String get remoteHostDeny => 'Deny';

  @override
  String get remoteControlAnother => 'Control your computer';

  @override
  String get remoteControlAnotherSubtitle =>
      'Use this phone as a remote for Absorb on your PC';

  @override
  String get remoteConnectIntro =>
      'Use this phone as a remote for Absorb on your PC. The audio keeps playing on the PC. Your phone and PC need to be on the same Wi-Fi. On the PC, open Settings > Control from your phone and turn it on.';

  @override
  String get remoteConnectSearching => 'Looking for computers on your Wi-Fi…';

  @override
  String get remoteConnectNoneFound =>
      'No computers found. On the PC, open Settings > Control from your phone and turn it on, or enter its address.';

  @override
  String get remoteConnectSearchAgain => 'Search again';

  @override
  String get remoteConnectPaired => 'Paired';

  @override
  String get remoteConnectFound => 'On your Wi-Fi';

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
      'Enter the 6-digit code shown on the PC under Control from your phone.';

  @override
  String get remoteConnectWaiting => 'Now choose Allow on the PC…';

  @override
  String get remoteConnectPair => 'Pair';

  @override
  String get remoteConnectForget => 'Forget this computer';

  @override
  String get remotePairBadCode =>
      'That code isn\'t right. Check the PC and try again.';

  @override
  String get remotePairExpired =>
      'The code expired. Get a new one on the PC with Pair another device.';

  @override
  String get remotePairClosed =>
      'Pairing isn\'t open on the PC. On the PC, tap Pair another device for a new code.';

  @override
  String get remotePairDenied =>
      'The PC didn\'t allow this phone. Try again and choose Allow on the PC.';

  @override
  String get remotePairTooManyDevices =>
      'That PC already has 5 paired devices. Forget one on the PC first.';

  @override
  String get remotePairTooMany =>
      'Too many tries. Wait a minute and try again.';

  @override
  String get remotePairUnreachable =>
      'Your phone and PC aren\'t on the same Wi-Fi, or the PC hasn\'t turned it on. Check both and try again.';

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
  String get remoteUnreachableHint =>
      'Can\'t reach the PC. Check that it\'s awake, Absorb is open, and both are on the same Wi-Fi.';

  @override
  String remoteNothingPlaying(String name) {
    return 'Nothing is playing on $name';
  }

  @override
  String get remoteNothingLoaded => 'Start something on the PC first.';

  @override
  String get remoteCommandFailed => 'The PC couldn\'t do that.';

  @override
  String get remoteNotOnList => 'That book isn\'t on the PC\'s list any more.';

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
  String get remoteStop => 'Stop';

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
  String get remoteSpeedSlower => 'Slower';

  @override
  String get remoteSpeedFaster => 'Faster';

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
  String get remoteVolume => 'Volume';

  @override
  String get remoteMute => 'Mute';

  @override
  String get remoteUnmute => 'Unmute';

  @override
  String get remoteChapters => 'Chapters';

  @override
  String get remoteBookmark => 'Bookmark';

  @override
  String get remoteBookmarkTitle => 'Add a bookmark here';

  @override
  String get remoteBookmarkNoteHint => 'Note (optional)';

  @override
  String get remoteBookmarkAdd => 'Add';

  @override
  String get remoteBookmarkAdded => 'Bookmark added on the PC';

  @override
  String get remoteContinueListening => 'Continue listening';

  @override
  String get remoteContinueEmpty => 'Nothing in progress on the PC.';

  @override
  String remoteTimeLeft(String time) {
    return '$time left';
  }

  @override
  String remoteChapterTimeLeft(String time) {
    return '$time left in the chapter';
  }

  @override
  String get remoteCustomize => 'Customize';

  @override
  String get remoteCustomizeTitle => 'Customize the remote';

  @override
  String get remoteCustomizeHintPortrait =>
      'Editing the portrait layout. Drag a block by its handle, or hold it, to move it. Turn the phone to edit landscape.';

  @override
  String get remoteCustomizeHintLandscape =>
      'Editing the landscape layout. Drag blocks within or between the two columns. Turn the phone to edit portrait.';

  @override
  String get remoteCustomizeReset => 'Reset to default';

  @override
  String get remoteCustomizePresets => 'Presets';

  @override
  String get remoteCustomizeAddTitle => 'Add to the screen';

  @override
  String get remoteCustomizeDropHere => 'Drop blocks here';

  @override
  String get remoteCustomizeMove => 'Drag to move';

  @override
  String get remoteCustomizeEmpty =>
      'Nothing on this screen. Tap Customize to add controls.';

  @override
  String get remotePresetDefault => 'Default';

  @override
  String get remotePresetMinimal => 'Minimal';

  @override
  String get remotePresetNightstand => 'Nightstand';

  @override
  String get remotePresetFull => 'Full';

  @override
  String get remoteBlockCover => 'Cover';

  @override
  String get remoteBlockTitle => 'Title and author';

  @override
  String get remoteBlockChapterTitle => 'Chapter title';

  @override
  String get remoteBlockProgress => 'Progress bar';

  @override
  String get remoteBlockTimeLeft => 'Time left';

  @override
  String get remoteBlockTransport => 'Playback buttons';

  @override
  String get remoteBlockClock => 'Clock';

  @override
  String get remoteBlockSpacer => 'Space';

  @override
  String get remoteSizeSmall => 'Small';

  @override
  String get remoteSizeMedium => 'Medium';

  @override
  String get remoteSizeLarge => 'Large';

  @override
  String get remoteSizeCompact => 'Compact';

  @override
  String get remoteSizeNormal => 'Normal';

  @override
  String get remoteDisplayBackground => 'Background';

  @override
  String get remoteDisplayBackgroundTheme => 'Theme';

  @override
  String get remoteDisplayBackgroundCover => 'Blurred cover';

  @override
  String get remoteDisplayBackgroundBlack => 'Black';

  @override
  String get remoteDisplayTextSize => 'Text size';

  @override
  String get remoteDisplayTextHuge => 'Huge';

  @override
  String get remoteDisplayShowClock => 'Show the clock';

  @override
  String get remoteDisplay24Hour => '24-hour clock';

  @override
  String get remoteDisplayDim => 'Dim the screen after';

  @override
  String get remoteDisplayDimNever => 'Never';

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
