; Unidentified routine.
CODE_9EE891:
	lda.w $0AD9
	bmi .t1
.1:
	cpx.w $0AD9
	beq .t1
	jmp.w CODE_9EE77E

.t1:
	rtl
