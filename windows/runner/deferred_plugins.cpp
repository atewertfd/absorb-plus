#include "deferred_plugins.h"

// The plugin's own declaration first: the generated file's include of this
// header is then a no-op, so the macro below renames only the call.
#include <flutter_inappwebview_windows/flutter_inappwebview_windows_plugin_c_api.h>

namespace {

FlutterDesktopPluginRegistrarRef g_webview_registrar = nullptr;

// Stands in for the WebView's registration during startup: keeps the
// registrar (owned by the engine, valid for its lifetime) for later.
void HoldInAppWebViewRegistration(FlutterDesktopPluginRegistrarRef registrar) {
  g_webview_registrar = registrar;
}

}  // namespace

// Compile the generated registrant again under another name, with the
// WebView's registration swapped for HoldInAppWebViewRegistration. Plugins
// added or removed by `flutter pub get` follow automatically; if the WebView
// plugin goes away, the include above fails to compile and this file can go.
#define FlutterInappwebviewWindowsPluginCApiRegisterWithRegistrar \
  HoldInAppWebViewRegistration
#define RegisterPlugins RegisterStartupPlugins
#include "flutter/generated_plugin_registrant.cc"
#undef RegisterPlugins
#undef FlutterInappwebviewWindowsPluginCApiRegisterWithRegistrar

void RegisterDeferredPlugins() {
  if (!g_webview_registrar) return;
  FlutterDesktopPluginRegistrarRef registrar = g_webview_registrar;
  g_webview_registrar = nullptr;
  FlutterInappwebviewWindowsPluginCApiRegisterWithRegistrar(registrar);
}
