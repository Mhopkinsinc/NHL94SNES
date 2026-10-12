; Bank $80, fourth 4 KB: sprite drawing and VRAM tiles, then three decompressors.
; There are two OAM buffers in bank $7E: the sprites are drawn into one while the NMI copies the other. SpriteFrameStart
; begins a frame, DrawSprite adds the pieces of one sprite frame to OAMDrawBuf (mirrored if asked; pieces off screen are
; skipped), and SpriteFrameEnd moves the unused entries off screen and hands the buffer to the NMI. The tiles of a frame
; go to sprite VRAM through the DMA queue the first time it is drawn, and are freed after a frame in which it is not
; drawn. Two allocators share sprite VRAM: one in blocks of four tiles (a 16x16 sprite), one in single tiles.
; The decompressors write to WRAM through WMDATA: DecompressLZ (literal runs and copies of earlier output),
; DecompressPairs (byte pair codes, expanded recursively) and DecompressHuffman (canonical Huffman codes, read through
; lookup tables built from the code lengths; its bit reader and the handlers for long codes are in the next file).

org $80B001
	sta.w OAMLastEnd
	sty.w OAMHideEnd
	ldx.w OAMDrawBuf
	ldy.w OAMShowBuf
	stx.w OAMShowBuf
	sty.w OAMDrawBuf
	sep #$20
	lda.b #$01
	sta.w OAMReady
	rep #$20
	plb
	rtl
CODE_80B01E:		; A = the first VRAM tile of the frame at [$0C], loaded now if needed; negative if there is no room
	ldy.w $07BA
	beq CODE_80B030
	ldx.w $07C6
	beq CODE_80B069
	ldx.w $07C4
	lda.w $2740,x
	bpl CODE_80B059
CODE_80B030:
	lda.b $14
	pha
	sep #$20
	lda.b #$80
	pha
	rep #$20
	lda.w #CODE_80B044-1
	pha
	phx
	phy
	phb
	jmp.w CODE_80B3E1
CODE_80B044:
	cmp.w #$0000
	bpl CODE_80B053
CODE_80B049:
	pla
	sta.b $14
	lda.w #$FFFF
	sta.w $07C0
	rts
CODE_80B053:
	tax
	pla
	sta.b $14
	bra CODE_80B05F
CODE_80B059:
	xba
	and.w #$00FF
	asl a
	tax
CODE_80B05F:
	lda.w $07C2
	sta.w $2D40,x
	lda.w $2E40,x
	rts
CODE_80B069:
	lda.b $0C
	cmp.w $2540,x
	bne CODE_80B077
	lda.b $0E
	cmp.w $2640,x
	beq CODE_80B05F
CODE_80B077:
	inx
	inx
	dey
	bne CODE_80B069
	bra CODE_80B030
CODE_80B07E:		; DrawSprite with the frame at [$0C]
	sta.b $14
	stx.b $1C
	sty.b $1E
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w CODE_80B0B0
DrawSprite:		; draw frame $00 of the sprite set at [$10] at X, Y; A is xored into the tile and attribute word
		;   of each piece, and its flip bits also mirror the piece positions
	sta.b $14
	stx.b $1C
	sty.b $1E
	phb
	pea.w $7E7E
	plb
	plb
	lda.b $00
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
CODE_80B0B0:
	jsr.w CODE_80B01E
	bmi CODE_80B0C6
	sta.b $16
	ldx.w OAMNext
	ldy.w #$0000
	lda.b [$0C],y
	and.w #$00FF
	sta.b $00
	bra CODE_80B0C8
CODE_80B0C6:
	plb
	rtl
CODE_80B0C8:
	ldy.w #$0016
	lda.b $14
	bit.w #$8000
	beq CODE_80B0D5
	jmp.w CODE_80B286
CODE_80B0D5:
	bit.w #$4000
	beq CODE_80B0DD
	jmp.w CODE_80B1A7
CODE_80B0DD:
	lda.w SpritesLeft
	beq CODE_80B0C6
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
	lda.w $07CA
	clc
	adc.b $1E
	cmp.w #$FFF0
	bmi CODE_80B113
	cmp.w #$00E0
	bmi CODE_80B116
CODE_80B113:
	jmp.w CODE_80B19B
CODE_80B116:
	sta.b $26
	lda.w $07C8
	clc
	adc.b $1C
	cmp.w #$0100
	bpl CODE_80B19B
	cmp.w #$FFF0
	bmi CODE_80B19B
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
	bpl CODE_80B161
	lda.w $07CE
	beq CODE_80B156
	lda.w $0000,y
	ora.w $E688,x
	bra CODE_80B177
