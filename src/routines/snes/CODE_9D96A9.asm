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
	sta.b $C5
	lda.b $00
	sta.b $08
	lda.w #$0002
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	asl a
	tax
	lda.l DATA8_9D977D,x
	xba
	and.w #$00FF
	lsr a
	lsr a
	sta.b $C7
	lda.l DATA8_9D977D+2,x
	xba
	and.w #$00FF
	lsr a
	lsr a
	sec
	sbc.b $C7
	phx
	ldx.b $C5
	jsl.l Mul16S
	lda.w #$001E
	sta.b $04
	jsl.l Div32S
	plx
	lda.b $00
	clc
	adc.b $C7
	and.w #$001F
	xba
	and.w #$FF00
	asl a
	asl a
	sta.b $C9
	lda.l DATA8_9D977D,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$001F
	sta.b $C7
	lda.l DATA8_9D977D+2,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$001F
	sec
	sbc.b $C7
	phx
	ldx.b $C5
	jsl.l Mul16S
	lda.w #$001E
	sta.b $04
	jsl.l Div32S
	plx
	lda.b $00
	clc
	adc.b $C7
	and.w #$001F
	asl a
	asl a
	asl a
	asl a
	asl a
	tsb.b $C9
	lda.l DATA8_9D977D,x
	and.w #$001F
	sta.b $C7
	lda.l DATA8_9D977D+2,x
	and.w #$001F
	sec
	sbc.b $C7
	phx
	ldx.b $C5
	jsl.l Mul16S
	lda.w #$001E
	sta.b $04
	jsl.l Div32S
	plx
	lda.b $00
	clc
	adc.b $C7
	and.w #$001F
	ora.b $C9
	ply
	plx
	stx.b $10
	sty.b $12
	sta.b [$10]
	rtl
