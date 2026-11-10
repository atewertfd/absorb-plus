import 'dart:convert';
import 'dart:io';

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/screens/test_channel_screen.dart';
import 'package:absorb/services/github_device_auth.dart';
import 'package:absorb/services/test_channel_service.dart';
import 'package:absorb/services/update_checker_service.dart';
import 'package:absorb/widgets/github_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

// GitHub sign-in for the private test channel, all against fake HTTP.

final _l = lookupAppLocalizations(const Locale('en'));

http.Response _json(Object body, [int status = 200]) =>
    http.Response(jsonEncode(body), status);

const _deviceCode = {
  'device_code': 'dc-1',
  'user_code': 'WDJB-MJHT',
  'verification_uri': 'https://github.com/login/device',
  'expires_in': 900,
  'interval': 5,
};

const _tokens = {
  'access_token': 'ghu_access',
  'expires_in': 28800,
  'refresh_token': 'ghr_refresh',
  'refresh_token_expires_in': 15897600,
  'token_type': 'bearer',
  'scope': '',
};

/// A fake GitHub: [tokenAnswers] are the access_token endpoint's answers in
/// order (the last one repeats).
class _FakeGitHub {
  _FakeGitHub(this.tokenAnswers);

  final List<Object> tokenAnswers;
  final requests = <http.Request>[];
  int _token = 0;

  http.Client client() => MockClient((request) async {
    requests.add(request);
    if (request.url == GitHubDeviceAuth.deviceCodeUri) {
      return _json(_deviceCode);
    }
    if (request.url == GitHubDeviceAuth.accessTokenUri) {
      final answer =
          tokenAnswers[_token < tokenAnswers.length
              ? _token
              : tokenAnswers.length - 1];
      _token++;
      if (answer is Exception) throw answer;
      return _json(answer);
    }
    if (request.url == GitHubDeviceAuth.userUri) {
      return _json({'login': 'octocat'});
    }
    return http.Response('not found', 404);
  });

  List<http.Request> to(Uri uri) =>
      requests.where((r) => r.url == uri).toList();
}

