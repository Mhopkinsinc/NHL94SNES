; Unidentified routine.
CODE_808AA1:
	lda.w #$0020
	sbc.b $1C
	sta.b $20
	tax
	ldy.w #$0000
.loop:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne .loop
	lda.b $01,s
	clc
	adc.w #DMA_OAM
	and.w #$FFE0
	sta.w VMADDL
	lda.b $18
	sec
	sbc.b $20
	tax
.loop2:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne .loop2
	jmp.w CODE_808A80
