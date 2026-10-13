; Unidentified routine.
CODE_9ED4BC:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bmi CODE_9ED4CA
	jmp.w $DB21
