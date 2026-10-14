; Unidentified routine.
CODE_9FE1FA:
	lda.w $0D15
	asl a
	asl a
	sta.b d0
	tay
	lda.w $1EB7
	beq CODE_9FE21D
	cmp.w #$0001
	beq CODE_9FE235
	cmp.w #$0002
	beq CODE_9FE241
	cmp.w #$0003
	beq CODE_9FE24D
	cmp.w #$0004
	beq CODE_9FE259
	bra CODE_9FE229
