; Unidentified routine.
CODE_9EB6B8:
	lda.w #$0004
	trb.w gmode
	ldx.w #$001C
	stx.b $95
	lda.w #$001B
	sta.b $A5
	jsl.l assreplace
CODE_9EB6CC:
	lda.w $1E9B
	bne CODE_9EB6E0
	stz.b $91
	jsl.l coinsearch
	lda.w #$0002
	sta.b $91
	jsl.l coinsearch
CODE_9EB6E0:
	stx.b $87
	ldx.w #$000E
CODE_9EB6E5:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9EB6E5
	ldx.b $87
	pla
	sta.b $A7
	pla
	sta.b $A5
	ldx.b $95
CODE_9EB6F6:
	rtl
