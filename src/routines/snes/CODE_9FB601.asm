; Unidentified routine.
CODE_9FB601:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.w #$0000
	sta.b $8B
	lda.w #PenBuf
	sta.b a0
CODE_9FB623:
	lda.b [a0]
	jsl.l CODE_9FB64A
	inc.b a0
	inc.b a0
	lda.b [a0]
	bne CODE_9FB623
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	rtl
