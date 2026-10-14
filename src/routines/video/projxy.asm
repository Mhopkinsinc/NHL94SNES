; Project a rink position to screen coordinates
projxy:
	lda.w sfhormode
	beq CODE_9BC128
	lda.b d0
	pha
	lda.b d1
	eor.w #$FFFF
	inc a
	sta.b d0
	pla
	sec
	sbc.w #tmp0
	sta.b d1
	bra CODE_9BC138
