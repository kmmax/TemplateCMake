#include <iostream>
#include <vector>
#include <memory>

#include "bar1.h"
#include "foo.h"

int main(int argc, char** argv)
{
	std::cout << "Hello from main" << std::endl;

//    Bar1 bar1;
//    bar1.print_info();


    std::vector<Sub1::PtrFoo> v;
    for (int i=0; i<10; i++) {
        std::string name("foo");
        name += std::to_string(i);
        auto ptr = Sub1::FooCreator::createFoo(name);
        ptr->set_num(100 + i);
        v.push_back(ptr);
    }

    for (auto &ptr: v) {
        std::cout << *ptr << std::endl;
    }

	return 0;
}
