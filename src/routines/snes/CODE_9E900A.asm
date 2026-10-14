; Unidentified routine.
CODE_9E900A:
	lda.b d2
	sec
	sbc.w #$03E8
	bpl CODE_9E9007
	lda.b d2
	sec
	sbc.w #$F000
	bpl .1
	lda.w $0F23,x
	sec
	sbc.w #$000A
	bmi .1
	lda.w $0EC3,x
	sta.b $0C
	lda.w $0EE3,x
	sta.b $0E
	lda.w #$000D
	jsl.l CODE_9C9AD0
.1:
	lda.b d2
	lsr a
	lsr a
	bit.w #$2000
	beq .2
	ora.w #$C000
.2:
	sta.b d2
	sec
	sbc.w #$FC7C
	bmi CODE_9E904D
	lda.w #$FC18
	sta.b d2
CODE_9E904D:
	lda.b $01,s
	ldx.b d3
	jsl.l CODE_808FEB
	lda.b $09
	sta.b tmp0
	lda.b $03,s
	ldx.b d2
	jsl.l CODE_808FEB
	lda.b tmp0
	sec
	sbc.b $09
	ldx.b a3
	sta.w $0EC3,x
	lda.b $03,s
	ldx.b d3
	jsl.l CODE_808FEB
	lda.b $09
	sta.b d3
	lda.b $01,s
	ldx.b d2
	jsl.l CODE_808FEB
	lda.b $09
	clc
	adc.b d3
	ldx.b a3
	sta.w $0EE3,x
	lda.w $0E01
	bmi CODE_9E9091
	stz.w $0E01
CODE_9E9091:
	pla
	pla
	pla
	sta.b d3
	pla
	sta.b d2
	cpx.w #$001C
	bne .rtl
	lda.w shotPlIdx
	bpl .rtl
	jsl.l CODE_9EC791
	stz.w $1E8B
	stz.w $1E89
.rtl:
	rtl
