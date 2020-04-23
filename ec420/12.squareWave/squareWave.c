/*
;generate a square wave of 10 KHz with timer0 in mode2 at p1.3 using interrupt mode. 
;Also display a value ‘A’ at P2 and ‘B’ at P0.  Assume XTAL=22MHz

;for a wave of 10Khz, on time and off time is 50 microSecond
;for timer in mode 2 | 8-bit auto reload | 91.66 (92) Machine Cycles are required | so th0 and tl0 must be loaded with 164 | 0xA4
*/

#include <reg51.h>

sbit pin = P1^3;

void initiallise(){
    P1 = 0x00;
    TMOD = 0X02;                    //timer 0 in mode 2. 8bit auto reload
    TH0 = 164;
    TL0 = 164;
    IE = 0X82;
    TR0 = 1;
}

void wave() interrupt 1 {
    pin = ~pin;
}

void main(){
    initiallise();
    while (1)
    {
        P2 = 'A';
        P0 = 'B';
    }
}