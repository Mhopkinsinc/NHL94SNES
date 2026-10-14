; Unidentified routine.
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
	bmi CODE_9EA539
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
	jsl.l CODE_9C9AD0
.2:
	lda.w #SPAstop
	sta.w pf2aip,x
.3:
	jsl.l SetSPAFromA
CODE_9EA539:
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
	adc.w $12E3,x
	ldx.w $0ADB
	jsl.l CODE_808F4C
	sta.b $08
	plx
	lda.w Xvel,x
	bpl .t2
	clc
	adc.b $08
	sta.w Xvel,x
	bmi CODE_9EA589
	bra CODE_9EA586

.t2:
	sec
	sbc.b $08
	sta.w Xvel,x
	bpl CODE_9EA589
CODE_9EA586:
	stz.w Xvel,x
CODE_9EA589:
	lda.w Yvel,x
	bpl .t1
	clc
	adc.b $08
	sta.w Yvel,x
	bmi CODE_9EA5A3
	bra CODE_9EA5A0

.t1:
	sec
	sbc.b $08
	sta.w Yvel,x
	bpl CODE_9EA5A3
CODE_9EA5A0:
	stz.w Yvel,x
CODE_9EA5A3:
	rtl
