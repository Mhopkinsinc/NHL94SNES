; Unidentified routine.
CODE_9DB430:
	lda.w $0BFF
	bit.w #$0001
	beq CODE_9DB44A
	stz.w $0BEF
	stz.w $0BF1
	jsr.w CODE_9DBD36
	jsr.w CODE_9DBB14
	lda.w #$0001
	trb.w $0BFF
CODE_9DB44A:
	rts
