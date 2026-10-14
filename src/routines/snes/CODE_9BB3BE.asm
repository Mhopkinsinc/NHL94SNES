; Unidentified routine.
CODE_9BB3BE:
	phx
	lda.b $A7
	beq .3
	ldx.w #$0100
	ldy.w #$1000
	cmp.w #$0048
	bcs .t2
	ldy.w #$087D
	cmp.w #$0016
	bcs .t1
	ldy.w #$04B1
	bra .1

.t1:
	ldx.w #$04B0
	bra .1

.t2:
	ldx.w #$087C
	cmp.w #$0096
	bcs .t3
	ldy.w #$0C40
	bra .1

.t3:
	ldx.w #$0C3F
.1:
	stx.b $0C
	sty.b $10
.2:
	lda.b $0C
	clc
	adc.b $10
	ror a
	cmp.b $0C
	beq .t2x
	pha
	tax
	jsl.l Mul16U
	lda.b d0
	cmp.b $08
	lda.b $A7
	sbc.b $0A
	bcs .t1x
	pla
	sta.b $10
	bra .2

.t1x:
	pla
	sta.b $0C
	bra .2

.t2x:
	plx
	sta.b d0
	rtl
.3:
	stz.b $0C
	lda.w #$00FF
	sta.b $10
.4:
	lda.b $0C
	clc
	adc.b $10
	ror a
	cmp.b $0C
	beq .t2xx
	pha
	tax
	jsl.l Mul8U
	cmp.b d0
	bcc .t1xx
	pla
	sta.b $10
	bra .4

.t1xx:
	pla
	sta.b $0C
	bra .4

.t2xx:
	plx
	sta.b d0
	rtl
