; Unidentified routine.
CODE_9CA58C:
	ldx.w #$0000
.loop:
	stx.b $E4
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b d0
	bpl .1
	eor.w #$FFFF
	inc a
.1:
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
	sta.b d1
	bpl .2
	eor.w #$FFFF
	inc a
.2:
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
	bne .loop
	rtl
