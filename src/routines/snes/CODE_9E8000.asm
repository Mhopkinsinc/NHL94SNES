; Unidentified routine.
CODE_9E8000:
	lda.w pfalock,x
	bne .rtl
	lda.w #SPAglideback
	jsl.l SetSPAFromA
.rtl:
	rtl
