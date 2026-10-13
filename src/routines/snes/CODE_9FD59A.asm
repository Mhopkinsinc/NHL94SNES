; Unidentified routine.
CODE_9FD59A:
	ldy.b $91
	lda.w tmgoalie,y
	bpl CODE_9FD5A3
	inc.b $89
CODE_9FD5A3:
	lda.b $97
	pha
	lda.b $95
	pha
	jsl.l CODE_9B9320
	lda.b $97
	sta.b $8F
	lda.b $95
	sta.b $8D
	pla
	sta.b $95
	pla
	sta.b $97
	ldy.b $91
	lda.w tmline,y
	asl a
	asl a
	asl a
	sta.b $A5
	adc.b $8D
	sta.b $8D
	lda.w tmap,y
	sta.b $B5
	bra CODE_9FD61C
