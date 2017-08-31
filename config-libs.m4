
PKG_CHECK_MODULES(
  [libsdl2],
  [sdl2],
  [AS_IF([test "x$libsndifsdl2_reqs" != "x"], [
     libsndifsdl2_reqs+=", "
   ])
   libsndifsdl2_reqs+="sdl2"])

AS_IF([test "x$enable_aiff" != "xno"], [
  PKG_CHECK_MODULES(
    [libsndfile],
    [sndfile],
    [AS_IF([test "x$libsndifsdl2_reqs" != "x"], [
       libsndifsdl2_reqs+=", "
     ])
     libsndifsdl2_reqs+="sndfile"])
])

