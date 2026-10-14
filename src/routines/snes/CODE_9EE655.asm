; Unidentified routine.
CODE_9EE655:
	jsl.l RandomWord
	and.w #$00F0
	sta.b d0
	lda.w #$007F
	sec
	sbc.b d0
	bmi CODE_9EE66B
CODE_9EE666:
	lda.w #$002C
	bra CODE_9EE66E
