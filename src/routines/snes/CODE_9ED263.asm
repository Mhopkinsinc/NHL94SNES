; Unidentified routine.
CODE_9ED263:
	lda.w $1023,x
	sec
	sbc.b $C1
	sta.w $1023,x
	bmi CODE_9ED271
	jmp.w $D2F7
