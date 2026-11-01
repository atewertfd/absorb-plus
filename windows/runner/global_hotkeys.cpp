#include "global_hotkeys.h"

#include <flutter/standard_method_codec.h>

#include <utility>

namespace {

using flutter::EncodableList;
using flutter::EncodableMap;
using flutter::EncodableValue;

// RegisterHotKey ids for applications are 0x0000..0xBFFF.
constexpr int kMaxId = 0xBFFF;
// Dart sends six; anything far beyond that is a bug, not a request.
constexpr size_t kMaxBindings = 16;
constexpr UINT kAllowedModifiers = MOD_ALT | MOD_CONTROL | MOD_SHIFT | MOD_WIN;

std::optional<int> IntField(const EncodableMap& map, const char* key) {
  auto it = map.find(EncodableValue(key));
  if (it == map.end()) return std::nullopt;
  if (const auto* value = std::get_if<int32_t>(&it->second)) return *value;
  if (const auto* value = std::get_if<int64_t>(&it->second)) {
    return static_cast<int>(*value);
  }
  return std::nullopt;
}

bool BoolField(const EncodableMap& map, const char* key) {
  auto it = map.find(EncodableValue(key));
  if (it == map.end()) return false;
  const auto* value = std::get_if<bool>(&it->second);
  return value != nullptr && *value;
}

}  // namespace

GlobalHotkeys::GlobalHotkeys(HWND window, flutter::BinaryMessenger* messenger)
    : window_(window) {
  channel_ = std::make_unique<Channel>(
      messenger, "absorb/windows_global_hotkeys",
      &flutter::StandardMethodCodec::GetInstance());
  channel_->SetMethodCallHandler(
      [this](const flutter::MethodCall<EncodableValue>& call,
             std::unique_ptr<flutter::MethodResult<EncodableValue>> result) {
        HandleCall(call, std::move(result));
      });
}

GlobalHotkeys::~GlobalHotkeys() {
  UnregisterAll();
  if (channel_) channel_->SetMethodCallHandler(nullptr);
}

void GlobalHotkeys::UnregisterAll() {
  for (int id : registered_) {
    if (window_ != nullptr) UnregisterHotKey(window_, id);
  }
  registered_.clear();
}

std::optional<LRESULT> GlobalHotkeys::HandleMessage(HWND hwnd, UINT message,
                                                    WPARAM wparam,
                                                    LPARAM lparam) {
  if (message == WM_DESTROY) {
    UnregisterAll();
    return std::nullopt;
  }
  if (message != WM_HOTKEY) return std::nullopt;
  const int id = static_cast<int>(wparam);
  if (registered_.count(id) == 0) return std::nullopt;
  if (channel_) {
    channel_->InvokeMethod("hotkey", std::make_unique<EncodableValue>(id));
  }
  return 0;
}

void GlobalHotkeys::HandleCall(
    const flutter::MethodCall<EncodableValue>& call,
    std::unique_ptr<flutter::MethodResult<EncodableValue>> result) {
  const std::string& method = call.method_name();
  if (method == "unregisterAll") {
    UnregisterAll();
    result->Success(EncodableValue(true));
    return;
  }
  if (method != "register") {
    result->NotImplemented();
    return;
  }
  const auto* bindings = std::get_if<EncodableList>(call.arguments());
  if (bindings == nullptr || bindings->size() > kMaxBindings) {
    result->Error("bad_args", "Expected a list of hotkeys");
    return;
  }
  // Replaces whatever was registered before.
  UnregisterAll();
  EncodableList failed;
  for (const EncodableValue& entry : *bindings) {
    const auto* binding = std::get_if<EncodableMap>(&entry);
    if (binding == nullptr) continue;
    const std::optional<int> id = IntField(*binding, "id");
    const std::optional<int> modifiers = IntField(*binding, "modifiers");
    const std::optional<int> key = IntField(*binding, "key");
    if (!id || *id < 1 || *id > kMaxId) continue;
    const bool valid = modifiers && key && *key > 0 && *key < 0xFF &&
                       (static_cast<UINT>(*modifiers) & ~kAllowedModifiers) ==
                           0 &&
                       registered_.count(*id) == 0;
    UINT flags = valid ? static_cast<UINT>(*modifiers) : 0;
    if (!BoolField(*binding, "repeat")) flags |= MOD_NOREPEAT;
    if (valid && window_ != nullptr &&
        RegisterHotKey(window_, *id, flags, static_cast<UINT>(*key))) {
      registered_.insert(*id);
    } else {
      failed.push_back(EncodableValue(*id));
    }
  }
  result->Success(EncodableValue(std::move(failed)));
}
