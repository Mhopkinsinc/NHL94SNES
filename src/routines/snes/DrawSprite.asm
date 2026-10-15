; draw frame $00 of the sprite set at [$10] at X, Y; A is xored into the tile and attribute word
DrawSprite:
		;   of each piece, and its flip bits also mirror the piece positions
	sta.b $14
	stx.b $1C
	sty.b $1E
	phb
	pea.w $7E7E
	plb
	plb
	lda.b $00
	sta.w DrawFrameNum
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
DrawSprite_draw:
	jsr.w GetFrameTiles
	bmi .1
	sta.b $16
	ldx.w OAMNext
	ldy.w #$0000
	lda.b [$0C],y
	and.w #$00FF
	sta.b $00
	bra .6
.1:
	plb
	rtl
.6:
	ldy.w #$0016
	lda.b $14
	bit.w #$8000
	beq .t1
	jmp.w DrawSpritePieces

.t1:
	bit.w #$4000
	beq .2
	jmp.w .8
.2:
	lda.w SpritesLeft
	beq .1
	lda.b [$0C],y
	sta.w PieceX
	iny
	iny
	lda.b [$0C],y
	sta.w PieceY
	iny
	iny
	lda.b [$0C],y
	sta.w PieceTile
	iny
	iny
	lda.b [$0C],y
	and.w #$00FF
	sta.w PieceSize
	iny
	sty.w PieceNext
	lda.w PieceY
	clc
	adc.b $1E
	cmp.w #$FFF0
	bmi .1x
	cmp.w #$00E0
	bmi .t2
.1x:
	jmp.w .5

.t2:
	sta.b $26
	lda.w PieceX
	clc
	adc.b $1C
	cmp.w #$0100
	bpl .5
	cmp.w #$FFF0
	bmi .5
	sta.b $20
	sta.w $0000,x
	lda.b $26
	sta.w $0001,x
	lda.w PieceTile
	clc
	adc.b $16
	eor.b $14
	sta.w $0002,x
	ldy.w OAMHiPtr
	ldx.w OAMHiShift
	sep #$20
	lda.b $21
	bpl .t3
	lda.w PieceSize
	beq .t1x
	lda.w $0000,y
	ora.w $E688,x
	bra .3

.t1x:
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E680,x
	bra .3

.t3:
	lda.w PieceSize
	beq .t1xx
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra .3

.t1xx:
	lda.w $0000,y
	and.w $E67C,x
.3:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl .t1xxx
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra .4

.t1xxx:
	stx.w OAMHiShift
.4:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
.5:
	ldy.w PieceNext
	dec.b $00
	beq .7
	jmp.w .2
.7:
	plb
	rtl
.8:
	lda.w SpritesLeft
	beq .7
	lda.b [$0C],y
	sta.w PieceX
	iny
	iny
	lda.b [$0C],y
	sta.w PieceY
	iny
	iny
	lda.b [$0C],y
	sta.w PieceTile
	iny
	iny
	lda.b [$0C],y
	and.w #$00FF
	sta.w PieceSize
	iny
	sty.w PieceNext
	lda.w PieceY
	clc
	adc.b $1E
	cmp.w #$FFF0
	bmi .1xx
	cmp.w #$00E0
	bmi .t1xxxx
.1xx:
	jmp.w .5x

.t1xxxx:
	sta.b $26
	lda.w PieceSize
	beq .t2x
	lda.b $1C
	sec
	sbc.w PieceX
	sec
	sbc.w #$000F
	bra .2x

.t2x:
	lda.b $1C
	sec
	sbc.w PieceX
	sec
	sbc.w #$0007
.2x:
	cmp.w #$0100
	bpl .5x
	cmp.w #$FFF0
	bmi .5x
	sta.b $20
	sta.w $0000,x
	lda.b $26
	sta.w $0001,x
	lda.w PieceTile
	clc
	adc.b $16
	eor.b $14
	sta.w $0002,x
	ldy.w OAMHiPtr
	ldx.w OAMHiShift
	sep #$20
	lda.b $21
	bpl .t2xx
	lda.w PieceSize
	beq .t1xxxxx
	lda.w $0000,y
	ora.w $E688,x
	bra .3x

.t1xxxxx:
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E680,x
	bra .3x

.t2xx:
	lda.w PieceSize
	beq .t1xxxxxx
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra .3x

.t1xxxxxx:
	lda.w $0000,y
	and.w $E67C,x
.3x:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl .t1xxxxxxx
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra .4x

.t1xxxxxxx:
	stx.w OAMHiShift
.4x:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
.5x:
	ldy.w PieceNext
	dec.b $00
	beq DrawSpriteExit
	jmp.w .8
; The exit of DrawSprite and DrawSpritePieces
DrawSpriteExit:
	plb
	rtl
