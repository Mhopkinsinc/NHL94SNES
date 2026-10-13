; Unidentified routine.
CODE_9EAD1A:
	lda.w #$FFCA
	sta.b $A5
	lda.b $C7
	and.w #$000A
	beq CODE_9EACDD
	rts
