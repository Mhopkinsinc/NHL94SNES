; Unidentified routine.
CODE_808D16:
	lda.w #$0020
	sbc.b $1C
	asl a
	sta.b $20
	tax
	lda.b $0C
	pha
	phy
	jsl.l CODE_808950
	ply
	lda.b $18
	asl a
	sec
	sbc.b $20
	tax
	phy
	tya
	adc.w #DMA_OAM
	and.w #$FFE0
	tay
	jsl.l CODE_808950
	ply
	pla
	sta.b $0C
	jmp.w CODE_808CF5
