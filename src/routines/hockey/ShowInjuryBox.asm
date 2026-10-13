; Unidentified routine.
ShowInjuryBox:
	stx.b $87
	ldx.w #$0000
CODE_9FA135:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0020
	bne CODE_9FA135
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9FA146:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FA146
	ldx.b $87
	jsl.l CODE_9F9B36
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF858
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	stz.b $91
	jsl.l CODE_9FA1B8
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF85D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9FA1B8
	stx.b $87
	ldx.w #$000E
CODE_9FA19E:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FA19E
	ldx.b $87
	stx.b $87
	ldx.w #$001E
CODE_9FA1AC:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FA1AC
	ldx.b $87
	ldx.b $95
CODE_9FA1B7:
	rtl
