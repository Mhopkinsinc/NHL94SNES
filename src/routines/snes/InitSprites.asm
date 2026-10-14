; A: SpriteVRAM, X: SpritesReserved, Y: sizes the 16x16 block area of sprite VRAM;
InitSprites:		; A: SpriteVRAM, X: SpritesReserved, Y: sizes the 16x16 block area of sprite VRAM;
		;   empties the tile allocators, then ends an empty frame
	sta.w SpriteVRAM
	phb
	pea.w $7E7E
	plb
	plb
	stx.w SpritesReserved
	tya
	cmp.w #$01C0
	bcs .1
	lda.w #$01A0
.1:
	clc
	adc.w #$001F
	and.w #$FFE0
	sta.w $07B8
	stz.w $07BA
	lsr a
	lsr a
	sep #$30
	tax
	lda.b #$00
.loop:
	sta.w $2F40,x
	txa
	sec
	sbc.b #$08
	sta.w $2FB9,x
	tax
	lda.b #$08
	cpx.b #$00
	bpl .loop
	lda.b #$FF
	sta.w $2FB9
	rep #$30
	lda.w #$0002
	sta.w $07C2
	lda.w #$0200
	sec
	sbc.w $07B8
	sep #$30
	tax
	sta.w $3032
	stz.w $3032,x
	stz.w $3093,x
	lda.b #$FF
	sta.w $3093
	rep #$30
	lda.w #$0080
	sta.w SpritesLeft
	lda.w #$2100
	sta.w OAMNext
	lda.w #$2300
	sta.w OAMHideEnd
	lda.w #$2520
	sta.w OAMLastEnd
	lda.w #$2320
	sta.w OAMShowBuf
	lda.w #$2100
	sta.w OAMDrawBuf
	jsr.w .t1
	plb
	jmp.w SpriteFrameEnd

.t1:
	ldx.w #$03D0
	lda.w #$FFFF
.loopx:
	sta.w $2740,x
	dex
	dex
	bpl .loopx
	rts
