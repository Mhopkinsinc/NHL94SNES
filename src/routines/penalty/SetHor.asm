; Unidentified routine.
SetHor:
	stx.b $87
	ldx.w #$0000
CODE_9FBA1C:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9FBA1C
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9FBA2D:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9FBA2D
	ldx.b $87
	lda.w puckvx
	pha
	asl a
	pla
	ror a
	sta.w puckvx
	lda.w puckvy
	pha
	asl a
	pla
	ror a
	sta.w puckvy
	lda.w #$0001
	sta.l $7E3460
	jsl.l CODE_8086A9
	lda.w #$0001
	sta.w sfhormode
	stz.w Hscroll
	lda.w #$FFFF
	sta.w Vscroll
	lda.w #$002E
	sta.w $0D23
	stz.w $0D25
	jsl.l SprSort
	jsl.l CODE_9FC896
	stx.b $87
	ldx.w #$001A
CODE_9FBA7D:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FBA7D
	ldx.b $87
	stx.b $87
	ldx.w #$001A
CODE_9FBA8B:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FBA8B
	ldx.b $87
	ldx.b $95
	rtl
