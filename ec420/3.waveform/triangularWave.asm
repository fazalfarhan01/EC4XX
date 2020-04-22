;sawtooth wave

			org 0000h
				mov a, #00h		;store 0 on A
risingEdge:		mov p1, a		;move data to p1
				inc a
				cjne a, #0ffh, risingEdge
fallingEdge:	mov p1, a
				dec a
				cjne a, #00h, fallingEdge
				
				sjmp risingEdge
				
				end