; Unidentified routine.
CODE_9EAF59:
	cpy.w #$0024
	bmi CODE_9EAF92
	lda.b $C7
	ora.w #$0004
	sta.b $C7
	bra CODE_9EAF92
