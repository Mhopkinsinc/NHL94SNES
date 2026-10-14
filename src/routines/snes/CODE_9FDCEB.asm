; Unidentified routine.
CODE_9FDCEB:
	pha
	lda.b d1
	pha
	lda.b a2
	pha
	ldx.b a0
	jsl.l CODE_9FDCB2
	pla
	sta.b a2
	pla
	sta.b d1
	pla
	ldx.b d0
	jsl.l Mul16S
	lda.b $0A
	asl.b $08
	rol a
	asl.b $08
	rol a
	asl.b $08
	rol a
	asl.b $08
	rol a
	sta.b d0
	ldx.b a3
	clc
	rtl
