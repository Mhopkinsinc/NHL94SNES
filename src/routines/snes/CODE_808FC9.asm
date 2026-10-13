; Unidentified routine.
CODE_808FC9:
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
