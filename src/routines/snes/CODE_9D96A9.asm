; Unidentified routine.
CODE_9D96A9:
	phx
	phy
	lda.b $83
	sta.b $08
	lda.w #$001E
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	sta.b tmp0
	lda.b $00
	sta.b $08
	lda.w #$0002
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	asl a
	tax
	lda.l .1,x
	xba
	and.w #$00FF
	lsr a
	lsr a
	sta.b tmp1
	lda.l .1+2,x
	xba
	and.w #$00FF
	lsr a
	lsr a
	sec
	sbc.b tmp1
	phx
	ldx.b tmp0
	jsl.l Mul16S
	lda.w #$001E
	sta.b $04
	jsl.l Div32S
	plx
	lda.b $00
	clc
	adc.b tmp1
	and.w #$001F
	xba
	and.w #$FF00
	asl a
	asl a
	sta.b tmp2
	lda.l .1,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$001F
	sta.b tmp1
	lda.l .1+2,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$001F
	sec
	sbc.b tmp1
	phx
	ldx.b tmp0
	jsl.l Mul16S
	lda.w #$001E
	sta.b $04
	jsl.l Div32S
	plx
	lda.b $00
	clc
	adc.b tmp1
	and.w #$001F
	asl a
	asl a
	asl a
	asl a
	asl a
	tsb.b tmp2
	lda.l .1,x
	and.w #$001F
	sta.b tmp1
	lda.l .1+2,x
	and.w #$001F
	sec
	sbc.b tmp1
	phx
	ldx.b tmp0
	jsl.l Mul16S
	lda.w #$001E
	sta.b $04
	jsl.l Div32S
	plx
	lda.b $00
	clc
	adc.b tmp1
	and.w #$001F
	ora.b tmp2
	ply
	plx
	stx.b $10
	sty.b $12
	sta.b [$10]
	rtl
.1:
	dw $7FFF,$7E10,$7FFF
