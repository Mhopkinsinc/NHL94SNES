; Unidentified routine.
CODE_9BC9C0:
	lda.b $B5
	clc
	adc.b $A5
	cmp.w #$0010
	bcc CODE_9BC9CD
	jmp.w CODE_9BC949
