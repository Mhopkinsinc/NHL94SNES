; Unidentified routine.
CODE_9E9FF9:
	lda.b $B5
	pha
	lda.b $91
	pha
	lda.b $95
org $9EA001
	pha
	jsl.l CODE_9EA021
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	jsl.l CODE_9EA021
	pla
	sta.b $95
	pla
	sta.b $91
	pla
	sta.b $B5
	ldx.b $95
CODE_9EA01D:
	rtl
