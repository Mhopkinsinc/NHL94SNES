; Unidentified routine.
CODE_9EC417:
	lda.w gmode
	bit.w #$0020
	bne CODE_9EC422
	jmp.w CODE_9EC4BB
