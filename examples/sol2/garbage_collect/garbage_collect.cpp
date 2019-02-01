#define SOL_CHECK_ARGUMENTS 1
#include <sol.hpp>
#include <assert.hpp>

#include <memory>
#include <iostream>

#include "A.hpp"
#include "B.hpp"

struct deleter {
	void operator()(B* b) const { b->release(); }
};

static std::unique_ptr<B, deleter> create() {
	std::cout << "creating 'B' unique_ptr directly and letting sol/Lua handle it" << std::endl;
	return std::unique_ptr<B, deleter>(new B());
}

static void destroy(B& memory_from_lua) {
	std::cout << "destroying 'B' userdata at " << static_cast<void*>(&memory_from_lua) << std::endl;
   memory_from_lua.release();
}

void garbage_collect()
{
   std::cout << "=== garbage collect ===" << std::endl;

	sol::state lua;
   lua.open_libraries(sol::lib::base);

	lua.new_usertype<A>("A", // the name of the class, as you want it to be used in lua
        // 2 constructors
        sol::constructors<A(), A(), A(int)>(),

		// List the member functions you wish to bind:
		// "name_of_item", &class_name::function_or_variable
		"setX", &A::setX,
		"getX", &A::getX,
      "printX", &A::printX
	);

	lua.new_usertype<B>("B", // the name of the class, as you want it to be used in lua
      "new", sol::no_constructor,
		"create", sol::factories(&create),
//      sol::meta_function::garbage_collect, sol::destructor(&destroy),
		sol::meta_function::garbage_collect, sol::destructor([](B&){}),

		// List the member functions you wish to bind:
		// "name_of_item", &class_name::function_or_variable
		"setX", &B::setX,
		"getX", &B::getX,
		"printX", &B::printX
	);

   std::cout << "Leaving C++ land, off to Lua\n";

   lua.script_file("garbage_collect.lua");

   std::cout << "Script done, back to C++\n";

//   lua.collect_garbage();
//   std::cout << "Just collected garbage\n";

//	std::cout << "== Creating b2 object" << std::endl;
//   B* b2 = new B;
//   std::cout << "== Releasing b2 object" << std::endl;
//   b2->release();

	std::cout << std::endl;

}
