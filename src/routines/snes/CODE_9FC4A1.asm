; Unidentified routine.
CODE_9FC4A1:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	stz.b $91
	lda.w $1636
	sta.b $A5
	bpl CODE_9FC4BF
	and.w #$00FF
	sta.b $A5
	inc.b $91
	inc.b $91
CODE_9FC4BF:
	jsl.l CODE_9FC4D0
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
