; DMA X bytes from [$0C] to the high bytes of video memory at Y
DMAToVRAMHigh:
	lda.w $0761
	bpl .t1
	stx.w DAS1L
	lda.b $0C
	sta.w A1T1L
	lda.w #$1900
	sta.w DMAP1
	sty.w VMADDL
	sty.b $14
	sep #$20
	lda.b $0E
	sta.w A1B1
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
	sta.b $14
	cmp.w #$1001
	bcc .1
	lda.w #$1000
.1:
	sta.w $0104,x
	pha
	tya
	sta.w $0106,x
	pla
	clc
	adc.w $0106,x
	tay
	lda.b $0C
	sta.w $0101,x
	clc
	adc.w #$1000
	sta.b $0C
	sep #$20
	lda.b $0E
	sta.w $0103,x
	lda.b #$FA
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	lda.b $14
	sec
	sbc.w #$1000
	beq .2
	bcs .loop
.2:
	stx.b $3C
	rtl
