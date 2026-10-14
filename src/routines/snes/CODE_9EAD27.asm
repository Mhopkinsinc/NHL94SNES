; Unidentified routine.
CODE_9EAD27:
	lda.b tmp1
	cmp.w #$0004
	beq CODE_9EACDD
.1:
	lda.w #$FFCA
	sta.b d0
	rts
