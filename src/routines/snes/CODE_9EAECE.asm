; Unidentified routine.
CODE_9EAECE:
	lda.w #$0026
	sta.b $A5
	lda.b $C7
	and.w #$000A
	beq CODE_9EAEC3
	rts
