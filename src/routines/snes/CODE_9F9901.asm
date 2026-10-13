; Unidentified routine.
CODE_9F9901:
	lda.b $A5
	asl a
	asl a
	asl a
	adc.w #$008C
	sta.b $A5
	jsl.l PushNumber
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF817
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	rtl
