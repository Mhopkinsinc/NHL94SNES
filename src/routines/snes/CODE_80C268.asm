; Unidentified routine.
CODE_80C268:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	sta.b $6C
	lda.b $6F
	rts
