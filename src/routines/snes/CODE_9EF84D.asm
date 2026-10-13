; Unidentified routine.
CODE_9EF84D:
	lda.b $A5
	sec
	sbc.w $0E9F
	bmi CODE_9EF829
CODE_9EF855:
	jsl.l CODE_9EC6E7
	lda.w gmode
	bit.w #$0020
	bne CODE_9EF864
	jmp.w $F829
