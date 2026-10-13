; Unidentified routine.
CODE_9E9A11:
	lda.b $A5
	tax
	jsl.l CODE_808F4C
	sta.b $A5
	lda.b $A9
	tax
	jsl.l CODE_808F4C
	clc
	adc.b $A5
	sta.b $A5
	lda.b $AD
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	sta.b $A9
	lda.w $121F
	bmi CODE_9E9A3C
	beq CODE_9E9A3C
CODE_9E9A38:
	lsr.b $A9
	lsr.b $A9
CODE_9E9A3C:
	lda.b $A9
	cmp.b $A5
	bcc CODE_9E9A46
	jsl.l CODE_9EF5DA
CODE_9E9A46:
	jmp.w $98FB
