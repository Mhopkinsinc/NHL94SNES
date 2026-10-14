; Unidentified routine.
CODE_9BC9C0:
	lda.b d4
	clc
	adc.b d0
	cmp.w #$0010
	bcc CODE_9BC9CD
	jmp.w CODE_9BC949
