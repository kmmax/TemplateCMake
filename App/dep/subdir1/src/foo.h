#ifndef FOO_H
#define FOO_H


#include <iostream>
#include <string>
#include <memory>


namespace Sub1 {
    class Foo;
}
std::ostream& operator<<(std::ostream& os, const Sub1::Foo& foo);


namespace Sub1 {

using PtrFoo = std::shared_ptr<Sub1::Foo>;

/**
 * @brief The class safe number
 */
class Foo
{
public:
    explicit Foo(const std::string& name);
    virtual ~Foo();

    void set_num(int num) { m_num = num; }
    int num() { return m_num; }
    friend std::ostream& ::operator<<(std::ostream& os, const Sub1::Foo& foo);

private:
    static int last_id;
    int m_id;
    int m_num;
    std::string m_name;
};


/**
 * @brief The Factory method fo Foo
 */
class FooCreator
{
public:
    explicit FooCreator() = delete;
    static std::shared_ptr<Foo> createFoo(const std::string& name, int num=0)
    {
        std::shared_ptr<Foo> ptr = std::make_shared<Foo>(name);
        ptr->set_num(num);
        return ptr;
    }
};

}// end of namespace subdir1


inline std::ostream &operator<<(std::ostream& os, const Sub1::Foo& foo) {
    os << "[" << foo.m_id << "]: " << foo.m_name << ": num=" << foo.m_num ;
    return os;
}
#endif // FOO_H
