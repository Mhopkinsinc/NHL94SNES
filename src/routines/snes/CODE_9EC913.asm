; Unidentified routine.
CODE_9EC913:
	lda.b d0
	pha
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF776
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0018
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l Framer
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF77B
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	pla
	sta.b d0
	rtl
