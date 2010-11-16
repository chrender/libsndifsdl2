
# Please read "INSTALL.txt" before modifying these values.

CC = gcc
AR = ar
CFLAGS = -Wall -Wextra

ifneq ($(DESTDIR),)
INSTALL_PREFIX = $(DESTDIR)
else
#INSTALL_PREFIX = /usr/local
INSTALL_PREFIX = $(HOME)/opt/fizmo
endif

DEFAULT_PREFIX = /usr
DEFAULT_LIB_PREFIX = $(DEFAULT_PREFIX)/lib
DEFAULT_INC_PREFIX = $(DEFAULT_PREFIX)/include

FIZMO_INC_DIR = $(INSTALL_PREFIX)/include
FIZMO_LIB_DIR = $(INSTALL_PREFIX)/lib

SDL_INC_DIR = $(DEFAULT_INC_PREFIX)
SDL_LIB_DIR = $(DEFAULT_LIB_PREFIX)

# These lines are used for providing extra lib (dirs), currently used
# for Mac OS.
EXTRA_LIB_DIRS =
EXTRA_LIBS =

# If you have libsndfile available, fizmo will be able to read AIFF from
# blorbs:
ENABLE_AIFF_FOR_SOUND_SDL = 1
SNDFILE_INC_DIR = $(DEFAULT_INC_PREFIX)
SNDFILE_LIB_DIR = $(DEFAULT_LIB_PREFIX)

# These lines are used for providing extra lib (dirs), used for Mac OS.
EXTRA_LIB_DIRS =
EXTRA_LIBS =

# This adds an -O2 flag (usually okay):
ENABLE_OPTIMIZATION = 1

# Debug-Flags:

# Uncomment to fill your harddisk _very_ fast:
#ENABLE_TRACING = 1

# Add GDB symbols, only useful for debuggong:
#ENABLE_GDB_SYMBOLS = 1

