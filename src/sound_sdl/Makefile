
include ../../config.mk

# "-std=c99" is required to avoid trouble with the built-in round function.
CFLAGS += -std=c99

ifneq ($(ENABLE_TRACING),)
CFLAGS += -DENABLE_TRACING=
endif

ifneq ($(ENABLE_OPTIMIZATION),)
CFLAGS += -O2
endif

ifneq ($(ENABLE_AIFF_FOR_SOUND_SDL),)
CFLAGS += -DENABLE_AIFF_FOR_SOUND_SDL=
endif

ifneq ($(ENABLE_GDB_SYMBOLS),)
override CFLAGS += -g
endif

INC_DIRS = -I$(SDL_INC_DIR) -I$(SDL_INC_DIR)/SDL -I$(FIZMO_INC_DIR)

ifneq ($(SNDFILE_INC_DIR),)
INC_DIRS += -I$(SNDFILE_INC_DIR)
endif

.PHONY : all clean

all: libsndifsdl.a

libsndifsdl.a: sound_sdl.o
	$(AR) rcs libsndifsdl.a sound_sdl.o


sound_sdl.o: sound_sdl.c
	$(CC) $(CFLAGS) $(INC_DIRS) -c sound_sdl.c

clean:
	rm -f *.o

distclean: clean
	rm -f libsndifsdl.a

