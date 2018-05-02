
#ifndef __mylib_HPP__
#define __mylib_HPP__

#include <lua.hpp>

int luaopen_mylib(lua_State*);   // used to bind library with lua

static const luaL_Reg mylibs[] = {
  {"mylib", luaopen_mylib},
  {NULL, NULL}
};

LUALIB_API void luaL_openmylibs (lua_State *L) {
  const luaL_Reg *lib;
  /* "require" functions from 'loadedlibs' and set results to global table */
  for (lib = mylibs; lib->func; lib++) {
    luaL_requiref(L, lib->name, lib->func, 1);
    lua_pop(L, 1);  /* remove lib */
  }
}

#endif
