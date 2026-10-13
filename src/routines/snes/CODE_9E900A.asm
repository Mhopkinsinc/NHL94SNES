; Unidentified routine.
CODE_9E900A:
	lda.b $AD
	sec
	sbc.w #$03E8
	bpl CODE_9E9007
	lda.b $AD
	sec
	sbc.w #$F000
	bpl CODE_9E9034
	lda.w $0F23,x
	sec
	sbc.w #$000A
	bmi CODE_9E9034
	lda.w Xvel,x
	sta.b $0C
	lda.w Yvel,x
	sta.b $0E
	lda.w #$000D
	jsl.l CODE_9C9AD0
CODE_9E9034:
	lda.b $AD
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9E9040
	ora.w #$C000
CODE_9E9040:
	sta.b $AD
	sec
	sbc.w #$FC7C
	bmi CODE_9E904D
	lda.w #$FC18
	sta.b $AD
CODE_9E904D:
	lda.b $01,s
	ldx.b $B1
	jsl.l CODE_808FEB
	lda.b $09
	sta.b $C5
	lda.b $03,s
	ldx.b $AD
	jsl.l CODE_808FEB
	lda.b $C5
	sec
	sbc.b $09
	ldx.b $95
	sta.w Xvel,x
	lda.b $03,s
	ldx.b $B1
	jsl.l CODE_808FEB
	lda.b $09
	sta.b $B1
	lda.b $01,s
	ldx.b $AD
	jsl.l CODE_808FEB
	lda.b $09
	clc
	adc.b $B1
	ldx.b $95
	sta.w Yvel,x
	lda.w $0E01
	bmi CODE_9E9091
	stz.w $0E01
CODE_9E9091:
	pla
	pla
	pla
	sta.b $B1
	pla
	sta.b $AD
	cpx.w #$001C
	bne CODE_9E90AD
	lda.w puckc
	bpl CODE_9E90AD
	jsl.l CODE_9EC791
	stz.w $1E8B
	stz.w $1E89
CODE_9E90AD:
	rtl
