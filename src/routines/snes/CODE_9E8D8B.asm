; Unidentified routine.
CODE_9E8D8B:
	lda.w #$0000
	sec
	sbc.b $B9
	sta.b $B9
	cmp.b $B1
	bpl CODE_9E8DB2
	lda.b $AD
	cmp.b $B5
	bmi CODE_9E8DB5
	lda.w #$0000
	sec
	sbc.b $B5
	sta.b $B5
	cmp.b $AD
	bmi CODE_9E8DB5
	lda.w #$0018
	sta.b $91
	jsl.l CODE_9E90AE
CODE_9E8DB2:
	jmp.w CODE_9E8E3A
