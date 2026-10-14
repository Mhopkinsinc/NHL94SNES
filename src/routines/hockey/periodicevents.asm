; Run every game loop; the slower checks once a second
periodicevents:
	jsl.l PenaltyManager
	jsl.l CODE_9B9F7A
	jsl.l CODE_9C9930
	jsl.l clockcont
	lda.w sfhormode
	bne CODE_9F8685
	lda.w $0CF7
	sec
	sbc.b d7
	sta.w $0CF7
	bpl CODE_9F8685
	clc
	adc.w #$0018
	sta.w $0CF7
	jsl.l CODE_9ED0A8
	jsl.l CODE_80D322
	jsl.l CODE_80D323
	jsl.l RestoreBenchEnergy
	jsl.l CODE_9EC2C7
	jsl.l updatepwrplay
CODE_9F8685:
	rtl
