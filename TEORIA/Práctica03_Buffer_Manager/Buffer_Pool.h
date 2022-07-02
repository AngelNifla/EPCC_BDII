#if !defined(_BUFFER_POOL_)
#define _BUFFER_POOL_

#include <iostream>
#include <vector>

class Buffer_Pool
{
private:
    
public:
    std::vector<char> frames;
    Buffer_Pool();

    ~Buffer_Pool();
};

Buffer_Pool::Buffer_Pool()
{   
}

Buffer_Pool::~Buffer_Pool()
{
}


#endif // _BUFFER_POOL_
