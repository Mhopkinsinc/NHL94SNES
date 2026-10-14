; Unidentified routine.
CODE_9FA37A:
	lda.w $0D31
	bmi CODE_9FA385
	ora.l $7E35D6
	bne CODE_9FA390
CODE_9FA385:
	jsl.l GetShifter
	lda.b d1
	sta.w $0D31
	bmi CODE_9FA379
CODE_9FA390:
	jmp.w NewTicker2
