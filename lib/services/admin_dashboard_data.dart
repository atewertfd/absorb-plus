// Data for the admin dashboard (lib/screens/admin_dashboard_screen.dart).
//
// Fork-owned. The screen reads everything through [AdminDashboardSource] so
// tests can hand it fakes; [ApiAdminDashboardSource] is the real one and only
// calls existing ApiService methods plus `getOpenSessions` (abs_admin_api.dart).
// Every endpoint is checked against the Audiobookshelf server source
// (server/routers/ApiRouter.js) and the throwaway test server.

import 'api_service.dart';

/// What the dashboard needs from the server. The two writes ([scanLibrary],
/// [createBackup]) only ever run on an explicit tap.
abstract class AdminDashboardSource {
  /// GET /api/sessions/open. Null when the request failed.
  Future<List<Map<String, dynamic>>?> openSessions();

  /// GET /api/users/online (`usersOnline`).
  Future<List<dynamic>> onlineUsers();

  /// GET /api/users.
  Future<List<dynamic>> users();

  /// GET /api/libraries.
  Future<List<dynamic>> libraries();

  /// GET /api/libraries/:id/stats.
  Future<Map<String, dynamic>?> libraryStats(String libraryId);

  /// GET /api/backups.
  Future<List<dynamic>> backups();

  /// GET /api/logger-data. Null when the request failed.
  Future<List<Map<String, dynamic>>?> serverLogs();

  /// POST /api/libraries/:id/scan. True only on HTTP 200.
  Future<bool> scanLibrary(String libraryId);

  /// POST /api/backups. True only on HTTP 200.
  Future<bool> createBackup();
}

class ApiAdminDashboardSource implements AdminDashboardSource {
  ApiAdminDashboardSource(this.api);
  final ApiService api;

  @override
  Future<List<Map<String, dynamic>>?> openSessions() => api.getOpenSessions();
  @override
  Future<List<dynamic>> onlineUsers() => api.getOnlineUsers();
  @override
  Future<List<dynamic>> users() => api.getUsers();
  @override
  Future<List<dynamic>> libraries() => api.getLibraries();
  @override
  Future<Map<String, dynamic>?> libraryStats(String libraryId) =>
      api.getLibraryStats(libraryId);
  @override
  Future<List<dynamic>> backups() => api.getBackups();
  @override
  Future<List<Map<String, dynamic>>?> serverLogs() => api.getServerLogs();
  @override
  Future<bool> scanLibrary(String libraryId) => api.scanLibrary(libraryId);
  @override
  Future<bool> createBackup() => api.createBackup();
}

String _str(Object? v) => v is String ? v.trim() : '';

/// A short "client · device" label from a session's `deviceInfo`
/// (server/objects/DeviceInfo.js toJSON). Empty when nothing useful is known.
String adminDeviceLabel(Object? deviceInfo) {
  if (deviceInfo is! Map) return '';
  final client = _str(deviceInfo['clientName']);
  var device = _str(deviceInfo['deviceName']);
  if (device.isEmpty) {
    final model = _str(deviceInfo['model']);
    final maker = _str(deviceInfo['manufacturer']);
    if (model.isNotEmpty) {
      device = maker.isEmpty ||
              model.toLowerCase().startsWith(maker.toLowerCase())
          ? model
          : '$maker $model';
    }
  }
  if (device.isEmpty) {
    final browser = _str(deviceInfo['browserName']);
    final os = _str(deviceInfo['osName']);
    device = [browser, os].where((s) => s.isNotEmpty).join(' on ');
  }
  if (client.isEmpty) return device;
  if (device.isEmpty || device == client) return client;
  return '$client · $device';
}

/// One open playback session, ready to show.
class AdminListener {
  const AdminListener({
    required this.sessionId,
    required this.userId,
    required this.userName,
    required this.title,
    required this.author,
    required this.device,
    required this.currentTime,
    required this.duration,
  });

  final String sessionId;
  final String userId;
  final String userName;
  final String title;
  final String author;
  final String device;
  final double currentTime;
  final double duration;

  double get progress =>
      duration > 0 ? (currentTime / duration).clamp(0.0, 1.0) : 0.0;

  /// [users] fills in the name when the session has no `user` object.
  factory AdminListener.fromSession(
    Map<String, dynamic> s, {
    List<dynamic> users = const [],
  }) {
    final userId = _str(s['userId']);
    var userName = s['user'] is Map ? _str((s['user'] as Map)['username']) : '';
    if (userName.isEmpty && userId.isNotEmpty) {
      for (final u in users) {
        if (u is Map && u['id'] == userId) {
          userName = _str(u['username']);
          break;
        }
      }
    }
    return AdminListener(
      sessionId: _str(s['id']),
      userId: userId,
      userName: userName,
      title: _str(s['displayTitle']),
      author: _str(s['displayAuthor']),
      device: adminDeviceLabel(s['deviceInfo']),
      currentTime: (s['currentTime'] as num?)?.toDouble() ?? 0,
      duration: (s['duration'] as num?)?.toDouble() ?? 0,
    );
  }
}

