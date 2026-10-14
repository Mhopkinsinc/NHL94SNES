; Unidentified routine.
CODE_9D825E:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF395
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0014
	sta.b d0
	lda.w #$0009
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	jsl.l CODE_9D842F
	bra CODE_9D8217
