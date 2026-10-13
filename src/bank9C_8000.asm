; Bank $9C, first 4 KB: three box styles for the box drawer in bank $9D (border tiles, then a 3 x 3 map of them:
; corners, edges and the middle), an LZ-packed block, then three per-team tables of long pointers: CenterIceTable (the
; centre ice logo tiles and map), LogoPaletteTable (the logo colours) and DATA8_9C850F (16 more colours per team). Then
; screen code with auto labels for now, among it a stats screen with the column names DATA8_9C8BCE (Goalies, Goals,
; Assists, Points, Shots, Penalties).

org $9C8000
DATA8_9C8000:		; box border tiles (SNES 4bpp), drawn with the 3 x 3 map DATA8_9C8080
	incbin "../Extracted/data/DATA8_9C8000.chr"
DATA8_9C8080:		; a box map for the box drawer in bank $9D: width, height, a word, then the top, middle and
			;   bottom rows (corner, edge, corner)
	dw $0003,$0003,$0308
	dw $0000,$0001,$4000
	dw $0002,$0003,$4002
	dw $8000,$8001,$C000
DATA8_9C8098:		; box border tiles, drawn with DATA8_9C81D8
	incbin "../Extracted/data/DATA8_9C8098.chr"
DATA8_9C81D8:		; a box map, as DATA8_9C8080
	dw $0003,$0003,$0308
	dw $0001,$0002,$0003
	dw $0004,$0005,$0006
	dw $0007,$0008,$0009
DATA8_9C81F0:		; box border tiles, drawn with DATA8_9C8310
	incbin "../Extracted/data/DATA8_9C81F0.chr"
DATA8_9C8310:		; a box map, as DATA8_9C8080
	dw $0003,$0003,$0308
	dw $0001,$0002,$0003
	dw $0004,$0000,$0005
	dw $0006,$0007,$0008
DATA8_9C8328:		; packed for DecompressLZ, unpacked by a screen setup in bank $9B; not identified yet
	db $10,$FB
	db $00,$01,$00
	incbin "../Extracted/data/DATA8_9C8328.lz":5..143
CenterIceTable:		; per team: a long pointer to the centre ice logo tiles, then one to its map
	dd CenterIceTilesANA,CenterIceMapANA
	dd CenterIceTilesBOS,CenterIceMapBOS
	dd CenterIceTilesBUF,CenterIceMapBUF
	dd CenterIceTilesCGY,CenterIceMapCGY
	dd CenterIceTilesCHI,CenterIceMapCHI
	dd CenterIceTilesDAL,CenterIceMapDAL
	dd CenterIceTilesDET,CenterIceMapDET
	dd CenterIceTilesEDM,CenterIceMapEDM
	dd CenterIceTilesFLA,CenterIceMapFLA
	dd CenterIceTilesHFD,CenterIceMapHFD
	dd CenterIceTilesLAK,CenterIceMapLAK
	dd CenterIceTilesMTL,CenterIceMapMTL
	dd CenterIceTilesNJD,CenterIceMapNJD
	dd CenterIceTilesNYI,CenterIceMapNYI
	dd CenterIceTilesNYR,CenterIceMapNYR
	dd CenterIceTilesOTT,CenterIceMapOTT
	dd CenterIceTilesPHI,CenterIceMapPHI
	dd CenterIceTilesPIT,CenterIceMapPIT
	dd CenterIceTilesQUE,CenterIceMapQUE
	dd CenterIceTilesSJS,CenterIceMapSJS
	dd CenterIceTilesSTL,CenterIceMapSTL
	dd CenterIceTilesTBL,CenterIceMapTBL
	dd CenterIceTilesTOR,CenterIceMapTOR
	dd CenterIceTilesVAN,CenterIceMapVAN
	dd CenterIceTilesWSH,CenterIceMapWSH
	dd CenterIceTilesWPG,CenterIceMapWPG
	dd CenterIceTilesNHL,CenterIceMapNHL
	dd CenterIceTilesNHL,CenterIceMapNHL
