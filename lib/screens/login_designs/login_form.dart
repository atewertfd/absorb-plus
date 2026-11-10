import 'package:flutter/material.dart';

import '../../services/login_design_store.dart';
import '../../services/server_backend.dart';
import '../../services/user_account_service.dart';

/// What the alternative sign-in designs (Absorb Plus) get from the sign-in
/// screen. The real screen's state implements it (`login_screen_fork.dart`),
/// so every design signs in through the same code as the classic screen:
/// the same server check, validation, [AuthProvider] calls and error text.
abstract class LoginForm {
  GlobalKey<FormState> get formKey;
  TextEditingController get server;
  TextEditingController get username;
  TextEditingController get password;
  FocusNode get usernameFocus;

  /// "https://" or "http://".
  String get protocol;
  void setProtocol(String protocol);

  ServerBackend get backend;

  bool get serverValid;
  bool get serverChecking;
  String? get serverError;
  String? get serverErrorDetail;

  /// A sign-in is running (password or SSO).
  bool get busy;

  /// The server offers SSO (its button shows in [credentialFields]).
  bool get ssoAvailable;

  /// Shown in the preview: nothing signs in.
  bool get isPreview;

  /// "v1.2.3", or empty until known.
  String get appVersion;

  /// The typed server address without its scheme or trailing slash.
  String get serverHost;

  /// One saved account per server address, for the recent servers row.
  List<SavedAccount> get savedServers;

  /// Fills the address (and server type) from a saved account.
  void useSavedServer(SavedAccount account);

  Future<void> checkServer();
  Future<void> signIn();
  Future<void> restoreFromBackup();
  Future<void> pasteLoginLink();

  bool get canPlayDownloadsSignedOut;
  void playDownloadsSignedOut();

  /// Opens the classic sign-in screen for its advanced options (custom
  /// headers, API key or magic link, certificates).
  Future<void> openFullSignIn();

  /// The classic screen's server address field (protocol picker, check
  /// status, error and its detail). [focusNode] lets a design focus it.
  Widget serverField(
    BuildContext context, {
    VoidCallback? onSubmitted,
    FocusNode? focusNode,
  });

  /// The classic screen's Audiobookshelf / BookOrbit picker.
  Widget backendPicker(BuildContext context);

  /// The signed-out sync note and the BookOrbit notice, when they apply.
  List<Widget> notices(BuildContext context);

  /// The classic screen's error box, username, password, Sign in and SSO
  /// buttons.
  Widget credentialFields(BuildContext context);

  /// The classic screen's saved accounts list (empty when there are none).
  Widget savedAccounts(BuildContext context);
}

/// Shows the sign-in screen below it in preview mode: nothing signs in, no
/// server is contacted, and actions say what they would do instead.
class LoginPreviewScope extends InheritedWidget {
  const LoginPreviewScope({super.key, required super.child});

  static bool active(BuildContext context) =>
      context.getInheritedWidgetOfExactType<LoginPreviewScope>() != null;

  @override
  bool updateShouldNotify(LoginPreviewScope oldWidget) => false;
}

/// Makes the sign-in screen below it use [design] instead of the saved one
/// (the preview pages, and the classic screen opened for advanced options).
class LoginDesignScope extends InheritedWidget {
  const LoginDesignScope({
    super.key,
    required this.design,
    required super.child,
  });

  final LoginDesign design;

  static LoginDesign? maybeOf(BuildContext context) =>
      context.getInheritedWidgetOfExactType<LoginDesignScope>()?.design;

  @override
  bool updateShouldNotify(LoginDesignScope oldWidget) =>
      design != oldWidget.design;
}