CODE_80B156:
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E680,x
	bra CODE_80B177
CODE_80B161:
	lda.w $07CE
	beq CODE_80B171
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra CODE_80B177
CODE_80B171:
	lda.w $0000,y
	and.w $E67C,x
CODE_80B177:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl CODE_80B18D
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra CODE_80B190
CODE_80B18D:
	stx.w OAMHiShift
CODE_80B190:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
CODE_80B19B:
	ldy.w $07D0
	dec.b $00
	beq CODE_80B1A5
	jmp.w CODE_80B0DD
CODE_80B1A5:
	plb
	rtl
CODE_80B1A7:
	lda.w SpritesLeft
	beq CODE_80B1A5
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
	lda.w $07CA
	clc
	adc.b $1E
	cmp.w #$FFF0
	bmi CODE_80B1DD
	cmp.w #$00E0
	bmi CODE_80B1E0
CODE_80B1DD:
	jmp.w CODE_80B27A
CODE_80B1E0:
	sta.b $26
	lda.w $07CE
	beq CODE_80B1F3
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$000F
	bra CODE_80B1FD
CODE_80B1F3:
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$0007
CODE_80B1FD:
	cmp.w #$0100
	bpl CODE_80B27A
	cmp.w #$FFF0
	bmi CODE_80B27A
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
	bpl CODE_80B240
	lda.w $07CE
	beq CODE_80B235
	lda.w $0000,y
	ora.w $E688,x
	bra CODE_80B256
CODE_80B235:
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E680,x
	bra CODE_80B256
CODE_80B240:
	lda.w $07CE
	beq CODE_80B250
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra CODE_80B256
CODE_80B250:
	lda.w $0000,y
	and.w $E67C,x
CODE_80B256:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl CODE_80B26C
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra CODE_80B26F
CODE_80B26C:
	stx.w OAMHiShift
CODE_80B26F:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
CODE_80B27A:
	ldy.w $07D0
	dec.b $00
	beq CODE_80B284
	jmp.w CODE_80B1A7
CODE_80B284:
	plb
	rtl
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
	beq CODE_80B2BD
	lda.b $1E
	sec
	sbc.w $07CA
	sec
	sbc.w #$000F
	bra CODE_80B2C7
CODE_80B2BD:
	lda.b $1E
	sec
	sbc.w $07CA
	sec
	sbc.w #$0007
CODE_80B2C7:
	cmp.w #$FFF0
	bmi CODE_80B2D1
	cmp.w #$00E0
	bmi CODE_80B2D4
CODE_80B2D1:
	jmp.w CODE_80B37D
CODE_80B2D4:
	sta.b $26
	lda.b $14
	and.w #$4000
	beq CODE_80B2FA
	lda.w $07CE
	beq CODE_80B2EE
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$000F
	bra CODE_80B300
CODE_80B2EE:
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$0007
	bra CODE_80B300
CODE_80B2FA:
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
	bpl CODE_80B343
	lda.w $07CE
	beq CODE_80B338
	lda.w $0000,y
	ora.w $E688,x
	bra CODE_80B359
CODE_80B338:
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E680,x
	bra CODE_80B359
CODE_80B343:
	lda.w $07CE
	beq CODE_80B353
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra CODE_80B359
CODE_80B353:
	lda.w $0000,y
	and.w $E67C,x
CODE_80B359:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl CODE_80B36F
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra CODE_80B372
CODE_80B36F:
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
	beq CODE_80B387
	jmp.w CODE_80B286
CODE_80B387:
	plb
	rtl
CODE_80B389:		; make sure the tiles of the frame at [$0C] are in VRAM; A = its tile cache entry, negative if no room
	phx
	phy
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w CODE_80B3B1
CODE_80B394:		; the same for frame A of the sprite set at [$10]
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
CODE_80B3CE:
	lda.b $0C
	cmp.w $2540,x
	bne CODE_80B3DC
	lda.b $0E
	cmp.w $2640,x
	beq CODE_80B3C9
CODE_80B3DC:
	inx
	inx
	dey
	bne CODE_80B3CE
CODE_80B3E1:		; allocate VRAM for the frame at [$0C], queue the DMA of its tiles and add a tile cache entry
	ldy.w $07BA
	cpy.w #$0080
	beq CODE_80B44E
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
	bmi CODE_80B41D
	jmp.w CODE_80B661
