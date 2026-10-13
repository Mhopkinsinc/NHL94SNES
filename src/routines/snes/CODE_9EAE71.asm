; Unidentified routine.
CODE_9EAE71:
	lda.b $0E
	cmp.w #$FEF8
	bpl CODE_9EAE8A
CODE_9EAE78:
	lda.b $0C
	cmp.w #$FFDB
	bmi CODE_9EAE6B
	cmp.w #$0026
	bpl CODE_9EAEC8
	lda.b $14
	sta.b $A9
	bra CODE_9EAEA2
