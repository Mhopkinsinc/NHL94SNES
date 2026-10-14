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
	jsl.l Mul16x8S
	lda.b $09
	sta.b d0
	ldx.w $0EC3,y
	lda.b d1
	jsl.l Mul16x8S
	lda.b d0
	sec
	sbc.b $09
	eor.w #$FFFF
	inc a
	sta.b d2
	ldx.w $0EC3,y
	lda.b $01,s
	jsl.l Mul16x8S
	lda.b $09
	sta.b d0
	ldx.w $0EE3,y
	lda.b d1
	jsl.l Mul16x8S
	lda.b $09
	clc
	adc.b d0
	sta.b d3
	tyx
	cpx.w #$001C
	beq .t2
	jmp.w CODE_9E900A

.t2:
	lda.w #$1000
	trb.w sflags
	lda.b d2
	bmi .t1
	jmp.w CODE_9E9091

.t1:
	lsr a
	lsr a
	bit.w #$2000
	beq .1
	ora.w #$C000
.1:
	sta.b d2
	sec
	sbc.w #$FC00
	bpl .3
	jsl.l RandomWord
	and.w #$07FF
	eor.w #$FFFF
	inc a
	sta.w $0E01
	sta.b d0
	jsl.l puckflip
	lda.w #$000A
	ldy.w $0DF9
	cpy.w #$000B
	bcs .2
	lda.w #$0004
.2:
	jsl.l CODE_9C9ABC
.3:
	lda.b d3
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq .4
	ora.w #$FC00
.4:
	sta.b d0
	pha
	asl a
	pla
	ror a
	sta.b $A7
	lda.b d3
	sec
	sbc.b d0
org $9E9000
	sec
	sbc.b $A7
	sta.b d3
	bra CODE_9E904D
