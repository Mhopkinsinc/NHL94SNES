; X (16 bits) * A (8 bits) into $08-$0A, X signed
Mul16x8XS:
	phy
	tay
	beq CODE_808FC3
CODE_808FCD:
	txa
	beq CODE_808FC3
	bpl CODE_808F9F
	eor.w #$FFFF
	inc a
CODE_808FD6:
	jsl.l CODE_808F95
CODE_808FDA:
	lda.w #$0000
	sec
	sbc.b $08
	sta.b $08
	lda.w #$0000
	sbc.b $0A
	sta.b $0A
	ply
	rtl
