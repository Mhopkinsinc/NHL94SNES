; Unidentified routine.
CODE_9D9CEC:
	lda.b d1
	clc
	adc.b [a1]
	sta.b d1
	inc.b a1
	inc.b a1
CODE_9D9CF7:
	dec.b d0
	bpl CODE_9D9CEC
	lda.b d1
	sta.b d0
	jsl.l randomd0
.loop:
	dec.b a1
	dec.b a1
	lda.b d0
	sec
	sbc.b [a1]
	sta.b d0
	bpl .loop
	lda.b a1
	sec
	sbc.w #$0CF9
	lsr a
	sta.b d0
	pla
	sta.b a1
	pla
	sta.b $8F
	pla
	sta.b d1
	pla
	sta.b $AB
	rtl
