; Unidentified routine.
CODE_80A465:
	lda.w APUIO0
	bne CODE_80A465
	lda.b $4B
	sta.w APUIO1
	lda.w $07FC
	sta.w APUIO2
	lda.w $07FE
	sta.w APUIO3
	lda.b #$07
	sta.w APUIO0
CODE_80A480:
	cmp.w APUIO0
	bne CODE_80A480
	ldy.b #$14
	lda.b ($4E),y
	sta.w APUIO1
	iny
	lda.b ($4E),y
	sta.w APUIO2
	pha
	iny
	lda.b ($4E),y
	sta.w APUIO3
	ldx.b #$81
	stx.w APUIO0
CODE_80A49E:
	cpx.w APUIO0
	bne CODE_80A49E
	stz.w APUIO0
CODE_80A4A6:
	lda.w APUIO0
	bne CODE_80A4A6
	lda.b $4B
	sta.w APUIO1
	rep #$20
	lda.b $5A
	sta.w APUIO2
	sep #$20
	lda.b #$06
	sta.w APUIO0
CODE_80A4BE:
	cmp.w APUIO0
	bne CODE_80A4BE
	stz.w APUIO0
	pla
	bmi CODE_80A4E0
CODE_80A4C9:
	lda.w APUIO0
	bne CODE_80A4C9
	lda.b $5D
	sta.w APUIO2
	lda.b #$0C
	sta.w APUIO0
CODE_80A4D8:
	cmp.w APUIO0
	bne CODE_80A4D8
	stz.w APUIO0
CODE_80A4E0:
	ldy.b $4B
	rts
