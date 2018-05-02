
#include <stdio.h>
#include <string.h>

extern "C" {
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
}


//---------------------------------------------------------------------------------
// Additions to stock REPL to extend
//---------------------------------------------------------------------------------
#include <lua.hpp>

extern int luaopen_mylib(lua_State*);   // used to bind library with lua

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

//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------

int main()
{
   char buff[256];
   int error;
   lua_State* L = luaL_newstate();
   luaL_openlibs(L);
   // register builtin funcs with this instance of state
   luaL_openmylibs(L);

   while(fgets(buff, sizeof(buff), stdin) != NULL) {
      error = luaL_loadstring(L, buff) || lua_pcall(L, 0, 0, 0);
      if (error) {
         fprintf(stderr, "%s\n", lua_tostring(L, -1));
         lua_pop(L, 1);
      }
   }
   lua_close(L);
   return 0;
}
