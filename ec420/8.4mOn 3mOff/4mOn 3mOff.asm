;XTAL = 22 Mhz              MC Frequency  = (22*10^6)/12 = 1.833MHz             MC Time Period = (1/MC Freq) = 545.4545 nSec
;OnTime = 4 mSec = 7333.33 ~ 7333 MC
;OffTime = 3 mSec = 5500 MC
;max delay in mode 0 with xtal of 22 MHz = 4.4683636 mSec
;we need 859 in timer 4 mSec		|	00011010 00011011
;and 2692 in timer for 3 mSec		|	01010100 00000100


                org 0000h
                mov tmod, #00h              ;for timer 0 mode 0
                
repeatAgain:	setb p1.5
				acall onDelay
				
				clr p1.5
				acall offDelay
				
				sjmp repeatAgain
				
				
onDelay:		mov th0, #00011010b
				mov tl0, #00011011b
				setb tr0
wait:			jnb tf0, wait
				clr tr0
				clr tf0
				ret
				
offDelay:		mov th0, #01010100b
				mov tl0, #00000100b
				setb tr0
wait2:			jnb tf0, wait2
				clr tr0
				clr tf0
				ret
				
				end