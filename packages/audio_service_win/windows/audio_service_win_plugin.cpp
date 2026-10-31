#include "audio_service_win_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <winrt/Windows.Media.h>
#include <winrt/Windows.Media.Playback.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Storage.Streams.h>
#include <winrt/base.h>

#include <memory>
#include <sstream>
#include <iostream>
#include <fstream>  // std::ifstream
#include <vector>   // std::vector
#include <iterator> // std::istreambuf_iterator
#include <iomanip>
#include <future>
#include <mutex>
#include <queue>
#include <algorithm>
#include <atomic>
#include <chrono>

// A call for Dart raised on an SMTC worker thread, delivered later on the
// platform thread (method name + argument).
struct PendingSmtcEvent {
  std::string method;
  flutter::EncodableValue argument;
};

static winrt::Windows::Media::Playback::MediaPlayer mediaPlayer{nullptr};
static winrt::Windows::Media::SystemMediaTransportControls smtc{nullptr};
static winrt::Windows::Media::SystemMediaTransportControlsDisplayUpdater updater{nullptr};
static std::unique_ptr<flutter::MethodChannel<>> channel;
static std::string appId;
static winrt::event_token buttonToken{};
static winrt::event_token positionToken{};
static std::vector<std::future<void>> artworkTasks;
static std::mutex buttonMutex;
static std::queue<PendingSmtcEvent> pendingButtons;
// Artwork: the source showing now and its stream reference, so a re-push of
// the same item keeps its cover instead of clearing and reloading it. The
// generation drops artwork loads that finish after a newer item arrived.
static std::mutex artworkMutex;
static std::string currentArtUri;
static winrt::Windows::Storage::Streams::RandomAccessStreamReference currentThumb{nullptr};
static std::atomic<uint64_t> artworkGeneration{0};
static HWND callbackWindow = nullptr;
static flutter::PluginRegistrarWindows* pluginRegistrar = nullptr;
static int windowProcId = -1;
static constexpr UINT kMediaButtonMessage = WM_APP + 0x391;

namespace audio_service_win
{

