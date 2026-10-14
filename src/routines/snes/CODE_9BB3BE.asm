; Unidentified routine.
CODE_9BB3BE:
	phx
	lda.b $A7
	beq CODE_9BB41C
	ldx.w #$0100
	ldy.w #$1000
	cmp.w #$0048
	bcs .t2
	ldy.w #$087D
	cmp.w #$0016
	bcs .t1
	ldy.w #$04B1
	bra CODE_9BB3F0

.t1:
	ldx.w #$04B0
	bra CODE_9BB3F0

.t2:
	ldx.w #$087C
	cmp.w #$0096
	bcs .t3
	ldy.w #$0C40
	bra CODE_9BB3F0

.t3:
	ldx.w #$0C3F
CODE_9BB3F0:
	stx.b $0C
	sty.b $10
CODE_9BB3F4:
	lda.b $0C
	clc
	adc.b $10
	ror a
	cmp.b $0C
	beq .t2
	pha
	tax
	jsl.l Mul16U
	lda.b d0
	cmp.b $08
	lda.b $A7
	sbc.b $0A
	bcs .t1
	pla
	sta.b $10
	bra CODE_9BB3F4

.t1:
	pla
	sta.b $0C
	bra CODE_9BB3F4

.t2:
	plx
	sta.b d0
	rtl
