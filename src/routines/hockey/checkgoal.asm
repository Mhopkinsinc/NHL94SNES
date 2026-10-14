; Collision with the goal: over the top, into the net, off a post or off the side
checkgoal:
	cpx.w #$001C
	beq .t3
	jmp.w CODE_9E92F8

.t3:
	ldy.w puckc
	bmi .1
	lda.w position,y
	beq .t1
.1:
	lda.w $0DF9
	cmp.w #$000D
	bpl .t1
	ldy.b a2
	lda.b d2
	sec
	sbc.w Xpos,y
	sta.b d2
	cmp.w #$0017
	bpl .t1
	lda.b d2
	cmp.w #$FFEA
	bmi .t1
	lda.w #$0009
	sta.b d5
	lda.b d3
	sec
	sbc.w Ypos,y
	sta.b d3
	cmp.w #$000A
	bpl .t1
	lda.w #$0000
	sec
	sbc.b d5
	sta.b d5
	lda.b d3
	cmp.w #$FFF7
	bmi .t1
	lda.w #$FFFF
	sta.w $0CDB
	lda.w $0DFF
	cmp.w #$000D
	bmi .t2
	lda.w $0DFF
	sta.w $0DF9
	jmp.w CODE_9E92AE

.t1:
	rtl

.t2:
	stz.w $14DF
	lda.w puckc
	bmi .2
	tay
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0008
	sta.w $1203,y
	lda.w pucky
	sta.b d1
	lda.w pfgoal,y
	bne .1x
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.1x:
	lda.b d1
	bpl .2
	lda.w #$0001
	sta.w $14DF
.2:
	lda.w #$FF01
	sta.b d0
	lda.w #$FF01
	sta.b $0C
	lda.w $0DD9,x
	sec
	sbc.w $0EA3,x
	sta.b d1
	lda.w Ypos,x
	sbc.w $0E83,x
	sta.b $AB
	lda.b $AA
	sta.b d1
	cmp.w #$0000
	beq .6
	bmi .3
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b $0C
	sta.b $0C
	lda.w #$0000
	sec
	sbc.b d5
	sta.b d5
.3:
	lda.b d5
	clc
	adc.b d3
	sta.b d5
	sta.b $08
	lda.w $0D77,x
	sec
	sbc.w $0E63,x
	sta.b d3
	lda.w Xpos,x
	sbc.w $0E43,x
	sta.b $B3
	lda.b $B2
	sta.b d3
	ldx.b $08
	jsl.l Mul16S
	ldx.b a3
	lda.b d1
	bit.w #$8000
	beq .4
	eor.w #$FFFF
	inc a
.4:
	sta.b $04
	lda.b $0A
	bit.w #$8000
	beq .5
	eor.w #$FFFF
	inc a
.5:
	cmp.b $04
	bcs .6
	lda.b d1
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b d5
	ldx.b a3
	lda.b d2
	sec
	sbc.b d5
	sta.b d2
	cmp.w #$FFEA
	bmi .6
	lda.b d2
	cmp.w #$0017
	bmi CODE_9E9212
.6:
	jmp.w CODE_9E92BE
