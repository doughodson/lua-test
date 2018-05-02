
#include <lua.hpp>

#include "mylib.hpp"

// wrapper/binding interface

int mylib_str(lua_State* l)
{
   mylib_str();
   return 0;
}

int mylib_sin(lua_State* l)
{
   double d = luaL_checknumber(l, 1);
   lua_pushnumber(l, mylib_sin(d));
   return 1;
}

// registration code

const luaL_Reg mylib[] =
{
    { "str", mylib_str },
    { "sin", mylib_sin },
    { NULL, NULL }
};

int luaopen_mylib(lua_State* l)
{
   luaL_newlib(l, mylib);
   return 1;
}

const luaL_Reg mylibs[] = {
  {"mylib", luaopen_mylib},
  {NULL, NULL}
};

LUALIB_API void luaL_openmylibs(lua_State *L)
{
  const luaL_Reg* lib;
  /* "require" functions from 'loadedlibs' and set results to global table */
  for (lib = mylibs; lib->func; lib++) {
    luaL_requiref(L, lib->name, lib->func, 1);
    lua_pop(L, 1);  // remove lib
  }
}

