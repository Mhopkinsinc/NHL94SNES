; Unidentified routine.
CODE_9DB934:
	phx
	phy
	tax
	lda.w #$0050
	jsl.l Mul16x8XS
	lda.b $09
	sta.b $08
	lda.w #$0005
	sta.b $04
	jsl.l Div16S
	lda.w #$01B0
	sec
	sbc.b $00
	ply
	plx
	rts
