; Unidentified routine.
CODE_9EACE8:
	lda.w #$0036
	sta.b $A5
	lda.b $C7
	and.w #$000A
	beq CODE_9EACDD
	rts
