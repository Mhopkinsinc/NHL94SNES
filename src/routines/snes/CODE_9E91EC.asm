; Unidentified routine.
CODE_9E91EC:
	lda.w puckvy
	cmp.w #$0800
	bpl CODE_9E920C
	cmp.w #$F800
	bmi CODE_9E920C
	cmp.w #$0000
	bpl CODE_9E9206
	lda.w #$F800
	sta.w puckvy
	bra CODE_9E920C
