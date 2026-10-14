; Unidentified routine.
CODE_9EE891:
	lda.w puckc
	bmi .t1
.1:
	cpx.w puckc
	beq .t1
	jmp.w CODE_9EE77E

.t1:
	rtl
