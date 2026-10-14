; Unidentified routine.
CODE_9F9531:
	lda.l $7E35D6
	asl a
	sta.b a0
	tax
	lda.w #$0004
	cmp.l $7E3548,x
	beq CODE_9F954B
	cmp.l $7E3558,x
	beq CODE_9F954B
	jmp.w CODE_9F961E
