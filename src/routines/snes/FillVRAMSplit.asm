; Fill X bytes of video memory at Y with the word A, the low bytes then the high bytes
FillVRAMSplit:
	sta.b $16
	lda.w $0761
	bpl .t1
	txa
	pha
	sta.w DAS1L
	sty.w VMADDL
	sty.b $14
	ldy.w #$0016
	sty.w A1T1L
	lda.w #$1808
	sta.w DMAP1
	sep #$20
	stz.w VMAIN
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	pla
	sta.w DAS1L
	clc
	adc.b $14
	pha
	ldy.b $14
	sty.w VMADDL
	ldy.w #$0017
	sty.w A1T1L
	lda.w #$1908
	sta.w DMAP1
	sep #$20
	lda.b #$80
	sta.w VMAIN
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	ply
	rtl

.t1:
	txa
	ldx.b $3C
.loop:
	pha
	cmp.w #$1001
	bcc .1
	lda.w #$1000
.1:
	pha
	sta.w $0104,x
	tya
	sta.w $0106,x
	lda.w #$0016
	sta.w $0101,x
	sep #$20
	stz.w $0103,x
	lda.b #$FD
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	pla
	sta.w $0104,x
	pha
	tya
	sta.w $0106,x
	pla
	clc
	adc.w $0106,x
	tay
	lda.w #$0017
	sta.w $0101,x
	sep #$20
	stz.w $0103,x
	lda.b #$FC
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
