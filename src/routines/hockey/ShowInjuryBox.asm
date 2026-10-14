; The injury box: the injured player and whether he is out for the period or the game
ShowInjuryBox:
	stx.b xsave
	ldx.w #$0000
.save:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0020
	bne .save
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
.savea:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne .savea
	ldx.b xsave
	jsl.l CODE_9F9B36
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #DATA8_9CF858>>16
	sta.b a1+2
	lda.w #DATA8_9CF858
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	stz.b a2
	jsl.l CODE_9FA1B8
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #DATA8_9CF85D>>16
	sta.b a1+2
	lda.w #DATA8_9CF85D
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.w #$0002
	sta.b a2
	jsl.l CODE_9FA1B8
	stx.b xsave
	ldx.w #$000E
.resta:
	pla
	sta.b a0,x
	dex
	dex
	bpl .resta
	ldx.b xsave
	stx.b xsave
	ldx.w #$001E
.restore:
	pla
	sta.b d0,x
	dex
	dex
	bpl .restore
	ldx.b xsave
	ldx.b a3
CODE_9FA1B7:
	rtl
