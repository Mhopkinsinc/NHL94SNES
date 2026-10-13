; Unidentified routine.
CODE_9C8F27:
	lda.w #$0000
	sta.w $1DCD
CODE_9C8F2D:
	lda.w $1DCD
	cmp.w #$FFFF
	bne CODE_9C8F2D
	rts
