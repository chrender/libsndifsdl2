
# Please read "INSTALL.txt" before modifying these values.

CC = gcc
AR = ar
override CFLAGS += -Wall -Wextra

prefix = /usr/local
bindir = $(prefix)/bin
datarootdir = $(prefix)/share
mandir = $(datarootdir)/man
localedir = $(datarootdir)/fizmo/locales


# -----
# General settings:
ENABLE_OPTIMIZATION = 1
#ENABLE_TRACING = 1
#ENABLE_GDB_SYMBOLS = 1
# -----



# -----
# Setting for sound-sdl:
ENABLE_AIFF_FOR_SOUND_SDL = 1

# If the "sdl" and "sndfile" packages may be found using the commands
#"pkg-config --modversion sdl" and "pkg-config --modversion sndfile", fizmo
# will automatically locate the required files using the following lines:
SOUNDSDL_PKG_REQS = sdl, sndfile
SOUNDSDL_PKG_CFLAGS = $(shell pkg-config --cflags sdl) \
                       $(shell pkg-config --cflags sndfile)
SOUNDSDL_PKG_LIBS = $(shell pkg-config --libs sdl) \
                       $(shell pkg-config --libs-sndfile)

# If either "sdl" or "sndfile" cannot be found using pkg-config, you have
# to provide the required flags in the following two lines:
SOUNDSDL_NONPKG_CFLAGS =
SOUNDSDL_PKG_LIBS =

# The "sound-sdl" modules always requires "sdl" to work. In case "sndfile"
# is not available, you can still compile it if ENABLE_AIFF_FOR_SOUND_SDL
# is disabled above.
# -----

