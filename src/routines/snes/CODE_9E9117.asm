; Unidentified routine.
CODE_9E9117:
	stz.w $14DF
	lda.w puckc
	bmi CODE_9E9148
	tay
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0008
	sta.w nopuck,y
	lda.w pucky
	sta.b $A9
	lda.w pfgoal,y
	bne CODE_9E913E
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9E913E:
	lda.b $A9
	bpl CODE_9E9148
	lda.w #$0001
	sta.w $14DF
CODE_9E9148:
	lda.w #$FF01
	sta.b $A5
	lda.w #$FF01
	sta.b $0C
	lda.w $0DD9,x
	sec
	sbc.w $0EA3,x
	sta.b $A9
	lda.w Ypos,x
	sbc.w $0E83,x
	sta.b $AB
	lda.b $AA
	sta.b $A9
	cmp.w #$0000
	beq CODE_9E91E9
	bmi CODE_9E9186
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $0C
	sta.b $0C
	lda.w #$0000
	sec
	sbc.b $B9
	sta.b $B9
CODE_9E9186:
	lda.b $B9
	clc
	adc.b $B1
	sta.b $B9
	sta.b $08
	lda.w $0D77,x
	sec
	sbc.w $0E63,x
	sta.b $B1
	lda.w Xpos,x
	sbc.w $0E43,x
	sta.b $B3
	lda.b $B2
	sta.b $B1
	ldx.b $08
	jsl.l Mul16S
	ldx.b $95
	lda.b $A9
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
	lda.b $A9
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b $B9
	ldx.b $95
	lda.b $AD
	sec
	sbc.b $B9
	sta.b $AD
	cmp.w #$FFEA
	bmi CODE_9E91E9
	lda.b $AD
	cmp.w #$0017
	bmi CODE_9E9212
CODE_9E91E9:
	jmp.w $92BE
