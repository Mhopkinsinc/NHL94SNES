; Unidentified routine.
CODE_9EAE45:
	ldx.b $E4
	lda.b $0E
	cmp.w #$FEF8
	bpl CODE_9EAE57
	lda.b $12
	cmp.w #$FEF8
	bmi CODE_9EAE60
	bra CODE_9EAE78
