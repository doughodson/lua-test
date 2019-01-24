
#include <sol.hpp>

extern "C" {
#include "mysin.h"
}


int main(int argc, char* argv[])
{
   sol::state lua;
   // open std lua libraries
   lua.open_libraries(sol::lib::base);
   // register the C function
   lua["mysin"] = mysin;
   // try it directly
   lua.script("print(mysin(23))");
   // try it by calling a script
   lua.script_file("test.lua");

   return 0;
}
