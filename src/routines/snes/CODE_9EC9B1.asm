; Unidentified routine.
CODE_9EC9B1:
	lda.w $0D49
	cmp.w #$0001
	bmi CODE_9EC9BD
	jsl.l CODE_9ECD9D
CODE_9EC9BD:
	jsl.l CODE_9ECD9D
	lda.b $8F
	sta.b $93
	lda.b $8D
	sta.b $91
	bra CODE_9EC9D7
