; Unidentified routine.
CODE_9E8046:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bmi CODE_9E8054
	jmp.w CODE_9E814E
