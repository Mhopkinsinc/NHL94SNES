; Fill X bytes of video memory at Y with the word A
FillVRAM:
	sta.b $16
	lda.w IniDispShadow-1
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
	sta.w DMAQueue+4,x
	lsr a
	pha
	tya
	sta.w DMAQueue+6,x
	pla
	clc
	adc.w DMAQueue+6,x
	tay
	lda.w #$0016
	sta.w DMAQueue+1,x
	sep #$20
	stz.w DMAQueue+3,x
	lda.b #$09
	sta.w DMAQueue,x
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
