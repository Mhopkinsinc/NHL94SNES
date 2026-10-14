; Unidentified routine.
CODE_80B661:
	lda.b [$0C],y
	sta.b $14
	sep #$30
	lda.b #$00
.loop:
	tax
	lda.w $3032,x
	beq .t1
	bmi .1
	cmp.b $14
	bcs .t2
.1:
	txa
	clc
	adc.w $3032,x
	and.b #$7F
	bra .loop

.t1:
	rep #$30
	plb
	ply
	plx
	lda.w #$FFFF
	rtl

.t2:
	rep #$30
	stx.b $0A
	sep #$30
	lda.w $3032,x
	sec
	sbc.b $14
	beq .1x
	sta.b $16
	txa
	clc
	adc.b $14
	tay
	lda.b $16
	sta.w $3032,y
	txa
	sta.w $3093,y
	phy
	tya
	adc.b $16
	tay
	pla
	sta.w $3093,y
.1x:
	lda.b $14
	ora.b #$80
	sta.w $3032,x
	rep #$30
	ldx.b $3C
	lda.b $04
	sta.w $0100,x
	lda.b $06
	sta.w $0102,x
	lda.w $07C8
	sta.w $0104,x
	ldy.w $07C4
	sep #$20
	lda.w $07BA
	sta.w $2741,y
	rep #$20
	lda.w $07BA
	asl a
	tay
	lda.w $07C4
	sta.w $2B40,y
	lda.b $0C
	sta.w $2540,y
	lda.b $0E
	sta.w $2640,y
	inc.w $07BA
	lda.b $0A
	sta.w $2C40,y
	lda.b $0A
	clc
	adc.w $07B8
	sta.w $2E40,y
	asl a
	asl a
	asl a
	asl a
	adc.w SpriteVRAM
	sta.w $0106,x
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	sta.b $3C
	plb
	ply
	plx
	lda.w $07BA
	dec a
	asl a
	rtl
