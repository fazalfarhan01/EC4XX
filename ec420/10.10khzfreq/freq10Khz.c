



#include<reg51.h>

sbit pin = P1^4;

void delay(){
    TH0 = 0xa4;
    TL0 = 0xa4;
    TR0 = 1;
    while(TF0 != 1){
        ;
    }
    TF0 = 0;
    TR0 = 0;
}

void main(){
    TMOD = 0x02;
    while (1)
    {
        pin = ~pin;
        delay();
    }
    
}