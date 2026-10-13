; Unidentified routine.
CODE_9DB0FD:
	lda.w #$007E
	sta.b $12
	lda.w #$3AF4
	sta.b $10
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0500
	jsl.l CODE_808EDF
	rtl
