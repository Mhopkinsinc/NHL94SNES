; Unidentified routine.
CODE_9E88F5:
	ldy.w #$0062
	lda.w pfgoal,x
	beq CODE_9E8900
	ldy.w #$FF9E
CODE_9E8900:
	sty.b $A9
	bra CODE_9E88F2
	lda.w puckc
	bmi CODE_9E8967
	lda.w $0EC4,x
	sec
	sbc.w $0EE0
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E891B
	ora.w #$FF00
CODE_9E891B:
	clc
	adc.w Xpos,x
	sec
	sbc.w puckx
	cmp.w #$FFD7
	bmi CODE_9E8967
	cmp.w #$0029
	bpl CODE_9E8967
	lda.w $0EE4,x
	sec
	sbc.w $0F00
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E893F
	ora.w #$FF00
CODE_9E893F:
	clc
	adc.w Ypos,x
	sec
	sbc.w pucky
	cmp.w #$FFD7
	bmi CODE_9E8967
	cmp.w #$0029
	bpl CODE_9E8967
	lda.w Xpos,x
	sec
	sbc.w puckx
	sta.b $A5
	lda.w Ypos,x
	sec
	sbc.w pucky
	sta.b $A9
	jml.l vtoa
