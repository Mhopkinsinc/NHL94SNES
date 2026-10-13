; Unidentified routine.
CODE_9BCAB8:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF231
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	phx
	ldx.b $B9
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
	sta.b $A5
	sta.b $A9
CODE_9BCAF7:
	rtl
