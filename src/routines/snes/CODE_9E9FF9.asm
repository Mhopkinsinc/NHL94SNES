; Unidentified routine.
CODE_9E9FF9:
	lda.b d4
	pha
	lda.b a2
	pha
	lda.b a3
org $9EA001
	pha
	jsl.l CODE_9EA021
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l CODE_9EA021
	pla
	sta.b a3
	pla
	sta.b a2
	pla
	sta.b d4
	ldx.b a3
CODE_9EA01D:
	rtl
