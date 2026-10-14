; Unidentified routine.
CODE_9BC6D5:
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
	lda.b a2
	pha
	lda.b $93
	pha
	lda.w #$009B
	sta.b $93
	lda.w #PasstoText
	sta.b a2
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$007E
	sta.b $8B
	lda.w #$34F4
	sta.b a0
	lda.w #$0012
	sta.b [a1]
	inc.b a1
	inc.b a1
	lda.w #$000F
	sta.b d1
CODE_9BC71F:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	tay
	lda.b [a2],y
	sta.b [a1]
	inc.b a1
	dec.b d1
	bpl CODE_9BC71F
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	jsl.l print
	pla
	sta.b $93
	pla
	sta.b a2
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
CODE_9BC75D:
	rtl
