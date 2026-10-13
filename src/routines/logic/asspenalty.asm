; Unidentified routine.
asspenalty:
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9EBCD2
	jmp.w $BD1D
