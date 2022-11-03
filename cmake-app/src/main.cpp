#include <iostream>

#include "app-version.h"
#include "defines.h"
#include "foo.h"
//include "bar1.h"
//#include "../dep/subdir2/src/bar1.h"
#include "subdirfoo.h"
#include "subdirbar.h"

int main(int argc, char** argv)
{
    std::cout << APP_NAME << std::endl;
    std::cout << "   version:     " << APP_VERSION_MAJOR << "." << APP_VERSION_MINOR << "." << APP_VERSION_BUILD << std::endl;
    std::cout << "   description: " << APP_DESCRIPTION << std::endl;
    std::cout << "   homepage:    " << APP_HOMEPAGE_URL << std::endl;

    std::cout << std::endl;
    std::cout << "defines:" << std::endl;
    std::cout << "   VAR1:        " << APP_VAR1 << std::endl;
    std::cout << "   VAR2:        " << APP_VAR2 << std::endl;
    std::cout << "   VAR3:        " << APP_VAR3 << std::endl;

    std::cout << std::endl;
    Foo foo;
    foo.print_info();

//    Bar1 bar1;
//    bar1.print_info();

    SubdirFoo subdir;
    subdir.print_info();

    SubdirBar sbar;
    sbar.print_info();

    std::cout << std::endl;
    std::cout << "Goodbye" << std::endl;

	return 0;
}
