import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../utils/fork_platform.dart';
import 'github_device_auth.dart';
import 'update_checker_service.dart';
import 'update_policy.dart';

/// The test channel (Absorb Plus): one rolling GitHub pre-release in the
/// separate repo `atewertfd/absorb-plus-test-builds` (private, read with a
/// GitHub sign-in from [GitHubDeviceAuth]; public works too), tag
/// `test-channel`, that `tool/dev.ps1 apk` refreshes with the newest
/// signed test APK (`absorb-plus-test-<version>+<build>.apk`) and its notes.
/// The normal updater ignores it (only `v*` tags are releases).

/// One test build found on the test channel.
class TestChannelBuild {
  const TestChannelBuild({
    required this.version,
    required this.build,
    required this.assetName,
    required this.downloadUrl,
    this.assetId,
    this.notes = '',
  });

  /// `1.12.1`
  final String version;

  /// `346`
  final int build;
  final String assetName;
  final String downloadUrl;

  /// The GitHub asset id; a private repo's asset downloads through
  /// [assetApiUrl] with a token.
  final int? assetId;
  final String notes;

  String? get assetApiUrl => assetId == null
      ? null
      : 'https://api.github.com/repos/${TestChannelService.repo}/releases/assets/$assetId';

  /// `1.12.1+346`, the form the app shows for the installed version.
  String get fullVersion => '$version+$build';
}

/// Version and build from a test channel asset name, or null when [name]
/// isn't one. GitHub may store the `+` as another separator, so `.`, `-`
/// and `_` are accepted too.
({String version, int build})? parseTestChannelAssetName(String name) {
  final m = RegExp(
    r'^absorb-plus-test-(\d+\.\d+\.\d+)[+._-](\d+)\.apk$',
    caseSensitive: false,
  ).firstMatch(name);
  if (m == null) return null;
  final build = int.tryParse(m.group(2)!);
  if (build == null) return null;
  return (version: m.group(1)!, build: build);
}

/// The newest test build in a GitHub release JSON, or null when it has none.
TestChannelBuild? pickTestChannelBuild(Map<String, dynamic> release) {
  if (release['draft'] == true) return null;
  final notes = release['body'] as String? ?? '';
  final ids = <String, int>{
    for (final raw in release['assets'] as List<dynamic>? ?? const [])
      if (raw is Map<String, dynamic> &&
          raw['name'] is String &&
          raw['id'] is int)
        raw['name'] as String: raw['id'] as int,
  };
  TestChannelBuild? best;
  for (final asset in releaseAssetsOf(release)) {
    final parsed = parseTestChannelAssetName(asset.name);
    if (parsed == null) continue;
    if (best == null || parsed.build > best.build) {
      best = TestChannelBuild(
        version: parsed.version,
        build: parsed.build,
        assetName: asset.name,
        downloadUrl: asset.downloadUrl,
        assetId: ids[asset.name],
        notes: notes,
      );
    }
  }
  return best;
}

/// The build number of an installed version like `1.12.1+346`.
int? installedBuildNumber(String installedVersion) {
  final m = RegExp(r'[+-](\d+)$').firstMatch(installedVersion.trim());
  return m == null ? null : int.tryParse(m.group(1)!);
}

/// Whether [build] is newer than [installedVersion]: a higher build number.
/// Builds only ever go up, across versions too.
bool isNewerTestBuild(TestChannelBuild build, String installedVersion) {
  final installed = installedBuildNumber(installedVersion);
  if (installed == null) {
    return compareUpdateVersions(build.fullVersion, installedVersion) > 0;
  }
  return build.build > installed;
}

enum TestChannelStatus {
  /// A newer test build is up.
  newer,

  /// The newest test build isn't newer than this one.
  upToDate,

  /// The channel has no test build yet.
  empty,

  /// GitHub couldn't be reached or answered with an error.
  failed,

  /// The repo is private: sign in with GitHub (or again) to see it.
  signInRequired,
}

class TestChannelCheck {
  const TestChannelCheck(
    this.status, {
    this.build,
    this.installedVersion,
    this.accessToken,
  });

  final TestChannelStatus status;
  final TestChannelBuild? build;
  final String? installedVersion;

  /// The GitHub token the check used, for the download. Memory only.
  final String? accessToken;
}

class TestChannelService {
  TestChannelService({
    http.Client Function()? clientFactory,
    Future<String> Function()? installedVersion,
    Future<String?> Function()? accessToken,
  }) : _clientFactory = clientFactory ?? http.Client.new,
       _installedVersion =
           installedVersion ?? UpdateCheckerService.currentInstalledVersion,
       _accessToken = accessToken ?? GitHubDeviceAuth().validAccessToken;

