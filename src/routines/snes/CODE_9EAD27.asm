; Unidentified routine.
CODE_9EAD27:
	lda.b $C7
	cmp.w #$0004
	beq CODE_9EACDD
CODE_9EAD2E:
	lda.w #$FFCA
	sta.b $A5
	rts
