; Unidentified routine.
CODE_9EAF00:
	lda.w #$FFDA
	sta.b $A5
	lda.b $C7
	and.w #$000A
	beq CODE_9EAEC3
	rts