LogoPaletteTable:	; per team: a long pointer to the 16 colours of its logo
	dd LogoPaletteANA,LogoPaletteBOS,LogoPaletteBUF,LogoPaletteCGY
	dd LogoPaletteCHI,LogoPaletteDAL,LogoPaletteDET,LogoPaletteEDM
	dd LogoPaletteFLA,LogoPaletteHFD,LogoPaletteLAK,LogoPaletteMTL
	dd LogoPaletteNJD,LogoPaletteNYI,LogoPaletteNYR,LogoPaletteOTT
	dd LogoPalettePHI,LogoPalettePIT,LogoPaletteQUE,LogoPaletteSJS
	dd LogoPaletteSTL,LogoPaletteTBL,LogoPaletteTOR,LogoPaletteVAN
	dd LogoPaletteWSH,LogoPaletteWPG,DATA8_9AEF1C,DATA8_9AEEFC
	dd $9AF0FC,$9AF11C
DATA8_9C850F:		; per team: a long pointer to 16 colours, loaded by code in banks $9D and $9F; not identified
			;   yet
	dd $9AF17C,$9AEF5C,$9AF19C,$9AF57C
	dd $9AF53C,$9AF4FC,$9AF55C,$9AF4DC
	dd $9AF4BC,$9AF49C,$9AF45C,$9AF43C
	dd $9AF41C,$9AF3FC,$9AF3DC,$9AF3BC
	dd $9AF39C,$9AF37C,$9AF35C,$9AF31C
	dd $9AF2DC,$9AF2BC,$9AF29C,$9AF25C
	dd $9AF21C,$9AF1FC,$9AF23C,$9AF51C
	dd $9AF1DC
CODE_9C8583:
	jsl.l CODE_9DE0E9
	lda.b $91
	pha
	ldx.b $91
	lda.w $1C98,x
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	ldx.w #$0049
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2D3
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2E1
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$000E
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D80DD
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2E6
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0001
	sta.w $1DF9
	jsl.l CODE_9C8826
	lda.w #$0007
	sta.w $1DC5
	jsl.l CODE_9C8B54
	jsl.l CODE_9C8B69
	lda.w #$0058
	ldx.w #$00C0
	ldy.w #$00D0
	jsl.l CODE_9BCDF8
	lda.w #$0018
	sta.w $1DF5
	lda.w #$0001
	sta.l $7E3478
	jsl.l CODE_9DD923
	jsl.l CODE_9C88A0
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
CODE_9C8644:
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $B1
	bit.w #$1000
	beq CODE_9C865A
	jmp.w $86F3
CODE_9C865A:
	bit.w #$0800
	beq CODE_9C8662
CODE_9C865F:
	jmp.w $874C
CODE_9C8662:
	bit.w #$0400
	beq CODE_9C866A
	jmp.w $86FE
CODE_9C866A:
	lda.b $A9
	bit.w #$0200
	beq CODE_9C8674
CODE_9C8671:
	jmp.w $8796
CODE_9C8674:
	bit.w #$0100
	beq CODE_9C867C
CODE_9C8679:
	jmp.w $87A6
CODE_9C867C:
	bit.w #$4000
	beq CODE_9C8684
CODE_9C8681:
	jmp.w $87DB
CODE_9C8684:
	lda.w $1DF9
	cmp.w #$0000
	beq CODE_9C86EC
	lda.w $1DB9
	cmp.w $1DBD
	beq CODE_9C86B5
	lda.w #$0001
	sta.w $0D0F
	lda.w $1DB9
	asl a
	sta.w $0D11
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C9363
	sta.b $8D
	jsl.l CODE_9EC894
CODE_9C86B5:
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	cmp.w $1DC1
	beq CODE_9C86E8
CODE_9C86C2:
	lda.w #$0001
	sta.w $0D0F
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	asl a
	sta.w $0D11
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9366
	sta.b $8D
	jsl.l CODE_9EC894
CODE_9C86E8:
	jsl.l CODE_9C88A0
CODE_9C86EC:
	jsl.l WaitFrame
	jmp.w $8644
CODE_9C86F3:
	lda.w #$0000
	sta.l $7E3478
	pla
	sta.b $91
	rtl
CODE_9C86FE:
	jsl.l CODE_9C8858
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	cmp.w $1DC1
	bmi CODE_9C8712
	jmp.w CODE_808684
CODE_9C8712:
	inc.w $1DC5
	jsl.l CODE_9C88A0
	dec.w $1DC5
	jsl.l WaitFrame
	inc.w $1DB9
	lda.w #$0001
	sta.w $1DF3
