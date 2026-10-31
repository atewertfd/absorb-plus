# Script mode: cmake -DGO=<go> -DCC=<c compiler> -DOUT=<library path> -P build_go.cmake
# Builds the Go module in this folder as a C shared library. Run by
# tailscale.cmake during `flutter build windows|linux`; usable by hand too.
cmake_minimum_required(VERSION 3.14)

if(NOT GO OR NOT CC OR NOT OUT)
  message(FATAL_ERROR "build_go.cmake needs -DGO, -DCC and -DOUT")
endif()

get_filename_component(_src "${CMAKE_CURRENT_LIST_DIR}" ABSOLUTE)
file(READ "${_src}/build-tags.txt" _tags)
string(STRIP "${_tags}" _tags)
string(REPLACE " " "," _tags "${_tags}")
string(REPLACE "\n" "," _tags "${_tags}")

# MinGW's cc1 finds its own DLLs through PATH.
get_filename_component(_cc_dir "${CC}" DIRECTORY)
if(WIN32)
  set(ENV{PATH} "${_cc_dir};$ENV{PATH}")
else()
  set(ENV{PATH} "${_cc_dir}:$ENV{PATH}")
endif()
set(ENV{CGO_ENABLED} "1")
set(ENV{CC} "${CC}")
# Never let a stray GOOS/GOARCH from the environment cross-compile this.
unset(ENV{GOOS})
unset(ENV{GOARCH})

execute_process(
  COMMAND "${GO}" build -buildmode=c-shared -trimpath -mod=readonly
          -tags "${_tags}" -ldflags "-s -w" -o "${OUT}" .
  WORKING_DIRECTORY "${_src}"
  RESULT_VARIABLE _rc)
if(NOT _rc EQUAL 0)
  message(FATAL_ERROR "go build of the built-in Tailscale library failed (${_rc})")
endif()
