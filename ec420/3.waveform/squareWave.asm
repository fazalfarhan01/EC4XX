;wave form generator

			org 0000h
startOver:		mov a, #00h		;store 0 on A
				mov p1, a		;send 0 to ADC
				acall delay		;wait for sometime
				mov a, #0ffh	;store logic high in A
				mov p1, a		;send high to ADC
				acall delay
				sjmp startOver	;to do it again
				
delay:			mov r1, #0ffh
loop2:			mov r0, #0ah
loop:			djnz r0, loop
				djnz r1, loop2
				ret
				
				end