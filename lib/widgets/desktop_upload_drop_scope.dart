// Absorb Plus: drop audio files or a folder on the desktop window to upload.

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../main.dart' show rootNavigatorKey;
import '../providers/auth_provider.dart';
import '../screens/admin_upload_screen.dart';
import '../services/api_service.dart' show ApiService, MediaUploadFile;
import '../services/dropped_upload_files.dart';
import '../utils/fork_platform.dart';
import 'overlay_toast.dart';

/// What the drop needs to know about the signed-in user.
typedef DropUploadAccess = ({
  bool signedIn,
  bool canUpload,
  ApiService? api,
  String? libraryId,
});

/// On Windows and Linux, files or a folder dropped anywhere on the window
/// open the existing upload screen with those files already listed.
/// Nothing uploads until the user presses Upload there. Users without
/// upload permission get a short toast instead. Android and web build
/// [child] unchanged.
///
/// Sits above the navigator (in `MaterialApp.builder`) so a drop works on
/// every page.
class DesktopUploadDropScope extends StatefulWidget {
  const DesktopUploadDropScope({
    super.key,
    required this.child,
    this.enabled,
    this.navigatorKey,
    this.access,
    this.expandPaths,
  });

  final Widget child;

  /// Null follows [ForkPlatform.supportsDesktopFileDrop]. Tests set it.
  final bool? enabled;

  /// Null uses the app's root navigator.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// Null reads [AuthProvider].
  final DropUploadAccess Function(BuildContext context)? access;

  /// Null uses [expandDroppedPaths] (reads the file system).
  final Future<List<MediaUploadFile>> Function(List<String> paths)? expandPaths;

  @override
  State<DesktopUploadDropScope> createState() => DesktopUploadDropScopeState();
}

class DesktopUploadDropScopeState extends State<DesktopUploadDropScope> {
  bool _expanding = false;
  bool _uploadOpen = false;

  bool get _enabled => widget.enabled ?? ForkPlatform.supportsDesktopFileDrop;

  static DropUploadAccess _readAuth(BuildContext context) {
    final auth = context.read<AuthProvider>();
    final api = auth.apiService;
    return (
      signedIn: api != null,
      canUpload: auth.canUpload,
      api: api,
      libraryId: auth.defaultLibraryId,
    );
  }

  static String _extension(String name) {
    final dot = name.lastIndexOf('.');
    if (dot < 0 || dot == name.length - 1) return '';
    return name.substring(dot + 1).toLowerCase();
  }

  /// Handles dropped [paths]. Public for tests.
  Future<void> handleDrop(List<String> paths) async {
    if (paths.isEmpty || _expanding) return;
    final nav = (widget.navigatorKey ?? rootNavigatorKey).currentState;
    if (nav == null) return;
    final access = (widget.access ?? _readAuth)(context);
    if (!access.signedIn) return;
    final l = AppLocalizations.of(nav.context)!;
    if (!access.canUpload) {
      showNavigatorOverlayToast(
        nav,
        l.dropUploadNotAllowed,
        icon: Icons.cloud_off_rounded,
      );
      return;
    }
    if (_uploadOpen) {
      showNavigatorOverlayToast(
        nav,
        l.dropUploadAlreadyOpen,
        icon: Icons.cloud_upload_rounded,
      );
      return;
    }

    List<MediaUploadFile> files;
    _expanding = true;
    try {
      files = await (widget.expandPaths ?? expandDroppedPaths)(paths);
    } catch (e) {
      debugPrint('[Drop] Could not read the dropped items: $e');
      files = const [];
    } finally {
      _expanding = false;
    }
    if (!mounted || !nav.mounted) return;

    final allowed = AdminUploadScreen.uploadableExtensions;
    final usable = files
        .where((f) => allowed.contains(_extension(f.name)))
        .toList();
    if (usable.isEmpty) {
      showNavigatorOverlayToast(
        nav,
        l.dropUploadNothingUsable,
        icon: Icons.warning_amber_rounded,
      );
      return;
    }

    _uploadOpen = true;
    try {
      await nav.push(
        MaterialPageRoute<void>(
          builder: (_) => AdminUploadScreen(
            // The screen loads the libraries itself when given none.
            libraries: const [],
            initialLibraryId: access.libraryId,
            canUpload: access.canUpload,
            apiService: access.api,
            initialFiles: usable,
          ),
        ),
      );
    } finally {
      _uploadOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_enabled) return widget.child;
    return DropTarget(
      onDragDone: (details) => handleDrop([
        for (final item in details.files)
          if (item.path.isNotEmpty) item.path,
      ]),
      child: widget.child,
    );
  }
}
