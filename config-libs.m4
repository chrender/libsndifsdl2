
PKG_CHECK_MODULES([sdl2], [sdl2])
AS_IF([test "x$enable_aiff" != "xno"], [
  PKG_CHECK_MODULES([sndfile], [sndfile])
  libsndif_reqs+=", sndfile"
])

