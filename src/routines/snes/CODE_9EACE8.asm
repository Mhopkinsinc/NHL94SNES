; Unidentified routine.
CODE_9EACE8:
	lda.w #$0036
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq CODE_9EACDD
	rts
