; Unidentified routine.
CODE_9BB41C:
	stz.b $0C
	lda.w #$00FF
	sta.b $10
CODE_9BB423:
	lda.b $0C
	clc
	adc.b $10
	ror a
	cmp.b $0C
	beq CODE_9BB441
	pha
	tax
	jsl.l CODE_808F4C
	cmp.b d0
	bcc CODE_9BB43C
	pla
	sta.b $10
	bra CODE_9BB423
