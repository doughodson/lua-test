
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