CODE_80B41D:
	lda.b [$0C],y
	clc
	adc.w #$0003
	and.w #$FFFC
	lsr a
	lsr a
	sta.b $14
	cmp.w #$0009
	bcc CODE_80B432
	jmp.w CODE_80B52C
CODE_80B432:
	sep #$30
	lda.b #$00
CODE_80B436:
	tax
	lda.w $2F40,x
	beq CODE_80B44E
	cmp.b #$10
	bcs CODE_80B444
	cmp.b $14
	bcs CODE_80B457
CODE_80B444:
	and.b #$3F
	sta.b $2A
	txa
	clc
	adc.b $2A
	bra CODE_80B436
CODE_80B44E:
	rep #$30
	plb
	ply
	plx
	lda.w #$FFFF
	rtl
CODE_80B457:
	rep #$30
	stx.b $0A
	sep #$30
	lda.w $2F40,x
	sec
	sbc.b $14
	beq CODE_80B47E
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
CODE_80B47E:
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
	bne CODE_80B511
	stx.b $3C
	plb
	ply
	plx
	lda.w $07BA
	dec a
	asl a
	rtl
CODE_80B511:
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
CODE_80B52C:
	sep #$30
	lda.b #$00
CODE_80B530:
	tax
	lda.w $2F40,x
	beq CODE_80B565
	cmp.b #$08
	bne CODE_80B55B
	stx.b $0A
CODE_80B53C:
	sta.b $2A
	txa
	clc
	adc.w $2F40,x
	tax
	lda.w $2F40,x
	beq CODE_80B552
	cmp.b #$10
	bcs CODE_80B552
	clc
	adc.b $2A
	bra CODE_80B53C
CODE_80B552:
	lda.b $2A
	cmp.b $14
	bcs CODE_80B56E
	lda.w $2F40,x
CODE_80B55B:
	and.b #$3F
	sta.b $2A
	txa
	clc
	adc.b $2A
	bra CODE_80B530
CODE_80B565:
	rep #$30
	plb
	ply
	plx
	lda.w #$FFFF
	rtl
CODE_80B56E:
	ldx.b $0A
	stz.b $0B
	lda.b $14
	sta.b $16
CODE_80B576:
	lda.b $16
	sec
	sbc.w $2F40,x
	beq CODE_80B5AA
	bmi CODE_80B58E
	sta.b $16
	lda.b #$C8
	sta.w $2F40,x
	txa
	clc
	adc.b #$08
	tax
	bra CODE_80B576
CODE_80B58E:
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
	bne CODE_80B62F
	sta.b $3C
	plb
	ply
	plx
	lda.w $07BA
	dec a
	asl a
	rtl
CODE_80B62F:
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
CODE_80B661:
	lda.b [$0C],y
	sta.b $14
	sep #$30
	lda.b #$00
CODE_80B669:
	tax
	lda.w $3032,x
	beq CODE_80B67E
	bmi CODE_80B675
	cmp.b $14
	bcs CODE_80B687
CODE_80B675:
	txa
	clc
	adc.w $3032,x
	and.b #$7F
	bra CODE_80B669
CODE_80B67E:
	rep #$30
	plb
	ply
	plx
	lda.w #$FFFF
	rtl
CODE_80B687:
	rep #$30
	stx.b $0A
	sep #$30
	lda.w $3032,x
	sec
	sbc.b $14
	beq CODE_80B6AE
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
CODE_80B6AE:
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
CODE_80B719:		; free the VRAM tiles of the frame at [$0C]
	phx
	phy
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w CODE_80B741
CODE_80B724:		; the same for frame A of the sprite set at [$10]
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
CODE_80B741:
	ldy.w $07BA
	beq CODE_80B753
	ldx.w $07C6
	beq CODE_80B757
	ldy.w $07C4
	lda.w $2740,y
	bpl CODE_80B76C
CODE_80B753:
	plb
	ply
	plx
	rtl
CODE_80B757:
	lda.b $0C
	cmp.w $2540,x
	bne CODE_80B765
	lda.b $0E
	cmp.w $2640,x
	beq CODE_80B77B
CODE_80B765:
	inx
	inx
	dey
	bne CODE_80B757
	bra CODE_80B753
CODE_80B76C:
	xba
	and.w #$00FF
	asl a
	tax
CODE_80B772:		; free tile cache entry X and its VRAM
	sep #$20
	lda.b #$FF
	sta.w $2741,y
	rep #$20
