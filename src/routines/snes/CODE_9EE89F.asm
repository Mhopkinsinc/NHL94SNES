; Unidentified routine.
CODE_9EE89F:
	lda.w $0D2D
	bne .1
	lda.w #$0010
	clc
	adc.w $13E3,x
	jsl.l CODE_9BB385
	cmp.w #$0009
	bcs CODE_9EE8ED
.1:
	lda.w #$0006
	jsl.l CODE_9BB385
	sta.b d0
	cpx.w #$000C
	bcc .2
	clc
	adc.w #$0006
	sta.b d0
.2:
	lda.w position,x
	beq .3
	lda.w $0D71
	cmp.w #$FFD7
	bmi .3
	cmp.w #$0029
	bpl .3
	lda.w pucky
	cmp.w #$FF33
	bmi CODE_9EE8ED
	cmp.w #$00CD
	bpl CODE_9EE8ED
.3:
	asl.b d0
	cpx.b d0
	bne CODE_9EE8EE
CODE_9EE8ED:
	rtl
