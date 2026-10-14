; Unidentified routine.
CODE_9DB8C3:
	sec
	sbc.w #DMA_OAM
	ldx.w #$00C0
	jsl.l Mul16U
	lda.b $09
	sta.b $08
	lda.w #$0002
	sta.b $04
	jsl.l Div16S
	asl.b $00
	lda.w #$0100
CODE_9DB8E0:
	sec
	sbc.b $00
	ply
	plx
	rts
