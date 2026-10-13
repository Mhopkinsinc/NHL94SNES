; Unidentified routine.
CODE_80860A:
	pha
CODE_80860B:
	lda.w $0778
	and.w #$FFF0
	bne CODE_80860B
	pla
	rtl
