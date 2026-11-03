/// True only in the "Absorb Plus Test" app (owner, 2026-11-03): the Android
/// `dev` flavor built by `tool/dev.ps1 apk -Local` with
/// `--dart-define=ABSORB_TEST_BUILD=true`. It installs beside the normal app
/// and is the only build with Developer mode and the test channel.
///
/// A compile-time constant, so in normal builds every `if (kTestBuild)`
/// branch, and the Developer mode and test channel code only reached
/// through them, is left out of the app entirely.
const bool kTestBuild = bool.fromEnvironment('ABSORB_TEST_BUILD');
