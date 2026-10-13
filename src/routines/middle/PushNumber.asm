; Unidentified routine.
PushNumber:
	phx
	lda.w #$0000
	sta.b $8F
	lda.w #$0A48
	sta.b $8D
	lda.b $A5
CODE_9FC5F8:
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
	bne CODE_9FC5F8
	dec.b $8D
	dec.b $8D
	lda.w #$0A48
	sec
	sbc.b $8D
	sta.b [$8D]
	plx
	rtl
