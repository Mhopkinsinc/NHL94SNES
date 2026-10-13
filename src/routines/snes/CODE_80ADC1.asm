; Unidentified routine.
CODE_80ADC1:
	sep #$20
	jsr.w CODE_80A40F
CODE_80ADC6:
	sep #$20
	lda.w $07F1
	beq CODE_80ADD4
CODE_80ADCD:
	lda.w $07F8
	pha
	stz.w $07F8
CODE_80ADD4:
	lda.w $07F1
	beq CODE_80ADDD
CODE_80ADD9:
	pla
	sta.w $07F8
CODE_80ADDD:
	jsr.w CODE_80AC7B
	lda.w MusicOn
	beq CODE_80ADE8
	jsr.w CODE_80AC4A
CODE_80ADE8:
	rts
