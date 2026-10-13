; Unidentified routine.
CODE_9ED93F:
	lda.w facedir,x
	beq CODE_9ED965
	cmp.w #$0004
	beq CODE_9ED96E
	cmp.w #$0001
	beq CODE_9ED977
	cmp.w #$0005
	beq CODE_9ED977
	cmp.w #$0007
	beq CODE_9ED97F
	cmp.w #$0003
	beq CODE_9ED97F
	lda.w seed
	and.w #$0001
	bra CODE_9ED9A0
