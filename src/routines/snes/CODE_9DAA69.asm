; Unidentified routine.
CODE_9DAA69:
	ldy.b d7
	lda.w #$007E
	sta.b $8F
	lda.w #$34BC
	sta.b a1
	lda.b [a1],y
	sta.b d3
	jsl.l CODE_9BC5AB
	jsl.l print
	bra CODE_9DAA54
