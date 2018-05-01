Interfacing Lua with C/C++ Scratchpad
=====================================

Breeding ground for examples on how to interface C++ to Lua.  This include several read-evaluate-print loop (REPL) examples.

Directories & Examples
-------------------

* 3rdparty: contains include files and libraries for 3rd party dependencies. The lua library is compiled.

* build: run make.cmd in build/premake directory to create build files.

* docs: documentation of interest

* packages: contains related packages/libraries of interest.

Lua
---

* luac: stock lua compiler (i.e., luac) included with distribution

* mylib-dll: stock REPL that loads a shared extension library. Note: this requires the use of repl and library to be dynamically linked to lua library dll

* repl: stock REPL included with distribution

* repl-simple: simple and dumb REPL

* repl-extend: stock lua REPL with extended C++ functions. The lua REPL is compiled with C++, not C.

* test1: example of extending Lua with a C++ class using Luna

