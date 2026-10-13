; Unidentified routine.
CODE_9FB48B:
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9FB4B6
	stz.b $91
	lda.w #$0002
	sta.b $8D
	lda.w #$0001
	sta.b $A5
	bra CODE_9FB47F
