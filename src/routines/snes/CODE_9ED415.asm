; Unidentified routine.
CODE_9ED415:
	lda.w $0B05,x
	ora.w #$0001
	sta.w $0B05,x
CODE_9ED41E:
	jmp.w $D46A
