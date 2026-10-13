; Unidentified routine.
CODE_9E92BE:
	lda.w puckvx
	cmp.w #$0800
	bpl CODE_9E92DE
	cmp.w #$F800
	bmi CODE_9E92DE
	cmp.w #$0000
	bpl CODE_9E92D8
	lda.w #$F800
	sta.w puckvx
	bra CODE_9E92DE
