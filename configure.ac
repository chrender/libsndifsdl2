
AC_ARG_ENABLE([tracing],
 [AS_HELP_STRING([--enable-tracing],
                 [enable tracelog for debugging])],
 [],
 [enable_tracing=no])

m4_include(config-flags.m4)

AC_INIT([libsndifsdl], [0.7.4])

libsndif_reqs="sdl"
PKG_CHECK_MODULES([libfizmo], [libfizmo >= 0.7.4])
m4_include(config-libs.m4)

AC_CONFIG_AUX_DIR([.])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC
AC_PROG_RANLIB
AM_PROG_AR

AC_SUBST([DEV_BUILD_PREFIX], "$DESTDIR$prefix")
AC_SUBST([LIBSNDIFSDL_REQS], $libsndif_reqs)

AM_CONDITIONAL([ENABLE_TRACING],
                [test "$enable_tracing" = "yes"])

m4_include(config-conds.m4)

AC_CONFIG_FILES([Makefile src/sound_sdl/Makefile])
AC_OUTPUT

