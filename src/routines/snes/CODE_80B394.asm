; Unidentified routine.
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
