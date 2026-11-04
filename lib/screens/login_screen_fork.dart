// Absorb Plus: the sign-in screen's link to the alternative designs and the
// design preview. A part of login_screen.dart so the designs reuse the
// classic screen's own state and handlers (nothing about signing in is
// copied); login_screen.dart only calls in here with one-line hooks.
part of 'login_screen.dart';

// This adapter updates the screen's state on its behalf, as the screen's own
// handlers do; it lives outside the State class only to keep login_screen.dart
// close to upstream's.
// ignore_for_file: invalid_use_of_protected_member

/// The sample address the preview fills in.
const _previewServer = 'audiobooks.example.com';

class _ForkLoginForm implements LoginForm {
  _ForkLoginForm(this._s) {
    LoginDesignStore.design.addListener(_designChanged);
  }

  final _LoginScreenState _s;

  void _designChanged() {
    if (_s.mounted) _s.setState(() {});
  }

  void dispose() => LoginDesignStore.design.removeListener(_designChanged);

  // ── Hooks called from _LoginScreenState ──

  /// The design to show instead of the classic layout, or null for classic.
  Widget? build(BuildContext context) {
    final design =
        LoginDesignScope.maybeOf(context) ?? LoginDesignStore.design.value;
    return buildLoginDesign(design, this);
  }

  /// In the preview, says what would have happened and returns true.
  bool blockedInPreview() {
    if (!isPreview) return false;
    showOverlayToast(
      _s.context,
      AppLocalizations.of(_s.context)!.loginDesignPreviewNote,
      icon: Icons.visibility_outlined,
    );
    return true;
  }

  /// In the preview, fills in a sample address instead of the account's.
  bool prefillPreview() {
    if (!isPreview) return false;
    _s._prefillLogin('https://$_previewServer', '');
    return true;
  }

  /// In the preview, treats the address as reachable (with SSO) without
  /// contacting it.
  bool previewServerCheck(String fullUrl) {
    if (!isPreview) return false;
    final l = AppLocalizations.of(_s.context)!;
    _s.setState(() {
      _s._serverChecking = false;
      _s._serverValid = true;
      _s._serverError = null;
      _s._serverErrorDetail = null;
      _s._lastValidatedServer = fullUrl;
      _s._oidcConfig = OidcConfig(
        enabled: true,
        buttonText: l.loginSignInWithSso,
        hasLocalAuth: true,
      );
    });
    return true;
  }

  // ── LoginForm ──

  @override
  bool get isPreview => LoginPreviewScope.active(_s.context);

  @override
  GlobalKey<FormState> get formKey => _s._formKey;
  @override
  TextEditingController get server => _s._serverController;
  @override
  TextEditingController get username => _s._usernameController;
  @override
  TextEditingController get password => _s._passwordController;
  @override
  FocusNode get usernameFocus => _s._usernameFocus;

  @override
  String get protocol => _s._protocol;

  @override
  void setProtocol(String protocol) {
    if (protocol == _s._protocol) return;
    _s.setState(() {
      _s._protocol = protocol;
      _s._serverValid = false;
    });
    _s._onServerChanged();
  }

  @override
  ServerBackend get backend => _s._backend;
  @override
  bool get serverValid => _s._serverValid;
  @override
  bool get serverChecking => _s._serverChecking;
  @override
  String? get serverError => _s._serverError;
  @override
  String? get serverErrorDetail => _s._serverErrorDetail;
  @override
  bool get busy => _s._isConnecting || _s._isOidcLoading;
  @override
  bool get ssoAvailable =>
      _s._serverValid && (_s._oidcConfig?.enabled ?? false);
  @override
  String get appVersion => _s._appVersion;

  @override
  String get serverHost => _s._serverController.text
      .trim()
      .replaceAll(RegExp(r'^https?://'), '')
      .replaceAll(RegExp(r'/+$'), '');

  @override
  List<SavedAccount> get savedServers {
    final seen = <String>{};
    return [
      for (final a in UserAccountService().accounts)
        if (seen.add('${a.backend.name} ${a.serverUrl}')) a,
    ];
  }

