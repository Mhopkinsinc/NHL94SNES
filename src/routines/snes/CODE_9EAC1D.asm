; Unidentified routine.
CODE_9EAC1D:
	ldx.b $E4
	lda.b $0E
	cmp.w #$FEF8
	bpl CODE_9EAC2F
	lda.b $12
	cmp.w #$FEF8
	bmi CODE_9EAC49
	bra CODE_9EAC67
