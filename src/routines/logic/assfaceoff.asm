; Unidentified routine.
assfaceoff:
	lda.w pfalock,x
	bne CODE_9FB27B
	lda.w sflags
	bit.w #$0100
	bne CODE_9FB27B
	jml.l CODE_9E8BE6
