; Unidentified routine.
CODE_9FF1E4:
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF92C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0016
	sta.b $A5
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9D8000
	pla
	bit.w #$0001
	bne CODE_9FF220
	bit.w #$0002
	bne CODE_9FF25A
	bit.w #$0004
	bne CODE_9FF294
	jmp.w $F2CC
