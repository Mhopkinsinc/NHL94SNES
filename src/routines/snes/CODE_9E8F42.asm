; Unidentified routine.
CODE_9E8F42:
	lda.b d0
	sta.w $1103,x
	lda.b d1
	sta.w $1123,x
	lda.b d2
	pha
	lda.b d3
	pha
	lda.b d1
	pha
	lda.b d0
	pha
	txy
	ldx.w $0EE3,y
	jsl.l CODE_808FEB
	lda.b $09
	sta.b d0
	ldx.w $0EC3,y
	lda.b d1
	jsl.l CODE_808FEB
	lda.b d0
	sec
	sbc.b $09
	eor.w #$FFFF
	inc a
	sta.b d2
	ldx.w $0EC3,y
	lda.b $01,s
	jsl.l CODE_808FEB
	lda.b $09
	sta.b d0
	ldx.w $0EE3,y
	lda.b d1
	jsl.l CODE_808FEB
	lda.b $09
	clc
	adc.b d0
	sta.b d3
	tyx
	cpx.w #$001C
	beq CODE_9E8F9E
	jmp.w CODE_9E900A
