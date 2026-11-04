// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'A B S O R B';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get stillOffline => 'Ainda offline. Toque para tentar novamente.';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get listsNone => 'Nenhuma coleção ou playlist';

  @override
  String get listsNoneHint =>
      'Coleções e playlists são criadas no seu servidor Audiobookshelf e aparecem aqui.';

  @override
  String get listsLoadFailed => 'Não foi possível carregar suas listas';

  @override
  String get listsLoadFailedHint =>
      'O Absorb não conseguiu acessar seu servidor para obter coleções e playlists.';

  @override
  String get listsNoneBookOrbit => 'Nenhuma coleção ou Smart Scope';

  @override
  String get listsNoneHintBookOrbit =>
      'Coleções e Smart Scopes são criados no seu servidor BookOrbit e aparecem aqui.';

  @override
  String get listsLoadFailedHintBookOrbit =>
      'O Absorb não conseguiu acessar seu servidor para obter coleções e Smart Scopes.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Excluir';

  @override
  String get remove => 'Remover';

  @override
  String get save => 'Salvar';

  @override
  String get done => 'Concluído';

  @override
  String get edit => 'Editar';

  @override
  String get search => 'Pesquisar';

  @override
  String get apply => 'Aplicar';

  @override
  String get enable => 'Ativar';

  @override
  String get clear => 'Limpar';

  @override
  String get off => 'Desligado';

  @override
  String get disabled => 'Desativado';

  @override
  String get later => 'Depois';

  @override
  String get whatsNewTitle => 'O Absorb foi atualizado';

  @override
  String whatsNewContent(String version) {
    return 'Você agora está na versão $version.';
  }

  @override
  String get whatsNewButton => 'Ver novidades';

  @override
  String get whatsNewKeepShowing => 'Mostrar após cada atualização';

  @override
  String get whatsNewKeepShowingHint =>
      'Você pode reativar isso nas Configurações';

  @override
  String get settingsWhatsNew => 'Mostrar novidades após atualizações';

  @override
  String get settingsWhatsNewSubtitle =>
      'Após uma atualização, mostrar as novidades no app';

  @override
  String get gotIt => 'Entendi';

  @override
  String get betaLoggingTitle => 'Os registros estão ativados';

  @override
  String get betaLoggingContent =>
      'Como esta é uma versão beta, o Absorb agora mantém registros para ajudar a localizar problemas. Eles ficam neste dispositivo, a menos que você os compartilhe.\n\nVocê pode enviá-los ou desativá-los nas Configurações, em Problemas e suporte. Se você os desativar, os próximos betas os manterão desativados.';

  @override
  String get preview => 'Pré-visualizar';

  @override
  String get or => 'ou';

  @override
  String get file => 'Arquivo';

  @override
  String get more => 'Mais';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get untitled => 'Sem título';

  @override
  String get noThanks => 'Não, obrigado';

  @override
  String get stay => 'Ficar';

  @override
  String get homeTitle => 'Início';

  @override
  String get continueListening => 'Continuar ouvindo';

  @override
  String get continueReading => 'Continuar lendo';

  @override
  String get continueSeries => 'Continuar série';

  @override
  String get recentlyAdded => 'Adicionados recentemente';

  @override
  String get listenAgain => 'Ouvir novamente';

  @override
  String get discover => 'Descobrir';

  @override
  String get newEpisodes => 'Novos episódios';

  @override
  String get downloads => 'Downloads';

  @override
  String get noDownloadedBooks => 'Nenhum livro baixado';

  @override
  String get yourLibraryIsEmpty => 'Sua biblioteca está vazia';

  @override
  String get downloadBooksWhileOnline =>
      'Baixe livros enquanto estiver online para ouvir offline';

  @override
  String get customizeHome => 'Personalizar Início';

  @override
  String get dragToReorderTapEye =>
      'Arraste para reordenar, toque no olho para mostrar/ocultar';

  @override
  String get loginTagline => 'Comece a Absorver';

  @override
  String get loginConnectToServer => 'Conecte-se ao seu servidor';

  @override
  String get loginServerAddress => 'Endereço do servidor';

  @override
  String get loginServerHint => 'meu.servidor.com';

  @override
  String get loginServerHelper =>
      'IP:porta também funciona (ex.: 192.168.1.5:13378)';

  @override
  String get loginCouldNotReachServer => 'Não foi possível acessar o servidor';

  @override
  String get loginAdvanced => 'Avançado';

  @override
  String get loginCustomHttpHeaders => 'Cabeçalhos HTTP personalizados';

  @override
  String get loginCustomHeadersDescription =>
      'Para túneis Cloudflare ou proxies reversos que exigem cabeçalhos extras. Adicione os cabeçalhos antes de informar a URL do servidor.';

  @override
  String get loginHeaderName => 'Nome do cabeçalho';

  @override
  String get loginHeaderValue => 'Valor';

  @override
  String get loginAddHeader => 'Adicionar cabeçalho';

  @override
  String get loginSelfSignedCertificates => 'Certificados autoassinados';

  @override
  String get loginTrustAllCertificates =>
      'Confiar em todos os certificados (para configurações autoassinadas / com CA personalizada)';

  @override
  String get loginApiKey => 'Chave de API';

  @override
  String get loginApiKeyDescription =>
      'Use uma chave de API gerada pelo administrador em vez de usuário/senha. Útil quando a renovação do token falha na sua conta.';

  @override
  String get loginWaitingForSso => 'Aguardando SSO...';

  @override
  String get loginRedirectUri => 'URI de redirecionamento: absorb://oauth';

  @override
  String get loginOrSignInManually => 'ou entre manualmente';

  @override
  String get loginUsername => 'Nome de usuário';

  @override
  String get loginUsernameRequired => 'Informe seu nome de usuário';

  @override
  String get loginPassword => 'Senha';

  @override
  String get loginSignIn => 'Entrar';

  @override
  String loginSignInAs(String username) {
    return 'Entrar como $username?';
  }

  @override
  String get loginSignInToServer => 'Entrar neste servidor?';

  @override
  String loginSignedInAs(String username) {
    return 'Conectado como $username';
  }

  @override
  String get adminCreateSetupFile => 'Compartilhar acesso';

  @override
  String adminSetupFileDescription(String username) {
    return 'Cria um link de acesso privado para $username que só funciona no app Absorb.';
  }

  @override
  String get adminSetupFileServerUrl =>
      'URL do servidor que o novo usuário usará';

  @override
  String get adminSetupFileNoteWithHeaders =>
      'Uma chave de API dedicada e seus cabeçalhos personalizados serão incluídos para que ele possa acessar o servidor. Trate o link como uma senha.';

  @override
  String get adminSetupFileNote =>
      'Uma chave de API dedicada será incluída. Trate o link como uma senha.';

  @override
  String get adminSetupFileCreate => 'Criar link';

  @override
  String get adminSetupFileSaveTitle => 'Salvar arquivo de configuração';

  @override
  String get adminSetupFileKeyError =>
      'Não foi possível criar uma chave de API para este usuário';

  @override
  String adminSetupFileSaved(String username) {
    return 'Arquivo de configuração de $username salvo';
  }

  @override
  String adminSetupFileFailed(String error) {
    return 'Falha ao criar o acesso: $error';
  }

  @override
  String get setupLinkShareTitle => 'Compartilhar acesso';

  @override
  String setupLinkShareDescription(String username) {
    return 'Envie este link privado ou peça que escaneiem o QR code para entrar como $username.';
  }

  @override
  String setupLinkPrivateWarning(String username) {
    return 'Qualquer pessoa com este link pode entrar como $username. Trate-o como uma senha.';
  }

  @override
  String get setupLinkShare => 'Compartilhar link';

  @override
  String get setupLinkCopy => 'Copiar link';

  @override
  String get setupLinkCopied => 'Link de acesso copiado';

  @override
  String get setupLinkSaveFile => 'Salvar arquivo de configuração';

  @override
  String get setupLinkQrError =>
      'Este link de configuração é grande demais para um QR code. Compartilhe o link.';

  @override
  String setupLinkShareSubject(String username) {
    return 'Acesso ao Absorb para $username';
  }

  @override
  String get setupLinkConfirmTitle => 'Entrar com este link?';

  @override
  String setupLinkConfirmBody(String server, String username) {
    return 'Entrar em $server como $username? Continue somente se confiar em quem enviou este link.';
  }

  @override
  String get setupLinkInvalid =>
      'Este link de acesso é inválido ou está incompleto';

  @override
  String get setupLinkSigningIn => 'Verificando link de acesso...';

  @override
  String get loginPlayDownloads => 'Reproduzir seus downloads';

  @override
  String signedOutDownloadsNote(String username) {
    return 'Você saiu da conta. Tudo o que ouvir aqui será sincronizado com $username quando você entrar novamente.';
  }

  @override
  String get loginPasteLink => 'Colar link de login';

  @override
  String get loginPasteLinkHelp =>
      'Cole o link de acesso completo que você recebeu. Trate-o como uma senha.';

  @override
  String get loginFailed => 'Falha no login';

  @override
  String get loginSsoFailed => 'O login SSO falhou ou foi cancelado';

  @override
  String get loginSsoAuthFailed =>
      'A autenticação SSO falhou. Tente novamente.';

  @override
  String get loginRestoreFromBackup => 'Importar';

  @override
  String get loginInvalidBackupFile => 'Arquivo de backup inválido';

  @override
  String get loginRestoreBackupTitle => 'Restaurar backup?';

  @override
  String loginRestoreBackupWithAccounts(int count) {
    return 'Isso restaurará todas as configurações e $count conta(s) salva(s). Você entrará automaticamente.';
  }

  @override
  String get loginRestoreBackupNoAccounts =>
      'Isso restaurará todas as configurações. Nenhuma conta foi incluída neste backup.';

  @override
  String get loginRestore => 'Restaurar';

  @override
  String loginRestoredAndSignedIn(String username) {
    return 'Configurações restauradas e conectado como $username';
  }

  @override
  String get loginSessionExpired =>
      'Configurações restauradas. Sessão expirada - entre para continuar.';

  @override
  String get loginSettingsRestored => 'Configurações restauradas';

  @override
  String loginRestoreFailed(String error) {
    return 'Falha na restauração: $error';
  }

  @override
  String get loginSavedAccounts => 'contas salvas';

  @override
  String get libraryTitle => 'Biblioteca';

  @override
  String get librarySearchBooksHint =>
      'Pesquisar livros, séries, autores, narradores...';

  @override
  String get librarySearchShowsHint => 'Pesquisar programas e episódios...';

  @override
  String get libraryTabLibrary => 'Biblioteca';

  @override
  String get libraryTabSeries => 'Séries';

  @override
  String get libraryTabAuthors => 'Autores';

  @override
  String get libraryTabNarrators => 'Narradores';

  @override
  String get libraryNoBooks => 'Nenhum livro encontrado';

  @override
  String get libraryNoUnfinishedBooks => 'Nenhum livro não concluído';

  @override
  String get libraryNoBooksInProgress => 'Nenhum livro em andamento';

  @override
  String get libraryNoFinishedBooks => 'Nenhum livro concluído';

  @override
  String get libraryAllBooksStarted => 'Todos os livros já foram iniciados';

  @override
  String get libraryNoDownloadedBooks => 'Nenhum livro baixado';

  @override
  String get libraryNoSeriesFound => 'Nenhuma série encontrada';

  @override
  String get libraryNoBooksWithEbooks => 'Nenhum livro com e-books';

  @override
  String get libraryNoBooksMissingMetadata =>
      'Nenhum livro está sem estes metadados';

  @override
  String get libraryNoItemsMatchingFilter =>
      'Nenhum item corresponde a este filtro';

  @override
  String libraryNoBooksInGenre(String genre) {
    return 'Nenhum livro em \"$genre\"';
  }

  @override
  String libraryNoBooksWithTag(String tag) {
    return 'Nenhum livro com a tag \"$tag\"';
  }

  @override
  String get libraryClearFilter => 'Limpar filtro';

  @override
  String get libraryNoAuthorsFound => 'Nenhum autor encontrado';

  @override
  String get libraryNoNarratorsFound => 'Nenhum narrador encontrado';

  @override
  String get libraryNoResults => 'Nenhum resultado encontrado';

  @override
  String get librarySearchBooks => 'Livros';

  @override
  String get librarySearchShows => 'Programas';

  @override
  String get librarySearchEpisodes => 'Episódios';

  @override
  String get librarySearchSeries => 'Séries';

  @override
  String get librarySearchAuthors => 'Autores';

  @override
  String get librarySearchTags => 'Tags';

  @override
  String get librarySearchGenres => 'Gêneros';

  @override
  String librarySeriesCount(int count) {
    return '$count séries';
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
    return '$loaded/$total livros';
  }

  @override
  String get sort => 'Ordenar';

  @override
  String get filter => 'Filtrar';

  @override
  String get filterActive => 'Filtro ●';

  @override
  String get name => 'Nome';

  @override
  String get title => 'Título';

  @override
  String get author => 'Autor';

  @override
  String get dateAdded => 'Data de adição';

  @override
  String get numberOfBooks => 'Número de livros';

  @override
  String get sortTotalDuration => 'Duração total';

  @override
  String get sortLastBookAdded => 'Último livro adicionado';

  @override
  String get sortLastBookUpdated => 'Último livro atualizado';

  @override
  String get publishedYear => 'Ano de publicação';

  @override
  String get duration => 'Duração';

  @override
  String get random => 'Aleatório';

  @override
  String get collapseSeries => 'Agrupar séries';

  @override
  String get notFinished => 'Não concluído';

  @override
  String get inProgress => 'Em andamento';

  @override
  String get filterFinished => 'Concluído';

  @override
  String get notStarted => 'Não iniciado';

  @override
  String get downloaded => 'Baixado';

  @override
  String get hasEbook => 'Tem e-book';

  @override
  String get noEbook => 'Sem e-book';

  @override
  String get hasSupplementaryEbook => 'Tem e-book complementar';

  @override
  String get noSupplementaryEbook => 'Sem e-book complementar';

  @override
  String get noSeries => 'Sem série';

  @override
  String get publishedDecade => 'Década de publicação';

  @override
  String get tracks => 'Faixas';

  @override
  String get noTracks => 'Sem faixas';

  @override
  String get singleTrack => 'Faixa única';

  @override
  String get multipleTracks => 'Várias faixas';

  @override
  String get abridged => 'Abreviado';

  @override
  String get issues => 'Problemas';

  @override
  String get rssFeedOpen => 'Feed RSS aberto';

  @override
  String get explicitContent => 'Explícito';

  @override
  String get missingMetadata => 'Metadados ausentes';

  @override
  String get genre => 'Gênero';

  @override
  String get tag => 'Tag';

  @override
  String get clearFilter => 'Limpar filtro';

  @override
  String get noGenresFound => 'Nenhum gênero encontrado';

  @override
  String get noTagsFound => 'Nenhuma tag encontrada';

  @override
  String get asc => 'CRESC.';

  @override
  String get desc => 'DECR.';

  @override
  String get fileSize => 'Tamanho do arquivo';

  @override
  String get lastUpdated => 'Última atualização';

  @override
  String get fileCreated => 'Arquivo criado';

  @override
  String get lastModified => 'Última modificação';

  @override
  String get authorFirstLast => 'Autor (Nome Sobrenome)';

  @override
  String get authorLastFirst => 'Autor (Sobrenome, Nome)';

  @override
  String get progressSort => 'Progresso';

  @override
  String get dateStarted => 'Data de início';

  @override
  String get dateFinished => 'Data de conclusão';

  @override
  String get episodeCount => 'Número de episódios';

  @override
  String get sequence => 'Sequência na série';

  @override
  String get absorbingTitle => 'Absorbing';

  @override
  String get absorbingStop => 'Parar';

  @override
  String get absorbingManageQueue => 'Gerenciar fila';

  @override
  String get absorbingDone => 'Concluído';

  @override
  String get absorbingNoDownloadedEpisodes => 'Nenhum episódio baixado';

  @override
  String get absorbingNoDownloadedBooks => 'Nenhum livro baixado';

  @override
  String get absorbingNothingPlayingYet => 'Nada em reprodução ainda';

  @override
  String get absorbingNothingAbsorbingYet => 'Nada em Absorbing ainda';

  @override
  String get absorbingDownloadEpisodesToListen =>
      'Baixe episódios para ouvir offline';

  @override
  String get absorbingDownloadBooksToListen =>
      'Baixe livros para ouvir offline';

  @override
  String get absorbingStartEpisodeFromShows =>
      'Inicie um episódio na aba Programas';

  @override
  String get absorbingStartBookFromLibrary =>
      'Inicie um livro na aba Biblioteca';

  @override
  String get carModeTitle => 'Modo carro';

  @override
  String get carModeNoBookLoaded => 'Nenhum livro carregado';

  @override
  String get carModeBookLabel => 'Livro';

  @override
  String get carModeChapterLabel => 'Capítulo';

  @override
  String get carModeBookmarkDefault => 'Marcador';

  @override
  String get carModeBookmarkAdded => 'Marcador adicionado';

  @override
  String get downloadsTitle => 'Downloads';

  @override
  String get downloadsCancelSelection => 'Cancelar seleção';

  @override
  String get downloadsSelect => 'Selecionar';

  @override
  String get downloadsNoDownloads => 'Nenhum download';

  @override
  String get downloadsDownloading => 'Baixando';

  @override
  String get downloadsQueued => 'Na fila';

  @override
  String get downloadsCompleted => 'Concluídos';

  @override
  String get downloadsEbooks => 'E-books';

  @override
  String get downloadsWaiting => 'Aguardando...';

  @override
  String get downloadsCancel => 'Cancelar';

  @override
  String get downloadsDelete => 'Excluir';

  @override
  String downloadsDeleteCount(int count) {
    return 'Excluir $count download(s)?';
  }

  @override
  String get downloadsDeleteContent =>
      'Os arquivos baixados serão removidos deste dispositivo.';

  @override
  String downloadsDeletedCount(int count) {
    return '$count download(s) excluído(s)';
  }

  @override
  String get downloadsRemoveTitle => 'Remover download?';

  @override
  String downloadsRemoveContent(String title) {
    return 'Excluir \"$title\" deste dispositivo?';
  }

  @override
  String downloadsRemovedTitle(String title) {
    return '\"$title\" removido';
  }

  @override
  String downloadFailedMissingFile(String title) {
    return 'Não foi possível baixar \"$title\" - um dos arquivos não está no servidor. Uma verificação da biblioteca pode resolver.';
  }

  @override
  String downloadFailedNoSpace(String title) {
    return 'Não foi possível baixar \"$title\" - espaço de armazenamento insuficiente';
  }

  @override
  String downloadFailedPermission(String title) {
    return 'Não foi possível baixar \"$title\" - verifique o local de download nas Configurações';
  }

  @override
  String downloadFailedGeneric(String title) {
    return 'Não foi possível baixar \"$title\"';
  }

  @override
  String downloadsSelectedCount(int count) {
    return '$count selecionado(s)';
  }

  @override
  String get bookmarksTitle => 'Todos os marcadores';

  @override
  String get bookmarksTabBookmarks => 'Marcadores';

  @override
  String get bookmarksTabHighlights => 'Destaques';

  @override
  String get highlightOpenInBook => 'Abrir no livro';

  @override
  String get highlightDeleteAction => 'Excluir destaque';

  @override
  String get highlightDeleted => 'Destaque excluído';

  @override
  String highlightsDeleteCount(int count) {
    return 'Excluir $count destaque(s)?';
  }

  @override
  String highlightsDeletedCount(int count) {
    return '$count destaque(s) excluído(s)';
  }

  @override
  String get quoteShareTitle => 'Compartilhar citação';

  @override
  String get quoteShareAction => 'Compartilhar';

  @override
  String get quoteShareFailed => 'Não foi possível criar a imagem da citação';

  @override
  String get quoteShapePortrait => 'Retrato';

  @override
  String get quoteShapeSquare => 'Quadrado';

  @override
  String get quoteShapeStory => 'Story';

  @override
  String get quoteStyleBlur => 'Desfocado';

  @override
  String get quoteStyleDim => 'Escurecido';

  @override
  String get quoteStyleNone => 'Capa simples';

  @override
  String get quoteTextLight => 'Texto claro';

  @override
  String get quoteTextDark => 'Texto escuro';

  @override
  String get quoteFieldTitle => 'Título';

  @override
  String get quoteFieldDetail => 'Detalhes';

  @override
  String get quoteFieldDetailHint => 'Autor, capítulo, página, quem disse';

  @override
  String highlightsMeta(String chapter, String date) {
    return '$chapter · $date';
  }

  @override
  String get bookmarksCancelSelection => 'Cancelar seleção';

  @override
  String get bookmarksSortedByNewest => 'Ordenados do mais recente';

  @override
  String get bookmarksSortedByPosition => 'Ordenados por posição';

  @override
  String get bookmarksSelect => 'Selecionar';

  @override
  String get bookmarksNoBookmarks => 'Nenhum marcador ainda';

  @override
  String get bookmarksSearchHint => 'Pesquisar marcadores';

  @override
  String get bookmarksNoMatches => 'Nenhum marcador corresponde à sua pesquisa';

  @override
  String batchDownloadQueued(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Baixando $count livros',
      one: 'Baixando 1 livro',
    );
    return '$_temp0';
  }

  @override
  String get batchDownloadNothingNew => 'Já baixado';

  @override
  String bookmarksDeleteCount(int count) {
    return 'Excluir $count marcador(es)?';
  }

  @override
  String get bookmarksDeleteContent => 'Esta ação não pode ser desfeita.';

  @override
  String bookmarksDeletedCount(int count) {
    return '$count marcador(es) excluído(s)';
  }

  @override
  String get bookmarksJumpTitle => 'Ir para o marcador?';

  @override
  String bookmarksJumpContent(String title, String position, String bookTitle) {
    return '\"$title\" em $position\nem $bookTitle';
  }

  @override
  String get bookmarksJump => 'Ir';

  @override
  String get bookmarksNotConnected => 'Não conectado ao servidor';

  @override
  String get bookmarksCouldNotLoad => 'Não foi possível carregar o livro';

  @override
  String bookmarksSelectedCount(int count) {
    return '$count selecionado(s)';
  }

  @override
  String get statsTitle => 'Suas estatísticas';

  @override
  String get statsCouldNotLoad => 'Não foi possível carregar as estatísticas';

  @override
  String get statsTotalListeningTime => 'TEMPO TOTAL DE AUDIÇÃO';

  @override
  String get statsHoursUnit => 'h';

  @override
  String get statsMinutesUnit => 'min';

  @override
  String get statsSecondsUnit => 's';

  @override
  String statsDaysOfAudio(String days) {
    return 'São $days dias de áudio';
  }

  @override
  String statsHoursOfAudio(String hours) {
    return 'São $hours horas de áudio';
  }

  @override
  String get statsToday => 'Hoje';

  @override
  String get statsThisWeek => 'Esta semana';

  @override
  String get statsThisMonth => 'Este mês';

  @override
  String get statsActivity => 'Atividade';

  @override
  String get statsCurrentStreak => 'Sequência atual';

  @override
  String get statsBestStreak => 'Melhor sequência';

  @override
  String get statsFinished => 'Concluídos';

  @override
  String get statsBooksFinished => 'Livros';

  @override
  String get statsEpisodesFinished => 'Episódios';

  @override
  String get statsBooksThisYear => 'Livros este ano';

  @override
  String get statsEpisodesThisYear => 'Episódios este ano';

  @override
  String get statsRemoveFromYearTitle => 'Remover deste ano';

  @override
  String statsRemoveFromYearWithDate(String date, String title) {
    return 'A data de conclusão continuará sendo $date no servidor. Isso apenas remove \"$title\" da sua lista de livros do ano no Absorb.';
  }

  @override
  String statsRemoveFromYearNoDate(String title) {
    return 'A data de conclusão permanece no servidor. Isso apenas remove \"$title\" da sua lista de livros do ano no Absorb.';
  }

  @override
  String get statsRemovedFromYear => 'Removido deste ano';

  @override
  String get statsAddBackToYearTitle => 'Adicionar de volta a este ano';

  @override
  String statsAddBackToYearBody(String title) {
    return 'Adicionar \"$title\" de volta à sua lista de livros do ano no Absorb?';
  }

  @override
  String get statsAddBack => 'Adicionar de volta';

  @override
  String get statsAddedBackToYear => 'Adicionado de volta a este ano';

  @override
  String get statsHiddenFromYear => 'Oculto neste ano';

  @override
  String get statsNothingHidden => 'Nada oculto';

  @override
  String get settingsCustomizeStats => 'Personalizar estatísticas';

  @override
  String get statsGoalTitle => 'Meta de audição';

  @override
  String get statsGoalOff => 'Desligada';

  @override
  String get statsGoalDaily => 'Diária';

  @override
  String get statsGoalWeekly => 'Semanal';

  @override
  String get statsGoalMonthly => 'Mensal';

  @override
  String get statsGoalTarget => 'Objetivo';

  @override
  String get statsGoalEnterTitle => 'Definir objetivo';

  @override
  String get statsGoalEnterTimeHint => 'Minutos ou h:mm';

  @override
  String statsBooksShort(int count) {
    return '$count livros';
  }

  @override
  String get statsBookChallengeTitle => 'Desafio de leitura';

  @override
  String get statsBookChallengeDesc => 'Livros a concluir este ano';

  @override
  String get statsDailyGoal => 'Meta diária';

  @override
  String get statsWeeklyGoal => 'Meta semanal';

  @override
  String get statsMonthlyGoal => 'Meta mensal';

  @override
  String statsGoalProgress(String done, String target) {
    return '$done / $target';
  }

  @override
  String statsBookChallengeProgress(int done, int target) {
    return '$done de $target livros';
  }

  @override
  String get statsGoalReached => 'Meta atingida';

  @override
  String get statsChartTitle => 'Gráfico de audição';

  @override
  String get statsChartBar => 'Barras';

  @override
  String get statsChartLine => 'Linha';

  @override
  String get statsChartHeatmap => 'Mapa de calor';

  @override
  String get statsChartDays7 => '7 dias';

  @override
  String get statsChartDays30 => '30 dias';

  @override
  String get statsLast30Days => 'Últimos 30 dias';

  @override
  String get statsThisYearTitle => 'Este ano';

  @override
  String get statsSectionsTitle => 'Seções';

  @override
  String get statsSectionTimePeriods => 'Períodos';

  @override
  String get statsHeatmapLess => 'Menos';

  @override
  String get statsHeatmapMore => 'Mais';

  @override
  String get statsDayOfWeek => 'Média por dia da semana';

  @override
  String get statsTimeSavedLabel => 'Economizado pela velocidade';

  @override
  String statsTimeSavedSince(String date) {
    return 'desde $date';
  }

  @override
  String get statsTimeSavedReset => 'Zerar tempo economizado';

  @override
  String get statsTimeSavedResetConfirm =>
      'O tempo economizado voltará a ser contado a partir de hoje.';

  @override
  String get statsTimeSavedResetDone => 'Tempo economizado zerado';

  @override
  String statsOnPaceFor(int count) {
    return 'No ritmo para $count livros';
  }

  @override
  String get statsDaysActive => 'Dias ativos';

  @override
  String get statsDailyAverage => 'Média diária';

  @override
  String get statsLast7Days => 'Últimos 7 dias';

  @override
  String get statsMostListened => 'Mais ouvidos';

  @override
  String get statsRecentSessions => 'Sessões recentes';

  @override
  String get appShellHomeTab => 'Início';

  @override
  String get appShellLibraryTab => 'Biblioteca';

  @override
  String get appShellAbsorbingTab => 'Absorbing';

  @override
  String get appShellStatsTab => 'Estatísticas';

  @override
  String get appShellSettingsTab => 'Configurações';

  @override
  String get appShellDiscoverTab => 'Descobrir';

  @override
  String get appShellShowsTab => 'Programas';

  @override
  String get appShellPodcastsTab => 'Podcasts';

  @override
  String get libraryTabEpisodes => 'Episódios';

  @override
  String get filterAllEpisodes => 'Todos';

  @override
  String get filterUnplayed => 'Não reproduzidos';

  @override
  String get episodeFeedEmpty => 'Nenhum episódio corresponde a este filtro';

  @override
  String get podcastFilterUpNext => 'A seguir';

  @override
  String get podcastFilterNew => 'Novos';

  @override
  String get settingsPodcastTab => 'Aba Podcasts';

  @override
  String get settingsPodcastTabDesc =>
      'Dê a uma biblioteca de podcasts sua própria aba na barra inferior';

  @override
  String get settingsPodcastTabLibrary => 'Biblioteca da aba Podcasts';

  @override
  String get settingsMergeImpliedByPodcastTab =>
      'Sempre ativado enquanto a aba Podcasts estiver ativa';

  @override
  String get settingsEpisodeNotifs => 'Configurações de notificação';

  @override
  String get settingsEpisodeNotifsDesc =>
      'Novos episódios de podcasts e próximos lançamentos de livros, verificados em segundo plano';

  @override
  String get notifIntervalOff => 'Desligado';

  @override
  String notifIntervalMinutes(int n) {
    return 'A cada $n minutos';
  }

  @override
  String get notifIntervalHour => 'A cada hora';

  @override
  String notifIntervalHours(int n) {
    return 'A cada $n horas';
  }

  @override
  String get settingsBatteryUnrestricted =>
      'Permitir uso irrestrito da bateria';

  @override
  String get settingsBatteryUnrestrictedDesc =>
      'Impede que o sistema pause as verificações em segundo plano em alguns celulares';

  @override
  String get appShellPressBackToExit => 'Pressione voltar novamente para sair';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get sectionAppearance => 'Aparência';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get languageSystemDefault => 'Padrão do sistema';

  @override
  String get languageHelpTranslateInvite =>
      'Quer ajudar a traduzir o Absorb para o seu idioma?';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeOled => 'OLED';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeAuto => 'Automático';

  @override
  String get colorSourceLabel => 'Fonte de cor';

  @override
  String get colorSourceCoverDescription =>
      'As cores do app seguem a capa do livro em reprodução';

  @override
  String get colorSourceWallpaperDescription =>
      'As cores do app seguem o papel de parede do sistema';

  @override
  String get colorSourceWallpaper => 'Papel de parede';

  @override
  String get colorSourceNowPlaying => 'Em reprodução';

  @override
  String get colorSourceDynamic => 'Dinâmica';

  @override
  String get colorSourceManual => 'Manual';

  @override
  String get colorSourceManualDescription =>
      'Usa uma cor fixa do app que você escolhe abaixo';

  @override
  String get colorSourceCustom => 'Personalizada';

  @override
  String get useColorEverywhereLabel => 'Usar esta cor em todo lugar';

  @override
  String get useColorEverywhereSubtitle =>
      'Também colore as páginas de detalhes do livro e o cartão do player com a cor escolhida, em vez da capa de cada livro';

  @override
  String get flatBackgroundLabel => 'Fundo liso';

  @override
  String get flatBackgroundSubtitle =>
      'Remove o gradiente do fundo. Preto puro no modo escuro para telas OLED.';

  @override
  String get einkModeLabel => 'Modo e-ink';

  @override
  String get einkModeSubtitle =>
      'Preto e branco de alto contraste, sem animações, feito para telas e-ink';

  @override
  String get einkModeIntroBody =>
      'Feito para telas e-ink. O app passa para um visual plano em preto e branco com alto contraste, as animações são desativadas, o cartão de reprodução perde o fundo e a conexão ao vivo com o servidor fica desligada para economizar bateria. A reprodução e o progresso continuam sincronizando normalmente. Suas configurações de aparência são mantidas e voltam quando você desativar este modo.';

  @override
  String get einkModeIntroConfirm => 'Ativar';

  @override
  String get backgroundIntensityLabel => 'Intensidade do fundo';

  @override
  String get startScreenLabel => 'Tela inicial';

  @override
  String get startScreenSubtitle => 'Qual aba abrir quando o app iniciar';

  @override
  String get startScreenHome => 'Início';

  @override
  String get startScreenLibrary => 'Biblioteca';

  @override
  String get startScreenAbsorb => 'Absorb';

  @override
  String get startScreenStats => 'Estatísticas';

  @override
  String get disablePageFade => 'Desativar esmaecimento de páginas';

  @override
  String get disablePageFadeOnSubtitle => 'As páginas trocam instantaneamente';

  @override
  String get disablePageFadeOffSubtitle =>
      'As páginas esmaecem ao trocar de aba';

  @override
  String get rectangleBookCovers => 'Capas retangulares';

  @override
  String get progressTextSize => 'Tamanho do texto de progresso';

  @override
  String get rectangleBookCoversOnSubtitle =>
      'As capas aparecem na proporção 2:3 de livro';

  @override
  String get rectangleBookCoversOffSubtitle => 'As capas são quadradas';

  @override
  String get coverSize => 'Tamanho da capa';

  @override
  String get coverSizeSubtitle =>
      'Quantas capas cabem na largura da grade da biblioteca';

  @override
  String get coverSizeSmall => 'Pequeno';

  @override
  String get coverSizeMedium => 'Médio';

  @override
  String get coverSizeLarge => 'Grande';

  @override
  String get sectionAbsorbingCards => 'Cartões do Absorbing';

  @override
  String get fullScreenPlayer => 'Player em tela cheia';

  @override
  String get fullScreenPlayerOnSubtitle =>
      'Ativado - os livros abrem em tela cheia ao reproduzir';

  @override
  String get fullScreenPlayerOffSubtitle =>
      'Desativado - reproduzir dentro do cartão';

  @override
  String get fullBookScrubber => 'Barra do livro completo';

  @override
  String get fullBookScrubberOnSubtitle =>
      'Ativado - controle deslizante com busca em todo o livro';

  @override
  String get fullBookScrubberOffSubtitle =>
      'Desativado - apenas barra de progresso';

  @override
  String get cardScrubbers => 'Barras do cartão';

  @override
  String get cardScrubbersBoth => 'Ambas';

  @override
  String get cardScrubbersChapter => 'Capítulo';

  @override
  String get cardScrubbersLocked => 'Bloqueadas';

  @override
  String get cardScrubbersBothSubtitle =>
      'As barras do livro completo e do capítulo permitem buscar';

  @override
  String get cardScrubbersChapterSubtitle =>
      'Somente a barra do capítulo permite buscar';

  @override
  String get cardScrubbersLockedSubtitle =>
      'O progresso é exibido sem permitir buscar';

  @override
  String get speedAdjustedTime => 'Tempo ajustado pela velocidade';

  @override
  String get speedAdjustedTimeOnSubtitle =>
      'Ativado - todos os tempos refletem a velocidade de reprodução';

  @override
  String get speedAdjustedTimeOffSubtitle =>
      'Desativado - mostrando a duração original do áudio';

  @override
  String get buttonLayout => 'Layout dos botões';

  @override
  String get buttonLayoutSubtitle =>
      'Como os botões de ação são organizados no cartão';

  @override
  String get whenAbsorbed => 'Ao concluir';

  @override
  String get whenAbsorbedInfoTitle => 'Ao concluir';

  @override
  String get whenAbsorbedInfoContent =>
      'Controla o que acontece com um cartão do Absorbing quando você termina um livro ou episódio.\n\nOs cartões concluídos são removidos automaticamente da sua tela Absorbing.';

  @override
  String get whenAbsorbedSubtitle =>
      'O que acontece com o cartão quando um livro ou episódio termina';

  @override
  String get whenAbsorbedShowOverlay => 'Mostrar sobreposição';

  @override
  String get whenAbsorbedAutoRelease => 'Liberar automaticamente';

  @override
  String get mergeLibraries => 'Página Absorbing unificada';

  @override
  String get mergeLibrariesInfoTitle => 'Página Absorbing unificada';

  @override
  String get mergeLibrariesInfoContent =>
      'Quando ativada, a tela Absorbing mostra todos os seus livros e podcasts em andamento de todas as bibliotecas em uma única visualização. Quando desativada, só aparecem itens da biblioteca atualmente selecionada.';

  @override
  String get mergeLibrariesOnSubtitle =>
      'A página Absorbing mostra itens de todas as bibliotecas';

  @override
  String get mergeLibrariesOffSubtitle =>
      'A página Absorbing mostra apenas a biblioteca atual';

  @override
  String get queueMode => 'Modo de fila';

  @override
  String get queueModeInfoTitle => 'Modo de fila';

  @override
  String get queueModeInfoOff => 'Desligado';

  @override
  String get queueModeInfoOffDesc =>
      'A reprodução para quando o livro ou episódio atual termina.';

  @override
  String get queueModeInfoManual => 'Fila manual';

  @override
  String get queueModeInfoManualDesc =>
      'Seus cartões do Absorbing funcionam como uma playlist. Quando um termina, o próximo cartão não concluído toca automaticamente. Adicione itens com o botão \"Adicionar ao Absorbing\" em um livro ou episódio e reordene na tela Absorbing.';

  @override
  String get queueModeOff => 'Desligado';

  @override
  String get queueModeManual => 'Manual';

  @override
  String get queueModeAuto => 'Automático';

  @override
  String get queueModePlaylist => 'Playlist';

  @override
  String get queueModeCollection => 'Coleção';

  @override
  String get queueModeInfoPlaylist => 'Fila de playlist';

  @override
  String get queueModeInfoPlaylistDesc =>
      'Reproduz os itens em ordem a partir de uma playlist escolhida, pulando o que já foi concluído. Para no fim da lista.';

  @override
  String get queuePlaylistPickerTitle => 'Escolha uma playlist';

  @override
  String get queuePlaylistNone => 'Nenhuma playlist selecionada';

  @override
  String queuePlaylistActiveLabel(String name) {
    return 'Playlist: $name';
  }

  @override
  String get queueModePlaylistHint =>
      'Inicie uma fila de playlist abrindo uma playlist na página inicial.';

  @override
  String get exit => 'Sair';

  @override
  String upNext(String label) {
    return 'A seguir: $label';
  }

  @override
  String get nothingUpNext => 'Nada a seguir';

  @override
  String get showUpNextLabel => 'Mostrar \"A seguir\" na página Absorbing';

  @override
  String get openSeries => 'Abrir série';

  @override
  String get openPlaylist => 'Abrir playlist';

  @override
  String get openCollection => 'Abrir coleção';

  @override
  String get playlistPlayAction => 'Reproduzir playlist';

  @override
  String get playlistAllFinished => 'Tudo concluído';

  @override
  String get queueModeBooks => 'Livros';

  @override
  String get queueModePodcasts => 'Podcasts';

  @override
  String get autoDownloadQueue => 'Baixar fila automaticamente';

  @override
  String get autoDownloadThisSeriesLabel => 'Baixar esta série automaticamente';

  @override
  String get autoDownloadThisShowLabel => 'Baixar este podcast automaticamente';

  @override
  String get autoDownloadThisPlaylistLabel =>
      'Baixar esta playlist automaticamente';

  @override
  String get autoDownloadThisCollectionLabel =>
      'Baixar esta coleção automaticamente';

  @override
  String autoDownloadQueueOnSubtitle(int count) {
    return 'Manter os próximos $count itens baixados';
  }

  @override
  String get autoDownloadQueueOffSubtitle =>
      'Desativado - apenas downloads manuais';

  @override
  String get sectionPlayback => 'Reprodução';

  @override
  String get sectionMediaControls => 'Controles de mídia';

  @override
  String get defaultSpeed => 'Velocidade padrão';

  @override
  String get defaultSpeedSubtitle =>
      'Novos livros começam nesta velocidade - cada livro lembra a sua';

  @override
  String get skipBack => 'Voltar';

  @override
  String get skipForward => 'Avançar';

  @override
  String get iosLockScreenSkipHint =>
      'A tela de bloqueio só exibe os números para os quais o iOS tem ícones (5, 10, 15, 30, 45, 60, 75, 90). Outros valores mostram + no botão, mas ainda pulam conforme a sua configuração.';

  @override
  String get longSkipButtons => 'Botões de salto longo';

  @override
  String get longSkipButtonsOnSubtitle =>
      'Ativado - o player mostra um segundo par de saltos, maior';

  @override
  String get longSkipButtonsOffSubtitle =>
      'Desativado - apenas os botões de salto normais';

  @override
  String get longSkipBack => 'Salto longo para trás';

  @override
  String get longSkipForward => 'Salto longo para frente';

  @override
  String get coverShapeDefault => 'Padrão';

  @override
  String get coverShapeSquare => 'Quadrada';

  @override
  String get coverShapeRectangle => 'Retangular';

  @override
  String get coverShapeLabel => 'Formato da capa';

  @override
  String get showSubtitles => 'Mostrar subtítulos';

  @override
  String get showSubtitlesOnSubtitle =>
      'Os subtítulos aparecem sob os títulos dos livros na biblioteca e no início';

  @override
  String get showSubtitlesOffSubtitle =>
      'Desativado - subtítulos apenas na folha de detalhes do livro';

  @override
  String get subtitleVisibilityLabel => 'Subtítulos';

  @override
  String get subtitleVisibilityDefault => 'Padrão';

  @override
  String get subtitleVisibilityShow => 'Mostrar';

  @override
  String get subtitleVisibilityHide => 'Ocultar';

  @override
  String currentLibrarySettingsTitle(String name) {
    return 'Biblioteca atual: $name';
  }

  @override
  String get currentLibrarySkipOverride => 'Valores de salto personalizados';

  @override
  String get currentLibrarySkipOverrideOnSubtitle =>
      'Ativado - esta biblioteca usa seus próprios valores de salto';

  @override
  String get currentLibrarySkipOverrideOffSubtitle =>
      'Desativado - esta biblioteca usa os valores de salto globais';

  @override
  String get currentLibrarySkipBack => 'Voltar';

  @override
  String get currentLibrarySkipForward => 'Avançar';

  @override
  String get chapterProgressInNotification =>
      'Progresso do capítulo na notificação e no Android Auto';

  @override
  String get chapterProgressOnSubtitle =>
      'Ativado - a notificação e o Android Auto mostram o progresso do capítulo';

  @override
  String get chapterProgressOffSubtitle =>
      'Desativado - mostram o progresso do livro inteiro';

  @override
  String get chapterProgressInNotificationIos =>
      'Progresso do capítulo na tela de bloqueio e no CarPlay';

  @override
  String get chapterProgressOnSubtitleIos =>
      'Ativado - a tela de bloqueio e o CarPlay mostram o progresso do capítulo';

  @override
  String get nowPlayingText => 'Texto de reprodução atual';

  @override
  String get nowPlayingTextSubtitle =>
      'Escolha o que os controles de mídia mostram em cada linha';

  @override
  String get nowPlayingTopLine => 'Linha superior';

  @override
  String get nowPlayingSecondLine => 'Segunda linha';

  @override
  String get nowPlayingNotShown => 'Não exibido';

  @override
  String get nowPlayingTopLineRequired =>
      'A linha superior precisa de pelo menos um item';

  @override
  String get nowPlayingPieceChapter => 'Capítulo';

  @override
  String get nowPlayingPieceTitle => 'Título do livro';

  @override
  String get nowPlayingPieceNarrator => 'Narrador';

  @override
  String get nowPlayingPieceSeries => 'Série';

  @override
  String get nowPlayingPiecePercent => 'Porcentagem do livro';

  @override
  String get nowPlayingPieceChapterNumber => 'Número do capítulo';

  @override
  String get nowPlayingPieceTimeLeft => 'Tempo restante';

  @override
  String nowPlayingChapterNumber(int number, int total) {
    return 'Cap. $number/$total';
  }

  @override
  String nowPlayingTimeLeft(String time) {
    return '$time restantes';
  }

  @override
  String get bookDockBadgePending => 'Pendente';

  @override
  String get bookDockBadgeExtracting => 'Lendo arquivo';

  @override
  String get bookDockBadgeFetching => 'Buscando';

  @override
  String get bookDockBadgeError => 'Erro';

  @override
  String get bookDockNeedsReview => 'Precisa de revisão';

  @override
  String get bookDockNoMatch => 'Sem correspondência';

  @override
  String get bookDockApplied => 'Aplicado';

  @override
  String get bookDockNotApplied => 'Detalhes encontrados não usados';

  @override
  String get bookDockNoDestination => 'Nenhum destino definido';

  @override
  String get bookDockNoAuthor => 'Ainda sem autor';

  @override
  String get bookDockLookUpAgain => 'Buscar novamente';

  @override
  String get bookDockLookingUp => 'Buscando os detalhes novamente';

  @override
  String get bookDockLookUpFailed => 'Não foi possível buscar os detalhes';

  @override
  String get bookDockProposedChanges => 'Alterações propostas';

  @override
  String get bookDockNoChanges => 'Nenhum detalhe encontrado online ainda';

  @override
  String get bookDockStillReading => 'O servidor ainda está lendo este arquivo';

  @override
  String get bookDockRoleBook => 'Livro';

  @override
  String get bookDockRoleCover => 'Capa';

  @override
  String get bookDockRoleMetadata => 'Metadados';

  @override
  String get bookDockRoleExtra => 'Extra';

  @override
  String get bookDockFieldTitle => 'Título';

  @override
  String get bookDockFieldSubtitle => 'Subtítulo';

  @override
  String get bookDockFieldAuthors => 'Autores';

  @override
  String get bookDockFieldSeries => 'Série';

  @override
  String get bookDockFieldPublisher => 'Editora';

  @override
  String get bookDockFieldYear => 'Ano';

  @override
  String get bookDockFieldLanguage => 'Idioma';

  @override
  String get bookDockFieldIsbn => 'ISBN';

  @override
  String bookDockMatch(int percent) {
    return '$percent% de correspondência';
  }

  @override
  String bookDockFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '1 arquivo',
    );
    return '$_temp0';
  }

  @override
  String bookDockGoesTo(String library) {
    return 'Vai para $library';
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
      other: '$count arquivos nesta entrada',
      one: 'Arquivo nesta entrada',
    );
    return '$_temp0';
  }

  @override
  String bookDockAdded(String date) {
    return 'Adicionado em $date';
  }

  @override
  String get bookDockAddToLibrary => 'Adicionar à biblioteca';

  @override
  String get bookDockUseFound => 'Usar detalhes encontrados';

  @override
  String get bookDockRemoveTitle => 'Remover do Book Dock?';

  @override
  String get bookDockRemoveFailed => 'Não foi possível remover este arquivo';

  @override
  String get bookDockPickLibrary => 'Adicionar a qual biblioteca?';

  @override
  String get bookDockNoLibraries =>
      'Sua conta não pode adicionar livros a uma biblioteca';

  @override
  String get bookDockFileFailed =>
      'Não foi possível adicionar este arquivo à biblioteca';

  @override
  String get bookDockDuplicateBody =>
      'Já existe um arquivo com este nome nessa biblioteca. Remover do Book Dock?';

  @override
  String get bookDockDetailsUpdated => 'Detalhes atualizados';

  @override
  String get bookDockUseFoundFailed => 'Nenhum detalhe encontrado para usar';

  @override
  String bookDockRemoveBody(String title) {
    return 'Isso exclui $title do servidor.';
  }

  @override
  String bookDockRemoved(String title) {
    return '$title removido do Book Dock';
  }

  @override
  String bookDockFiled(String title, String library) {
    return '$title adicionado a $library';
  }

  @override
  String bookDockFileFailedReason(String reason) {
    return 'Não foi possível adicionar este arquivo: $reason';
  }

  @override
  String bookDockDuplicateTitle(String library) {
    return 'Já está em $library';
  }

  @override
  String get bomatchSearchAll => 'Pesquisar em todas as fontes';

  @override
  String get bomatchSearching => 'Pesquisando...';

  @override
  String get bomatchSearchFailed =>
      'Não foi possível pesquisar correspondências. Verifique sua conexão e tente novamente.';

  @override
  String get bomatchNoResults => 'Nenhuma correspondência encontrada';

  @override
  String get bomatchStrong => 'Correspondências fortes';

  @override
  String get bomatchPossible => 'Correspondências possíveis';

  @override
  String get bomatchSourceTimeout => 'tempo esgotado';

  @override
  String get bomatchSourceBusy => 'ocupada';

  @override
  String get bomatchSourceFailed => 'falhou';

  @override
  String get bomatchLinked => 'Vinculado';

  @override
  String get bomatchSameIsbn => 'Mesmo ISBN';

  @override
  String get bomatchFewDetails => 'Poucos detalhes';

  @override
  String get bomatchBack => 'Todos os resultados';

  @override
  String get bomatchFillEmpty => 'Preencher vazios';

  @override
  String get bomatchTakeAll => 'Usar tudo';

  @override
  String get bomatchOnlyDifferences => 'Somente diferenças';

  @override
  String get bomatchNow => 'Agora';

  @override
  String get bomatchEmpty => 'Vazio';

  @override
  String get bomatchKindNew => 'Novo';

  @override
  String get bomatchKindChange => 'Alteração';

  @override
  String get bomatchKindSmall => 'Pequena alteração';

  @override
  String get bomatchKindSame => 'Igual';

  @override
  String get bomatchKindNone => 'Não está no resultado';

  @override
  String get bomatchKeep => 'Manter';

  @override
  String get bomatchUse => 'Usar';

  @override
  String get bomatchMerge => 'Mesclar';

  @override
  String get bomatchReplace => 'Substituir';

  @override
  String get bomatchUseThis => 'Usar este';

  @override
  String get bomatchChosen => 'Escolhido';

  @override
  String bomatchOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count outros livros',
      one: '1 outro livro',
    );
    return '$_temp0';
  }

  @override
  String bomatchChanged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alterações',
      one: '1 alteração',
    );
    return '$_temp0';
  }

  @override
  String bomatchNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count novos',
      one: '1 novo',
    );
    return '$_temp0';
  }

  @override
  String bomatchApply(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aplicar $count alterações',
      one: 'Aplicar 1 alteração',
      zero: 'Aplicar',
    );
    return '$_temp0';
  }

  @override
  String bomatchOtherSources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count outras fontes',
      one: '1 outra fonte',
    );
    return '$_temp0';
  }

  @override
  String bomatchFrom(String source) {
    return 'De $source';
  }

  @override
  String get breqTitle => 'Pedidos de livros';

  @override
  String get breqTabRequest => 'Pedir um livro';

  @override
  String get breqTabMine => 'Meus pedidos';

  @override
  String get breqTabAll => 'Todos os pedidos';

  @override
  String get breqNoAccess => 'Sua conta não pode pedir livros neste servidor.';

  @override
  String get breqTitleHint => 'Título do livro';

  @override
  String get breqAuthorHint => 'Autor';

  @override
  String get breqKindAudiobook => 'Audiolivro';

  @override
  String get breqKindEbook => 'E-book';

  @override
  String get breqKindComic => 'Quadrinhos';

  @override
  String get breqSearch => 'Pesquisar';

  @override
  String get breqSearching => 'Pesquisando...';

  @override
  String get breqSearchFailed =>
      'Não foi possível pesquisar. Verifique sua conexão e tente novamente.';

  @override
  String get breqSearchPrompt =>
      'Pesquise um livro que a biblioteca ainda não tem para pedi-lo.';

  @override
  String get breqNoResults => 'Nenhum livro correspondente encontrado';

  @override
  String get breqInLibrary => 'Na sua biblioteca';

  @override
  String get breqYouAsked => 'Você pediu este livro';

  @override
  String get breqSomeoneAsked => 'Já pedido por outra pessoa';

  @override
  String get breqView => 'Ver';

  @override
  String get breqRequest => 'Pedir';

  @override
  String get breqRequested => 'Pedido feito';

  @override
  String get breqAddMeToo => 'Pedir também';

  @override
  String get breqLibrary => 'Biblioteca';

  @override
  String get breqLibraryApprover => 'Deixar o aprovador decidir';

  @override
  String get breqLibraryChoose => 'Escolha uma biblioteca';

  @override
  String get breqNote => 'Nota para o aprovador';

  @override
  String get breqNoteHint => 'Qualquer informação útil sobre este pedido';

  @override
  String get breqAutoApproved => 'Seus pedidos são aprovados imediatamente.';

  @override
  String get breqSubmitted => 'Pedido enviado';

  @override
  String get breqJoined => 'Você foi adicionado ao pedido existente';

  @override
  String get breqFailed => 'Não foi possível enviar o pedido';

  @override
  String get breqStatusPending => 'Pendente';

  @override
  String get breqStatusApproved => 'Aprovado';

  @override
  String get breqStatusRejected => 'Rejeitado';

  @override
  String get breqStatusCancelled => 'Cancelado';

  @override
  String get breqStatusSearching => 'Pesquisando';

  @override
  String get breqStatusGrabbed => 'Versão encontrada';

  @override
  String get breqStatusDownloading => 'Baixando';

  @override
  String get breqStatusImporting => 'Importando';

  @override
  String get breqStatusNeedsReview => 'Precisa de revisão';

  @override
  String get breqStatusAvailable => 'Disponível';

  @override
  String get breqStatusFailed => 'Falhou';

  @override
  String get breqWaitingApproval => 'Aguardando aprovação';

  @override
  String get breqWaitingRelease => 'Aguardando a escolha de uma versão';

  @override
  String get breqLookingForRelease => 'Procurando uma versão';

  @override
  String get breqStartingDownload => 'Iniciando o download';

  @override
  String get breqAddingToLibrary => 'Adicionando à biblioteca';

  @override
  String get breqWaitingCheck => 'Aguardando uma verificação manual';

  @override
  String get breqReady => 'Pronto na sua biblioteca';

  @override
  String get breqSomethingWrong => 'Algo deu errado';

  @override
  String get breqShowHidden => 'Mostrar ocultos';

  @override
  String get breqHidden => 'Oculto';

  @override
  String get breqMineEmpty => 'Você ainda não pediu nenhum livro.';

  @override
  String get breqAllEmpty => 'Nenhum pedido ainda.';

  @override
  String get breqLoadFailed => 'Não foi possível carregar os pedidos.';

  @override
  String get breqLoadMore => 'Carregar mais';

  @override
  String get breqApprove => 'Aprovar';

  @override
  String get breqReject => 'Rejeitar';

  @override
  String get breqCancel => 'Cancelar pedido';

  @override
  String get breqHide => 'Ocultar da minha lista';

  @override
  String get breqUnhide => 'Mostrar na minha lista';

  @override
  String get breqLeave => 'Sair do pedido';

  @override
  String get breqDelete => 'Excluir pedido';

  @override
  String get breqOpenBook => 'Abrir livro';

  @override
  String get breqCancelConfirm =>
      'Cancelar este pedido? Um download em andamento também será interrompido.';

  @override
  String get breqDeleteConfirm =>
      'Excluir este pedido? Esta ação não pode ser desfeita.';

  @override
  String get breqRejectTitle => 'Rejeitar pedido';

  @override
  String get breqRejectReason => 'Motivo (opcional)';

  @override
  String get breqApproveTitle => 'Aprovar pedido';

  @override
  String get breqApproveLibraryNeeded =>
      'Escolha a biblioteca para a qual este livro vai.';

  @override
  String get breqApprovedToast => 'Pedido aprovado';

  @override
  String get breqRejectedToast => 'Pedido rejeitado';

  @override
  String get breqCancelledToast => 'Pedido cancelado';

  @override
  String get breqHiddenToast => 'Oculto da sua lista';

  @override
  String get breqRestoredToast => 'De volta à sua lista';

  @override
  String get breqDeletedToast => 'Pedido excluído';

  @override
  String get breqLeftToast => 'Você saiu deste pedido';

  @override
  String get breqActionFailed => 'Não foi possível atualizar o pedido';

  @override
  String get breqFactRequestedBy => 'Pedido por';

  @override
  String get breqFactRequestedOn => 'Pedido em';

  @override
  String get breqFactLibrary => 'Biblioteca';

  @override
  String get breqFactDecidedBy => 'Decidido por';

  @override
  String get breqFactNote => 'Nota de quem pediu';

  @override
  String get breqFactDecisionNote => 'Nota da decisão';

  @override
  String get breqFactAlsoWanted => 'Também desejado por';

  @override
  String get breqLibraryCta => 'Pedir um livro';

  @override
  String get breqSettingsSubtitle =>
      'Peça livros que a biblioteca ainda não tem';

  @override
  String get navHoldBookRequests => 'Pedidos de livros';

  @override
  String breqLibraryDefault(String library) {
    return 'Padrão ($library)';
  }

  @override
  String breqFailedReason(String reason) {
    return 'Não foi possível enviar o pedido: $reason';
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
    return 'Baixando, $percent%';
  }

  @override
  String breqAddedTo(String library) {
    return 'Adicionado a $library';
  }

  @override
  String breqRejectedWithNote(String note) {
    return 'Rejeitado: $note';
  }

  @override
  String breqFailedWithReason(String reason) {
    return 'Falhou: $reason';
  }

  @override
  String breqRequestedBy(String name) {
    return 'Pedido por $name';
  }

  @override
  String breqActionFailedReason(String reason) {
    return 'Não foi possível atualizar o pedido: $reason';
  }

  @override
  String breqFooterCta(String query) {
    return 'Pedir \"$query\"';
  }

  @override
  String breqCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pedidos',
      one: '1 pedido',
      zero: 'Nenhum pedido',
    );
    return '$_temp0';
  }

  @override
  String get breqFindRelease => 'Encontrar uma versão';

  @override
  String get breqTryAnotherRelease => 'Tentar outra versão';

  @override
  String get breqApproveAndFind => 'Aprovar e encontrar uma versão';

  @override
  String get breqReviewButton => 'Revisar download';

  @override
  String get breqStopDownload => 'Parar download';

  @override
  String get breqStopDownloadConfirm =>
      'Parar este download? O pedido volta para aprovado para que outra versão possa ser escolhida.';

  @override
  String get breqDiscardImport => 'Descartar download';

  @override
  String get breqDiscardConfirm =>
      'Descartar este download? O pedido será marcado como falho e poderá ser tentado novamente com outra versão.';

  @override
  String get breqFileAnyway => 'Adicionar à biblioteca';

  @override
  String get breqFiledToast => 'Adicionado à biblioteca';

  @override
  String get breqDiscardedToast => 'Download descartado';

  @override
  String get breqStoppedToast => 'Download interrompido';

  @override
  String get breqGrabTitle => 'Baixar esta versão?';

  @override
  String get breqGrab => 'Baixar';

  @override
  String get breqGrabbed => 'Download iniciado';

  @override
  String get breqGrabFailed => 'Não foi possível iniciar esse download';

  @override
  String get breqReleaseVipWarning =>
      'Este tracker só permite o download por contas VIP.';

  @override
  String get breqReleaseNoBookFile =>
      'Esta versão não tem um arquivo de livro que o BookOrbit possa adicionar a uma biblioteca.';

  @override
  String get breqReleaseCheckFailed =>
      'Não foi possível verificar o conteúdo desta versão. Tente novamente ou escolha outra.';

  @override
  String get breqCheckingRelease => 'Verificando os arquivos...';

  @override
  String get breqSearchAgain => 'Pesquisar novamente';

  @override
  String get breqSearchTerms => 'Termos de pesquisa';

  @override
  String get breqIsbnHint => 'Deixe vazio para pesquisar por título e autor';

  @override
  String get breqSearchingIndexers =>
      'Pesquisando seus indexadores. Isso pode levar até um minuto.';

  @override
  String get breqReleasesFailed => 'Não foi possível pesquisar versões.';

  @override
  String get breqNoSourcesSetUp =>
      'Nenhuma fonte de pesquisa está configurada no BookOrbit.';

  @override
  String get breqNoSourcesOn =>
      'Todas as fontes de pesquisa estão desativadas no BookOrbit.';

  @override
  String get breqNoSourceCarries =>
      'Nenhuma das suas fontes de pesquisa tem este tipo de livro.';

  @override
  String get breqNoReleases =>
      'Nenhuma versão encontrada. Tente outros termos de pesquisa.';

  @override
  String get breqFromCache => 'de uma pesquisa recente';

  @override
  String get breqIndexerUnauthorized => 'falha no login';

  @override
  String get breqIndexerThrottled => 'ocupado';

  @override
  String get breqIndexerTimeout => 'tempo esgotado';

  @override
  String get breqIndexerUnreachable => 'inacessível';

  @override
  String get breqIndexerNoMedium => 'não tem este tipo';

  @override
  String get breqIndexerError => 'falhou';

  @override
  String get breqSortBest => 'Melhor correspondência';

  @override
  String get breqSortSeeders => 'Seeders';

  @override
  String get breqSortSize => 'Tamanho';

  @override
  String get breqSortNewest => 'Mais recentes';

  @override
  String get breqFreeleech => 'Freeleech';

  @override
  String get breqVipOnly => 'Somente VIP';

  @override
  String get breqAlreadyGrabbed => 'Já baixado antes';

  @override
  String get breqReasonIsbn => 'ISBN';

  @override
  String get breqReasonTitle => 'Título';

  @override
  String get breqReasonAuthor => 'Autor';

  @override
  String get breqReasonUnknownFormat => 'Formato desconhecido';

  @override
  String get breqReasonExpectedSize => 'Tamanho';

  @override
  String get breqReasonSuspiciousSize => 'Tamanho incomum';

  @override
  String get breqReasonFreeleech => 'Freeleech';

  @override
  String get breqReasonSeveralBooks => 'Vários livros';

  @override
  String get breqReviewTitle => 'Download aguardando verificação';

  @override
  String get breqReviewFailed =>
      'Não foi possível carregar os detalhes do download.';

  @override
  String get breqReviewDockGone =>
      'Os arquivos baixados não estão mais no Book Dock.';

  @override
  String get breqReviewNoLibrary =>
      'Este pedido não tem uma biblioteca para adicionar o livro.';

  @override
  String breqGrabFailedReason(String reason) {
    return 'Não foi possível iniciar esse download: $reason';
  }

  @override
  String breqReleaseCheckFailedReason(String reason) {
    return 'Não foi possível verificar o conteúdo desta versão: $reason';
  }

  @override
  String breqReleasesFailedReason(String reason) {
    return 'Não foi possível pesquisar versões: $reason';
  }

  @override
  String breqReviewFailedReason(String reason) {
    return 'Não foi possível carregar os detalhes do download: $reason';
  }

  @override
  String breqReleaseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count versões',
      one: '1 versão',
      zero: 'Nenhuma versão',
    );
    return '$_temp0';
  }

  @override
  String breqFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '1 arquivo',
    );
    return '$_temp0';
  }

  @override
  String breqReviewFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '1 arquivo',
    );
    return '$_temp0';
  }

  @override
  String breqSeeders(int seeders, int leechers) {
    return '$seeders seeders, $leechers leechers';
  }

  @override
  String breqScore(int score) {
    return 'Pontuação $score';
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
    return '$count seeders';
  }

  @override
  String breqReviewScore(int score, int threshold) {
    return 'Pontuação de correspondência $score. Downloads com pontuação $threshold ou mais são adicionados automaticamente.';
  }

  @override
  String breqReviewRequested(String value) {
    return 'Pedido: $value';
  }

  @override
  String breqReviewImported(String value) {
    return 'Baixado: $value';
  }

  @override
  String get breqKindBoth => 'Ambos';

  @override
  String get breqEbookLibrary => 'Biblioteca de e-books';

  @override
  String get breqAudiobookLibrary => 'Biblioteca de audiolivros';

  @override
  String get breqRequestBoth => 'Pedir ambos';

  @override
  String get breqAddMeToBoth => 'Incluir-me em ambos';

  @override
  String get breqRequestEbook => 'Pedir e-book';

  @override
  String get breqRequestAudiobook => 'Pedir audiolivro';

  @override
  String get breqAddMeEbook => 'Incluir-me no pedido do e-book';

  @override
  String get breqAddMeAudiobook => 'Incluir-me no pedido do audiolivro';

  @override
  String get breqPairSubmitted => 'E-book e audiolivro pedidos';

  @override
  String get breqPairOneJoined =>
      'Ambos pedidos. Um deles já estava a caminho, então você foi incluído nesse pedido';

  @override
  String get breqJoinedBoth => 'Você foi incluído nos dois pedidos';

  @override
  String get breqJoinsOwned =>
      'Pedido feito. Ele será associado à cópia que já está na sua biblioteca';

  @override
  String get speedBookmarkInControls =>
      'Velocidade e marcador nos controles de mídia';

  @override
  String get speedBookmarkOnSubtitle =>
      'Ativado - a notificação mostra velocidade e marcador; o salto de capítulo continua no Android Auto';

  @override
  String get speedBookmarkOffSubtitle =>
      'Desativado - a notificação mostra o salto de capítulo; velocidade e marcador continuam no Android Auto';

  @override
  String get lockSeekBar => 'Bloquear a barra de busca';

  @override
  String get lockSeekBarOnSubtitle =>
      'Ativado - a barra na notificação, na tela de bloqueio e no carro mostra o progresso, mas não pode ser arrastada';

  @override
  String get lockSeekBarOffSubtitle =>
      'Desativado - arraste a barra na notificação, na tela de bloqueio e no carro para navegar';

  @override
  String get autoRewindOnResume => 'Retroceder automaticamente ao retomar';

  @override
  String autoRewindOnSubtitle(String min, String max) {
    return 'Ativado - de ${min}s a ${max}s conforme a duração da pausa';
  }

  @override
  String get autoRewindOffSubtitle => 'Desligado';

  @override
  String get rewindRange => 'Intervalo de retrocesso';

  @override
  String get rewindAfterPausedFor => 'Retroceder após pausa de';

  @override
  String get rewindAnyPause => 'Qualquer pausa';

  @override
  String get rewindAlwaysLabel => 'Sempre';

  @override
  String get rewindAlwaysDescription =>
      'Retrocede toda vez que você retoma, mesmo após interrupções curtas';

  @override
  String rewindAfterDescription(String seconds) {
    return 'Só retrocede se a pausa durar $seconds+ segundos';
  }

  @override
  String get chapterBarrier => 'Limite de capítulo';

  @override
  String get chapterBarrierSubtitle =>
      'Não retroceder automaticamente além do início do capítulo atual';

  @override
  String get rewindInstant => 'Instantâneo';

  @override
  String rewindPause(String duration) {
    return 'Pausa de $duration';
  }

  @override
  String get rewindNoRewind => 'sem retrocesso';

  @override
  String rewindSeconds(String seconds) {
    return 'retrocesso de ${seconds}s';
  }

  @override
  String get sectionSleepTimer => 'Temporizador';

  @override
  String get sleep => 'Dormir';

  @override
  String get sleepTimer => 'Temporizador';

  @override
  String get shakeDuringSleepTimer => 'Agitar durante o temporizador';

  @override
  String get shakeOff => 'Desligado';

  @override
  String get shakeAddTime => 'Adicionar tempo';

  @override
  String get shakeReset => 'Reiniciar';

  @override
  String get shakeAdds => 'Agitar adiciona';

  @override
  String get sleepAddAmount => 'Tempo a adicionar';

  @override
  String shakeAddsValue(int minutes) {
    return '$minutes min';
  }

  @override
  String get shakeSensitivity => 'Sensibilidade ao agitar';

  @override
  String get shakeSensitivityVeryLow => 'Muito baixa';

  @override
  String get shakeSensitivityLow => 'Baixa';

  @override
  String get shakeSensitivityMedium => 'Média';

  @override
  String get shakeSensitivityHigh => 'Alta';

  @override
  String get shakeSensitivityVeryHigh => 'Muito alta';

  @override
  String get buttonDuringSleepTimer => 'Botão do fone durante a contagem final';

  @override
  String get buttonDuringSleepTimerHint =>
      'Nos últimos momentos da contagem final, um toque reinicia o temporizador em vez de pausar. O toque duplo ainda pula.';

  @override
  String get resetTimerOnPause => 'Reiniciar temporizador ao pausar';

  @override
  String get resetTimerOnPauseOnSubtitle =>
      'O temporizador recomeça da duração total ao retomar';

  @override
  String get resetTimerOnPauseOffSubtitle =>
      'O temporizador continua de onde parou';

  @override
  String get fadeVolumeBeforeSleep => 'Reduzir volume antes de dormir';

  @override
  String get fadeVolumeOnSubtitle =>
      'Reduz o volume gradualmente nos últimos 30 segundos';

  @override
  String get fadeVolumeOffSubtitle =>
      'A reprodução para imediatamente quando o temporizador termina';

  @override
  String get autoSleepTimer => 'Temporizador automático';

  @override
  String autoSleepTimerOnSubtitle(String start, String end, int duration) {
    return '$start - $end - $duration min';
  }

  @override
  String get autoSleepTimerOffSubtitle =>
      'Inicia um temporizador automaticamente durante uma janela de horário';

  @override
  String get windowStart => 'Início da janela';

  @override
  String get windowEnd => 'Fim da janela';

  @override
  String get timerDuration => 'Duração do temporizador';

  @override
  String get timer => 'Temporizador';

  @override
  String get endOfChapter => 'Fim do capítulo';

  @override
  String startMinTimer(int minutes) {
    return 'Iniciar temporizador de $minutes min';
  }

  @override
  String sleepAfterChapters(int count, String label) {
    return 'Parar após $count $label';
  }

  @override
  String get addMoreTime => 'Adicionar mais tempo';

  @override
  String get cancelTimer => 'Cancelar temporizador';

  @override
  String chaptersLeftCount(int count) {
    return '$count cap. restantes';
  }

  @override
  String get sectionDownloadsAndStorage => 'Downloads e armazenamento';

  @override
  String get downloadOverWifiOnly => 'Rede para download';

  @override
  String get downloadOverWifiOnSubtitle => 'Somente Wi-Fi';

  @override
  String get downloadOverWifiOffSubtitle => 'Qualquer conexão';

  @override
  String get autoDownloadOnWifi =>
      'Baixar automaticamente livros que você inicia';

  @override
  String get autoDownloadOnWifiInfoTitle =>
      'Baixar automaticamente livros que você inicia';

  @override
  String get autoDownloadOnWifiInfoContent =>
      'Quando você começa a transmitir um livro, o livro completo é baixado em segundo plano para que você o tenha offline sem iniciar o download manualmente. Esses downloads seguem a configuração Rede para download acima; defina como Qualquer conexão se quiser que também usem dados móveis.';

  @override
  String get autoDownloadOnWifiOnSubtitle =>
      'Livros transmitidos são baixados automaticamente em segundo plano';

  @override
  String get autoDownloadOnWifiOffSubtitle => 'Desligado';

  @override
  String get concurrentDownloads => 'Downloads simultâneos';

  @override
  String get autoDownload => 'Download automático';

  @override
  String get autoDownloadSubtitle =>
      'Ative por série, podcast, playlist ou coleção nas páginas de detalhes';

  @override
  String get autoDownloadEnabledFor => 'Ativado para';

  @override
  String get autoDownloadEnabledForNone => 'Nada ainda';

  @override
  String get autoDownloadSourceUnnamed => 'Ainda não carregado';

  @override
  String get keepNext => 'Manter os próximos';

  @override
  String get keepNextInfoTitle => 'Manter os próximos';

  @override
  String get keepNextInfoContent =>
      'O número de itens a manter baixados, incluindo o que você está ouvindo agora. Por exemplo, \"Manter os próximos 3\" significa que o livro atual mais os 2 seguintes dessa série, podcast, playlist ou coleção continuarão baixados. Isso vale para todo download automático que você ativar.';

  @override
  String get deleteAbsorbedDownloads => 'Excluir downloads concluídos';

  @override
  String get deleteAbsorbedDownloadsInfoTitle => 'Excluir downloads concluídos';

  @override
  String get deleteAbsorbedDownloadsInfoContent =>
      'Quando ativado, livros ou episódios baixados são excluídos automaticamente deste dispositivo depois que você os conclui no Absorb. Concluir um item na web ou em outro dispositivo não exclui o download aqui.';

  @override
  String get deleteAbsorbedOnSubtitle =>
      'Itens concluídos são removidos para economizar espaço';

  @override
  String get deleteAbsorbedOffSubtitle =>
      'Desativado - downloads concluídos são mantidos';

  @override
  String get downloadLocation => 'Local de download';

  @override
  String get storageUsed => 'Armazenamento usado';

  @override
  String storageUsedByDownloads(String size) {
    return '$size usados por downloads';
  }

  @override
  String storageFreeOfTotal(String free, String total) {
    return '$free livres de $total';
  }

  @override
  String get manageDownloads => 'Gerenciar downloads';

  @override
  String get streamingCache => 'Cache de streaming';

  @override
  String get streamingCacheInfoTitle => 'Cache de streaming';

  @override
  String get streamingCacheInfoContent =>
      'Armazena em disco o áudio transmitido para que não precise ser baixado de novo se você voltar ou reouvir trechos. O cache é gerenciado automaticamente - os arquivos mais antigos são removidos quando o limite de tamanho é atingido. É separado dos livros totalmente baixados.';

  @override
  String get streamingCacheOff => 'Desligado';

  @override
  String get streamingCacheOffSubtitle =>
      'Desligado - o áudio é transmitido sem cache';

  @override
  String streamingCacheOnSubtitle(int size) {
    return '$size MB - o áudio transmitido recentemente fica em cache no disco';
  }

  @override
  String get clearCache => 'Limpar cache';

  @override
  String get streamingCacheCleared => 'Cache de streaming limpo';

  @override
  String get sectionLibrary => 'Biblioteca';

  @override
  String get hideEbookOnlyTitles => 'Ocultar títulos apenas em e-book';

  @override
  String get hideEbookOnlyOnSubtitle =>
      'Livros sem arquivos de áudio ficam ocultos';

  @override
  String get hideEbookOnlyOffSubtitle =>
      'Desativado - todos os itens da biblioteca são exibidos';

  @override
  String get homeCardsOpenDetails => 'Abrir detalhes a partir do Início';

  @override
  String get homeCardsOpenDetailsOnSubtitle =>
      'Tocar em um cartão de Continuar ouvindo ou Continuar lendo abre seus detalhes';

  @override
  String get homeCardsOpenDetailsOffSubtitle =>
      'Tocar em um cartão de Continuar ouvindo ou Continuar lendo retoma de onde você parou';

  @override
  String get showGoodreadsButton => 'Mostrar botão do Goodreads';

  @override
  String get showGoodreadsOnSubtitle =>
      'A folha de detalhes do livro mostra um link para o Goodreads';

  @override
  String get showGoodreadsOffSubtitle =>
      'Desativado - botão do Goodreads oculto';

  @override
  String get sectionPermissions => 'Permissões';

  @override
  String get notifications => 'Notificações';

  @override
  String get notificationsSubtitle =>
      'Para o progresso de downloads e os controles de reprodução';

  @override
  String get notificationsAlreadyEnabled => 'Notificações já ativadas';

  @override
  String get unrestrictedBattery => 'Bateria sem restrições';

  @override
  String get unrestrictedBatterySubtitle =>
      'Impede que o Android encerre a reprodução em segundo plano';

  @override
  String get batteryAlreadyUnrestricted => 'Bateria já sem restrições';

  @override
  String get sectionIssuesAndSupport => 'Problemas e suporte';

  @override
  String get bugsAndFeatureRequests => 'Bugs e pedidos de recursos';

  @override
  String get bugsAndFeatureRequestsSubtitle => 'Abrir uma issue no GitHub';

  @override
  String get joinDiscord => 'Entrar no Discord';

  @override
  String get joinDiscordSubtitle => 'Comunidade, suporte e novidades';

  @override
  String get contact => 'Contato';

  @override
  String get contactSubtitle => 'Enviar informações do dispositivo por e-mail';

  @override
  String get enableLogging => 'Ativar registros';

  @override
  String get enableLoggingOnSubtitle =>
      'Ativado - registros salvos em arquivo (reinicie para aplicar)';

  @override
  String get enableLoggingOffSubtitle =>
      'Desativado - nenhum registro é capturado';

  @override
  String get loggingEnabledSnackbar =>
      'Registros ativados - reinicie o app para começar a capturar';

  @override
  String get loggingDisabledSnackbar =>
      'Registros desativados - reinicie o app para parar de capturar';

  @override
  String get sendLogs => 'Enviar registros';

  @override
  String get sendLogsSubtitle =>
      'Compartilhar o arquivo de registro como anexo';

  @override
  String failedToShare(String error) {
    return 'Falha ao compartilhar: $error';
  }

  @override
  String get clearLogs => 'Limpar registros';

  @override
  String get logsCleared => 'Registros limpos';

  @override
  String get clearLogsQuestion => 'Limpar registros?';

  @override
  String get clearLogsContent =>
      'Esta ação não pode ser desfeita. Envie-os antes, se puder precisar deles.';

  @override
  String get sectionAdvanced => 'Avançado';

  @override
  String get localServer => 'Servidor local';

  @override
  String get localServerInfoTitle => 'Servidor local';

  @override
  String get localServerInfoContent =>
      'Se você hospeda seu servidor Audiobookshelf em casa, pode definir aqui uma URL local/LAN. O Absorb trocará automaticamente para a conexão local, mais rápida, ao detectar que você está na rede doméstica, e voltará para a URL remota quando você estiver fora.';

  @override
  String get localServerOnConnectedSubtitle => 'Conectado pelo servidor local';

  @override
  String get localServerOnRemoteSubtitle =>
      'Ativado - usando o servidor remoto';

  @override
  String get localServerOffSubtitle =>
      'Alternar automaticamente para um servidor LAN no seu Wi-Fi doméstico';

  @override
  String get localServerUrlLabel => 'URL do servidor local';

  @override
  String get localServerUrlHint => 'http://192.168.1.100:13378';

  @override
  String get localServerUrlSetSnackbar =>
      'URL do servidor local definida - conectará automaticamente quando você estiver na rede doméstica';

  @override
  String get disableAudioFocus => 'Desativar foco de áudio';

  @override
  String get disableAudioFocusInfoTitle => 'Foco de áudio';

  @override
  String get disableAudioFocusInfoContent =>
      'Por padrão, o Android dá o \"foco\" de áudio a um app por vez - quando o Absorb toca, outros áudios (música, vídeos) são pausados. Desativar o foco de áudio permite que o Absorb toque junto com outros apps. Chamadas telefônicas ainda pausam a reprodução, independentemente desta configuração.';

  @override
  String get disableAudioFocusOnSubtitle =>
      'Ativado - toca junto com outros áudios (ainda pausa em chamadas)';

  @override
  String get disableAudioFocusOffSubtitle =>
      'Desativado - outros áudios são pausados quando o Absorb toca';

  @override
  String get restartRequired => 'Reinício necessário';

  @override
  String get restartRequiredContent =>
      'A mudança no foco de áudio exige um reinício completo para ter efeito. Fechar o app agora?';

  @override
  String get closeApp => 'Fechar app';

  @override
  String get trustAllCertificates => 'Confiar em todos os certificados';

  @override
  String get trustAllCertificatesInfoTitle => 'Certificados autoassinados';

  @override
  String get mp3IndexSeeking => 'Busca por índice MP3';

  @override
  String get mp3IndexSeekingInfoTitle => 'Busca por índice MP3';

  @override
  String get mp3IndexSeekingInfoContent =>
      'Ative somente se você tiver arquivos MP3 que não buscam a posição correta. A busca imprecisa geralmente vem de MP3 com taxa de bits variável (VBR). A busca por índice cria um mapa de tempo exato à medida que o arquivo é lido, então ir para perto do fim de um MP3 grande pode demorar um pouco - principalmente em streaming, pois o arquivo precisa ser lido até esse ponto. Vale a partir da próxima vez que um livro ou episódio de podcast for iniciado.';

  @override
  String get mp3IndexSeekingOnSubtitle =>
      'Ativado - busca exata para arquivos MP3 VBR';

  @override
  String get mp3IndexSeekingOffSubtitle => 'Desativado - busca normal';

  @override
  String get trustAllCertificatesInfoContent =>
      'Ative se o seu servidor Audiobookshelf usa um certificado autoassinado ou uma CA raiz personalizada. Quando ativado, o Absorb ignorará a verificação de certificados TLS em todas as conexões. Ative somente se você confia na sua rede.';

  @override
  String get trustAllCertificatesOnSubtitle =>
      'Ativado - aceitando todos os certificados';

  @override
  String get trustAllCertificatesOffSubtitle =>
      'Desativado - apenas certificados confiáveis são aceitos';

  @override
  String get supportTheDev => 'Apoie o desenvolvedor';

  @override
  String get buyMeACoffee => 'Me pague um café';

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
  String get backupAndRestore => 'Backup e restauração';

  @override
  String get backupAndRestoreSubtitle =>
      'Salve ou restaure todas as suas configurações em um arquivo';

  @override
  String get backUp => 'Fazer backup';

  @override
  String get restore => 'Restaurar';

  @override
  String get allBookmarks => 'Todos os marcadores';

  @override
  String get allBookmarksSubtitle => 'Ver marcadores de todos os livros';

  @override
  String get switchAccount => 'Trocar de conta';

  @override
  String get addAccount => 'Adicionar conta';

  @override
  String get logOut => 'Sair';

  @override
  String get includeLoginInfoTitle => 'Incluir dados de login?';

  @override
  String get includeLoginInfoContent =>
      'Deseja incluir no backup as credenciais de login de todas as suas contas salvas?\n\nIsso facilita a restauração em um novo dispositivo, mas o arquivo conterá seus tokens de autenticação.';

  @override
  String get noSettingsOnly => 'Não, só configurações';

  @override
  String get yesIncludeAccounts => 'Sim, incluir contas';

  @override
  String get backupSavedWithAccounts => 'Backup salvo (com contas)';

  @override
  String get backupSavedSettingsOnly => 'Backup salvo (somente configurações)';

  @override
  String backupFailed(String error) {
    return 'Falha no backup: $error';
  }

  @override
  String get restoreBackupTitle => 'Restaurar backup?';

  @override
  String get restoreBackupContent =>
      'Isso substituirá todas as suas configurações atuais pelos valores do backup.';

  @override
  String fromAbsorbVersion(String version) {
    return 'Do Absorb v$version';
  }

  @override
  String restoreAccountsChip(int count) {
    return '$count conta(s)';
  }

  @override
  String restoreBookmarksChip(int count) {
    return 'Marcadores de $count livro(s)';
  }

  @override
  String get restoreCustomHeadersChip => 'Cabeçalhos personalizados';

  @override
  String get invalidBackupFile => 'Arquivo de backup inválido';

  @override
  String get settingsRestoredSuccessfully =>
      'Configurações restauradas com sucesso';

  @override
  String restoreFailed(String error) {
    return 'Falha na restauração: $error';
  }

  @override
  String get logOutTitle => 'Sair da conta?';

  @override
  String get logOutContent =>
      'Isso encerrará sua sessão. Seus downloads permanecerão neste dispositivo.';

  @override
  String get signOut => 'Sair';

  @override
  String get changePasswordTitle => 'Alterar senha';

  @override
  String get changePasswordSubtitle =>
      'Atualize sua senha do Audiobookshelf com segurança';

  @override
  String get currentPassword => 'Senha atual';

  @override
  String get newPassword => 'Nova senha';

  @override
  String get confirmNewPassword => 'Confirmar nova senha';

  @override
  String get passwordChangeEffect =>
      'Alterar sua senha encerra suas outras sessões do Audiobookshelf. Este dispositivo permanece conectado.';

  @override
  String get passwordFieldsRequired => 'Preencha todos os campos de senha';

  @override
  String get passwordsDoNotMatch => 'As novas senhas não coincidem';

  @override
  String get passwordChanged =>
      'Senha alterada. Os outros dispositivos conectados foram desconectados.';

  @override
  String get passwordInvalid => 'A senha atual está incorreta';

  @override
  String get passwordChangeUnsupported =>
      'Esta versão do servidor não oferece suporte à alteração segura de senha no Absorb';

  @override
  String get passwordChangeFailed => 'Não foi possível alterar sua senha';

  @override
  String get otherUserPasswordResetWarning =>
      'Alterar esta senha desconecta o usuário em todos os dispositivos.';

  @override
  String get manageSessionsTitle => 'Dispositivos conectados';

  @override
  String get manageSessionsSubtitle =>
      'Revise e remova sessões do Audiobookshelf';

  @override
  String get sessionsCurrent => 'Dispositivo atual';

  @override
  String get sessionsUnknownDevice => 'Dispositivo desconhecido';

  @override
  String sessionsLastActive(String date) {
    return 'Última atividade em $date';
  }

  @override
  String get sessionsNone => 'Nenhuma sessão ativa';

  @override
  String get sessionsLoadMore => 'Carregar mais';

  @override
  String get sessionsUnsupported =>
      'O gerenciamento de sessões exige o Audiobookshelf 2.36 ou mais recente.';

  @override
  String get sessionsLoadFailed =>
      'Não foi possível carregar os dispositivos conectados';

  @override
  String get sessionsLegacyNotice =>
      'Este login não tem uma sessão de renovação, então o Absorb não consegue identificar este dispositivo na lista.';

  @override
  String get sessionsRemove => 'Desconectar dispositivo';

  @override
  String get sessionsRemoveTitle => 'Desconectar este dispositivo?';

  @override
  String get sessionsRemoveContent =>
      'Isso remove sua sessão de renovação. O acesso atual pode continuar funcionando até que o token de curta duração expire.';

  @override
  String get sessionsRemoved => 'Dispositivo desconectado';

  @override
  String get sessionsRemoveFailed =>
      'Não foi possível desconectar esse dispositivo';

  @override
  String get sessionsSignOutAll => 'Desconectar todos os dispositivos';

  @override
  String get sessionsSignOutAllTitle => 'Sair em todos os lugares?';

  @override
  String get sessionsSignOutAllContent =>
      'Isso remove todas as sessões de renovação, incluindo este dispositivo. Os tokens de acesso existentes podem funcionar até expirarem.';

  @override
  String podcastScheduleServerTime(String timeZone) {
    return 'A programação usa o horário do servidor ($timeZone)';
  }

  @override
  String get podcastScheduleServerTimeUnknown =>
      'A programação usa o horário do servidor';

  @override
  String get editServerAddressTitle => 'Editar endereço do servidor';

  @override
  String editServerAddressSubtitle(String username) {
    return 'Atualize o endereço de $username. Use isto se o endereço do seu servidor mudou - é o mesmo servidor, apenas com uma nova URL. Suas estatísticas e downloads são mantidos.';
  }

  @override
  String get editServerAddressField => 'Endereço do servidor';

  @override
  String get editServerAddressUpdated => 'Endereço do servidor atualizado';

  @override
  String get editServerAddressFailed =>
      'Não foi possível atualizar o endereço do servidor';

  @override
  String get editServerAddressAction => 'Editar endereço do servidor';

  @override
  String get editServerConnectionTitle => 'Editar conexão com o servidor';

  @override
  String editServerConnectionSubtitle(String username) {
    return 'Atualize o endereço do servidor e os cabeçalhos personalizados de $username. Suas estatísticas e downloads são mantidos.';
  }

  @override
  String get editServerConnectionAction => 'Editar conexão com o servidor';

  @override
  String get editServerConnectionUpdated => 'Conexão com o servidor atualizada';

  @override
  String get editServerConnectionFailed =>
      'Não foi possível atualizar a conexão com o servidor';

  @override
  String get editCustomHeadersDescription =>
      'Usados para túneis Cloudflare ou proxies reversos. Estes cabeçalhos valem apenas para esta conta salva.';

  @override
  String get removeAccountAction => 'Remover conta';

  @override
  String get removeAccountTitle => 'Remover conta?';

  @override
  String removeAccountContent(String username, String server) {
    return 'Remover $username em $server das contas salvas?\n\nVocê sempre pode adicioná-la de volta entrando novamente.';
  }

  @override
  String get switchAccountTitle => 'Trocar de conta?';

  @override
  String switchAccountContent(String username, String server) {
    return 'Trocar para $username em $server?\n\nA reprodução atual será interrompida e o app será recarregado com os dados da outra conta.';
  }

  @override
  String get switchButton => 'Trocar';

  @override
  String get downloadLocationSheetTitle => 'Local de download';

  @override
  String get downloadLocationSheetSubtitle =>
      'Escolha onde os audiolivros são salvos';

  @override
  String get currentLocation => 'Local atual';

  @override
  String get existingDownloadsWarning =>
      'Os downloads existentes permanecem no local atual. Somente os novos downloads usam o novo caminho.';

  @override
  String get chooseFolder => 'Escolher pasta';

  @override
  String get chooseDownloadFolder => 'Escolher pasta de download';

  @override
  String get storagePermissionDenied =>
      'Permissão de armazenamento negada permanentemente - ative-a nas configurações do app';

  @override
  String get openSettings => 'Abrir configurações';

  @override
  String get storagePermissionRequired =>
      'A permissão de armazenamento é necessária para locais de download personalizados';

  @override
  String get cannotWriteToFolder =>
      'Não é possível gravar nessa pasta - escolha outro local ou conceda acesso a arquivos nas configurações do sistema';

  @override
  String downloadLocationSetTo(String label) {
    return 'Local de download definido como $label';
  }

  @override
  String get resetToDefault => 'Restaurar padrão';

  @override
  String get resetToDefaultStorage => 'Restaurar armazenamento padrão';

  @override
  String legacyDownloadsNotice(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count downloads estão em uma pasta personalizada antiga que não pode mais ser aberta. Baixe-os novamente ou dispense este aviso.',
      one:
          '1 download está em uma pasta personalizada antiga que não pode mais ser aberta. Baixe-o novamente ou dispense este aviso.',
    );
    return '$_temp0';
  }

  @override
  String get redownload => 'Baixar novamente';

  @override
  String get redownloadStarted => 'Baixando novamente';

  @override
  String get dismiss => 'Dispensar';

  @override
  String get tipsAndHiddenFeatures => 'Dicas e recursos ocultos';

  @override
  String get tipsSubtitle => 'Aproveite o Absorb ao máximo';

  @override
  String get adminTitle => 'Administração do servidor';

  @override
  String get adminTasksTitle => 'Atividade do servidor';

  @override
  String adminTasksRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tarefas em execução',
      one: '1 tarefa em execução',
    );
    return '$_temp0';
  }

  @override
  String get adminTasksRecent => 'Atividade recente do servidor';

  @override
  String get adminTasksEmpty => 'Nenhuma tarefa do servidor em execução';

  @override
  String adminTaskScanSummary(int added, int updated, int missing) {
    return '$added adicionados - $updated atualizados - $missing ausentes';
  }

  @override
  String get adminServer => 'Servidor';

  @override
  String get adminVersion => 'Versão';

  @override
  String get adminUsers => 'Usuários';

  @override
  String get adminOnline => 'Online';

  @override
  String get adminBackup => 'Backup';

  @override
  String get adminPurgeCache => 'Limpar cache';

  @override
  String get adminManage => 'Gerenciar';

  @override
  String adminUsersSubtitle(int userCount, int onlineCount) {
    return '$userCount contas - $onlineCount online';
  }

  @override
  String get adminPodcasts => 'Podcasts';

  @override
  String get adminPodcastsSubtitle =>
      'Pesquisar, adicionar e gerenciar programas';

  @override
  String get adminScan => 'Verificar';

  @override
  String get adminScanning => 'Verificando...';

  @override
  String get adminMatchAll => 'Corresponder tudo';

  @override
  String get adminMatching => 'Correspondendo...';

  @override
  String get adminMatchAllTitle => 'Corresponder todos os itens?';

  @override
  String adminMatchAllContent(String name) {
    return 'Corresponder metadados de todos os itens em $name? Isso pode demorar.';
  }

  @override
  String adminScanStarted(String name) {
    return 'Verificação iniciada para $name';
  }

  @override
  String get adminBackupCreated => 'Backup criado';

  @override
  String get adminBackupFailed => 'Falha no backup';

  @override
  String get adminCachePurged => 'Cache limpo';

  @override
  String get adminRmab => 'ReadMeABook';

  @override
  String get adminRmabSubtitle => 'Abrir no app';

  @override
  String get adminRmabAdd => 'Adicionar integração com o ReadMeABook';

  @override
  String get adminRmabUrlTitle => 'URL do ReadMeABook';

  @override
  String get adminRmabUrlHelp =>
      'Cole sua URL com o token de login. Gere um no RMAB, em Admin, Usuários.';

  @override
  String get adminRmabUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get adminRmabInvalidUrl => 'Informe uma URL http(s) válida';

  @override
  String get adminRmabSaved => 'ReadMeABook salvo';

  @override
  String get adminRmabRemoved => 'ReadMeABook removido';

  @override
  String get adminRmabReload => 'Recarregar';

  @override
  String get adminRmabLoadFailed =>
      'Não foi possível carregar o ReadMeABook. Verifique sua URL.';

  @override
  String get adminRmabConnected => 'Conectado';

  @override
  String get adminRmabAskAdmin =>
      'Peça uma URL de login ao administrador do servidor';

  @override
  String get adminRmabUrlHelpUser =>
      'Peça uma URL de login ao administrador do servidor. Ele a gera em RMAB > Admin > Usuários.';

  @override
  String get adminRmabSettingsInfo =>
      'O ReadMeABook é um serviço auto-hospedado para pedir e baixar audiolivros. Ele deve ser instalado e configurado pelo administrador do servidor.';

  @override
  String get rmabConfigTitle => 'Conectar o ReadMeABook';

  @override
  String get rmabConfigExplainerAdmin =>
      'O ReadMeABook é um serviço auto-hospedado para pedir audiolivros. Gere um token de API no RMAB em Admin Dashboard > Settings > API e cole abaixo a URL do servidor e o token. O Absorb não hospeda nem baixa nenhum conteúdo, apenas envia pedidos ao seu servidor.';

  @override
  String get rmabConfigExplainerUser =>
      'O ReadMeABook é um serviço auto-hospedado para pedir audiolivros. Peça ao administrador do servidor a URL do RMAB e um token de API. O Absorb não hospeda nem baixa nenhum conteúdo, apenas envia pedidos ao seu servidor.';

  @override
  String get rmabConfigLearnMore => 'Saiba mais sobre o ReadMeABook';

  @override
  String get rmabConfigBaseUrlLabel => 'URL do servidor RMAB';

  @override
  String get rmabConfigBaseUrlHint => 'https://rmab.example.com';

  @override
  String get rmabConfigTokenLabel => 'Token de API';

  @override
  String get rmabConfigTokenHint => 'rmab_...';

  @override
  String get rmabConfigLegacyUrlLabel =>
      'URL de login da interface web (opcional)';

  @override
  String get rmabConfigLegacyUrlHint => 'https://rmab.example.com/?token=...';

  @override
  String get rmabConfigLegacyUrlHelp =>
      'Cole sua URL de login automático para que \'Abrir na visualização do navegador\' já abra conectado. Deixe em branco para usar um login normal.';

  @override
  String get rmabConfigHeadersHelp =>
      'Cabeçalhos extras enviados com cada requisição ao ReadMeABook, para proxies reversos como o Cloudflare Access.';

  @override
  String get rmabConfigConnect => 'Conectar';

  @override
  String get rmabConfigDisconnect => 'Desconectar';

  @override
  String get rmabConfigOpenWebView => 'Abrir na visualização do navegador';

  @override
  String rmabConfigConnectedAs(String name) {
    return 'Conectado como $name';
  }

  @override
  String get rmabConfigErrorInvalidUrl => 'Informe uma URL http(s) válida';

  @override
  String get rmabConfigErrorMissingToken => 'Informe seu token de API';

  @override
  String get rmabConfigErrorUnauthorized => 'Token rejeitado pelo servidor';

  @override
  String get rmabConfigErrorForbidden =>
      'Este token não tem permissão para essa ação';

  @override
  String get rmabConfigErrorNetwork =>
      'Não foi possível acessar o RMAB. Verifique a URL.';

  @override
  String get rmabConfigErrorGeneric => 'Não foi possível conectar';

  @override
  String get rmabConfigSavedSnackbar => 'ReadMeABook conectado';

  @override
  String get rmabConfigDisconnectedSnackbar => 'ReadMeABook desconectado';

  @override
  String get rmabRequestCta => 'Pedir via ReadMeABook';

  @override
  String get rmabSearchHeader => 'Pedir via ReadMeABook';

  @override
  String get rmabSearchHint => 'Pesquisar por título ou autor';

  @override
  String get rmabSearchEmpty =>
      'Nenhuma correspondência no seu servidor ReadMeABook';

  @override
  String get rmabSearchError => 'Não foi possível pesquisar no ReadMeABook';

  @override
  String get rmabSearchPrompt => 'Digite um título ou autor para pesquisar';

  @override
  String get rmabSearchFooterPrompt => 'Procurando outra coisa?';

  @override
  String rmabSearchFooterCta(String query) {
    return 'Pesquisar \"$query\" no ReadMeABook';
  }

  @override
  String get rmabBookDetailExplainer =>
      'Este pedido será enviado pelo seu servidor ReadMeABook. O administrador irá analisá-lo e processá-lo. Você pode acompanhá-lo em Meus pedidos, no bloco do ReadMeABook.';

  @override
  String get rmabBookAlreadyAvailable => 'Já está na sua biblioteca';

  @override
  String get rmabBookAlreadyRequested => 'Já pedido';

  @override
  String get rmabRequestSubmitting => 'Enviando…';

  @override
  String get rmabRequestSent => 'Pedido enviado';

  @override
  String get rmabRequestErrorAlreadyAvailable => 'Já está na sua biblioteca';

  @override
  String get rmabRequestErrorBeingProcessed => 'Já está sendo processado';

  @override
  String get rmabRequestErrorDuplicate => 'Você já pediu este livro';

  @override
  String get rmabRequestErrorValidation => 'Não foi possível enviar o pedido';

  @override
  String get rmabRequestErrorUserNotFound =>
      'O usuário do token não existe mais. Reconecte o ReadMeABook.';

  @override
  String get rmabRequestErrorIgnored =>
      'Este livro está na sua lista de ignorados';

  @override
  String get rmabRequestErrorGeneric => 'Não foi possível enviar o pedido';

  @override
  String get rmabRequestErrorTokenRejected =>
      'Token rejeitado pelo servidor. Reconecte o ReadMeABook.';

  @override
  String get rmabMyRequestsTab => 'Meus pedidos';

  @override
  String get rmabSetupTab => 'Configuração';

  @override
  String get rmabMyRequestsEmpty => 'Você ainda não pediu nenhum livro';

  @override
  String get rmabMyRequestsError => 'Não foi possível carregar os pedidos';

  @override
  String get rmabMyRequestsRefresh => 'Atualizar';

  @override
  String get rmabRequestDetailTitle => 'Detalhes do pedido';

  @override
  String get rmabRequestDetailStatus => 'Status';

  @override
  String get rmabRequestDetailRequestedOn => 'Pedido em';

  @override
  String get rmabRequestDetailCompletedOn => 'Concluído em';

  @override
  String get rmabRequestDetailProgress => 'Progresso';

  @override
  String get rmabStatusActive => 'Em andamento';

  @override
  String get rmabStatusWaiting => 'Aguardando';

  @override
  String get rmabStatusAvailable => 'Disponível';

  @override
  String get rmabStatusDownloaded => 'Baixado';

  @override
  String get rmabStatusFailed => 'Falhou';

  @override
  String get rmabStatusCancelled => 'Cancelado';

  @override
  String get rmabStatusDenied => 'Negado';

  @override
  String get rmabStatusUnknown => 'Desconhecido';

  @override
  String narratedBy(String narrator) {
    return 'Narrado por $narrator';
  }

  @override
  String get onAudible => 'no Audible';

  @override
  String percentComplete(String percent) {
    return '$percent% concluído';
  }

  @override
  String get absorbing => 'Absorvendo...';

  @override
  String get absorbAgain => 'Absorver novamente';

  @override
  String get absorb => 'Absorver';

  @override
  String get ebookOnlyNoAudio => 'Somente e-book - sem áudio';

  @override
  String get absorbAudioNotDownloaded => 'Áudio não baixado';

  @override
  String get absorbAudioNotDownloadedEbookOnly =>
      'Áudio não baixado, somente e-book';

  @override
  String get fullyAbsorbed => 'Totalmente absorvido';

  @override
  String get fullyAbsorbAction => 'Absorver totalmente';

  @override
  String get removeFromAbsorbing => 'Remover do Absorbing';

  @override
  String get addToAbsorbing => 'Adicionar ao Absorbing';

  @override
  String get absorbNext => 'Absorver a seguir';

  @override
  String get absorbNextAdded => 'A seguir no Absorbing';

  @override
  String get absorbLast => 'Absorver por último';

  @override
  String get absorbNextHint => 'Logo depois do que está tocando agora';

  @override
  String get absorbLastHint => 'No fim da lista';

  @override
  String get removedFromAbsorbing => 'Removido do Absorbing';

  @override
  String get addedToAbsorbing => 'Adicionado ao Absorbing';

  @override
  String get removeFromContinueListening => 'Remover de Continuar ouvindo';

  @override
  String get removedFromContinueListening => 'Removido de Continuar ouvindo';

  @override
  String get removeFromContinueReading => 'Remover de Continuar lendo';

  @override
  String get removedFromContinueReading => 'Removido de Continuar lendo';

  @override
  String get sessionAdd => 'Adicionar sessão';

  @override
  String get sessionStartLabel => 'Iniciada às';

  @override
  String get sessionAdded => 'Sessão adicionada';

  @override
  String get sessionAddFailed => 'Não foi possível adicionar a sessão';

  @override
  String get removeSeriesFromContinueSeries => 'Remover de Continuar série';

  @override
  String get removedSeriesFromContinueSeries => 'Removido de Continuar série';

  @override
  String get couldNotUpdate => 'Não foi possível atualizar, tente novamente';

  @override
  String get addToPlaylist => 'Adicionar à playlist';

  @override
  String get addToCollection => 'Adicionar à coleção';

  @override
  String get downloadEbook => 'Baixar e-book';

  @override
  String get downloadEbookAgain => 'Baixar e-book novamente';

  @override
  String get resetProgress => 'Zerar progresso';

  @override
  String get lookupLocalMetadata => 'Buscar metadados locais';

  @override
  String get reLookupLocalMetadata => 'Buscar metadados locais novamente';

  @override
  String get clearLocalMetadata => 'Limpar metadados locais';

  @override
  String get searchOnGoodreads => 'Pesquisar no Goodreads';

  @override
  String get editServerDetails => 'Editar detalhes no servidor';

  @override
  String get encodeTab => 'Codificar';

  @override
  String get codec => 'Codec';

  @override
  String get bitrate => 'Taxa de bits';

  @override
  String get channels => 'Canais';

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Estéreo';

  @override
  String get startM4bEncode => 'Iniciar codificação M4B';

  @override
  String get encodeStarted => 'Codificação M4B iniciada';

  @override
  String get encodeFailed => 'Falha ao iniciar a codificação';

  @override
  String get encodeFinished => 'Codificação M4B concluída';

  @override
  String get currentlyLabel => 'Atualmente:';

  @override
  String encodeOutputPathNote(String path) {
    return 'O M4B finalizado será colocado na sua pasta de audiolivros em: $path/';
  }

  @override
  String encodeBackupNote(String itemId) {
    return 'Um backup dos seus arquivos de áudio originais será armazenado em: /metadata/cache/items/$itemId/. Lembre-se de limpar o cache de itens periodicamente.';
  }

  @override
  String get encodeTimeNote => 'A codificação pode levar até 30 minutos.';

  @override
  String get encodeRescanNote =>
      'Se o monitoramento de pastas estiver desativado, será preciso verificar este audiolivro novamente depois.';

  @override
  String get aboutSection => 'Sobre';

  @override
  String chaptersCount(int count) {
    return 'Capítulos ($count)';
  }

  @override
  String audioTracksCount(int count) {
    return 'Faixas de áudio ($count)';
  }

  @override
  String libraryFilesCount(int count) {
    return 'Arquivos da biblioteca ($count)';
  }

  @override
  String get chapters => 'Capítulos';

  @override
  String get noChaptersBook => 'Este livro não tem capítulos';

  @override
  String get noChaptersPodcast => 'Este podcast não tem capítulos';

  @override
  String get failedToLoad => 'Falha ao carregar';

  @override
  String startedDate(String date) {
    return 'Iniciado em $date';
  }

  @override
  String finishedDate(String date) {
    return 'Concluído em $date';
  }

  @override
  String andCountMore(int count) {
    return 'e mais $count';
  }

  @override
  String get markAsFullyAbsorbedQuestion => 'Marcar como totalmente absorvido?';

  @override
  String get markAsFullyAbsorbedContent =>
      'Isso definirá seu progresso como 100% e interromperá a reprodução se este livro estiver tocando.';

  @override
  String get markedAsFinishedNiceWork =>
      'Marcado como concluído - bom trabalho!';

  @override
  String get failedToUpdateCheckConnection =>
      'Falha ao atualizar - verifique sua conexão';

  @override
  String get markAsNotFinishedQuestion => 'Marcar como não concluído?';

  @override
  String get markAsNotFinishedContent =>
      'Isso limpará o status de concluído e voltará sua posição para o início.';

  @override
  String get unmark => 'Desmarcar';

  @override
  String get markedAsNotFinishedBackAtIt =>
      'Marcado como não concluído - vamos lá de novo!';

  @override
  String get resetProgressQuestion => 'Zerar progresso?';

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
  String get progressResetFreshStart => 'Progresso zerado - recomeço!';

  @override
  String get clearLocalMetadataQuestion => 'Limpar metadados locais?';

  @override
  String get clearLocalMetadataContent =>
      'Isso removerá os metadados armazenados localmente e voltará ao que o servidor tem.';

  @override
  String get localMetadataCleared => 'Metadados locais limpos';

  @override
  String get saveEbook => 'Salvar e-book';

  @override
  String get noEbookFileFound => 'Nenhum arquivo de e-book encontrado';

  @override
  String get bookmark => 'Marcador';

  @override
  String get bookmarks => 'Marcadores';

  @override
  String bookmarksWithCount(int count) {
    return 'Marcadores ($count)';
  }

  @override
  String get playbackSpeed => 'Velocidade de reprodução';

  @override
  String get noBookmarksYet => 'Nenhum marcador ainda';

  @override
  String get longPressBookmarkHint =>
      'Mantenha pressionado o botão de marcador para salvar rapidamente';

  @override
  String get addBookmark => 'Adicionar marcador';

  @override
  String get editBookmark => 'Editar marcador';

  @override
  String get titleLabel => 'Título';

  @override
  String get noteOptionalLabel => 'Nota (opcional)';

  @override
  String get editLayout => 'Editar layout';

  @override
  String get inMenu => 'No menu';

  @override
  String get bookmarkAdded => 'Marcador adicionado';

  @override
  String get startPlayingSomethingFirst => 'Comece a reproduzir algo primeiro';

  @override
  String get playbackHistory => 'Histórico de reprodução';

  @override
  String get historyLocalTab => 'Histórico';

  @override
  String get historyServerTab => 'Sessões';

  @override
  String get historyNoServerSessions =>
      'Ainda não há sessões do servidor para este item';

  @override
  String get historyServerLoadFailed =>
      'Não foi possível carregar as sessões do servidor';

  @override
  String get clearHistoryTooltip => 'Limpar histórico';

  @override
  String get tapEventToJump => 'Toque em um evento para ir a essa posição';

  @override
  String get noHistoryYet => 'Nenhum histórico ainda';

  @override
  String jumpedToPosition(String position) {
    return 'Foi para $position';
  }

  @override
  String booksInSeriesCount(int count) {
    return '$count livros nesta série';
  }

  @override
  String bookNumber(String number) {
    return 'Livro $number';
  }

  @override
  String downloadRemainingCount(int count) {
    return 'Baixar restantes ($count)';
  }

  @override
  String get downloadAll => 'Baixar tudo';

  @override
  String get markAllNotFinished => 'Marcar todos como não concluídos';

  @override
  String get markAllFinished => 'Marcar todos como concluídos';

  @override
  String get markAllNotFinishedQuestion => 'Marcar todos como não concluídos?';

  @override
  String get fullyAbsorbSeries => 'Absorver a série totalmente?';

  @override
  String get turnAutoDownloadOff => 'Desativar download automático';

  @override
  String get turnAutoDownloadOn => 'Ativar download automático';

  @override
  String get autoDownloadThisSeries => 'Baixar esta série automaticamente?';

  @override
  String get autoDownloadSeriesContent =>
      'Baixa automaticamente os próximos livros conforme você ouve.';

  @override
  String get standalone => 'Avulsos';

  @override
  String get episodes => 'Episódios';

  @override
  String get noEpisodesFound => 'Nenhum episódio encontrado';

  @override
  String get markFinished => 'Marcar como concluído';

  @override
  String get markUnfinished => 'Marcar como não concluído';

  @override
  String get allEpisodes => 'Todos os episódios';

  @override
  String get aboutThisEpisode => 'Sobre este episódio';

  @override
  String get reversePlayOrder => 'Inverter ordem de reprodução';

  @override
  String selectedCount(int count) {
    return '$count selecionado(s)';
  }

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String get deselectAll => 'Desmarcar tudo';

  @override
  String get autoDownloadThisPodcast => 'Baixar este podcast automaticamente?';

  @override
  String get autoDownloadPodcastContent =>
      'Baixa automaticamente os próximos episódios conforme você ouve.';

  @override
  String get download => 'Baixar';

  @override
  String get deleteDownload => 'Excluir download';

  @override
  String get casting => 'Transmitindo';

  @override
  String get castingTo => 'Transmitindo para';

  @override
  String get editDetails => 'Editar detalhes';

  @override
  String get quickMatch => 'Correspondência rápida';

  @override
  String get quickMatchNoUpdates => 'Nenhuma atualização necessária';

  @override
  String get custom => 'Personalizado';

  @override
  String get authorOptionalLabel => 'Autor (opcional)';

  @override
  String get noResultsFound =>
      'Nenhum resultado encontrado.\nTente ajustar sua pesquisa ou o provedor.';

  @override
  String get searchForMetadataAbove => 'Pesquise metadados acima';

  @override
  String get applyThisMatch => 'Aplicar esta correspondência?';

  @override
  String get metadataUpdated => 'Metadados atualizados';

  @override
  String get failedToUpdateMetadata => 'Falha ao atualizar os metadados';

  @override
  String get subtitleLabel => 'Subtítulo';

  @override
  String get authorLabel => 'Autor';

  @override
  String get narratorLabel => 'Narrador';

  @override
  String get seriesLabel => 'Série';

  @override
  String get addSeries => 'Adicionar série';

  @override
  String get removeSeries => 'Remover série';

  @override
  String get descriptionLabel => 'Descrição';

  @override
  String get publisherLabel => 'Editora';

  @override
  String get yearLabel => 'Ano';

  @override
  String get genresLabel => 'Gêneros';

  @override
  String get tagsLabel => 'Tags';

  @override
  String get commaSeparated => 'Separados por vírgula';

  @override
  String get asinLabel => 'ASIN';

  @override
  String get isbnLabel => 'ISBN';

  @override
  String get coverImage => 'Imagem da capa';

  @override
  String get coverRemove => 'Remover capa';

  @override
  String get coverRemoveConfirm =>
      'Remover a capa deste livro? Será exibido o cartão de título gerado no lugar.';

  @override
  String get coverRemoved => 'Capa removida';

  @override
  String get coverRemoveFailed => 'Não foi possível remover a capa';

  @override
  String get coverUrlLabel => 'URL da capa';

  @override
  String get coverUrlHint => 'https://...';

  @override
  String get localMetadata => 'Metadados locais';

  @override
  String get overrideLocalDisplay => 'Substituir exibição local';

  @override
  String get metadataSavedLocally => 'Metadados salvos localmente';

  @override
  String get notes => 'Notas';

  @override
  String get newNote => 'Nova nota';

  @override
  String get editNote => 'Editar nota';

  @override
  String get noNotesYet => 'Nenhuma nota ainda';

  @override
  String get markdownIsSupported => 'Markdown é compatível';

  @override
  String get markdownMd => 'Markdown (.md)';

  @override
  String get keepsFormattingIntact => 'Mantém a formatação intacta';

  @override
  String get plainTextTxt => 'Texto simples (.txt)';

  @override
  String get simpleTextNoFormatting => 'Texto simples, sem formatação';

  @override
  String get untitledNote => 'Nota sem título';

  @override
  String get titleHint => 'Título';

  @override
  String get noteBodyHint => 'Escreva sua nota... (compatível com markdown)';

  @override
  String get nothingToPreview => 'Nada para pré-visualizar';

  @override
  String get audioEnhancements => 'Melhorias de áudio';

  @override
  String get presets => 'PREDEFINIÇÕES';

  @override
  String get equalizer => 'EQUALIZADOR';

  @override
  String get effects => 'EFEITOS';

  @override
  String get bassBoost => 'Reforço de graves';

  @override
  String get surround => 'Surround';

  @override
  String get loudness => 'Loudness';

  @override
  String get monoAudio => 'Áudio mono';

  @override
  String get skipSilence => 'Pular silêncio';

  @override
  String get resetAll => 'Restaurar tudo';

  @override
  String get collectionNotFound => 'Coleção não encontrada';

  @override
  String get deleteCollection => 'Excluir coleção';

  @override
  String get deleteCollectionContent =>
      'Tem certeza de que deseja excluir esta coleção?';

  @override
  String get deleteCollectionFailed => 'Não foi possível excluir a coleção';

  @override
  String get deletePermissionRequired =>
      'É necessária a permissão de exclusão. Peça ao administrador root que a conceda a você.';

  @override
  String get deleteFilesCheckbox => 'Excluir também os arquivos no servidor';

  @override
  String get deleteFilesCheckedHint =>
      'Os arquivos são excluídos do servidor definitivamente.';

  @override
  String get deleteFilesUncheckedHint =>
      'Os arquivos permanecem no servidor, então a próxima verificação da biblioteca pode adicioná-lo de volta.';

  @override
  String get deleteFromServerAction => 'Excluir do servidor';

  @override
  String get deleteFromServerTitle => 'Excluir do servidor';

  @override
  String deleteFromServerContent(String title) {
    return 'Excluir \"$title\" do Audiobookshelf?';
  }

  @override
  String deletedFromServer(String title) {
    return '\"$title\" excluído';
  }

  @override
  String get deleteFromServerFailed =>
      'Não foi possível excluir. Verifique os logs do servidor.';

  @override
  String get playlistNotFound => 'Playlist não encontrada';

  @override
  String get deletePlaylist => 'Excluir playlist';

  @override
  String get deletePlaylistContent =>
      'Tem certeza de que deseja excluir esta playlist?';

  @override
  String get newPlaylist => 'Nova playlist';

  @override
  String get playlistNameHint => 'Nome da playlist';

  @override
  String addedToName(String name) {
    return 'Adicionado a \"$name\"';
  }

  @override
  String get failedToAdd => 'Falha ao adicionar';

  @override
  String get newCollection => 'Nova coleção';

  @override
  String get collectionNameHint => 'Nome da coleção';

  @override
  String get listsNewCollectionSubtitle =>
      'Agrupe livros em uma lista que você mantém';

  @override
  String get listsNewCollectionNeedsBookSubtitle =>
      'Comece com pelo menos um livro';

  @override
  String get listsNewPlaylistSubtitle => 'Organize livros para ouvir em ordem';

  @override
  String get listsAddBooksNow => 'Adicionar livros agora';

  @override
  String get listsPickBooksNext =>
      'Você escolherá os livros em seguida. Uma coleção neste servidor precisa de pelo menos um.';

  @override
  String get listsCreate => 'Criar';

  @override
  String get listsCollectionNeedsBook =>
      'Uma coleção precisa de pelo menos um livro, então nada foi criado.';

  @override
  String get listsCreateFailed => 'Não foi possível criar';

  @override
  String get castToDevice => 'Transmitir para dispositivo';

  @override
  String get searchingForCastDevices => 'Procurando dispositivos Cast...';

  @override
  String get castDevice => 'Dispositivo Cast';

  @override
  String get stopCasting => 'Parar transmissão';

  @override
  String get disconnect => 'Desconectar';

  @override
  String get audioOutput => 'Saída de áudio';

  @override
  String get noOutputDevicesFound => 'Nenhum dispositivo de saída encontrado';

  @override
  String get welcomeToAbsorb => 'Bem-vindo ao Absorb Plus';

  @override
  String get welcomeTagline => 'Um cliente do Audiobookshelf.';

  @override
  String get welcomeAbsorbingTitle => 'Absorbing';

  @override
  String get welcomeAbsorbingIntro =>
      'Usamos \"absorver\" no lugar de \"reproduzir\" e \"ouvir\". Prefere os termos clássicos? Mude nas Configurações.';

  @override
  String get welcomeAbsorbingTabBullet =>
      'Aba Absorbing - o que você está ouvindo no momento';

  @override
  String get welcomeAbsorbButtonBullet =>
      'Botão Absorver - inicia a reprodução';

  @override
  String get welcomeFullyAbsorbBullet =>
      'Absorver totalmente - marca como concluído';

  @override
  String get welcomeGettingAroundTitle => 'Como navegar';

  @override
  String get welcomeGettingAroundBody =>
      'Toque em qualquer capa para abrir seus detalhes. Os cartões de Continuar ouvindo são diferentes - toque para reproduzir na hora, mantenha pressionado para abrir os detalhes.';

  @override
  String get welcomeMakeItYoursTitle => 'Deixe com a sua cara';

  @override
  String get welcomeMakeItYoursBody =>
      'Explore as Configurações para ajustar o Absorb ao seu gosto. A seção Dicas e recursos ocultos vale uma olhada.';

  @override
  String get getStarted => 'Começar';

  @override
  String get showMore => 'Mostrar mais';

  @override
  String get showLess => 'Mostrar menos';

  @override
  String get readMore => 'Ler mais';

  @override
  String get removeDownloadQuestion => 'Remover download?';

  @override
  String get removeDownloadContent => 'Isto será removido do seu dispositivo.';

  @override
  String get removeWhichDownload =>
      'O audiolivro e o e-book estão neste dispositivo. Escolha o que remover.';

  @override
  String get downloadRemoved => 'Download removido';

  @override
  String get finished => 'Concluído';

  @override
  String get saved => 'Baixado';

  @override
  String get selectLibrary => 'Selecionar biblioteca';

  @override
  String get switchLibraryTooltip => 'Trocar de biblioteca';

  @override
  String get refreshTooltip => 'Atualizar';

  @override
  String get noBooksFound => 'Nenhum livro encontrado';

  @override
  String get userFallback => 'Usuário';

  @override
  String get rootAdmin => 'Administrador root';

  @override
  String get admin => 'Administrador';

  @override
  String get serverAdmin => 'Administração do servidor';

  @override
  String get serverAdminSubtitle =>
      'Gerencie usuários, bibliotecas e configurações do servidor';

  @override
  String serverUpdateAvailable(String version) {
    return 'Atualização do servidor $version disponível';
  }

  @override
  String get justNow => 'Agora mesmo';

  @override
  String minutesAgo(int count) {
    return 'há $count min';
  }

  @override
  String hoursAgo(int count) {
    return 'há $count h';
  }

  @override
  String daysAgo(int count) {
    return 'há $count d';
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
  String get coverPlayPause => 'Reproduzir/pausar pela capa';

  @override
  String get coverPlayPauseOnSubtitle =>
      'Ativado - toque na capa para reproduzir/pausar';

  @override
  String get coverPlayPauseOffSubtitle =>
      'Desativado - botão de reproduzir/pausar dedicado nos controles';

  @override
  String get cardBackground => 'Fundo do cartão';

  @override
  String get cardBackgroundBlurred => 'Desfocado';

  @override
  String get cardBackgroundGradient => 'Gradiente';

  @override
  String get queueModeMergedSubtitle =>
      'A reprodução para, fila manual ou reprodução automática do próximo item';

  @override
  String get queueModeSeriesLabel => 'Série';

  @override
  String get queueModeShowLabel => 'Programa';

  @override
  String get queueModeInfoSeries => 'Série';

  @override
  String get queueModeInfoSeriesDesc =>
      'Reproduz automaticamente o próximo livro de uma série ou o próximo episódio de um podcast.';

  @override
  String get resetButtonGridQuestion => 'Restaurar grade de botões?';

  @override
  String get resetButtonGridContent =>
      'Isso restaurará o layout, a ordem e as opções de alternância padrão dos botões.';

  @override
  String get reset => 'Restaurar';

  @override
  String get buttonGridReset => 'Grade de botões restaurada';

  @override
  String get resetButtonGrid => 'Restaurar grade de botões';

  @override
  String get chapterBarrierOnRewind => 'Limite de capítulo ao retroceder';

  @override
  String get chapterBarrierInfoTitle => 'Limite de capítulo';

  @override
  String get chapterBarrierInfoContent =>
      'Ao voltar, a reprodução vai para o início do capítulo atual em vez de passar para o anterior.\n\nToque duas vezes no botão de voltar em até 2 segundos para ultrapassar o limite.';

  @override
  String get chapterBarrierOnRewindOnSubtitle =>
      'Ativado - o retrocesso para no início do capítulo';

  @override
  String get chapterBarrierOnRewindOffSubtitle =>
      'Desativado - o retrocesso cruza os limites de capítulo';

  @override
  String autoRewindOnSubtitleFormat(String min, String max) {
    return 'Ativado - de ${min}s a ${max}s conforme a duração da pausa';
  }

  @override
  String get rewindOnSessionStart => 'Retroceder ao iniciar sessão';

  @override
  String get rewindOnSessionStartInfoContent =>
      'O retrocesso automático normal ocorre quando você retoma após uma pausa dentro de uma sessão ativa. Esta configuração adiciona um retrocesso ao iniciar uma sessão totalmente nova - por exemplo, depois que o app foi fechado, a reprodução foi interrompida ou você abre o app do zero.\n\nQuando ativada, a reprodução retrocede o valor máximo completo no início de cada nova sessão para você reouvir de onde parou.';

  @override
  String rewindOnSessionStartOnSubtitle(String seconds) {
    return 'Ativado - retrocede ${seconds}s ao iniciar uma nova sessão';
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
    return 'pausa de ${seconds}s';
  }

  @override
  String rewindMinPause(String minutes) {
    return 'pausa de $minutes min';
  }

  @override
  String rewindHrPause(String hours) {
    return 'pausa de $hours h';
  }

  @override
  String get rewindOneHrPause => 'pausa de 1 h';

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
  String get chimeBeforeSleep => 'Sinal sonoro antes de dormir';

  @override
  String get chimeBeforeSleepOnSubtitle =>
      'Toca um sino suave quando o temporizador está prestes a terminar';

  @override
  String get chimeBeforeSleepOffSubtitle => 'Sem aviso sonoro antes de dormir';

  @override
  String get windDownDuration => 'Duração da contagem final';

  @override
  String windDownDurationSubtitle(int seconds) {
    return 'O fade e o sinal começam ${seconds}s antes de dormir';
  }

  @override
  String fadeVolumeOnSubtitleDynamic(int seconds) {
    return 'Reduz o volume gradualmente nos últimos ${seconds}s';
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
  String get endOfChapterShort => 'Fim do capítulo';

  @override
  String get endOfChapterOnSubtitle => 'Parar no fim do capítulo atual';

  @override
  String get endOfChapterOffSubtitle =>
      'Usar um temporizador com tempo definido';

  @override
  String get showExplicitBadge => 'Mostrar selo de conteúdo explícito';

  @override
  String get showExplicitBadgeOnSubtitle =>
      'Itens explícitos mostram um selo \"E\"';

  @override
  String get showExplicitBadgeOffSubtitle =>
      'Desativado - selo de conteúdo explícito oculto';

  @override
  String get showEbookBadge => 'Mostrar selo de e-book';

  @override
  String get showEbookBadgeOnSubtitle =>
      'Livros com e-book mostram um ícone de livro na capa';

  @override
  String get showEbookBadgeOffSubtitle => 'Desativado - selo de e-book oculto';

  @override
  String get libraryFallback => 'Biblioteca';

  @override
  String get preReleaseUpdatesInfoTitle => 'Atualizações de pré-lançamento';

  @override
  String get preReleaseUpdatesInfoContent =>
      'Quando ativado, o verificador de atualizações também avisará sobre versões alfa e de pré-lançamento do GitHub. Elas podem ser menos estáveis, mas trazem os recursos e correções mais recentes.';

  @override
  String get includePreReleases => 'Incluir pré-lançamentos';

  @override
  String get includePreReleasesOnSubtitle =>
      'Ativado - verificando versões alfa e de pré-lançamento';

  @override
  String get includePreReleasesOffSubtitle =>
      'Desativado - apenas versões estáveis';

  @override
  String get setTooltip => 'Definir';

  @override
  String get saveAbsorbBackup => 'Salvar backup do Absorb';

  @override
  String get checkForUpdate => 'Verificar atualização';

  @override
  String get onLatestVersion => 'Você está na versão mais recente';

  @override
  String get updateAvailable => 'Atualização disponível';

  @override
  String get preReleaseAvailable => 'Pré-lançamento disponível';

  @override
  String updateDialogContent(String kind, String latest, String current) {
    return 'Uma nova $kind do Absorb está disponível: $latest\n\nVocê está na $current.';
  }

  @override
  String get updateKindPreRelease => 'versão de pré-lançamento';

  @override
  String get updateKindVersion => 'versão';

  @override
  String get downloadButton => 'Baixar';

  @override
  String get updateDownloading => 'Baixando atualização...';

  @override
  String get updateInstallPermissionDenied =>
      'Permissão de instalação negada. Ative \"Instalar apps desconhecidos\" para o Absorb nas configurações do sistema.';

  @override
  String get updateOpeningInBrowser =>
      'A atualização no app falhou, abrindo o navegador';

  @override
  String get sendToEreader => 'Enviar para o e-reader';

  @override
  String sendingToEreader(String device) {
    return 'Enviando para $device...';
  }

  @override
  String sendToEreaderSuccess(String device) {
    return 'Enviado para $device';
  }

  @override
  String get sendToEreaderFailed => 'Não foi possível enviar o e-book';

  @override
  String get pickEreaderDevice => 'Escolha um dispositivo';

  @override
  String get adminEmail => 'E-mail';

  @override
  String get adminEmailSubtitle => 'SMTP e dispositivos e-reader';

  @override
  String get smtpSection => 'SMTP';

  @override
  String get smtpSetupGuide => 'Guia de configuração';

  @override
  String get smtpHost => 'Host';

  @override
  String get smtpPort => 'Porta';

  @override
  String get smtpSecure => 'Seguro';

  @override
  String get smtpRejectUnauthorized => 'Rejeitar TLS não autorizado';

  @override
  String get smtpUser => 'Nome de usuário';

  @override
  String get smtpPass => 'Senha';

  @override
  String get smtpFromAddress => 'Endereço do remetente';

  @override
  String get smtpTestAddress => 'Endereço de teste';

  @override
  String get smtpSendTest => 'Enviar teste';

  @override
  String get smtpSaveSettings => 'Salvar';

  @override
  String get smtpSaved => 'Configurações de e-mail salvas';

  @override
  String get smtpSaveFailed =>
      'Não foi possível salvar as configurações de e-mail';

  @override
  String get smtpTestSent => 'E-mail de teste enviado';

  @override
  String get smtpTestFailed => 'Falha no e-mail de teste';

  @override
  String get ereaderDevicesTitle => 'Dispositivos e-reader';

  @override
  String get ereaderDevicesEmpty =>
      'Nenhum dispositivo ainda. Adicione um abaixo.';

  @override
  String get addEreaderDevice => 'Adicionar dispositivo';

  @override
  String get editEreaderDevice => 'Editar dispositivo';

  @override
  String get deleteEreaderDevice => 'Excluir';

  @override
  String get ereaderDeviceName => 'Nome';

  @override
  String get ereaderDeviceEmail => 'E-mail';

  @override
  String get ereaderAvailability => 'Quem pode usar este dispositivo';

  @override
  String get ereaderAvailAdminOrUp => 'Somente administradores';

  @override
  String get ereaderAvailUserOrUp => 'Todos os usuários';

  @override
  String get ereaderAvailGuestOrUp => 'Todos';

  @override
  String get ereaderAvailSpecificUsers => 'Usuários específicos';

  @override
  String ereaderSpecificUsersN(int count) {
    return 'Usuários específicos ($count)';
  }

  @override
  String get ereaderDevicesSaved => 'Dispositivos salvos';

  @override
  String get ereaderDevicesSaveFailed =>
      'Não foi possível salvar os dispositivos';

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
      'Ordenados por posição (invertido)';

  @override
  String bookmarksJumpShortContent(String title, String position) {
    return '\"$title\" em $position';
  }

  @override
  String get deleteBookmarkQuestion => 'Excluir marcador?';

  @override
  String get cardIconsOnlyChip => 'Somente ícones';

  @override
  String get cardMoreInGridChip => '\"Mais\" na grade';

  @override
  String get cardLayoutHidden => 'Oculto';

  @override
  String get speed => 'Velocidade';

  @override
  String get details => 'Detalhes';

  @override
  String get episodeDetailsLabel => 'Detalhes do episódio';

  @override
  String get bookDetailsLabel => 'Detalhes do livro';

  @override
  String get equalizerShort => 'EQ';

  @override
  String get equalizerLabel => 'Equalizador';

  @override
  String get cast => 'Transmitir';

  @override
  String castingToDevice(String device) {
    return 'Transmitindo para $device';
  }

  @override
  String castToDeviceNamed(String device) {
    return 'Transmitir para $device';
  }

  @override
  String get historyShort => 'Histórico';

  @override
  String atPosition(String position) {
    return 'em $position';
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
  String get fileInfoTitle => 'Informações do arquivo';

  @override
  String fileInfoFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '1 arquivo',
    );
    return '$_temp0';
  }

  @override
  String get fileInfoNone => 'Este livro não tem detalhes de arquivos.';

  @override
  String get fileInfoAudio => 'Áudio';

  @override
  String get fileInfoEbook => 'E-book';

  @override
  String get fileInfoOther => 'Outros arquivos';

  @override
  String get fileInfoBookOrbitNote =>
      'O BookOrbit não informa codec nem taxa de bits.';

  @override
  String fileInfoChannels(int count) {
    return '$count canais';
  }

  @override
  String get fileInfoCover => 'Capa';

  @override
  String get fileInfoMetadata => 'Metadados';

  @override
  String get fileInfoSupplement => 'Extra';

  @override
  String get fileInfoPathCopied => 'Caminho copiado';

  @override
  String get resetMayNotHaveSynced =>
      'A redefinição pode não ter sido sincronizada - verifique seu servidor';

  @override
  String failedToDownloadEbook(int code) {
    return 'Falha ao baixar o e-book ($code)';
  }

  @override
  String get serverReturnedErrorPage =>
      'O servidor retornou uma página de erro em vez do arquivo do e-book';

  @override
  String ebookSaved(String filename) {
    return 'Salvo: $filename';
  }

  @override
  String errorSavingEbook(String error) {
    return 'Erro ao salvar o e-book: $error';
  }

  @override
  String failedToSaveError(String error) {
    return 'Falha ao salvar: $error';
  }

  @override
  String get adminBackupsLabel => 'Backups';

  @override
  String get adminListeningNow => 'Ouvindo agora';

  @override
  String get adminLibraries => 'Bibliotecas';

  @override
  String get adminLibraryShows => 'programas';

  @override
  String get adminLibraryBooks => 'livros';

  @override
  String get adminLibraryFolders => 'pastas';

  @override
  String get adminLibrarySize => 'tamanho';

  @override
  String get adminLibraryDuration => 'duração';

  @override
  String adminLibraryIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens ausentes ou inválidos',
      one: '1 item ausente ou inválido',
    );
    return '$_temp0';
  }

  @override
  String get adminLibraryReview => 'Revisar';

  @override
  String get adminMissingTitle => 'Itens ausentes';

  @override
  String adminMissingSubtitle(String library) {
    return 'Entradas em $library cujos arquivos estão ausentes ou ilegíveis';
  }

  @override
  String get adminMissingNone => 'Nenhum item ausente ou inválido';

  @override
  String get adminMissingBadge => 'Ausente';

  @override
  String get adminInvalidBadge => 'Inválido';

  @override
  String get adminMissingDeleteTitle => 'Remover entrada';

  @override
  String adminMissingDeleteOneContent(String title) {
    return 'Remover \"$title\" do Audiobookshelf?';
  }

  @override
  String adminMissingDeleteManyContent(int count) {
    return 'Remover $count entradas do Audiobookshelf?';
  }

  @override
  String adminMissingDeleteCount(int count) {
    return 'Excluir $count';
  }

  @override
  String adminMissingRemovedOne(String title) {
    return '$title removido';
  }

  @override
  String adminMissingRemovedMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entradas removidas',
      one: '1 entrada removida',
    );
    return '$_temp0';
  }

  @override
  String get adminMissingDeleteFailed => 'Falha ao excluir a entrada';

  @override
  String get adminMatchAction => 'Corresponder';

  @override
  String adminMatchingStarted(String name) {
    return 'Correspondência iniciada para $name';
  }

  @override
  String get adminMatchFailed => 'Falhou';

  @override
  String adminScanFailed(String name) {
    return 'Falha ao varrer $name';
  }

  @override
  String get adminPurgeCacheFailed => 'Falhou';

  @override
  String get adminUsersRootBadge => 'root';

  @override
  String get adminUsersAdminBadge => 'admin';

  @override
  String get adminUsersDisabledBadge => 'desativado';

  @override
  String get adminUsersEditUserTooltip => 'Editar usuário';

  @override
  String get adminUsersOnlineNow => 'Online agora';

  @override
  String adminUsersLastSeen(String time) {
    return 'Visto por último $time';
  }

  @override
  String get adminUsersNever => 'Nunca';

  @override
  String get adminUsersTotal => 'Total';

  @override
  String get adminUsersNoReadingActivity => 'Sem atividade de leitura';

  @override
  String get adminUsersLoadingDots => 'Carregando...';

  @override
  String get adminUsersLoadMoreSessions => 'Carregar mais sessões';

  @override
  String get adminUsersNoRecentSessions => 'Nenhuma sessão recente';

  @override
  String get adminUsersLibraryProgress => 'Progresso da biblioteca';

  @override
  String adminUsersLoadMoreRemaining(int count) {
    return 'Carregar mais ($count restantes)';
  }

  @override
  String adminUsersMonthsAgo(int count) {
    return 'há $count m';
  }

  @override
  String get adminUsersNewUser => 'Novo usuário';

  @override
  String get adminUsersEditUser => 'Editar usuário';

  @override
  String get adminUsersUsername => 'Nome de usuário';

  @override
  String get adminUsersEnterUsername => 'Digite o nome de usuário';

  @override
  String get adminUsersPassword => 'Senha';

  @override
  String get adminUsersNewPassword => 'Nova senha';

  @override
  String get adminUsersEnterPassword => 'Digite a senha';

  @override
  String get adminUsersLeaveBlankToKeep =>
      'Deixe em branco para manter a atual';

  @override
  String get adminUsersAccountType => 'Tipo de conta';

  @override
  String get adminUsersTypeGuest => 'Convidado';

  @override
  String get adminUsersTypeUser => 'Usuário';

  @override
  String get adminUsersTypeAdmin => 'Administrador';

  @override
  String get adminUsersStatus => 'Status';

  @override
  String get adminUsersAccountActive => 'Conta ativa';

  @override
  String get adminUsersAccountActiveSub =>
      'Contas desativadas não podem entrar';

  @override
  String get adminUsersLocked => 'Bloqueada';

  @override
  String get adminUsersLockedSub => 'Impede alterações de senha';

  @override
  String get adminUsersPermissions => 'Permissões';

  @override
  String get adminUsersPermDownload => 'Baixar';

  @override
  String get adminUsersPermUpdate => 'Atualizar';

  @override
  String get adminUsersPermUpdateSub =>
      'Editar metadados e itens da biblioteca';

  @override
  String get adminUsersPermDelete => 'Excluir';

  @override
  String get adminUsersPermUpload => 'Enviar';

  @override
  String get adminUsersPermExplicit => 'Conteúdo explícito';

  @override
  String get adminUsersLibraryAccess => 'Acesso às bibliotecas';

  @override
  String get adminUsersAccessAllLibraries => 'Acessar todas as bibliotecas';

  @override
  String get adminUsersCreateUser => 'Criar usuário';

  @override
  String get adminUsersSaveChanges => 'Salvar alterações';

  @override
  String get adminUsersUsernameRequired => 'O nome de usuário é obrigatório';

  @override
  String get adminUsersPasswordRequired => 'A senha é obrigatória';

  @override
  String get adminUsersUserCreated => 'Usuário criado';

  @override
  String get adminUsersUserUpdated => 'Usuário atualizado';

  @override
  String get adminUsersFailedCreate => 'Falha ao criar o usuário';

  @override
  String get adminUsersFailedUpdate => 'Falha ao atualizar o usuário';

  @override
  String get adminUsersThisUser => 'este usuário';

  @override
  String get adminUsersDeleteUserTitle => 'Excluir usuário?';

  @override
  String adminUsersDeleteUserContent(String name) {
    return 'Excluir $name permanentemente?';
  }

  @override
  String adminUsersUserDeleted(String name) {
    return '$name excluído';
  }

  @override
  String get adminUsersFailedDelete => 'Falha ao excluir o usuário';

  @override
  String get adminUsersUnlinkOpenId => 'Desvincular OpenID';

  @override
  String get adminUsersUnlinkOpenIdTitle => 'Desvincular OpenID?';

  @override
  String adminUsersUnlinkOpenIdContent(String name) {
    return 'Remover a conexão OpenID de $name? Será preciso entrar com OpenID novamente para vincular de novo.';
  }

  @override
  String get adminUsersOpenIdUnlinked => 'OpenID desvinculado';

  @override
  String get adminUsersFailedUnlinkOpenId => 'Falha ao desvincular o OpenID';

  @override
  String adminUsersByAuthor(String author) {
    return 'de $author';
  }

  @override
  String get adminUsersListened => 'Ouvido';

  @override
  String get adminUsersStartedAtPosition => 'Iniciado na posição';

  @override
  String get adminUsersEndedAtPosition => 'Terminado na posição';

  @override
  String get adminUsersTotalDuration => 'Duração total';

  @override
  String get adminUsersStarted => 'Iniciado';

  @override
  String get adminUsersUpdated => 'Atualizado';

  @override
  String get adminUsersClient => 'Cliente';

  @override
  String get adminUsersDevice => 'Dispositivo';

  @override
  String get adminUsersOs => 'SO';

  @override
  String get adminUsersPlayMethod => 'Método de reprodução';

  @override
  String get adminUsersPlayDirect => 'Reprodução direta';

  @override
  String get adminUsersPlayDirectStream => 'Streaming direto';

  @override
  String get adminUsersPlayTranscode => 'Transcodificação';

  @override
  String get adminUsersPlayLocal => 'Local';

  @override
  String get adminPodcastsCheckNewEpisodesTitle => 'Verificar novos episódios';

  @override
  String get adminPodcastsCheckNewEpisodesContent =>
      'Isso verificará os feeds RSS de todos os podcasts e baixará os novos episódios encontrados (se o download automático estiver ativado).';

  @override
  String get adminPodcastsCheckNewEpisodesSubtitle =>
      'Verificar o feed RSS e baixar novos episódios';

  @override
  String get adminPodcastsCheck => 'Verificar';

  @override
  String get adminPodcastsCheckingForNew => 'Verificando novos episódios…';

  @override
  String get adminPodcastsCheckingForNewDots =>
      'Verificando novos episódios...';

  @override
  String get adminPodcastsFailedCheckEpisodes =>
      'Falha ao verificar os episódios';

  @override
  String get adminPodcastsCheckFeedsTooltip =>
      'Verificar feeds em busca de novos episódios';

  @override
  String get adminPodcastsNoPodcastsYet => 'Nenhum podcast ainda';

  @override
  String get adminPodcastsTapPlusHint =>
      'Toque em + para pesquisar e adicionar programas';

  @override
  String adminPodcastsEpisodesCount(int count) {
    return '$count episódios';
  }

  @override
  String get adminPodcastsAddPodcast => 'Adicionar podcast';

  @override
  String get adminPodcastsCouldNotFindFeed =>
      'Não foi possível encontrar o feed do podcast';

  @override
  String get adminPodcastsSearchHint => 'Pesquisar podcasts…';

  @override
  String get adminPodcastsSearchItunesHint => 'Pesquisar no iTunes...';

  @override
  String adminPodcastsSearchItunesFor(String query) {
    return 'Pesquisar \"$query\" no iTunes';
  }

  @override
  String get adminPodcastsNoPodcastsFound => 'Nenhum podcast encontrado';

  @override
  String get adminPodcastsRelToday => 'Hoje';

  @override
  String adminPodcastsWeeksAgo(int count) {
    return 'há $count sem';
  }

  @override
  String adminPodcastsMonthsAgo(int count) {
    return 'há $count m';
  }

  @override
  String adminPodcastsYearsAgo(int count) {
    return 'há $count a';
  }

  @override
  String adminPodcastsUpdated(String when) {
    return 'Atualizado $when';
  }

  @override
  String get adminPodcastsGenreAll => 'Todos';

  @override
  String get adminPodcastsGenreArts => 'Artes';

  @override
  String get adminPodcastsGenreComedy => 'Comédia';

  @override
  String get adminPodcastsGenreEducation => 'Educação';

  @override
  String get adminPodcastsGenreTvFilm => 'TV e cinema';

  @override
  String get adminPodcastsGenreMusic => 'Música';

  @override
  String get adminPodcastsGenreNews => 'Notícias';

  @override
  String get adminPodcastsGenreReligion => 'Religião';

  @override
  String get adminPodcastsGenreScience => 'Ciência';

  @override
  String get adminPodcastsGenreSports => 'Esportes';

  @override
  String get adminPodcastsGenreTechnology => 'Tecnologia';

  @override
  String get adminPodcastsGenreBusiness => 'Negócios';

  @override
  String get adminPodcastsGenreFiction => 'Ficção';

  @override
  String get adminPodcastsGenreSocietyCulture => 'Sociedade e cultura';

  @override
  String get adminPodcastsGenreHealthFitness => 'Saúde e fitness';

  @override
  String get adminPodcastsGenreTrueCrime => 'Crimes reais';

  @override
  String get adminPodcastsGenreHistory => 'História';

  @override
  String get adminPodcastsGenreKidsFamily => 'Crianças e família';

  @override
  String get adminPodcastsPodcastFallback => 'Podcast';

  @override
  String get adminPodcastsEpisodeFallback => 'Episódio';

  @override
  String get adminPodcastsNoFeedFound => 'Nenhum URL de feed encontrado';

  @override
  String get adminPodcastsNoFeedAvailable => 'Nenhum URL de feed disponível';

  @override
  String adminPodcastsAddedToLibrary(String title) {
    return '$title adicionado à biblioteca';
  }

  @override
  String adminPodcastsFailedToAdd(String title) {
    return 'Falha ao adicionar $title';
  }

  @override
  String adminPodcastsEpisodesInFeed(int count) {
    return '$count episódios no feed';
  }

  @override
  String adminPodcastsMoreEpisodes(int count) {
    return '+ $count episódios';
  }

  @override
  String get adminPodcastsAdding => 'Adicionando…';

  @override
  String get adminPodcastsAddToLibrary => 'Adicionar à biblioteca';

  @override
  String get adminPodcastsRemoveShowTitle => 'Remover programa?';

  @override
  String adminPodcastsRemoveShowContent(String title) {
    return 'Remover \"$title\" e todos os seus episódios do servidor? Isso não pode ser desfeito.';
  }

  @override
  String adminPodcastsRemovedShow(String title) {
    return '\"$title\" removido';
  }

  @override
  String get adminPodcastsFailedRemoveShow => 'Falha ao remover o programa';

  @override
  String get adminPodcastsRemoveShowTooltip => 'Remover programa';

  @override
  String get adminPodcastsSelectMultipleTooltip => 'Selecionar vários';

  @override
  String adminPodcastsDownloadedCount(int count) {
    return '$count baixados';
  }

  @override
  String get adminPodcastsTabDownloaded => 'Baixados';

  @override
  String get adminPodcastsTabFeed => 'Feed';

  @override
  String get adminPodcastsTabSettings => 'Configurações';

  @override
  String adminPodcastsDownloadingEpisode(String title) {
    return 'Baixando \"$title\"';
  }

  @override
  String get adminPodcastsFailedDownload => 'Falha ao baixar';

  @override
  String get adminPodcastsDeleteEpisodeTitle => 'Excluir episódio?';

  @override
  String adminPodcastsDeleteEpisodeContent(String title) {
    return 'Excluir \"$title\"?';
  }

  @override
  String get adminPodcastsDeleted => 'Excluído';

  @override
  String get adminPodcastsFailed => 'Falhou';

  @override
  String get adminPodcastsDeleteEpisodesTitle => 'Excluir episódios?';

  @override
  String adminPodcastsDeleteEpisodesContent(int count) {
    return 'Excluir $count episódio(s) do servidor?';
  }

  @override
  String adminPodcastsDeletedEpisodes(int count) {
    return '$count episódio(s) excluído(s)';
  }

  @override
  String get adminPodcastsBrowseFeedToDownload =>
      'Navegue pelo feed para baixar';

  @override
  String get adminPodcastsDownloadingDots => 'Baixando...';

  @override
  String adminPodcastsDeleteEpisodesCount(int count) {
    return 'Excluir $count episódio(s)';
  }

  @override
  String adminPodcastsDownloadingCount(int count) {
    return 'Baixando $count episódio(s)';
  }

  @override
  String adminPodcastsDownloadEpisodesCount(int count) {
    return 'Baixar $count episódio(s)';
  }

  @override
  String get adminPodcastsLookForEpisodesAfter => 'Procurar episódios após';

  @override
  String get adminPodcastsSelectDate => 'Selecionar data';

  @override
  String get adminPodcastsMaxEpisodes => 'Máximo de episódios a baixar';

  @override
  String adminPodcastsNoNewEpisodesAfter(String date) {
    return 'Nenhum episódio novo encontrado após $date';
  }

  @override
  String adminPodcastsFoundNewEpisodes(int count) {
    return '$count novo(s) episódio(s) encontrado(s) - baixando';
  }

  @override
  String get adminPodcastsFailedToCheckNew =>
      'Falha ao verificar novos episódios';

  @override
  String get adminPodcastsCheckAndDownload => 'Verificar e baixar';

  @override
  String get adminPodcastsMatchPodcast => 'Corresponder podcast';

  @override
  String get adminPodcastsMatchPodcastSubtitle =>
      'Pesquise no iTunes para atualizar a capa e os metadados';

  @override
  String get adminPodcastsAutoDownloadNewEpisodes =>
      'Baixar novos episódios automaticamente';

  @override
  String get adminPodcastsAutoDownloadOnSubtitle =>
      'O servidor baixa novos episódios automaticamente';

  @override
  String get adminPodcastsAutoDownloadOffSubtitle =>
      'Novos episódios não são baixados automaticamente';

  @override
  String get adminPodcastsFailedAutoDownloadUpdate =>
      'Falha ao atualizar a configuração de download automático';

  @override
  String get adminPodcastsMaxEpisodesToKeep => 'Máximo de episódios a manter';

  @override
  String get adminPodcastsMaxEpisodesToKeepHelp =>
      '0 mantém todos os episódios. Depois que um novo episódio é baixado automaticamente, o Audiobookshelf remove o episódio mais antigo quando o programa passa deste limite.';

  @override
  String get adminPodcastsNoEpisodeLimit => 'Sem limite';

  @override
  String get adminPodcastsEpisodeLimitInvalid =>
      'Digite 0 ou um número inteiro';

  @override
  String get adminPodcastsCheckSchedule => 'Agenda de verificação';

  @override
  String get adminPodcastsFrequency => 'Frequência';

  @override
  String get adminPodcastsFreqHourly => 'A cada hora';

  @override
  String get adminPodcastsFreqDaily => 'Diariamente';

  @override
  String get adminPodcastsFreqWeekly => 'Semanalmente';

  @override
  String get adminPodcastsDay => 'Dia';

  @override
  String get adminPodcastsTime => 'Hora';

  @override
  String get adminPodcastsDaySun => 'Dom';

  @override
  String get adminPodcastsDayMon => 'Seg';

  @override
  String get adminPodcastsDayTue => 'Ter';

  @override
  String get adminPodcastsDayWed => 'Qua';

  @override
  String get adminPodcastsDayThu => 'Qui';

  @override
  String get adminPodcastsDayFri => 'Sex';

  @override
  String get adminPodcastsDaySat => 'Sáb';

  @override
  String get adminPodcastsFeedUrl => 'URL do feed';

  @override
  String get adminPodcastsBack => 'Voltar';

  @override
  String get adminPodcastsRootOnly => 'Somente root';

  @override
  String get adminPodcastsDeleting => 'Excluindo...';

  @override
  String get adminPodcastsDeleteEpisode => 'Excluir episódio';

  @override
  String adminPodcastsSeasonChip(String season) {
    return 'Temporada $season';
  }

  @override
  String adminPodcastsEpChip(String number) {
    return 'Ep. $number';
  }

  @override
  String get adminPodcastsApplyingMatch => 'Aplicando correspondência...';

  @override
  String get adminPodcastsNoResults => 'Sem resultados';

  @override
  String get adminPodcastsPodcastMatched =>
      'Podcast correspondido e atualizado';

  @override
  String get adminPodcastsFailedMatch => 'Falha ao corresponder o podcast';

  @override
  String get adminPodcastsSelectAll => 'Selecionar tudo';

  @override
  String get adminPodcastsSelectAllNew => 'Somente novos';

  @override
  String get adminPodcastsSortNewestFirst => 'Mais recentes primeiro';

  @override
  String get adminPodcastsSortOldestFirst => 'Mais antigos primeiro';

  @override
  String get adminPodcastsEditInfo => 'Editar informações';

  @override
  String get adminPodcastsEditInfoSubtitle =>
      'Altere título, descrição, capa e mais';

  @override
  String get adminPodcastsEditTitle => 'Editar podcast';

  @override
  String get adminPodcastsReleaseDate => 'Data de lançamento';

  @override
  String get adminPodcastsExplicit => 'Explícito';

  @override
  String get adminPodcastsExplicitSubtitle =>
      'Marcar este podcast como explícito';

  @override
  String get episodeListEpisodeFallback => 'Episódio';

  @override
  String get episodeListUnknownPodcast => 'Podcast desconhecido';

  @override
  String episodeListMarkedFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episódios marcados como concluídos',
      one: '1 episódio marcado como concluído',
    );
    return '$_temp0';
  }

  @override
  String episodeListMarkedUnfinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episódios marcados como não concluídos',
      one: '1 episódio marcado como não concluído',
    );
    return '$_temp0';
  }

  @override
  String get episodeListUnsubscribeFromNewEpisodes =>
      'Cancelar inscrição em novos episódios';

  @override
  String get episodeListSubscribeToNewEpisodes =>
      'Inscrever-se em novos episódios';

  @override
  String get episodeListSubscribeTitle => 'Inscrever-se neste podcast?';

  @override
  String get episodeListSubscribeContent =>
      'Os novos episódios serão baixados automaticamente e adicionados à sua fila do Absorbing quando aparecerem no servidor.';

  @override
  String get episodeListSubscribe => 'Inscrever-se';

  @override
  String get episodeListShowFinishedEpisodes => 'Mostrar episódios concluídos';

  @override
  String get episodeListHideFinishedEpisodes => 'Ocultar episódios concluídos';

  @override
  String get episodeListShowSettings => 'Mostrar configurações';

  @override
  String get episodeListPlaysNewerToOlder =>
      'Reproduz dos episódios mais novos para os mais antigos';

  @override
  String get episodeListPlaysOlderToNewer =>
      'Reproduz dos episódios mais antigos para os mais novos';

  @override
  String episodeListEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episódios',
      one: '1 episódio',
    );
    return '$_temp0';
  }

  @override
  String episodeListUnfinishedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count não concluídos',
      one: '1 não concluído',
    );
    return '$_temp0';
  }

  @override
  String get episodeListAutoDownloadChip => 'Download automático';

  @override
  String get episodeListSubscribedChip => 'Inscrito';

  @override
  String get episodeListExplicitChip => 'Explícito';

  @override
  String get episodeListSortNewest => 'Mais recentes';

  @override
  String get episodeListSortOldest => 'Mais antigos';

  @override
  String get episodeListSortBy => 'Ordenar episódios';

  @override
  String get episodeListSortPubDate => 'Data de publicação';

  @override
  String get episodeListSortTitle => 'Título';

  @override
  String get episodeListSortSeason => 'Temporada';

  @override
  String get episodeListSortEpisode => 'Número do episódio';

  @override
  String get episodeListSortFileName => 'Nome do arquivo';

  @override
  String get episodeListSortReverseHint =>
      'Toque novamente para inverter a ordem';

  @override
  String episodeListAddedToAbsorbing(String title) {
    return '\"$title\" adicionado ao Absorbing';
  }

  @override
  String get episodeDetailEpisodeFallback => 'Episódio';

  @override
  String get episodeDetailMarkedNotFinished => 'Marcado como não concluído';

  @override
  String get episodeDetailMarkedFinishedNice =>
      'Marcado como concluído - ótimo!';

  @override
  String get episodeDetailMarkAbsorbedContent =>
      'Isso definirá seu progresso como 100% neste episódio.';

  @override
  String get episodeDetailResetProgressContent =>
      'Isso apagará todo o progresso deste episódio e o levará de volta ao início. Não é possível desfazer.';

  @override
  String get episodeDetailToday => 'Hoje';

  @override
  String get episodeDetailYesterday => 'Ontem';

  @override
  String episodeDetailDaysAgo(int count) {
    return 'há $count d';
  }

  @override
  String episodeDetailWeeksAgo(int count) {
    return 'há $count sem';
  }

  @override
  String episodeDetailDurationHm(int hours, int minutes) {
    return '${hours}h ${minutes}min';
  }

  @override
  String episodeDetailDurationM(int minutes) {
    return '${minutes}min';
  }

  @override
  String get episodeDetailResume => 'Retomar';

  @override
  String get episodeDetailPlayEpisode => 'Reproduzir episódio';

  @override
  String episodeDetailEpisodeNumber(String number) {
    return 'Episódio $number';
  }

  @override
  String episodeDetailSeasonNumber(String number) {
    return 'Temporada $number';
  }

  @override
  String get editMetadataUpdatedFromMatch =>
      'Metadados atualizados a partir da correspondência';

  @override
  String editMetadataConfirmMatch(String title) {
    return 'Isso atualizará os metadados deste livro no servidor usando:\n\n\"$title\"\n\nTodos os campos e a capa serão sobrescritos no servidor.';
  }

  @override
  String editMetadataConfirmMatchWithAuthor(String title, String author) {
    return 'Isso atualizará os metadados deste livro no servidor usando:\n\n\"$title\" de $author\n\nTodos os campos e a capa serão sobrescritos no servidor.';
  }

  @override
  String get seriesBooksFindMissingTitle => 'Encontrar livros ausentes';

  @override
  String get seriesBooksFindMissingContent =>
      'Isso pesquisa no Audible para encontrar livros desta série que podem estar ausentes da sua biblioteca.\n\nOs livros são correspondidos primeiro pelo ASIN (dependendo de o seu servidor ter ASINs para seus livros) e depois pelo título. Os resultados podem não ser perfeitamente precisos.';

  @override
  String get seriesBooksCouldNotFindOnAudible =>
      'Não foi possível encontrar esta série no Audible';

  @override
  String seriesBooksMarkAllNotFinishedContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Isso removerá o status de concluído de todos os $count livros desta série.',
      one: 'Isso removerá o status de concluído do 1 livro desta série.',
    );
    return '$_temp0';
  }

  @override
  String seriesBooksFullyAbsorbContent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Isso marcará todos os $count livros desta série como concluídos.',
      one: 'Isso marcará o 1 livro desta série como concluído.',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksUnmarkAll => 'Desmarcar todos';

  @override
  String get seriesBooksShowAllBooks => 'Mostrar todos os livros';

  @override
  String get seriesBooksGroupBySubSeries => 'Agrupar por subsérie';

  @override
  String get seriesBooksLoadingSubSeries => 'Carregando subséries...';

  @override
  String seriesBooksBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros',
      one: '1 livro',
    );
    return '$_temp0';
  }

  @override
  String get seriesBooksDone => 'Concluir';

  @override
  String get seriesBooksExplicitBadge => 'E';

  @override
  String get expandedCardStreaming => 'Streaming';

  @override
  String get expandedCardDeviceFallback => 'Dispositivo';

  @override
  String bookmarksScreenPositionInBook(String position, String bookTitle) {
    return '$position em $bookTitle';
  }

  @override
  String get bookmarksScreenClose => 'Fechar';

  @override
  String get bookmarksScreenSortNewest => 'Mais recentes';

  @override
  String get bookmarksScreenSortPosition => 'Posição';

  @override
  String statsScreenStreakDays(int count) {
    return '${count}d';
  }

  @override
  String statsScreenSessionCountOne(int count) {
    return '$count sessão';
  }

  @override
  String statsScreenSessionCountOther(int count) {
    return '$count sessões';
  }

  @override
  String get statsScreenDayMon => 'Seg';

  @override
  String get statsScreenDayTue => 'Ter';

  @override
  String get statsScreenDayWed => 'Qua';

  @override
  String get statsScreenDayThu => 'Qui';

  @override
  String get statsScreenDayFri => 'Sex';

  @override
  String get statsScreenDaySat => 'Sáb';

  @override
  String get statsScreenDaySun => 'Dom';

  @override
  String statsScreenDurationHm(int h, int m) {
    return '${h}h ${m}min';
  }

  @override
  String statsScreenDurationM(int m) {
    return '${m}min';
  }

  @override
  String get statsScreenDurationLessThanMin => '<1min';

  @override
  String get statsScreenDurationZero => '0min';

  @override
  String statsScreenDurationShortH(int h) {
    return '${h}h';
  }

  @override
  String statsScreenDurationShortM(int m) {
    return '${m}min';
  }

  @override
  String get statsScreenCouldNotLoadItem => 'Não foi possível carregar o item';

  @override
  String get statsScreenCouldNotFindEpisode =>
      'Não foi possível encontrar o episódio';

  @override
  String statsScreenByAuthor(String author) {
    return 'de $author';
  }

  @override
  String get statsScreenListened => 'Ouvido';

  @override
  String get sessionEditTitle => 'Editar sessão';

  @override
  String get sessionDayLabel => 'Dia';

  @override
  String get sessionEndPosition => 'Posição final';

  @override
  String get sessionEndPositionHint =>
      'Alterar isto também pode atualizar seu progresso atual.';

  @override
  String get statsViewSessions => 'Ver sessões';

  @override
  String statsSessionsForDate(String date) {
    return 'Sessões de $date';
  }

  @override
  String get statsNoSessionsForDate =>
      'Nenhuma sessão de audição encontrada neste dia';

  @override
  String get statsSearchSessions => 'Pesquisar sessões';

  @override
  String get statsNoSessionSearchResults =>
      'Nenhuma sessão corresponde à sua pesquisa';

  @override
  String get statsSessionsLoadFailed =>
      'Não foi possível carregar as sessões deste dia';

  @override
  String get sessionDeleteConfirmTitle => 'Excluir sessão?';

  @override
  String get sessionDeleteConfirmBody =>
      'Isso remove a sessão e reduz seus totais de audição pelo tempo dela. Não é possível desfazer.';

  @override
  String get sessionSaved => 'Sessão atualizada';

  @override
  String get sessionDeleted => 'Sessão excluída';

  @override
  String get sessionSaveFailed => 'Não foi possível salvar as alterações';

  @override
  String get sessionDeleteFailed => 'Não foi possível excluir esta sessão';

  @override
  String get statsScreenStartedAtPosition => 'Iniciado na posição';

  @override
  String get statsScreenEndedAtPosition => 'Terminado na posição';

  @override
  String get statsScreenTotalDuration => 'Duração total';

  @override
  String get statsScreenStarted => 'Iniciado';

  @override
  String get statsScreenUpdated => 'Atualizado';

  @override
  String get statsScreenClient => 'Cliente';

  @override
  String get statsScreenDevice => 'Dispositivo';

  @override
  String get statsScreenOs => 'SO';

  @override
  String get statsScreenPlayMethod => 'Método de reprodução';

  @override
  String get statsScreenLoading => 'Carregando...';

  @override
  String get statsScreenJumpToStart => 'Ir para o início';

  @override
  String get statsScreenJumpToEnd => 'Ir para o fim';

  @override
  String get statsScreenPlayMethodDirect => 'Reprodução direta';

  @override
  String get statsScreenPlayMethodDirectStream => 'Streaming direto';

  @override
  String get statsScreenPlayMethodTranscode => 'Transcodificação';

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
    return '$day $month $year às $hour:$minute $ampm';
  }

  @override
  String get statsScreenMonthJan => 'Jan';

  @override
  String get statsScreenMonthFeb => 'Fev';

  @override
  String get statsScreenMonthMar => 'Mar';

  @override
  String get statsScreenMonthApr => 'Abr';

  @override
  String get statsScreenMonthMay => 'Mai';

  @override
  String get statsScreenMonthJun => 'Jun';

  @override
  String get statsScreenMonthJul => 'Jul';

  @override
  String get statsScreenMonthAug => 'Ago';

  @override
  String get statsScreenMonthSep => 'Set';

  @override
  String get statsScreenMonthOct => 'Out';

  @override
  String get statsScreenMonthNov => 'Nov';

  @override
  String get statsScreenMonthDec => 'Dez';

  @override
  String get upcomingReleasesTitle => 'Próximos lançamentos';

  @override
  String get upcomingReleasesRescanTitle => 'Verificar novamente?';

  @override
  String upcomingReleasesRescanContent(int days) {
    return 'Estes resultados têm $days dias. As datas de lançamento podem ter mudado - deseja verificar novamente?';
  }

  @override
  String get upcomingReleasesNotNow => 'Agora não';

  @override
  String get upcomingReleasesRescan => 'Verificar novamente';

  @override
  String get upcomingReleasesRescanReleaseDate =>
      'Verificar data de lançamento novamente';

  @override
  String get upcomingReleasesRescanning => 'Verificando novamente...';

  @override
  String upcomingReleasesUpdatedWithDate(String date) {
    return 'Atualizado - $date';
  }

  @override
  String get upcomingReleasesNoReleaseDateFound =>
      'Nenhuma data de lançamento encontrada';

  @override
  String get upcomingReleasesRescanFailed => 'Falha ao verificar novamente';

  @override
  String get upcomingReleasesRemoveFromList => 'Remover da lista';

  @override
  String get upcomingReleasesRemovedFromList => 'Removido da lista';

  @override
  String get upcomingReleasesDateChip => 'Data';

  @override
  String upcomingReleasesCheckingSeries(String name, int processed, int total) {
    return 'Verificando $name... ($processed/$total)';
  }

  @override
  String get upcomingReleasesLoadingSeries => 'Carregando séries...';

  @override
  String get upcomingReleasesScannedToday => '(verificado hoje)';

  @override
  String get upcomingReleasesScannedYesterday => '(verificado ontem)';

  @override
  String upcomingReleasesScannedDaysAgo(int days) {
    return '(verificado há $days dias)';
  }

  @override
  String upcomingReleasesUpcomingCount(int count) {
    return '$count próximos';
  }

  @override
  String upcomingReleasesRecentCount(int count) {
    return '$count recentes';
  }

  @override
  String get upcomingReleasesNoneFound =>
      'Nenhum lançamento próximo ou recente encontrado';

  @override
  String upcomingReleasesAcrossSeries(String summary, int count) {
    return '$summary em $count séries';
  }

  @override
  String upcomingReleasesCheckedSeries(int count) {
    return '$count séries verificadas no Audible';
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
  String get upcomingReleasesBadgeUpcoming => 'EM BREVE';

  @override
  String get upcomingReleasesBadgeAdded => 'ADICIONADO';

  @override
  String get upcomingReleasesBadgeMissing => 'AUSENTE';

  @override
  String get upcomingReleasesScanSettingsTitle =>
      'Configurações de verificação';

  @override
  String get upcomingReleasesFinishedAfterTitle =>
      'Considerar uma série concluída após';

  @override
  String get upcomingReleasesFinishedAfterDesc =>
      'Séries cujo último livro é mais antigo que isso são ignoradas nas verificações e só são conferidas de novo a cada um ou dois meses.';

  @override
  String upcomingReleasesFinishedAfterYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anos',
      one: '1 ano',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesFinishedAfterNever => 'Nunca';

  @override
  String get upcomingReleasesSkippedTitle => 'Séries ignoradas';

  @override
  String get upcomingReleasesSkippedNone => 'Nada ignorado ainda';

  @override
  String upcomingReleasesSkippedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ignoradas',
      one: '1 ignorada',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesSkippedLastBook(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Último livro há $count anos',
      one: 'Último livro há 1 ano',
      zero: 'Último livro há menos de um ano',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesSkippedUnmatched =>
      'Não foi possível corresponder esta série no Audible';

  @override
  String get upcomingReleasesSkippedScanNow => 'Verificar agora';

  @override
  String get upcomingReleasesSkippedAlwaysScan => 'Sempre verificar';

  @override
  String get upcomingReleasesSkippedNeverScan => 'Nunca verificar';

  @override
  String upcomingReleasesSkippedScanFound(String name) {
    return 'Novos lançamentos encontrados em $name';
  }

  @override
  String upcomingReleasesSkippedScanNone(String name) {
    return 'Nada de novo em $name';
  }

  @override
  String get upcomingReleasesSkippedOtherLibrary =>
      'Esta lista veio de outra biblioteca. Faça uma nova verificação para atualizá-la.';

  @override
  String get upcomingReleasesChipUpcoming => 'Em breve';

  @override
  String upcomingReleasesChipMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ausentes',
      one: '1 ausente',
      zero: 'Ausentes',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesNoMissing => 'Nenhum livro ausente encontrado';

  @override
  String get upcomingReleasesScanSeries => 'Verificar séries';

  @override
  String get upcomingReleasesScanUpcomingOption => 'Próximos lançamentos';

  @override
  String get upcomingReleasesScanUpcomingOptionDesc =>
      'Verificação rápida de livros novos e futuros';

  @override
  String get upcomingReleasesScanDeepOption => 'Verificação profunda';

  @override
  String get upcomingReleasesScanDeepOptionDesc =>
      'Também encontra livros ausentes em cada série - leva mais tempo';

  @override
  String get upcomingReleasesFirstScanNote =>
      'A primeira verificação confere todas as séries no Audible e pode levar alguns minutos. As próximas ficam bem mais rápidas depois que suas séries forem classificadas.';

  @override
  String get upcomingReleasesLastScanReport =>
      'Relatório da última verificação';

  @override
  String upcomingReleasesReportChecked(int count) {
    return 'Verificadas no Audible: $count';
  }

  @override
  String upcomingReleasesReportSkipped(int count) {
    return 'Ignoradas: $count';
  }

  @override
  String upcomingReleasesReportUnmatched(int count) {
    return 'Sem correspondência no Audible: $count';
  }

  @override
  String upcomingReleasesReportFailed(int count) {
    return 'Falha ao verificar: $count';
  }

  @override
  String upcomingReleasesReportFound(int upcoming, int recent) {
    return 'Encontrados $upcoming próximos, $recent recentes';
  }

  @override
  String upcomingReleasesReportFoundDeep(
    int upcoming,
    int recent,
    int missing,
  ) {
    return 'Encontrados $upcoming próximos, $recent recentes, $missing ausentes';
  }

  @override
  String upcomingReleasesReportMore(int count) {
    return '+$count mais';
  }

  @override
  String get upcomingReleasesBadgeNew => 'NOVO';

  @override
  String get upcomingReleasesOpenLibrarySeries => 'Abrir série na biblioteca';

  @override
  String get upcomingReleasesAsinCopied => 'ASIN da série copiado';

  @override
  String get upcomingReleasesSetSeriesAsin => 'Definir ASIN da série';

  @override
  String get upcomingReleasesSetAsinInstructions =>
      'Encontre a série em audible.com e copie o link da página - o ASIN é o código de 10 caracteres que começa com B0 (como B08S2YN3YS). Colar o link inteiro também funciona.';

  @override
  String get upcomingReleasesSetAsinHint => 'B0… ou link do audible.com';

  @override
  String get upcomingReleasesSetAsinSave => 'Salvar';

  @override
  String get upcomingReleasesSetAsinInvalid =>
      'Nenhum ASIN encontrado nesse texto';

  @override
  String get upcomingReleasesSetAsinSaved =>
      'Série vinculada - verificando agora';

  @override
  String upcomingReleasesRemoveTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Remover $count livros',
      one: 'Remover livro',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemoveThisScan => 'Remover desta verificação';

  @override
  String get upcomingReleasesRemoveThisScanDesc =>
      'Pode voltar em uma verificação futura';

  @override
  String get upcomingReleasesRemoveForever =>
      'Remover desta e das próximas verificações';

  @override
  String get upcomingReleasesRemoveForeverDesc =>
      'Vai para a lista de removidos, restaure quando quiser';

  @override
  String get upcomingReleasesRemovedForeverToast =>
      'Removido - não aparecerá nas próximas verificações';

  @override
  String get upcomingReleasesRemovedBooksTitle => 'Livros removidos';

  @override
  String upcomingReleasesRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros',
      one: '1 livro',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesRemovedNone => 'Nenhum livro removido';

  @override
  String get upcomingReleasesRestore => 'Restaurar';

  @override
  String get upcomingReleasesRestoredToast => 'Restaurado';

  @override
  String get upcomingReleasesRestoredNextScan =>
      'Restaurado - aparecerá após a próxima verificação';

  @override
  String upcomingReleasesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selecionados',
      one: '1 selecionado',
    );
    return '$_temp0';
  }

  @override
  String get upcomingReleasesBulkRequest => 'Solicitar';

  @override
  String get upcomingReleasesBulkRemove => 'Remover';

  @override
  String upcomingReleasesBulkRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count removidos',
      one: '1 removido',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitações enviadas',
      one: '1 solicitação enviada',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkRequestSkipped(int count) {
    return '$count ignorados';
  }

  @override
  String upcomingReleasesBulkScanned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count séries verificadas novamente',
      one: '1 série verificada novamente',
    );
    return '$_temp0';
  }

  @override
  String upcomingReleasesBulkScanFound(int count) {
    return '$count com livros novos';
  }

  @override
  String get seriesExcludeFromScan => 'Excluir da verificação de séries';

  @override
  String get seriesIncludeInScan => 'Incluir na verificação de séries';

  @override
  String get homeScreenEpisodeFallback => 'Episódio';

  @override
  String get libraryScreenUnknownTitle => 'Título desconhecido';

  @override
  String get playlistDetailDefaultName => 'Playlist';

  @override
  String playlistDetailItemCount(int count) {
    return '$count itens';
  }

  @override
  String get playlistDetailUnfinished => 'Não concluídos';

  @override
  String get playlistDetailRemoveFromPlaylist => 'Remover da playlist';

  @override
  String get playlistDetailDone => 'Concluir';

  @override
  String playlistDetailItemsMarkedFinished(int count) {
    return '$count itens marcados como concluídos';
  }

  @override
  String playlistDetailItemsMarkedUnfinished(int count) {
    return '$count itens marcados como não concluídos';
  }

  @override
  String playlistDetailItemsRemoved(int count) {
    return '$count itens removidos';
  }

  @override
  String playlistDetailAddedToAbsorbing(String title) {
    return '\"$title\" adicionado ao Absorbing';
  }

  @override
  String get collectionDetailDefaultName => 'Coleção';

  @override
  String smartScopeBookCount(int count) {
    return 'Escopo inteligente · $count livros';
  }

  @override
  String get smartScopeNew => 'Novo escopo inteligente';

  @override
  String get smartScopeNewSubtitle =>
      'Salve um conjunto de filtros como uma lista que se mantém atualizada';

  @override
  String get smartScopeEditTitle => 'Editar escopo inteligente';

  @override
  String get smartScopeIcon => 'Ícone';

  @override
  String get smartScopePublic => 'Visível para todos os usuários';

  @override
  String get smartScopeKobo => 'Sincronizar com o Kobo';

  @override
  String get smartScopeRules => 'Regras';

  @override
  String get smartScopeMatchAll => 'Corresponder a todas';

  @override
  String get smartScopeMatchAny => 'Corresponder a qualquer uma';

  @override
  String get smartScopeAddRule => 'Adicionar regra';

  @override
  String get smartScopeAddGroup => 'Adicionar grupo';

  @override
  String get smartScopeGroup => 'Grupo';

  @override
  String get smartScopeStartFrom => 'Começar com';

  @override
  String get smartScopeFromScratch => 'Criar do zero';

  @override
  String get smartScopeTplHasSeries => 'Tem uma série';

  @override
  String get smartScopeTplRecent => 'Adicionados recentemente';

  @override
  String get smartScopeTplPdf => 'Somente PDF';

  @override
  String get smartScopeTplNoGenres => 'Sem gêneros';

  @override
  String get smartScopeTplEpub => 'Somente EPUB';

  @override
  String get smartScopeCounting => 'Contando...';

  @override
  String get smartScopeSort => 'Ordenação padrão';

  @override
  String get smartScopeAddSort => 'Adicionar nível de ordenação';

  @override
  String get smartScopeSortNone =>
      'Nenhuma ordenação definida, então os livros são ordenados por título.';

  @override
  String get smartScopeAscending => 'Crescente';

  @override
  String get smartScopeDescending => 'Decrescente';

  @override
  String get smartScopeDelete => 'Excluir escopo inteligente';

  @override
  String get smartScopeSaveFailed =>
      'Não foi possível salvar o escopo inteligente';

  @override
  String get smartScopeDeleteFailed =>
      'Não foi possível excluir o escopo inteligente';

  @override
  String get smartScopeLoadFailed =>
      'Não foi possível carregar o escopo inteligente';

  @override
  String get smartScopeUnsupportedRule =>
      'Esta regra só pode ser alterada na web do BookOrbit. Ela é mantida como está.';

  @override
  String get smartScopeAnd => 'e';

  @override
  String get smartScopeDays => 'dias';

  @override
  String get smartScopeWeeks => 'semanas';

  @override
  String get smartScopeMonths => 'meses';

  @override
  String get smartScopePickDate => 'Escolha uma data';

  @override
  String get smartScopeAddValue => 'Adicionar um valor';

  @override
  String get smartScopeValue => 'Valor';

  @override
  String get smartScopeCustomFields => 'Campos personalizados';

  @override
  String get smartScopeAnyProvider => 'Qualquer provedor';

  @override
  String get smartScopeScoreOutstanding => 'Excelente';

  @override
  String get smartScopeScoreGood => 'Bom';

  @override
  String get smartScopeScoreFair => 'Razoável';

  @override
  String get smartScopeScorePoor => 'Ruim';

  @override
  String get smartScopeMb => 'MB';

  @override
  String get smartScopeMaxValues => 'Até 20 valores';

  @override
  String get scopeFieldTitle => 'Título';

  @override
  String get scopeFieldAuthor => 'Autor';

  @override
  String get scopeFieldSeries => 'Série';

  @override
  String get scopeFieldSeriesIndex => 'Número da série';

  @override
  String get scopeFieldGenre => 'Gênero';

  @override
  String get scopeFieldTag => 'Tag';

  @override
  String get scopeFieldReadStatus => 'Status de leitura';

  @override
  String get scopeFieldReadProgress => 'Progresso de leitura';

  @override
  String get scopeFieldRating => 'Sua avaliação';

  @override
  String get scopeFieldFormat => 'Formato';

  @override
  String get scopeFieldLibrary => 'Biblioteca';

  @override
  String get scopeFieldCollection => 'Coleção';

  @override
  String get scopeFieldPublisher => 'Editora';

  @override
  String get scopeFieldLanguage => 'Idioma';

  @override
  String get scopeFieldPublishedDate => 'Data de publicação';

  @override
  String get scopeFieldPublishedYear => 'Ano de publicação';

  @override
  String get scopeFieldAddedAt => 'Data de adição';

  @override
  String get scopeFieldStartedAt => 'Data de início';

  @override
  String get scopeFieldFinishedAt => 'Data de conclusão';

  @override
  String get scopeFieldPageCount => 'Número de páginas';

  @override
  String get scopeFieldFileSize => 'Tamanho do arquivo';

  @override
  String get scopeFieldCommunityRating => 'Avaliação da comunidade';

  @override
  String get scopeFieldCommunityRatingCount =>
      'Número de avaliações da comunidade';

  @override
  String get scopeFieldMetadataScore => 'Pontuação dos metadados';

  @override
  String get scopeFieldIsbn => 'ISBN';

  @override
  String get scopeFieldDescription => 'Descrição';

  @override
  String get scopeFieldCover => 'Capa';

  @override
  String get scopeFieldAudioCover => 'Capa do audiolivro';

  @override
  String get scopeFieldFileAvailability => 'Disponibilidade do arquivo';

  @override
  String get scopeFieldLockStatus => 'Status de bloqueio';

  @override
  String get scopeFieldSeriesStatus => 'Status da série';

  @override
  String get scopeSortUpdatedAt => 'Data de atualização';

  @override
  String get scopeSortLastReadAt => 'Última leitura';

  @override
  String get scopeSortRandom => 'Aleatório';

  @override
  String get scopeOpContains => 'contém';

  @override
  String get scopeOpNotContains => 'não contém';

  @override
  String get scopeOpStartsWith => 'começa com';

  @override
  String get scopeOpEndsWith => 'termina com';

  @override
  String get scopeOpEq => 'é';

  @override
  String get scopeOpNotEq => 'não é';

  @override
  String get scopeOpIsEmpty => 'está vazio';

  @override
  String get scopeOpIsNotEmpty => 'não está vazio';

  @override
  String get scopeOpGt => 'maior que';

  @override
  String get scopeOpGte => 'pelo menos';

  @override
  String get scopeOpLt => 'menor que';

  @override
  String get scopeOpLte => 'no máximo';

  @override
  String get scopeOpBetween => 'entre';

  @override
  String get scopeOpIncludesAny => 'inclui qualquer um de';

  @override
  String get scopeOpIncludesAll => 'inclui todos de';

  @override
  String get scopeOpExcludesAll => 'exclui todos de';

  @override
  String get scopeOpBefore => 'antes de';

  @override
  String get scopeOpAfter => 'depois de';

  @override
  String get scopeOpWithinLast => 'nos últimos';

  @override
  String get scopeOpIsMissing => 'está ausente';

  @override
  String get scopeOpIsPresent => 'está presente';

  @override
  String get scopeOpIsUnread => 'não foi lido';

  @override
  String get scopeOpIsInProgress => 'está em andamento';

  @override
  String get scopeOpIsFinished => 'está concluído';

  @override
  String get scopeOpIsLocked => 'está bloqueado';

  @override
  String get scopeOpIsUnlocked => 'está desbloqueado';

  @override
  String get scopeOpIsUpNext => 'é o próximo';

  @override
  String get scopeOpIsTrue => 'é sim';

  @override
  String get scopeOpIsFalse => 'é não';

  @override
  String smartScopeMatchCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros correspondem',
      one: '1 livro corresponde',
      zero: 'Nenhum livro corresponde',
    );
    return '$_temp0';
  }

  @override
  String smartScopeDeleteConfirm(String name) {
    return 'Excluir \"$name\"? Não é possível desfazer.';
  }

  @override
  String collectionDetailBookCount(int count) {
    return '$count livros';
  }

  @override
  String get collectionDetailDone => 'Concluir';

  @override
  String collectionDetailAddedToAbsorbing(String title) {
    return '\"$title\" adicionado ao Absorbing';
  }

  @override
  String get audibleSeriesNoBooksFound => 'Nenhum livro encontrado no Audible';

  @override
  String get audibleSeriesFailedToLoad =>
      'Falha ao carregar a série do Audible';

  @override
  String audibleSeriesSummary(int total, int missing) {
    return '$total no Audible · $missing ausentes';
  }

  @override
  String audibleSeriesSummaryWithUpcoming(
    int total,
    int missing,
    int upcoming,
  ) {
    return '$total no Audible · $missing ausentes · $upcoming em breve';
  }

  @override
  String audibleSeriesFilterMissing(int count) {
    return 'Ausentes ($count)';
  }

  @override
  String audibleSeriesFilterUpcoming(int count) {
    return 'Em breve ($count)';
  }

  @override
  String audibleSeriesFilterAll(int count) {
    return 'Todos ($count)';
  }

  @override
  String get audibleSeriesSearching => 'Pesquisando no Audible...';

  @override
  String get audibleSeriesCompleteSeries => 'Você tem a série completa!';

  @override
  String get audibleSeriesNoUpcoming => 'Nenhum lançamento futuro encontrado';

  @override
  String get audibleSeriesUpcomingBadge => 'EM BREVE';

  @override
  String get audibleSeriesAbridged => 'Resumido';

  @override
  String get audibleSeriesRegionTitle => 'Região do Audible';

  @override
  String get audibleSeriesOpenOnAudible => 'Abrir no Audible';

  @override
  String get audibleSeriesAddToCalendar => 'Adicionar ao calendário';

  @override
  String get audibleSeriesAddToUpcoming => 'Adicionar aos próximos lançamentos';

  @override
  String get audibleSeriesAddedToUpcoming =>
      'Adicionado aos próximos lançamentos';

  @override
  String get audibleSeriesAlreadyInUpcoming =>
      'Já está na página de próximos lançamentos';

  @override
  String get audibleSeriesCouldNotOpenAudible =>
      'Não foi possível abrir o Audible';

  @override
  String get audibleSeriesCouldNotOpenCalendar =>
      'Não foi possível abrir o calendário';

  @override
  String audibleSeriesCalendarDescription(String seriesName) {
    return 'Novo lançamento de audiolivro da série $seriesName';
  }

  @override
  String get authorBooksGroupBySeries => 'Agrupar por série';

  @override
  String get authorBooksList => 'Lista';

  @override
  String get authorBooksGrid => 'Grade';

  @override
  String authorBooksBookCount(int count) {
    return '$count livros';
  }

  @override
  String get metadataLookupCover => 'Capa';

  @override
  String get metadataLookupChooseFields => 'Escolher campos para aplicar';

  @override
  String metadataLookupApplyFields(int count) {
    return 'Aplicar $count campos';
  }

  @override
  String metadataLookupFieldsSavedLocally(int count) {
    return '$count campos salvos localmente';
  }

  @override
  String get metadataLookupOverrideLocalDisplay => 'Substituir exibição local';

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
  String get equalizerPresetAudiobook => 'Audiolivro';

  @override
  String get equalizerPresetReduceNoise => 'Reduzir ruído';

  @override
  String get equalizerPresetLoudness => 'Loudness';

  @override
  String equalizerEditingSavedNamed(String title) {
    return 'Editando o EQ salvo de \"$title\"';
  }

  @override
  String get equalizerEditingSavedGeneric => 'Editando o EQ salvo';

  @override
  String get equalizerPerBookEq => 'EQ por livro';

  @override
  String get notesDeleteNoteQuestion => 'Excluir nota?';

  @override
  String notesDeleteNoteContent(String title) {
    return 'Excluir \"$title\"?';
  }

  @override
  String get notesExport => 'Exportar';

  @override
  String get notesNewNote => 'Nova nota';

  @override
  String get librarySortFilterUpcomingReleases => 'Verificar séries';

  @override
  String get librarySortFilterMatchAllAuthorsSubtitle =>
      'Buscar foto e biografia de cada autor no provedor de metadados';

  @override
  String get librarySortFilterUpcomingReleasesSubtitle =>
      'Consulte o Audible para ver livros futuros e ausentes nas suas séries';

  @override
  String sleepTimerSheetChaptersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capítulos restantes',
      one: '1 capítulo restante',
    );
    return '$_temp0';
  }

  @override
  String sleepTimerSheetAddMinutesChip(int minutes) {
    return '+${minutes}min';
  }

  @override
  String sleepTimerSheetAddChaptersChip(int count) {
    return '+$count cap.';
  }

  @override
  String sleepTimerSheetMinShort(int minutes) {
    return '${minutes}min';
  }

  @override
  String sleepTimerSheetSecondsShort(int seconds) {
    return '${seconds}s';
  }

  @override
  String sleepTimerSheetMinSecShort(int minutes, int seconds) {
    return '${minutes}min ${seconds}s';
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
      other: 'Dormir após $count capítulos',
      one: 'Dormir após 1 capítulo',
    );
    return '$_temp0';
  }

  @override
  String get sleepTimerSheetRewindOnSleep => 'Retroceder ao dormir';

  @override
  String get sleepTimerSheetShake => 'Agitar';

  @override
  String sleepTimerSheetAddsMinutes(int minutes) {
    return 'Adiciona $minutes min';
  }

  @override
  String get sleepTimerSheetAddsOneChapter => 'Adiciona 1 capítulo';

  @override
  String get sleepTimerSheetResetsToFull => 'Volta à duração total';

  @override
  String get sleepTimerSheetTabSpecificChapter => 'Capítulo';

  @override
  String get sleepTimerSheetSpecificNoChapters => 'Nenhum capítulo disponível';

  @override
  String sleepTimerSheetSpecificChapterFallback(int number) {
    return 'Capítulo $number';
  }

  @override
  String get sleepTimerSheetSpecificPassedShort => 'passou';

  @override
  String get sleepTimerSheetSpecificStart => 'Início do capítulo';

  @override
  String get sleepTimerSheetSpecificEnd => 'Fim do capítulo';

  @override
  String get sleepTimerSheetSpecificEndsAt => 'O temporizador terminará em';

  @override
  String sleepTimerSheetSpecificCountdown(String countdown) {
    return 'em $countdown';
  }

  @override
  String get sleepTimerSheetSpecificAlreadyPassed => 'Este ponto já passou';

  @override
  String get sleepTimerSheetSpecificStartButton => 'Iniciar temporizador';

  @override
  String get sleepTimerSheetSpecificStartButtonPassed => 'Já passou';

  @override
  String get timeAm => 'AM';

  @override
  String get timePm => 'PM';

  @override
  String get collectionPickerCollectionFallback => 'Coleção';

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
  String get cardChaptersPlayFromChapterTitle =>
      'Reproduzir a partir do capítulo?';

  @override
  String cardChaptersPlayFromChapterContent(String title) {
    return 'Começar a reproduzir a partir de \"$title\"?';
  }

  @override
  String get cardChaptersPlay => 'Reproduzir';

  @override
  String get absorbingSharedToday => 'Hoje';

  @override
  String get absorbingSharedYesterday => 'Ontem';

  @override
  String get absorbingSharedMonday => 'Segunda-feira';

  @override
  String get absorbingSharedTuesday => 'Terça-feira';

  @override
  String get absorbingSharedWednesday => 'Quarta-feira';

  @override
  String get absorbingSharedThursday => 'Quinta-feira';

  @override
  String get absorbingSharedFriday => 'Sexta-feira';

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
    return '\"$title\" adicionado ao Absorbing';
  }

  @override
  String get sectionDetailDoneBadge => 'Concluído';

  @override
  String get homeCustomizeAddGenreTitle => 'Adicionar seção de gênero';

  @override
  String get homeCustomizeAddGenreSubtitle =>
      'Escolha um gênero para exibir na tela inicial';

  @override
  String get homeSectionDoneBadge => 'Concluído';

  @override
  String get tipsSheetQuickBookmarksTitle => 'Marcadores rápidos';

  @override
  String get tipsSheetQuickBookmarksDesc =>
      'Mantenha pressionado o botão de marcador em qualquer card para criar instantaneamente um marcador na posição atual, sem abrir a janela de marcadores.';

  @override
  String get tipsSheetCoverPlayPauseTitle => 'Reproduzir/pausar pela capa';

  @override
  String get tipsSheetCoverPlayPauseDesc =>
      'Toque na capa em qualquer card para reproduzir ou pausar. Ative ou desative isto em Configurações, em Cards do Absorbing. Um ícone de pausa discreto aparece durante a reprodução para mostrar que dá para tocar.';

  @override
  String get tipsSheetFullScreenPlayerTitle => 'Player em tela cheia';

  @override
  String get tipsSheetFullScreenPlayerDesc =>
      'Deslize para cima em qualquer card do Absorbing para abrir o player em tela cheia. Deslize para baixo para fechá-lo.';

  @override
  String get tipsSheetQuickAddAbsorbingTitle => 'Adição rápida ao Absorbing';

  @override
  String get tipsSheetQuickAddAbsorbingDesc =>
      'Deslize para a direita em qualquer livro de uma lista (série, autor, resultados da pesquisa) para adicioná-lo instantaneamente à sua fila do Absorbing.';

  @override
  String get tipsSheetShakeExtendSleepTitle => 'Agite para prolongar';

  @override
  String get tipsSheetShakeExtendSleepDesc =>
      'Se o temporizador estiver ativo e você agitar o celular, ele adicionará minutos extras. Configure o valor em Configurações, em Temporizador.';

  @override
  String get tipsSheetSeriesNavigationTitle => 'Navegação por série';

  @override
  String get tipsSheetSeriesNavigationDesc =>
      'Toque no nome da série na janela de detalhes de qualquer livro para ver todos os livros da série, em ordem de leitura, com emblemas de sequência em cada capa.';

  @override
  String get tipsSheetSwipeBetweenBooksTitle => 'Deslize entre livros';

  @override
  String get tipsSheetSwipeBetweenBooksDesc =>
      'Deslize para a esquerda e para a direita na tela Absorbing para alternar entre seus livros em andamento. Com o modo de fila manual ativado, os cards também funcionam como sua fila, e o próximo é reproduzido automaticamente quando o atual termina.';

  @override
  String get tipsSheetTapToSeekTitle => 'Toque para avançar';

  @override
  String get tipsSheetTapToSeekDesc =>
      'Toque em qualquer ponto da barra de progresso do capítulo ou do livro para ir direto àquela posição. Você também pode arrastar as barras para um controle mais preciso.';

  @override
  String get tipsSheetSpeedAdjustedTimeTitle => 'Tempo ajustado à velocidade';

  @override
  String get tipsSheetSpeedAdjustedTimeDesc =>
      'Todos os tempos exibidos - posição, restante, capítulos, marcadores - se ajustam à velocidade de reprodução. Ouvindo a 1.5x? Os tempos mostrados refletem quanto tempo realmente levarão.';

  @override
  String get tipsSheetPlaybackHistoryTitle => 'Histórico de reprodução';

  @override
  String get tipsSheetPlaybackHistoryDesc =>
      'Toque no botão Histórico em qualquer card para ver uma linha do tempo de cada reprodução, pausa, avanço e mudança de velocidade. Toque em qualquer evento para voltar àquela posição.';

  @override
  String get tipsSheetAutoRewindTitle => 'Retrocesso automático';

  @override
  String get tipsSheetAutoRewindDesc =>
      'Ao retomar depois de uma pausa, o Absorb retrocede automaticamente alguns segundos para você não perder o ponto. O retrocesso aumenta conforme o tempo que você ficou longe. Configure em Configurações.';

  @override
  String get tipsSheetSeriesQueueModeTitle => 'Modo de fila por série';

  @override
  String get tipsSheetSeriesQueueModeDesc =>
      'Quando você termina um livro que faz parte de uma série, o Absorb pode reproduzir o próximo livro automaticamente. Defina o modo de fila como \"Série\" em Configurações.';

  @override
  String get tipsSheetOfflineModeTitle => 'Modo offline';

  @override
  String get tipsSheetOfflineModeDesc =>
      'Toque no botão de avião na tela Absorbing para entrar no modo offline. Isso interrompe a sincronização, economiza dados e mostra apenas os livros baixados. Ótimo para voos ou locais com pouco sinal.';

  @override
  String get tipsSheetUpcomingReleasesTitle => 'Próximos lançamentos';

  @override
  String get tipsSheetUpcomingReleasesDesc =>
      'Na aba Séries, toque na aba novamente para abrir a janela de ordenação e filtros e escolha Próximos lançamentos para ver livros novos e futuros de todas as suas séries, ordenados por data de lançamento.';

  @override
  String get tipsSheetPerBookEqTitle => 'Equalizador por livro';

  @override
  String get tipsSheetPerBookEqDesc =>
      'Cada livro lembra suas próprias configurações de equalizador. Ajuste o EQ uma vez para uma epopeia de ficção científica e, da próxima vez que a reproduzir, ela soará igual.';

  @override
  String get tipsSheetPerBookSpeedTitle => 'Velocidade por livro';

  @override
  String get tipsSheetPerBookSpeedDesc =>
      'A velocidade de reprodução é salva por livro. Ouça não ficção a 1.5x e ficção dramática a 1.0x sem ajustar toda vez.';

  @override
  String get tipsSheetAutoSleepWindowTitle => 'Janela de sono automática';

  @override
  String get tipsSheetAutoSleepWindowDesc =>
      'Escolha os horários em que você costuma adormecer e o temporizador será iniciado sozinho quando você começar a ouvir nessa janela.';

  @override
  String get tipsSheetSleepFadeChimeTitle =>
      'Esmaecer e sinal sonoro ao dormir';

  @override
  String get tipsSheetSleepFadeChimeDesc =>
      'Quando o temporizador termina, o áudio esmaece gradualmente e um sinal sonoro opcional toca, para não cortar no meio de uma frase.';

  @override
  String get tipsSheetCarModeTitle => 'Modo carro';

  @override
  String get tipsSheetCarModeDesc =>
      'Toque no ícone de carro para mudar para o modo de botões gigantes, projetado para um uso mais seguro ao dirigir.';

  @override
  String get tipsSheetAudibleSeriesTitle => 'Descoberta de séries do Audible';

  @override
  String get tipsSheetAudibleSeriesDesc =>
      'Abra uma série e use o menu de opções (os três pontos) para obter a lista completa da série no Audible, incluindo itens ausentes e livros que você ainda não começou.';

  @override
  String get tipsSheetTranscribeBookmarkTitle => 'Transcrever marcadores';

  @override
  String get tipsSheetTranscribeBookmarkDesc =>
      'Transforme em texto o áudio de qualquer marcador, totalmente no seu dispositivo. Ative em Configurações, em Avançado > Transcrição, baixe um modelo e toque em Transcrever em um marcador - o texto vai para a nota dele, pronto para corrigir ou compartilhar.';

  @override
  String get tipsSheetFindBetweenFormatsTitle =>
      'Alternar entre audiolivro e e-book';

  @override
  String get tipsSheetFindBetweenFormatsDesc =>
      'Com a transcrição ativada e o livro baixado, pause e toque em Encontrar posição no e-book no player para abrir o e-book na passagem que você acabou de ouvir. No leitor, selecione um trecho e toque nos fones de ouvido para iniciar o audiolivro exatamente ali.';

  @override
  String get tipsSheetShareQuoteTitle => 'Compartilhar citações';

  @override
  String get tipsSheetShareQuoteDesc =>
      'Compartilhe um destaque de e-book ou a nota de um marcador como uma imagem com a citação sobre a capa do livro. Procure a opção de compartilhar nos destaques e na janela de marcadores.';

  @override
  String get tipsSheetClipExportTitle => 'Exportar trechos de áudio';

  @override
  String get tipsSheetClipExportDesc =>
      'Abra um marcador e toque em Exportar trecho para cortar e salvar um pequeno trecho de áudio do livro, com a capa incluída - ótimo para compartilhar uma cena favorita.';

  @override
  String get tipsSheetAllHighlightsTitle => 'Todos os destaques em um só lugar';

  @override
  String get tipsSheetAllHighlightsDesc =>
      'A página Todos os marcadores tem uma aba Destaques que reúne todos os destaques de e-books de todos os livros. Toque em um para compartilhá-lo ou voltar ao livro.';

  @override
  String get tipsSheetVolumeKeyPagesTitle =>
      'Virar página com as teclas de volume';

  @override
  String get tipsSheetVolumeKeyPagesDesc =>
      'Vire as páginas do e-book com as teclas de volume. Ative nas configurações do leitor - direção normal ou invertida - e pode continuar ativo mesmo durante a reprodução de áudio.';

  @override
  String get tipsSheetSettingsSyncTitle => 'Sincronização de configurações';

  @override
  String get tipsSheetSettingsSyncDesc =>
      'Mantenha suas configurações, velocidades por livro e a ordem do Absorbing alinhadas entre dispositivos por meio do seu próprio servidor WebDAV. Configure em Configurações, em Backup e sincronização.';

  @override
  String get tipsSheetNavLongPressTitle =>
      'Pressione e segure as abas inferiores';

  @override
  String get tipsSheetNavLongPressDesc =>
      'Mantenha pressionada a aba Início para trocar de biblioteca de qualquer página. Mantenha pressionada a aba Biblioteca para ir direto à pesquisa.';

  @override
  String get bookCardUnknownTitle => 'Título desconhecido';

  @override
  String get bookCardExplicitBadge => 'E';

  @override
  String get bookCardDone => 'Concluído';

  @override
  String get bookCardSaved => 'Salvo';

  @override
  String get episodeRowEpisode => 'Episódio';

  @override
  String get episodeRowToday => 'Hoje';

  @override
  String get episodeRowYesterday => 'Ontem';

  @override
  String episodeRowDaysAgo(int count) {
    return 'há $count d';
  }

  @override
  String episodeRowWeeksAgo(int count) {
    return 'há $count sem';
  }

  @override
  String episodeRowDurationHm(int hours, int minutes) {
    return '${hours}h ${minutes}min';
  }

  @override
  String episodeRowDurationM(int minutes) {
    return '${minutes}min';
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
  String get librarySearchResultsDone => 'Concluído';

  @override
  String get librarySearchResultsSaved => 'Salvo';

  @override
  String librarySearchResultsSequence(String number) {
    return '#$number';
  }

  @override
  String get librarySearchResultsUnknownSeries => 'Série desconhecida';

  @override
  String get librarySearchResultsUnknownEpisode => 'Episódio desconhecido';

  @override
  String librarySearchResultsBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros',
      one: '1 livro',
    );
    return '$_temp0';
  }

  @override
  String get libraryGridTilesExplicitBadge => 'E';

  @override
  String get libraryGridTilesDone => 'Concluído';

  @override
  String get libraryGridTilesSaved => 'Salvo';

  @override
  String libraryGridTilesSequence(String number) {
    return '#$number';
  }

  @override
  String get libraryGridTilesUnknownSeries => 'Série desconhecida';

  @override
  String get seriesCardUnknownSeries => 'Série desconhecida';

  @override
  String seriesCardBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros',
      one: '1 livro',
    );
    return '$_temp0';
  }

  @override
  String get cardProgressFineScrubbing => 'Ajuste fino';

  @override
  String get cardProgressQuarterSpeed => 'Um quarto da velocidade';

  @override
  String get cardProgressHalfSpeed => 'Metade da velocidade';

  @override
  String cardProgressChapterPrefix(String number) {
    return 'Capítulo $number';
  }

  @override
  String get cardEdgeProgressFineScrubbing => 'Ajuste fino';

  @override
  String get cardEdgeProgressQuarterSpeed => 'Um quarto da velocidade';

  @override
  String get cardEdgeProgressHalfSpeed => 'Metade da velocidade';

  @override
  String get authSessionExpired => 'Sessão expirada. Entre novamente.';

  @override
  String authCannotReachServer(String url) {
    return 'Não foi possível acessar o servidor em $url';
  }

  @override
  String get authInvalidUsernameOrPassword =>
      'Nome de usuário ou senha inválidos';

  @override
  String get authInvalidApiKey => 'Chave de API inválida';

  @override
  String get authLoginFailedDetail =>
      'Falha ao entrar - verifique o endereço do servidor e as credenciais';

  @override
  String get authUnexpectedServerResponse => 'Resposta inesperada do servidor';

  @override
  String get authSsoUnexpectedResponse =>
      'O SSO retornou uma resposta inesperada';

  @override
  String get authSwitchedToLocalServer => 'Alternado para o servidor local';

  @override
  String get authSwitchedToRemoteServer => 'Alternado para o servidor remoto';

  @override
  String get lpDeletedFinishedDownload => 'Download concluído excluído';

  @override
  String lpSubscribedPodcastDownloading(String showTitle, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'baixando $count novos episódios',
      one: 'baixando 1 novo episódio',
    );
    return '$showTitle: $_temp0';
  }

  @override
  String lpSubscribedEpisodeAddedStart(String showTitle) {
    return '$showTitle adicionado ao início da sua fila';
  }

  @override
  String lpSubscribedEpisodeAddedSecond(String showTitle) {
    return '$showTitle adicionado em 2º lugar na sua fila';
  }

  @override
  String lpSubscribedEpisodeAddedEnd(String showTitle) {
    return '$showTitle adicionado ao fim da sua fila';
  }

  @override
  String lpSubscribedEpisodeDownloaded(String showTitle) {
    return 'Novo episódio de $showTitle baixado';
  }

  @override
  String get statsWeekStartsOn => 'A semana começa em';

  @override
  String get episodeListNewEpisodePosition => 'Posição do novo episódio';

  @override
  String get episodeListPositionTop => 'Início da fila';

  @override
  String get episodeListPositionSecond => 'Segundo na fila';

  @override
  String get episodeListPositionEnd => 'Fim da fila';

  @override
  String get episodeListPositionNone => 'Não adicionar à fila';

  @override
  String get episodeListPositionNoneDesc =>
      'Você ainda é notificado e o download é feito';

  @override
  String sleepRewindUndoNote(int minutes) {
    return 'Se tocar em reproduzir em até $minutes minutos, o retrocesso é desfeito';
  }

  @override
  String lpQueueDownloadingItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fila: baixando $count itens',
      one: 'Fila: baixando 1 item',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Baixando $count livros',
      one: 'Baixando 1 livro',
    );
    return '$_temp0';
  }

  @override
  String lpDownloadingEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Baixando $count episódios',
      one: 'Baixando 1 episódio',
    );
    return '$_temp0';
  }

  @override
  String get downloadNotifProgressChannelName => 'Progresso dos downloads';

  @override
  String get downloadNotifProgressChannelDesc =>
      'Mostra o progresso durante o download de audiolivros';

  @override
  String get downloadNotifAlertChannelName => 'Alertas de download';

  @override
  String get downloadNotifAlertChannelDesc =>
      'Notificações quando os downloads terminam ou falham';

  @override
  String get downloadNotifDownloadingTitle => 'Baixando…';

  @override
  String downloadNotifActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count downloads ativos',
      one: '1 download ativo',
    );
    return '$_temp0';
  }

  @override
  String downloadNotifSlotTitle(String title) {
    return 'Baixando: $title';
  }

  @override
  String get downloadNotifStartingLabel => 'Iniciando…';

  @override
  String get downloadNotifCompleteTitle => 'Download concluído';

  @override
  String downloadNotifCompleteBody(String title) {
    return '$title está pronto para ouvir offline';
  }

  @override
  String get downloadNotifFailedTitle => 'Falha no download';

  @override
  String get upcomingNotifChannelName => 'Verificação de próximos lançamentos';

  @override
  String get upcomingNotifChannelDesc =>
      'Mostra o progresso durante a verificação de próximos lançamentos';

  @override
  String get upcomingNotifScanTitle => 'Verificando próximos lançamentos';

  @override
  String get upcomingNotifStartingScan => 'Iniciando verificação…';

  @override
  String upcomingNotifCheckingSeries(
    String seriesName,
    int current,
    int total,
  ) {
    return 'Verificando $seriesName… ($current/$total)';
  }

  @override
  String get upcomingNotifFoundTitle => 'Próximos lançamentos encontrados!';

  @override
  String upcomingNotifFoundBody(int books, int series) {
    String _temp0 = intl.Intl.pluralLogic(
      series,
      locale: localeName,
      other: '$series séries',
      one: '1 série',
    );
    return '$books em breve em $_temp0';
  }

  @override
  String get androidAutoTabContinue => 'Continuar';

  @override
  String get androidAutoTabLibrary => 'Biblioteca';

  @override
  String get androidAutoTabDownloads => 'Downloads';

  @override
  String get settingsSearchHint => 'Pesquisar configurações...';

  @override
  String get settingsSearchNoResults => 'Nenhuma configuração correspondente';

  @override
  String get carConnectAutoplay =>
      'Iniciar a reprodução quando o Android Auto se conectar';

  @override
  String get carConnectAutoplayIos =>
      'Iniciar a reprodução quando o CarPlay se conectar';

  @override
  String get carConnectAutoplayOnSubtitle =>
      'O último livro que você estava ouvindo começa sozinho quando o carro se conecta';

  @override
  String get carConnectAutoplayOffSubtitle =>
      'A reprodução espera você tocar em reproduzir';

  @override
  String get sectionCar => 'Android Auto';

  @override
  String get sectionCarIos => 'CarPlay';

  @override
  String get sectionSiri => 'Siri';

  @override
  String get siriUseWithSiri => 'Usar com a Siri';

  @override
  String get siriStatusOn =>
      'Ativado. A Siri pode encontrar e reproduzir seus livros e podcasts pelo nome.';

  @override
  String get siriStatusAsk =>
      'Deixe a Siri encontrar e reproduzir seus livros e podcasts pelo nome.';

  @override
  String get siriStatusOff =>
      'A Siri está desativada para o Absorb. Ative nas Configurações do iOS.';

  @override
  String get siriAllow => 'Permitir';

  @override
  String get siriOpenSettings => 'Abrir Configurações';

  @override
  String get siriThingsToSay => 'O que dizer';

  @override
  String get siriExamples =>
      '\"Reproduzir [título do livro] no Absorb\"\n\"Reproduzir [nome da série] no Absorb\"\n\"Reproduzir algo de [autor] no Absorb\"\n\"Reproduzir o último episódio de [podcast] no Absorb\"\n\"Retomar o Absorb\"\n\"Voltar no Absorb\"\n\"Próximo capítulo no Absorb\"\n\"Definir um temporizador no Absorb\"\n\"Adicionar um marcador no Absorb\"\n\"O que estou ouvindo no Absorb\"';

  @override
  String get siriShortcutsNote =>
      'Retomar, pausar, pular, capítulos, o temporizador, marcadores e o que está tocando funcionam mesmo sem esta permissão. Eles também estão no app Atalhos, para automações e o botão de Ação.';

  @override
  String get carBookOrder => 'Ordem dos livros no carro';

  @override
  String get carBookOrderReverse => 'Inverter a ordem dos livros';

  @override
  String get carBookOrderReverseSubtitle =>
      'Z a A, ou os mais antigos adicionados primeiro';

  @override
  String get carPodcastOrder => 'Ordem dos podcasts no carro';

  @override
  String get carEpisodesOldestFirst => 'Episódios mais antigos primeiro';

  @override
  String get carEpisodesOldestFirstSubtitle =>
      'Para programas que você ouve desde o início';

  @override
  String get androidAutoCatBooks => 'Livros';

  @override
  String get androidAutoCatSeries => 'Séries';

  @override
  String get androidAutoCatAuthors => 'Autores';

  @override
  String get androidAutoCatCollections => 'Coleções';

  @override
  String get androidAutoCatPlaylists => 'Playlists';

  @override
  String get showTipsAgain => 'Mostrar dicas novamente';

  @override
  String get showTipsAgainSubtitle =>
      'Traga de volta as dicas de recursos que você dispensou';

  @override
  String get tipsRestored => 'Dicas restauradas';

  @override
  String get resetSpeedPresets => 'Redefinir velocidades predefinidas';

  @override
  String get resetSpeedPresetsSubtitle =>
      'Restaura os chips padrão de velocidade de reprodução';

  @override
  String get speedPresetsReset => 'Velocidades predefinidas redefinidas';

  @override
  String get editAuthor => 'Editar autor';

  @override
  String get authorName => 'Nome';

  @override
  String get authorImage => 'Imagem do autor';

  @override
  String get authorRemoveImage => 'Remover imagem';

  @override
  String get authorRemoveImageTitle => 'Remover imagem do autor?';

  @override
  String get authorRemoveImageConfirm => 'Isso exclui a imagem no servidor.';

  @override
  String get authorImageRemoved => 'Imagem removida';

  @override
  String get authorImageFailed =>
      'Não foi possível atualizar a imagem do autor';

  @override
  String get authorUpdated => 'Autor atualizado';

  @override
  String get authorUpdateFailed => 'Não foi possível atualizar o autor';

  @override
  String get authorMatched => 'Autor atualizado a partir da correspondência';

  @override
  String get authorNoMatchFound => 'Nenhuma correspondência encontrada';

  @override
  String authorMergedInto(String name) {
    return 'Mesclado em $name';
  }

  @override
  String get authorQuickMatchHint =>
      'Obtém nome, ASIN, descrição e imagem do Audible para a região escolhida.';

  @override
  String get region => 'Região';

  @override
  String get editTabDetails => 'Detalhes';

  @override
  String get editTabCover => 'Capa';

  @override
  String get editTabMatch => 'Correspondência';

  @override
  String get editTabEmbed => 'Incorporar';

  @override
  String get chapterEditorTitle => 'Editar capítulos';

  @override
  String get chapterNotConnected => 'Não conectado a um servidor';

  @override
  String get chapterErrorFirstNotZero =>
      'O primeiro capítulo deve começar em 0:00';

  @override
  String get chapterErrorStartAfterPrevious =>
      'O início deve vir depois do capítulo anterior';

  @override
  String get chapterErrorStartBeforeEnd =>
      'O início deve ser antes do fim do livro';

  @override
  String get chapterErrorTitleRequired => 'Título obrigatório';

  @override
  String get chapterEditStartTitle => 'Editar hora de início';

  @override
  String get chapterTimeHintSeconds => 'Segundos';

  @override
  String get chapterTimeHintFull => 'HH:MM:SS ou segundos';

  @override
  String get chapterInvalidTime => 'Hora inválida';

  @override
  String get chapterLocked => 'O capítulo está bloqueado';

  @override
  String get chapterAllLocked => 'Todos os capítulos estão bloqueados';

  @override
  String chapterTrackTitle(int number) {
    return 'Faixa $number';
  }

  @override
  String get chapterNoAudioForPosition => 'Sem áudio para esta posição';

  @override
  String get chapterCouldNotPlayPreview =>
      'Não foi possível reproduzir a prévia';

  @override
  String chapterStartSetTo(String time) {
    return 'Início definido para $time';
  }

  @override
  String get chapterAddNumberedTitle => 'Adicionar capítulos numerados';

  @override
  String chapterNextPreview(String first, String second) {
    return 'Próximos: \"$first\", \"$second\", ...';
  }

  @override
  String get chapterHowMany => 'Quantos capítulos';

  @override
  String get add => 'Adicionar';

  @override
  String get chapterCountRange => 'Digite uma quantidade entre 1 e 150';

  @override
  String get chapterTitlesUpdated => 'Títulos dos capítulos atualizados';

  @override
  String get chaptersApplied => 'Capítulos aplicados';

  @override
  String get chapterDiscardTitle => 'Descartar alterações?';

  @override
  String get chapterDiscardMessage => 'Voltar aos capítulos salvos.';

  @override
  String get chapterRemoveAllTitle => 'Remover todos os capítulos?';

  @override
  String get chapterRemoveAllMessage =>
      'Isso remove todos os capítulos deste livro.';

  @override
  String get chapterAllRemoved => 'Todos os capítulos removidos';

  @override
  String get chapterFixHighlighted =>
      'Corrija primeiro os capítulos destacados';

  @override
  String get chaptersUpdated => 'Capítulos atualizados';

  @override
  String get ok => 'OK';

  @override
  String get chapterSaveButton => 'Salvar capítulos';

  @override
  String get chapterAddHint => 'Adicionar capítulo (ex.: \"Capítulo 01\")';

  @override
  String get chapterAddTooltip => 'Adicionar capítulo(s)';

  @override
  String get chapterRemoveAll => 'Remover todos';

  @override
  String get chapterShiftTimes => 'Deslocar tempos';

  @override
  String get chapterFromTracks => 'Das faixas';

  @override
  String get chapterLookup => 'Buscar';

  @override
  String get chapterShowSeconds => 'Mostrar segundos';

  @override
  String chapterWindowMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get chapterLoopCut => 'Repetir o corte';

  @override
  String get chapterFindStart => 'Encontrar o início';

  @override
  String get chapterFindStartListening => 'Ouvindo ao redor do marcador';

  @override
  String get chapterFindStartNone => 'Nada aqui soa como início de capítulo';

  @override
  String get chapterFindStartWider => 'Pesquisar mais amplamente';

  @override
  String get chapterFindStartCeiling =>
      'Foi pesquisada meia hora ao redor do marcador. O início está mais distante do que isso, ou não há anúncio de capítulo para ouvir.';

  @override
  String get chapterFindStartStrong => 'Soa como este capítulo';

  @override
  String get chapterFindStartMaybe => 'Palavras de capítulo';

  @override
  String chapterFindStartGap(String seconds) {
    return 'intervalo de ${seconds}s';
  }

  @override
  String chapterFindStartRange(String from, String to) {
    return 'Pesquisado de $from a $to';
  }

  @override
  String get chapterFindStartNeedsModel =>
      'Ative a transcrição em Configurações e baixe um modelo primeiro';

  @override
  String get chapterFindStartUseThis => 'Usar este';

  @override
  String chapterFindStartTitle(String title) {
    return 'Título: $title';
  }

  @override
  String get chapterShiftBySeconds => 'Deslocar em (segundos)';

  @override
  String get chapterShiftHint =>
      'Desloca todos os capítulos desbloqueados. Use um valor negativo para adiantá-los.';

  @override
  String get chapterTitleHint => 'Título do capítulo';

  @override
  String get chapterStopPreview => 'Parar prévia';

  @override
  String get chapterPreviewFromHere => 'Prévia a partir daqui';

  @override
  String get chapterScrubHint => 'Arraste ou ajuste para mover o início';

  @override
  String chapterStartAt(String time) {
    return 'Início em $time';
  }

  @override
  String get chapterUnlock => 'Desbloquear';

  @override
  String get chapterLock => 'Bloquear';

  @override
  String get chapterInsertBelow => 'Inserir abaixo';

  @override
  String get chapterFindTitle => 'Encontrar capítulos';

  @override
  String get chapterFindSubtitle =>
      'Busca capítulos no Audible/Audnexus pelo ASIN.';

  @override
  String get chapterEnterAsin => 'Digite um ASIN';

  @override
  String get chapterLookupFailed => 'Falha na busca - verifique o ASIN';

  @override
  String get chapterNoChaptersFound =>
      'Nenhum capítulo encontrado para esse ASIN';

  @override
  String get chapterRemoveBranding =>
      'Remover a identidade do Audible (introdução/encerramento)';

  @override
  String chapterFoundCount(int count) {
    return '$count capítulos encontrados';
  }

  @override
  String chapterAudibleVsBook(String audible, String book) {
    return 'Audible $audible  -  Livro $book';
  }

  @override
  String get chapterAudibleLonger =>
      'A versão do Audible é mais longa que o seu arquivo - os capítulos finais podem não coincidir.';

  @override
  String get chapterAudibleShorter =>
      'A versão do Audible é mais curta que o seu arquivo - os capítulos podem não coincidir.';

  @override
  String get chapterTitlesOnly => 'Somente títulos';

  @override
  String get chapterApplyChapters => 'Aplicar capítulos';

  @override
  String get coverSearchTitle => 'Pesquisar uma capa';

  @override
  String get coverSearchRefineHint =>
      'Refine o título/autor para limpar os resultados - isso não altera o livro.';

  @override
  String get coverNoneFound => 'Nenhuma capa encontrada';

  @override
  String get coverEnterTitleFirst => 'Digite um título primeiro';

  @override
  String get coverUpdated => 'Capa atualizada';

  @override
  String get coverCouldNotUpdate => 'Não foi possível atualizar a capa';

  @override
  String get coverApply => 'Aplicar capa';

  @override
  String get coverUnknownResolution => 'Resolução desconhecida';

  @override
  String get embedIntro =>
      'Incorpore metadados nos arquivos de áudio, incluindo imagem da capa e capítulos.';

  @override
  String get embedBackupOption => 'Fazer backup dos arquivos de áudio antes';

  @override
  String get embedNoteInFolder =>
      'Os metadados serão incorporados às faixas de áudio dentro da pasta do seu audiolivro.';

  @override
  String get embedNoteMultiTrack =>
      'Os capítulos não são incorporados em audiolivros com várias faixas.';

  @override
  String get embedNoteNavigateAway =>
      'Depois que a tarefa for iniciada, você pode sair desta página.';

  @override
  String get embedStartButton => 'Iniciar incorporação de metadados';

  @override
  String embedProgress(String percent) {
    return 'Incorporando $percent%';
  }

  @override
  String get embedProgressIndeterminate => 'Incorporando...';

  @override
  String taskProgressKeepsRunning(String percent) {
    return '$percent% - continua em execução se você sair desta página';
  }

  @override
  String get taskStarting => 'Iniciando...';

  @override
  String get embedBackupNoteIntro =>
      'Um backup dos seus arquivos de áudio originais será armazenado no servidor em ';

  @override
  String embedBackupNotePath(String itemId) {
    return '/metadata/cache/items/$itemId/';
  }

  @override
  String get embedBackupNoteOutro =>
      '. Lembre-se de limpar periodicamente o cache de itens.';

  @override
  String get embedDialogTitle => 'Incorporar metadados';

  @override
  String embedConfirmMessage(int count, String backup) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# arquivos de áudio',
      one: '# arquivo de áudio',
    );
    return 'Incorporar metadados em $_temp0? Seus arquivos de áudio serão reescritos$backup.';
  }

  @override
  String get embedConfirmBackupClause => ' (originais com backup antes)';

  @override
  String get embedConfirmAction => 'Incorporar';

  @override
  String get embedCouldNotStart => 'Não foi possível iniciar a incorporação';

  @override
  String get embedStarted => 'Incorporação iniciada';

  @override
  String get embedComplete => 'Incorporação concluída';

  @override
  String get embedFailed => 'Falha na incorporação';

  @override
  String get encodeComplete => 'Codificação concluída';

  @override
  String get encodeFailedTask => 'Falha na codificação';

  @override
  String encodeProgress(String percent) {
    return 'Codificando $percent%';
  }

  @override
  String get encodeProgressIndeterminate => 'Codificando...';

  @override
  String get adminApiKeys => 'Chaves de API';

  @override
  String get adminApiKeysSubtitle => 'Tokens de acesso programático';

  @override
  String get adminApiKeysNewTitle => 'Nova chave de API';

  @override
  String get adminApiKeysName => 'Nome';

  @override
  String get adminApiKeysNameHint => 'ex.: Home Assistant';

  @override
  String get adminApiKeysOwner => 'Usuário';

  @override
  String get adminApiKeysExpiration => 'Expiração';

  @override
  String get adminApiKeysActive => 'Ativa';

  @override
  String get adminApiKeysActiveSub => 'A chave funciona assim que é criada';

  @override
  String get adminApiKeysInactive => 'Inativa';

  @override
  String get adminApiKeysExpired => 'Expirada';

  @override
  String get adminApiKeysCreate => 'Criar chave';

  @override
  String get adminApiKeysCreated => 'Chave de API criada';

  @override
  String get adminApiKeysTokenLabel => 'Sua nova chave de API';

  @override
  String get adminApiKeysCopyWarning =>
      'Copie esta chave agora. Por segurança, ela não será mostrada novamente.';

  @override
  String get adminApiKeysCopy => 'Copiar';

  @override
  String get adminApiKeysCopied => 'Copiado para a área de transferência';

  @override
  String get adminApiKeysDone => 'Concluir';

  @override
  String get adminApiKeysDeleteTitle => 'Revogar chave de API?';

  @override
  String get adminApiKeysDeleted => 'Chave de API revogada';

  @override
  String get adminApiKeysRevoke => 'Revogar';

  @override
  String get adminApiKeysSetActive => 'Ativar';

  @override
  String get adminApiKeysSetInactive => 'Desativar';

  @override
  String get adminApiKeysFailedCreate =>
      'Não foi possível criar a chave de API';

  @override
  String get adminApiKeysFailedDelete =>
      'Não foi possível revogar a chave de API';

  @override
  String get adminApiKeysFailedUpdate =>
      'Não foi possível atualizar a chave de API';

  @override
  String get adminApiKeysEmpty => 'Nenhuma chave de API ainda';

  @override
  String get adminApiKeysEmptySub =>
      'Crie uma para permitir que apps e scripts acessem seu servidor';

  @override
  String get adminApiKeysNeverUsed => 'Nunca usada';

  @override
  String get adminApiKeysNeverExpires => 'Sem expiração';

  @override
  String get adminApiKeysNameRequired => 'Digite um nome';

  @override
  String get adminApiKeysUserRequired => 'Escolha um usuário';

  @override
  String get adminApiKeysExpNever => 'Nunca';

  @override
  String get adminApiKeysExp7d => '7 dias';

  @override
  String get adminApiKeysExp30d => '30 dias';

  @override
  String get adminApiKeysExp90d => '90 dias';

  @override
  String get adminApiKeysExp1y => '1 ano';

  @override
  String adminApiKeysLastUsed(String time) {
    return 'Último uso $time';
  }

  @override
  String adminApiKeysExpiresOn(String date) {
    return 'Expira em $date';
  }

  @override
  String adminApiKeysDeleteContent(String name) {
    return 'Revogar \"$name\"? Os apps que usam esta chave perderão o acesso imediatamente.';
  }

  @override
  String get endOfEpisode => 'Fim do episódio';

  @override
  String get sleepTimerSheetEpisodeSleepStart => 'Dormir no fim do episódio';

  @override
  String get bookmarkListen => 'Ouvir';

  @override
  String get bookmarkPause => 'Pausar';

  @override
  String get bookmarkPreviewFailed => 'Não foi possível reproduzir este ponto.';

  @override
  String get clipExport => 'Exportar trecho';

  @override
  String get clipJumpToStart => 'Ir para o início';

  @override
  String get clipJumpToEnd => 'Ir para o fim';

  @override
  String get clipSetStart => 'Definir início';

  @override
  String get clipSetEnd => 'Definir fim';

  @override
  String get clipInLabel => 'Entrada';

  @override
  String get clipOutLabel => 'Saída';

  @override
  String get clipSave => 'Salvar trecho';

  @override
  String clipExportSaved(String filename) {
    return '$filename salvo';
  }

  @override
  String get clipExportClamped =>
      'Trecho salvo, encurtado até o fim desta faixa';

  @override
  String get clipExportFailed => 'Não foi possível exportar o trecho.';

  @override
  String get clipDownloadToExport =>
      'Baixe este livro primeiro para exportar um trecho no iPhone.';

  @override
  String get fsPickerTitle => 'Selecionar pasta';

  @override
  String get fsServerRoot => 'Raiz do servidor';

  @override
  String get fsEmptyFolder => 'Nenhuma subpasta aqui';

  @override
  String get fsUseThisFolder => 'Usar esta pasta';

  @override
  String get adminLibrariesManage => 'Bibliotecas';

  @override
  String get adminLibrariesManageSubtitle => 'Criar, editar e reordenar';

  @override
  String get adminUploadTitle => 'Enviar mídia';

  @override
  String get adminUploadSubtitle =>
      'Adicione livros e podcasts a partir de arquivos';

  @override
  String get adminUploadNoLibraries =>
      'Crie uma biblioteca antes de enviar mídia.';

  @override
  String get adminUploadDestination => 'Destino';

  @override
  String get adminUploadFolder => 'Pasta da biblioteca';

  @override
  String get adminUploadDetails => 'Detalhes do item';

  @override
  String get adminUploadOptional => 'Opcional';

  @override
  String get adminUploadAutoMetadata => 'Buscar metadados automaticamente';

  @override
  String get adminUploadAutoMetadataSubtitle =>
      'Preenche título, autor e série com a melhor correspondência';

  @override
  String get adminUploadMetadataProvider => 'Provedor de metadados';

  @override
  String get adminUploadMetadataSearching => 'Buscando metadados...';

  @override
  String get adminUploadMetadataNoResults =>
      'Nenhuma correspondência de metadados encontrada. Você ainda pode enviar este item.';

  @override
  String get adminUploadMetadataFailed =>
      'Não foi possível buscar metadados. Você ainda pode enviar este item.';

  @override
  String get adminUploadDestinationPreview => 'Destino no servidor';

  @override
  String get adminUploadFiles => 'Arquivos';

  @override
  String adminUploadSelectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '1 arquivo',
    );
    return '$_temp0';
  }

  @override
  String get adminUploadChooseFiles => 'Escolher arquivos';

  @override
  String get adminUploadAddFiles => 'Adicionar arquivos';

  @override
  String get adminUploadBookFilesHint =>
      'Escolha arquivos de áudio ou e-book. Você também pode incluir capas e arquivos de metadados.';

  @override
  String get adminUploadPodcastFilesHint =>
      'Escolha um ou mais arquivos de áudio. Você também pode incluir capas e arquivos de metadados.';

  @override
  String get adminUploadUnsupportedFiles =>
      'Alguns arquivos selecionados não são compatíveis com o Audiobookshelf.';

  @override
  String get adminUploadFilePickerFailed =>
      'Não foi possível abrir os arquivos selecionados.';

  @override
  String get adminUploadTitleRequired => 'Informe um título';

  @override
  String get adminUploadLibraryRequired => 'Escolha uma biblioteca';

  @override
  String get adminUploadFolderRequired => 'Escolha uma pasta da biblioteca';

  @override
  String get adminUploadFilesRequired => 'Escolha pelo menos um arquivo';

  @override
  String get adminUploadPodcastFileRequired =>
      'Escolha pelo menos um arquivo de áudio para este podcast.';

  @override
  String get adminUploadBookFileRequired =>
      'Escolha pelo menos um arquivo de áudio ou e-book para este livro.';

  @override
  String get adminUploadPathCheckFailed =>
      'Não foi possível verificar a pasta de destino. Nada foi enviado.';

  @override
  String get adminUploadDestinationExists =>
      'Essa pasta de destino já existe no servidor.';

  @override
  String adminUploadDestinationUsedBy(String title) {
    return 'Esse destino já é usado por \"$title\".';
  }

  @override
  String get adminUploadAddToExistingTitle => 'A pasta já existe';

  @override
  String adminUploadAddToExisting(String title) {
    return 'Essa pasta pertence a \"$title\". Adicionar os arquivos a ela? O servidor os reconhece na próxima verificação.';
  }

  @override
  String get adminUploadAddToExistingNoItem =>
      'Essa pasta já existe no servidor. Adicionar os arquivos a ela?';

  @override
  String get adminUploadAddToBook => 'Adicionar a um livro existente';

  @override
  String get adminUploadAddToBookHint => 'Pesquisar nesta biblioteca';

  @override
  String get adminUploadNoBooksFound => 'Nenhum livro encontrado';

  @override
  String adminUploadAddingTo(String title) {
    return 'Adicionando arquivos a \"$title\"';
  }

  @override
  String adminUploadAddedTo(String title) {
    return 'Arquivos adicionados a \"$title\"';
  }

  @override
  String get adminUploadTargetNoFolder =>
      'Não foi possível encontrar a pasta desse livro no servidor.';

  @override
  String adminUploadTargetFolderMismatch(String preview, String folder) {
    return 'O servidor colocaria esses arquivos em \"$preview\", e não na pasta do livro \"$folder\". Nada foi enviado.';
  }

  @override
  String get adminUploadUploading => 'Enviando...';

  @override
  String adminUploadProgress(int percent) {
    return 'Enviando $percent%';
  }

  @override
  String get adminUploadButton => 'Enviar';

  @override
  String adminUploadComplete(String title) {
    return '\"$title\" enviado';
  }

  @override
  String get adminUploadFailed => 'Falha no envio';

  @override
  String adminUploadFailedReason(String error) {
    return 'Falha no envio: $error';
  }

  @override
  String get adminUploadReselectFiles =>
      'Escolha os arquivos novamente antes de tentar de novo.';

  @override
  String get adminServerSettings => 'Configurações do servidor';

  @override
  String get adminServerSettingsSubtitle =>
      'Verificador, armazenamento e ordenação';

  @override
  String get adminAuthentication => 'Autenticação';

  @override
  String get adminAuthenticationSubtitle => 'Login por senha e OpenID Connect';

  @override
  String get adminStats => 'Estatísticas';

  @override
  String get adminStatsSubtitle => 'Totais da biblioteca e de audição';

  @override
  String get adminAllSessions => 'Todas as sessões';

  @override
  String get adminAllSessionsSubtitle =>
      'Ver e gerenciar todas as sessões de audição';

  @override
  String get adminSessionsAllUsers => 'Todos os usuários';

  @override
  String get adminSessionsEmpty => 'Nenhuma sessão';

  @override
  String get statsLibraryTotals => 'Totais da biblioteca';

  @override
  String get statsTotalItems => 'Itens';

  @override
  String get statsAudioFiles => 'Arquivos de áudio';

  @override
  String get statsTotalSize => 'Tamanho total';

  @override
  String get statsBooks => 'Livros';

  @override
  String get statsPodcasts => 'Podcasts';

  @override
  String get statsBooksSize => 'Tamanho dos livros';

  @override
  String get statsYearReview => 'Retrospectiva do ano';

  @override
  String get statsNoYearData => 'Sem dados para este ano';

  @override
  String get statsListeningTime => 'Tempo de audição';

  @override
  String get statsSessions => 'Sessões';

  @override
  String get statsBooksAdded => 'Livros adicionados';

  @override
  String get statsAuthorsAdded => 'Autores adicionados';

  @override
  String get statsTopAuthors => 'Autores mais ouvidos';

  @override
  String get statsTopNarrators => 'Narradores mais ouvidos';

  @override
  String get statsTopGenres => 'Gêneros mais ouvidos';

  @override
  String get srvScannerSection => 'Verificador';

  @override
  String get srvFindCovers => 'Buscar capas';

  @override
  String get srvCoverProvider => 'Provedor de capas';

  @override
  String get srvParseSubtitles => 'Extrair subtítulos do nome do arquivo';

  @override
  String get srvPreferMatched => 'Preferir metadados correspondentes';

  @override
  String get srvDisableWatcher => 'Desativar monitoramento de pastas';

  @override
  String get srvStorageSection => 'Armazenamento';

  @override
  String get srvStoreCover => 'Guardar capa com o item';

  @override
  String get srvStoreMetadata => 'Guardar metadados com o item';

  @override
  String get srvMetadataFormat => 'Formato do arquivo de metadados';

  @override
  String get srvFormatSection => 'Exibição e formato';

  @override
  String get srvDateFormat => 'Formato de data';

  @override
  String get srvTimeFormat => 'Formato de hora';

  @override
  String get srvLanguage => 'Idioma do servidor';

  @override
  String get srvChromecast => 'Suporte a Chromecast';

  @override
  String get srvAllowIframe => 'Permitir incorporação em iframe';

  @override
  String get srvSortingSection => 'Ordenação';

  @override
  String get srvIgnorePrefixes => 'Ignorar prefixos ao ordenar';

  @override
  String get srvSortingPrefixes => 'Prefixos de ordenação';

  @override
  String get srvAddPrefix => 'Adicionar prefixo';

  @override
  String get srvSave => 'Salvar configurações';

  @override
  String get srvSavePrefixes => 'Salvar prefixos';

  @override
  String get srvSaved => 'Configurações salvas';

  @override
  String get srvSaveFailed => 'Não foi possível salvar as configurações';

  @override
  String get srvPrefixesSaved => 'Prefixos de ordenação atualizados';

  @override
  String get authSetLoadFailed =>
      'Não foi possível carregar as configurações de autenticação';

  @override
  String get authSetCustomMessage => 'Mensagem personalizada no login';

  @override
  String get authSetMessage => 'Mensagem';

  @override
  String get authSetPasswordAuth => 'Autenticação por senha';

  @override
  String get authSetOpenId => 'Autenticação OpenID Connect';

  @override
  String get authSetGuide => 'Guia de configuração';

  @override
  String get authSetIssuerUrl => 'URL do emissor';

  @override
  String get authSetAutoPopulate => 'Preencher automaticamente';

  @override
  String get authSetAuthorizeUrl => 'URL de autorização';

  @override
  String get authSetTokenUrl => 'URL do token';

  @override
  String get authSetUserinfoUrl => 'URL de informações do usuário';

  @override
  String get authSetJwksUrl => 'URL JWKS';

  @override
  String get authSetLogoutUrl => 'URL de logout';

  @override
  String get authSetClientId => 'ID do cliente';

  @override
  String get authSetClientSecret => 'Segredo do cliente';

  @override
  String get authSetSigningAlgorithm => 'Algoritmo de assinatura';

  @override
  String get authSetRedirectUris => 'URIs de redirecionamento móvel permitidos';

  @override
  String get authSetRedirectUrisInfo =>
      'Os apps só podem voltar a estes endereços após o login. O Absorb usa absorb://oauth. Um asterisco (*) como única entrada permite qualquer endereço.';

  @override
  String get authSetAddRedirectUri => 'Adicionar URI';

  @override
  String get authSetAddAbsorbRedirect => 'Adicionar absorb://oauth';

  @override
  String get authSetSubfolder => 'Subpasta para URLs de redirecionamento';

  @override
  String get authSetSubfolderNone => 'Nenhuma';

  @override
  String get authSetWebRedirectInfo =>
      'Permita estas URLs no seu provedor OAuth para que o login possa voltar ao app web:';

  @override
  String get authSetButtonText => 'Texto do botão';

  @override
  String get authSetMatchExisting => 'Associar usuários existentes por';

  @override
  String get authSetMatchNone => 'Não associar';

  @override
  String get authSetMatchEmail => 'E-mail';

  @override
  String get authSetMatchUsername => 'Nome de usuário';

  @override
  String get authSetMatchExistingInfo =>
      'Usado para vincular usuários existentes. Depois de vinculados, os usuários são associados pelo ID único do provedor.';

  @override
  String get authSetAutoLaunch => 'Abrir automaticamente';

  @override
  String get authSetAutoLaunchInfo =>
      'Abre o provedor automaticamente a partir da página de login web. /login?autoLaunch=0 ignora isso.';

  @override
  String get authSetAutoRegister => 'Registro automático';

  @override
  String get authSetAutoRegisterInfo =>
      'Criar novos usuários automaticamente após o login';

  @override
  String get authSetClaimsInfo =>
      'Deixe estes campos vazios para desativar a atribuição de grupos e permissões. Novos usuários recebem então a função Usuário.';

  @override
  String get authSetGroupClaim => 'Claim de grupo';

  @override
  String get authSetGroupClaimInfo =>
      'Claim que lista os grupos do usuário, geralmente groups. Grupos chamados admin, user ou guest definem a função, e vale o mais alto. Se nenhum grupo corresponder, o login é recusado.';

  @override
  String get authSetPermsClaim => 'Claim de permissões avançadas';

  @override
  String get authSetPermsClaimInfo =>
      'Claim com as permissões de usuários não administradores. Se a claim estiver ausente, o login é recusado, e uma opção ausente conta como desativada. Formato esperado:';

  @override
  String get authSetRestartNote =>
      'Reinicie o servidor após salvar para aplicar as mudanças do OpenID Connect.';

  @override
  String get authSetNoChanges => 'Nenhuma alteração para salvar';

  @override
  String get authSetNeedOneMethod => 'Ative pelo menos um método de login';

  @override
  String authSetFieldRequired(String field) {
    return '$field é obrigatório';
  }

  @override
  String authSetInvalidRedirectUri(String uri) {
    return 'URI de redirecionamento inválida: $uri';
  }

  @override
  String get authSetAsteriskAlone =>
      'Um asterisco (*) deve ser a única URI de redirecionamento';

  @override
  String authSetInvalidClaim(String field) {
    return '$field não é um nome de claim válido';
  }

  @override
  String authSetIssuerFailed(String error) {
    return 'Não foi possível ler o emissor: $error';
  }

  @override
  String get libNoneYet => 'Nenhuma biblioteca ainda';

  @override
  String get libReorderFailed => 'Não foi possível salvar a nova ordem';

  @override
  String get libDeleteTitle => 'Excluir biblioteca?';

  @override
  String get libDeleteBody =>
      'Isso remove permanentemente a biblioteca e todos os seus itens do servidor.';

  @override
  String get libDeleted => 'Biblioteca excluída';

  @override
  String get libDeleteFailed => 'Não foi possível excluir a biblioteca';

  @override
  String libFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pastas',
      one: '1 pasta',
    );
    return '$_temp0';
  }

  @override
  String get libNewTitle => 'Nova biblioteca';

  @override
  String get libEditTitle => 'Editar biblioteca';

  @override
  String get libName => 'Nome da biblioteca';

  @override
  String get libMediaType => 'Tipo de mídia';

  @override
  String get libMediaBook => 'Livros';

  @override
  String get libMediaPodcast => 'Podcasts';

  @override
  String get libProvider => 'Provedor de metadados';

  @override
  String get libIcon => 'Ícone';

  @override
  String get libFolders => 'Pastas';

  @override
  String get libAddFolder => 'Adicionar pasta';

  @override
  String get libNoFolders => 'Adicione pelo menos uma pasta';

  @override
  String get libAdvanced => 'Configurações avançadas';

  @override
  String get libCoverShape => 'Formato da capa';

  @override
  String get libCoverSquare => 'Quadrada';

  @override
  String get libCoverStandard => 'Padrão';

  @override
  String get libDisableWatcher => 'Desativar monitoramento de pastas';

  @override
  String get libSkipAsin => 'Não buscar correspondência de livros com ASIN';

  @override
  String get libSkipIsbn => 'Não buscar correspondência de livros com ISBN';

  @override
  String get libHideSingleSeries => 'Ocultar séries de um só livro';

  @override
  String get libAudiobooksOnly => 'Somente audiolivros';

  @override
  String get libEpubScripted => 'Permitir conteúdo ePub com scripts';

  @override
  String get libLaterBooksOnly =>
      'Mostrar só livros posteriores em Continuar série';

  @override
  String get libPodcastRegion => 'Região de busca de podcasts';

  @override
  String get libMarkPercent => 'Concluído com % completo';

  @override
  String get libMarkTime => 'Concluído com segundos restantes';

  @override
  String get libAutoScan => 'Agenda de verificação automática (cron)';

  @override
  String get libCreate => 'Criar biblioteca';

  @override
  String get libUpdate => 'Salvar alterações';

  @override
  String get libNameRequired => 'Informe um nome para a biblioteca';

  @override
  String get libCreated => 'Biblioteca criada';

  @override
  String get libCreateFailed => 'Não foi possível criar a biblioteca';

  @override
  String get libUpdated => 'Biblioteca atualizada';

  @override
  String get libUpdateFailed => 'Não foi possível atualizar a biblioteca';

  @override
  String get libRemoveFoldersTitle => 'Remover pastas?';

  @override
  String get libRemoveFoldersBody =>
      'Remover uma pasta exclui seus itens da biblioteca. Isso não pode ser desfeito.';

  @override
  String get readEbook => 'Ler';

  @override
  String get ebookDownload => 'Baixar';

  @override
  String get ebookDownloaded => 'Baixado';

  @override
  String get ebookSavedOffline => 'Salvo para leitura offline';

  @override
  String get ebookRemovedOffline => 'Removido do modo offline';

  @override
  String get ebookOfflineFailed => 'Não foi possível baixar o e-book';

  @override
  String get ebookSaveToDevice => 'Salvar no dispositivo';

  @override
  String get ebookSaveToDeviceTitle => 'Salvar no dispositivo?';

  @override
  String get ebookSaveToDeviceBody =>
      'Isso salva uma cópia do arquivo do e-book em algum lugar do seu dispositivo (você escolhe onde). Não deixa o livro disponível offline no leitor - use Baixar para isso.';

  @override
  String get readerFormatUnsupported =>
      'Este formato de e-book ainda não pode ser aberto no leitor';

  @override
  String get readerCouldNotOpen =>
      'Não foi possível abrir este e-book. O arquivo pode estar danificado.';

  @override
  String get moreActions => 'Mais';

  @override
  String get readerChapters => 'Capítulos';

  @override
  String get readerSettings => 'Configurações do leitor';

  @override
  String get readerFontSize => 'Tamanho da fonte';

  @override
  String get readerLineSpacing => 'Espaçamento entre linhas';

  @override
  String get readerTextAlignment => 'Alinhamento';

  @override
  String get readerAlignJustified => 'Justificado';

  @override
  String get readerAlignLeft => 'Esquerda';

  @override
  String get readerSideMargins => 'Margens laterais';

  @override
  String get readerTopBottom => 'Superior e inferior';

  @override
  String get readerPageLayout => 'Layout da página';

  @override
  String get readerPinTopBar =>
      'Manter o título e a barra de progresso na tela';

  @override
  String get readerPinTopBarHint =>
      'Fixa-os acima da página em vez de mostrá-los ao tocar. A página fica um pouco menor para não cobrir texto.';

  @override
  String get readerTopBarProgress => 'Progresso na barra superior';

  @override
  String get readerTopBarProgressBook => 'Livro';

  @override
  String get readerTopBarProgressChapter => 'Capítulo';

  @override
  String get readerTopBarProgressBoth => 'Ambos';

  @override
  String get readerSectionText => 'Texto';

  @override
  String get readerSectionPage => 'Página';

  @override
  String get readerSectionTopBar => 'Barra superior e tela';

  @override
  String get readerSectionControls => 'Controles';

  @override
  String get readerSectionStats => 'Estatísticas';

  @override
  String get readerParagraphSpacing => 'Espaçamento entre parágrafos';

  @override
  String get readerParagraphSpacingBook => 'Do próprio livro';

  @override
  String get readerTapZones => 'Zonas de toque';

  @override
  String get readerTapZonesHint =>
      'Arraste as linhas para redimensionar os quadrados. Toque em um quadrado para mudar o que ele faz, ou comece por um layout.';

  @override
  String get readerTapPrev => 'Página anterior';

  @override
  String get readerTapNext => 'Próxima página';

  @override
  String get readerTapMenu => 'Mostrar controles';

  @override
  String get readerTapNothing => 'Nada';

  @override
  String get readerTapKeepMenu => 'Um quadrado precisa mostrar os controles';

  @override
  String get readerHideControls => 'Ocultar controles após';

  @override
  String get readerHideControlsNever => 'Nunca';

  @override
  String get readerBarNotes => 'Notas e destaques';

  @override
  String readerHideControlsAfter(int seconds) {
    return '${seconds}s';
  }

  @override
  String get playerDownloadStreamingInstead =>
      'Este download não pôde ser reproduzido, por isso está em streaming do servidor. Baixar novamente pode resolver.';

  @override
  String get readerPageTurn => 'Virada de página';

  @override
  String get readerPageTurnNone => 'Nenhuma';

  @override
  String get readerPageTurnSlide => 'Deslizar';

  @override
  String get readerPageTurnCurl => 'Dobrar';

  @override
  String get readerPageTurnRipple => 'Ondulação';

  @override
  String get readerScrollMode => 'Modo de rolagem';

  @override
  String get readerScrollModeHint =>
      'Role pelo livro em vez de virar páginas. Vale para todos os livros.';

  @override
  String get readerKeepAwake => 'Manter a tela ligada';

  @override
  String get readerKeepAwakeHint =>
      'Impede que a tela apague enquanto você lê no seu ritmo. A rolagem automática e a leitura acompanhada sempre a mantêm ligada.';

  @override
  String get readerLayoutAuto => 'Automático';

  @override
  String get readerLayoutSingle => 'Única';

  @override
  String get readerLayoutTwoPage => 'Duas páginas';

  @override
  String get readerTheme => 'Tema';

  @override
  String get readerFont => 'Fonte';

  @override
  String get readerVolumeNav => 'Teclas de volume viram páginas';

  @override
  String get readerVolumeNavOff => 'Desativado';

  @override
  String get readerVolumeNavNormal => 'Normal';

  @override
  String get readerVolumeNavMirrored => 'Invertido';

  @override
  String get readerAutoScroll => 'Rolagem automática';

  @override
  String get readerAutoScrollSubtitle =>
      'A próxima página se sobrepõe a esta de cima para baixo - arraste o meio da tela para mudar a velocidade, toque para parar';

  @override
  String get readerAutoScrollStarted => 'Rolagem automática iniciada';

  @override
  String get readerAutoScrollPaused =>
      'Pausado - mantenha pressionado para parar';

  @override
  String get readerAutoScrollResumed => 'Rolagem automática retomada';

  @override
  String get readerAutoScrollStopped => 'Rolagem automática desativada';

  @override
  String get readerAutoScrollEndOfBook =>
      'Fim do livro - rolagem automática desativada';

  @override
  String readerAutoScrollSpeed(int percent) {
    return 'Velocidade $percent%';
  }

  @override
  String get readerMoreControls => 'Mais controles';

  @override
  String get readerAutoScrollSleep => 'Temporizador da rolagem automática';

  @override
  String get readerAutoScrollSleepHint =>
      'Para a rolagem após um tempo e deixa a tela apagar.';

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
    return 'A rolagem automática para em $minutes min';
  }

  @override
  String get readerAutoScrollSleepOff =>
      'Temporizador da rolagem automática desativado';

  @override
  String get readerAutoScrollSleepEnded =>
      'Temporizador - rolagem automática desativada';

  @override
  String get readerDownloadStarted => 'Download iniciado';

  @override
  String get detailChaptersJumpTitle => 'Ir para este capítulo?';

  @override
  String detailChaptersJumpContent(String title) {
    return 'A reprodução vai para \"$title\".';
  }

  @override
  String get detailChaptersJump => 'Ir';

  @override
  String detailChaptersFinished(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capítulos concluídos',
      one: '1 capítulo concluído',
    );
    return '$_temp0';
  }

  @override
  String detailOtherListeners(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count outros ouvintes',
      one: '1 outro ouvinte',
      zero: 'Nenhum outro ouvinte',
    );
    return '$_temp0';
  }

  @override
  String get seriesUpNext => 'A seguir';

  @override
  String get seriesJumpToUpNext => 'Ir para o próximo';

  @override
  String get seriesStatsFinished => 'Concluído';

  @override
  String get seriesStatsListened => 'Ouvido';

  @override
  String get seriesStatsLeft => 'Restante';

  @override
  String seriesFinishedOf(int done, int total) {
    return '$done de $total';
  }

  @override
  String get detailSessionsNone => 'Nenhuma sessão de audição ainda';

  @override
  String detailSessionsAll(int count) {
    return 'Todas as $count sessões';
  }

  @override
  String get readerVolumeNavWhilePlaying =>
      'Mesmo durante a reprodução de áudio';

  @override
  String get readerTranslateWith => 'Traduzir com';

  @override
  String get readerTranslateApp => 'App neste dispositivo';

  @override
  String get readerTranslateApple => 'Integrado ao iOS';

  @override
  String get readerTranslateWeb => 'Abre no navegador';

  @override
  String get readerTranslateHint =>
      'O texto selecionado é enviado ao tradutor que você escolher.';

  @override
  String get readerMoreFonts => 'Baixar mais fontes';

  @override
  String get readerFontRemove => 'Remover download';

  @override
  String readerFontDownloadFailed(String font) {
    return 'Não foi possível baixar $font';
  }

  @override
  String get readerAnnotations => 'Anotações';

  @override
  String readerHighlights(int count) {
    return 'Destaques ($count)';
  }

  @override
  String readerBookmarks(int count) {
    return 'Marcadores ($count)';
  }

  @override
  String get readerNoHighlights => 'Nenhum destaque ainda';

  @override
  String get readerHistory => 'Histórico';

  @override
  String get sessionReading => 'Lendo';

  @override
  String get readerHistoryEmpty =>
      'As páginas que você deixa aparecem aqui, para você poder sempre voltar a elas.';

  @override
  String get readerHistoryClosed => 'Livro fechado';

  @override
  String get readerHistoryBeforeJump => 'Antes de um salto';

  @override
  String get readerHistoryBeforeSync => 'Antes de sincronizar com o áudio';

  @override
  String get readerLogReading => 'Contar o tempo de leitura nas estatísticas';

  @override
  String get readerLogReadingHint =>
      'Registra seu tempo no leitor como uma sessão para aparecer nas estatísticas. No Audiobookshelf conta como tempo de audição.';

  @override
  String get readerNoBookmarks => 'Nenhum marcador ainda';

  @override
  String get readerBookmarkDefault => 'Marcador';

  @override
  String get readerNoteTitle => 'Nota';

  @override
  String get readerNoteHint => 'Adicione uma nota...';

  @override
  String get backupAndSync => 'Backup e sincronização';

  @override
  String get backupAndSyncSubtitle =>
      'Salve um arquivo de backup ou mantenha as configurações em sincronia entre dispositivos';

  @override
  String get syncSettingsExperimental => 'Experimental';

  @override
  String get syncSettingsExperimentalBody =>
      'A sincronização é nova e ainda está em desenvolvimento. Se dois dispositivos mudarem coisas enquanto estão separados, um lado pode perder suas alterações. Guarde um arquivo de backup como cópia de segurança.';

  @override
  String get syncSettingsNeedServer => 'Precisa de um servidor?';

  @override
  String get syncSettingsNeedServerSub =>
      'Qualquer servidor WebDAV funciona. O Nextcloud é um gratuito e auto-hospedado.';

  @override
  String get syncSettingsConnection => 'Conexão';

  @override
  String get syncSettingsConnectionNotSet => 'Ainda não configurado';

  @override
  String get syncSettingsBackupFile => 'Arquivo de backup';

  @override
  String get syncSettingsBackupFilePlain =>
      'Salve tudo em um arquivo que você guarda.';

  @override
  String get syncSettingsBackupFileWithSync =>
      'Salve tudo em um arquivo que você guarda. Inclua os dados de login e, ao restaurá-lo em outro celular, a sincronização também será ativada lá.';

  @override
  String get syncSettingsStatusOff => 'Sem sincronizar';

  @override
  String get syncSettingsStatusProblem =>
      'Não foi possível acessar seu servidor';

  @override
  String get syncSettings => 'Sincronizar configurações entre dispositivos';

  @override
  String get syncSettingsExtras => 'Sincronizar também';

  @override
  String get syncSettingsIncludeRmab => 'Configurações do ReadMeABook';

  @override
  String get syncSettingsIncludeRmabSub =>
      'Coloca seu token de API do ReadMeABook no arquivo sincronizado';

  @override
  String get syncSettingsSubtitle =>
      'Mantenha suas configurações em sincronia pelo seu próprio servidor WebDAV';

  @override
  String get syncSettingsEnable => 'Sincronizar configurações';

  @override
  String get syncSettingsServerUrl => 'URL da pasta WebDAV';

  @override
  String get syncSettingsServerUrlHint =>
      'https://cloud.example.com/remote.php/dav/files/you/Absorb';

  @override
  String get syncSettingsUsername => 'Nome de usuário';

  @override
  String get syncSettingsPassword => 'Senha';

  @override
  String get syncSettingsHeaders => 'Cabeçalhos personalizados (opcional)';

  @override
  String get syncSettingsHeadersHint =>
      'Um por linha, como CF-Access-Client-Id: abc123';

  @override
  String get syncSettingsTest => 'Testar conexão';

  @override
  String get syncSettingsHoldToUpload =>
      'Mantenha pressionado para enviar agora';

  @override
  String get syncSettingsUploadNow => 'Enviar agora';

  @override
  String get syncSettingsDownloadNow => 'Baixar agora';

  @override
  String get syncSettingsOk => 'Conectado';

  @override
  String get syncSettingsNoRemote => 'Conectado - nada sincronizado ainda';

  @override
  String get syncSettingsAuthFailed => 'Nome de usuário ou senha incorretos';

  @override
  String get syncSettingsNetworkError =>
      'Não foi possível acessar esse endereço';

  @override
  String get syncSettingsNotConfigured =>
      'Preencha primeiro o endereço, o nome de usuário e a senha';

  @override
  String get syncSettingsTooLarge =>
      'Suas configurações são grandes demais para sincronizar';

  @override
  String get syncSettingsUploaded => 'Configurações enviadas';

  @override
  String get syncSettingsApplied =>
      'Configurações atualizadas a partir do seu outro dispositivo';

  @override
  String syncSettingsAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count configurações atualizadas a partir do seu outro dispositivo',
      one: '1 configuração atualizada a partir do seu outro dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get syncSettingsUpToDate => 'Já está atualizado';

  @override
  String syncSettingsLastSynced(String when) {
    return 'Última sincronização $when';
  }

  @override
  String get syncSettingsNever => 'Ainda não sincronizado';

  @override
  String navHoldPickTitle(String tab) {
    return 'Manter $tab pressionado vai...';
  }

  @override
  String get navHoldPickBody =>
      'Escolha o que um toque longo nesta aba faz. Você pode mudar depois em Configurações.';

  @override
  String get navHoldSettingTitle => 'Atalhos de toque longo nas abas';

  @override
  String get navHoldSettingSubtitle =>
      'O que cada aba faz ao ser mantida pressionada';

  @override
  String get navHoldAskNextTime => 'Perguntar na próxima vez';

  @override
  String get navHoldNothing => 'Nada';

  @override
  String get navHoldPlayPause => 'Reproduzir / pausar';

  @override
  String get navHoldOfflineMode => 'Modo offline';

  @override
  String get navHoldOfflineOn => 'Modo offline ativado';

  @override
  String get navHoldOfflineOff => 'Modo offline desativado';

  @override
  String get navHoldMenu => 'Sempre mostrar o menu';

  @override
  String get navHoldStop => 'Parar reprodução';

  @override
  String get navHoldRmabSearch => 'Pesquisa do ReadMeABook';

  @override
  String get navHoldRmabRequests => 'Meus pedidos de livros';

  @override
  String get navHoldRmabWeb => 'Site do ReadMeABook';

  @override
  String get navHoldAdd => 'Adicionar';

  @override
  String get navHoldMoveLeft => 'Mover para a esquerda';

  @override
  String get navHoldMoveRight => 'Mover para a direita';

  @override
  String get navHoldRemoveFromMenu => 'Remover do menu';

  @override
  String get navHoldEditHint =>
      'Mantenha um item pressionado para movê-lo ou removê-lo';

  @override
  String get navHoldResetMenu => 'Redefinir os itens do menu de toque longo';

  @override
  String get navHoldMenuReset => 'Itens do menu redefinidos';

  @override
  String get bookStatsAction => 'Estatísticas de audição';

  @override
  String get bookStatsYou => 'Você';

  @override
  String get bookStatsEveryone => 'Todos';

  @override
  String get bookStatsListened => 'Tempo ouvido';

  @override
  String get bookStatsSessions => 'Sessões';

  @override
  String get bookStatsFirst => 'Primeira audição';

  @override
  String get bookStatsLast => 'Última audição';

  @override
  String get bookStatsListeners => 'Pessoas que começaram';

  @override
  String get bookStatsFinishedCount => 'Pessoas que concluíram';

  @override
  String get bookStatsTotalTime => 'Tempo ouvido por todos';

  @override
  String get bookStatsNobody => 'Ninguém começou isto ainda';

  @override
  String get bookStatsScanning =>
      'Verificando as sessões, isso pode demorar...';

  @override
  String bookStatsScanningCount(int done, int total) {
    return 'Verificando as sessões, $done de $total pessoas...';
  }

  @override
  String bookStatsLastChecked(String when) {
    return 'Verificado $when';
  }

  @override
  String get activityYourReading => 'Sua leitura';

  @override
  String get activityYourListening => 'Sua audição';

  @override
  String activityLastRead(String when) {
    return 'Última leitura $when';
  }

  @override
  String activityLastListened(String when) {
    return 'Última audição $when';
  }

  @override
  String get activityNotStarted => 'Não iniciado';

  @override
  String get activityNoReading => 'Nenhuma sessão de leitura ainda';

  @override
  String get activityTime => 'Tempo';

  @override
  String get activityAverage => 'Méd.';

  @override
  String get activityProgress => 'Progresso';

  @override
  String activityReached(String percent) {
    return '$percent alcançado';
  }

  @override
  String get readingLogTitle => 'Registro de leitura';

  @override
  String get readingLogTotalTime => 'Tempo total';

  @override
  String get readingLogAverageSession => 'Sessão média';

  @override
  String get readingLogActiveDays => 'Dias ativos';

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
  String get readingLogLastRead => 'Última leitura';

  @override
  String get readingLogStarted => 'Iniciado';

  @override
  String get readingLogFinished => 'Concluído';

  @override
  String get readingLogNotSet => 'Não definido';

  @override
  String readingLogLeftMinutes(int m) {
    return 'Cerca de ${m}min para concluir';
  }

  @override
  String readingLogLeftHours(int h) {
    return 'Cerca de ${h}h para concluir';
  }

  @override
  String readingLogLeftHoursMinutes(int h, int m) {
    return 'Cerca de ${h}h ${m}min para concluir';
  }

  @override
  String get readingLogLeftMax => 'Mais de 99h para concluir';

  @override
  String readingLogUpOnLastWeek(int percent) {
    return '$percent% a mais que na semana anterior';
  }

  @override
  String readingLogDownOnLastWeek(int percent) {
    return '$percent% a menos que na semana anterior';
  }

  @override
  String get readingLogNewThisWeek => 'Novo esta semana';

  @override
  String get readingLogSameAsLastWeek => 'Igual à semana anterior';

  @override
  String get readingLogQuietTwoWeeks => 'Nada nas últimas duas semanas';

  @override
  String get readingLogWhereYouRead => 'Onde você leu';

  @override
  String get readingLogSourceIos => 'App para iOS';

  @override
  String get readingLogSourceAndroid => 'App para Android';

  @override
  String get readingLogChartTitle => 'Progresso ao longo do tempo';

  @override
  String get readingLogChartPosition => 'Posição alcançada';

  @override
  String get readingLogChartMinutes => 'Minutos';

  @override
  String get readingLogRecords => 'Recordes';

  @override
  String get readingLogLongestSession => 'Sessão mais longa';

  @override
  String get readingLogBestDay => 'Melhor dia';

  @override
  String get readingLogLongestStreak => 'Maior sequência';

  @override
  String readingLogStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias',
      one: '1 dia',
    );
    return '$_temp0';
  }

  @override
  String get readingLogJumpedBack => 'Voltou atrás';

  @override
  String readingLogJumpedBackTimes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vezes',
      one: '1 vez',
    );
    return '$_temp0';
  }

  @override
  String get readingLogFirstOpened => 'Aberto pela primeira vez';

  @override
  String get readingLogAttempts => 'Tentativas';

  @override
  String readingLogAttempt(int index) {
    return 'Tentativa $index';
  }

  @override
  String readingLogAttemptBegan(int index) {
    return 'Tentativa $index começou';
  }

  @override
  String get readingLogOutcomeCompleted => 'Concluída';

  @override
  String get readingLogOutcomeSkimmed => 'Folheada';

  @override
  String get readingLogOutcomeAbandoned => 'Abandonada';

  @override
  String get readingLogOutcomeInProgress => 'Em andamento';

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
    return 'Terminou $to';
  }

  @override
  String get readingLogSpanUnknown => 'Nenhuma data registrada';

  @override
  String readingLogSessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sessões',
      one: '1 sessão',
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
      other: '$count dias sem leitura',
      one: '1 dia sem leitura',
    );
    return '$_temp0';
  }

  @override
  String get readingLogEmpty => 'Nenhuma sessão registrada ainda';

  @override
  String get readingLogEmptyHint =>
      'As sessões aparecem aqui conforme você lê ou ouve, em qualquer app ou dispositivo que sincronize com o BookOrbit.';

  @override
  String get readingLogNoMatches => 'Nenhuma sessão neste período';

  @override
  String get readingLogAllTime => 'Todo o período';

  @override
  String get readingLogLast30 => 'Últimos 30 dias';

  @override
  String get readingLogLast90 => 'Últimos 90 dias';

  @override
  String get readingLogThisYear => 'Este ano';

  @override
  String get readingLogAllFormats => 'Todos os formatos';

  @override
  String get readingLogSortBy => 'Ordenar por';

  @override
  String get readingLogSortDay => 'Dia';

  @override
  String get readingLogSortLength => 'Duração';

  @override
  String get readingLogSortChange => 'Variação';

  @override
  String get readingLogSortReached => 'Alcançado';

  @override
  String get readingLogNewestFirst => 'Mais recentes primeiro';

  @override
  String get readingLogOldestFirst => 'Mais antigos primeiro';

  @override
  String get readingLogMostFirst => 'Maiores primeiro';

  @override
  String get readingLogLeastFirst => 'Menores primeiro';

  @override
  String get readingLogDeleteTitle => 'Excluir esta sessão?';

  @override
  String get readingLogDeleteBody =>
      'Ela sai do registro de leitura do livro e das suas estatísticas no BookOrbit.';

  @override
  String get readingLogDeleteFailed => 'Não foi possível excluir a sessão';

  @override
  String get readingLogLoadFailed =>
      'Não foi possível carregar o registro de leitura';

  @override
  String get navHoldServerScan => 'Verificação do servidor';

  @override
  String get navHoldScanAll => 'Verificar todas as bibliotecas';

  @override
  String navHoldScanLibrary(String name) {
    return 'Verificar $name';
  }

  @override
  String get navHoldScanStarted => 'Verificação iniciada';

  @override
  String get navHoldScanFailed => 'Não foi possível iniciar a verificação';

  @override
  String get navHoldAdminLogs => 'Logs do servidor';

  @override
  String navHoldAdminPage(String page) {
    return 'Admin: $page';
  }

  @override
  String get navHoldNothingPlaying => 'Nada para reproduzir ainda';

  @override
  String get navHoldReadBook => 'Ler o livro atual';

  @override
  String get navHoldBookDetails => 'Detalhes do livro atual';

  @override
  String get syncSourceTitle => 'Qual cópia a sincronização deve manter?';

  @override
  String get syncSourceBody =>
      'Este backup ativou a sincronização de configurações. Usar a última sincronização do servidor ou tornar este backup a fonte principal? Escolher o backup substitui a cópia no servidor para todos os seus dispositivos sincronizados.';

  @override
  String get syncSourceUseServer => 'Última sincronização do servidor';

  @override
  String get syncSourceUseBackup => 'Este backup';

  @override
  String get syncSettingsWhatTravels =>
      'Suas preferências, velocidades por livro, layout do início, ordem de Absorbing, notas e destaques de e-books são sincronizados. Logins, pastas de download, opções de download automático, aparência do leitor e tudo que ainda não foi enviado ao servidor ficam neste dispositivo.';

  @override
  String get syncSettingsDownloadWarnTitle =>
      'Substituir as configurações deste dispositivo?';

  @override
  String get syncSettingsDownloadWarnBody =>
      'A cópia sincronizada vai sobrescrever as configurações deste dispositivo.';

  @override
  String get syncSettingsDownloadWarnConfirm => 'Substituir';

  @override
  String get readerCopied => 'Copiado para a área de transferência';

  @override
  String get dictionaryNotFound =>
      'Nenhuma definição encontrada para esta palavra.';

  @override
  String get dictionaryError =>
      'Não foi possível acessar o dicionário. Verifique sua conexão.';

  @override
  String get dictionaryRetry => 'Tentar novamente';

  @override
  String get dictionarySearchWeb => 'Pesquisar na web';

  @override
  String get readerTooltipCopy => 'Copiar';

  @override
  String get readerTooltipSearch => 'Pesquisar';

  @override
  String get readerTooltipDefine => 'Definir';

  @override
  String get readerTooltipTranslate => 'Traduzir';

  @override
  String get readerSearchHint => 'Pesquisar neste livro…';

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
  String get readerSearchEmpty =>
      'Digite uma palavra ou frase e toque em pesquisar.';

  @override
  String readerSearchNoResults(String query) {
    return 'Nenhum resultado para \"$query\".';
  }

  @override
  String get transcriptionTitle => 'Transcrição';

  @override
  String get transcriptionAdvancedSubtitle =>
      'Para transcrever marcadores e encontrar sua posição entre audiolivro e e-book';

  @override
  String get transcriptionEnable => 'Ativar transcrição';

  @override
  String get transcriptionEnableSubtitle =>
      'Adiciona Transcrever aos marcadores, Encontrar posição no e-book ao player e Encontrar no audiolivro ao leitor';

  @override
  String get transcriptionDisclaimer =>
      'Roda inteiramente no seu dispositivo, nada é enviado a lugar nenhum. Usa mais bateria e processamento enquanto funciona, e só livros baixados podem ser transcritos.';

  @override
  String get transcriptionNeedModelHint =>
      'Baixe um modelo abaixo para começar a transcrever.';

  @override
  String get transcriptionModelSection => 'Modelos';

  @override
  String get transcriptionModelTiny => 'Tiny';

  @override
  String get transcriptionModelTinyDesc =>
      'Mais rápido, menos preciso. Cerca de 31 MB.';

  @override
  String get transcriptionModelBase => 'Base';

  @override
  String get transcriptionModelBaseDesc => 'Um bom meio-termo. Cerca de 57 MB.';

  @override
  String get transcriptionModelSmall => 'Small';

  @override
  String get transcriptionModelSmallDesc =>
      'Mais lento, porém o mais preciso - melhor em um celular de ponta. Cerca de 182 MB.';

  @override
  String get transcriptionAutoHint =>
      'Com mais de um baixado, cada tarefa escolhe entre eles. Livros com e-book usam o mais rápido, já que as palavras exatas vêm do e-book de qualquer forma. Livros sem e-book usam o mais preciso - exceto a leitura acompanhada, que fica abaixo de Small para acompanhar a narração.';

  @override
  String get transcriptionDownload => 'Baixar';

  @override
  String get transcriptionDownloadFailed =>
      'Falha no download. Verifique sua conexão e tente novamente.';

  @override
  String get transcribe => 'Transcrever';

  @override
  String get transcribing => 'Transcrevendo...';

  @override
  String get transcriptionResultTitle => 'Transcrição';

  @override
  String get transcriptionSaveToNote => 'Salvar na nota';

  @override
  String get transcriptionSavedToNote => 'Salvo na nota do marcador';

  @override
  String get transcriptionDisabledHint =>
      'Ative a transcrição de marcadores em Configurações, em Avançado.';

  @override
  String get transcriptionNoModelDownloaded =>
      'Baixe primeiro um modelo de transcrição em Configurações.';

  @override
  String get transcriptionNotDownloadedBook =>
      'Baixe este livro ou conecte-se ao servidor para transcrevê-lo.';

  @override
  String get transcriptionNoMetadataMsg =>
      'Não foi possível localizar este ponto no download. Tente baixar o livro novamente.';

  @override
  String get transcriptionBusyMsg =>
      'Já está transcrevendo algo. Aguarde um momento.';

  @override
  String get transcriptionEmptyMsg =>
      'Nenhuma fala foi encontrada neste ponto.';

  @override
  String get transcriptionFailedMsg =>
      'Não foi possível transcrever este ponto. Tente novamente.';

  @override
  String get transcriptionPlaySnippet => 'Ouvir';

  @override
  String get transcriptionPauseSnippet => 'Pausar';

  @override
  String get transcriptionIntroBody =>
      'Isso ouve a quantidade de áudio escolhida, começando logo antes do marcador, e a transforma em texto no seu dispositivo. Trechos mais longos demoram mais, e a transcrição não é 100% precisa. O texto é salvo na nota do marcador quando terminar, pronto para corrigir ou compartilhar.';

  @override
  String get transcriptionUseEbookText =>
      'Usar o texto exato do e-book quando houver correspondência';

  @override
  String get lyricsMode => 'Transcrição ao vivo';

  @override
  String get lyricsListeningAhead => 'Ouvindo à frente...';

  @override
  String get lyricsDisplaySection => 'Transcrição ao vivo';

  @override
  String get lyricsFontSize => 'Tamanho da linha';

  @override
  String get lyricsMaxLines => 'Linhas exibidas';

  @override
  String get lyricsFullCover => 'Usar a capa inteira';

  @override
  String get lyricsFullCoverHint =>
      'Mostra a transcrição no lugar da arte enquanto ela roda, com o máximo de linhas que couber.';

  @override
  String get lyricsBatteryInfo =>
      'A transcrição ao vivo e a leitura acompanhada usam mais bateria e processamento enquanto rodam. Em celulares com processadores mais lentos, as linhas podem demorar mais para aparecer.';

  @override
  String get lyricsClearCache => 'Limpar cache de transcrições';

  @override
  String lyricsClearCacheHint(String size) {
    return '$size de linhas de transcrição salvas. Livros e episódios limpos são transcritos de novo enquanto você ouve.';
  }

  @override
  String get lyricsClearCacheConfirm =>
      'Excluir as transcrições salvas de todos os livros e episódios? Elas são refeitas automaticamente enquanto você ouve.';

  @override
  String get lyricsCacheCleared => 'Cache de transcrições limpo';

  @override
  String get lyricsIntroBody =>
      'Isso ouve um pouco à frente da narração e mostra cada linha conforme é falada, transcrita no seu celular - nada sai do dispositivo. Depois de ativar, espere alguns segundos antes de tocar em reproduzir enquanto ele se adianta. A transcrição aparece quando essa vantagem estiver pronta, e começar pausado garante o funcionamento mais suave. Usa mais bateria e processamento enquanto roda.';

  @override
  String lyricsBuildingLead(String percent) {
    return 'Adiantando-se à narração... $percent';
  }

  @override
  String lyricsCantKeepUp(String speed) {
    return 'Não é possível transcrever tão rápido quanto você ouve a $speed';
  }

  @override
  String get lyricsTurnOn => 'Ativar';

  @override
  String get readAlong => 'Leitura acompanhada';

  @override
  String get readAlongNeedsPlaying =>
      'Reproduza primeiro o audiolivro deste livro';

  @override
  String get narrationListen => 'Ouvir';

  @override
  String get narrationPlayFromHere => 'Reproduzir daqui';

  @override
  String get narrationPreparing => 'Preparando a narração';

  @override
  String get narrationNone => 'Este e-book não tem narração para reproduzir';

  @override
  String get narrationDownloadTitle => 'Baixar para ouvir';

  @override
  String get narrationDownloadBody =>
      'Este livro é um EPUB3 que se lê em voz alta. O Audiobookshelf não consegue transmitir a narração em streaming, então o áudio precisa ser baixado antes de tocar.';

  @override
  String get narrationDownloadStarted =>
      'Baixando a narração. Toque em Absorb quando terminar.';

  @override
  String get narrationTextBody =>
      'O EPUB deste livro tem suas próprias palavras para cada momento do áudio, então o texto é copiado direto do livro. Escolha quanto adicionar à nota do marcador.';

  @override
  String get narrationTextLoading => 'Obtendo as palavras do livro';

  @override
  String get downloadToAbsorb => 'Baixar para o Absorb';

  @override
  String get narrationUpNextTitle => 'Baixe o próximo da fila';

  @override
  String narrationUpNextBody(String title) {
    return '$title é o próximo na sua fila. É um EPUB3 que se lê em voz alta, então precisa ser baixado antes de tocar.';
  }

  @override
  String narrationQueueStopped(String title) {
    return 'Parou antes de $title. Baixe-o para continuar.';
  }

  @override
  String get transcriptionNeedsDownload =>
      'Isso precisa do áudio no seu celular. Baixar agora?';

  @override
  String get transcriptionDownloadStarted =>
      'Baixando. Ative isto novamente quando terminar';

  @override
  String get readAlongFollow => 'A leitura acompanhada segue';

  @override
  String get syncReadingListening => 'Manter leitura e audição em sincronia';

  @override
  String get syncReadingListeningHint =>
      'Para livros com audiolivro e e-book. Quando você para de ouvir, o e-book vai para onde você parou. Quando sai do leitor, o audiolivro vai para a sua página. Só avança.';

  @override
  String get syncEbookMoved => 'E-book movido para onde você parou de ouvir';

  @override
  String get syncAudioMoved => 'Audiolivro movido para onde você parou de ler';

  @override
  String get syncAudioOffer => 'Toque para ir até onde você parou de ler';

  @override
  String get syncFindingAudio => 'Procurando sua página no audiolivro';

  @override
  String get syncFindingEbook => 'Procurando seu ponto no e-book';

  @override
  String get syncFailed => 'Não foi possível sincronizar sua posição';

  @override
  String get syncAlreadyTogether => 'Já está em sincronia';

  @override
  String get syncPosition => 'Sincronizar posição';

  @override
  String get readAlongFollowHint =>
      'O tempo das palavras é calculado entre os carimbos de tempo da transcrição, então pode variar um pouco dentro de uma frase.';

  @override
  String get readAlongFollowWord => 'Palavra';

  @override
  String get readAlongFollowSentence => 'Frase';

  @override
  String get readAlongColor => 'Cor da leitura acompanhada';

  @override
  String get readAlongLost => 'Não foi possível encontrar a narração na página';

  @override
  String get readAlongBackToNarration => 'Voltar à narração';

  @override
  String get findInEbook => 'Encontrar no e-book';

  @override
  String get findInEbookSearching => 'Procurando este ponto no e-book...';

  @override
  String get findInEbookNotFound =>
      'Não foi possível encontrar este ponto no e-book.';

  @override
  String get findInEbookNeedsEpub =>
      'Encontrar no e-book exige um e-book EPUB.';

  @override
  String get findInEbookNoEbook => 'Este livro não tem um e-book.';

  @override
  String get findInAudiobook => 'Encontrar no audiolivro';

  @override
  String get findInAudiobookSearching =>
      'Procurando este ponto no audiolivro...';

  @override
  String get findInAudiobookStillSearching =>
      'Ainda procurando este ponto no áudio...';

  @override
  String get findInAudiobookSearchingLong =>
      'Capítulo longo, ainda procurando. Isso pode levar um ou dois minutos...';

  @override
  String get findInAudiobookNotFound =>
      'Não foi possível encontrar este ponto no audiolivro.';

  @override
  String get transcriptionWhisperInfo =>
      'A transcrição é feita pelo Whisper, um modelo aberto de reconhecimento de fala que ouve a narração e escreve as palavras - tudo neste dispositivo.';

  @override
  String get transcriptionWhisperLearnMore => 'Saiba mais sobre o Whisper';

  @override
  String get findInAudiobookIntroBody =>
      'Isso ouve o audiolivro perto de onde você está lendo e o compara com esta passagem, tudo no seu dispositivo. Pode levar até um minuto. Se o ponto não puder ser identificado com segurança, nada é movido.';

  @override
  String get findInAudiobookAfterLabel => 'Quando o ponto for encontrado';

  @override
  String get findInAudiobookStay => 'Continuar lendo';

  @override
  String get findInAudiobookGoPlayer => 'Abrir o player';

  @override
  String get findInAudiobookPlaying =>
      'Reproduzindo esta passagem no audiolivro';

  @override
  String get catchUpAudioAhead =>
      'O audiolivro está mais adiante. Toque para ir até lá.';

  @override
  String get catchUpPageAhead =>
      'Esta página está à frente do audiolivro. Toque para mover o audiolivro para cá.';

  @override
  String get readerShortcutButton => 'Botão de atalho';

  @override
  String get keepScreenOn => 'Manter a tela ligada';

  @override
  String get keepScreenOnActive => 'A tela fica ligada';

  @override
  String get keepScreenOnUntilClosed =>
      'A tela fica ligada até você fechar o app';

  @override
  String get keepScreenOnOff => 'A tela pode apagar novamente';

  @override
  String get keepScreenOnOffUntilRestart =>
      'Desativado até o app reiniciar. A opção em Configurações continua ativada';

  @override
  String get keepScreenOnPlayer => 'Manter a tela ligada no player';

  @override
  String get keepScreenOnPlayerSubtitle =>
      'A tela fica ligada enquanto o player está aberto';

  @override
  String get keepScreenOnCarMode => 'Manter a tela ligada no modo carro';

  @override
  String get keepScreenOnCarModeSubtitle =>
      'A tela fica ligada enquanto o modo carro está aberto';

  @override
  String get loginServerType => 'Tipo de servidor';

  @override
  String get authBookOrbitDefaultPassword =>
      'Esta conta ainda tem a senha padrão. Altere-a no BookOrbit e entre novamente.';

  @override
  String get authBookOrbitPasswordOff =>
      'O login por senha está desativado neste servidor. Entre com um link mágico ou login único (SSO).';

  @override
  String get authServerIsBookOrbit =>
      'Este é um servidor BookOrbit. Escolha BookOrbit acima do endereço do servidor.';

  @override
  String get authServerIsAudiobookshelf =>
      'Este é um servidor Audiobookshelf. Escolha Audiobookshelf acima do endereço do servidor.';

  @override
  String get castNotAvailableBookOrbit =>
      'A transmissão (cast) não está disponível em servidores BookOrbit';

  @override
  String get loginMagicLink => 'Link mágico';

  @override
  String get loginMagicLinkDescription =>
      'Entre com um link mágico do BookOrbit ou cole um link de senha para definir sua senha.';

  @override
  String get collectionPublicTitle => 'Pública';

  @override
  String get collectionPublicSubtitle =>
      'Todos neste servidor podem ver esta coleção';

  @override
  String loginSignInWithProvider(String provider) {
    return 'Entrar com $provider';
  }

  @override
  String get loginSignInWithSso => 'Entrar com SSO';

  @override
  String get loginChooseSsoProvider => 'Escolha como entrar';

  @override
  String get loginRedirectUriBookOrbit =>
      'URI de redirecionamento: bookorbit://oauth2-callback';

  @override
  String get readStatusTitle => 'Status de leitura';

  @override
  String get readStatusHint =>
      'O BookOrbit mantém o status que você escolher aqui até você mudá-lo.';

  @override
  String get readStatusUnread => 'Não lido';

  @override
  String get readStatusWantToRead => 'Quero ler';

  @override
  String get readStatusReading => 'Lendo';

  @override
  String get readStatusOnHold => 'Em espera';

  @override
  String get readStatusRereading => 'Relendo';

  @override
  String get readStatusRead => 'Lido';

  @override
  String get readStatusSkimmed => 'Folheado';

  @override
  String get readStatusAbandoned => 'Abandonado';

  @override
  String get personalNoteTitle => 'Sua nota';

  @override
  String get personalNoteAdd => 'Adicionar uma nota privada';

  @override
  String get personalNoteHint => 'Só você pode ver esta nota.';

  @override
  String get moreLikeThis => 'Mais como este';

  @override
  String get coverSlotAudiobook => 'Capa do audiolivro';

  @override
  String get coverSlotBook => 'Capa do livro';

  @override
  String get cardButtonFill => 'Fundo dos botões';

  @override
  String get cardButtonFillSubtitle =>
      'Como os botões do cartão do player são preenchidos';

  @override
  String get cardButtonFillClear => 'Transparente';

  @override
  String get cardButtonFillSubtle => 'Suave';

  @override
  String get cardButtonFillSolid => 'Sólido';

  @override
  String get loginBookOrbitPreview =>
      'O suporte ao BookOrbit é novo. Reprodução, downloads e navegação funcionam, mas algumas telas ainda podem parecer ou agir como no Audiobookshelf. Acompanhe o progresso no GitHub e avise-nos se algo parecer errado.';

  @override
  String get signedOutTapToSignIn =>
      'Sessão encerrada. Toque para entrar novamente.';

  @override
  String get authSignedOutKeepListening =>
      'Sua sessão foi encerrada. Os downloads continuam tocando. Toque na nuvem vermelha para entrar novamente.';

  @override
  String signedOutSyncNote(String username, String server) {
    return 'O que você ouvir enquanto estiver desconectado fica guardado neste celular e é sincronizado quando você entrar novamente como $username em $server. Qualquer forma de entrar nessa conta funciona.';
  }

  @override
  String get comicReadingDirection => 'Direção de leitura';

  @override
  String comicPageNumber(int page) {
    return 'Página $page';
  }

  @override
  String get comicBookmarkRemoveFailed =>
      'Não foi possível remover o marcador do servidor. Tente novamente quando estiver online.';

  @override
  String get comicLeftToRight => 'Da esquerda para a direita';

  @override
  String get comicRightToLeft => 'Da direita para a esquerda (mangá)';

  @override
  String get comicNeedsConnection =>
      'Este quadrinho abre página por página a partir do seu servidor, então precisa de conexão.';

  @override
  String get comicNoPages => 'Nenhuma página encontrada neste quadrinho.';

  @override
  String get boAdminTitle => 'Administração do servidor';

  @override
  String get boAdminSubtitle =>
      'Usuários e bibliotecas deste servidor BookOrbit';

  @override
  String get boAdminUsers => 'Usuários';

  @override
  String get boAdminLibraries => 'Bibliotecas';

  @override
  String boAdminUserCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pessoas',
      one: '1 pessoa',
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
  String get boAdminSaved => 'Salvo';

  @override
  String get boAdminFailed => 'Não funcionou. Tente novamente.';

  @override
  String get boAdminOffline => 'Não foi possível acessar o servidor.';

  @override
  String get boUsersSearch => 'Pesquisar usuários';

  @override
  String get boUsersNone => 'Nenhum usuário aqui';

  @override
  String get boUsersFilterAll => 'Todos';

  @override
  String get boUsersFilterAdmins => 'Admins';

  @override
  String get boUsersFilterActive => 'Ativos';

  @override
  String get boUsersFilterInactive => 'Inativos';

  @override
  String get boUsersFilterAttention => 'Requer atenção';

  @override
  String get boUserBadgeAdmin => 'Admin';

  @override
  String get boUserBadgeInactive => 'Inativo';

  @override
  String get boUserBadgeLocked => 'Bloqueado';

  @override
  String get boUserBadgeNoPassword => 'Ainda sem senha';

  @override
  String boUserLastActive(String date) {
    return 'Última atividade $date';
  }

  @override
  String get boUserNeverSignedIn => 'Nunca entrou';

  @override
  String get boUserNew => 'Novo usuário';

  @override
  String get boUserCreate => 'Criar';

  @override
  String get boUserUsername => 'Nome de usuário';

  @override
  String get boUserUsernameHint =>
      'Pelo menos 3 caracteres. Não pode ser alterado depois.';

  @override
  String get boUserName => 'Nome';

  @override
  String get boUserEmail => 'E-mail';

  @override
  String get boUserEmailInvalid => 'Informe um endereço de e-mail válido';

  @override
  String get boUserActive => 'Ativo';

  @override
  String get boUserActiveSubtitle => 'Usuários inativos não podem entrar';

  @override
  String get boUserAdmin => 'Administrador';

  @override
  String get boUserAdminSubtitle => 'Acesso total a tudo no servidor';

  @override
  String get boUserAdminHasAll =>
      'Administradores têm todas as permissões e veem todas as bibliotecas.';

  @override
  String get boUserPermissions => 'Permissões';

  @override
  String get boUserPresetNone => 'Nenhuma';

  @override
  String get boUserPresetStandard => 'Padrão';

  @override
  String get boUserPresetEverything => 'Tudo';

  @override
  String get boUserLibraries => 'Bibliotecas';

  @override
  String get boUserLibrariesHint => 'As bibliotecas que esta pessoa pode ver.';

  @override
  String get boUserPasswordLink => 'Enviar link de senha';

  @override
  String get boUserPasswordLinkSubtitle =>
      'Um link para definir uma nova senha, válido por 15 minutos';

  @override
  String get boUserExternal =>
      'Entra por login único (SSO), então a senha é gerenciada lá.';

  @override
  String get boUserUnlock => 'Desbloquear conta';

  @override
  String get boUserUnlocked => 'Conta desbloqueada';

  @override
  String get boUserDelete => 'Excluir usuário';

  @override
  String boUserDeleteTitle(String name) {
    return 'Excluir $name?';
  }

  @override
  String get boUserDeleteBody =>
      'A conta e tudo o que a pessoa tem neste servidor são removidos. Isso não pode ser desfeito.';

  @override
  String get boUserDeleted => 'Usuário excluído';

  @override
  String get boUserLinkTitle => 'Link de senha';

  @override
  String boUserLinkBody(String name) {
    return 'Compartilhe este link com $name. Ele permite definir uma senha e vale por 15 minutos.';
  }

  @override
  String get boPasswordRules =>
      'Pelo menos 8 caracteres, com uma letra maiúscula, uma minúscula e um número.';

  @override
  String get boSetPasswordTitle => 'Defina sua senha';

  @override
  String get boSetPasswordSubmit => 'Definir senha e entrar';

  @override
  String boSetPasswordLinkBody(String username, String server) {
    return 'Escolha uma senha para $username em $server.';
  }

  @override
  String boSetPasswordLinkBodyNoName(String server) {
    return 'Escolha uma senha para sua conta em $server.';
  }

  @override
  String get boSetPasswordStartingBody =>
      'Esta conta ainda tem a senha com que foi criada. Escolha uma nova para concluir o login.';

  @override
  String get boSetPasswordTrust =>
      'Continue somente se confiar em quem enviou este link.';

  @override
  String get boPasswordLinkExpired =>
      'Este link expirou ou já foi usado. Peça um novo ao administrador do servidor.';

  @override
  String boPasswordSetSignInFailed(String error) {
    return 'Sua senha foi definida, mas o login falhou: $error';
  }

  @override
  String get boChangePasswordSubtitle => 'Atualize sua senha do BookOrbit';

  @override
  String get boPasswordChangeEffect =>
      'Alterar a senha encerra suas outras sessões do BookOrbit. Este dispositivo continua conectado.';

  @override
  String get boPasswordChanged =>
      'Senha alterada. Os outros dispositivos conectados foram desconectados.';

  @override
  String boPasswordShareDescription(String username) {
    return 'Envie este link ou peça para $username escanear o QR code para escolher uma senha e entrar no Absorb. Vale por 15 minutos.';
  }

  @override
  String boPasswordShareWarning(String username) {
    return 'Qualquer pessoa com este link pode escolher a senha de $username até que ele seja usado ou expire.';
  }

  @override
  String get setupLinkCopyWebLink => 'Copiar link da web';

  @override
  String get boUserLinkCopy => 'Copiar link';

  @override
  String get boUserLinkCopied => 'Link copiado';

  @override
  String get boUserLinkShare => 'Compartilhar';

  @override
  String get boUserNoLink =>
      'O usuário foi adicionado, mas o servidor não enviou um link de senha. Envie um na página dele.';

  @override
  String get boPermGroupLibrary => 'Biblioteca e livros';

  @override
  String get boPermGroupRequests => 'Pedidos de livros';

  @override
  String get boPermGroupDevices => 'Dispositivos';

  @override
  String get boPermGroupIntegrations => 'Integrações de leitura';

  @override
  String get boPermGroupDock => 'Book Dock';

  @override
  String get boPermGroupEmail => 'E-mail e notificações';

  @override
  String get boPermGroupAdmin => 'Administração';

  @override
  String get boPermLibraryDownload => 'Baixar livros';

  @override
  String get boPermLibraryUpload => 'Enviar livros';

  @override
  String get boPermLibraryEditMetadata => 'Editar metadados';

  @override
  String get boPermLibraryDeleteBooks => 'Excluir livros';

  @override
  String get boPermBookRequestAccess => 'Pedir livros';

  @override
  String get boPermBookRequestAutoApprove =>
      'Pedidos aprovados automaticamente';

  @override
  String get boPermBookRequestSelfFulfill =>
      'Baixar livros pedidos diretamente';

  @override
  String get boPermManageBookRequests => 'Gerenciar pedidos de livros';

  @override
  String get boPermKoboSync => 'Sincronização Kobo';

  @override
  String get boPermKoreaderSync => 'Sincronização KOReader';

  @override
  String get boPermOpdsAccess => 'Acesso OPDS';

  @override
  String get boPermHardcoverSync => 'Sincronização Hardcover';

  @override
  String get boPermReadwiseSync => 'Sincronização Readwise';

  @override
  String get boPermStorygraphSync => 'Sincronização StoryGraph';

  @override
  String get boPermBookDockAccess => 'Usar o Book Dock';

  @override
  String get boPermManageBookDock => 'Gerenciar o Book Dock';

  @override
  String get boPermEmailSend => 'Enviar livros por e-mail';

  @override
  String get boPermNotificationAccess => 'Notificações';

  @override
  String get boPermManageEmail => 'Gerenciar e-mail';

  @override
  String get boPermManageLibraries => 'Gerenciar bibliotecas';

  @override
  String get boPermManageMetadataConfig => 'Configurações de metadados';

  @override
  String get boPermManageIcons => 'Gerenciar ícones';

  @override
  String get boPermManageUsers => 'Gerenciar usuários';

  @override
  String get boPermViewUserActivity => 'Ver atividade dos usuários';

  @override
  String get boPermViewAuditLog => 'Ver o log de auditoria';

  @override
  String get boPermManageAppSettings => 'Configurações do app';

  @override
  String get boLibsNone => 'Nenhuma biblioteca ainda';

  @override
  String boLibBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros',
      one: '1 livro',
    );
    return '$_temp0';
  }

  @override
  String get boLibScanNow => 'Verificar agora';

  @override
  String get boLibScanStarted => 'Verificação iniciada';

  @override
  String get boLibScanning => 'Verificando';

  @override
  String boLibLastScan(String date, int added, int updated, int missing) {
    return 'Verificado $date: $added adicionados, $updated atualizados, $missing ausentes';
  }

  @override
  String get boLibScanFailed => 'A última verificação falhou';

  @override
  String get boLibNeverScanned => 'Ainda não verificada';

  @override
  String get boLibNew => 'Nova biblioteca';

  @override
  String get boLibName => 'Nome';

  @override
  String get boLibNeedName => 'Dê um nome à biblioteca';

  @override
  String get boLibIcon => 'Ícone';

  @override
  String get boLibFolders => 'Pastas';

  @override
  String get boLibFoldersHint =>
      'Pastas no servidor onde ficam os livros desta biblioteca.';

  @override
  String get boLibNeedFolder => 'Adicione pelo menos uma pasta';

  @override
  String get boLibAddFolder => 'Adicionar pasta';

  @override
  String boLibFolderFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '1 arquivo',
    );
    return '$_temp0';
  }

  @override
  String boLibFolderInUse(String library) {
    return 'Já está em $library';
  }

  @override
  String get boLibFolderUnreadable => 'O servidor não consegue ler esta pasta';

  @override
  String get boLibFolderRescan =>
      'Alterar as pastas verifica a biblioteca novamente.';

  @override
  String get boLibOrganization => 'Os livros são armazenados como';

  @override
  String get boLibPerFolder => 'Um livro por pasta';

  @override
  String get boLibPerFile => 'Um livro por arquivo';

  @override
  String get boLibOrganizationFixed =>
      'Isso não pode ser alterado depois que a biblioteca é criada.';

  @override
  String get boLibWatch => 'Monitorar alterações';

  @override
  String get boLibWatchSubtitle =>
      'Reconhece arquivos novos e alterados assim que aparecem';

  @override
  String get boLibSchedule => 'Verificação agendada';

  @override
  String get boLibScheduleOff => 'Desativada';

  @override
  String get boLibScheduleDaily => 'Diária';

  @override
  String get boLibScheduleWeekly => 'Semanal';

  @override
  String boLibScheduleCustom(String cron) {
    return 'Personalizada ($cron)';
  }

  @override
  String get boLibScheduleHint => 'Executa às 3h no horário do servidor.';

  @override
  String get boLibCovers => 'Formato da capa';

  @override
  String get boLibCoverBook => 'Livro (2:3)';

  @override
  String get boLibCoverSquare => 'Quadrada (1:1)';

  @override
  String get boLibAccess => 'Quem pode ver';

  @override
  String get boLibAccessHint =>
      'Administradores veem todas as bibliotecas. Os demais precisam de acesso aqui.';

  @override
  String get boLibAccessNone => 'Somente administradores por enquanto';

  @override
  String get boLibAccessAdd => 'Adicionar pessoa';

  @override
  String get boLibAccessEveryoneHas => 'Todos já têm acesso';

  @override
  String get boLibLevelViewer => 'Leitor';

  @override
  String get boLibLevelEditor => 'Editor';

  @override
  String get boLibLevelOwner => 'Proprietário';

  @override
  String get boLibAccessRemove => 'Remover acesso';

  @override
  String get boLibDelete => 'Excluir biblioteca';

  @override
  String boLibDeleteTitle(String name) {
    return 'Excluir $name?';
  }

  @override
  String get boLibDeleteBody =>
      'A biblioteca é removida do BookOrbit, junto com o progresso e os destaques dos livros. Os arquivos no servidor permanecem onde estão.';

  @override
  String get boLibDeleted => 'Biblioteca excluída';

  @override
  String get boFolderPickTitle => 'Escolha uma pasta';

  @override
  String get boFolderUseThis => 'Usar esta pasta';

  @override
  String get boFolderEmpty => 'Nenhuma pasta dentro';

  @override
  String get statsTotalTime => 'TEMPO TOTAL';

  @override
  String get statsTotalReadingTime => 'TEMPO TOTAL DE LEITURA';

  @override
  String statsDaysOfTime(String days) {
    return 'São $days dias';
  }

  @override
  String statsHoursOfTime(String hours) {
    return 'São $hours horas';
  }

  @override
  String get statsMediaAll => 'Todos';

  @override
  String get statsMediaListening => 'Audição';

  @override
  String get statsMediaReading => 'Leitura';

  @override
  String statsZoneMismatch(String server, String phone) {
    return 'O BookOrbit conta seus dias em $server, mas este celular está em $phone. Horários no fim do dia podem cair no dia errado.';
  }

  @override
  String statsZoneUse(String zone) {
    return 'Usar $zone';
  }

  @override
  String statsZoneSaved(String zone) {
    return 'O BookOrbit agora usa $zone. Dias anteriores podem levar alguns minutos para se ajustar.';
  }

  @override
  String get statsZoneFailed =>
      'Não foi possível alterar o fuso horário no BookOrbit';

  @override
  String get statsTimeOfDay => 'Hora do dia';

  @override
  String statsBusiestAround(String time) {
    return 'Mais movimentado por volta de $time';
  }

  @override
  String get statsFinishedByMonth => 'Livros concluídos por mês';

  @override
  String statsFinishedLast12(int count) {
    return '$count nos últimos 12 meses';
  }

  @override
  String get statsWhereTitle => 'Onde você ouve e lê';

  @override
  String get statsLast12Months => 'Últimos 12 meses';

  @override
  String get statsHabits => 'Hábitos';

  @override
  String get statsTypicalSession => 'Sessão típica';

  @override
  String get statsProgressPerSession => 'Progresso por sessão';

  @override
  String get statsTimeToFinish => 'Tempo para concluir';

  @override
  String statsDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias',
      one: '1 dia',
    );
    return '$_temp0';
  }

  @override
  String get statsBooksStarted => 'Livros iniciados';

  @override
  String get statsBooksInProgress => 'Em andamento';

  @override
  String get statsAverageProgress => 'Progresso médio';

  @override
  String get statsTopBooks => 'Livros mais lidos';

  @override
  String get statsYearRead => 'Lidos';

  @override
  String boNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count não lidas',
      one: '1 não lida',
      zero: 'Nada novo',
    );
    return '$_temp0';
  }

  @override
  String get boNotificationsMarkAllRead => 'Marcar todas como lidas';

  @override
  String get boNotificationsClearAll => 'Limpar tudo';

  @override
  String get boNotificationsClearTitle => 'Limpar todas as notificações?';

  @override
  String get boNotificationsClearBody =>
      'Isso remove todas as notificações da sua conta do BookOrbit.';

  @override
  String get boNotificationsEmpty => 'Nenhuma notificação ainda';

  @override
  String get boNotificationsLoadFailed =>
      'Não foi possível carregar as notificações';

  @override
  String get boNotificationsUpdateFailed =>
      'Não foi possível atualizar as notificações no BookOrbit';

  @override
  String boNotificationsOccurrences(int count) {
    return 'Aconteceu $count vezes';
  }

  @override
  String get boNotificationsSettings => 'Configurações de notificações';

  @override
  String get boNotificationsSettingsIntro =>
      'Escolha quais notificações o BookOrbit guarda para você.';

  @override
  String get boNotificationsProblemsHint =>
      'Problemas só notifica quando algo falha ou precisa de atenção.';

  @override
  String get boNotificationLevelOff => 'Desativadas';

  @override
  String get boNotificationLevelProblems => 'Problemas';

  @override
  String get boNotificationLevelAll => 'Todas';

  @override
  String get boNotificationsSaved => 'Configurações de notificações salvas';

  @override
  String get boNotificationsSaveFailed =>
      'Não foi possível salvar as configurações de notificações';

  @override
  String get boNotificationGroupLibrary => 'Biblioteca';

  @override
  String get boNotificationGroupFiles => 'Arquivos';

  @override
  String get boNotificationGroupIntegrations => 'Integrações';

  @override
  String get boNotificationGroupPersonal => 'Pessoal';

  @override
  String get boNotifyScanning => 'Verificação da biblioteca';

  @override
  String get boNotifyScanningDesc =>
      'Quando uma verificação da biblioteca termina, falha ou encontra livros ausentes.';

  @override
  String get boNotifyMetadata => 'Busca de metadados';

  @override
  String get boNotifyMetadataDesc =>
      'Quando a busca de metadados dos seus livros termina ou falha.';

  @override
  String get boNotifyAuthorEnrichment => 'Detalhes do autor';

  @override
  String get boNotifyAuthorEnrichmentDesc =>
      'Quando biografias e fotos de autores terminam de ser baixadas.';

  @override
  String get boNotifyFileWriteBack => 'Gravação nos arquivos';

  @override
  String get boNotifyFileWriteBackDesc =>
      'Quando os detalhes editados são gravados nos arquivos dos livros no disco.';

  @override
  String get boNotifyFileRename => 'Renomeação de arquivos';

  @override
  String get boNotifyFileRenameDesc =>
      'Quando um arquivo de livro é renomeado para seguir seu padrão de nomes.';

  @override
  String get boNotifyBulkRename => 'Renomeação em massa';

  @override
  String get boNotifyBulkRenameDesc =>
      'Quando a renomeação de muitos livros, ou a mudança de livros entre bibliotecas, termina ou falha.';

  @override
  String get boNotifyMigration => 'Importações';

  @override
  String get boNotifyMigrationDesc =>
      'Quando uma importação de outro app de biblioteca termina ou falha.';

  @override
  String get boNotifyBookDock => 'Book Dock';

  @override
  String get boNotifyBookDockDesc =>
      'Quando o Book Dock termina de adicionar livros ou encontra problemas.';

  @override
  String get boNotifyBookRequests => 'Pedidos de livros';

  @override
  String get boNotifyBookRequestsDesc =>
      'Quando um pedido de livro é enviado ou decidido, ou o livro fica disponível.';

  @override
  String get boNotifyEmail => 'Envio de e-mail';

  @override
  String get boNotifyEmailDesc =>
      'Quando o envio de um livro por e-mail funciona ou falha.';

  @override
  String get boNotifyAchievements => 'Conquistas';

  @override
  String get boNotifyAchievementsDesc =>
      'Quando você desbloqueia uma nova conquista.';

  @override
  String get achievementsTitle => 'Conquistas';

  @override
  String achievementsEarnedSummary(int earned, int total) {
    return '$earned de $total conquistadas';
  }

  @override
  String get achievementsFilterAll => 'Todas';

  @override
  String get achievementsFilterEarned => 'Conquistadas';

  @override
  String get achievementsFilterInProgress => 'Em andamento';

  @override
  String get achievementsFilterLocked => 'Bloqueadas';

  @override
  String get achievementsCategoryReading => 'Leitura';

  @override
  String get achievementsCategoryLibrary => 'Biblioteca';

  @override
  String get achievementsCategoryExploration => 'Exploração';

  @override
  String get achievementsCategoryDedication => 'Dedicação';

  @override
  String get achievementsCategoryDevices => 'Dispositivos';

  @override
  String get achievementsRarityCommon => 'Comum';

  @override
  String get achievementsRarityRare => 'Rara';

  @override
  String get achievementsRarityEpic => 'Épica';

  @override
  String get achievementsRarityLegendary => 'Lendária';

  @override
  String get achievementsLoadFailed =>
      'Não foi possível carregar as conquistas';

  @override
  String get achievementsNoneMatch =>
      'Nenhuma conquista corresponde a este filtro';

  @override
  String get achievementsSecretName => 'Conquista secreta';

  @override
  String get achievementsSecretHint => 'Continue lendo para revelar esta.';

  @override
  String achievementsEarnedOn(String date) {
    return 'Conquistada $date';
  }

  @override
  String achievementsWhileReading(String title) {
    return 'Ao ler $title';
  }

  @override
  String achievementsTierOf(int earned, int total) {
    return 'Nível $earned de $total';
  }

  @override
  String get achievementsTiers => 'Níveis';

  @override
  String get achievementsAllTiers => 'Todos os níveis conquistados';

  @override
  String achievementsProgress(String current, String threshold) {
    return '$current / $threshold';
  }

  @override
  String achievementsProgressBooks(String current, String threshold) {
    return '$current / $threshold livros';
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
    return '$current / $threshold destaques e notas';
  }

  @override
  String achievementsProgressRatings(String current, String threshold) {
    return '$current / $threshold avaliações';
  }

  @override
  String achievementsProgressGenres(String current, String threshold) {
    return '$current / $threshold gêneros';
  }

  @override
  String achievementsProgressLanguages(String current, String threshold) {
    return '$current / $threshold idiomas';
  }

  @override
  String achievementsProgressDays(String current, String threshold) {
    return '$current / $threshold dias';
  }

  @override
  String get achievementsHowToGetIt => 'Como conseguir';

  @override
  String achievementsHintReadingPace(int count, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Você leu $count horas nos últimos $days dias.',
      one: 'Você leu 1 hora nos últimos $days dias.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca de $count dias neste ritmo.',
      one: 'Cerca de 1 dia neste ritmo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca de $count semanas neste ritmo.',
      one: 'Cerca de 1 semana neste ritmo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintEtaMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca de $count meses neste ritmo.',
      one: 'Cerca de 1 mês neste ritmo.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintDecadeUnread(int count, String decade) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count livros da década de $decade estão esperando nas suas estantes.',
      one: '1 livro da década de $decade está esperando nas suas estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintCenturyUnread(int count, String century) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count livros do século $century estão esperando nas suas estantes.',
      one: '1 livro do século $century está esperando nas suas estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintStalled(String title, String percent, String date) {
    return '$title está $percent lido e foi iniciado em $date.';
  }

  @override
  String achievementsHintStalledNoProgress(String title, String date) {
    return '$title foi iniciado em $date.';
  }

  @override
  String get achievementsHintUntitledBook => 'Um livro em andamento';

  @override
  String achievementsHintNearlyFinished(int count, String percent) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros em andamento passaram de $percent.',
      one: '1 livro em andamento passou de $percent.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintUnrated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros que você concluiu ainda não têm avaliação.',
      one: '1 livro que você concluiu ainda não tem avaliação.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintShortBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count livros com menos de $pages páginas estão esperando nas suas estantes.',
      one:
          '1 livro com menos de $pages páginas está esperando nas suas estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAlreadyStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count já estão em andamento.',
      one: '1 já está em andamento.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintLongBooks(int count, String pages) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count livros de $pages páginas ou mais estão esperando nas suas estantes.',
      one:
          '1 livro de $pages páginas ou mais está esperando nas suas estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintOldBooks(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count livros publicados antes de $year estão esperando nas suas estantes.',
      one: '1 livro publicado antes de $year está esperando nas suas estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintAuthorUnread(String author, int finished, int count) {
    return '$author: $finished concluídos, mais $count nas suas estantes.';
  }

  @override
  String achievementsHintLanguageUnread(int count, String language) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros em $language estão esperando nas suas estantes.',
      one: '1 livro em $language está esperando nas suas estantes.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsRead(int count, String year) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Você leu em $count meses de $year até agora.',
      one: 'Você leu em 1 mês de $year até agora.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMonthsLeft(int count, String months) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Faltam $months.',
      one: 'Falta $months.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintNoLongBook(String pages) {
    return 'Nenhum livro nas suas estantes tem $pages páginas ou mais ainda.';
  }

  @override
  String achievementsHintNothingBefore(String year) {
    return 'Nada nas suas estantes foi publicado antes de $year.';
  }

  @override
  String achievementsHintTooFewDecades(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Suas estantes abrangem apenas $count décadas até agora.',
      one: 'Suas estantes abrangem apenas 1 década até agora.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintTooFewCenturies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Suas estantes abrangem apenas $count séculos até agora.',
      one: 'Suas estantes abrangem apenas 1 século até agora.',
    );
    return '$_temp0';
  }

  @override
  String achievementsHintMissedMonth(String month, String year) {
    return 'Você não leu em $month, então $year está fora de alcance. A contagem recomeça em janeiro.';
  }

  @override
  String get achievementsSwitch => 'Conquistas';

  @override
  String get achievementsSwitchSubtitle =>
      'Acompanhe conquistas no BookOrbit. Desativar oculta-as aqui e na web.';

  @override
  String get achievementsTurnedOn => 'Conquistas ativadas';

  @override
  String get achievementsTurnedOff => 'Conquistas desativadas';

  @override
  String get achievementsSwitchFailed =>
      'Não foi possível alterar as conquistas no BookOrbit';

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
  String get recentSearchesTitle => 'Pesquisas recentes';

  @override
  String get recentSearchesClear => 'Limpar';

  @override
  String get recentSearchesRemove => 'Remover';

  @override
  String get removedSeriesTapToUndo =>
      'Removido de Continuar série. Toque para desfazer.';

  @override
  String get seriesBackOnContinueSeries => 'De volta a Continuar série';

  @override
  String get desktopShortcutPlayPause => 'Reproduzir / pausar';

  @override
  String get desktopShortcutRewind => 'Retroceder';

  @override
  String get desktopShortcutForward => 'Avançar';

  @override
  String get desktopShortcutSlower => 'Diminuir a velocidade de reprodução';

  @override
  String get desktopShortcutFaster => 'Aumentar a velocidade de reprodução';

  @override
  String get desktopShortcutNormalSpeed =>
      'Redefinir a velocidade de reprodução';

  @override
  String get desktopShortcutSearch => 'Abrir a pesquisa';

  @override
  String get desktopShortcutLibrary => 'Abrir a biblioteca';

  @override
  String get desktopShortcutNowPlaying => 'Abrir a reprodução atual';

  @override
  String get desktopShortcutFullScreen => 'Tela cheia';

  @override
  String get desktopShortcutClosePlayer => 'Fechar o player em tela cheia';

  @override
  String get desktopShortcutBack =>
      'Voltar (fechar a página ou janela do topo)';

  @override
  String get desktopShortcutRefresh => 'Atualizar a lista na tela';

  @override
  String get desktopShortcutPreviousCard => 'Card Absorbing anterior';

  @override
  String get desktopShortcutNextCard => 'Próximo card Absorbing';

  @override
  String get desktopShortcutContextMenu => 'Abrir o menu de toque longo';

  @override
  String get desktopShortcutMouseBack => 'Botão voltar do mouse';

  @override
  String get desktopShortcutRightClick => 'Clique com o botão direito';

  @override
  String get desktopShortcutDragShelves =>
      'Arrastar prateleiras e cards para os lados';

  @override
  String get desktopShortcutMouseDrag => 'Clicar e arrastar';

  @override
  String get fileHealthAction => 'Verificar arquivos';

  @override
  String get fileHealthTitle => 'Verificar arquivos';

  @override
  String fileHealthAllFine(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Todos os $count arquivos parecem estar bem',
      one: 'O arquivo parece estar bem',
      zero: 'Nada parece errado',
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
      'Isto apenas lê o que o servidor já informa. Nada é alterado.';

  @override
  String get fileHealthLocalChecked =>
      'Os arquivos baixados neste dispositivo também foram verificados.';

  @override
  String get fileHealthItemMissing => 'Pasta do livro ausente';

  @override
  String get fileHealthItemMissingInfo =>
      'O servidor não encontra mais a pasta deste livro. Ela pode ter sido movida, renomeada ou excluída, ou o disco pode estar offline. Uma varredura da biblioteca no servidor pode encontrá-la novamente.';

  @override
  String get fileHealthItemInvalid => 'Livro marcado como inválido';

  @override
  String get fileHealthItemInvalidInfo =>
      'O servidor não encontrou arquivos de áudio ou e-book utilizáveis para este livro.';

  @override
  String get fileHealthInvalidFiles => 'Arquivos ilegíveis';

  @override
  String get fileHealthInvalidFilesInfo =>
      'O servidor não conseguiu ler estes arquivos. Eles podem estar danificados ou em um formato não suportado, e a reprodução pode parar ou pular neles.';

  @override
  String get fileHealthEmptyFiles => 'Arquivos sem duração';

  @override
  String get fileHealthEmptyFilesInfo =>
      'Estes arquivos informam duração zero, então não há nada para reproduzir neles. Costumam estar vazios ou cortados.';

  @override
  String get fileHealthTrackGaps => 'Lacunas entre arquivos';

  @override
  String get fileHealthTrackGapsInfo =>
      'A linha do tempo do livro salta para frente entre estes arquivos, deixando um trecho em que nada é reproduzido.';

  @override
  String get fileHealthTrackOverlaps => 'Arquivos sobrepostos';

  @override
  String get fileHealthTrackOverlapsInfo =>
      'Estes arquivos se sobrepõem na linha do tempo do livro, então parte de um pode ser pulada ou a posição pode saltar.';

  @override
  String get fileHealthDurationMismatch => 'A duração não bate';

  @override
  String fileHealthDurationMismatchInfo(String actual, String expected) {
    return 'Os arquivos somam $actual, mas o livro diz ter $expected. O progresso e os capítulos podem ficar errados. Uma nova varredura no servidor costuma resolver.';
  }

  @override
  String get fileHealthLowBitrate => 'Áudio de baixa qualidade';

  @override
  String get fileHealthLowBitrateInfo =>
      'Estes arquivos estão codificados abaixo de 32 kbps e podem soar abafados.';

  @override
  String get fileHealthMixedSampleRates => 'Taxas de amostragem diferentes';

  @override
  String get fileHealthMixedSampleRatesInfo =>
      'Os arquivos foram gravados com taxas de amostragem diferentes. A maioria dos players lida bem, mas alguns podem estalar ou mudar de velocidade onde um arquivo termina e o próximo começa.';

  @override
  String get fileHealthMixedChannels => 'Mono e estéreo misturados';

  @override
  String get fileHealthMixedChannelsInfo =>
      'Alguns arquivos têm um número de canais diferente dos outros, então o som pode mudar entre arquivos.';

  @override
  String get fileHealthChaptersPastEnd => 'Capítulos após o fim';

  @override
  String get fileHealthChaptersPastEndInfo =>
      'Estes capítulos começam ou terminam depois do fim do áudio, então ir até eles pode não levar a lugar nenhum.';

  @override
  String get fileHealthLocalMissing => 'Arquivos baixados ausentes';

  @override
  String get fileHealthLocalMissingInfo =>
      'Estes arquivos baixados não estão mais neste dispositivo. A reprodução offline vai falhar onde eles deveriam estar.';

  @override
  String get fileHealthLocalSizeMismatch => 'Arquivos baixados diferentes';

  @override
  String get fileHealthLocalSizeMismatchInfo =>
      'Estes arquivos baixados não têm o mesmo tamanho das cópias do servidor, então podem estar incompletos ou danificados.';

  @override
  String fileHealthStartsAt(String time) {
    return 'começa em $time';
  }

  @override
  String fileHealthSizeHere(String local, String server) {
    return '$local aqui, $server no servidor';
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
  String get fileHealthRedownload => 'Baixar este livro novamente';

  @override
  String get fileHealthRedownloadQuestion => 'Baixar este livro novamente?';

  @override
  String get fileHealthRedownloadInfo =>
      'A cópia neste dispositivo é removida e baixada de novo do servidor. Se o livro estiver tocando, ele para. Nada muda no servidor.';

  @override
  String get fileHealthNotAvailableOffline =>
      'Conecte-se ao servidor para baixar novamente';

  @override
  String get playerReconnecting => 'Conexão perdida, reconectando…';

  @override
  String get playerReconnectFailed =>
      'Não foi possível reconectar ao servidor, então a reprodução parou.';

  @override
  String get downloadsFailed => 'Downloads com falha';

  @override
  String get absorbingReorderQueue => 'Reordenar fila';

  @override
  String get playAction => 'Reproduzir';

  @override
  String get pauseAction => 'Pausar';

  @override
  String get rmabImportBooks => 'Importar livros';

  @override
  String get rmabImportBooksSubtitle =>
      'Pesquise no ReadMeABook e escolha livros para pedir';

  @override
  String get rmabImportBooksConnectSubtitle =>
      'Conecte primeiro o ReadMeABook com uma URL e um token';

  @override
  String get windowsSettingsTitle => 'Configurações do Windows';

  @override
  String get updateCheckFrequency => 'Verificação automática de atualizações';

  @override
  String get updateCheckFrequencySubtitle =>
      'Apenas verifica atualizações; a instalação é sempre manual.';

  @override
  String get updateCheckOnStartup => 'Ao iniciar (uma vez a cada 12 horas)';

  @override
  String get updateCheckEverySixHours => 'A cada 6 horas';

  @override
  String get updateCheckEveryTwelveHours => 'A cada 12 horas';

  @override
  String get updateCheckDaily => 'Diariamente';

  @override
  String get updateCheckNever => 'Nunca automaticamente';

  @override
  String onLatestVersionDetail(String version) {
    return 'Você está na versão mais recente ($version)';
  }

  @override
  String get updateCheckFailed =>
      'Não foi possível acessar o GitHub para verificar atualizações. Verifique sua conexão e tente novamente.';

  @override
  String get playlistDetailAddBooks => 'Adicionar livros à playlist';

  @override
  String get playlistDetailSwitchToList => 'Mudar para a visualização em lista';

  @override
  String get playlistDetailSwitchToGrid => 'Mudar para a visualização em grade';

  @override
  String get adminUploadIndexing =>
      'Envio concluído; aguardando o Audiobookshelf indexar...';

  @override
  String adminUploadCompletePendingIndex(String title) {
    return '\"$title\" enviado; o Audiobookshelf ainda está indexando';
  }

  @override
  String get adminUploadPermissionDenied =>
      'Sua conta do Audiobookshelf não tem permissão de envio. Peça a um administrador do servidor para ativar o acesso de envio na sua conta.';

  @override
  String get uiThemeLabel => 'Tema da interface';

  @override
  String get uiThemePickerTitle => 'Escolha um visual';

  @override
  String get uiThemePickerIntro =>
      'Você pode mudar isso a qualquer momento em Configurações > Aparência > Tema da interface.';

  @override
  String get uiThemePlusName => 'Padrão';

  @override
  String get uiThemePlusDescription =>
      'O visual usual do Absorb Plus, com painéis preenchidos e um brilho suave das cores das capas.';

  @override
  String get uiThemeMidnightName => 'Meia-noite';

  @override
  String get uiThemeMidnightDescription =>
      'Preto puro com contornos finos e sem brilho, feito para telas OLED.';

  @override
  String get uiThemeContinue => 'Continuar';

  @override
  String get uiThemeFrostedName => 'Vidro fosco';

  @override
  String get uiThemeFrostedDescription =>
      'Painéis suaves de vidro fosco com as cores das capas brilhando por trás.';

  @override
  String get uiThemeColorTitle => 'Escolha uma cor';

  @override
  String get uiThemeColorIntro =>
      'É a mesma configuração de Configurações > Aparência > Fonte da cor.';

  @override
  String get uiThemeColorFromCover => 'Da capa';

  @override
  String get uiThemeBack => 'Voltar';

  @override
  String get uiThemeTryIt => 'Experimentar';

  @override
  String uiThemePreviewing(String name) {
    return 'Pré-visualizando $name';
  }

  @override
  String get uiThemeKeep => 'Manter';

  @override
  String get uiThemeGoBack => 'Voltar';

  @override
  String get uiThemeGlass => 'Vidro';

  @override
  String get uiThemeGlassLight => 'Leve';

  @override
  String get uiThemeGlassMedium => 'Médio';

  @override
  String get uiThemeGlassStrong => 'Forte';

  @override
  String get uiThemeDetails => 'Detalhes do visual';

  @override
  String get uiThemeFullCovers => 'Capas em qualidade total';

  @override
  String get uiThemeFullCoversSubtitle =>
      'Capas mais nítidas que usam mais memória';

  @override
  String get uiThemeExtraBadges => 'Selos extras nas capas';

  @override
  String get uiThemeExtraBadgesSubtitle =>
      'Selo de e-book e a faixa de salvo em Continuar ouvindo';

  @override
  String get uiThemeReadingShelf => 'Continuar lendo como estante';

  @override
  String get uiThemeReadingShelfSubtitle =>
      'Uma estante normal no Início em vez de cartões grandes';

  @override
  String get uiThemeCompactHeader => 'Botões compactos no cabeçalho';

  @override
  String get uiThemeCompactHeaderSubtitle =>
      'Os botões do cabeçalho das páginas mantêm o tamanho pequeno';

  @override
  String get uiThemePlainWording => 'Linguagem simples';

  @override
  String get uiThemePlainWordingOnSubtitle =>
      'Usando \"Reproduzir\", \"Tocando agora\", \"Concluído\"';

  @override
  String get uiThemePlainWordingOffSubtitle =>
      'Usando \"Absorb\", \"Absorbing\", \"Fully Absorbed\"';

  @override
  String get uiThemeSearchClassic => 'Clássico';

  @override
  String whatsNewSheetTitle(String name) {
    return 'Novidades no $name';
  }

  @override
  String whatsNewUpdatedFrom(String name) {
    return 'Atualizado de $name';
  }

  @override
  String whatsNewBuildLabel(int number) {
    return 'build $number';
  }

  @override
  String get whatsNewFullNotes => 'Notas completas no GitHub';

  @override
  String get whatsNewLoading => 'Carregando as novidades';

  @override
  String get whatsNewLoadFailed => 'Não foi possível carregar as notas';

  @override
  String get whatsNewLoadFailedHint =>
      'Verifique sua conexão ou leia-as no GitHub.';

  @override
  String get whatsNewOpenGitHub => 'Abrir no GitHub';

  @override
  String get settingsSeeWhatsNew => 'Ver novidades';

  @override
  String get settingsSeeWhatsNewSubtitle => 'As notas de versão desta versão';

  @override
  String get windowsCloseToTray => 'Fechar para a bandeja';

  @override
  String get windowsCloseToTraySubtitle =>
      'Fechar a janela mantém o Absorb Plus em execução na área de notificação. Saia pelo ícone da bandeja.';

  @override
  String get windowsStartWithWindows => 'Iniciar com o Windows';

  @override
  String get windowsStartWithWindowsSubtitle =>
      'Abrir o Absorb Plus quando você entrar no Windows';

  @override
  String windowsStartWithWindowsRegistered(String command) {
    return 'Inicia: $command';
  }

  @override
  String windowsStartWithWindowsOtherCopy(String command) {
    return 'Outra cópia está configurada para iniciar: $command. Ative para usar esta cópia no lugar.';
  }

  @override
  String get windowsStartupDisabledBySystem =>
      'Desativado em Aplicativos de inicialização do Gerenciador de Tarefas. Reative-o lá.';

  @override
  String get windowsStartMinimized => 'Iniciar minimizado';

  @override
  String get windowsStartMinimizedSubtitle =>
      'Quando inicia com o Windows, mantém na bandeja (ou minimizado se Fechar para a bandeja estiver desativado)';

  @override
  String get windowsAlwaysOnTop => 'Sempre no topo';

  @override
  String get windowsAlwaysOnTopSubtitle =>
      'Manter a janela acima das outras janelas';

  @override
  String get windowsKeepAwake =>
      'Manter o PC ativo durante reprodução ou download';

  @override
  String get windowsKeepAwakeSubtitle =>
      'Impede o PC de entrar em suspensão. A tela ainda pode apagar.';

  @override
  String get windowsSettingFailed => 'O Windows não aceitou essa alteração';

  @override
  String get windowsGlobalHotkeys => 'Atalhos globais';

  @override
  String get windowsGlobalHotkeysSubtitle =>
      'Funcionam com o Absorb Plus em segundo plano: Ctrl+Alt+Space reproduzir/pausar, Ctrl+Alt+Left/Right voltar/avançar, Ctrl+Alt+Up/Down volume, Ctrl+Alt+B adicionar marcador';

  @override
  String windowsGlobalHotkeysUnavailable(String keys) {
    return 'Em uso por outro app, indisponível: $keys';
  }

  @override
  String get windowsTrayShow => 'Mostrar o Absorb Plus';

  @override
  String get windowsTrayQuit => 'Sair do Absorb Plus';

  @override
  String get windowsTaskbarPlay => 'Reproduzir';

  @override
  String get windowsTaskbarPause => 'Pausar';

  @override
  String get windowsTaskbarRewind => 'Retroceder';

  @override
  String get windowsTaskbarForward => 'Avançar';

  @override
  String windowsJumpListResume(String title) {
    return 'Retomar $title';
  }

  @override
  String get githubProjectTitle => 'Absorb Plus no GitHub';

  @override
  String get precacheTitle => 'Pré-carregar capas e páginas de livros';

  @override
  String get precacheSubtitle =>
      'Busca-os em segundo plano no Wi-Fi ou em conexão com fio, para as telas abrirem na hora. Usa um pouco de espaço em disco, não de memória.';

  @override
  String get githubProjectSubtitle =>
      'Versões, código-fonte e novidades do projeto';

  @override
  String get supportSaveLogsSubtitle =>
      'Salve o arquivo de log para anexar a um issue no GitHub';

  @override
  String get supportSaveLogsDialogTitle => 'Salvar logs do Absorb Plus';

  @override
  String supportLogsSaved(String path) {
    return 'Logs salvos em $path';
  }

  @override
  String supportLogsSaveFailed(String error) {
    return 'Não foi possível salvar os logs: $error';
  }

  @override
  String get supportOpenLogsFolder => 'Abrir pasta de logs';

  @override
  String get supportOpenLogsFolderSubtitle =>
      'Mostrar o arquivo de log no seu gerenciador de arquivos';

  @override
  String get supportOpenLogsFolderFailed =>
      'Não foi possível abrir a pasta de logs';

  @override
  String get desktopDownloadFolderOpen => 'Abrir no Explorer';

  @override
  String get desktopDownloadFolderOpenLinux => 'Abrir pasta';

  @override
  String get desktopDownloadFolderOpenFailed =>
      'Não foi possível abrir a pasta';

  @override
  String get desktopDownloadFolderNotWritable =>
      'O Absorb não consegue salvar arquivos nessa pasta. Escolha outra.';

  @override
  String get desktopDownloadFolderPickFailed =>
      'Não foi possível mostrar o seletor de pastas';

  @override
  String get desktopDownloadFolderNetworkPath =>
      'Pastas de rede (\\\\server\\share) não podem guardar downloads. Mapeie o compartilhamento para uma letra de unidade no Explorador de Arquivos, como Z:, e escolha essa.';

  @override
  String get desktopDownloadFolderDefault => 'Pasta padrão';

  @override
  String get bookSettingsTitle => 'Configurações do livro';

  @override
  String bookSettingsSeries(String name) {
    return 'Série: $name';
  }

  @override
  String get bookSettingsSpeed => 'Velocidade';

  @override
  String get bookSettingsSpeedFromSeries =>
      'Do último livro que você reproduziu nesta série';

  @override
  String get bookSettingsSkipIntro => 'Pular introdução';

  @override
  String get bookSettingsSkipIntroHint =>
      'Somente quando o livro começa do início';

  @override
  String get bookSettingsSkipOutro => 'Pular encerramento';

  @override
  String get bookSettingsSkipOutroHint =>
      'Termina o livro antes e o marca como concluído';

  @override
  String get bookSettingsSkipOff => 'Desativado';

  @override
  String bookSettingsSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String get bookSettingsWholeSeries => 'Usar em toda a série';

  @override
  String get bookSettingsWholeSeriesHint =>
      'Introdução e encerramento valem para todos os livros desta série';

  @override
  String get bookSettingsReset => 'Redefinir';

  @override
  String get bookSettingsResetDone => 'Configurações do livro redefinidas';

  @override
  String get adminDashTitle => 'Painel';

  @override
  String get adminDashSubtitle =>
      'Quem está ouvindo, bibliotecas, usuários e avisos do servidor num só lugar';

  @override
  String get adminDashNobodyListening => 'Ninguém está ouvindo agora';

  @override
  String adminDashOnlineNames(String names) {
    return 'Online: $names';
  }

  @override
  String get adminDashListeningHistory => 'Histórico de audição';

  @override
  String get adminDashCouldNotLoad =>
      'Não foi possível carregar isto do servidor';

  @override
  String adminDashItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get adminDashScanAll => 'Verificar tudo';

  @override
  String get adminDashScanAllTitle => 'Verificar todas as bibliotecas?';

  @override
  String get adminDashScanAllContent =>
      'O Audiobookshelf vai procurar arquivos novos, alterados e ausentes em todas as bibliotecas. Isso pode demorar em bibliotecas grandes.';

  @override
  String adminDashScanAllStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Verificação iniciada para $count bibliotecas',
      one: 'Verificação iniciada para 1 biblioteca',
    );
    return '$_temp0';
  }

  @override
  String adminDashScanAllPartial(int failed, int total) {
    return '$failed de $total verificações não puderam ser iniciadas';
  }

  @override
  String get adminDashNoLibraries => 'Nenhuma biblioteca ainda';

  @override
  String get adminDashBackUpNow => 'Fazer backup agora';

  @override
  String adminDashLastBackup(String time) {
    return 'Último backup $time';
  }

  @override
  String get adminDashNoBackups => 'Nenhum backup ainda';

  @override
  String get adminDashManageUsers => 'Gerenciar usuários';

  @override
  String get adminDashNeverSeen => 'Nunca entrou';

  @override
  String get adminDashDisabled => 'Desativado';

  @override
  String get adminDashLocked => 'Bloqueado';

  @override
  String get adminDashServerWarnings => 'Avisos do servidor';

  @override
  String get adminDashNoProblems => 'Nenhum aviso ou erro no log de hoje';

  @override
  String get adminDashAllLogs => 'Todos os logs do servidor';

  @override
  String get tailscaleBuiltInTitle => 'Tailscale (integrado)';

  @override
  String get tailscaleChip => 'Tailscale';

  @override
  String get desktopShortcutsTitle => 'Atalhos de teclado';

  @override
  String get desktopShortcutsSubtitle =>
      'Controles de reprodução, velocidade, pesquisa e navegação';

  @override
  String get desktopShortcutsClose => 'Fechar';

  @override
  String get tailscaleConnect => 'Conectar com o Tailscale';

  @override
  String get tailscaleConnectHint =>
      'Abre o login do Tailscale no seu navegador';

  @override
  String get tailscaleTurnOff => 'Desativar';

  @override
  String get tailscaleCardPitch =>
      'Acesse seu servidor na sua tailnet sem ativar a VPN do Tailscale';

  @override
  String get tailscaleIntro =>
      'Acesse um servidor na sua tailnet sem ativar a VPN do app Tailscale. O Absorb entra na sua tailnet como um dispositivo próprio, apenas para as próprias conexões. Recurso de teste, desativado por padrão.';

  @override
  String get tailscaleUseSwitch => 'Usar Tailscale integrado';

  @override
  String get tailscaleStatusOff => 'Desativado';

  @override
  String get tailscaleStatusStarting => 'Conectando…';

  @override
  String get tailscaleStatusNeedsLogin =>
      'Entre para adicionar este dispositivo à sua tailnet';

  @override
  String get tailscaleStatusNeedsApproval =>
      'Aguardando um administrador aprovar este dispositivo';

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
  String get tailscaleNotIncluded => 'Não incluído nesta versão';

  @override
  String get tailscaleSignIn => 'Entrar com o Tailscale';

  @override
  String get tailscaleSignInNoLink =>
      'Ainda sem link de login. Tente novamente em instantes.';

  @override
  String get tailscaleToggleFailed =>
      'Não foi possível ativar ou desativar o Tailscale integrado. Tente novamente.';

  @override
  String get tailscaleSignOut => 'Sair do Tailscale';

  @override
  String tailscaleDeviceAddress(String address) {
    return 'Este dispositivo: $address';
  }

  @override
  String tailscaleServerRouted(String server) {
    return 'Seu servidor ($server) é acessado pelo Tailscale.';
  }

  @override
  String tailscaleServerNotRouted(String server) {
    return 'Seu servidor ($server) não é um endereço da tailnet, então é acessado normalmente. Se ele estiver na sua tailnet, adicione o nome do host abaixo.';
  }

  @override
  String get tailscaleExtraHostsLabel => 'Outros nomes de host da tailnet';

  @override
  String get tailscaleExtraHostsHint => 'nas, abs.example.com';

  @override
  String get tailscaleExtraHostsHelp =>
      'Endereços em 100.64.0.0/10 e nomes que terminam em .ts.net ou no nome MagicDNS da sua tailnet sempre passam pelo Tailscale. Separe os nomes com vírgulas.';

  @override
  String playerChapterEndsAt(String time) {
    return 'O capítulo termina às $time';
  }

  @override
  String playerEndsAt(String time) {
    return 'Termina às $time';
  }

  @override
  String lastPlayedOnDevice(String device, String ago) {
    return 'Última reprodução em $device · $ago';
  }

  @override
  String lastPlayedElsewhere(String ago) {
    return 'Última reprodução em outro dispositivo · $ago';
  }

  @override
  String get opmlExportAction => 'Exportar OPML';

  @override
  String get opmlExportDialogTitle => 'Salvar feeds de podcast como OPML';

  @override
  String opmlExportSaved(String path) {
    return 'OPML salvo em $path';
  }

  @override
  String get opmlExportDownloaded => 'OPML baixado';

  @override
  String get opmlExportFailed => 'Não foi possível exportar o arquivo OPML';

  @override
  String get bookCopySaveAction => 'Salvar uma cópia…';

  @override
  String get bookCopyDialogTitle => 'Salvar uma cópia deste livro';

  @override
  String get bookCopySaving => 'Salvando uma cópia…';

  @override
  String bookCopySaved(String path) {
    return 'Cópia salva em $path';
  }

  @override
  String get bookCopyFailed => 'Não foi possível salvar uma cópia deste livro';

  @override
  String get exclusiveAudioTitle => 'Áudio exclusivo';

  @override
  String get exclusiveAudioSubtitle =>
      'Corrige chiados ou volume instável ao ignorar os efeitos sonoros do Windows. Outros apps ficam mudos enquanto o Absorb reproduz. Reinicie o Absorb para aplicar.';

  @override
  String get exclusiveAudioFallback =>
      'Your sound device refused exclusive audio, so Absorb is playing in normal mode';

  @override
  String homeRecentlyAddedNewBadge(int count) {
    return '$count novos';
  }

  @override
  String seekUndoBackTo(String time) {
    return 'Voltar para $time';
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
      'Baixar automaticamente o próximo livro da série';

  @override
  String get autoDownloadNextInSeriesSubtitle =>
      'Quando o livro que você está ouvindo estiver 80% concluído ou faltar menos de uma hora. Segue a configuração de somente Wi-Fi.';

  @override
  String get emptyStateBrowseLibrary => 'Explorar biblioteca';

  @override
  String get emptyStateClearSearch => 'Limpar pesquisa';

  @override
  String get statsNoListeningYet => 'Nenhuma audição ainda';

  @override
  String get desktopShortcutQuickSwitcher =>
      'Troca rápida: encontre livros ou vá a qualquer lugar';

  @override
  String get desktopShortcutHelp => 'Mostrar atalhos de teclado';

  @override
  String get quickSwitcherTooltip => 'Troca rápida (Ctrl+K)';

  @override
  String get quickSwitcherHint =>
      'Pesquise nesta biblioteca ou digite um comando';

  @override
  String get quickSwitcherNoResults => 'Nenhum resultado';

  @override
  String get quickSwitcherGoHome => 'Ir para Início';

  @override
  String get quickSwitcherGoLibrary => 'Ir para Biblioteca';

  @override
  String get quickSwitcherGoAbsorbing => 'Ir para Absorbing';

  @override
  String get quickSwitcherGoStats => 'Ir para Estatísticas';

  @override
  String get quickSwitcherGoSettings => 'Ir para Configurações';

  @override
  String get quickSwitcherGoDownloads => 'Ir para Downloads';

  @override
  String get quickSwitcherPlayPause => 'Reproduzir / pausar';

  @override
  String get quickSwitcherSleepTimer => 'Temporizador';

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
  String get quickSwitcherKindAction => 'Ação';

  @override
  String get quickSwitcherKindBook => 'Livro';

  @override
  String get quickSwitcherKindPodcast => 'Podcast';

  @override
  String get quickSwitcherKindSeries => 'Série';

  @override
  String get quickSwitcherKindAuthor => 'Autor';

  @override
  String get alphabetScrollerLabel => 'Ir para uma letra';

  @override
  String get stepperDecrease => 'Diminuir';

  @override
  String get stepperIncrease => 'Aumentar';

  @override
  String get statsStreakKeepGoing =>
      'Ouça 5 minutos hoje para manter a sequência';

  @override
  String get statsStreakHowTo =>
      'Ouça 5 minutos por dia para criar uma sequência';

  @override
  String get statsDailyGoalSheetTitle => 'Meta diária de audição';

  @override
  String get statsDailyGoalSheetBody =>
      'Um anel no cartão de sequência é preenchido conforme você ouve hoje.';

  @override
  String get statsDailyGoalSet => 'Definir uma meta diária';

  @override
  String get statsMonthListened => 'Ouvido';

  @override
  String get statsMonthTime => 'Tempo';

  @override
  String get statsMonthTopBook => 'Livro mais ouvido';

  @override
  String bookmarksSearchResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados',
      one: '1 resultado',
      zero: 'Nenhum resultado',
    );
    return '$_temp0';
  }

  @override
  String get bookmarksViewMenu => 'Ordenar e agrupar';

  @override
  String get bookmarksViewByBook => 'Por livro';

  @override
  String get bookmarksViewNewest => 'Mais recentes primeiro';

  @override
  String get bookmarksViewPosition => 'Por posição';

  @override
  String get bookmarksExportAction => 'Exportar marcadores';

  @override
  String get bookmarksExportDialogTitle => 'Salvar marcadores como Markdown';

  @override
  String bookmarksExportSaved(String path) {
    return 'Marcadores salvos em $path';
  }

  @override
  String get bookmarksExportDownloaded => 'Marcadores baixados';

  @override
  String get bookmarksExportFailed => 'Não foi possível exportar os marcadores';

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
