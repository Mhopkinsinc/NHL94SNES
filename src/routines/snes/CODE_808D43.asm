; Unidentified routine.
CODE_808D43:
	stx.b $1C
	sty.b $1E
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $18
	iny
	iny
	lda.b [$0C],y
	sta.b $1A
	lda.b $0C
	clc
	adc.w #$0006
	tax
	lda.b $1E
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w $079C
	ora.b $1C
	tay
	lda.w $0761
	bmi .1
	jmp.w CODE_808DB3
.1:
	sep #$20
	lda.b $0E
	sta.w A1B1
	stz.w DMAP1
	stz.w VMAIN
	lda.b #$18
	sta.w BBAD1
	rep #$20
.loop:
	lda.b $18
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
	sep #$20
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	clc
	adc.b $18
	tax
	tya
	clc
	adc.w #$0080
	tay
	dec.b $1A
	bne .loop
	sep #$20
	lda.b #$80
	sta.w VMAIN
	rep #$20
	rtl
