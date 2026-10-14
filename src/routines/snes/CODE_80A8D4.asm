; Unidentified routine.
CODE_80A8D4:
	lda.w $086A,x
	sta.b $4E
	sep #$20
	lda.w $07E3
	bne .t1
	ldy.b #$12
	lda.b ($4E),y
	sta.w $07FB
	iny
	lda.b ($4E),y
	bra .2

.t1:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $07FB
.2:
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
.loop:
	lda.w $08FA,y
	cmp.b $4A
	bne .1
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
.loop2:
	lda.w APUIO0
	bne .loop2
	lda.w $07FE
	sta.w APUIO3
	lda.w $07FC
	sta.w APUIO2
	sty.w APUIO1
	lda.b #$0E
	sta.w APUIO0
.loop3:
	cmp.w APUIO0
	bne .loop3
	stz.w APUIO0
.1:
	dey
	bpl .loop
	rep #$20
	jmp.w CODE_80ABA5
