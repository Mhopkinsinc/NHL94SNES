; Unidentified routine.
CODE_9EAD0D:
	lda.b tmp1
	cmp.w #$0004
	beq CODE_9EACFC
CODE_9EAD14:
	lda.w #$FFCA
	sta.b d0
	rts
