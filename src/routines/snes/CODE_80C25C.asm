; Unidentified routine.
CODE_80C25C:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra CODE_80C244
