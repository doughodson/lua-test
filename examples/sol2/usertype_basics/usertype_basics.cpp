#define SOL_CHECK_ARGUMENTS 1
#include <sol.hpp>

#include <iostream>

struct ship {
   int bullets{20};
   int life{100};

   bool shoot () {
   	if (bullets > 0) {
      	-bullets;
         // successfully shot
			return true;
		  }
		  // cannot shoot
		  return false;
   }

   bool hurt (int by) {
      life -= by;
      // have we died?
      return life < 1;
   }
};

void usertype_basics()
{
   std::cout << "=== usertype basics ===" << std::endl;

	sol::state lua;
	lua.open_libraries(sol::lib::base);

	lua.new_usertype<ship>( "ship", // the name of the class, as you want it to be used in lua
		// List the member functions you wish to bind:
		// "name_of_item", &class_name::function_or_variable
		"shoot", &ship::shoot,
		"hurt", &ship::hurt,
		// bind variable types, too
		"life", &ship::life,
		// names in lua don't have to be the same as C++,
		// but it probably helps if they're kept the same,
		// here we change it just to show its possible
		"bullet_count", &ship::bullets
	);

/*
	const auto& code = R"(
		fwoosh = ship.new()
		-- note the ":" that is there: this is mandatory for member function calls
		-- ":" means "pass self" in Lua
		local success = fwoosh:shoot()
		local is_dead = fwoosh:hurt(20)
		-- check if it works
		print(is_dead) -- the ship is not dead at this point
		print(fwoosh.life .. " life left") -- 80 life left
		print(fwoosh.bullet_count) -- 19
	)";

	lua.script(code);
*/
   std::cout << "Leaving C++ land, off to Lua\n";

	lua.script_file("usertype_basics.lua");

	std::cout << std::endl;
}
