;sawtooth wave

			org 0000h
				mov a, #00h		;store 0 on A
startOver:		mov p1, a		;move data to p1
				inc a
				;acall delay
				sjmp startOver
				
delay:			mov r1, #0ffh
loop2:			mov r0, #0ah
loop:			djnz r0, loop
				djnz r1, loop2
				ret
				
				end