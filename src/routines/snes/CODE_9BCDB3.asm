; Unidentified routine.
CODE_9BCDB3:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $A5
	ldx.b $A9
	sta.b $A9
	stx.b $A5
	jsl.l CODE_9CA4CF
	stz.b $A7
	lda.b $A9
	sta.b $A5
	jsl.l SuperAdd
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
