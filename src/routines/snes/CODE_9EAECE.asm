; Unidentified routine.
CODE_9EAECE:
	lda.w #$0026
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq CODE_9EAEC3
	rts