  // static
  void AudioServiceWinPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarWindows *registrar)
  {

    static bool plugin_already_registered = false;

    if (plugin_already_registered) {
      // Skip registration in subwindow
      return;
    }

    plugin_already_registered = true;
    pluginRegistrar = registrar;
    callbackWindow = registrar->GetView()->GetNativeWindow();
    callbackWindow = GetAncestor(callbackWindow, GA_ROOT);
    windowProcId = registrar->RegisterTopLevelWindowProcDelegate(
        [](HWND, UINT message, WPARAM, LPARAM) -> std::optional<LRESULT> {
          if (message != kMediaButtonMessage) return std::nullopt;
          std::queue<PendingSmtcEvent> events;
          {
            std::lock_guard<std::mutex> lock(buttonMutex);
            events.swap(pendingButtons);
          }
          while (!events.empty()) {
            if (channel) channel->InvokeMethod(events.front().method,
                std::make_unique<flutter::EncodableValue>(events.front().argument));
            events.pop();
          }
          return 0;
        });

    channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
        registrar->messenger(), "audio_service_win",
        &flutter::StandardMethodCodec::GetInstance());

    auto plugin = std::make_unique<AudioServiceWinPlugin>();

    channel->SetMethodCallHandler(
        [plugin_pointer = plugin.get()](const auto &call, auto result)
        {
          plugin_pointer->HandleMethodCall(call, std::move(result));
        });

    registrar->AddPlugin(std::move(plugin));
  }

  AudioServiceWinPlugin::AudioServiceWinPlugin() {}

  AudioServiceWinPlugin::~AudioServiceWinPlugin() {
    {
      std::lock_guard<std::mutex> lock(buttonMutex);
      callbackWindow = nullptr;
      pendingButtons = {};
    }
    if (smtc) {
      try {
        smtc.ButtonPressed(buttonToken);
        smtc.PlaybackPositionChangeRequested(positionToken);
        smtc.IsEnabled(false);
      } catch (...) {}
    }
    // Finish owned artwork work before releasing COM objects. Do not leave
    // static WinRT objects to destruct after the host's COM apartment exits.
    artworkGeneration++;
    for (auto& task : artworkTasks) task.wait();
    artworkTasks.clear();
    currentThumb = nullptr;
    currentArtUri.clear();
    updater = nullptr;
    smtc = nullptr;
    if (mediaPlayer) mediaPlayer.Close();
    mediaPlayer = nullptr;
    if (pluginRegistrar && windowProcId >= 0)
      pluginRegistrar->UnregisterTopLevelWindowProcDelegate(windowProcId);
    pluginRegistrar = nullptr;
    channel.reset();
  }

  // Function to setup System Media Transport Controls (SMTC)
  static void SetupSMTC()
  {
    if (mediaPlayer == nullptr)
    {
      mediaPlayer = winrt::Windows::Media::Playback::MediaPlayer();
      // The MediaPlayer never plays anything; it only hosts SMTC. Turn off its
      // automatic integration so its own empty state (status, a 0:00
      // timeline) never overrides what Absorb reports by hand.
      try {
        mediaPlayer.CommandManager().IsEnabled(false);
      } catch (const winrt::hresult_error& e) {
        std::cerr << "SMTC: could not disable the command manager: "
                  << winrt::to_string(e.message()) << std::endl;
      }
      smtc = mediaPlayer.SystemMediaTransportControls();
      updater = smtc.DisplayUpdater();
      updater.AppMediaId(winrt::to_hstring(appId));

      smtc.IsPlayEnabled(true);
      smtc.IsPauseEnabled(true);
      smtc.IsNextEnabled(true);
      smtc.IsPreviousEnabled(true);
      smtc.IsEnabled(false); // Keep disabled until setMediaItem

      std::cout << "SMTC initialized with appid: " << appId << std::endl;

      buttonToken = smtc.ButtonPressed([](auto const &, winrt::Windows::Media::SystemMediaTransportControlsButtonPressedEventArgs const &args)
                         {
                           std::string *method = new std::string;
                           switch (args.Button())
                           {
                           case winrt::Windows::Media::SystemMediaTransportControlsButton::Play:
                             *method = "play";
                             break;
                           case winrt::Windows::Media::SystemMediaTransportControlsButton::Pause:
                             *method = "pause";
                             break;
                           case winrt::Windows::Media::SystemMediaTransportControlsButton::Next:
                             *method = "next";
                             break;
                           case winrt::Windows::Media::SystemMediaTransportControlsButton::Previous:
                             *method = "previous";
                             break;
                           case winrt::Windows::Media::SystemMediaTransportControlsButton::Stop:
                             *method = "stop";
                             break;
                           case winrt::Windows::Media::SystemMediaTransportControlsButton::FastForward:
                             *method = "fastForward";
                             break;
                           case winrt::Windows::Media::SystemMediaTransportControlsButton::Rewind:
                             *method = "rewind";
                             break;
                           case winrt::Windows::Media::SystemMediaTransportControlsButton::Record:
                             *method = "record";
                             break;
                           case winrt::Windows::Media::SystemMediaTransportControlsButton::ChannelUp:
                             *method = "channelUp";
                             break;
                           case winrt::Windows::Media::SystemMediaTransportControlsButton::ChannelDown:
                             *method = "channelDown";
                             break;
                           default:
                             *method = "other";
                             break;
                           }
                           // SMTC calls from a Windows worker thread. Deliver
                           // Flutter channel messages on the host window thread.
                           {
                             std::lock_guard<std::mutex> lock(buttonMutex);
                             if (callbackWindow) {
                               pendingButtons.push({"onSMTCButtonPressed",
                                                    flutter::EncodableValue(*method)});
                               PostMessage(callbackWindow, kMediaButtonMessage, 0, 0);
                             }
                           }
                           delete method; // Clean up the dynamically allocated string
                         });

      // Dragging the timeline in the media flyout. Forwarded like the
      // buttons, as milliseconds on the timeline Absorb last reported.
      positionToken = smtc.PlaybackPositionChangeRequested(
          [](auto const &, winrt::Windows::Media::PlaybackPositionChangeRequestedEventArgs const &args)
          {
            const int64_t ms = std::chrono::duration_cast<std::chrono::milliseconds>(
                                   args.RequestedPlaybackPosition())
                                   .count();
            std::lock_guard<std::mutex> lock(buttonMutex);
            if (callbackWindow) {
              pendingButtons.push({"onSMTCSeek", flutter::EncodableValue(ms)});
              PostMessage(callbackWindow, kMediaButtonMessage, 0, 0);
            }
          });
    }
  }

  // Reads an integer argument; the codec sends small Dart ints as int32.
  static int64_t IntArg(const flutter::EncodableMap &args, const char *key, int64_t fallback)
  {
    auto it = args.find(flutter::EncodableValue(key));
    if (it == args.end()) return fallback;
    if (const auto *v = std::get_if<int32_t>(&it->second)) return *v;
    if (const auto *v = std::get_if<int64_t>(&it->second)) return *v;
    return fallback;
  }

  static winrt::Windows::Foundation::TimeSpan Millis(int64_t ms)
  {
    return std::chrono::duration_cast<winrt::Windows::Foundation::TimeSpan>(
        std::chrono::milliseconds(ms < 0 ? 0 : ms));
  }

  // Sets the flyout's timeline. A failure is logged and never reaches Dart
  // or playback.
  static void UpdateTimeline(int64_t positionMs, int64_t durationMs, double rate, bool seekable)
  {
    if (!smtc) return;
    try {
      if (positionMs > durationMs) positionMs = durationMs;
      winrt::Windows::Media::SystemMediaTransportControlsTimelineProperties timeline;
      timeline.StartTime(Millis(0));
      timeline.EndTime(Millis(durationMs));
      timeline.MinSeekTime(Millis(0));
      timeline.MaxSeekTime(Millis(seekable ? durationMs : 0));
      timeline.Position(Millis(positionMs));
      smtc.UpdateTimelineProperties(timeline);
      if (rate > 0) smtc.PlaybackRate(rate);
    } catch (const winrt::hresult_error &e) {
      std::cerr << "SMTC timeline update failed: " << winrt::to_string(e.message()) << std::endl;
    } catch (...) {
      std::cerr << "SMTC timeline update failed" << std::endl;
    }
  }

} // namespace audio_service_win

