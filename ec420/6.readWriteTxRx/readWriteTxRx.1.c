#include <reg51.h>


void main(){
    P1 = 0xff;
    while(1){
        P2=P1;
    }
}