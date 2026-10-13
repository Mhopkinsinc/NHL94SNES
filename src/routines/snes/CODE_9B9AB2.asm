; Unidentified routine.
CODE_9B9AB2:
	lda.w $1DBD
	clc
	adc.w #$0005
	cmp.w $1DC1
	bpl CODE_9B9ADA
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF14B
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9B9AF4
