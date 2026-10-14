; Unidentified routine.
CODE_9FC4A1:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b a2
	pha
	lda.b $93
	pha
	stz.b a2
	lda.w TempPlOffset
	sta.b d0
	bpl .1
	and.w #$00FF
	sta.b d0
	inc.b a2
	inc.b a2
.1:
	jsl.l CODE_9FC4D0
	pla
	sta.b $93
	pla
	sta.b a2
	pla
	sta.b $A7
	pla
	sta.b d0
	rtl
