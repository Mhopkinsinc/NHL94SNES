; Unidentified routine.
CODE_9DB41E:
	lda.w $0AD3
	beq CODE_9DB42C
	dec.w $0AD3
	jsl.l WaitFrame
	bra CODE_9DB41E
