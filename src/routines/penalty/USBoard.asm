; Update the scoreboard, with the players in the penalty box and their time left
USBoard:
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
	jsl.l printscores1
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #USBoardPos>>16
	sta.b a1+2
	lda.w #USBoardPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	stz.b a2
	jsl.l DispPen
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #IntermissionPos>>16
	sta.b a1+2
	lda.w #IntermissionPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.w #$0002
	sta.b a2
	jsl.l DispPen
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
USBoard_rtl:
	rtl
