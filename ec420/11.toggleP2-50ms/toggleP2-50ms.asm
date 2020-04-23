;to toggle all the bits of p2 continuously every 50ms.Use timer 1 in mode2 configuration with XTAL=11.0592MHz
;max delay in 8bit mode at 11.0592 Mhz is 277.77 microseconds
;for a delay of 200 micro seconds we need 184.32 machine cycles; ~184 MC
;in order to get 184 machine cycles, th1 must be loaded with 72 it 0x48 


				org 0000h
				mov tmod, #20h					;timer 1 in mode 2 | 8-bit auto reload

repeatAgain:	mov a, p2
				cpl a
				mov p2, a
				acall delay
				sjmp repeatAgain


delay:			mov r0, #250
				mov th1, #48h
				mov tl1, #48h
				setb tr1
wait:			jnb tf1, wait
				clr tf1
				djnz r0, wait
				ret

				end