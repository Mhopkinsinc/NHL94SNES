; Unidentified routine.
CODE_9EAFB5:
	jsl.l skatetopuckinit
	lda.w $1023,x
	sec
	sbc.b $C1
	sta.w $1023,x
	bmi CODE_9EAFC7
	jmp.w CODE_9EB070
