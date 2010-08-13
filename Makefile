
.PHONY : all install clean distclean

include config.mk

all: src/sound_sdl/libsndifsdl.a libsndifsdl.mk

src/sound_sdl/libsndifsdl.a::
	cd src/sound_sdl; make

install: src/sound_sdl/libsndifsdl.a libsndifsdl.mk
	mkdir -p $(INSTALL_PREFIX)/lib/fizmo
	cp src/sound_sdl/libsndifsdl.a $(INSTALL_PREFIX)/lib/fizmo
	cp libsndifsdl.mk $(INSTALL_PREFIX)/include/fizmo
	mkdir -p $(INSTALL_PREFIX)/include/fizmo/sound_sdl
	cp src/sound_sdl/sound_sdl.h $(INSTALL_PREFIX)/include/fizmo/sound_sdl

clean::
	cd src/sound_sdl ; make clean

distclean:: clean
	rm libsndifsdl.mk
	cd src/sound_sdl; make distclean

libsndifsdl.mk::
	echo > libsndifsdl.mk
	echo SOUND_INTERFACE_CFLAGS = -D_GNU_SOURCE=1 -D_THREAD_SAFE >> libsndifsdl.mk
	echo SOUND_INTERFACE_LIBS = -lSDLmain -lSDL -lsndifsdl >> libsndifsdl.mk
	echo >> libsndifsdl.mk
	echo SOUND_INTERFACE_LIB_DIRS = -L$(SDL_LIB_DIR) >> libsndifsdl.mk
	echo >> libsndifsdl.mk
	echo SOUND_INTERFACE_STRUCT_NAME = sound_interface_sdl >> libsndifsdl.mk
	echo SOUND_INTERFACE_INCLUDE_FILE = sound_sdl/sound_sdl.h >> libsndifsdl.mk
	echo >> libsndifsdl.mk
ifneq ($(SNDFILE_LIB_DIR),)
	echo SOUND_INTERFACE_LIB_DIRS += -L$(SNDFILE_LIB_DIR) >> libsndifsdl.mk
	echo SOUND_INTERFACE_LIBS += -lsndfile >> libsndifsdl.mk
	echo >> libsndifsdl.mk
endif

# Include Lib-Dir from Macports:
ifneq ($(EXTRA_LIB_DIRS),)
	echo SOUND_INTERFACE_LIB_DIRS += $(EXTRA_LIB_DIRS) >> libsndifsdl.mk
endif
ifneq ($(EXTRA_LIBS),)
	echo SOUND_INTERFACE_LIBS += $(EXTRA_LIBS) >> libsndifsdl.mk
endif
	echo >> libsndifsdl.mk

