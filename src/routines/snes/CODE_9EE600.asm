; Unidentified routine.
CODE_9EE600:
	jsl.l RandomWord
	and.w #$00F0
	sta.b $A5
	lda.w #$007F
	sec
	sbc.b $A5
	bmi CODE_9EE616
CODE_9EE611:
	lda.w #$002D
	bra CODE_9EE619
