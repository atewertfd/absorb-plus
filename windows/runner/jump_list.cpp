#include "jump_list.h"

// windows.h before the shell and property headers, which depend on it.
#include <windows.h>

#include <flutter/standard_method_codec.h>
#include <propkey.h>
#include <propvarutil.h>
#include <shellapi.h>
#include <shobjidl.h>
#include <wrl/client.h>

#include <optional>
#include <utility>

#include "utils.h"

namespace {

using flutter::EncodableList;
using flutter::EncodableMap;
using flutter::EncodableValue;
using Microsoft::WRL::ComPtr;

constexpr size_t kMaxRecent = 4;
// Jump list titles are cut off well before this; keeps the links small.
constexpr size_t kMaxTitle = 120;

std::wstring Utf16(const std::string& utf8) {
  if (utf8.empty()) return L"";
  const int length = MultiByteToWideChar(CP_UTF8, 0, utf8.data(),
                                         static_cast<int>(utf8.size()),
                                         nullptr, 0);
  if (length <= 0) return L"";
  std::wstring text(length, L'\0');
  MultiByteToWideChar(CP_UTF8, 0, utf8.data(), static_cast<int>(utf8.size()),
                      text.data(), length);
  return text;
}

std::wstring ExecutablePath() {
  std::wstring buffer(MAX_PATH, L'\0');
  for (;;) {
    const DWORD length = GetModuleFileNameW(
        nullptr, buffer.data(), static_cast<DWORD>(buffer.size()));
    if (length == 0) return L"";
    if (length < buffer.size()) {
      buffer.resize(length);
      return buffer;
    }
    buffer.resize(buffer.size() * 2);
  }
}

// Item ids go on a command line: letters, digits, '.', '_' and '-' only.
bool ValidItemId(const std::wstring& id) {
  if (id.empty() || id.size() > 128) return false;
  for (wchar_t c : id) {
    const bool ok = (c >= L'a' && c <= L'z') || (c >= L'A' && c <= L'Z') ||
                    (c >= L'0' && c <= L'9') || c == L'.' || c == L'_' ||
                    c == L'-';
    if (!ok) return false;
  }
  return true;
}

std::wstring CleanTitle(const std::wstring& title) {
  std::wstring clean;
  for (wchar_t c : title) {
    if (c >= 0x20 && c != 0x7F) clean.push_back(c);
  }
  if (clean.size() > kMaxTitle) clean.resize(kMaxTitle);
  return clean;
}

const EncodableValue* Field(const EncodableMap& map, const char* key) {
  auto it = map.find(EncodableValue(key));
  return it == map.end() ? nullptr : &it->second;
}

std::wstring TextField(const EncodableMap& map, const char* key) {
  const EncodableValue* value = Field(map, key);
  if (value == nullptr) return L"";
  const auto* text = std::get_if<std::string>(value);
  return text != nullptr ? Utf16(*text) : L"";
}

ComPtr<IShellLinkW> MakeLink(const std::wstring& exe,
                             const std::wstring& arguments,
                             const std::wstring& title,
                             const std::wstring& tooltip) {
  ComPtr<IShellLinkW> link;
  if (FAILED(CoCreateInstance(CLSID_ShellLink, nullptr, CLSCTX_INPROC_SERVER,
                              IID_PPV_ARGS(&link)))) {
    return nullptr;
  }
  link->SetPath(exe.c_str());
  link->SetArguments(arguments.c_str());
  link->SetIconLocation(exe.c_str(), 0);
  if (!tooltip.empty()) link->SetDescription(tooltip.c_str());

  ComPtr<IPropertyStore> store;
  if (FAILED(link.As(&store))) return nullptr;
  PROPVARIANT value;
  if (FAILED(InitPropVariantFromString(title.c_str(), &value))) return nullptr;
  const HRESULT set = store->SetValue(PKEY_Title, value);
  PropVariantClear(&value);
  if (FAILED(set) || FAILED(store->Commit())) return nullptr;
  return link;
}

std::wstring LinkArguments(IUnknown* object) {
  ComPtr<IShellLinkW> link;
  if (object == nullptr || FAILED(object->QueryInterface(IID_PPV_ARGS(&link)))) {
    return L"";
  }
  wchar_t arguments[1024] = {};
  if (FAILED(link->GetArguments(arguments, ARRAYSIZE(arguments)))) return L"";
  return arguments;
}

}  // namespace

JumpList::JumpList(flutter::BinaryMessenger* messenger,
                   std::vector<std::string> arguments, bool enabled)
    : arguments_(std::move(arguments)), enabled_(enabled) {
  channel_ = std::make_unique<Channel>(
      messenger, "absorb/windows_jump_list",
      &flutter::StandardMethodCodec::GetInstance());
  channel_->SetMethodCallHandler(
      [this](const flutter::MethodCall<EncodableValue>& call,
             std::unique_ptr<flutter::MethodResult<EncodableValue>> result) {
        HandleCall(call, std::move(result));
      });
}

JumpList::~JumpList() {
  if (channel_) channel_->SetMethodCallHandler(nullptr);
}

void JumpList::HandleForwardedLaunch(const std::wstring& command_line) {
  // A leading program name, so the real arguments get the normal quoting
  // rules of CommandLineToArgvW.
  const std::wstring line = L"absorb.exe " + command_line;
  int count = 0;
  LPWSTR* argv = CommandLineToArgvW(line.c_str(), &count);
  if (argv == nullptr) return;
  EncodableList arguments;
  bool any = false;
  for (int i = 1; i < count; ++i) {
    const std::string argument = Utf8FromUtf16(argv[i]);
    if (argument.rfind("--open-item=", 0) == 0) any = true;
    arguments.push_back(EncodableValue(argument));
  }
  LocalFree(argv);
  // Plain relaunches (Start menu, desktop shortcut) only bring the window
  // forward, as before.
  if (!any) return;
  channel_->InvokeMethod("launch",
                         std::make_unique<EncodableValue>(std::move(arguments)));
}

