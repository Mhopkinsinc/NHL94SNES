; Unidentified routine.
CODE_9F9125:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
CODE_9F9133:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF809
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0016
	sta.b $A5
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9D8000
	jsl.l CODE_9F9B36
	jsl.l CODE_9FEA24
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	stx.b $87
	ldx.w #$001A
CODE_9F9170:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9F9170
	ldx.b $87
	stx.b $87
	ldx.w #$001E
CODE_9F917E:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9F917E
	ldx.b $87
	ldx.b $95
	stx.b $87
	ldx.w #$0000
CODE_9F918E:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0020
	bne CODE_9F918E
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9F919F:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9F919F
	ldx.b $87
	ldx.b $89
	lda.w #$0004
	sta.l $7E3568,x
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bne CODE_9F91C1
	jmp.w CODE_808E1C
