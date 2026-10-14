; Write the OAM entries of each piece of the frame at [$0C]; DrawSprite jumps here
DrawSpritePieces:
	lda.w SpritesLeft
	beq DrawSpriteExit
	lda.b [$0C],y
	sta.w $07C8
	iny
	iny
	lda.b [$0C],y
	sta.w $07CA
	iny
	iny
	lda.b [$0C],y
	sta.w $07CC
	iny
	iny
	lda.b [$0C],y
	and.w #$00FF
	sta.w $07CE
	iny
	sty.w $07D0
	lda.w $07CE
	beq .t1
	lda.b $1E
	sec
	sbc.w $07CA
	sec
	sbc.w #$000F
	bra .2

.t1:
	lda.b $1E
	sec
	sbc.w $07CA
	sec
	sbc.w #$0007
.2:
	cmp.w #$FFF0
	bmi .1
	cmp.w #$00E0
	bmi .t2
.1:
	jmp.w .6

.t2:
	sta.b $26
	lda.b $14
	and.w #$4000
	beq .t3
	lda.w $07CE
	beq .t1x
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$000F
	bra .3

.t1x:
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$0007
	bra .3

.t3:
	lda.w $07C8
	clc
	adc.b $1C
.3:
	cmp.w #$0100
	bpl .6
	cmp.w #$FFF0
	bmi .6
	sta.b $20
	sta.w $0000,x
	lda.b $26
	sta.w $0001,x
	lda.w $07CC
	clc
	adc.b $16
	eor.b $14
	sta.w $0002,x
	ldy.w OAMHiPtr
	ldx.w OAMHiShift
	sep #$20
	lda.b $21
	bpl .t2x
	lda.w $07CE
	beq .t1xx
	lda.w $0000,y
	ora.w $E688,x
	bra .4

.t1xx:
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E680,x
	bra .4

.t2x:
	lda.w $07CE
	beq .t1xxx
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra .4

.t1xxx:
	lda.w $0000,y
	and.w $E67C,x
.4:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl .t1xxxx
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra .5

.t1xxxx:
	stx.w OAMHiShift
.5:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
.6:
	ldy.w $07D0
	dec.b $00
	beq .t1xxxxx
	jmp.w DrawSpritePieces

.t1xxxxx:
	plb
	rtl

.t2xx:		; make sure the tiles of the frame at [$0C] are in VRAM; A = its tile cache entry, negative if no room
	phx
	phy
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w .7

.t1xxxxxx:		; the same for frame A of the sprite set at [$10]
	phx
	phy
	sta.w $07C4
	asl a
	asl a
	tay
	lda.b [$10],y
	clc
	adc.b $10
	sta.b $0C
	iny
	iny
	lda.b [$10],y
	adc.b $12
	sta.b $0E
	phb
	pea.w $7E7E
	plb
	plb
.7:
	ldy.w $07BA
	beq LoadFrameTiles
	ldx.w $07C6
	beq FindCachedFrame
	ldx.w $07C4
	lda.w $2740,x
	bmi LoadFrameTiles
	xba
	and.w #$00FF
	asl a
	tax
DrawSpritePieces_exit:
	txa
	plb
	ply
	plx
	rtl
