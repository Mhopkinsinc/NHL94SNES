; Unidentified routine.
CODE_80B3CE:
	lda.b $0C
	cmp.w $2540,x
	bne .1
	lda.b $0E
	cmp.w $2640,x
	beq CODE_80B3C9
.1:
	inx
	inx
	dey
	bne CODE_80B3CE
LoadFrameTiles:		; allocate VRAM for the frame at [$0C], queue the DMA of its tiles and add a tile cache entry
	ldy.w $07BA
	cpy.w #$0080
	beq .t3
	lda.w #$0001
	sta.b $04
	lda.b $0E
	sta.b $07
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $00
	beq CODE_80B3C9
	ldy.w #$000C
	lda.b [$0C],y
	sta.w $07C8
	iny
	iny
	lda.b [$0C],y
	sta.w $07CA
	iny
	iny
	lda.b [$0C],y
	clc
	adc.b $0C
	sta.b $05
	ldy.w #$0002
	ldx.b $00
	bmi .t2
	jmp.w .6

.t2:
	lda.b [$0C],y
	clc
	adc.w #$0003
	and.w #$FFFC
	lsr a
	lsr a
	sta.b $14
	cmp.w #$0009
	bcc .t1
	jmp.w .t5

.t1:
	sep #$30
	lda.b #$00
.loop:
	tax
	lda.w $2F40,x
	beq .t3
	cmp.b #$10
	bcs .1
	cmp.b $14
	bcs .t4
.1:
	and.b #$3F
	sta.b $2A
	txa
	clc
	adc.b $2A
	bra .loop

.t3:
	rep #$30
	plb
	ply
	plx
	lda.w #$FFFF
	rtl

.t4:
	rep #$30
	stx.b $0A
	sep #$30
	lda.w $2F40,x
	sec
	sbc.b $14
	beq .1x
	sta.b $16
	txa
	clc
	adc.b $14
	tay
	lda.b $16
	sta.w $2F40,y
	txa
	sta.w $2FB9,y
	phy
	tya
	adc.b $16
	tay
	pla
	sta.w $2FB9,y
.1x:
	lda.b $14
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
	tax
	lda.b $04
	sta.w $0100,x
	lda.b $06
	sta.w $0102,x
	lda.w $07CA
	sta.w $0104,x
	bne .t1x
	stx.b $3C
	plb
	ply
	plx
	lda.w $07BA
	dec a
	asl a
	rtl

.t1x:
	lda.b $0A
	ora.w #$0100
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

.t5:
	sep #$30
	lda.b #$00
.2:
	tax
	lda.w $2F40,x
	beq .4
	cmp.b #$08
	bne .3
	stx.b $0A
.loopx:
	sta.b $2A
	txa
	clc
	adc.w $2F40,x
	tax
	lda.w $2F40,x
	beq .t1xx
	cmp.b #$10
	bcs .t1xx
	clc
	adc.b $2A
	bra .loopx

.t1xx:
	lda.b $2A
	cmp.b $14
	bcs .5
	lda.w $2F40,x
.3:
	and.b #$3F
	sta.b $2A
	txa
	clc
	adc.b $2A
	bra .2
.4:
	rep #$30
	plb
	ply
	plx
	lda.w #$FFFF
	rtl
.5:
	ldx.b $0A
	stz.b $0B
	lda.b $14
	sta.b $16
.loopxx:
	lda.b $16
	sec
	sbc.w $2F40,x
	beq .1xx
	bmi .t1xxx
	sta.b $16
	lda.b #$C8
	sta.w $2F40,x
	txa
	clc
	adc.b #$08
	tax
	bra .loopxx

.t1xxx:
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
.1xx:
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
	bne .t1xxxx
	sta.b $3C
	plb
	ply
	plx
	lda.w $07BA
	dec a
	asl a
	rtl

.t1xxxx:
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
.6:
	lda.b [$0C],y
	sta.b $14
	sep #$30
	lda.b #$00
.loopxxx:
	tax
	lda.w $3032,x
	beq .t1xxxxx
	bmi .1xxx
	cmp.b $14
	bcs .t2x
.1xxx:
	txa
	clc
	adc.w $3032,x
	and.b #$7F
	bra .loopxxx

.t1xxxxx:
	rep #$30
	plb
	ply
	plx
	lda.w #$FFFF
	rtl

.t2x:
	rep #$30
	stx.b $0A
	sep #$30
	lda.w $3032,x
	sec
	sbc.b $14
	beq .1xxxx
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
.1xxxx:
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