CODE_9C8729:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$000D
	bne CODE_9C8729
	jsl.l CODE_9C88A0
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $8644
CODE_9C874C:
	jsl.l CODE_9C8858
	lda.w $1DB9
	dec a
	cmp.w $1DBD
	bpl CODE_9C875C
	jmp.w CODE_808684
CODE_9C875C:
	sta.w $1DB9
	inc.w $1DC5
	jsl.l CODE_9C88A0
	dec.w $1DC5
	jsl.l WaitFrame
	lda.w #$000D
	sta.w $1DF3
CODE_9C8773:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne CODE_9C8773
	jsl.l CODE_9C88A0
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $8644
CODE_9C8796:
	lda.w $1DF9
	dec a
	bpl CODE_9C879F
	jmp.w CODE_808684
CODE_9C879F:
	cmp.w #$0000
	beq CODE_9C87C5
	bra CODE_9C87B7
CODE_9C87A6:
	lda.w $1DF9
	cmp.w #$0005
	bmi CODE_9C87B1
	jmp.w CODE_808684
CODE_9C87B1:
	inc a
	cmp.w #$0001
	beq CODE_9C87C5
CODE_9C87B7:
	sta.w $1DF9
	jsl.l CODE_9C8B69
	jsl.l CODE_9C88A0
	jmp.w CODE_808684
CODE_9C87C5:
	sta.w $1DF9
	jsl.l CODE_9C8826
	jsl.l CODE_9C8B54
	jsl.l CODE_9C8B69
	jsl.l CODE_9C88A0
	jmp.w CODE_808684
CODE_9C87DB:
	lda.b $91
	eor.w #$0002
	sta.b $91
	jsl.l CODE_9C8826
	jsl.l CODE_9C8B54
	jsl.l CODE_9C8B69
	jsl.l SpriteFrameStart
	ldx.b $91
	lda.w $1C98,x
	sta.l $7E3454
	ldx.w #$0049
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2FB
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jsl.l WaitFrame
	jsl.l CODE_9C88A0
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	jmp.w CODE_808684
CODE_9C8826:
	lda.w $1DF9
	cmp.w #$0000
	beq CODE_9C8842
	jsl.l CODE_9ED300
	lda.b $A5
	sta.w $1DBD
	jsl.l GetPlayerCount
	lda.b $A5
	sta.w $1DC1
	bra CODE_9C884E
CODE_9C8842:
	stz.w $1DBD
	jsl.l CODE_9ED300
	lda.b $A5
	sta.w $1DC1
CODE_9C884E:
	dec.w $1DC1
	lda.w $1DBD
	sta.w $1DB9
	rtl
CODE_9C8858:
	lda.w #$0001
	sta.w $0D0F
	lda.w $1DB9
	asl a
	sta.w $0D11
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9369
	sta.b $8D
	jsl.l CODE_9EC894
	lda.w #$0001
	sta.w $0D0F
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	asl a
	sta.w $0D11
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9369
	sta.b $8D
	jsl.l CODE_9EC894
	rtl
CODE_9C88A0:
	lda.b $A9
	pha
	lda.w $1DF9
	beq CODE_9C88DF
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF309
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DC5
	sta.b $A9
	dec.b $A9
	lda.w #$007E
	sta.b $0E
	lda.w #$39B4
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$00C0
	jsl.l CODE_80891F
	bra CODE_9C8912
CODE_9C88DF:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF32C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DC1
	sta.b $A9
	lda.w #$007E
	sta.b $0E
	lda.w #$39B4
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$04C0
	jsl.l CODE_80891F
CODE_9C8912:
	lda.w $1DB9
	xba
	lsr a
	adc.w #$2780
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	lda.b $A9
	xba
	lsr a
	adc.w #$0040
	tax
	ldy.w #$0160
	jsl.l CODE_80891F
	pla
	sta.b $A9
	rtl
CODE_9C8934:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	jsl.l CODE_808EDF
	ldy.w $1DBD
	tya
	dec a
	asl a
	sta.w $0D11
CODE_9C8957:
	inc.w $0D11
	inc.w $0D11
	sep #$20
	lda.w $1DFB,y
	rep #$20
	and.w #$00FF
	tax
	lda.w $1DF9
	beq CODE_9C8973
	jsl.l CODE_9C8980
	bra CODE_9C8977
