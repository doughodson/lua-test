
#define SOL_CHECK_ARGUMENTS 1
#include <sol.hpp>

#include <tuple>
#include <utility>     // for std::pair

#include "assert.hpp"

void test2_variables()
{
   sol::state lua;
   lua.script_file("test2_variables.lua");
   // the type "sol::state" behaves 
   // exactly like a table!
   bool isfullscreen = lua["config"]["fullscreen"]; // can get nested variables
   sol::table config = lua["config"];
   c_assert(isfullscreen);
}
