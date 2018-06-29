
#include <iostream>
#include <cstdlib>
#include <string>

#include <stdio.h>
#include <string.h>

extern "C" {
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
}

#include "mylib.hpp"
#include "mylib_bindings.hpp"

void test()
{
   std::cout << "Starting built-in test\n";

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
   return;
}

void printUsageInfo()
{
   std::cout << "Usage: app1 [OPTION] [VALUE]\n";
   std::cout << "Computes the sin of a specified value\n";
   std::cout << "Options: --test : start interative test mode\n";
}

int main(int argc, char* argv[])
{
   if (argc < 2) {
      printUsageInfo();
      return 0;
   }

   std::string arg1{argv[1]};
   std::cout << "arg1 : " << arg1 << std::endl;

   if (arg1 == "--test") {
      test();
      return 0;
   }

   double value{std::atof(argv[1])};

   std::cout << "value = " << mylib_sin(value) << std::endl;

   return 0;
}
