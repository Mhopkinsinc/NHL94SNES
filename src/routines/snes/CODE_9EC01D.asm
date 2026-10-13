; Unidentified routine.
CODE_9EC01D:
	dec a
	sta.w tmpdst,y
	bit.w #$0800
	bne CODE_9EC029
	jmp.w $BF9E
