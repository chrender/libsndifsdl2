


   **Version 0.8.4 — Febuary 10, 2019**

 - Fixed crash when playing internal sound effects 1 or 2.
 - Fixed multi-second delay before a sound effect would play at all.
 - Made init\_sound accept additional parameter to simplify testing.
 - Fixed underscores in markdown files.

---


   **Version 0.8.3 — September 3, 2017**

 - Fix superfluous libraries and includes during install when using $DESTDIR, addressing github issue #21.
 - Added missing contributor phrasing to BSD-3 clause. The resulting license now exactly matches the wording used on Github and so also makes the license detection work.

---


   **Version 0.8.2 — October 8, 2016**

 - Improved build system for separate library and interface builds.

---


   **Version 0.8.1 — August 31, 2016**

 - Use tiny-xml-doc-tools for documentation.

---


   **Version 0.8.0 — October 9, 2015**

 - Implemented SDL2-compatible sound interface, forked from libsoundofsdl. Note: In case you're encountering messages from ALSA containing “snd\_pcm\_recover” and “underrun” errors, upgrade SDL2 to version 2.0.3.

---


   **Version 0.7.6 — March 19, 2014**

 - Fixed “AC\_CONFIG\_AUX\_DIR” invocation.
 - Added “clean-dev” build target for better cleanup of installed development files, which helps debian packaging.
 - Fix compiler warnings.
 - Added missing license/copyright information.

---


   **Version 0.7.5 — June 5, 2013**

 - Renamed “install-locales” to “install-data” build target.
 - Adapted to new readchar function names in file system interface.

---


   **Version 0.7.4 — December 27, 2012**

 - Minor fix for libsndifsdl build target.

---


   **Version 0.7.3 — September 17, 2012**

 - Adapted to new autoconf/automake build process.

---


   **Version 0.7.2 — March 9, 2012**

 - Fixed missing $(DESTDIR) variable – should already have been present since version 0.7.1.

---


   **Version 0.7.1 — November 6, 2011**

 - Fixed missing “override” statments for CFLAGS in Makefiles.
 - Fixed $(DESTDIR) evaluation in config.[default|macports].mk.
 - Adapted Makefiles and configuration to use standard GNU Makefile variables instead of INSTALL\_PATH and FIZMO\_BIN\_DIR.

---


   **Version 0.7.0 — September 18, 2011**

 - The “libsndifsdl” library has been taken out of fizmo version 0.6 and built to form a separate library.
 - Implemented configuration option handling.

---


   **Version 0.6.1 — March 30, 2009**

 - Implemented new ENABLE\_AIFF\_FOR\_SOUND\_SDL variable in config files. This allows the sound-sdl-interface to at least play Infocom .snd files when no libsndfile is available.

---


   **Version 0.6.0 — March 25, 2009**

 - This marks the point for the first public beta release
 - Implemented new “\*.snd” search method: Generalized for all files, not only Lurking Horror and Sherlock, tries upper- and lowercase.

---


   **Version 0.5.3 — March 11, 2009**

 - Re-built SDL-Sound system (implemented sound effect stack, better sound-has-finished-detection and many, many fixes).
 - Added support for AIFF-sounds in blorb files.

---


   **Version 0.5.1 — November 4, 2008**

 - Implemented SDL-sound-interface. To make SDL work in Mac OS X I've used MacPorts to install SDL (“port install libsdl”), on Debian I've been using “apt-get install libsdl-sound1.2-dev” (maybe “apt-get install alsa-base alsa-utils” is also required).
 - Added “snd2aiff” commandline utility (this was the basis for the first sound interface experiments).


