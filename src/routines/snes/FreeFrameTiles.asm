; Free the VRAM tiles of the frame at [p0]
FreeFrameTiles:
	phx
	phy
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w .1

.t1:		; the same for frame A of the sprite set at [p1]
	phx
	phy
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
	phb
	pea.w $7E7E
	plb
	plb
.1:
	ldy.w FrameCacheCount
	beq .2
	ldx.w FrameByNumber
	beq .3
	ldy.w DrawFrameNum
	lda.w $2740,y
	bpl FreeCacheEntryA
.2:
	plb
	ply
	plx
	rtl
.3:
	lda.b p0
	cmp.w $2540,x
	bne .1x
	lda.b p0+2
	cmp.w $2640,x
	beq FreeCacheEntry_go
.1x:
	inx
	inx
	dey
	bne .3
	bra .2
; FreeCacheEntry for the entry number in the high byte of A
FreeCacheEntryA:
	xba
	and.w #$00FF
	asl a
	tax
; Free tile cache entry X and its VRAM
FreeCacheEntry:
	sep #$20
	lda.b #$FF
	sta.w $2741,y
	rep #$20
; FreeCacheEntry after the slot byte is cleared; FreeFrameTiles enters here
FreeCacheEntry_go:
	lda.w $2C40,x
	sta.b r0
	dec.w FrameCacheCount
	beq .1
	stx.b r0+2
	lda.w FrameCacheCount
	asl a
	cmp.b r0+2
	beq .1
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
.1:
	ldx.b r0
	bmi .t2
	jmp.w .3

.t2:
	sep #$30
	lda.w $2F40,x
	and.b #$40
	bne .2
	lda.w $2F40,x
	and.b #$3F
	sta.b r3+2
	clc
	adc.b r0
	tay
	and.b #$07
	beq .1x
	lda.w $2F40,y
	bmi .1x
	clc
	adc.b r3+2
	sta.b r3+2
.1x:
	txa
	and.b #$07
	beq .t1
	lda.w $2FB9,x
	bmi .t1
	tay
	lda.w $2F40,y
	bmi .t1
	clc
	adc.b r3+2
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

.t1:
	lda.b r3+2
	sta.w $2F40,x
	txa
	clc
	adc.b r3+2
	tay
	txa
	sta.w $2FB9,y
	rep #$30
	plb
	ply
	plx
	rtl
.2:
	lda.w $2F40,x
	and.b #$40
	beq .t1x
	lda.b #$08
	sta.w $2F40,x
	txa
	clc
	adc.b #$08
	tax
	bra .2

.t1x:
	lda.w $2F40,x
	and.b #$3F
	sta.b r3+2
	txa
	clc
	adc.b r3+2
	tay
	and.b #$07
	beq .1xx
	lda.w $2F40,y
	bmi .1xx
	clc
	adc.b r3+2
	sta.b r3+2
.1xx:
	lda.b r3+2
	sta.w $2F40,x
	txa
	clc
	adc.b r3+2
	tay
	txa
	sta.w $2FB9,y
	rep #$30
	plb
	ply
	plx
	rtl
.3:
	sep #$30
	lda.w $3032,x
	and.b #$7F
	sta.b r3+2
	clc
	adc.b r0
	tay
	lda.w $3032,y
	bmi .1xxx
	clc
	adc.b r3+2
	sta.b r3+2
.1xxx:
	lda.w $3093,x
	bmi .t1xx
	tay
	lda.w $3032,y
	bmi .t1xx
	clc
	adc.b r3+2
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

.t1xx:
	lda.b r3+2
	sta.w $3032,x
	txa
	clc
	adc.b r3+2
	tay
	txa
	sta.w $3093,y
	rep #$30
	plb
	ply
	plx
	rtl

.t2x:
	phb
	pea.w $7E7E
	plb
	plb
	stz.b r3
	lda.w SpriteBlockTiles
.loop:
	tax
	lda.w $2F40,x
	and.w #$00FF
	beq .t1xxx
	cmp.w #$0010
	bcs .1xxxx
	clc
	adc.b r3
	sta.b r3
.1xxxx:
	and.w #$003F
	sta.b r8+2
	txa
	clc
	adc.b r8+2
	bra .loop

.t1xxx:
	plb
	lda.b r3
	rtl
