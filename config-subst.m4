
# This is included from fizmo-dist and not required by libfizmo's own
# configuration. It nevertheless needs to be maintained so fizmo-dist
# will still work.
#
# The $build_prefix, $build_prefix_cflags and $build_prefix_libs are
# pre-defined by fizmo-dist.

AC_SUBST([libsndifsdl2_CFLAGS], "-I$build_prefix_cflags $sdl2_CFLAGS $sndfile_CFLAGS")
AC_SUBST([libsndifsdl2_LIBS], "-L$build_prefix_libs -lsndifsdl2 $sdl2_LIBS $sndfile_LIBS")

AC_SUBST([SOUND_INTERFACE_NAME], libsndifsdl2)
AC_SUBST([SOUND_INTERFACE_STRUCT_NAME], sound_interface_sdl2)
AC_SUBST([SOUND_INTERFACE_CONFIGNAME], SOUNDSDL2)
AC_SUBST([SOUND_INTERFACE_INCLUDE_FILE], sound_sdl2/sound_sdl2.h)

