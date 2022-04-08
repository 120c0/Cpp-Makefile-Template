#ifndef HELLOWORLD_HPP
#define HELLOWORLD_HPP

#include <iostream>

class HelloWorld final
{
  public:
    explicit HelloWorld() noexcept = default;

  private:
    friend const std::ostream& operator<<(std::ostream&, const HelloWorld&) noexcept;
};

#endif
