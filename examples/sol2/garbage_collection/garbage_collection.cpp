#define SOL_CHECK_ARGUMENTS 1
#include <sol.hpp>

#include <iostream>

class A {
public:
   A()             { std::cout << "constructor\n"; }
   A(int v) : x{v} { std::cout << "constructor with x\n"; }
   ~A()            { std::cout << "destructor\n"; }

   void setX(int v)   { x = v; }
   int getX()         { return x; }
   void printX()      { std::cout << "x: " << x << std::endl; }

private:
   int x{};
};

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

   std::cout << std::endl;
}
