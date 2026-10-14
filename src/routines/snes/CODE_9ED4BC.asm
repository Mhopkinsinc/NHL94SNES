; Unidentified routine.
CODE_9ED4BC:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bmi CODE_9ED4CA
	jmp.w CODE_9EDB21
