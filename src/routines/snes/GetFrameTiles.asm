; A = the first VRAM tile of the frame at [p0], loaded now if needed; negative if there is no room
GetFrameTiles:
	ldy.w FrameCacheCount
	beq .2
	ldx.w FrameByNumber
	beq .5
	ldx.w DrawFrameNum
	lda.w $2740,x
	bpl .3
.2:
	lda.b r3
	pha
	sep #$20
	lda.b #$80
	pha
	rep #$20
	lda.w #.t2-1
	pha
	phx
	phy
	phb
	jmp.w LoadFrameTiles

.t2:
	cmp.w #$0000
	bpl .t1
.1:
	pla
	sta.b r3
	lda.w #$FFFF
	sta.w FrameTilesFail
	rts

.t1:
	tax
	pla
	sta.b r3
	bra .4
.3:
	xba
	and.w #$00FF
	asl a
	tax
.4:
	lda.w CacheUseMark
	sta.w $2D40,x
	lda.w $2E40,x
	rts
.5:
	lda.b p0
	cmp.w $2540,x
	bne .1x
	lda.b p0+2
	cmp.w $2640,x
	beq .4
.1x:
	inx
	inx
	dey
	bne .5
	bra .2

.t1x:		; DrawSprite with the frame at [p0]
	sta.b r3
	stx.b r5
	sty.b r5+2
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w DrawSprite_draw
