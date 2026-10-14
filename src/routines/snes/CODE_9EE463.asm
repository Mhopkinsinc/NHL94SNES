; Unidentified routine.
CODE_9EE463:
	cpx.w shotPlIdx
	bne .1
	lda.w $19D4,x
	bmi CODE_9EE47E
.1:
	jmp.w CODE_9E8BE6

.t1:
	rtl
