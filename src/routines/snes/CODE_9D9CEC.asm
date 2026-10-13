; Unidentified routine.
CODE_9D9CEC:
	lda.b $A9
	clc
	adc.b [$8D]
	sta.b $A9
	inc.b $8D
	inc.b $8D
CODE_9D9CF7:
	dec.b $A5
	bpl CODE_9D9CEC
	lda.b $A9
	sta.b $A5
	jsl.l randomd0
CODE_9D9D03:
	dec.b $8D
	dec.b $8D
	lda.b $A5
	sec
	sbc.b [$8D]
	sta.b $A5
	bpl CODE_9D9D03
	lda.b $8D
	sec
	sbc.w #$0CF9
	lsr a
	sta.b $A5
	pla
	sta.b $8D
	pla
	sta.b $8F
	pla
	sta.b $A9
	pla
	sta.b $AB
	rtl
