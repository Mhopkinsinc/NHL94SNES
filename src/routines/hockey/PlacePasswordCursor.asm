; Move the password cursor to character d5.
PlacePasswordCursor:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF231
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	phx
	ldx.b d5
	lda.w #$0006
	jsl.l DivX8U
	plx
	asl a
	adc.w printy
	sta.w printy
	lda.w RDMPYL
	asl a
	adc.w printx
	dec a
	dec a
	sta.w printx
	lda.w #$0003
	sta.b d0
	sta.b d1
CODE_9BCAF7:
	rtl
