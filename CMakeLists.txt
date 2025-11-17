
#[[

  CMakeLists.txt

  This file is part of fizmo.

  ---

  Copyright (c) 2010-2025 Christoph Ender.
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:
  1. Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.
  2. Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution.
  3. Neither the name of the copyright holder nor the names of its
  contributors may be used to endorse or promote products derived
  from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

  ---

  This is libsndifsdl2's main buildfile.

  Compile-time options are described individually below.

]]


cmake_minimum_required(VERSION 3.10)


project(libsndifsdl2
  LANGUAGES C
  HOMEPAGE_URL https://fizmo.spellbreaker.org
  DESCRIPTION "fizmo interpreter SDL sound library"
  VERSION 0.9.0)


# Don't prepend libname with "lib". This will make it possible to use the
# name defined in project() above via "${PROJECT_NAME}" without having
# to alternate between "libsndifsdl2" and "sndifsdl" in various
# statements. Furthermore, it will allow distinguishing between "libfizmo"
# and "fizmo" projects and have "CMAKE_STATIC_LIBRARY_PREFIX" set to the
# same value in all fizmo-related projects.
set(CMAKE_STATIC_LIBRARY_PREFIX "")


# Create position-independent code.
set(CMAKE_POSITION_INDEPENDENT_CODE ON)


find_package(PkgConfig REQUIRED)


set(required_pkg_libs)

# We need libfizmo >= 0.9.
pkg_check_modules(LIBFIZMO REQUIRED libfizmo>=0.8.0)
list(APPEND required_pkg_libs "libfizmo >= 0.8.0")


pkg_check_modules(SDL2 REQUIRED sdl2)
list(APPEND required_pkg_libs "sdl2")


# Enabling tracing will cause fizmo to write a really, really large amount
# of debug data to disk while running. Furthermore, after every single
# write, fizmo will invoke an fsync(), meaning that performance will
# quite suffer. This is only useful for debugging and should be disabled
# in all other cases.
option(ENABLE_TRACING "Enable tracing" OFF)
if (ENABLE_TRACING)
  add_definitions(-DENABLE_TRACING)
endif()


# ...
option(ENABLE_AIFF "Enable AIFF" ON)
if (ENABLE_AIFF)
  add_definitions(-DENABLE_AIFF_FOR_SOUND_SDL2)
  pkg_check_modules(LIBSNDFILE REQUIRED sndfile)
  list(APPEND required_pkg_libs "sndfile")
endif()


# In case of a distribution build, this should be set to fizmo's main
# version number, so it's possible to distinguish libfizmo's version
# from the main fizmo version.
option(FIZMO_DIST_VERSION "Set fizmo-dist version" OFF)
if (FIZMO_DIST_VERSION)
  add_definitions(-DFIZMO_DIST_VERSION=${FIZMO_DIST_VERSION})
endif()


# Store filenames of all files-to-be-compiled in "C_FILES".
set (c_sources
  src/sound_sdl2/sound_sdl2.c)


# Tell CMake we'd like to create a library named "libsndifsdl2" with the
# given ".c" files.
add_library(libsndifsdl2 ${c_sources})

target_include_directories(libsndifsdl2 PUBLIC
  ${LIBFIZMO_INCLUDE_DIRS}
  ${LIBSNDFILE_INCLUDE_DIRS}
  ${SDL2_INCLUDE_DIRS})


#install(TARGETS libsndifsdl2)
# PUBLIC_HEADER cannot be used for TARGETS fizmo, since it doesn't keep
# the directory tree and installs all *.h flat into "include/". So:
install(DIRECTORY "${PROJECT_SOURCE_DIR}/src/" # source directory
  DESTINATION "include" # target directory
  FILES_MATCHING # install only matched files
  PATTERN "*.h" # select header files
)


install(TARGETS libsndifsdl2)

set(pc_libs_private)
set(pc_req_private)
string(REPLACE ";" " " pc_req_public "${required_pkg_libs}")
configure_file(src/libsndifsdl2.pc.in libsndifsdl2.pc @ONLY)


install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc
  DESTINATION "lib/pkgconfig")