CODE_80B77B:
	lda.w $2C40,x
	sta.b $00
	dec.w $07BA
	beq CODE_80B7C0
	stx.b $02
	lda.w $07BA
	asl a
	cmp.b $02
	beq CODE_80B7C0
	tay
	lda.w $2540,y
	sta.w $2540,x
	lda.w $2640,y
	sta.w $2640,x
	lda.w $2B40,y
	sta.w $2B40,x
	lda.w $2C40,y
	sta.w $2C40,x
	lda.w $2E40,y
	sta.w $2E40,x
	lda.w $2D40,y
	sta.w $2D40,x
	ldy.w $2B40,x
	txa
	lsr a
	sep #$20
	sta.w $2741,y
	rep #$20
CODE_80B7C0:
	ldx.b $00
	bmi CODE_80B7C7
	jmp.w CODE_80B863
CODE_80B7C7:
	sep #$30
	lda.w $2F40,x
	and.b #$40
	bne CODE_80B822
	lda.w $2F40,x
	and.b #$3F
	sta.b $16
	clc
	adc.b $00
	tay
	and.b #$07
	beq CODE_80B7E9
	lda.w $2F40,y
	bmi CODE_80B7E9
	clc
	adc.b $16
	sta.b $16
CODE_80B7E9:
	txa
	and.b #$07
	beq CODE_80B80E
	lda.w $2FB9,x
	bmi CODE_80B80E
	tay
	lda.w $2F40,y
	bmi CODE_80B80E
	clc
	adc.b $16
	sta.w $2F40,y
	tya
	adc.w $2F40,y
	tax
	tya
	sta.w $2FB9,x
	rep #$30
	plb
	ply
	plx
	rtl
CODE_80B80E:
	lda.b $16
	sta.w $2F40,x
	txa
	clc
	adc.b $16
	tay
	txa
	sta.w $2FB9,y
	rep #$30
	plb
	ply
	plx
	rtl
CODE_80B822:
	lda.w $2F40,x
	and.b #$40
	beq CODE_80B835
	lda.b #$08
	sta.w $2F40,x
	txa
	clc
	adc.b #$08
	tax
	bra CODE_80B822
CODE_80B835:
	lda.w $2F40,x
	and.b #$3F
	sta.b $16
	txa
	clc
	adc.b $16
	tay
	and.b #$07
	beq CODE_80B84F
	lda.w $2F40,y
	bmi CODE_80B84F
	clc
	adc.b $16
	sta.b $16
CODE_80B84F:
	lda.b $16
	sta.w $2F40,x
	txa
	clc
	adc.b $16
	tay
	txa
	sta.w $2FB9,y
	rep #$30
	plb
	ply
	plx
	rtl
CODE_80B863:
	sep #$30
	lda.w $3032,x
	and.b #$7F
	sta.b $16
	clc
	adc.b $00
	tay
	lda.w $3032,y
	bmi CODE_80B87A
	clc
	adc.b $16
	sta.b $16
CODE_80B87A:
	lda.w $3093,x
	bmi CODE_80B89A
	tay
	lda.w $3032,y
	bmi CODE_80B89A
	clc
	adc.b $16
	sta.w $3032,y
	tya
	adc.w $3032,y
	tax
	tya
	sta.w $3093,x
	rep #$30
	plb
	ply
	plx
	rtl
CODE_80B89A:
	lda.b $16
	sta.w $3032,x
	txa
	clc
	adc.b $16
	tay
	txa
	sta.w $3093,y
	rep #$30
	plb
	ply
	plx
	rtl
CODE_80B8AE:
	phb
	pea.w $7E7E
	plb
	plb
	stz.b $14
	lda.w $07B8
CODE_80B8B9:
	tax
	lda.w $2F40,x
	and.w #$00FF
	beq CODE_80B8D7
	cmp.w #$0010
	bcs CODE_80B8CC
	clc
	adc.b $14
	sta.b $14
CODE_80B8CC:
	and.w #$003F
	sta.b $2A
	txa
	clc
	adc.b $2A
	bra CODE_80B8B9
CODE_80B8D7:
	plb
	lda.b $14
	rtl
DecompressLZ:		; LZ data at [$0C] (after its header) to WRAM
	lda.b $10
	sta.b $6F
	lda.b $12
	sta.b $6D
	stz.b $71
	stz.b $73
	stz.b $75
	stz.b $77
	sep #$20
	ldy.w #$0005
