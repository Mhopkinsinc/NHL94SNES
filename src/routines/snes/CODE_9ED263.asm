; Unidentified routine.
CODE_9ED263:
	lda.w temp2,x
	sec
	sbc.b $C1
	sta.w temp2,x
	bmi CODE_9ED271
	jmp.w $D2F7
