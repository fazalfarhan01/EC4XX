;XTAL = 11.0592, so every machine cycle has a time period of 1.085 uSec
;for a total delay of 1 second, we need 921600 machine cycles
;mode 1 in timer is a 16 bit timer so max delay in mode 1 is (65535 - count +1)*1.085*10**-6, that is 71.11 mS
;we need to run the timer for 14 complete times + 4096 times  set timer 0 to f000h

				org 0000h
					mov p1, #00h
					mov tmod, #01h
loop:				cpl p1.5
					acall delay
					acall smallDelay
					sjmp loop
					
					
delay:				mov r0, #14
					mov tl0, #00h
					mov th0, #00h
					setb tr0
timerLoop:			jnb tf0, timerLoop
					clr tf0
					djnz r0, timerLoop
					clr tr0
					ret

smallDelay:			mov tl0, #00h
					mov th0, #0f0h
					setb tr0
timerLoop2:			jnb tf0, timerLoop2
					clr tr0
					clr tf0
					ret
					
					end