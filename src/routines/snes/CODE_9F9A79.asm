; Unidentified routine.
CODE_9F9A79:
	tax
	lda.w #$0007
CODE_9F9A7D:
	jsl.l DivX8U
	sec
	eor.w #$FFFF
	adc.b $A5
	sta.b $A5
	lda.b $A5
	bpl CODE_9F9AB4
	stz.b $A5
	lda.w #$0000
	bra CODE_9F9AB4