CODE_80B8F0:
	lda.b [$0C],y
	iny
	sta.b $71
	and.b #$80
	beq CODE_80B8FC
	jmp.w CODE_80B957
CODE_80B8FC:
	lda.b [$0C],y
	iny
	sta.b $73
	lda.b $71
	rep #$20
	and.w #$0003
	beq CODE_80B91B
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
CODE_80B912:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80B912
CODE_80B91B:
	rep #$20
	lda.b $71
	and.w #$0060
	asl a
	asl a
	asl a
	clc
	adc.b $73
	sta.b $7B
	lda.b $6F
	clc
	sbc.b $7B
	sta.b $6B
	lda.b $71
	and.w #$001C
	lsr a
	lsr a
	clc
	adc.w #$0003
	tax
	clc
	adc.b $6F
	sta.b $6F
	sty.b $79
	ldy.w #$0000
	sep #$20
CODE_80B949:
	lda.b [$6B],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80B949
	ldy.b $79
	jmp.w CODE_80B8F0
CODE_80B957:
	lda.b $71
	and.b #$40
	beq CODE_80B960
	jmp.w CODE_80B9BF
CODE_80B960:
	lda.b [$0C],y
	iny
	sta.b $73
	lda.b [$0C],y
	iny
	sta.b $75
	rep #$20
	lda.b $73
	asl a
	asl a
	xba
	and.w #$0003
	beq CODE_80B987
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
CODE_80B97E:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80B97E
CODE_80B987:
	rep #$20
	lda.b $73
	and.w #$003F
	xba
	clc
	adc.b $75
	sta.b $7B
	lda.b $6F
	clc
	sbc.b $7B
	sta.b $6B
	lda.b $71
	and.w #$003F
	clc
	adc.w #$0004
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
	sty.b $79
	ldy.w #$0000
CODE_80B9B1:
	lda.b [$6B],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80B9B1
	ldy.b $79
	jmp.w CODE_80B8F0
CODE_80B9BF:
	lda.b $71
	and.b #$20
	beq CODE_80B9C8
	jmp.w CODE_80BA21
CODE_80B9C8:
	lda.b $71
	rep #$20
	and.w #$0003
	tax
	clc
	adc.b $6F
	sta.b $6F
	lda.b [$0C],y
	xba
	sta.b $7B
	iny
	iny
	sep #$20
	lda.b [$0C],y
	iny
	sta.b $77
	txa
	beq CODE_80B9EF
CODE_80B9E6:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80B9E6
CODE_80B9EF:
	rep #$20
	clc
	lda.b $6F
	sbc.b $7B
	sta.b $6B
	lda.b $71
	and.w #$000C
	lsr a
	lsr a
	xba
	clc
	adc.b $77
	adc.w #$0005
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
	sty.b $79
	ldy.w #$0000
CODE_80BA13:
	lda.b [$6B],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80BA13
	ldy.b $79
	jmp.w CODE_80B8F0
CODE_80BA21:
	lda.b $71
	and.b #$1F
	asl a
	asl a
	adc.b #$04
	cmp.b #$71
	bcs CODE_80BA46
	rep #$20
	and.w #$00FF
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
CODE_80BA3A:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80BA3A
	jmp.w CODE_80B8F0
CODE_80BA46:
	lda.b $71
	rep #$20
	and.w #$0003
	beq CODE_80BA60
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
CODE_80BA57:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80BA57
CODE_80BA60:
	rep #$20
	rts
DecompressPairs:	; byte pair data at Y (after its header) to WRAM
	iny
	iny
	lda.w #$0000
	ldx.w #$0040
CODE_80BA6B:
	dex
	dex
	sta.w $0100,x
	sta.w $0140,x
	sta.w $0180,x
	sta.w $01C0,x
	bne CODE_80BA6B
	sep #$20
	iny
	lda.w $0000,y
	tax
	inc.w $0100,x
	iny
	lda.w $0000,y
	sta.b $00
	beq CODE_80BAE3
CODE_80BA8D:
	iny
	lda.w $0000,y
	tax
	iny
	lda.w $0000,y
	sta.w $0500,x
	iny
	lda.w $0000,y
	sta.w $0600,x
	dec.w $0100,x
	dec.b $00
	bne CODE_80BA8D
	bra CODE_80BAE3
CODE_80BAA9:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq CODE_80BAB6
	jsr.w CODE_80BB97
CODE_80BAB6:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BB11
	jsr.w CODE_80BB97
	bra CODE_80BB11
