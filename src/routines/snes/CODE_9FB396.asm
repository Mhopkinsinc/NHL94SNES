; Unidentified routine.
CODE_9FB396:
	lda.w gsp
	cmp.w #$0003
	bne CODE_9FB3AA
CODE_9FB39E:
	lda.w tmscore
	cmp.w $1790
	beq CODE_9FB3AA
	jml.l CODE_9F8B79
