			org 0000h
				mov p1, #0ffh			;initiallise as input port
				
doItAgain:		mov a, p1
				mov p2, a
				sjmp doItAgain
				
				end