CODE_80BAC9:
	rts
CODE_80BACA:
	bmi CODE_80BAEF
CODE_80BACC:
	iny
	lda.w $0000,y
	beq CODE_80BAC9
	sta.w WMDATA
	iny
	lda.w $0000,y
	tax
	lda.w $0100,x
	bne CODE_80BACA
CODE_80BADF:
	txa
	sta.w WMDATA
CODE_80BAE3:
	iny
	lda.w $0000,y
	tax
	lda.w $0100,x
	beq CODE_80BADF
	bpl CODE_80BACC
CODE_80BAEF:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	bmi CODE_80BB3F
CODE_80BAF9:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BADF
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	bmi CODE_80BAA9
CODE_80BB11:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BADF
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq CODE_80BB2C
	jsr.w CODE_80BB97
CODE_80BB2C:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BADF
	jsr.w CODE_80BB97
	bra CODE_80BADF
CODE_80BB3F:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	bmi CODE_80BB77
CODE_80BB49:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BAF9
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq CODE_80BB64
	jsr.w CODE_80BB97
CODE_80BB64:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BAF9
	jsr.w CODE_80BB97
	bra CODE_80BAF9
CODE_80BB77:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq CODE_80BB84
	jsr.w CODE_80BB97
CODE_80BB84:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BB49
	jsr.w CODE_80BB97
	bra CODE_80BB49
CODE_80BB97:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq CODE_80BBA4
	jsr.w CODE_80BB97
CODE_80BBA4:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	bne CODE_80BB97
	rts
DecompressHuffman:	; Huffman data at [$0C] to WRAM at [$10]
	sep #$10
	lda.b $0C
	clc
	adc.w #$0005
	sta.b $0C
	lda.b ($0C)
	sta.b $73
	inc.b $0C
	lda.b ($0C)
	inc.b $0C
	inc.b $0C
	xba
	sta.b $6C
	ldy.b #$08
	stz.b $77
	stz.b $75
	lda.w #$0010
	sta.b $14
	ldx.b #$FE
CODE_80BBD9:
	inx
	inx
	dec.b $14
	asl.b $75
	lda.b $75
	sec
	sbc.b $77
	sta.w $0720,x
	jsr.w CODE_80C1B0
	sta.w $0700,x
	clc
	adc.b $77
	sta.b $77
	lda.b $6F
	clc
	adc.b $75
	sta.b $75
	lda.b $6F
	bne CODE_80BC02
	stz.w $0740,x
	bra CODE_80BBD9
CODE_80BC02:
	lda.b $75
	sta.b $00
	lda.b $14
	clc
	beq CODE_80BC10
CODE_80BC0B:
	asl.b $00
	dec a
	bne CODE_80BC0B
CODE_80BC10:
	lda.b $00
	sta.w $0740,x
	bcc CODE_80BBD9
	txa
	lsr a
	sta.b $79
	ldx.b #$3E
CODE_80BC1D:
	stz.w $0500,x
	stz.w $0540,x
	stz.w $0580,x
	stz.w $05C0,x
	dex
	dex
	bpl CODE_80BC1D
	ldx.b #$7E
	stx.w WMADDH
	lda.w #$0100
	sta.w WMADDL
	ldx.b #$FF
CODE_80BC3A:
	jsr.w CODE_80C1B0
	sep #$20
	inc a
CODE_80BC40:
	inx
	bit.w $0500,x
	bmi CODE_80BC40
	dec a
	bne CODE_80BC40
	dec.w $0500,x
	rep #$20
	stx.w WMDATA
	dec.b $77
	bne CODE_80BC3A
	tya
	asl a
	sta.b $71
	sep #$20
	ldx.b #$00
	txy
	stz.b $7B
CODE_80BC60:
	stx.b $00
	lda.b $7B
	asl a
	tax
	cpx.b #$10
	beq CODE_80BCBF
	lda.w $0700,x
	sta.b $77
	ldx.b $7B
	lda.l DATA8_80BC7B,x
	sta.b $7D
	ldx.b $00
	bra CODE_80BCB1
DATA8_80BC7B:		; lookup table entries for a code of each length, plus 1
	db $81,$41,$21,$11,$09,$05,$03,$02
CODE_80BC83:
	lda.b $7B
	asl a
	sta.b $00
	lda.w $0100,y
	sta.b $01
	iny
	cmp.b $73
	bne CODE_80BC9B
	lda.b $7B
	inc a
	sta.b $74
	lda.b #$12
	sta.b $00
