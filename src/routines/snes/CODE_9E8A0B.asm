; Unidentified routine.
CODE_9E8A0B:
	lda.w #$FEF8
	sta.b d2
	sec
	sbc.w pucky
	bmi CODE_9E8A4F
	bra CODE_9E8A4B
