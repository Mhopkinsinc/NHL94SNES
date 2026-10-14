; Unidentified routine.
CODE_9E9A11:
	lda.b d0
	tax
	jsl.l CODE_808F4C
	sta.b d0
	lda.b d1
	tax
	jsl.l CODE_808F4C
	clc
	adc.b d0
	sta.b d0
	lda.b d2
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	sta.b d1
	lda.w $121F
	bmi CODE_9E9A3C
	beq CODE_9E9A3C
CODE_9E9A38:
	lsr.b d1
	lsr.b d1
CODE_9E9A3C:
	lda.b d1
	cmp.b d0
	bcc CODE_9E9A46
	jsl.l CODE_9EF5DA
CODE_9E9A46:
	jmp.w CODE_9E98FB
