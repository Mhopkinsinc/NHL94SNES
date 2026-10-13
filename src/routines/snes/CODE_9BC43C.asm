; Unidentified routine.
CODE_9BC43C:
	lda.w #$0000
	sta.w $1DCD
CODE_9BC442:
	lda.w $1DCD
	cmp.w #$FFFF
	bne CODE_9BC442
	rts
