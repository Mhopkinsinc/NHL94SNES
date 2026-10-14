; The player stops
dostop:
	lda.w $0EC3,x
	cmp.w #$EFFF
	bmi .1
	cmp.w #$1001
	bpl .1
	lda.w $0EE3,x
	cmp.w #$EFFF
	bmi .1
	cmp.w #$1001
	bmi CODE_9EA539
.1:
	lda.w #$EA1A
	ldy.w $1523,x
	bne .3
	cpx.w shotPlIdx
	bne .2
	lda.w $0EC3,x
	sta.b $0C
	lda.w $0EE3,x
	sta.b $0E
	lda.w #$0011
	jsl.l CODE_9C9AD0
.2:
	lda.w #$EC14
	sta.w $1543,x
.3:
	jsl.l SetSPAFromA
CODE_9EA539:
	lda.w position,x
	bne .t1
	lda.w $19D4,x
	bmi .t1
	cpx.w shotPlIdx
	beq .t1
	lda.w $0EC3,x
	cmp.w #$8000
	ror a
	sta.w $0EC3,x
	lda.w $0EE3,x
	cmp.w #$8000
	ror a
	sta.w $0EE3,x
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
	lda.w $0EC3,x
	bpl .t2
	clc
	adc.b $08
	sta.w $0EC3,x
	bmi .2
	bra .1

.t2:
	sec
	sbc.b $08
	sta.w $0EC3,x
	bpl .2
.1:
	stz.w $0EC3,x
.2:
	lda.w $0EE3,x
	bpl .t1x
	clc
	adc.b $08
	sta.w $0EE3,x
	bmi .4
	bra .3

.t1x:
	sec
	sbc.b $08
	sta.w $0EE3,x
	bpl .4
.3:
	stz.w $0EE3,x
.4:
	rtl
