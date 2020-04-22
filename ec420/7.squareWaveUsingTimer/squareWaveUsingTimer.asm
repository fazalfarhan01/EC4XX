;squareWaveUsingTimer0 in mode 1

			org 0000h
				mov tmod, #01h				;TMOD in timer mode 1, 16 bit timer
				
;XTAL = 11.0592*10^6 Mhz			;1 MC needs 1.08506*10^16 Seconds
;delay = (0xffff-count+1)*time for 1 MC = (65535-0+1)*(1/921600) = 71.1111 milli Second
;Ton = 71.11 mS		|     Toff = 71.11 mS     |     timePeriod = 142.22222 mS
;Frequency = 1/(142.222*10^-3) = 7.03125 Hz
				
				
repeatAgain:	clr p1.5
				acall delay
				setb p1.5
				acall delay
				sjmp repeatAgain
				
				
delay:			mov th0, #00h
				mov tl0, #00h
				setb tr0
delayLoop:		jnb tf0, delayLoop
				clr tr0
				clr tf0
				ret
				
				end