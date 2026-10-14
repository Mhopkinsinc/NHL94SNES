; Unidentified routine.
CODE_808BC6:
	lda.w #$0020
	sbc.b $1C
	asl a
	sta.b $20
	tax
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
	jmp.w CODE_808BAC
