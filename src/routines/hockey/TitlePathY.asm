; A = the y scroll of title path step A
TitlePathY:
	phx
	phy
	tax
	lda.w #$0050
	jsl.l Mul16x8XS
	lda.b r2+1
	sta.b r2
	lda.w #$0005
	sta.b r1
	jsl.l Div16S
	lda.w #$01B0
	sec
	sbc.b r0
	ply
	plx
	rts
