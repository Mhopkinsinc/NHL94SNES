; A = the x offset of title path step A (Sin)
TitlePathX:
	phx
	phy
	cmp.w #$0480
	bcc .t1
	sec
	sbc.w #$0480
	tax
	lda.w #$00C6
	jsl.l Mul16x8U
	lda.w #$0080
	sta.b $04
	jsl.l Div16U
	lda.b $00
	clc
	adc.w #$0066
	bra .1

.t1:
	pha
	tax
	lda.w #$000A
	jsl.l Mul16x8U
	lda.w #$0050
	sta.b $04
	jsl.l Div16U
	lda.b $00
	clc
	adc.w #$0001
	tax
	pla
	phx
	jsl.l Sin
	tax
	pla
	jsl.l Mul16x8XS
	lda.b $09
.1:
	ply
	plx
	rts
