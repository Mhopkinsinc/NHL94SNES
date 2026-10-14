; Unidentified routine.
CODE_80B719:		; free the VRAM tiles of the frame at [$0C]
	phx
	phy
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w .1

.t1:		; the same for frame A of the sprite set at [$10]
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
.1:
	ldy.w $07BA
	beq .2
	ldx.w $07C6
	beq .3
	ldy.w $07C4
	lda.w $2740,y
	bpl CODE_80B76C
.2:
	plb
	ply
	plx
	rtl
.3:
	lda.b $0C
	cmp.w $2540,x
	bne .1x
	lda.b $0E
	cmp.w $2640,x
	beq CODE_80B77B
.1x:
	inx
	inx
	dey
	bne .3
	bra .2
