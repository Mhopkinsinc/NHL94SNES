; Unidentified routine.
CODE_9FD59A:
	ldy.b a2
	lda.w tmgoalie,y
	bpl CODE_9FD5A3
	inc.b a0
CODE_9FD5A3:
	lda.b $97
	pha
	lda.b a3
	pha
	jsl.l CODE_9B9320
	lda.b $97
	sta.b $8F
	lda.b a3
	sta.b a1
	pla
	sta.b a3
	pla
	sta.b $97
	ldy.b a2
	lda.w tmline,y
	asl a
	asl a
	asl a
	sta.b d0
	adc.b a1
	sta.b a1
	lda.w tmap,y
	sta.b d4
	bra CODE_9FD61C
