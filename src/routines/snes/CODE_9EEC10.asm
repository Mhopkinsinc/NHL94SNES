; Unidentified routine.
CODE_9EEC10:
	lda.b d4
	lsr a
	lsr a
	sta.b d6
	lda.w #$0040
CODE_9EEC19:
	pha
	lda.b d6
	asl a
	asl a
	asl a
	asl a
	ldy.b a0
	ldx.w $0EC3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b d0
	sta.b d2
	lda.b d6
	asl a
	asl a
	asl a
	asl a
	ldx.w $0EE3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b d1
	sta.b d3
	ldy.b d2
	jsl.l CODE_9CA554
	sta.b d4
	pla
CODE_9EEC4D:
	sta.b d5
	sta.w passspeed
	ldx.b $E4
	lda.w #$0010
	sec
	sbc.w $13A3,x
	jsl.l randomd0s
	clc
	adc.b d5
	sta.b d5
	ldx.b d2
	jsl.l CODE_808FC9
	lda.b d4
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w puckvx
	lda.b d5
	ldx.b d3
	jsl.l CODE_808FC9
	lda.b d4
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w puckvy
	lda.b d2
	clc
	adc.w $0D71
	sta.w $0BA7
	lda.b d3
	clc
	adc.w pucky
	sta.w $0BA9
	lda.b d4
	asl a
	asl a
	asl a
	sta.w $0E01
	lda.w #$000A
	sta.w $121F
	ldy.b a0
	lda.b d6
	clc
	adc.w #$0006
	sta.w $0BAD,y
	ldx.b $E4
	lda.b d6
	sta.w $1203,x
	ldy.b a2
	lda.w $19D4,x
	sta.w $0B01,y
	lda.w position,x
	bne CODE_9EECF5
	lda.w $19D4,x
	bmi CODE_9EECF5
	stz.w $0EC3,x
	stz.w $0EE3,x
	lda.w $19D4,x
	sta.b d4
	lda.w $0D07
	sta.b d0
	jsl.l CODE_9FCB5C
	lda.w $19D4,x
	bmi CODE_9EECF5
	jsl.l findpc
CODE_9EECF5:
	rtl
