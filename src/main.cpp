#include <iostream>
#include <stdexcept>
#include <string>

int main(int, char **)
{
    try
    {
    }
    catch(std::exception const & _ex)
    {
        std::cerr << "Error: " << _ex.what() << std::endl;
        throw;
    }

    return EXIT_SUCCESS;
}
