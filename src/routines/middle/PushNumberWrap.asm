; PushNumberWidth, with d0 taken mod 100 when the width d1 is 2
PushNumberWrap:
	lda.b d0
	pha
	lda.b d1
	cmp.w #$0002
	bne PushNumberWidth
	lda.b d0
.loop:
	cmp.w #$0064
	bcc .t1
	sbc.w #$0064
	bra .loop

.t1:
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
.loop:
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
	bne .loop
	plx
	pla
	sta.b d0
	lda.b $00
	rtl
