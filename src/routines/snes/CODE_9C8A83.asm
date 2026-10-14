; Unidentified routine.
CODE_9C8A83:
	phy
	lda.b d1
	pha
	lda.w #$FFFF
	jsl.l CODE_9C8D17
	lda.w #$0003
	sta.w printx
	stx.b d0
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
	stx.w $1DC9
	lda.b a2
	beq .1
	lda.w #$001A
.1:
	clc
	adc.w $1DC9
	tax
	lda.w #$0012
	sta.w printx
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$0016
	sta.w printx
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$001B
	sta.w printx
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$0064
	jsl.l CODE_808F5D
	sta.b $08
	plx
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	sta.b $04
	cmp.w #$0000
	beq .t1
	jsl.l Div16U
	lda.b $00
	sta.b d0
	bra .2

.t1:
	lda.w #$0064
	sta.b d0
.2:
	lda.w #$0064
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$001E
	sta.w printx
	lda.w #$009C
	sta.b $8F
	lda.w #PercentSign
	sta.b a1
	jsl.l CODE_9EC894
	pla
	sta.b d1
	ply
	rtl
