; Unidentified routine.
CODE_9FD252:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	stx.b $87
	ldx.w #$0000
CODE_9FD269:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FD269
	ldx.b $87
	stz.b $91
	jsl.l CODE_9FD2A7
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9FD2A7
	stx.b $87
	ldx.w #$000E
CODE_9FD289:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FD289
	ldx.b $87
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	ldx.b $95
	rtl