CODE_9C8973:
	jsl.l CODE_9C8A83
CODE_9C8977:
	iny
	cpy.w $1DC1
	beq CODE_9C8957
	bcc CODE_9C8957
	rtl
CODE_9C8980:
	phy
	lda.b $A9
	pha
	lda.w #$FFFF
	jsl.l CODE_9C8D17
	lda.w #$0003
	sta.w $0D0F
	stx.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
	stx.w $1DC9
	lda.b $91
	beq CODE_9C89A5
CODE_9C89A2:
	lda.w #$001A
CODE_9C89A5:
	clc
	adc.w $1DC9
	tax
	lda.w #$0001
	jsl.l CODE_9C8D17
	lda.w #$0011
	sta.w $0D0F
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$0002
	jsl.l CODE_9C8D17
	lda.w #$0014
	sta.w $0D0F
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$0003
	jsl.l CODE_9C8D17
	lda.w #$0017
	sta.w $0D0F
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	clc
	adc.b $A5
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$0004
	jsl.l CODE_9C8D17
	lda.w #$001A
	sta.w $0D0F
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$0005
	jsl.l CODE_9C8D17
	lda.w #$001D
	sta.w $0D0F
	sep #$20
	lda.w $198A,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$FFFF
	jsl.l CODE_9C8D17
	pla
	sta.b $A9
	ply
	rtl
CODE_9C8A83:
	phy
	lda.b $A9
	pha
	lda.w #$FFFF
	jsl.l CODE_9C8D17
	lda.w #$0003
	sta.w $0D0F
	stx.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
	stx.w $1DC9
	lda.b $91
	beq CODE_9C8AA8
	lda.w #$001A
CODE_9C8AA8:
	clc
	adc.w $1DC9
	tax
	lda.w #$0012
	sta.w $0D0F
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$0016
	sta.w $0D0F
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$001B
	sta.w $0D0F
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
	beq CODE_9C8B21
	jsl.l Div16U
	lda.b $00
	sta.b $A5
	bra CODE_9C8B26
CODE_9C8B21:
	lda.w #$0064
	sta.b $A5
CODE_9C8B26:
	lda.w #$0064
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$001E
	sta.w $0D0F
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C8D2B
	sta.b $8D
	jsl.l CODE_9EC894
	pla
	sta.b $A9
	ply
	rtl
CODE_9C8B54:
	lda.w #$0000
	ldy.w #$FFFF
CODE_9C8B5A:
	iny
	sep #$20
	sta.w $1DFB,y
	rep #$20
	inc a
	cpy.w $1DC1
	bcc CODE_9C8B5A
	rtl
CODE_9C8B69:
	lda.w $1DF9
	sta.b $A5
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF34F
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C8BCE
	sta.b $8D
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
	ldx.w $1DBD
CODE_9C8B9D:
	txy
CODE_9C8B9E:
	iny
	jsl.l CODE_9C8C22
	lda.w $1DC9
	beq CODE_9C8BBE
CODE_9C8BA8:
	sep #$20
	lda.w $1DFB,y
	sta.w $1DC9
	lda.w $1DFB,x
	sta.w $1DFB,y
	lda.w $1DC9
	sta.w $1DFB,x
	rep #$20
CODE_9C8BBE:
	cpy.w $1DC1
	bcc CODE_9C8B9E
	inx
	cpx.w $1DC1
	bcc CODE_9C8B9D
	jsl.l CODE_9C8934
	rtl
DATA8_9C8BCE:		; the stat column names: a word (2 + the text), then the text
	dw $000E : db "  Goalies  ]"
	dw $000E : db "[  Goals   ]"
	dw $000E : db "[ Assists  ]"
	dw $000E : db "[  Points  ]"
	dw $000E : db "[  Shots   ]"
	dw $000E : db "[ Penalties "
CODE_9C8C22:
	phx
	phy
	lda.b $A5
	pha
	sep #$20
	lda.w $1DFB,y
	rep #$20
	and.w #$00FF
	tay
	sep #$20
	lda.w $1DFB,x
	rep #$20
	and.w #$00FF
	tax
	stx.w $1DC9
	lda.b $91
	beq CODE_9C8C47
CODE_9C8C44:
	lda.w #$001A
