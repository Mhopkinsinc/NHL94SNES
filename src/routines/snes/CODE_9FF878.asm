; Unidentified routine.
CODE_9FF878:
	lda.w $0AD3
	cmp.w #$000F
	bne CODE_9FF898
	lda.b $83
	cmp.b $C1
	bmi CODE_9FF898
	lda.w $0776
	bne CODE_9FF893
	lda.b $83
	cmp.b $BD
	bmi CODE_9FF898
	bra CODE_9FF893
