
// C headers
extern "C"
{
#include "lua.h"
#include "lauxlib.h"
};

#include <iostream>
#include <cmath>

// functions

static int mylib_str(lua_State* l)
{
  std::cout << "This is a string from C++ function\n";
  return 0;
}

static int mylib_sin(lua_State* l)
{
   double d = luaL_checknumber(l, 1);
   lua_pushnumber(l, std::sin(d));
   return 1;
}

// function registration info

static const luaL_Reg mylib[] =
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
