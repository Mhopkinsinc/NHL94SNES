; Unidentified routine.
CODE_9EF7BF:
	lda.b $A5
	sec
	sbc.w $0E9F
	bmi CODE_9EF829
CODE_9EF7C7:
	jsl.l CODE_9EC6E7
	lda.w gmode
	bit.w #$0020
	bne CODE_9EF7D6
	jmp.w CODE_9EF829
