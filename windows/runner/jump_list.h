#ifndef RUNNER_JUMP_LIST_H_
#define RUNNER_JUMP_LIST_H_

#include <flutter/binary_messenger.h>
#include <flutter/encodable_value.h>
#include <flutter/method_channel.h>

#include <memory>
#include <set>
#include <string>
#include <vector>

// Taskbar jump list (absorb-plus fork): a "Resume <book>" task and a
// "Continue listening" category with up to four books. Each entry starts
// absorb.exe with --open-item=<itemId> (plus --resume for the task); a copy
// that is already running gets those arguments through SingleInstance and
// HandleForwardedLaunch. Dart side: lib/services/windows_jump_list.dart over
// the "absorb/windows_jump_list" channel. Entries carry item ids only, never
// server addresses or tokens.
class JumpList {
 public:
  // |arguments|: this launch's command line, handed to Dart on request.
  // |enabled| is false for the probe build, which leaves the list alone.
  JumpList(flutter::BinaryMessenger* messenger,
           std::vector<std::string> arguments, bool enabled);
  ~JumpList();
  JumpList(const JumpList&) = delete;
  JumpList& operator=(const JumpList&) = delete;

  // A second launch's command line (the part after the executable).
  void HandleForwardedLaunch(const std::wstring& command_line);

 private:
  using Channel = flutter::MethodChannel<flutter::EncodableValue>;

  struct Entry {
    std::wstring arguments;
    std::wstring title;
    std::wstring tooltip;
  };

  void HandleCall(
      const flutter::MethodCall<flutter::EncodableValue>& call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
  bool Commit(const Entry* task, const std::wstring& category,
              const std::vector<Entry>& recent);
  bool Clear();

  std::unique_ptr<Channel> channel_;
  std::vector<std::string> arguments_;
  bool enabled_;
  // Entries the user removed from the list; Windows refuses to take them
  // back, so they stay out for this session.
  std::set<std::wstring> removed_;
};

#endif  // RUNNER_JUMP_LIST_H_
