#define SOL_CHECK_ARGUMENTS 1
#include <sol.hpp>

#include <iostream>

#include "A.hpp"
#include "B.hpp"

void garbage_collection()
{
   std::cout << "=== garbage collection ===" << std::endl;

	sol::state lua;
	lua.open_libraries(sol::lib::base);

	lua.new_usertype<A>( "A", // the name of the class, as you want it to be used in lua
        // 2 constructors
        sol::constructors<A(), A(), A(int)>(),

		// List the member functions you wish to bind:
		// "name_of_item", &class_name::function_or_variable
		"setX", &A::setX,
		"getX", &A::getX
	);

   std::cout << "Leaving C++ land, off to Lua\n";

   lua.script_file("garbage_collection.lua");

   std::cout << "Script done, back to C++\n";

   lua.collect_garbage();
   std::cout << "Just collected garbage\n";

	std::cout << "Creating b1 object" << std::endl;
   B* b1 = new B;
	std::cout << "Releasing b1 object" << std::endl;
   b1->release();

	std::cout << std::endl;

}