/// A user row: who, when last seen and the main permissions.
class AdminUserSummary {
  const AdminUserSummary({
    required this.id,
    required this.username,
    required this.type,
    required this.isActive,
    required this.isLocked,
    required this.lastSeen,
    required this.online,
    required this.canDownload,
    required this.canUpdate,
    required this.canDelete,
    required this.canUpload,
    required this.allLibraries,
  });

  final String id;
  final String username;
  final String type;
  final bool isActive;
  final bool isLocked;
  final DateTime? lastSeen;
  final bool online;
  final bool canDownload;
  final bool canUpdate;
  final bool canDelete;
  final bool canUpload;
  final bool allLibraries;

  bool get isAdmin => type == 'admin' || type == 'root';

  /// [onlineIds] are users with a socket connection or an open session.
  /// Admin and root accounts have every permission on the server whatever
  /// their stored flags say, so they show as such.
  factory AdminUserSummary.fromJson(
    Map<String, dynamic> u, {
    Set<String> onlineIds = const {},
  }) {
    final perms = u['permissions'] is Map ? u['permissions'] as Map : const {};
    final type = _str(u['type']);
    final admin = type == 'admin' || type == 'root';
    bool perm(String key) => admin || perms[key] == true;
    final seen = u['lastSeen'];
    final id = _str(u['id']);
    return AdminUserSummary(
      id: id,
      username: _str(u['username']),
      type: type.isEmpty ? 'user' : type,
      isActive: u['isActive'] as bool? ?? true,
      isLocked: u['isLocked'] as bool? ?? false,
      lastSeen: seen is num && seen > 0
          ? DateTime.fromMillisecondsSinceEpoch(seen.toInt())
          : null,
      online: onlineIds.contains(id),
      canDownload: perm('download'),
      canUpdate: perm('update'),
      canDelete: perm('delete'),
      canUpload: perm('upload'),
      allLibraries: perm('accessAllLibraries'),
    );
  }

  /// Online first, then most recently seen, then by name.
  static int compare(AdminUserSummary a, AdminUserSummary b) {
    if (a.online != b.online) return a.online ? -1 : 1;
    final at = a.lastSeen?.millisecondsSinceEpoch ?? 0;
    final bt = b.lastSeen?.millisecondsSinceEpoch ?? 0;
    if (at != bt) return bt.compareTo(at);
    return a.username.toLowerCase().compareTo(b.username.toLowerCase());
  }
}

/// A warning or error from the server's daily log.
class AdminLogProblem {
  const AdminLogProblem({
    required this.level,
    required this.levelName,
    required this.message,
    required this.time,
  });

  final int level;
  final String levelName;
  final String message;

  /// "HH:mm" taken from the log timestamp ("YYYY-MM-DD HH:mm:ss.SSS").
  final String time;

  bool get isError => level >= adminLogLevelError;
}

/// Audiobookshelf log levels (server/utils/constants.js LogLevel).
const adminLogLevelWarn = 3;
const adminLogLevelError = 4;
const _adminLogLevelNote = 6;

/// The newest warnings, errors and fatals, newest first, at most [limit].
/// NOTE-level lines are informational in Audiobookshelf, so they're left out.
List<AdminLogProblem> adminRecentProblems(
  List<Map<String, dynamic>> logs, {
  int limit = 5,
}) {
  final out = <AdminLogProblem>[];
  for (var i = logs.length - 1; i >= 0 && out.length < limit; i--) {
    final log = logs[i];
    final rawLevel = log['level'];
    final level = rawLevel is num ? rawLevel.toInt() : -1;
    if (level < adminLogLevelWarn || level >= _adminLogLevelNote) continue;
    final ts = _str(log['timestamp']);
    final time = RegExp(r'(\d{2}:\d{2})').firstMatch(ts)?.group(1) ?? '';
    out.add(AdminLogProblem(
      level: level,
      levelName: _str(log['levelName']).isEmpty
          ? (level >= adminLogLevelError ? 'ERROR' : 'WARN')
          : _str(log['levelName']),
      message: _str(log['message']).replaceAll(RegExp(r'\s+'), ' '),
      time: time,
    ));
  }
  return out;
}

/// The newest backup's creation time, or null when there are none.
DateTime? adminLatestBackup(List<dynamic> backups) {
  int? newest;
  for (final b in backups) {
    if (b is! Map) continue;
    final t = b['createdAt'];
    if (t is num && (newest == null || t > newest)) newest = t.toInt();
  }
  return newest == null ? null : DateTime.fromMillisecondsSinceEpoch(newest);
}
