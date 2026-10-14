; Unidentified routine.
CODE_9DBA44:
	cmp.w #$0001
	bne CODE_9DBA5E
	lda.w $0BE3
	dec a
	dec a
	cmp.w #tmp2
	bpl CODE_9DBA39
CODE_9DBA53:
	lda.w #$0002
	sta.w $0BD9
	lda.w #$0046
	bra CODE_9DBABA
