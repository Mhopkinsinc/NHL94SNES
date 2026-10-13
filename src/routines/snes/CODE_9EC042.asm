; Unidentified routine.
CODE_9EC042:
	lda.w gmode
	bit.w #$0010
	bne CODE_9EC06D
	lda.b $91
	cmp.w $0AD9
	bne CODE_9EC06D
	lda.w $1E8B
	bne CODE_9EC059
	jmp.w $C06D
