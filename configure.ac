
AC_ARG_ENABLE([tracing],
 [AS_HELP_STRING([--enable-tracing],
                 [enable tracelog for debugging])],
 [],
 [enable_tracing=no])

AC_ARG_ENABLE([aiff],
 [AS_HELP_STRING([--disable-aiff],
                 [disable AIFF compatibility in case libsndfile is not \
                 available])],
 [],
 [enable_aiff=yes])


AC_INIT([libsndifsdl], [0.7.4])

libsndif_reqs="sdl"
PKG_CHECK_MODULES([libfizmo], [libfizmo >= 0.7.4])
PKG_CHECK_MODULES([sdl], [sdl])
AS_IF([test "x$enable_aiff" != "xno"], [
  PKG_CHECK_MODULES([sndfile], [sndfile])
  libsndif_reqs+=", sndfile"
])

AC_CONFIG_AUX_DIR([.])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC
AC_PROG_RANLIB
AM_PROG_AR

AM_CONDITIONAL([FIZMO_BUILD_PREFIX_EMPTY], [test "$fizmo_build_prefix" = ""])

AC_SUBST([LIBSNDIFSDL_REQS], $libsndif_reqs)

AM_CONDITIONAL([ENABLE_TRACING],
                [test "$enable_tracing" = "yes"])

AM_CONDITIONAL([ENABLE_AIFF],
                [test "$enable_aiff" != "no"])

AC_CONFIG_FILES([Makefile src/sound_sdl/Makefile])
AC_OUTPUT

