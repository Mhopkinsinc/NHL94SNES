; Unidentified routine.
CODE_9EF33C:
	lda.w gmode
	bit.w #$0002
	beq CODE_9EF346
	bra CODE_9EF352
