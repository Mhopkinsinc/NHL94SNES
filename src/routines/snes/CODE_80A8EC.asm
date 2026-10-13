; Unidentified routine.
CODE_80A8EC:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $07FB
CODE_80A8F3:
	sta.w $07FD
	ldx.b $4A
	lda.w $07FB
	xba
	lda.b $5A
	jsr.w MulFrac8
	sta.w $08AE,x
	lda.w $07FD
	xba
	lda.b $5A
	jsr.w MulFrac8
	sta.w $08BF,x
	ldy.b #$07
CODE_80A912:
	lda.w $08FA,y
	cmp.b $4A
	bne CODE_80A956
	ldx.b $4A
	lda.w $08AE,x
	xba
	lda.w $0902,y
	jsr.w MulFrac8
	sta.w $07FC
	lda.w $08BF,x
	xba
	lda.w $0902,y
	jsr.w MulFrac8
	sta.w $07FE
CODE_80A935:
	lda.w APUIO0
	bne CODE_80A935
	lda.w $07FE
	sta.w APUIO3
	lda.w $07FC
	sta.w APUIO2
	sty.w APUIO1
	lda.b #$0E
	sta.w APUIO0
CODE_80A94E:
	cmp.w APUIO0
	bne CODE_80A94E
	stz.w APUIO0
CODE_80A956:
	dey
	bpl CODE_80A912
	rep #$20
	jmp.w CODE_80ABA5
