; Unidentified routine.
CODE_9EE156:
	lda.w sflags
	bit.w #$0008
	bne CODE_9EE161
	jmp.w CODE_9E8BE6
