; Unidentified routine.
CODE_9FF92C:
	rep #$30
CODE_9FF92E:
	lda.b $0C
	pha
	lda.b $0E
	pha
	lda.w #$4040
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	ldx.w #$1C00
	lda.w #$0A00
	jsl.l CODE_9FF94F
	pla
	sta.b $0E
	pla
	sta.b $0C
	rtl
