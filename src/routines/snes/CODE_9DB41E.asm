; Unidentified routine.
CODE_9DB41E:
	lda.w $0AD3
	beq .t1
	dec.w $0AD3
	jsl.l WaitFrame
	bra CODE_9DB41E

.t1:
	jsr.w CODE_9DB72F
	rtl
