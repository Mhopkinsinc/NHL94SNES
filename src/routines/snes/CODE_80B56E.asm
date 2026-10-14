; Unidentified routine.
CODE_80B56E:
	ldx.b $0A
	stz.b $0B
	lda.b $14
	sta.b $16
.loop:
	lda.b $16
	sec
	sbc.w $2F40,x
	beq CODE_80B5AA
	bmi .t1
	sta.b $16
	lda.b #$C8
	sta.w $2F40,x
	txa
	clc
	adc.b #$08
	tax
	bra .loop

.t1:
	eor.b #$FF
	inc a
	sta.b $2A
	txa
	clc
	adc.b $16
	tay
	lda.b $2A
	sta.w $2F40,y
	txa
	sta.w $2FB9,y
	phy
	tya
	adc.b $2A
	tay
	pla
	sta.w $2FB9,y
CODE_80B5AA:
	lda.b $16
	ora.b #$80
	sta.w $2F40,x
	rep #$30
	ldx.b $3C
	lda.b $04
	sta.w $0100,x
	lda.b $06
	sta.w $0102,x
	lda.w $07C8
	sta.w $0104,x
	clc
	adc.b $05
	sta.b $05
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
	ora.w #$8000
	sta.w $2C40,y
	lda.b $0A
	and.w #$FFF8
	asl a
	sta.b $14
	lda.b $0A
	and.w #$0007
	clc
	adc.b $14
	asl a
	sta.w $2E40,y
	asl a
	asl a
	asl a
	asl a
	adc.w SpriteVRAM
	sta.b $0A
	sta.w $0106,x
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	ldy.w $07CA
	bne .t1
	sta.b $3C
	plb
	ply
	plx
	lda.w $07BA
	dec a
	asl a
	rtl

.t1:
	tax
	lda.b $04
	sta.w $0100,x
	lda.b $06
	sta.w $0102,x
	tya
	sta.w $0104,x
	lda.w $07C8
	lsr a
	and.w #$FF00
	ora.w #$0100
	clc
	adc.b $0A
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
