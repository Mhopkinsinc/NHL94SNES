; Unidentified routine.
CODE_9EE89F:
	lda.w $0D2D
	bne CODE_9EE8B4
	lda.w #$0010
	clc
	adc.w $13E3,x
	jsl.l CODE_9BB385
	cmp.w #$0009
	bcs CODE_9EE8ED
CODE_9EE8B4:
	lda.w #$0006
	jsl.l CODE_9BB385
	sta.b $A5
	cpx.w #$000C
	bcc CODE_9EE8C8
	clc
	adc.w #$0006
	sta.b $A5
CODE_9EE8C8:
	lda.w position,x
	beq CODE_9EE8E7
	lda.w puckx
	cmp.w #$FFD7
	bmi CODE_9EE8E7
	cmp.w #$0029
	bpl CODE_9EE8E7
	lda.w pucky
	cmp.w #$FF33
	bmi CODE_9EE8ED
	cmp.w #$00CD
	bpl CODE_9EE8ED
CODE_9EE8E7:
	asl.b $A5
	cpx.b $A5
	bne CODE_9EE8EE
CODE_9EE8ED:
	rtl
