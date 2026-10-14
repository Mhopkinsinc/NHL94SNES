; Unidentified routine.
CODE_9EE463:
	cpx.w puckc
	bne .1
	lda.w $19D4,x
	bmi CODE_9EE47E
.1:
	jmp.w assexit

.t1:
	rtl
