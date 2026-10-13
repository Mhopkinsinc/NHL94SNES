; Unidentified routine.
CODE_80C1E3:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	sta.b $6C
	lda.b $6F
	rts
