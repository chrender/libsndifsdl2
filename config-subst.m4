
AS_IF([test "x$enable_sound" == "xyes"], [
  AC_SUBST([SOUND_INTERFACE_NAME], libsndifsdl2)
  AC_SUBST([SOUND_INTERFACE_STRUCT_NAME], sound_interface_sdl2)
  AC_SUBST([SOUND_INTERFACE_CONFIGNAME], SOUNDSDL2)
  AC_SUBST([SOUND_INTERFACE_INCLUDE_FILE], sound_sdl2/sound_sdl2.h)
])
