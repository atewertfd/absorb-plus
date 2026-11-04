import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// GitHub sign-in for the test channel (Absorb Plus Test app only).
///
/// The test builds repo is private, so the app signs in to a GitHub App
/// (Contents read-only, installed only on that repo) with the OAuth device
/// flow: GitHub shows a code, the user types it at github.com/login/device,
/// and the app polls until it's approved. GitHub App user tokens expire after
/// 8 hours and are refreshed with the refresh token (device-flow apps need
/// no client secret). Tokens live in SharedPreferences under
/// `fork_test_channel_gh_*` (no secure storage in this app; test-only), and
/// are never logged.

/// The GitHub App's client id, from `tool/test-channel-client-id.txt` via
/// `tool/dev.ps1 apk -Local`. Public, not a secret. Empty: not set up.
const String kGitHubClientId = String.fromEnvironment('ABSORB_GH_CLIENT_ID');

/// What GitHub returned for a device-flow start.
class GitHubDeviceCode {
  const GitHubDeviceCode({
    required this.deviceCode,
    required this.userCode,
    required this.verificationUri,
    required this.expiresIn,
    required this.interval,
  });

  final String deviceCode;

  /// The code the user types on GitHub, like `WDJB-MJHT`.
  final String userCode;
  final String verificationUri;
  final Duration expiresIn;
  final Duration interval;
}

enum GitHubSignInOutcome {
  /// Approved; tokens are saved.
  signedIn,

  /// The user pressed Cancel on GitHub.
  denied,

  /// The code ran out before it was approved.
  expired,

  /// Cancelled in the app.
  cancelled,

  /// GitHub answered with another error or couldn't be reached.
  failed,
}

enum GitHubAuthState {
  signedOut,
  signedIn,

  /// The saved sign-in couldn't be refreshed: sign in again.
  expired,
}

/// Thrown for a device-flow start GitHub refused or that failed.
class GitHubAuthException implements Exception {
  const GitHubAuthException(this.message);
  final String message;

  @override
  String toString() => 'GitHubAuthException: $message';
}

class GitHubDeviceAuth {
  GitHubDeviceAuth({
    String? clientId,
    http.Client Function()? clientFactory,
    DateTime Function()? clock,
    Future<void> Function(Duration)? delay,
  }) : clientId = clientId ?? kGitHubClientId,
       _clientFactory = clientFactory ?? http.Client.new,
       _clock = clock ?? DateTime.now,
       _delay = delay ?? Future<void>.delayed;

  static const accessTokenKey = 'fork_test_channel_gh_access_token';
  static const refreshTokenKey = 'fork_test_channel_gh_refresh_token';
  static const expiresAtKey = 'fork_test_channel_gh_expires_at';
  static const loginKey = 'fork_test_channel_gh_login';
  static const needsSignInKey = 'fork_test_channel_gh_needs_sign_in';

  static final Uri deviceCodeUri = Uri.parse(
    'https://github.com/login/device/code',
  );
  static final Uri accessTokenUri = Uri.parse(
    'https://github.com/login/oauth/access_token',
  );
  static final Uri userUri = Uri.parse('https://api.github.com/user');
  static const verificationUrl = 'https://github.com/login/device';
  static const _deviceGrant = 'urn:ietf:params:oauth:grant-type:device_code';

  /// Refresh this long before the token expires.
  static const refreshMargin = Duration(minutes: 5);

  final String clientId;
  final http.Client Function() _clientFactory;
  final DateTime Function() _clock;
  final Future<void> Function(Duration) _delay;

  /// Refresh tokens are single use, so concurrent callers share one refresh.
  static Future<String?>? _refreshing;

  bool get isConfigured => clientId.trim().isNotEmpty;

  /// Starts the device flow. Throws [GitHubAuthException] on failure.
  Future<GitHubDeviceCode> start() async {
    if (!isConfigured) {
      throw const GitHubAuthException('GitHub sign-in is not set up');
    }
    final data = await _post(deviceCodeUri, {
      'client_id': clientId,
    }, label: 'Device code');
    final deviceCode = data?['device_code'];
    final userCode = data?['user_code'];
    if (deviceCode is! String || userCode is! String) {
      throw GitHubAuthException(
        'Device code failed: ${data?['error'] ?? 'no code'}',
      );
    }
    return GitHubDeviceCode(
      deviceCode: deviceCode,
      userCode: userCode,
      verificationUri: data!['verification_uri'] as String? ?? verificationUrl,
      expiresIn: Duration(seconds: _int(data['expires_in']) ?? 900),
      interval: Duration(seconds: _int(data['interval']) ?? 5),
    );
  }

  /// Polls until the user approves [code] on GitHub (then saves the tokens
  /// and the GitHub login), denies it, it expires, or [isCancelled] is true.
  Future<GitHubSignInOutcome> poll(
    GitHubDeviceCode code, {
    bool Function()? isCancelled,
  }) async {
    final deadline = _clock().add(code.expiresIn);
    var interval = code.interval;
    while (true) {
      await _delay(interval);
      if (isCancelled?.call() ?? false) return GitHubSignInOutcome.cancelled;
      if (!_clock().isBefore(deadline)) return GitHubSignInOutcome.expired;
      Map<String, dynamic>? data;
      try {
        data = await _post(accessTokenUri, {
          'client_id': clientId,
          'device_code': code.deviceCode,
          'grant_type': _deviceGrant,
        }, label: 'Token poll');
      } catch (error) {
        // A dropped request: keep polling until the code expires.
        debugPrint('[GitHubAuth] Token poll failed: ${error.runtimeType}');
        continue;
      }
      if (isCancelled?.call() ?? false) return GitHubSignInOutcome.cancelled;
      if (data == null) continue;
      if (data['access_token'] is String) {
        await _saveTokens(data);
        await _fetchLogin(data['access_token'] as String);
        return GitHubSignInOutcome.signedIn;
      }
      switch (data['error']) {
        case 'authorization_pending':
          continue;
        case 'slow_down':
          final next = _int(data['interval']);
          interval = next != null
              ? Duration(seconds: next)
              : interval + const Duration(seconds: 5);
          continue;
        case 'expired_token':
          return GitHubSignInOutcome.expired;
        case 'access_denied':
          return GitHubSignInOutcome.denied;
        default:
          debugPrint('[GitHubAuth] Sign-in failed: ${data['error']}');
          return GitHubSignInOutcome.failed;
      }
    }
  }

