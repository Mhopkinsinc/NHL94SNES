; Unidentified routine.
CODE_9EE891:
	lda.w shotPlIdx
	bmi .t1
.1:
	cpx.w shotPlIdx
	beq .t1
	jmp.w CODE_9EE77E

.t1:
	rtl
