
#include <iostream>

class B {
public:
   B()             { std::cout << "constructor\n"; }
   B(int v) : x{v} { std::cout << "constructor with x\n"; }

   void setX(int v)   { x = v; }
   int getX()         { return x; }
   void printX()      { std::cout << "x: " << x << std::endl; }

   void release()     { delete this; }

protected:
   ~B()               { std::cout << "destructor\n"; }

private:
   int x{};
};
