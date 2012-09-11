
PKG_CHECK_MODULES([sdl], [sdl])
AS_IF([test "x$enable_aiff" != "xno"], [
  PKG_CHECK_MODULES([sndfile], [sndfile])
  libsndif_reqs+=", sndfile"
])

