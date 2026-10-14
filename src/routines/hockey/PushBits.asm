; password bits = password bits * d1 + d0
PushBits:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d0
	ldx.b d1
	sta.b d1
	stx.b d0
	jsl.l SuperMult
	stz.b $A7
	lda.b d1
	sta.b d0
	jsl.l SuperAdd
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	rtl
