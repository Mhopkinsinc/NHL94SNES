; Unidentified routine.
CODE_9EAD1A:
	lda.w #$FFCA
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq CODE_9EACDD
	rts
