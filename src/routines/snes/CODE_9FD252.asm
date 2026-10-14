; Unidentified routine.
CODE_9FD252:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	stx.b xsave
	ldx.w #$0000
CODE_9FD269:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FD269
	ldx.b xsave
	stz.b a2
	jsl.l CODE_9FD2A7
	lda.w #$0002
	sta.b a2
	jsl.l CODE_9FD2A7
	stx.b xsave
	ldx.w #$000E
CODE_9FD289:
	pla
	sta.b a0,x
	dex
	dex
	bpl CODE_9FD289
	ldx.b xsave
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	ldx.b a3
	rtl
