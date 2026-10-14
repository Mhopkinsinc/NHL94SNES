; Unidentified routine.
CODE_9EADC0:
	cpy.w #$FFD4
	bpl CODE_9EADBD
	lda.b tmp1
	ora.w #$0010
	sta.b tmp1
	inc.b tmp2
	rts
