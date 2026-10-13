; Unidentified routine.
CODE_9CA58C:
	ldx.w #$0000
CODE_9CA58F:
	stx.b $E4
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b $A5
	bpl CODE_9CA5A0
	eor.w #$FFFF
	inc a
CODE_9CA5A0:
	pha
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	sta.w $0B3D,x
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	bpl CODE_9CA5BC
	eor.w #$FFFF
	inc a
CODE_9CA5BC:
	pha
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	clc
	adc.w $0B3D,x
	sta.w $0B3D,x
	ply
	pla
	jsl.l CODE_9CA568
	ldx.b $E4
	sta.w $0B1D,x
	jsl.l vtoa
	sta.w $0B5D,x
	inx
	inx
	cpx.w #$0020
	bne CODE_9CA58F
	rtl
