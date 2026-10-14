; Unidentified routine.
CODE_9DB3FF:
	stz.w $0764
	jsr.w CODE_9DB9F7
	jsl.l WaitFrame
CODE_9DB409:
	lda.w $0764
	cmp.w #$1284
	bcs CODE_9DB41E
	lda.w $0BE9
	bne CODE_9DB41E
	jsr.w CODE_80BA13
	jsr.w CODE_9DB430
	bra CODE_9DB409
