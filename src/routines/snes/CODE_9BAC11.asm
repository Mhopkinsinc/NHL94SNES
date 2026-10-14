; Unidentified routine.
CODE_9BAC11:
	lda.w $0CBF
	clc
	adc.w #$0004
	cmp.w $0DD7
	bmi CODE_9BAC20
	lda.w $0DD7
CODE_9BAC20:
	cmp.w #$FF39
	bpl CODE_9BAC28
CODE_9BAC25:
	lda.w #$FF39
CODE_9BAC28:
	cmp.w #$0100
	bmi CODE_9BAC30
CODE_9BAC2D:
	lda.w #$0100
CODE_9BAC30:
	sta.w $0D37
	sta.w $0CBF
	txa
	lsr a
	sta.w $0AF3
	jmp.w CODE_9BACCD
