; DMA X bytes from [$0C] to video memory at Y
DMAToVRAM:
	lda.w $0761
	bpl CODE_808950
	stx.w DAS1L
	lda.b $0C
	sta.w A1T1L
	lda.w #DMA_VRAMWORD
	sta.w DMAP1
	cpy.w #$0000
	bmi .1
	sty.w VMADDL
	sty.b $14
.1:
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
