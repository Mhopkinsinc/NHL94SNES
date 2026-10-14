; Unidentified routine.
CODE_9E8000:
	lda.w pfalock,x
	bne .rtl
	lda.w #$F0D2
	jsl.l SetSPAFromA
.rtl:
	rtl
