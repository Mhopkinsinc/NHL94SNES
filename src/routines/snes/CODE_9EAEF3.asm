; Unidentified routine.
CODE_9EAEF3:
	lda.b tmp1
	cmp.w #$0004
	beq CODE_9EAEE2
	lda.w #$FFDA
	sta.b d0
	rts
