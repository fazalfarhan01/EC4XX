;sawtooth wave

			org 0000h
repeatAgain:	mov a, #00h
				mov p1, a
				acall delay
				mov a, #51
				mov p1, a
				acall delay
				mov a, #102
				mov p1, a
				acall delay
				mov a, #153
				mov p1, a
				acall delay
				;mov a, #204
				;mov p1, a
				;acall delay
				
risingEdge:		inc a
				mov p1, a
				cjne a, #0ffh, risingEdge
				
				
fallingEdge:	dec a
				mov p1, a
				cjne a, #154, fallingEdge
				
				
				
				;mov a, #204
				;mov p1, a
				;acall delay
				mov a, #153
				mov p1, a
				acall delay
				mov a, #102
				mov p1, a
				acall delay
				mov a, #51
				mov p1, a
				acall delay
				mov a, #00h
				mov p1, a
				acall delay
				
				sjmp repeatAgain
				
				
delay:			mov r0, #0ffh
delayLoop1:		djnz r0, delayLoop1
				ret


				end