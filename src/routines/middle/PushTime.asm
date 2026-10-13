; Unidentified routine.
PushTime:
	lda.w #$0000
	sta.b $8F
	lda.w #$0A48
	sta.b $8D
	lda.b $A5
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	dec.b $8D
	sep #$20
	lda.w RDMPYL
	clc
	adc.b #$30
	sta.b [$8D]
	rep #$30
	lda.b $00
	sta.b $08
	lda.w #$0006
	sta.b $04
	jsl.l Div16x8U
	dec.b $8D
	sep #$20
	lda.w RDMPYL
	clc
	adc.b #$30
	sta.b [$8D]
	rep #$20
	dec.b $8D
	sep #$20
	lda.b #$3A
	sta.b [$8D]
	rep #$30
	lda.b $00
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	dec.b $8D
	sep #$20
	lda.w RDMPYL
	clc
	adc.b #$30
	sta.b [$8D]
	rep #$30
	lda.b $00
	beq CODE_9FA44B
	dec.b $8D
	sep #$20
	clc
	adc.b #$30
	sta.b [$8D]
	rep #$30
CODE_9FA44B:
	dec.b $8D
	dec.b $8D
	lda.w #$0A48
	sec
	sbc.b $8D
	sta.b [$8D]
	rtl
