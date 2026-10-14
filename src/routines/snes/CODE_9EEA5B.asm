; Unidentified routine.
CODE_9EEA5B:
	ldx.b a3
	lda.b d4
	bmi CODE_9EEA6F
	jsl.l CODE_9EEB2E
	lda.w #$0000
	jsl.l CODE_9C9ABC
	jmp.w CODE_9EEACC
