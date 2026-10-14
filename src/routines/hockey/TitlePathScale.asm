; A = the mode 7 scale of title path step A
TitlePathScale:
	phx
	phy
	cmp.w #$0400
	bcs .t1
	ldx.w #$0E00
	jsl.l Mul16U
	lda.b $09
	sta.b $08
	lda.w #$0008
	sta.b $04
	jsl.l Div16S
	asl.b $00
	lda.w #$0F00
	bra .1

.t1:
	sec
	sbc.w #$0400
	ldx.w #$00C0
	jsl.l Mul16U
	lda.b $09
	sta.b $08
	lda.w #$0002
	sta.b $04
	jsl.l Div16S
	asl.b $00
	lda.w #$0100
.1:
	sec
	sbc.b $00
	ply
	plx
	rts
