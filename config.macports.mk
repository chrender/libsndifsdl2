
CC = gcc
AR = ar
CFLAGS = -Wall -Wextra

ifneq ($(DESTDIR),)
INSTALL_PREFIX = $(DESTDIR)
else
#INSTALL_PREFIX = /usr/local
INSTALL_PREFIX = $(HOME)/opt/fizmo
endif


# General:
ENABLE_OPTIMIZATION = 1
ENABLE_TRACING = 1
#ENABLE_GDB_SYMBOLS = 1


# sound-sdl:
ENABLE_AIFF_FOR_SOUND_SDL = 1
SOUNDSDL_PKG_REQS = sdl, sndfile
SOUNDSDL_PKG_CFLAGS = $(shell pkg-config --cflags sdl) $(shell pkg-config --cflags sndfile)
SOUNDSDL_PKG_LIBS = $(shell pkg-config --libs sdl) $(shell pkg-config --libs-sndfile)
SOUNDSDL_NONPKG_CFLAGS =
SOUNDSDL_PKG_LIBS =

