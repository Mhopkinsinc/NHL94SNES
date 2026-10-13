; Unidentified routine.
CODE_9E8000:
	lda.w pfalock,x
	bne CODE_9E800C
	lda.w #SPAglideback
	jsl.l CODE_9EA3F1
CODE_9E800C:
	rtl
