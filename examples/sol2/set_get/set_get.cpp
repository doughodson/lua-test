
#define SOL_CHECK_ARGUMENTS 1
#include <sol.hpp>
#include <assert.hpp>

#include <iostream>
#include <string>

void set_get()
{
   std::cout << "=== set_get variables ===" << std::endl;

   sol::state lua;
   lua.open_libraries(sol::lib::base);

   lua.set("number", 24);
   lua["number2"] = 24.5;
   lua["important_string"] = "woof woof";
   lua["a_function"] = [](){ return 100; };

   lua.script(R"(
      print("From LUA!")
		assert(number)
		assert(number2)
		assert(important_string)
		assert(a_function())
      print(number)
      print(number2)
      print(important_string)
      print(a_function())
	)");

   std::cout << "From C++\n";
   std::cout << "number           : " << lua.get<int>("number") << std::endl;
   std::cout << "number2          : " << lua.get<double>("number2") << std::endl;
   std::cout << "important string : " << lua.get<std::string>("important_string") << std::endl;

}
