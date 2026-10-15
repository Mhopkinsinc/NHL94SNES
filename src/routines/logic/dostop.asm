; The player stops
dostop:
	lda.w Xvel,x
	cmp.w #$EFFF
	bmi .1
	cmp.w #$1001
	bpl .1
	lda.w Yvel,x
	cmp.w #$EFFF
	bmi .1
	cmp.w #$1001
	bmi StopNA
.1:
	lda.w #SPAglide
	ldy.w pfrev,x
	bne .3
	cpx.w puckc
	bne .2
	lda.w Xvel,x
	sta.b $0C
	lda.w Yvel,x
	sta.b $0E
	lda.w #$0011
	jsl.l sfx
.2:
	lda.w #SPAstop
	sta.w pf2aip,x
.3:
	jsl.l SetSPAFromA
StopNA:
	lda.w position,x
	bne .t1
	lda.w $19D4,x
	bmi .t1
	cpx.w puckc
	beq .t1
	lda.w Xvel,x
	cmp.w #$8000
	ror a
	sta.w Xvel,x
	lda.w Yvel,x
	cmp.w #$8000
	ror a
	sta.w Yvel,x
	rtl

.t1:
	phx
	lda.w #$0070
	clc
	adc.w legstr,x
	ldx.w $0ADB
	jsl.l Mul8U
	sta.b $08
	plx
	lda.w Xvel,x
	bpl .t2
	clc
	adc.b $08
	sta.w Xvel,x
	bmi .2
	bra .1

.t2:
	sec
	sbc.b $08
	sta.w Xvel,x
	bpl .2
.1:
	stz.w Xvel,x
.2:
	lda.w Yvel,x
	bpl .t1x
	clc
	adc.b $08
	sta.w Yvel,x
	bmi .4
	bra .3

.t1x:
	sec
	sbc.b $08
	sta.w Yvel,x
	bpl .4
.3:
	stz.w Yvel,x
.4:
	rtl
