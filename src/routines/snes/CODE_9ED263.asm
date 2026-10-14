; Unidentified routine.
CODE_9ED263:
	lda.w $1023,x
	sec
	sbc.b d7
	sta.w $1023,x
	bmi CODE_9ED271
	jmp.w CODE_9ED2F7
