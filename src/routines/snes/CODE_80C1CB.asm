; Unidentified routine.
CODE_80C1CB:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra CODE_80C1B8
