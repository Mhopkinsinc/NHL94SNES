; Unidentified routine.
CODE_9E88F5:
	ldy.w #$0062
	lda.w pfgoal,x
	beq CODE_9E8900
	ldy.w #$FF9E
CODE_9E8900:
	sty.b d1
	bra CODE_9E88F2
	lda.w $0AD9
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
	sbc.w $0D71
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
	sbc.w $0D71
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w pucky
	sta.b d1
	jml.l vtoa
