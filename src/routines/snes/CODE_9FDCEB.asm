; Unidentified routine.
CODE_9FDCEB:
	pha
	lda.b $A9
	pha
	lda.b $91
	pha
	ldx.b $89
	jsl.l CODE_9FDCB2
	pla
	sta.b $91
	pla
	sta.b $A9
	pla
	ldx.b $A5
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
	sta.b $A5
	ldx.b $95
	clc
	rtl
