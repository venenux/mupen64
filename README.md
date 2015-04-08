# mupen64

A nintendo ultra64 emulator for venenux under older machines and low end performace computers.

**This its only for able to use the emulator on older hardware, not for made support on it!**

old emulator for older machines, due mupen64plus does'n compile in older machines, if when compile, runs slow

Please help to made this emulator work in older machines, we need C skills!!!

## code bug or clean?

* the code here has some fixeds to able to build under certain distro, with gcc 4.2-4.4
* support improvements to made able to ini with defaults config files (pending)
* set plugin dir to <PREFIX>/lib/mupen64/plugins (pending)
* let the data dir to  <PREFIX>/share/mupen64/plugins but only for files and configs
* fixed compilation problems with reserved words in gcc, and support as need linking (pending)

## status:

* work supenmario64 with soft gfx plugin very good using pure interpreter and dinamic recompiler.
* pending made workaround due mesa bug in opengl mode for gln64 and rice plugins.

## Release:

currently only bugfix test release as  0.5.1

### Changelog

* Fix command line arguments parsing in non-interactive mode
* fix compilation with gcc 4.1, 4.3, 4.4 and 4.6, does not able to compile with 4.7+
* really stop when closing emulation window in graphical interface (no rom still opened)
* no segfault when closing emulation window in graphical interface if open other rom
* change toggle fulscreen as ALT+ENTER event the F1 as now in desktop help call
* workaround for audio config save settings bug
* install plguins into lib depend dirs, install in share only indep files if multiuser mode
* fix SDL_ttf error builds and linker
* fix memory register error when compiling with newer gcc, register has rewerved word
* Can load plugins from others, but compatible with old versino of mupen64
* Can load plugins of other emulators (0.4 > mupen64 > 0.5 or mupen64plus << 1.6)

