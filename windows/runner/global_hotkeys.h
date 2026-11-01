#ifndef RUNNER_GLOBAL_HOTKEYS_H_
#define RUNNER_GLOBAL_HOTKEYS_H_

#include <windows.h>

#include <flutter/binary_messenger.h>
#include <flutter/encodable_value.h>
#include <flutter/method_channel.h>

#include <memory>
#include <optional>
#include <set>

// Opt-in global hotkeys (absorb-plus fork): system-wide key combinations
// registered on the main window with RegisterHotKey, so they work while
// Absorb Plus is in the background or hidden in the tray. Dart decides which
// keys and what they do (lib/services/windows_global_hotkeys.dart over the
// "absorb/windows_global_hotkeys" channel); this side only registers them and
// forwards WM_HOTKEY as a "hotkey" call carrying the binding's id. Everything
// is unregistered when Dart turns the feature off, when the window is
// destroyed and when this object goes away.
class GlobalHotkeys {
 public:
  GlobalHotkeys(HWND window, flutter::BinaryMessenger* messenger);
  ~GlobalHotkeys();
  GlobalHotkeys(const GlobalHotkeys&) = delete;
  GlobalHotkeys& operator=(const GlobalHotkeys&) = delete;

  // WM_HOTKEY for one of ours; also unregisters on WM_DESTROY (not consumed).
  std::optional<LRESULT> HandleMessage(HWND hwnd, UINT message, WPARAM wparam,
                                       LPARAM lparam);

  void UnregisterAll();

 private:
  using Channel = flutter::MethodChannel<flutter::EncodableValue>;

  void HandleCall(
      const flutter::MethodCall<flutter::EncodableValue>& call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

  HWND window_;
  std::unique_ptr<Channel> channel_;
  std::set<int> registered_;
};

#endif  // RUNNER_GLOBAL_HOTKEYS_H_
