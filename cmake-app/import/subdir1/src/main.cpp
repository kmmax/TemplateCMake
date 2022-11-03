#include <iostream>

#include "foo.h"


int main(int argc, char** argv)
{
	std::cout << "Hello from main" << std::endl;
    Foo foo;
    foo.print_info();

	return 0;
}
