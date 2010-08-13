
# Please read "INSTALL.txt" before modifying these values.

CC = gcc
AR = ar
CFLAGS = -Wall -Wextra

INSTALL_PREFIX = $(DESTDIR)/usr

# If defined, install goes to "$(INSTALL_PREFIX)/($FIZMO_BIN_DIR)" instead of
# "(INSTALL_PREFIX)/games" (usually use to subsitute "bin" for "games").
#FIZMO_BIN_DIR = games

DEFAULT_PREFIX = /usr
DEFAULT_LIB_PREFIX = $(DEFAULT_PREFIX)/lib
DEFAULT_INC_PREFIX = $(DEFAULT_PREFIX)/include

SDL_INC_DIR = $(DEFAULT_INC_PREFIX)
SDL_LIB_DIR = $(DEFAULT_LIB_PREFIX)

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

# If you're building a "dumb" interface like the CGI-interface (this
# runs the minizork-demo on the webpage, take a look at src/cgi) you
# may want to save memory and cpu by uncommenting the following lines:
#DISABLE_BLOCKBUFFER = 1
#DISABLE_COMMAND_HISTORY = 1
#DISABLE_OUTPUT_HISTORY = 1


# Debug-Flags:

# Uncomment to fill your harddisk _very_ fast:
#ENABLE_TRACING = 1

# Used for the strictz-test:
#ENABLE_STRICT_Z = 1

# Add GDB symbols, only useful for debuggong:
#ENABLE_GDB_SYMBOLS = 1

# Throws sigfault on error for emergency backtrace (usually never needed):
#THROW_SIGFAULT_ON_ERROR = 1

