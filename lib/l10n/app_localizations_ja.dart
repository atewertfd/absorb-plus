// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'A B S O R B';

  @override
  String get online => 'オンライン';

  @override
  String get offline => 'オフライン';

  @override
  String get stillOffline => 'まだオフラインです。タップして再試行してください。';

  @override
  String get retry => '再試行';

  @override
  String get listsNone => 'コレクションやプレイリストはありません';

  @override
  String get listsNoneHint =>
      'コレクションとプレイリストは Audiobookshelf サーバーで作成すると、ここに表示されます。';

  @override
  String get listsLoadFailed => 'リストを読み込めませんでした';

  @override
  String get listsLoadFailedHint =>
      'Absorb がコレクションとプレイリストを取得するためにサーバーへ接続できませんでした。';

  @override
  String get listsNoneBookOrbit => 'コレクションやスマートスコープはありません';

  @override
  String get listsNoneHintBookOrbit =>
      'コレクションとスマートスコープは BookOrbit サーバーで作成すると、ここに表示されます。';

  @override
  String get listsLoadFailedHintBookOrbit =>
      'Absorb がコレクションとスマートスコープを取得するためにサーバーへ接続できませんでした。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get delete => '削除';

  @override
  String get remove => '削除';

  @override
  String get save => '保存';

  @override
  String get done => '完了';

  @override
  String get edit => '編集';

  @override
  String get search => '検索';

  @override
  String get apply => '適用';

  @override
  String get enable => '有効にする';

  @override
  String get clear => 'クリア';

  @override
  String get off => 'オフ';

  @override
  String get disabled => '無効';

  @override
  String get later => '後で';

  @override
  String get whatsNewTitle => 'Absorb が更新されました';

  @override
  String whatsNewContent(String version) {
    return '現在のバージョンは $version です。';
  }

  @override
  String get whatsNewButton => '新機能を見る';

  @override
  String get whatsNewKeepShowing => '更新のたびに表示する';

  @override
  String get whatsNewKeepShowingHint => '設定でいつでもオンに戻せます';

  @override
  String get settingsWhatsNew => '更新後に新機能を表示';

  @override
  String get settingsWhatsNewSubtitle => '更新後、アプリ内で新機能を表示します';

  @override
  String get gotIt => '了解';

  @override
  String get betaLoggingTitle => 'ログがオンです';

  @override
  String get betaLoggingContent =>
      'これはベータ版のため、問題の原因を調べやすいよう Absorb がログを保存しています。共有しない限り、ログはこのデバイスにのみ残ります。\n\nログの送信やオフへの切り替えは、設定の「問題とサポート」で行えます。オフにすると、以降のベータ版でもオフのままになります。';

  @override
  String get preview => 'プレビュー';

  @override
  String get or => 'または';

  @override
  String get file => 'ファイル';

  @override
  String get more => 'その他';

  @override
  String get unknown => '不明';

  @override
  String get untitled => '無題';

  @override
  String get noThanks => 'いいえ';

  @override
  String get stay => 'とどまる';

  @override
  String get homeTitle => 'ホーム';

  @override
  String get continueListening => '続きを聴く';

  @override
  String get continueReading => '続きを読む';

  @override
  String get continueSeries => 'シリーズの続き';

  @override
  String get recentlyAdded => '最近追加';

  @override
  String get listenAgain => 'もう一度聴く';

  @override
  String get discover => '見つける';

  @override
  String get newEpisodes => '新着エピソード';

  @override
  String get downloads => 'ダウンロード';

  @override
  String get noDownloadedBooks => 'ダウンロード済みの本はありません';

  @override
  String get yourLibraryIsEmpty => 'ライブラリは空です';

  @override
  String get downloadBooksWhileOnline => 'オンライン中に本をダウンロードすると、オフラインで聴けます';

  @override
  String get customizeHome => 'ホームをカスタマイズ';

  @override
  String get dragToReorderTapEye => 'ドラッグで並べ替え、目のアイコンで表示/非表示';

  @override
  String get loginTagline => 'Absorbing を始めよう';

  @override
  String get loginConnectToServer => 'サーバーに接続';

  @override
  String get loginServerAddress => 'サーバーアドレス';

  @override
  String get loginServerHint => 'my.server.com';

  @override
  String get loginServerHelper => 'IP:ポートも使えます(例: 192.168.1.5:13378)';

  @override
  String get loginCouldNotReachServer => 'サーバーに接続できませんでした';

  @override
  String get loginAdvanced => '詳細設定';

  @override
  String get loginCustomHttpHeaders => 'カスタム HTTP ヘッダー';

  @override
  String get loginCustomHeadersDescription =>
      '追加ヘッダーが必要な Cloudflare トンネルやリバースプロキシ向けです。サーバー URL を入力する前にヘッダーを追加してください。';

  @override
  String get loginHeaderName => 'ヘッダー名';

  @override
  String get loginHeaderValue => '値';

  @override
  String get loginAddHeader => 'ヘッダーを追加';

  @override
  String get loginSelfSignedCertificates => '自己署名証明書';

  @override
  String get loginTrustAllCertificates => 'すべての証明書を信頼する(自己署名/独自 CA 環境向け)';

  @override
  String get loginApiKey => 'API キー';

  @override
  String get loginApiKeyDescription =>
      'ユーザー名とパスワードの代わりに、管理者が発行した API キーを使います。アカウントでトークンの更新に失敗する場合に便利です。';

  @override
  String get loginWaitingForSso => 'SSO を待機中...';

  @override
  String get loginRedirectUri => 'リダイレクト URI: absorb://oauth';

  @override
  String get loginOrSignInManually => 'または手動でサインイン';

  @override
  String get loginUsername => 'ユーザー名';

  @override
  String get loginUsernameRequired => 'ユーザー名を入力してください';

  @override
  String get loginPassword => 'パスワード';

  @override
  String get loginSignIn => 'サインイン';

  @override
  String loginSignInAs(String username) {
    return '$username としてサインインしますか?';
  }

  @override
  String get loginSignInToServer => 'このサーバーにサインインしますか?';

  @override
  String loginSignedInAs(String username) {
    return '$username としてサインイン済み';
  }

  @override
  String get adminCreateSetupFile => 'サインインを共有';

  @override
  String adminSetupFileDescription(String username) {
    return '$username 用の非公開サインインリンクを作成します。このリンクは Absorb アプリでのみ使えます。';
  }

  @override
  String get adminSetupFileServerUrl => '新しいユーザーが使うサーバー URL';

  @override
  String get adminSetupFileNoteWithHeaders =>
      'サーバーに接続できるよう、専用の API キーとカスタムヘッダーが含まれます。リンクはパスワードと同様に扱ってください。';

  @override
  String get adminSetupFileNote => '専用の API キーが含まれます。リンクはパスワードと同様に扱ってください。';

  @override
  String get adminSetupFileCreate => 'リンクを作成';

  @override
  String get adminSetupFileSaveTitle => 'セットアップファイルを保存';

  @override
  String get adminSetupFileKeyError => 'このユーザーの API キーを作成できませんでした';

  @override
  String adminSetupFileSaved(String username) {
    return '$username 用のセットアップファイルを保存しました';
  }

  @override
  String adminSetupFileFailed(String error) {
    return 'サインインの作成に失敗しました: $error';
  }

  @override
  String get setupLinkShareTitle => 'サインインを共有';

  @override
  String setupLinkShareDescription(String username) {
    return 'この非公開リンクを送るか、QR コードを読み取ってもらうと、$username としてサインインできます。';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return 'このリンクを知っている人は誰でも $username としてサインインできます。パスワードと同様に扱ってください。';
  }

  @override
  String get setupLinkShare => 'リンクを共有';

  @override
  String get setupLinkCopy => 'リンクをコピー';

  @override
  String get setupLinkCopied => 'サインインリンクをコピーしました';

  @override
  String get setupLinkSaveFile => 'セットアップファイルを保存';

  @override
  String get setupLinkQrError => 'このセットアップリンクは QR コードには長すぎます。代わりにリンクを共有してください。';

  @override
  String setupLinkShareSubject(String username) {
    return '$username 用の Absorb サインイン';
  }

  @override
  String get setupLinkConfirmTitle => 'このリンクでサインインしますか?';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return '$server に $username としてサインインしますか?このリンクの送信元を信頼できる場合のみ続行してください。';
  }

  @override
  String get setupLinkInvalid => 'このサインインリンクは無効か、不完全です';

  @override
  String get setupLinkSigningIn => 'サインインリンクを確認中...';

  @override
  String get loginPlayDownloads => 'ダウンロードを再生';

  @override
  String signedOutDownloadsNote(String username) {
    return 'サインアウト中です。ここで聴いた内容は、再度サインインしたときに $username に同期されます。';
  }

  @override
  String get loginPasteLink => 'ログインリンクを貼り付け';

  @override
  String get loginPasteLinkHelp =>
      '受け取ったサインインリンクを完全な形で貼り付けてください。パスワードと同様に扱ってください。';

  @override
  String get loginFailed => 'ログインに失敗しました';

  @override
  String get loginSsoFailed => 'SSO ログインに失敗したか、キャンセルされました';

  @override
  String get loginSsoAuthFailed => 'SSO 認証に失敗しました。もう一度お試しください。';

  @override
  String get loginRestoreFromBackup => 'インポート';

  @override
  String get loginInvalidBackupFile => 'バックアップファイルが無効です';

  @override
  String get loginRestoreBackupTitle => 'バックアップを復元しますか?';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return 'すべての設定と保存済みアカウント $count 件を復元します。自動的にサインインされます。';
  }

  @override
  String get loginRestoreBackupNoAccounts =>
      'すべての設定を復元します。このバックアップにはアカウントが含まれていません。';

  @override
  String get loginRestore => '復元';

  @override
  String loginRestoredAndSignedIn(String username) {
    return '設定を復元し、$username としてサインインしました';
  }

  @override
  String get loginSessionExpired =>
      '設定を復元しました。セッションの有効期限が切れています。続けるにはサインインしてください。';

  @override
  String get loginSettingsRestored => '設定を復元しました';

  @override
  String loginRestoreFailed(String error) {
    return '復元に失敗しました: $error';
  }

  @override
  String get loginSavedAccounts => '保存済みアカウント';

  @override
  String get libraryTitle => 'ライブラリ';

  @override
  String get librarySearchBooksHint => '本、シリーズ、著者、ナレーターを検索...';

  @override
  String get librarySearchShowsHint => '番組とエピソードを検索...';

  @override
  String get libraryTabLibrary => 'ライブラリ';

  @override
  String get libraryTabSeries => 'シリーズ';

  @override
  String get libraryTabAuthors => '著者';

  @override
  String get libraryTabNarrators => 'ナレーター';

  @override
  String get libraryNoBooks => '本が見つかりません';

  @override
  String get libraryNoUnfinishedBooks => '未完了の本はありません';

  @override
  String get libraryNoBooksInProgress => '進行中の本はありません';

  @override
  String get libraryNoFinishedBooks => '完了した本はありません';

  @override
  String get libraryAllBooksStarted => 'すべての本を開始済みです';

  @override
  String get libraryNoDownloadedBooks => 'ダウンロード済みの本はありません';

  @override
  String get libraryNoSeriesFound => 'シリーズが見つかりません';

  @override
  String get libraryNoBooksWithEbooks => '電子書籍付きの本はありません';

  @override
  String get libraryNoBooksMissingMetadata => 'このメタデータが不足している本はありません';

  @override
  String get libraryNoItemsMatchingFilter => 'このフィルターに一致する項目はありません';

  @override
  String libraryNoBooksInGenre(String genre) {
    return '「$genre」の本はありません';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return 'タグ「$tag」の本はありません';
  }

  @override
  String get libraryClearFilter => 'フィルターを解除';

  @override
  String get libraryNoAuthorsFound => '著者が見つかりません';

  @override
  String get libraryNoNarratorsFound => 'ナレーターが見つかりません';

  @override
  String get libraryNoResults => '結果が見つかりません';

  @override
  String get librarySearchBooks => '本';

  @override
  String get librarySearchShows => '番組';

  @override
  String get librarySearchEpisodes => 'エピソード';

  @override
  String get librarySearchSeries => 'シリーズ';

  @override
  String get librarySearchAuthors => '著者';

  @override
  String get librarySearchTags => 'タグ';

  @override
  String get librarySearchGenres => 'ジャンル';

  @override
  String librarySeriesCount(int count) {
    return '$count シリーズ';
  }

  @override
  String libraryAuthorsCount(int count) {
    return '$count 人の著者';
  }

  @override
  String libraryNarratorsCount(int count) {
    return '$count 人のナレーター';
  }

  @override
  String libraryBooksCount(int loaded, int total) {
    return '$loaded/$total 冊';
  }

  @override
  String get sort => '並べ替え';

  @override
  String get filter => 'フィルター';

  @override
  String get filterActive => 'フィルター ●';

  @override
  String get name => '名前';

  @override
  String get title => 'タイトル';

  @override
  String get author => '著者';

  @override
  String get dateAdded => '追加日';

  @override
  String get numberOfBooks => '本の数';

  @override
  String get sortTotalDuration => '合計時間';

  @override
  String get sortLastBookAdded => '最後に本が追加された日';

  @override
  String get sortLastBookUpdated => '最後に本が更新された日';

  @override
  String get publishedYear => '発行年';

  @override
  String get duration => '再生時間';

  @override
  String get random => 'ランダム';

  @override
  String get collapseSeries => 'シリーズをまとめる';

  @override
  String get notFinished => '未完了';

  @override
  String get inProgress => '進行中';

  @override
  String get filterFinished => '完了';

  @override
  String get notStarted => '未開始';

  @override
  String get downloaded => 'ダウンロード済み';

  @override
  String get hasEbook => '電子書籍あり';

  @override
  String get noEbook => '電子書籍なし';

  @override
  String get hasSupplementaryEbook => '補助の電子書籍あり';

  @override
  String get noSupplementaryEbook => '補助の電子書籍なし';

  @override
  String get noSeries => 'シリーズなし';

  @override
  String get publishedDecade => '発行年代';

  @override
  String get tracks => 'トラック';

  @override
  String get noTracks => 'トラックなし';

  @override
  String get singleTrack => '単一トラック';

  @override
  String get multipleTracks => '複数トラック';

  @override
  String get abridged => '抄録版';

  @override
  String get issues => '問題';

  @override
  String get rssFeedOpen => 'RSS フィード公開中';

  @override
  String get explicitContent => '露骨な表現';

  @override
  String get missingMetadata => 'メタデータ不足';

  @override
  String get genre => 'ジャンル';

  @override
  String get tag => 'タグ';

  @override
  String get clearFilter => 'フィルターを解除';

  @override
  String get noGenresFound => 'ジャンルが見つかりません';

  @override
  String get noTagsFound => 'タグが見つかりません';

  @override
  String get asc => '昇順';

  @override
  String get desc => '降順';

  @override
  String get fileSize => 'ファイルサイズ';

  @override
  String get lastUpdated => '最終更新';

  @override
  String get fileCreated => 'ファイル作成日';

  @override
  String get lastModified => '最終変更';

  @override
  String get authorFirstLast => '著者(名 姓)';

  @override
  String get authorLastFirst => '著者(姓, 名)';

  @override
  String get progressSort => '進捗';

  @override
  String get dateStarted => '開始日';

  @override
  String get dateFinished => '完了日';

  @override
  String get episodeCount => 'エピソード数';

  @override
  String get sequence => 'シリーズ内の順番';

  @override
  String get absorbingTitle => 'Absorbing';

  @override
  String get absorbingStop => '停止';

  @override
  String get absorbingManageQueue => 'キューを管理';

  @override
  String get absorbingDone => '完了';

  @override
  String get absorbingNoDownloadedEpisodes => 'ダウンロード済みのエピソードはありません';

  @override
  String get absorbingNoDownloadedBooks => 'ダウンロード済みの本はありません';

  @override
  String get absorbingNothingPlayingYet => '再生中のものはありません';

  @override
  String get absorbingNothingAbsorbingYet => 'Absorbing 中のものはありません';

  @override
  String get absorbingDownloadEpisodesToListen => 'エピソードをダウンロードするとオフラインで聴けます';

  @override
  String get absorbingDownloadBooksToListen => '本をダウンロードするとオフラインで聴けます';

  @override
  String get absorbingStartEpisodeFromShows => '「番組」タブからエピソードを再生しましょう';

  @override
  String get absorbingStartBookFromLibrary => '「ライブラリ」タブから本を再生しましょう';

  @override
  String get carModeTitle => 'カーモード';

  @override
  String get carModeNoBookLoaded => '本が読み込まれていません';

  @override
  String get carModeBookLabel => '本';

  @override
  String get carModeChapterLabel => 'チャプター';

  @override
  String get carModeBookmarkDefault => 'ブックマーク';

  @override
  String get carModeBookmarkAdded => 'ブックマークを追加しました';

  @override
  String get downloadsTitle => 'ダウンロード';

  @override
  String get downloadsCancelSelection => '選択を解除';

  @override
  String get downloadsSelect => '選択';

  @override
  String get downloadsNoDownloads => 'ダウンロードはありません';

  @override
  String get downloadsDownloading => 'ダウンロード中';

  @override
  String get downloadsQueued => '待機中';

  @override
  String get downloadsCompleted => '完了';

  @override
  String get downloadsEbooks => '電子書籍';

  @override
  String get downloadsWaiting => '待機中...';

  @override
  String get downloadsCancel => 'キャンセル';

  @override
  String get downloadsDelete => '削除';

  @override
  String downloadsDeleteCount(int count) {
    return 'ダウンロード $count 件を削除しますか?';
  }

  @override
  String get downloadsDeleteContent => 'ダウンロードしたファイルはこのデバイスから削除されます。';

  @override
  String downloadsDeletedCount(int count) {
    return 'ダウンロード $count 件を削除しました';
  }

  @override
  String get downloadsRemoveTitle => 'ダウンロードを削除しますか?';

  @override
  String downloadsRemoveContent(String title) {
    return '「$title」をこのデバイスから削除しますか?';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return '「$title」を削除しました';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return '「$title」をダウンロードできませんでした。ファイルの 1 つがサーバーにありません。ライブラリをスキャンすると解決する場合があります。';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return '「$title」をダウンロードできませんでした。ストレージの空き容量が足りません';
  }

  @override
  String downloadFailedPermission(String title) {
    return '「$title」をダウンロードできませんでした。設定でダウンロード先を確認してください';
  }

  @override
  String downloadFailedGeneric(String title) {
    return '「$title」をダウンロードできませんでした';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '$count 件を選択中';
  }

  @override
  String get bookmarksTitle => 'すべてのブックマーク';

  @override
  String get bookmarksTabBookmarks => 'ブックマーク';

  @override
  String get bookmarksTabHighlights => 'ハイライト';

  @override
  String get highlightOpenInBook => '本で開く';

  @override
  String get highlightDeleteAction => 'ハイライトを削除';

  @override
  String get highlightDeleted => 'ハイライトを削除しました';

  @override
  String highlightsDeleteCount(int count) {
    return 'ハイライト $count 件を削除しますか?';
  }

  @override
  String highlightsDeletedCount(int count) {
    return 'ハイライト $count 件を削除しました';
  }

  @override
  String get quoteShareTitle => '引用を共有';

  @override
  String get quoteShareAction => '共有';

  @override
  String get quoteShareFailed => '引用画像を作成できませんでした';

  @override
  String get quoteShapePortrait => '縦長';

  @override
  String get quoteShapeSquare => '正方形';

  @override
  String get quoteShapeStory => 'ストーリー';

  @override
  String get quoteStyleBlur => 'ぼかし';

  @override
  String get quoteStyleDim => '暗め';

  @override
  String get quoteStyleNone => 'そのままのカバー';

  @override
  String get quoteTextLight => '明るい文字';

  @override
  String get quoteTextDark => '暗い文字';

  @override
  String get quoteFieldTitle => 'タイトル';

  @override
  String get quoteFieldDetail => '詳細';

  @override
  String get quoteFieldDetailHint => '著者、チャプター、ページ、発言者';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => '選択を解除';

  @override
  String get bookmarksSortedByNewest => '新しい順';

  @override
  String get bookmarksSortedByPosition => '位置順';

  @override
  String get bookmarksSelect => '選択';

  @override
  String get bookmarksNoBookmarks => 'ブックマークはまだありません';

  @override
  String get bookmarksSearchHint => 'ブックマークを検索';

  @override
  String get bookmarksNoMatches => '検索に一致するブックマークはありません';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 冊をダウンロード中',
      one: '1 冊をダウンロード中',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => 'すべてダウンロード済みです';

  @override
  String bookmarksDeleteCount(int count) {
    return 'ブックマーク $count 件を削除しますか?';
  }

  @override
  String get bookmarksDeleteContent => 'この操作は元に戻せません。';

  @override
  String bookmarksDeletedCount(int count) {
    return 'ブックマーク $count 件を削除しました';
  }

  @override
  String get bookmarksJumpTitle => 'ブックマークに移動しますか?';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '「$title」 $position\n$bookTitle';
  }

  @override
  String get bookmarksJump => '移動';

  @override
  String get bookmarksNotConnected => 'サーバーに接続されていません';

  @override
  String get bookmarksCouldNotLoad => '本を読み込めませんでした';

  @override
  String bookmarksSelectedCount(int count) {
    return '$count 件を選択中';
  }

  @override
  String get statsTitle => '統計';

  @override
  String get statsCouldNotLoad => '統計を読み込めませんでした';

  @override
  String get statsTotalListeningTime => '合計再生時間';

  @override
  String get statsHoursUnit => '時間';

  @override
  String get statsMinutesUnit => '分';

  @override
  String get statsSecondsUnit => '秒';

  @override
  String statsDaysOfAudio(String days) {
    return '音声にして $days 日分です';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return '音声にして $hours 時間分です';
  }

  @override
  String get statsToday => '今日';

  @override
  String get statsThisWeek => '今週';

  @override
  String get statsThisMonth => '今月';

  @override
  String get statsActivity => 'アクティビティ';

  @override
  String get statsCurrentStreak => '現在の連続日数';

  @override
  String get statsBestStreak => '最長の連続日数';

  @override
  String get statsFinished => '完了';

  @override
  String get statsBooksFinished => '本';

  @override
  String get statsEpisodesFinished => 'エピソード';

  @override
  String get statsBooksThisYear => '今年の本';

  @override
  String get statsEpisodesThisYear => '今年のエピソード';

  @override
  String get statsRemoveFromYearTitle => '今年から削除';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return 'サーバー上の完了日は $date のままです。Absorb の「今年の本」リストから「$title」を削除するだけです。';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return 'サーバー上の完了日は変わりません。Absorb の「今年の本」リストから「$title」を削除するだけです。';
  }

  @override
  String get statsRemovedFromYear => '今年から削除しました';

  @override
  String get statsAddBackToYearTitle => '今年に戻す';

  @override
  String statsAddBackToYearBody(String title) {
    return '「$title」を Absorb の「今年の本」リストに戻しますか?';
  }

  @override
  String get statsAddBack => '戻す';

  @override
  String get statsAddedBackToYear => '今年に戻しました';

  @override
  String get statsHiddenFromYear => '今年から非表示';

  @override
  String get statsNothingHidden => '非表示のものはありません';

  @override
  String get settingsCustomizeStats => '統計をカスタマイズ';

  @override
  String get statsGoalTitle => '再生目標';

  @override
  String get statsGoalOff => 'オフ';

  @override
  String get statsGoalDaily => '毎日';

  @override
  String get statsGoalWeekly => '毎週';

  @override
  String get statsGoalMonthly => '毎月';

  @override
  String get statsGoalTarget => '目標';

  @override
  String get statsGoalEnterTitle => '目標を設定';

  @override
  String get statsGoalEnterTimeHint => '分または h:mm';

  @override
  String statsBooksShort(int count) {
    return '$count 冊';
  }

  @override
  String get statsBookChallengeTitle => '読書チャレンジ';

  @override
  String get statsBookChallengeDesc => '今年完了する本の数';

  @override
  String get statsDailyGoal => '1 日の目標';

  @override
  String get statsWeeklyGoal => '週間目標';

  @override
  String get statsMonthlyGoal => '月間目標';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$target 冊中 $done 冊';
  }

  @override
  String get statsGoalReached => '目標達成';

  @override
  String get statsChartTitle => '再生チャート';

  @override
  String get statsChartBar => '棒';

  @override
  String get statsChartLine => '折れ線';

  @override
  String get statsChartHeatmap => 'ヒートマップ';

  @override
  String get statsChartDays7 => '7 日間';

  @override
  String get statsChartDays30 => '30 日間';

  @override
  String get statsLast30Days => '過去 30 日間';

  @override
  String get statsThisYearTitle => '今年';

  @override
  String get statsSectionsTitle => 'セクション';

  @override
  String get statsSectionTimePeriods => '期間';

  @override
  String get statsHeatmapLess => '少';

  @override
  String get statsHeatmapMore => '多';

  @override
  String get statsDayOfWeek => '曜日別の平均';

  @override
  String get statsTimeSavedLabel => '速度で節約';

  @override
  String statsTimeSavedSince(String date) {
    return '$date 以降';
  }

  @override
  String get statsTimeSavedReset => '節約した時間をリセット';

  @override
  String get statsTimeSavedResetConfirm => '節約した時間は今日から再びカウントされます。';

  @override
  String get statsTimeSavedResetDone => '節約した時間をリセットしました';

  @override
  String statsOnPaceFor(int count) {
    return 'このペースなら $count 冊';
  }

  @override
  String get statsDaysActive => '利用日数';

  @override
  String get statsDailyAverage => '1 日の平均';

  @override
  String get statsLast7Days => '過去 7 日間';

  @override
  String get statsMostListened => 'よく聴いたもの';

  @override
  String get statsRecentSessions => '最近のセッション';

  @override
  String get appShellHomeTab => 'ホーム';

  @override
  String get appShellLibraryTab => 'ライブラリ';

  @override
  String get appShellAbsorbingTab => 'Absorbing';

  @override
  String get appShellStatsTab => '統計';

  @override
  String get appShellSettingsTab => '設定';

  @override
  String get appShellDiscoverTab => '見つける';

  @override
  String get appShellShowsTab => '番組';

  @override
  String get appShellPodcastsTab => 'ポッドキャスト';

  @override
  String get libraryTabEpisodes => 'エピソード';

  @override
  String get filterAllEpisodes => 'すべて';

  @override
  String get filterUnplayed => '未再生';

  @override
  String get episodeFeedEmpty => 'このフィルターに一致するエピソードはありません';

  @override
  String get podcastFilterUpNext => '次に再生';

  @override
  String get podcastFilterNew => '新着';

  @override
  String get settingsPodcastTab => 'ポッドキャストタブ';

  @override
  String get settingsPodcastTabDesc => '1 つのポッドキャストライブラリを下部バーの専用タブにします';

  @override
  String get settingsPodcastTabLibrary => 'ポッドキャストタブのライブラリ';

  @override
  String get settingsMergeImpliedByPodcastTab => 'ポッドキャストタブが有効な間は常にオンです';

  @override
  String get settingsEpisodeNotifs => '通知設定';

  @override
  String get settingsEpisodeNotifsDesc =>
      'ポッドキャストの新エピソードと本の発売予定をバックグラウンドで確認します';

  @override
  String get notifIntervalOff => 'オフ';

  @override
  String notifIntervalMinutes(int n) {
    return '$n 分ごと';
  }

  @override
  String get notifIntervalHour => '1 時間ごと';

  @override
  String notifIntervalHours(int n) {
    return '$n 時間ごと';
  }

  @override
  String get settingsBatteryUnrestricted => 'バッテリー使用を制限しない';

  @override
  String get settingsBatteryUnrestrictedDesc =>
      '一部のスマートフォンで、システムがバックグラウンドの確認を停止するのを防ぎます';

  @override
  String get appShellPressBackToExit => 'もう一度戻るを押すと終了します';

  @override
  String get settingsTitle => '設定';

  @override
  String get sectionAppearance => '外観';

  @override
  String get languageLabel => '言語';

  @override
  String get languageSystemDefault => 'システムのデフォルト';

  @override
  String get languageHelpTranslateInvite => 'Absorb をあなたの言語に翻訳するお手伝いをしませんか?';

  @override
  String get themeLabel => 'テーマ';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeAuto => '自動';

  @override
  String get colorSourceLabel => 'カラーの取得元';

  @override
  String get colorSourceCoverDescription => 'アプリの色は再生中の本のカバーに合わせます';

  @override
  String get colorSourceWallpaperDescription => 'アプリの色はシステムの壁紙に合わせます';

  @override
  String get colorSourceWallpaper => '壁紙';

  @override
  String get colorSourceNowPlaying => '再生中';

  @override
  String get colorSourceDynamic => 'ダイナミック';

  @override
  String get colorSourceManual => '手動';

  @override
  String get colorSourceManualDescription => '下で選んだ固定色をアプリに使います';

  @override
  String get colorSourceCustom => 'カスタム';

  @override
  String get useColorEverywhereLabel => 'この色をすべてに使う';

  @override
  String get useColorEverywhereSubtitle =>
      '本の詳細ページとプレーヤーカードも、各本のカバーではなく設定した色にします';

  @override
  String get flatBackgroundLabel => 'フラットな背景';

  @override
  String get flatBackgroundSubtitle =>
      '背景のグラデーションをなくします。ダークモードでは OLED 画面向けに純粋な黒になります。';

  @override
  String get einkModeLabel => 'E-ink モード';

  @override
  String get einkModeSubtitle => 'E-ink 画面向けの、アニメーションなしの高コントラスト白黒表示';

  @override
  String get einkModeIntroBody =>
      'E-ink 画面向けのモードです。アプリは高コントラストのフラットな白黒表示に切り替わり、アニメーションがオフになり、再生カードの背景がなくなり、バッテリー節約のためサーバーとのライブ接続もオフになります。再生と進捗は通常どおり同期されます。外観の設定は保持され、オフにすると元に戻ります。';

  @override
  String get einkModeIntroConfirm => 'オンにする';

  @override
  String get backgroundIntensityLabel => '背景の濃さ';

  @override
  String get startScreenLabel => '起動時の画面';

  @override
  String get startScreenSubtitle => 'アプリ起動時に開くタブ';

  @override
  String get startScreenHome => 'ホーム';

  @override
  String get startScreenLibrary => 'ライブラリ';

  @override
  String get startScreenAbsorb => 'Absorb';

  @override
  String get startScreenStats => '統計';

  @override
  String get disablePageFade => 'ページのフェードを無効にする';

  @override
  String get disablePageFadeOnSubtitle => 'ページはすぐに切り替わります';

  @override
  String get disablePageFadeOffSubtitle => 'タブ切り替え時にページがフェードします';

  @override
  String get rectangleBookCovers => '長方形の本のカバー';

  @override
  String get progressTextSize => '進捗テキストのサイズ';

  @override
  String get rectangleBookCoversOnSubtitle => 'カバーは 2:3 の本の比率で表示されます';

  @override
  String get rectangleBookCoversOffSubtitle => 'カバーは正方形です';

  @override
  String get coverSize => 'カバーのサイズ';

  @override
  String get coverSizeSubtitle => 'ライブラリのグリッドに横に並ぶカバーの数';

  @override
  String get coverSizeSmall => '小';

  @override
  String get coverSizeMedium => '中';

  @override
  String get coverSizeLarge => '大';

  @override
  String get sectionAbsorbingCards => 'Absorbing カード';

  @override
  String get fullScreenPlayer => '全画面プレーヤー';

  @override
  String get fullScreenPlayerOnSubtitle => 'オン - 再生時に本を全画面で開きます';

  @override
  String get fullScreenPlayerOffSubtitle => 'オフ - カード表示のまま再生します';

  @override
  String get fullBookScrubber => '本全体のスクラバー';

  @override
  String get fullBookScrubberOnSubtitle => 'オン - 本全体をシークできるスライダー';

  @override
  String get fullBookScrubberOffSubtitle => 'オフ - 進捗バーのみ';

  @override
  String get cardScrubbers => 'カードのスクラバー';

  @override
  String get cardScrubbersBoth => '両方';

  @override
  String get cardScrubbersChapter => 'チャプター';

  @override
  String get cardScrubbersLocked => 'ロック';

  @override
  String get cardScrubbersBothSubtitle => '本全体とチャプターのバーでシークできます';

  @override
  String get cardScrubbersChapterSubtitle => 'チャプターのバーのみシークできます';

  @override
  String get cardScrubbersLockedSubtitle => '進捗は表示のみで、シークできません';

  @override
  String get speedAdjustedTime => '速度に合わせた時間';

  @override
  String get speedAdjustedTimeOnSubtitle => 'オン - すべての時間に再生速度を反映します';

  @override
  String get speedAdjustedTimeOffSubtitle => 'オフ - 音声そのままの長さを表示します';

  @override
  String get buttonLayout => 'ボタンのレイアウト';

  @override
  String get buttonLayoutSubtitle => 'カード上の操作ボタンの並べ方';

  @override
  String get whenAbsorbed => 'Absorb 完了時';

  @override
  String get whenAbsorbedInfoTitle => 'Absorb 完了時';

  @override
  String get whenAbsorbedInfoContent =>
      '本やエピソードを最後まで聴いたときに、Absorbing カードをどうするかを設定します。\n\n完了したカードは Absorbing 画面から自動的に削除されます。';

  @override
  String get whenAbsorbedSubtitle => '本やエピソードが完了したときの Absorbing カードの動作';

  @override
  String get whenAbsorbedShowOverlay => 'オーバーレイを表示';

  @override
  String get whenAbsorbedAutoRelease => '自動で解除';

  @override
  String get mergeLibraries => '統合 Absorbing ページ';

  @override
  String get mergeLibrariesInfoTitle => '統合 Absorbing ページ';

  @override
  String get mergeLibrariesInfoContent =>
      'オンにすると、Absorbing 画面にすべてのライブラリの進行中の本とポッドキャストが 1 つの画面にまとめて表示されます。オフの場合は、現在選択中のライブラリの項目のみ表示されます。';

  @override
  String get mergeLibrariesOnSubtitle => 'Absorbing ページにすべてのライブラリの項目を表示します';

  @override
  String get mergeLibrariesOffSubtitle => 'Absorbing ページに現在のライブラリのみ表示します';

  @override
  String get queueMode => 'キューモード';

  @override
  String get queueModeInfoTitle => 'キューモード';

  @override
  String get queueModeInfoOff => 'オフ';

  @override
  String get queueModeInfoOffDesc => '現在の本やエピソードが終わると再生が止まります。';

  @override
  String get queueModeInfoManual => '手動キュー';

  @override
  String get queueModeInfoManualDesc =>
      'Absorbing カードがプレイリストとして動作します。1 つ終わると、次の未完了のカードが自動で再生されます。本やエピソードの「Absorbing に追加」ボタンで項目を追加し、Absorbing 画面で並べ替えます。';

  @override
  String get queueModeOff => 'オフ';

  @override
  String get queueModeManual => '手動';

  @override
  String get queueModeAuto => '自動';

  @override
  String get queueModePlaylist => 'プレイリスト';

  @override
  String get queueModeCollection => 'コレクション';

  @override
  String get queueModeInfoPlaylist => 'プレイリストキュー';

  @override
  String get queueModeInfoPlaylistDesc =>
      '選んだプレイリストの項目を順に再生し、完了済みのものはスキップします。リストの最後で停止します。';

  @override
  String get queuePlaylistPickerTitle => 'プレイリストを選択';

  @override
  String get queuePlaylistNone => 'プレイリストが選択されていません';

  @override
  String queuePlaylistActiveLabel(String name) {
    return 'プレイリスト: $name';
  }

  @override
  String get queueModePlaylistHint => 'ホームでプレイリストを開くと、プレイリストキューを開始できます。';

  @override
  String get exit => '終了';

  @override
  String upNext(String label) {
    return '次: $label';
  }

  @override
  String get nothingUpNext => '次に再生するものはありません';

  @override
  String get showUpNextLabel => 'Absorbing ページに「次」を表示';

  @override
  String get openSeries => 'シリーズを開く';

  @override
  String get openPlaylist => 'プレイリストを開く';

  @override
  String get openCollection => 'コレクションを開く';

  @override
  String get playlistPlayAction => 'プレイリストを再生';

  @override
  String get playlistAllFinished => 'すべて完了';

  @override
  String get queueModeBooks => '本';

  @override
  String get queueModePodcasts => 'ポッドキャスト';

  @override
  String get autoDownloadQueue => 'キューを自動ダウンロード';

  @override
  String get autoDownloadThisSeriesLabel => 'このシリーズを自動ダウンロード';

  @override
  String get autoDownloadThisShowLabel => 'このポッドキャストを自動ダウンロード';

  @override
  String get autoDownloadThisPlaylistLabel => 'このプレイリストを自動ダウンロード';

  @override
  String get autoDownloadThisCollectionLabel => 'このコレクションを自動ダウンロード';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return '次の $count 件をダウンロードしておきます';
  }

  @override
  String get autoDownloadQueueOffSubtitle => 'オフ - 手動ダウンロードのみ';

  @override
  String get sectionPlayback => '再生';

  @override
  String get sectionMediaControls => 'メディアコントロール';

  @override
  String get defaultSpeed => 'デフォルトの速度';

  @override
  String get defaultSpeedSubtitle => '新しい本はこの速度で始まります。速度は本ごとに記憶されます';

  @override
  String get skipBack => '戻る';

  @override
  String get skipForward => '進む';

  @override
  String get iosLockScreenSkipHint =>
      'ロック画面には、iOS にアイコンがある数字(5、10、15、30、45、60、75、90)のみ表示されます。それ以外の秒数はボタンに + と表示されますが、設定した秒数でスキップします。';

  @override
  String get longSkipButtons => '長いスキップボタン';

  @override
  String get longSkipButtonsOnSubtitle => 'オン - プレーヤーに大きめのスキップボタンをもう 1 組表示します';

  @override
  String get longSkipButtonsOffSubtitle => 'オフ - 通常のスキップボタンのみ';

  @override
  String get longSkipBack => '長く戻る';

  @override
  String get longSkipForward => '長く進む';

  @override
  String get coverShapeDefault => 'デフォルト';

  @override
  String get coverShapeSquare => '正方形';

  @override
  String get coverShapeRectangle => '長方形';

  @override
  String get coverShapeLabel => 'カバーの形';

  @override
  String get showSubtitles => 'サブタイトルを表示';

  @override
  String get showSubtitlesOnSubtitle => 'ライブラリとホームで、本のタイトルの下にサブタイトルを表示します';

  @override
  String get showSubtitlesOffSubtitle => 'オフ - サブタイトルは本の詳細シートにのみ表示します';

  @override
  String get subtitleVisibilityLabel => 'サブタイトル';

  @override
  String get subtitleVisibilityDefault => 'デフォルト';

  @override
  String get subtitleVisibilityShow => '表示';

  @override
  String get subtitleVisibilityHide => '非表示';

  @override
  String currentLibrarySettingsTitle(String name) {
    return '現在のライブラリ: $name';
  }

  @override
  String get currentLibrarySkipOverride => 'スキップ秒数をカスタマイズ';

  @override
  String get currentLibrarySkipOverrideOnSubtitle =>
      'オン - このライブラリ独自のスキップ秒数を使います';

  @override
  String get currentLibrarySkipOverrideOffSubtitle =>
      'オフ - このライブラリも共通のスキップ秒数を使います';

  @override
  String get currentLibrarySkipBack => '戻る';

  @override
  String get currentLibrarySkipForward => '進む';

  @override
  String get chapterProgressInNotification => '通知と Android Auto にチャプターの進捗を表示';

  @override
  String get chapterProgressOnSubtitle =>
      'オン - 通知と Android Auto にチャプターの進捗を表示します';

  @override
  String get chapterProgressOffSubtitle => 'オフ - 本全体の進捗を表示します';

  @override
  String get chapterProgressInNotificationIos => 'ロック画面と CarPlay にチャプターの進捗を表示';

  @override
  String get chapterProgressOnSubtitleIos =>
      'オン - ロック画面と CarPlay にチャプターの進捗を表示します';

  @override
  String get nowPlayingText => '再生中のテキスト';

  @override
  String get nowPlayingTextSubtitle => 'メディアコントロールの各行に表示する内容を選びます';

  @override
  String get nowPlayingTopLine => '上の行';

  @override
  String get nowPlayingSecondLine => '2 行目';

  @override
  String get nowPlayingNotShown => '表示しない';

  @override
  String get nowPlayingTopLineRequired => '上の行には少なくとも 1 つの項目が必要です';

  @override
  String get nowPlayingPieceChapter => 'チャプター';

  @override
  String get nowPlayingPieceTitle => '本のタイトル';

  @override
  String get nowPlayingPieceNarrator => 'ナレーター';

  @override
  String get nowPlayingPieceSeries => 'シリーズ';

  @override
  String get nowPlayingPiecePercent => '本の進捗率';

  @override
  String get nowPlayingPieceChapterNumber => 'チャプター番号';

  @override
  String get nowPlayingPieceTimeLeft => '残り時間';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return 'Ch. $number/$total';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return '残り $time';
  }

  @override
  String get bookDockBadgePending => '保留中';

  @override
  String get bookDockBadgeExtracting => 'ファイルを読み取り中';

  @override
  String get bookDockBadgeFetching => '検索中';

  @override
  String get bookDockBadgeError => 'エラー';

  @override
  String get bookDockNeedsReview => '要確認';

  @override
  String get bookDockNoMatch => '一致なし';

  @override
  String get bookDockApplied => '適用済み';

  @override
  String get bookDockNotApplied => '見つかった詳細は未使用';

  @override
  String get bookDockNoDestination => '追加先が未設定';

  @override
  String get bookDockNoAuthor => '著者がまだありません';

  @override
  String get bookDockLookUpAgain => '再検索';

  @override
  String get bookDockLookingUp => '詳細を再検索中';

  @override
  String get bookDockLookUpFailed => '詳細を検索できませんでした';

  @override
  String get bookDockProposedChanges => '変更の提案';

  @override
  String get bookDockNoChanges => 'オンラインでまだ詳細が見つかっていません';

  @override
  String get bookDockStillReading => 'サーバーがこのファイルをまだ読み取り中です';

  @override
  String get bookDockRoleBook => '本';

  @override
  String get bookDockRoleCover => 'カバー';

  @override
  String get bookDockRoleMetadata => 'メタデータ';

  @override
  String get bookDockRoleExtra => 'その他';

  @override
  String get bookDockFieldTitle => 'タイトル';

  @override
  String get bookDockFieldSubtitle => 'サブタイトル';

  @override
  String get bookDockFieldAuthors => '著者';

  @override
  String get bookDockFieldSeries => 'シリーズ';

  @override
  String get bookDockFieldPublisher => '出版社';

  @override
  String get bookDockFieldYear => '年';

  @override
  String get bookDockFieldLanguage => '言語';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return '$percent% 一致';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ファイル',
      one: '1 ファイル',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return '追加先: $library';
  }

  @override
  String bookDockChangedFields(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 項目',
      one: '1 項目',
    );
    return '$_temp0';
  }

  @override
  String bookDockFilesInEntry(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'このエントリのファイル($count 件)',
      one: 'このエントリのファイル',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return '$date に追加';
  }

  @override
  String get bookDockAddToLibrary => 'ライブラリに追加';

  @override
  String get bookDockUseFound => '見つかった詳細を使う';

  @override
  String get bookDockRemoveTitle => 'Book Dock から削除しますか?';

  @override
  String get bookDockRemoveFailed => 'このファイルを削除できませんでした';

  @override
  String get bookDockPickLibrary => 'どのライブラリに追加しますか?';

  @override
  String get bookDockNoLibraries => 'お使いのアカウントでは、ライブラリに本を追加できません';

  @override
  String get bookDockFileFailed => 'このファイルをライブラリに追加できませんでした';

  @override
  String get bookDockDuplicateBody =>
      '同じ名前のファイルがそのライブラリにすでにあります。Book Dock から削除しますか?';

  @override
  String get bookDockDetailsUpdated => '詳細を更新しました';

  @override
  String get bookDockUseFoundFailed => '使用できる詳細が見つかっていません';

  @override
  String bookDockRemoveBody(String title) {
    return 'サーバーから $title を削除します。';
  }

  @override
  String bookDockRemoved(String title) {
    return '$title を Book Dock から削除しました';
  }

  @override
  String bookDockFiled(String title, String library) {
    return '$title を $library に追加しました';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return 'このファイルを追加できませんでした: $reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return '$library に登録済み';
  }

  @override
  String get bomatchSearchAll => 'すべてのソースを検索';

  @override
  String get bomatchSearching => '検索中...';

  @override
  String get bomatchSearchFailed => '一致する候補を検索できませんでした。接続を確認して、もう一度お試しください。';

  @override
  String get bomatchNoResults => '一致する候補が見つかりません';

  @override
  String get bomatchStrong => '有力な候補';

  @override
  String get bomatchPossible => '可能性のある候補';

  @override
  String get bomatchSourceTimeout => 'タイムアウト';

  @override
  String get bomatchSourceBusy => '混雑中';

  @override
  String get bomatchSourceFailed => '失敗';

  @override
  String get bomatchLinked => 'リンク済み';

  @override
  String get bomatchSameIsbn => 'ISBN が同じ';

  @override
  String get bomatchFewDetails => '詳細が少ない';

  @override
  String get bomatchBack => 'すべての結果';

  @override
  String get bomatchFillEmpty => '空欄を埋める';

  @override
  String get bomatchTakeAll => 'すべて採用';

  @override
  String get bomatchOnlyDifferences => '差分のみ';

  @override
  String get bomatchNow => '現在';

  @override
  String get bomatchEmpty => '空';

  @override
  String get bomatchKindNew => '新規';

  @override
  String get bomatchKindChange => '変更';

  @override
  String get bomatchKindSmall => '軽微な変更';

  @override
  String get bomatchKindSame => '同じ';

  @override
  String get bomatchKindNone => '結果にありません';

  @override
  String get bomatchKeep => '維持';

  @override
  String get bomatchUse => '使う';

  @override
  String get bomatchMerge => '統合';

  @override
  String get bomatchReplace => '置き換え';

  @override
  String get bomatchUseThis => 'これを使う';

  @override
  String get bomatchChosen => '選択済み';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '他 $count 冊',
      one: '他 1 冊',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件の変更',
      one: '1 件の変更',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '新規 $count 件',
      one: '新規 1 件',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件の変更を適用',
      one: '1 件の変更を適用',
      zero: '適用',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '他の $count ソース',
      one: '他の 1 ソース',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return '$source から';
  }

  @override
  String get breqTitle => '本のリクエスト';

  @override
  String get breqTabRequest => '本をリクエスト';

  @override
  String get breqTabMine => '自分のリクエスト';

  @override
  String get breqTabAll => 'すべてのリクエスト';

  @override
  String get breqNoAccess => 'お使いのアカウントでは、このサーバーで本をリクエストできません。';

  @override
  String get breqTitleHint => '本のタイトル';

  @override
  String get breqAuthorHint => '著者';

  @override
  String get breqKindAudiobook => 'オーディオブック';

  @override
  String get breqKindEbook => '電子書籍';

  @override
  String get breqKindComic => 'コミック';

  @override
  String get breqSearch => '検索';

  @override
  String get breqSearching => '検索中...';

  @override
  String get breqSearchFailed => '検索できませんでした。接続を確認して、もう一度お試しください。';

  @override
  String get breqSearchPrompt => 'ライブラリにまだない本を検索して、リクエストしましょう。';

  @override
  String get breqNoResults => '一致する本が見つかりません';

  @override
  String get breqInLibrary => 'ライブラリにあります';

  @override
  String get breqYouAsked => 'リクエスト済みです';

  @override
  String get breqSomeoneAsked => 'ほかのユーザーがリクエスト済みです';

  @override
  String get breqView => '表示';

  @override
  String get breqRequest => 'リクエスト';

  @override
  String get breqRequested => 'リクエスト済み';

  @override
  String get breqAddMeToo => '自分も追加';

  @override
  String get breqLibrary => 'ライブラリ';

  @override
  String get breqLibraryApprover => '承認者に任せる';

  @override
  String get breqLibraryChoose => 'ライブラリを選択';

  @override
  String get breqNote => '承認者へのメモ';

  @override
  String get breqNoteHint => 'このリクエストについて伝えておきたいこと';

  @override
  String get breqAutoApproved => 'リクエストはすぐに承認されます。';

  @override
  String get breqSubmitted => 'リクエストを送信しました';

  @override
  String get breqJoined => '既存のリクエストに追加しました';

  @override
  String get breqFailed => 'リクエストを送信できませんでした';

  @override
  String get breqStatusPending => '保留中';

  @override
  String get breqStatusApproved => '承認済み';

  @override
  String get breqStatusRejected => '却下';

  @override
  String get breqStatusCancelled => 'キャンセル済み';

  @override
  String get breqStatusSearching => '検索中';

  @override
  String get breqStatusGrabbed => 'リリースが見つかりました';

  @override
  String get breqStatusDownloading => 'ダウンロード中';

  @override
  String get breqStatusImporting => 'インポート中';

  @override
  String get breqStatusNeedsReview => '要確認';

  @override
  String get breqStatusAvailable => '利用可能';

  @override
  String get breqStatusFailed => '失敗';

  @override
  String get breqWaitingApproval => '承認待ち';

  @override
  String get breqWaitingRelease => 'リリースの選択待ち';

  @override
  String get breqLookingForRelease => 'リリースを探しています';

  @override
  String get breqStartingDownload => 'ダウンロードを開始しています';

  @override
  String get breqAddingToLibrary => 'ライブラリに追加しています';

  @override
  String get breqWaitingCheck => '手動確認待ち';

  @override
  String get breqReady => 'ライブラリに追加されました';

  @override
  String get breqSomethingWrong => '問題が発生しました';

  @override
  String get breqShowHidden => '非表示を表示';

  @override
  String get breqHidden => '非表示';

  @override
  String get breqMineEmpty => 'まだ本をリクエストしていません。';

  @override
  String get breqAllEmpty => 'リクエストはまだありません。';

  @override
  String get breqLoadFailed => 'リクエストを読み込めませんでした。';

  @override
  String get breqLoadMore => 'さらに読み込む';

  @override
  String get breqApprove => '承認';

  @override
  String get breqReject => '却下';

  @override
  String get breqCancel => 'リクエストをキャンセル';

  @override
  String get breqHide => '自分のリストから隠す';

  @override
  String get breqUnhide => '自分のリストに表示';

  @override
  String get breqLeave => 'リクエストから抜ける';

  @override
  String get breqDelete => 'リクエストを削除';

  @override
  String get breqOpenBook => '本を開く';

  @override
  String get breqCancelConfirm => 'このリクエストをキャンセルしますか?進行中のダウンロードも停止します。';

  @override
  String get breqDeleteConfirm => 'このリクエストを削除しますか?この操作は元に戻せません。';

  @override
  String get breqRejectTitle => 'リクエストを却下';

  @override
  String get breqRejectReason => '理由(任意)';

  @override
  String get breqApproveTitle => 'リクエストを承認';

  @override
  String get breqApproveLibraryNeeded => 'この本を追加するライブラリを選択してください。';

  @override
  String get breqApprovedToast => 'リクエストを承認しました';

  @override
  String get breqRejectedToast => 'リクエストを却下しました';

  @override
  String get breqCancelledToast => 'リクエストをキャンセルしました';

  @override
  String get breqHiddenToast => 'リストから隠しました';

  @override
  String get breqRestoredToast => 'リストに戻しました';

  @override
  String get breqDeletedToast => 'リクエストを削除しました';

  @override
  String get breqLeftToast => 'このリクエストから抜けました';

  @override
  String get breqActionFailed => 'リクエストを更新できませんでした';

  @override
  String get breqFactRequestedBy => 'リクエストしたユーザー';

  @override
  String get breqFactRequestedOn => 'リクエスト日';

  @override
  String get breqFactLibrary => 'ライブラリ';

  @override
  String get breqFactDecidedBy => '判断したユーザー';

  @override
  String get breqFactNote => 'リクエストしたユーザーからのメモ';

  @override
  String get breqFactDecisionNote => '判断メモ';

  @override
  String get breqFactAlsoWanted => 'ほかの希望者';

  @override
  String get breqLibraryCta => '本をリクエスト';

  @override
  String get breqSettingsSubtitle => 'ライブラリにまだない本をリクエストします';

  @override
  String get navHoldBookRequests => '本のリクエスト';

  @override
  String breqLibraryDefault(String library) {
    return 'デフォルト($library)';
  }

  @override
  String breqFailedReason(String reason) {
    return 'リクエストを送信できませんでした: $reason';
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
    return 'ダウンロード中、$percent%';
  }

  @override
  String breqAddedTo(String library) {
    return '$library に追加しました';
  }

  @override
  String breqRejectedWithNote(String note) {
    return '却下: $note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return '失敗: $reason';
  }

  @override
  String breqRequestedBy(String name) {
    return 'リクエスト: $name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return 'リクエストを更新できませんでした: $reason';
  }

  @override
  String breqFooterCta(String query) {
    return '「$query」をリクエスト';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件のリクエスト',
      one: '1 件のリクエスト',
      zero: 'リクエストなし',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => 'リリースを探す';

  @override
  String get breqTryAnotherRelease => '別のリリースを試す';

  @override
  String get breqApproveAndFind => '承認してリリースを探す';

  @override
  String get breqReviewButton => 'ダウンロードを確認';

  @override
  String get breqStopDownload => 'ダウンロードを停止';

  @override
  String get breqStopDownloadConfirm =>
      'このダウンロードを停止しますか?リクエストは承認済みに戻り、別のリリースを選べます。';

  @override
  String get breqDiscardImport => 'ダウンロードを破棄';

  @override
  String get breqDiscardConfirm =>
      'このダウンロードを破棄しますか?リクエストは失敗として記録され、別のリリースで再試行できます。';

  @override
  String get breqFileAnyway => 'ライブラリに追加';

  @override
  String get breqFiledToast => 'ライブラリに追加しました';

  @override
  String get breqDiscardedToast => 'ダウンロードを破棄しました';

  @override
  String get breqStoppedToast => 'ダウンロードを停止しました';

  @override
  String get breqGrabTitle => 'このリリースをダウンロードしますか?';

  @override
  String get breqGrab => 'ダウンロード';

  @override
  String get breqGrabbed => 'ダウンロードを開始しました';

  @override
  String get breqGrabFailed => 'ダウンロードを開始できませんでした';

  @override
  String get breqReleaseVipWarning => 'このトラッカーは VIP アカウントのみダウンロードできます。';

  @override
  String get breqReleaseNoBookFile =>
      'このリリースには、BookOrbit がライブラリに追加できる本のファイルがありません。';

  @override
  String get breqReleaseCheckFailed =>
      'このリリースの内容を確認できませんでした。もう一度試すか、別のものを選んでください。';

  @override
  String get breqCheckingRelease => 'ファイルを確認中...';

  @override
  String get breqSearchAgain => '再検索';

  @override
  String get breqSearchTerms => '検索語';

  @override
  String get breqIsbnHint => '空欄の場合はタイトルと著者で検索します';

  @override
  String get breqSearchingIndexers => 'インデクサーを検索中です。最大 1 分ほどかかることがあります。';

  @override
  String get breqReleasesFailed => 'リリースを検索できませんでした。';

  @override
  String get breqNoSourcesSetUp => 'BookOrbit に検索ソースが設定されていません。';

  @override
  String get breqNoSourcesOn => 'BookOrbit のすべての検索ソースがオフになっています。';

  @override
  String get breqNoSourceCarries => 'この種類の本を扱う検索ソースがありません。';

  @override
  String get breqNoReleases => 'リリースが見つかりません。別の検索語をお試しください。';

  @override
  String get breqFromCache => '最近の検索結果から';

  @override
  String get breqIndexerUnauthorized => 'サインインに失敗しました';

  @override
  String get breqIndexerThrottled => '混雑中';

  @override
  String get breqIndexerTimeout => 'タイムアウトしました';

  @override
  String get breqIndexerUnreachable => '接続できません';

  @override
  String get breqIndexerNoMedium => '取り扱いなし';

  @override
  String get breqIndexerError => '失敗しました';

  @override
  String get breqSortBest => '一致度順';

  @override
  String get breqSortSeeders => 'シーダー数';

  @override
  String get breqSortSize => 'サイズ';

  @override
  String get breqSortNewest => '新しい順';

  @override
  String get breqFreeleech => 'フリーリーチ';

  @override
  String get breqVipOnly => 'VIP限定';

  @override
  String get breqAlreadyGrabbed => 'ダウンロード済み';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => 'タイトル';

  @override
  String get breqReasonAuthor => '著者';

  @override
  String get breqReasonUnknownFormat => '不明な形式';

  @override
  String get breqReasonExpectedSize => 'サイズ';

  @override
  String get breqReasonSuspiciousSize => '通常と異なるサイズ';

  @override
  String get breqReasonFreeleech => 'フリーリーチ';

  @override
  String get breqReasonSeveralBooks => '複数の本';

  @override
  String get breqReviewTitle => '確認待ちのダウンロード';

  @override
  String get breqReviewFailed => 'ダウンロードの詳細を読み込めませんでした。';

  @override
  String get breqReviewDockGone => 'ダウンロードしたファイルがBook Dockにありません。';

  @override
  String get breqReviewNoLibrary => 'このリクエストには、本の追加先ライブラリがありません。';

  @override
  String breqGrabFailedReason(String reason) {
    return 'ダウンロードを開始できませんでした: $reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return 'このリリースの内容を確認できませんでした: $reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return 'リリースを検索できませんでした: $reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return 'ダウンロードの詳細を読み込めませんでした: $reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のリリース',
      one: '1件のリリース',
      zero: 'リリースなし',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個のファイル',
      one: '1個のファイル',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個のファイル',
      one: '1個のファイル',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return 'シーダー $seeders、リーチャー $leechers';
  }

  @override
  String breqScore(int score) {
    return 'スコア $score';
  }

  @override
  String breqReasonPreferredFormat(String format) {
    return '優先形式 $format';
  }

  @override
  String breqReasonFormat(String format) {
    return '$format';
  }

  @override
  String breqReasonSeeders(String count) {
    return 'シーダー $count';
  }

  @override
  String breqReviewScore(int score, int threshold) {
    return '一致スコア $score。スコアが $threshold 以上のダウンロードは自動で追加されます。';
  }

  @override
  String breqReviewRequested(String value) {
    return 'リクエスト: $value';
  }

  @override
  String breqReviewImported(String value) {
    return 'ダウンロード: $value';
  }

  @override
  String get breqKindBoth => '両方';

  @override
  String get breqEbookLibrary => '電子書籍ライブラリ';

  @override
  String get breqAudiobookLibrary => 'オーディオブックライブラリ';

  @override
  String get breqRequestBoth => '両方をリクエスト';

  @override
  String get breqAddMeToBoth => '両方に参加';

  @override
  String get breqRequestEbook => '電子書籍をリクエスト';

  @override
  String get breqRequestAudiobook => 'オーディオブックをリクエスト';

  @override
  String get breqAddMeEbook => '電子書籍のリクエストに参加';

  @override
  String get breqAddMeAudiobook => 'オーディオブックのリクエストに参加';

  @override
  String get breqPairSubmitted => '電子書籍とオーディオブックをリクエストしました';

  @override
  String get breqPairOneJoined => '両方をリクエストしました。一方はすでに進行中だったため、そのリクエストに参加しました';

  @override
  String get breqJoinedBoth => '両方のリクエストに参加しました';

  @override
  String get breqJoinsOwned => 'リクエストしました。ライブラリにある既存のコピーに追加されます';

  @override
  String get speedBookmarkInControls => 'メディアコントロールに速度とブックマークを表示';

  @override
  String get speedBookmarkOnSubtitle =>
      'オン - 通知に速度とブックマークを表示。チャプタースキップはAndroid Autoに残ります';

  @override
  String get speedBookmarkOffSubtitle =>
      'オフ - 通知にチャプタースキップを表示。速度とブックマークはAndroid Autoに残ります';

  @override
  String get lockSeekBar => 'シークバーをロック';

  @override
  String get lockSeekBarOnSubtitle =>
      'オン - 通知、ロック画面、車載画面のスライダーは進捗を表示するだけで、ドラッグできません';

  @override
  String get lockSeekBarOffSubtitle => 'オフ - 通知、ロック画面、車載画面のスライダーをドラッグして移動できます';

  @override
  String get autoRewindOnResume => '再開時に自動巻き戻し';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return 'オン - 一時停止の長さに応じて$min秒～$max秒';
  }

  @override
  String get autoRewindOffSubtitle => 'オフ';

  @override
  String get rewindRange => '巻き戻しの範囲';

  @override
  String get rewindAfterPausedFor => '一時停止後の巻き戻し条件';

  @override
  String get rewindAnyPause => 'どの一時停止でも';

  @override
  String get rewindAlwaysLabel => '常に';

  @override
  String get rewindAlwaysDescription => 'ちょっとした中断の後でも、再開のたびに巻き戻します';

  @override
  String rewindAfterDescription(String seconds) {
    return '$seconds秒以上一時停止した場合のみ巻き戻します';
  }

  @override
  String get chapterBarrier => 'チャプター境界';

  @override
  String get chapterBarrierSubtitle => '現在のチャプターの先頭より前には自動で巻き戻さない';

  @override
  String get rewindInstant => '即時';

  @override
  String rewindPause(String duration) {
    return '$durationの一時停止';
  }

  @override
  String get rewindNoRewind => '巻き戻しなし';

  @override
  String rewindSeconds(String seconds) {
    return '$seconds秒巻き戻し';
  }

  @override
  String get sectionSleepTimer => 'スリープタイマー';

  @override
  String get sleep => 'スリープ';

  @override
  String get sleepTimer => 'スリープタイマー';

  @override
  String get shakeDuringSleepTimer => 'スリープタイマー中のシェイク';

  @override
  String get shakeOff => 'オフ';

  @override
  String get shakeAddTime => '時間を追加';

  @override
  String get shakeReset => 'リセット';

  @override
  String get shakeAdds => 'シェイクで追加';

  @override
  String get sleepAddAmount => '追加する時間';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes分';
  }

  @override
  String get shakeSensitivity => 'シェイクの感度';

  @override
  String get shakeSensitivityVeryLow => '非常に低い';

  @override
  String get shakeSensitivityLow => '低い';

  @override
  String get shakeSensitivityMedium => '普通';

  @override
  String get shakeSensitivityHigh => '高い';

  @override
  String get shakeSensitivityVeryHigh => '非常に高い';

  @override
  String get buttonDuringSleepTimer => '終了直前のヘッドホンボタン';

  @override
  String get buttonDuringSleepTimerHint =>
      '終了直前は、1回押すと一時停止ではなくタイマーをリセットします。2回押しは引き続きスキップです。';

  @override
  String get resetTimerOnPause => '一時停止時にタイマーをリセット';

  @override
  String get resetTimerOnPauseOnSubtitle => '再開すると、タイマーが最初の長さから再スタートします';

  @override
  String get resetTimerOnPauseOffSubtitle => 'タイマーは中断した続きから進みます';

  @override
  String get fadeVolumeBeforeSleep => 'スリープ前に音量をフェード';

  @override
  String get fadeVolumeOnSubtitle => '最後の30秒間で徐々に音量を下げます';

  @override
  String get fadeVolumeOffSubtitle => 'タイマー終了と同時に再生を停止します';

  @override
  String get autoSleepTimer => '自動スリープタイマー';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration分';
  }

  @override
  String get autoSleepTimerOffSubtitle => '指定した時間帯にスリープタイマーを自動で開始します';

  @override
  String get windowStart => '開始時刻';

  @override
  String get windowEnd => '終了時刻';

  @override
  String get timerDuration => 'タイマーの長さ';

  @override
  String get timer => 'タイマー';

  @override
  String get endOfChapter => 'チャプターの終わり';

  @override
  String startMinTimer(int minutes) {
    return '$minutes分タイマーを開始';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return '$count$label後にスリープ';
  }

  @override
  String get addMoreTime => '時間を追加';

  @override
  String get cancelTimer => 'タイマーをキャンセル';

  @override
  String chaptersLeftCount(int count) {
    return '残り$countチャプター';
  }

  @override
  String get sectionDownloadsAndStorage => 'ダウンロードとストレージ';

  @override
  String get downloadOverWifiOnly => 'ダウンロード時のネットワーク';

  @override
  String get downloadOverWifiOnSubtitle => 'Wi-Fiのみ';

  @override
  String get downloadOverWifiOffSubtitle => 'すべての接続';

  @override
  String get autoDownloadOnWifi => '再生を始めた本を自動ダウンロード';

  @override
  String get autoDownloadOnWifiInfoTitle => '再生を始めた本を自動ダウンロード';

  @override
  String get autoDownloadOnWifiInfoContent =>
      '本のストリーミング再生を始めると、本全体がバックグラウンドでダウンロードされ、自分でダウンロードしなくてもオフラインで聴けるようになります。このダウンロードは上の「ダウンロード時のネットワーク」設定に従うため、モバイルデータでも実行したい場合は「すべての接続」に設定してください。';

  @override
  String get autoDownloadOnWifiOnSubtitle =>
      'ストリーミング再生した本をバックグラウンドで自動ダウンロードします';

  @override
  String get autoDownloadOnWifiOffSubtitle => 'オフ';

  @override
  String get concurrentDownloads => '同時ダウンロード数';

  @override
  String get autoDownload => '自動ダウンロード';

  @override
  String get autoDownloadSubtitle =>
      'シリーズ、ポッドキャスト、プレイリスト、コレクションの詳細ページごとに有効にできます';

  @override
  String get autoDownloadEnabledFor => 'オンにしている項目';

  @override
  String get autoDownloadEnabledForNone => 'まだありません';

  @override
  String get autoDownloadSourceUnnamed => 'まだ読み込まれていません';

  @override
  String get keepNext => '保持する件数';

  @override
  String get keepNextInfoTitle => '保持する件数';

  @override
  String get keepNextInfoContent =>
      '再生中のものを含めて、ダウンロードしたままにする項目の数です。たとえば「3件保持」の場合、現在の本と、そのシリーズ、ポッドキャスト、プレイリスト、コレクションの次の2件がダウンロードされたままになります。オンにしたすべての自動ダウンロードに適用されます。';

  @override
  String get deleteAbsorbedDownloads => '聴き終えたダウンロードを削除';

  @override
  String get deleteAbsorbedDownloadsInfoTitle => '聴き終えたダウンロードを削除';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      'オンにすると、Absorbで聴き終えた本やエピソードのダウンロードがこのデバイスから自動で削除されます。ウェブや他のデバイスで完了にした場合、ここのダウンロードは削除されません。';

  @override
  String get deleteAbsorbedOnSubtitle => '容量節約のため、完了した項目は削除されます';

  @override
  String get deleteAbsorbedOffSubtitle => 'オフ - 完了したダウンロードを保持';

  @override
  String get downloadLocation => 'ダウンロード先';

  @override
  String get storageUsed => '使用中のストレージ';

  @override
  String storageUsedByDownloads(String size) {
    return 'ダウンロードで $size を使用中';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return '$total 中 $free が空き';
  }

  @override
  String get manageDownloads => 'ダウンロードを管理';

  @override
  String get streamingCache => 'ストリーミングキャッシュ';

  @override
  String get streamingCacheInfoTitle => 'ストリーミングキャッシュ';

  @override
  String get streamingCacheInfoContent =>
      'ストリーミング再生した音声をディスクにキャッシュし、巻き戻したり同じ部分を聴き直したりするときに再ダウンロードしなくて済むようにします。キャッシュは自動で管理され、サイズ上限に達すると古いファイルから削除されます。完全にダウンロードした本とは別のものです。';

  @override
  String get streamingCacheOff => 'オフ';

  @override
  String get streamingCacheOffSubtitle => 'オフ - キャッシュせずにストリーミング再生';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size MB - 最近ストリーミング再生した音声をディスクにキャッシュ';
  }

  @override
  String get clearCache => 'キャッシュを消去';

  @override
  String get streamingCacheCleared => 'ストリーミングキャッシュを消去しました';

  @override
  String get sectionLibrary => 'ライブラリ';

  @override
  String get hideEbookOnlyTitles => '電子書籍のみの作品を非表示';

  @override
  String get hideEbookOnlyOnSubtitle => '音声ファイルのない本は非表示になります';

  @override
  String get hideEbookOnlyOffSubtitle => 'オフ - すべてのライブラリ項目を表示';

  @override
  String get homeCardsOpenDetails => 'ホームから詳細を開く';

  @override
  String get homeCardsOpenDetailsOnSubtitle =>
      '「続きを聴く」や「続きを読む」のカードをタップすると詳細が開きます';

  @override
  String get homeCardsOpenDetailsOffSubtitle =>
      '「続きを聴く」や「続きを読む」のカードをタップすると、前回の続きから再開します';

  @override
  String get showGoodreadsButton => 'Goodreadsボタンを表示';

  @override
  String get showGoodreadsOnSubtitle => '本の詳細シートにGoodreadsへのリンクを表示します';

  @override
  String get showGoodreadsOffSubtitle => 'オフ - Goodreadsボタンを非表示';

  @override
  String get sectionPermissions => '権限';

  @override
  String get notifications => '通知';

  @override
  String get notificationsSubtitle => 'ダウンロードの進捗と再生コントロール用';

  @override
  String get notificationsAlreadyEnabled => '通知はすでに有効です';

  @override
  String get unrestrictedBattery => 'バッテリーの制限なし';

  @override
  String get unrestrictedBatterySubtitle => 'Androidによるバックグラウンド再生の強制終了を防ぎます';

  @override
  String get batteryAlreadyUnrestricted => 'バッテリーはすでに制限なしです';

  @override
  String get sectionIssuesAndSupport => '問題とサポート';

  @override
  String get bugsAndFeatureRequests => '不具合と機能のリクエスト';

  @override
  String get bugsAndFeatureRequestsSubtitle => 'GitHubでIssueを作成';

  @override
  String get joinDiscord => 'Discordに参加';

  @override
  String get joinDiscordSubtitle => 'コミュニティ、サポート、最新情報';

  @override
  String get contact => 'お問い合わせ';

  @override
  String get contactSubtitle => 'デバイス情報をメールで送信';

  @override
  String get enableLogging => 'ログを有効にする';

  @override
  String get enableLoggingOnSubtitle => 'オン - ログをファイルに保存(再起動で反映)';

  @override
  String get enableLoggingOffSubtitle => 'オフ - ログを記録しません';

  @override
  String get loggingEnabledSnackbar => 'ログを有効にしました - アプリを再起動すると記録を開始します';

  @override
  String get loggingDisabledSnackbar => 'ログを無効にしました - アプリを再起動すると記録を停止します';

  @override
  String get sendLogs => 'ログを送信';

  @override
  String get sendLogsSubtitle => 'ログファイルを添付ファイルとして共有';

  @override
  String failedToShare(String error) {
    return '共有に失敗しました: $error';
  }

  @override
  String get clearLogs => 'ログを消去';

  @override
  String get logsCleared => 'ログを消去しました';

  @override
  String get clearLogsQuestion => 'ログを消去しますか?';

  @override
  String get clearLogsContent => 'この操作は元に戻せません。必要な場合は先に送信してください。';

  @override
  String get sectionAdvanced => '詳細設定';

  @override
  String get localServer => 'ローカルサーバー';

  @override
  String get localServerInfoTitle => 'ローカルサーバー';

  @override
  String get localServerInfoContent =>
      'Audiobookshelfサーバーを自宅で運用している場合は、ここにローカル/LANのURLを設定できます。ホームネットワークにいることを検出すると、Absorbが自動的により高速なローカル接続に切り替え、外出中はリモートURLに戻します。';

  @override
  String get localServerOnConnectedSubtitle => 'ローカルサーバー経由で接続中';

  @override
  String get localServerOnRemoteSubtitle => '有効 - リモートサーバーを使用中';

  @override
  String get localServerOffSubtitle => '自宅のWi-Fiにいるときに、LANサーバーへ自動で切り替えます';

  @override
  String get localServerUrlLabel => 'ローカルサーバーのURL';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar =>
      'ローカルサーバーのURLを設定しました - ホームネットワークにいるときに自動で接続します';

  @override
  String get disableAudioFocus => 'オーディオフォーカスを無効にする';

  @override
  String get disableAudioFocusInfoTitle => 'オーディオフォーカス';

  @override
  String get disableAudioFocusInfoContent =>
      '通常、Androidは一度に1つのアプリにだけ音声の「フォーカス」を与えるため、Absorbの再生中は他の音声(音楽や動画)が一時停止します。オーディオフォーカスを無効にすると、Absorbを他のアプリと同時に再生できます。通話中は、この設定に関係なく再生が一時停止されます。';

  @override
  String get disableAudioFocusOnSubtitle => 'オン - 他の音声と同時に再生(通話中は一時停止)';

  @override
  String get disableAudioFocusOffSubtitle => 'オフ - Absorbの再生中は他の音声が一時停止';

  @override
  String get restartRequired => '再起動が必要です';

  @override
  String get restartRequiredContent =>
      'オーディオフォーカスの変更を反映するには、完全に再起動する必要があります。今すぐアプリを閉じますか?';

  @override
  String get closeApp => 'アプリを閉じる';

  @override
  String get trustAllCertificates => 'すべての証明書を信頼';

  @override
  String get trustAllCertificatesInfoTitle => '自己署名証明書';

  @override
  String get mp3IndexSeeking => 'MP3インデックスシーク';

  @override
  String get mp3IndexSeekingInfoTitle => 'MP3インデックスシーク';

  @override
  String get mp3IndexSeekingInfoContent =>
      '正しい位置にシークできないMP3ファイルがある場合のみ有効にしてください。シークのずれは、多くの場合、可変ビットレート(VBR)のMP3が原因です。インデックスシークはファイルの読み込み中に正確な時間マップを作成するため、大きなMP3の終盤へ移動するのに時間がかかることがあります。特にストリーミング再生では、その位置までファイルを読み込む必要があります。次に本またはポッドキャストのエピソードを開始したときから有効になります。';

  @override
  String get mp3IndexSeekingOnSubtitle => 'オン - VBRのMP3ファイルを正確にシーク';

  @override
  String get mp3IndexSeekingOffSubtitle => 'オフ - 通常のシーク';

  @override
  String get trustAllCertificatesInfoContent =>
      'Audiobookshelfサーバーが自己署名証明書やカスタムルートCAを使用している場合に有効にしてください。有効にすると、Absorbはすべての接続でTLS証明書の検証をスキップします。ネットワークを信頼できる場合のみ有効にしてください。';

  @override
  String get trustAllCertificatesOnSubtitle => 'オン - すべての証明書を受け入れます';

  @override
  String get trustAllCertificatesOffSubtitle => 'オフ - 信頼できる証明書のみ受け入れます';

  @override
  String get supportTheDev => '開発者を応援';

  @override
  String get buyMeACoffee => 'コーヒーをおごる';

  @override
  String appVersionFormat(String version) {
    return 'Absorb v$version';
  }

  @override
  String betaLabel(int number) {
    return 'ベータ $number';
  }

  @override
  String appVersionWithServerFormat(String version, String serverVersion) {
    return 'Absorb v$version  -  サーバー $serverVersion';
  }

  @override
  String get backupAndRestore => 'バックアップと復元';

  @override
  String get backupAndRestoreSubtitle => 'すべての設定をファイルに保存、またはファイルから復元';

  @override
  String get backUp => 'バックアップ';

  @override
  String get restore => '復元';

  @override
  String get allBookmarks => 'すべてのブックマーク';

  @override
  String get allBookmarksSubtitle => 'すべての本のブックマークを表示';

  @override
  String get switchAccount => 'アカウントを切り替え';

  @override
  String get addAccount => 'アカウントを追加';

  @override
  String get logOut => 'ログアウト';

  @override
  String get includeLoginInfoTitle => 'ログイン情報を含めますか?';

  @override
  String get includeLoginInfoContent =>
      '保存されているすべてのアカウントのログイン情報をバックアップに含めますか?\n\n新しいデバイスでの復元が簡単になりますが、ファイルに認証トークンが含まれます。';

  @override
  String get noSettingsOnly => 'いいえ、設定のみ';

  @override
  String get yesIncludeAccounts => 'はい、アカウントも含める';

  @override
  String get backupSavedWithAccounts => 'バックアップを保存しました(アカウント込み)';

  @override
  String get backupSavedSettingsOnly => 'バックアップを保存しました(設定のみ)';

  @override
  String backupFailed(String error) {
    return 'バックアップに失敗しました: $error';
  }

  @override
  String get restoreBackupTitle => 'バックアップを復元しますか?';

  @override
  String get restoreBackupContent => '現在の設定がすべてバックアップの値に置き換えられます。';

  @override
  String fromAbsorbVersion(String version) {
    return 'Absorb v$version から';
  }

  @override
  String restoreAccountsChip(int count) {
    return 'アカウント $count 件';
  }

  @override
  String restoreBookmarksChip(int count) {
    return '$count 冊分のブックマーク';
  }

  @override
  String get restoreCustomHeadersChip => 'カスタムヘッダー';

  @override
  String get invalidBackupFile => '無効なバックアップファイルです';

  @override
  String get settingsRestoredSuccessfully => '設定を復元しました';

  @override
  String restoreFailed(String error) {
    return '復元に失敗しました: $error';
  }

  @override
  String get logOutTitle => 'ログアウトしますか?';

  @override
  String get logOutContent => 'サインアウトします。ダウンロードはこのデバイスに残ります。';

  @override
  String get signOut => 'サインアウト';

  @override
  String get changePasswordTitle => 'パスワードを変更';

  @override
  String get changePasswordSubtitle => 'Audiobookshelfのパスワードを安全に更新';

  @override
  String get currentPassword => '現在のパスワード';

  @override
  String get newPassword => '新しいパスワード';

  @override
  String get confirmNewPassword => '新しいパスワードを確認';

  @override
  String get passwordChangeEffect =>
      'パスワードを変更すると、他のAudiobookshelfセッションがサインアウトされます。このデバイスはサインインしたままです。';

  @override
  String get passwordFieldsRequired => 'すべてのパスワード欄を入力してください';

  @override
  String get passwordsDoNotMatch => '新しいパスワードが一致しません';

  @override
  String get passwordChanged => 'パスワードを変更しました。サインインしていた他のデバイスは切断されました。';

  @override
  String get passwordInvalid => '現在のパスワードが正しくありません';

  @override
  String get passwordChangeUnsupported =>
      'このサーバーのバージョンは、Absorbからの安全なパスワード変更に対応していません';

  @override
  String get passwordChangeFailed => 'パスワードを変更できませんでした';

  @override
  String get otherUserPasswordResetWarning =>
      'このパスワードを変更すると、そのユーザーはすべてのデバイスでサインアウトされます。';

  @override
  String get manageSessionsTitle => 'サインイン中のデバイス';

  @override
  String get manageSessionsSubtitle => 'Audiobookshelfのセッションを確認・削除';

  @override
  String get sessionsCurrent => 'このデバイス';

  @override
  String get sessionsUnknownDevice => '不明なデバイス';

  @override
  String sessionsLastActive(String date) {
    return '最終アクティブ: $date';
  }

  @override
  String get sessionsNone => '有効なセッションはありません';

  @override
  String get sessionsLoadMore => 'さらに読み込む';

  @override
  String get sessionsUnsupported => 'セッション管理にはAudiobookshelf 2.36以降が必要です。';

  @override
  String get sessionsLoadFailed => 'サインイン中のデバイスを読み込めませんでした';

  @override
  String get sessionsLegacyNotice =>
      'このログインにはリフレッシュセッションがないため、Absorbは一覧でこのデバイスを特定できません。';

  @override
  String get sessionsRemove => 'デバイスをサインアウト';

  @override
  String get sessionsRemoveTitle => 'このデバイスをサインアウトしますか?';

  @override
  String get sessionsRemoveContent =>
      'このデバイスのリフレッシュセッションを削除します。有効期限の短いトークンが切れるまで、現在のアクセスは使える場合があります。';

  @override
  String get sessionsRemoved => 'デバイスをサインアウトしました';

  @override
  String get sessionsRemoveFailed => 'そのデバイスをサインアウトできませんでした';

  @override
  String get sessionsSignOutAll => 'すべてのデバイスをサインアウト';

  @override
  String get sessionsSignOutAllTitle => 'すべての場所でサインアウトしますか?';

  @override
  String get sessionsSignOutAllContent =>
      'このデバイスを含め、すべてのリフレッシュセッションを削除します。既存のアクセストークンは、期限が切れるまで使える場合があります。';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return 'スケジュールはサーバー時刻($timeZone)を使用します';
  }

  @override
  String get podcastScheduleServerTimeUnknown => 'スケジュールはサーバー時刻を使用します';

  @override
  String get editServerAddressTitle => 'サーバーアドレスを編集';

  @override
  String editServerAddressSubtitle(String username) {
    return '$usernameのアドレスを更新します。サーバーのアドレスが変わった場合にお使いください。同じサーバーで、URLが新しくなるだけです。統計とダウンロードは保持されます。';
  }

  @override
  String get editServerAddressField => 'サーバーアドレス';

  @override
  String get editServerAddressUpdated => 'サーバーアドレスを更新しました';

  @override
  String get editServerAddressFailed => 'サーバーアドレスを更新できませんでした';

  @override
  String get editServerAddressAction => 'サーバーアドレスを編集';

  @override
  String get editServerConnectionTitle => 'サーバー接続を編集';

  @override
  String editServerConnectionSubtitle(String username) {
    return '$usernameのサーバーアドレスとカスタムヘッダーを更新します。統計とダウンロードは保持されます。';
  }

  @override
  String get editServerConnectionAction => 'サーバー接続を編集';

  @override
  String get editServerConnectionUpdated => 'サーバー接続を更新しました';

  @override
  String get editServerConnectionFailed => 'サーバー接続を更新できませんでした';

  @override
  String get editCustomHeadersDescription =>
      'Cloudflareトンネルやリバースプロキシで使用します。このヘッダーは、この保存済みアカウントにのみ適用されます。';

  @override
  String get removeAccountAction => 'アカウントを削除';

  @override
  String get removeAccountTitle => 'アカウントを削除しますか?';

  @override
  String removeAccountContent(String username, String server) {
    return '$serverの$usernameを保存済みアカウントから削除しますか?\n\n後でもう一度サインインすれば、いつでも追加し直せます。';
  }

  @override
  String get switchAccountTitle => 'アカウントを切り替えますか?';

  @override
  String switchAccountContent(String username, String server) {
    return '$serverの$usernameに切り替えますか?\n\n現在の再生は停止され、アプリは別のアカウントのデータで再読み込みされます。';
  }

  @override
  String get switchButton => '切り替え';

  @override
  String get downloadLocationSheetTitle => 'ダウンロード先';

  @override
  String get downloadLocationSheetSubtitle => 'オーディオブックの保存先を選択';

  @override
  String get currentLocation => '現在の保存先';

  @override
  String get existingDownloadsWarning =>
      '既存のダウンロードは現在の場所に残ります。新しいパスが使われるのは新規のダウンロードのみです。';

  @override
  String get chooseFolder => 'フォルダーを選択';

  @override
  String get chooseDownloadFolder => 'ダウンロードフォルダーを選択';

  @override
  String get storagePermissionDenied =>
      'ストレージの権限が完全に拒否されています - アプリの設定で有効にしてください';

  @override
  String get openSettings => '設定を開く';

  @override
  String get storagePermissionRequired => 'カスタムのダウンロード先を使うにはストレージの権限が必要です';

  @override
  String get cannotWriteToFolder =>
      'そのフォルダーには書き込めません - 別の場所を選ぶか、システム設定でファイルへのアクセスを許可してください';

  @override
  String downloadLocationSetTo(String label) {
    return 'ダウンロード先を$labelに設定しました';
  }

  @override
  String get resetToDefault => 'デフォルトに戻す';

  @override
  String get resetToDefaultStorage => 'デフォルトのストレージに戻す';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のダウンロードが、開けなくなった古いカスタムフォルダーにあります。再ダウンロードするか、この通知を閉じてください。',
      one: '1件のダウンロードが、開けなくなった古いカスタムフォルダーにあります。再ダウンロードするか、この通知を閉じてください。',
    );
    return '$_temp0';
  }

  @override
  String get redownload => '再ダウンロード';

  @override
  String get redownloadStarted => '再ダウンロード中';

  @override
  String get dismiss => '閉じる';

  @override
  String get tipsAndHiddenFeatures => 'ヒントと隠れた機能';

  @override
  String get tipsSubtitle => 'Absorbを使いこなそう';

  @override
  String get adminTitle => 'サーバー管理';

  @override
  String get adminTasksTitle => 'サーバーのアクティビティ';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のタスクを実行中',
      one: '1件のタスクを実行中',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => '最近のサーバーアクティビティ';

  @override
  String get adminTasksEmpty => '実行中のサーバータスクはありません';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return '追加 $added - 更新 $updated - 欠落 $missing';
  }

  @override
  String get adminServer => 'サーバー';

  @override
  String get adminVersion => 'バージョン';

  @override
  String get adminUsers => 'ユーザー';

  @override
  String get adminOnline => 'オンライン';

  @override
  String get adminBackup => 'バックアップ';

  @override
  String get adminPurgeCache => 'キャッシュを消去';

  @override
  String get adminManage => '管理';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return '$userCount アカウント - $onlineCount オンライン';
  }

  @override
  String get adminPodcasts => 'ポッドキャスト';

  @override
  String get adminPodcastsSubtitle => '番組の検索・追加・管理';

  @override
  String get adminScan => 'スキャン';

  @override
  String get adminScanning => 'スキャン中...';

  @override
  String get adminMatchAll => 'すべてマッチ';

  @override
  String get adminMatching => 'マッチ中...';

  @override
  String get adminMatchAllTitle => 'すべての項目をマッチしますか?';

  @override
  String adminMatchAllContent(String name) {
    return '$name内のすべての項目のメタデータをマッチしますか? 時間がかかることがあります。';
  }

  @override
  String adminScanStarted(String name) {
    return '$nameのスキャンを開始しました';
  }

  @override
  String get adminBackupCreated => 'バックアップを作成しました';

  @override
  String get adminBackupFailed => 'バックアップに失敗しました';

  @override
  String get adminCachePurged => 'キャッシュを消去しました';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => 'アプリ内で開く';

  @override
  String get adminRmabAdd => 'ReadMeABook連携を追加';

  @override
  String get adminRmabUrlTitle => 'ReadMeABookのURL';

  @override
  String get adminRmabUrlHelp =>
      'ログイントークン付きのURLを貼り付けてください。RMABの管理、ユーザーで生成できます。';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => '有効なhttp(s)のURLを入力してください';

  @override
  String get adminRmabSaved => 'ReadMeABookを保存しました';

  @override
  String get adminRmabRemoved => 'ReadMeABookを削除しました';

  @override
  String get adminRmabReload => '再読み込み';

  @override
  String get adminRmabLoadFailed => 'ReadMeABookを読み込めませんでした。URLを確認してください。';

  @override
  String get adminRmabConnected => '接続済み';

  @override
  String get adminRmabAskAdmin => 'ログインURLはサーバー管理者から入手してください';

  @override
  String get adminRmabUrlHelpUser =>
      'ログインURLはサーバー管理者から入手してください。管理者はRMABの管理 > ユーザーで生成できます。';

  @override
  String get adminRmabSettingsInfo =>
      'ReadMeABookは、オーディオブックのリクエストとダウンロードを行うセルフホスト型のサービスです。サーバー管理者がインストールして設定する必要があります。';

  @override
  String get rmabConfigTitle => 'ReadMeABookに接続';

  @override
  String get rmabConfigExplainerAdmin =>
      'ReadMeABookは、オーディオブックをリクエストするためのセルフホスト型のサービスです。RMABの管理ダッシュボード > 設定 > APIでAPIトークンを生成し、サーバーのURLとトークンを下に貼り付けてください。Absorbはコンテンツのホスティングやダウンロードを行わず、お使いのサーバーにリクエストを送るだけです。';

  @override
  String get rmabConfigExplainerUser =>
      'ReadMeABookは、オーディオブックをリクエストするためのセルフホスト型のサービスです。RMABのURLとAPIトークンをサーバー管理者に尋ねてください。Absorbはコンテンツのホスティングやダウンロードを行わず、お使いのサーバーにリクエストを送るだけです。';

  @override
  String get rmabConfigLearnMore => 'ReadMeABookについて詳しく見る';

  @override
  String get rmabConfigBaseUrlLabel => 'RMABサーバーのURL';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.example.com';

  @override
  String get rmabConfigTokenLabel => 'APIトークン';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel => 'Web UIのログインURL(任意)';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      '自動ログインURLを貼り付けると、「ブラウザビューで開く」でサインイン済みの状態で開けます。空欄の場合は通常のログインになります。';

  @override
  String get rmabConfigHeadersHelp =>
      'Cloudflare Accessなどのリバースプロキシ向けに、すべてのReadMeABookリクエストに付加する追加ヘッダーです。';

  @override
  String get rmabConfigConnect => '接続';

  @override
  String get rmabConfigDisconnect => '切断';

  @override
  String get rmabConfigOpenWebView => 'ブラウザビューで開く';

  @override
  String rmabConfigConnectedAs(String name) {
    return '$nameとして接続中';
  }

  @override
  String get rmabConfigErrorInvalidUrl => '有効なhttp(s)のURLを入力してください';

  @override
  String get rmabConfigErrorMissingToken => 'APIトークンを入力してください';

  @override
  String get rmabConfigErrorUnauthorized => 'サーバーがトークンを拒否しました';

  @override
  String get rmabConfigErrorForbidden => 'このトークンではその操作は許可されていません';

  @override
  String get rmabConfigErrorNetwork => 'RMABに接続できませんでした。URLを確認してください。';

  @override
  String get rmabConfigErrorGeneric => '接続できませんでした';

  @override
  String get rmabConfigSavedSnackbar => 'ReadMeABookに接続しました';

  @override
  String get rmabConfigDisconnectedSnackbar => 'ReadMeABookを切断しました';

  @override
  String get rmabRequestCta => 'ReadMeABookでリクエスト';

  @override
  String get rmabSearchHeader => 'ReadMeABookでリクエスト';

  @override
  String get rmabSearchHint => 'タイトルまたは著者で検索';

  @override
  String get rmabSearchEmpty => 'ReadMeABookサーバーに一致するものはありません';

  @override
  String get rmabSearchError => 'ReadMeABookを検索できませんでした';

  @override
  String get rmabSearchPrompt => 'タイトルまたは著者を入力して検索';

  @override
  String get rmabSearchFooterPrompt => '他のものをお探しですか?';

  @override
  String rmabSearchFooterCta(String query) {
    return 'ReadMeABookで「$query」を検索';
  }

  @override
  String get rmabBookDetailExplainer =>
      'このリクエストはReadMeABookサーバー経由で送信されます。管理者が確認して処理します。ReadMeABookタイルの「マイリクエスト」で状況を確認できます。';

  @override
  String get rmabBookAlreadyAvailable => 'すでにライブラリにあります';

  @override
  String get rmabBookAlreadyRequested => 'リクエスト済み';

  @override
  String get rmabRequestSubmitting => '送信中…';

  @override
  String get rmabRequestSent => 'リクエストを送信しました';

  @override
  String get rmabRequestErrorAlreadyAvailable => 'すでにライブラリにあります';

  @override
  String get rmabRequestErrorBeingProcessed => 'すでに処理中です';

  @override
  String get rmabRequestErrorDuplicate => 'すでにリクエスト済みです';

  @override
  String get rmabRequestErrorValidation => 'リクエストを送信できませんでした';

  @override
  String get rmabRequestErrorUserNotFound =>
      'トークンのユーザーが存在しません。ReadMeABookに再接続してください。';

  @override
  String get rmabRequestErrorIgnored => 'この本は無視リストに入っています';

  @override
  String get rmabRequestErrorGeneric => 'リクエストを送信できませんでした';

  @override
  String get rmabRequestErrorTokenRejected =>
      'サーバーがトークンを拒否しました。ReadMeABookに再接続してください。';

  @override
  String get rmabMyRequestsTab => 'マイリクエスト';

  @override
  String get rmabSetupTab => 'セットアップ';

  @override
  String get rmabMyRequestsEmpty => 'まだ本をリクエストしていません';

  @override
  String get rmabMyRequestsError => 'リクエストを読み込めませんでした';

  @override
  String get rmabMyRequestsRefresh => '更新';

  @override
  String get rmabRequestDetailTitle => 'リクエストの詳細';

  @override
  String get rmabRequestDetailStatus => 'ステータス';

  @override
  String get rmabRequestDetailRequestedOn => 'リクエスト日';

  @override
  String get rmabRequestDetailCompletedOn => '完了日';

  @override
  String get rmabRequestDetailProgress => '進捗';

  @override
  String get rmabStatusActive => '進行中';

  @override
  String get rmabStatusWaiting => '待機中';

  @override
  String get rmabStatusAvailable => '利用可能';

  @override
  String get rmabStatusDownloaded => 'ダウンロード済み';

  @override
  String get rmabStatusFailed => '失敗';

  @override
  String get rmabStatusCancelled => 'キャンセル済み';

  @override
  String get rmabStatusDenied => '却下';

  @override
  String get rmabStatusUnknown => '不明';

  @override
  String narratedBy(String narrator) {
    return 'ナレーター: $narrator';
  }

  @override
  String get onAudible => 'Audibleで';

  @override
  String percentComplete(String percent) {
    return '$percent% 完了';
  }

  @override
  String get absorbing => 'Absorb 中...';

  @override
  String get absorbAgain => 'もう一度 Absorb';

  @override
  String get absorb => 'Absorb';

  @override
  String get ebookOnlyNoAudio => '電子書籍のみ - 音声なし';

  @override
  String get absorbAudioNotDownloaded => '音声は未ダウンロードです';

  @override
  String get absorbAudioNotDownloadedEbookOnly => '音声は未ダウンロードです(電子書籍のみ)';

  @override
  String get fullyAbsorbed => 'Absorb 完了';

  @override
  String get fullyAbsorbAction => '完全に Absorb';

  @override
  String get removeFromAbsorbing => 'Absorbing から削除';

  @override
  String get addToAbsorbing => 'Absorbing に追加';

  @override
  String get absorbNext => '次に Absorb';

  @override
  String get absorbNextAdded => 'Absorbing の次に再生';

  @override
  String get absorbLast => '最後に Absorb';

  @override
  String get absorbNextHint => '再生中のものの直後';

  @override
  String get absorbLastHint => 'リストの末尾';

  @override
  String get removedFromAbsorbing => 'Absorbing から削除しました';

  @override
  String get addedToAbsorbing => 'Absorbing に追加しました';

  @override
  String get removeFromContinueListening => '「続きを聴く」から削除';

  @override
  String get removedFromContinueListening => '「続きを聴く」から削除しました';

  @override
  String get removeFromContinueReading => '「続きを読む」から削除';

  @override
  String get removedFromContinueReading => '「続きを読む」から削除しました';

  @override
  String get sessionAdd => 'セッションを追加';

  @override
  String get sessionStartLabel => '開始時刻';

  @override
  String get sessionAdded => 'セッションを追加しました';

  @override
  String get sessionAddFailed => 'セッションを追加できませんでした';

  @override
  String get removeSeriesFromContinueSeries => '「シリーズの続き」から削除';

  @override
  String get removedSeriesFromContinueSeries => '「シリーズの続き」から削除しました';

  @override
  String get couldNotUpdate => '更新できませんでした。もう一度お試しください';

  @override
  String get addToPlaylist => 'プレイリストに追加';

  @override
  String get addToCollection => 'コレクションに追加';

  @override
  String get downloadEbook => '電子書籍をダウンロード';

  @override
  String get downloadEbookAgain => '電子書籍を再ダウンロード';

  @override
  String get resetProgress => '進捗をリセット';

  @override
  String get lookupLocalMetadata => 'ローカルメタデータを検索';

  @override
  String get reLookupLocalMetadata => 'ローカルメタデータを再検索';

  @override
  String get clearLocalMetadata => 'ローカルメタデータを消去';

  @override
  String get searchOnGoodreads => 'Goodreadsで検索';

  @override
  String get editServerDetails => 'サーバー情報を編集';

  @override
  String get encodeTab => 'エンコード';

  @override
  String get codec => 'コーデック';

  @override
  String get bitrate => 'ビットレート';

  @override
  String get channels => 'チャンネル';

  @override
  String get mono => 'モノラル';

  @override
  String get stereo => 'ステレオ';

  @override
  String get startM4bEncode => 'M4Bエンコードを開始';

  @override
  String get encodeStarted => 'M4Bのエンコードを開始しました';

  @override
  String get encodeFailed => 'エンコードを開始できませんでした';

  @override
  String get encodeFinished => 'M4Bのエンコードが完了しました';

  @override
  String get currentlyLabel => '現在:';

  @override
  String encodeOutputPathNote(String path) {
    return '完成したM4Bはオーディオブックフォルダーの次の場所に保存されます: $path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return '元の音声ファイルのバックアップは /metadata/cache/items/$itemId/ に保存されます。アイテムのキャッシュを定期的に消去してください。';
  }

  @override
  String get encodeTimeNote => 'エンコードには最大30分かかることがあります。';

  @override
  String get encodeRescanNote =>
      'ウォッチャーを無効にしている場合は、完了後にこのオーディオブックを再スキャンする必要があります。';

  @override
  String get aboutSection => '概要';

  @override
  String chaptersCount(int count) {
    return 'チャプター ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return 'オーディオトラック ($count)';
  }

  @override
  String libraryFilesCount(int count) {
    return 'ライブラリファイル ($count)';
  }

  @override
  String get chapters => 'チャプター';

  @override
  String get noChaptersBook => 'この本にはチャプターがありません';

  @override
  String get noChaptersPodcast => 'このポッドキャストにはチャプターがありません';

  @override
  String get failedToLoad => '読み込みに失敗しました';

  @override
  String startedDate(String date) {
    return '開始: $date';
  }

  @override
  String finishedDate(String date) {
    return '完了: $date';
  }

  @override
  String andCountMore(int count) {
    return 'ほか$count件';
  }

  @override
  String get markAsFullyAbsorbedQuestion => 'Absorb 完了にしますか?';

  @override
  String get markAsFullyAbsorbedContent => '進捗を100%に設定し、この本を再生中の場合は再生を停止します。';

  @override
  String get markedAsFinishedNiceWork => '完了にしました - お疲れさまです!';

  @override
  String get failedToUpdateCheckConnection => '更新に失敗しました - 接続を確認してください';

  @override
  String get markAsNotFinishedQuestion => '未完了にしますか?';

  @override
  String get markAsNotFinishedContent => '完了の状態を解除し、位置を先頭に戻します。';

  @override
  String get unmark => '解除';

  @override
  String get markedAsNotFinishedBackAtIt => '未完了にしました - また続けましょう!';

  @override
  String get resetProgressQuestion => '進捗をリセットしますか?';

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
  String get progressResetFreshStart => '進捗をリセットしました - 新たなスタートです!';

  @override
  String get clearLocalMetadataQuestion => 'ローカルメタデータを消去しますか?';

  @override
  String get clearLocalMetadataContent => 'ローカルに保存されたメタデータを削除し、サーバーにある内容に戻します。';

  @override
  String get localMetadataCleared => 'ローカルメタデータを消去しました';

  @override
  String get saveEbook => '電子書籍を保存';

  @override
  String get noEbookFileFound => '電子書籍ファイルが見つかりません';

  @override
  String get bookmark => 'ブックマーク';

  @override
  String get bookmarks => 'ブックマーク';

  @override
  String bookmarksWithCount(int count) {
    return 'ブックマーク ($count)';
  }

  @override
  String get playbackSpeed => '再生速度';

  @override
  String get noBookmarksYet => 'ブックマークはまだありません';

  @override
  String get longPressBookmarkHint => 'ブックマークボタンを長押しするとすぐに保存できます';

  @override
  String get addBookmark => 'ブックマークを追加';

  @override
  String get editBookmark => 'ブックマークを編集';

  @override
  String get titleLabel => 'タイトル';

  @override
  String get noteOptionalLabel => 'メモ(任意)';

  @override
  String get editLayout => 'レイアウトを編集';

  @override
  String get inMenu => 'メニュー内';

  @override
  String get bookmarkAdded => 'ブックマークを追加しました';

  @override
  String get startPlayingSomethingFirst => '先に何かを再生してください';

  @override
  String get playbackHistory => '再生履歴';

  @override
  String get historyLocalTab => '履歴';

  @override
  String get historyServerTab => 'セッション';

  @override
  String get historyNoServerSessions => 'この項目のサーバーセッションはまだありません';

  @override
  String get historyServerLoadFailed => 'サーバーセッションを読み込めませんでした';

  @override
  String get clearHistoryTooltip => '履歴を消去';

  @override
  String get tapEventToJump => 'イベントをタップすると、その位置に移動します';

  @override
  String get noHistoryYet => '履歴はまだありません';

  @override
  String jumpedToPosition(String position) {
    return '$positionに移動しました';
  }

  @override
  String booksInSeriesCount(int count) {
    return 'このシリーズには$count冊あります';
  }

  @override
  String bookNumber(String number) {
    return '第$number巻';
  }

  @override
  String downloadRemainingCount(int count) {
    return '残りをダウンロード ($count)';
  }

  @override
  String get downloadAll => 'すべてダウンロード';

  @override
  String get markAllNotFinished => 'すべて未完了にする';

  @override
  String get markAllFinished => 'すべて完了にする';

  @override
  String get markAllNotFinishedQuestion => 'すべて未完了にしますか?';

  @override
  String get fullyAbsorbSeries => 'シリーズを完全に Absorb しますか?';

  @override
  String get turnAutoDownloadOff => '自動ダウンロードをオフにする';

  @override
  String get turnAutoDownloadOn => '自動ダウンロードをオンにする';

  @override
  String get autoDownloadThisSeries => 'このシリーズを自動ダウンロードしますか?';

  @override
  String get autoDownloadSeriesContent => '聴き進めるのに合わせて、次の本を自動でダウンロードします。';

  @override
  String get standalone => '単巻';

  @override
  String get episodes => 'エピソード';

  @override
  String get noEpisodesFound => 'エピソードが見つかりません';

  @override
  String get markFinished => '完了にする';

  @override
  String get markUnfinished => '未完了にする';

  @override
  String get allEpisodes => 'すべてのエピソード';

  @override
  String get aboutThisEpisode => 'このエピソードについて';

  @override
  String get reversePlayOrder => '再生順を逆にする';

  @override
  String selectedCount(int count) {
    return '$count件を選択中';
  }

  @override
  String get selectAll => 'すべて選択';

  @override
  String get deselectAll => 'すべて選択解除';

  @override
  String get autoDownloadThisPodcast => 'このポッドキャストを自動ダウンロードしますか?';

  @override
  String get autoDownloadPodcastContent => '聴き進めるのに合わせて、次のエピソードを自動でダウンロードします。';

  @override
  String get download => 'ダウンロード';

  @override
  String get deleteDownload => 'ダウンロードを削除';

  @override
  String get casting => 'キャスト中';

  @override
  String get castingTo => 'キャスト先';

  @override
  String get editDetails => '詳細を編集';

  @override
  String get quickMatch => 'クイックマッチ';

  @override
  String get quickMatchNoUpdates => '更新の必要はありません';

  @override
  String get custom => 'カスタム';

  @override
  String get authorOptionalLabel => '著者(任意)';

  @override
  String get noResultsFound => '結果が見つかりません。\n検索語やプロバイダーを変えてお試しください。';

  @override
  String get searchForMetadataAbove => '上でメタデータを検索してください';

  @override
  String get applyThisMatch => 'このマッチを適用しますか?';

  @override
  String get metadataUpdated => 'メタデータを更新しました';

  @override
  String get failedToUpdateMetadata => 'メタデータを更新できませんでした';

  @override
  String get subtitleLabel => 'サブタイトル';

  @override
  String get authorLabel => '著者';

  @override
  String get narratorLabel => 'ナレーター';

  @override
  String get seriesLabel => 'シリーズ';

  @override
  String get addSeries => 'シリーズを追加';

  @override
  String get removeSeries => 'シリーズを削除';

  @override
  String get descriptionLabel => '説明';

  @override
  String get publisherLabel => '出版社';

  @override
  String get yearLabel => '年';

  @override
  String get genresLabel => 'ジャンル';

  @override
  String get tagsLabel => 'タグ';

  @override
  String get commaSeparated => 'カンマ区切り';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => 'カバー画像';

  @override
  String get coverRemove => 'カバーを削除';

  @override
  String get coverRemoveConfirm => 'この本のカバーを削除しますか? 代わりに自動生成されたタイトルカードが表示されます。';

  @override
  String get coverRemoved => 'カバーを削除しました';

  @override
  String get coverRemoveFailed => 'カバーを削除できませんでした';

  @override
  String get coverUrlLabel => 'カバーのURL';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => 'ローカルメタデータ';

  @override
  String get overrideLocalDisplay => 'ローカルの表示を上書き';

  @override
  String get metadataSavedLocally => 'メタデータをローカルに保存しました';

  @override
  String get notes => 'メモ';

  @override
  String get newNote => '新規メモ';

  @override
  String get editNote => 'メモを編集';

  @override
  String get noNotesYet => 'メモはまだありません';

  @override
  String get markdownIsSupported => 'Markdownに対応しています';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => '書式を保持します';

  @override
  String get plainTextTxt => 'プレーンテキスト (.txt)';

  @override
  String get simpleTextNoFormatting => '書式のないシンプルなテキスト';

  @override
  String get untitledNote => '無題のメモ';

  @override
  String get titleHint => 'タイトル';

  @override
  String get noteBodyHint => 'メモを書く...(Markdown対応)';

  @override
  String get nothingToPreview => 'プレビューする内容がありません';

  @override
  String get audioEnhancements => '音質調整';

  @override
  String get presets => 'プリセット';

  @override
  String get equalizer => 'イコライザー';

  @override
  String get effects => 'エフェクト';

  @override
  String get bassBoost => '低音ブースト';

  @override
  String get surround => 'サラウンド';

  @override
  String get loudness => 'ラウドネス';

  @override
  String get monoAudio => 'モノラル音声';

  @override
  String get skipSilence => '無音をスキップ';

  @override
  String get resetAll => 'すべてリセット';

  @override
  String get collectionNotFound => 'コレクションが見つかりません';

  @override
  String get deleteCollection => 'コレクションを削除';

  @override
  String get deleteCollectionContent => 'このコレクションを削除してもよろしいですか?';

  @override
  String get deleteCollectionFailed => 'コレクションを削除できませんでした';

  @override
  String get deletePermissionRequired => '削除権限が必要です。ルート管理者に削除権限の付与を依頼してください。';

  @override
  String get deleteFilesCheckbox => 'サーバー上のファイルも削除する';

  @override
  String get deleteFilesCheckedHint => 'ファイルはサーバーから完全に削除されます。';

  @override
  String get deleteFilesUncheckedHint =>
      'ファイルはサーバーに残るため、次回のライブラリスキャンで再び追加される場合があります。';

  @override
  String get deleteFromServerAction => 'サーバーから削除';

  @override
  String get deleteFromServerTitle => 'サーバーから削除';

  @override
  String deleteFromServerContent(String title) {
    return '「$title」をAudiobookshelfから削除しますか?';
  }

  @override
  String deletedFromServer(String title) {
    return '「$title」を削除しました';
  }

  @override
  String get deleteFromServerFailed => '削除できませんでした。サーバーのログを確認してください。';

  @override
  String get playlistNotFound => 'プレイリストが見つかりません';

  @override
  String get deletePlaylist => 'プレイリストを削除';

  @override
  String get deletePlaylistContent => 'このプレイリストを削除してもよろしいですか?';

  @override
  String get newPlaylist => '新規プレイリスト';

  @override
  String get playlistNameHint => 'プレイリスト名';

  @override
  String addedToName(String name) {
    return '「$name」に追加しました';
  }

  @override
  String get failedToAdd => '追加できませんでした';

  @override
  String get newCollection => '新規コレクション';

  @override
  String get collectionNameHint => 'コレクション名';

  @override
  String get listsNewCollectionSubtitle => '本をまとめて、自分のリストにします';

  @override
  String get listsNewCollectionNeedsBookSubtitle => '最初に1冊以上の本が必要です';

  @override
  String get listsNewPlaylistSubtitle => '聴きたい本を順番に並べます';

  @override
  String get listsAddBooksNow => '今すぐ本を追加';

  @override
  String get listsPickBooksNext => '次に本を選びます。このサーバーのコレクションには1冊以上の本が必要です。';

  @override
  String get listsCreate => '作成';

  @override
  String get listsCollectionNeedsBook => 'コレクションには1冊以上の本が必要なため、何も作成されませんでした。';

  @override
  String get listsCreateFailed => '作成できませんでした';

  @override
  String get castToDevice => 'デバイスにキャスト';

  @override
  String get searchingForCastDevices => 'キャストデバイスを検索中...';

  @override
  String get castDevice => 'キャストデバイス';

  @override
  String get stopCasting => 'キャストを停止';

  @override
  String get disconnect => '切断';

  @override
  String get audioOutput => '音声出力';

  @override
  String get noOutputDevicesFound => '出力デバイスが見つかりません';

  @override
  String get welcomeToAbsorb => 'Absorb Plusへようこそ';

  @override
  String get welcomeTagline => 'Audiobookshelfクライアント。';

  @override
  String get welcomeAbsorbingTitle => 'Absorbing';

  @override
  String get welcomeAbsorbingIntro =>
      'Absorbでは「再生」や「聴く」の代わりに「absorb」という言葉を使います。従来の表現がよければ、設定で切り替えられます。';

  @override
  String get welcomeAbsorbingTabBullet => 'Absorbing タブ - 現在聴いているもの';

  @override
  String get welcomeAbsorbButtonBullet => 'Absorb ボタン - 再生を開始';

  @override
  String get welcomeFullyAbsorbBullet => '完全に Absorb - 完了にする';

  @override
  String get welcomeGettingAroundTitle => '基本的な使い方';

  @override
  String get welcomeGettingAroundBody =>
      'カバーをタップすると詳細が開きます。ただし「続きを聴く」のカードは別で、タップするとすぐに再生、長押しすると詳細が開きます。';

  @override
  String get welcomeMakeItYoursTitle => '自分好みに';

  @override
  String get welcomeMakeItYoursBody =>
      '設定をいろいろ試して、Absorbを好みに合わせて調整しましょう。中にある「ヒントと隠れた機能」もぜひご覧ください。';

  @override
  String get getStarted => 'はじめる';

  @override
  String get showMore => 'もっと見る';

  @override
  String get showLess => '一部を表示';

  @override
  String get readMore => '続きを読む';

  @override
  String get removeDownloadQuestion => 'ダウンロードを削除しますか?';

  @override
  String get removeDownloadContent => 'デバイスから削除されます。';

  @override
  String get removeWhichDownload =>
      'オーディオブックと電子書籍の両方がこのデバイスにあります。削除するものを選んでください。';

  @override
  String get downloadRemoved => 'ダウンロードを削除しました';

  @override
  String get finished => '完了';

  @override
  String get saved => 'ダウンロード済み';

  @override
  String get selectLibrary => 'ライブラリを選択';

  @override
  String get switchLibraryTooltip => 'ライブラリを切り替え';

  @override
  String get refreshTooltip => '更新';

  @override
  String get noBooksFound => '本が見つかりません';

  @override
  String get userFallback => 'ユーザー';

  @override
  String get rootAdmin => 'ルート管理者';

  @override
  String get admin => '管理者';

  @override
  String get serverAdmin => 'サーバー管理';

  @override
  String get serverAdminSubtitle => 'ユーザー、ライブラリ、サーバー設定を管理';

  @override
  String serverUpdateAvailable(String version) {
    return 'サーバーの更新 $version が利用可能です';
  }

  @override
  String get justNow => 'たった今';

  @override
  String minutesAgo(int count) {
    return '$count分前';
  }

  @override
  String hoursAgo(int count) {
    return '$count時間前';
  }

  @override
  String daysAgo(int count) {
    return '$count日前';
  }

  @override
  String get audible => 'Audible';

  @override
  String get iTunes => 'iTunes';

  @override
  String get openLibrary => 'Open Library';

  @override
  String get root => 'ルート';

  @override
  String get coverPlayPause => 'カバーで再生/一時停止';

  @override
  String get coverPlayPauseOnSubtitle => 'オン - カバーアートをタップして再生/一時停止';

  @override
  String get coverPlayPauseOffSubtitle => 'オフ - コントロールに専用の再生/一時停止ボタンを表示';

  @override
  String get cardBackground => 'カードの背景';

  @override
  String get cardBackgroundBlurred => 'ぼかし';

  @override
  String get cardBackgroundGradient => 'グラデーション';

  @override
  String get queueModeMergedSubtitle => '再生を停止、手動のキュー、または次の項目を自動再生';

  @override
  String get queueModeSeriesLabel => 'シリーズ';

  @override
  String get queueModeShowLabel => '番組';

  @override
  String get queueModeInfoSeries => 'シリーズ';

  @override
  String get queueModeInfoSeriesDesc =>
      'シリーズの次の本、またはポッドキャスト番組の次のエピソードを自動で再生します。';

  @override
  String get resetButtonGridQuestion => 'ボタン配置をリセットしますか?';

  @override
  String get resetButtonGridContent => 'ボタンのレイアウト、順序、オン/オフの設定をデフォルトに戻します。';

  @override
  String get reset => 'リセット';

  @override
  String get buttonGridReset => 'ボタン配置をリセットしました';

  @override
  String get resetButtonGrid => 'ボタン配置をリセット';

  @override
  String get chapterBarrierOnRewind => '巻き戻し時のチャプター境界';

  @override
  String get chapterBarrierInfoTitle => 'チャプター境界';

  @override
  String get chapterBarrierInfoContent =>
      'スキップバックすると、前のチャプターに入らず、現在のチャプターの先頭で止まります。\n\n2秒以内にスキップバックボタンをダブルタップすると、境界を越えられます。';

  @override
  String get chapterBarrierOnRewindOnSubtitle => 'オン - 巻き戻しはチャプターの先頭で止まります';

  @override
  String get chapterBarrierOnRewindOffSubtitle => 'オフ - 巻き戻しはチャプターの境界を越えます';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return 'オン - 一時停止の長さに応じて$min秒～$max秒';
  }

  @override
  String get rewindOnSessionStart => 'セッション開始時に巻き戻し';

  @override
  String get rewindOnSessionStartInfoContent =>
      '通常の自動巻き戻しは、アクティブなセッション中に一時停止から再開したときに働きます。この設定では、まったく新しいセッションを開始するとき(アプリを閉じた後、再生を停止した後、アプリを起動し直したときなど)にも巻き戻します。\n\n有効にすると、新しいセッションの開始時に最大巻き戻し量だけ巻き戻すので、中断した場面をもう一度聴けます。';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return 'オン - 新しいセッションの開始時に$seconds秒巻き戻します';
  }

  @override
  String rewindActivationDelayValue(String seconds) {
    return '$seconds秒以上';
  }

  @override
  String rewindRangeValue(String min, String max) {
    return '$min秒 – $max秒';
  }

  @override
  String rewindSecondsPause(String seconds) {
    return '$seconds秒の一時停止';
  }

  @override
  String rewindMinPause(String minutes) {
    return '$minutes分の一時停止';
  }

  @override
  String rewindHrPause(String hours) {
    return '$hours時間の一時停止';
  }

  @override
  String get rewindOneHrPause => '1時間の一時停止';

  @override
  String speedValue(String speed) {
    return '${speed}x';
  }

  @override
  String secondsValue(String seconds) {
    return '$seconds秒';
  }

  @override
  String minutesValue(int minutes) {
    return '$minutes分';
  }

  @override
  String get chimeBeforeSleep => 'スリープ前にチャイム';

  @override
  String get chimeBeforeSleepOnSubtitle => 'タイマー終了の直前にやさしいベルを鳴らします';

  @override
  String get chimeBeforeSleepOffSubtitle => 'スリープ前の音による予告なし';

  @override
  String get windDownDuration => '終了前の時間';

  @override
  String windDownDurationSubtitle(int seconds) {
    return 'スリープの$seconds秒前にフェードとチャイムを開始します';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return '最後の$seconds秒間で徐々に音量を下げます';
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
  String get endOfChapterShort => 'チャプターの終わり';

  @override
  String get endOfChapterOnSubtitle => '現在のチャプターの終わりで停止';

  @override
  String get endOfChapterOffSubtitle => '時間指定のスリープタイマーを使用';

  @override
  String get showExplicitBadge => '露骨な表現バッジを表示';

  @override
  String get showExplicitBadgeOnSubtitle => '露骨な表現を含む項目に「E」バッジを表示します';

  @override
  String get showExplicitBadgeOffSubtitle => 'オフ - 露骨な表現バッジを非表示';

  @override
  String get showEbookBadge => '電子書籍バッジを表示';

  @override
  String get showEbookBadgeOnSubtitle => '電子書籍のある本のカバーに本のアイコンを表示します';

  @override
  String get showEbookBadgeOffSubtitle => 'オフ - 電子書籍バッジを非表示';

  @override
  String get libraryFallback => 'ライブラリ';

  @override
  String get preReleaseUpdatesInfoTitle => 'プレリリース版の更新';

  @override
  String get preReleaseUpdatesInfoContent =>
      '有効にすると、アップデートの確認時に、GitHubのアルファ版やプレリリース版のビルドも通知されます。安定性は劣る場合がありますが、最新の機能や修正が含まれます。';

  @override
  String get includePreReleases => 'プレリリース版を含める';

  @override
  String get includePreReleasesOnSubtitle => 'オン - アルファ版とプレリリース版も確認';

  @override
  String get includePreReleasesOffSubtitle => 'オフ - 安定版のみ';

  @override
  String get setTooltip => '設定';

  @override
  String get saveAbsorbBackup => 'Absorbのバックアップを保存';

  @override
  String get checkForUpdate => 'アップデートを確認';

  @override
  String get onLatestVersion => '最新バージョンです';

  @override
  String get updateAvailable => 'アップデートがあります';

  @override
  String get preReleaseAvailable => 'プレリリース版があります';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'Absorbの新しい$kindが利用可能です: $latest\n\n現在のバージョン: $current';
  }

  @override
  String get updateKindPreRelease => 'プレリリース版';

  @override
  String get updateKindVersion => 'バージョン';

  @override
  String get downloadButton => 'ダウンロード';

  @override
  String get updateDownloading => 'アップデートをダウンロード中...';

  @override
  String get updateInstallPermissionDenied =>
      'インストールが許可されていません。システム設定で Absorb の「不明なアプリのインストール」を有効にしてください。';

  @override
  String get updateOpeningInBrowser => 'アプリ内アップデートに失敗しました。ブラウザーで開きます';

  @override
  String get sendToEreader => '電子書籍リーダーに送信';

  @override
  String sendingToEreader(String device) {
    return '$device に送信中...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return '$device に送信しました';
  }

  @override
  String get sendToEreaderFailed => '電子書籍を送信できませんでした';

  @override
  String get pickEreaderDevice => 'デバイスを選択';

  @override
  String get adminEmail => 'メール';

  @override
  String get adminEmailSubtitle => 'SMTP と電子書籍リーダーのデバイス';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => 'セットアップガイド';

  @override
  String get smtpHost => 'ホスト';

  @override
  String get smtpPort => 'ポート';

  @override
  String get smtpSecure => 'セキュア';

  @override
  String get smtpRejectUnauthorized => '未承認の TLS を拒否';

  @override
  String get smtpUser => 'ユーザー名';

  @override
  String get smtpPass => 'パスワード';

  @override
  String get smtpFromAddress => '送信元アドレス';

  @override
  String get smtpTestAddress => 'テスト用アドレス';

  @override
  String get smtpSendTest => 'テスト送信';

  @override
  String get smtpSaveSettings => '保存';

  @override
  String get smtpSaved => 'メール設定を保存しました';

  @override
  String get smtpSaveFailed => 'メール設定を保存できませんでした';

  @override
  String get smtpTestSent => 'テストメールを送信しました';

  @override
  String get smtpTestFailed => 'テストメールの送信に失敗しました';

  @override
  String get ereaderDevicesTitle => '電子書籍リーダーのデバイス';

  @override
  String get ereaderDevicesEmpty => 'デバイスはまだありません。下から追加してください。';

  @override
  String get addEreaderDevice => 'デバイスを追加';

  @override
  String get editEreaderDevice => 'デバイスを編集';

  @override
  String get deleteEreaderDevice => '削除';

  @override
  String get ereaderDeviceName => '名前';

  @override
  String get ereaderDeviceEmail => 'メール';

  @override
  String get ereaderAvailability => 'このデバイスを使えるユーザー';

  @override
  String get ereaderAvailAdminOrUp => '管理者のみ';

  @override
  String get ereaderAvailUserOrUp => 'すべてのユーザー';

  @override
  String get ereaderAvailGuestOrUp => '全員';

  @override
  String get ereaderAvailSpecificUsers => '特定のユーザー';

  @override
  String ereaderSpecificUsersN(int count) {
    return '特定のユーザー ($count)';
  }

  @override
  String get ereaderDevicesSaved => 'デバイスを保存しました';

  @override
  String get ereaderDevicesSaveFailed => 'デバイスを保存できませんでした';

  @override
  String libraryCountOne(int count) {
    return 'ライブラリ $count 件';
  }

  @override
  String libraryCountOther(int count) {
    return 'ライブラリ $count 件';
  }

  @override
  String serverVersionLabel(String version) {
    return 'サーバー $version';
  }

  @override
  String appVersionServerSuffix(String version) {
    return '  ·  サーバー $version';
  }

  @override
  String backupDateFormat(int month, int day, int year) {
    return '$year/$month/$day';
  }

  @override
  String get backupDetailsSeparator => ' · ';

  @override
  String get bookmarksSortedByPositionReversed => '位置順 (逆順)';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '「$title」の $position';
  }

  @override
  String get deleteBookmarkQuestion => 'ブックマークを削除しますか?';

  @override
  String get cardIconsOnlyChip => 'アイコンのみ';

  @override
  String get cardMoreInGridChip => 'グリッドに「その他」';

  @override
  String get cardLayoutHidden => '非表示';

  @override
  String get speed => '速度';

  @override
  String get details => '詳細';

  @override
  String get episodeDetailsLabel => 'エピソードの詳細';

  @override
  String get bookDetailsLabel => '本の詳細';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => 'イコライザー';

  @override
  String get cast => 'キャスト';

  @override
  String castingToDevice(String device) {
    return '$device にキャスト中';
  }

  @override
  String castToDeviceNamed(String device) {
    return '$device にキャスト';
  }

  @override
  String get historyShort => '履歴';

  @override
  String atPosition(String position) {
    return '$position の位置';
  }

  @override
  String chaptersChip(int count) {
    return '$count チャプター';
  }

  @override
  String chapterNumber(int number) {
    return 'チャプター $number';
  }

  @override
  String kbpsValue(int value) {
    return '$value kbps';
  }

  @override
  String get fileInfoTitle => 'ファイル情報';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ファイル',
      one: '1 ファイル',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => 'この本にはファイルの詳細がありません。';

  @override
  String get fileInfoAudio => 'オーディオ';

  @override
  String get fileInfoEbook => '電子書籍';

  @override
  String get fileInfoOther => 'その他のファイル';

  @override
  String get fileInfoBookOrbitNote => 'BookOrbit はコーデックとビットレートを報告しません。';

  @override
  String fileInfoChannels(int count) {
    return '$count チャンネル';
  }

  @override
  String get fileInfoCover => 'カバー';

  @override
  String get fileInfoMetadata => 'メタデータ';

  @override
  String get fileInfoSupplement => '付属';

  @override
  String get fileInfoPathCopied => 'パスをコピーしました';

  @override
  String get resetMayNotHaveSynced => 'リセットが同期されていない可能性があります。サーバーを確認してください';

  @override
  String failedToDownloadEbook(int code) {
    return '電子書籍のダウンロードに失敗しました ($code)';
  }

  @override
  String get serverReturnedErrorPage => 'サーバーが電子書籍ファイルではなくエラーページを返しました';

  @override
  String ebookSaved(String filename) {
    return '保存しました: $filename';
  }

  @override
  String errorSavingEbook(String error) {
    return '電子書籍の保存中にエラーが発生しました: $error';
  }

  @override
  String failedToSaveError(String error) {
    return '保存に失敗しました: $error';
  }

  @override
  String get adminBackupsLabel => 'バックアップ';

  @override
  String get adminListeningNow => '現在再生中';

  @override
  String get adminLibraries => 'ライブラリ';

  @override
  String get adminLibraryShows => '番組';

  @override
  String get adminLibraryBooks => '冊';

  @override
  String get adminLibraryFolders => 'フォルダー';

  @override
  String get adminLibrarySize => 'サイズ';

  @override
  String get adminLibraryDuration => '再生時間';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '見つからない/無効なアイテム $count 件',
      one: '見つからない/無効なアイテム 1 件',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => '確認';

  @override
  String get adminMissingTitle => '見つからないアイテム';

  @override
  String adminMissingSubtitle(String library) {
    return '$library のうち、ファイルが見つからない、または読み取れないエントリー';
  }

  @override
  String get adminMissingNone => '見つからない/無効なアイテムはありません';

  @override
  String get adminMissingBadge => '不明';

  @override
  String get adminInvalidBadge => '無効';

  @override
  String get adminMissingDeleteTitle => 'エントリーを削除';

  @override
  String adminMissingDeleteOneContent(String title) {
    return '「$title」を Audiobookshelf から削除しますか?';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return '$count 件のエントリーを Audiobookshelf から削除しますか?';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return '$count 件を削除';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return '$title を削除しました';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'エントリー $count 件を削除しました',
      one: 'エントリー 1 件を削除しました',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => 'エントリーを削除できませんでした';

  @override
  String get adminMatchAction => '照合';

  @override
  String adminMatchingStarted(String name) {
    return '$name の照合を開始しました';
  }

  @override
  String get adminMatchFailed => '失敗しました';

  @override
  String adminScanFailed(String name) {
    return '$name をスキャンできませんでした';
  }

  @override
  String get adminPurgeCacheFailed => '失敗しました';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => '管理者';

  @override
  String get adminUsersDisabledBadge => '無効';

  @override
  String get adminUsersEditUserTooltip => 'ユーザーを編集';

  @override
  String get adminUsersOnlineNow => 'オンライン';

  @override
  String adminUsersLastSeen(String time) {
    return '最終ログイン $time';
  }

  @override
  String get adminUsersNever => 'なし';

  @override
  String get adminUsersTotal => '合計';

  @override
  String get adminUsersNoReadingActivity => '閲覧履歴はありません';

  @override
  String get adminUsersLoadingDots => '読み込み中...';

  @override
  String get adminUsersLoadMoreSessions => 'セッションをさらに読み込む';

  @override
  String get adminUsersNoRecentSessions => '最近のセッションはありません';

  @override
  String get adminUsersLibraryProgress => 'ライブラリの進捗';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return 'さらに読み込む (残り $count 件)';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return '$count か月前';
  }

  @override
  String get adminUsersNewUser => '新規ユーザー';

  @override
  String get adminUsersEditUser => 'ユーザーを編集';

  @override
  String get adminUsersUsername => 'ユーザー名';

  @override
  String get adminUsersEnterUsername => 'ユーザー名を入力';

  @override
  String get adminUsersPassword => 'パスワード';

  @override
  String get adminUsersNewPassword => '新しいパスワード';

  @override
  String get adminUsersEnterPassword => 'パスワードを入力';

  @override
  String get adminUsersLeaveBlankToKeep => '変更しない場合は空欄のまま';

  @override
  String get adminUsersAccountType => 'アカウントの種類';

  @override
  String get adminUsersTypeGuest => 'ゲスト';

  @override
  String get adminUsersTypeUser => 'ユーザー';

  @override
  String get adminUsersTypeAdmin => '管理者';

  @override
  String get adminUsersStatus => 'ステータス';

  @override
  String get adminUsersAccountActive => 'アカウント有効';

  @override
  String get adminUsersAccountActiveSub => '無効なアカウントはログインできません';

  @override
  String get adminUsersLocked => 'ロック';

  @override
  String get adminUsersLockedSub => 'パスワードの変更を禁止します';

  @override
  String get adminUsersPermissions => '権限';

  @override
  String get adminUsersPermDownload => 'ダウンロード';

  @override
  String get adminUsersPermUpdate => '更新';

  @override
  String get adminUsersPermUpdateSub => 'メタデータとライブラリアイテムを編集';

  @override
  String get adminUsersPermDelete => '削除';

  @override
  String get adminUsersPermUpload => 'アップロード';

  @override
  String get adminUsersPermExplicit => '露骨なコンテンツ';

  @override
  String get adminUsersLibraryAccess => 'ライブラリへのアクセス';

  @override
  String get adminUsersAccessAllLibraries => 'すべてのライブラリにアクセス';

  @override
  String get adminUsersCreateUser => 'ユーザーを作成';

  @override
  String get adminUsersSaveChanges => '変更を保存';

  @override
  String get adminUsersUsernameRequired => 'ユーザー名は必須です';

  @override
  String get adminUsersPasswordRequired => 'パスワードは必須です';

  @override
  String get adminUsersUserCreated => 'ユーザーを作成しました';

  @override
  String get adminUsersUserUpdated => 'ユーザーを更新しました';

  @override
  String get adminUsersFailedCreate => 'ユーザーを作成できませんでした';

  @override
  String get adminUsersFailedUpdate => 'ユーザーを更新できませんでした';

  @override
  String get adminUsersThisUser => 'このユーザー';

  @override
  String get adminUsersDeleteUserTitle => 'ユーザーを削除しますか?';

  @override
  String adminUsersDeleteUserContent(String name) {
    return '$name を完全に削除しますか?';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return '$name を削除しました';
  }

  @override
  String get adminUsersFailedDelete => 'ユーザーを削除できませんでした';

  @override
  String get adminUsersUnlinkOpenId => 'OpenID の連携を解除';

  @override
  String get adminUsersUnlinkOpenIdTitle => 'OpenID の連携を解除しますか?';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return '$name の OpenID 連携を解除しますか? 再連携するには、もう一度 OpenID でサインインする必要があります。';
  }

  @override
  String get adminUsersOpenIdUnlinked => 'OpenID の連携を解除しました';

  @override
  String get adminUsersFailedUnlinkOpenId => 'OpenID の連携を解除できませんでした';

  @override
  String adminUsersByAuthor(String author) {
    return '$author 著';
  }

  @override
  String get adminUsersListened => '再生時間';

  @override
  String get adminUsersStartedAtPosition => '開始位置';

  @override
  String get adminUsersEndedAtPosition => '終了位置';

  @override
  String get adminUsersTotalDuration => '合計時間';

  @override
  String get adminUsersStarted => '開始';

  @override
  String get adminUsersUpdated => '更新';

  @override
  String get adminUsersClient => 'クライアント';

  @override
  String get adminUsersDevice => 'デバイス';

  @override
  String get adminUsersOs => 'OS';

  @override
  String get adminUsersPlayMethod => '再生方式';

  @override
  String get adminUsersPlayDirect => 'ダイレクト再生';

  @override
  String get adminUsersPlayDirectStream => 'ダイレクトストリーム';

  @override
  String get adminUsersPlayTranscode => 'トランスコード';

  @override
  String get adminUsersPlayLocal => 'ローカル';

  @override
  String get adminPodcastsCheckNewEpisodesTitle => '新しいエピソードを確認';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      'すべてのポッドキャストの RSS フィードを確認し、新しいエピソードが見つかればダウンロードします (自動ダウンロードが有効な場合)。';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle =>
      'RSS フィードをスキャンして新しいエピソードをダウンロード';

  @override
  String get adminPodcastsCheck => '確認';

  @override
  String get adminPodcastsCheckingForNew => '新しいエピソードを確認中…';

  @override
  String get adminPodcastsCheckingForNewDots => '新しいエピソードを確認中...';

  @override
  String get adminPodcastsFailedCheckEpisodes => 'エピソードを確認できませんでした';

  @override
  String get adminPodcastsCheckFeedsTooltip => 'フィードの新しいエピソードを確認';

  @override
  String get adminPodcastsNoPodcastsYet => 'ポッドキャストはまだありません';

  @override
  String get adminPodcastsTapPlusHint => '+ をタップして番組を検索・追加';

  @override
  String adminPodcastsEpisodesCount(int count) {
    return '$count エピソード';
  }

  @override
  String get adminPodcastsAddPodcast => 'ポッドキャストを追加';

  @override
  String get adminPodcastsCouldNotFindFeed => 'ポッドキャストのフィードが見つかりませんでした';

  @override
  String get adminPodcastsSearchHint => 'ポッドキャストを検索…';

  @override
  String get adminPodcastsSearchItunesHint => 'iTunes を検索...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return 'iTunes で「$query」を検索';
  }

  @override
  String get adminPodcastsNoPodcastsFound => 'ポッドキャストが見つかりません';

  @override
  String get adminPodcastsRelToday => '今日';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return '$count 週間前';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return '$count か月前';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return '$count 年前';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return '更新: $when';
  }

  @override
  String get adminPodcastsGenreAll => 'すべて';

  @override
  String get adminPodcastsGenreArts => 'アート';

  @override
  String get adminPodcastsGenreComedy => 'コメディ';

  @override
  String get adminPodcastsGenreEducation => '教育';

  @override
  String get adminPodcastsGenreTvFilm => 'テレビ・映画';

  @override
  String get adminPodcastsGenreMusic => '音楽';

  @override
  String get adminPodcastsGenreNews => 'ニュース';

  @override
  String get adminPodcastsGenreReligion => '宗教';

  @override
  String get adminPodcastsGenreScience => '科学';

  @override
  String get adminPodcastsGenreSports => 'スポーツ';

  @override
  String get adminPodcastsGenreTechnology => 'テクノロジー';

  @override
  String get adminPodcastsGenreBusiness => 'ビジネス';

  @override
  String get adminPodcastsGenreFiction => 'フィクション';

  @override
  String get adminPodcastsGenreSocietyCulture => '社会・文化';

  @override
  String get adminPodcastsGenreHealthFitness => '健康・フィットネス';

  @override
  String get adminPodcastsGenreTrueCrime => '実録犯罪';

  @override
  String get adminPodcastsGenreHistory => '歴史';

  @override
  String get adminPodcastsGenreKidsFamily => 'キッズ・ファミリー';

  @override
  String get adminPodcastsPodcastFallback => 'ポッドキャスト';

  @override
  String get adminPodcastsEpisodeFallback => 'エピソード';

  @override
  String get adminPodcastsNoFeedFound => 'フィード URL が見つかりません';

  @override
  String get adminPodcastsNoFeedAvailable => 'フィード URL がありません';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return '$title をライブラリに追加しました';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return '$title を追加できませんでした';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    return 'フィード内に $count エピソード';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    return '+ ほか $count エピソード';
  }

  @override
  String get adminPodcastsAdding => '追加中…';

  @override
  String get adminPodcastsAddToLibrary => 'ライブラリに追加';

  @override
  String get adminPodcastsRemoveShowTitle => '番組を削除しますか?';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return '「$title」とそのすべてのエピソードをサーバーから削除しますか? この操作は元に戻せません。';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return '「$title」を削除しました';
  }

  @override
  String get adminPodcastsFailedRemoveShow => '番組を削除できませんでした';

  @override
  String get adminPodcastsRemoveShowTooltip => '番組を削除';

  @override
  String get adminPodcastsSelectMultipleTooltip => '複数選択';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return '$count 件ダウンロード済み';
  }

  @override
  String get adminPodcastsTabDownloaded => 'ダウンロード済み';

  @override
  String get adminPodcastsTabFeed => 'フィード';

  @override
  String get adminPodcastsTabSettings => '設定';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return '「$title」をダウンロード中';
  }

  @override
  String get adminPodcastsFailedDownload => 'ダウンロードに失敗しました';

  @override
  String get adminPodcastsDeleteEpisodeTitle => 'エピソードを削除しますか?';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return '「$title」を削除しますか?';
  }

  @override
  String get adminPodcastsDeleted => '削除しました';

  @override
  String get adminPodcastsFailed => '失敗しました';

  @override
  String get adminPodcastsDeleteEpisodesTitle => 'エピソードを削除しますか?';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return '$count 件のエピソードをサーバーから削除しますか?';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return '$count 件のエピソードを削除しました';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload => 'フィードを閲覧してダウンロード';

  @override
  String get adminPodcastsDownloadingDots => 'ダウンロード中...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return '$count 件のエピソードを削除';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return '$count 件のエピソードをダウンロード中';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return '$count 件のエピソードをダウンロード';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter => 'この日以降のエピソードを探す';

  @override
  String get adminPodcastsSelectDate => '日付を選択';

  @override
  String get adminPodcastsMaxEpisodes => 'ダウンロードするエピソードの最大数';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return '$date 以降の新しいエピソードはありません';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return '新しいエピソードが $count 件見つかりました。ダウンロード中';
  }

  @override
  String get adminPodcastsFailedToCheckNew => '新しいエピソードを確認できませんでした';

  @override
  String get adminPodcastsCheckAndDownload => '確認してダウンロード';

  @override
  String get adminPodcastsMatchPodcast => 'ポッドキャストを照合';

  @override
  String get adminPodcastsMatchPodcastSubtitle => 'iTunes を検索してカバーとメタデータを更新';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes => '新しいエピソードを自動ダウンロード';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle =>
      'サーバーが新しいエピソードを自動でダウンロードします';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle => '新しいエピソードは自動ダウンロードされません';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate => '自動ダウンロード設定を更新できませんでした';

  @override
  String get adminPodcastsMaxEpisodesToKeep => '保持するエピソードの最大数';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      '0 ならすべてのエピソードを保持します。新しいエピソードが自動ダウンロードされた後、番組がこの上限を超えていると、Audiobookshelf が最も古いエピソードを削除します。';

  @override
  String get adminPodcastsNoEpisodeLimit => '上限なし';

  @override
  String get adminPodcastsEpisodeLimitInvalid => '0 または整数を入力してください';

  @override
  String get adminPodcastsCheckSchedule => '確認スケジュール';

  @override
  String get adminPodcastsFrequency => '頻度';

  @override
  String get adminPodcastsFreqHourly => '毎時';

  @override
  String get adminPodcastsFreqDaily => '毎日';

  @override
  String get adminPodcastsFreqWeekly => '毎週';

  @override
  String get adminPodcastsDay => '曜日';

  @override
  String get adminPodcastsTime => '時刻';

  @override
  String get adminPodcastsDaySun => '日';

  @override
  String get adminPodcastsDayMon => '月';

  @override
  String get adminPodcastsDayTue => '火';

  @override
  String get adminPodcastsDayWed => '水';

  @override
  String get adminPodcastsDayThu => '木';

  @override
  String get adminPodcastsDayFri => '金';

  @override
  String get adminPodcastsDaySat => '土';

  @override
  String get adminPodcastsFeedUrl => 'フィード URL';

  @override
  String get adminPodcastsBack => '戻る';

  @override
  String get adminPodcastsRootOnly => 'root のみ';

  @override
  String get adminPodcastsDeleting => '削除中...';

  @override
  String get adminPodcastsDeleteEpisode => 'エピソードを削除';

  @override
  String adminPodcastsSeasonChip(String season) {
    return 'シーズン $season';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return '第 $number 話';
  }

  @override
  String get adminPodcastsApplyingMatch => '照合を適用中...';

  @override
  String get adminPodcastsNoResults => '結果なし';

  @override
  String get adminPodcastsPodcastMatched => 'ポッドキャストを照合して更新しました';

  @override
  String get adminPodcastsFailedMatch => 'ポッドキャストを照合できませんでした';

  @override
  String get adminPodcastsSelectAll => 'すべて選択';

  @override
  String get adminPodcastsSelectAllNew => '新規のみ';

  @override
  String get adminPodcastsSortNewestFirst => '新しい順';

  @override
  String get adminPodcastsSortOldestFirst => '古い順';

  @override
  String get adminPodcastsEditInfo => '情報を編集';

  @override
  String get adminPodcastsEditInfoSubtitle => 'タイトル、説明、カバーなどを変更';

  @override
  String get adminPodcastsEditTitle => 'ポッドキャストを編集';

  @override
  String get adminPodcastsReleaseDate => '公開日';

  @override
  String get adminPodcastsExplicit => '露骨な内容';

  @override
  String get adminPodcastsExplicitSubtitle => 'このポッドキャストを露骨な内容としてマーク';

  @override
  String get episodeListEpisodeFallback => 'エピソード';

  @override
  String get episodeListUnknownPodcast => '不明なポッドキャスト';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'エピソード $count 件を完了にしました',
      one: 'エピソード 1 件を完了にしました',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'エピソード $count 件を未完了にしました',
      one: 'エピソード 1 件を未完了にしました',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes => '新しいエピソードの購読を解除';

  @override
  String get episodeListSubscribeToNewEpisodes => '新しいエピソードを購読';

  @override
  String get episodeListSubscribeTitle => 'このポッドキャストを購読しますか?';

  @override
  String get episodeListSubscribeContent =>
      '新しいエピソードがサーバーに公開されると、自動的にダウンロードされ、Absorbing キューに追加されます。';

  @override
  String get episodeListSubscribe => '購読';

  @override
  String get episodeListShowFinishedEpisodes => '完了したエピソードを表示';

  @override
  String get episodeListHideFinishedEpisodes => '完了したエピソードを非表示';

  @override
  String get episodeListShowSettings => '設定を表示';

  @override
  String get episodeListPlaysNewerToOlder => '新しいエピソードから古いエピソードの順に再生します';

  @override
  String get episodeListPlaysOlderToNewer => '古いエピソードから新しいエピソードの順に再生します';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count エピソード',
      one: '1 エピソード',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '未完了 $count 件',
      one: '未完了 1 件',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => '自動ダウンロード';

  @override
  String get episodeListSubscribedChip => '購読中';

  @override
  String get episodeListExplicitChip => '露骨な内容';

  @override
  String get episodeListSortNewest => '新しい順';

  @override
  String get episodeListSortOldest => '古い順';

  @override
  String get episodeListSortBy => 'エピソードを並べ替え';

  @override
  String get episodeListSortPubDate => '公開日';

  @override
  String get episodeListSortTitle => 'タイトル';

  @override
  String get episodeListSortSeason => 'シーズン';

  @override
  String get episodeListSortEpisode => 'エピソード番号';

  @override
  String get episodeListSortFileName => 'ファイル名';

  @override
  String get episodeListSortReverseHint => 'もう一度タップすると順序が逆になります';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return '「$title」を Absorbing に追加しました';
  }

  @override
  String get episodeDetailEpisodeFallback => 'エピソード';

  @override
  String get episodeDetailMarkedNotFinished => '未完了にしました';

  @override
  String get episodeDetailMarkedFinishedNice => '完了にしました。お疲れさまです!';

  @override
  String get episodeDetailMarkAbsorbedContent => 'このエピソードの進捗が 100% になります。';

  @override
  String get episodeDetailResetProgressContent =>
      'このエピソードの進捗をすべて消去し、最初に戻します。この操作は元に戻せません。';

  @override
  String get episodeDetailToday => '今日';

  @override
  String get episodeDetailYesterday => '昨日';

  @override
  String episodeDetailDaysAgo(int count) {
    return '$count 日前';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return '$count 週間前';
  }

  @override
  String episodeDetailDurationHm(int hours, int minutes) {
    return '$hours 時間 $minutes 分';
  }

  @override
  String episodeDetailDurationM(int minutes) {
    return '$minutes 分';
  }

  @override
  String get episodeDetailResume => '再開';

  @override
  String get episodeDetailPlayEpisode => 'エピソードを再生';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return 'エピソード $number';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return 'シーズン $number';
  }

  @override
  String get editMetadataUpdatedFromMatch => '照合結果からメタデータを更新しました';

  @override
  String editMetadataConfirmMatch(String title) {
    return '次の内容で、この本のサーバー上のメタデータを更新します。\n\n「$title」\n\nすべての項目とカバーがサーバー上で上書きされます。';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return '次の内容で、この本のサーバー上のメタデータを更新します。\n\n「$title」 ($author 著)\n\nすべての項目とカバーがサーバー上で上書きされます。';
  }

  @override
  String get seriesBooksFindMissingTitle => '不足している本を探す';

  @override
  String get seriesBooksFindMissingContent =>
      'Audible を検索して、このシリーズのうちライブラリにない本を探します。\n\nまず ASIN で照合し (サーバーが本の ASIN を持っている場合)、見つからなければタイトルで照合します。結果が完全に正確とは限りません。';

  @override
  String get seriesBooksCouldNotFindOnAudible => 'Audible でこのシリーズが見つかりませんでした';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'このシリーズの全 $count 冊の完了状態を解除します。',
      one: 'このシリーズの本 1 冊の完了状態を解除します。',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'このシリーズの全 $count 冊を完了にします。',
      one: 'このシリーズの本 1 冊を完了にします。',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => 'すべて解除';

  @override
  String get seriesBooksShowAllBooks => 'すべての本を表示';

  @override
  String get seriesBooksGroupBySubSeries => 'サブシリーズでグループ化';

  @override
  String get seriesBooksLoadingSubSeries => 'サブシリーズを読み込み中...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 冊',
      one: '1 冊',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => '完了';

  @override
  String get seriesBooksExplicitBadge => 'E';

  @override
  String get expandedCardStreaming => 'ストリーミング';

  @override
  String get expandedCardDeviceFallback => 'デバイス';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$bookTitle の $position';
  }

  @override
  String get bookmarksScreenClose => '閉じる';

  @override
  String get bookmarksScreenSortNewest => '新しい順';

  @override
  String get bookmarksScreenSortPosition => '位置';

  @override
  String statsScreenStreakDays(int count) {
    return '$count日';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count セッション';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count セッション';
  }

  @override
  String get statsScreenDayMon => '月';

  @override
  String get statsScreenDayTue => '火';

  @override
  String get statsScreenDayWed => '水';

  @override
  String get statsScreenDayThu => '木';

  @override
  String get statsScreenDayFri => '金';

  @override
  String get statsScreenDaySat => '土';

  @override
  String get statsScreenDaySun => '日';

  @override
  String statsScreenDurationHm(int h, int m) {
    return '$h時間$m分';
  }

  @override
  String statsScreenDurationM(int m) {
    return '$m分';
  }

  @override
  String get statsScreenDurationLessThanMin => '<1分';

  @override
  String get statsScreenDurationZero => '0分';

  @override
  String statsScreenDurationShortH(int h) {
    return '$h時間';
  }

  @override
  String statsScreenDurationShortM(int m) {
    return '$m分';
  }

  @override
  String get statsScreenCouldNotLoadItem => 'アイテムを読み込めませんでした';

  @override
  String get statsScreenCouldNotFindEpisode => 'エピソードが見つかりませんでした';

  @override
  String statsScreenByAuthor(String author) {
    return '$author 著';
  }

  @override
  String get statsScreenListened => '再生時間';

  @override
  String get sessionEditTitle => 'セッションを編集';

  @override
  String get sessionDayLabel => '日付';

  @override
  String get sessionEndPosition => '終了位置';

  @override
  String get sessionEndPositionHint => '変更すると、現在の進捗も更新される場合があります。';

  @override
  String get statsViewSessions => 'セッションを表示';

  @override
  String statsSessionsForDate(String date) {
    return '$date のセッション';
  }

  @override
  String get statsNoSessionsForDate => 'この日の再生セッションはありません';

  @override
  String get statsSearchSessions => 'セッションを検索';

  @override
  String get statsNoSessionSearchResults => '検索に一致するセッションはありません';

  @override
  String get statsSessionsLoadFailed => 'この日のセッションを読み込めませんでした';

  @override
  String get sessionDeleteConfirmTitle => 'セッションを削除しますか?';

  @override
  String get sessionDeleteConfirmBody =>
      'セッションを削除し、その時間の分だけ再生時間の合計が減ります。この操作は元に戻せません。';

  @override
  String get sessionSaved => 'セッションを更新しました';

  @override
  String get sessionDeleted => 'セッションを削除しました';

  @override
  String get sessionSaveFailed => '変更を保存できませんでした';

  @override
  String get sessionDeleteFailed => 'このセッションを削除できませんでした';

  @override
  String get statsScreenStartedAtPosition => '開始位置';

  @override
  String get statsScreenEndedAtPosition => '終了位置';

  @override
  String get statsScreenTotalDuration => '合計時間';

  @override
  String get statsScreenStarted => '開始';

  @override
  String get statsScreenUpdated => '更新';

  @override
  String get statsScreenClient => 'クライアント';

  @override
  String get statsScreenDevice => 'デバイス';

  @override
  String get statsScreenOs => 'OS';

  @override
  String get statsScreenPlayMethod => '再生方式';

  @override
  String get statsScreenLoading => '読み込み中...';

  @override
  String get statsScreenJumpToStart => '開始位置へ移動';

  @override
  String get statsScreenJumpToEnd => '終了位置へ移動';

  @override
  String get statsScreenPlayMethodDirect => 'ダイレクト再生';

  @override
  String get statsScreenPlayMethodDirectStream => 'ダイレクトストリーム';

  @override
  String get statsScreenPlayMethodTranscode => 'トランスコード';

  @override
  String get statsScreenPlayMethodLocal => 'ローカル';

  @override
  String get statsScreenAmLabel => '午前';

  @override
  String get statsScreenPmLabel => '午後';

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
  String get upcomingReleasesTitle => '発売予定';

  @override
  String get upcomingReleasesRescanTitle => '再スキャンしますか?';

  @override
  String upcomingReleasesRescanContent(int days) {
    return 'この結果は $days 日前のものです。発売日が変わっている可能性があります。再スキャンしますか?';
  }

  @override
  String get upcomingReleasesNotNow => '後で';

  @override
  String get upcomingReleasesRescan => '再スキャン';

  @override
  String get upcomingReleasesRescanReleaseDate => '発売日を再スキャン';

  @override
  String get upcomingReleasesRescanning => '再スキャン中...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return '更新しました: $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound => '発売日が見つかりません';

  @override
  String get upcomingReleasesRescanFailed => '再スキャンに失敗しました';

  @override
  String get upcomingReleasesRemoveFromList => 'リストから削除';

  @override
  String get upcomingReleasesRemovedFromList => 'リストから削除しました';

  @override
  String get upcomingReleasesDateChip => '日付';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return '$name を確認中... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => 'シリーズを読み込み中...';

  @override
  String get upcomingReleasesScannedToday => '(今日スキャン)';

  @override
  String get upcomingReleasesScannedYesterday => '(昨日スキャン)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '($days 日前にスキャン)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return '予定 $count 件';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return '最近 $count 件';
  }

  @override
  String get upcomingReleasesNoneFound => '発売予定や最近の発売はありません';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$count シリーズで $summary';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return 'Audible で $count シリーズを確認しました';
  }

  @override
  String upcomingReleasesDateFormat(String month, int day, int year) {
    return '$year年$month$day日';
  }

  @override
  String upcomingReleasesSequenceLabel(String sequence) {
    return '#$sequence';
  }

  @override
  String get upcomingReleasesBadgeUpcoming => '発売予定';

  @override
  String get upcomingReleasesBadgeAdded => '追加済み';

  @override
  String get upcomingReleasesBadgeMissing => '不足';

  @override
  String get upcomingReleasesScanSettingsTitle => 'スキャン設定';

  @override
  String get upcomingReleasesFinishedAfterTitle => 'シリーズを完結とみなす期間';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      '最新の本の発売がこれより前のシリーズは、スキャン時にスキップされ、1~2 か月に一度だけ再確認されます。';

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
  String get upcomingReleasesFinishedAfterNever => 'なし';

  @override
  String get upcomingReleasesSkippedTitle => 'スキップしたシリーズ';

  @override
  String get upcomingReleasesSkippedNone => 'スキップしたものはありません';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スキップ $count 件',
      one: 'スキップ 1 件',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '最新の本は $count 年前',
      one: '最新の本は 1 年前',
      zero: '最新の本は 1 年以内',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched => 'Audible でこのシリーズを照合できませんでした';

  @override
  String get upcomingReleasesSkippedScanNow => '今すぐスキャン';

  @override
  String get upcomingReleasesSkippedAlwaysScan => '常にスキャン';

  @override
  String get upcomingReleasesSkippedNeverScan => 'スキャンしない';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return '$name に新刊が見つかりました';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return '$name に新しいものはありません';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary =>
      'このリストは別のライブラリのものです。再スキャンして更新してください。';

  @override
  String get upcomingReleasesChipUpcoming => '発売予定';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '不足 $count 件',
      one: '不足 1 件',
      zero: '不足',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => '不足している本はありません';

  @override
  String get upcomingReleasesScanSeries => 'シリーズをスキャン';

  @override
  String get upcomingReleasesScanUpcomingOption => '発売予定';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc => '新刊と発売予定の本をすばやくスキャン';

  @override
  String get upcomingReleasesScanDeepOption => '詳細スキャン';

  @override
  String get upcomingReleasesScanDeepOptionDesc =>
      'すべてのシリーズの不足している本も探します。時間がかかります';

  @override
  String get upcomingReleasesFirstScanNote =>
      '最初のスキャンでは Audible ですべてのシリーズを確認するため、数分かかることがあります。シリーズが整理されると、以降のスキャンはずっと速くなります。';

  @override
  String get upcomingReleasesLastScanReport => '前回のスキャンレポート';

  @override
  String upcomingReleasesReportChecked(int count) {
    return 'Audible で確認: $count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return 'スキップ: $count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return 'Audible で照合できず: $count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return '確認に失敗: $count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return '発売予定 $upcoming 件、最近 $recent 件が見つかりました';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return '発売予定 $upcoming 件、最近 $recent 件、不足 $missing 件が見つかりました';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return 'ほか $count 件';
  }

  @override
  String get upcomingReleasesBadgeNew => '新着';

  @override
  String get upcomingReleasesOpenLibrarySeries => 'ライブラリでシリーズを開く';

  @override
  String get upcomingReleasesAsinCopied => 'シリーズの ASIN をコピーしました';

  @override
  String get upcomingReleasesSetSeriesAsin => 'シリーズの ASIN を設定';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      'audible.com でシリーズを探し、ページのリンクをコピーしてください。ASIN は B0 で始まる 10 文字のコードです (例: B08S2YN3YS)。リンク全体を貼り付けても構いません。';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… または audible.com のリンク';

  @override
  String get upcomingReleasesSetAsinSave => '保存';

  @override
  String get upcomingReleasesSetAsinInvalid => 'そのテキストに ASIN が見つかりません';

  @override
  String get upcomingReleasesSetAsinSaved => 'シリーズを関連付けました。スキャン中';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 冊を削除',
      one: '本を削除',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => '今回のスキャンから削除';

  @override
  String get upcomingReleasesRemoveThisScanDesc => '今後のスキャンで再び表示されることがあります';

  @override
  String get upcomingReleasesRemoveForever => '今回と今後のスキャンから削除';

  @override
  String get upcomingReleasesRemoveForeverDesc => '削除済みリストに移動します。いつでも復元できます';

  @override
  String get upcomingReleasesRemovedForeverToast => '削除しました。今後のスキャンには表示されません';

  @override
  String get upcomingReleasesRemovedBooksTitle => '削除した本';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 冊',
      one: '1 冊',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => '削除した本はありません';

  @override
  String get upcomingReleasesRestore => '復元';

  @override
  String get upcomingReleasesRestoredToast => '復元しました';

  @override
  String get upcomingReleasesRestoredNextScan => '復元しました。次回のスキャン後に表示されます';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件選択中',
      one: '1 件選択中',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => 'リクエスト';

  @override
  String get upcomingReleasesBulkRemove => '削除';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件削除',
      one: '1 件削除',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件のリクエストを送信しました',
      one: '1 件のリクエストを送信しました',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return '$count 件スキップ';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count シリーズを再スキャンしました',
      one: '1 シリーズを再スキャンしました',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return '新刊あり: $count 件';
  }

  @override
  String get seriesExcludeFromScan => 'シリーズのスキャンから除外';

  @override
  String get seriesIncludeInScan => 'シリーズのスキャンに含める';

  @override
  String get homeScreenEpisodeFallback => 'エピソード';

  @override
  String get libraryScreenUnknownTitle => '不明なタイトル';

  @override
  String get playlistDetailDefaultName => 'プレイリスト';

  @override
  String playlistDetailItemCount(int count) {
    return '$count アイテム';
  }

  @override
  String get playlistDetailUnfinished => '未完了';

  @override
  String get playlistDetailRemoveFromPlaylist => 'プレイリストから削除';

  @override
  String get playlistDetailDone => '完了';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return '$count アイテムを完了にしました';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return '$count アイテムを未完了にしました';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return '$count アイテムを削除しました';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return '「$title」を Absorbing に追加しました';
  }

  @override
  String get collectionDetailDefaultName => 'コレクション';

  @override
  String smartScopeBookCount(int count) {
    return 'スマートスコープ · $count 冊';
  }

  @override
  String get smartScopeNew => '新規スマートスコープ';

  @override
  String get smartScopeNewSubtitle => 'フィルターの組み合わせを、自動で最新に保たれるリストとして保存します';

  @override
  String get smartScopeEditTitle => 'スマートスコープを編集';

  @override
  String get smartScopeIcon => 'アイコン';

  @override
  String get smartScopePublic => 'すべてのユーザーに表示';

  @override
  String get smartScopeKobo => 'Kobo に同期';

  @override
  String get smartScopeRules => 'ルール';

  @override
  String get smartScopeMatchAll => 'すべてに一致';

  @override
  String get smartScopeMatchAny => 'いずれかに一致';

  @override
  String get smartScopeAddRule => 'ルールを追加';

  @override
  String get smartScopeAddGroup => 'グループを追加';

  @override
  String get smartScopeGroup => 'グループ';

  @override
  String get smartScopeStartFrom => 'テンプレートから開始';

  @override
  String get smartScopeFromScratch => '最初から作成';

  @override
  String get smartScopeTplHasSeries => 'シリーズあり';

  @override
  String get smartScopeTplRecent => '最近追加';

  @override
  String get smartScopeTplPdf => 'PDF のみ';

  @override
  String get smartScopeTplNoGenres => 'ジャンルなし';

  @override
  String get smartScopeTplEpub => 'EPUB のみ';

  @override
  String get smartScopeCounting => '集計中...';

  @override
  String get smartScopeSort => '既定の並べ替え';

  @override
  String get smartScopeAddSort => '並べ替え条件を追加';

  @override
  String get smartScopeSortNone => '並べ替えが未設定のため、タイトル順になります。';

  @override
  String get smartScopeAscending => '昇順';

  @override
  String get smartScopeDescending => '降順';

  @override
  String get smartScopeDelete => 'スマートスコープを削除';

  @override
  String get smartScopeSaveFailed => 'スマートスコープを保存できませんでした';

  @override
  String get smartScopeDeleteFailed => 'スマートスコープを削除できませんでした';

  @override
  String get smartScopeLoadFailed => 'スマートスコープを読み込めませんでした';

  @override
  String get smartScopeUnsupportedRule =>
      'このルールは BookOrbit の Web でのみ変更できます。そのまま保持されます。';

  @override
  String get smartScopeAnd => 'かつ';

  @override
  String get smartScopeDays => '日';

  @override
  String get smartScopeWeeks => '週間';

  @override
  String get smartScopeMonths => 'か月';

  @override
  String get smartScopePickDate => '日付を選択';

  @override
  String get smartScopeAddValue => '値を追加';

  @override
  String get smartScopeValue => '値';

  @override
  String get smartScopeCustomFields => 'カスタムフィールド';

  @override
  String get smartScopeAnyProvider => 'すべてのプロバイダー';

  @override
  String get smartScopeScoreOutstanding => '非常に良い';

  @override
  String get smartScopeScoreGood => '良い';

  @override
  String get smartScopeScoreFair => '普通';

  @override
  String get smartScopeScorePoor => '低い';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => '最大 20 個';

  @override
  String get scopeFieldTitle => 'タイトル';

  @override
  String get scopeFieldAuthor => '著者';

  @override
  String get scopeFieldSeries => 'シリーズ';

  @override
  String get scopeFieldSeriesIndex => 'シリーズ番号';

  @override
  String get scopeFieldGenre => 'ジャンル';

  @override
  String get scopeFieldTag => 'タグ';

  @override
  String get scopeFieldReadStatus => '読書状況';

  @override
  String get scopeFieldReadProgress => '読書の進捗';

  @override
  String get scopeFieldRating => 'あなたの評価';

  @override
  String get scopeFieldFormat => '形式';

  @override
  String get scopeFieldLibrary => 'ライブラリ';

  @override
  String get scopeFieldCollection => 'コレクション';

  @override
  String get scopeFieldPublisher => '出版社';

  @override
  String get scopeFieldLanguage => '言語';

  @override
  String get scopeFieldPublishedDate => '出版日';

  @override
  String get scopeFieldPublishedYear => '出版年';

  @override
  String get scopeFieldAddedAt => '追加日';

  @override
  String get scopeFieldStartedAt => '開始日';

  @override
  String get scopeFieldFinishedAt => '完了日';

  @override
  String get scopeFieldPageCount => 'ページ数';

  @override
  String get scopeFieldFileSize => 'ファイルサイズ';

  @override
  String get scopeFieldCommunityRating => 'コミュニティの評価';

  @override
  String get scopeFieldCommunityRatingCount => 'コミュニティのレビュー数';

  @override
  String get scopeFieldMetadataScore => 'メタデータスコア';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => '説明';

  @override
  String get scopeFieldCover => 'カバー';

  @override
  String get scopeFieldAudioCover => 'オーディオブックのカバー';

  @override
  String get scopeFieldFileAvailability => 'ファイルの有無';

  @override
  String get scopeFieldLockStatus => 'ロック状態';

  @override
  String get scopeFieldSeriesStatus => 'シリーズの状態';

  @override
  String get scopeSortUpdatedAt => '更新日';

  @override
  String get scopeSortLastReadAt => '最後に読んだ日';

  @override
  String get scopeSortRandom => 'ランダム';

  @override
  String get scopeOpContains => 'を含む';

  @override
  String get scopeOpNotContains => 'を含まない';

  @override
  String get scopeOpStartsWith => 'で始まる';

  @override
  String get scopeOpEndsWith => 'で終わる';

  @override
  String get scopeOpEq => 'である';

  @override
  String get scopeOpNotEq => 'ではない';

  @override
  String get scopeOpIsEmpty => 'が空';

  @override
  String get scopeOpIsNotEmpty => 'が空でない';

  @override
  String get scopeOpGt => 'より大きい';

  @override
  String get scopeOpGte => '以上';

  @override
  String get scopeOpLt => 'より小さい';

  @override
  String get scopeOpLte => '以下';

  @override
  String get scopeOpBetween => 'の範囲内';

  @override
  String get scopeOpIncludesAny => 'のいずれかを含む';

  @override
  String get scopeOpIncludesAll => 'のすべてを含む';

  @override
  String get scopeOpExcludesAll => 'のすべてを除く';

  @override
  String get scopeOpBefore => 'より前';

  @override
  String get scopeOpAfter => 'より後';

  @override
  String get scopeOpWithinLast => '直近';

  @override
  String get scopeOpIsMissing => 'がない';

  @override
  String get scopeOpIsPresent => 'がある';

  @override
  String get scopeOpIsUnread => 'が未読';

  @override
  String get scopeOpIsInProgress => 'が進行中';

  @override
  String get scopeOpIsFinished => 'が完了';

  @override
  String get scopeOpIsLocked => 'がロック済み';

  @override
  String get scopeOpIsUnlocked => 'がロック解除済み';

  @override
  String get scopeOpIsUpNext => 'が次の予定';

  @override
  String get scopeOpIsTrue => 'がはい';

  @override
  String get scopeOpIsFalse => 'がいいえ';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 冊が一致',
      one: '1 冊が一致',
      zero: '一致する本はありません',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return '「$name」を削除しますか? この操作は元に戻せません。';
  }

  @override
  String collectionDetailBookCount(int count) {
    return '$count 冊';
  }

  @override
  String get collectionDetailDone => '完了';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return '「$title」を Absorbing に追加しました';
  }

  @override
  String get audibleSeriesNoBooksFound => 'Audible に本が見つかりません';

  @override
  String get audibleSeriesFailedToLoad => 'Audible からシリーズを読み込めませんでした';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return 'Audible に $total 冊 · 不足 $missing 冊';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return 'Audible に $total 冊 · 不足 $missing 冊 · 発売予定 $upcoming 冊';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return '不足 ($count)';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return '発売予定 ($count)';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return 'すべて ($count)';
  }

  @override
  String get audibleSeriesSearching => 'Audible を検索中...';

  @override
  String get audibleSeriesCompleteSeries => 'シリーズをコンプリートしています!';

  @override
  String get audibleSeriesNoUpcoming => '発売予定はありません';

  @override
  String get audibleSeriesUpcomingBadge => '発売予定';

  @override
  String get audibleSeriesAbridged => '抄録版';

  @override
  String get audibleSeriesRegionTitle => 'Audible のリージョン';

  @override
  String get audibleSeriesOpenOnAudible => 'Audible で開く';

  @override
  String get audibleSeriesAddToCalendar => 'カレンダーに追加';

  @override
  String get audibleSeriesAddToUpcoming => '発売予定に追加';

  @override
  String get audibleSeriesAddedToUpcoming => '発売予定に追加しました';

  @override
  String get audibleSeriesAlreadyInUpcoming => 'すでに発売予定ページにあります';

  @override
  String get audibleSeriesCouldNotOpenAudible => 'Audible を開けませんでした';

  @override
  String get audibleSeriesCouldNotOpenCalendar => 'カレンダーを開けませんでした';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return '$seriesName シリーズのオーディオブック新刊';
  }

  @override
  String get authorBooksGroupBySeries => 'シリーズでグループ化';

  @override
  String get authorBooksList => 'リスト';

  @override
  String get authorBooksGrid => 'グリッド';

  @override
  String authorBooksBookCount(int count) {
    return '$count 冊';
  }

  @override
  String get metadataLookupCover => 'カバー';

  @override
  String get metadataLookupChooseFields => '適用する項目を選択';

  @override
  String metadataLookupApplyFields(int count) {
    return '$count 項目を適用';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return '$count 項目をローカルに保存しました';
  }

  @override
  String get metadataLookupOverrideLocalDisplay => 'ローカル表示を上書き';

  @override
  String get equalizerPresetFlat => 'フラット';

  @override
  String get equalizerPresetVoiceBoost => 'ボイスブースト';

  @override
  String get equalizerPresetBassBoost => '低音ブースト';

  @override
  String get equalizerPresetTrebleBoost => '高音ブースト';

  @override
  String get equalizerPresetPodcast => 'ポッドキャスト';

  @override
  String get equalizerPresetAudiobook => 'オーディオブック';

  @override
  String get equalizerPresetReduceNoise => 'ノイズ低減';

  @override
  String get equalizerPresetLoudness => 'ラウドネス';

  @override
  String equalizerEditingSavedNamed(String title) {
    return '「$title」の保存済み EQ を編集中';
  }

  @override
  String get equalizerEditingSavedGeneric => '保存済み EQ を編集中';

  @override
  String get equalizerPerBookEq => '本ごとの EQ';

  @override
  String get notesDeleteNoteQuestion => 'メモを削除しますか?';

  @override
  String notesDeleteNoteContent(String title) {
    return '「$title」を削除しますか?';
  }

  @override
  String get notesExport => 'エクスポート';

  @override
  String get notesNewNote => '新規メモ';

  @override
  String get librarySortFilterUpcomingReleases => 'シリーズをスキャン';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle =>
      'メタデータプロバイダーから全著者の写真と略歴を取得します';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle =>
      'Audible でシリーズの発売予定と不足している本を確認します';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '残り $count チャプター',
      one: '残り 1 チャプター',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetAddMinutesChip(int minutes) {
    return '+$minutes分';
  }

  @override
  String sleepTimerSheetAddChaptersChip(int count) {
    return '+$count ch';
  }

  @override
  String sleepTimerSheetMinShort(int minutes) {
    return '$minutes分';
  }

  @override
  String sleepTimerSheetSecondsShort(int seconds) {
    return '$seconds秒';
  }

  @override
  String sleepTimerSheetMinSecShort(int minutes, int seconds) {
    return '$minutes分$seconds秒';
  }

  @override
  String sleepTimerSheetChaptersValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count チャプター',
      one: '1 チャプター',
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
      other: '$count チャプター後にスリープ',
      one: '1 チャプター後にスリープ',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => 'スリープ時に巻き戻す';

  @override
  String get sleepTimerSheetShake => 'シェイク';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return '$minutes 分追加';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => '1 チャプター追加';

  @override
  String get sleepTimerSheetResetsToFull => '全体の長さにリセット';

  @override
  String get sleepTimerSheetTabSpecificChapter => 'チャプター';

  @override
  String get sleepTimerSheetSpecificNoChapters => '利用できるチャプターがありません';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return 'チャプター $number';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => '経過済み';

  @override
  String get sleepTimerSheetSpecificStart => 'チャプターの開始';

  @override
  String get sleepTimerSheetSpecificEnd => 'チャプターの終了';

  @override
  String get sleepTimerSheetSpecificEndsAt => 'スリープタイマーの終了時点';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return '$countdown 後';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed => 'この時点はすでに過ぎています';

  @override
  String get sleepTimerSheetSpecificStartButton => 'タイマーを開始';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => '経過済み';

  @override
  String get timeAm => '午前';

  @override
  String get timePm => '午後';

  @override
  String get collectionPickerCollectionFallback => 'コレクション';

  @override
  String collectionPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get playlistPickerPlaylistFallback => 'プレイリスト';

  @override
  String playlistPickerNameWithCount(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get cardChaptersPlayFromChapterTitle => 'このチャプターから再生しますか?';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return '「$title」から再生を開始しますか?';
  }

  @override
  String get cardChaptersPlay => '再生';

  @override
  String get absorbingSharedToday => '今日';

  @override
  String get absorbingSharedYesterday => '昨日';

  @override
  String get absorbingSharedMonday => '月曜日';

  @override
  String get absorbingSharedTuesday => '火曜日';

  @override
  String get absorbingSharedWednesday => '水曜日';

  @override
  String get absorbingSharedThursday => '木曜日';

  @override
  String get absorbingSharedFriday => '金曜日';

  @override
  String get absorbingSharedSaturday => '土曜日';

  @override
  String get absorbingSharedSunday => '日曜日';

  @override
  String get absorbingSharedAm => '午前';

  @override
  String get absorbingSharedPm => '午後';

  @override
  String sectionDetailAddedToAbsorbing(String title) {
    return '「$title」を Absorbing に追加しました';
  }

  @override
  String get sectionDetailDoneBadge => '完了';

  @override
  String get homeCustomizeAddGenreTitle => 'ジャンルのセクションを追加';

  @override
  String get homeCustomizeAddGenreSubtitle => 'ホーム画面に表示するジャンルを選択';

  @override
  String get homeSectionDoneBadge => '完了';

  @override
  String get tipsSheetQuickBookmarksTitle => 'クイックブックマーク';

  @override
  String get tipsSheetQuickBookmarksDesc =>
      'どのカードでも、ブックマークボタンを長押しすると、ブックマークのシートを開かずに現在位置へすぐにブックマークを追加できます。';

  @override
  String get tipsSheetCoverPlayPauseTitle => 'カバーで再生/一時停止';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      'どのカードでも、カバーアートをタップすると再生または一時停止します。設定の「Absorbing カード」で切り替えられます。再生中はうっすらと一時停止アイコンが表示され、タップできることがわかります。';

  @override
  String get tipsSheetFullScreenPlayerTitle => 'フルスクリーンプレーヤー';

  @override
  String get tipsSheetFullScreenPlayerDesc =>
      'Absorbing のカードを上にスワイプすると、フルスクリーンプレーヤーが開きます。下にスワイプすると閉じます。';

  @override
  String get tipsSheetQuickAddAbsorbingTitle => 'Absorbing にすばやく追加';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      'リストのシート(シリーズ、著者、検索結果)で本を右にスワイプすると、Absorbing のキューにすぐ追加できます。';

  @override
  String get tipsSheetShakeExtendSleepTitle => 'シェイクでスリープを延長';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      'スリープタイマーの実行中にスマートフォンを振ると、数分が追加されます。追加する時間は、設定の「スリープタイマー」で変更できます。';

  @override
  String get tipsSheetSeriesNavigationTitle => 'シリーズのナビゲーション';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      '本の詳細ポップアップでシリーズ名をタップすると、シリーズ内のすべての本が巻数順に表示され、各カバーに巻数バッジが付きます。';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => 'スワイプで本を切り替え';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      'Absorbing 画面を左右にスワイプすると、再生途中の本を切り替えられます。手動キューモードがオンの場合、カードがキューとしても働き、現在の本が終わると次の本が自動で再生されます。';

  @override
  String get tipsSheetTapToSeekTitle => 'タップしてシーク';

  @override
  String get tipsSheetTapToSeekDesc =>
      'チャプターまたは本の進捗バーの好きな場所をタップすると、その位置へ直接移動します。バーをドラッグして細かく調整することもできます。';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle => '再生速度に合わせた時間表示';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      '位置、残り時間、チャプター、ブックマークなど、表示されるすべての時間が再生速度に合わせて調整されます。1.5xで聴いているなら、表示される時間は実際にかかる時間を示します。';

  @override
  String get tipsSheetPlaybackHistoryTitle => '再生履歴';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      'どのカードでも「履歴」ボタンをタップすると、再生、一時停止、シーク、速度変更のすべてがタイムラインで表示されます。イベントをタップすると、その位置に戻れます。';

  @override
  String get tipsSheetAutoRewindTitle => '自動巻き戻し';

  @override
  String get tipsSheetAutoRewindDesc =>
      '一時停止から再開すると、Absorbが数秒ほど自動で巻き戻すので、聴いていた場所を見失いません。巻き戻す量は、離れていた時間に応じて変わります。設定で調整できます。';

  @override
  String get tipsSheetSeriesQueueModeTitle => 'シリーズキューモード';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      'シリーズの本を聴き終えると、Absorbが次の本を自動で再生できます。設定でキューモードを「シリーズ」にしてください。';

  @override
  String get tipsSheetOfflineModeTitle => 'オフラインモード';

  @override
  String get tipsSheetOfflineModeDesc =>
      'Absorbing 画面の飛行機ボタンをタップすると、オフラインモードになります。同期を止めてデータを節約し、ダウンロード済みの本だけを表示します。フライト中や電波の弱い場所に便利です。';

  @override
  String get tipsSheetUpcomingReleasesTitle => '近日発売';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      '「シリーズ」タブをもう一度タップすると並べ替えとフィルターのシートが開きます。「近日発売」を選ぶと、シリーズ全体の新刊や発売予定の本が発売日順に表示されます。';

  @override
  String get tipsSheetPerBookEqTitle => '本ごとのイコライザー';

  @override
  String get tipsSheetPerBookEqDesc =>
      '本ごとにイコライザーの設定が記憶されます。SF大作のEQを一度調整しておけば、次に再生するときも同じ音で聴けます。';

  @override
  String get tipsSheetPerBookSpeedTitle => '本ごとの再生速度';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      '再生速度は本ごとに保存されます。ノンフィクションは1.5x、ドラマチックな小説は1.0xと、毎回設定し直す必要はありません。';

  @override
  String get tipsSheetAutoSleepWindowTitle => '自動スリープの時間帯';

  @override
  String get tipsSheetAutoSleepWindowDesc =>
      'いつも眠りにつく時間帯を設定しておくと、その時間帯に再生を始めたときにスリープタイマーが自動で開始します。';

  @override
  String get tipsSheetSleepFadeChimeTitle => 'スリープのフェードとチャイム';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      'スリープタイマーが終わると、音声が徐々にフェードアウトし、オプションでチャイムが鳴るので、話の途中で突然切れることがありません。';

  @override
  String get tipsSheetCarModeTitle => 'カーモード';

  @override
  String get tipsSheetCarModeDesc =>
      '車のアイコンをタップすると、運転中でも安全に使える大きなボタンのモードに切り替わります。';

  @override
  String get tipsSheetAudibleSeriesTitle => 'Audibleでシリーズを探す';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      'シリーズを開いて、その他のメニュー(3つの点)から、Audibleにあるシリーズの全リストを取得できます。足りない巻や、まだ聴き始めていない本も確認できます。';

  @override
  String get tipsSheetTranscribeBookmarkTitle => 'ブックマークの文字起こし';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      'ブックマーク位置の音声を、完全にデバイス上でテキストに変換します。設定の「詳細設定」>「文字起こし」で有効にしてモデルをダウンロードし、ブックマークの「文字起こし」をタップしてください。テキストはメモに入り、修正や共有ができます。';

  @override
  String get tipsSheetFindBetweenFormatsTitle => 'オーディオブックと電子書籍を行き来';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      '文字起こしがオンで、本がダウンロード済みなら、一時停止してプレーヤーの「電子書籍で位置を探す」をタップすると、いま聴いた箇所で電子書籍が開きます。リーダーでテキストを選択してヘッドホンをタップすると、その場所からオーディオブックが始まります。';

  @override
  String get tipsSheetShareQuoteTitle => '引用を共有';

  @override
  String get tipsSheetShareQuoteDesc =>
      '電子書籍のハイライトやブックマークのメモを、本のカバーに引用を重ねた画像として共有できます。ハイライトとブックマークのシートに共有オプションがあります。';

  @override
  String get tipsSheetClipExportTitle => '音声クリップを書き出す';

  @override
  String get tipsSheetClipExportDesc =>
      'ブックマークを開いて「クリップを書き出す」をタップすると、本の短い音声クリップをトリミングして、カバーアート付きで保存できます。お気に入りの場面を共有するのに最適です。';

  @override
  String get tipsSheetAllHighlightsTitle => 'すべてのハイライトを一か所に';

  @override
  String get tipsSheetAllHighlightsDesc =>
      '「すべてのブックマーク」ページの「ハイライト」タブには、すべての本の電子書籍ハイライトが集まっています。タップして共有したり、その本に戻ったりできます。';

  @override
  String get tipsSheetVolumeKeyPagesTitle => '音量キーでページをめくる';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      '音量キーで電子書籍のページをめくれます。リーダーの設定で有効にしてください。通常の向きと反転した向きを選べ、音声の再生中でもオンのままにできます。';

  @override
  String get tipsSheetSettingsSyncTitle => '設定の同期';

  @override
  String get tipsSheetSettingsSyncDesc =>
      'ご自身のWebDAVサーバーを使って、設定、本ごとの再生速度、Absorbing の順序をデバイス間で同期します。設定の「バックアップと同期」で設定してください。';

  @override
  String get tipsSheetNavLongPressTitle => '下部タブの長押し';

  @override
  String get tipsSheetNavLongPressDesc =>
      'ホームタブを長押しすると、どのページからでもライブラリを切り替えられます。ライブラリタブを長押しすると、そのまま検索に移動します。';

  @override
  String get bookCardUnknownTitle => '不明なタイトル';

  @override
  String get bookCardExplicitBadge => 'E';

  @override
  String get bookCardDone => '完了';

  @override
  String get bookCardSaved => 'ダウンロード済み';

  @override
  String get episodeRowEpisode => 'エピソード';

  @override
  String get episodeRowToday => '今日';

  @override
  String get episodeRowYesterday => '昨日';

  @override
  String episodeRowDaysAgo(int count) {
    return '$count日前';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return '$count週間前';
  }

  @override
  String episodeRowDurationHm(int hours, int minutes) {
    return '$hours時間$minutes分';
  }

  @override
  String episodeRowDurationM(int minutes) {
    return '$minutes分';
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
  String get librarySearchResultsDone => '完了';

  @override
  String get librarySearchResultsSaved => 'ダウンロード済み';

  @override
  String librarySearchResultsSequence(String number) {
    return '#$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => '不明なシリーズ';

  @override
  String get librarySearchResultsUnknownEpisode => '不明なエピソード';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count冊',
      one: '1冊',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => 'E';

  @override
  String get libraryGridTilesDone => '完了';

  @override
  String get libraryGridTilesSaved => 'ダウンロード済み';

  @override
  String libraryGridTilesSequence(String number) {
    return '#$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => '不明なシリーズ';

  @override
  String get seriesCardUnknownSeries => '不明なシリーズ';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count冊',
      one: '1冊',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => '微調整スクラブ';

  @override
  String get cardProgressQuarterSpeed => '1/4速';

  @override
  String get cardProgressHalfSpeed => '1/2速';

  @override
  String cardProgressChapterPrefix(String number) {
    return 'チャプター $number';
  }

  @override
  String get cardEdgeProgressFineScrubbing => '微調整スクラブ';

  @override
  String get cardEdgeProgressQuarterSpeed => '1/4速';

  @override
  String get cardEdgeProgressHalfSpeed => '1/2速';

  @override
  String get authSessionExpired => 'セッションの有効期限が切れました。もう一度サインインしてください。';

  @override
  String authCannotReachServer(String url) {
    return '$url のサーバーに接続できません';
  }

  @override
  String get authInvalidUsernameOrPassword => 'ユーザー名またはパスワードが正しくありません';

  @override
  String get authInvalidApiKey => 'APIキーが正しくありません';

  @override
  String get authLoginFailedDetail => 'サインインに失敗しました - サーバーアドレスと認証情報を確認してください';

  @override
  String get authUnexpectedServerResponse => 'サーバーから予期しない応答が返されました';

  @override
  String get authSsoUnexpectedResponse => 'SSOから予期しない応答が返されました';

  @override
  String get authSwitchedToLocalServer => 'ローカルサーバーに切り替えました';

  @override
  String get authSwitchedToRemoteServer => 'リモートサーバーに切り替えました';

  @override
  String get lpDeletedFinishedDownload => '完了したダウンロードを削除しました';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '新しいエピソード$count件をダウンロード中',
      one: '新しいエピソード1件をダウンロード中',
    );
    return '$showTitle: $_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return '$showTitleをキューの先頭に追加しました';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return '$showTitleをキューの2番目に追加しました';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return '$showTitleをキューの末尾に追加しました';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return '$showTitleの新しいエピソードをダウンロードしました';
  }

  @override
  String get statsWeekStartsOn => '週の開始日';

  @override
  String get episodeListNewEpisodePosition => '新しいエピソードの位置';

  @override
  String get episodeListPositionTop => 'キューの先頭';

  @override
  String get episodeListPositionSecond => 'キューの2番目';

  @override
  String get episodeListPositionEnd => 'キューの末尾';

  @override
  String get episodeListPositionNone => 'キューに追加しない';

  @override
  String get episodeListPositionNoneDesc => '通知とダウンロードは行われます';

  @override
  String sleepRewindUndoNote(int minutes) {
    return '$minutes分以内に再生を押すと、巻き戻しが取り消されます';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'キュー: $count件をダウンロード中',
      one: 'キュー: 1件をダウンロード中',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '本$count冊をダウンロード中',
      one: '本1冊をダウンロード中',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'エピソード$count件をダウンロード中',
      one: 'エピソード1件をダウンロード中',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName => 'ダウンロードの進捗';

  @override
  String get downloadNotifProgressChannelDesc => 'オーディオブックのダウンロード中に進捗を表示します';

  @override
  String get downloadNotifAlertChannelName => 'ダウンロードのアラート';

  @override
  String get downloadNotifAlertChannelDesc => 'ダウンロードの完了または失敗を通知します';

  @override
  String get downloadNotifDownloadingTitle => 'ダウンロード中…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のダウンロードを実行中',
      one: '1件のダウンロードを実行中',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return 'ダウンロード中: $title';
  }

  @override
  String get downloadNotifStartingLabel => '開始中…';

  @override
  String get downloadNotifCompleteTitle => 'ダウンロード完了';

  @override
  String downloadNotifCompleteBody(String title) {
    return '$titleをオフラインで聴けるようになりました';
  }

  @override
  String get downloadNotifFailedTitle => 'ダウンロード失敗';

  @override
  String get upcomingNotifChannelName => '近日発売のスキャン';

  @override
  String get upcomingNotifChannelDesc => '近日発売の作品をスキャン中に進捗を表示します';

  @override
  String get upcomingNotifScanTitle => '近日発売の作品をスキャン中';

  @override
  String get upcomingNotifStartingScan => 'スキャンを開始中…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return '$seriesNameを確認中… ($current/$total)';
  }

  @override
  String get upcomingNotifFoundTitle => '近日発売の作品が見つかりました!';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$seriesシリーズ',
      one: '1シリーズ',
    );
    return '$_temp0で$books件が近日発売';
  }

  @override
  String get androidAutoTabContinue => '続き';

  @override
  String get androidAutoTabLibrary => 'ライブラリ';

  @override
  String get androidAutoTabDownloads => 'ダウンロード';

  @override
  String get settingsSearchHint => '設定を検索...';

  @override
  String get settingsSearchNoResults => '一致する設定がありません';

  @override
  String get carConnectAutoplay => 'Android Autoに接続したら再生を開始';

  @override
  String get carConnectAutoplayIos => 'CarPlayに接続したら再生を開始';

  @override
  String get carConnectAutoplayOnSubtitle => '車に接続すると、最後に聴いていた本が自動で始まります';

  @override
  String get carConnectAutoplayOffSubtitle => '再生ボタンを押すまで待機します';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => 'Siriで使用';

  @override
  String get siriStatusOn => 'オン。Siriが本やポッドキャストを名前で探して再生できます。';

  @override
  String get siriStatusAsk => 'Siriに本やポッドキャストを名前で探して再生させましょう。';

  @override
  String get siriStatusOff => 'AbsorbのSiriはオフです。iOSの設定でオンにしてください。';

  @override
  String get siriAllow => '許可';

  @override
  String get siriOpenSettings => '設定を開く';

  @override
  String get siriThingsToSay => '話しかける例';

  @override
  String get siriExamples =>
      '「Absorbで[本のタイトル]を再生」\n「Absorbで[シリーズ名]を再生」\n「Absorbで[著者]の作品を再生」\n「Absorbで[ポッドキャスト]の最新エピソードを再生」\n「Absorbを再開」\n「Absorbで少し戻って」\n「Absorbで次のチャプター」\n「Absorbでスリープタイマーを設定」\n「Absorbでブックマークを追加」\n「Absorbで今聴いているものは何」';

  @override
  String get siriShortcutsNote =>
      '再開、一時停止、スキップ、チャプター、スリープタイマー、ブックマーク、再生中の内容は、この権限がなくても使えます。オートメーションやアクションボタン用に、ショートカットアプリにもあります。';

  @override
  String get carBookOrder => '車内での本の順序';

  @override
  String get carBookOrderReverse => '本の順序を逆にする';

  @override
  String get carBookOrderReverseSubtitle => 'ZからA、または追加が古い順';

  @override
  String get carPodcastOrder => '車内でのポッドキャストの順序';

  @override
  String get carEpisodesOldestFirst => '古いエピソードを先に';

  @override
  String get carEpisodesOldestFirstSubtitle => '最初から聴く番組向け';

  @override
  String get androidAutoCatBooks => '本';

  @override
  String get androidAutoCatSeries => 'シリーズ';

  @override
  String get androidAutoCatAuthors => '著者';

  @override
  String get androidAutoCatCollections => 'コレクション';

  @override
  String get androidAutoCatPlaylists => 'プレイリスト';

  @override
  String get showTipsAgain => 'ヒントをもう一度表示';

  @override
  String get showTipsAgainSubtitle => '閉じた機能のヒントを元に戻します';

  @override
  String get tipsRestored => 'ヒントを元に戻しました';

  @override
  String get resetSpeedPresets => '速度プリセットをリセット';

  @override
  String get resetSpeedPresetsSubtitle => 'デフォルトの再生速度チップに戻します';

  @override
  String get speedPresetsReset => '速度プリセットをリセットしました';

  @override
  String get editAuthor => '著者を編集';

  @override
  String get authorName => '名前';

  @override
  String get authorImage => '著者の画像';

  @override
  String get authorRemoveImage => '画像を削除';

  @override
  String get authorRemoveImageTitle => '著者の画像を削除しますか?';

  @override
  String get authorRemoveImageConfirm => 'サーバー上の画像が削除されます。';

  @override
  String get authorImageRemoved => '画像を削除しました';

  @override
  String get authorImageFailed => '著者の画像を更新できませんでした';

  @override
  String get authorUpdated => '著者を更新しました';

  @override
  String get authorUpdateFailed => '著者を更新できませんでした';

  @override
  String get authorMatched => 'マッチした内容で著者を更新しました';

  @override
  String get authorNoMatchFound => '一致するものが見つかりません';

  @override
  String authorMergedInto(String name) {
    return '$nameに統合しました';
  }

  @override
  String get authorQuickMatchHint => '選択した地域のAudibleから、名前、ASIN、説明、画像を取得します。';

  @override
  String get region => '地域';

  @override
  String get editTabDetails => '詳細';

  @override
  String get editTabCover => 'カバー';

  @override
  String get editTabMatch => 'マッチ';

  @override
  String get editTabEmbed => '埋め込み';

  @override
  String get chapterEditorTitle => 'チャプターを編集';

  @override
  String get chapterNotConnected => 'サーバーに接続されていません';

  @override
  String get chapterErrorFirstNotZero => '最初のチャプターは0:00から始める必要があります';

  @override
  String get chapterErrorStartAfterPrevious => '開始時刻は前のチャプターより後にしてください';

  @override
  String get chapterErrorStartBeforeEnd => '開始時刻は本の終わりより前にしてください';

  @override
  String get chapterErrorTitleRequired => 'タイトルは必須です';

  @override
  String get chapterEditStartTitle => '開始時刻を編集';

  @override
  String get chapterTimeHintSeconds => '秒';

  @override
  String get chapterTimeHintFull => 'HH:MM:SS または秒';

  @override
  String get chapterInvalidTime => '無効な時刻です';

  @override
  String get chapterLocked => 'チャプターはロックされています';

  @override
  String get chapterAllLocked => 'すべてのチャプターがロックされています';

  @override
  String chapterTrackTitle(int number) {
    return 'トラック $number';
  }

  @override
  String get chapterNoAudioForPosition => 'この位置に音声がありません';

  @override
  String get chapterCouldNotPlayPreview => 'プレビューを再生できませんでした';

  @override
  String chapterStartSetTo(String time) {
    return '開始時刻を$timeに設定しました';
  }

  @override
  String get chapterAddNumberedTitle => '連番のチャプターを追加';

  @override
  String chapterNextPreview(String first, String second) {
    return '次: 「$first」「$second」...';
  }

  @override
  String get chapterHowMany => 'チャプター数';

  @override
  String get add => '追加';

  @override
  String get chapterCountRange => '1～150の数を入力してください';

  @override
  String get chapterTitlesUpdated => 'チャプターのタイトルを更新しました';

  @override
  String get chaptersApplied => 'チャプターを適用しました';

  @override
  String get chapterDiscardTitle => '変更を破棄しますか?';

  @override
  String get chapterDiscardMessage => '保存済みのチャプターに戻します。';

  @override
  String get chapterRemoveAllTitle => 'すべてのチャプターを削除しますか?';

  @override
  String get chapterRemoveAllMessage => 'この本のすべてのチャプターが削除されます。';

  @override
  String get chapterAllRemoved => 'すべてのチャプターを削除しました';

  @override
  String get chapterFixHighlighted => '先に、強調表示されたチャプターを修正してください';

  @override
  String get chaptersUpdated => 'チャプターを更新しました';

  @override
  String get ok => 'OK';

  @override
  String get chapterSaveButton => 'チャプターを保存';

  @override
  String get chapterAddHint => 'チャプターを追加(例: 「Chapter 01」)';

  @override
  String get chapterAddTooltip => 'チャプターを追加';

  @override
  String get chapterRemoveAll => 'すべて削除';

  @override
  String get chapterShiftTimes => '時刻をずらす';

  @override
  String get chapterFromTracks => 'トラックから';

  @override
  String get chapterLookup => '検索';

  @override
  String get chapterShowSeconds => '秒を表示';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes分';
  }

  @override
  String get chapterLoopCut => 'カット部分をループ再生';

  @override
  String get chapterFindStart => '開始位置を探す';

  @override
  String get chapterFindStartListening => 'マーカー周辺を聴いています';

  @override
  String get chapterFindStartNone => 'チャプターの開始らしき音声が見つかりません';

  @override
  String get chapterFindStartWider => '範囲を広げて探す';

  @override
  String get chapterFindStartCeiling =>
      'マーカーの前後30分を探しました。開始位置はそれより離れているか、チャプターの読み上げがありません。';

  @override
  String get chapterFindStartStrong => 'このチャプターらしい音声';

  @override
  String get chapterFindStartMaybe => 'チャプターらしい言葉';

  @override
  String chapterFindStartGap(String seconds) {
    return '$seconds秒の間';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return '$from～$toを検索しました';
  }

  @override
  String get chapterFindStartNeedsModel => '先に設定で文字起こしをオンにして、モデルをダウンロードしてください';

  @override
  String get chapterFindStartUseThis => 'これを使う';

  @override
  String chapterFindStartTitle(String title) {
    return 'タイトル: $title';
  }

  @override
  String get chapterShiftBySeconds => 'ずらす量(秒)';

  @override
  String get chapterShiftHint => 'ロックされていないすべてのチャプターをずらします。前にずらすには負の値を使います。';

  @override
  String get chapterTitleHint => 'チャプターのタイトル';

  @override
  String get chapterStopPreview => 'プレビューを停止';

  @override
  String get chapterPreviewFromHere => 'ここからプレビュー';

  @override
  String get chapterScrubHint => 'ドラッグまたは微調整して開始位置を動かします';

  @override
  String chapterStartAt(String time) {
    return '開始: $time';
  }

  @override
  String get chapterUnlock => 'ロック解除';

  @override
  String get chapterLock => 'ロック';

  @override
  String get chapterInsertBelow => '下に挿入';

  @override
  String get chapterFindTitle => 'チャプターを探す';

  @override
  String get chapterFindSubtitle => 'ASINをもとに、Audible/Audnexusからチャプターを検索します。';

  @override
  String get chapterEnterAsin => 'ASINを入力してください';

  @override
  String get chapterLookupFailed => '検索に失敗しました - ASINを確認してください';

  @override
  String get chapterNoChaptersFound => 'そのASINのチャプターが見つかりません';

  @override
  String get chapterRemoveBranding => 'Audibleのブランド音声(イントロ/アウトロ)を削除';

  @override
  String chapterFoundCount(int count) {
    return '$count件のチャプターが見つかりました';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  本 $book';
  }

  @override
  String get chapterAudibleLonger =>
      'Audible版はお手元のファイルより長いため、後半のチャプターがずれる可能性があります。';

  @override
  String get chapterAudibleShorter =>
      'Audible版はお手元のファイルより短いため、チャプターがずれる可能性があります。';

  @override
  String get chapterTitlesOnly => 'タイトルのみ';

  @override
  String get chapterApplyChapters => 'チャプターを適用';

  @override
  String get coverSearchTitle => 'カバーを検索';

  @override
  String get coverSearchRefineHint => 'タイトルや著者を調整すると結果を絞り込めます。本の情報は変更されません。';

  @override
  String get coverNoneFound => 'カバーが見つかりません';

  @override
  String get coverEnterTitleFirst => '先にタイトルを入力してください';

  @override
  String get coverUpdated => 'カバーを更新しました';

  @override
  String get coverCouldNotUpdate => 'カバーを更新できませんでした';

  @override
  String get coverApply => 'カバーを適用';

  @override
  String get coverUnknownResolution => '解像度不明';

  @override
  String get embedIntro => 'カバー画像やチャプターを含むメタデータを、音声ファイルに埋め込みます。';

  @override
  String get embedBackupOption => '先に音声ファイルをバックアップ';

  @override
  String get embedNoteInFolder => 'メタデータは、オーディオブックフォルダー内の音声トラックに埋め込まれます。';

  @override
  String get embedNoteMultiTrack => '複数トラックのオーディオブックには、チャプターは埋め込まれません。';

  @override
  String get embedNoteNavigateAway => 'タスクを開始した後は、このページから移動しても構いません。';

  @override
  String get embedStartButton => 'メタデータの埋め込みを開始';

  @override
  String embedProgress(String percent) {
    return '埋め込み中 $percent%';
  }

  @override
  String get embedProgressIndeterminate => '埋め込み中...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent% - このページを離れても実行を続けます';
  }

  @override
  String get taskStarting => '開始中...';

  @override
  String get embedBackupNoteIntro => '元の音声ファイルのバックアップは、サーバー上の次の場所に保存されます: ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro => '。アイテムのキャッシュを定期的に消去してください。';

  @override
  String get embedDialogTitle => 'メタデータを埋め込む';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '音声ファイル#個',
      one: '音声ファイル#個',
    );
    return '$_temp0にメタデータを埋め込みますか? 音声ファイルは書き換えられます$backup。';
  }

  @override
  String get embedConfirmBackupClause => '(先に元ファイルをバックアップ)';

  @override
  String get embedConfirmAction => '埋め込む';

  @override
  String get embedCouldNotStart => '埋め込みを開始できませんでした';

  @override
  String get embedStarted => '埋め込みを開始しました';

  @override
  String get embedComplete => '埋め込みが完了しました';

  @override
  String get embedFailed => '埋め込みに失敗しました';

  @override
  String get encodeComplete => 'エンコードが完了しました';

  @override
  String get encodeFailedTask => 'エンコードに失敗しました';

  @override
  String encodeProgress(String percent) {
    return 'エンコード中 $percent%';
  }

  @override
  String get encodeProgressIndeterminate => 'エンコード中...';

  @override
  String get adminApiKeys => 'APIキー';

  @override
  String get adminApiKeysSubtitle => 'プログラム用のアクセストークン';

  @override
  String get adminApiKeysNewTitle => '新しいAPIキー';

  @override
  String get adminApiKeysName => '名前';

  @override
  String get adminApiKeysNameHint => '例: Home Assistant';

  @override
  String get adminApiKeysOwner => 'ユーザー';

  @override
  String get adminApiKeysExpiration => '有効期限';

  @override
  String get adminApiKeysActive => '有効';

  @override
  String get adminApiKeysActiveSub => '作成後すぐにキーが使えます';

  @override
  String get adminApiKeysInactive => '無効';

  @override
  String get adminApiKeysExpired => '期限切れ';

  @override
  String get adminApiKeysCreate => 'キーを作成';

  @override
  String get adminApiKeysCreated => 'APIキーを作成しました';

  @override
  String get adminApiKeysTokenLabel => '新しいAPIキー';

  @override
  String get adminApiKeysCopyWarning => '今すぐこのキーをコピーしてください。セキュリティのため、再表示されません。';

  @override
  String get adminApiKeysCopy => 'コピー';

  @override
  String get adminApiKeysCopied => 'クリップボードにコピーしました';

  @override
  String get adminApiKeysDone => '完了';

  @override
  String get adminApiKeysDeleteTitle => 'APIキーを失効させますか?';

  @override
  String get adminApiKeysDeleted => 'APIキーを失効させました';

  @override
  String get adminApiKeysRevoke => '失効させる';

  @override
  String get adminApiKeysSetActive => '有効にする';

  @override
  String get adminApiKeysSetInactive => '無効にする';

  @override
  String get adminApiKeysFailedCreate => 'APIキーを作成できませんでした';

  @override
  String get adminApiKeysFailedDelete => 'APIキーを失効させられませんでした';

  @override
  String get adminApiKeysFailedUpdate => 'APIキーを更新できませんでした';

  @override
  String get adminApiKeysEmpty => 'APIキーはまだありません';

  @override
  String get adminApiKeysEmptySub => '作成すると、アプリやスクリプトからサーバーにアクセスできます';

  @override
  String get adminApiKeysNeverUsed => '未使用';

  @override
  String get adminApiKeysNeverExpires => '期限なし';

  @override
  String get adminApiKeysNameRequired => '名前を入力してください';

  @override
  String get adminApiKeysUserRequired => 'ユーザーを選択してください';

  @override
  String get adminApiKeysExpNever => 'なし';

  @override
  String get adminApiKeysExp7d => '7日';

  @override
  String get adminApiKeysExp30d => '30日';

  @override
  String get adminApiKeysExp90d => '90日';

  @override
  String get adminApiKeysExp1y => '1年';

  @override
  String adminApiKeysLastUsed(String time) {
    return '最終使用: $time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return '有効期限: $date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return '「$name」を失効させますか? このキーを使っているアプリは、すぐにアクセスできなくなります。';
  }

  @override
  String get endOfEpisode => 'エピソードの終わり';

  @override
  String get sleepTimerSheetEpisodeSleepStart => 'エピソードの終わりでスリープ';

  @override
  String get bookmarkListen => '聴く';

  @override
  String get bookmarkPause => '一時停止';

  @override
  String get bookmarkPreviewFailed => 'この箇所を再生できませんでした。';

  @override
  String get clipExport => 'クリップを書き出す';

  @override
  String get clipJumpToStart => '開始位置へ移動';

  @override
  String get clipJumpToEnd => '終了位置へ移動';

  @override
  String get clipSetStart => '開始位置を設定';

  @override
  String get clipSetEnd => '終了位置を設定';

  @override
  String get clipInLabel => '開始';

  @override
  String get clipOutLabel => '終了';

  @override
  String get clipSave => 'クリップを保存';

  @override
  String clipExportSaved(String filename) {
    return '$filenameを保存しました';
  }

  @override
  String get clipExportClamped => 'クリップを保存しました(このトラックの終わりまでに短縮)';

  @override
  String get clipExportFailed => 'クリップを書き出せませんでした。';

  @override
  String get clipDownloadToExport => 'iPhoneでクリップを書き出すには、先にこの本をダウンロードしてください。';

  @override
  String get fsPickerTitle => 'フォルダーを選択';

  @override
  String get fsServerRoot => 'サーバーのルート';

  @override
  String get fsEmptyFolder => 'ここにサブフォルダーはありません';

  @override
  String get fsUseThisFolder => 'このフォルダーを使う';

  @override
  String get adminLibrariesManage => 'ライブラリ';

  @override
  String get adminLibrariesManageSubtitle => '作成、編集、並べ替え';

  @override
  String get adminUploadTitle => 'メディアをアップロード';

  @override
  String get adminUploadSubtitle => 'ファイルから本とポッドキャストを追加';

  @override
  String get adminUploadNoLibraries => 'メディアをアップロードする前にライブラリを作成してください。';

  @override
  String get adminUploadDestination => 'アップロード先';

  @override
  String get adminUploadFolder => 'ライブラリフォルダー';

  @override
  String get adminUploadDetails => 'アイテムの詳細';

  @override
  String get adminUploadOptional => '任意';

  @override
  String get adminUploadAutoMetadata => 'メタデータを自動取得';

  @override
  String get adminUploadAutoMetadataSubtitle => '最も一致した結果からタイトル、著者、シリーズを入力します';

  @override
  String get adminUploadMetadataProvider => 'メタデータプロバイダー';

  @override
  String get adminUploadMetadataSearching => 'メタデータを検索中...';

  @override
  String get adminUploadMetadataNoResults =>
      '一致するメタデータが見つかりませんでした。このアイテムはそのままアップロードできます。';

  @override
  String get adminUploadMetadataFailed =>
      'メタデータを検索できませんでした。このアイテムはそのままアップロードできます。';

  @override
  String get adminUploadDestinationPreview => 'サーバー上の保存先';

  @override
  String get adminUploadFiles => 'ファイル';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個のファイル',
      one: '1 個のファイル',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => 'ファイルを選択';

  @override
  String get adminUploadAddFiles => 'ファイルを追加';

  @override
  String get adminUploadBookFilesHint =>
      'オーディオまたは電子書籍のファイルを選択してください。カバーやメタデータのファイルも含められます。';

  @override
  String get adminUploadPodcastFilesHint =>
      'オーディオファイルを1つ以上選択してください。カバーやメタデータのファイルも含められます。';

  @override
  String get adminUploadUnsupportedFiles =>
      '選択したファイルの一部は Audiobookshelf で対応していません。';

  @override
  String get adminUploadFilePickerFailed => '選択したファイルを開けませんでした。';

  @override
  String get adminUploadTitleRequired => 'タイトルを入力してください';

  @override
  String get adminUploadLibraryRequired => 'ライブラリを選択してください';

  @override
  String get adminUploadFolderRequired => 'ライブラリフォルダーを選択してください';

  @override
  String get adminUploadFilesRequired => 'ファイルを1つ以上選択してください';

  @override
  String get adminUploadPodcastFileRequired =>
      'このポッドキャストのオーディオファイルを1つ以上選択してください。';

  @override
  String get adminUploadBookFileRequired =>
      'この本のオーディオまたは電子書籍のファイルを1つ以上選択してください。';

  @override
  String get adminUploadPathCheckFailed =>
      '保存先フォルダーを確認できませんでした。何もアップロードされていません。';

  @override
  String get adminUploadDestinationExists => 'その保存先フォルダーはすでにサーバー上に存在します。';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return 'その保存先はすでに「$title」で使われています。';
  }

  @override
  String get adminUploadAddToExistingTitle => 'フォルダーがすでに存在します';

  @override
  String adminUploadAddToExisting(String title) {
    return 'そのフォルダーは「$title」のものです。ファイルをそこに追加しますか？サーバーは次回のスキャンで取り込みます。';
  }

  @override
  String get adminUploadAddToExistingNoItem =>
      'そのフォルダーはすでにサーバー上に存在します。ファイルをそこに追加しますか？';

  @override
  String get adminUploadAddToBook => '既存の本に追加';

  @override
  String get adminUploadAddToBookHint => 'このライブラリを検索';

  @override
  String get adminUploadNoBooksFound => '本が見つかりません';

  @override
  String adminUploadAddingTo(String title) {
    return '「$title」にファイルを追加中';
  }

  @override
  String adminUploadAddedTo(String title) {
    return '「$title」にファイルを追加しました';
  }

  @override
  String get adminUploadTargetNoFolder => 'サーバー上でその本のフォルダーが見つかりませんでした。';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return 'サーバーはこれらのファイルを、その本のフォルダー「$folder」ではなく「$preview」に置こうとしています。何もアップロードされていません。';
  }

  @override
  String get adminUploadUploading => 'アップロード中...';

  @override
  String adminUploadProgress(int percent) {
    return 'アップロード中 $percent%';
  }

  @override
  String get adminUploadButton => 'アップロード';

  @override
  String adminUploadComplete(String title) {
    return '「$title」をアップロードしました';
  }

  @override
  String get adminUploadFailed => 'アップロードに失敗しました';

  @override
  String adminUploadFailedReason(String error) {
    return 'アップロードに失敗しました: $error';
  }

  @override
  String get adminUploadReselectFiles => '再試行する前にファイルを選択し直してください。';

  @override
  String get adminServerSettings => 'サーバー設定';

  @override
  String get adminServerSettingsSubtitle => 'スキャナー、ストレージ、並べ替え';

  @override
  String get adminAuthentication => '認証';

  @override
  String get adminAuthenticationSubtitle => 'パスワードと OpenID Connect によるサインイン';

  @override
  String get adminStats => '統計';

  @override
  String get adminStatsSubtitle => 'ライブラリと再生時間の合計';

  @override
  String get adminAllSessions => 'すべてのセッション';

  @override
  String get adminAllSessionsSubtitle => 'すべての再生セッションを表示・管理';

  @override
  String get adminSessionsAllUsers => 'すべてのユーザー';

  @override
  String get adminSessionsEmpty => 'セッションなし';

  @override
  String get statsLibraryTotals => 'ライブラリの合計';

  @override
  String get statsTotalItems => 'アイテム';

  @override
  String get statsAudioFiles => 'オーディオファイル';

  @override
  String get statsTotalSize => '合計サイズ';

  @override
  String get statsBooks => '本';

  @override
  String get statsPodcasts => 'ポッドキャスト';

  @override
  String get statsBooksSize => '本のサイズ';

  @override
  String get statsYearReview => '今年のまとめ';

  @override
  String get statsNoYearData => 'この年のデータはありません';

  @override
  String get statsListeningTime => '再生時間';

  @override
  String get statsSessions => 'セッション';

  @override
  String get statsBooksAdded => '追加された本';

  @override
  String get statsAuthorsAdded => '追加された著者';

  @override
  String get statsTopAuthors => '上位の著者';

  @override
  String get statsTopNarrators => '上位のナレーター';

  @override
  String get statsTopGenres => '上位のジャンル';

  @override
  String get srvScannerSection => 'スキャナー';

  @override
  String get srvFindCovers => 'カバーを探す';

  @override
  String get srvCoverProvider => 'カバープロバイダー';

  @override
  String get srvParseSubtitles => 'ファイル名からサブタイトルを解析';

  @override
  String get srvPreferMatched => '一致したメタデータを優先';

  @override
  String get srvDisableWatcher => 'フォルダー監視を無効にする';

  @override
  String get srvStorageSection => 'ストレージ';

  @override
  String get srvStoreCover => 'カバーをアイテムと一緒に保存';

  @override
  String get srvStoreMetadata => 'メタデータをアイテムと一緒に保存';

  @override
  String get srvMetadataFormat => 'メタデータファイルの形式';

  @override
  String get srvFormatSection => '表示と形式';

  @override
  String get srvDateFormat => '日付の形式';

  @override
  String get srvTimeFormat => '時刻の形式';

  @override
  String get srvLanguage => 'サーバーの言語';

  @override
  String get srvChromecast => 'Chromecast 対応';

  @override
  String get srvAllowIframe => 'iframe への埋め込みを許可';

  @override
  String get srvSortingSection => '並べ替え';

  @override
  String get srvIgnorePrefixes => '並べ替え時に接頭辞を無視';

  @override
  String get srvSortingPrefixes => '並べ替えの接頭辞';

  @override
  String get srvAddPrefix => '接頭辞を追加';

  @override
  String get srvSave => '設定を保存';

  @override
  String get srvSavePrefixes => '接頭辞を保存';

  @override
  String get srvSaved => '設定を保存しました';

  @override
  String get srvSaveFailed => '設定を保存できませんでした';

  @override
  String get srvPrefixesSaved => '並べ替えの接頭辞を更新しました';

  @override
  String get authSetLoadFailed => '認証設定を読み込めませんでした';

  @override
  String get authSetCustomMessage => 'ログイン時のカスタムメッセージ';

  @override
  String get authSetMessage => 'メッセージ';

  @override
  String get authSetPasswordAuth => 'パスワード認証';

  @override
  String get authSetOpenId => 'OpenID Connect 認証';

  @override
  String get authSetGuide => 'セットアップガイド';

  @override
  String get authSetIssuerUrl => '発行者 URL';

  @override
  String get authSetAutoPopulate => '自動入力';

  @override
  String get authSetAuthorizeUrl => '認可 URL';

  @override
  String get authSetTokenUrl => 'トークン URL';

  @override
  String get authSetUserinfoUrl => 'ユーザー情報 URL';

  @override
  String get authSetJwksUrl => 'JWKS URL';

  @override
  String get authSetLogoutUrl => 'ログアウト URL';

  @override
  String get authSetClientId => 'クライアント ID';

  @override
  String get authSetClientSecret => 'クライアントシークレット';

  @override
  String get authSetSigningAlgorithm => '署名アルゴリズム';

  @override
  String get authSetRedirectUris => '許可するモバイルのリダイレクト URI';

  @override
  String get authSetRedirectUrisInfo =>
      'アプリはサインイン後、これらのアドレスにのみ戻れます。Absorb は absorb://oauth を使用します。アスタリスク (*) だけを入力すると、すべてのアドレスを許可します。';

  @override
  String get authSetAddRedirectUri => 'URI を追加';

  @override
  String get authSetAddAbsorbRedirect => 'absorb://oauth を追加';

  @override
  String get authSetSubfolder => 'リダイレクト URL のサブフォルダー';

  @override
  String get authSetSubfolderNone => 'なし';

  @override
  String get authSetWebRedirectInfo =>
      'ウェブアプリにサインインから戻れるよう、OAuth プロバイダーで次の URL を許可してください:';

  @override
  String get authSetButtonText => 'ボタンのテキスト';

  @override
  String get authSetMatchExisting => '既存ユーザーとの照合方法';

  @override
  String get authSetMatchNone => '照合しない';

  @override
  String get authSetMatchEmail => 'メールアドレス';

  @override
  String get authSetMatchUsername => 'ユーザー名';

  @override
  String get authSetMatchExistingInfo =>
      '既存ユーザーの紐付けに使用します。紐付け後は、プロバイダーの一意の ID で照合されます。';

  @override
  String get authSetAutoLaunch => '自動起動';

  @override
  String get authSetAutoLaunchInfo =>
      'ウェブのログインページからプロバイダーを自動的に開きます。/login?autoLaunch=0 を付けるとスキップします。';

  @override
  String get authSetAutoRegister => '自動登録';

  @override
  String get authSetAutoRegisterInfo => 'サインインした新規ユーザーを自動的に作成します';

  @override
  String get authSetClaimsInfo =>
      'グループと権限の割り当てをオフにするには、これらを空のままにしてください。新規ユーザーにはユーザーロールが付与されます。';

  @override
  String get authSetGroupClaim => 'グループクレーム';

  @override
  String get authSetGroupClaimInfo =>
      'ユーザーのグループを列挙するクレームです。通常は groups です。admin、user、guest という名前のグループがロールを決め、最上位のものが優先されます。一致するグループがない場合、サインインは拒否されます。';

  @override
  String get authSetPermsClaim => '詳細な権限クレーム';

  @override
  String get authSetPermsClaimInfo =>
      '管理者以外のユーザーの権限を持つクレームです。クレームがない場合、サインインは拒否され、存在しないオプションはオフとして扱われます。想定される形式:';

  @override
  String get authSetRestartNote =>
      'OpenID Connect の変更を適用するには、保存後にサーバーを再起動してください。';

  @override
  String get authSetNoChanges => '保存する変更はありません';

  @override
  String get authSetNeedOneMethod => 'サインイン方法を少なくとも1つオンにしてください';

  @override
  String authSetFieldRequired(String field) {
    return '$field は必須です';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return '無効なリダイレクト URI: $uri';
  }

  @override
  String get authSetAsteriskAlone => 'アスタリスク (*) はリダイレクト URI として単独で指定する必要があります';

  @override
  String authSetInvalidClaim(String field) {
    return '$field は有効なクレーム名ではありません';
  }

  @override
  String authSetIssuerFailed(String error) {
    return '発行者を読み取れませんでした: $error';
  }

  @override
  String get libNoneYet => 'ライブラリはまだありません';

  @override
  String get libReorderFailed => '新しい順序を保存できませんでした';

  @override
  String get libDeleteTitle => 'ライブラリを削除しますか？';

  @override
  String get libDeleteBody => 'ライブラリとそのすべてのアイテムがサーバーから完全に削除されます。';

  @override
  String get libDeleted => 'ライブラリを削除しました';

  @override
  String get libDeleteFailed => 'ライブラリを削除できませんでした';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個のフォルダー',
      one: '1 個のフォルダー',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => '新しいライブラリ';

  @override
  String get libEditTitle => 'ライブラリを編集';

  @override
  String get libName => 'ライブラリ名';

  @override
  String get libMediaType => 'メディアの種類';

  @override
  String get libMediaBook => '本';

  @override
  String get libMediaPodcast => 'ポッドキャスト';

  @override
  String get libProvider => 'メタデータプロバイダー';

  @override
  String get libIcon => 'アイコン';

  @override
  String get libFolders => 'フォルダー';

  @override
  String get libAddFolder => 'フォルダーを追加';

  @override
  String get libNoFolders => 'フォルダーを1つ以上追加してください';

  @override
  String get libAdvanced => '詳細設定';

  @override
  String get libCoverShape => 'カバーの形';

  @override
  String get libCoverSquare => '正方形';

  @override
  String get libCoverStandard => '標準';

  @override
  String get libDisableWatcher => 'フォルダー監視を無効にする';

  @override
  String get libSkipAsin => 'ASIN を持つ本の照合をスキップ';

  @override
  String get libSkipIsbn => 'ISBN を持つ本の照合をスキップ';

  @override
  String get libHideSingleSeries => '1冊だけのシリーズを非表示';

  @override
  String get libAudiobooksOnly => 'オーディオブックのみ';

  @override
  String get libEpubScripted => 'スクリプト付き ePub コンテンツを許可';

  @override
  String get libLaterBooksOnly => '「シリーズを続ける」で後の巻のみ表示';

  @override
  String get libPodcastRegion => 'ポッドキャスト検索の地域';

  @override
  String get libMarkPercent => '完了とする進捗率 (%)';

  @override
  String get libMarkTime => '完了とする残り秒数';

  @override
  String get libAutoScan => '自動スキャンのスケジュール (cron)';

  @override
  String get libCreate => 'ライブラリを作成';

  @override
  String get libUpdate => '変更を保存';

  @override
  String get libNameRequired => 'ライブラリ名を入力してください';

  @override
  String get libCreated => 'ライブラリを作成しました';

  @override
  String get libCreateFailed => 'ライブラリを作成できませんでした';

  @override
  String get libUpdated => 'ライブラリを更新しました';

  @override
  String get libUpdateFailed => 'ライブラリを更新できませんでした';

  @override
  String get libRemoveFoldersTitle => 'フォルダーを削除しますか？';

  @override
  String get libRemoveFoldersBody =>
      'フォルダーを削除すると、そのアイテムもライブラリから削除されます。この操作は元に戻せません。';

  @override
  String get readEbook => '読む';

  @override
  String get ebookDownload => 'ダウンロード';

  @override
  String get ebookDownloaded => 'ダウンロード済み';

  @override
  String get ebookSavedOffline => 'オフライン読書用に保存しました';

  @override
  String get ebookRemovedOffline => 'オフラインから削除しました';

  @override
  String get ebookOfflineFailed => '電子書籍をダウンロードできませんでした';

  @override
  String get ebookSaveToDevice => '端末に保存';

  @override
  String get ebookSaveToDeviceTitle => '端末に保存しますか？';

  @override
  String get ebookSaveToDeviceBody =>
      '電子書籍ファイルのコピーを端末内の場所（保存先は選べます）に保存します。リーダーでオフラインで読めるようにはなりません。それにはダウンロードを使ってください。';

  @override
  String get readerFormatUnsupported => 'この電子書籍の形式はまだリーダーで開けません';

  @override
  String get readerCouldNotOpen => 'この電子書籍を開けませんでした。ファイルが破損している可能性があります。';

  @override
  String get moreActions => 'その他';

  @override
  String get readerChapters => 'チャプター';

  @override
  String get readerSettings => 'リーダー設定';

  @override
  String get readerFontSize => '文字サイズ';

  @override
  String get readerLineSpacing => '行間';

  @override
  String get readerTextAlignment => '配置';

  @override
  String get readerAlignJustified => '両端揃え';

  @override
  String get readerAlignLeft => '左揃え';

  @override
  String get readerSideMargins => '左右の余白';

  @override
  String get readerTopBottom => '上下';

  @override
  String get readerPageLayout => 'ページレイアウト';

  @override
  String get readerPinTopBar => 'タイトルと進捗バーを常に表示';

  @override
  String get readerPinTopBarHint =>
      'タップで表示する代わりに、ページの上に固定します。文字が隠れないよう、ページが少し短くなります。';

  @override
  String get readerTopBarProgress => 'トップバーの進捗';

  @override
  String get readerTopBarProgressBook => '本';

  @override
  String get readerTopBarProgressChapter => 'チャプター';

  @override
  String get readerTopBarProgressBoth => '両方';

  @override
  String get readerSectionText => 'テキスト';

  @override
  String get readerSectionPage => 'ページ';

  @override
  String get readerSectionTopBar => 'トップバーと画面';

  @override
  String get readerSectionControls => '操作';

  @override
  String get readerSectionStats => '統計';

  @override
  String get readerParagraphSpacing => '段落の間隔';

  @override
  String get readerParagraphSpacingBook => '本の設定';

  @override
  String get readerTapZones => 'タップ領域';

  @override
  String get readerTapZonesHint =>
      '線をドラッグして四角のサイズを変えます。四角をタップして動作を変えるか、レイアウトから始めてください。';

  @override
  String get readerTapPrev => '前のページ';

  @override
  String get readerTapNext => '次のページ';

  @override
  String get readerTapMenu => '操作を表示';

  @override
  String get readerTapNothing => 'なし';

  @override
  String get readerTapKeepMenu => 'いずれかの四角で操作を表示する必要があります';

  @override
  String get readerHideControls => '操作を隠すまでの時間';

  @override
  String get readerHideControlsNever => 'しない';

  @override
  String get readerBarNotes => 'メモとハイライト';

  @override
  String readerHideControlsAfter(int seconds) {
    return '$seconds秒';
  }

  @override
  String get playerDownloadStreamingInstead =>
      'このダウンロードは再生できなかったため、サーバーからストリーミングしています。もう一度ダウンロードすると直る場合があります。';

  @override
  String get readerPageTurn => 'ページめくり';

  @override
  String get readerPageTurnNone => 'なし';

  @override
  String get readerPageTurnSlide => 'スライド';

  @override
  String get readerPageTurnCurl => 'カール';

  @override
  String get readerPageTurnRipple => 'さざ波';

  @override
  String get readerScrollMode => 'スクロールモード';

  @override
  String get readerScrollModeHint => 'ページをめくる代わりに、本を下へスクロールします。すべての本に適用されます。';

  @override
  String get readerKeepAwake => '画面をオンのままにする';

  @override
  String get readerKeepAwakeHint =>
      '自分のペースで読んでいる間、画面が消えないようにします。自動スクロールと読み上げ追従中は常にオンのままです。';

  @override
  String get readerLayoutAuto => '自動';

  @override
  String get readerLayoutSingle => '単ページ';

  @override
  String get readerLayoutTwoPage => '見開き';

  @override
  String get readerTheme => 'テーマ';

  @override
  String get readerFont => 'フォント';

  @override
  String get readerVolumeNav => '音量キーでページをめくる';

  @override
  String get readerVolumeNavOff => 'オフ';

  @override
  String get readerVolumeNavNormal => '通常';

  @override
  String get readerVolumeNavMirrored => '反転';

  @override
  String get readerAutoScroll => '自動スクロール';

  @override
  String get readerAutoScrollSubtitle =>
      '次のページが上から順に現在のページに重なって表示されます。画面中央をドラッグして速度を変え、タップで停止します';

  @override
  String get readerAutoScrollStarted => '自動スクロールを開始しました';

  @override
  String get readerAutoScrollPaused => '一時停止中 - 長押しで停止';

  @override
  String get readerAutoScrollResumed => '自動スクロールを再開しました';

  @override
  String get readerAutoScrollStopped => '自動スクロールをオフにしました';

  @override
  String get readerAutoScrollEndOfBook => '本の終わりです - 自動スクロールをオフにしました';

  @override
  String readerAutoScrollSpeed(int percent) {
    return '速度 $percent%';
  }

  @override
  String get readerMoreControls => 'その他の操作';

  @override
  String get readerAutoScrollSleep => '自動スクロールのスリープタイマー';

  @override
  String get readerAutoScrollSleepHint => 'しばらくするとスクロールを止め、画面を暗くします。';

  @override
  String readerAutoScrollSleepMinutes(int minutes) {
    return '$minutes 分';
  }

  @override
  String readerAutoScrollSleepLeft(int minutes) {
    return '残り $minutes 分';
  }

  @override
  String readerAutoScrollSleepIn(int minutes) {
    return '自動スクロールは $minutes 分後に停止します';
  }

  @override
  String get readerAutoScrollSleepOff => '自動スクロールのスリープタイマーをオフにしました';

  @override
  String get readerAutoScrollSleepEnded => 'スリープタイマー - 自動スクロールをオフにしました';

  @override
  String get readerDownloadStarted => 'ダウンロードを開始しました';

  @override
  String get detailChaptersJumpTitle => 'このチャプターに移動しますか？';

  @override
  String detailChaptersJumpContent(String title) {
    return '「$title」に再生位置を移動します。';
  }

  @override
  String get detailChaptersJump => '移動';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count チャプター完了',
      one: '1 チャプター完了',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '他のリスナー $count 人',
      one: '他のリスナー 1 人',
      zero: '他のリスナーはいません',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => '次の巻';

  @override
  String get seriesJumpToUpNext => '次の巻に移動';

  @override
  String get seriesStatsFinished => '完了';

  @override
  String get seriesStatsListened => '再生済み';

  @override
  String get seriesStatsLeft => '残り';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done / $total';
  }

  @override
  String get detailSessionsNone => '再生セッションはまだありません';

  @override
  String detailSessionsAll(int count) {
    return '全 $count セッション';
  }

  @override
  String get readerVolumeNavWhilePlaying => '音声の再生中でも有効';

  @override
  String get readerTranslateWith => '翻訳に使うもの';

  @override
  String get readerTranslateApp => 'この端末のアプリ';

  @override
  String get readerTranslateApple => 'iOS 内蔵';

  @override
  String get readerTranslateWeb => 'ブラウザーで開く';

  @override
  String get readerTranslateHint => '選択したテキストは、選んだ翻訳サービスに送信されます。';

  @override
  String get readerMoreFonts => 'フォントをさらにダウンロード';

  @override
  String get readerFontRemove => 'ダウンロードを削除';

  @override
  String readerFontDownloadFailed(String font) {
    return '$font をダウンロードできませんでした';
  }

  @override
  String get readerAnnotations => '注釈';

  @override
  String readerHighlights(int count) {
    return 'ハイライト ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return 'ブックマーク ($count)';
  }

  @override
  String get readerNoHighlights => 'ハイライトはまだありません';

  @override
  String get readerHistory => '履歴';

  @override
  String get sessionReading => '読書';

  @override
  String get readerHistoryEmpty => '離れたページがここに一覧表示されるので、いつでも戻れます。';

  @override
  String get readerHistoryClosed => '本を閉じた時';

  @override
  String get readerHistoryBeforeJump => '移動の前';

  @override
  String get readerHistoryBeforeSync => '音声との同期の前';

  @override
  String get readerLogReading => '読書時間を統計に含める';

  @override
  String get readerLogReadingHint =>
      'リーダーで過ごした時間をセッションとして記録し、統計に表示します。Audiobookshelf では再生時間として数えられます。';

  @override
  String get readerNoBookmarks => 'ブックマークはまだありません';

  @override
  String get readerBookmarkDefault => 'ブックマーク';

  @override
  String get readerNoteTitle => 'メモ';

  @override
  String get readerNoteHint => 'メモを追加...';

  @override
  String get backupAndSync => 'バックアップと同期';

  @override
  String get backupAndSyncSubtitle => 'バックアップファイルを保存、または端末間で設定を同期します';

  @override
  String get syncSettingsExperimental => '試験的機能';

  @override
  String get syncSettingsExperimentalBody =>
      '同期は新しい機能で、まだ開発中です。2台の端末が離れている間にそれぞれ変更すると、片方の変更が失われることがあります。安全のため、バックアップファイルを保管してください。';

  @override
  String get syncSettingsNeedServer => 'サーバーが必要ですか？';

  @override
  String get syncSettingsNeedServerSub =>
      'WebDAV サーバーならどれでも使えます。Nextcloud は無料のセルフホスト型です。';

  @override
  String get syncSettingsConnection => '接続';

  @override
  String get syncSettingsConnectionNotSet => 'まだ設定されていません';

  @override
  String get syncSettingsBackupFile => 'バックアップファイル';

  @override
  String get syncSettingsBackupFilePlain => 'すべてを自分で保管するファイルに保存します。';

  @override
  String get syncSettingsBackupFileWithSync =>
      'すべてを自分で保管するファイルに保存します。ログイン情報を含めると、別の端末で復元したときにそこでも同期がオンになります。';

  @override
  String get syncSettingsStatusOff => '同期していません';

  @override
  String get syncSettingsStatusProblem => 'サーバーに接続できませんでした';

  @override
  String get syncSettings => '端末間で設定を同期';

  @override
  String get syncSettingsExtras => '同期する追加項目';

  @override
  String get syncSettingsIncludeRmab => 'ReadMeABook の設定';

  @override
  String get syncSettingsIncludeRmabSub => 'ReadMeABook の API トークンを同期ファイルに含めます';

  @override
  String get syncSettingsSubtitle => '自分の WebDAV サーバー経由で設定を同期します';

  @override
  String get syncSettingsEnable => '設定を同期';

  @override
  String get syncSettingsServerUrl => 'WebDAV フォルダーの URL';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => 'ユーザー名';

  @override
  String get syncSettingsPassword => 'パスワード';

  @override
  String get syncSettingsHeaders => 'カスタムヘッダー (任意)';

  @override
  String get syncSettingsHeadersHint => '1行に1つ。例: CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => '接続をテスト';

  @override
  String get syncSettingsHoldToUpload => '長押しで今すぐアップロード';

  @override
  String get syncSettingsUploadNow => '今すぐアップロード';

  @override
  String get syncSettingsDownloadNow => '今すぐダウンロード';

  @override
  String get syncSettingsOk => '接続しました';

  @override
  String get syncSettingsNoRemote => '接続しました - まだ同期されたものはありません';

  @override
  String get syncSettingsAuthFailed => 'ユーザー名またはパスワードが違います';

  @override
  String get syncSettingsNetworkError => 'そのアドレスに接続できませんでした';

  @override
  String get syncSettingsNotConfigured => '先にアドレス、ユーザー名、パスワードを入力してください';

  @override
  String get syncSettingsTooLarge => '設定が大きすぎて同期できません';

  @override
  String get syncSettingsUploaded => '設定をアップロードしました';

  @override
  String get syncSettingsApplied => 'もう一方の端末から設定を更新しました';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'もう一方の端末から $count 件の設定を更新しました',
      one: 'もう一方の端末から 1 件の設定を更新しました',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => 'すでに最新です';

  @override
  String syncSettingsLastSynced(String when) {
    return '最終同期: $when';
  }

  @override
  String get syncSettingsNever => 'まだ同期していません';

  @override
  String navHoldPickTitle(String tab) {
    return '$tab を長押しすると...';
  }

  @override
  String get navHoldPickBody => 'このタブを長押ししたときの動作を選びます。あとで設定から変更できます。';

  @override
  String get navHoldSettingTitle => 'タブ長押しのショートカット';

  @override
  String get navHoldSettingSubtitle => '各タブを長押ししたときの動作';

  @override
  String get navHoldAskNextTime => '次回確認する';

  @override
  String get navHoldNothing => 'なし';

  @override
  String get navHoldPlayPause => '再生 / 一時停止';

  @override
  String get navHoldOfflineMode => 'オフラインモード';

  @override
  String get navHoldOfflineOn => 'オフラインモードをオンにしました';

  @override
  String get navHoldOfflineOff => 'オフラインモードをオフにしました';

  @override
  String get navHoldMenu => '常にメニューを表示';

  @override
  String get navHoldStop => '再生を停止';

  @override
  String get navHoldRmabSearch => 'ReadMeABook 検索';

  @override
  String get navHoldRmabRequests => '自分の本のリクエスト';

  @override
  String get navHoldRmabWeb => 'ReadMeABook サイト';

  @override
  String get navHoldAdd => '追加';

  @override
  String get navHoldMoveLeft => '左へ移動';

  @override
  String get navHoldMoveRight => '右へ移動';

  @override
  String get navHoldRemoveFromMenu => 'メニューから削除';

  @override
  String get navHoldEditHint => '項目を長押しして移動または削除します';

  @override
  String get navHoldResetMenu => '長押しメニューの項目をリセット';

  @override
  String get navHoldMenuReset => 'メニュー項目をリセットしました';

  @override
  String get bookStatsAction => '再生統計';

  @override
  String get bookStatsYou => 'あなた';

  @override
  String get bookStatsEveryone => '全員';

  @override
  String get bookStatsListened => '再生時間';

  @override
  String get bookStatsSessions => 'セッション';

  @override
  String get bookStatsFirst => '初めて再生した日';

  @override
  String get bookStatsLast => '最後に再生した日';

  @override
  String get bookStatsListeners => '再生を始めた人';

  @override
  String get bookStatsFinishedCount => '最後まで再生した人';

  @override
  String get bookStatsTotalTime => '全員の再生時間';

  @override
  String get bookStatsNobody => 'まだ誰も再生を始めていません';

  @override
  String get bookStatsScanning => 'セッションをスキャン中です。時間がかかる場合があります...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return 'セッションをスキャン中... $done / $total 人';
  }

  @override
  String bookStatsLastChecked(String when) {
    return '確認: $when';
  }

  @override
  String get activityYourReading => 'あなたの読書';

  @override
  String get activityYourListening => 'あなたの再生';

  @override
  String activityLastRead(String when) {
    return '最後に読んだ日: $when';
  }

  @override
  String activityLastListened(String when) {
    return '最後に再生した日: $when';
  }

  @override
  String get activityNotStarted => '未開始';

  @override
  String get activityNoReading => '読書セッションはまだありません';

  @override
  String get activityTime => '時間';

  @override
  String get activityAverage => '平均';

  @override
  String get activityProgress => '進捗';

  @override
  String activityReached(String percent) {
    return '$percent 到達';
  }

  @override
  String get readingLogTitle => '読書ログ';

  @override
  String get readingLogTotalTime => '合計時間';

  @override
  String get readingLogAverageSession => 'セッションの平均';

  @override
  String get readingLogActiveDays => 'アクティブな日数';

  @override
  String readingLogActiveDaysOf(int active, int total) {
    return '$active / $total';
  }

  @override
  String get readingLogPace => 'ペース';

  @override
  String readingLogPacePerHour(String percent) {
    return '$percent%/時間';
  }

  @override
  String get readingLogLastRead => '最後に読んだ日';

  @override
  String get readingLogStarted => '開始';

  @override
  String get readingLogFinished => '完了';

  @override
  String get readingLogNotSet => '未設定';

  @override
  String readingLogLeftMinutes(int m) {
    return '完了まで約 $m 分';
  }

  @override
  String readingLogLeftHours(int h) {
    return '完了まで約 $h 時間';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return '完了まで約 $h 時間 $m 分';
  }

  @override
  String get readingLogLeftMax => '完了まで 99 時間以上';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return '前の週より $percent% 増加';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return '前の週より $percent% 減少';
  }

  @override
  String get readingLogNewThisWeek => '今週から';

  @override
  String get readingLogSameAsLastWeek => '前の週と同じ';

  @override
  String get readingLogQuietTwoWeeks => '過去2週間は記録なし';

  @override
  String get readingLogWhereYouRead => '読んだ場所';

  @override
  String get readingLogSourceIos => 'iOS アプリ';

  @override
  String get readingLogSourceAndroid => 'Android アプリ';

  @override
  String get readingLogChartTitle => '時間の経過による進捗';

  @override
  String get readingLogChartPosition => '到達した位置';

  @override
  String get readingLogChartMinutes => '分';

  @override
  String get readingLogRecords => '記録';

  @override
  String get readingLogLongestSession => '最長セッション';

  @override
  String get readingLogBestDay => '最も多かった日';

  @override
  String get readingLogLongestStreak => '最長の連続日数';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 日',
      one: '1 日',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => '前に戻った回数';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 回',
      one: '1 回',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => '最初に開いた日';

  @override
  String get readingLogAttempts => '挑戦';

  @override
  String readingLogAttempt(int index) {
    return '$index 回目';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return '$index 回目を開始';
  }

  @override
  String get readingLogOutcomeCompleted => '読了';

  @override
  String get readingLogOutcomeSkimmed => '流し読み';

  @override
  String get readingLogOutcomeAbandoned => '中断';

  @override
  String get readingLogOutcomeInProgress => '進行中';

  @override
  String readingLogSpanRange(String from, String to) {
    return '$from ～ $to';
  }

  @override
  String readingLogSpanSince(String from) {
    return '$from から';
  }

  @override
  String readingLogSpanEnded(String to) {
    return '$to に終了';
  }

  @override
  String get readingLogSpanUnknown => '日付の記録なし';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count セッション',
      one: '1 セッション',
    );
    return '$_temp0';
  }

  @override
  String readingLogShowing(int shown, int total) {
    return '$shown / $total';
  }

  @override
  String readingLogGapDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 日間読んでいません',
      one: '1 日間読んでいません',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => '記録されたセッションはまだありません';

  @override
  String get readingLogEmptyHint =>
      'BookOrbit と同期するアプリや端末で読んだり聴いたりすると、セッションがここに表示されます。';

  @override
  String get readingLogNoMatches => 'この期間のセッションはありません';

  @override
  String get readingLogAllTime => '全期間';

  @override
  String get readingLogLast30 => '過去30日間';

  @override
  String get readingLogLast90 => '過去90日間';

  @override
  String get readingLogThisYear => '今年';

  @override
  String get readingLogAllFormats => 'すべての形式';

  @override
  String get readingLogSortBy => '並べ替え';

  @override
  String get readingLogSortDay => '日付';

  @override
  String get readingLogSortLength => '長さ';

  @override
  String get readingLogSortChange => '変化';

  @override
  String get readingLogSortReached => '到達';

  @override
  String get readingLogNewestFirst => '新しい順';

  @override
  String get readingLogOldestFirst => '古い順';

  @override
  String get readingLogMostFirst => '多い順';

  @override
  String get readingLogLeastFirst => '少ない順';

  @override
  String get readingLogDeleteTitle => 'このセッションを削除しますか？';

  @override
  String get readingLogDeleteBody => '本の読書ログと BookOrbit の統計から削除されます。';

  @override
  String get readingLogDeleteFailed => 'セッションを削除できませんでした';

  @override
  String get readingLogLoadFailed => '読書ログを読み込めませんでした';

  @override
  String get navHoldServerScan => 'サーバーのスキャン';

  @override
  String get navHoldScanAll => 'すべてのライブラリをスキャン';

  @override
  String navHoldScanLibrary(String name) {
    return '$name をスキャン';
  }

  @override
  String get navHoldScanStarted => 'スキャンを開始しました';

  @override
  String get navHoldScanFailed => 'スキャンを開始できませんでした';

  @override
  String get navHoldAdminLogs => 'サーバーログ';

  @override
  String navHoldAdminPage(String page) {
    return '管理: $page';
  }

  @override
  String get navHoldNothingPlaying => '再生するものがまだありません';

  @override
  String get navHoldReadBook => '現在の本を読む';

  @override
  String get navHoldBookDetails => '現在の本の詳細';

  @override
  String get syncSourceTitle => '同期でどちらのコピーを使いますか？';

  @override
  String get syncSourceBody =>
      'このバックアップで設定の同期がオンになりました。サーバーの最後の同期を使いますか、それともこのバックアップを正とみなしますか？バックアップを選ぶと、同期しているすべての端末のサーバー上のコピーが置き換えられます。';

  @override
  String get syncSourceUseServer => 'サーバーの最後の同期';

  @override
  String get syncSourceUseBackup => 'このバックアップ';

  @override
  String get syncSettingsWhatTravels =>
      '設定、本ごとの速度、ホームのレイアウト、「Absorbing」の順序、メモ、電子書籍のハイライトが同期されます。ログイン情報、ダウンロードフォルダー、自動ダウンロードのスイッチ、リーダーの見た目、まだサーバーに送られていないものは、この端末に残ります。';

  @override
  String get syncSettingsDownloadWarnTitle => 'この端末の設定を置き換えますか？';

  @override
  String get syncSettingsDownloadWarnBody => '同期されたコピーが、この端末の設定を上書きします。';

  @override
  String get syncSettingsDownloadWarnConfirm => '置き換える';

  @override
  String get readerCopied => 'クリップボードにコピーしました';

  @override
  String get dictionaryNotFound => 'この単語の定義が見つかりませんでした。';

  @override
  String get dictionaryError => '辞書に接続できませんでした。接続を確認してください。';

  @override
  String get dictionaryRetry => '再試行';

  @override
  String get dictionarySearchWeb => 'ウェブで検索';

  @override
  String get readerTooltipCopy => 'コピー';

  @override
  String get readerTooltipSearch => '検索';

  @override
  String get readerTooltipDefine => '意味を調べる';

  @override
  String get readerTooltipTranslate => '翻訳';

  @override
  String get readerSearchHint => 'この本を検索…';

  @override
  String readerSearchMatches(int count, String query) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '「$query」に一致: $count 件',
      one: '「$query」に一致: $count 件',
    );
    return '$_temp0';
  }

  @override
  String get readerSearchEmpty => '単語やフレーズを入力して検索をタップしてください。';

  @override
  String readerSearchNoResults(String query) {
    return '「$query」に一致するものはありません。';
  }

  @override
  String get transcriptionTitle => '文字起こし';

  @override
  String get transcriptionAdvancedSubtitle =>
      'ブックマークの文字起こしや、オーディオブックと電子書籍の間で位置を探すために使います';

  @override
  String get transcriptionEnable => '文字起こしを有効にする';

  @override
  String get transcriptionEnableSubtitle =>
      'ブックマークに「文字起こし」、プレーヤーに「電子書籍で位置を探す」、リーダーに「オーディオブックで探す」を追加します';

  @override
  String get transcriptionDisclaimer =>
      'すべて端末内で実行され、どこにも送信されません。動作中は追加のバッテリーと処理能力を使い、ダウンロード済みの本のみ文字起こしできます。';

  @override
  String get transcriptionNeedModelHint => '文字起こしを始めるには、下でモデルをダウンロードしてください。';

  @override
  String get transcriptionModelSection => 'モデル';

  @override
  String get transcriptionModelTiny => 'Tiny';

  @override
  String get transcriptionModelTinyDesc => '最も速いが精度は低め。約 31 MB。';

  @override
  String get transcriptionModelBase => 'Base';

  @override
  String get transcriptionModelBaseDesc => 'ほどよいバランス。約 57 MB。';

  @override
  String get transcriptionModelSmall => 'Small';

  @override
  String get transcriptionModelSmallDesc => '遅いが最も正確。ハイエンドのスマートフォン向け。約 182 MB。';

  @override
  String get transcriptionAutoHint =>
      '複数ダウンロードしている場合、ジョブごとに使い分けます。電子書籍がある本は、正確な文字は電子書籍から取得するため最も速いモデルを使います。電子書籍がない本は最も正確なモデルを使います。ただし読み上げ追従は、ナレーションに遅れないよう Small より下のモデルになります。';

  @override
  String get transcriptionDownload => 'ダウンロード';

  @override
  String get transcriptionDownloadFailed => 'ダウンロードに失敗しました。接続を確認してもう一度お試しください。';

  @override
  String get transcribe => '文字起こし';

  @override
  String get transcribing => '文字起こし中...';

  @override
  String get transcriptionResultTitle => '文字起こし';

  @override
  String get transcriptionSaveToNote => 'メモに保存';

  @override
  String get transcriptionSavedToNote => 'ブックマークのメモに保存しました';

  @override
  String get transcriptionDisabledHint => '設定の「詳細」で、ブックマークの文字起こしをオンにしてください。';

  @override
  String get transcriptionNoModelDownloaded => '先に設定で文字起こしモデルをダウンロードしてください。';

  @override
  String get transcriptionNotDownloadedBook =>
      '文字起こしするには、この本をダウンロードするか、サーバーに接続してください。';

  @override
  String get transcriptionNoMetadataMsg =>
      'ダウンロードしたデータ内でこの位置を特定できません。本をダウンロードし直してみてください。';

  @override
  String get transcriptionBusyMsg => 'すでに文字起こしを実行中です。しばらくお待ちください。';

  @override
  String get transcriptionEmptyMsg => 'この位置には音声が見つかりませんでした。';

  @override
  String get transcriptionFailedMsg => 'この位置を文字起こしできませんでした。もう一度お試しください。';

  @override
  String get transcriptionPlaySnippet => '聴く';

  @override
  String get transcriptionPauseSnippet => '一時停止';

  @override
  String get transcriptionIntroBody =>
      'ブックマークの少し前から、選んだ長さの音声を聴き取り、端末内でテキストに変換します。長いクリップほど時間がかかり、文字起こしは100%正確ではありません。完了すると、テキストがブックマークのメモに保存されるので、修正や共有ができます。';

  @override
  String get transcriptionUseEbookText => '一致できる場合は電子書籍の正確なテキストを使う';

  @override
  String get lyricsMode => 'ライブ文字起こし';

  @override
  String get lyricsListeningAhead => '先読み中...';

  @override
  String get lyricsDisplaySection => 'ライブ文字起こし';

  @override
  String get lyricsFontSize => '行のサイズ';

  @override
  String get lyricsMaxLines => '表示する行数';

  @override
  String get lyricsFullCover => 'カバー全体を使う';

  @override
  String get lyricsFullCoverHint => '実行中はアートワークの代わりに文字起こしを表示し、入る限りの行数を収めます。';

  @override
  String get lyricsBatteryInfo =>
      'ライブ文字起こしと読み上げ追従は、動作中に追加のバッテリーと処理能力を使います。処理の遅いスマートフォンでは、行の表示に時間がかかる場合があります。';

  @override
  String get lyricsClearCache => '文字起こしのキャッシュを消去';

  @override
  String lyricsClearCacheHint(String size) {
    return '保存済みの文字起こし行 $size。消去した本とエピソードは、再生中にもう一度文字起こしされます。';
  }

  @override
  String get lyricsClearCacheConfirm =>
      'すべての本とエピソードの保存済み文字起こしを削除しますか？再生中に自動的に作り直されます。';

  @override
  String get lyricsCacheCleared => '文字起こしのキャッシュを消去しました';

  @override
  String get lyricsIntroBody =>
      'ナレーションの少し先を聴き取り、話された行をスマートフォン上で文字起こしして表示します。何も外部に送信されません。オンにした後は、先読みが進むまで数秒間、再生を押さないでください。先読みの準備ができると文字起こしが表示され、一時停止のまま始めると最もスムーズに動作します。動作中は追加のバッテリーと処理能力を使います。';

  @override
  String lyricsBuildingLead(String percent) {
    return 'ナレーションの先を準備中... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return '$speed での再生に文字起こしが追いつきません';
  }

  @override
  String get lyricsTurnOn => 'オンにする';

  @override
  String get readAlong => '読み上げ追従';

  @override
  String get readAlongNeedsPlaying => '先にこの本のオーディオブックを再生してください';

  @override
  String get narrationListen => '聴く';

  @override
  String get narrationPlayFromHere => 'ここから再生';

  @override
  String get narrationPreparing => 'ナレーションを準備中';

  @override
  String get narrationNone => 'この電子書籍には再生できるナレーションがありません';

  @override
  String get narrationDownloadTitle => 'ダウンロードして聴く';

  @override
  String get narrationDownloadBody =>
      'この本は自分で読み上げる EPUB3 です。Audiobookshelf ではそのナレーションをストリーミングできないため、再生する前に音声をダウンロードする必要があります。';

  @override
  String get narrationDownloadStarted =>
      'ナレーションをダウンロード中です。完了したら Absorb をタップしてください。';

  @override
  String get narrationTextBody =>
      'この本の EPUB には音声の各場面に対応する文章があるため、テキストは本からそのままコピーされます。ブックマークのメモに追加する量を選んでください。';

  @override
  String get narrationTextLoading => '本から文章を取得中';

  @override
  String get downloadToAbsorb => 'Absorb にダウンロード';

  @override
  String get narrationUpNextTitle => '次のものをダウンロード';

  @override
  String narrationUpNextBody(String title) {
    return 'キューの次は $title です。自分で読み上げる EPUB3 のため、再生するにはダウンロードが必要です。';
  }

  @override
  String narrationQueueStopped(String title) {
    return '$title の前で停止しました。続けるにはダウンロードしてください。';
  }

  @override
  String get transcriptionNeedsDownload =>
      'これにはスマートフォン上の音声が必要です。今すぐダウンロードしますか？';

  @override
  String get transcriptionDownloadStarted => 'ダウンロード中です。完了したらもう一度オンにしてください';

  @override
  String get readAlongFollow => '読み上げ追従の単位';

  @override
  String get syncReadingListening => '読書と再生を同期し続ける';

  @override
  String get syncReadingListeningHint =>
      'オーディオブックと電子書籍の両方がある本が対象です。再生を止めると、電子書籍がその位置に移動します。リーダーを閉じると、オーディオブックがあなたのページに移動します。進む方向にのみ移動します。';

  @override
  String get syncEbookMoved => '電子書籍を再生を止めた位置に移動しました';

  @override
  String get syncAudioMoved => 'オーディオブックを読むのをやめた位置に移動しました';

  @override
  String get syncAudioOffer => 'タップして読むのをやめた位置へ移動';

  @override
  String get syncFindingAudio => 'オーディオブックであなたのページを探しています';

  @override
  String get syncFindingEbook => '電子書籍であなたの位置を探しています';

  @override
  String get syncFailed => '位置を同期できませんでした';

  @override
  String get syncAlreadyTogether => 'すでに同期済みです';

  @override
  String get syncPosition => '位置を同期';

  @override
  String get readAlongFollowHint =>
      '単語のタイミングは文字起こしのタイムスタンプの間から算出されるため、文の途中で少しずれる場合があります。';

  @override
  String get readAlongFollowWord => '単語';

  @override
  String get readAlongFollowSentence => '文';

  @override
  String get readAlongColor => '読み上げ追従の色';

  @override
  String get readAlongLost => 'ページ上でナレーションが見つかりません';

  @override
  String get readAlongBackToNarration => 'ナレーションに戻る';

  @override
  String get findInEbook => '電子書籍で探す';

  @override
  String get findInEbookSearching => '電子書籍でこの位置を探しています...';

  @override
  String get findInEbookNotFound => '電子書籍でこの位置が見つかりませんでした。';

  @override
  String get findInEbookNeedsEpub => '電子書籍で探すには EPUB の電子書籍が必要です。';

  @override
  String get findInEbookNoEbook => 'この本には電子書籍がありません。';

  @override
  String get findInAudiobook => 'オーディオブックで探す';

  @override
  String get findInAudiobookSearching => 'オーディオブックでこの位置を探しています...';

  @override
  String get findInAudiobookStillSearching => '音声でこの位置をまだ探しています...';

  @override
  String get findInAudiobookSearchingLong =>
      '長いチャプターのため、まだ探しています。1～2分かかることがあります...';

  @override
  String get findInAudiobookNotFound => 'オーディオブックでこの位置が見つかりませんでした。';

  @override
  String get transcriptionWhisperInfo =>
      '文字起こしは、ナレーションを聴き取って言葉を書き出すオープンな音声認識モデル Whisper によるもので、すべてこの端末内で処理されます。';

  @override
  String get transcriptionWhisperLearnMore => 'Whisper について詳しく見る';

  @override
  String get findInAudiobookIntroBody =>
      '読んでいる位置付近のオーディオブックを聴き取り、この一節と照合します。すべて端末内で行われ、最大1分ほどかかります。確実に一致しない場合は、何も移動しません。';

  @override
  String get findInAudiobookAfterLabel => '位置が見つかったとき';

  @override
  String get findInAudiobookStay => '読み続ける';

  @override
  String get findInAudiobookGoPlayer => 'プレーヤーを開く';

  @override
  String get findInAudiobookPlaying => 'オーディオブックでこの一節を再生中';

  @override
  String get catchUpAudioAhead => 'オーディオブックのほうが先に進んでいます。タップして移動します。';

  @override
  String get catchUpPageAhead => 'このページはオーディオブックより先です。タップしてオーディオブックをここへ移動します。';

  @override
  String get readerShortcutButton => 'ショートカットボタン';

  @override
  String get keepScreenOn => '画面をオンのままにする';

  @override
  String get keepScreenOnActive => '画面はオンのままです';

  @override
  String get keepScreenOnUntilClosed => 'アプリを閉じるまで画面はオンのままです';

  @override
  String get keepScreenOnOff => '画面がまたオフになります';

  @override
  String get keepScreenOnOffUntilRestart => 'アプリを再起動するまでオフです。設定のスイッチはオンのままです';

  @override
  String get keepScreenOnPlayer => 'プレーヤーで画面をオンのままにする';

  @override
  String get keepScreenOnPlayerSubtitle => 'プレーヤーを開いている間、画面はオンのままです';

  @override
  String get keepScreenOnCarMode => 'カーモードで画面をオンのままにする';

  @override
  String get keepScreenOnCarModeSubtitle => 'カーモードを開いている間、画面はオンのままです';

  @override
  String get loginServerType => 'サーバーの種類';

  @override
  String get authBookOrbitDefaultPassword =>
      'このアカウントはまだ初期パスワードのままです。BookOrbit で変更してから、もう一度サインインしてください。';

  @override
  String get authBookOrbitPasswordOff =>
      'このサーバーではパスワードでのサインインが無効です。マジックリンクまたはシングルサインオンでサインインしてください。';

  @override
  String get authServerIsBookOrbit =>
      'これは BookOrbit サーバーです。サーバーアドレスの上で BookOrbit を選んでください。';

  @override
  String get authServerIsAudiobookshelf =>
      'これは Audiobookshelf サーバーです。サーバーアドレスの上で Audiobookshelf を選んでください。';

  @override
  String get castNotAvailableBookOrbit => 'BookOrbit サーバーではキャストを利用できません';

  @override
  String get loginMagicLink => 'マジックリンク';

  @override
  String get loginMagicLinkDescription =>
      'BookOrbit のマジックリンクでサインインするか、パスワードリンクを貼り付けてパスワードを設定します。';

  @override
  String get collectionPublicTitle => '公開';

  @override
  String get collectionPublicSubtitle => 'このサーバーの全員がこのコレクションを見られます';

  @override
  String loginSignInWithProvider(String provider) {
    return '$provider でサインイン';
  }

  @override
  String get loginSignInWithSso => 'SSO でサインイン';

  @override
  String get loginChooseSsoProvider => 'サインイン方法を選択';

  @override
  String get loginRedirectUriBookOrbit =>
      'リダイレクト URI: bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => '読書状況';

  @override
  String get readStatusHint => 'BookOrbit は、ここで選んだ状況を変更するまで保持します。';

  @override
  String get readStatusUnread => '未読';

  @override
  String get readStatusWantToRead => '読みたい';

  @override
  String get readStatusReading => '読書中';

  @override
  String get readStatusOnHold => '保留中';

  @override
  String get readStatusRereading => '再読中';

  @override
  String get readStatusRead => '読了';

  @override
  String get readStatusSkimmed => '流し読み';

  @override
  String get readStatusAbandoned => '中断';

  @override
  String get personalNoteTitle => 'あなたのメモ';

  @override
  String get personalNoteAdd => '非公開メモを追加';

  @override
  String get personalNoteHint => 'このメモはあなただけが見られます。';

  @override
  String get moreLikeThis => '似た作品';

  @override
  String get coverSlotAudiobook => 'オーディオブックのカバー';

  @override
  String get coverSlotBook => '本のカバー';

  @override
  String get cardButtonFill => 'ボタンの背景';

  @override
  String get cardButtonFillSubtitle => 'プレーヤーカードのボタンの塗りつぶし方';

  @override
  String get cardButtonFillClear => 'なし';

  @override
  String get cardButtonFillSubtle => '控えめ';

  @override
  String get cardButtonFillSolid => 'ソリッド';

  @override
  String get loginBookOrbitPreview =>
      'BookOrbit への対応は新しい機能です。再生、ダウンロード、閲覧は動作しますが、一部の画面は見た目や動作が Audiobookshelf のままの場合があります。進捗は GitHub で確認でき、おかしな点があればお知らせください。';

  @override
  String get signedOutTapToSignIn => 'サインアウトしました。タップして再度サインインします。';

  @override
  String get authSignedOutKeepListening =>
      'サインアウトされました。ダウンロード済みのものは引き続き再生できます。赤いクラウドをタップして再度サインインしてください。';

  @override
  String signedOutSyncNote(String username, String server) {
    return 'サインアウト中に再生したものはこのスマートフォンに保持され、$server に $username として再びサインインすると同期されます。そのアカウントであれば、どの方法でサインインしても構いません。';
  }

  @override
  String get comicReadingDirection => '読む方向';

  @override
  String comicPageNumber(int page) {
    return '$page ページ';
  }

  @override
  String get comicBookmarkRemoveFailed =>
      'サーバーからブックマークを削除できませんでした。オンラインのときにもう一度お試しください。';

  @override
  String get comicLeftToRight => '左から右';

  @override
  String get comicRightToLeft => '右から左 (マンガ)';

  @override
  String get comicNeedsConnection => 'このコミックはサーバーから1ページずつ開くため、接続が必要です。';

  @override
  String get comicNoPages => 'このコミックにページが見つかりません。';

  @override
  String get boAdminTitle => 'サーバー管理';

  @override
  String get boAdminSubtitle => 'この BookOrbit サーバーのユーザーとライブラリ';

  @override
  String get boAdminUsers => 'ユーザー';

  @override
  String get boAdminLibraries => 'ライブラリ';

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
      other: '$count 個のライブラリ',
      one: '1 個のライブラリ',
    );
    return '$_temp0';
  }

  @override
  String get boAdminSaved => '保存しました';

  @override
  String get boAdminFailed => 'うまくいきませんでした。もう一度お試しください。';

  @override
  String get boAdminOffline => 'サーバーに接続できませんでした。';

  @override
  String get boUsersSearch => 'ユーザーを検索';

  @override
  String get boUsersNone => 'ユーザーがいません';

  @override
  String get boUsersFilterAll => 'すべて';

  @override
  String get boUsersFilterAdmins => '管理者';

  @override
  String get boUsersFilterActive => '有効';

  @override
  String get boUsersFilterInactive => '無効';

  @override
  String get boUsersFilterAttention => '要確認';

  @override
  String get boUserBadgeAdmin => '管理者';

  @override
  String get boUserBadgeInactive => '無効';

  @override
  String get boUserBadgeLocked => 'ロック中';

  @override
  String get boUserBadgeNoPassword => 'パスワード未設定';

  @override
  String boUserLastActive(String date) {
    return '最終アクティブ: $date';
  }

  @override
  String get boUserNeverSignedIn => 'サインインしたことがありません';

  @override
  String get boUserNew => '新規ユーザー';

  @override
  String get boUserCreate => '作成';

  @override
  String get boUserUsername => 'ユーザー名';

  @override
  String get boUserUsernameHint => '3文字以上。後から変更できません。';

  @override
  String get boUserName => '名前';

  @override
  String get boUserEmail => 'メールアドレス';

  @override
  String get boUserEmailInvalid => '有効なメールアドレスを入力してください';

  @override
  String get boUserActive => '有効';

  @override
  String get boUserActiveSubtitle => '無効なユーザーはサインインできません';

  @override
  String get boUserAdmin => '管理者';

  @override
  String get boUserAdminSubtitle => 'サーバー上のすべてに対するフルアクセス';

  @override
  String get boUserAdminHasAll => '管理者はすべての権限を持ち、すべてのライブラリを見られます。';

  @override
  String get boUserPermissions => '権限';

  @override
  String get boUserPresetNone => 'なし';

  @override
  String get boUserPresetStandard => '標準';

  @override
  String get boUserPresetEverything => 'すべて';

  @override
  String get boUserLibraries => 'ライブラリ';

  @override
  String get boUserLibrariesHint => 'このユーザーが見られるライブラリ。';

  @override
  String get boUserPasswordLink => 'パスワードリンクを送る';

  @override
  String get boUserPasswordLinkSubtitle => '新しいパスワードを設定するためのリンク。15分間有効';

  @override
  String get boUserExternal => 'シングルサインオンでサインインするため、パスワードはそちらで管理されます。';

  @override
  String get boUserUnlock => 'アカウントのロックを解除';

  @override
  String get boUserUnlocked => 'アカウントのロックを解除しました';

  @override
  String get boUserDelete => 'ユーザーを削除';

  @override
  String boUserDeleteTitle(String name) {
    return '$name を削除しますか？';
  }

  @override
  String get boUserDeleteBody =>
      'このアカウントと、このサーバー上のすべてのデータが削除されます。この操作は元に戻せません。';

  @override
  String get boUserDeleted => 'ユーザーを削除しました';

  @override
  String get boUserLinkTitle => 'パスワードリンク';

  @override
  String boUserLinkBody(String name) {
    return 'このリンクを $name に共有してください。パスワードを設定でき、15分間有効です。';
  }

  @override
  String get boPasswordRules => '8文字以上で、大文字、小文字、数字を含めてください。';

  @override
  String get boSetPasswordTitle => 'パスワードを設定';

  @override
  String get boSetPasswordSubmit => 'パスワードを設定してサインイン';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return '$server の $username のパスワードを選んでください。';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return '$server のアカウントのパスワードを選んでください。';
  }

  @override
  String get boSetPasswordStartingBody =>
      'このアカウントはまだ作成時のパスワードのままです。サインインを完了するには、新しいパスワードを選んでください。';

  @override
  String get boSetPasswordTrust => 'このリンクの送信者を信頼できる場合のみ続行してください。';

  @override
  String get boPasswordLinkExpired =>
      'このリンクは期限切れか、すでに使用済みです。サーバー管理者に新しいリンクを依頼してください。';

  @override
  String boPasswordSetSignInFailed(String error) {
    return 'パスワードは設定されましたが、サインインに失敗しました: $error';
  }

  @override
  String get boChangePasswordSubtitle => 'BookOrbit のパスワードを更新';

  @override
  String get boPasswordChangeEffect =>
      'パスワードを変更すると、他の BookOrbit セッションはサインアウトされます。この端末はサインインしたままです。';

  @override
  String get boPasswordChanged => 'パスワードを変更しました。サインインしていた他の端末はサインアウトされました。';

  @override
  String boPasswordShareDescription(String username) {
    return 'このリンクを送るか、$username に QR コードをスキャンしてもらうと、パスワードを選んで Absorb にサインインできます。15分間有効です。';
  }

  @override
  String boPasswordShareWarning(String username) {
    return 'このリンクを知っている人は誰でも、使用または期限切れになるまで $username のパスワードを選べます。';
  }

  @override
  String get setupLinkCopyWebLink => 'ウェブリンクをコピー';

  @override
  String get boUserLinkCopy => 'リンクをコピー';

  @override
  String get boUserLinkCopied => 'リンクをコピーしました';

  @override
  String get boUserLinkShare => '共有';

  @override
  String get boUserNoLink =>
      'ユーザーは追加されましたが、サーバーからパスワードリンクが送られませんでした。ユーザーのページから送ってください。';

  @override
  String get boPermGroupLibrary => 'ライブラリと本';

  @override
  String get boPermGroupRequests => '本のリクエスト';

  @override
  String get boPermGroupDevices => 'デバイス';

  @override
  String get boPermGroupIntegrations => '読書連携';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => 'メールと通知';

  @override
  String get boPermGroupAdmin => '管理';

  @override
  String get boPermLibraryDownload => '本をダウンロード';

  @override
  String get boPermLibraryUpload => '本をアップロード';

  @override
  String get boPermLibraryEditMetadata => 'メタデータを編集';

  @override
  String get boPermLibraryDeleteBooks => '本を削除';

  @override
  String get boPermBookRequestAccess => '本をリクエスト';

  @override
  String get boPermBookRequestAutoApprove => 'リクエストを自動承認';

  @override
  String get boPermBookRequestSelfFulfill => 'リクエストした本を直接ダウンロード';

  @override
  String get boPermManageBookRequests => '本のリクエストを管理';

  @override
  String get boPermKoboSync => 'Kobo 同期';

  @override
  String get boPermKoreaderSync => 'KOReader 同期';

  @override
  String get boPermOpdsAccess => 'OPDS アクセス';

  @override
  String get boPermHardcoverSync => 'Hardcover 同期';

  @override
  String get boPermReadwiseSync => 'Readwise 同期';

  @override
  String get boPermStorygraphSync => 'StoryGraph 同期';

  @override
  String get boPermBookDockAccess => 'Book Dock を使用';

  @override
  String get boPermManageBookDock => 'Book Dock を管理';

  @override
  String get boPermEmailSend => '本をメールで送信';

  @override
  String get boPermNotificationAccess => '通知';

  @override
  String get boPermManageEmail => 'メールを管理';

  @override
  String get boPermManageLibraries => 'ライブラリを管理';

  @override
  String get boPermManageMetadataConfig => 'メタデータ設定';

  @override
  String get boPermManageIcons => 'アイコンを管理';

  @override
  String get boPermManageUsers => 'ユーザーを管理';

  @override
  String get boPermViewUserActivity => 'ユーザーのアクティビティを表示';

  @override
  String get boPermViewAuditLog => '監査ログを表示';

  @override
  String get boPermManageAppSettings => 'アプリ設定';

  @override
  String get boLibsNone => 'ライブラリはまだありません';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 冊',
      one: '1 冊',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => '今すぐスキャン';

  @override
  String get boLibScanStarted => 'スキャンを開始しました';

  @override
  String get boLibScanning => 'スキャン中';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return '$dateにスキャン: 追加$added件、更新$updated件、欠落$missing件';
  }

  @override
  String get boLibScanFailed => '前回のスキャンに失敗しました';

  @override
  String get boLibNeverScanned => 'まだスキャンしていません';

  @override
  String get boLibNew => '新しいライブラリ';

  @override
  String get boLibName => '名前';

  @override
  String get boLibNeedName => 'ライブラリの名前を入力してください';

  @override
  String get boLibIcon => 'アイコン';

  @override
  String get boLibFolders => 'フォルダー';

  @override
  String get boLibFoldersHint => 'このライブラリの本があるサーバー上のフォルダーです。';

  @override
  String get boLibNeedFolder => 'フォルダーを1つ以上追加してください';

  @override
  String get boLibAddFolder => 'フォルダーを追加';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個のファイル',
      one: '1個のファイル',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return '$libraryで使用中';
  }

  @override
  String get boLibFolderUnreadable => 'サーバーがこのフォルダーを読み取れません';

  @override
  String get boLibFolderRescan => 'フォルダーを変更すると、ライブラリが再スキャンされます。';

  @override
  String get boLibOrganization => '本の保存形式';

  @override
  String get boLibPerFolder => '1フォルダーに1冊';

  @override
  String get boLibPerFile => '1ファイルに1冊';

  @override
  String get boLibOrganizationFixed => 'ライブラリの作成後は変更できません。';

  @override
  String get boLibWatch => '変更を監視';

  @override
  String get boLibWatchSubtitle => '新規・変更されたファイルを自動的に取り込みます';

  @override
  String get boLibSchedule => 'スケジュールスキャン';

  @override
  String get boLibScheduleOff => 'オフ';

  @override
  String get boLibScheduleDaily => '毎日';

  @override
  String get boLibScheduleWeekly => '毎週';

  @override
  String boLibScheduleCustom(String cron) {
    return 'カスタム（$cron）';
  }

  @override
  String get boLibScheduleHint => 'サーバー時間の午前3時に実行します。';

  @override
  String get boLibCovers => 'カバーの形';

  @override
  String get boLibCoverBook => '本（2:3）';

  @override
  String get boLibCoverSquare => '正方形（1:1）';

  @override
  String get boLibAccess => '閲覧できるユーザー';

  @override
  String get boLibAccessHint => '管理者はすべてのライブラリを見られます。それ以外のユーザーはここでアクセス権が必要です。';

  @override
  String get boLibAccessNone => '今のところ管理者のみ';

  @override
  String get boLibAccessAdd => 'ユーザーを追加';

  @override
  String get boLibAccessEveryoneHas => '全員がすでにアクセスできます';

  @override
  String get boLibLevelViewer => '閲覧者';

  @override
  String get boLibLevelEditor => '編集者';

  @override
  String get boLibLevelOwner => 'オーナー';

  @override
  String get boLibAccessRemove => 'アクセス権を削除';

  @override
  String get boLibDelete => 'ライブラリを削除';

  @override
  String boLibDeleteTitle(String name) {
    return '$nameを削除しますか？';
  }

  @override
  String get boLibDeleteBody =>
      'ライブラリは、本の進捗やハイライトとともにBookOrbitから削除されます。サーバー上のファイルはそのまま残ります。';

  @override
  String get boLibDeleted => 'ライブラリを削除しました';

  @override
  String get boFolderPickTitle => 'フォルダーを選択';

  @override
  String get boFolderUseThis => 'このフォルダーを使用';

  @override
  String get boFolderEmpty => '中にフォルダーはありません';

  @override
  String get statsTotalTime => '合計時間';

  @override
  String get statsTotalReadingTime => '合計読書時間';

  @override
  String statsDaysOfTime(String days) {
    return '$days日分です';
  }

  @override
  String statsHoursOfTime(String hours) {
    return '$hours時間分です';
  }

  @override
  String get statsMediaAll => 'すべて';

  @override
  String get statsMediaListening => '聴く';

  @override
  String get statsMediaReading => '読む';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'BookOrbitは$serverで日付を数えていますが、この端末は$phoneに設定されています。深夜の時間が別の日に記録されることがあります。';
  }

  @override
  String statsZoneUse(String zone) {
    return '$zoneを使用';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'BookOrbitは$zoneを使用するようになりました。過去の日付の反映には数分かかることがあります。';
  }

  @override
  String get statsZoneFailed => 'BookOrbitのタイムゾーンを変更できませんでした';

  @override
  String get statsTimeOfDay => '時間帯';

  @override
  String statsBusiestAround(String time) {
    return '$timeごろが最も多い時間帯';
  }

  @override
  String get statsFinishedByMonth => '月別の完了数';

  @override
  String statsFinishedLast12(int count) {
    return '過去12か月で$count冊';
  }

  @override
  String get statsWhereTitle => '聴く場所・読む場所';

  @override
  String get statsLast12Months => '過去12か月';

  @override
  String get statsHabits => '習慣';

  @override
  String get statsTypicalSession => '標準的なセッション';

  @override
  String get statsProgressPerSession => 'セッションごとの進捗';

  @override
  String get statsTimeToFinish => '完了までの期間';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日',
      one: '1日',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => '開始した本';

  @override
  String get statsBooksInProgress => '進行中';

  @override
  String get statsAverageProgress => '平均進捗';

  @override
  String get statsTopBooks => '上位の本';

  @override
  String get statsYearRead => '読書';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '未読$count件',
      one: '未読1件',
      zero: '新着なし',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => 'すべて既読にする';

  @override
  String get boNotificationsClearAll => 'すべて消去';

  @override
  String get boNotificationsClearTitle => 'すべての通知を消去しますか？';

  @override
  String get boNotificationsClearBody => 'BookOrbitアカウントのすべての通知が削除されます。';

  @override
  String get boNotificationsEmpty => '通知はまだありません';

  @override
  String get boNotificationsLoadFailed => '通知を読み込めませんでした';

  @override
  String get boNotificationsUpdateFailed => 'BookOrbitの通知を更新できませんでした';

  @override
  String boNotificationsOccurrences(int count) {
    return '$count回発生しました';
  }

  @override
  String get boNotificationsSettings => '通知設定';

  @override
  String get boNotificationsSettingsIntro => 'BookOrbitが保存する通知を選択します。';

  @override
  String get boNotificationsProblemsHint => '「問題」は、失敗したときや対応が必要なときだけ通知します。';

  @override
  String get boNotificationLevelOff => 'オフ';

  @override
  String get boNotificationLevelProblems => '問題';

  @override
  String get boNotificationLevelAll => 'すべて';

  @override
  String get boNotificationsSaved => '通知設定を保存しました';

  @override
  String get boNotificationsSaveFailed => '通知設定を保存できませんでした';

  @override
  String get boNotificationGroupLibrary => 'ライブラリ';

  @override
  String get boNotificationGroupFiles => 'ファイル';

  @override
  String get boNotificationGroupIntegrations => '連携';

  @override
  String get boNotificationGroupPersonal => '個人';

  @override
  String get boNotifyScanning => 'ライブラリのスキャン';

  @override
  String get boNotifyScanningDesc => 'ライブラリのスキャンが完了・失敗したとき、または欠落した本が見つかったとき。';

  @override
  String get boNotifyMetadata => 'メタデータの取得';

  @override
  String get boNotifyMetadataDesc => '本のメタデータの検索が完了・失敗したとき。';

  @override
  String get boNotifyAuthorEnrichment => '著者の詳細';

  @override
  String get boNotifyAuthorEnrichmentDesc => '著者の経歴や写真のダウンロードが完了したとき。';

  @override
  String get boNotifyFileWriteBack => 'ファイルへの保存';

  @override
  String get boNotifyFileWriteBackDesc => '編集した詳細情報がディスク上の本のファイルに保存されたとき。';

  @override
  String get boNotifyFileRename => 'ファイル名の変更';

  @override
  String get boNotifyFileRenameDesc => '本のファイル名が命名パターンに合わせて変更されたとき。';

  @override
  String get boNotifyBulkRename => '一括名前変更';

  @override
  String get boNotifyBulkRenameDesc => '多数の本の名前変更や、ライブラリ間の移動が完了・失敗したとき。';

  @override
  String get boNotifyMigration => 'インポート';

  @override
  String get boNotifyMigrationDesc => '他のライブラリアプリからのインポートが完了・失敗したとき。';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc => 'Book Dockが本の追加を完了したとき、または問題が発生したとき。';

  @override
  String get boNotifyBookRequests => '本のリクエスト';

  @override
  String get boNotifyBookRequestsDesc => '本のリクエストが送信・決定されたとき、または本が利用可能になったとき。';

  @override
  String get boNotifyEmail => 'メール配信';

  @override
  String get boNotifyEmailDesc => '本のメール送信が成功・失敗したとき。';

  @override
  String get boNotifyAchievements => '実績';

  @override
  String get boNotifyAchievementsDesc => '新しい実績を獲得したとき。';

  @override
  String get achievementsTitle => '実績';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return '$total個中$earned個を獲得';
  }

  @override
  String get achievementsFilterAll => 'すべて';

  @override
  String get achievementsFilterEarned => '獲得済み';

  @override
  String get achievementsFilterInProgress => '進行中';

  @override
  String get achievementsFilterLocked => '未解除';

  @override
  String get achievementsCategoryReading => '読書';

  @override
  String get achievementsCategoryLibrary => 'ライブラリ';

  @override
  String get achievementsCategoryExploration => '探求';

  @override
  String get achievementsCategoryDedication => '継続';

  @override
  String get achievementsCategoryDevices => 'デバイス';

  @override
  String get achievementsRarityCommon => 'コモン';

  @override
  String get achievementsRarityRare => 'レア';

  @override
  String get achievementsRarityEpic => 'エピック';

  @override
  String get achievementsRarityLegendary => 'レジェンダリー';

  @override
  String get achievementsLoadFailed => '実績を読み込めませんでした';

  @override
  String get achievementsNoneMatch => 'このフィルターに一致する実績はありません';

  @override
  String get achievementsSecretName => 'シークレット実績';

  @override
  String get achievementsSecretHint => '読み進めると明らかになります。';

  @override
  String achievementsEarnedOn(String date) {
    return '$dateに獲得';
  }

  @override
  String achievementsWhileReading(String title) {
    return '$titleを読んでいるとき';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return 'ティア $earned / $total';
  }

  @override
  String get achievementsTiers => 'ティア';

  @override
  String get achievementsAllTiers => 'すべてのティアを獲得';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold冊';
  }

  @override
  String achievementsProgressPages(String current, String threshold) {
    return '$current / $thresholdページ';
  }

  @override
  String achievementsProgressHours(String current, String threshold) {
    return '$current / $threshold時間';
  }

  @override
  String achievementsProgressAnnotations(String current, String threshold) {
    return '$current / $threshold件のハイライトとメモ';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold件の評価';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $thresholdジャンル';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold言語';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold日';
  }

  @override
  String get achievementsHowToGetIt => '獲得方法';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '過去$days日間で$count時間読みました。',
      one: '過去$days日間で1時間読みました。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'このペースであと約$count日です。',
      one: 'このペースであと約1日です。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'このペースであと約$count週間です。',
      one: 'このペースであと約1週間です。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'このペースであと約$countか月です。',
      one: 'このペースであと約1か月です。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$decade年代の本が$count冊、本棚で待っています。',
      one: '$decade年代の本が1冊、本棚で待っています。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$century年代の本が$count冊、本棚で待っています。',
      one: '$century年代の本が1冊、本棚で待っています。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return '$titleは$percentまで読み進めており、$dateに開始しました。';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return '$titleは$dateに開始しました。';
  }

  @override
  String get achievementsHintUntitledBook => '進行中の本';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '進行中の本$count冊が$percentを超えています。',
      one: '進行中の本1冊が$percentを超えています。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '完了した本$count冊にまだ評価がありません。',
      one: '完了した本1冊にまだ評価がありません。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$pagesページ未満の本が$count冊、本棚で待っています。',
      one: '$pagesページ未満の本が1冊、本棚で待っています。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count冊はすでに進行中です。',
      one: '1冊はすでに進行中です。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$pagesページ以上の本が$count冊、本棚で待っています。',
      one: '$pagesページ以上の本が1冊、本棚で待っています。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$year年より前に出版された本が$count冊、本棚で待っています。',
      one: '$year年より前に出版された本が1冊、本棚で待っています。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author: 完了$finished冊、本棚にあと$count冊。';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$languageの本が$count冊、本棚で待っています。',
      one: '$languageの本が1冊、本棚で待っています。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$year年はこれまでに$countか月読書しました。',
      one: '$year年はこれまでに1か月読書しました。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '残りは$monthsです。',
      one: '残りは$monthsです。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return '$pagesページ以上の本は、まだ本棚にありません。';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return '$year年より前に出版された本は、本棚にありません。';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '本棚はまだ$countつの年代にしか及んでいません。',
      one: '本棚はまだ1つの年代にしか及んでいません。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '本棚はまだ$countつの世紀にしか及んでいません。',
      one: '本棚はまだ1つの世紀にしか及んでいません。',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return '$monthに読書しなかったため、$year年は達成できません。カウントは1月に再開します。';
  }

  @override
  String get achievementsSwitch => '実績';

  @override
  String get achievementsSwitchSubtitle =>
      'BookOrbitで実績を記録します。オフにすると、こことWebで非表示になります。';

  @override
  String get achievementsTurnedOn => '実績をオンにしました';

  @override
  String get achievementsTurnedOff => '実績をオフにしました';

  @override
  String get achievementsSwitchFailed => 'BookOrbitの実績設定を変更できませんでした';

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
  String get recentSearchesTitle => '最近の検索';

  @override
  String get recentSearchesClear => '消去';

  @override
  String get recentSearchesRemove => '削除';

  @override
  String get removedSeriesTapToUndo => '「シリーズの続き」から削除しました。タップで元に戻します。';

  @override
  String get seriesBackOnContinueSeries => '「シリーズの続き」に戻しました';

  @override
  String get desktopShortcutPlayPause => '再生 / 一時停止';

  @override
  String get desktopShortcutRewind => '巻き戻し';

  @override
  String get desktopShortcutForward => '早送り';

  @override
  String get desktopShortcutSlower => '再生速度を下げる';

  @override
  String get desktopShortcutFaster => '再生速度を上げる';

  @override
  String get desktopShortcutNormalSpeed => '再生速度をリセット';

  @override
  String get desktopShortcutSearch => '検索を開く';

  @override
  String get desktopShortcutLibrary => 'ライブラリを開く';

  @override
  String get desktopShortcutNowPlaying => '再生中画面を開く';

  @override
  String get desktopShortcutFullScreen => '全画面表示';

  @override
  String get desktopShortcutClosePlayer => '全画面プレーヤーを閉じる';

  @override
  String get desktopShortcutBack => '戻る (一番上のページまたはシートを閉じる)';

  @override
  String get desktopShortcutRefresh => '表示中のリストを更新';

  @override
  String get desktopShortcutPreviousCard => '前の Absorbing カード';

  @override
  String get desktopShortcutNextCard => '次の Absorbing カード';

  @override
  String get desktopShortcutContextMenu => '長押しメニューを開く';

  @override
  String get desktopShortcutMouseBack => 'マウスの戻るボタン';

  @override
  String get desktopShortcutRightClick => '右クリック';

  @override
  String get desktopShortcutDragShelves => 'シェルフとカードを横にドラッグ';

  @override
  String get desktopShortcutMouseDrag => 'クリックしてドラッグ';

  @override
  String get fileHealthAction => 'ファイルをチェック';

  @override
  String get fileHealthTitle => 'ファイルをチェック';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ファイルすべてに問題はありません',
      one: 'ファイルに問題はありません',
      zero: '問題は見つかりませんでした',
    );
    return '$_temp0';
  }

  @override
  String fileHealthProblems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '問題が $count 件見つかりました',
      one: '問題が 1 件見つかりました',
    );
    return '$_temp0';
  }

  @override
  String get fileHealthReadOnlyNote => 'サーバーがすでに報告している内容を読み取るだけで、何も変更しません。';

  @override
  String get fileHealthLocalChecked => 'このデバイスのダウンロード済みファイルもチェックしました。';

  @override
  String get fileHealthItemMissing => '本のフォルダーが見つかりません';

  @override
  String get fileHealthItemMissingInfo =>
      'サーバーでこの本のフォルダーが見つかりません。移動、名前変更、削除されたか、ドライブがオフラインの可能性があります。サーバーでライブラリをスキャンすると再び見つかることがあります。';

  @override
  String get fileHealthItemInvalid => '本が無効とされています';

  @override
  String get fileHealthItemInvalidInfo =>
      'サーバーはこの本の使えるオーディオ/電子書籍ファイルを見つけられませんでした。';

  @override
  String get fileHealthInvalidFiles => '読み取れないファイル';

  @override
  String get fileHealthInvalidFilesInfo =>
      'サーバーがこれらのファイルを読み取れませんでした。破損しているか、非対応の形式の可能性があり、再生が止まったりスキップされたりすることがあります。';

  @override
  String get fileHealthEmptyFiles => '長さのないファイル';

  @override
  String get fileHealthEmptyFilesInfo =>
      'これらのファイルは長さがゼロと報告されており、再生できるものがありません。空か、途中で切れていることがよくあります。';

  @override
  String get fileHealthTrackGaps => 'ファイル間の隙間';

  @override
  String get fileHealthTrackGapsInfo =>
      'これらのファイルの間で本のタイムラインが飛んでおり、何も再生されない区間があります。';

  @override
  String get fileHealthTrackOverlaps => '重なっているファイル';

  @override
  String get fileHealthTrackOverlapsInfo =>
      'これらのファイルは本のタイムライン上で重なっているため、一部がスキップされたり、位置が飛んだりすることがあります。';

  @override
  String get fileHealthDurationMismatch => '長さが合いません';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return 'ファイルの合計は $actual ですが、本の長さは $expected となっています。進捗やチャプターがずれることがあります。サーバーで再スキャンすると通常は直ります。';
  }

  @override
  String get fileHealthLowBitrate => '低品質のオーディオ';

  @override
  String get fileHealthLowBitrateInfo =>
      'これらのファイルは 32 kbps 未満でエンコードされており、こもって聞こえることがあります。';

  @override
  String get fileHealthMixedSampleRates => 'サンプルレートが混在';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      'ファイルが異なるサンプルレートで録音されています。ほとんどのプレーヤーは対応しますが、ファイルの切り替わりでノイズが入ったり速度が変わったりする場合があります。';

  @override
  String get fileHealthMixedChannels => 'モノラルとステレオが混在';

  @override
  String get fileHealthMixedChannelsInfo =>
      '一部のファイルはチャンネル数が他と異なるため、ファイルの間で音が変わることがあります。';

  @override
  String get fileHealthChaptersPastEnd => '終端を過ぎたチャプター';

  @override
  String get fileHealthChaptersPastEndInfo =>
      'これらのチャプターはオーディオの終了後に始まる、または終わるため、ジャンプしても何も起こらないことがあります。';

  @override
  String get fileHealthLocalMissing => 'ダウンロード済みファイルがありません';

  @override
  String get fileHealthLocalMissingInfo =>
      'これらのダウンロード済みファイルがこのデバイスにありません。オフライン再生では、その部分が再生できません。';

  @override
  String get fileHealthLocalSizeMismatch => 'ダウンロード済みファイルが異なります';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      'これらのダウンロード済みファイルはサーバー上のコピーとサイズが異なるため、不完全または破損している可能性があります。';

  @override
  String fileHealthStartsAt(String time) {
    return '$time に開始';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return 'この端末 $local、サーバー $server';
  }

  @override
  String fileHealthSampleRate(String value) {
    return '$value kHz';
  }

  @override
  String get fileHealthMono => 'モノラル';

  @override
  String get fileHealthStereo => 'ステレオ';

  @override
  String get fileHealthRedownload => 'この本を再ダウンロード';

  @override
  String get fileHealthRedownloadQuestion => 'この本を再ダウンロードしますか?';

  @override
  String get fileHealthRedownloadInfo =>
      'このデバイス上のコピーを削除し、サーバーから再ダウンロードします。再生中の場合は停止します。サーバー上のデータは変更されません。';

  @override
  String get fileHealthNotAvailableOffline => '再ダウンロードするにはサーバーに接続してください';

  @override
  String get playerReconnecting => '接続が切れました。再接続しています…';

  @override
  String get playerReconnectFailed => 'サーバーに再接続できなかったため、再生を停止しました。';

  @override
  String get downloadsFailed => '失敗したダウンロード';

  @override
  String get absorbingReorderQueue => 'キューを並べ替え';

  @override
  String get playAction => '再生';

  @override
  String get pauseAction => '一時停止';

  @override
  String get rmabImportBooks => '本をインポート';

  @override
  String get rmabImportBooksSubtitle => 'ReadMeABookを検索してリクエストする本を選択します';

  @override
  String get rmabImportBooksConnectSubtitle =>
      '先にURLとトークンでReadMeABookに接続してください';

  @override
  String get windowsSettingsTitle => 'Windows設定';

  @override
  String get updateCheckFrequency => '自動アップデート確認';

  @override
  String get updateCheckFrequencySubtitle => 'アップデートの確認のみ行います。インストールは常に手動です。';

  @override
  String get updateCheckOnStartup => '起動時（12時間に1回）';

  @override
  String get updateCheckEverySixHours => '6時間ごと';

  @override
  String get updateCheckEveryTwelveHours => '12時間ごと';

  @override
  String get updateCheckDaily => '毎日';

  @override
  String get updateCheckNever => '自動では確認しない';

  @override
  String onLatestVersionDetail(String version) {
    return '最新バージョン（$version）です';
  }

  @override
  String get updateCheckFailed =>
      'GitHubに接続してアップデートを確認できませんでした。接続を確認して、もう一度お試しください。';

  @override
  String get playlistDetailAddBooks => 'プレイリストに本を追加';

  @override
  String get playlistDetailSwitchToList => 'リスト表示に切り替え';

  @override
  String get playlistDetailSwitchToGrid => 'グリッド表示に切り替え';

  @override
  String get adminUploadIndexing =>
      'アップロード完了。Audiobookshelfのインデックス作成を待っています...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return '「$title」をアップロードしました。Audiobookshelfがインデックスを作成中です';
  }

  @override
  String get adminUploadPermissionDenied =>
      'あなたのAudiobookshelfアカウントにはアップロード権限がありません。サーバー管理者にアップロード権限の有効化を依頼してください。';

  @override
  String get uiThemeLabel => 'UIテーマ';

  @override
  String get uiThemePickerTitle => '外観を選択';

  @override
  String get uiThemePickerIntro => '設定 > 外観 > UIテーマでいつでも変更できます。';

  @override
  String get uiThemePlusName => '標準';

  @override
  String get uiThemePlusDescription =>
      '塗りつぶしのパネルと、カバーの色によるやわらかな光が特徴の、いつものAbsorb Plusの外観です。';

  @override
  String get uiThemeMidnightName => 'ミッドナイト';

  @override
  String get uiThemeMidnightDescription => '細い枠線で光のない純黒。OLED画面向けです。';

  @override
  String get uiThemeContinue => '続ける';

  @override
  String get uiThemeFrostedName => 'フロスト';

  @override
  String get uiThemeFrostedDescription => 'カバーの色が透けて光る、やわらかなすりガラス風のパネルです。';

  @override
  String get uiThemeColorTitle => '色を選択';

  @override
  String get uiThemeColorIntro => '設定 > 外観 > 色のソースと同じ設定です。';

  @override
  String get uiThemeColorFromCover => 'カバーから';

  @override
  String get uiThemeBack => '戻る';

  @override
  String get uiThemeTryIt => '試す';

  @override
  String uiThemePreviewing(String name) {
    return '$nameをプレビュー中';
  }

  @override
  String get uiThemeKeep => 'このまま使う';

  @override
  String get uiThemeGoBack => '元に戻す';

  @override
  String get uiThemeGlass => 'ガラス';

  @override
  String get uiThemeGlassLight => '弱';

  @override
  String get uiThemeGlassMedium => '中';

  @override
  String get uiThemeGlassStrong => '強';

  @override
  String get uiThemeDetails => '外観の詳細';

  @override
  String get uiThemeFullCovers => 'フル画質のカバー';

  @override
  String get uiThemeFullCoversSubtitle => 'より鮮明になりますが、メモリを多く使用します';

  @override
  String get uiThemeExtraBadges => '追加のカバーバッジ';

  @override
  String get uiThemeExtraBadgesSubtitle => '電子書籍バッジと、「続きを聴く」の保存済みストリップ';

  @override
  String get uiThemeReadingShelf => '「続きを読む」を棚で表示';

  @override
  String get uiThemeReadingShelfSubtitle => '大きなカードではなく、通常のホームの棚にします';

  @override
  String get uiThemeCompactHeader => 'コンパクトなヘッダーボタン';

  @override
  String get uiThemeCompactHeaderSubtitle => 'ページヘッダーのボタンを小さいサイズのままにします';

  @override
  String get uiThemePlainWording => 'わかりやすい表現';

  @override
  String get uiThemePlainWordingOnSubtitle => '「再生」「再生中」「完了」を使用';

  @override
  String get uiThemePlainWordingOffSubtitle =>
      '「Absorb」「Absorbing」「Fully Absorbed」を使用';

  @override
  String get uiThemeSearchClassic => 'クラシック';

  @override
  String whatsNewSheetTitle(String name) {
    return '$nameの新機能';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return '$nameからアップデートしました';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return 'ビルド$number';
  }

  @override
  String get whatsNewFullNotes => 'GitHubで全文を見る';

  @override
  String get whatsNewLoading => '新機能を読み込み中';

  @override
  String get whatsNewLoadFailed => 'ノートを読み込めませんでした';

  @override
  String get whatsNewLoadFailedHint => '接続を確認するか、GitHubでご覧ください。';

  @override
  String get whatsNewOpenGitHub => 'GitHubで開く';

  @override
  String get settingsSeeWhatsNew => '新機能を見る';

  @override
  String get settingsSeeWhatsNewSubtitle => 'このバージョンのリリースノート';

  @override
  String get windowsCloseToTray => 'トレイに閉じる';

  @override
  String get windowsCloseToTraySubtitle =>
      'ウィンドウを閉じても、Absorb Plusは通知領域で動作し続けます。終了はトレイアイコンから行います。';

  @override
  String get windowsStartWithWindows => 'Windowsと同時に起動';

  @override
  String get windowsStartWithWindowsSubtitle =>
      'WindowsにサインインしたときにAbsorb Plusを開きます';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return '起動: $command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return '別のコピーが起動するよう設定されています: $command。このコピーを使うにはオンにしてください。';
  }

  @override
  String get windowsStartupDisabledBySystem =>
      'タスクマネージャーのスタートアップアプリでオフになっています。そこでオンに戻してください。';

  @override
  String get windowsStartMinimized => '最小化して起動';

  @override
  String get windowsStartMinimizedSubtitle =>
      'Windowsと同時に起動するとき、トレイに格納します（トレイに閉じるがオフの場合は最小化）';

  @override
  String get windowsAlwaysOnTop => '常に手前に表示';

  @override
  String get windowsAlwaysOnTopSubtitle => 'ウィンドウを他のウィンドウより前面に保ちます';

  @override
  String get windowsKeepAwake => '再生中・ダウンロード中はPCをスリープさせない';

  @override
  String get windowsKeepAwakeSubtitle => 'PCがスリープ状態になるのを防ぎます。画面はオフになることがあります。';

  @override
  String get windowsSettingFailed => 'Windowsがこの変更を受け付けませんでした';

  @override
  String get windowsGlobalHotkeys => 'グローバルホットキー';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Absorb Plusがバックグラウンドでも動作します: Ctrl+Alt+Spaceで再生/一時停止、Ctrl+Alt+Left/Rightで戻る/進む、Ctrl+Alt+Up/Downで音量、Ctrl+Alt+Bでブックマークを追加';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return '他のアプリが使用中のため利用できません: $keys';
  }

  @override
  String get windowsTrayShow => 'Absorb Plusを表示';

  @override
  String get windowsTrayQuit => 'Absorb Plusを終了';

  @override
  String get windowsTaskbarPlay => '再生';

  @override
  String get windowsTaskbarPause => '一時停止';

  @override
  String get windowsTaskbarRewind => '巻き戻し';

  @override
  String get windowsTaskbarForward => '早送り';

  @override
  String windowsJumpListResume(String title) {
    return '$titleを再開';
  }

  @override
  String get githubProjectTitle => 'GitHubのAbsorb Plus';

  @override
  String get precacheTitle => 'カバーと本のページを先読み';

  @override
  String get precacheSubtitle =>
      'Wi-Fiまたは有線接続時にバックグラウンドで取得し、画面をすぐに開けるようにします。メモリではなく、少しのディスク容量を使用します。';

  @override
  String get githubProjectSubtitle => 'リリース、ソースコード、プロジェクトのニュース';

  @override
  String get supportSaveLogsSubtitle => 'GitHubのIssueに添付するログファイルを保存します';

  @override
  String get supportSaveLogsDialogTitle => 'Absorb Plusのログを保存';

  @override
  String supportLogsSaved(String path) {
    return 'ログを$pathに保存しました';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return 'ログを保存できませんでした: $error';
  }

  @override
  String get supportOpenLogsFolder => 'ログフォルダーを開く';

  @override
  String get supportOpenLogsFolderSubtitle => 'ログファイルをファイルマネージャーで表示します';

  @override
  String get supportOpenLogsFolderFailed => 'ログフォルダーを開けませんでした';

  @override
  String get desktopDownloadFolderOpen => 'エクスプローラーで開く';

  @override
  String get desktopDownloadFolderOpenLinux => 'フォルダーを開く';

  @override
  String get desktopDownloadFolderOpenFailed => 'フォルダーを開けませんでした';

  @override
  String get desktopDownloadFolderNotWritable =>
      'Absorbはそのフォルダーにファイルを保存できません。別のフォルダーを選択してください。';

  @override
  String get desktopDownloadFolderPickFailed => 'フォルダー選択を表示できませんでした';

  @override
  String get desktopDownloadFolderNetworkPath =>
      'ネットワークフォルダー（\\\\server\\share）にはダウンロードを保存できません。ファイルエクスプローラーで共有をZ:などのドライブ文字に割り当て、そちらを選択してください。';

  @override
  String get desktopDownloadFolderDefault => '既定のフォルダー';

  @override
  String get bookSettingsTitle => '本の設定';

  @override
  String bookSettingsSeries(String name) {
    return 'シリーズ: $name';
  }

  @override
  String get bookSettingsSpeed => '速度';

  @override
  String get bookSettingsSpeedFromSeries => 'このシリーズで最後に再生した本から引き継ぎます';

  @override
  String get bookSettingsSkipIntro => 'イントロをスキップ';

  @override
  String get bookSettingsSkipIntroHint => '本を最初から再生するときのみ';

  @override
  String get bookSettingsSkipOutro => 'アウトロをスキップ';

  @override
  String get bookSettingsSkipOutroHint => '本を早めに終了し、完了にします';

  @override
  String get bookSettingsSkipOff => 'オフ';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds秒';
  }

  @override
  String get bookSettingsWholeSeries => 'シリーズ全体に適用';

  @override
  String get bookSettingsWholeSeriesHint => 'イントロとアウトロをこのシリーズのすべての本に適用します';

  @override
  String get bookSettingsReset => 'リセット';

  @override
  String get bookSettingsResetDone => '本の設定をリセットしました';

  @override
  String get adminDashTitle => 'ダッシュボード';

  @override
  String get adminDashSubtitle => '再生中のユーザー、ライブラリ、ユーザー、サーバーの警告をひと目で確認';

  @override
  String get adminDashNobodyListening => '現在、再生中のユーザーはいません';

  @override
  String adminDashOnlineNames(String names) {
    return 'オンライン: $names';
  }

  @override
  String get adminDashListeningHistory => '再生履歴';

  @override
  String get adminDashCouldNotLoad => 'サーバーから読み込めませんでした';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件',
      one: '1件',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => 'すべてスキャン';

  @override
  String get adminDashScanAllTitle => 'すべてのライブラリをスキャンしますか？';

  @override
  String get adminDashScanAllContent =>
      'Audiobookshelfがすべてのライブラリで、新規・変更・欠落したファイルを探します。大きなライブラリでは時間がかかることがあります。';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個のライブラリのスキャンを開始しました',
      one: '1個のライブラリのスキャンを開始しました',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return '$total件中$failed件のスキャンを開始できませんでした';
  }

  @override
  String get adminDashNoLibraries => 'ライブラリはまだありません';

  @override
  String get adminDashBackUpNow => '今すぐバックアップ';

  @override
  String adminDashLastBackup(String time) {
    return '前回のバックアップ: $time';
  }

  @override
  String get adminDashNoBackups => 'バックアップはまだありません';

  @override
  String get adminDashManageUsers => 'ユーザーを管理';

  @override
  String get adminDashNeverSeen => 'サインイン履歴なし';

  @override
  String get adminDashDisabled => '無効';

  @override
  String get adminDashLocked => 'ロック中';

  @override
  String get adminDashServerWarnings => 'サーバーの警告';

  @override
  String get adminDashNoProblems => '今日のログに警告やエラーはありません';

  @override
  String get adminDashAllLogs => 'すべてのサーバーログ';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale（内蔵）';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => 'キーボードショートカット';

  @override
  String get desktopShortcutsSubtitle => '再生、速度、検索、ナビゲーションの操作';

  @override
  String get desktopShortcutsClose => '閉じる';

  @override
  String get tailscaleConnect => 'Tailscaleで接続';

  @override
  String get tailscaleConnectHint => 'ブラウザーでTailscaleのログインを開きます';

  @override
  String get tailscaleTurnOff => 'オフにする';

  @override
  String get tailscaleCardPitch => 'TailscaleのVPNをオンにせずに、tailnet上のサーバーに接続します';

  @override
  String get tailscaleIntro =>
      'TailscaleアプリのVPNをオンにせずに、tailnet上のサーバーに接続します。Absorbは独自のデバイスとしてtailnetに参加し、自身の接続にのみ使用します。テスト機能で、既定ではオフです。';

  @override
  String get tailscaleUseSwitch => '内蔵Tailscaleを使用';

  @override
  String get tailscaleStatusOff => 'オフ';

  @override
  String get tailscaleStatusStarting => '接続中…';

  @override
  String get tailscaleStatusNeedsLogin => 'このデバイスをtailnetに追加するにはサインインしてください';

  @override
  String get tailscaleStatusNeedsApproval => '管理者がこのデバイスを承認するのを待っています';

  @override
  String tailscaleStatusConnected(String user) {
    return '$userとして接続済み';
  }

  @override
  String get tailscaleStatusConnectedNoUser => '接続済み';

  @override
  String tailscaleStatusError(String error) {
    return '問題: $error';
  }

  @override
  String get tailscaleNotIncluded => 'このビルドには含まれていません';

  @override
  String get tailscaleSignIn => 'Tailscaleでサインイン';

  @override
  String get tailscaleSignInNoLink => 'サインインリンクはまだありません。しばらくしてからもう一度お試しください。';

  @override
  String get tailscaleToggleFailed => '内蔵Tailscaleをオン/オフにできませんでした。もう一度お試しください。';

  @override
  String get tailscaleSignOut => 'Tailscaleからサインアウト';

  @override
  String tailscaleDeviceAddress(String address) {
    return 'このデバイス: $address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return 'サーバー（$server）にはTailscale経由で接続しています。';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return 'サーバー（$server）はtailnetのアドレスではないため、通常どおり接続します。tailnet上にある場合は、下にホスト名を追加してください。';
  }

  @override
  String get tailscaleExtraHostsLabel => 'その他のtailnetホスト名';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      '100.64.0.0/10のアドレスと、.ts.netまたはtailnetのMagicDNS名で終わる名前は、常にTailscale経由になります。名前はカンマで区切ります。';

  @override
  String playerChapterEndsAt(String time) {
    return 'チャプター終了: $time';
  }

  @override
  String playerEndsAt(String time) {
    return '終了: $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return '最後の再生: $device · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return '最後の再生: 別のデバイス · $ago';
  }

  @override
  String get opmlExportAction => 'OPMLをエクスポート';

  @override
  String get opmlExportDialogTitle => 'ポッドキャストのフィードをOPMLとして保存';

  @override
  String opmlExportSaved(String path) {
    return 'OPMLを$pathに保存しました';
  }

  @override
  String get opmlExportDownloaded => 'OPMLをダウンロードしました';

  @override
  String get opmlExportFailed => 'OPMLファイルをエクスポートできませんでした';

  @override
  String get bookCopySaveAction => 'コピーを保存…';

  @override
  String get bookCopyDialogTitle => 'この本のコピーを保存';

  @override
  String get bookCopySaving => 'コピーを保存中…';

  @override
  String bookCopySaved(String path) {
    return 'コピーを$pathに保存しました';
  }

  @override
  String get bookCopyFailed => 'この本のコピーを保存できませんでした';

  @override
  String get exclusiveAudioTitle => '排他オーディオ';

  @override
  String get exclusiveAudioSubtitle =>
      'Windowsのサウンドエフェクトを経由しないことで、ノイズや音量の乱れを改善します。Absorbの再生中は他のアプリがミュートされます。反映するにはAbsorbを再起動してください。';

  @override
  String get exclusiveAudioFallback =>
      'Your sound device refused exclusive audio, so Absorb is playing in normal mode';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return '新規$count件';
  }

  @override
  String seekUndoBackTo(String time) {
    return '$timeに戻る';
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
  String get autoDownloadNextInSeries => 'シリーズの次の本を自動でダウンロード';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      '再生中の本が80%に達したか、残り1時間未満になったときに行います。Wi-Fiのみの設定に従います。';

  @override
  String get emptyStateBrowseLibrary => 'ライブラリを見る';

  @override
  String get emptyStateClearSearch => '検索をクリア';

  @override
  String get statsNoListeningYet => 'まだ再生していません';

  @override
  String get desktopShortcutQuickSwitcher => 'クイックスイッチャー: 本を探す、どこへでも移動';

  @override
  String get desktopShortcutHelp => 'キーボードショートカットを表示';

  @override
  String get quickSwitcherTooltip => 'クイックスイッチャー（Ctrl+K）';

  @override
  String get quickSwitcherHint => 'このライブラリを検索、またはコマンドを入力';

  @override
  String get quickSwitcherNoResults => '一致なし';

  @override
  String get quickSwitcherGoHome => 'ホームへ移動';

  @override
  String get quickSwitcherGoLibrary => 'ライブラリへ移動';

  @override
  String get quickSwitcherGoAbsorbing => 'Absorbingへ移動';

  @override
  String get quickSwitcherGoStats => '統計へ移動';

  @override
  String get quickSwitcherGoSettings => '設定へ移動';

  @override
  String get quickSwitcherGoDownloads => 'ダウンロードへ移動';

  @override
  String get quickSwitcherPlayPause => '再生 / 一時停止';

  @override
  String get quickSwitcherSleepTimer => 'スリープタイマー';

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
  String get quickSwitcherKindBook => '本';

  @override
  String get quickSwitcherKindPodcast => 'ポッドキャスト';

  @override
  String get quickSwitcherKindSeries => 'シリーズ';

  @override
  String get quickSwitcherKindAuthor => '著者';

  @override
  String get alphabetScrollerLabel => '文字へジャンプ';

  @override
  String get stepperDecrease => '減らす';

  @override
  String get stepperIncrease => '増やす';

  @override
  String get statsStreakKeepGoing => '今日5分聴くと連続記録が続きます';

  @override
  String get statsStreakHowTo => '毎日5分聴くと連続記録になります';

  @override
  String get statsDailyGoalSheetTitle => '1日の再生目標';

  @override
  String get statsDailyGoalSheetBody => '今日聴くと、連続記録カードのリングが満たされていきます。';

  @override
  String get statsDailyGoalSet => '1日の目標を設定';

  @override
  String get statsMonthListened => '再生';

  @override
  String get statsMonthTime => '時間';

  @override
  String get statsMonthTopBook => '上位の本';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の結果',
      one: '1件の結果',
      zero: '結果なし',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => '並べ替えとグループ化';

  @override
  String get bookmarksViewByBook => '本ごと';

  @override
  String get bookmarksViewNewest => '新しい順';

  @override
  String get bookmarksViewPosition => '位置順';

  @override
  String get bookmarksExportAction => 'ブックマークをエクスポート';

  @override
  String get bookmarksExportDialogTitle => 'ブックマークをMarkdownとして保存';

  @override
  String bookmarksExportSaved(String path) {
    return 'ブックマークを$pathに保存しました';
  }

  @override
  String get bookmarksExportDownloaded => 'ブックマークをダウンロードしました';

  @override
  String get bookmarksExportFailed => 'ブックマークをエクスポートできませんでした';

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
