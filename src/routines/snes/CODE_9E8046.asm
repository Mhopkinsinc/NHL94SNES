; Unidentified routine.
CODE_9E8046:
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bmi CODE_9E8054
	jmp.w $814E
