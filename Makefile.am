
AUTOMAKE_OPTIONS = -Wno-override

localedir = $(datarootdir)/fizmo/locales

fizmo_build_prefix=$(DEV_BUILD_PREFIX)

PKG_DIR = $(fizmo_build_prefix)/lib/pkgconfig
PKGFILE = $(PKG_DIR)/libsndifsdl.pc

SUBDIRS = src/sound_sdl .
noinst_LIBRARIES = libsndifsdl.a

libsndifsdl.a:
	cd src/sound_sdl ; make
	mv src/sound_sdl/libsndifsdl.a .

install-dev:: libsndifsdl.a
	mkdir -p $(fizmo_build_prefix)/lib/fizmo
	cp libsndifsdl.a $(fizmo_build_prefix)/lib/fizmo
	mkdir -p $(fizmo_build_prefix)/include/fizmo/sound_sdl
	cp src/sound_sdl/sound_sdl.h \
	  $(fizmo_build_prefix)/include/fizmo/sound_sdl
	mkdir -p $(PKG_DIR)
	echo 'prefix=$(fizmo_build_prefix)' >$(PKGFILE)
	echo 'exec_prefix=$${prefix}' >>$(PKGFILE)
	echo 'libdir=$${exec_prefix}/lib/fizmo' >>$(PKGFILE)
	echo 'includedir=$${prefix}/include/fizmo' >>$(PKGFILE)
	echo >>$(PKGFILE)
	echo 'Name: libsndifsdl' >>$(PKGFILE)
	echo 'Description: libsndifsdl' >>$(PKGFILE)
	echo 'Version: 0.7.3' >>$(PKGFILE)
	echo 'Requires: libfizmo >= 0.7.4, $(LIBSNDIFSDL_REQS)' >>$(PKGFILE)
	echo 'Requires.private:' >>$(PKGFILE)
	echo 'Cflags: -I$(fizmo_build_prefix)/include/fizmo $(SOUNDSDL_NONPKG_CFLAGS)' >>$(PKGFILE)
	echo 'Libs: -L$(fizmo_build_prefix)/lib/fizmo -lsndifsdl $(SOUNDSDL_PKG_LIBS)'  >>$(PKGFILE)
	echo >>$(PKGFILE)

install-locales:


