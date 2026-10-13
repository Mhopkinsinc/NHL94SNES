; Unidentified routine.
CODE_9B8EE1:
	bit.w #$8080
	beq CODE_9B8EF4
	lda.w $1DA7
	clc
	adc.w $1DAF
	sec
	sbc.w $1D9B
	jmp.w $91A1
