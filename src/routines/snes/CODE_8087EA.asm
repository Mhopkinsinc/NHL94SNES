; Unidentified routine.
CODE_8087EA:
	sta.b $16
	lda.w $0761
	bpl .t1
	stx.w DAS1L
	cpy.w #$0000
	bmi .1
	sty.w VMADDL
	sty.b $14
.1:
	ldy.w #$0016
	sty.w A1T1L
	sep #$20
	lda.b #$09
	sta.w DMAP1
	lda.b #$18
	sta.w BBAD1
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	lsr a
	adc.b $14
	tay
	rtl

.t1:
	txa
	ldx.b $3C
.loop:
	pha
	cmp.w #$1001
	bcc .1x
	lda.w #$1000
.1x:
	sta.w $0104,x
	lsr a
	pha
	tya
	sta.w $0106,x
	pla
	clc
	adc.w $0106,x
	tay
	lda.w #$0016
	sta.w $0101,x
	sep #$20
	stz.w $0103,x
	lda.b #$09
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	pla
	sec
	sbc.w #$1000
	beq .2
	bcs .loop
.2:
	stx.b $3C
	rtl
