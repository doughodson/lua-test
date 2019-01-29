
#include <sol.hpp>
#include <iostream>

extern "C" {
#include "mysin.h"
}

void test2()
{
   std::cout << "Lua integration test 2\n";
   std::cout << "----------------------\n";

   sol::state lua;
   // open std lua libraries
   lua.open_libraries(sol::lib::base);
   // register the C function
   lua["mysin"] = mysin;
   // try it directly
   lua.script("print(mysin(23))");
   // try it by calling a script
   lua.script_file("test2.lua");
}

