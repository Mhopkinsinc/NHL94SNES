; Unidentified routine.
CODE_9B89E6:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF005
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$0011
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	rts