void main() {
  late DateTime now;
  late List<Duration> delays;

  GitHubDeviceAuth auth(_FakeGitHub github, {String clientId = 'Iv1.test'}) =>
      GitHubDeviceAuth(
        clientId: clientId,
        clientFactory: github.client,
        clock: () => now,
        delay: (d) async {
          delays.add(d);
          now = now.add(d);
        },
      );

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    GitHubDeviceAuth.resetForTest();
    now = DateTime(2026, 11, 3, 12);
    delays = [];
  });

  group('device flow', () {
    test('happy path: saves the tokens and the login', () async {
      final github = _FakeGitHub([
        {'error': 'authorization_pending'},
        _tokens,
      ]);
      final a = auth(github);
      final code = await a.start();
      expect(code.userCode, 'WDJB-MJHT');
      expect(code.verificationUri, GitHubDeviceAuth.verificationUrl);
      expect(github.requests.single.bodyFields, {'client_id': 'Iv1.test'});
      expect(github.requests.single.headers['Accept'], 'application/json');

      expect(await a.poll(code), GitHubSignInOutcome.signedIn);
      expect(delays, [const Duration(seconds: 5), const Duration(seconds: 5)]);
      final poll = github.to(GitHubDeviceAuth.accessTokenUri).first;
      expect(poll.bodyFields, {
        'client_id': 'Iv1.test',
        'device_code': 'dc-1',
        'grant_type': 'urn:ietf:params:oauth:grant-type:device_code',
      });
      final user = github.to(GitHubDeviceAuth.userUri).single;
      expect(user.headers['Authorization'], 'Bearer ghu_access');

      expect(await a.state(), GitHubAuthState.signedIn);
      expect(await a.login(), 'octocat');
      expect(await a.validAccessToken(), 'ghu_access');
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString(GitHubDeviceAuth.refreshTokenKey), 'ghr_refresh');
      expect(
        prefs.getInt(GitHubDeviceAuth.expiresAtKey),
        now.add(const Duration(hours: 8)).millisecondsSinceEpoch,
      );
      for (final key in prefs.getKeys()) {
        expect(key, startsWith('fork_test_channel_gh_'));
      }
    });

    test(
      'slow_down waits longer: +5 s, or the interval GitHub sends',
      () async {
        final github = _FakeGitHub([
          {'error': 'slow_down'},
          {'error': 'slow_down', 'interval': 20},
          _tokens,
        ]);
        final a = auth(github);
        expect(await a.poll(await a.start()), GitHubSignInOutcome.signedIn);
        expect(delays, const [
          Duration(seconds: 5),
          Duration(seconds: 10),
          Duration(seconds: 20),
        ]);
      },
    );

    test('denied on GitHub: no tokens', () async {
      final a = auth(
        _FakeGitHub([
          {'error': 'access_denied'},
        ]),
      );
      expect(await a.poll(await a.start()), GitHubSignInOutcome.denied);
      expect(await a.state(), GitHubAuthState.signedOut);
      expect(await a.validAccessToken(), isNull);
    });

    test('expired: GitHub says so, or the code runs out locally', () async {
      final a = auth(
        _FakeGitHub([
          {'error': 'expired_token'},
        ]),
      );
      expect(await a.poll(await a.start()), GitHubSignInOutcome.expired);

      final pending = auth(
        _FakeGitHub([
          {'error': 'authorization_pending'},
        ]),
      );
      const short = GitHubDeviceCode(
        deviceCode: 'dc',
        userCode: 'X',
        verificationUri: GitHubDeviceAuth.verificationUrl,
        expiresIn: Duration(seconds: 12),
        interval: Duration(seconds: 5),
      );
      delays.clear();
      expect(await pending.poll(short), GitHubSignInOutcome.expired);
      expect(delays, hasLength(3));
      expect(await pending.state(), GitHubAuthState.signedOut);
    });

    test('a dropped poll keeps polling; Cancel stops it', () async {
      final github = _FakeGitHub([
        const SocketException('offline'),
        {'error': 'authorization_pending'},
      ]);
      final a = auth(github);
      final code = await a.start();
      var polls = 0;
      final outcome = await a.poll(code, isCancelled: () => ++polls > 4);
      expect(outcome, GitHubSignInOutcome.cancelled);
      expect(github.to(GitHubDeviceAuth.accessTokenUri).length, greaterThan(1));
    });

    test('an empty client id is not set up and never calls GitHub', () async {
      final github = _FakeGitHub([_tokens]);
      final a = auth(github, clientId: '');
      expect(a.isConfigured, isFalse);
      await expectLater(a.start(), throwsA(isA<GitHubAuthException>()));
      expect(github.requests, isEmpty);
    });
  });

  group('refresh', () {
    Future<void> signedIn({required Duration expiresIn}) async {
      SharedPreferences.setMockInitialValues({
        GitHubDeviceAuth.accessTokenKey: 'ghu_old',
        GitHubDeviceAuth.refreshTokenKey: 'ghr_old',
        GitHubDeviceAuth.expiresAtKey: now
            .add(expiresIn)
            .millisecondsSinceEpoch,
        GitHubDeviceAuth.loginKey: 'octocat',
      });
    }

    test('a fresh token is used as is', () async {
      await signedIn(expiresIn: const Duration(hours: 2));
      final github = _FakeGitHub([_tokens]);
      expect(await auth(github).validAccessToken(), 'ghu_old');
      expect(github.requests, isEmpty);
    });

    test('a token about to expire is refreshed (no secret)', () async {
      await signedIn(expiresIn: const Duration(minutes: 1));
      final github = _FakeGitHub([
        {..._tokens, 'access_token': 'ghu_new', 'refresh_token': 'ghr_new'},
      ]);
      final a = auth(github);
      // Two callers at once share one refresh (refresh tokens are single use).
      final tokens = await Future.wait([
        a.validAccessToken(),
        a.validAccessToken(),
      ]);
      expect(tokens, ['ghu_new', 'ghu_new']);
      final refresh = github.to(GitHubDeviceAuth.accessTokenUri).single;
      expect(refresh.bodyFields, {
        'client_id': 'Iv1.test',
        'grant_type': 'refresh_token',
        'refresh_token': 'ghr_old',
      });
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString(GitHubDeviceAuth.refreshTokenKey), 'ghr_new');
      expect(await a.state(), GitHubAuthState.signedIn);
    });

    test('a refused refresh asks to sign in again', () async {
      await signedIn(expiresIn: const Duration(minutes: -1));
      final a = auth(
        _FakeGitHub([
          {'error': 'bad_refresh_token'},
        ]),
      );
      expect(await a.validAccessToken(), isNull);
      expect(await a.state(), GitHubAuthState.expired);
      await a.signOut();
      expect(await a.state(), GitHubAuthState.signedOut);
    });

    test('a refresh that cannot reach GitHub keeps the sign-in', () async {
      await signedIn(expiresIn: const Duration(minutes: -1));
      final a = auth(_FakeGitHub([const SocketException('offline')]));
      expect(await a.validAccessToken(), 'ghu_old');
      expect(await a.state(), GitHubAuthState.signedIn);
    });
  });

  group('test channel with a token', () {
    Map<String, dynamic> release() => {
      'tag_name': 'test-channel',
      'draft': false,
      'body': 'notes',
      'assets': [
        {
          'id': 4242,
          'name': 'absorb-plus-test-1.12.1+400.apk',
          'browser_download_url':
              'https://github.com/atewertfd/absorb-plus-test-builds/releases/download/test-channel/absorb-plus-test-1.12.1+400.apk',
        },
      ],
    };

    TestChannelService service(
      http.Response Function(http.Request) answer, {
      String? token,
      List<http.Request>? seen,
    }) => TestChannelService(
      clientFactory: () => MockClient((request) async {
        seen?.add(request);
        return answer(request);
      }),
      installedVersion: () async => '1.12.1+399',
      accessToken: () async => token,
    );

    test(
      'sends the token, keeps the asset id and downloads via the API',
      () async {
        final seen = <http.Request>[];
        final result = await service(
          (_) => _json(release()),
          token: 'ghu_access',
          seen: seen,
        ).check();
        expect(seen.single.headers['Authorization'], 'Bearer ghu_access');
        expect(result.status, TestChannelStatus.newer);
        expect(result.build!.assetId, 4242);
        final info = TestChannelService.updateInfoFor(
          result.build!,
          installedVersion: '1.12.1+399',
          packageLabel: 'Test build 400',
          accessToken: result.accessToken,
        );
        expect(
          info.authDownloadUrl,
          'https://api.github.com/repos/atewertfd/absorb-plus-test-builds/releases/assets/4242',
        );
        expect(info.downloadHeaders['Accept'], 'application/octet-stream');
        expect(info.downloadHeaders['Authorization'], 'Bearer ghu_access');
        // The browser fallback and the file name stay the public asset URL.
        expect(info.downloadUrl, endsWith('absorb-plus-test-1.12.1+400.apk'));
      },
    );

    test('signed out: no Authorization header, plain download', () async {
      final seen = <http.Request>[];
      final result = await service((_) => _json(release()), seen: seen).check();
      expect(seen.single.headers.containsKey('Authorization'), isFalse);
      final info = TestChannelService.updateInfoFor(
        result.build!,
        installedVersion: '1.12.1+399',
        packageLabel: 'Test build 400',
        accessToken: result.accessToken,
      );
      expect(info.authDownloadUrl, isNull);
      expect(info.downloadHeaders, isEmpty);
    });

    test('404 signed out or 401 signed in asks to sign in', () async {
      expect(
        (await service((_) => http.Response('{}', 404)).check()).status,
        TestChannelStatus.signInRequired,
      );
      expect(
        (await service(
          (_) => http.Response('{}', 401),
          token: 'bad',
        ).check()).status,
        TestChannelStatus.signInRequired,
      );
    });
  });

  group('authenticated download', () {
    test('follows the redirect without the token', () async {
      final seen = <http.Request>[];
      final client = MockClient((request) async {
        seen.add(request);
        if (request.url.host == 'api.github.com') {
          return http.Response(
            '',
            302,
            headers: {
              'location':
                  'https://objects.githubusercontent.com/signed/abc?X-Amz-Signature=x',
            },
          );
        }
        return http.Response.bytes([1, 2, 3], 200);
      });
      final dir = await Directory.systemTemp.createTemp('gh_dl_test');
      addTearDown(() => dir.delete(recursive: true));
      final file = File('${dir.path}/test.apk');
      final got = await UpdateDownload(client).run(
        Uri.parse(
          'https://api.github.com/repos/atewertfd/absorb-plus-test-builds/releases/assets/4242',
        ),
        file,
        (_, _) {},
        headers: githubApiHeaders(
          'ghu_access',
          accept: 'application/octet-stream',
        ),
      );
      expect(await got.readAsBytes(), [1, 2, 3]);
      expect(seen, hasLength(2));
      expect(seen[0].headers['Authorization'], 'Bearer ghu_access');
      expect(seen[0].headers['Accept'], 'application/octet-stream');
      expect(seen[0].followRedirects, isFalse);
      expect(seen[1].url.host, 'objects.githubusercontent.com');
      expect(seen[1].headers.containsKey('Authorization'), isFalse);
    });

    test('stops after too many redirects', () async {
      final client = MockClient(
        (request) async => http.Response(
          '',
          302,
          headers: {'location': 'https://example.com/loop'},
        ),
      );
      await expectLater(
        sendWithoutForwardingAuth(
          client,
          Uri.parse('https://api.github.com/x'),
          {'Authorization': 'Bearer t'},
        ),
        throwsA(isA<HttpException>()),
      );
    });
  });

  group('sign-in UI', () {
    Widget app(Widget home) => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: home),
    );

    testWidgets('not set up: says so instead of starting', (tester) async {
      final github = _FakeGitHub([_tokens]);
      await tester.pumpWidget(
        app(GitHubSignInTile(auth: auth(github, clientId: ''))),
      );
      await tester.pumpAndSettle();
      expect(find.text(_l.githubSignInNotSetUp), findsOneWidget);
      await tester.tap(find.text(_l.githubSignIn));
      await tester.pump();
      expect(find.byType(AlertDialog), findsNothing);
      expect(github.requests, isEmpty);
      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('shows the code, signs in, then Sign out', (tester) async {
      final github = _FakeGitHub([
        {'error': 'authorization_pending'},
        _tokens,
      ]);
      final a = GitHubDeviceAuth(
        clientId: 'Iv1.test',
        clientFactory: github.client,
        clock: () => now,
        delay: (d) async {
          await Future<void>.delayed(d);
          now = now.add(d);
        },
      );
      await tester.pumpWidget(app(GitHubSignInTile(auth: a)));
      await tester.pumpAndSettle();
      await tester.tap(find.text(_l.githubSignIn));
      await tester.pump();
      await tester.pump();
      expect(find.text('WDJB-MJHT'), findsOneWidget);
      expect(find.text(_l.githubSignInOpen), findsOneWidget);
      expect(find.text(_l.githubSignInWaiting), findsOneWidget);

      await tester.pump(const Duration(seconds: 5));
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsNothing);
      expect(find.text(_l.githubSignedInAs('octocat')), findsOneWidget);

      await tester.tap(find.text(_l.githubSignOut));
      await tester.pumpAndSettle();
      expect(find.text(_l.githubSignIn), findsOneWidget);
      expect(await a.state(), GitHubAuthState.signedOut);
    });

    testWidgets('denied: says so and offers Try again', (tester) async {
      final a = auth(
        _FakeGitHub([
          {'error': 'access_denied'},
        ]),
      );
      await tester.pumpWidget(app(GitHubSignInTile(auth: a)));
      await tester.pumpAndSettle();
      await tester.tap(find.text(_l.githubSignIn));
      await tester.pumpAndSettle();
      expect(find.text(_l.githubSignInDenied), findsOneWidget);
      expect(find.text(_l.githubSignInTryAgain), findsOneWidget);
      await tester.tap(find.text(_l.cancel));
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('the test channel page asks to sign in on a private repo', (
      tester,
    ) async {
      final service = TestChannelService(
        clientFactory: () => MockClient(
          (_) async => http.Response('{"message":"Not Found"}', 404),
        ),
        installedVersion: () async => '1.12.1+399',
        accessToken: () async => null,
      );
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: TestChannelScreen(
            service: service,
            gitHubAuth: auth(_FakeGitHub([_tokens]), clientId: ''),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(_l.testChannelSignInNeeded), findsOneWidget);
      await tester.tap(find.text(_l.githubSignIn));
      await tester.pump();
      expect(find.text(_l.githubSignInNotSetUp), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
    });
  });
}
