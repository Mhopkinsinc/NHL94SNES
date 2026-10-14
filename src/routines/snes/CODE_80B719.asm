; Unidentified routine.
CODE_80B719:		; free the VRAM tiles of the frame at [$0C]
	phx
	phy
	phb
	pea.w $7E7E
	plb
	plb
	jmp.w CODE_80B741

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
