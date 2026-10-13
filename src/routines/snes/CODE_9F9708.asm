; Unidentified routine.
CODE_9F9708:
	jsl.l WaitFrame
	lda.w $0AD3
	bne CODE_9F9708
	rtl
