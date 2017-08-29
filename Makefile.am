
# Makfile.am
#
# This file is part of fizmo.
#
# Copyright (c) 2009-2016 Christoph Ender.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. The name of the author may not be used to endorse or promote products
#    derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


AUTOMAKE_OPTIONS = -Wno-override

localedir = $(datarootdir)/fizmo/locales

if FIZMO_DIST_BUILD
  dev_prefix=$(FIZMO_DIST_BUILD_PREFIX)
  pkg_prefix=$(FIZMO_DIST_BUILD_PREFIX)
else
  dev_prefix=$(DESTDIR)/$(prefix)
  pkg_prefix=$(prefix)
endif

pkg_dir = $(dev_prefix)/lib/pkgconfig
pkgfile = $(pkg_dir)/libsndifsdl2.pc

SUBDIRS = src/sound_sdl2 .
noinst_LIBRARIES = libsndifsdl2.a

libsndifsdl2.a::
	cd src/sound_sdl2 ; make
	mv src/sound_sdl2/libsndifsdl2.a .

# Note: When chancing Cflags or Libs below, also update "fizmo-dist"'s
# Makefile.am accordingly.

install-dev:: libsndifsdl2.a
	mkdir -p $(dev_prefix)/lib/fizmo
	cp libsndifsdl2.a $(dev_prefix)/lib/fizmo
	mkdir -p $(dev_prefix)/include/fizmo/sound_sdl2
	cp src/sound_sdl2/sound_sdl2.h \
	  $(dev_prefix)/include/fizmo/sound_sdl2
	mkdir -p $(pkg_dir)
	echo 'prefix=$(pkg_prefix)' >$(pkgfile)
	echo 'exec_prefix=$${prefix}' >>$(pkgfile)
	echo 'libdir=$${exec_prefix}/lib/fizmo' >>$(pkgfile)
	echo 'includedir=$${prefix}/include/fizmo' >>$(pkgfile)
	echo >>$(pkgfile)
	echo 'Name: libsndifsdl2' >>$(pkgfile)
	echo 'Description: libsndifsdl2' >>$(pkgfile)
	echo 'Version: 0.8.3' >>$(pkgfile)
	echo 'Requires: libfizmo >= 0.7.15, $(LIBSNDIFSDL2_REQS)' >>$(pkgfile)
	echo 'Requires.private:' >>$(pkgfile)
	echo 'Cflags: -I$(pkg_prefix)/include/fizmo $(SOUNDSDL2_NONPKG_CFLAGS)' >>$(pkgfile)
	echo 'Libs: -L$(pkg_prefix)/lib/fizmo -lsndifsdl2 $(SOUNDSDL2_PKG_LIBS)'  >>$(pkgfile)
	echo >>$(pkgfile)

install-data-local:


# About "-rmdir": make ignores errors of commands which are prefixed with
# a - sign. rmdir may fail in clean-dev in case other libs have installed
# development files, or in case clean-dev has been run before.
clean-dev::
	-rm "$(dev_prefix)/lib/fizmo/libsndifsdl2.a"
	-rmdir "$(dev_prefix)/lib/fizmo"
	-rm -rf "$(dev_prefix)/include/fizmo/sound_sdl2"
	-rmdir "$(dev_prefix)/include/fizmo"
	-rm "$(pkgfile)"

