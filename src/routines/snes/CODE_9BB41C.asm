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
	beq .t2
	pha
	tax
	jsl.l CODE_808F4C
	cmp.b d0
	bcc .t1
	pla
	sta.b $10
	bra CODE_9BB423

.t1:
	pla
	sta.b $0C
	bra CODE_9BB423

.t2:
	plx
	sta.b d0
	rtl
