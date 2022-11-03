#include <iostream>

#include "foo.h"


int main(int argc, char** argv)
{

    std::cout << "cmake-lib-example" << std::endl;
    Foo foo{};
    foo.print_info();

    return 0;
}
