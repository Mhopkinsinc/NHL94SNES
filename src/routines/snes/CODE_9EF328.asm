; Unidentified routine.
CODE_9EF328:
	lda.w $163A
	beq CODE_9EF357
	lda.w pucky
	bpl CODE_9EF33C
	lda.w gmode
	bit.w #$0002
	beq CODE_9EF352
	bra CODE_9EF346