CODE_9C8C47:
	clc
	adc.w $1DC9
	tax
	sty.w $1DC9
	lda.b $91
	beq CODE_9C8C56
CODE_9C8C53:
	lda.w #$001A
CODE_9C8C56:
	clc
	adc.w $1DC9
	tay
	lda.w $1DF9
	cmp.w #$0001
	beq CODE_9C8C80
CODE_9C8C63:
	cmp.w #$0002
	beq CODE_9C8C91
	cmp.w #$0003
	beq CODE_9C8CA1
	cmp.w #$0004
	bne CODE_9C8C75
	jmp.w $8CE5
CODE_9C8C75:
	cmp.w #$0005
	bne CODE_9C8C7D
	jmp.w CODE_808CF5
CODE_9C8C7D:
	jmp.w $8D03
CODE_9C8C80:
	sep #$20
	lda.w $18EE,y
	cmp.w $18EE,x
	rep #$20
	beq CODE_9C8D03
CODE_9C8C8C:
	bpl CODE_9C8D0B
	jmp.w $8D03
CODE_9C8C91:
	sep #$20
	lda.w $1922,y
	cmp.w $1922,x
	rep #$20
	beq CODE_9C8D03
	bpl CODE_9C8D0B
	bra CODE_9C8D03
CODE_9C8CA1:
	sep #$20
	lda.w $18EE,y
	rep #$20
	and.w #$00FF
	sta.b $A5
	sep #$20
	lda.w $1922,y
	rep #$20
	and.w #$00FF
	clc
	adc.b $A5
	sta.b $A5
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.w $1DC9
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	clc
	adc.w $1DC9
	sta.w $1DC9
	lda.b $A5
	cmp.w $1DC9
	beq CODE_9C8D03
	bmi CODE_9C8D03
	bra CODE_9C8D0B
CODE_9C8CE5:
	sep #$20
	lda.w $1956,y
	cmp.w $1956,x
	rep #$20
	beq CODE_9C8D03
	bpl CODE_9C8D0B
	bra CODE_9C8D03
CODE_9C8CF5:
	sep #$20
	lda.w $198A,y
	cmp.w $198A,x
	rep #$20
	beq CODE_9C8D03
	bpl CODE_9C8D0B
CODE_9C8D03:
	lda.w #$0000
	sta.w $1DC9
	bra CODE_9C8D11
CODE_9C8D0B:
	lda.w #$0001
	sta.w $1DC9
CODE_9C8D11:
	pla
	sta.b $A5
	ply
	plx
	rtl
CODE_9C8D17:
	cmp.w $1DF9
	beq CODE_9C8D24
	lda.w #$2400
	sta.w $0D0D
	bra CODE_9C8D2A
CODE_9C8D24:
	lda.w #$2000
	sta.w $0D0D
CODE_9C8D2A:
	rtl
DATA8_9C8D2B:
	dw $0003 : db "%"
CODE_9C8D2E:
	lda.w $1C9A
	sta.l $7E3454
	lda.w $1C98
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	ldx.w #$0050
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF354
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF360
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1C9A
	sta.b $A9
	jsl.l CODE_9FBE08
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF365
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1C98
	sta.b $A9
	jsl.l CODE_9FBE08
	jsl.l SpriteFrameEnd
	lda.w #$FFFF
	sta.l $7F7542
	lda.w #$2BFF
	sta.l $7F7522
	jsl.l CODE_9DE0D4
	stz.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	lda.w #$0010
	sta.w $1DA3
	lda.w #$0010
	sta.w $1E15
	lda.l $7E34C4
	bne CODE_9C8DD7
CODE_9C8DCB:
	lda.w #$000B
	sta.w $1DA3
	lda.w #$0000
	sta.w $1E15
CODE_9C8DD7:
	dec.w $1DA3
	lda.w #$0060
	ldx.w #$00C8
	ldy.w #$00D8
	jsl.l CODE_9BCDF8
	lda.w #$0010
	sta.w $1DF5
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	jsr.w $8F9B
	jsl.l CODE_9DD923
	bra CODE_9C8E3A
CODE_9C8DFE:
	jsl.l WaitFrame
	jsl.l CODE_9B851F
	lda.b $B1
	bit.w #$1000
	beq CODE_9C8E10
	jmp.w $8E9B
