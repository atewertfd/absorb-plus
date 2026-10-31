part of 'api_service.dart';

/// Fork-owned Audiobookshelf admin calls used by the admin dashboard
/// (`lib/screens/admin_dashboard_screen.dart`). Kept in a part so it can use
/// [ApiService]'s authenticated request helpers without growing the upstream
/// file. Every call here is read-only.
extension AbsAdminApi on ApiService {
  /// Playback sessions open on the server right now (admin only).
  ///
  /// GET /api/sessions/open answers `{ sessions: [...], shareSessions: [...] }`
  /// (`SessionController.getOpenSessions`); each session carries a minified
  /// `user` ({id, username, type}) and its `deviceInfo`. Null means the request
  /// failed, so the caller can tell that apart from "nobody is listening".
  Future<List<Map<String, dynamic>>?> getOpenSessions() async {
    try {
      final r = await _authGet(Uri.parse('$_cleanBaseUrl/api/sessions/open'));
      if (r.statusCode != 200) {
        debugPrint('[API] getOpenSessions failed: ${r.statusCode}');
        return null;
      }
      final decoded = jsonDecode(r.body);
      final raw = decoded is Map ? decoded['sessions'] : null;
      if (raw is! List) return const <Map<String, dynamic>>[];
      return raw
          .whereType<Map>()
          .map((s) => s.map((key, value) => MapEntry(key.toString(), value)))
          .toList(growable: false);
    } catch (e) {
      debugPrint('[API] getOpenSessions error: $e');
      return null;
    }
  }
}
