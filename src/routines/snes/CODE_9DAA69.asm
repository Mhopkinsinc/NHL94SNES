; Unidentified routine.
CODE_9DAA69:
	ldy.b $C1
	lda.w #$007E
	sta.b $8F
	lda.w #$34BC
	sta.b $8D
	lda.b [$8D],y
	sta.b $B1
	jsl.l CODE_9BC5AB
	jsl.l CODE_9EC7BE
	bra CODE_9DAA54