  @override
  void useSavedServer(SavedAccount account) {
    _s._setInitialHeaders(account.customHeaders);
    _s.setState(() => _s._backend = account.backend);
    _s._prefillLogin(account.serverUrl, _s._usernameController.text);
  }

  @override
  Future<void> checkServer() => _s._checkServer();
  @override
  Future<void> signIn() => _s._handleLogin();
  @override
  Future<void> restoreFromBackup() => _s._restoreFromBackup();
  @override
  Future<void> pasteLoginLink() => _s._pasteLoginLink();

  @override
  bool get canPlayDownloadsSignedOut =>
      SignedOutPlayback.available &&
      !_s.context.read<AuthProvider>().isSignedOut;

  @override
  void playDownloadsSignedOut() {
    if (blockedInPreview()) return;
    final account = SignedOutPlayback.expiredAccount();
    if (account != null) {
      _s.context.read<AuthProvider>().continueSignedOut(account);
    }
  }

  @override
  Future<void> openFullSignIn() async {
    final auth = _s.context.read<AuthProvider>();
    String who() =>
        '${auth.isAuthenticated} ${auth.serverUrl} ${auth.username}';
    final before = who();
    final host = serverHost;
    final preview = isPreview;
    final navigator = Navigator.of(_s.context);
    Widget screen = LoginDesignScope(
      design: LoginDesign.classic,
      child: LoginScreen(
        prefillServerUrl: host.isEmpty ? null : '${_s._protocol}$host',
      ),
    );
    if (preview) screen = LoginPreviewScope(child: screen);
    await navigator.push(MaterialPageRoute<void>(builder: (_) => screen));
    // Signed in there: this screen is done too when it was pushed.
    if (_s.mounted && who() != before && auth.isAuthenticated) {
      if (navigator.canPop()) navigator.pop();
    }
  }

  @override
  Widget serverField(BuildContext context, {VoidCallback? onSubmitted}) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _s._buildInputField(
          controller: _s._serverController,
          label: l.loginServerAddress,
          hint: l.loginServerHint,
          helperText: l.loginServerHelper,
          keyboardType: TextInputType.url,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => onSubmitted?.call(),
          cs: cs,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                key: const Key('login-protocol'),
                value: _s._protocol,
                isDense: true,
                style: TextStyle(
                  color: cs.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                items: const [
                  DropdownMenuItem(value: 'https://', child: Text('https://')),
                  DropdownMenuItem(value: 'http://', child: Text('http://')),
                ],
                onChanged: (v) {
                  if (v != null) setProtocol(v);
                },
              ),
            ),
          ),
          suffixIcon: _s._serverChecking
              ? const Padding(
                  padding: EdgeInsets.all(14),
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : _s._serverValid
              ? Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green.shade400,
                  size: 22,
                )
              : _s._serverError != null
              ? Icon(Icons.error_outline_rounded, color: cs.error, size: 22)
              : null,
          borderColor: _s._serverValid
              ? Colors.green.shade400.withValues(alpha: 0.4)
              : _s._serverError != null
              ? cs.error.withValues(alpha: 0.4)
              : null,
          errorText: _s._serverError,
        ),
        if (_s._serverErrorDetail != null) ...[
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              _s._serverErrorDetail!,
              style: TextStyle(
                fontSize: 11,
                color: cs.onSurfaceVariant.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget backendPicker(BuildContext context) =>
      _s._buildBackendPicker(Theme.of(context).colorScheme);

  @override
  List<Widget> notices(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return [
      if (context.watch<AuthProvider>().isSignedOut)
        _s._buildSignedOutSyncNote(cs),
      if (_s._backend.isBookOrbit) _s._buildBookOrbitNotice(cs),
    ];
  }

  @override
  Widget credentialFields(BuildContext context) => _s._buildCredentialFields(
    Theme.of(context).colorScheme,
    Theme.of(context).textTheme,
  );

  @override
  Widget savedAccounts(BuildContext context) => _s._buildSavedAccounts(
    Theme.of(context).colorScheme,
    Theme.of(context).textTheme,
  );
}
