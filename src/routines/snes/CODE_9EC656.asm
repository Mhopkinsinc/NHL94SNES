; Unidentified routine.
CODE_9EC656:
	lda.w gmode
	bit.w #$0002
	bne CODE_9EC668
	lda.w $0AD9
	cmp.w #$000C
	bmi CODE_9EC6AA
	bra CODE_9EC672
