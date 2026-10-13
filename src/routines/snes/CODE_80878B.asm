; Unidentified routine.
CODE_80878B:
	and.w #$00FF
	xba
	sta.b $14
	tya
	asl a
	tay
CODE_808794:
	lda.b [$0C],y
	and.w #$001F
	ora.b $14
	sta.w WRMPYA
	nop
	rep #$20
	lda.w RDMPYL
	xba
	and.w #$001F
	sta.b [$10],y
	lda.b [$0C],y
	asl a
	asl a
	asl a
	xba
	and.w #$001F
	ora.b $14
	sta.w WRMPYA
	nop
	rep #$20
	lda.w RDMPYL
	lsr a
	lsr a
	lsr a
	and.w #$03E0
	ora.b [$10],y
	sta.b [$10],y
	lda.b [$0C],y
	xba
	lsr a
	lsr a
	and.w #$001F
	ora.b $14
	sta.w WRMPYA
	nop
	rep #$20
	lda.w RDMPYL
	asl a
	asl a
	and.w #$7C00
	ora.b [$10],y
	sta.b [$10],y
	iny
	iny
	dex
	bne CODE_808794
	rtl
