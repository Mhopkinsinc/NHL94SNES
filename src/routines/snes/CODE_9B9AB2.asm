; Unidentified routine.
CODE_9B9AB2:
	lda.w $1DBD
	clc
	adc.w #$0005
	cmp.w $1DC1
	bpl CODE_9B9ADA
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF14B
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9B9AF4
