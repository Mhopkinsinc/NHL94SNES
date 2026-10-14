; Unidentified routine.
CODE_9EAF0D:
	lda.b tmp1
	cmp.w #$0004
	beq CODE_9EAEC3
	lda.w #$FFDA
	sta.b d0
	rts
