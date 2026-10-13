; Unidentified routine.
CODE_80A770:
	asl a
	sta.b $5A
	ldx.b $4B
	sta.w $0902,x
	ldx.b $4A
	xba
	lda.w $08AE,x
	jsr.w MulFrac8
	sta.w $07FC
	lda.b $5A
	xba
	lda.w $08BF,x
	jsr.w MulFrac8
	sta.w $07FE
CODE_80A790:
	lda.w $0802
	beq CODE_80A7AC
	lda.b $4A
	cmp.b #$10
	beq CODE_80A7AC
	lsr.w $07FE
	lsr.w $07FC
	lda.w $0802
	bpl CODE_80A7AC
	lsr.w $07FE
	lsr.w $07FC
CODE_80A7AC:
	ldy.b #$04
	lda.b $60
	clc
	adc.b ($4E),y
	sta.b $60
	ldx.b $4B
	sta.w $090A,x
	ldx.b $4A
	cpx.b #$09
	bne CODE_80A7C5
	lda.b #$3F
	clc
	adc.b ($4E),y
CODE_80A7C5:
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	ldx.w $0800
	sta.w $095A,x
	sta.b $5A
	sep #$20
	ldy.b $4A
	lda.w $089D,y
	beq CODE_80A840
	lda.w $088C,y
	beq CODE_80A840
	bmi CODE_80A80C
	lda.b $60
	clc
	adc.w $089D,y
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	sec
	sbc.b $5A
	sta.b $5E
	sep #$20
	lda.w $088C,y
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
	clc
	adc.b $5A
	sta.b $5A
	bra CODE_80A840
