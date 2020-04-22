/*XTAL = 11.0592, so every machine cycle has a time period of 1.085 uSec
;for a total delay of 1 second, we need 921600 machine cycles
;mode 1 in timer is a 16 bit timer so max delay in mode 1 is (65535 - count +1)*1.085*10**-6, that is 71.11 mS
;we need to run the timer for 14 complete times + 4096 times  set timer 0 to f000h */
//for a delay 1milliSecond we need 922 iterations. that in hex is 0x39A
//therefore 65536 - 922 = 64614 = 0xFC66



#include<reg51.h>

sbit pin = P1^5;

void delay(){
    int i;
    TMOD = 0x01;
    TH0 = 0xFC;
    TL0 = 0x66;
    TR0 = 1;
    for(i=0; i<1000; i++){
				TH0 = 0xFC;
				TL0 = 0x66;
				TR0 = 1;
        while(TF0 != 1){
            ;
        }
				TR0 = 0;
        TF0 = 0;
    }
}

void main(){
    while (1)
    {
        pin = ~pin;
        delay();
    }
    
}