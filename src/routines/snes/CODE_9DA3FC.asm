; Unidentified routine.
CODE_9DA3FC:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF54E
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF56B
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
CODE_9DA434:
	ldx.w #$0008
CODE_9DA437:
	lda.w JoyPad,x
	bit.w #$000F
	bne CODE_9DA444
	bit.w #$1000
	bne CODE_9DA434
CODE_9DA444:
	dex
	dex
	bpl CODE_9DA437
	jmp.w CODE_9DA29C
