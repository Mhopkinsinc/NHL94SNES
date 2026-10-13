; Unidentified routine.
CODE_9EE156:
	lda.w sflags
	bit.w #$0008
	bne CODE_9EE161
	jmp.w $8BE6
