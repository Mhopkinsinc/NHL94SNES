; A = the first VRAM tile of the frame at [$0C], loaded now if needed; negative if there is no room
GetFrameTiles:
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
	bra CODE_80B05F
