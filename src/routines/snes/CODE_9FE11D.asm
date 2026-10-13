; Unidentified routine.
CODE_9FE11D:
	lda.w #$FFFF
	sta.l $7E3476
	lda.w $1D81
	beq CODE_9FE130
	lda.w $1EBB
	bne CODE_9FE161
	bra CODE_9FE16F
