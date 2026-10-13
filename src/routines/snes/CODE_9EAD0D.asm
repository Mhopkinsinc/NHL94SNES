; Unidentified routine.
CODE_9EAD0D:
	lda.b $C7
	cmp.w #$0004
	beq CODE_9EACFC
CODE_9EAD14:
	lda.w #$FFCA
	sta.b $A5
	rts
