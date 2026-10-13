; Unidentified routine.
CODE_80B286:
	lda.w SpritesLeft
	beq CODE_80B284
	lda.b [$0C],y
	sta.w $07C8
	iny
	iny
	lda.b [$0C],y
	sta.w $07CA
	iny
	iny
	lda.b [$0C],y
	sta.w $07CC
	iny
	iny
	lda.b [$0C],y
	and.w #$00FF
	sta.w $07CE
	iny
	sty.w $07D0
	lda.w $07CE
	beq CODE_80B2BD
	lda.b $1E
	sec
	sbc.w $07CA
	sec
	sbc.w #$000F
	bra CODE_80B2C7
