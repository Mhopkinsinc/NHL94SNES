; Unidentified routine.
CODE_9FB4A2:
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9FB4B6
	stz.b $8D
	lda.w #$0002
	sta.b $91
	sta.b $A5
	bra CODE_9FB47F
