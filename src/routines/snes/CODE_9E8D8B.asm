; Unidentified routine.
CODE_9E8D8B:
	lda.w #$0000
	sec
	sbc.b d5
	sta.b d5
	cmp.b d3
	bpl CODE_9E8DB2
	lda.b d2
	cmp.b d4
	bmi CODE_9E8DB5
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
	cmp.b d2
	bmi CODE_9E8DB5
	lda.w #$0018
	sta.b a2
	jsl.l CODE_9E90AE
CODE_9E8DB2:
	jmp.w CODE_9E8E3A
