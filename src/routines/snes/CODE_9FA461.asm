; Unidentified routine.
CODE_9FA461:
	lda.w $0D31
	sta.b $B1
	bmi CODE_9FA475
	dec.w $0D31
	lda.b $B1
	cmp.l $7E35D6
	beq CODE_9FA461
	bra CODE_9FA476
