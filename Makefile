
.PHONY : all install clean distclean

include config.mk

PKG_DIR = $(INSTALL_PREFIX)/lib/pkgconfig
PKGFILE = $(PKG_DIR)/libsndifsdl.pc


all: libsndifsdl.a

libsndifsdl.a: src/sound_sdl/libsndifsdl.a
	mv src/sound_sdl/libsndifsdl.a .

src/sound_sdl/libsndifsdl.a::
	cd src/sound_sdl; make

install: src/sound_sdl/libsndifsdl.a
	mkdir -p $(INSTALL_PREFIX)/lib/fizmo
	cp src/sound_sdl/libsndifsdl.a $(INSTALL_PREFIX)/lib/fizmo
	mkdir -p $(INSTALL_PREFIX)/include/fizmo/sound_sdl
	cp src/sound_sdl/sound_sdl.h $(INSTALL_PREFIX)/include/fizmo/sound_sdl
	mkdir -p $(PKG_DIR)
	echo 'prefix=$(INSTALL_PREFIX)' >$(PKGFILE)
	echo 'exec_prefix=$${prefix}' >>$(PKGFILE)
	echo 'libdir=$${exec_prefix}/lib/fizmo' >>$(PKGFILE)
	echo 'includedir=$${prefix}/include/fizmo' >>$(PKGFILE)
	echo >>$(PKGFILE)
	echo 'Name: libsndifsdl' >>$(PKGFILE)
	echo 'Description: libsndifsdl' >>$(PKGFILE)
	echo 'Version: 0.7.0-b2' >>$(PKGFILE)
ifeq ($(SOUNDSDL_PKG_REQS),)
	echo 'Requires: libfizmo >= 0.7' >>$(PKGFILE)
else
	echo 'Requires: libfizmo >= 0.7, $(SOUNDSDL_PKG_REQS)' >>$(PKGFILE)
endif
	echo 'Requires.private:' >>$(PKGFILE)
	echo 'Cflags: -I$(INSTALL_PREFIX)/include/fizmo $(SOUNDSDL_NONPKG_CFLAGS)' >>$(PKGFILE)
	echo 'Libs: -L$(INSTALL_PREFIX)/lib/fizmo -lsndifsdl $(SOUNDSDL_PKG_LIBS)'  >>$(PKGFILE)
	echo >>$(PKGFILE)

clean::
	cd src/sound_sdl ; make clean

distclean:: clean
	rm -f libsndifsdl.a
	cd src/sound_sdl; make distclean

