; a1 = the time d0 (seconds) as a minutes:seconds string.
PushTime:
	lda.w #$0000
	sta.b a1+2
	lda.w #$0A48
	sta.b a1
	lda.b d0
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	dec.b a1
	sep #$20
	lda.w RDMPYL
	clc
	adc.b #$30
	sta.b [a1]
	rep #$30
	lda.b $00
	sta.b $08
	lda.w #$0006
	sta.b $04
	jsl.l Div16x8U
	dec.b a1
	sep #$20
	lda.w RDMPYL
	clc
	adc.b #$30
	sta.b [a1]
	rep #$20
	dec.b a1
	sep #$20
	lda.b #$3A
	sta.b [a1]
	rep #$30
	lda.b $00
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	dec.b a1
	sep #$20
	lda.w RDMPYL
	clc
	adc.b #$30
	sta.b [a1]
	rep #$30
	lda.b $00
	beq .noz
	dec.b a1
	sep #$20
	clc
	adc.b #$30
	sta.b [a1]
	rep #$30
.noz:
	dec.b a1
	dec.b a1
	lda.w #$0A48
	sec
	sbc.b a1
	sta.b [a1]
	rtl
