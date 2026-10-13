; Unidentified routine.
asspuckc:
	cpx.w puckc
	bne CODE_9E829C
	lda.w $19D4,x
	bmi CODE_9E82A7
CODE_9E829C:
	jmp.w $8BE6