CODE_80BC9B:
	sty.b $04
	ldy.b $7D
	bra CODE_80BCAC
CODE_80BCA1:
	lda.b $01
	sta.w $0500,x
	lda.b $00
	sta.w $0600,x
	inx
CODE_80BCAC:
	dey
	bne CODE_80BCA1
	ldy.b $04
CODE_80BCB1:
	dec.b $77
	bpl CODE_80BC83
	inc.b $7B
	lda.b $79
	cmp.b $7B
	bcs CODE_80BC60
	stx.b $00
CODE_80BCBF:
	ldx.b $00
	beq CODE_80BCCB
	lda.b #$10
CODE_80BCC5:
	sta.w $0600,x
	inx
	bne CODE_80BCC5
CODE_80BCCB:
	lda.b $79
	asl a
	tax
	rep #$20
	lda.l DATA16_80BCE9-$10,x	; by the longest code length, from 9 bits up
	sta.w $0760
	ldy.b $12
	sty.w WMADDH
	lda.b $10
	sta.w WMADDL
	lda.b $6C
	ldx.b $71
	jmp (DATA16_80BCF9,x)
DATA16_80BCE9:
	dw CODE_80BFC5,CODE_80BFC8,CODE_80BFD0,CODE_80BFDD,CODE_80BFEF,CODE_80C006,CODE_80C022,CODE_80C043
DATA16_80BCF9:
	dw $0000,CODE_80BF53,CODE_80BF00,CODE_80BEAE,CODE_80BE5D,CODE_80BE0D,CODE_80BDBE,CODE_80BD70,CODE_80BD23
CODE_80BD0B:
	asl a
CODE_80BD0C:
	asl a
CODE_80BD0D:
	asl a
CODE_80BD0E:
	asl a
CODE_80BD0F:
	asl a
CODE_80BD10:
	asl a
CODE_80BD11:
	asl a
CODE_80BD12:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BD23:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BD2D,x)
DATA16_80BD2D:
	dw CODE_80BD67,CODE_80BDB4,CODE_80BE02,CODE_80BE51,CODE_80BEA1,CODE_80BEF2,CODE_80BF44,CODE_80BD0B,CODE_80BD46,CODE_80BD41
CODE_80BD41:
	ldx.b #$10
	jmp.w CODE_80C17C
CODE_80BD46:
	ldx.b #$10
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
CODE_80BD58:
	asl a
CODE_80BD59:
	asl a
CODE_80BD5A:
	asl a
CODE_80BD5B:
	asl a
CODE_80BD5C:
	asl a
CODE_80BD5D:
	asl a
CODE_80BD5E:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BD67:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BD70:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BD7A,x)
DATA16_80BD7A:
	dw CODE_80BDB5,CODE_80BE03,CODE_80BE52,CODE_80BEA2,CODE_80BEF3,CODE_80BF45,CODE_80BD0C,CODE_80BD58,CODE_80BD93,CODE_80BD8E
CODE_80BD8E:
	ldx.b #$0E
	jmp.w CODE_80C17C
CODE_80BD93:
	ldx.b #$0E
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
CODE_80BDA6:
	asl a
CODE_80BDA7:
	asl a
CODE_80BDA8:
	asl a
CODE_80BDA9:
	asl a
CODE_80BDAA:
	asl a
CODE_80BDAB:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BDB4:
	asl a
CODE_80BDB5:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BDBE:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BDC8,x)
DATA16_80BDC8:
	dw CODE_80BE04,CODE_80BE53,CODE_80BEA3,CODE_80BEF4,CODE_80BF46,CODE_80BD0D,CODE_80BD59,CODE_80BDA6,CODE_80BDE1,CODE_80BDDC
CODE_80BDDC:
	ldx.b #$0C
	jmp.w CODE_80C17C
CODE_80BDE1:
	ldx.b #$0C
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
CODE_80BDF5:
	asl a
CODE_80BDF6:
	asl a
CODE_80BDF7:
	asl a
CODE_80BDF8:
	asl a
CODE_80BDF9:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BE02:
	asl a
CODE_80BE03:
	asl a
CODE_80BE04:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BE0D:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BE17,x)
DATA16_80BE17:
	dw CODE_80BE54,CODE_80BEA4,CODE_80BEF5,CODE_80BF47,CODE_80BD0E,CODE_80BD5A,CODE_80BDA7,CODE_80BDF5,CODE_80BE30,CODE_80BE2B
