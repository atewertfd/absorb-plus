// Shared fakes for tests under test/. Each one replaces copies that used to
// live in several test files; behavior matches those copies exactly.
//
// This file has no `main`, so `flutter test` does not run it on its own.

import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/services/api_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

/// An [AuthProvider] that hands out a fixed [ApiService] without signing
/// anything in: [isAuthenticated] and [isSignedOut] are both false.
///
/// With no [api], it uses a connection to the discard port
/// (`http://127.0.0.1:9`, token `fixture-token`), so nothing ever answers.
class FakeAuth extends AuthProvider {
  FakeAuth([ApiService? api])
    : api =
          api ??
          ApiService(baseUrl: 'http://127.0.0.1:9', token: 'fixture-token');

  /// The connection returned by [apiService].
  final ApiService api;

  @override
  bool get isAuthenticated => false;

  @override
  bool get isSignedOut => false;

  @override
  ApiService? get apiService => api;
}

/// An [ApiService] for `http://abs.test` (token `test-token`) whose requests
/// all go to [handler] through a [MockClient].
///
/// By default retries happen without delay. Pass `instantRetries: false` to
/// keep [ApiService]'s normal retry delays.
ApiService mockApi(MockClientHandler handler, {bool instantRetries = true}) {
  if (!instantRetries) {
    return ApiService(
      baseUrl: 'http://abs.test',
      token: 'test-token',
      httpClient: MockClient(handler),
    );
  }
  return ApiService(
    baseUrl: 'http://abs.test',
    token: 'test-token',
    httpClient: MockClient(handler),
    networkRetryDelay: Duration.zero,
    refreshRetryDelay: Duration.zero,
  );
}

const _pathProviderChannel = MethodChannel('plugins.flutter.io/path_provider');
const _packageInfoChannel = MethodChannel(
  'dev.fluttercommunity.plus/package_info',
);
const _windowsShellChannel = MethodChannel('absorb/windows_shell');

TestDefaultBinaryMessenger get _messenger =>
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

/// Fakes the path_provider plugin: the app documents folder is [documents]
/// and every other folder lookup answers null.
///
/// With `everyFolder: true`, every lookup answers [documents] instead.
/// Undo with [clearFakePathProvider].
void fakePathProvider(String documents, {bool everyFolder = false}) {
  _messenger.setMockMethodCallHandler(_pathProviderChannel, (call) async {
    if (everyFolder) return documents;
    if (call.method == 'getApplicationDocumentsDirectory') return documents;
    return null;
  });
}

/// Removes the handler installed by [fakePathProvider].
void clearFakePathProvider() =>
    _messenger.setMockMethodCallHandler(_pathProviderChannel, null);

/// Fakes the package_info_plus plugin with a fixed app identity
/// (`Absorb`, `com.example.absorb`, version `fixture`, build `1`).
/// Undo with [clearFakePackageInfo].
void fakePackageInfo() {
  _messenger.setMockMethodCallHandler(
    _packageInfoChannel,
    (call) async => {
      'appName': 'Absorb',
      'packageName': 'com.example.absorb',
      'version': 'fixture',
      'buildNumber': '1',
      'buildSignature': '',
      'installerStore': null,
    },
  );
}

/// Removes the handler installed by [fakePackageInfo].
void clearFakePackageInfo() =>
    _messenger.setMockMethodCallHandler(_packageInfoChannel, null);

/// Fakes the Windows runner's `absorb/windows_shell` channel: `getState`
/// answers [state] and every other call answers null.
/// Undo with [clearFakeWindowsShell].
void fakeWindowsShell(Map<String, Object?> state) {
  _messenger.setMockMethodCallHandler(_windowsShellChannel, (call) async {
    if (call.method == 'getState') return state;
    return null;
  });
}

/// Removes the handler installed by [fakeWindowsShell].
void clearFakeWindowsShell() =>
    _messenger.setMockMethodCallHandler(_windowsShellChannel, null);
