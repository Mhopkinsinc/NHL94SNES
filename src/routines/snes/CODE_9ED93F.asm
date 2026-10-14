; Unidentified routine.
CODE_9ED93F:
	lda.w facedir,x
	beq .t1
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
	lda.w $0792
	and.w #$0001
	bra CODE_9ED9A0

.t1:
	lda.b $02
	bpl CODE_9ED972
CODE_9ED969:
	lda.w #$0007
	bra CODE_9ED9A0