CODE_9C8E10:
	bit.w #$0800
	beq CODE_9C8E18
CODE_9C8E15:
	jmp.w $8E9C
CODE_9C8E18:
	bit.w #$0400
	beq CODE_9C8E20
	jmp.w $8EDD
CODE_9C8E20:
	bra CODE_9C8DFE
CODE_9C8E22:
	jsl.l CODE_9B851F
	lda.b $B1
	bit.w #$1000
	bne CODE_9C8E9B
	bit.w #$0800
	bne CODE_9C8E9C
	bit.w #$0400
	beq CODE_9C8E3A
	jmp.w $8EDD
CODE_9C8E3A:
	lda.w $1DBD
	beq CODE_9C8E60
	lda.w #$0001
	sta.w $0D0F
	lda.w $1DBD
	asl a
	sta.w $0D11
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C9363
	sta.b $8D
	jsl.l CODE_9EC894
CODE_9C8E60:
	lda.w $1DBD
	clc
	adc.w $1DC5
	cmp.w $1DA3
	beq CODE_9C8E91
	lda.w #$0001
	sta.w $0D0F
	lda.w $1DBD
	clc
	adc.w $1DC5
	asl a
	sta.w $0D11
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9366
	sta.b $8D
	jsl.l CODE_9EC894
CODE_9C8E91:
	jsr.w CODE_808F7D
	jsl.l WaitFrame
	jmp.w $8DFE
CODE_9C8E9B:
	rtl
CODE_9C8E9C:
	jsr.w $8F36
	lda.w $1DBD
	dec a
	bmi CODE_9C8E3A
	sta.w $1DBD
	inc.w $1DC5
	jsr.w CODE_808F7D
	dec.w $1DC5
	jsl.l WaitFrame
	lda.w #$000D
	sta.w $1DF3
CODE_9C8EBB:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne CODE_9C8EBB
	jsr.w CODE_808F7D
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $8E22
CODE_9C8EDD:
	jsr.w $8F36
	lda.w $1DBD
	clc
	adc.w $1DC5
	cmp.w $1DA3
	bmi CODE_9C8EEF
	jmp.w $8E3A
CODE_9C8EEF:
	inc.w $1DC5
	jsr.w CODE_808F7D
	dec.w $1DC5
	jsl.l WaitFrame
	inc.w $1DBD
	lda.w #$0001
	sta.w $1DF3
CODE_9C8F05:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$000D
	bne CODE_9C8F05
	jsr.w CODE_808F7D
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $8E22
CODE_9C8F27:
	lda.w #$0000
	sta.w $1DCD
CODE_9C8F2D:
	lda.w $1DCD
	cmp.w #$FFFF
	bne CODE_9C8F2D
	rts
CODE_9C8F36:
	lda.w #$0001
	sta.w $0D0F
	lda.w $1DBD
	asl a
	sta.w $0D11
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9369
	sta.b $8D
	jsl.l CODE_9EC894
	lda.w #$0001
	sta.w $0D0F
	lda.w $1DBD
	clc
	adc.w $1DC5
	asl a
	sta.w $0D11
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9369
	sta.b $8D
	jsl.l CODE_9EC894
	rts
CODE_9C8F7D:
	lda.w $1DBD
	xba
	lsr a
	adc.w #$2780
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	lda.w $1DC5
	inc a
	xba
	lsr a
	tax
	ldy.w #$0180
	jsl.l CODE_80891F
	rts
CODE_9C8F9B:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	jsl.l CODE_808EDF
	lda.w #$0000
	sta.w $0D11
	lda.w #$0000
	sta.w $1DB9
	lda.w $1DA3
	sta.b $B5
CODE_9C8FC6:
	jsr.w $8FD7
	inc.w $0D11
	inc.w $0D11
	inc.w $1DB9
	dec.b $B5
	bpl CODE_9C8FC6
	rts
CODE_9C8FD7:
	lda.w #$2800
	sta.w $0D0D
	lda.w #$0009
	sta.w $0D0F
	lda.w $1DB9
	sta.b $A5
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C9168
	sta.b $8D
	lda.l $7E34C4
	bne CODE_9C9002
CODE_9C8FF8:
	lda.w #$009C
	sta.b $8F
	lda.w #$9258
