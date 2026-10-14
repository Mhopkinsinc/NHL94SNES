; Unidentified routine.
CODE_9BAF80:
	lda.w sflags3
	bit.w #$0002
	bne CODE_9BAF8B
	jmp.w CODE_9BACE5
