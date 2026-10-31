#ifndef RUNNER_DEFERRED_PLUGINS_H_
#define RUNNER_DEFERRED_PLUGINS_H_

#include <flutter/plugin_registry.h>

// Absorb Plus: plugin registration split around the first frame.
//
// RegisterStartupPlugins registers every plugin in the generated list
// (windows/flutter/generated_plugin_registrant.cc) except the in-app WebView.
// That plugin's constructor builds a WinRT dispatcher queue, a Direct3D 11
// device and a compositor (about 50 ms on the main thread before the window
// shows), and only the ebook reader uses it. RegisterDeferredPlugins
// registers it; FlutterWindow calls it once the first frame is on screen.
void RegisterStartupPlugins(flutter::PluginRegistry* registry);
void RegisterDeferredPlugins();

#endif  // RUNNER_DEFERRED_PLUGINS_H_
