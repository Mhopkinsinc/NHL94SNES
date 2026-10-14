; Unidentified routine.
CODE_9DAC4F:
	phx
	lda.b d7
	sta.b d3
CODE_9DAC54:
	lda.b d7
	clc
	adc.b d0
	sta.b d7
	bpl CODE_9DAC5F
	stz.b d7
CODE_9DAC5F:
	lda.b d7
	cmp.w #$000E
	bcc CODE_9DAC6C
	lda.b d3
	sta.b d7
	bra CODE_9DAC7D
