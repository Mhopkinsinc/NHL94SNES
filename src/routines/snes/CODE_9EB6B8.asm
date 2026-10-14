; Unidentified routine.
CODE_9EB6B8:
	lda.w #$0004
	trb.w gmode
	ldx.w #$001C
	stx.b a3
	lda.w #$001B
	sta.b d0
	jsl.l assreplace
CODE_9EB6CC:
	lda.w $1E9B
	bne CODE_9EB6E0
	stz.b a2
	jsl.l coinsearch
	lda.w #$0002
	sta.b a2
	jsl.l coinsearch
CODE_9EB6E0:
	stx.b xsave
	ldx.w #$000E
CODE_9EB6E5:
	pla
	sta.b a0,x
	dex
	dex
	bpl CODE_9EB6E5
	ldx.b xsave
	pla
	sta.b $A7
	pla
	sta.b d0
	ldx.b a3
CODE_9EB6F6:
	rtl