  Future<GitHubAuthState> state() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(accessTokenKey) != null) {
      return GitHubAuthState.signedIn;
    }
    return prefs.getBool(needsSignInKey) == true
        ? GitHubAuthState.expired
        : GitHubAuthState.signedOut;
  }

  /// The GitHub login saved at sign-in, like `octocat`.
  Future<String?> login() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(loginKey);
  }

  /// A usable access token, refreshed first when it's about to expire, or
  /// null when signed out or the refresh was refused (then [state] says
  /// [GitHubAuthState.expired]). A refresh that can't reach GitHub returns
  /// the old token so the next try can refresh again.
  Future<String?> validAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(accessTokenKey);
    if (token == null) return null;
    final expiresAt = prefs.getInt(expiresAtKey);
    if (expiresAt == null) return token; // Token expiry turned off.
    final expiry = DateTime.fromMillisecondsSinceEpoch(expiresAt);
    if (_clock().isBefore(expiry.subtract(refreshMargin))) return token;
    final refreshToken = prefs.getString(refreshTokenKey);
    if (refreshToken == null || !isConfigured) {
      await _markExpired();
      return null;
    }
    return _refreshing ??= _refresh(
      refreshToken,
      token,
    ).whenComplete(() => _refreshing = null);
  }

  Future<String?> _refresh(String refreshToken, String oldToken) async {
    Map<String, dynamic>? data;
    try {
      data = await _post(accessTokenUri, {
        'client_id': clientId,
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
      }, label: 'Refresh');
    } catch (error) {
      debugPrint('[GitHubAuth] Refresh failed: ${error.runtimeType}');
      return oldToken;
    }
    final token = data?['access_token'];
    if (token is String) {
      await _saveTokens(data!);
      return token;
    }
    debugPrint('[GitHubAuth] Refresh refused: ${data?['error']}');
    await _markExpired();
    return null;
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    for (final key in const [
      accessTokenKey,
      refreshTokenKey,
      expiresAtKey,
      loginKey,
      needsSignInKey,
    ]) {
      await prefs.remove(key);
    }
  }

  Future<void> _markExpired() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(accessTokenKey);
    await prefs.remove(refreshTokenKey);
    await prefs.remove(expiresAtKey);
    await prefs.setBool(needsSignInKey, true);
  }

  Future<void> _saveTokens(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessTokenKey, data['access_token'] as String);
    final refresh = data['refresh_token'];
    if (refresh is String) {
      await prefs.setString(refreshTokenKey, refresh);
    } else {
      await prefs.remove(refreshTokenKey);
    }
    final expiresIn = _int(data['expires_in']);
    if (expiresIn != null) {
      await prefs.setInt(
        expiresAtKey,
        _clock().add(Duration(seconds: expiresIn)).millisecondsSinceEpoch,
      );
    } else {
      await prefs.remove(expiresAtKey);
    }
    await prefs.remove(needsSignInKey);
  }

  Future<void> _fetchLogin(String token) async {
    final client = _clientFactory();
    try {
      final response = await client
          .get(userUri, headers: githubApiHeaders(token))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode != 200) {
        debugPrint('[GitHubAuth] /user answered ${response.statusCode}');
        return;
      }
      final data = jsonDecode(response.body);
      final login = data is Map<String, dynamic> ? data['login'] : null;
      if (login is String) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(loginKey, login);
      }
    } catch (error) {
      debugPrint('[GitHubAuth] /user failed: ${error.runtimeType}');
    } finally {
      client.close();
    }
  }

  /// POSTs a form to GitHub's OAuth endpoints and returns the JSON answer
  /// (also for OAuth errors, which come back as 200 with an `error`).
  Future<Map<String, dynamic>?> _post(
    Uri uri,
    Map<String, String> body, {
    required String label,
  }) async {
    final client = _clientFactory();
    try {
      final response = await client
          .post(uri, headers: const {'Accept': 'application/json'}, body: body)
          .timeout(const Duration(seconds: 15));
      final Object? data;
      try {
        data = jsonDecode(response.body);
      } on FormatException {
        throw GitHubAuthException('$label: HTTP ${response.statusCode}');
      }
      if (data is! Map<String, dynamic>) {
        throw GitHubAuthException('$label: HTTP ${response.statusCode}');
      }
      return data;
    } finally {
      client.close();
    }
  }

  static int? _int(Object? value) =>
      value is int ? value : (value is String ? int.tryParse(value) : null);

  @visibleForTesting
  static void resetForTest() => _refreshing = null;
}

/// Headers for a GitHub REST call, with the token when there is one.
Map<String, String> githubApiHeaders(
  String? token, {
  String accept = 'application/vnd.github+json',
}) => {
  'Accept': accept,
  'X-GitHub-Api-Version': '2022-11-28',
  if (token != null) 'Authorization': 'Bearer $token',
};
