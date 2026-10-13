; Unidentified routine.
CODE_9EAEF3:
	lda.b $C7
	cmp.w #$0004
	beq CODE_9EAEE2
	lda.w #$FFDA
	sta.b $A5
	rts
