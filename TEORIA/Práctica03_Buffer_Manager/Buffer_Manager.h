#if !defined(_BUFFER_MANAGER_)
#define _BUFFER_MANAGER_

#include "Disk.h"
#include "Buffer_Pool.h"
#include <queue>

class Buffer_Manager
{
private:
    int num_frames;
    std::string solicitudes;
    Disk *Disco;
    Buffer_Pool *Buffer;
public:
    Buffer_Manager(int _num);
    char buscar_pagina_Disk(char _pagina);
    bool buscar_pagina_Bpool(char _pagina);
    void LRU();
    void CLOCK();
    void MRU();
    void mostrar_BufferPool();
    ~Buffer_Manager();
};

Buffer_Manager::Buffer_Manager(int _num)
{
    Disco = new Disk();
    Buffer = new Buffer_Pool();
    num_frames = _num;
    std::cout<<"Ingrese la cadena de solicitudes: ";
    getline(std::cin,solicitudes);
    for (int i = 0; i < solicitudes.size(); i++)
    {
        if (solicitudes[i]<'A' || solicitudes[i]> 'Z')
        {
            solicitudes.erase(solicitudes.begin()+i);
            i--;
        }
    }
    for (int i = 0; i < solicitudes.size(); i++)
    {
        std::cout<<solicitudes[i]<<" ";
    }
    std::cout<<"\n";
}

char Buffer_Manager::buscar_pagina_Disk(char _pagina)
{
    for (int i = 0; i < Disco->size(); i++)
    {
        if (Disco->pagina[i] == _pagina)
        {
            return Disco->pagina[i];
        }
    }
}

bool Buffer_Manager::buscar_pagina_Bpool(char _pagina)
{
    for (int i = 0; i < Buffer->frames.size(); i++)
    {
        if (Buffer->frames[i] == _pagina)
        {
            return true;
        }
    }
    return false;
}

void Buffer_Manager::LRU()
{
    std::queue<char> cola;
    char aux{};
    for (int i = 0,k{0}; i < solicitudes.size(); i++,k++)
    {
        if (this->buscar_pagina_Bpool(solicitudes[i]))
        {
            if (cola.front() == solicitudes[i])
            {
                cola.push(cola.front());
                cola.pop();
            }else if (cola.back() == solicitudes[i])
            {
            }else
            {
                for (int j = 0; j < Buffer->frames.size(); j++)
                {
                    if (cola.front() == solicitudes[i])
                    {
                        aux = cola.front();
                        cola.pop();
                    }else
                    {
                        cola.push(cola.front());
                        cola.pop();
                    }
                }
                cola.push(aux);
            }
            if (i<num_frames)
            {
                k--;
            }
            
        }else if (k<num_frames)
        {
            Buffer->frames.push_back(this->buscar_pagina_Disk(solicitudes[i]));
            cola.push(solicitudes[i]);
        }else
        {
            for (int j = 0; j < Buffer->frames.size(); j++)
            {
                if (cola.front() == Buffer->frames[j])
                {
                    Buffer->frames[j] = solicitudes[i];
                    cola.push(solicitudes[i]);
                    break;
                }
            }
            cola.pop();
        }
    }
    this->mostrar_BufferPool();
}

void Buffer_Manager::CLOCK()
{

}

void Buffer_Manager::MRU()
{
    
}

void Buffer_Manager::mostrar_BufferPool()
{
    for (int i = 0; i < num_frames; i++)
    {
        std::cout<<Buffer->frames[i]<<" ";
    }
    std::cout<<"\n";
}

Buffer_Manager::~Buffer_Manager()
{
}


#endif // _BUFFER_MANAGER_
