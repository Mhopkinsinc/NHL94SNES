; Unidentified routine.
CODE_9BA1A1:
	lda.w sfhormode
	bne CODE_9BA1B4
	lda.w sflags
	and.w #$0800
	bne CODE_9BA1B4
	lda.l $7E3448
	bne CODE_9BA1B5
CODE_9BA1B4:
	rtl
