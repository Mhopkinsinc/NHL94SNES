; Unidentified routine.
CODE_808AA1:
	lda.w #$0020
	sbc.b $1C
	sta.b $20
	tax
	ldy.w #$0000
CODE_808AAC:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne CODE_808AAC
	lda.b $01,s
	clc
	adc.w #$0400
	and.w #$FFE0
	sta.w VMADDL
	lda.b $18
	sec
	sbc.b $20
	tax
CODE_808ACD:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne CODE_808ACD
	jmp.w CODE_808A80
