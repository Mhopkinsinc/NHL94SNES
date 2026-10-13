; Unidentified routine.
CODE_9BABB3:
	tax
	lda.w Xpos,x
	sta.w $0D75
	cmp.w $0CBD
	bpl CODE_9BABD0
	lda.w $0CBD
	sec
	sbc.w #$0004
	cmp.w $0D75
	bpl CODE_9BABCE
CODE_9BABCB:
	lda.w $0D75
CODE_9BABCE:
	bra CODE_9BABDF
