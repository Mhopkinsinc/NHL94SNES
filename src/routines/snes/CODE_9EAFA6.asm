; Unidentified routine.
CODE_9EAFA6:
	cpy.w #$FFDC
	bpl CODE_9EAFA3
	lda.b tmp1
	ora.w #$0010
	sta.b tmp1
	inc.b tmp2
	rts
