; draw frame $00 of the sprite set at [p1] at X, Y; A is xored into the tile and attribute word
DrawSprite:
		;   of each piece, and its flip bits also mirror the piece positions
	sta.b r3
	stx.b r5
	sty.b r5+2
	phb
	pea.w $7E7E
	plb
	plb
	lda.b r0
	sta.w DrawFrameNum
	asl a
	asl a
	tay
	lda.b [p1],y
	clc
	adc.b p1
	sta.b p0
	iny
	iny
	lda.b [p1],y
	adc.b p1+2
	sta.b p0+2
DrawSprite_draw:
	jsr.w GetFrameTiles
	bmi .1
	sta.b r3+2
	ldx.w OAMNext
	ldy.w #$0000
	lda.b [p0],y
	and.w #$00FF
	sta.b r0
	bra .6
.1:
	plb
	rtl
.6:
	ldy.w #$0016
	lda.b r3
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
	lda.b [p0],y
	sta.w PieceX
	iny
	iny
	lda.b [p0],y
	sta.w PieceY
	iny
	iny
	lda.b [p0],y
	sta.w PieceTile
	iny
	iny
	lda.b [p0],y
	and.w #$00FF
	sta.w PieceSize
	iny
	sty.w PieceNext
	lda.w PieceY
	clc
	adc.b r5+2
	cmp.w #$FFF0
	bmi .1x
	cmp.w #$00E0
	bmi .t2
.1x:
	jmp.w .5

.t2:
	sta.b r7+2
	lda.w PieceX
	clc
	adc.b r5
	cmp.w #$0100
	bpl .5
	cmp.w #$FFF0
	bmi .5
	sta.b r6
	sta.w $0000,x
	lda.b r7+2
	sta.w $0001,x
	lda.w PieceTile
	clc
	adc.b r3+2
	eor.b r3
	sta.w $0002,x
	ldy.w OAMHiPtr
	ldx.w OAMHiShift
	sep #$20
	lda.b r6+1
	bpl .t3
	lda.w PieceSize
	beq .t1x
	lda.w $0000,y
	ora.w OAMHiMasks+12,x
	bra .3

.t1x:
	lda.w $0000,y
	and.w OAMHiMasks,x
	ora.w OAMHiMasks+4,x
	bra .3

.t3:
	lda.w PieceSize
	beq .t1xx
	lda.w $0000,y
	and.w OAMHiMasks,x
	ora.w OAMHiMasks+8,x
	bra .3

.t1xx:
	lda.w $0000,y
	and.w OAMHiMasks,x
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
	dec.b r0
	beq .7
	jmp.w .2
.7:
	plb
	rtl
.8:
	lda.w SpritesLeft
	beq .7
	lda.b [p0],y
	sta.w PieceX
	iny
	iny
	lda.b [p0],y
	sta.w PieceY
	iny
	iny
	lda.b [p0],y
	sta.w PieceTile
	iny
	iny
	lda.b [p0],y
	and.w #$00FF
	sta.w PieceSize
	iny
	sty.w PieceNext
	lda.w PieceY
	clc
	adc.b r5+2
	cmp.w #$FFF0
	bmi .1xx
	cmp.w #$00E0
	bmi .t1xxxx
.1xx:
	jmp.w .5x

.t1xxxx:
	sta.b r7+2
	lda.w PieceSize
	beq .t2x
	lda.b r5
	sec
	sbc.w PieceX
	sec
	sbc.w #$000F
	bra .2x

.t2x:
	lda.b r5
	sec
	sbc.w PieceX
	sec
	sbc.w #$0007
.2x:
	cmp.w #$0100
	bpl .5x
	cmp.w #$FFF0
	bmi .5x
	sta.b r6
	sta.w $0000,x
	lda.b r7+2
	sta.w $0001,x
	lda.w PieceTile
	clc
	adc.b r3+2
	eor.b r3
	sta.w $0002,x
	ldy.w OAMHiPtr
	ldx.w OAMHiShift
	sep #$20
	lda.b r6+1
	bpl .t2xx
	lda.w PieceSize
	beq .t1xxxxx
	lda.w $0000,y
	ora.w OAMHiMasks+12,x
	bra .3x

.t1xxxxx:
	lda.w $0000,y
	and.w OAMHiMasks,x
	ora.w OAMHiMasks+4,x
	bra .3x

.t2xx:
	lda.w PieceSize
	beq .t1xxxxxx
	lda.w $0000,y
	and.w OAMHiMasks,x
	ora.w OAMHiMasks+8,x
	bra .3x

.t1xxxxxx:
	lda.w $0000,y
	and.w OAMHiMasks,x
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
	dec.b r0
	beq DrawSpriteExit
	jmp.w .8
; The exit of DrawSprite and DrawSpritePieces
DrawSpriteExit:
	plb
	rtl
