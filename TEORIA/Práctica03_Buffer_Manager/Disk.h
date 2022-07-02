#if !defined(_DISK_H_)
#define _DISK_H_

#include <iostream>
#include <string>

class Disk
{   
public:
    std::string pagina;
    Disk();
    int size()
    {
        return pagina.size();
    }
    ~Disk();
};

Disk::Disk()
{
    pagina = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
}

Disk::~Disk()
{
}


#endif // _DISK_H_