void JumpList::HandleCall(
    const flutter::MethodCall<EncodableValue>& call,
    std::unique_ptr<flutter::MethodResult<EncodableValue>> result) {
  const std::string& method = call.method_name();
  if (method == "initialArguments") {
    EncodableList list;
    for (const std::string& argument : arguments_) {
      list.push_back(EncodableValue(argument));
    }
    result->Success(EncodableValue(std::move(list)));
    return;
  }
  if (method == "clear") {
    result->Success(EncodableValue(Clear()));
    return;
  }
  if (method == "update") {
    const auto* args = std::get_if<EncodableMap>(call.arguments());
    if (args == nullptr) {
      result->Error("bad_args", "update expects a map");
      return;
    }
    std::optional<Entry> task;
    if (const EncodableValue* resume = Field(*args, "resume")) {
      if (const auto* map = std::get_if<EncodableMap>(resume)) {
        const std::wstring id = TextField(*map, "id");
        const std::wstring label = CleanTitle(TextField(*map, "label"));
        if (ValidItemId(id) && !label.empty()) {
          task = Entry{L"--open-item=" + id + L" --resume", label,
                       CleanTitle(TextField(*map, "title"))};
        }
      }
    }
    std::vector<Entry> recent;
    if (const EncodableValue* list = Field(*args, "recent")) {
      if (const auto* items = std::get_if<EncodableList>(list)) {
        for (const EncodableValue& item : *items) {
          const auto* map = std::get_if<EncodableMap>(&item);
          if (map == nullptr) continue;
          const std::wstring id = TextField(*map, "id");
          const std::wstring title = CleanTitle(TextField(*map, "title"));
          if (!ValidItemId(id) || title.empty()) continue;
          recent.push_back(Entry{L"--open-item=" + id, title, title});
          if (recent.size() == kMaxRecent) break;
        }
      }
    }
    const std::wstring category = CleanTitle(TextField(*args, "category"));
    result->Success(
        EncodableValue(Commit(task ? &*task : nullptr, category, recent)));
    return;
  }
  result->NotImplemented();
}

bool JumpList::Commit(const Entry* task, const std::wstring& category,
                      const std::vector<Entry>& recent) {
  if (!enabled_) return true;
  if (task == nullptr && recent.empty()) return Clear();
  const std::wstring exe = ExecutablePath();
  if (exe.empty()) return false;

  ComPtr<ICustomDestinationList> list;
  if (FAILED(CoCreateInstance(CLSID_DestinationList, nullptr,
                              CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&list)))) {
    return false;
  }
  UINT min_slots = 0;
  ComPtr<IObjectArray> removed;
  if (FAILED(list->BeginList(&min_slots, IID_PPV_ARGS(&removed)))) {
    return false;
  }
  UINT removed_count = 0;
  if (removed && SUCCEEDED(removed->GetCount(&removed_count))) {
    for (UINT i = 0; i < removed_count; ++i) {
      ComPtr<IUnknown> object;
      if (SUCCEEDED(removed->GetAt(i, IID_PPV_ARGS(&object)))) {
        const std::wstring arguments = LinkArguments(object.Get());
        if (!arguments.empty()) removed_.insert(arguments);
      }
    }
  }

  bool ok = true;
  if (!recent.empty() && !category.empty()) {
    ComPtr<IObjectCollection> items;
    if (SUCCEEDED(CoCreateInstance(CLSID_EnumerableObjectCollection, nullptr,
                                   CLSCTX_INPROC_SERVER,
                                   IID_PPV_ARGS(&items)))) {
      UINT added = 0;
      for (const Entry& entry : recent) {
        if (removed_.count(entry.arguments) != 0) continue;
        ComPtr<IShellLinkW> link =
            MakeLink(exe, entry.arguments, entry.title, entry.tooltip);
        if (link && SUCCEEDED(items->AddObject(link.Get()))) ++added;
      }
      ComPtr<IObjectArray> array;
      if (added > 0 && SUCCEEDED(items.As(&array))) {
        // Fails when the user turned off recent items for jump lists; the
        // Resume task still goes in.
        list->AppendCategory(category.c_str(), array.Get());
      }
    }
  }

  if (task != nullptr) {
    ComPtr<IObjectCollection> tasks;
    ComPtr<IShellLinkW> link =
        MakeLink(exe, task->arguments, task->title, task->tooltip);
    ComPtr<IObjectArray> array;
    if (link &&
        SUCCEEDED(CoCreateInstance(CLSID_EnumerableObjectCollection, nullptr,
                                   CLSCTX_INPROC_SERVER,
                                   IID_PPV_ARGS(&tasks))) &&
        SUCCEEDED(tasks->AddObject(link.Get())) &&
        SUCCEEDED(tasks.As(&array))) {
      ok = SUCCEEDED(list->AddUserTasks(array.Get()));
    } else {
      ok = false;
    }
  }

  if (FAILED(list->CommitList())) {
    list->AbortList();
    return false;
  }
  return ok;
}

bool JumpList::Clear() {
  if (!enabled_) return true;
  ComPtr<ICustomDestinationList> list;
  if (FAILED(CoCreateInstance(CLSID_DestinationList, nullptr,
                              CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&list)))) {
    return false;
  }
  return SUCCEEDED(list->DeleteList(nullptr));
}
