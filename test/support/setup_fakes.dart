// Fakes for the first-run setup (lib/screens/setup/). No `main`.

import 'package:absorb/providers/auth_provider.dart';
import 'package:absorb/screens/setup/setup_settings.dart';
import 'package:absorb/services/player_settings.dart';
import 'package:flutter/widgets.dart';

/// [SetupSettings] in memory: records every change, asks no plugin.
class FakeSetupSettings extends SetupSettings {
  FakeSetupSettings({this.pickedLocation});

  double speed = 1.0;
  int back = 10;
  int forward = 30;
  AutoRewindSettings rewind = const AutoRewindSettings();
  bool wifiOnly = false;
  String location = 'App Internal Storage (Default)';

  /// What the folder picker "chooses"; null = cancelled.
  final String? pickedLocation;

  final Map<SetupPermission, bool> granted = {};
  final List<String> changes = [];

  @override
  Future<double> defaultSpeed() async => speed;
  @override
  Future<void> setDefaultSpeed(double v) async {
    speed = v;
    changes.add('speed=$v');
  }

  @override
  Future<int> backSkip() async => back;
  @override
  Future<void> setBackSkip(int s) async {
    back = s;
    changes.add('back=$s');
  }

  @override
  Future<int> forwardSkip() async => forward;
  @override
  Future<void> setForwardSkip(int s) async {
    forward = s;
    changes.add('forward=$s');
  }

  @override
  Future<AutoRewindSettings> autoRewind() async => rewind;
  @override
  Future<void> setAutoRewind(AutoRewindSettings s) async {
    rewind = s;
    changes.add('rewind=${s.enabled}');
  }

  @override
  Future<bool> wifiOnlyDownloads() async => wifiOnly;
  @override
  Future<void> setWifiOnlyDownloads(bool v) async {
    wifiOnly = v;
    changes.add('wifiOnly=$v');
  }

  @override
  Future<String> downloadLocation() async => location;
  @override
  Future<String?> pickDownloadLocation(BuildContext context) async {
    changes.add('pickLocation');
    if (pickedLocation != null) location = pickedLocation!;
    return pickedLocation;
  }

  @override
  Future<bool> permissionGranted(SetupPermission p) async =>
      granted[p] ?? false;
  @override
  Future<bool> requestPermission(SetupPermission p) async {
    changes.add('request=${p.name}');
    return granted[p] = true;
  }
}

/// An [AuthProvider] whose sign-in state the test flips with [signIn].
class SwitchableAuth extends AuthProvider {
  SwitchableAuth({bool signedIn = false}) : _signedIn = signedIn;

  bool _signedIn;

  void signIn() {
    _signedIn = true;
    notifyListeners();
  }

  @override
  bool get isAuthenticated => _signedIn;
  @override
  bool get isSignedOut => false;
  @override
  bool get isLoading => false;
  @override
  String? get username => _signedIn ? 'reader' : null;
  @override
  String? get serverUrl => _signedIn ? 'http://abs.test' : null;
}
