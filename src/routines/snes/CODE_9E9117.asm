; Unidentified routine.
CODE_9E9117:
	stz.w $14DF
	lda.w $0AD9
	bmi CODE_9E9148
	tay
	lda.w #$FFFF
	sta.w $0AD9
	lda.w #$0008
	sta.w $1203,y
	lda.w pucky
	sta.b d1
	lda.w pfgoal,y
	bne CODE_9E913E
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9E913E:
	lda.b d1
	bpl CODE_9E9148
	lda.w #$0001
	sta.w $14DF
CODE_9E9148:
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
	beq CODE_9E91E9
	bmi CODE_9E9186
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
CODE_9E9186:
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
	beq CODE_9E91B7
	eor.w #$FFFF
	inc a
CODE_9E91B7:
	sta.b $04
	lda.b $0A
	bit.w #$8000
	beq CODE_9E91C4
	eor.w #$FFFF
	inc a
CODE_9E91C4:
	cmp.b $04
	bcs CODE_9E91E9
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
	bmi CODE_9E91E9
	lda.b d2
	cmp.w #$0017
	bmi CODE_9E9212
CODE_9E91E9:
	jmp.w CODE_9E92BE
