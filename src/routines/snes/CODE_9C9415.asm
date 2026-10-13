; Unidentified routine.
CODE_9C9415:
	phb
	phk
	plb
	stx.w $1E17
	sty.w $1E1B
	stz.b $14
	lda.w #$0001
	sta.b $16
	lda.b $8D
	sta.b $A9
	lda.w #$FFFF
	sta.b $91
	sta.b $93
	pha
	sep #$30
	lda.b $8F
	pha
	plb
	rep #$30
	ldy.w #$0000
	bra CODE_9C9479