namespace audio_service_win
{

  std::string UrlDecode(const std::string &encoded)
  {
    std::ostringstream result;
    for (size_t i = 0; i < encoded.size(); ++i)
    {
      if (encoded[i] == '%' && i + 2 < encoded.size())
      {
        int value;
        std::istringstream is(encoded.substr(i + 1, 2));
        if (is >> std::hex >> value)
        {
          result << static_cast<char>(value);
          i += 2;
        }
        else
        {
          result << encoded[i];
        }
      }
      else if (encoded[i] == '+')
      {
        result << ' ';
      }
      else
      {
        result << encoded[i];
      }
    }
    return result.str();
  }

  void AudioServiceWinPlugin::HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
  {

    // Initialize System Media Transport Controls (SMTC) but do NOT enable or update notification yet
    if (method_call.method_name().compare("initializeSMTC") == 0)
    {
      std::cout << "Starting SMTC..." << std::endl;

      // Extract the appid argument from the method call
      const auto *arguments = std::get_if<flutter::EncodableMap>(method_call.arguments());
      if (arguments && arguments->find(flutter::EncodableValue("appid")) != arguments->end())
      {
        appId = std::get<std::string>(arguments->at(flutter::EncodableValue("appid")));

        result->Success();
      }
      else
      {
        result->Error("InvalidArguments", "appid is required");
      }
    }

    // Set/Update new Media metadata
    else if (method_call.method_name().compare("setMediaItem") == 0)
    {
      const auto *arguments = std::get_if<flutter::EncodableMap>(method_call.arguments());
      if (arguments && arguments->find(flutter::EncodableValue("title")) != arguments->end() &&
          arguments->find(flutter::EncodableValue("artist")) != arguments->end() &&
          arguments->find(flutter::EncodableValue("album")) != arguments->end())
      {
        std::string title;
        const auto &titleValue =
            arguments->at(flutter::EncodableValue("title"));
        if (!titleValue.IsNull() &&
            std::holds_alternative<std::string>(titleValue)) {
          title = std::get<std::string>(titleValue);
        }

        std::string artist;
        const auto &artistValue =
            arguments->at(flutter::EncodableValue("artist"));
        if (!artistValue.IsNull() &&
            std::holds_alternative<std::string>(artistValue)) {
          artist = std::get<std::string>(artistValue);
        }

        std::string album;
        const auto &albumValue =
            arguments->at(flutter::EncodableValue("album"));
        if (!albumValue.IsNull() &&
            std::holds_alternative<std::string>(albumValue)) {
          album = std::get<std::string>(albumValue);
        }

        // Ensure SMTC is initialized
        if (!smtc)
        {
          try
          {
            SetupSMTC();
          }
          catch (const winrt::hresult_error& e)
          {
            std::cerr << "SMTC setup failed: " << winrt::to_string(e.message()) << std::endl;
          }
        }

        std::string artUri;
        if (arguments->find(flutter::EncodableValue("artUri")) != arguments->end())
        {
          const auto &artUriValue = arguments->at(flutter::EncodableValue("artUri"));
          if (!artUriValue.IsNull() && std::holds_alternative<std::string>(artUriValue))
          {
            artUri = std::get<std::string>(artUriValue);
          }
        }

        if (updater)
        {
          try
          {
            std::lock_guard<std::mutex> artworkLock(artworkMutex);
            smtc.IsEnabled(true);
            updater.ClearAll();
            updater.Type(winrt::Windows::Media::MediaPlaybackType::Music);
            updater.MusicProperties().Title(winrt::to_hstring(title));
            updater.MusicProperties().Artist(winrt::to_hstring(artist));
            updater.MusicProperties().AlbumTitle(winrt::to_hstring(album));

            if (!artUri.empty() && artUri == currentArtUri)
            {
              // Same cover as before (a chapter or text re-push): keep it.
              if (currentThumb) updater.Thumbnail(currentThumb);
            }
            else
            {
              // A new item or cover: the old one is gone with ClearAll above,
              // and any load still running for it is dropped.
              const uint64_t generation = ++artworkGeneration;
              currentArtUri = artUri;
              currentThumb = nullptr;
              if (!artUri.empty())
              {
                artworkTasks.erase(std::remove_if(artworkTasks.begin(), artworkTasks.end(),
                    [](auto& task) { return task.wait_for(std::chrono::seconds(0)) == std::future_status::ready; }),
                    artworkTasks.end());
                artworkTasks.push_back(std::async(std::launch::async, [artUri, generation, artworkUpdater = updater]() mutable
                {
                  winrt::init_apartment(winrt::apartment_type::multi_threaded);
                  try {
                    winrt::Windows::Storage::Streams::RandomAccessStreamReference thumbRef{nullptr};
                    if (artUri.rfind("http://", 0) == 0 || artUri.rfind("https://", 0) == 0) {
                      // Windows fetches the cover itself.
                      winrt::Windows::Foundation::Uri uri(winrt::to_hstring(artUri));
                      thumbRef = winrt::Windows::Storage::Streams::RandomAccessStreamReference::CreateFromUri(uri);
                    } else {
                      // A plain path (audio_service's cache file, a downloaded
                      // book's cover) is used as is; only file:// URIs are
                      // percent-decoded, so names with % or + stay intact.
                      std::string localPath = artUri;
                      if (localPath.rfind("file:///", 0) == 0) {
                        localPath = UrlDecode(localPath.substr(8));
                        std::replace(localPath.begin(), localPath.end(), '/', '\\');
                      }
                      auto storageFile = winrt::Windows::Storage::StorageFile::GetFileFromPathAsync(winrt::to_hstring(localPath)).get();
                      thumbRef = winrt::Windows::Storage::Streams::RandomAccessStreamReference::CreateFromFile(storageFile);
                    }
                    std::lock_guard<std::mutex> lock(artworkMutex);
                    if (generation == artworkGeneration.load()) {
                      currentThumb = thumbRef;
                      artworkUpdater.Thumbnail(thumbRef);
                      artworkUpdater.Update();
                    }
                  } catch (const winrt::hresult_error& e) {
                    // Never log the source: a server cover URL carries the token.
                    std::cerr << "Failed to set thumbnail: " << winrt::to_string(e.message()) << std::endl;
                  } catch (...) {
                    std::cerr << "Failed to set thumbnail" << std::endl;
                  }
                  artworkUpdater = nullptr;
                  winrt::uninit_apartment();
                }));
              }
            }
            updater.Update();
          }
          catch (const winrt::hresult_error& e)
          {
            std::cerr << "SMTC metadata update failed: " << winrt::to_string(e.message()) << std::endl;
          }
          catch (...)
          {
            std::cerr << "SMTC metadata update failed" << std::endl;
          }
        }
        result->Success();
      }
      else
      {
        result->Error("InvalidArguments", "title, artist, and album are required");
      }
    }

    // Update State
    else if (method_call.method_name().compare("updateState") == 0)
    {
      const auto *arguments = std::get_if<flutter::EncodableMap>(method_call.arguments());
      if (arguments && arguments->find(flutter::EncodableValue("state")) != arguments->end())
      {
        int32_t state = std::get<int32_t>(arguments->at(flutter::EncodableValue("state")));
        if (state < 0 || state > 2)
        {
          result->Error("InvalidArguments", "Invalid playback state");
          return;
        }
        if (smtc)
        {
          try
          {
            smtc.IsEnabled(true);
            switch (state)
            {
            case 0: // Playing
              smtc.PlaybackStatus(winrt::Windows::Media::MediaPlaybackStatus::Playing);
              break;
            case 1: // Paused
              smtc.PlaybackStatus(winrt::Windows::Media::MediaPlaybackStatus::Paused);
              break;
            case 2: // Stopped
            {
              smtc.PlaybackStatus(winrt::Windows::Media::MediaPlaybackStatus::Stopped);
              smtc.IsEnabled(false);
              std::lock_guard<std::mutex> artworkLock(artworkMutex);
              artworkGeneration++;
              currentArtUri.clear();
              currentThumb = nullptr;
              updater.ClearAll();
              updater.Update();
              smtc.UpdateTimelineProperties(
                  winrt::Windows::Media::SystemMediaTransportControlsTimelineProperties());
              break;
            }
            }
          }
          catch (const winrt::hresult_error& e)
          {
            std::cerr << "SMTC state update failed: " << winrt::to_string(e.message()) << std::endl;
          }
        }
        result->Success();
      }
      else
      {
        result->Error("InvalidArguments", "state is required");
      }
    }

    // Timeline (position and length) for the flyout's seek bar. Dart sends
    // this only on changes and at most every ~5 s while playing; Windows
    // moves the bar on its own in between.
    else if (method_call.method_name().compare("updateTimeline") == 0)
    {
      const auto *arguments = std::get_if<flutter::EncodableMap>(method_call.arguments());
      if (!arguments)
      {
        result->Error("InvalidArguments", "positionMs and durationMs are required");
        return;
      }
      double rate = 1.0;
      auto rateIt = arguments->find(flutter::EncodableValue("rate"));
      if (rateIt != arguments->end())
      {
        if (const auto *v = std::get_if<double>(&rateIt->second)) rate = *v;
      }
      bool seekable = true;
      auto seekIt = arguments->find(flutter::EncodableValue("seekable"));
      if (seekIt != arguments->end())
      {
        if (const auto *v = std::get_if<bool>(&seekIt->second)) seekable = *v;
      }
      UpdateTimeline(IntArg(*arguments, "positionMs", 0),
                     IntArg(*arguments, "durationMs", 0), rate, seekable);
      result->Success();
    }

    else
    {
      result->NotImplemented();
    }
  }

} // namespace audio_service_win
