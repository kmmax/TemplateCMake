#include "foo.h"

int Sub1::Foo::last_id = -1;

Sub1::Foo::Foo(const std::string &name) :
    m_num(0),
    m_name(name)
{
    m_id = ++last_id;
//    std::cout << m_id << " Foo constructor" << std::endl;
}


Sub1::Foo::~Foo()
{
//    std::cout << m_id << " Foo destructor" << std::endl;
}







