; Unidentified routine.
CODE_9FF878:
	lda.w brightness
	cmp.w #$000F
	bne CODE_9FF898
	lda.b $83
	cmp.b d7
	bmi CODE_9FF898
	lda.w JoyPad
	bne .t1
	lda.b $83
	cmp.b d6
	bmi CODE_9FF898
	bra .t1

.t1:
	lda.w #$0001
	bra CODE_9FF89B
