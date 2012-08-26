
AM_CFLAGS = $(libfizmo_CFLAGS) $(sdl_CFLAGS) $(sndfile_CFLAGS)
AM_CPPFLAGS =
LDADD = $(libfizmo_LIBS) $(sdl_LIBS) $(sndfile_LIBS)

localedir = $(datarootdir)/fizmo/locales

noinst_LIBRARIES = libsndifsdl.a
libsndifsdl_a_SOURCES = sound_sdl.c

if ENABLE_TRACING
AM_CFLAGS += -DENABLE_TRACING=
endif

if ENABLE_AIFF
AM_CFLAGS += -DENABLE_AIFF_FOR_SOUND_SDL=
endif

