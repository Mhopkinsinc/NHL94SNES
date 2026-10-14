; Unidentified routine.
CODE_9EE600:
	jsl.l RandomWord
	and.w #$00F0
	sta.b d0
	lda.w #$007F
	sec
	sbc.b d0
	bmi CODE_9EE616
CODE_9EE611:
	lda.w #$002D
	bra CODE_9EE619
