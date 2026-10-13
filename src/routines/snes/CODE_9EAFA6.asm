; Unidentified routine.
CODE_9EAFA6:
	cpy.w #$FFDC
	bpl CODE_9EAFA3
	lda.b $C7
	ora.w #$0010
	sta.b $C7
	inc.b $C9
	rts
