; Unidentified routine.
CODE_9FB4A2:
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9FB4B6
	stz.b a1
	lda.w #$0002
	sta.b a2
	sta.b d0
	bra CODE_9FB47F
