; Unidentified routine.
CODE_9DBFD2:
	lda.w $1E83
	cmp.w #$0050
	bpl CODE_9DBFDD
CODE_9DBFDA:
	jmp.w $C0BB
