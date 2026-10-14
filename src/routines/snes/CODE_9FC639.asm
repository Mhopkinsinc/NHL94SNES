; Unidentified routine.
CODE_9FC639:
	sta.b d0
PushNumberWidth:
	lda.w #$0000
	sta.b $8F
	lda.w #$0A8E
	sta.b a1
	lda.b d1
	inc a
	inc a
	sta.w $0A8E
	tay
	lda.w #$2020
	sta.w $0A90
	sta.w $0A92
	sta.w $0A94
	sta.w $0A96
	phx
	lda.b d0
CODE_9FC65F:
	sta.b $08
	lda.w #$000A
	sta.b $04
	dey
	jsl.l Div16x8U
	lda.w RDMPYL
	sep #$20
	clc
	adc.b #$30
	sta.w $0A8E,y
	rep #$20
	lda.b $00
	bne CODE_9FC65F
	plx
	pla
	sta.b d0
	lda.b $00
	rtl
