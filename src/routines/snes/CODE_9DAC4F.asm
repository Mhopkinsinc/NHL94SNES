; Unidentified routine.
CODE_9DAC4F:
	phx
	lda.b $C1
	sta.b $B1
CODE_9DAC54:
	lda.b $C1
	clc
	adc.b $A5
	sta.b $C1
	bpl CODE_9DAC5F
	stz.b $C1
CODE_9DAC5F:
	lda.b $C1
	cmp.w #$000E
	bcc CODE_9DAC6C
	lda.b $B1
	sta.b $C1
	bra CODE_9DAC7D
