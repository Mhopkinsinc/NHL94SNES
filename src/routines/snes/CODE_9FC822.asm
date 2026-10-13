; Unidentified routine.
CODE_9FC822:
	tay
	lda.w #$0001
CODE_9FC826:
	cpy.w #$0000
	beq CODE_9FC82F
	asl a
	dey
	bra CODE_9FC826
