; Unidentified routine.
CODE_80ADE9:
	php
	sep #$30
CODE_80ADEC:
	lda.w APUIO0
	bne CODE_80ADEC
	ldy.b #$00
	lda.w $07F8
	sta.w APUIO1
	iny
	lda.w $07F8
	sta.w APUIO2
	iny
	lda.l $0007E9
	sta.w APUIO3
	iny
	lda.b #$08
	sta.w APUIO0
CODE_80AE0E:
	cmp.w APUIO0
	bne CODE_80AE0E
	lda.l $0007E8
	sta.w APUIO1
	iny
	lda.l $0007E7
	sta.w APUIO2
	ldx.b #$82
	stx.w APUIO0
CODE_80AE27:
	cpx.w APUIO0
	bne CODE_80AE27
	stz.w APUIO0
	lda.w $07E7
	beq CODE_80AE77
CODE_80AE34:
	lda.w APUIO0
	bne CODE_80AE34
	ldy.b #$00
	lda.l $0007EB
	sta.w APUIO1
	iny
	lda.l $0007EB
	sta.w APUIO2
	iny
	lda.l $0007EC
	sta.w APUIO3
	iny
	lda.b #$09
	sta.w APUIO0
CODE_80AE58:
	cmp.w APUIO0
	bne CODE_80AE58
	lda.b #$E0
	sta.w APUIO1
	iny
	lda.l $0007EA
	sta.w APUIO2
	ldx.b #$83
	stx.w APUIO0
CODE_80AE6F:
	cpx.w APUIO0
	bne CODE_80AE6F
	stz.w APUIO0
CODE_80AE77:
	rep #$30
	plp
	rts
