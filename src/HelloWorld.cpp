#include "HelloWorld.hpp"

const std::ostream& operator<<(std::ostream &os, [[maybe_unused]] const HelloWorld &hello_world) noexcept
{
  return os << "Hello, World! This template is recommended for use in Linux.\n";
}