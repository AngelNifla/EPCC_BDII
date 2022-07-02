#include "Buffer_Manager.h"

int main()
{
    int num_frames{};
    std::cout<<"Ingrese el numero de frames: ";
    std::cin>>num_frames;
    std::cin.ignore();
    Buffer_Manager B(num_frames);
    B.LRU();
    return 0;
}



/*LRU
PS E:\C++\2022\EPCC_BDII\TEORIA\Práctica03_Buffer_Manager> .\\a
Ingrese el numero de frames: 4
Ingrese la cadena de solicitudes: C A D B E B A B C D
C A D B E B A B C D 
D A C B 
*/
