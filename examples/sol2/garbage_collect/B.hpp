
#include <iostream>

class B {
public:
   B()             { std::cout << "B constructor\n"; }
   B(int v) : x{v} { std::cout << "B constructor with x\n"; }

   void setX(int v)   { x = v; }
   int getX()         { return x; }
   void printX()      { std::cout << "x: " << x << std::endl; }

   void release()     { delete this; }

protected:
   ~B()               { std::cout << "B destructor\n"; }

private:
   int x{};
};
