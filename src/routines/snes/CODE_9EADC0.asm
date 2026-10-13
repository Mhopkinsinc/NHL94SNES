; Unidentified routine.
CODE_9EADC0:
	cpy.w #$FFD4
	bpl CODE_9EADBD
	lda.b $C7
	ora.w #$0010
	sta.b $C7
	inc.b $C9
	rts
