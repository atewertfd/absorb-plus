// Admin dashboard: one calm page with the few things an Audiobookshelf admin
// checks most (who's listening, library scans, server and backups, users,
// recent server warnings). Each card shows a handful of items and links one
// tap deeper to the existing admin screens instead of rebuilding them.
//
// Fork-owned. Reached from the Admin page (admin_screen.dart), which only
// admins can open. The only writes are Scan and Back up now, both on an
// explicit tap, and success is shown only when the server answered 200.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/auth_provider.dart';
import '../services/admin_dashboard_data.dart';
import '../services/api_service.dart';
import '../services/server_task_tracker.dart';
import '../widgets/absorb_page_header.dart';
import '../widgets/desktop_page_body.dart';
import '../widgets/overlay_toast.dart';
import 'admin_libraries_screen.dart';
import 'admin_server_logs_screen.dart';
import 'admin_sessions_screen.dart';
import 'admin_users_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({
    super.key,
    this.source,
    this.taskTracker,
    this.serverVersion,
    this.liveInterval = const Duration(seconds: 10),
  });

  /// Where the data comes from. Defaults to the signed-in [ApiService].
  final AdminDashboardSource? source;

  /// Shared with the Admin page so scans started anywhere show here. When
  /// null the dashboard keeps its own and polls `/api/tasks` with the live
  /// refresh.
  final ServerTaskTracker? taskTracker;

  /// Defaults to [AuthProvider.serverVersion].
  final String? serverVersion;

  /// How often "Listening now" refreshes while the page is on screen.
  final Duration liveInterval;

  /// How many rows each card shows before "see all".
  static const maxRows = 5;

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen>
    with WidgetsBindingObserver {
  static const _scanAction = 'library-scan';
  static const _wideLayout = 860.0;

  /// How long a started scan shows as running before the server's task list
  /// must confirm it (the shared tracker polls every few seconds).
  static const _scanGrace = Duration(seconds: 6);

  AdminDashboardSource? _source;
  ApiService? _taskApi;
  late final ServerTaskTracker _tracker;
  late final bool _ownsTracker;

  bool _loading = true;
  List<Map<String, dynamic>>? _sessions = const [];
  List<dynamic> _online = const [];
  List<dynamic> _users = const [];
  List<dynamic> _libraries = const [];
  final Map<String, int> _itemCounts = {};
  List<dynamic> _backups = const [];
  List<Map<String, dynamic>>? _logs = const [];

  final Set<String> _scanning = {};
  final Map<String, Timer> _scanGraceTimers = {};
  bool _scanningAll = false;
  bool _backingUp = false;
  Set<String> _runningScans = const {};

  Timer? _liveTimer;
  bool _liveRefreshing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final api = widget.source == null
        ? context.read<AuthProvider?>()?.apiService
        : null;
    _source = widget.source ?? (api == null ? null : ApiAdminDashboardSource(api));
    _ownsTracker = widget.taskTracker == null;
    _tracker = widget.taskTracker ?? ServerTaskTracker();
    // Only poll tasks ourselves when nobody else does and we talk to a real
    // server (tests inject a source and no tracker polling).
    if (_ownsTracker) _taskApi = api;
    _tracker.addListener(_onTasksChanged);
    _loadAll();
    _startLiveTimer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _liveTimer?.cancel();
    for (final t in _scanGraceTimers.values) {
      t.cancel();
    }
    _tracker.removeListener(_onTasksChanged);
    if (_ownsTracker) _tracker.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _startLiveTimer();
      unawaited(_refreshLive());
    } else {
      _liveTimer?.cancel();
    }
  }

  void _startLiveTimer() {
    _liveTimer?.cancel();
    _liveTimer = Timer.periodic(widget.liveInterval, (_) {
      // Covered by another page: skip, the next tick catches up.
      if (!mounted || ModalRoute.of(context)?.isCurrent == false) return;
      unawaited(_refreshLive());
    });
  }

  // ─── Data ───────────────────────────────────────────────────

  Future<void> _loadAll() async {
    final source = _source;
    if (source == null) {
      if (mounted) setState(() => _loading = false);
      return;
    }
    final List<Object?> results;
    try {
      results = await Future.wait<Object?>([
        source.openSessions(),
        source.onlineUsers(),
        source.users(),
        source.libraries(),
        source.backups(),
        source.serverLogs(),
        _refreshTasks(),
      ]);
    } catch (e) {
      // Never leave the page stuck on the spinner.
      debugPrint('[AdminDashboard] load failed: $e');
      if (mounted) setState(() => _loading = false);
      return;
    }
    if (!mounted) return;
    setState(() {
      _sessions = results[0] as List<Map<String, dynamic>>?;
      _online = results[1] as List<dynamic>;
      _users = results[2] as List<dynamic>;
      _libraries = results[3] as List<dynamic>;
      _backups = results[4] as List<dynamic>;
      _logs = results[5] as List<Map<String, dynamic>>?;
      _loading = false;
      _runningScans = _currentRunningScans();
    });
    await Future.wait([for (final id in _libraryIds) _loadItemCount(id)]);
  }

  Future<void> _refreshLive() async {
    final source = _source;
    if (source == null || _liveRefreshing) return;
    _liveRefreshing = true;
    try {
      final results = await Future.wait<Object?>([
        source.openSessions(),
        source.onlineUsers(),
        _refreshTasks(),
      ]);
      if (!mounted) return;
      setState(() {
        _sessions = results[0] as List<Map<String, dynamic>>?;
        _online = results[1] as List<dynamic>;
      });
    } finally {
      _liveRefreshing = false;
    }
  }

  Future<void> _refreshTasks() async {
    final api = _taskApi;
    if (api != null) await _tracker.refresh(api);
  }

  Future<void> _loadItemCount(String id) async {
    final stats = await _source?.libraryStats(id);
    final total = stats?['totalItems'];
    if (!mounted || total is! num) return;
    setState(() => _itemCounts[id] = total.toInt());
  }

  Iterable<String> get _libraryIds => _libraries
      .whereType<Map>()
      .map((l) => l['id'] as String? ?? '')
      .where((id) => id.isNotEmpty);

  Set<String> _currentRunningScans() => {
        for (final id in _libraryIds)
          if (_tracker.isLibraryActionRunning(_scanAction, id)) id,
      };

  // A scan that just finished changes the item count, so fetch it again.
  void _onTasksChanged() {
    if (!mounted) return;
    final now = _currentRunningScans();
    for (final id in _runningScans.difference(now)) {
      unawaited(_loadItemCount(id));
    }
    // The server confirmed these, so the tracker shows them from here on.
    for (final id in now) {
      _scanGraceTimers.remove(id)?.cancel();
      _scanning.remove(id);
    }
    setState(() => _runningScans = now);
  }

  Set<String> get _onlineIds => {
        for (final u in _online)
          if (u is Map && u['id'] is String) u['id'] as String,
        for (final s in _sessions ?? const <Map<String, dynamic>>[])
          if (s['userId'] is String) s['userId'] as String,
      };

  // ─── Actions ────────────────────────────────────────────────

  Future<void> _scan(String id, String name) async {
    final source = _source;
    if (source == null || _scanning.contains(id)) return;
    setState(() => _scanning.add(id));
    final ok = await source.scanLibrary(id);
    if (ok) await _refreshTasks();
    if (!mounted) return;
    final l = AppLocalizations.of(context)!;
    setState(() {
      if (ok) {
        _holdScanning(id);
      } else {
        _scanning.remove(id);
      }
    });
    showOverlayToast(context, ok ? l.adminScanStarted(name) : l.adminScanFailed(name),
        icon: ok ? Icons.refresh_rounded : Icons.error_outline_rounded);
  }

  Future<void> _scanAll() async {
    final source = _source;
    final ids = _libraryIds.toList();
    if (source == null || ids.isEmpty || _scanningAll) return;
    final l = AppLocalizations.of(context)!;
    final yes = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.adminDashScanAllTitle),
        content: Text(l.adminDashScanAllContent),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.cancel)),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.adminDashScanAll)),
        ],
      ),
    );
    if (yes != true || !mounted) return;
    setState(() {
      _scanningAll = true;
      _scanning.addAll(ids);
    });
    final startedIds = <String>[];
    for (final id in ids) {
      if (await source.scanLibrary(id)) startedIds.add(id);
    }
    final started = startedIds.length;
    if (started > 0) await _refreshTasks();
    if (!mounted) return;
    setState(() {
      _scanningAll = false;
      for (final id in ids) {
        if (startedIds.contains(id)) {
          _holdScanning(id);
        } else {
          _scanning.remove(id);
        }
      }
    });
    final failed = ids.length - started;
    showOverlayToast(
      context,
      failed == 0
          ? l.adminDashScanAllStarted(started)
          : l.adminDashScanAllPartial(failed, ids.length),
      icon: failed == 0 ? Icons.refresh_rounded : Icons.error_outline_rounded,
    );
  }

  /// Keeps a just-started scan showing as running until the server's task
  /// list confirms it, or [_scanGrace] passes (a tiny library can finish
  /// before the next poll).
  void _holdScanning(String id) {
    if (_tracker.isLibraryActionRunning(_scanAction, id)) {
      _scanning.remove(id);
      return;
    }
    _scanning.add(id);
    _scanGraceTimers.remove(id)?.cancel();
    _scanGraceTimers[id] = Timer(_scanGrace, () {
      _scanGraceTimers.remove(id);
      if (mounted) setState(() => _scanning.remove(id));
    });
  }

  Future<void> _backUp() async {
    final source = _source;
    if (source == null || _backingUp) return;
    setState(() => _backingUp = true);
    final ok = await source.createBackup();
    final backups = ok ? await source.backups() : null;
    if (!mounted) return;
    final l = AppLocalizations.of(context)!;
    setState(() {
      _backingUp = false;
      // getBackups answers [] on any failure: never let a failed refetch
      // wipe the list right after a backup the server confirmed.
      if (backups != null && backups.isNotEmpty) _backups = backups;
    });
    showOverlayToast(context, ok ? l.adminBackupCreated : l.adminBackupFailed,
        icon: ok ? Icons.check_circle_outline_rounded : Icons.error_outline_rounded);
  }

  Future<void> _open(Widget page, {bool reload = false}) async {
    await Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => page));
    if (!mounted) return;
    // The live refresh skipped its ticks while covered: catch up now.
    await (reload ? _loadAll() : _refreshLive());
  }

  // ─── Build ──────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: DesktopPageBody(
          maxWidth: 1040,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 8, 0),
              child: Row(children: [
                Expanded(child: AbsorbPageHeader(title: l.adminDashTitle, padding: EdgeInsets.zero)),
                IconButton(
                  tooltip: l.refreshTooltip,
                  icon: Icon(Icons.refresh_rounded, color: cs.onSurfaceVariant),
                  onPressed: _loading ? null : _loadAll,
                ),
                IconButton(
                  icon: Icon(Icons.close_rounded, color: cs.onSurfaceVariant),
                  onPressed: () => Navigator.maybePop(context),
                ),
              ]),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
                  : RefreshIndicator(
                      onRefresh: _loadAll,
                      child: LayoutBuilder(builder: (context, c) {
                        final left = [_listeningCard(), _librariesCard(), _serverCard()];
                        final right = [_usersCard(), _logsCard()];
                        if (c.maxWidth < _wideLayout) {
                          return ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                            children: [...left, ...right],
                          );
                        }
                        return ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                          children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Expanded(child: Column(children: left)),
                              const SizedBox(width: 12),
                              Expanded(child: Column(children: right)),
                            ]),
                          ],
                        );
                      }),
                    ),
            ),
          ]),
        ),
      ),
    );
  }

  // ─── Cards ──────────────────────────────────────────────────

  Widget _listeningCard() {
    final l = AppLocalizations.of(context)!;
    final sessions = _sessions;
    final listeners = [
      for (final s in sessions ?? const <Map<String, dynamic>>[])
        AdminListener.fromSession(s, users: _users),
    ];
    final onlineNames = <String>{
      for (final u in _online)
        if (u is Map && (u['username'] as String? ?? '').isNotEmpty) u['username'] as String,
    }.toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return _card(
      key: const ValueKey('admin-dash-listening'),
      icon: Icons.headphones_rounded,
      title: l.adminListeningNow,
      children: [
        if (sessions == null)
          _muted(l.adminDashCouldNotLoad)
        else if (listeners.isEmpty)
          _muted(l.adminDashNobodyListening)
        else
          ...listeners.take(AdminDashboardScreen.maxRows).map(_listenerRow),
        if (onlineNames.isNotEmpty) ...[
          const SizedBox(height: 4),
          _muted(l.adminDashOnlineNames(onlineNames.join(', ')), maxLines: 2),
        ],
      ],
      link: l.adminDashListeningHistory,
      onLink: () => _open(AdminSessionsScreen(users: _users)),
    );
  }

  Widget _listenerRow(AdminListener s) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final sub = [
      if (s.userName.isNotEmpty) s.userName,
      if (s.device.isNotEmpty) s.device,
    ].join(' · ');
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF4CAF50)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(s.title.isEmpty ? l.unknown : s.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: tt.bodySmall?.copyWith(color: cs.onSurface, fontWeight: FontWeight.w600)),
            if (sub.isNotEmpty)
              Text(sub,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant.withValues(alpha: 0.6))),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: s.progress,
                minHeight: 2,
                backgroundColor: cs.onSurface.withValues(alpha: 0.06),
                valueColor: AlwaysStoppedAnimation(cs.primary),
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  Widget _librariesCard() {
    final l = AppLocalizations.of(context)!;
    final libs = _libraries.whereType<Map>().toList();
    final anyScanning = _scanningAll || libs.any((lib) => _isScanning(lib['id'] as String? ?? ''));
    return _card(
      key: const ValueKey('admin-dash-libraries'),
      icon: Icons.library_books_rounded,
      title: l.adminLibraries,
      action: libs.length > 1
          ? _smallButton(l.adminDashScanAll, Icons.search_rounded, anyScanning ? null : _scanAll)
          : null,
      children: [
        if (libs.isEmpty) _muted(l.adminDashNoLibraries),
        ...libs.map(_libraryRow),
      ],
      link: l.adminLibrariesManage,
      onLink: () => _open(AdminLibrariesScreen(libraries: _libraries), reload: true),
    );
  }

  bool _isScanning(String id) =>
      _scanning.contains(id) || _tracker.isLibraryActionRunning(_scanAction, id);

  Widget _libraryRow(Map lib) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final id = lib['id'] as String? ?? '';
    final name = lib['name'] as String? ?? l.libraryFallback;
    final podcast = lib['mediaType'] == 'podcast';
    final count = _itemCounts[id];
    final scanning = _isScanning(id);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(children: [
        Icon(podcast ? Icons.podcasts_rounded : Icons.auto_stories_rounded,
            size: 18, color: cs.primary.withValues(alpha: 0.7)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: tt.bodySmall?.copyWith(color: cs.onSurface, fontWeight: FontWeight.w600)),
            Text(count == null ? '–' : l.adminDashItemCount(count),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant.withValues(alpha: 0.6))),
          ]),
        ),
        const SizedBox(width: 8),
        scanning
            ? _smallButton(l.adminScanning, null, null, busy: true)
            : _smallButton(l.adminScan, Icons.search_rounded, () => _scan(id, name)),
      ]),
    );
  }

  Widget _serverCard() {
    final l = AppLocalizations.of(context)!;
    final version = widget.serverVersion ?? context.read<AuthProvider?>()?.serverVersion;
    final latest = adminLatestBackup(_backups);
    return _card(
      key: const ValueKey('admin-dash-server'),
      icon: Icons.dns_rounded,
      title: l.adminServer,
      children: [
        _keyValue(l.adminVersion, (version ?? '').isEmpty ? '–' : version!),
        _keyValue(
          l.adminBackupsLabel,
          latest == null
              ? l.adminDashNoBackups
              : '${_backups.length} · ${l.adminDashLastBackup(_ago(latest))}',
        ),
        const SizedBox(height: 6),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: _backingUp
              ? _smallButton(l.adminDashBackUpNow, null, null, busy: true)
              : _smallButton(l.adminDashBackUpNow, Icons.backup_rounded, _backUp),
        ),
      ],
    );
  }

  Widget _usersCard() {
    final l = AppLocalizations.of(context)!;
    final online = _onlineIds;
    final users = [
      for (final u in _users)
        if (u is Map<String, dynamic>) AdminUserSummary.fromJson(u, onlineIds: online),
    ]..sort(AdminUserSummary.compare);
    return _card(
      key: const ValueKey('admin-dash-users'),
      icon: Icons.people_rounded,
      title: l.adminUsers,
      children: [
        if (users.isEmpty) _muted(l.adminDashCouldNotLoad),
        ...users.take(AdminDashboardScreen.maxRows).map(_userRow),
      ],
      link: l.adminDashManageUsers,
      onLink: () => _open(
        AdminUsersScreen(users: _users, onlineUsers: _online, libraries: _libraries),
        reload: true,
      ),
    );
  }

  Widget _userRow(AdminUserSummary u) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final status = !u.isActive
        ? l.adminDashDisabled
        : u.isLocked
            ? l.adminDashLocked
            : u.online
                ? l.adminOnline
                : u.lastSeen == null
                    ? l.adminDashNeverSeen
                    : l.adminUsersLastSeen(_ago(u.lastSeen!));
    final perms = <(bool, IconData, String)>[
      (u.canDownload, Icons.download_rounded, l.adminUsersPermDownload),
      (u.canUpdate, Icons.edit_rounded, l.adminUsersPermUpdate),
      (u.canDelete, Icons.delete_outline_rounded, l.adminUsersPermDelete),
      (u.canUpload, Icons.cloud_upload_rounded, l.adminUsersPermUpload),
      (u.allLibraries, Icons.library_books_rounded, l.adminUsersAccessAllLibraries),
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: u.online ? const Color(0xFF4CAF50) : cs.onSurface.withValues(alpha: 0.15),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Flexible(
                child: Text(u.username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: tt.bodySmall?.copyWith(
                        color: u.isActive ? cs.onSurface : cs.onSurface.withValues(alpha: 0.4),
                        fontWeight: FontWeight.w600)),
              ),
              if (u.isAdmin) ...[
                const SizedBox(width: 6),
                Icon(Icons.admin_panel_settings_rounded,
                    size: 14, color: u.type == 'root' ? Colors.amber : cs.primary),
              ],
            ]),
            Text(status,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant.withValues(alpha: 0.6))),
          ]),
        ),
        const SizedBox(width: 8),
        for (final (on, icon, label) in perms)
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 6),
            child: Tooltip(
              message: label,
              child: Semantics(
                label: label,
                checked: on,
                child: Icon(icon,
                    size: 15,
                    color: on ? cs.primary.withValues(alpha: 0.8) : cs.onSurface.withValues(alpha: 0.12)),
              ),
            ),
          ),
      ]),
    );
  }

  Widget _logsCard() {
    final l = AppLocalizations.of(context)!;
    final logs = _logs;
    final problems = logs == null
        ? const <AdminLogProblem>[]
        : adminRecentProblems(logs, limit: AdminDashboardScreen.maxRows);
    return _card(
      key: const ValueKey('admin-dash-logs'),
      icon: Icons.report_problem_outlined,
      title: l.adminDashServerWarnings,
      children: [
        if (logs == null)
          _muted(l.adminDashCouldNotLoad)
        else if (problems.isEmpty)
          _muted(l.adminDashNoProblems)
        else
          ...problems.map(_problemRow),
      ],
      link: l.adminDashAllLogs,
      onLink: () => _open(const AdminServerLogsScreen()),
    );
  }

  Widget _problemRow(AdminLogProblem p) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final color = p.isError ? cs.error : Colors.orange.shade700;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(p.levelName,
              style: tt.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w700, fontSize: 10)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(p.message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: tt.bodySmall?.copyWith(color: cs.onSurface.withValues(alpha: 0.8))),
        ),
        if (p.time.isNotEmpty) ...[
          const SizedBox(width: 8),
          Text(p.time, style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant.withValues(alpha: 0.5))),
        ],
      ]),
    );
  }

  // ─── Pieces (the Admin page's card and button look) ─────────

  Widget _card({
    required Key key,
    required IconData icon,
    required String title,
    required List<Widget> children,
    Widget? action,
    String? link,
    VoidCallback? onLink,
  }) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
        decoration: BoxDecoration(color: cs.surfaceContainerHigh, borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(icon, size: 20, color: cs.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w700, color: cs.onSurface)),
            ),
            if (action != null) action,
          ]),
          const SizedBox(height: 12),
          ...children,
          if (link != null && onLink != null)
            InkWell(
              onTap: onLink,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(children: [
                  Expanded(
                    child: Text(link,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: tt.labelMedium?.copyWith(color: cs.primary, fontWeight: FontWeight.w600)),
                  ),
                  Icon(Icons.chevron_right_rounded, size: 18, color: cs.primary.withValues(alpha: 0.7)),
                ]),
              ),
            )
          else
            const SizedBox(height: 8),
        ]),
      ),
    );
  }

  Widget _smallButton(String label, IconData? icon, VoidCallback? onTap, {bool busy = false}) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final enabled = onTap != null && !busy;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: cs.onSurface.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: cs.onSurface.withValues(alpha: 0.06)),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            if (busy)
              SizedBox(
                width: 12,
                height: 12,
                child: CircularProgressIndicator(strokeWidth: 1.5, color: cs.onSurfaceVariant.withValues(alpha: 0.5)),
              )
            else if (icon != null)
              Icon(icon, size: 14, color: cs.primary.withValues(alpha: enabled ? 0.7 : 0.3)),
            const SizedBox(width: 6),
            Text(label,
                style: tt.labelSmall?.copyWith(
                    color: cs.onSurface.withValues(alpha: enabled ? 0.6 : 0.3),
                    fontWeight: FontWeight.w600,
                    fontSize: 11)),
          ]),
        ),
      ),
    );
  }

  Widget _muted(String text, {int maxLines = 3}) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant.withValues(alpha: 0.7))),
    );
  }

  Widget _keyValue(String key, String value) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: 96,
          child: Text(key,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant.withValues(alpha: 0.6))),
        ),
        Expanded(
          child: Text(value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: tt.bodySmall?.copyWith(color: cs.onSurface, fontWeight: FontWeight.w600)),
        ),
      ]),
    );
  }

  String _ago(DateTime dt) {
    final l = AppLocalizations.of(context)!;
    final d = DateTime.now().difference(dt);
    if (d.inSeconds < 60) return l.justNow;
    if (d.inMinutes < 60) return l.minutesAgo(d.inMinutes);
    if (d.inHours < 24) return l.hoursAgo(d.inHours);
    if (d.inDays < 30) return l.daysAgo(d.inDays);
    return l.adminUsersMonthsAgo((d.inDays / 30).floor());
  }
}
