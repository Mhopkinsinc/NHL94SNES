; Unidentified routine.
assepen:
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9EBAE5
	jmp.w $BB35
