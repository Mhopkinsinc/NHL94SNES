; Unidentified routine.
CODE_9ED4BC:
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bmi CODE_9ED4CA
	jmp.w $DB21
