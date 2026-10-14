; Unidentified routine.
CODE_9F9A79:
	tax
	lda.w #$0007
CODE_9F9A7D:
	jsl.l DivX8U
	sec
	eor.w #$FFFF
	adc.b d0
	sta.b d0
	lda.b d0
	bpl CODE_9F9AB4
	stz.b d0
	lda.w #$0000
	bra CODE_9F9AB4