  static const repo = 'atewertfd/absorb-plus-test-builds';
  static const tag = 'test-channel';
  static final Uri releaseUri = Uri.parse(
    'https://api.github.com/repos/$repo/releases/tags/$tag',
  );

  static const _isGithubBuild = bool.fromEnvironment('GITHUB_BUILD');
  // Only the Absorb Plus Test app (dev flavor) installs test builds.
  static const _isPlayStoreBuild = bool.fromEnvironment('PLAYSTORE_BUILD');

  /// Tests set this to pretend to be (or not be) a supported build.
  @visibleForTesting
  static bool? debugSupportedOverride;

  /// The test channel is for the Android GitHub build only: Play Store and
  /// F-Droid builds can't install a GitHub-signed APK over themselves, and
  /// the other platforms have no test channel yet.
  static bool get isSupported =>
      debugSupportedOverride ??
      supportedFor(
        isAndroid: ForkPlatform.isAndroid,
        isGithubBuild: _isGithubBuild,
        isPlayStoreBuild: _isPlayStoreBuild,
      );

  static bool supportedFor({
    required bool isAndroid,
    required bool isGithubBuild,
    required bool isPlayStoreBuild,
  }) => isAndroid && isGithubBuild && !isPlayStoreBuild;

  final http.Client Function() _clientFactory;
  final Future<String> Function() _installedVersion;
  final Future<String?> Function() _accessToken;

  Future<TestChannelCheck> check() async {
    String? installed;
    try {
      installed = await _installedVersion();
    } catch (error) {
      debugPrint('[TestChannel] Installed version lookup failed: $error');
    }
    String? token;
    try {
      token = await _accessToken();
    } catch (error) {
      debugPrint('[TestChannel] Sign-in lookup failed: ${error.runtimeType}');
    }
    final client = _clientFactory();
    try {
      final response = await client
          .get(releaseUri, headers: githubApiHeaders(token))
          .timeout(const Duration(seconds: 10));
      // A private repo answers 404 without a token, 401 with a bad one.
      if ((response.statusCode == 404 && token == null) ||
          response.statusCode == 401) {
        return TestChannelCheck(
          TestChannelStatus.signInRequired,
          installedVersion: installed,
        );
      }
      if (response.statusCode == 404) {
        return TestChannelCheck(
          TestChannelStatus.empty,
          installedVersion: installed,
        );
      }
      if (response.statusCode != 200) {
        debugPrint('[TestChannel] GitHub answered ${response.statusCode}');
        return TestChannelCheck(
          TestChannelStatus.failed,
          installedVersion: installed,
        );
      }
      final data = jsonDecode(response.body);
      final build = data is Map<String, dynamic> && data['tag_name'] == tag
          ? pickTestChannelBuild(data)
          : null;
      if (build == null) {
        return TestChannelCheck(
          TestChannelStatus.empty,
          installedVersion: installed,
        );
      }
      final newer = installed == null || isNewerTestBuild(build, installed);
      return TestChannelCheck(
        newer ? TestChannelStatus.newer : TestChannelStatus.upToDate,
        build: build,
        installedVersion: installed,
        accessToken: token,
      );
    } catch (error) {
      debugPrint('[TestChannel] Check failed: $error');
      return TestChannelCheck(
        TestChannelStatus.failed,
        installedVersion: installed,
      );
    } finally {
      client.close();
    }
  }

  /// The updater's description of [build], so the normal download, progress
  /// and installer path installs it. With [accessToken] (signed in), it
  /// downloads through the asset API, which a private repo needs.
  static UpdateInfo updateInfoFor(
    TestChannelBuild build, {
    required String installedVersion,
    required String packageLabel,
    String? accessToken,
  }) {
    final apiUrl = build.assetApiUrl;
    final viaApi = accessToken != null && apiUrl != null;
    return UpdateInfo(
      latestVersion: build.fullVersion,
      currentVersion: installedVersion,
      downloadUrl: build.downloadUrl,
      authDownloadUrl: viaApi ? apiUrl : null,
      downloadHeaders: viaApi
          ? githubApiHeaders(accessToken, accept: 'application/octet-stream')
          : const {},
      releaseNotes: build.notes,
      isPreRelease: true,
      isDirectApk: true,
      packageLabel: packageLabel,
    );
  }
}
