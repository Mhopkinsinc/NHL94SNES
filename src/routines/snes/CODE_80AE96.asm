; Unidentified routine.
CODE_80AE96:
	xba
	lda.b [$0C],y
	iny
	xba
.loop:
	cmp.w APUIO0
	bne .loop
	inc a
CODE_80AEA1:
	rep #$20
	sta.w APUIO0
	sep #$20
	dex
	bne CODE_80AE96
.loop:
	cmp.w APUIO0
	bne .loop
.loop2:
	adc.b #$03
	beq .loop2
CODE_80AEB4:
	pha
	rep #$20
	lda.b [$0C],y
	iny
	iny
	tax
	lda.b [$0C],y
	iny
	iny
	sta.w APUIO2
	sep #$20
	cpx.w #$0001
	lda.b #$00
	rol a
	sta.w APUIO1
	adc.b #$7F
	pla
	sta.w APUIO0
.loop:
	cmp.w APUIO0
	bne .loop
	bvs CODE_80AE8E
	stz.w APUIO0
	rep #$30
	rtl
