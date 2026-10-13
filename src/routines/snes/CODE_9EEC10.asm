; Unidentified routine.
CODE_9EEC10:
	lda.b $B5
	lsr a
	lsr a
	sta.b $BD
	lda.w #$0040
CODE_9EEC19:
	pha
	lda.b $BD
	asl a
	asl a
	asl a
	asl a
	ldy.b $89
	ldx.w $0EC3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b $A5
	sta.b $AD
	lda.b $BD
	asl a
	asl a
	asl a
	asl a
	ldx.w $0EE3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b $A9
	sta.b $B1
	ldy.b $AD
	jsl.l CODE_9CA554
	sta.b $B5
	pla
CODE_9EEC4D:
	sta.b $B9
	sta.w passspeed
	ldx.b $E4
	lda.w #$0010
	sec
	sbc.w $13A3,x
	jsl.l CODE_9BB3A4
	clc
	adc.b $B9
	sta.b $B9
	ldx.b $AD
	jsl.l CODE_808FC9
	lda.b $B5
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w puckvx
	lda.b $B9
	ldx.b $B1
	jsl.l CODE_808FC9
	lda.b $B5
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w puckvy
	lda.b $AD
	clc
	adc.w $0D71
	sta.w $0BA7
	lda.b $B1
	clc
	adc.w pucky
	sta.w $0BA9
	lda.b $B5
	asl a
	asl a
	asl a
	sta.w $0E01
	lda.w #$000A
	sta.w $121F
	ldy.b $89
	lda.b $BD
	clc
	adc.w #$0006
	sta.w $0BAD,y
	ldx.b $E4
	lda.b $BD
	sta.w $1203,x
	ldy.b $91
	lda.w $19D4,x
	sta.w $0B01,y
	lda.w position,x
	bne CODE_9EECF5
	lda.w $19D4,x
	bmi CODE_9EECF5
	stz.w $0EC3,x
	stz.w $0EE3,x
	lda.w $19D4,x
	sta.b $B5
	lda.w $0D07
	sta.b $A5
	jsl.l CODE_9FCB5C
	lda.w $19D4,x
	bmi CODE_9EECF5
	jsl.l CODE_9FCBB6
CODE_9EECF5:
	rtl
