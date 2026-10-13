; Unidentified routine.
CODE_9B8EAA:
	lda.w $1DA7
	clc
	adc.w $1DAF
	sec
	sbc.w $1D9B
CODE_9B8EB5:
	sta.w $1D9B
	jsl.l CODE_9B8F7B
CODE_9B8EBC:
	jsl.l CODE_9DD923
	jsl.l CODE_9DD94D
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	beq CODE_9B8EE1
	lda.w #$FFFF
	jmp.w $91A1
