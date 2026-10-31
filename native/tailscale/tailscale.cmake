# Built-in Tailscale (fork prototype): builds absorb_tailscale.dll (Windows) or
# libabsorb_tailscale.so (Linux) from this Go module and installs it beside
# the app. Included from windows/CMakeLists.txt and linux/CMakeLists.txt after
# INSTALL_BUNDLE_LIB_DIR is set.
#
# Needs Go (go.mod's version or newer; Go fetches it) and a C compiler for
# cgo: MinGW-w64 gcc on Windows (MSVC can't build Go), the system gcc/cc on
# Linux. When either is missing the app still builds, without the library,
# and Settings shows the option as not included. -DABSORB_TAILSCALE=OFF skips
# it on purpose.
option(ABSORB_TAILSCALE "Build the built-in Tailscale library" ON)
if(NOT ABSORB_TAILSCALE)
  return()
endif()

set(_ts_dir "${CMAKE_CURRENT_LIST_DIR}")
find_program(ABSORB_GO go HINTS "$ENV{GOROOT}/bin" "C:/Program Files/Go/bin" "/usr/local/go/bin")
if(WIN32)
  set(_ts_name "absorb_tailscale.dll")
  find_program(ABSORB_GO_CC NAMES x86_64-w64-mingw32-gcc gcc
    HINTS "$ENV{ABSORB_MINGW_BIN}" "C:/msys64/mingw64/bin" "C:/msys64/ucrt64/bin"
          "C:/mingw64/bin" "C:/ProgramData/mingw64/mingw64/bin"
    NO_DEFAULT_PATH)
  if(NOT ABSORB_GO_CC)
    find_program(ABSORB_GO_CC NAMES x86_64-w64-mingw32-gcc gcc)
  endif()
else()
  set(_ts_name "libabsorb_tailscale.so")
  find_program(ABSORB_GO_CC NAMES gcc cc)
endif()

if(NOT ABSORB_GO OR NOT ABSORB_GO_CC)
  message(WARNING "Built-in Tailscale skipped: Go (${ABSORB_GO}) or a cgo C compiler (${ABSORB_GO_CC}) not found.")
  return()
endif()

set(_ts_out "${CMAKE_BINARY_DIR}/absorb_tailscale/${_ts_name}")
file(GLOB _ts_sources CONFIGURE_DEPENDS "${_ts_dir}/*.go")
add_custom_command(
  OUTPUT "${_ts_out}"
  COMMAND "${CMAKE_COMMAND}" "-DGO=${ABSORB_GO}" "-DCC=${ABSORB_GO_CC}"
          "-DOUT=${_ts_out}" -P "${_ts_dir}/build_go.cmake"
  DEPENDS ${_ts_sources} "${_ts_dir}/go.mod" "${_ts_dir}/go.sum"
          "${_ts_dir}/build-tags.txt" "${_ts_dir}/build_go.cmake"
  COMMENT "Building the built-in Tailscale library (Go)"
  VERBATIM)
add_custom_target(absorb_tailscale ALL DEPENDS "${_ts_out}")
add_dependencies(${BINARY_NAME} absorb_tailscale)
install(FILES "${_ts_out}" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}" COMPONENT Runtime)
