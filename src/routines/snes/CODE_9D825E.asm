; Unidentified routine.
CODE_9D825E:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF395
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0014
	sta.b $A5
	lda.w #$0009
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	jsl.l CODE_9D842F
	bra CODE_9D8217
