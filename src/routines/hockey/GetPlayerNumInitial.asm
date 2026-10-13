; Unidentified routine.
GetPlayerNumInitial:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	stz.b $91
	lda.w TempPlOffset
	sta.b $A5
	bpl CODE_9FC595
	and.w #$00FF
	sta.b $A5
	lda.w #$0002
	sta.b $91
CODE_9FC595:
	jsl.l CODE_9FC427
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
