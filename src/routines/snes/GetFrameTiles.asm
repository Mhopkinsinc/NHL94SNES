; A = the first VRAM tile of the frame at [$0C], loaded now if needed; negative if there is no room
GetFrameTiles:
	ldy.w $07BA
	beq .2
	ldx.w $07C6
	beq .5
	ldx.w $07C4
	lda.w $2740,x
	bpl .3
.2:
	lda.b $14
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
	sta.b $14
	lda.w #$FFFF
	sta.w $07C0
	rts

.t1:
	tax
	pla
	sta.b $14
	bra .4
.3:
	xba
	and.w #$00FF
	asl a
	tax
.4:
	lda.w $07C2
	sta.w $2D40,x
	lda.w $2E40,x
	rts
.5:
	lda.b $0C
	cmp.w $2540,x
	bne .1x
	lda.b $0E
	cmp.w $2640,x
	beq .4
.1x:
	inx
	inx
	dey
	bne .5
	bra .2

.t1x:		; DrawSprite with the frame at [$0C]
	sta.b $14
	stx.b $1C
	sty.b $1E
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w DrawSprite_draw
