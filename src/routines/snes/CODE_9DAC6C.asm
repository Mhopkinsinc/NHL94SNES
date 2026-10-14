; Unidentified routine.
CODE_9DAC6C:
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.b d7
	tax
	lda.l DATA8_9DAC7F,x
	beq CODE_9DAC54
CODE_9DAC7D:
	plx
	rts
