; Unidentified routine.
assfaceoff:
	lda.w pfalock,x
	bne .t4
	lda.w sflags
	bit.w #$0100
	bne .t4
	jml.l CODE_9E8BE6

.t4:
	rtl
