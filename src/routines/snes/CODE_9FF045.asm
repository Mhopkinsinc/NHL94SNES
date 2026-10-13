; Unidentified routine.
CODE_9FF045:
	lda.w $1DB9
	inc a
	cmp.w #$0002
	bmi CODE_9FF050
	bra CODE_9FF011