CODE_80BE2B:
	ldx.b #$0A
	jmp.w CODE_80C17C
CODE_80BE30:
	ldx.b #$0A
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
CODE_80BE45:
	asl a
CODE_80BE46:
	asl a
CODE_80BE47:
	asl a
CODE_80BE48:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BE51:
	asl a
CODE_80BE52:
	asl a
CODE_80BE53:
	asl a
CODE_80BE54:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BE5D:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BE67,x)
DATA16_80BE67:
	dw CODE_80BEA5,CODE_80BEF6,CODE_80BF48,CODE_80BD0F,CODE_80BD5B,CODE_80BDA8,CODE_80BDF6,CODE_80BE45,CODE_80BE80,CODE_80BE7B
CODE_80BE7B:
	ldx.b #$08
	jmp.w CODE_80C17C
CODE_80BE80:
	ldx.b #$08
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
CODE_80BE96:
	asl a
CODE_80BE97:
	asl a
CODE_80BE98:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BEA1:
	asl a
CODE_80BEA2:
	asl a
CODE_80BEA3:
	asl a
CODE_80BEA4:
	asl a
CODE_80BEA5:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BEAE:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BEB8,x)
DATA16_80BEB8:
	dw CODE_80BEF7,CODE_80BF49,CODE_80BD10,CODE_80BD5C,CODE_80BDA9,CODE_80BDF7,CODE_80BE46,CODE_80BE96,CODE_80BED1,CODE_80BECC
CODE_80BECC:
	ldx.b #$06
	jmp.w CODE_80C17C
CODE_80BED1:
	ldx.b #$06
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
CODE_80BEE8:
	asl a
CODE_80BEE9:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BEF2:
	asl a
CODE_80BEF3:
	asl a
CODE_80BEF4:
	asl a
CODE_80BEF5:
	asl a
CODE_80BEF6:
	asl a
CODE_80BEF7:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BF00:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BF0A,x)
DATA16_80BF0A:
	dw CODE_80BF4A,CODE_80BD11,CODE_80BD5D,CODE_80BDAA,CODE_80BDF8,CODE_80BE47,CODE_80BE97,CODE_80BEE8,CODE_80BF23,CODE_80BF1E
CODE_80BF1E:
	ldx.b #$04
	jmp.w CODE_80C17C
CODE_80BF23:
	ldx.b #$04
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
CODE_80BF3B:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BF44:
	asl a
CODE_80BF45:
	asl a
CODE_80BF46:
	asl a
CODE_80BF47:
	asl a
CODE_80BF48:
	asl a
CODE_80BF49:
	asl a
CODE_80BF4A:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BF53:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BF5D,x)
DATA16_80BF5D:
	dw CODE_80BD12,CODE_80BD5E,CODE_80BDAB,CODE_80BDF9,CODE_80BE48,CODE_80BE98,CODE_80BEE9,CODE_80BF3B,CODE_80BF76,CODE_80BF71
CODE_80BF71:
	ldx.b #$02
	jmp.w CODE_80C17C
CODE_80BF76:
	ldx.b #$02
	stz.b $6A
	lda.b ($0C)
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b $6B
	sta.b $6B
	lda.b $6C
	jmp ($0760)
CODE_80BF8F:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0730
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$01
	cmp.b $73
	beq CODE_80BFC2
	jmp.w CODE_80C0E8
CODE_80BFA9:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0732
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$02
	cmp.b $73
	beq CODE_80BFC2
	jmp.w CODE_80C0E8
CODE_80BFC2:
	jmp.w CODE_80C15F
CODE_80BFC5:
	jmp.w CODE_80BF8F
CODE_80BFC8:
	cmp.w $0750
	bcc CODE_80BF8F
CODE_80BFCD:
	jmp.w CODE_80BFA9
CODE_80BFD0:
	cmp.w $0750
	bcc CODE_80BF8F
	cmp.w $0752
	bcc CODE_80BFA9
	jmp.w CODE_80C069
CODE_80BFDD:
	cmp.w $0750
	bcc CODE_80BF8F
	cmp.w $0752
	bcc CODE_80BFA9
	cmp.w $0754
	bcc CODE_80C069
	jmp.w CODE_80C080
CODE_80BFEF:
	cmp.w $0750
	bcc CODE_80BF8F
	cmp.w $0752
	bcc CODE_80BFA9
	cmp.w $0754
	bcc CODE_80C069
	cmp.w $0756
