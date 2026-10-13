; Unidentified routine.
CODE_9EAFB5:
	jsl.l skatetopuckinit
	lda.w temp2,x
	sec
	sbc.b $C1
	sta.w temp2,x
	bmi CODE_9EAFC7
	jmp.w $B070
