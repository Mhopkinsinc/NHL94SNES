; Unidentified routine.
CODE_9BA8DB:
	lda.w gmode
	bit.w #$0010
	bne CODE_9BA8EB
	lda.w $0CA9
	beq CODE_9BA8F1
	dec a
	bne CODE_9BA8EE
CODE_9BA8EB:
	jmp.w CODE_9BAA5F
