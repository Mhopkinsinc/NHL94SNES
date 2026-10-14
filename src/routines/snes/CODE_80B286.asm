; Unidentified routine.
CODE_80B286:
	lda.w SpritesLeft
	beq CODE_80B284
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
	bra CODE_80B2C7

.t1:
	lda.b $1E
	sec
	sbc.w $07CA
	sec
	sbc.w #$0007
CODE_80B2C7:
	cmp.w #$FFF0
	bmi .1
	cmp.w #$00E0
	bmi .t2
.1:
	jmp.w CODE_80B37D

.t2:
	sta.b $26
	lda.b $14
	and.w #$4000
	beq .t3
	lda.w $07CE
	beq .t1
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$000F
	bra CODE_80B300

.t1:
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$0007
	bra CODE_80B300

.t3:
	lda.w $07C8
	clc
	adc.b $1C
CODE_80B300:
	cmp.w #$0100
	bpl CODE_80B37D
	cmp.w #$FFF0
	bmi CODE_80B37D
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
	bpl .t2
	lda.w $07CE
	beq .t1
	lda.w $0000,y
	ora.w $E688,x
	bra CODE_80B359

.t1:
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E680,x
	bra CODE_80B359

.t2:
	lda.w $07CE
	beq .t1x
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra CODE_80B359

.t1x:
	lda.w $0000,y
	and.w $E67C,x
CODE_80B359:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl .t1
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra CODE_80B372

.t1:
	stx.w OAMHiShift
CODE_80B372:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
CODE_80B37D:
	ldy.w $07D0
	dec.b $00
	beq .t1
	jmp.w CODE_80B286

.t1:
	plb
	rtl

.t2:		; make sure the tiles of the frame at [$0C] are in VRAM; A = its tile cache entry, negative if no room
	phx
	phy
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w CODE_80B3B1

.t1x:		; the same for frame A of the sprite set at [$10]
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
CODE_80B3B1:
	ldy.w $07BA
	beq CODE_80B3E1
	ldx.w $07C6
	beq CODE_80B3CE
	ldx.w $07C4
	lda.w $2740,x
	bmi CODE_80B3E1
	xba
	and.w #$00FF
	asl a
	tax
CODE_80B3C9:
	txa
	plb
	ply
	plx
	rtl
