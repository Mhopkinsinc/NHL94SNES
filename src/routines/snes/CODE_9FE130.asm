; Unidentified routine.
CODE_9FE130:
	lda.w gsp
	cmp.w #$0004
	beq CODE_9FE145
	lda.w $1EBB
	bne CODE_9FE153
	bra CODE_9FE13F
