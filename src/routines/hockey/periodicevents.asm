; Unidentified routine.
periodicevents:
	jsl.l CODE_9EB188
	jsl.l CODE_9B9F7A
	jsl.l CODE_9C9930
	jsl.l CODE_9FA626
	lda.w sfhormode
	bne CODE_9F8685
	lda.w lldisp
	sec
	sbc.b $C1
	sta.w lldisp
	bpl CODE_9F8685
	clc
	adc.w #$0018
	sta.w lldisp
	jsl.l CODE_9ED0A8
	jsl.l CODE_80D322
	jsl.l CODE_80D323
	jsl.l CODE_9FDDCD
	jsl.l CODE_9EC2C7
	jsl.l updatepwrplay
CODE_9F8685:
	rtl
