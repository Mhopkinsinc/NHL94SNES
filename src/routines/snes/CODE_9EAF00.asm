; Unidentified routine.
CODE_9EAF00:
	lda.w #$FFDA
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq CODE_9EAEC3
	rts
